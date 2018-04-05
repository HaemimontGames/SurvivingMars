--[[
local transport_threshold = 3
local LRDepotClasses = { "StorageDepotConcrete", "StorageDepotMetals", "StorageDepotPolymers", "StorageDepotFood" } -- exclude waste rock
GlobalGameTimeThread("LRWarehouseTransport", function()
	while 1 do
		Sleep(10000)
		for _, class in ipairs(LRDepotClasses) do
			local depots = UICity.labels[class] or empty_table
			for _, resource in ipairs(AllResourcesList) do
				local dest = 1 -- index of a warehouse without the resource
				local amount = Resources[resource].unit_amount
				for src = 1, #depots do
					local request = depots[src].supply[resource]
					while request and dest <= #depots and request:GetTargetAmount() > transport_threshold * amount do
						local dest_request = depots[dest].supply[resource]
						if dest_request:GetTargetAmount() < amount then
							depots[src]:AddDepotResource(resource, -amount)
							depots[dest]:AddDepotResource(resource, amount)
						end
						dest = dest + 1
					end
				end
			end
		end
	end
end)
]]

------------------------------------------------------------------------------------------------------------------
local dbg_prints = false
GlobalObj("LRManagerInstance", "LRManager")
GlobalVar("StorableResources", false)
GlobalVar("StorableResourcesForSession", false)
local rfSupply       = const.rfSupply
local rfDemand       = const.rfDemand
local rfStorageDepot       = const.rfStorageDepot
local rfSpecialDemandPairing       = const.rfSpecialDemandPairing
local rfSupplyDemand = rfSupply + rfDemand

local minimum_resource_amount_treshold = const.TransportMinResAmountTreshold
local dist_threshold = const.TransportDistThreshold


--1 cube == 10 * guim
local function t_to_prio(t)
	local as_dist = t / 10 --1s ~ 1guim
	return as_dist
end

local function d_to_prio(d)
	return d * -1
end

function BuildStorableResourcesArray()
	--deduce the kind of resources storage depots can store
	assert(LRManagerInstance == false) --changing them tables during the lifetime of this obj will lead to unpredictable behaviors
	StorableResources = {}
	local descendants = ClassDescendantsList("StorageDepot")
	local template_depots = table.ifilter(DataInstances.BuildingTemplate, function(i, o)			
			local c = ClassTemplates.Building[o.name]
			if c and IsKindOf(c, "StorageDepot") and not c.exclude_from_lr_transportation then 
				return o 
			end
		end)
	for _, t in ipairs(template_depots) do
		table.insert(descendants, t.name)
	end
	local resources = {}
	for i = 1, #descendants do
		local class_def = DataInstances.BuildingTemplate[descendants[i]] or g_Classes[descendants[i]]
		if not class_def.exclude_from_lr_transportation then
			if class_def:HasMember("storable_resources") then --shared storage
				for i = 1, #(class_def.storable_resources or empty_table) do
					resources[class_def.storable_resources[i]] = true
				end
			else
				for _, resource_name in ipairs(AllResourcesList) do
					local max_name = "max_amount_"..resource_name
					if class_def:HasMember(max_name) then --single resource storages
						resources[resource_name] = true
					end
				end
			end
		end
	end
	
	local transportable_resources = CargoShuttle.storable_resources
	for r_f, _ in pairs(resources) do
		if table.find(transportable_resources, r_f) then
			table.insert(StorableResources, r_f)
		end
	end
	
	table.sort(StorableResources, function(a, b) return a < b end)
	StorableResourcesForSession = table.copy(StorableResources)
	if dbg_prints then
		print("resource storage tbl built:")
		for i = 1, #StorableResources do
			print(StorableResources[i])
		end
	end
end

DefineClass.ColonistTransportTask = {
	__parents = { "InitDone" },
	
	state = "new", --new, almost_ready_for_pickup, ready_for_pickup, transporting, done
	source_dome = false,
	dest_dome = false,
	colonist = false,
	shuttle = false,
	source_landing_site = false, --{pos, landing id, spot id}
	dest_pos = false, -- safe pos to place the colonist in case of errors
}

function ColonistTransportTask:CanExecute()
	return not self.shuttle
		and IsValid(self.colonist) and self.colonist:CanChangeCommand()-- not diying and not leaving
		and (self.state == "ready_for_pickup" or self.state == "almost_ready_for_pickup")
		and self.source_dome:IsLandingSpotFree(self.source_landing_site[2])
		and self.dest_dome.has_free_landing_slots
end

function ColonistTransportTask:Cleanup()
	LRManagerInstance:RemoveColonistTransportRequest(self)
	if self.shuttle and self.shuttle.transport_task == self then
		Wakeup(self.shuttle.command_thread)
	end
	self.colonist.transport_task = false
	DoneObject(self)
end

function CreateColonistTransportTask(colo, source_dome, dest_dome)
	assert(colo.transport_task == false)
	local ref_pos = colo:IsValidPos() and colo:GetPos() or colo.holder and colo.holder:GetPos()
	if ref_pos == InvalidPos() then
		return --cant create transport req, we don't know where colo is
	end
	local landing_pos, landing_idx = source_dome:GetNearestLandingSpot(ref_pos)
	if not landing_pos then
		assert(false, "No landing spot found!")
		return
	end
	local req = ColonistTransportTask:new{
		colonist = colo,
		source_dome = source_dome,
		dest_dome = dest_dome,
		source_landing_site = table.pack(landing_pos, landing_idx),
	}
	colo.transport_task = req
	LRManagerInstance:AddColonistTransportRequest(req)
	return req
end


DefineClass.LRManager = {
	__parents = { "InitDone" },
	
	city = false,
	
	supply_queues = false,
	demand_queues = false,
	
	registered_storages = false,
	colonist_transport_tasks = false, --{[n] = ColonistTransportRequest}
	
	last_task_type = "resource", --so tasks can alternate between resources and colonists
	req_hystory = false,
}

function LRManager:Init()
	self.supply_queues = {}
	self.demand_queues = {}
	self.colonist_transport_tasks = {}
	self.req_hystory = {}
	self.registered_storages = {}
	
	BuildStorableResourcesArray()
	
	for i = 1, #StorableResources do
		local resource = StorableResources[i]
		self.supply_queues[resource] = {}
		self.demand_queues[resource] = {}
	end
end

function LRManager:AddColonistTransportRequest(req)
	table.insert(self.colonist_transport_tasks, req)
end

function LRManager:RemoveColonistTransportRequest(req)
	table.remove_entry(self.colonist_transport_tasks, req)
end

function LRManager:AddBuilding(building)	
	if self.registered_storages[building] then return end

	local supply_queues = self.supply_queues
	local demand_queues = self.demand_queues
	
	for _, request in ipairs(building.task_requests or empty_table) do
		if request:IsAnyFlagSet(rfSupplyDemand) then
			local queue = request:IsAnyFlagSet(rfSupply) and supply_queues or demand_queues
			local request_resource = request:GetResource()
			if table.find(StorableResources, request_resource) then
				queue[request_resource][#queue[request_resource] + 1] = request
			end
		end
	end
	
	table.insert(self.registered_storages, building)
	self.registered_storages[building] = true
end

function LRManager:RemoveBuilding(building)
	if not self.registered_storages[building] then return end
	
	local task_requests = building.task_requests or empty_table
	local s_requests = self.supply_queues
	local d_requests = self.demand_queues
	for _, request in ipairs(task_requests) do
		local resource = request:GetResource()
		if request:IsAnyFlagSet(rfSupply) then
			table.remove_entry(s_requests[resource], request)
		else
			table.remove_entry(d_requests[resource], request)
		end
	end	
	
	assert(table.remove_entry(self.registered_storages, building))
	self.registered_storages[building] = nil
end

if FirstLoad then
	PathLenId = false
	PathLenCache = false
	PathLenHits = 0
end

function OnMsg.ChangeMap()
	PathLenId = false
	PathLenCache = false
	PathLenHits = 0
end

function PathLenCacheValid()
	if PathLenId then
		PathLenId = terrain.GetPassId()
	end
end

function PathLenCached(pt1, pfclass, pt2)
	if lessthan(pt1, pt2) then
		pt1, pt2 = pt2, pt1
	end
	local dist
	local key = xxhash(pt1, pt2, pfclass)
	local pass_id = terrain.GetPassId()
	if PathLenId ~= pass_id then
		--print("pass_id", pass_id, "hits", PathLenHits, "misses", table.count(PathLenCache or empty_table))
		PathLenId = pass_id
		PathLenCache = {}
		PathLenHits = 0
	else
		dist = PathLenCache[key]
	end
	if dist == nil then
		local has_path, len = pf.PathLen(pt1, pfclass, pt2)
		dist = has_path and len or false
		PathLenCache[key] = dist
	else
		PathLenHits = PathLenHits + 1
	end
	return not not dist, dist or 0
end

local function CalcDemandPrio(req, bld, requestor)
	local d = bld:GetDist2D(requestor)
	--time since serviced, dist (closer is better), if any resource set to import + 100000 + needed amount
	return t_to_prio(now() - req:GetLastServiced()) + req:GetTargetAmount() + d_to_prio(d)
end

local function CalcSupplyPrio(s_req, s_bld, d_req, d_bld, requestor, demand_score)
	local d = s_bld:GetDist2D(d_bld)
	local d2 = s_bld:GetDist2D(requestor)
	return s_req:GetTargetAmount() + d_to_prio(d) + d_to_prio(d2) + demand_score
end

local function CheckMinDist(bld1, bld2)
	if bld1:IsCloser2D(bld2, dist_threshold) then
		local did_reach, len = pf.PathLen(bld1:GetPos(), 0, bld2:GetPos()) --cant cache :(
		return not did_reach or len > dist_threshold 
	end
	return true
end

local hystory_time = 3*const.HourDuration
function LRManager:FindTransportTask(requestor, demand_only, force_resource)
	local colonist_task
	local colonist_tasks = self.colonist_transport_tasks or ""
	if not demand_only and not force_resource then
		for i = 1,#colonist_tasks do
			if colonist_tasks[i]:CanExecute() then
				colonist_task = colonist_tasks[i]
				if self.last_task_type == "resource" then
					self.last_task_type = "colonist"
					return colonist_task
				end
				break
			end
		end
	end
	
	local resources = force_resource and { force_resource } or StorableResourcesForSession
	local demand_queues = self.demand_queues
	local supply_queues = self.supply_queues
	
	--[[
	local res_prio, res_s_req, res_d_req, res_resource = min_int, false, false, false
	for k = 1, #resources do
		local resource = resources[k]
		local d_queue = demand_queues[resource]
		local s_queue = supply_queues[resource] or empty_table
		for i = 1, #d_queue do
			local d_req = d_queue[i]
			if d_req:CanAssignUnit() then
				local d_bld = d_req:GetBuilding()
				if d_bld.has_free_landing_slots and ShouldIncludeAutoDemandRequest(d_req, resource) then
					local d_prio = CalcDemandPrio(d_req, d_bld, requestor)
					if not demand_only then
						for j = 1, #s_queue do
							local s_req = s_queue[j]
							local s_bld = s_req:GetBuilding()
							if s_bld ~= d_bld
							and s_req:GetTargetAmount() > minimum_resource_amount_treshold
							and s_bld.has_free_landing_slots
							and CheckMinDist(s_bld, d_bld)
							then
								local s_prio = CalcSupplyPrio(s_req, s_bld, d_req, d_bld, requestor, d_prio)
								if res_prio < s_prio then
									res_prio, res_s_req, res_d_req, res_resource = s_prio, s_req, d_req, resource
								end
							end
						end
					elseif res_prio < d_prio then
						res_prio, res_d_req, res_resource = d_prio, d_req, resource
					end
				end
			end
		end
	end
	--]]
	
	local res_s_req, res_d_req, res_prio, res_resource, req_count = Request_FindShuttleTask(requestor, resources, self.demand_queues, self.supply_queues, demand_only)
	
	local hystory = self.req_hystory or {}
	self.req_hystory = hystory
	local last_entry = hystory[#hystory]
	local time = GameTime()
	local count = req_count + #colonist_tasks
	local next_idx = last_entry and last_entry:x() == time and #hystory or #hystory+1
	hystory[next_idx] = point(time, count)
	while #hystory > 10 and time - hystory[1]:x() >= hystory_time do
		table.remove(hystory, 1)
	end
	
	local best_task = res_prio and {res_prio, res_s_req, res_d_req, res_resource}
	if demand_only then
		return best_task
	elseif best_task then
		self.last_task_type = "resource"
		return best_task
	elseif colonist_task then
		self.last_task_type = "colonist"
		return colonist_task
	end
end

function LRManager:EstimateTaskCount()
	local hystory = self.req_hystory or empty_table
	local time_now = GameTime()
	local avg_tasks, total_weight = 0, 0
	for i=#hystory,1,-1 do
		local time, tasks = hystory[i]:xy()
		local weight = hystory_time - (time_now - time)
		if weight <= 0 then
			break
		end
		avg_tasks = avg_tasks + tasks * weight
		total_weight = total_weight + weight
	end
	return total_weight > 0 and avg_tasks / total_weight
end