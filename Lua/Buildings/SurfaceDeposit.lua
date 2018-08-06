SurfaceDeposits = {"Concrete", "Metals", "Polymers" }
for i=1,#SurfaceDeposits do
	SurfaceDeposits[SurfaceDeposits[i]] = true
end

local DepositEntities = {
	Metals = {
		"SurfaceDepositMetals_01",
		"SurfaceDepositMetals_02",
		--"SurfaceDepositMetals_03", --those bug out
		--"SurfaceDepositMetals_04",
		--"SurfaceDepositMetals_05",
	},

	Concrete = {
		"SurfaceDepositConcrete_01",
		"SurfaceDepositConcrete_02",	
		"SurfaceDepositConcrete_03",	
		"SurfaceDepositConcrete_04",	
		"SurfaceDepositConcrete_05",	
	},

	Polymers = {
		"SurfaceDepositPolymers_01", 
		"SurfaceDepositPolymers_02",
		"SurfaceDepositPolymers_03",
		"SurfaceDepositPolymers_04",
		"SurfaceDepositPolymers_05",
	},
}

local function GetDepositVariationsCombo(deposit)	
	local items = table.copy(DepositEntities[deposit.resource] or empty_table)
	items[#items+1] = "random"
	return items
end

-----------------------------------------------------------------------------------------
DefineClass.SurfaceDepositMarker = {
	__parents = { "DepositMarker" },
	properties = {
		{ category = "Deposit", name = T{15, "Resource"},               id = "resource",        editor = "combo",  default = "Metals", items = SurfaceDeposits, object_update = true, },		
		{ category = "Deposit", name = T{803, "Max Drones"},             id = "max_drones",      editor = "number", default = 5, min = 1, max = 100 },
		{ category = "Deposit", name = T{804, "Deposit Entity Variant"}, id = "entity_variant",  editor = "combo",  default = "random", items = function(deposit) return GetDepositVariationsCombo(deposit) end},
	},
}

function SurfaceDepositMarker:GetEstimatedAmount()
	local range = DepositsDefaultAmountRange[self.resource]
	return range and ((range.from + range.to) / 2) or 0
end

function SurfaceDepositMarker:OnPropertyChanged(prop_id)
	if prop_id == "resource" then
		self:PostLoad()
	end
end

function SurfaceDepositMarker:PostLoad(resource)
	if self.entity_variant == "random" or not table.find(DepositEntities[self.resource], self.entity_variant) then
		self:Setentity_variant("random")
	else
		self:Setentity_variant(self.entity_variant)
	end	
end

function SurfaceDepositMarker:Setentity_variant(entity_variant)
	self.entity_variant = entity_variant
	if self.entity_variant == "random" then
		self:ChangeEntity("Hex1_Placeholder")
		self:SetColorModifier(Resources[self.resource].color)
	else
		self:ChangeEntity(self.entity_variant)
		self:SetColorModifier(const.clrNoModifier)
	end
end

function SurfaceDepositMarker:SpawnDeposit()
	local classname = "SurfaceDeposit" .. self.resource
	if not g_Classes[classname] then
		StoreErrorSource("silent", self, "Trying to place non-existing surface deposit:", classname)
		return
	end
	
	local dep = PlaceObject(classname, {
		max_drones = self.max_drones,
		entity_variant = self.entity_variant,
	})
	dep:SetCollectionIndex(self:GetCollectionIndex())
	return dep
end

------------------------------------------------------------
DefineClass.SurfaceDeposit = {
	__parents = { "TaskRequester", "Shapeshifter", "AutoAttachObject", "Deposit", "UngridedObstacle", "SyncObject" },
	game_flags = { gofTemporalConstructionBlock = true },
	properties = {
		{ category = "Deposit", name = T{803, "Max Drones"}, id = "max_drones", editor = "number", default = 5, min = 1, max = 100 },
		{ category = "Deposit", name = T{804, "Deposit Entity Variant"},id = "entity_variant", editor = "combo", default = "random", items = function(deposit) return GetDepositVariationsCombo(deposit) end},
	},
	max_amount = 0,
	display_name = T{805, "<resource(resource)> Surface Deposit"},
	display_icon = "UI/Icons/bmb_demo.tga",
	instant_build = true,
	supply_dist_modifier = 1500, -- surface deposits are considered 50% further than storages
	transport_request = false, 
	priority = 0,
	
	entity = "Hex1_Placeholder",
	
	-- pin section
	pin_rollover = T{806, "<description><newline><newline><ResourceName><right><resource(Amount,max_amount,resource)>"},
	pin_progress_value = "Amount",
	pin_progress_max = "max_amount",
	
	city_label = "SurfaceDeposit",
	ip_template = "ipSurfaceDeposit",
	auto_connect = true,
}

function SurfaceDeposit:UpdateNotWorkingBuildingsNotification()
end

SurfaceDeposit.DoesHaveSupplyRequestForResource = ResourcePile.DoesHaveSupplyRequestForResource

function SurfaceDeposit:CreateResourceRequests()
	self.transport_request = self:AddSupplyRequest(self.resource, self.max_amount, 0, self.max_drones)
end

function SurfaceDeposit:Init()
	self:Setentity_variant(self.entity_variant)
	self:SetOpacity(IsEditorActive() and 0 or 100)
	
	local range = DepositsDefaultAmountRange[self.resource]
	self.max_amount = (range.from + self:Random(range.to - range.from)) * const.ResourceScale
end

GlobalVar("SurfaceDepositGroups", {})

function SurfaceDeposit:GameInit()
	local col_idx = self:GetCollectionIndex()
	if col_idx == 0 then
		return
	end
	local group = SurfaceDepositGroups[col_idx]
	if not group then
		group = {}
		SurfaceDepositGroups[col_idx] = group
	end
	group[#group + 1] = self
	group[self] = true
end

function SurfaceDeposit:Done()
	local group = self:GetDepositGroup()
	if group and group[self] then
		table.remove_entry(group, self)
		group[self] = nil
		if IsValid(group.holder) then
			if #group == 0 then
				DoneObject(group.holder)
				group.holder = nil
			else
				group.holder:UpdateDimension()
			end
		end
	end
end

function SurfaceDeposit:GetDepositGroup()
	local col_idx = IsValid(self) and self:GetCollectionIndex() or 0
	return col_idx ~= 0 and SurfaceDepositGroups[col_idx]
end

function SurfaceDeposit:EditorEnter()
	self:SetOpacity(30)
end

function SurfaceDeposit:EditorExit()
	self:SetOpacity(100)
end

function SurfaceDeposit:Setmax_amount(val)
	self.transport_request:SetAmount(val)
	self.max_amount = val
end

function SurfaceDeposit:Setentity_variant(entity_variant)
	self.entity_variant = entity_variant
	if entity_variant == "random" then
		if self.resource then
			local variants = DepositEntities[self.resource]
			local entity = variants[1 + InteractionRand(#variants)]
			self:ChangeEntity(entity) --since entites determine mining positions, this should be synced.
			self.force_fx_work_target = entity
		end
	else
		self:ChangeEntity(entity_variant)
		self.force_fx_work_target = entity_variant
	end
	AutoAttachObjectsToShapeshifter(self)
end

function SurfaceDeposit:CheatRefill()
	self.transport_request:AddAmount(10000)
end

function SurfaceDeposit:CheatEmpty()
	self.transport_request:SetAmount(0)
end

function SurfaceDeposit:IsDepleted()
	return self.transport_request:GetActualAmount() <= 0
end

function SurfaceDeposit:DroneApproach(drone, resource)
	return drone:GotoBuildingSpot(self, drone.work_spot_deposit)
end

function SurfaceDeposit:GetModifiedBSphereRadius(r)
	return r
end

function SurfaceDeposit:Refresh()
	if not IsValid(self) then return end
	if self:IsDepleted() then
		DoneObject(self)
	end
end

function SurfaceDeposit:DroneLoadResource(drone, request, resource, amount)
	drone:StartFX("Gather", self)
	local tEnd = GameTime() + g_Consts.DroneGatherResourceWorkTime - drone:GetAnimDuration("gatherEnd")
	drone:PlayState("gatherStart")
	drone:SetState("gatherIdle", const.eDontCrossfade)
	while tEnd - GameTime() >= 0 and not self:IsDepleted() do
		Sleep(1000)
	end
	drone:StopFX()
	drone:PlayState("gatherEnd")

	drone.city:OnResourceGathered(resource, amount)
	Msg("ResourceExtracted", resource, amount)

	self:Refresh()
end

function SurfaceDeposit:RoverWork(rover, request, resource, amount, reciprocal_req, interaction_type, total_amount)
	local work_time = g_Tutorial and g_Tutorial.RoverGatherResourceWorkTime or g_Consts.RCTransportGatherResourceWorkTime
	rover:PushDestructor(function(rover)
		self:Refresh()
	end)
	rover:ContinuousTask(
		request, amount,
		"gatherStart", "gatherIdle", "gatherEnd",
		"Gather",	"step", work_time, "add resource", nil, total_amount
	)
	rover:PopAndCallDestructor()
end

function SurfaceDeposit:GetAmount()
	return self.transport_request:GetActualAmount()
end

function SurfaceDeposit:GetPriority()
	return self.priority
end

function SurfaceDeposit:Select()
	SelectObj(self)
	local grp = self:GetDepositGroup()
	local hld = grp and grp.holder
	ViewObjectMars(hld and hld:GetPos() or self:GetPos())
end

DefineClass("SurfaceDepositMetals",
{ __parents = {"SurfaceDeposit"},
	resource = "Metals",
	display_icon = "UI/Icons/Buildings/deposit_metal.tga",
	display_name = T{811, "Metals Deposit"},
	description = T{812, "Scattered Metals. Harvested by Drones or RC Transports."},	
})

DefineClass("SurfaceDepositConcrete",
{ __parents = {"SurfaceDeposit"},
	resource = "Concrete",
	display_icon = "UI/Icons/Buildings/deposit_concrete.tga",
	display_name = T{813, "Regolith Deposit"},
	description = T{814, "Sulfur-rich regolith. Processed into Concrete by a Concrete Extractor"},
})

DefineClass("SurfaceDepositPolymers",
{ __parents = {"SurfaceDeposit"},
	resource = "Polymers",
	display_icon = "UI/Icons/Buildings/deposit_polymers.tga",
	display_name = T{815, "Polymers Deposit"},
	description = T{816, "Scattered Polymers. Harvested by Drones or RC Transports."},
})

----

DefineClass.SurfaceDepositGroup = {
	__parents = { "Deposit", "FXObject" },
	enum_flags = { efWalkable = false, efCollision = false, efApplyToGrids = false },
	group = "",
	max_amount = 0,
	radius_max = 0,
	ip_template = "ipSurfaceDeposit",
}

function SurfaceDepositGroup:Init()
	self:UpdateDimension()
	local group = self.group
	local max_amount = 0
	for i=1,#group do
		max_amount = max_amount + group[i].max_amount
	end
	self.max_amount = max_amount
end

function SurfaceDepositGroup:UpdateDimension()
	if #self.group ~= 0 then
		local bbox = GetObjectsBBox(self.group)
		local pos, radius = bbox:Center(), bbox:Radius2D()
		self:SetPos(pos)
		self.radius_max = radius
		--DbgAddCircle(pos, radius)
	end
end

function SurfaceDepositGroup:GetAmount()
	local group = self.group
	local amount = 0
	for i=1,#group do
		amount = amount + group[i]:GetAmount()
	end
	return amount
end

function SurfaceDepositGroup:GetPriority()
	local deposit = self.group[1]
	return deposit and deposit:GetPriority() or 0
end

function SurfaceDepositGroup:GetUIPriority()
	local deposit = self.group[1]
	return deposit and deposit:GetUIPriority()
end

function SurfaceDepositGroup:TogglePriority(change)
	local group = self.group
	for i=1,#group do
		group[i]:TogglePriority(change)
	end
	RebuildInfopanel(self)
end

function SurfaceDepositGroup:CheatRefill()
	local group = self.group
	for i=1,#group do
		group[i].transport_request:AddAmount(10000)
	end
end

function SurfaceDepositGroup:CheatEmpty()
	local group = self.group
	for i=1,#group do
		group[i].transport_request:SetAmount(0)
	end
end

function SurfaceDepositGroup:GetSelectionRadiusScale()
	return MulDivRound(100, self.radius_max, 5*guim)
end

function OnMsg.SelectedObjChange(obj, prev)
	if IsKindOf(obj, "SurfaceDeposit") then
		local group = obj:GetDepositGroup() or ""
		if #group == 0 then
			return
		end
		local holder = group.holder
		if not IsValid(holder) then
			holder = SurfaceDepositGroup:new{
				group = group,
				resource = obj.resource,
				display_name = obj.display_name,
				display_icon = obj.display_icon,
				description = obj.description,
				pin_rollover = obj.pin_rollover,
				pin_progress_value = obj.pin_progress_value,
				pin_progress_max = obj.pin_progress_max,
			}
			group.holder = holder
		end
		SelectObj(holder)
	end
end