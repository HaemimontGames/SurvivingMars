local rfWork         = const.rfWork
local rfSupply       = const.rfSupply
local rfWaitToFill   = const.rfWaitToFill
local rfDemand       = const.rfDemand
local rfCanExecuteAlone = const.rfCanExecuteAlone
local rfSupplyDemand = rfSupply + rfDemand
local rfDemandOrWork = rfDemand + rfWork
local rfPostInQueueFlags = rfDemand + rfWork + rfCanExecuteAlone + const.rfPostInQueue
local rfStorageDepot    = const.rfStorageDepot
local rfConstruction = const.rfConstruction
local rfPairWithHigher = const.rfPairWithHigher
local rfSpecialDemandPairing = const.rfSpecialDemandPairing
local rfSpecialSupplyPairing = const.rfSpecialSupplyPairing
local MaxBuildingPriority     = const.MaxBuildingPriority
local TaskPriorityBoost       = const.TaskPriorityBoost
local table_insert = table.insert
local table_remove = table.remove
local remove_entry = table.remove_entry
local IsFlagSet    = IsFlagSet
local rfRestrictorRocket = const.rfRestrictorRocket

DefineClass.DroneControl = {
	__parents = { "SyncObject" }, --or object?
	properties = {
		{template = true,id = "starting_drones",  name = T{642, "Starting Drones"},editor = "number", default = 4, modifiable = true},
		-- make sure UIWorkRadius and work_radius share the same default value
		{id = "UIWorkRadius", name = T{643, "Range"}, editor = "number", default = const.CommandCenterDefaultRadius, min=const.CommandCenterMinRadius, max=const.CommandCenterMaxRadius, no_edit = true, dont_save = true,}, -- prop only for UI purposes
		{id = "work_radius", editor = "number", default = const.CommandCenterDefaultRadius, no_edit = true, },
	},

	building_update_time = const.HourDuration,
	distance_to_provoke_go_home_cmd = 50*guim,
	
	working = false,
	drones = false,
	constructions = false,
	under_construction = false,
	update_constructions_thread = false,
	surface_deposits = false,
	priority_queue = false,
	supply_queues = false,
	demand_queues = false,
	
	are_requesters_connected = false,
	auto_connect_requesters_at_start = false,
	accept_requester_connects = false,
	
	connected_task_requesters = false, --all connected task requesters, so we can disconnect gracefully to requesters outside of our work range.
	no_requests_time = 0,
	
	serviced_rockets = false,
	restrictor_update_thread = false,
	restrictor_tables = false,  --[rfRestritcorFlag] = {[resource] = request,..}
	
	deficit_table = false, --sums up total deficits so shuttles know what to deliver
	deficit_thread = false,

	lap_start = 0,
	lap_time = 0,
	
	unreachable_buildings = false,
}

function DroneControl:UpdateDeficits()
	local t = self.deficit_thread
	if IsValidThread(t) then
		Wakeup(t)
	else
		self.deficit_thread = CreateGameTimeThread(function(self)
			while IsValid(self) do
				self:UpdateDeficitsInternal()
				WaitWakeup()
			end
		end, self)
	end
end

function DroneControl:UpdateDeficitsInternal()
	local t = {}
	self.deficit_table = t
	
	local s = self.supply_queues
	local d = self.demand_queues
	local storables = StorableResources
	
	for j = MaxBuildingPriority, -1, -1 do
		local ps = s[j]
		local pd = d[j]
		
		for _, resource in ipairs(storables) do
			local total = 0
			local reqs = pd[resource]
			for i = 1, #(reqs or "") do
				if not reqs[i]:IsAnyFlagSet(const.rfSpecialDemandPairing) then --special dmnd can only be accomodate by special supply so no need to count toward deficit
					if not reqs[i]:IsAnyFlagSet(const.rfStorageDepot) then
						total = total + reqs[i]:GetTargetAmount()
					else
						--handle storage demands
						local d = reqs[i]:GetActualAmount() - reqs[i]:GetTargetAmount() --incoming amount of d
						if d > 0 then
							total = total - d
						end
					end
				end
			end
			
			reqs = ps[resource]
			for i = 1, #(reqs or "") do
				total = total - reqs[i]:GetTargetAmount()
			end
			
			t[resource] = (t[resource] or 0) + total
		end
	end
end

function DroneControl:InitRocketRestrictors()
	self.serviced_rockets = {}
	self.restrictor_tables = self.restrictor_tables or {}
	self.restrictor_tables[rfRestrictorRocket] = {}
end

function DroneControl:Init()
	self.drones = {}
	self.constructions = {}
	self.connected_task_requesters = {}
	self.under_construction = {}
	
	self:InitRocketRestrictors()
	
	--  priority queue lists requests per priority
	self.priority_queue = {}
	--  queues are per priority per resource (priorities include 0 for StorageDepot)
	self.supply_queues = {}
	self.demand_queues = {}
	for priority = -1, MaxBuildingPriority do
		self.priority_queue[priority] = {}
		self.supply_queues[priority] = {}
		self.demand_queues[priority] = {}
	end
end

function DroneControl:GameInit()
	self.lap_start = GameTime() --so first lap is not == GameTime() - 0
	self.city:AddToLabel("DroneControl", self)

	--delay until GameInit is completed
	--we need this so any descendant in a label can modify the number
	self:Notify("SpawnDrones")
	if self.auto_connect_requesters_at_start then
		self:Notify("ConnectTaskRequesters")
	end
end

function DroneControl:SpawnDrones()
	for i = 1, self.starting_drones do
		self:SpawnDrone()
	end
end

function DroneControl:GatherOrphanedDrones()
	if not self.working then return end
	
	while self:CanHaveMoreDrones() do
		local drone, _, idx = g_OrphanedDrones:FindClosest(self)
		if not drone then return end
		
		table.remove(g_OrphanedDrones, idx)
		drone:SetCommandCenter(self)
		if self == SelectedObj then
			SelectionArrowAdd(drone)
		end
	end
end

function DroneControl:Finalize()
	if self.are_requesters_connected then
		self:DisconnectTaskRequesters()
	end
	
	for i = #self.drones, 1, -1 do
		local drone = self.drones[i]
		if drone:GetParent() == self then
			drone:Detach()
			drone:SetCommand("Idle") --attached drone in embark
		end
		drone:SetCommandCenter(false)
		SelectionArrowRemove(drone)
	end
	DeleteThread(self.update_constructions_thread)
end

function DroneControl:Done()
	self:Finalize()
end

function DroneControl:OnDestroyed()
	self:Finalize()
end

function DroneControl:BuildingUpdate(delta, day, hour)
	assert(not self.working or self.are_requesters_connected or delta == 0) --deposits may retain us as cc, if not first tick
	self:UpdateConstructions()
	self:UpdateRockets()
	self:UpdateDeficits()
end

--[[local function SetConstructionSiteSign(building, add, sign)
	if building.command_centers and #building.command_centers == 0 then
		if IsKindOf(building, "ConstructionSite") then
			building:AttachSign(add, sign)
		elseif building:HasMember("parent_construction") and type(building.parent_construction) == "table" and #building.parent_construction > 0 then
			for k,v in ipairs(building.parent_construction) do
				v:AttachSign(add, sign)
			end
		end
	end
end]]

local resource_requester_search = {
	class = "TaskRequester",
	exec = function (building, center)
		--SetConstructionSiteSign(building, false, "SignNoPower")
		if building.auto_connect and not GameInitThreads[building] then
			building:AddCommandCenter(center)
		end
	end,
}

function DroneControl:ConnectTaskRequesters()
	if self.are_requesters_connected then return end
	resource_requester_search.area = self
	resource_requester_search.hexradius = self.work_radius
	ForEach(resource_requester_search, self)
	resource_requester_search.area = false
	self.are_requesters_connected = true
end

function DroneControl:DisconnectTaskRequesters()
	while #self.connected_task_requesters > 0 do
		local bld = self.connected_task_requesters[#self.connected_task_requesters]
		if bld then
			bld:RemoveCommandCenter(self)
			--SetConstructionSiteSign(bld, true, "SignNoPower")
		end
	end
	self.are_requesters_connected = false
end

----- Constructions
function DroneControl:UpdateConstructions()
	local thread = self.update_constructions_thread
	if thread then
		Wakeup(thread)
	else
		self.update_constructions_thread = CreateGameTimeThread(function(self)
			while IsValid(self) do
				self:UpdateConstructionsInternal()
				WaitWakeup()
			end
		end, self)
	end
end

function DroneControl:UpdateConstructionsInternal()
	local supply_queues = self.supply_queues
	local under_construction = {}
	self.under_construction = under_construction
	for _, construction in ipairs(self.constructions) do
		local construction_found
		for resource, request in pairs(construction.construction_resources) do
			if request:GetTargetAmount() > 0 and not under_construction[resource] then
				under_construction[resource] = request
				if not construction_found then
					-- check if the construction resource is available
					-- if so do not consider lower priority construction sites until all resources are brought to this one
					for j = -1, MaxBuildingPriority do
						local supply_requests = supply_queues[j][resource] or empty_table
						for k = 1,#supply_requests do
							if supply_requests[k]:GetTargetAmount() > (band(supply_requests[k]:GetFlags(), const.rfWaitToFill) == const.rfWaitToFill and const.ResourceScale - 1 or 0) then
								construction_found = true
								break
							end
						end
						if construction_found then
							break
						end
					end
				end
			end
		end
		if construction_found then
			return
		end
	end
end

function DroneControl:AddConstruction(construction)
	local priority = construction.priority
	local counter = construction.counter
	local constructions = self.constructions
	local i = #constructions + 1
	while i > 1 and (constructions[i - 1].priority < priority or constructions[i - 1].priority == priority and constructions[i - 1].counter > counter) do
		i = i - 1
	end
	table_insert(constructions, i, construction)
	self:UpdateConstructions()
end

function DroneControl:RemoveConstruction(construction)
	local idx = remove_entry(self.constructions, construction)
	assert(idx)
	self:UpdateConstructions()
end

---------------------------------------------------------------------------
---------------------------------------------------------------------------
function DroneControl:UpdateRockets()
	local t = self.restrictor_update_thread
	if IsValidThread(t) then
		Wakeup(t)
	else
		self.restrictor_update_thread = CreateGameTimeThread(function(self, context)
			while IsValid(self) do
				self:UpdateRocketsInternal() --rfRestrictorRocket
				WaitWakeup()
			end
		end, self)
	end
end

function DroneControl:UpdateRocketsInternal()
	local r_t = {}
	self.restrictor_tables[rfRestrictorRocket] = r_t
	
	for i = 1, #(self.serviced_rockets or "") do
		local r = self.serviced_rockets[i]
		local rr = r.refuel_request
		if rr:GetTargetAmount() > 0 then
			r_t["Fuel"] = rr
			break
		end
	end
end

function DroneControl:AddRocket(rocket)
	local r_i = table.find(g_LandedRocketsInNeedOfFuel, rocket)
	local r_p = rocket.priority
	local rockets = self.serviced_rockets
	local i = #rockets + 1
	while i > 1 and (rockets[i - 1].priority < r_p 
			or rockets[i - 1].priority == r_p and table.find(g_LandedRocketsInNeedOfFuel, rockets[i - 1]) > r_i) do
		i = i - 1
	end
	table.insert(rockets, i, rocket)
	self:UpdateRockets()
end

function DroneControl:RemoveRocket(rocket)
	table.remove_entry(self.serviced_rockets, rocket)
	self:UpdateRockets()
end
---------------------------------------------------------------------------
---------------------------------------------------------------------------

function DroneControl:SpawnDrone()
	--override me.
end

function DroneControl:KillDrone(drone)
	local idx = remove_entry(self.drones, drone)
	assert(idx)
	DoneObject(drone)
end

function DroneControl:GetMaxDrones()
	return 0
end

function DroneControl:CanHaveMoreDrones()
	return #self.drones < self:GetMaxDrones()
end

----- TaskRequests
function DroneControl:AddBuilding(building)
	local supply_queues = self.supply_queues
	local demand_queues = self.demand_queues
	local priority_queue = self.priority_queue
	for _, request in ipairs(building.task_requests or empty_table) do
		assert(building == request:GetBuilding())
		local resource = request:GetResource()
		local priority = building:GetPriorityForRequest(request)
		if request:IsAnyFlagSet(rfSupplyDemand) then
			local queue = request:IsAnyFlagSet(rfSupply) and supply_queues[priority] or demand_queues[priority]
			local rqueue = queue[resource]
			if rqueue then
				rqueue[#rqueue + 1] = request
			else
				queue[resource] = { request }
			end
		end
		if request:IsAnyFlagSet(rfPostInQueueFlags) then
			local p_queue = priority_queue[priority]
			p_queue[#p_queue + 1] = request
		end
	end
	table.insert(self.connected_task_requesters, building)
	building:OnAddedByControl(self)
	self:UpdateDeficits()
end

function DroneControl:OnRemoveBuilding(building)
	for _, drone in ipairs(self.drones) do
		if BuildingFromGotoTarget(drone.goto_target) == building then
			drone:SetCommand("Idle")
		end
	end
end

function DroneControl:RemoveBuilding(building)
	self:OnRemoveBuilding(building)
	
	local task_requests = building.task_requests or empty_table
	for priority = -1, MaxBuildingPriority do
		local s_requests = self.supply_queues[priority]
		local d_requests = self.demand_queues[priority]
		local priority_queue = self.priority_queue[priority]
		for _, request in ipairs(task_requests) do
			local resource = request:GetResource()
			remove_entry(s_requests[resource] or empty_table, request)
			remove_entry(d_requests[resource] or empty_table, request)
			remove_entry(priority_queue, request)
		end
	end
	
	table.remove_entry(self.connected_task_requesters, building)
	building:OnRemovedByControl(self)
	self:UpdateDeficits()
end

local Request_FindDemand_C = Request_FindDemand
--[[
function Request_FindDemand_Lua(demand_queues, under_construction, restrictor_t, resource, amount, min_priority, ignore_flags, required_flags, requestor_prio, exclude_building)
	requestor_prio = requestor_prio or MaxBuildingPriority + 1
	required_flags = required_flags or 0
	ignore_flags = ignore_flags or 0
	min_priority = min_priority or -1
	
	for j = MaxBuildingPriority, (min_priority or -1), -1 do
		local requests = demand_queues[j][resource]
		if requests then
			local index = requests.index or 1
			for _ = 1, #requests do
				if index > #requests then index = 1 end
				local request = requests[index]
				index = index + 1
				local r_amount, flags = request:GetTargetAmount(), request:GetFlags()
				if r_amount>0 and request:GetFreeUnitSlots() > 0 and exclude_building ~= request:GetBuilding()
					and r_amount >= amount
 					and (not IsFlagSet(flags, rfConstruction) or under_construction[resource] == request)
					and (not IsFlagSet(flags, rfRestrictorRocket) or (restrictor_t[rfRestrictorRocket] and restrictor_t[rfRestrictorRocket][resource] == request))
					and (not IsFlagSet(flags, rfPairWithHigher) or requestor_prio > j)
					and band(required_flags, flags) == required_flags
					and band(ignore_flags, flags) == 0
				then
					--requests.index = index
					return request, Min(r_amount, amount)
				end
			end
			--requests.index = index
		end
	end
end
local function Request_FindDemand(demand_queues, under_construction, restrictor_t, resource, amount, ...)
	local r1, a1 = Request_FindDemand_Lua(demand_queues, under_construction, restrictor_t, resource, amount, ...)
	local r2, a2 = Request_FindDemand_C(demand_queues, under_construction, restrictor_t, resource, amount, ...)
	assert(r1 == r2)
	return r2, a2
end
--]]

function DroneControl:FindDemandRequest(drone, resource, amount, min_priority, ignore_flags, required_flags, requestor_prio, exclude_building)
	min_priority = min_priority or -1
	requestor_prio = requestor_prio or MaxBuildingPriority + 1
	required_flags = required_flags or 0
	ignore_flags = ignore_flags or 0
	assert(self.under_construction)
	return Request_FindDemand_C(self.demand_queues, self.under_construction or empty_table, self.restrictor_tables or empty_table, resource, amount,
		min_priority, ignore_flags, required_flags, requestor_prio, exclude_building, drone.unreachable_buildings)
end

local Request_FindSupply_C = Request_FindSupply
--[[
local dist_thres = 20*guim -- add this much dist to compensate for very short distances
function Request_FindSupply_Lua(supply_queues, requester, resource, amount, min_priority, ignore_flags, required_flags, threshold_amount, exclude_building)
	local best_dist
	local best_request
	
	for j = MaxBuildingPriority, (min_priority or -1), -1 do
		for _, request in ipairs(supply_queues[j][resource] or empty_table) do
			local r_amount, flags, building = request:GetTargetAmount(), request:GetFlags(), request:GetBuilding()
			if r_amount > 0 and request:GetFreeUnitSlots() > 0 and exclude_building ~= building
				and (not IsFlagSet(flags, rfWaitToFill) or r_amount >= amount)
				and (not IsFlagSet(flags, rfStorageDepot) or r_amount > threshold_amount)
				and band(required_flags, flags) == required_flags
				and band(ignore_flags, flags) == 0
			then
				local dist = MulDivRound(Max(dist_thres, requester:GetDist2D(building)), building.supply_dist_modifier, 1000)
				if not best_dist or dist < best_dist then
					best_dist = dist
					best_request = request
				end
			end
		end
		if best_request then
			return best_request, Min(best_request:GetTargetAmount(), amount)
		end
	end
end
local function Request_FindSupply(supply_queues, requester, resource, amount, ...)
	local r1, a1 = Request_FindSupply_Lua(supply_queues, requester, resource, amount, ...)
	local r2, a2 = Request_FindSupply_C(supply_queues, requester, resource, amount, ...)
	assert(r1 == r2 or r1:GetBuilding():GetDist2D(requester) == r2:GetBuilding():GetDist2D(requester))
	return r2, a2
end
--]]

function DroneControl:FindSupplyRequest(requester, resource, amount, min_priority, ignore_flags, required_flags, threshold_amount, exclude_building)
	min_priority = min_priority or -1
	required_flags = required_flags or 0
	ignore_flags = ignore_flags or 0
	threshold_amount = threshold_amount or 0
	return Request_FindSupply_C(self.supply_queues, requester, resource, amount, min_priority, ignore_flags, required_flags, threshold_amount, exclude_building)
end

local Request_FindDroneTask_C = Request_FindDroneTask
--[[
local StoragePropagationThreshold = const.StoragePropagationThreshold
local function Request_FindDroneTask_Lua(self, dbg_request, dbg_pair_request)
	local under_construction = self.under_construction
	local restrictor_t = self.restrictor_tables or empty_table
	local priority_queue = self.priority_queue
	local supply_queues = self.supply_queues
	local demand_queues = self.demand_queues
	for j = MaxBuildingPriority, -1, -1 do
		local requests = priority_queue[j]
		local index = requests.index or 1
		for _ = 1, #requests do
			if index > #requests then index = 1 end
			local request = requests[index]
			index = index + 1
			local building, resource, amount, flags = request:GetBuilding(), request:GetResource(), request:GetTargetAmount(), request:GetFlags()
			if amount > 0 and request:GetFreeUnitSlots() > 0 then
				-- max assigned drones not reached
				if (not IsFlagSet(flags, rfConstruction) or under_construction[resource] == request)
					and (not IsFlagSet(flags, rfRestrictorRocket) or (restrictor_t[rfRestrictorRocket] and restrictor_t[rfRestrictorRocket][resource] == request)) then
					local drone_amount = DroneResourceUnits[resource]
					if IsFlagSet(flags, rfWork) then -- work request
						--requests.index = index
						return request, nil, resource, Min(amount, drone_amount)
					elseif IsFlagSet(flags, rfSupply) and (not IsFlagSet(flags, rfWaitToFill) or amount >= drone_amount) or IsFlagSet(flags, rfDemand) then -- supply or demand request
						amount = Min(amount, drone_amount)
						
						local lookup_min_prio = IsFlagSet(flags, rfPairWithHigher) and (not IsFlagSet(flags, rfStorageDepot) and building.priority + 1 or 1) or -1
						
						local pair_request, r_amount
						if IsFlagSet(flags, rfSupply) then
							local ignore_flags = band(flags, rfSpecialSupplyPairing + rfStorageDepot) + (band(flags, rfSpecialDemandPairing) == 0 and rfSpecialDemandPairing or 0)
							local required_flags = 0
							local requestor_prio = j
							pair_request, r_amount = Request_FindDemand(
								demand_queues, under_construction,
								resource, amount, lookup_min_prio,
								ignore_flags, required_flags, requestor_prio, building)
						else
							local threshold_amount = 0
							if IsFlagSet(flags, rfStorageDepot) then
								threshold_amount = building.min_threshold_amount
								if threshold_amount < max_int then
									local s_request = building.supply[resource]
									local d_request = building.demand[resource]
									local assigned = s_request:GetTargetAmount() + (d_request:GetActualAmount() - d_request:GetTargetAmount())
									local threshold = drone_amount * StoragePropagationThreshold
									threshold_amount = Max(threshold_amount, assigned < threshold and assigned + drone_amount or max_int)
								end
							end
							local ignore_flags = band(flags, rfSpecialSupplyPairing)
							local required_flags = band(flags, rfSpecialDemandPairing)
							pair_request, r_amount = Request_FindSupply(
								supply_queues, building,
								resource, amount, lookup_min_prio,
								ignore_flags, required_flags, threshold_amount, building)
						end
						
						if pair_request or IsFlagSet(flags, rfCanExecuteAlone) then
							--requests.index = index
							if IsFlagSet(flags, rfSupply) then
								return request, pair_request, resource, r_amount or amount
							else
								return pair_request, request, resource, r_amount or amount
							end
						end
					end
				end
			end
		end
		--requests.index = index
	end
end
local function Request_FindDroneTask(self)
	local request1, pair_request1, resource1, amount1 = Request_FindDroneTask_Lua(self)
	local request2, pair_request2, resource2, amount2 = Request_FindDroneTask_C(self)
	assert(request1 == request2 and pair_request1 == pair_request2 and resource1 == resource2 and amount1 == amount2)
	return request2, pair_request2, resource2, amount2
end
--]]

function DroneControl:FindTask(drone)
	self.unreachable_buildings = drone and drone.unreachable_buildings
	return Request_FindDroneTask_C(self)
end

-- radius
function DroneControl:SetWorkRadius(radius)
	if radius == self.work_radius then return end
	local is_new_greater = radius > self.work_radius
	self.work_radius = radius
	if self == SelectedObj then
		PlayFX("Select", "end", self)
		PlayFX("Select", "start", self)
		--play sound
		PlayFX("RangeChange", "end", self)
		DelayedCall(100, PlayFX, "RangeChange", "start", self)
	end
	DelayedCall(300, self.ReconnectTaskRequesters, self, is_new_greater)
end

function DroneControl:ReconnectTaskRequesters(gather_drones)
	self:DisconnectTaskRequesters()
	if gather_drones then --otherwise it should already be gathered.
		self:GatherOrphanedDrones()
	end
	self:ConnectTaskRequesters()
end

function DroneControl:SetUIWorkRadius(value)
	self.UIWorkRadius = value
	self:SetWorkRadius(value)

	local rxs = self:GetAttaches("RangeHexMultiSelectRadius") or empty_table
	for i = 1, #rxs do
		rxs[i]:SetScale(self.work_radius)
	end
end

function DroneControl:GetSelectionRadiusScale()
	return self.work_radius
end

function DroneControl:OnSelected()
	local drones = table.ifilter(self.drones, function(idx, drone)
		return IsValid(drone) and drone.command ~= "Embark" and drone:GetState() ~= GetStateIdx("roverEnter")
	end)
	SelectionArrowAdd(drones)
end

function DroneControl:AbandonAllDrones()
	for i = #self.drones, 1, -1 do
		local drone = self.drones[i]
		drone:SetCommandCenter(false)
		if not drone:IsDisabled() then
			drone:SetCommand("WaitingCommand")
		end
		SelectionArrowRemove(drone)
	end
end

DefineClass.DroneHub = {
	__parents = { "Building", "TaskRequester", "DroneControl", "ElectricityConsumer" },
	
	building_update_time = 5000,
	work_radius = const.CommandCenterDefaultRadius,
	
	charging_stations = false,
	auto_connect_requesters_at_start = true,
	accept_requester_connects = true,
	
	play_working_anim_on_this_attach = "DroneHubAntenna",
	
	total_requested_drones = 0,
}

function DroneHub:Init()
	self.charging_stations = {}
end

function DroneHub:GameInit()
	local station_template = ClassTemplates.Building.RechargeStation
	local platforms = self:GetAttaches("RechargeStationPlatform")
	local p_p = BuildingPalettes["RechargeStation"]
	p_p = p_p and p_p[1] or false
	for _, platform in ipairs(platforms or empty_table) do
		platform:SetEnumFlags(const.efSelectable) --so we can select the command center through the recharge station
	
		local spot_obj = PlaceObject("NotBuildingRechargeStation")
		spot_obj:ChangeEntity("RechargeStation")
		
		self:Attach(spot_obj, platform:GetAttachSpot())

		spot_obj:SetAttachOffset(platform:GetAttachOffset())
		spot_obj:SetAttachAngle(platform:GetAttachAngle())
		spot_obj.platform = platform
		spot_obj.hub = self
		self.charging_stations[#self.charging_stations+1] = spot_obj
		if p_p then
			Building.SetPalette(platform, p_p)
		end
	end
	
	local c = self:GetAttaches("CableHardLeft")
	local c_p = EntityPalettes.Cables
	for i = 1, #(c or "") do
		c_p:ApplyToObj(c[i])
	end
	
	
	self:GatherOrphanedDrones()
end

function DroneHub:Done()
	for _, station in ipairs(self.charging_stations) do
		DoneObject(station)
	end
end

function DroneHub:OnSetWorking(working)
	if working then
		self:GatherOrphanedDrones()
		
		for _, drone in ipairs(self.drones) do
			if drone.command == "WaitingCommand" then
				drone:SetCommand("Idle")
			end
		end
	end
	ElectricityConsumer.OnSetWorking(self, working)
	for _, station in ipairs(self.charging_stations) do
		if IsValid(station) then
			station.working = working
			if IsKindOf(station, "NotBuildingRechargeStation") then
				PlayFX("Working", working and "start" or "end", station, station.platform)
			end
			if working then
				station:StartAoePulse()
				station:NotifyDronesOnRechargeStationFree()
			end
		end
	end
	
	for i = 1, #(self.connected_task_requesters or "") do
		local bld = self.connected_task_requesters[i]
		if bld:HasMember("OnCommandCenterWorkingChanged") then
			bld:OnCommandCenterWorkingChanged(self)
		end
	end
end

function DroneHub:GetMaxDrones()
	return g_Consts.CommandCenterMaxDrones
end

function DroneHub:CanHaveMoreDrones()
	return #self.drones < g_Consts.CommandCenterMaxDrones
end

function DroneHub:SpawnDrone()
	if #self.drones >= g_Consts.CommandCenterMaxDrones then
		return false
	end
	local drone = Drone:new{ city = self.city }
	drone:SetHolder(self)
	drone:SetCommandCenter(self)
	self:UpdateUI()
	return true
end

function DroneHub:GetSelectionRadiusScale()
	if not IsValid(self) and CityConstruction[UICity].template_obj == self then
		--self == ClassTemplates.Building.DroneHub
		return const.CommandCenterMaxRadius
	else
		return self.work_radius
	end
end

function DroneHub:UseDronePrefab()
	if self.city and self.city.drone_prefabs > 0 then
		if self:SpawnDrone() then
			self.city.drone_prefabs = self.city.drone_prefabs - 1
		end
	end
end

function DroneHub:FindDroneToConvertToPrefab()
	if #self.drones <= 0 then return false end
	
	local idles = {}
	local all = {}
	for i = 1, #self.drones do
		local d = self.drones[i]
		if not d:IsDisabled() then
			table.insert(all, d)
			if d.command == "Idle" then
				table.insert(idles, d)
			end
		end
	end
	
	if #idles > 0 then
		return FindNearestObject(idles, self:GetPos())
	elseif #all > 0 then
		return FindNearestObject(all, self:GetPos())
	end
end

function DroneHub:ConvertDroneToPrefab()
	local drone = self:FindDroneToConvertToPrefab()
	if drone then
		if drone.demolishing then
			drone:ToggleDemolish()
		end
		drone.can_demolish = false
		UICity.drone_prefabs = UICity.drone_prefabs + 1
		table.remove_entry(self.drones, drone)
		drone:SetCommand("DespawnAtHub")
	end
end

function DroneHub:ShowUISectionConsumption()
	if self.city:IsTechResearched("AutonomousHubs") then
		return false
	end	
	return Building.ShowUISectionConsumption(self)
end

function OnMsg.GatherFXActors(list)
	list[#list + 1] = "DroneHub"
end

--------------- interface
--drones count
function DroneControl:GetDronesCount()          return #self.drones end
function DroneControl:GetMaxDronesCount()          return g_Consts.CommandCenterMaxDrones end
function DroneControl:GetMiningDronesCount()    return table.array_count(self.drones, "resource", "mine") end
function DroneControl:GetTransportDronesCount() return table.array_count(self.drones, "command", "PickUp") + table.array_count(self.drones, "command", "Deliver") + table.array_count(self.drones, "command", "Work") end
function DroneControl:GetBrokenDronesCount()    return table.array_count(self.drones, "command", "Malfunction") end

function DroneControl:GetIdleDronesCount()
	local count = 0
	for i=1, #self.drones do
		local cmd =  self.drones[i].command
		if cmd == "Idle" or cmd == "WaitCommand" then
			count = count + 1
		end
	end
	return count
end

function DroneControl:GetMaintenanceDronesCount()
	-- clean and repair and repair drones
	local count = 0
	for i=1, #self.drones do
		local drone = self.drones[i]
		local cmd =  drone.command
		if cmd == "RepairDrone" or drone.resource == "repair" or drone.resource == "clean" then
			count = count + 1
		end
	end
	return count
end


function DroneControl:GetDischargedDronesCount()
	local count = 0
	for i=1, #self.drones do
		local cmd =  self.drones[i].command
		if cmd == "NoBattery" or cmd == "EmergencyPower" then
			count = count + 1
		end
	end
	return count
end

function DroneHub:GetFreeConstructionSlotsForDrones()
	return g_Consts.CommandCenterMaxDrones - self:GetDronesCount()
end

function DroneHub:GetUISectionDroneHubRollover()
	return table.concat({
		T{290, "Current allocation of Drones to different jobs.<newline>"},
		T{291, "Maintenance<right><drone(MaintenanceDronesCount)>", self},
		T{292, "Workers<right><drone(TransportDronesCount)>", self},
		T{293, "Discharged<right><drone(DischargedDronesCount)>", self},
		T{294, "Broken<right><drone(BrokenDronesCount)>", self},
		T{295, "Idle<right><drone(IdleDronesCount)>", self},
	}, "<newline><left>")
end

function OnMsg.DepositsSpawned()
	if UICity then
		local arr = UICity.labels.DroneHub --template name label
		
		for i = 1, #(arr or empty_table) do
			if arr[i].are_requesters_connected then
				arr[i]:ReconnectTaskRequesters()
			else
				arr[i]:ConnectTaskRequesters()
			end
		end
	end
end

function OnMsg.GatherLabels(labels)
	labels["DroneControl"] = true
end

local LoadTexts = {
	T{935141416351, "Drones load <right><green>Low</green><left>"},
	T{935141416352, "Drones load <right><yellow>Medium</yellow><left>"},
	T{935141416353, "Drones load <right><red>Heavy</red><left>"},
	T{8662, "Drones load <right>N/A<left>"},
}

local low_threshold = const.HourDuration / 2
local medium_threshold = const.HourDuration * 2

function DroneControl:GetDronesStatusText()
	if (self:IsKindOf("DroneHub") and not self.working) then
		return T{647, "<red>Not working. Drones won't receive further instructions.</red>"}
	end
	local brokenDrones = self:GetBrokenDronesCount()
	local broken = 
		brokenDrones == 1 and T{648, "There is <red>1</red> malfunctioning Drone</red>"} .. "\n"
		or brokenDrones > 1 and T{649, "There are <red><number></red> malfunctioning Drones</red>", number = brokenDrones} .. "\n"
		or ""
		
	local t = table.ifilter(self.drones, function(i, o) return not o:IsDisabled() end)
	if #t <= 0 then
		return broken .. LoadTexts[4]
	else
		local lap_time = Max(self.lap_time, GameTime() - self.lap_start)
		if lap_time < low_threshold then
			return broken .. LoadTexts[1]
		elseif lap_time < medium_threshold then
			return broken .. LoadTexts[2]
		else
			return broken .. LoadTexts[3]
		end
	end
end

DroneHub.GetConstructDroneCost = DroneFactory.GetConstructDroneCost
DroneHub.GetConstructResource = DroneFactory.GetConstructResource
local factory_query = {class = "DroneFactory", area = false, arearadius = false, filter = function(o) return o.destroyed == false end}

function DroneHub:GetFactoryNearby()
	if #(self.city.labels.DroneFactory or "") > 0 then
		factory_query.arearadius = g_Consts.DroneHubOrderDroneRange
		factory_query.area = self
		local f = FindNearest(factory_query)
		factory_query.area = false
		
		return f
	end
	
	return false
end

function DroneHub:OrderDroneConstructionAtClosestFactory()
	local f = self:GetFactoryNearby()
	
	if f then
		f:ConstructDrone(1, self)
		self.total_requested_drones = self.total_requested_drones + 1
		RebuildInfopanel(self)
	end
end

function DroneHub:OnDroneRemovedFromQueue()
	self.total_requested_drones = self.total_requested_drones - 1
	RebuildInfopanel(self)
end

function DroneHub:GetOrderedDronesCount()
	return T{8492, "Drones ordered: <num>", num = self.total_requested_drones}
end