

---- Tech_Effect -- used as parent to specify that this effect is available in technologies

DefineClass.Tech_Effect = { 
	__parents = { "ModEffect" },
}

function Tech_Effect:OnDataLoaded(parent)
end

----- Effect_Code

DefineClass.Effect_Code = {
	__parents = { "Tech_Effect" },
	properties = {
		{ category = "General", id = "OnInitEffect", editor = "func", params = "self, city, parent", max_lines = 60, 
			name = T(1000725, "OnInitEffect"), help = T(1000726, "Called early during the player setup - player structures not fully inited."), },
		{ category = "General", id = "OnApplyEffect", editor = "func", params = "self, city, parent", max_lines = 60,
			name = T(1000727, "OnApplyEffect"), help = T(1000728, "Called when the effect needs to be applied."), },
	},
	EditorName = "Code effect",
}


----- Effect_TechUnlockBuilding

DefineClass.Effect_TechUnlockBuilding = {
	__parents = { "Tech_Effect" },
	properties = {
		{ category = "General", id = "Building",     name = "Building",         editor = "choice", default = "", items = function() return BuildingsCombo() end, editor_update = true },
		{ category = "General", id = "HideBuilding", name = "Hide Building",    editor = "bool",         default = false,  },
	},
	EditorName = "UnlockBuilding",
	Description = T(8781, "<Building>"),
}

function Effect_TechUnlockBuilding:OnDataLoaded(parent)
	local building = self.Building
	local requirements = BuildingTechRequirements[building] or {}
	BuildingTechRequirements[building] = requirements
	if parent then
		requirements[#requirements + 1] = { tech = parent.id, hide = self.HideBuilding }
	end
end


----- Effect_Funding

DefineClass.Effect_Funding = {
	__parents = { "Tech_Effect" },
	properties = {
		{ category = "General", id = "Funding", name = "Funding (M)", editor = "number", default = 0 },
		{ category = "General", id = "Reason", name = "Reason", editor = "combo", default = "", items = function() return FundingSourceCombo() end },
	},
	EditorName = "Funding",
	Description = T(8782, "<Funding>"),
}

function Effect_Funding:OnApplyEffect(city)
	city:ChangeFunding(self.Funding * 1000000, self.Reason)
end


----- Effect_TechBoost

DefineClass.Effect_TechBoost = {
	__parents = { "Tech_Effect" },
	properties = {
		{ category = "General", id = "Field", name = "Field", editor = "choice", default = "", items = function() return ResearchFieldsCombo() end },
		{ category = "General", id = "Percent", name = "Boost (%)", editor = "number", default = 0, },
	},
	EditorName = "Boost research",
	Description = T(8783, "<u(Field)> <opt_percent(Percent)>"),
}

function Effect_TechBoost:OnApplyEffect(city)
	city:BoostTechField(self.Field, self.Percent)
end


local function UpgradeIdListCombo()
	local items = GetUpgradeIdList()
	items = table.get_unique(items)
	table.sort(items)
	table.insert(items, 1, "")
	return items
end

----- Effect_UnlockUpgrade

DefineClass.Effect_UnlockUpgrade = {
	__parents = { "Tech_Effect" },
	properties = {
		{ category = "General", id = "Upgrade", name = "Upgrade", editor = "choice", default = "", items = function() return UpgradeIdListCombo() end },
	},
	EditorName = "Unlock upgrade",
	Description = T(8784, "<u(Upgrade)>"),
}

function Effect_UnlockUpgrade:OnApplyEffect(city)
	city:UnlockUpgrade(self.Upgrade)
end


----- Effect_ModifyUpgrade

DefineClass.Effect_ModifyUpgrade = {
	__parents = { "Tech_Effect" },
	properties = {
		{ category = "General", id = "Upgrade", editor = "choice", default = "", items = function() return UpgradeIdListCombo() end },
		{ category = "General", id = "Prop", name = "Property", editor = "combo",  default = "", items = function () return ModifiablePropsCombo() end },
		{ category = "General", id = "Amount", editor = "number", default = 0, },	
		{ category = "General", id = "Percent", editor = "number", default = 0, },	
	},
	EditorName = "Modify upgrade",
	Description = T(8785, "<u(Upgrade)>.<u(Prop)> <opt_amount(Amount)> <opt_percent(Percent)>"),
}

function Effect_ModifyUpgrade:OnApplyEffect(city)
	RegisterUpgradeModifierModifier(self.Upgrade, self.Prop, self.Amount, self.Percent)
end


----- Effect_ModifyLabel

DefineClass.Effect_ModifyLabel = {
	__parents = { "Tech_Effect" },
	properties = {
		{ category = "General", id = "Label", editor = "combo",  default = "", items = function() return LabelsCombo() end },
		{ category = "General", id = "Prop", name = "Property", editor = "combo",  default = "", items = function() return ModifiablePropsCombo() end },
		{ category = "General", id = "Amount", editor = "number", default = 0 },
		{ category = "General", id = "Percent", editor = "number", default = 0, min = -100, max = 100, slider = true },
	},
	EditorName = "Modify label",
	Description = T(8786, "<u(Label)>.<u(Prop)> <opt_amount(Amount)> <opt_percent(Percent)>"),
}

function Effect_ModifyLabel:OnApplyEffect(city, parent)
	local scale = ModifiablePropScale[self.Prop]
	if not scale then
		assert(false, print_format("Trying to modify a non-modifiable property", self.Label, "-", self.Prop))
		return
	end
	city:SetLabelModifier(self.Label, self, Modifier:new{
		prop = self.Prop,
		amount = self.Amount * scale,
		percent = self.Percent,
		id = IsKindOf(parent, "GameEffectsContainer") and parent:GetEffectIdentifier() or nil,
	})
end


----- Effect_ModifyLabelOverTime

local function TimeUnitsCombo()
	local units = {
		{ value = 1, text = "real ms" },
		{ value = const.MinuteDuration, text = "minutes" },
		{ value = const.HourDuration, text = "hours" },
		{ value = const.DayDuration, text = "sols" },
	}
	return units
end

DefineClass.Effect_ModifyLabelOverTime = {
	__parents = { "Tech_Effect" },
	properties = {
		{ category = "General", id = "Label", editor = "combo",  default = "", items = function() return LabelsCombo() end },
		{ category = "General", id = "Prop", name = "Property", editor = "combo",  default = "", items = function() return ModifiablePropsCombo() end },
		{ category = "General", id = "Amount", editor = "number", default = 0 },
		{ category = "General", id = "Percent", editor = "number", default = 0, min = -100, max = 100, slider = true },
		{ category = "General", id = "TimeInterval", name = "Time Interval", editor = "number", default = 1, min = 1 },
		{ category = "General", id = "TimeUnits", name = "Time Units", editor = "choice", default = 1, items = function() return TimeUnitsCombo() end },
		{ category = "General", id = "Repetitions", name = "Repetitions", editor = "number", default = 0 },
	},
	EditorName = "Modify label over time",
	Description = T(8786, "<u(Label)>.<u(Prop)> <opt_amount(Amount)> <opt_percent(Percent)>"),
}

function Effect_ModifyLabelOverTime:OnApplyEffect(city, parent)
	CreateGameTimeThread(function()
		local amount = 0
		local percent = 0
		local scale = ModifiablePropScale[self.Prop] or 1
		local interval = self.TimeUnits * self.TimeInterval
		for rep=1,self.Repetitions do
			Sleep(interval)
			amount = amount + self.Amount
			percent = percent + self.Percent
			city:SetLabelModifier(self.Label, self, Modifier:new{
				prop = self.Prop,
				amount = amount * scale,
				percent = percent,
				id = IsKindOf(parent, "GameEffectsContainer") and parent:GetEffectIdentifier() or nil,
			})
		end
	end)
end

----- Effect_CompoundEfficiency

DefineClass.Effect_CompoundEfficiency = {
	__parents = { "Tech_Effect" },
	properties = {
		{ category = "Modify", id = "Label",     name = "Label",    editor = "combo",  default = "", items = function() return LabelsCombo() end },
		{ category = "Modify", id = "Threshold", name = "Threshold", editor = "number", min = 0, default = 2, },
		{ category = "Modify", id = "Prop",      name = "Property", editor = "combo",  default = "", items = function() return ModifiablePropsCombo() end },
		{ category = "Modify", id = "Amount",    name = "Amount",   editor = "number", default = 0 },
		{ category = "Modify", id = "Percent",   name = "Percent",  editor = "number", default = 0, min = -100, max = 100, slider = true },
	},
	EditorName = "Compound Efficiency",
	Description = T(8787, "<u(Label)>.<u(Prop)> <opt_amount(Threshold)> <opt_amount(Amount)> <opt_percent(Percent)>"),
}

function Effect_CompoundEfficiency:OnApplyEffect(city, parent)
	local id = parent and parent.id
	local effects = city.compound_effects[self.Label] or {}
	local scale = ModifiablePropScale[self.Prop]
	assert(not effects[id])
	effects[id] = { threshold = self.Threshold, amount = self.Amount * scale, percent = self.Percent, prop = self.Prop }
	city.compound_effects[self.Label] = effects
	
	local domes = city.labels.Dome or empty_table
	for i = 1, #domes do
		domes[i]:ApplyCompoundEffects(self.Label, id)
	end
end

----- Effect_ModifyResupplyParam

DefineClass.Effect_ModifyResupplyParam = {
	__parents = { "Tech_Effect" },
	properties = {
		{ category = "Modify", id = "Item",    name = "Item",    editor = "combo",  default = "", items = function() return ResupplyItemsCombo() end },
		{ category = "Modify", id = "Param", name = "Parameter", editor = "choice", default = "price", items = { {value = "price", text = T(3926, "Price")}, { value = "weight", text = T(3596, "Weight") } }, },
		{ category = "Modify", id = "Percent",  name = "Percent",  editor = "number", default = 0, min = -100, max = 100, slider = true },
	},
	EditorName = "Modify Resupply Parameter",
	Description = T(8788, "<u(Item)>.<u(Param)> <opt_percent(Percent)>"),
}

function Effect_ModifyResupplyParam:OnApplyEffect(city, parent)
	ModifyResupplyParam(self.Item, self.Param, self.Percent)
end

----- Effect_UnlockResupplyItem

DefineClass.Effect_UnlockResupplyItem = {
	__parents = { "Tech_Effect" },
	properties = {
		{ category = "Modify", id = "Item",    name = "Item",    editor = "combo",  default = "", items = function() return ResupplyItemsCombo() end },
	},
	EditorName = "Unlock Resupply Item",
	Description = T(8789, "<u(Item)>"),
}

function Effect_UnlockResupplyItem:OnApplyEffect(city, parent)
	local def = RocketPayload_GetMeta(self.Item)
	if def then
		if type(def.verifier) == "function" then
			def.locked = not def.verifier(def, GetMissionSponsor().id)
		else
			def.locked = false
		end
	end
end

----- Effect_UnlockTrait

DefineClass.Effect_UnlockTrait = {
	__parents = { "Tech_Effect" },
	properties = {
		{ category = "Unlock", id = "Trait", name = "Trait", editor = "choice", default = "", items = DataInstanceCombo("Trait") },
	},
	EditorName = "Unlock Trait",
	Description = T(8790, "<u(Trait)>"),
}

function Effect_UnlockTrait:OnInitEffect(city, parent)
	local trait = self.Trait
	LockTrait(trait, parent.id)
end

function Effect_UnlockTrait:OnApplyEffect(city,parent)
	local trait = self.Trait
	UnlockTrait(trait, parent.id)
end

----- Effect_UnlockDeeperDeposits

DefineClass.Effect_UnlockDeeperDeposits = {
	__parents = { "Tech_Effect" },
	properties = {
		{ category = "Unlock", id = "depth_levels", name = "Depth Levels to unlock:", editor = "number", default = 1, min = 1, max = 5, help = "Added to city's current max deposit depth exploitation val."} ,
	},
	EditorName = "Unlock Deeper Deposits",
	Description = T(8791, "<opt_amount(depth_levels)>"),
}

function Effect_UnlockDeeperDeposits:OnApplyEffect(city, parent)
	city:IncrementDepositDepthExploitationLevel(self.depth_levels)
	UpdateScannedSectorVisuals("scanned")	
end

----- Effect_ModifyConstructionCost

DefineClass.Effect_ModifyConstructionCost = {
	__parents = { "Tech_Effect" },
	properties = {
		{ category = "Construction", name = "Category", id = "Category", editor = "combo",  default = "",    items = function() return BuildCategoriesCombo() end },
		{ category = "Construction", name = "Building", id = "Building", editor = "combo",  default = false, items = function() return BuildingsCombo() end, no_edit = function(t) return t.Category ~= "" end },
		{ category = "Construction", name = "Stage",    id = "Stage",    editor = "combo",  default = false, items = ConstructionStages },
		{ category = "Construction", name = "Resource", id = "Resource", editor = "combo",  default = "all", items = function() return ConstructionResourcesCombo() end },
		{ category = "Construction", name = "Percent",  id = "Percent",  editor = "number", default = 0 },	
	},
	EditorName = "Modify Construction Cost",
	Description = T(8792, "<Building> <u(Stage)> <u(Resource)> <opt_percent(Percent)>"),
}

function Effect_ModifyConstructionCost:OnApplyEffect(city, parent)
	local category = self.Category
	local resource = self.Resource
	if category == "" then --when no category is selected, then we're modifying for a single building
		if resource ~= "all" then --only 1 resource
			city:ModifyConstructionCost("add", self.Building, resource, self.Percent, self.Stage)
		else
			--modify all construction resources
			for i=1,#ConstructionResourceList do
				city:ModifyConstructionCost("add", self.Building, ConstructionResourceList[i], self.Percent, self.Stage)
			end
		end
	else
		--if modifying a whole category, first gather all building inside it
		local buildings = {}
		for id, template in pairs(BuildingTemplates or "") do
			if template.build_category == category then
				buildings[#buildings + 1] = id
			end
		end
		
		--same as above but for all buildings
		if resource ~= "all" then
			for i=1,#buildings do
				city:ModifyConstructionCost("add", buildings[i], resource, self.Percent, self.Stage)
			end
		else
			for i=1,#buildings do
				local building = buildings[i]
				for j=1,#ConstructionResourceList do
					city:ModifyConstructionCost("add", building, ConstructionResourceList[j], self.Percent, self.Stage)
				end
			end
		end
	end
end

----- Effect_GrantTech

DefineClass.Effect_GrantTech = {
	__parents = { "Tech_Effect" },
	properties = {
		{ category = "Unlock", id = "Field",    name = T(3721, "Field"),    editor = "choice", items = function() return ResearchFieldsCombo() end, default = "", editor_update = true, },
		{ category = "Unlock", id = "Research", name = T(311, "Research"), editor = "choice", items = function(obj) return ResearchTechsCombo(obj) end,  default = "" },
		--{ category = "Unlock", id = "Count",    name = T{3732, "Count"},    editor = "number", default = 1 },
	},
	EditorName = "Grant Tech",
	Description = T(8793, "<u(Field)>.<u(Research)>"),
}

function Effect_GrantTech:OnApplyEffect(city, parent)
	if self.Research == "" then
		return
	end
	city:SetTechResearched(self.Research)
end