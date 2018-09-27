local WasteRockAmountsByEntity = 
{
	Rocks_03 = 3,
	Rocks_04 = 2,
	RocksDark_04 = 3,
	RocksDark_05 = 2,
	StonesDarkGroup_01 = 1,
	StonesDarkGroup_02 = 1,
	StonesDarkGroup_03 = 1,
	RocksSlate_03 = 2,
	RocksSlate_07 = 1,
	StonesSlate_01 = 1,
	StonesSlate_02 = 1,
	StonesSlate_03 = 1,
	StonesSlate_04 = 1,
	StonesSlate_05 = 1,
	StonesSlate_06 = 1,
	StonesSlate_07 = 1,
	StonesSlate_08 = 1,
	RocksLight_04 = 2,
	RocksLight_05 = 3,
	RocksLightSmall_01 = 1,
	RocksLightSmall_02 = 1,
	RocksLightSmall_03 = 1,
	RocksLightSmall_04 = 1,
	RocksLightSmall_05 = 1,
	RocksLightSmall_06 = 1,
	RocksLightSmall_07 = 2,
	RocksLightSmall_08 = 2,
}

--map object that obstructs construction, converted by drones into waste rock piles
DefineClass.WasteRockObstructor = {
	__parents = {"UngridedObstacle", "DoesNotObstructConstruction",},
	amount_of_waste_rock = 1 * const.ResourceScale, --amount of waste rock produced when converted to waste rock.
	drone_work_points_per_waste_rock = 1000,
	auto_connect = false, --connect only on demmand?
	work_req = false,
	max_workers = 4, --workers allowed per rock
	parent_construction = false,
	
	initialized = false,
	
	--ui
	display_name = T{4518, "Waste Rock"},
	GetDisplayName = function(self) return self.display_name end
}

--manual shallow inheritance of TaskRequester
for k, v in pairs(TaskRequester) do
	if WasteRockObstructor[k] == nil then
		WasteRockObstructor[k] = v
	end
end


--some hacks so command centers can see us, can change to flag.
function OnMsg.ClassesPostprocess()
	WasteRockObstructor.__ancestors["TaskRequester"] = true
	
	local l = ClassDescendantsList("WasteRockObstructor")
	for i = 1, #l do
		_G[l[i]].__ancestors["TaskRequester"] = true
	end
end

DefineClass.WasteRockObstructorDestructorObject = {
	__parents = {"Object"}, --obj so it can attach
	parent = false,
	Done = function(self)
		assert(self.parent)
		self.parent:OnDeleted()
	end,
}

local function ForAllDo(container, func, ...)
	for i = 1, #(container or "") do
		local o = container[i]
		func(o, ...)
	end
end

function WasteRockObstructor:OnCommandCenterWorkingChanged()
	ForAllDo(self.parent_construction, Notify, "UpdateNoCCSign")
end

function WasteRockObstructor:OnAddedByControl(control)
	ForAllDo(self.parent_construction, Notify, "UpdateNoCCSign")
end

function WasteRockObstructor:OnRemovedByControl(control)
	ForAllDo(self.parent_construction, ConstructionSite.UpdateNoCCSign)
end

function WasteRockObstructor:GetRotatedShapePoints()
	local p = GetTopmostParent(self)
	if p ~= self and IsKindOf(p, "CursorBuilding") then
		return empty_table --fake it, if we got no shape we cannot be underneath anything
	else
		return UngridedObstacle.GetRotatedShapePoints(self)
	end
end

function WasteRockObstructor:Initialize()
	assert(self.initialized == false)
	self:Attach(PlaceObject("WasteRockObstructorDestructorObject", {parent = self})) --this will call our destro
	
	self.command_centers = {}
	self.task_requests = {}
	self:CreateResourceRequests()
	if self.auto_connect then
		self:ConnectToCommandCenters()
	end

	local amount = (WasteRockAmountsByEntity[self:GetEntity()] or 1) * const.ResourceScale
	
	if amount ~= self.amount_of_waste_rock then
		self.amount_of_waste_rock = amount
	end
	
	self.initialized = true
end

function WasteRockObstructor:OnDeleted()
	for i = 1, #(self.parent_construction or "") do
		if IsValid(self.parent_construction[i]) then --bulk building with construction group leaders may leave invalid buildings here
			self.parent_construction[i]:OnWasteRockObstructorCleared(self, false)
		end
	end
	
	self.parent_construction = false
	
	self.command_centers = self.command_centers or empty_table --so no assert
	TaskRequester.Done(self) --clean command center requests
end

function WasteRockObstructor:CreateResourceRequests()
	self.work_req = self:AddWorkRequest("transform_to_waste_rock", 0, 0, self.max_workers)
end

function WasteRockObstructor:IsUnderneathConstruction() 
	local q, r = WorldToHex(self)
	local constr_site = HexGridGetObject(ObjectGrid, q, r, "ConstructionSite")
	return constr_site
end

function WasteRockObstructor:Activate(prio, activator)
	if self.auto_connect then
		self.parent_construction[#self.parent_construction + 1] = activator
		return
	end
	if not self.initialized then
		self:Initialize()
	end
	
	self.parent_construction = {activator}
	self.priority = prio or 2
	local amount = (self.amount_of_waste_rock / const.ResourceScale) * self.drone_work_points_per_waste_rock
	self.work_req:AddAmount(amount)
	self.auto_connect = true
	self:ConnectToCommandCenters()
	self:ConnectToOtherBuildingCommandCenters(activator)
end

function WasteRockObstructor:Deactivate(activator)
	table.remove_entry(self.parent_construction, activator)
	if #self.parent_construction == 0 and self.work_req:GetFreeUnitSlots() == self.max_workers then --no drones incoming, we can deactivate
		local amount = (self.amount_of_waste_rock / const.ResourceScale) * self.drone_work_points_per_waste_rock
		if self.work_req:GetTargetAmount() == self.work_req:GetActualAmount() and amount == self.work_req:GetTargetAmount() then --noone has ever worked us.
			self.auto_connect = false
			self:DisconnectFromCommandCenters()
			self.work_req:SetAmount(0)
			return true
		end
	end
	
	return false
end

function WasteRockObstructor:SetPriority(priority)
	if self.priority == priority then return end
	for _, center in ipairs(self.command_centers) do
		center:RemoveBuilding(self)
	end
	self.priority = priority
	for _, center in ipairs(self.command_centers) do
		center:AddBuilding(self)
	end
end

function WasteRockObstructor:DroneWork(drone, request, resource, amount)
	drone:PushDestructor(function(drone)
		local self = drone.target
		if IsValid(self) and self.work_req:GetActualAmount() <= 0 then
			self:TransformToStockpile(drone)
		end
	end)
	drone:ContinuousTask(request, amount, g_Consts.DroneTransformWasteRockObstructorToStockpileBatteryUse, "constructStart", "constructIdle", "constructEnd", "Construct")
	drone:PopAndCallDestructor()
end

function WasteRockObstructor:TransformToStockpile(drone)
	local pos = self:GetPos() --cache
	local was_underneath_constr = self:IsUnderneathConstruction()
	local parent_constructions = self.parent_construction
	self.parent_construction = false --suppress destructor
	CreateGameTimeThread(function() --so drone work destructor can pass and we can set .resource without it being reset.
		if drone then
			--drone not carying anything
			local resource = "WasteRock"
			local a = Min(DroneResourceUnits[resource], self.amount_of_waste_rock)
			drone:SetCarriedResource(resource, a)
			self.amount_of_waste_rock = self.amount_of_waste_rock - a
		end
		
		local stock
		if self.amount_of_waste_rock > 0 then
			local snap_and_apply = not was_underneath_constr and true or false
			stock = PlaceObject(snap_and_apply and "WasteRockStockpile" or "WasteRockStockpileUngrided",
								{priority = self.priority,
								init_with_amount = self.amount_of_waste_rock,
								has_demand_request = false,
								parent_construction = false,
								apply_to_grids = snap_and_apply,
								snap_to_grid = snap_and_apply,
								additional_supply_flags = const.rfSpecialDemandPairing + (was_underneath_constr and const.rfCanExecuteAlone or 0)})
			stock:SetPos(pos:SetTerrainZ())
		end
		
		
		local parents_to_give_to_stock = {}
		for i = 1, #(parent_constructions or "") do
			local send_stock = nil
			if was_underneath_constr and was_underneath_constr == parent_constructions[i] then
				send_stock = stock
				table.insert(parents_to_give_to_stock, parent_constructions[i])
			end
			parent_constructions[i]:OnWasteRockObstructorCleared(self, send_stock)
		end
		
		if stock then
			stock.parent_construction = parents_to_give_to_stock
		end
	end)
	DoneObject(self)
end


function WasteRockObstructor:GossipName()
	return self:GetEntity()
end

function WasteRockObstructor:DroneApproach(drone, resource)
	drone:ExitHolder(self)
	if not IsValid(self) then return false end
	if not self:HasSpot("idle", drone.work_spot_task) then
		local c, r = self:GetBSphere()
		local d_r = drone:GetRadius()
		local v = self:GetPos() - drone:GetPos()
		v = SetLen(Rotate(v, InteractionRand(360*60, "drone goto pos")), r + d_r)
		v = v + self:GetPos()
		return drone:Goto(v)
	else
		return drone:GotoBuildingSpot(self, drone.work_spot_task)
	end
end
-----------------------------------------------------------------------------------
--                   WasteRockStockpile
-----------------------------------------------------------------------------------

DefineClass.WasteRockStockpileBase = {
	__parents = { "ResourceStockpileBase", "Shapeshifter" },
	
	entity = "ResourcePlatformWasteRock",
	
	snap_to_grid = false,
	apply_to_grids = false,

	destroy_when_empty = true,
	has_demand_request = true,
	
	max_x = 5,
	max_y = 1,
	max_z = 1,
	
	resource = "WasteRock",
	
	is_tall = false,
	priority = -1,
	parent_construction = false,
	
	--vis specific
	cube_class = false,
	has_platform = false,
	pile_entity_plat = "WasteRockPilePlatform",
	pile_entity_no_plat = "WasteRockPileTile",
	no_platform_entity = "InvisiblePlatform",
	rocks_obj = false,
	set_terrain_type = 25,
	ip_template = "ipResourcePile",
	
	dome_label = false,
}

function WasteRockStockpileBase:Init()
	self:CreatePileObj()
	if not self.has_platform then
		local random_angle = InteractionRand(360*60, "Waste rock pile random angle")
		self:SetAngle(random_angle)
	end
end

function WasteRockStockpileBase:GameInit()
	if not self.has_platform then
		PathLenCacheValid()
	end
	if self.count == 0 then
		self.rocks_obj:ClearEnumFlags(const.efVisible)
	end
end

function WasteRockStockpileBase:DestroyEmpty()
	DoneObject(self)
	if not self.has_platform then
		PathLenCacheValid()
	end
end

function WasteRockStockpileBase:Done()
	if IsValid(self.rocks_obj) and self.rocks_obj ~= self then
		DoneObject(self.rocks_obj)
	end
end

local PassAffectFlags = const.efApplyToGrids + const.efCollision + const.efWalkable
function WasteRockStockpileBase:CreatePileObj()
	if not self.has_platform and self:GetEntity() ~= self.no_platform_entity then
		self:ChangeEntity(self.no_platform_entity)
	elseif self.has_platform and self:GetEntity() ~= getmetatable(self).entity then
		self:ChangeEntity(getmetatable(self).entity)
	end
	
	self.rocks_obj = PlaceObject(self.has_platform and self.pile_entity_plat or self.pile_entity_no_plat)
	self.rocks_obj:ClearEnumFlags(PassAffectFlags)
	self.rocks_obj:SetEnumFlags(const.efSelectable)
	self:Attach(self.rocks_obj)
end

function WasteRockStockpileBase:SetCount(new_count)
	new_count = new_count/const.ResourceScale --+ (new_count%const.ResourceScale==0 and 0 or 1)
	new_count = Clamp(new_count, 0, self.max_x * self.max_y * self.max_z)
	if new_count == self.count then 
		return
	end
	
	local rocks_obj = self.rocks_obj
	if new_count <= 0 then
		rocks_obj:ClearEnumFlags(const.efVisible)
	else
		rocks_obj:SetEnumFlags(const.efVisible)
		
		if new_count == 1 then
			rocks_obj:SetState("idle")
		else
			local s_name = "idle" .. tostring(new_count)
			if rocks_obj:HasState(s_name) then
				rocks_obj:SetState(s_name)
			end
		end
	end
	
	self.count = new_count
end

function WasteRockStockpileBase:ApplyToGrids()
	if self.apply_to_grids then --else already removed.
		GridObject.ApplyToGrids(self)
	end
end

function WasteRockStockpileBase:RemoveFromGrids()
	if self.apply_to_grids then --else already removed.
		GridObject.RemoveFromGrids(self)
	end
end

function WasteRockStockpileBase:CreateResourceRequests()
	if self.has_supply_request then
		self.supply_request = self:AddSupplyRequest(self.resource, self.stockpiled_amount, bor(self.has_demand_request and 0 or const.rfCanExecuteAlone, self:GetParent() and const.rfWaitToFill or 0, self.additional_supply_flags)) --kinda hacky, assumes supply_only is only used for obstructing stockpiles that need to be removed asap.
	end
	
	if self.has_demand_request then
		self.demand_request = self:AddDemandRequest(self.resource, self:GetMax() * const.ResourceScale - self.stockpiled_amount, self.additional_demand_flags)
	end
end

function WasteRockStockpileBase:GetShapePoints()
	return ResourceStockpileBase.GetShapePoints(self)
end

function WasteRockStockpileBase:DisconnectFromParent()
	ResourceStockpileBase.DisconnectFromParent(self)
	if not self.has_supply_request then
		assert(self.resource == "WasteRock" and not self.has_demand_request) --make sure its the fringe case we think it is.
		local mt = getmetatable(self)
		self.max_x = mt.max_x
		self.max_y = mt.max_y
		self.max_z = mt.max_z
		self:SetEnumFlags(const.efApplyToGrids)
		--become a dump site, just like the ones drones create.
		self:DisconnectFromCommandCenters()
		self.has_supply_request = true
		self.supply_request = self:AddSupplyRequest(self.resource, self.stockpiled_amount) --waste rock can be carried out without demand req.
		
		self.has_demand_request = true
		self.demand_request = self:AddDemandRequest(self.resource, self:GetMax() * const.ResourceScale - self.stockpiled_amount, const.rfSpecialDemandPairing)
		
		self.parent = nil
		self.priority = -1 --lower our prio
		self:ConnectToCommandCenters()
	end
end

DefineClass.WasteRockStockpile = {
	__parents = { "WasteRockStockpileBase", "GridObject", "DoesNotObstructConstruction" },
	is_tall = false,
	snap_to_grid = true,
	apply_to_grids = true,
	ApplyToGrids = WasteRockStockpileBase.ApplyToGrids,
	RemoveFromGrids = WasteRockStockpileBase.RemoveFromGrids,
	GetShapePoints = WasteRockStockpileBase.GetShapePoints,
}

DefineClass.WasteRockStockpileUngrided = {
	__parents = { "WasteRockStockpileBase", "UngridedObstacle", "DoesNotObstructConstruction", },
	
	GetModifiedBSphereRadius = function(self, ...) return ResourceStockpileBase.GetModifiedBSphereRadius(self, ...) end,
	snap_to_grid = false,
	apply_to_grids = false,
}

DefineClass.WasteRockStockpileUngridedNoBlockPass = {
	__parents = { "WasteRockStockpileUngrided" },
	enum_flags = { efApplyToGrids = false },
}

-----------------------------------------------------------------------------------
--           waste rock dump site
-----------------------------------------------------------------------------------
DefineClass.DumpSiteWithAttachedVisualPilesBase = {
	__parents = { "StorageDepot", "StockpileController" },
	
	resource = "WasteRock",
	exclude_from_lr_transportation = true,

	stockpile_spots = {"Wasterockpile"},
	stockpile_class = "WasteRockStockpileUngridedNoBlockPass",
	has_demand_request = false,
	has_supply_request = false,
	max_x = 15, 
	max_y = 1,
	max_z = 5,
	
	dome_label = false,
}

function DumpSiteWithAttachedVisualPilesBase:Init()
	--self.exploitation_resource = self.resource
	self.stockpiled_resource = self.resource
	self.parent = self
	self.additional_stockpile_params = {priority = self.priority, max_x = self.max_x, max_y = self.max_y, apply_to_grids = false, has_platform = false, snap_to_grid = false,}
end

function DumpSiteWithAttachedVisualPilesBase:GameInit()
	self.next_stockpile_idx = self:GetNextStockpileIndex(self.stockpiles, true)
end

function DumpSiteWithAttachedVisualPilesBase:SetCount(...)
	self:UpdateStockpileAmounts(self.supply[self.resource]:GetActualAmount())
end

function DumpSiteWithAttachedVisualPilesBase:ReturnStockpiledResources(...)
	self:ReleaseStockpiles()
end

function DumpSiteWithAttachedVisualPilesBase:GetStoredAmount(resource)
	return StorageDepot.GetStoredAmount(self, resource)
end

function SavegameFixups.DestroyBuggedBlackCubeStorages()
	MapForEach("map", "DumpSiteWithAttachedVisualPilesBase",
		function(o)
			if o.stockpiles and not IsValid(o.stockpiles[1]) then
				rawset(o, "ReleaseStockpiles", empty_func)
				DoneObject(o)
			end
		end)
end

function SavegameFixups.SetupSupplyToDumpingSites()
	MapForEach("map", "WasteRockDumpSite",
		function(o)
			local amount = o:GetStored_WasteRock()
			o:DisconnectFromCommandCenters()
			o.supply["WasteRock"] = o:AddSupplyRequest("WasteRock", amount, const.rfStorageDepot)
			o:ConnectToCommandCenters()
		end)
end

function DumpSiteWithAttachedVisualPilesBase:GetNextStockpileIndex(stockpiles, adding_resource)
	stockpiles = stockpiles or self.stockpiles
	local p = self:GetPos()
	local max = self:GetMaxStorage()
	local max_per_pile = max / #self.stockpiles
	local most = adding_resource and min_int or max_int
	local idx = nil
	
	for i = 1, #stockpiles do
		local stock = stockpiles[i]
		local a = Max(stock:GetStoredAmount(), stock.init_with_amount)
		
		if (not adding_resource and a > 0) or (adding_resource and a < max_per_pile) then
			local dist = adding_resource and p:Dist2D(stock:GetPos()) or 0
			a = a - dist
			if (adding_resource and a > most) or (not adding_resource and a < most) then
				most = a
				idx = i
			end
		end
	end
	
	return idx or 1
end
--

DefineClass.WasteRockDumpSite = {
	__parents = { "DumpSiteWithAttachedVisualPilesBase" },
	
	properties = {
		{ template = true, name = T{4519, "Max Amount Waste Rock"},  category = "Storage Space", id = "max_amount_WasteRock",  editor = "number", default = 45000, scale = const.ResourceScale },
	},
}

function WasteRockDumpSite:GameInit()
	HintDisable("HintWasteRock")
end

function WasteRockDumpSite:Getui_WasteRock() 
	return T{4520, "Waste Rock<right><Stored_WasteRock>/<MaxAmount_WasteRock>", self} 
end

function WasteRockDumpSite:GetStored_WasteRock()
	return self.max_amount_WasteRock - (self.demand and self.demand["WasteRock"]:GetActualAmount() or 0)
end

function WasteRockDumpSite:GetMaxAmount_WasteRock()
	return self.max_amount_WasteRock
end

WasteRockDumpSite.GetStoredAmount = WasteRockDumpSite.GetStored_WasteRock

GlobalVar("g_WasteRockLiquefaction", false)

function OnMsg.TechResearched(tech_id, city, first_time)
	if tech_id == "WasteRockLiquefaction" and first_time then
		g_WasteRockLiquefaction = true
		local ratio = Max(1, g_Consts.WasteRockToConcreteRatio)
		local depos = city.labels.WasteRockDumpSite or empty_table
		for i=1,#depos do
			local depo = depos[i]
			local amount = depo:GetStored_WasteRock() / ratio
			depo:DisconnectFromCommandCenters()
			depo.supply["Concrete"] = depo:AddSupplyRequest("Concrete", amount, const.rfWaitToFill)
			depo:ConnectToCommandCenters()
		end
	end
end

--[[function SavegameFixups.TurnOffOldWasteRockLiquification()
	if g_WasteRockLiquefaction then
		g_WasteRockLiquefaction = false
		local depos = UICity.labels.WasteRockDumpSite or empty_table
		for i = 1, #depos do
			local depo = depos[i]
			local req = depo.supply["Concrete"]
			depo:InterruptDrones(nil, function(drone) if drone.s_request == req then return drone end end)
			depo:DisconnectFromCommandCenters()
			table.remove_entry(depo.task_requests, req)
			depo.supply["Concrete"] = nil
			depo:ConnectToCommandCenters()
		end
	end
end]]

function WasteRockDumpSite:CreateResourceRequests()
	Building.CreateResourceRequests(self)
	self.demand = {}
	self.supply = {}
	local s = self:AddDemandRequest("WasteRock", self.max_amount_WasteRock, const.rfStorageDepot + const.rfRestrictorWasteRockDump)
	local d = self:AddSupplyRequest("WasteRock", 0, const.rfStorageDepot)
	self.demand["WasteRock"] = s
	self.supply["WasteRock"] = d
	s:SetReciprocalRequest(d)
	if g_WasteRockLiquefaction then
		self.supply["Concrete"] = self:AddSupplyRequest("Concrete", 0, const.rfWaitToFill)
	end
end

function WasteRockDumpSite:AddDepotResource(resource, amount)
	assert(resource == "WasteRock")
	self.demand["WasteRock"]:AddAmount(-amount)
	self.supply["WasteRock"]:AddAmount(amount)
	local count = self:GetStored_WasteRock()
	if self.supply["Concrete"] then
		local ratio = Max(1, g_Consts.WasteRockToConcreteRatio)
		self.supply["Concrete"]:SetAmount(count / ratio)
	end
	self:SetCount(count)
end

WasteRockDumpSite.AddResource = WasteRockDumpSite.AddDepotResource

function WasteRockDumpSite:DroneLoadResource(drone, request, resource, amount)
	if self.supply[resource] == request then
		if resource == "WasteRock" then 
			self.demand["WasteRock"]:AddAmount(amount)
			self:SetCount(self:GetStored_WasteRock())
		else
			drone:StartFX("Gather", self)
			local start = GameTime()
			local idle_time = g_Consts.DroneGatherResourceWorkTime - drone:GetAnimDuration("gatherStart") - drone:GetAnimDuration("gatherEnd")
			drone:PlayState("gatherStart")
			drone:SetState("gatherIdle")
			while GameTime() - start < idle_time do
				Sleep(1000)
			end
			drone:StopFX()
			drone:PlayState("gatherEnd")
			
			local ratio = Max(1, g_Consts.WasteRockToConcreteRatio)
			self.demand["WasteRock"]:AddAmount(amount * ratio)
			self:SetCount(self:GetStored_WasteRock())
		end
	end
end

function WasteRockDumpSite:DroneUnloadResource(drone, request, resource, amount)
	Building.DroneUnloadResource(self, drone, request, resource, amount)
	if self.demand[resource] == request then
		local count = self:GetStored_WasteRock()
		if self.supply["Concrete"] then
			local ratio = Max(1, g_Consts.WasteRockToConcreteRatio)
			self.supply["Concrete"]:AddAmount(amount / ratio)
		end
		self.supply["WasteRock"]:AddAmount(amount)
		self:SetCount(count)
		
		if drone and drone.command_center then
			drone.command_center:UpdateDumps()
		end
	end
end

function WasteRockDumpSite:CheatFill() 
	self.demand["WasteRock"]:SetAmount(0)
	self.supply["WasteRock"]:SetAmount(self.max_amount_WasteRock)
	if self.supply["Concrete"] then
		self.supply["Concrete"]:SetAmount(self.max_amount_WasteRock / Max(1, g_Consts.WasteRockToConcreteRatio))
	end
	self:SetCount(self.max_amount_WasteRock)
end

function WasteRockDumpSite:CheatEmpty() 
	self.demand["WasteRock"]:SetAmount(self.max_amount_WasteRock)
	if self.supply["Concrete"] then
		self.supply["Concrete"]:SetAmount(0)
	end
	self:SetCount(0)
end

function WasteRockDumpSite:SetCount(count)
	self:UpdateStockpileAmounts(count or self:GetStored_WasteRock())
end