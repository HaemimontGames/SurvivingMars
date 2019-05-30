-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

UndefineClass('BuildMenuSubcategory')
DefineClass.BuildMenuSubcategory = {
	__parents = { "Preset", },
	properties = {
		{ id = "category_name", name = "Name", 
			editor = "text", default = false, },
		{ id = "display_name", name = "Display Name", 
			editor = "text", default = false, translate = true, },
		{ id = "icon", name = "Icon", 
			editor = "text", default = false, },
		{ id = "description", name = "Description", 
			editor = "text", default = false, translate = true, },
		{ id = "build_pos", name = "Position in category", 
			editor = "number", default = 1, },
		{ id = "category", name = "Parent category", 
			editor = "combo", default = "", items = function (self) return BuildCategoriesCombo() end, },
		{ id = "allow_template_variants", name = "Allow Change Template Variants", help = "Allows toggling between buildings in the category using [ and ] during construction", 
			editor = "bool", default = true, },
		{ id = "close_parent", name = "Close build menu on selection", 
			editor = "bool", default = false, },
		{ id = "action", 
			editor = "func", default = function (self, context, button)
local parent = GetDialog(button)
parent:SelectSubCategory(button, self.category)
end, params = "self, context, button", },
	},
	GlobalMap = "BuildMenuSubcategories",
	EditorMenubar = "Editors.Game",
}

DefineModItemPreset("BuildMenuSubcategory", { EditorName = "Build Menu Subcategory" })
----- BuildMenuSubcategory mod items don't show thier category_name property

local prop_override = { id = "category_name", editor = false }
table.insert(ModItemBuildMenuSubcategory.properties, prop_override)

function ModItemBuildMenuSubcategory:OnEditorSetProperty(prop_id, old_value, ged)
	if prop_id == "Id" then
		self:SetProperty("category_name", self:GetProperty("Id"))
	end
end

function GetTopLevelBuildMenuCategory(id)
	local preset = BuildMenuSubcategories[id]
	while preset do
		id = preset.category
		preset = BuildMenuSubcategories[id]
	end
	return id
end

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
		{ id = "max", name = "Max", 
			editor = "number", default = 2147483647, },
		{ id = "kg", name = "Weight (kg)", 
			editor = "number", default = 1000, min = 0, },
		{ id = "locked", name = "Locked", 
			editor = "bool", default = false, },
		{ id = "icon", name = "Icon", 
			editor = "browse", default = false, folder = "UI", filter = "Image files|*.tga", image_preview_size = 200, },
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
			editor = "text", default = T(207364138296, --[[PresetDef Challenge default]] "Progress: <current>/<target>"), 
			no_edit = function(self) return not self.TrackProgress end, translate = true, },
	},
	HasSortKey = true,
	EditorMenubarName = "Challenges",
	EditorMenubar = "Editors.Game",
}

DefineModItemPreset("Challenge", { EditorName = "Challenge" })
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
		return T{10919, "<newline>Perfected in <sols> Sols", sols = 1 + completed.time / const.DayDuration, score = completed.score }
	elseif completed then
		return T{10920, "<newline>Completed in <sols> Sols", sols = 1 + completed.time / const.DayDuration, score = completed.score }
	end
	return ""
end

function Challenge:GetChallengeDescriptionProgressText(context)
	local text = self.description
	if self.TrackProgress and  (self.ProgressText or "") ~= "" then
		text = text .. Untranslated("<newline><newline>") .. T{self.ProgressText, context}
	end
	return text
end

UndefineClass('ColonyColorScheme')
DefineClass.ColonyColorScheme = {
	__parents = { "Preset", },
	properties = {
		{ category = "Preset", id = "display_name", name = "Display Name", 
			editor = "text", default = false, translate = true, },
		{ id = "image", name = "Image", 
			editor = "text", default = "UI/Encyclopedia/rocket_surviving_mars.tga", },
		{ category = "Outside", id = "outside_base", 
			editor = "material", default = 2215649344, },
		{ category = "Outside", id = "outside_metal", 
			editor = "material", default = 2215649344, },
		{ category = "Outside", id = "outside_dark", 
			editor = "material", default = 2215649344, },
		{ category = "Outside", id = "outside_accent_1", 
			editor = "material", default = 2215649344, },
		{ category = "Outside", id = "outside_accent_2", 
			editor = "material", default = 2215649344, },
		{ category = "Inside", id = "outside_accent_factory", 
			editor = "material", default = 2215649344, },
		{ category = "Mining", id = "mining_base", 
			editor = "material", default = 2215649344, },
		{ category = "Mining", id = "mining_accent_1", 
			editor = "material", default = 2215649344, },
		{ category = "Electro", id = "electro_base", 
			editor = "material", default = 2215649344, },
		{ category = "Electro", id = "cables_base", 
			editor = "material", default = 2215649344, },
		{ category = "Electro", id = "electro_accent_1", 
			editor = "material", default = 2215649344, },
		{ category = "Electro", id = "electro_accent_2", 
			editor = "material", default = 2215649344, },
		{ category = "Life", id = "life_base", 
			editor = "material", default = 2215649344, },
		{ category = "Life", id = "pipes_base", 
			editor = "material", default = 2215649344, },
		{ category = "Life", id = "pipes_metal", 
			editor = "material", default = 2215649344, },
		{ category = "Life", id = "life_accent_1", 
			editor = "material", default = 2215649344, },
		{ category = "Vehicles", id = "rover_base", 
			editor = "material", default = 2215649344, },
		{ category = "Vehicles", id = "rover_accent", 
			editor = "material", default = 2215649344, },
		{ category = "Vehicles", id = "rover_dark", 
			editor = "material", default = 2215649344, },
		{ category = "Vehicles", id = "rocket_base", 
			editor = "material", default = 2215649344, },
		{ category = "Vehicles", id = "rocket_accent", 
			editor = "material", default = 2215649344, },
		{ category = "Vehicles", id = "rocket_refugee", 
			editor = "material", default = 2206706680, },
		{ category = "Inside", id = "dome_base", 
			editor = "material", default = 2215649344, },
		{ category = "Inside", id = "inside_base", 
			editor = "material", default = 2215649344, },
		{ category = "Inside", id = "inside_metal", 
			editor = "material", default = 2215649344, },
		{ category = "Inside", id = "inside_accent_housing", 
			editor = "material", default = 2215649344, },
		{ category = "Inside", id = "inside_accent_medical", 
			editor = "material", default = 2215649344, },
		{ category = "Inside", id = "inside_accent_food", 
			editor = "material", default = 2215649344, },
		{ category = "Inside", id = "inside_wood", 
			editor = "material", default = 2215649344, },
		{ category = "Inside", id = "inside_accent_service", 
			editor = "material", default = 2215649344, },
		{ category = "Inside", id = "inside_accent_research", 
			editor = "material", default = 2215649344, },
		{ category = "Inside", id = "inside_accent_factory", 
			editor = "material", default = 2215649344, },
		{ category = "Inside", id = "inside_accent_1", 
			editor = "material", default = 2215649344, },
		{ category = "Inside", id = "inside_accent_2", 
			editor = "material", default = 2215649344, },
		{ category = "General", id = "none", 
			editor = "material", default = 2215649344, read_only = true, no_edit = true, },
	},
	HasSortKey = true,
	GlobalMap = "ColonyColorSchemes",
	EditorMenubarName = "Colony Color Schemes",
	EditorMenubar = "Editors.Art",
}

DefineModItemPreset("ColonyColorScheme", { EditorName = "Colony Color Schemes" })
function ColonyColorScheme:OnEditorSetProperty(prop_id)
	ReapplyPalettes()
end

function ColonyColorScheme:OnEditorSelect(selection)
	OverrideColonyColorScheme(selection and self.id or false)
end

----- ColonyColorScheme 

function ModItemColonyColorScheme:OnEditorSelect(...)
	ModItem.OnEditorSelect(self, ...)
	ColonyColorScheme.OnEditorSelect(self, ...)
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
		{ category = "General", id = "new_in", name = "New In", help = "The version, in which this commander profile was introduced", 
			editor = "combo", default = false, items = function (self) return DlcComboItems() end, },
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
		{ category = "General", id = "incompatible_game_rules", name = "Incompatible game rules", 
			editor = "string_list", default = {}, item_default = "", items = function (self) return PresetsCombo("GameRules") end, },
	},
	HasGroups = false,
	HasSortKey = true,
	EditorMenubarName = "Commander Profiles",
	EditorMenubar = "Editors.Game",
}

DefineModItemPreset("CommanderProfilePreset", { EditorName = "Commander Profile" })
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
			editor = "browse", default = "UI/Icons/Buildings/crops_empty.tga", folder = "UI", filter = "Image files|*.tga", },
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
			editor = "browse", default = "", folder = "UI", filter = "Image files|*.tga", image_preview_size = 200, },
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
		{ category = "General", id = "new_in", name = "New In", help = "The version, in which this game rule was introduced", 
			editor = "combo", default = false, items = function (self) return DlcComboItems() end, },
	},
	HasGroups = false,
	HasSortKey = true,
	GlobalMap = "GameRulesMap",
	EditorMenubarName = "Game Rules",
	EditorMenubar = "Editors.Game",
	effect = "",
}

DefineModItemPreset("GameRules", { EditorName = "Game Rule" })
function GameRules:IsEnabled()
	local sponsor = Presets.MissionSponsorPreset.Default[g_CurrentMissionParams.idMissionSponsor]
	if sponsor and table.find(sponsor.incompatible_game_rules, self.id) then
		return false
	end
	local commander = Presets.CommanderProfilePreset.Default[g_CurrentMissionParams.idCommanderProfile]
	if commander and table.find(commander.incompatible_game_rules, self.id) then
		return false
	end
	return true
end

function GameRules:GetDisabledText()
	local items = {}
	local sponsor = Presets.MissionSponsorPreset.Default[g_CurrentMissionParams.idMissionSponsor]
	if sponsor and table.find(sponsor.incompatible_game_rules, self.id) then
		items[#items + 1] = TLookupTag("<red>") .. T(3474, "Mission Sponsor") .. ": " .. sponsor.display_name .. Untranslated("</color>")
	end
	local commander = Presets.CommanderProfilePreset.Default[g_CurrentMissionParams.idCommanderProfile]
	if commander and table.find(commander.incompatible_game_rules, self.id) then
		items[#items + 1] = TLookupTag("<red>") .. T(3478, "Commander Profile") .. ": " .. commander.display_name .. Untranslated("</color>")
	end
	return table.concat(items, "\n")
end

UndefineClass('MissionLogoPreset')
DefineClass.MissionLogoPreset = {
	__parents = { "Preset", },
	properties = {
		{ id = "entity_name", name = "Entity Name", 
			editor = "text", default = "", },
		{ id = "image", name = "UI File", 
			editor = "text", default = "", },
		{ id = "display_name", name = "Display Name", 
			editor = "text", default = false, translate = true, },
		{ id = "filter", name = "Filter", 
			editor = "expression", default = function (self) return true end, },
		{ category = "General", id = "new_in", name = "New In", help = "The version, in which this logo was introduced", 
			editor = "combo", default = false, items = function (self) return DlcComboItems() end, },
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
		{ id = "colony_color_scheme", name = "Colony Color Scheme", 
			editor = "preset_id", default = "default", preset_class = "ColonyColorScheme", },
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
		{ category = "General", id = "pod_price", name = "Pod price (M)", 
			editor = "number", default = 100000000, scale = "mil", min = 0, },
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
			editor = "text", default = T(424227828326, --[[PresetDef MissionSponsorPreset default]] "Normal"), translate = true, },
		{ category = "Rockets", id = "rocket_class", name = "Rocket Class", 
			editor = "combo", default = "SupplyRocket", items = function (self) return RocketsComboItems end, },
		{ category = "Rockets", id = "pod_class", name = "Pod Class", 
			editor = "combo", default = false, items = function (self) return PodsComboItems end, },
		{ category = "General", id = "new_in", name = "New In", help = "The version, in which this sponsor was introduced", 
			editor = "combo", default = false, items = function (self) return DlcComboItems() end, },
		{ category = "General", id = "incompatible_game_rules", name = "Incompatible game rules", 
			editor = "string_list", default = {}, item_default = "", items = function (self) return PresetsCombo("GameRules") end, },
	},
	HasGroups = false,
	HasSortKey = true,
	EditorMenubarName = "Mission Sponsors",
	EditorMenubar = "Editors.Game",
}

DefineModItemPreset("MissionSponsorPreset", { EditorName = "Mission Sponsor" })
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
	if not self:IsKindOf("ModItemMissionSponsorPreset") then
		for i = 1, 5 do
			local category = "Goal "..i
			properties[#properties + 1] = { category = category, id = "sponsor_goal_"..i, name = T{10066, "Sponsor Goal <num>", num = i}, editor = "combo", default = i == 1 and "OldMissionEvaluation" or false, items = function (self) return SponsorGoalsCombo() end, }
			properties[#properties + 1] = { category = category, id = string.format("goal_%d_param_1",i), name = T(3904, "Param 1"), editor = "text", default = false, }
			properties[#properties + 1] = { category = category, id = string.format("goal_%d_param_2",i), name = T(3906, "Param 2"), editor = "text", default = false, }
			properties[#properties + 1] = { category = category, id = string.format("goal_%d_param_3",i), name = T(3908, "Param 3"), editor = "text", default = false, }
			properties[#properties + 1] = { category = category, id = "goal_image_"..i, name = T(10067, "Goal Image"), editor = "browse", default = "", }
			properties[#properties + 1] = { category = category, id = "goal_pin_image_"..i, name = T(11654, "Goal Pin Image"), editor = "browse", default = "", }
			properties[#properties + 1] = { category = category, id = "reward_effect_"..i, name = T(10068, "Reward"), editor = "nested_obj", base_class = "Effect", auto_expand = false, default = false, }
		end
	end
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

UndefineClass('ModifierItem')
DefineClass.ModifierItem = {
	__parents = { "PropertyObject", },
	properties = {
		{ id = "Label", 
			editor = "combo", default = "", items = function (self) return LabelsCombo() end, },
		{ id = "Prop", 
			editor = "combo", default = "", items = function (self) return ModifiablePropsCombo() end, },
		{ id = "Amount", 
			editor = "number", default = 0, },
		{ id = "Percent", 
			editor = "number", default = 0, },
		{ id = "Id", 
			editor = "text", default = false, },
	},
}

function ModifierItem:GetEditorView()
	return "Modify " .. self.Label .. "." .. self.Prop .. " " .. self.Amount .. " " .. self.Percent
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
			editor = "browse", default = "", folder = "UI", filter = "Image files|*.tga", image_preview_size = 200, },
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
			editor = "combo", default = "Normal", items = function (self) return table.keys(NotificationClasses) end, },
		{ id = "ShowVignette", name = "Show Vignette", 
			editor = "bool", default = false, },
		{ id = "VignetteImage", name = "Vignette Image", 
			editor = "browse", default = "", folder = "UI", filter = "Image files|*.tga", },
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
		self.ShowVignette = g_Classes[NotificationClasses[self[prop_id]]].show_vignette
		self.VignetteImage = g_Classes[NotificationClasses[self[prop_id]]].vignette_image
		self.VignettePulseDuration = g_Classes[NotificationClasses[self[prop_id]]].vignette_pulse_duration
		ObjModified(self)
	end
end

UndefineClass('POI')
DefineClass.POI = {
	__parents = { "Preset", },
	properties = {
		{ id = "display_name", name = "Display Name", 
			editor = "text", default = false, translate = true, },
		{ id = "description", name = "Description", 
			editor = "text", default = false, translate = true, lines = 3, max_lines = 20, },
		{ id = "display_icon", name = "Icon", 
			editor = "browse", default = "", folder = {"UI/Icons"}, filter = "Image files|*.tga", image_preview_size = 100, },
		{ category = "Location", id = "is_orbital", name = "Is in orbit", 
			editor = "bool", default = true, },
		{ id = "is_terraforming", 
			editor = "bool", default = false, },
		{ category = "Location", id = "spawn_period", name = "Spawn Period (sols)", help = "Spawn period range, (0,0) - when the previous is completed; (-1,-1) - in certain conditions;", 
			editor = "range", default = range(0, 0), min = -1, max = 2000, },
		{ category = "Location", id = "max_projects_of_type", name = "Max Spawn Projects", help = "Max Spawn Projects of that type at a time", 
			editor = "number", default = 5, min = 1, max = 10, },
		{ category = "Location", id = "first_spawn_location", name = "First Spawn  location", 
			editor = "choice", default = "random", items = function (self) return {"random", "poles","near", "thesame"} end, },
		{ category = "Location", id = "next_spawn_location", name = "Next Spawn  location", 
			editor = "choice", default = "random", items = function (self) return {"random", "poles","near", "thesame"} end, },
		{ category = "Rocket", id = "rocket_required_resources", name = "Required resources to launch", 
			editor = "nested_list", default = false, base_class = "ResourceAmount", inclusive = true, },
		{ category = "Rocket", id = "expedition_time", name = "Expedition Time(hours)", 
			editor = "number", default = 360000, scale = "hours", step = 30000, min = 0, max = 30000000, },
		{ category = "Rocket", id = "consume_rocket", name = "Consume_rocket", 
			editor = "bool", default = false, },
		{ category = "Effect", id = "terraforming_changes", name = "Terraforming params changing", 
			editor = "nested_list", default = false, base_class = "TerraformingParamAmount", inclusive = true, },
		{ id = "activation_by_tech_research", name = "Activation by Tech Research", 
			editor = "choice", default = false, items = function (self) return PresetsCombo("TechPreset", nil, "false") end, },
		{ id = "start_disabled", name = "Disabled on game start", help = "Enabled from story bit. On game start is disabled", 
			editor = "bool", default = false, },
		{ id = "OnCreation", name = "OnCreation(self,object, city, idx)", 
			editor = "func", default = function (self,object, city, idx)
return true
end, params = "self,object, city, idx", },
		{ id = "OnCompletion", name = "OnCompletion(self, object, city, idx)", 
			editor = "func", default = function (self, object, city, idx)
return true
end, params = "self, object, city, idx", },
		{ id = "PrerequisiteToCreate", name = "PrerequisiteToCreate(self, city, idx)", 
			editor = "func", default = function (self, city, idx)
return true
end, params = "self, city, idx", },
		{ id = "PrerequisiteToStart", name = "PrerequisiteToStart(self, object, city, idx)", 
			editor = "func", default = function (self, object, city, idx)
return true
end, params = "self, object, city, idx", },
		{ id = "GetOutcomeText", name = "GetOutcomeText(self, object, city, idx)", 
			editor = "func", default = function (self, object, city, idx)
return ""
end, params = "self, object, city, idx", },
		{ id = "CalcOutcome", name = "CalcOutcome(self, object, city, idx)", 
			editor = "func", default = function (self, object, city, idx)
return ""
end, params = "self, object, city, idx", },
	},
	GlobalMap = "POIPresets",
	EditorMenubarName = "POI",
	EditorMenubar = "Editors.Game",
}

UndefineClass('PlanetaryAnomalyDescription')
DefineClass.PlanetaryAnomalyDescription = {
	__parents = { "Preset", },
	properties = {
		{ id = "description", name = "Description Text", 
			editor = "text", default = false, translate = true, },
		{ id = "reward_type", name = "Reward", 
			editor = "combo", default = "", items = function (self) return PlaneteryAnomalyRewardTypeCombo end, },
		{ id = "requirement_type", name = "Requirement", 
			editor = "combo", default = "", items = function (self) return PlaneteryAnomalyRequirementTypeCombo end, },
		{ id = "reward_resource", name = "Reward Resource", 
			editor = "combo", default = "", 
			no_edit = function(self) return self.reward_type ~= "resources" end, items = function (self) return PlaneteryAnomalyRewardResourceCombo end, },
		{ id = "req_specialization", name = "Required Specialization", 
			editor = "combo", default = false, 
			no_edit = function(self) return self.requirement_type ~= "specialists" end, items = function (self) return ColonistSpecializationCombo end, },
		{ id = "condition", name = "Additional Condition", 
			editor = "func", default = function (self, anomaly)
return true
end, params = "self, anomaly", },
		{ id = "IsApplicable", 
			editor = "func", default = function (self, anomaly)
local a = anomaly
local rt = self.reward_type
if rt ~= "" and rt ~= a.reward then
	return false
end
if rt == "resources" and self.reward_resource ~= "" and self.reward_resource ~= a.reward_resource then
	return false
end
local rt, rs = self.requirement_type, self.req_specialization
if rt ~= "" and rt ~= a.requirement_type then
	return false
end
if rt == "specialists" and rs and rs ~= a.requirements.crew_specialization  then
	return false 
end
return self:condition(a)
end, dont_save = true, no_edit = true, params = "self, anomaly", },
	},
	EditorMenubar = "Editors.Game",
}

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
			editor = "browse", default = "", folder = "UI", filter = "Image files|*.tga", },
		{ id = "start_minimized", 
			editor = "bool", default = true, },
		{ id = "minimized_notification_priority", 
			editor = "choice", default = "Critical", items = function (self) return table.keys(NotificationClasses) end, },
		{ id = "no_ccc_button", 
			editor = "bool", default = false, },
		{ id = "validate_context", help = "Periodically validates the context of the OnScreenNotification (only used when start_minimized == true)", 
			editor = "func", default = false, params = "context", },
		{ id = "choice1", name = "Choice 1", 
			editor = "text", default = false, translate = true, lines = 2, max_lines = 8, },
		{ id = "choice1_img", name = "Choice 1 Image", 
			editor = "browse", default = "", folder = "UI", filter = "Image files|*.tga", },
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
			editor = "browse", default = "", folder = "UI", filter = "Image files|*.tga", },
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
			editor = "browse", default = "", folder = "UI", filter = "Image files|*.tga", },
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
			editor = "browse", default = "", folder = "UI", filter = "Image files|*.tga", },
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

UndefineClass('SponsorGoals')
DefineClass.SponsorGoals = {
	__parents = { "Preset", },
	properties = {
		{ id = "description", name = "Description", 
			editor = "text", default = false, translate = true, lines = 2, },
		{ category = "General", id = "Completed", name = "Completed", 
			editor = "func", default = function (self, state,  param1, param2, param3)
return true
end, params = "self, state,  param1, param2, param3", },
	},
	GlobalMap = "SponsorGoalsMap",
	EditorMenubarName = "Sponsor Goals",
	EditorMenubar = "Editors.Game",
}

UndefineClass('TechFieldPreset')
DefineClass.TechFieldPreset = {
	__parents = { "Preset", },
	properties = {
		{ category = "Field", id = "display_name", name = "Name", 
			editor = "text", default = T(3893, --[[PresetDef TechFieldPreset default]] "No Name"), translate = true, },
		{ category = "Field", id = "description", name = "Description", 
			editor = "text", default = T(3894, --[[PresetDef TechFieldPreset default]] "No Description"), translate = true, },
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
			editor = "text", default = T(3900, --[[PresetDef TechPreset default]] "<no name>"), translate = true, },
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
	EditorMenubarName = "Techs",
	EditorShortcut = "Ctrl-Alt-T",
	EditorMenubar = "Editors.Game",
	EditorCustomActions = {
	{
		FuncName = "TechEditor_Research",
		Icon = "CommonAssets/UI/Ged/play.tga",
		Name = "ResearchTech",
		Toolbar = "main",
	},
},
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

UndefineClass('ThresholdItem')
DefineClass.ThresholdItem = {
	__parents = { "PropertyObject", },
	properties = {
		{ id = "Id", 
			editor = "text", default = false, },
		{ id = "Threshold", 
			editor = "number", default = 0, },
		{ id = "Hysteresis", 
			editor = "number", default = 0, },
	},
}

function ThresholdItem:GetEditorView()
	return self.Id and (self.Id .. " " .. self.Threshold) or "Threshold"
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
			editor = "browse", default = "", folder = {"UI", "CommonAssets/UI"}, filter = "Image files|*.tga", },
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
		{ id = "daily_update_func", name = "Update every sol func", 
			editor = "func", default = false, params = "colonist, trait", },
		{ id = "apply_func", name = "Apply func", 
			editor = "func", default = false, params = "colonist, trait, init", },
		{ id = "unapply_func", name = "Remove func", 
			editor = "func", default = false, params = "colonist, trait", },
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

function TraitPreset:GetSaveDataForFile(...)
	ForEachPreset(TraitPreset, function(trait, group_list)
		trait.name =  nil
		trait.category = nil
	end)
	local result = Preset.GetSaveDataForFile(self, ...)
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
		{ id = "pregame_title", name = "PreGame menu title", 
			editor = "text", default = false, translate = true, },
		{ id = "description", name = "Description", 
			editor = "text", default = false, translate = true, },
		{ id = "map", name = "Map", 
			editor = "text", default = false, },
		{ id = "name", name = "Name", 
			editor = "text", default = false, },
		{ id = "image", name = "Image", help = "Pregame button image", 
			editor = "browse", default = false, folder = "UI/CommonNew/", filter = "Image files|*.tga", image_preview_size = 100, },
	},
	EditorMenubarName = "Tutorials",
	EditorMenubar = "Editors.GameUI",
}

Cargo.OnEditorSetProperty = SetFuncDebugInfo("@Data/ClassDef-PresetDefs.lua", 151, Cargo.OnEditorSetProperty)
Challenge.Completed = SetFuncDebugInfo("@Data/ClassDef-PresetDefs.lua", 277, Challenge.Completed)
Challenge.GetDeadline = SetFuncDebugInfo("@Data/ClassDef-PresetDefs.lua", 284, Challenge.GetDeadline)
Challenge.GetPerfectDeadline = SetFuncDebugInfo("@Data/ClassDef-PresetDefs.lua", 290, Challenge.GetPerfectDeadline)
Challenge.GetCompletedText = SetFuncDebugInfo("@Data/ClassDef-PresetDefs.lua", 296, Challenge.GetCompletedText)
Challenge.GetChallengeDescriptionProgressText = SetFuncDebugInfo("@Data/ClassDef-PresetDefs.lua", 309, Challenge.GetChallengeDescriptionProgressText)
ColonyColorScheme.OnEditorSetProperty = SetFuncDebugInfo("@Data/ClassDef-PresetDefs.lua", 341, ColonyColorScheme.OnEditorSetProperty)
ColonyColorScheme.OnEditorSelect = SetFuncDebugInfo("@Data/ClassDef-PresetDefs.lua", 348, ColonyColorScheme.OnEditorSelect)
CropPreset.SetLocked = SetFuncDebugInfo("@Data/ClassDef-PresetDefs.lua", 842, CropPreset.SetLocked)
GameRules.IsEnabled = SetFuncDebugInfo("@Data/ClassDef-PresetDefs.lua", 964, GameRules.IsEnabled)
GameRules.GetDisabledText = SetFuncDebugInfo("@Data/ClassDef-PresetDefs.lua", 978, GameRules.GetDisabledText)
MissionSponsorPreset.GetDynamicProperties = SetFuncDebugInfo("@Data/ClassDef-PresetDefs.lua", 1417, MissionSponsorPreset.GetDynamicProperties)
MissionSponsorPreset.GetFreeSpaceLeft = SetFuncDebugInfo("@Data/ClassDef-PresetDefs.lua", 1458, MissionSponsorPreset.GetFreeSpaceLeft)
ModifierItem.GetEditorView = SetFuncDebugInfo("@Data/ClassDef-PresetDefs.lua", 1500, ModifierItem.GetEditorView)
OnScreenNotificationPreset.OnEditorSetProperty = SetFuncDebugInfo("@Data/ClassDef-PresetDefs.lua", 1618, OnScreenNotificationPreset.OnEditorSetProperty)
RadioStationPreset.GetTracksFolder = SetFuncDebugInfo("@Data/ClassDef-PresetDefs.lua", 2045, RadioStationPreset.GetTracksFolder)
TechPreset.GetFieldDisplayName = SetFuncDebugInfo("@Data/ClassDef-PresetDefs.lua", 2288, TechPreset.GetFieldDisplayName)
TechPreset.GetFieldDescription = SetFuncDebugInfo("@Data/ClassDef-PresetDefs.lua", 2295, TechPreset.GetFieldDescription)
TechPreset.Getcost = SetFuncDebugInfo("@Data/ClassDef-PresetDefs.lua", 2302, TechPreset.Getcost)
TechPreset.ResearchQueueCost = SetFuncDebugInfo("@Data/ClassDef-PresetDefs.lua", 2313, TechPreset.ResearchQueueCost)
TechPreset.OnDataLoaded = SetFuncDebugInfo("@Data/ClassDef-PresetDefs.lua", 2319, TechPreset.OnDataLoaded)
ThresholdItem.GetEditorView = SetFuncDebugInfo("@Data/ClassDef-PresetDefs.lua", 2344, ThresholdItem.GetEditorView)
TraitPreset.AddIncompatible = SetFuncDebugInfo("@Data/ClassDef-PresetDefs.lua", 2482, TraitPreset.AddIncompatible)
TraitPreset.AddDomeColonistsModifier = SetFuncDebugInfo("@Data/ClassDef-PresetDefs.lua", 2490, TraitPreset.AddDomeColonistsModifier)
TraitPreset.RemoveDomeColonistsModifier = SetFuncDebugInfo("@Data/ClassDef-PresetDefs.lua", 2512, TraitPreset.RemoveDomeColonistsModifier)
TraitPreset.Apply = SetFuncDebugInfo("@Data/ClassDef-PresetDefs.lua", 2523, TraitPreset.Apply)
TraitPreset.UnApply = SetFuncDebugInfo("@Data/ClassDef-PresetDefs.lua", 2543, TraitPreset.UnApply)
TraitPreset.GetSaveDataForFile = SetFuncDebugInfo("@Data/ClassDef-PresetDefs.lua", 2557, TraitPreset.GetSaveDataForFile)
