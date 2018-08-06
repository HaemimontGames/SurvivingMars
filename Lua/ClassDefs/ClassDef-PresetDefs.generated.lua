-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

UndefineClass('Achievement')
DefineClass.Achievement = {
	__parents = { "Preset", },
	properties = {
		{ id = "display_name", name = T{1000067, "Display Name"}, 
			editor = "text", default = false, translate = true, },
		{ id = "description", name = T{1000017, "Description"}, 
			editor = "text", default = false, translate = true, },
		{ id = "how_to", name = T{10372, "How To"}, 
			editor = "text", default = false, translate = true, },
		{ id = "image", name = T{3794, "Image"}, 
			editor = "text", default = "", },
		{ id = "secret", name = T{10373, "Secret"}, 
			editor = "bool", default = false, },
		{ id = "target", name = T{494347117512, "Target"}, 
			editor = "number", default = 0, },
		{ id = "time", name = T{10374, "Time"}, 
			editor = "number", default = 0, },
		{ id = "save_interval", name = T{10375, "Save Interval"}, 
			editor = "number", default = false, },
		{ category = "PS4", id = "ps4", name = T{348617689375, "PS4"}, 
			editor = "bool", default = true, },
		{ category = "PS4", id = "ps4_id", name = T{798176761568, "Trophy Id"}, help = T{949396412566, "IDs will be automatically generated."}, 
			editor = "number", default = -1, read_only = true, },
		{ category = "PS4", id = "ps4_grade", name = T{869818468075, "Grade"}, 
			editor = "choice", default = "bronze", items = function (self) return AchievementGrades end, },
		{ category = "PS4", id = "ps4_points", name = T{442677951970, "Points"}, 
			editor = "number", default = false, dont_save = true, read_only = true, },
		{ category = "PS4", id = "ps4_grouppoints", help = T{266952326912, "Total sum for the base game should be 950 - 1050. For each expansion <= 200."}, 
			editor = "number", default = false, dont_save = true, read_only = true, },
		{ category = "Durango", id = "durango_id", name = T{282044359217, "Achievement Id"}, 
			editor = "number", default = -1, },
		{ category = "Steam", id = "steam_id", name = T{573875107012, "Steam Id"}, 
			editor = "text", default = false, translate = true, },
	},
	HasSortKey = true,
	GlobalMap = "AchievementPresets",
	GedEditor = "AchievementEditor",
	EditorMenubarName = "",
	EditorMenubar = "Editors.Game",
}

function Achievement:GetCompleteText()
	local unlocked = GetAchievementFlags(self.id)
	return unlocked and self.description or self.how_to
end

function Achievement:Getps4_grouppoints()
	local total = 0
	ForEachPreset(Achievement, function(achievement, group_list)
		if achievement.ps4 and achievement.save_in == self.save_in then
			total = achievement:Getps4_points() + total
		end
	end)
	return total
end

function Achievement:Getps4_points()
	return AchievementGradesPS4Points[self.ps4_grade] or 0
end

function Achievement:OnEditorNew(root, socket)
	local max_ps4_id = 0
	ForEachPreset(Achievement, function(achievement, group_list)
		max_ps4_id = not achievement.ps4 and max_ps4_id or Max(max_ps4_id, achievement.ps4_id)
	end)
	self.ps4_id = max_ps4_id + 1
end

function Achievement:SaveAll(...)
	OrbisReassignTrophyIds()
	Preset.SaveAll(self, ...)
end

UndefineClass('Cargo')
DefineClass.Cargo = {
	__parents = { "Preset", },
	properties = {
		{ id = "verifier", name = T{344488883378, "Verifier"}, 
			editor = "func", default = false, params = "self, sponsor", },
		{ id = "name", name = T{1153, "Display Name"}, 
			editor = "text", default = false, translate = true, },
		{ id = "description", name = T{1000017, "Description"}, 
			editor = "text", default = false, translate = true, },
		{ id = "price", name = T{8675, "Price (M)"}, 
			editor = "number", default = 100000000, scale = "mil", step = 10000000, min = 0, },
		{ id = "pack", name = T{8676, "Pack"}, 
			editor = "number", default = 1, min = 1, },
		{ id = "kg", name = T{8677, "Weight (kg)"}, 
			editor = "number", default = 1000, min = 0, },
		{ id = "locked", name = T{8056, "Locked"}, 
			editor = "bool", default = false, },
		{ id = "icon", name = T{94, "Icon"}, 
			editor = "browse", default = false, folder = "UI", image_preview_size = 200, },
	},
	HasSortKey = true,
	GlobalMap = "CargoPreset",
	EditorMenubarName = "Cargo",
	EditorMenubar = "Editors.Game",
	mod_price = 100,
	mod_weight = 100,
	submenu = false,
	filter = false,
}

function Cargo:OnEditorSetProperty(prop_id, old_value, ged)
	if prop_id == "Id" then
		self.name, self.description = ResolveDisplayName(self.id)
	end
	Preset.OnEditorSetProperty(self, prop_id, old_value, ged)
end

UndefineClass('ColonyControlCenterCategory')
DefineClass.ColonyControlCenterCategory = {
	__parents = { "Preset", },
	properties = {
		{ id = "display_name", name = T{1000067, "Display Name"}, 
			editor = "text", default = false, translate = true, },
		{ id = "title", name = T{1000016, "Title"}, 
			editor = "text", default = false, translate = true, },
		{ id = "template_name", name = T{1000109, "Template"}, 
			editor = "text", default = false, },
		{ id = "filter", name = T{1000108, "Filter"}, 
			editor = "expression", default = function (self) return true end, },
	},
	HasGroups = false,
	HasSortKey = true,
	EditorMenubarName = "CCC Categories",
	EditorMenubar = "Editors.GameUI",
}

UndefineClass('CommanderProfilePreset')
DefineClass.CommanderProfilePreset = {
	__parents = { "Preset", "GameEffectsContainer", },
	properties = {
		{ category = "General", id = "display_name", name = T{1000067, "Display Name"}, 
			editor = "text", default = false, translate = true, },
		{ category = "General", id = "challenge_mod", name = T{3491, "Challenge Mod (%)"}, 
			editor = "number", default = 0, },
		{ category = "General", id = "effect", name = T{1000017, "Description"}, 
			editor = "text", default = false, translate = true, lines = 4, },
		{ category = "General", id = "filter", name = T{1000108, "Filter"}, 
			editor = "expression", default = function (self) return true end, },
		{ category = "General", id = "anomaly_bonus_breakthrough", name = T{3506, "Bonus Breakthrough Anomalies"}, 
			editor = "range", default = range(0, 0), min = 0, max = 5, },
		{ category = "General", id = "anomaly_bonus_event", name = T{3507, "Bonus event Anomalies"}, 
			editor = "range", default = range(0, 0), min = 0, max = 5, },
		{ category = "General", id = "anomaly_bonus_free_tech", name = T{3508, "Bonus free Tech Anomalies"}, 
			editor = "range", default = range(0, 0), min = 0, max = 5, },
		{ category = "General", id = "bonus_rockets", name = T{3511, "Bonus Rockets"}, 
			editor = "number", default = 0, min = 0, },
		{ category = "General", id = "additional_research_points", name = T{8754, "Additional research points per Sol"}, 
			editor = "number", default = 0, },
		{ category = "General", id = "additional_colonists_per_rocket", name = T{8755, "Increase max colonists per rocket"}, 
			editor = "number", default = 0, },
		{ category = "General", id = "additional_initial_applicants", name = T{8756, "Additional starting applicants"}, 
			editor = "number", default = 0, },
		{ category = "General", id = "game_apply", name = T{8022, "Game Apply"}, 
			editor = "func", default = function (self, city)
return
end, params = "self, city", },
		{ category = "Parameters", id = "param1", help = T{535020307901, "Arbitrary parameter you can reference from code as self.param1"}, 
			editor = "number", default = 0, },
		{ category = "Parameters", id = "param2", help = T{888012659449, "Arbitrary parameter you can reference from code as self.param2"}, 
			editor = "number", default = 0, },
		{ category = "Parameters", id = "param3", help = T{386525306766, "Arbitrary parameter you can reference from code as self.param3"}, 
			editor = "number", default = 0, },
		{ category = "Parameters", id = "param4", help = T{309447009608, "Arbitrary parameter you can reference from code as self.param4"}, 
			editor = "number", default = 0, },
		{ category = "Parameters", id = "param5", help = T{884822372369, "Arbitrary parameter you can reference from code as self.param5"}, 
			editor = "number", default = 0, },
		{ category = "Technologies", id = "tech1", name = T{3, "Grant Research"}, 
			editor = "combo", default = "", items = function (self) return TechCombo() end, },
		{ category = "Technologies", id = "tech2", name = T{3, "Grant Research"}, 
			editor = "combo", default = "", items = function (self) return TechCombo() end, },
		{ category = "Technologies", id = "tech3", name = T{3, "Grant Research"}, 
			editor = "combo", default = "", items = function (self) return TechCombo() end, },
		{ category = "Technologies", id = "tech4", name = T{3, "Grant Research"}, 
			editor = "combo", default = "", items = function (self) return TechCombo() end, },
		{ category = "Technologies", id = "tech5", name = T{3, "Grant Research"}, 
			editor = "combo", default = "", items = function (self) return TechCombo() end, },
	},
	HasGroups = false,
	HasSortKey = true,
	EditorMenubarName = "Commander Profiles",
	EditorMenubar = "Editors.Game",
}

DefineModItemPreset("CommanderProfilePreset")
ModItemCommanderProfilePreset.EditorName = "Commander Profile"

UndefineClass('CropPreset')
DefineClass.CropPreset = {
	__parents = { "Preset", },
	properties = {
		{ id = "DisplayName", name = T{1000067, "Display Name"}, 
			editor = "text", default = false, translate = true, },
		{ id = "DisplayNamePlural", name = T{918, "Display Name (plural)"}, 
			editor = "text", default = false, translate = true, },
		{ id = "Desc", name = T{1000017, "Description"}, 
			editor = "text", default = false, translate = true, },
		{ id = "icon", name = T{94, "Icon"}, help = T{658391424888, "Food Game Icon"}, 
			editor = "browse", default = "UI/Icons/Buildings/crops_empty.tga", folder = "UI", },
		{ id = "FoodOutput", name = T{919, "Food Output"}, help = T{658391424888, "Food Game Icon"}, 
			editor = "number", default = 1000, scale = "Resources", },
		{ id = "ResourceType", name = T{8055, "ResourceType"}, 
			editor = "choice", default = "Food", items = function (self) return ResourcesDropDownListItems end, },
		{ id = "Locked", name = T{8056, "Locked"}, help = T{10376, "Lock this crop regardless of tech that unlocks it. Lock key is 'default'."}, 
			editor = "bool", default = false, },
		{ id = "InitialGrowthTime", name = T{921, "Initial Growth Time"}, 
			editor = "number", default = 2880000, scale = "sols", },
		{ id = "InitialGrowthSequence", name = T{7636, "Initial Growth Sequence"}, 
			editor = "text", default = "", },
		{ id = "GrowthTime", name = T{920, "Growth Time"}, 
			editor = "number", default = 2880000, scale = "hours", },
		{ id = "GrowthSequence", name = T{7637, "Growth Sequence"}, 
			editor = "text", default = "", },
		{ id = "WaterDemand", name = T{922, "Water Demand"}, 
			editor = "number", default = 1000, scale = "Resources", },
		{ id = "OxygenProduction", name = T{923, "Oxygen Production"}, 
			editor = "number", default = 1000, scale = "Resources", },
		{ id = "SoilDemand", name = T{924, "Soil Demand"}, 
			editor = "number", default = 0, },
		{ id = "SoilEffect", name = T{925, "Soil Effect"}, 
			editor = "number", default = 0, },
		{ id = "SoilQualityMin", name = T{926, "Soil Quality Min"}, 
			editor = "number", default = 0, },
		{ id = "SoilQualityMax", name = T{927, "Soil Quality Max"}, 
			editor = "number", default = 100, },
		{ id = "FarmClass", name = T{928, "Farm Class"}, 
			editor = "choice", default = "", items = function (self) return ClassDescendantsCombo("Farm") end, },
		{ id = "CropEntity", name = T{155, "Entity"}, 
			editor = "choice", default = "", items = function (self) return GetCropEntities("") end, },
		{ id = "OnProduce", name = T{929, "Produce"}, 
			editor = "func", default = false, params = "dome, farm, amount", },
		{ id = "modify_target", name = T{930, "Modifier target"}, 
			editor = "choice", default = "", items = function (self) return { "", "dome", "farm", "dome buildings", "dome colonists" } end, },
		{ id = "modify_property", name = T{931, "Modified property"}, 
			editor = "choice", default = "", items = function (self) return ModifiablePropsCombo end, },
		{ id = "modify_amount", name = T{932, "Modification amount"}, 
			editor = "number", default = 0, },
		{ id = "modify_percent", name = T{933, "Modification percent"}, 
			editor = "number", default = 0, },
	},
	HasSortKey = true,
	GlobalMap = "CropPresets",
	EditorMenubarName = "Crops",
	EditorMenubar = "Editors.Game",
}

function CropPreset:SetLocked(val)
	self.Locked = val
	if not CropTechLocks then return end
	if val then
		LockCrop(self.id, "default")
	else
		UnlockCrop(self.id, "default")
	end
end

UndefineClass('EncyclopediaArticle')
DefineClass.EncyclopediaArticle = {
	__parents = { "Preset", },
	properties = {
		{ id = "title_id", name = T{3986, "Title ID"}, 
			editor = "text", default = false, },
		{ id = "title_text", name = T{1000016, "Title"}, 
			editor = "text", default = false, translate = true, },
		{ id = "title_text_upper", name = T{3987, "Title Uppercase"}, 
			editor = "text", default = false, translate = true, },
		{ id = "image", name = T{3794, "Image"}, 
			editor = "browse", default = "", folder = "UI", image_preview_size = 200, },
		{ id = "text", name = T{1000145, "Text"}, 
			editor = "text", default = false, translate = true, lines = 8, max_lines = 256, },
	},
	HasSortKey = true,
	EditorMenubarName = "Encyclopedia Articles",
	EditorMenubar = "Editors.Game",
}

UndefineClass('GameRules')
DefineClass.GameRules = {
	__parents = { "Preset", "GameEffectsContainer", },
	properties = {
		{ category = "General", id = "filter", name = T{1000108, "Filter"}, 
			editor = "expression", default = function (self) return true end, },
		{ category = "General", id = "display_name", name = T{1000016, "Title"}, help = T{306523338154, "The title of the game rule shown in the list of game rules"}, 
			editor = "text", default = false, translate = true, },
		{ category = "General", id = "description", name = T{1000017, "Description"}, help = T{399906536247, "Text description of the game rule"}, 
			editor = "text", default = false, translate = true, lines = 2, max_lines = 20, },
		{ category = "General", id = "flavor", name = T{3510, "Flavor text"}, 
			editor = "text", default = false, translate = true, lines = 2, max_lines = 20, },
		{ category = "General", id = "challenge_mod", name = T{765833268441, "Challenge Mod"}, help = T{500246791575, "The amount of difficulty added or subtracted to the overall game difficulty value"}, 
			editor = "number", default = 0, min = -1000, max = 1000, },
		{ category = "General", id = "exclusionlist", name = T{452690473931, "Exclusion List"}, help = T{959078240221, "List of other game rules that are not compatible with this one. If this rule is active the player won't be able to enable the rules in the exclusion list."}, 
			editor = "text", default = false, },
		{ category = "General", id = "param1", name = T{3904, "Param 1"}, help = T{521110102469, "Arbitrary parameter you can reference from code as self.param1"}, 
			editor = "number", default = 0, },
		{ category = "General", id = "param1_desc", 
			editor = "text", default = false, },
	},
	HasGroups = false,
	HasSortKey = true,
	GlobalMap = "GameRulesMap",
	EditorMenubarName = "Game Rules",
	EditorMenubar = "Editors.Game",
	effect = "",
}

DefineModItemPreset("GameRules")
ModItemGameRules.EditorName = "Game Rule"

UndefineClass('MissionLogoPreset')
DefineClass.MissionLogoPreset = {
	__parents = { "Preset", },
	properties = {
		{ id = "entity_name", name = T{1000048, "Entity Name"}, 
			editor = "text", default = "", },
		{ id = "decal_entity", name = T{1160, "Decal Mod Entity"}, 
			editor = "text", default = "", },
		{ id = "image", name = T{1161, "UI File"}, 
			editor = "text", default = "", },
		{ id = "display_name", name = T{1000067, "Display Name"}, 
			editor = "text", default = false, translate = true, },
		{ id = "filter", name = T{1000108, "Filter"}, 
			editor = "expression", default = function (self) return true end, },
	},
	HasGroups = false,
	HasSortKey = true,
	GlobalMap = "MissionLogoPresetMap",
	EditorMenubarName = "Mission Logos",
	EditorMenubar = "Editors.Game",
	effect = "",
	rollover_text = false,
	enabled = false,
	challenge_mod = 0,
}

UndefineClass('MissionSponsorPreset')
DefineClass.MissionSponsorPreset = {
	__parents = { "Preset", "GameEffectsContainer", "DynamicPropertiesObject", },
	properties = {
		{ category = "General", id = "display_name", name = T{1000067, "Display Name"}, 
			editor = "text", default = false, translate = true, },
		{ category = "General", id = "challenge_mod", name = T{3491, "Challenge Mod (%)"}, 
			editor = "number", default = 0, },
		{ category = "General", id = "funding", name = T{3492, "Starting Funding (M)"}, 
			editor = "number", default = 4000, },
		{ category = "General", id = "funding_per_tech", name = T{3493, "Tech Funding (M)"}, help = T{3494, "Funding earned for each Tech researched"}, 
			editor = "number", default = 0, },
		{ category = "General", id = "funding_per_breakthrough", name = T{3495, "Breakthrough Funding (M)"}, help = T{3496, "Funding earned for each Breakthrough Tech researched"}, 
			editor = "number", default = 0, },
		{ category = "General", id = "applicants_per_breakthrough", name = T{3497, "Breakthrough applicants"}, help = T{3498, "Applicants earned for each Breakthrough Tech researched"}, 
			editor = "number", default = 0, },
		{ category = "General", id = "cargo", name = T{3499, "Cargo Capacity"}, 
			editor = "number", default = 35000, },
		{ category = "General", id = "initial_rockets", name = T{3500, "Starting Rockets"}, 
			editor = "number", default = 2, },
		{ category = "General", id = "rocket_price", name = T{6840, "Rocket price (M)"}, help = T{6841, "Specify 0 to disable buying"}, 
			editor = "number", default = 3000000000, scale = "mil", min = 0, },
		{ category = "General", id = "applicants_price", name = T{6842, "Applicants price (M)"}, help = T{6841, "Specify 0 to disable buying"}, 
			editor = "number", default = 0, scale = "mil", min = 0, },
		{ category = "General", id = "initial_techs_unlocked", name = T{3503, "Starting Techs to research"}, help = T{3504, "Number of initially available Techs to research"}, 
			editor = "number", default = 3, },
		{ category = "General", id = "trait", name = T{3505, "Trait given to colonists"}, 
			editor = "choice", default = "", items = function (self) return TraitsCombo() end, },
		{ category = "General", id = "anomaly_bonus_breakthrough", name = T{3506, "Bonus Breakthrough Anomalies"}, 
			editor = "range", default = range(0, 0), min = 0, max = 5, },
		{ category = "General", id = "anomaly_bonus_event", name = T{3507, "Bonus event Anomalies"}, 
			editor = "range", default = range(0, 0), min = 0, max = 5, },
		{ category = "General", id = "anomaly_bonus_free_tech", name = T{3508, "Bonus free Tech Anomalies"}, 
			editor = "range", default = range(0, 0), min = 0, max = 5, },
		{ category = "General", id = "additional_research_points", name = T{8754, "Additional research points per Sol"}, 
			editor = "number", default = 0, no_edit = true, },
		{ category = "General", id = "additional_colonists_per_rocket", name = T{8755, "Increase max colonists per rocket"}, 
			editor = "number", default = 0, no_edit = true, },
		{ category = "General", id = "additional_initial_applicants", name = T{8756, "Additional starting applicants"}, 
			editor = "number", default = 0, no_edit = true, },
		{ category = "General", id = "precious_metals_export_price", name = T{181102054493, "Export Price Precious Metals"}, 
			editor = "number", default = 25, },
		{ category = "General", id = "research_points", name = T{527195227153, "Research Points per Sol"}, 
			editor = "number", default = 100, },
		{ category = "General", id = "initial_applicants", name = T{438413972057, "Applicants Pool Starting Size"}, 
			editor = "number", default = 100, },
		{ category = "General", id = "funding_per_interval", name = T{982299379447, "Sponsor Funding per Interval"}, 
			editor = "number", default = 0, },
		{ category = "General", id = "research_points_per_explored_sector", name = T{858689398721, "Research points granted on exploring a sector"}, 
			editor = "number", default = 0, },
		{ category = "General", id = "colonist_funding_on_arrival", name = T{206596668927, "Funding granted on colonist arrival on Mars"}, 
			editor = "number", default = 0, },
		{ category = "General", id = "effect", name = T{3509, "Effect"}, 
			editor = "text", default = false, translate = true, lines = 4, },
		{ category = "General", id = "flavor", name = T{3510, "Flavor text"}, 
			editor = "text", default = false, translate = true, },
		{ id = "specialist_bonus_performance_name", name = T{890035547236, "Specialist Bonus Performance Display Name"}, 
			editor = "text", default = false, translate = true, },
		{ id = "specialist_bonus_performance", name = T{709965515100, "Specialist Bonus Performance"}, 
			editor = "number", default = false, },
		{ category = "General", id = "filter", name = T{1000108, "Filter"}, 
			editor = "expression", default = function (self) return true end, },
		{ category = "General", id = "default_skin", name = T{7968, "Default Dome Skin"}, 
			editor = "choice", default = "", items = function (self) return DomeSkinsPresetsCombo() end, },
		{ category = "General", id = "default_logo", name = T{859728588427, "Default Mission Logo"}, 
			editor = "combo", default = "", items = function (self) return PresetsCombo("MissionLogoPreset")() end, },
		{ category = "General", id = "game_apply", name = T{8022, "Game Apply"}, 
			editor = "func", default = function (self, city)
return
end, params = "self, city", },
		{ category = "General", id = "GetDefaultRocketSkin", 
			editor = "func", default = function (self)
return nil
end, },
		{ category = "General", id = "FreeSpaceLeft", name = T{8494, "Free Space Left"}, help = T{925675045550, "Shows how much cargo space is left, after taking into account the initial cargo loadout"}, 
			editor = "number", default = 0, dont_save = true, read_only = true, },
		{ category = "Parameters", id = "param1", help = T{580081009511, "Arbitrary parameter you can reference from code as self.param1"}, 
			editor = "number", default = 0, },
		{ category = "Cargo Weight/Cost Modification", id = "WeightCostModifierGroup", name = T{455945197902, "Cargo Group"}, 
			editor = "choice", default = "", items = function (self) return PresetGroupsCombo("Cargo")() end, },
		{ category = "Cargo Weight/Cost Modification", id = "WeightModifierPercent", name = T{877579159095, "Weight Modifier (%)"}, 
			editor = "number", default = 100, scale = "%", },
		{ category = "Cargo Weight/Cost Modification", id = "CostModifierPercent", name = T{800931747139, "Cost Modifier (%)"}, 
			editor = "number", default = 100, scale = "%", },
		{ category = "Parameters", id = "param2", help = T{859041574780, "Arbitrary parameter you can reference from code as self.param2"}, 
			editor = "number", default = 0, },
		{ category = "Parameters", id = "param3", help = T{915618200154, "Arbitrary parameter you can reference from code as self.param3"}, 
			editor = "number", default = 0, },
		{ category = "Parameters", id = "param4", help = T{237226183718, "Arbitrary parameter you can reference from code as self.param4"}, 
			editor = "number", default = 0, },
		{ category = "Parameters", id = "param5", help = T{882655721960, "Arbitrary parameter you can reference from code as self.param5"}, 
			editor = "number", default = 0, },
		{ category = "Technologies", id = "tech1", name = T{3, "Grant Research"}, 
			editor = "combo", default = "", items = function (self) return TechCombo() end, },
		{ category = "Technologies", id = "tech2", name = T{3, "Grant Research"}, 
			editor = "combo", default = "", items = function (self) return TechCombo() end, },
		{ category = "Technologies", id = "tech3", name = T{3, "Grant Research"}, 
			editor = "combo", default = "", items = function (self) return TechCombo() end, },
		{ category = "Technologies", id = "tech4", name = T{3, "Grant Research"}, 
			editor = "combo", default = "", items = function (self) return TechCombo() end, },
		{ category = "Technologies", id = "tech5", name = T{3, "Grant Research"}, 
			editor = "combo", default = "", items = function (self) return TechCombo() end, },
		{ category = "General", id = "difficulty", name = T{952796190189, "Difficulty"}, 
			editor = "text", default = T{424227828326, "Normal"}, translate = true, },
		{ category = "Mission Goal (legacy)", id = "goal", name = T{589254325694, "Goal"}, 
			editor = "combo", default = "", items = function (self) return ClassDescendantsCombo("MissionGoal") end, },
		{ category = "Mission Goal (legacy)", id = "goal_timeout", name = T{906637466701, "Timeout (Sols)"}, 
			editor = "number", default = 100, min = 1, },
		{ category = "Mission Goal (legacy)", id = "goal_target", name = T{494347117512, "Target"}, 
			editor = "number", default = 0, },
	},
	HasGroups = false,
	HasSortKey = true,
	EditorMenubarName = "Mission Sponsors",
	EditorMenubar = "Editors.Game",
}

DefineModItemPreset("MissionSponsorPreset")
ModItemMissionSponsorPreset.EditorName = "Mission Sponsor"

function MissionSponsorPreset:GetDynamicProperties(properties)
	for i=1,const.MissionSponsorPriceModifiers do
		properties[#properties + 1] = { category = "Price Modifiers", id = "modifier_name" .. i,  name = T{3541, "Modifier name <number>", number = i}, editor = "combo", default = "", items = ResupplyItemsCombo }
		properties[#properties + 1] = { category = "Price Modifiers", id = "modifier_value" .. i, name = T{3542, "Modifier value <number>", number = i}, editor = "number", default = 0}
	end
	for i=1,const.MissionSponsorLockModifiers do
		properties[#properties + 1] = { category = "Lock Modifiers", id = "lock_name" .. i,  name = T{8691, "Cargo <number>", number = i}, editor = "combo",         default = "", items = ResupplyItemsCombo }
		properties[#properties + 1] = { category = "Lock Modifiers", id = "lock_value" .. i, name = T{8692, "Status <number>", number = i}, editor = "choice", default = false, items = LockStatusCombo}
	end
	for i=1,const.MissionSponsorNations do
		properties[#properties + 1] = { category = "Sponsor Nations", id = "sponsor_nation_name" .. i,    name = T{3543, "Sponsor nation name <number>", number = i}, editor = "combo", default = "",items = Nations }
		properties[#properties + 1] = { category = "Sponsor Nations", id = "sponsor_nation_percent" .. i, name = T{3544, "Sponsor nation percent <number>", number = i}, editor = "number", default = 0}
	end
	ForEachPreset("Cargo", function(cargo, group, self, props)
		--[[if cargo.locked then return end--]]
		local id = cargo.id
		rawset(self, id, rawget(self, id) or 0)
		properties[#properties + 1] = {
			category = "Rocket Cargo: " .. cargo.group, 
			id = cargo.id, name = cargo.name,
			editor = "number", default = 0, min = 0,
			group = cargo.group,
		}
	end, self, properties)
	
	return properties
end

function MissionSponsorPreset:GetFreeSpaceLeft()
	local loadout_weight = 0
	local props = self:GetProperties()
	for _, prop in ipairs(props) do
		local item = CargoPreset[prop.id]
		if item then
			local weight = self[item.id] / item.pack * item.kg
			loadout_weight = loadout_weight + weight
		end
	end
	return self.cargo - loadout_weight
end

UndefineClass('OnScreenNotificationPreset')
DefineClass.OnScreenNotificationPreset = {
	__parents = { "Preset", },
	properties = {
		{ id = "title", name = T{1000016, "Title"}, 
			editor = "text", default = false, translate = true, },
		{ id = "text", name = T{3793, "Body Text"}, 
			editor = "text", default = false, translate = true, lines = 2, max_lines = 8, },
		{ id = "voiced_text", name = T{6855, "Voiced Text"}, 
			editor = "text", default = false, translate = true, lines = 2, max_lines = 8, context = VoicedContextFromField("actor"), },
		{ id = "actor", name = T{6857, "Voice Actor"}, 
			editor = "combo", default = "aide", items = function (self) return VoiceActors end, },
		{ id = "image", name = T{3794, "Image"}, 
			editor = "browse", default = "", folder = "UI", image_preview_size = 200, },
		{ id = "popup_preset", name = T{4096, "PopUpPreset"}, 
			editor = "combo", default = "", items = function (self) return PresetsCombo("PopupNotificationPreset") end, },
		{ id = "close_on_read", name = T{4097, "Close on read"}, 
			editor = "bool", default = false, },
		{ id = "expiration", name = T{4098, "Expiration"}, 
			editor = "number", default = -1, },
		{ id = "game_time", name = T{4099, "Game Time"}, 
			editor = "bool", default = false, },
		{ id = "display_countdown", name = T{4100, "Display Countdown"}, 
			editor = "bool", default = false, },
		{ id = "dismissable", name = T{4101, "Dismissable"}, 
			editor = "bool", default = true, },
		{ id = "fx_action", name = T{3770, "FX Action"}, 
			editor = "text", default = "UINotification", },
		{ id = "show_once", name = T{4102, "Show once per game"}, 
			editor = "bool", default = false, },
		{ id = "encyclopedia_id", name = T{4103, "Encyclopedia ID"}, 
			editor = "text", default = false, },
		{ id = "priority", name = T{172, "Priority"}, 
			editor = "combo", default = "Normal", items = function (self) return {"Normal", "Important", "Critical"} end, },
		{ id = "ShowVignette", name = T{4104, "Show Vignette"}, 
			editor = "bool", default = false, },
		{ id = "VignetteImage", name = T{4105, "Vignette Image"}, 
			editor = "browse", default = "", folder = "UI", },
		{ id = "VignettePulseDuration", name = T{4106, "Vignette Pulse Duration"}, 
			editor = "number", default = 0, },
		{ id = "SoundEffectOnShow", name = T{4107, "Sound FX"}, 
			editor = "text", default = false, },
	},
	HasSortKey = true,
	GlobalMap = "OnScreenNotificationPresets",
	EditorMenubarName = "On-Screen Notifications",
	EditorMenubar = "Editors.GameUI",
}

function OnScreenNotificationPreset:OnEditorSetProperty(prop_id, old_value, ged)
	if prop_id == "priority" then
		local NotifClassByPriority = {
			Normal = "OnScreenNotification",
			Important = "OnScreenNotificationImportant",
			Critical = "OnScreenNotificationCritical",
		}
		self.ShowVignette = g_Classes[NotifClassByPriority[self[prop_id]]].show_vignette
		self.VignetteImage = g_Classes[NotifClassByPriority[self[prop_id]]].vignette_image
		self.VignettePulseDuration = g_Classes[NotifClassByPriority[self[prop_id]]].vignette_pulse_duration
		ObjModified(self)
	end
end

UndefineClass('PhotoFilterPreset')
DefineClass.PhotoFilterPreset = {
	__parents = { "Preset", },
	properties = {
		{ category = "General", id = "displayName", name = T{760118243448, "Display Name"}, 
			editor = "text", default = false, translate = true, },
		{ category = "General", id = "desc", name = T{403751625893, "Description"}, 
			editor = "text", default = false, translate = true, },
		{ category = "General", id = "filename", name = T{472842319142, "Shader Filename"}, 
			editor = "browse", default = "", filter = "FX files|*.fx", },
		{ category = "General", id = "texture1", name = T{252226363141, "Texture 1"}, 
			editor = "browse", default = "", filter = "Image files|*.tga", },
		{ category = "General", id = "texture2", name = T{663906214435, "Texture 2"}, 
			editor = "browse", default = "", filter = "Image files|*.tga", },
		{ category = "General", id = "activate", name = T{644657883672, "Run on activation"}, 
			editor = "func", default = false, },
		{ category = "General", id = "deactivate", name = T{577461898820, "Run on deactivation"}, 
			editor = "func", default = false, },
	},
	HasSortKey = true,
	GlobalMap = "PhotoFilterPresetMap",
	EditorMenubarName = "Photo Filters",
	EditorMenubar = "Editors.Other",
}

function PhotoFilterPreset:GetShaderDescriptor()
	local shader_name = self.filename
	local shader_pass = "Generic"
	
	local vbar_idx = string.find(shader_name, "|")
	if vbar_idx then
		shader_name = string.sub(self.filename, 1, vbar_idx - 1)
		shader_pass = string.sub(self.filename, vbar_idx + 1)
	end
	
	return {
		shader = shader_name,
		pass = shader_pass,
		tex1 = self.texture1,
		tex2 = self.texture2,
		activate = self.activate,
		deactivate = self.deactivate,
	}
end

UndefineClass('PopupNotificationPreset')
DefineClass.PopupNotificationPreset = {
	__parents = { "Preset", },
	properties = {
		{ id = "title", 
			editor = "text", default = false, translate = true, },
		{ id = "voiced_text", 
			editor = "text", default = false, translate = true, lines = 4, max_lines = 256, context = VoicedContextFromField("actor"), },
		{ id = "text", 
			editor = "text", default = false, translate = true, lines = 4, max_lines = 256, },
		{ id = "log_entry", 
			editor = "bool", default = false, },
		{ id = "actor", 
			editor = "combo", default = "narrator", items = function (self) return VoiceActors end, },
		{ id = "image", 
			editor = "browse", default = "", folder = "UI", },
		{ id = "choice1", name = T{3785, "Choice 1"}, 
			editor = "text", default = false, translate = true, lines = 2, max_lines = 8, },
		{ id = "choice1_img", name = T{3807, "Choice 1 Image"}, 
			editor = "browse", default = "", folder = "UI", },
		{ id = "choice1_rollover", name = T{3808, "Rollover 1"}, 
			editor = "text", default = false, translate = true, lines = 3, max_lines = 8, },
		{ id = "choice1_rollover_title", name = T{3809, "Rollover Title 1"}, 
			editor = "text", default = false, translate = true, },
		{ id = "choice1_hint1", name = T{3810, "Rollover 1 Hint 1"}, 
			editor = "text", default = false, translate = true, },
		{ id = "choice1_hint2", name = T{3811, "Rollover 1 Hint 2"}, 
			editor = "text", default = false, translate = true, },
		{ id = "choice2", name = T{3786, "Choice 2"}, 
			editor = "text", default = false, translate = true, lines = 2, max_lines = 8, },
		{ id = "choice2_img", name = T{3812, "Choice 2 Image"}, 
			editor = "browse", default = "", folder = "UI", },
		{ id = "choice2_rollover", name = T{3813, "Rollover 2"}, 
			editor = "text", default = false, translate = true, lines = 3, max_lines = 8, },
		{ id = "choice2_rollover_title", name = T{3814, "Rollover Title 2"}, 
			editor = "text", default = false, translate = true, },
		{ id = "choice2_hint1", name = T{3815, "Rollover 2 Hint 1"}, 
			editor = "text", default = false, translate = true, },
		{ id = "choice2_hint2", name = T{3816, "Rollover 2 Hint 2"}, 
			editor = "text", default = false, translate = true, },
		{ id = "choice3", name = T{3787, "Choice 3"}, 
			editor = "text", default = false, translate = true, lines = 2, max_lines = 8, },
		{ id = "choice3_img", name = T{3817, "Choice 3 Image"}, 
			editor = "browse", default = "", folder = "UI", },
		{ id = "choice3_rollover", name = T{3818, "Rollover 3"}, 
			editor = "text", default = false, translate = true, lines = 3, max_lines = 8, },
		{ id = "choice3_rollover_title", name = T{3819, "Rollover Title 3"}, 
			editor = "text", default = false, translate = true, },
		{ id = "choice3_hint1", name = T{3820, "Rollover 3 Hint 1"}, 
			editor = "text", default = false, translate = true, },
		{ id = "choice3_hint2", name = T{3821, "Rollover 3 Hint 2"}, 
			editor = "text", default = false, translate = true, },
		{ id = "choice4", name = T{3788, "Choice 4"}, 
			editor = "text", default = false, translate = true, lines = 2, max_lines = 8, },
		{ id = "choice4_img", name = T{3822, "Choice 4 Image"}, 
			editor = "browse", default = "", folder = "UI", },
		{ id = "choice4_rollover", name = T{3823, "Rollover 4"}, 
			editor = "text", default = false, translate = true, lines = 3, max_lines = 8, },
		{ id = "choice4_rollover_title", name = T{3824, "Rollover Title 4"}, 
			editor = "text", default = false, translate = true, },
		{ id = "choice4_hint1", name = T{3825, "Rollover 4 Hint 1"}, 
			editor = "text", default = false, translate = true, },
		{ id = "choice4_hint2", name = T{3826, "Rollover 4 Hint 2"}, 
			editor = "text", default = false, translate = true, },
	},
	HasSortKey = true,
	GlobalMap = "PopupNotificationPresets",
	EditorMenubarName = "Popup Notifications",
	EditorMenubar = "Editors.GameUI",
}

UndefineClass('RadioStationPreset')
DefineClass.RadioStationPreset = {
	__parents = { "Preset", },
	properties = {
		{ category = "General", id = "display_name", name = T{1000067, "Display Name"}, 
			editor = "text", default = false, translate = true, },
		{ category = "General", id = "folder", name = T{3593, "Folder"}, 
			editor = "text", default = "", },
		{ category = "General", id = "silence", name = T{3594, "Silence between tracks (sec)"}, 
			editor = "number", default = 20, },
		{ category = "General", id = "play", name = T{7905, "Play"}, 
			editor = "func", default = false, },
	},
	GlobalMap = "RadioStationPresets",
	EditorMenubarName = "Radio Stations",
	EditorMenubar = "Editors.Other",
}

function RadioStationPreset:GetTracksFolder()
	return self.folder
end

UndefineClass('TechFieldPreset')
DefineClass.TechFieldPreset = {
	__parents = { "Preset", },
	properties = {
		{ category = "Field", id = "display_name", name = T{1000037, "Name"}, 
			editor = "text", default = T{3893, "No Name"}, translate = true, },
		{ category = "Field", id = "icon", name = T{94, "Icon"}, help = T{131936822290, "Tech Game Icon"}, 
			editor = "browse", default = "UI/Icons/Research/rm_placeholder.tga", folder = "UI", filter = "*.tga", },
		{ category = "Field", id = "description", name = T{1000017, "Description"}, 
			editor = "text", default = T{3894, "No Description"}, translate = true, },
		{ category = "Field", id = "costs", name = T{3896, "Research Costs"}, help = T{756423914930, "Required Research Points For Each Tech Slot"}, 
			editor = "table", default = {
	1000,
	2000,
	3000,
	4000,
	5000,
	7000,
	9000,
	11000,
	13000,
	15000,
	18000,
	20000,
	23000,
	26000,
	29000,
	33000,
	37000,
	41000,
	45000,
	50000,
}, },
		{ category = "Field", id = "discoverable", name = T{3897, "Discoverable"}, help = T{339913935097, "The tech in this field can be discovered through normal means."}, 
			editor = "bool", default = true, },
		{ category = "Field", id = "show_in_field", name = T{7545, "Show in Other Field"}, help = T{515290198545, "The tech in this field are visible in another UI group."}, 
			editor = "choice", default = "", items = function (self) return ResearchFieldsCombo() end, },
		{ category = "Field", id = "hex_direction", name = T{3899, "Position on hex grid"}, help = T{490023206572, "Position on research screen hex grid, starting at 1 for upper right and proceeding CCW"}, 
			editor = "number", default = 0, },
	},
	HasGroups = false,
	HasSortKey = true,
	GlobalMap = "TechFields",
	EditorMenubarName = "Tech Fields",
	EditorMenubar = "Editors.Game",
}

UndefineClass('TechPreset')
DefineClass.TechPreset = {
	__parents = { "Preset", "GameEffectsContainer", },
	properties = {
		{ category = "Tech", id = "display_name", name = T{1000067, "Display Name"}, help = T{239538425780, "Tech Game Name - translated string"}, 
			editor = "text", default = T{3900, "<no name>"}, translate = true, },
		{ category = "Tech", id = "icon", name = T{94, "Icon"}, help = T{448278754672, "Tech Game Icon"}, 
			editor = "browse", default = "UI/Icons/Research/rm_placeholder.tga", folder = "UI", filter = "Image files|*.tga", },
		{ category = "Tech", id = "description", name = T{1000017, "Description"}, help = T{659609997526, "Tech Description - translated text"}, 
			editor = "text", default = false, translate = true, lines = 3, },
		{ category = "Tech", id = "position", name = T{3901, "Unlock Position"}, help = T{303899185139, "Shuffle slot range"}, 
			editor = "range", default = range(1, 100), min = 1, max = 100, },
		{ category = "Tech", id = "repeatable", name = T{3902, "Research Repeatable"}, help = T{852182239100, "Can be researched multiple times"}, 
			editor = "bool", default = false, },
		{ category = "Tech", id = "cost_increase", name = T{8714, "Repeat Cost Increase (%)"}, help = T{690910403139, "Base research cost increase for repeatable techs"}, 
			editor = "number", default = 10, },
		{ category = "Tech", id = "condition", name = T{699872370171, "Condition"}, help = T{815926156033, "returns whether the technology should be used in the tech tree"}, 
			editor = "expression", default = function (self) return true end, },
		{ category = "Params", id = "param1comment", name = T{3903, "Param 1 Comment"}, 
			editor = "text", default = false, },
		{ category = "Params", id = "param1", name = T{3904, "Param 1"}, 
			editor = "number", default = 0, },
		{ category = "Params", id = "param2comment", name = T{3905, "Param 2 Comment"}, 
			editor = "text", default = false, },
		{ category = "Params", id = "param2", name = T{3906, "Param 2"}, 
			editor = "number", default = 0, },
		{ category = "Params", id = "param3comment", name = T{3907, "Param 3 Comment"}, 
			editor = "text", default = false, },
		{ category = "Params", id = "param3", name = T{3908, "Param 3"}, 
			editor = "number", default = 0, },
		{ category = "Params", id = "param4comment", name = T{3909, "Param 4 Comment"}, 
			editor = "text", default = false, },
		{ category = "Params", id = "param4", name = T{3910, "Param 4"}, 
			editor = "number", default = 0, },
		{ category = "Params", id = "param5comment", name = T{3911, "Param 5 Comment"}, 
			editor = "text", default = false, },
		{ category = "Params", id = "param5", name = T{3912, "Param 5"}, 
			editor = "number", default = 0, },
		{ category = "City", id = "cost", name = T{3914, "Research Cost"}, help = T{189089234659, "Research cost. Depends on the tech field costs table and the tech position in the city research tree."}, 
			editor = "number", default = 0, dont_save = true, read_only = true, },
		{ category = "Mystery", id = "mystery", name = T{3916, "From Mystery"}, help = T{830925799086, "This tech will get initialized with the selected mystery, non mystery related techs should leave this blank."}, 
			editor = "combo", default = false, items = function (self) return ClassDescendantsList("MysteryBase") end, },
	},
	PresetGroupPreset = "TechFieldPreset",
	HasSortKey = true,
	GlobalMap = "TechDef",
	GedEditor = "TechEditor",
	EditorMenubarName = "Techs",
	EditorShortcut = "Ctrl-Alt-T",
	EditorMenubar = "Editors.Game",
}

function TechPreset:GetFieldDisplayName()
	local field = TechFields[self.group]
	return field and field.display_name or ""
end

function TechPreset:GetFieldDescription()
	local field = TechFields[self.group]
	return field and field.description or ""
end

function TechPreset:Getcost()
	if UICity then
		local id, points, cost, researched = UICity:GetResearchInfo(self.id)
		return cost and cost or 0
	end
	return 0
end

function TechPreset:ResearchQueueCost(queue_idx)
	return UICity:ResearchQueueCost(self.id, queue_idx)
end

function TechPreset:OnDataLoaded()
	for _, effect in ipairs(self) do
		procall(effect.OnDataLoaded, effect, self)
	end
end

UndefineClass('TraitPreset')
DefineClass.TraitPreset = {
	__parents = { "Preset", },
	properties = {
		{ id = "display_name", name = T{1000067, "Display Name"}, 
			editor = "text", default = false, translate = true, },
		{ id = "description", name = T{1000017, "Description"}, 
			editor = "text", default = false, translate = true, },
		{ id = "display_icon", name = T{94, "Icon"}, 
			editor = "browse", default = "", folder = {"UI", "CommonAssets/UI"}, },
		{ id = "rare", name = T{3940, "Rare"}, 
			editor = "bool", default = false, },
		{ id = "weight", name = T{3941, "Rarity weight"}, 
			editor = "number", default = 300, },
		{ category = "General", id = "_incompatible", name = T{3942, "Incompatible"}, help = T{858177202187, "Comma separated traits this one is incompatible with (like Lazy and Workaholic)"}, 
			editor = "text", default = "", },
		{ id = "auto", name = T{3943, "Used in base auto generated"}, 
			editor = "bool", default = true, },
		{ id = "initial_filter", name = T{3944, "Initial Filter Down"}, 
			editor = "bool", default = false, },
		{ id = "initial_filter_up", name = T{10378, "Initial Filter Up"}, 
			editor = "bool", default = false, },
		{ id = "hidden_on_start", name = T{3945, "Hidden on start"}, 
			editor = "bool", default = false, },
		{ id = "show_in_traits_ui", name = T{3946, "Show in traits UI"}, 
			editor = "bool", default = true, },
		{ id = "dome_filter_only", name = T{6863, "Show in traits Dome filters UI but not in Applicants filters"}, 
			editor = "bool", default = false, },
		{ id = "add_interest", name = T{3947, "Add interest"}, 
			editor = "combo", default = "", items = function (self) return ServiceInterestsList end, },
		{ id = "remove_interest", name = T{3948, "Remove interest"}, 
			editor = "combo", default = "", items = function (self) return ServiceInterestsList end, },
		{ id = "param", name = T{3949, "Parameter"}, 
			editor = "number", default = 0, },
		{ id = "daily_update_func", name = T{3950, "Update every sol func(colonist, trait)"}, 
			editor = "func", default = false, },
		{ id = "apply_func", name = T{3951, "Apply func(colonist, trait, init)"}, 
			editor = "func", default = false, },
		{ id = "unapply_func", name = T{3952, "Remove func(colonist, trait)"}, 
			editor = "func", default = false, },
		{ id = "modify_target", name = T{930, "Modifier target"}, 
			editor = "combo", default = "", items = function (self) return { "", "self", "dome colonists" } end, },
		{ id = "modify_trait", name = T{3953, "Target only Colonists with trait"}, 
			editor = "combo", default = "", items = function (self) return PresetsCombo("TraitPreset") end, },
		{ id = "modify_property", name = T{931, "Modified property"}, 
			editor = "combo", default = "", items = function (self) return ClassModifiablePropsCombo(Colonist) end, },
		{ id = "modify_amount", name = T{932, "Modification amount"}, 
			editor = "number", default = 0, },
		{ id = "modify_percent", name = T{933, "Modification percent"}, 
			editor = "number", default = 0, },
		{ id = "infopanel_effect_text", name = T{3954, "Infopanel effect text"}, 
			editor = "text", default = false, translate = true, },
	},
	HasSortKey = true,
	GlobalMap = "TraitPresets",
	EditorMenubarName = "",
	EditorMenubar = "Editors.Game",
	incompatible = false,
}

function TraitPreset:AddIncompatible()
	local incompatible = self.incompatible or {}
	self.incompatible = incompatible
end

function TraitPreset:AddDomeColonistsModifier(unit, trait)
	local dome = unit.dome
	if dome then
		local prop_meta = unit:GetPropertyMetadata(self.modify_property)
		if not prop_meta then
			print("once", "Modifying non-existent property", self.modify_property)
			return
		end
		local scale = GetPropScale(prop_meta.scale)
		local label = (trait ~= "") and trait or "Colonist"
		dome:SetLabelModifier(label, unit, { 
			prop = self.modify_property, 
			amount = self.modify_amount*scale, 
			percent = self.modify_percent, 
			id = self.id, 
		})
	end
end

function TraitPreset:RemoveDomeColonistsModifier(unit, trait)
	local dome = unit.dome
	if dome then
		local label = (trait ~= "") and trait or "Colonist"
		dome:SetLabelModifier(label, unit, nil)
	end
end

function TraitPreset:Apply(unit, init)
	if self.apply_func then
		self.apply_func(unit, self, init)
	end
	if self.modify_target == "self" then
		local prop_meta = unit:GetPropertyMetadata(self.modify_property)
		if not prop_meta then
			print("once", "Modifying non-existent property", self.modify_property)
			return
		end
		local scale = GetPropScale(prop_meta.scale)
		unit:SetModifier(self.modify_property, self.id, self.modify_amount*scale, self.modify_percent)
	elseif self.modify_target == "dome colonists" then
		self:AddDomeColonistsModifier(unit, self.modify_trait)
	end
end

function TraitPreset:UnApply(unit)
	if self.unapply_func then
		self.unapply_func(unit, self)
	end
	if self.modify_target == "self" then
		unit:SetModifier(self.modify_property, self.id, 0, 0)
	elseif self.modify_target == "dome colonists" then
		self:RemoveDomeColonistsModifier(unit, self.modify_trait)
	end
end

function TraitPreset:GetSaveData()
	ForEachPreset(TraitPreset, function(trait, group_list)
		trait.name =  nil
		trait.category = nil
	end)
	local result = Preset.GetSaveData(self)
	ForEachPreset(TraitPreset, function(trait, group_list)
		trait.name = trait.id
		trait.category = trait.group
	end)
	return result
end

UndefineClass('TutorialPreset')
DefineClass.TutorialPreset = {
	__parents = { "Preset", },
	properties = {
		{ id = "display_name", name = T{151112522727, "Display Name"}, 
			editor = "text", default = false, translate = true, },
		{ id = "description", name = T{486586299627, "Description"}, 
			editor = "text", default = false, translate = true, },
		{ id = "map", name = T{987648737170, "Map"}, 
			editor = "text", default = false, },
		{ id = "name", name = T{459485622980, "Name"}, 
			editor = "text", default = false, },
	},
	EditorMenubarName = "Tutorials",
	EditorMenubar = "Editors.GameUI",
}

