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
local rfSpecialDemandPairing = const.rfSpecialDemandPairing
local rfSpecialSupplyPairing = const.rfSpecialSupplyPairing
local MaxBuildingPriority     = const.MaxBuildingPriority
local TaskPriorityBoost       = const.TaskPriorityBoost
local table_insert = table.insert
local table_remove = table.remove
local remove_entry = table.remove_entry
local IsFlagSet    = IsFlagSet
local rfRestrictorRocket = const.rfRestrictorRocket
local rfRestrictorWasteRockDump = const.rfRestrictorWasteRockDump

local function FindClosest(list, pt)
	local dist_func = "GetDist2D"
	
	local min_obj = nil
	local min_dist = nil
	local idx = nil
	local invalid_pos = InvalidPos()
	for i = 1, #list do
		local obj = list[i]
		if IsValid(obj) and obj:IsValidPos() then
			local dist = obj[dist_func](obj, pt)
			if not min_dist or min_dist > dist then
				min_obj = obj
				min_dist = dist
				idx = i
			end
		end
	end

	return min_obj, min_dist, idx
end

DefineClass.DroneControl = {
	__parents = { "TaskRequestHub" },
	properties = {
		{template = true,id = "starting_drones",  name = T(642, "Starting Drones"),editor = "number", default = 4, modifiable = true},
		-- make sure UIWorkRadius and work_radius share the same default value
		{id = "UIWorkRadius", name = T(643, "Range"), editor = "number", default = const.CommandCenterDefaultRadius, min=const.CommandCenterMinRadius, max=const.CommandCenterMaxRadius, no_edit = true, dont_save = true,}, -- prop only for UI purposes
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

	no_requests_time = 0,
	
	serviced_rockets = false,
	serviced_wasterock_dumps = false,
	restrictor_update_thread = false,
	restrictor_tables = false,  --[rfRestritcorFlag] = {[resource] = request,..}
	restrictor_update_mask = 0,
	
	deficit_table = false, --sums up total deficits so shuttles know what to deliver
	deficit_thread = false,

	unreachable_buildings = false,
	can_control_drones = true,
	
	promoted_trees = false,
	veg_management_thread = false,
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
	return Request_UpdateDeficits(self, StorableResources)
end

--[[
function DroneControl:UpdateDeficitsInternal_Lua()
	local t = {}
	
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
	
	return t
end

function DroneControl:UpdateDeficitsInternal()
	local t = Request_UpdateDeficits(self, StorableResources)
	local t_lua = self:UpdateDeficitsInternal_Lua()
	assert(compare(t, t_lua))
	return t
end
--]]

function DroneControl:InitRocketRestrictors()
	self.serviced_rockets = {}
	self.restrictor_tables = self.restrictor_tables or {}
	self.restrictor_tables[rfRestrictorRocket] = {}
end

function DroneControl:InitDumpRestrictors()
	self.serviced_wasterock_dumps = self.serviced_wasterock_dumps or {}
	self.restrictor_tables = self.restrictor_tables or {}
	self.restrictor_tables[rfRestrictorWasteRockDump] = {}
end

function DroneControl:Init()
	self.drones = {}
	self.constructions = {}
	
	self:InitRocketRestrictors()
	self:InitDumpRestrictors()
end

function DroneControl:GameInit()
	self.city:AddToLabel("DroneControl", self)

	--delay until GameInit is completed
	--we need this so any descendant in a label can modify the number
	self:Notify("SpawnDrones")
end

function DroneControl:SpawnDrones()
	for i = 1, self.starting_drones do
		self:SpawnDrone()
	end
end

function DroneControl:GatherOrphanedDrones()
	if not self.working then return end
	
	while self:CanHaveMoreDrones() do
		local drone, _, idx = FindClosest(g_OrphanedDrones, self)
		if not drone then return end
		
		table.remove(g_OrphanedDrones, idx)
		drone:SetCommandCenter(self)
		if self == SelectedObj then
			SelectionArrowAdd(drone)
		end
	end
end

function SavegameFixups.DisableInteractionWithDestroyedDroneControllers()
	MapForEach("map", "DroneControl", function(o)
		if o.destroyed then
			o:Finalize()
		end
	end)
end

function DroneControl:Finalize()
	self.can_control_drones = false
	
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
	self.city:RemoveFromLabel("DroneControl", self)
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
	self:UpdateAllRestrictors()
	self:UpdateDeficits()
	self:UpdateHeavyLoadNotification()
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

--zz so it fires last and expected containers are initialized
function SavegameFixups.zzConstructionSiteCleanupReconnectTaskRequesters()
	--bug: 137698
	MapForEach("map", "DroneControl", DroneControl.ReconnectTaskRequesters)
end

PromoteTrees = empty_func
function DroneControl:ConnectTaskRequesters()
	if self.are_requesters_connected then return end
	local resource_search = function (building, center)
		--SetConstructionSiteSign(building, false, "SignNoPower")
		if building.auto_connect and not GameInitThreads[building] then
			building:AddCommandCenter(center)
			building:ForEachAttach("ResourceStockpileBase", function(stock)
				stock:AddCommandCenter(center)
			end)
		elseif not building.auto_connect and IsKindOf(building, "ConstructionSite") and building.working then
			local l = building.waste_rocks_underneath or ""
			for i = 1, #l do
				l[i]:AddCommandCenter(center)
			end
			l = building.waste_rocks_underneath or ""
			for i = 1, #l do
				l[i]:AddCommandCenter(center)
			end
		end
	end
	MapForEach(self, "hex", self.work_radius , "TaskRequester", resource_search, self)
	
	if self.city:IsTechResearched("MartianVegetation") and #(self.promoted_trees or empty_table) <= 0 then
		local twidth, theight = terrain.GetMapSize()
		PromoteTrees(self, twidth, theight, max_int)
	end
	
	self:ConnectLandscapeConstructions()
	if #(self.city.labels.ToxicPool or "") > 0 then
		self:ConnectToxicPools()
	end
	
	self.are_requesters_connected = true
end

local function HexConnectLandscapeConstructions(q, r, self, passed, qq, rr)
	local mark = LandscapeCheck(q, r, true)
	if not mark or HexAxialDistance(qq, rr, q, r) > self.work_radius or passed[mark] then
		return
	end
	passed[mark] = true
	local ls = Landscapes[mark]
	local cs = ls and ls.site
	if cs and cs.auto_connect and not table.find(cs.command_centers, self) then
		cs:AddCommandCenter(self)
	end
end

function DroneControl:ConnectLandscapeConstructions()
	if not self.accept_requester_connects then return false end
	local passed = {}
	local x, y = self:GetVisualPosXYZ()
	local hs = const.HexSize + self.work_radius * const.GridSpacing
	local box = box(x - hs, y - hs, x + hs, y + hs)
	local qq, rr = WorldToHex(x, y)
	return LandscapeForEachHex(box, HexConnectLandscapeConstructions, self, passed, qq, rr)
end

function DroneControl:ConnectToxicPools()
	if not self.accept_requester_connects then return false end
	local p = self:GetPos()
	if p ~= InvalidPos() then
		local twidth, theight = terrain.GetMapSize()
		local margin = 100 * guim
		local passed = {}
		ForEachHexInHexCircle(p, self.work_radius, function(q, r, self, twidth, theight, margin, passed, ObjectGrid)
			local wx, wy = HexToWorld(q, r)
			if not (wx < margin or wy < margin 
				or (twidth - wx) < margin or (theight - wy) < margin) then
				local o = HexGridGetObject(ObjectGrid, q, r, "ToxicPool")
				if not o or passed[o] then
					return
				end
				passed[o] = true
				if o.auto_connect and not table.find(o.command_centers, self) then
					o:AddCommandCenter(self)
				end
			end
		end, self, twidth, theight, margin, passed, ObjectGrid)
	end
end

function DroneControl:DelayedPromotedTreeManagement()
	if IsValidThread(self.veg_management_thread) then
		DeleteThread(self.veg_management_thread)
	end
	if self.promoted_trees and #(self.promoted_trees or "") > 0 then
		self.veg_management_thread = CreateGameTimeThread(function(self)
			Sleep(1000)
			for i = #self.promoted_trees, 1, -1 do
				local pt = self.promoted_trees[i]
				if #pt.command_centers <= 0 then
					DoneObject(pt)
				elseif not table.find(pt.command_centers, self) then
					for j = 1, #pt.command_centers do
						local cc = pt.command_centers[j]
						if #(cc.promoted_trees or "") < max_promoted_trees_per_hub then
							pt:Repossess(cc, i)
							break
						end
					end
					if pt.cc == self then
						DoneObject(pt)
					end
				end
			end
		end, self)
	end
end

function DroneControl:DisconnectTaskRequesters()
	while #self.connected_task_requesters > 0 do
		local bld = self.connected_task_requesters[#self.connected_task_requesters]
		if bld then
			bld:RemoveCommandCenter(self)
		end
	end
	self:DelayedPromotedTreeManagement()
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

function DroneControl:ForEachDrone(func, ...)
	for i = 1, #self.drones do
		if func(self.drones[i], ...) == "break" then
			break
		end
	end
end

function DroneControl:IsConstructionUnreachableByDrones(construction, n)
	n = n or 2
	local c = 0
	self:ForEachDrone(function(drone, construction)
		if drone.unreachable_buildings and drone.unreachable_buildings[construction] then
			c = c + 1
			if c >= n then
				return "break"
			end
		end
	end, construction)
	
	return c >= n
end

function DroneControl:UpdateConstructionsInternal()
	local supply_queues = self.supply_queues
	local under_construction = {}
	self.under_construction = under_construction
	for _, construction in ipairs(self.constructions) do
		local construction_found
		if not self:IsConstructionUnreachableByDrones(construction) then
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
		end
		if construction_found then
			return
		end
	end
end

function DroneControl:AddConstruction(construction)
	if not construction.use_control_construction_logic then
		return
	end
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
	if not construction.use_control_construction_logic then
		return
	end
	local idx = remove_entry(self.constructions, construction)
	assert(idx)
	self:UpdateConstructions()
end

---------------------------------------------------------------------------
---------------------------------------------------------------------------
function SavegameFixups.InitWasteRockDumpRestrictor()
	MapForEach(true, "DroneControl", function(obj)
		obj:FillDumpTablesFromConnectedRequestors()
		obj:KillRestrictorThread()
		obj:InitDumpRestrictors()
	end)
end

function DroneControl:FillDumpTablesFromConnectedRequestors()
	assert(not self.serviced_wasterock_dumps or #self.serviced_wasterock_dumps <= 0)
	if not self.connected_task_requesters or #self.connected_task_requesters <= 0 then return end
	self.serviced_wasterock_dumps = table.ifilter(self.connected_task_requesters, function(i, o)
												return IsKindOf(o, "WasteRockDumpSite")
											end)
end

function DroneControl:KillRestrictorThread()
	if self.restrictor_update_thread then
		if IsValidThread(self.restrictor_update_thread) then
			DeleteThread(self.restrictor_update_thread)
		end
		self.restrictor_update_thread = false
	end
end

function DroneControl:UpdateRestrictors()
	local t = self.restrictor_update_thread
	if IsValidThread(t) then
		Wakeup(t)
	else
		self.restrictor_update_thread = CreateGameTimeThread(function(self)
			self:RestrictorThreadBody()
		end, self)
	end
end

function DroneControl:RestrictorThreadBody()
	while IsValid(self) do
		local m = self.restrictor_update_mask
		if band(m, rfRestrictorRocket) ~= 0 then
			self:UpdateRocketsInternal()
		end
		if band(m, rfRestrictorWasteRockDump) ~= 0 then
			self:UpdateDumpsInternal()
		end
		self.restrictor_update_mask = 0
		WaitWakeup()
	end
end

function DroneControl:UpdateRockets()
	self.restrictor_update_mask = bor(self.restrictor_update_mask, rfRestrictorRocket)
	self:UpdateRestrictors()
end

function DroneControl:UpdateDumps()
	self.restrictor_update_mask = bor(self.restrictor_update_mask, rfRestrictorWasteRockDump)
	self:UpdateRestrictors()
end

function DroneControl:UpdateAllRestrictors()
	self.restrictor_update_mask = -1
	self:UpdateRestrictors()
end

function DroneControl:UpdateDumpsInternal()
	local r_t = self.restrictor_tables[rfRestrictorWasteRockDump]
	r_t.WasteRock = nil
	
	local min = max_int
	local found_req
	
	for i = 1, #(self.serviced_wasterock_dumps or "") do
		local d = self.serviced_wasterock_dumps[i]
		local dr = d.demand.WasteRock
		local a = dr:GetTargetAmount()
		if a > 0 and a < min then
			min = a
			found_req = dr
		end
	end
	
	if found_req then
		r_t["WasteRock"] = found_req
	end
end

function DroneControl:UpdateRocketsInternal()
	local r_t = self.restrictor_tables[rfRestrictorRocket]
	r_t.Fuel = nil
	
	for i = 1, #(self.serviced_rockets or "") do
		local r = self.serviced_rockets[i]
		local rr = r.refuel_request
		if rr and rr:GetTargetAmount() > 0 then
			r_t["Fuel"] = rr
			break
		end
		local rr = r:GetExportRequest(r, "Fuel")
		if rr and rr:GetTargetAmount() > 0 then
			r_t["Fuel"] = rr
			break
		end
	end
end

function DroneControl:AddRocket(rocket)
	local need_fuel = g_LandedRocketsInNeedOfFuel
	local r_i = table.find(need_fuel, rocket) or max_int
	local r_p = rocket.priority
	local rockets = self.serviced_rockets
	local i = #rockets + 1
	while i > 1 and (rockets[i - 1].priority < r_p 
			or rockets[i - 1].priority == r_p and (table.find(need_fuel, rockets[i - 1]) or max_int) > r_i) do
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
		assert(request and building == request:GetBuilding())
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
	
	if IsKindOf(building, "WasteRockDumpSite") then
		self.serviced_wasterock_dumps = self.serviced_wasterock_dumps or {}
		table.insert(self.serviced_wasterock_dumps, building)
		self:UpdateDumps()
	end
end

function DroneControl:OnRemoveBuilding(building, oldp, newp)
	if oldp and newp and newp > oldp then
		return
	end
	for _, drone in ipairs(self.drones) do
		if BuildingFromGotoTarget(drone.goto_target) == building then
			drone:SetCommand("Idle")
		end
	end
end

function DroneControl:RemoveBuilding(building, oldp, newp)
	self:OnRemoveBuilding(building, oldp, newp)
	
	local task_requests = building.task_requests or empty_table
	for priority = -1, MaxBuildingPriority do
		local s_requests = self.supply_queues[priority]
		local d_requests = self.demand_queues[priority]
		local priority_queue = self.priority_queue[priority]
		for _, request in ipairs(task_requests) do
			local resource = request and request:GetResource()
			remove_entry(s_requests[resource] or empty_table, request)
			remove_entry(d_requests[resource] or empty_table, request)
			remove_entry(priority_queue, request)
		end
	end
	
	table.remove_entry(self.connected_task_requesters, building)
	building:OnRemovedByControl(self)
	self:UpdateDeficits()
	
	if IsKindOf(building, "WasteRockDumpSite") then
		if self.serviced_wasterock_dumps then
			table.remove_entry(self.serviced_wasterock_dumps, building)
		end
		self:UpdateDumps()
	end
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
	
	local rxs = g_HexRanges[self] or empty_table
	for _, range in ipairs(rxs) do
		range:SetScale(self[range.bind_to](self))
	end
end

function DroneControl:GetSelectionRadiusScale()
	return self.work_radius
end

function DroneControl:OnSelected()
	local re1 = GetStateIdx("roverEnter")
	local re2 = GetStateIdx("roverEnter2")
	local drones = table.ifilter(self.drones, function(idx, drone)
		return IsValid(drone) and drone.command ~= "Embark" and drone:GetState() ~= re1 and drone:GetState() ~= re2
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

function DroneControl:UseDronePrefab(bulk)
	bulk = bulk and 5 or 1
	while bulk > 0 do
		if self.city and self.city.drone_prefabs > 0 then
			if self:SpawnDrone() then
				self.city.drone_prefabs = self.city.drone_prefabs - 1
			end
		else
			break
		end
		bulk = bulk - 1
	end
end

function DroneControl:FindDroneToConvertToPrefab()
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
		return FindNearestObject(idles, self)
	elseif #all > 0 then
		return FindNearestObject(all, self)
	end
end

function DroneControl:ConvertDroneToPrefab(bulk)
	bulk = bulk and 5 or 1
	while bulk > 0 do
		local drone = self:FindDroneToConvertToPrefab()
		if drone then
			if drone.demolishing then
				drone:ToggleDemolish()
			end
			drone.can_demolish = false
			UICity.drone_prefabs = UICity.drone_prefabs + 1
			table.remove_entry(self.drones, drone)
			SelectionArrowRemove(drone)
			drone:SetCommand("DespawnAtHub")
		else
			break
		end
		bulk = bulk - 1
	end
end

DefineClass.DroneHub = {
	__parents = { "Building", "TaskRequester", "DroneControl", "ElectricityConsumer" },
	
	building_update_time = 10000,
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

function DroneHub:InitAttaches()
	local station_template = ClassTemplates.Building.RechargeStation
	local platforms = self:GetAttaches("RechargeStationPlatform")

	local ccs = GetCurrentColonyColorScheme()
	local cm1, cm2, cm3, cm4 = GetBuildingColors(ccs, station_template)
	
	local i = 1
	for _, platform in ipairs(platforms or empty_table) do
		platform:SetEnumFlags(const.efSelectable) --so we can select the command center through the recharge station
	
		local spot_obj = PlaceObject("NotBuildingRechargeStation")
		spot_obj:ChangeEntity("RechargeStation")
		
		self:Attach(spot_obj, platform:GetAttachSpot())

		spot_obj:SetAttachOffset(platform:GetAttachOffset())
		spot_obj:SetAttachAngle(platform:GetAttachAngle())
		spot_obj.platform = platform
		spot_obj.hub = self
		assert(not IsValid(self.charging_stations[i]))
		self.charging_stations[i] = spot_obj
		i = i + 1
		if cm1 then
			Building.SetPalette(platform, cm1, cm2, cm3, cm4)
		end
	end
	
	local c = self:GetAttaches("CableHardLeft")
	cm1, cm2, cm3, cm4 = GetCablesPalette()
	for i = 1, #(c or "") do
		c[i]:SetColorizationMaterial4(cm1, cm2, cm3, cm4)
	end
end

function DroneHub:OnSkinChanged(skin, palette)
	Building.OnSkinChanged(self, skin, palette)
	self:InitAttaches()
end

function DroneHub:GameInit()
	self:InitAttaches()
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
	local drone = self.city:CreateDrone()
	drone:SetHolder(self)
	drone:SetCommandCenter(self)
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
		T{293, "Low Battery<right><drone(DischargedDronesCount)>", self},
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
	T(935141416351, "Drones load <right><green>Low</green><left>"),
	T(935141416352, "Drones load <right><yellow>Medium</yellow><left>"),
	T(935141416353, "Drones load <right><red>Heavy</red><left>"),
	T(8662, "Drones load <right>N/A<left>"),
}

GlobalVar("g_HeavyLoadDroneHubs", {})
GlobalGameTimeThread("HeavyLoadDroneHubsNotif", function()
	Sleep(100)
	if not g_Tutorial or g_Tutorial.EnableTransportProblemNotif then
		HandleNewObjsNotif(g_HeavyLoadDroneHubs, "TransportationDroneOverload")
	end
end)

function DroneControl:CalcLapTime()
	return #self.drones == 0 and 0 or Max(self.lap_time, GameTime() - self.lap_start)
end

function DroneControl:UpdateHeavyLoadNotification()
	if self.working and self:CalcLapTime() >= const.DroneLoadMediumThreshold then
		table.insert_unique(g_HeavyLoadDroneHubs, self)
	else
		table.remove_entry(g_HeavyLoadDroneHubs, self)
	end
end

function DroneControl:GetDronesStatusText()
	local ret
	
	if (self:IsKindOf("DroneHub") and not self.working) then
		ret = T(647, "<red>Not working. Drones won't receive further instructions.</red>")
	else
		local brokenDrones = self:GetBrokenDronesCount()
		local broken = 
			brokenDrones == 1 and T(648, "There is <red>1</red> malfunctioning Drone</red>") .. "\n"
			or brokenDrones > 1 and T{649, "There are <red><number></red> malfunctioning Drones</red>", number = brokenDrones} .. "\n"
			or ""
			
		local t = table.ifilter(self.drones, function(i, o) return not o:IsDisabled() end)
		if #t <= 0 then
			ret = broken .. LoadTexts[4]
		else
			local lap_time = self:CalcLapTime()
			if lap_time < const.DroneLoadLowThreshold then
				ret = broken .. LoadTexts[1]
			elseif lap_time < const.DroneLoadMediumThreshold then
				ret = broken .. LoadTexts[2]
			else
				ret = broken .. LoadTexts[3]
			end
		end
	end
	if IsKindOf(self, "SupplyRocket") then
		return ret 
	else	
		return ret .. "\n" .. T(9757, "Available Prefabs <right><drone(available_drone_prefabs)>")
	end	
end

DroneHub.GetConstructDroneCost = DroneFactory.GetConstructDroneCost
DroneHub.GetConstructResource = DroneFactory.GetConstructResource

function DroneHub:GetFactoryNearby()
	if #(self.city.labels.DroneFactory or "") > 0 then
		local f = MapFindNearest(self, self, g_Consts.DroneHubOrderDroneRange, "DroneFactory", function(o) return o.destroyed == false end)
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

function BulkObjModifiedInCityLabels(...)
	local lbls = table.pack(...)
	local city_labels = UICity.labels
	for i = 1, #lbls do
		local container = city_labels[lbls[i]] or empty_table
		for _, obj in ipairs(container) do
			ObjModified(obj)
		end
	end
end

function DoesAnyDroneControlServiceAtPoint(pt)
	return MapCount(pt, "hex", const.CommandCenterMaxRadius, "DroneControl", 
								function(center)
									return (IsKindOf(center, "DroneHub") or center.working) and HexAxialDistance(center, pt) <= center.work_radius
								end) > 0
end