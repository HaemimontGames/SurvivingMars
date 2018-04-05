DefineClass.StorageDepot = {
	__parents = { "Building", "ResourceStockpileBase", "ShuttleLanding", "AutoTransportStateUIProps", },
	game_flags = { gofPermanent = true },

	properties = {
		-- add dont_save specifically for this class, as it has a Get function 
		{ template = true, name = T{765, "Pin Rollover"}, id = "pin_rollover", category = "Pin",  editor = "text", default = "", translate = true, dont_save = true},
		{ template = true, category = "Demolish", name = T{175, "Use demolished state?"}, id = "use_demolished_state", editor = "bool", default = false, object_update = true },
		{ template = true, category = "Storage Space", name = T{8054, "Ignored by shuttles"}, id = "exclude_from_lr_transportation", editor = "bool", default = false },
	},
	entity = false,

	description = false,
	display_name = false,
	GetDisplayName = Building.GetDisplayName,
	
	max_x = 12,
	max_y = 5,
	max_z = 5,
	
	spacing_x = 13*guic,
	spacing_y = 16*guic,
	spacing_z = 1*guic,
	
	demand = false,
	supply = false,

	has_demand_request = false,
	has_supply_request = false,
	
	GetShapePoints = GridObject.GetShapePoints,
	
	auto_transportation_state = "Auto",
	
	--Storage depots do not accumulate dust (bug:0118697)
	accumulate_dust = false,
	maintenance_resource_type = "no_maintenance", --doesnt require maintenance.
	accumulate_maintenance_points = false,
	
	landing_spot_name = "Workshuttle",
	prio_button = false,
	on_off_button = false,
	min_threshold_amount = 0,
	
	OnCommandCenterWorkingChanged = Building.OnCommandCenterWorkingChanged,
	OnAddedByControl = Building.OnAddedByControl,
	OnRemovedByControl = Building.OnRemovedByControl,
}

function StorageDepot:GameInit()
	if not self.exclude_from_lr_transportation then
		LRManagerInstance:AddBuilding(self)
	end
end

function StorageDepot:AddToCityLabels()
	Building.AddToCityLabels(self)
end

function StorageDepot:SetResourceAutoTransportationState(resource, state)
	self.auto_transportation_state = state
end

function StorageDepot:CreateResourceRequests()
	Building.CreateResourceRequests(self)
	self.demand = {}
	self.supply = {}
	for _, resource_name in ipairs(AllResourcesList) do
		local max_name = "max_amount_"..resource_name
		if self:HasMember(max_name) then
			local demand = self:AddDemandRequest(resource_name, self[max_name], const.rfStorageDepot)
			local supply = self:AddSupplyRequest(resource_name, 0, const.rfStorageDepot + const.rfPairWithHigher)
			self.demand[resource_name] = demand
			self.supply[resource_name] = supply
		
			self["GetStored_"..resource_name]=  function(self)
				return self.supply[resource_name]:GetActualAmount()
			end
			self["GetMaxAmount_"..resource_name]= function(self)
				return self[max_name]
			end
		end
	end
end

function StorageDepot:AddDepotResource(resource, amount)
	self.supply[resource]:AddAmount(amount)
	self.demand[resource]:AddAmount(-amount)
	self:SetCount(self.supply[resource]:GetActualAmount())
end

StorageDepot.AddResource = StorageDepot.AddDepotResource

function StorageDepot:DroneLoadResource(drone, request, resource, amount)
	if self.supply[resource] == request then
		self.demand[resource]:AddAmount(amount)
		self:SetCount(self.supply[resource]:GetActualAmount())
	end
end

function StorageDepot:DroneUnloadResource(drone, request, resource, amount)
	Building.DroneUnloadResource(self, drone, request, resource, amount)
	if self.demand[resource] == request then
		self.supply[resource]:AddAmount(amount)
		self:SetCount(self.supply[resource]:GetActualAmount())
	end
end

function StorageDepot:InitInside(dome)
	Building.InitInside(self, dome)
	ResourceStockpileBase.InitInside(self, dome)
end

function StorageDepot:InitOutside()
	Building.InitOutside(self)
	ResourceStockpileBase.InitOutside(self)
end

StorageDepot.MoveInside = Building.MoveInside

function StorageDepot:ReturnStockpiledResources()
	local pos = self:GetVisualPos()
	if pos ~= InvalidPos() then
		for resource_flag, request in pairs(self.supply) do
			local amount = request:GetActualAmount()
			if amount > 0 then
				PlaceResourceStockpile_Delayed(pos, resource_flag, amount, self:GetAngle(), true)
			end
		end
	end
	
	self:ClearAllResources()
end

function StorageDepot:Done() --should this be in building::returnresources?
	if not self.exclude_from_lr_transportation then
		LRManagerInstance:RemoveBuilding(self)
	end
	self:ReturnStockpiledResources()
end

function StorageDepot:RoverWork(rover, request, resource, amount, reciprocal_req, interaction_type, total_amount)
	Building.RoverWork(self, rover, request, resource, amount)
	if resource ~= "clean" and resource ~= "repair" then
		--temp presentation
		rover:ContinuousTask(request, amount, "gatherStart", "gatherIdle", "gatherEnd",
		interaction_type == "load" and "Load" or "Unload",	"step", g_Consts.RCRoverTransferResourceWorkTime, "add resource", reciprocal_req, total_amount)
	end
end

function StorageDepot:CheatFill() 
	local resource = self.resource
	if self.supply[resource] then
		local max_name = "max_amount_"..resource
		self.supply[resource]:SetAmount(self[max_name])
		self.demand[resource]:SetAmount(0)
	end
	self:SetCount(self.supply[resource]:GetActualAmount())
end

function StorageDepot:CheatEmpty() 
	local resource = self.resource
	if self.supply[resource] then
		local max_name = "max_amount_"..resource
		self.supply[resource]:SetAmount(0)
		self.demand[resource]:SetAmount(self[max_name])
	end
	self:SetCount(self.supply[resource]:GetActualAmount())
end

function StorageDepot:GetStoredAmount(resource)
	local req = not resource and self.supply[next(self.supply)] or self.supply[resource]
	return req and req:GetActualAmount() or 0
end

function StorageDepot:GetEmptyStorage(resource)
	return self.demand[resource]:GetActualAmount()
end

function StorageDepot:GetTargetEmptyStorage(resource)
	return self.demand[resource]:GetTargetAmount()
end

function StorageDepot:Getui_Concrete() return T{766, "Concrete<right><concrete(Stored_Concrete,MaxAmount_Concrete)>", self} end
function StorageDepot:Getui_Metals() return T{767, "Metals<right><metals(Stored_Metals,MaxAmount_Metals)>", self} end
function StorageDepot:Getui_Polymers() return T{768, "Polymers<right><polymers(Stored_Polymers,MaxAmount_Polymers)>", self} end
function StorageDepot:Getui_Food() return T{769, "Food<right><food(Stored_Food,MaxAmount_Food)>", self} end
function StorageDepot:Getui_Electronics() return T{770, "Electronics<right><electronics(Stored_Electronics,MaxAmount_Electronics)>", self} end
function StorageDepot:Getui_MachineParts() return T{771, "Machine Parts<right><machineparts(Stored_MachineParts,MaxAmount_MachineParts)>", self} end
function StorageDepot:Getui_PreciousMetals() return T{772, "Rare Metals<right><preciousmetals(Stored_PreciousMetals,MaxAmount_PreciousMetals)>", self} end
function StorageDepot:Getui_Fuel() return T{773, "Fuel<right><fuel(Stored_Fuel,MaxAmount_Fuel)>", self} end

DefineClass.UniversalStorageDepot = {
	__parents = { "StorageDepot" },
	properties = {
		{ template = true, name = T{774, "Max Storage Per Resource"},  category = "Storage Space", id = "max_storage_per_resource",  editor = "number", default = 30000, scale = const.ResourceScale },
		{ template = true, name = T{775, "Max Boxes On The X Axis"}, category = "Storage Space", id = "max_x", editor = "number", default = 2, help = "Max amount of boxes per axis, for multiple resources its per resource type."},
		{ template = true, name = T{7626, "Max Boxes On The Y Axis"}, category = "Storage Space", id = "max_y", editor = "number", default = 5, help = "Max amount of boxes per axis, for multiple resources its per resource type." },
		{ template = true, name = T{7627, "Max Boxes On The Z Axis"}, category = "Storage Space", id = "max_z", editor = "number", default = 3, help = "Max amount of boxes per axis, for multiple resources its per resource type." },
		{ template = true, name = T{776, "Storable Resources"}, category = "Storage Space", id = "storable_resources", editor = "table", default = {"Concrete",  "Food", "Metals", "PreciousMetals","Polymers","Electronics", "MachineParts", "Fuel"}, help = "The type of resources this depot can store."},
		{ template = true, name = T{777, "Switch Fill Order"}, category = "Storage Space", id = "switch_fill_order", editor = "bool", default = true, help = "When true will fill in x of the spot dir first then y, the opposite when false."},
		{ template = true, name = T{7770, "Fill Group Idx"}, category = "Storage Space", id = "fill_group_idx", editor = "number", default = 5, help = "When true will fill in x of the spot dir first then y, the opposite when false."},
		
		{ id = "StoredAmount", editor = false },
		{ id = "stockpiled_amount", editor = "number", default = false, no_edit = true },
	},
	
	visual_cubes = false, --helper, to distinguish cube resource types
	auto_transportation_states = false,
	
	supply_r_flags = const.rfStorageDepot,
	demand_r_flags = const.rfStorageDepot + const.rfSpecialSupplyPairing,
	
	has_demand_request = true,
	has_supply_request = true,
	
	interest1 = false,
	interest2 = false,
	interest3 = false,
	interest4 = false,
	
	placed_cubes = false,
	counters = false,
}

function UniversalStorageDepot:Init()
	self.placement_offset = {}
end
	
function UniversalStorageDepot:GameInit()
	local len = #self.storable_resources
	for i = 1, len do
		local resource_name = self.storable_resources[i]
		local s_name = "Box" .. i
		if not self:HasSpot(s_name) and len == 1 and self:HasSpot("Box") then
			s_name = "Box"
		end
		
		self.placement_offset[resource_name] = GetEntitySpotPos(self:GetEntity(), self:GetSpotBeginIndex(s_name))
		
		local amount = (self.stockpiled_amount[resource_name] or 0)
		self:SetCount(amount, resource_name)
	end
	
	self.resource = self.storable_resources
	
	if self.class == "UniversalStorageDepot" then
		HintDisable("HintStorageDepot")
	end
end

function UniversalStorageDepot:SetCount(new_count, resource)
	new_count = Clamp(new_count, 0, self.max_storage_per_resource)
	new_count = new_count / const.ResourceScale
	resource = resource or self.resource[1]
	local placed_cubes = self.visual_cubes[resource]
	local counters = self.counters or {}
	local count = counters[resource] or #placed_cubes
	if count == new_count then
		return
	end
	counters[resource] = new_count
	self.counters = counters
	return self:SetCountInternal(new_count, count, resource, placed_cubes, self.placement_offset[resource], -90*60, 0)
end

function UniversalStorageDepot:CreateResourceRequests()
	Building.CreateResourceRequests(self)
	local storable_resources = self.storable_resources
	assert(storable_resources, "Shared Storage Depot cannot initialize properly!")
	self.demand = {}
	self.supply = {}
	self.visual_cubes = { }
	self.auto_transportation_states = {}
	self.stockpiled_amount = self.stockpiled_amount or {}
	local total_stored = 0
	
	for i = 1, #storable_resources do
		local resource_name = storable_resources[i]
		
		local amount = (self.stockpiled_amount[resource_name] or 0)
		local supply = self:AddSupplyRequest(resource_name, amount, bor(self.supply_r_flags, self.additional_supply_flags))
		local demand = self:AddDemandRequest(resource_name, self.max_storage_per_resource - amount, self.demand_r_flags + self.additional_demand_flags)
		self.supply[resource_name] = supply
		self.demand[resource_name] = demand
		self.auto_transportation_states[resource_name] = ResourceStates[1]
		self.visual_cubes[resource_name] = {} --use name as key, in case we need the arr part of the table for something clever
		total_stored = total_stored + amount
		
		
		self["GetStored_"..resource_name]=  function(self)
			return self.supply[resource_name]:GetActualAmount()
		end
		
		self["GetMaxAmount_"..resource_name] = function(self)
			return self.max_storage_per_resource
		end
	end
end

function UniversalStorageDepot:GetMaxStorage(resource)
	if resource then
		return self["GetMaxAmount_"..resource](self)
	else
		return #self.storable_resources * self.max_storage_per_resource
	end
end

--cpy paste from SharedStorageBaseVisualOnly
function UniversalStorageDepot:GetStoredAmount(resource)
	if resource then
		return self.stockpiled_amount[resource] or 0
	else
		local total = 0
		for k, v in pairs(self.stockpiled_amount) do
			total = total + v
		end
		
		return total
	end
end
function UniversalStorageDepot:IsFull()
	return self:GetStoredAmount()>=self:GetMaxStorage()
end

function UniversalStorageDepot:SetResourceAutoTransportationState(resource, state)
	self.auto_transportation_states[resource] = state
end

function UniversalStorageDepot:AddResource(amount, resource)
	self.supply[resource]:AddAmount(amount)
	self.demand[resource]:AddAmount(-amount)
	
	self.stockpiled_amount[resource] = (self.stockpiled_amount[resource] or 0) + amount
	self:SetCount(self.supply[resource]:GetActualAmount(), resource)
	RebuildInfopanel(self)
end

UniversalStorageDepot.AddDepotResource = UniversalStorageDepot.AddResource
UniversalStorageDepot.AddResourceAmount = UniversalStorageDepot.AddResource
UniversalStorageDepot.SetResourceAmount = false --not impl.
UniversalStorageDepot.SetCountFromRequest = false --not impl.

function UniversalStorageDepot:DroneLoadResource(drone, request, resource, amount, skip_presentation)
	if self.supply[resource] == request then
		if not skip_presentation then
			--presentation
			drone:Face(self:GetPos(), 100)
			drone:StartFX("Pickup", resource) --resource to string
			drone:SetState("interact")
			Sleep(500)
			drone:StopFX()
			if not IsValid(self) or not IsValid(drone) then
				return
			end
		end
		--not presentation
		self.demand[resource]:AddAmount(amount)
		self.stockpiled_amount[resource] = self.stockpiled_amount[resource] - amount
		self:SetCount(self.supply[resource]:GetActualAmount(), resource)
		RebuildInfopanel(self)
	end
end

function UniversalStorageDepot:DroneUnloadResource(drone, request, resource, amount)
	Building.DroneUnloadResource(self, drone, request, resource, amount)
	if self.demand[resource] == request then
		self.supply[resource]:AddAmount(amount)
		self.stockpiled_amount[resource] = (self.stockpiled_amount[resource] or 0) + amount
		self:SetCount(self.supply[resource]:GetActualAmount(), resource)
		RebuildInfopanel(self)
	end
end

function UniversalStorageDepot:IsResourceEnabled(res_id)
	local req = self.demand[res_id]
	assert(req)
	return table.find(self.task_requests, req)
end

function UniversalStorageDepot:ToggleAcceptResource(res_id)
	if not IsValid(self) then return end
	local req = self.demand[res_id]
	local s_req = self.supply[res_id]
	assert(req)
	local task_requests = self.task_requests
	if not self.exclude_from_lr_transportation then
		LRManagerInstance:RemoveBuilding(self)
	end
	if table.find(task_requests, req) then
		self:InterruptDrones(nil,function(drone) return drone.d_request==req and drone end)
		self:DisconnectFromCommandCenters()
		table.remove_entry(self.task_requests, req)
		s_req:AddFlags(const.rfPostInQueue)
		s_req:ClearFlags(const.rfStorageDepot)
	else
		self:DisconnectFromCommandCenters()
		table.insert(self.task_requests, req)
		s_req:ClearFlags(const.rfPostInQueue)
		s_req:AddFlags(const.rfStorageDepot)
	end
	if not self.exclude_from_lr_transportation then
		LRManagerInstance:AddBuilding(self)
	end	
	self:ConnectToCommandCenters()
end

function UniversalStorageDepot:GetIPTextColor(res_id)
	return self:IsResourceEnabled(res_id) and RGBA(233, 242, 255, 255) or RGBA(255, 69, 38, 255)
end

function OpenBaseResourcesSelector(context, idx, ctrl)
	context.resources_type = "base"
	OpenInfopanelItems(context, ctrl)
end

function OpenAdvancedResourcesSelector(context, idx, ctrl)
	context.resources_type = "advance"
	OpenInfopanelItems(context, ctrl)
end

function UniversalStorageDepot:CheatFill()
	local storable_resources = self.storable_resources
	local resource_count = #storable_resources
	
	self:InterruptDrones(nil, function(drone)
										local r = drone.d_request
										if r then
											if self.demand[r:GetResource()] == r then
												return drone
											end
										end
									end)
	
	for i = 1, resource_count do
		local resource_name = storable_resources[i]
		
		if self.supply[resource_name] then
			local a = self.demand[resource_name]:GetActualAmount()
			self:AddResource(a, resource_name)
		end
	end
end

function UniversalStorageDepot:ClearAllResources()
	local storable_resources = self.storable_resources
	local resource_count = #storable_resources
	
	for i = 1, resource_count do
		local resource_name = storable_resources[i]
		
		if self.supply[resource_name] then
			self.supply[resource_name]:SetAmount(0)
			self.demand[resource_name]:SetAmount(self.max_storage_per_resource)
			self.stockpiled_amount[resource_name] = 0
			self:SetCount(0, resource_name)
		end
	end
end

UniversalStorageDepot.CheatEmpty = UniversalStorageDepot.ClearAllResources

function UniversalStorageDepot:GetEmptyStorage(resource)
	if not resource then
		return self:GetMaxStorage() - self:GetStoredAmount()
	else
		return	self.demand[resource]:GetActualAmount()
	end
end

function UniversalStorageDepot:TestReqConsistency()
	for resource, s_req in pairs(self.supply) do
		local total = self:GetMaxStorage(resource)
		--assert(s_req:GetActualAmount() + self.demand[resource]:GetActualAmount() == total)
		
		if s_req:GetActualAmount() + self.demand[resource]:GetActualAmount() ~= total then
			self:SetColorModifier(RGBA(255,0,0,0))
			return false
		end
	end
	
	return true
end

function dbg_TestMapDepots()
	ForEach{class = "UniversalStorageDepot", area = "realm", exec = function(o) o:TestReqConsistency() end, }
end

DefineClass.MysteryDepot = {
	__parents = { "UniversalStorageDepot" },
}

function MysteryDepot:GetDisplayName()
	return MysteryDepot.Getdisplay_name(self)
end

function MysteryDepot:GetDescription()
	return MysteryDepot.Getdescription(self)
end

function MysteryDepot:GetIPDescription()
	return MysteryDepot.Getdescription(self)
end

function MysteryDepot:Getdescription()
	local m = UICity.mystery or MysteryBase
	return m.depot_description
end

function MysteryDepot:Getdisplay_name()
	local m = UICity.mystery or MysteryBase
	return m.depot_display_name
end

function MysteryDepot:Getdisplay_name_pl()
	local m = UICity.mystery or MysteryBase
	return m.depot_display_name_pl
end