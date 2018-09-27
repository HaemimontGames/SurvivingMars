-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

UndefineClass('Cargo')
DefineClass.Cargo = {
	__parents = { "Preset", },
	properties = {
		{ id = "verifier", name = "Verifier", 
			editor = "func", default = false, params = "self, sponsor", },
		{ id = "name", name = "Display Name", 
			editor = "text", default = false, translate = true, },
		{ id = "description", name = "Description", 
			editor = "text", default = false, translate = true, },
		{ id = "price", name = "Price (M)", 
			editor = "number", default = 100000000, scale = "mil", step = 10000000, min = 0, },
		{ id = "pack", name = "Pack", 
			editor = "number", default = 1, min = 1, },
		{ id = "kg", name = "Weight (kg)", 
			editor = "number", default = 1000, min = 0, },
		{ id = "locked", name = "Locked", 
			editor = "bool", default = false, },
		{ id = "icon", name = "Icon", 
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

UndefineClass('Challenge')
DefineClass.Challenge = {
	__parents = { "Preset", },
	properties = {
		{ id = "title", name = "Title", 
			editor = "text", default = false, translate = true, },
		{ id = "description", name = "Description", 
			editor = "text", default = false, translate = true, },
		{ id = "latitude", name = "Landing Latitude", 
			editor = "number", default = 0, min = -70, max = 70, },
		{ id = "longitude", name = "Landing Longitude", 
			editor = "number", default = 0, min = -180, max = 180, },
		{ id = "time_perfected", name = "Time Limit (Perfected)", 
			editor = "number", default = 720000, scale = "sols", min = 0, },
		{ id = "time_completed", name = "Time Limit (Completed)", 
			editor = "number", default = 720000, scale = "sols", min = 0, },
		{ id = "sponsor", name = "Mission Sponsor", 
			editor = "combo", default = false, items = function (self) return PresetsCombo("MissionSponsorPreset") end, },
		{ id = "commander", name = "Commander Profile", 
			editor = "combo", default = false, items = function (self) return PresetsCombo("CommanderProfilePreset") end, },
		{ id = "gamerule1", name = "Game Rule 1", 
			editor = "combo", default = false, items = function (self) return PresetsCombo("GameRules") end, },
		{ id = "gamerule2", name = "Game Rule 2", 
			editor = "combo", default = false, items = function (self) return PresetsCombo("GameRules") end, },
		{ id = "gamerule3", name = "Game Rule 3", 
			editor = "combo", default = false, items = function (self) return PresetsCombo("GameRules") end, },
		{ id = "TrackProgress", name = "Track Progress", 
			editor = "bool", default = false, },
		{ id = "Init", name = "Init", 
			editor = "func", default = false, params = "self, regs", },
		{ id = "Run", name = "Run", 
			editor = "func", default = function (self)
	print("Challenge not yet implemented")
	Halt()
end, 
			no_edit = function(self) return self.TrackProgress end, dont_save = function(self) return self.TrackProgress end, },
		{ id = "TickProgress", name = "Tick Progress", 
			editor = "func", default = function (self, regs)
Sleep(1000)
return 0
end, 
			no_edit = function(self) return not self.TrackProgress end, params = "self, regs", },
		{ id = "WinCondition", name = "Win Condition", 
			editor = "func", default = false, 
			no_edit = function(self) return not self.TrackProgress end, },
		{ id = "TargetValue", name = "TargetValue", 
			editor = "number", default = 1000, 
			no_edit = function(self) return not self.TrackProgress end, min = -1000000000000, max = 1000000000000, },
		{ id = "ProgressText", name = "Progress Text", 
			editor = "text", default = T{207364138296, "Progress: <current>/<target>"}, 
			no_edit = function(self) return not self.TrackProgress end, translate = true, },
	},
	HasSortKey = true,
	EditorMenubarName = "Challenges",
	EditorMenubar = "Editors.Game",
}

DefineModItemPreset("Challenge")
ModItemChallenge.EditorName = "Challenge"

function Challenge:Completed()
	local completed = AccountStorage and AccountStorage.CompletedChallenges and AccountStorage.CompletedChallenges[self.id] or false
	return completed and completed.time < self.time_completed and completed
end

function Challenge:GetDeadline()
	return self.time_completed/const.DayDuration
end

function Challenge:GetPerfectDeadline()
	return self.time_perfected/const.DayDuration
end

function Challenge:GetCompletedText()
	local completed = self:Completed()
	if completed and completed.time < self.time_perfected then
		return T{10919, "<newline>Perfected in <sols> Sols", sols = completed.time / const.DayDuration, score = completed.score }
	elseif completed then
		return T{10920, "<newline>Completed in <sols> Sols", sols = completed.time / const.DayDuration, score = completed.score }
	end
	return ""
end

UndefineClass('ColonyControlCenterCategory')
DefineClass.ColonyControlCenterCategory = {
	__parents = { "Preset", },
	properties = {
		{ id = "display_name", name = "Display Name", 
			editor = "text", default = false, translate = true, },
		{ id = "title", name = "Title", 
			editor = "text", default = false, translate = true, },
		{ id = "template_name", name = "Template", 
			editor = "text", default = false, },
		{ id = "filter", name = "Filter", 
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
		{ category = "General", id = "display_name", name = "Display Name", 
			editor = "text", default = false, translate = true, },
		{ category = "General", id = "challenge_mod", name = "Challenge Mod (%)", 
			editor = "number", default = 0, },
		{ category = "General", id = "effect", name = "Description", 
			editor = "text", default = false, translate = true, lines = 4, },
		{ category = "General", id = "filter", name = "Filter", 
			editor = "expression", default = function (self) return true end, },
		{ category = "General", id = "anomaly_bonus_breakthrough", name = "Bonus Breakthrough Anomalies", 
			editor = "range", default = range(0, 0), min = 0, max = 5, },
		{ category = "General", id = "anomaly_bonus_event", name = "Bonus event Anomalies", 
			editor = "range", default = range(0, 0), min = 0, max = 5, },
		{ category = "General", id = "anomaly_bonus_free_tech", name = "Bonus free Tech Anomalies", 
			editor = "range", default = range(0, 0), min = 0, max = 5, },
		{ category = "General", id = "bonus_rockets", name = "Bonus Rockets", 
			editor = "number", default = 0, min = 0, },
		{ category = "General", id = "additional_research_points", name = "Additional research points per Sol", 
			editor = "number", default = 0, },
		{ category = "General", id = "additional_colonists_per_rocket", name = "Increase max colonists per rocket", 
			editor = "number", default = 0, },
		{ category = "General", id = "additional_initial_applicants", name = "Additional starting applicants", 
			editor = "number", default = 0, },
		{ category = "General", id = "game_apply", name = "Game Apply", 
			editor = "func", default = function (self, city)
return
end, params = "self, city", },
		{ category = "Parameters", id = "param1", help = "Arbitrary parameter you can reference from code as self.param1", 
			editor = "number", default = 0, },
		{ category = "Parameters", id = "param2", help = "Arbitrary parameter you can reference from code as self.param2", 
			editor = "number", default = 0, },
		{ category = "Parameters", id = "param3", help = "Arbitrary parameter you can reference from code as self.param3", 
			editor = "number", default = 0, },
		{ category = "Parameters", id = "param4", help = "Arbitrary parameter you can reference from code as self.param4", 
			editor = "number", default = 0, },
		{ category = "Parameters", id = "param5", help = "Arbitrary parameter you can reference from code as self.param5", 
			editor = "number", default = 0, },
		{ category = "Technologies", id = "tech1", name = "Grant Research", 
			editor = "combo", default = "", items = function (self) return TechCombo() end, },
		{ category = "Technologies", id = "tech2", name = "Grant Research", 
			editor = "combo", default = "", items = function (self) return TechCombo() end, },
		{ category = "Technologies", id = "tech3", name = "Grant Research", 
			editor = "combo", default = "", items = function (self) return TechCombo() end, },
		{ category = "Technologies", id = "tech4", name = "Grant Research", 
			editor = "combo", default = "", items = function (self) return TechCombo() end, },
		{ category = "Technologies", id = "tech5", name = "Grant Research", 
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
		{ id = "DisplayName", name = "Display Name", 
			editor = "text", default = false, translate = true, },
		{ id = "DisplayNamePlural", name = "Display Name (plural)", 
			editor = "text", default = false, translate = true, },
		{ id = "Desc", name = "Description", 
			editor = "text", default = false, translate = true, },
		{ id = "icon", name = "Icon", help = "Food Game Icon", 
			editor = "browse", default = "UI/Icons/Buildings/crops_empty.tga", folder = "UI", },
		{ id = "FoodOutput", name = "Food Output", help = "Food Game Icon", 
			editor = "number", default = 1000, scale = "Resources", },
		{ id = "ResourceType", name = "ResourceType", 
			editor = "choice", default = "Food", items = function (self) return ResourcesDropDownListItems end, },
		{ id = "Locked", name = "Locked", help = "Lock this crop regardless of tech that unlocks it. Lock key is 'default'.", 
			editor = "bool", default = false, },
		{ id = "InitialGrowthTime", name = "Initial Growth Time", 
			editor = "number", default = 2880000, scale = "sols", },
		{ id = "InitialGrowthSequence", name = "Initial Growth Sequence", 
			editor = "text", default = "", },
		{ id = "GrowthTime", name = "Growth Time", 
			editor = "number", default = 2880000, scale = "hours", },
		{ id = "GrowthSequence", name = "Growth Sequence", 
			editor = "text", default = "", },
		{ id = "WaterDemand", name = "Water Demand", 
			editor = "number", default = 1000, scale = "Resources", },
		{ id = "OxygenProduction", name = "Oxygen Production", 
			editor = "number", default = 1000, scale = "Resources", },
		{ id = "SoilDemand", name = "Soil Demand", 
			editor = "number", default = 0, },
		{ id = "SoilEffect", name = "Soil Effect", 
			editor = "number", default = 0, },
		{ id = "SoilQualityMin", name = "Soil Quality Min", 
			editor = "number", default = 0, },
		{ id = "SoilQualityMax", name = "Soil Quality Max", 
			editor = "number", default = 100, },
		{ id = "FarmClass", name = "Farm Class", 
			editor = "choice", default = "", items = function (self) return ClassDescendantsCombo("Farm") end, },
		{ id = "CropEntity", name = "Entity", 
			editor = "choice", default = "", items = function (self) return GetCropEntities("") end, },
		{ id = "OnProduce", name = "Produce", 
			editor = "func", default = false, params = "dome, farm, amount", },
		{ id = "modify_target", name = "Modifier target", 
			editor = "choice", default = "", items = function (self) return { "", "dome", "farm", "dome buildings", "dome colonists" } end, },
		{ id = "modify_property", name = "Modified property", 
			editor = "choice", default = "", items = function (self) return ModifiablePropsCombo end, },
		{ id = "modify_amount", name = "Modification amount", 
			editor = "number", default = 0, },
		{ id = "modify_percent", name = "Modification percent", 
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
		{ id = "title_id", name = "Title ID", 
			editor = "text", default = false, },
		{ id = "title_text", name = "Title", 
			editor = "text", default = false, translate = true, },
		{ id = "title_text_upper", name = "Title Uppercase", 
			editor = "text", default = false, translate = true, },
		{ id = "image", name = "Image", 
			editor = "browse", default = "", folder = "UI", image_preview_size = 200, },
		{ id = "text", name = "Text", 
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
		{ category = "General", id = "filter", name = "Filter", 
			editor = "expression", default = function (self) return true end, },
		{ category = "General", id = "display_name", name = "Title", help = "The title of the game rule shown in the list of game rules", 
			editor = "text", default = false, translate = true, },
		{ category = "General", id = "description", name = "Description", help = "Text description of the game rule", 
			editor = "text", default = false, translate = true, lines = 2, max_lines = 20, },
		{ category = "General", id = "flavor", name = "Flavor text", 
			editor = "text", default = false, translate = true, lines = 2, max_lines = 20, },
		{ category = "General", id = "challenge_mod", name = "Challenge Mod", help = "The amount of difficulty added or subtracted to the overall game difficulty value", 
			editor = "number", default = 0, min = -1000, max = 1000, },
		{ category = "General", id = "exclusionlist", name = "Exclusion List", help = "List of other game rules that are not compatible with this one. If this rule is active the player won't be able to enable the rules in the exclusion list.", 
			editor = "text", default = false, },
		{ category = "General", id = "param1", name = "Param 1", help = "Arbitrary parameter you can reference from code as self.param1", 
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
		{ id = "entity_name", name = "Entity Name", 
			editor = "text", default = "", },
		{ id = "decal_entity", name = "Decal Mod Entity", 
			editor = "text", default = "", },
		{ id = "image", name = "UI File", 
			editor = "text", default = "", },
		{ id = "display_name", name = "Display Name", 
			editor = "text", default = false, translate = true, },
		{ id = "filter", name = "Filter", 
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
		{ category = "General", id = "display_name", name = "Display Name", 
			editor = "text", default = false, translate = true, },
		{ category = "General", id = "challenge_mod", name = "Challenge Mod (%)", 
			editor = "number", default = 0, },
		{ category = "General", id = "funding", name = "Starting Funding (M)", 
			editor = "number", default = 4000, },
		{ category = "General", id = "funding_per_tech", name = "Tech Funding (M)", help = "Funding earned for each Tech researched", 
			editor = "number", default = 0, },
		{ category = "General", id = "funding_per_breakthrough", name = "Breakthrough Funding (M)", help = "Funding earned for each Breakthrough Tech researched", 
			editor = "number", default = 0, },
		{ category = "General", id = "applicants_per_breakthrough", name = "Breakthrough applicants", help = "Applicants earned for each Breakthrough Tech researched", 
			editor = "number", default = 0, },
		{ category = "General", id = "cargo", name = "Cargo Capacity", 
			editor = "number", default = 35000, },
		{ category = "General", id = "initial_rockets", name = "Starting Rockets", 
			editor = "number", default = 2, },
		{ category = "General", id = "rocket_price", name = "Rocket price (M)", help = "Specify 0 to disable buying", 
			editor = "number", default = 3000000000, scale = "mil", min = 0, },
		{ category = "General", id = "applicants_price", name = "Applicants price (M)", help = "Specify 0 to disable buying", 
			editor = "number", default = 0, scale = "mil", min = 0, },
		{ category = "General", id = "initial_techs_unlocked", name = "Starting Techs to research", help = "Number of initially available Techs to research", 
			editor = "number", default = 3, },
		{ category = "General", id = "trait", name = "Trait given to colonists", 
			editor = "choice", default = "", items = function (self) return TraitsCombo() end, },
		{ category = "General", id = "anomaly_bonus_breakthrough", name = "Bonus Breakthrough Anomalies", 
			editor = "range", default = range(0, 0), min = 0, max = 5, },
		{ category = "General", id = "anomaly_bonus_event", name = "Bonus event Anomalies", 
			editor = "range", default = range(0, 0), min = 0, max = 5, },
		{ category = "General", id = "anomaly_bonus_free_tech", name = "Bonus free Tech Anomalies", 
			editor = "range", default = range(0, 0), min = 0, max = 5, },
		{ category = "General", id = "additional_research_points", name = "Additional research points per Sol", 
			editor = "number", default = 0, no_edit = true, },
		{ category = "General", id = "additional_colonists_per_rocket", name = "Increase max colonists per rocket", 
			editor = "number", default = 0, no_edit = true, },
		{ category = "General", id = "additional_initial_applicants", name = "Additional starting applicants", 
			editor = "number", default = 0, no_edit = true, },
		{ category = "General", id = "precious_metals_export_price", name = "Export Price Precious Metals", 
			editor = "number", default = 25, },
		{ category = "General", id = "research_points", name = "Research Points per Sol", 
			editor = "number", default = 100, },
		{ category = "General", id = "initial_applicants", name = "Applicants Pool Starting Size", 
			editor = "number", default = 100, },
		{ category = "General", id = "funding_per_interval", name = "Sponsor Funding per Interval", 
			editor = "number", default = 0, },
		{ category = "General", id = "research_points_per_explored_sector", name = "Research points granted on exploring a sector", 
			editor = "number", default = 0, },
		{ category = "General", id = "colonist_funding_on_arrival", name = "Funding granted on colonist arrival on Mars", 
			editor = "number", default = 0, },
		{ category = "General", id = "effect", name = "Effect", 
			editor = "text", default = false, translate = true, lines = 4, },
		{ category = "General", id = "flavor", name = "Flavor text", 
			editor = "text", default = false, translate = true, },
		{ id = "specialist_bonus_performance_name", name = "Specialist Bonus Performance Display Name", 
			editor = "text", default = false, translate = true, },
		{ id = "specialist_bonus_performance", name = "Specialist Bonus Performance", 
			editor = "number", default = false, },
		{ category = "General", id = "filter", name = "Filter", 
			editor = "expression", default = function (self) return true end, },
		{ category = "General", id = "default_skin", name = "Default Dome Skin", 
			editor = "choice", default = "", items = function (self) return DomeSkinsPresetsCombo() end, },
		{ category = "General", id = "default_logo", name = "Default Mission Logo", 
			editor = "combo", default = "", items = function (self) return PresetsCombo("MissionLogoPreset")() end, },
		{ category = "General", id = "game_apply", name = "Game Apply", 
			editor = "func", default = function (self, city)
return
end, params = "self, city", },
		{ category = "General", id = "GetDefaultRocketSkin", 
			editor = "func", default = function (self)
return nil
end, },
		{ category = "General", id = "FreeSpaceLeft", name = "Free Space Left", help = "Shows how much cargo space is left, after taking into account the initial cargo loadout", 
			editor = "number", default = 0, dont_save = true, read_only = true, },
		{ category = "Parameters", id = "param1", help = "Arbitrary parameter you can reference from code as self.param1", 
			editor = "number", default = 0, },
		{ category = "Cargo Weight/Cost Modification", id = "WeightCostModifierGroup", name = "Cargo Group", 
			editor = "choice", default = "", items = function (self) return PresetGroupsCombo("Cargo")() end, },
		{ category = "Cargo Weight/Cost Modification", id = "WeightModifierPercent", name = "Weight Modifier (%)", 
			editor = "number", default = 100, scale = "%", },
		{ category = "Cargo Weight/Cost Modification", id = "CostModifierPercent", name = "Cost Modifier (%)", 
			editor = "number", default = 100, scale = "%", },
		{ category = "Parameters", id = "param2", help = "Arbitrary parameter you can reference from code as self.param2", 
			editor = "number", default = 0, },
		{ category = "Parameters", id = "param3", help = "Arbitrary parameter you can reference from code as self.param3", 
			editor = "number", default = 0, },
		{ category = "Parameters", id = "param4", help = "Arbitrary parameter you can reference from code as self.param4", 
			editor = "number", default = 0, },
		{ category = "Parameters", id = "param5", help = "Arbitrary parameter you can reference from code as self.param5", 
			editor = "number", default = 0, },
		{ category = "Technologies", id = "tech1", name = "Grant Research", 
			editor = "combo", default = "", items = function (self) return TechCombo() end, },
		{ category = "Technologies", id = "tech2", name = "Grant Research", 
			editor = "combo", default = "", items = function (self) return TechCombo() end, },
		{ category = "Technologies", id = "tech3", name = "Grant Research", 
			editor = "combo", default = "", items = function (self) return TechCombo() end, },
		{ category = "Technologies", id = "tech4", name = "Grant Research", 
			editor = "combo", default = "", items = function (self) return TechCombo() end, },
		{ category = "Technologies", id = "tech5", name = "Grant Research", 
			editor = "combo", default = "", items = function (self) return TechCombo() end, },
		{ category = "General", id = "difficulty", name = "Difficulty", 
			editor = "text", default = T{424227828326, "Normal"}, translate = true, },
		{ category = "Mission Goal (legacy)", id = "goal", name = "Goal", 
			editor = "combo", default = "", items = function (self) return ClassDescendantsCombo("MissionGoal") end, },
		{ category = "Mission Goal (legacy)", id = "goal_timeout", name = "Timeout (Sols)", 
			editor = "number", default = 100, min = 1, },
		{ category = "Mission Goal (legacy)", id = "goal_target", name = "Target", 
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
		{ id = "title", name = "Title", 
			editor = "text", default = false, translate = true, },
		{ id = "text", name = "Body Text", 
			editor = "text", default = false, translate = true, lines = 2, max_lines = 8, },
		{ id = "voiced_text", name = "Voiced Text", 
			editor = "text", default = false, translate = true, lines = 2, max_lines = 8, context = VoicedContextFromField("actor"), },
		{ id = "actor", name = "Voice Actor", 
			editor = "combo", default = "aide", items = function (self) return VoiceActors end, },
		{ id = "image", name = "Image", 
			editor = "browse", default = "", folder = "UI", image_preview_size = 200, },
		{ id = "popup_preset", name = "PopUpPreset", 
			editor = "combo", default = "", items = function (self) return PresetsCombo("PopupNotificationPreset") end, },
		{ id = "close_on_read", name = "Close on read", 
			editor = "bool", default = false, },
		{ id = "validate_context", help = "Periodically validates the context of the OnScreenNotification", 
			editor = "func", default = false, params = "context", },
		{ id = "expiration", name = "Expiration", 
			editor = "number", default = -1, },
		{ id = "game_time", name = "Game Time", 
			editor = "bool", default = false, },
		{ id = "display_countdown", name = "Display Countdown", 
			editor = "bool", default = false, },
		{ id = "dismissable", name = "Dismissable", 
			editor = "bool", default = true, },
		{ id = "fx_action", name = "FX Action", 
			editor = "text", default = "UINotification", },
		{ id = "show_once", name = "Show once per game", 
			editor = "bool", default = false, },
		{ id = "encyclopedia_id", name = "Encyclopedia ID", 
			editor = "text", default = false, },
		{ id = "priority", name = "Priority", 
			editor = "combo", default = "Normal", items = function (self) return {"Normal", "Important", "Critical"} end, },
		{ id = "ShowVignette", name = "Show Vignette", 
			editor = "bool", default = false, },
		{ id = "VignetteImage", name = "Vignette Image", 
			editor = "browse", default = "", folder = "UI", },
		{ id = "VignettePulseDuration", name = "Vignette Pulse Duration", 
			editor = "number", default = 0, },
		{ id = "SoundEffectOnShow", name = "Sound FX", 
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
		{ category = "General", id = "displayName", name = "Display Name", 
			editor = "text", default = false, translate = true, },
		{ category = "General", id = "desc", name = "Description", 
			editor = "text", default = false, translate = true, },
		{ category = "General", id = "filename", name = "Shader Filename", 
			editor = "browse", default = "", filter = "FX files|*.fx", },
		{ category = "General", id = "texture1", name = "Texture 1", 
			editor = "browse", default = "", filter = "Image files|*.tga", },
		{ category = "General", id = "texture2", name = "Texture 2", 
			editor = "browse", default = "", filter = "Image files|*.tga", },
		{ category = "General", id = "activate", name = "Run on activation", 
			editor = "func", default = false, },
		{ category = "General", id = "deactivate", name = "Run on deactivation", 
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
		{ id = "start_minimized", 
			editor = "bool", default = true, },
		{ id = "validate_context", help = "Periodically validates the context of the OnScreenNotification (only used when start_minimized == true)", 
			editor = "func", default = false, params = "context", },
		{ id = "choice1", name = "Choice 1", 
			editor = "text", default = false, translate = true, lines = 2, max_lines = 8, },
		{ id = "choice1_img", name = "Choice 1 Image", 
			editor = "browse", default = "", folder = "UI", },
		{ id = "choice1_rollover", name = "Rollover 1", 
			editor = "text", default = false, translate = true, lines = 3, max_lines = 8, },
		{ id = "choice1_rollover_title", name = "Rollover Title 1", 
			editor = "text", default = false, translate = true, },
		{ id = "choice1_hint1", name = "Rollover 1 Hint 1", 
			editor = "text", default = false, translate = true, },
		{ id = "choice1_hint2", name = "Rollover 1 Hint 2", 
			editor = "text", default = false, translate = true, },
		{ id = "choice2", name = "Choice 2", 
			editor = "text", default = false, translate = true, lines = 2, max_lines = 8, },
		{ id = "choice2_img", name = "Choice 2 Image", 
			editor = "browse", default = "", folder = "UI", },
		{ id = "choice2_rollover", name = "Rollover 2", 
			editor = "text", default = false, translate = true, lines = 3, max_lines = 8, },
		{ id = "choice2_rollover_title", name = "Rollover Title 2", 
			editor = "text", default = false, translate = true, },
		{ id = "choice2_hint1", name = "Rollover 2 Hint 1", 
			editor = "text", default = false, translate = true, },
		{ id = "choice2_hint2", name = "Rollover 2 Hint 2", 
			editor = "text", default = false, translate = true, },
		{ id = "choice3", name = "Choice 3", 
			editor = "text", default = false, translate = true, lines = 2, max_lines = 8, },
		{ id = "choice3_img", name = "Choice 3 Image", 
			editor = "browse", default = "", folder = "UI", },
		{ id = "choice3_rollover", name = "Rollover 3", 
			editor = "text", default = false, translate = true, lines = 3, max_lines = 8, },
		{ id = "choice3_rollover_title", name = "Rollover Title 3", 
			editor = "text", default = false, translate = true, },
		{ id = "choice3_hint1", name = "Rollover 3 Hint 1", 
			editor = "text", default = false, translate = true, },
		{ id = "choice3_hint2", name = "Rollover 3 Hint 2", 
			editor = "text", default = false, translate = true, },
		{ id = "choice4", name = "Choice 4", 
			editor = "text", default = false, translate = true, lines = 2, max_lines = 8, },
		{ id = "choice4_img", name = "Choice 4 Image", 
			editor = "browse", default = "", folder = "UI", },
		{ id = "choice4_rollover", name = "Rollover 4", 
			editor = "text", default = false, translate = true, lines = 3, max_lines = 8, },
		{ id = "choice4_rollover_title", name = "Rollover Title 4", 
			editor = "text", default = false, translate = true, },
		{ id = "choice4_hint1", name = "Rollover 4 Hint 1", 
			editor = "text", default = false, translate = true, },
		{ id = "choice4_hint2", name = "Rollover 4 Hint 2", 
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
		{ category = "General", id = "display_name", name = "Display Name", 
			editor = "text", default = false, translate = true, },
		{ category = "General", id = "folder", name = "Folder", 
			editor = "text", default = "", },
		{ category = "General", id = "silence", name = "Silence between tracks (sec)", 
			editor = "number", default = 20, },
		{ category = "General", id = "play", name = "Play", 
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
		{ category = "Field", id = "display_name", name = "Name", 
			editor = "text", default = T{3893, "No Name"}, translate = true, },
		{ category = "Field", id = "icon", name = "Icon", help = "Tech Game Icon", 
			editor = "browse", default = "UI/Icons/Research/rm_placeholder.tga", folder = "UI", filter = "*.tga", },
		{ category = "Field", id = "description", name = "Description", 
			editor = "text", default = T{3894, "No Description"}, translate = true, },
		{ category = "Field", id = "costs", name = "Research Costs", help = "Required Research Points For Each Tech Slot", 
			editor = "prop table", default = {
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
		{ category = "Field", id = "discoverable", name = "Discoverable", help = "The tech in this field can be discovered through normal means.", 
			editor = "bool", default = true, },
		{ category = "Field", id = "show_in_field", name = "Show in Other Field", help = "The tech in this field are visible in another UI group.", 
			editor = "choice", default = "", items = function (self) return ResearchFieldsCombo() end, },
		{ category = "Field", id = "hex_direction", name = "Position on hex grid", help = "Position on research screen hex grid, starting at 1 for upper right and proceeding CCW", 
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
		{ category = "Tech", id = "display_name", name = "Display Name", help = "Tech Game Name - translated string", 
			editor = "text", default = T{3900, "<no name>"}, translate = true, },
		{ category = "Tech", id = "icon", name = "Icon", help = "Tech Game Icon", 
			editor = "browse", default = "UI/Icons/Research/rm_placeholder.tga", folder = "UI", filter = "Image files|*.tga", },
		{ category = "Tech", id = "description", name = "Description", help = "Tech Description - translated text", 
			editor = "text", default = false, translate = true, lines = 3, },
		{ category = "Tech", id = "position", name = "Unlock Position", help = "Shuffle slot range", 
			editor = "range", default = range(1, 100), min = 1, max = 100, },
		{ category = "Tech", id = "repeatable", name = "Research Repeatable", help = "Can be researched multiple times", 
			editor = "bool", default = false, },
		{ category = "Tech", id = "cost_increase", name = "Repeat Cost Increase (%)", help = "Base research cost increase for repeatable techs", 
			editor = "number", default = 10, },
		{ category = "Tech", id = "condition", name = "Condition", help = "returns whether the technology should be used in the tech tree", 
			editor = "expression", default = function (self) return true end, },
		{ category = "Params", id = "param1comment", name = "Param 1 Comment", 
			editor = "text", default = false, },
		{ category = "Params", id = "param1", name = "Param 1", 
			editor = "number", default = 0, },
		{ category = "Params", id = "param2comment", name = "Param 2 Comment", 
			editor = "text", default = false, },
		{ category = "Params", id = "param2", name = "Param 2", 
			editor = "number", default = 0, },
		{ category = "Params", id = "param3comment", name = "Param 3 Comment", 
			editor = "text", default = false, },
		{ category = "Params", id = "param3", name = "Param 3", 
			editor = "number", default = 0, },
		{ category = "Params", id = "param4comment", name = "Param 4 Comment", 
			editor = "text", default = false, },
		{ category = "Params", id = "param4", name = "Param 4", 
			editor = "number", default = 0, },
		{ category = "Params", id = "param5comment", name = "Param 5 Comment", 
			editor = "text", default = false, },
		{ category = "Params", id = "param5", name = "Param 5", 
			editor = "number", default = 0, },
		{ category = "City", id = "cost", name = "Research Cost", help = "Research cost. Depends on the tech field costs table and the tech position in the city research tree.", 
			editor = "number", default = 0, dont_save = true, read_only = true, },
		{ category = "Mystery", id = "mystery", name = "From Mystery", help = "This tech will get initialized with the selected mystery, non mystery related techs should leave this blank.", 
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
		{ id = "display_name", name = "Display Name", 
			editor = "text", default = false, translate = true, },
		{ id = "description", name = "Description", 
			editor = "text", default = false, translate = true, },
		{ id = "display_icon", name = "Icon", 
			editor = "browse", default = "", folder = {"UI", "CommonAssets/UI"}, },
		{ id = "rare", name = "Rare", 
			editor = "bool", default = false, },
		{ id = "weight", name = "Rarity weight", 
			editor = "number", default = 300, },
		{ category = "General", id = "_incompatible", name = "Incompatible", help = "Comma separated traits this one is incompatible with (like Lazy and Workaholic)", 
			editor = "text", default = "", },
		{ id = "auto", name = "Used in base auto generated", 
			editor = "bool", default = true, },
		{ id = "initial_filter", name = "Initial Filter Down", 
			editor = "bool", default = false, },
		{ id = "initial_filter_up", name = "Initial Filter Up", 
			editor = "bool", default = false, },
		{ id = "hidden_on_start", name = "Hidden on start", 
			editor = "bool", default = false, },
		{ id = "show_in_traits_ui", name = "Show in traits UI", 
			editor = "bool", default = true, },
		{ id = "dome_filter_only", name = "Show in traits Dome filters UI but not in Applicants filters", 
			editor = "bool", default = false, },
		{ id = "add_interest", name = "Add interest", 
			editor = "combo", default = "", items = function (self) return ServiceInterestsList end, },
		{ id = "remove_interest", name = "Remove interest", 
			editor = "combo", default = "", items = function (self) return ServiceInterestsList end, },
		{ id = "param", name = "Parameter", 
			editor = "number", default = 0, },
		{ id = "daily_update_func", name = "Update every sol func(colonist, trait)", 
			editor = "func", default = false, },
		{ id = "apply_func", name = "Apply func(colonist, trait, init)", 
			editor = "func", default = false, },
		{ id = "unapply_func", name = "Remove func(colonist, trait)", 
			editor = "func", default = false, },
		{ id = "modify_target", name = "Modifier target", 
			editor = "combo", default = "", items = function (self) return { "", "self", "dome colonists" } end, },
		{ id = "modify_trait", name = "Target only Colonists with trait", 
			editor = "combo", default = "", items = function (self) return PresetsCombo("TraitPreset") end, },
		{ id = "modify_property", name = "Modified property", 
			editor = "combo", default = "", items = function (self) return ClassModifiablePropsCombo(Colonist) end, },
		{ id = "modify_amount", name = "Modification amount", 
			editor = "number", default = 0, },
		{ id = "modify_percent", name = "Modification percent", 
			editor = "number", default = 0, },
		{ id = "infopanel_effect_text", name = "Infopanel effect text", 
			editor = "text", default = false, translate = true, },
	},
	HasSortKey = true,
	GlobalMap = "TraitPresets",
	EditorMenubarName = "Traits",
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
		{ id = "display_name", name = "Display Name", 
			editor = "text", default = false, translate = true, },
		{ id = "description", name = "Description", 
			editor = "text", default = false, translate = true, },
		{ id = "map", name = "Map", 
			editor = "text", default = false, },
		{ id = "name", name = "Name", 
			editor = "text", default = false, },
	},
	EditorMenubarName = "Tutorials",
	EditorMenubar = "Editors.GameUI",
}

