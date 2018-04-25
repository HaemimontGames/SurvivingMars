ResourceStates = {
	"Auto",
	"Import",
	"Export",
}

ResourceStatesUI = {
	--val should correspond to ResourceStates[idx] in order for UIPropAutoTransportStateSetter to work
	{value = 1, text = T{669, "Auto"}},
	{value = 2, text = T{1000049, "Import"}},
	{value = 3, text = T{419, "Export"}},
}

--visual box only.
DefineClass.ResourceStockpileBox = {
	__parents = { "Shapeshifter" },
	entity = "Resource",
	resource = false,
	is_group = false,
}

function ResourceStockpileBox:Init()
	if self.resource then
		self:SetResource(self.resource)
	end
end

function SetPileResource(obj, resource, is_group)
	obj.resource = resource
	local res_info = Resources[resource]
	local e = is_group and res_info.group_entity or res_info.entity
	local c = res_info.color
	
	if type(e) == "table" then
		e = e[AsyncRand(#e) + 1]
	end
	
	if e and e ~= obj:GetEntity() then
		obj:ChangeEntity(e)
	elseif c then
		obj:SetColorModifier(c)
	end
end	

function ResourceStockpileBox:SetResource(resource)
	SetPileResource(self, resource, self.is_group)
end

DefineClass.ResourceStockpileBase = {
	__parents = { "TaskRequester", "Constructable", "Object", "InfopanelObj", "DomeOutskirtBld" }, --constructable so it can be placed with constr dialog
	game_flags = { gofPermanent = true },
	class_flags = { cfConstructible = false },
	entity = "ResourcePlatform",
	properties = {
		{ id = "StoredAmount", editor = "number", default = 0, no_edit = true },
		{ id = "resource", editor = "number", no_edit = true },
		{ id = "has_demand_request", editor = "bool", default = false, no_edit = true },
		{ id = "has_supply_request", editor = "bool", default = true, no_edit = true },
		{ id = "stockpiled_amount", editor = "number", default = 0, no_edit = true },
		{ id = "additional_supply_flags", editor = "number", default = 0, no_edit = true },
		{ id = "additional_demand_flags", editor = "number", default = 0, no_edit = true },
		{ id = "destroy_when_empty", editor = "bool", default = false, no_edit = true },
	},
	
	gamepad_auto_deselect = true,
	
	max_x = 5,
	max_y = 2,
	max_z = 5,
	box_diam = guim,
	box_height = guim,
	spacing_x = 16*guic,
	spacing_y = 13*guic,
	spacing_z = 1*guic,
	switch_fill_order = false,
	placement_offset = point30,
	fill_group_idx = 1,
	
	resource = "Metals",
	storable_resources = false,
	parent_dome = false,
	service_comfort = 0,
	cube_class = "ResourceStockpileBox",
	placed_cubes = false,
	count = 0,
	
	parent = false,
	supply_request = false,
	demand_request = false,
	
	init_with_amount = false,
	initialized = false,
	adjacent_stockpile = false, --keeps track if there is another stockpile placed next to us, so we can avoid large getobj queries.
	
	--ui
	display_name = T{692, "Resources"},
	description = T{693, "A pile of processed resources, available for your Drones."},
	
	fx_actor_class = "ResourceStockpile",
	
	parent_construction = false,
	
	count_in_resource_overview = true, --the city label "ResourceStockpile" contains all the stockpiles that will get counted
	cube_attach_spot_idx = false,
	
	interest1 = false,
	interest2 = false,
	interest3 = false,
	interest4 = false,
	
	dome_label = false,
	
	dome_label = "ResourceStockpile",
}

function CalcSingleResGroupEntity(info)
	local single_entity = info.entity
	local group_entity = IsValidEntity(single_entity) and (single_entity .. "10")
	if IsValidEntity(group_entity) then
		info.group_entity = group_entity
	end
end

function CalcResGroupEntity()
	for res, info in pairs(Resources) do
		CalcSingleResGroupEntity(info)
	end
end
OnMsg.EntitiesLoaded = CalcResGroupEntity
OnMsg.ClassesBuilt = CalcResGroupEntity

local function ForAllDo(container, func, ...)
	for i = 1, #(container or "") do
		local o = container[i]
		func(o, ...)
	end
end

function ResourceStockpileBase:OnCommandCenterWorkingChanged()
	ForAllDo(self.parent_construction, ConstructionSite.UpdateNoCCSign)
end

function ResourceStockpileBase:OnAddedByControl(control)
	ForAllDo(self.parent_construction, ConstructionSite.UpdateNoCCSign)
end

function ResourceStockpileBase:OnRemovedByControl(control)
	ForAllDo(self.parent_construction, ConstructionSite.UpdateNoCCSign)
end

function ResourceStockpileBase:Init()
	self.placed_cubes = {}
	self.resource = self.resource
	
	if self.cube_class then
		self.box_height = GetEntityBoundingBox(_G[self.cube_class]:GetEntity()):sizez()
	end
	
	self:ReInitBoxSpots()
end

function ResourceStockpileBase:ReInitBoxSpots()
	if self:HasSpot("Box") then
		self.cube_attach_spot_idx = self:GetSpotBeginIndex("Box")
		self.placement_offset = GetEntitySpotPos(self:GetEntity(), self.cube_attach_spot_idx)
	elseif self:HasSpot("Box1") then
		self.cube_attach_spot_idx = self:GetSpotBeginIndex("Box1")
		self.placement_offset = GetEntitySpotPos(self:GetEntity(), self.cube_attach_spot_idx)
	end
end

function ResourceStockpileBase:GameInit()
	self.initialized = true --this must be before setres
	if self.init_with_amount then
		if type(self.init_with_amount) == "table" then
			for r, a in pairs(self.init_with_amount) do
				self:AddResource(a, r)
			end
		else
			self:SetStoredAmount(self.init_with_amount)
		end
	end
	local dome = IsObjInDome(self)
	if dome then
		self:InitInside(dome)
	else	
		self:InitOutside()
	end
	
	CreateGameTimeThread(function()
		if self:DoesAcceptResource("Food") then
			self.interest1 = "needFood"
		end
	end)
	
	if self.count_in_resource_overview then
		for i=1,#Cities do
			Cities[i]:AddToLabel("ResourceStockpile", self)
		end
	end
end

function ResourceStockpileBase:Done()
	self.placed_cubes = false
	
	for i = 1, #(self.parent_construction or empty_table) do
		self.parent_construction[i]:OnBlockingStockpileCleared(self)
	end
	
	for i=1,#Cities do
		local city = Cities[i]
		city:RemoveFromLabel("ResourceStockpile", self)
	end
	
	if SelectedObj == self then
		SelectObj() --clear sel
	end
end

function ResourceStockpileBase:CreateResourceRequests()
	if self.has_supply_request then
		self.supply_request = self:AddSupplyRequest(self.resource, self.stockpiled_amount, bor(
			self:GetParent() == nil and 0 or const.rfWaitToFill,
			self.resource == "WasteRock" and const.rfCanExecuteAlone or 0,
			self.additional_supply_flags))
	end	
	if self.has_demand_request then
		self.demand_request = self:AddDemandRequest(self.resource, self:GetMax() * const.ResourceScale - self.stockpiled_amount, self.additional_demand_flags)
	end
end

function ResourceStockpileBase:DbgShowPilePos()
	for i=1,self.max_x*self.max_y do
		DbgAddVector(self:GetCubePosWorld(i))
	end
end
	
function ResourceStockpileBase:InitInside(dome)
	assert(IsKindOf(dome, "Dome") or not dome)
	self.parent_dome = dome or nil
end

function ResourceStockpileBase:InitOutside()
	self.parent_dome = nil
end

function ResourceStockpileBase:MoveInside(dome)
	self:InitInside(dome)
end

-- overwitten functions from servic (to service colonists Food need)
function ResourceStockpileBase:Assign() end
function ResourceStockpileBase:Unassign(unit)end
function ResourceStockpileBase:HasFreeVisitSlots() return true end
function ResourceStockpileBase:CanService(unit)
	if self.has_supply_request and self:DoesAcceptResource("Food") then
		local s_req = self.supply_request or self.supply["Food"]
		local eat_per_visit = unit:GetEatPerVisit(unit)
		return s_req:GetActualAmount() > eat_per_visit
	end
end

function GetEatPerVisit(unit)
	return Colonist.GetEatPerVisit(unit)
end

function ResourceStockpileBase:Service(unit, duration)
	assert(self.resource == "Food" or table.find(self.resource, "Food")) 
	local stored_amount = self:GetStoredAmount("Food")
	local eat_amount = unit:Eat(stored_amount)

	if eat_amount <= 0 then return end

	if not unit.traits.Rugged then
		unit:ChangeComfort(-g_Consts.OutsideFoodConsumptionComfort, "raw food")
	end

	UICity:OnConsumptionResourceConsumed("Food", eat_amount)
	
	if stored_amount == eat_amount and self.destroy_when_empty and unit.command_thread == CurrentThread() then
		CreateGameTimeThread(self.AddResource, self, -eat_amount, "Food", true) --we are about to call doneobj on self, this will cause all our held units to get kicked and have their cmd thread (this thread) terminated.
	else
		self:AddResource(-eat_amount, "Food", true)
	end
end

---------------------------------------------
function ResourceStockpileBase:AddResourceAmount(amount_to_add, notify_parents)
	if not self.initialized then
		--we don't have a supply req yet, accumulate to init val
		self.init_with_amount = (self.init_with_amount or 0) + amount_to_add
		return
	end
	if self.has_supply_request then
		self.supply_request:AddAmount(amount_to_add)
	end
	if self.has_demand_request then
		self.demand_request:AddAmount(-amount_to_add)
	end
	
	self.stockpiled_amount = self.stockpiled_amount + amount_to_add
	
	--update placed boxes.
	if self.has_supply_request or self.has_demand_request then
		self:SetCountFromRequest()
	else
		self:SetCount(self.stockpiled_amount)
	end
	
	if notify_parents then
		local p = self.parent
		if p then
			if p:HasMember("total_stockpiled") then
				--update total amount stored by this controller
				p:UpdateTotalStockpile(amount_to_add, self.resource)
			end
			
			if p:HasMember("DroneLoadResource") then
				--if parent has internal counters, this is its que to update them
				p:DroneLoadResource(nil, nil, self.resource, -amount_to_add)
			end
			
			if p:HasMember("DoesHaveConsumption") and p:DoesHaveConsumption() and p.consumption_resource_stockpile == self then
				local req = p.consumption_resource_request
				req:AddAmount(-amount_to_add)
				p:ConsumptionDroneUnload(nil, req, self.resource, amount_to_add)
			end
		end
	end
	
	if self.destroy_when_empty and self.stockpiled_amount <= 0 then
		DoneObject(self)
	end
end

function ResourceStockpileBase:AddResource(amount, resource, notify_parents)
	self:AddResourceAmount(amount, notify_parents)
end

function ResourceStockpileBase:DoesAcceptResource(resource)
	return type(self.resource) == "table" and table.find(self.resource, resource) or self.resource == resource
end

function ResourceStockpileBase:DoesHaveSupplyRequestForResource(resource)
	--i.e. if we can actually use the resource from this storage or it's just visual representation
	return type(self.resource) ~= "table" and self.supply_request and self.supply_request:GetResource() == resource
				or type(self.resource) == "table" and self.supply and self.supply[resource]
end

function ResourceStockpileBase:SetStoredAmount(new_amount)
	if not self.initialized then
		self.init_with_amount = new_amount
		return
	end
	-- update transport req
	local amount_to_add = new_amount - self:GetStoredAmount()
	self:AddResourceAmount(amount_to_add)
end

function ResourceStockpileBase:GetStoredAmount()
	if self.has_supply_request and self.supply_request then
		return self.supply_request:GetActualAmount()
	end
	if self.has_demand_request and self.demand_request then
		local amount =  self.demand_request:GetActualAmount()
		return self:GetMax()*const.ResourceScale - amount
	end
	return self.stockpiled_amount
end

function ResourceStockpileBase:SetCountFromRequest()
	self:SetCount(self:GetStoredAmount())
end

function ResourceStockpileBase:SetCountInternal(new_count, count, resource, placed_cubes, placement_offset, group_angle, single_angle)
	local cube_class = self.cube_class
	local group_entity = Resources[resource].group_entity
	local fill_group_idx = self.fill_group_idx
	if new_count > count then
 		for i = count + 1, new_count do
			local is_group = group_entity and i % 10 == 0
 			if is_group then
 				for k=i-9,i-1 do
					DoneObject(placed_cubes[k])
					placed_cubes[k] = nil
				end
			end
			local cube = PlaceObject(cube_class, {resource = resource, is_group = is_group})
			self:Attach(cube)
			cube:SetAngle(is_group and group_angle or single_angle)
			local k = is_group and i-10+fill_group_idx or i
			cube:SetAttachOffset(self:GetCubePosRelative(k - 1, placement_offset))
			placed_cubes[i] = cube
		end
 	else
 		for i = count, new_count + 1,-1 do
			if placed_cubes[i] then
				DoneObject(placed_cubes[i])
				placed_cubes[i] = nil
			end
 			if group_entity and i % 10 == 0 then
 				for k=i-9,Min(i-1,new_count) do
					if not placed_cubes[k] then
						local cube = PlaceObject(cube_class, {resource = resource})
						self:Attach(cube)
						cube:SetAngle(single_angle)
						cube:SetAttachOffset(self:GetCubePosRelative(k - 1, placement_offset))
						placed_cubes[k] = cube
					end
 				end
			end
		end
	end
	self.count = self.count + (new_count - count)
end

function ResourceStockpileBase:SetCount(new_count)
	new_count = new_count/const.ResourceScale --+ (new_count%const.ResourceScale==0 and 0 or 1)
	new_count = Clamp(new_count, 0, self.max_x * self.max_y * self.max_z)
	local count = self.count
	if new_count == count then
		return
	end
	return self:SetCountInternal(new_count, count, self.resource, self.placed_cubes, self.placement_offset, 0, 90*60)
end

function ResourceStockpileBase:GetCubePosRelative(idx, placement_offset) --zero based
	local offset = placement_offset or self.placement_offset
	local x, y, z
	
	z = idx / (self.max_x * self.max_y)
	
	if self.switch_fill_order then
		x = (idx / self.max_y) % self.max_x
		y = idx % self.max_y
	else
		y = (idx / self.max_x) % self.max_y
		x = idx % self.max_x
	end
	
	local x_offset = x * (self.box_diam + self.spacing_x) + offset:x()
	local y_offset = y * (self.box_diam + self.spacing_y) + offset:y()
	local z_offset = z * (self.box_height + self.spacing_z) + offset:z()
	
	return point(x_offset, y_offset, z_offset)
end

function ResourceStockpileBase:GetCubePosWorld(idx, ...) --zero based
	return self:GetVisualPos() + Rotate(self:GetCubePosRelative(idx, ...), self:GetAngle())
end

function ResourceStockpileBase:DroneLoadResource(drone, request, resource, amount, skip_presentation)
	assert(type(self.stockpiled_amount) == "number", string.format("Improper self.stockpiled_amount type %s, for class %s", type(self.stockpiled_amount), self.class))
	if drone then
		--presentation
		if not skip_presentation then
			drone:Face(self:GetPos(), 100)
			drone:StartFX("Pickup", resource) --resource to string
			drone:SetState("interact")
			Sleep(500)
			drone:StopFX()
		end
		if not IsValid(self) then
			return
		end
	end
	self.stockpiled_amount = self.stockpiled_amount - amount
	self:SetCount(self.stockpiled_amount)
	
	if self.parent and self.parent:HasMember("total_stockpiled") then
		--update total amount stored by this parent
		self.parent:UpdateTotalStockpile(- amount, self.resource)
	end
	
	if self.parent and self.parent:HasMember("DroneLoadResource") then
		--if parent has internal counters, this is its que to update them
		self.parent:DroneLoadResource(drone, request, resource, amount)
	end
	
	if self.has_demand_request then
		--should be after all sleeps
		self.demand_request:AddAmount(amount) --update reciprocal req.
	end
	
	if self.destroy_when_empty and request:GetWorkingUnits() <= 1 and self.stockpiled_amount <= 0 then
		self:DestroyEmpty()
	end
end

function ResourceStockpileBase:DestroyEmpty()
	DoneObject(self)
end

function ResourceStockpileBase:DroneUnloadResource(drone, request, resource, amount)
	assert(type(self.stockpiled_amount) == "number", string.format("Improper self.stockpiled_amount type %s, for class %s", type(self.stockpiled_amount), self.class))
	if self.has_supply_request then
		self.supply_request:AddAmount(amount) --update reciprocal req.
	end
	self.stockpiled_amount = self.stockpiled_amount + amount
	self:SetCount(self.stockpiled_amount)
	
	if self.parent and self.parent:HasMember("total_stockpiled") then
		--update total amount stored by this parent
		self.parent:UpdateTotalStockpile(amount, self.resource)
	end
	
	if self.parent and self.parent:HasMember("DroneUnloadResource") then
		--if parent has internal counters, this is its que to update them
		self.parent:DroneUnloadResource(drone, request, resource, amount)
	end
end

function ResourceStockpileBase:DroneApproach(drone, resource)
	return TaskRequester.DroneApproach(self, drone, resource) --we got spots so this should work
end

function ResourceStockpileBase:DisconnectFromParent()
	self:Detach()
	self.destroy_when_empty = true
	self:FloorStockpiledAmount()
	self:FallOnGround()
	self.parent = nil
	
	if self.has_supply_request and self.supply_request:IsAnyFlagSet(const.rfWaitToFill) then
		self.supply_request:ClearFlags(const.rfWaitToFill) --if drones carry 2 bricks and we have 1 brick, we'll never be full
	end
end

function ResourceStockpileBase:FallOnGround()
	local my_pos = self:GetPos()
	local new_z = IsBuildableZone(my_pos) and GetBuildableZ(WorldToHex(my_pos)) or terrain.GetHeight(my_pos)
	
	if new_z ~= my_pos:z() then
		self:SetPos(my_pos:SetZ(new_z))
	end
end

function ResourceStockpileBase:FloorStockpiledAmount()
	if not self.has_supply_request and not self.has_demand_request then return end
	
	local current_stockpiled = self:GetStoredAmount()
	local amount_to_remove = current_stockpiled - (current_stockpiled / const.ResourceScale) * const.ResourceScale
	self:AddResourceAmount(-amount_to_remove)
end

function ResourceStockpileBase:GetStoredAmountScaled()
	return self:GetStoredAmount() / const.ResourceScale
end

function ResourceStockpileBase:GetMax()
	return self.max_x * self.max_y * self.max_z	
end

--used when being placed with constr dialog.
function ResourceStockpileBase:GetShapePoints()
	return GetEntityOutlineShape(nil)
end

function ResourceStockpileBase:GetAdjacentPos()
	local max_y = self.max_y
	local y_offset = max_y * self.box_diam + (max_y + 1) * self.spacing_y
	return RotateRadius(y_offset, self:GetAngle() + 90*60, self:GetPos())
end

function ResourceStockpileBase:TestAdjacentPos(pos)
	pos = pos or self:GetAdjacentPos()
	local q, r = WorldToHex(pos)
	if not HexGetAnyObj(q, r) then --quick n dirty test for another stockpile blocking the adjacent pos, it tests pos, + near the x extremities for passability.
		if terrain.IsPassable(pos) then
			local x = (self.max_x / 2)
			local x_offset = x * self.box_diam + (x + 1) * self.spacing_x
			local p1 = RotateRadius(x_offset, self:GetAngle(), pos)
			local p2 = RotateRadius(x_offset, self:GetAngle() + 180*60, pos)
			return terrain.IsPassable(p1)
					and terrain.IsPassable(p2)
					
		end
	end
	return false
end

function ResourceStockpileBase:GetModifiedBSphereRadius(r)
	return  r
end

function ResourceStockpileBase:GetDisplayName()
	if self.resource == "WasteRock" then
		return T{694, "Waste Rock Pile"}
	else 
		return self.display_name
	end
end

function ResourceStockpileBase:GetDescription()
	if self.resource == "WasteRock" then
		return T{695, "A pile of waste rock that can be stored in a Dumping Site."}
	else 
		return self.description
	end
end

function ResourceStockpileBase:RoverWork(rover, request, resource, amount, reciprocal_req, interaction_type, total_amount)	
	--temp presentation
	rover:ContinuousTask(request, amount, "gatherStart", "gatherIdle", "gatherEnd",
	interaction_type == "load" and "Load" or "Unload",	"step", g_Consts.RCRoverTransferResourceWorkTime, "add resource", reciprocal_req, total_amount)
end

function ResourceStockpileBase:GetEmptyStorage(resource)
	return self:GetMax() * const.ResourceScale - self:GetStoredAmount()
end

function ResourceStockpileBase:InitUnderConstruction(construction)
	self:DisconnectFromCommandCenters()
	
	self.priority = construction.priority
	
	if self.has_demand_request then
		--kill demand reqs, we wna get emptied.
		local d_req = false
		if self:HasMember("demand") and self.demand then
			local _
			_, d_req = next(self.demand)
		else
			d_req = self.demand_request
		end
		
		assert(d_req)
		
		table.remove_entry(self.task_requests, d_req)
		self.demand_request = false
		if self:HasMember("demand") then
			self.demand = false
		end
		self.has_demand_request = false
	end
	
	--we have to add the execalone flag to all our supply reqs, also we should have supply reqs
	local has_supply_arr = self:HasMember("supply") and self.supply
	local exec_alone_and_special_pairing = const.rfCanExecuteAlone + const.rfSpecialDemandPairing
	assert(has_supply_arr or self.supply_request)
	if self.supply_request then
		self.supply_request:AddFlags(exec_alone_and_special_pairing)
	end
	
	if has_supply_arr then
		for _, req in pairs(self.supply) do
			req:AddFlags(exec_alone_and_special_pairing)
		end
	end
	
	if self.parent_construction then
		table.insert(self.parent_construction, construction)
	else
		self.parent_construction = { construction }
	end
	
	self:ConnectToCommandCenters()
end

function ResourceStockpileBase:OnConstructionCanceled()
	if not self.parent_construction then --no more constructions on top of us, reset to a normal state
		self:DisconnectFromCommandCenters()
		local has_supply_arr = self:HasMember("supply") and self.supply
		local exec_alone_and_special_pairing = const.rfCanExecuteAlone + const.rfSpecialDemandPairing
		assert(has_supply_arr or self.supply_request)
		
		--reset req flags to normal
		if self.supply_request then
			self.supply_request:ClearFlags(exec_alone_and_special_pairing)
		end
		
		if has_supply_arr then
			for _, req in pairs(self.supply) do
				req:ClearFlags(exec_alone_and_special_pairing)
			end
		end
		
		self.priority = 2 --normal prio for all piles.
		
		self:ConnectToCommandCenters()
	end
end

function ResourceStockpileBase:ConnectToCommandCenters()
	TaskRequester.ConnectToCommandCenters(self)
	for i = 1, #(self.parent_construction or "") do
		TaskRequester.ConnectToOtherBuildingCommandCenters(self, self.parent_construction[i])
	end
end

function ResourceStockpileBase:IsOneOfInterests(interest)
	return Service.IsOneOfInterests(self, interest)
end

---------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------
DefineClass.AutoTransportStateUIProps = {
	__parents = { "PropertyObject" },
	properties = {},
}

function AutoTransportStateUIProps:SetResourceAutoTransportationState(resource, state)
end

function AutoTransportStateUIProps:UIPropAutoTransportStateGetter(prop_id)
	return	self:HasMember(prop_id) and ResourceStatesUI[self[prop_id]].text or T{""}
end

function AutoTransportStateUIProps:UIPropAutoTransportStateSetter(prop_id, dir, resource)
	local value_idx = table.find(ResourceStatesUI, "value", self[prop_id]) + dir
	local t_idx = table.find(ResourceStatesUI, "value", value_idx)
	if not t_idx then
		if dir < 0 then
			--looking for max
			local max_val = 0
			for i = 1, #ResourceStatesUI do
				if ResourceStatesUI[i].value > max_val then
					max_val = ResourceStatesUI[i].value
					t_idx = i
				end
			end
		else
			--looking for min
			local min_val = 99999999
			for i = 1, #ResourceStatesUI do
				if ResourceStatesUI[i].value < min_val then
					min_val = ResourceStatesUI[i].value
					t_idx = i
				end
			end
		end
	end
	
	self[prop_id] = ResourceStatesUI[t_idx].value
	self:SetResourceAutoTransportationState(resource, ResourceStates[ResourceStatesUI[t_idx].value])
end

--properties for auto transport state ui hookup
for i = 1, #AllResourcesList do	
	local r_n = AllResourcesList[i]
	local prop_id = "ui_" .. r_n .. "WithButton"
	
	local the_prop = { template = true, name = Resources[r_n].display_name, id = prop_id, editor = "dropdownlist", items = ResourceStatesUI, default = ResourceStatesUI[1].value, dont_save = true }
	table.insert(AutoTransportStateUIProps.properties, the_prop)
	AutoTransportStateUIProps["Get" .. prop_id] = function(self)
		return AutoTransportStateUIProps.UIPropAutoTransportStateGetter(self, prop_id)
	end
	
	AutoTransportStateUIProps["Set" .. prop_id] = function(self, val)
		 return AutoTransportStateUIProps.UIPropAutoTransportStateSetter(self, prop_id, val, r_n)
	end
end

---------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------
--doesnt have requests, only visual pile of cubes
DefineClass.SharedStorageBaseVisualOnly = {
	__parents = { "ResourceStockpileBase" },
		properties = {
		{ template = true, name = T{696, "Max Shared Storage"},  category = "Storage Space", id = "max_shared_storage",  editor = "number", default = 120000, scale = const.ResourceScale },
		{ id = "storable_resources", editor = "table", no_edit = true },
		{ id = "StoredAmount", editor = false },
		
		{ id = "stockpiled_amount", editor = "number", default = false, no_edit = true },
	},
	storable_resources = false, --array of resources that can be stored in this depo -> {"r1", "r2"}
	has_demand_request = false,
	visual_cubes = false, --helper, to distinguish cube resource types
	auto_transportation_states = false,
	has_supply_request = false,
	
	cube_placement_angle = 0,
	
	dome_label = false,
}

function SharedStorageBaseVisualOnly:Init()
	self.placement_offset = point30
end

function SharedStorageBaseVisualOnly:CreateResourceRequests() 
	--no reqs, drones cannot interact with us.
	--init stuff.
	self.visual_cubes = { }
	self.stockpiled_amount = self.stockpiled_amount or {}
	local storable_resources = self.storable_resources
	
	for i = 1, #storable_resources do
		local resource_name = storable_resources[i]
		
		self.stockpiled_amount[resource_name] = 0
		self.visual_cubes[resource_name] = {}
		
		self["GetStored_"..resource_name]=  function(self)
			return self.stockpiled_amount[resource_name]
		end
		
		self["GetMaxAmount_"..resource_name] = self.MaxSharedStorageGetter
	end
end

function SharedStorageBaseVisualOnly:AddResource(amount, resource)
	local remaining_space = self:GetEmptyStorage()
	amount = Clamp(amount, -(self.max_shared_storage - remaining_space), remaining_space)
	
	
	self.stockpiled_amount[resource] = self.stockpiled_amount[resource] + amount
	self:SetCount(self.stockpiled_amount[resource], resource)
end

function SharedStorageBaseVisualOnly:GetEmptyStorage(resource)
	return self.max_shared_storage - self:GetStoredAmount()
end

function SharedStorageBaseVisualOnly:SetResourceAutoTransportationState(resource, state)
	self.auto_transportation_states[resource] = state
end

function SharedStorageBaseVisualOnly:GetStoredAmount(resource)
	if resource then
		return self.stockpiled_amount[resource]
	else
		local total = 0
		for k, v in pairs(self.stockpiled_amount) do
			total = total + v
		end
		
		return total
	end
end

function SharedStorageBaseVisualOnly:MaxSharedStorageGetter()
	return self.max_shared_storage
end

function SharedStorageBaseVisualOnly:ReInitBoxSpots()
	if self:HasSpot("Box") then
		self.cube_attach_spot_idx = self:GetSpotBeginIndex("Box")
	elseif self:HasSpot("Box1") then
		self.cube_attach_spot_idx = self:GetSpotBeginIndex("Box1")
	end
	
	self.placement_offset = point30
end

function SharedStorageBaseVisualOnly:SetCount(new_count, resource)
	new_count = new_count/const.ResourceScale --+ (new_count%const.ResourceScale==0 and 0 or 1)
	new_count = Max(new_count, 0)
	if not resource then return end
	
	self:ReInitBoxSpots()
	local total_cubes_of_type = #self.visual_cubes[resource]
	if total_cubes_of_type == new_count then return end
	local inc = new_count - total_cubes_of_type
	local step = new_count > total_cubes_of_type and 1 or -1

	for i = total_cubes_of_type, new_count + step * -1, step do
		if step < 0 then
			--decreasing count
			local the_cube_in_question = self.visual_cubes[resource][i]
			local idx = table.find(self.placed_cubes, the_cube_in_question)
			self.placed_cubes[idx] = false
			self.visual_cubes[resource][i] = nil
			DoneObject(the_cube_in_question)
			self:RearrangeCubes(idx)
		else
			--increasing count
			local the_cube_in_question = PlaceObject(self.cube_class, {resource = resource})
			self:Attach(the_cube_in_question, self.cube_attach_spot_idx)
			local idx = table.find(self.placed_cubes, false) or #self.placed_cubes + 1
			the_cube_in_question:SetAttachOffset(self:GetCubePosRelative(idx - 1))
			--total_cubes = total_cubes + 1
			assert(not self.placed_cubes[idx])
			self.placed_cubes[idx] = the_cube_in_question
			self.visual_cubes[resource][i + 1] = the_cube_in_question
		end
	end
	
	self.count = self.count + inc
end


function SharedStorageBaseVisualOnly:GetCubePosRelative(idx)
	return Rotate(ResourceStockpileBase.GetCubePosRelative(self, idx), self.cube_placement_angle)
end

function SharedStorageBaseVisualOnly:RearrangeCubes(removed_cube_idx)
	--rearrange cubes that might be above the removed one.
	local max = Max(self:GetMax(), #self.placed_cubes)
	local step = self.max_x * self.max_y
	local next_cube_idx = removed_cube_idx + step
	while next_cube_idx <= max do
		local next_cube = self.placed_cubes[next_cube_idx]
		if not next_cube then
			break
		else
			next_cube:SetAttachOffset(self:GetCubePosRelative(removed_cube_idx - 1))
			self.placed_cubes[removed_cube_idx] = next_cube
			self.placed_cubes[next_cube_idx] = false
			
			removed_cube_idx = removed_cube_idx + step
			next_cube_idx = next_cube_idx + step
		end
	end
end

SharedStorageBaseVisualOnly.AddDepotResource = SharedStorageBaseVisualOnly.AddResource
SharedStorageBaseVisualOnly.AddResourceAmount = SharedStorageBaseVisualOnly.AddResource
SharedStorageBaseVisualOnly.SetResourceAmount = false --not impl.
SharedStorageBaseVisualOnly.SetCountFromRequest = false --not impl.
---------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------
DefineClass.ResourceStockpile = {
	__parents = { "ResourceStockpileBase", "UngridedObstacle", "DoesNotObstructConstruction" },
	GetModifiedBSphereRadius = ResourceStockpileBase.GetModifiedBSphereRadius,
	ip_template = "ipResourcePile",
}

local current_stockpile_placement_data = false
--places all stockpiles in bulk so it can arrange them pleasantly.
function PlaceResourceStockpile_Delayed(pos, resource, amount, angle, destroy_when_empty)
	current_stockpile_placement_data = current_stockpile_placement_data or {}
	
	current_stockpile_placement_data[#current_stockpile_placement_data + 1] = {
		pos = pos,
		resource = resource,
		amount = amount,
		angle = angle + 90 * 60,
		destroy_when_empty = destroy_when_empty,
	}
	
	DelayedCall(0, ProcessPlaceStockpileCalls)
end

local soft_count_limit_boxes_per_stock = ResourceStockpileBase.GetMax(ResourceStockpileBase) --max number of boxes per stock, if total stocks are less then the hard limit
local hard_count_limit_number_of_stocks = 100

--a bunch of hacks so black cubes can be placed with the following funcs.
local resource_pile_class_override = {
	BlackCube = "BlackCubeStockpileWithSuppressedCounter",
}

local resource_pile_soft_limit_override = {
}
--late init due to path changes.
CreateRealTimeThread(function()
	resource_pile_soft_limit_override.BlackCube = ResourceStockpileBase.GetMax(BlackCubeStockpileBase)
end)

local resource_pile_width_override = {
	BlackCube = 6 * guim,
}

local function GetSoftCap(r)
	return resource_pile_soft_limit_override[r] or soft_count_limit_boxes_per_stock
end

local function GetStockpileWidth(r)
	return resource_pile_width_override[r] or ResourceStockpile.max_y * GetEntityBoundingBox(ResourceStockpileBox:GetEntity()):sizey() + (ResourceStockpile.max_y + 1) * ResourceStockpile.spacing_y
end

function ProcessPlaceStockpileCalls()
	SuspendPassEdits("ProcessPlaceStockpileCalls")
	
	local data = current_stockpile_placement_data
	current_stockpile_placement_data = false
	
	local parsed_data = {
			--{ stockpile chunk ->
			--  pos = pos, angle = angle, resource_type = total_amount, ..etc.
	}
	
	--chunk up call data into something we can work with
	for i = 1, #data do
		local entry = data[i]
		local idx = table.find(parsed_data, "pos", entry.pos)
		local created = false
		if not idx then
			idx = #parsed_data + 1
			parsed_data[idx] = {}
			created = true
		end
		local parsed_entry = parsed_data[idx]
		
		if created then
			--should be the same for all incoming entries with the same pos...
			parsed_entry.pos = entry.pos
			parsed_entry.angle = entry.angle
			parsed_entry.destroy_when_empty = entry.destroy_when_empty
			
			parsed_entry[entry.resource] = entry.amount
		else
			assert(parsed_entry.angle == entry.angle and parsed_entry.destroy_when_empty == entry.destroy_when_empty, "Cannot merge stockpiles with the same pos!")
			
			parsed_entry[entry.resource] = (parsed_entry[entry.resource] or 0) + entry.amount
		end
	end
	
	--figure out the number of piles to place per caller
	for i = 1, #parsed_data do
		local parsed_data_entry = parsed_data[i]
		local stockpiles_to_place = {}
		local stockpile_amounts = {} --[resource].amount (per stoc), [resource].remainder (last stock), [resource].to_spread (when removing stocks, this should be devided among the remaining ones)
		local total_stockpiles = 0
		for _,resource_name in ipairs(AllResourcesList) do
			local resource = resource_name
			if parsed_data_entry[resource] then
				local delim = const.ResourceScale * GetSoftCap(resource)
				stockpile_amounts[resource] = { amount = delim }
				stockpiles_to_place[resource] = parsed_data_entry[resource] / delim
				if stockpiles_to_place[resource] * delim < parsed_data_entry[resource] then
					if stockpiles_to_place[resource] == 0 then
						stockpile_amounts[resource].amount = parsed_data_entry[resource]
						stockpiles_to_place[resource] = 1
					else
						stockpile_amounts[resource].remainder = parsed_data_entry[resource] - stockpiles_to_place[resource] * delim
						stockpiles_to_place[resource] = stockpiles_to_place[resource] + 1
					end
				end
				
				total_stockpiles = total_stockpiles + stockpiles_to_place[resource]
			else
				stockpiles_to_place[resource] = 0
			end
		end
		
		
		local key
		local resource
		while total_stockpiles > hard_count_limit_number_of_stocks do
			key = next(AllResourcesList, key) or next(AllResourcesList)
			resource = AllResourcesList[key]
			if stockpile_amounts[resource].remainder then --we can get rid of the remainder first.
				stockpile_amounts[resource].to_spread = stockpile_amounts[resource].remainder
				stockpile_amounts[resource].remainder = false
			else
				stockpile_amounts[resource].to_spread = (stockpile_amounts[resource].to_spread or 0) + stockpile_amounts[resource].amount
			end
			
			stockpiles_to_place[resource] = stockpiles_to_place[resource] - 1
			total_stockpiles = total_stockpiles - 1
		end
		
		
		--now we should be able to place
		--make it so the given pos is in the middle of our piles
		local total_width = 0
		for _,resource_name in ipairs(AllResourcesList) do
			local resource = resource_name
			total_width = total_width + stockpiles_to_place[resource] * GetStockpileWidth(resource)
		end
		
		local offset_dir = Rotate(point(0, total_width), parsed_data_entry.angle)
		local total_offset = point20
		local start_pos = parsed_data_entry.pos - offset_dir / 2
		
		local placed_stocks = 0
		local last_placed_stock = false
		
		for _,resource_name in ipairs(AllResourcesList) do
			local resource = resource_name
			for j = 1, stockpiles_to_place[resource] do
				local is_last = j == stockpiles_to_place[resource]
				local to_place = stockpile_amounts[resource].amount + ((stockpile_amounts[resource].to_spread or 0) / (stockpiles_to_place[resource] * const.ResourceScale)) * const.ResourceScale
				if is_last then
					to_place = stockpile_amounts[resource].remainder or 
									to_place + parsed_data_entry[resource] - to_place * stockpiles_to_place[resource]
				end
				
				local stock = PlaceObject(resource_pile_class_override[resource] or "ResourceStockpile", {resource = resource, init_with_amount = to_place, destroy_when_empty = parsed_data_entry.destroy_when_empty, max_z = stockpile_amounts[resource].to_spread and 999 or ResourceStockpile.max_z})
				stock:SetAngle(parsed_data_entry.angle)

				local my_width = GetStockpileWidth(resource)
				offset_dir = SetLen(offset_dir, my_width / 2)
				
				stock:SetPos(start_pos + total_offset + offset_dir)
				total_offset = total_offset + offset_dir * 2
				
				placed_stocks = placed_stocks + 1
				
				if last_placed_stock then
					last_placed_stock.adjacent_stockpile = stock
				end
				last_placed_stock = stock
			end
		end
	end
	
	ResumePassEdits("ProcessPlaceStockpileCalls")
end

local stockpile_search = {
	classes = "ResourceStockpile",
	area = false,
	arearadius = 2*const.HexSize,
}
--insta places stockpile
function PlaceResourceStockpile_Instant(pos, resource, amount, angle, destroy_when_empty, max_z)
	local best_stock = false
	local other_resource_stock = false
	local pos_to_stock = {}
	stockpile_search.area = pos
	stockpile_search.exec = function(o)
		if not o:GetParent() then --don't fill stocks attached to buildings
			local opos = o:GetPos()
			pos_to_stock[xxhash(opos)] = o
			if not o.parent_construction and o.resource == resource and (o:GetStoredAmountScaled() + amount / const.ResourceScale) < GetSoftCap(resource) and (not best_stock or IsCloser2D(pos, opos, best_stock)) then
				best_stock = o
			elseif (not other_resource_stock or (other_resource_stock:GetAdjacentPos() ~= opos and IsCloser2D(pos, opos, other_resource_stock))) then
				other_resource_stock = o
			end
		end
	end
	
	ForEach(stockpile_search)
	stockpile_search.area = false
	
	--handle case where we already have a stockpile in the adjascent spot and we need its adjascent spot.
	if other_resource_stock then
		local hashed_pos
		while true do
			local next_stock = other_resource_stock.adjacent_stockpile or pos_to_stock[xxhash(other_resource_stock:GetAdjacentPos())]
			if not IsValid(next_stock) then
				break
			else
				other_resource_stock = next_stock
			end
		end
	end
	
	local did_create = false
	
	if best_stock then
		best_stock:AddResourceAmount(amount)
	else
		did_create = true
		local class = resource_pile_class_override[resource] or "ResourceStockpile"
		best_stock = PlaceObject(class, {resource = resource, init_with_amount = amount, destroy_when_empty = destroy_when_empty, max_z = max_z})
		
		if other_resource_stock then
			local t_p = other_resource_stock:GetAdjacentPos()
			angle = other_resource_stock:GetAngle()
			if other_resource_stock:TestAdjacentPos(t_p) then
				other_resource_stock.adjacent_stockpile = best_stock
				pos = t_p
			end
		end
		if angle then
			best_stock:SetAngle(angle)
		end
		best_stock:SetPos(pos)
	end
	
	return best_stock, did_create
end

-------------------

DefineClass.ResourceStockpileLR = {
	__parents = { "ResourceStockpile", "ShuttleLanding" },
}

function ResourceStockpileLR:GameInit()
	LRManagerInstance:AddBuilding(self)
end

function ResourceStockpileLR:Done()
	LRManagerInstance:RemoveBuilding(self)
end

function ResourceStockpileLR:GetTargetEmptyStorage(resource)
	return resource == self.resource and self.demand_request:GetTargetAmount() or 0
end

-------------------------------------------------------------------------------------------------------------
--helper, brute forces a place to create a new stock
function StockpileDumpSpotFilter(obj)
	return ConstructionController.BlockingUnitsFilter(obj) or IsKindOf(obj, "WasteRockObstructor") or (IsKindOf(obj, "ResourceStockpileBase") and obj:GetParent() ~= nil)
end

function StockpileDumpSpotFilterForWasteRock(obj) --wasterock piles don't stack neatly like other piles so don't ret positions with any piles in them
	return ConstructionController.BlockingUnitsFilter(obj) or IsKindOf(obj, "WasteRockObstructor") or IsKindOf(obj, "ResourceStockpileBase")
end

StockpileDumpQueryClasses = {"Unit", "WasteRockObstructor", "ResourceStockpileBase"}

function HexGetAnyObj(q, r)
	return HexGridGetObject(ObjectGrid, q, r)
end

function TryFindStockpileDumpSpot(q, r, angle, p_shape, hex_getter_override, for_waste_rock_resource)
	local hex_getter = HexGetLowBuilding
	hex_getter = hex_getter_override or hex_getter
	
	local filter = for_waste_rock_resource and StockpileDumpSpotFilterForWasteRock or StockpileDumpSpotFilter
	local classes = StockpileDumpQueryClasses
	
	local i = 1
	local count = #p_shape
	local pos = point(HexToWorld(q, r))
	local is_there_a_unit_there = HexGetUnits(nil, nil, pos, 0, true, filter, classes)
	local dir = HexAngleToDirection(angle)
	local initial_q, initial_r = q, r
	local r_q, r_r
	
	while i <= count 
			and (hex_getter(q, r) or not terrain.IsPassable(pos)
			or is_there_a_unit_there) do
		r_q, r_r = HexRotate(p_shape[i]:x(), p_shape[i]:y(), dir)
		q = initial_q + r_q
		r = initial_r + r_r
		pos = point(HexToWorld(q, r))
		is_there_a_unit_there = HexGetUnits(nil, nil, pos, 0, true, filter, classes)
		i = i + 1
	end

	return (not hex_getter(q, r) and not is_there_a_unit_there), q, r
end

-------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------
--controls N stockpiles that stockpile the SAME resource type, distributes resources evenly between all stockpiles
--the stockpiles may or may not have demand/supply requests
--currently, shared storages are unsupported.
-------------------------------------------------------------------------------------------------------------

DefineClass.StockpileController = {
	__parents = { "InitDone" },
	
	parent = false,
	next_stockpile_idx = 1,
	current_stockpile_idx_stockpiled_amount = 0,
	stockpile_spots = false, --defines where to place stockpiles, stockpile will be placed for each of the spots in this arr.
	stockpiles = false,
	total_stockpiled = 0,
	
	has_demand_request = false,
	has_supply_request = true,
	max_x = false,
	max_y = false,
	max_z = false,
	
	stockpile_class = "ResourceStockpile",
	stockpiled_resource = "Metals",
	max_storage = false,
	
	additional_stockpile_params = false,
	stock_max = 0,
}

function StockpileController:GameInit()
	self:CreateStockpiles()
end

function StockpileController:CreateStockpiles()
	local stock_max = 0
	self.stockpiles = {}
	SuspendPassEdits("CreateStockpiles")
	for i = 1, #(self.stockpile_spots or "") do
		local spot = self.stockpile_spots[i]
		if not self.parent:HasSpot(spot) then
			print("once", self.parent:GetEntity(), "doesn't have spot", spot)
			spot = "Origin"
		end
		local first, last = self.parent:GetSpotRange("idle", spot)
		for j = first, last do
			local params = {	resource = self.stockpiled_resource, 
						parent = self,
						destroy_when_empty = false, 
						has_demand_request = self.has_demand_request,
						has_supply_request = self.has_supply_request,
						max_x = self.max_x or nil,
						max_y = self.max_y or nil,
						max_z = self.max_z or nil,
					}
					
			for k, v in pairs(self.additional_stockpile_params or empty_table) do
				params[k] = v
			end
			
			local s = PlaceObject(self.stockpile_class, params)
			self.parent:Attach(s, j)
			self.stockpiles[#self.stockpiles + 1] = s
			stock_max = stock_max + s:GetMax() * const.ResourceScale
		end
	end
	ResumePassEdits("CreateStockpiles")
	self.stock_max = stock_max
end

function StockpileController:ReleaseStockpiles()
	if not self.stockpiles then return end
	for i = 1, #self.stockpiles do
		if self.stockpiles[i].count > 0 then
			self.stockpiles[i]:DisconnectFromParent()
		else
			DoneObject(self.stockpiles[i])
		end
	end
	
	self.stockpiles = false
end

function StockpileController:GetStoredAmount()
	return self.total_stockpiled
end

function StockpileController:TestStoredAmountConsistency()
	local t = 0
	for i = 1, #self.stockpiles do
		t = t + self.stockpiles[i]:GetStoredAmount()
	end
	
	if self.total_stockpiled ~= t then
		self:SetColorModifier(RGBA(255, 0, 0, 0))
		return false
	end
	
	return true
end

function StockpileController:GetNextStockpileIndex(stockpiles, look_for_least_stockpiled)
	stockpiles = stockpiles or self.stockpiles
	local lowest = Max(stockpiles[1]:GetStoredAmount(), stockpiles[1].init_with_amount)
	local lowest_idx = 1
	for i = 2, #stockpiles do
		local a = Max(stockpiles[i]:GetStoredAmount(), stockpiles[i].init_with_amount)
		if (look_for_least_stockpiled and a < lowest) or (not look_for_least_stockpiled and a > lowest) then
			lowest = a
			lowest_idx = i
		end
	end
	
	return lowest_idx
end

function StockpileController:UpdateTotalStockpile(amount, resource)
	if resource==self.stockpiled_resource then
		self.total_stockpiled = self.total_stockpiled + amount
	end
end

function StockpileController:UpdateStockpileAmounts(amount_stored)
	if not self.stockpiles or #self.stockpiles <= 0 then return end --no stockpiles, nothing to do here.
	local total_stockpiled = self.total_stockpiled
	
	local amount_to_stock = amount_stored - total_stockpiled
	
	local step_amount = Resources[self.stockpiled_resource].unit_amount
	local cs = self.current_stockpile_idx_stockpiled_amount
	
	--refresh idx so we don't go below zero
	self.next_stockpile_idx = amount_to_stock < 0 and self.stockpiles[self.next_stockpile_idx]:GetStoredAmount() <= 0 and self:GetNextStockpileIndex(self.stockpiles, false) or self.next_stockpile_idx
	
	if amount_to_stock > 0 then
		while amount_to_stock > 0 do
			local amount_to_stock_next = Max((cs + amount_to_stock) - step_amount, 0)
			amount_to_stock = Min(amount_to_stock, step_amount - cs)
			assert(amount_to_stock > 0)
			self.stockpiles[self.next_stockpile_idx]:AddResourceAmount(amount_to_stock)
			cs = cs + amount_to_stock
			total_stockpiled = total_stockpiled + amount_to_stock
			
			if cs >= step_amount then
				assert(cs == step_amount) --otherwise we messed up.
				self.next_stockpile_idx = self:GetNextStockpileIndex(self.stockpiles, true)
				cs = 0
			end
			
			amount_to_stock = amount_to_stock_next
		end
	else --- remove from stockpiles
		while amount_to_stock < 0 do
			local amount = Min(step_amount, -amount_to_stock)
			amount = cs ~= 0 and Min(cs, amount) or amount
			assert(amount > 0)
			amount_to_stock = amount_to_stock + amount
			self.stockpiles[self.next_stockpile_idx]:AddResourceAmount(-amount)
			cs = cs == 0 and step_amount - amount or cs - amount
			total_stockpiled = total_stockpiled - amount
			
			if cs <= 0 then
				assert(cs == 0)
				self.next_stockpile_idx = self:GetNextStockpileIndex(self.stockpiles, false)
			end
		end
	end
	
	assert(amount_to_stock == 0)
	self.current_stockpile_idx_stockpiled_amount = cs	
	self.total_stockpiled = total_stockpiled
end