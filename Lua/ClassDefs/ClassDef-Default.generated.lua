-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

UndefineClass('MapDataProperties')
DefineClass.MapDataProperties = {
	__parents = { "PropertyObject", },
	properties = {
		{ category = "Game", id = "AverageTemperature", 
			editor = "number", default = -55, },
		{ category = "Game", id = "MapSettings_DustStorm", 
			editor = "choice", default = "DustStorm_VeryLow", items = function (self) return DataInstanceCombo("MapSettings_DustStorm", "{name}", "disabled") end, },
		{ category = "Game", id = "MapSettings_DustDevils", 
			editor = "choice", default = "DustDevils_VeryLow", items = function (self) return DataInstanceCombo("MapSettings_DustDevils", "{name}", "disabled") end, },
		{ category = "Game", id = "MapSettings_Meteor", 
			editor = "choice", default = "Meteor_VeryLow", items = function (self) return DataInstanceCombo("MapSettings_Meteor", "{name}", "disabled") end, },
		{ category = "Game", id = "MapSettings_ColdWave", 
			editor = "choice", default = "ColdWave_VeryLow", items = function (self) return DataInstanceCombo("MapSettings_ColdWave", "{name}", "disabled") end, },
		{ category = "Game", id = "resupply_preset", 
			editor = "choice", default = "Start_medium", items = function (self) return GetResupplyPresetsCombo() end, },
		{ category = "Prefab", id = "weight", 
			editor = "number", default = 100, min = 0, },
		{ category = "Prefab", id = "challenge_rating", 
			editor = "number", default = 100, },
		{ category = "Prefab", id = "map_location", 
			editor = "prop table", default = false, },
		{ id = "map_altitude", 
			editor = "range", default = range(0, 255), min = 0, max = 255, },
		{ category = "Prefab", id = "type_info", 
			editor = "prop table", default = false, read_only = true, },
		{ category = "Prefab", id = "terrain_hash", 
			editor = "number", default = false, read_only = true, },
		{ category = "Dev", id = "StartMystery", 
			editor = "bool", default = false, },
		{ category = "Dev", id = "DisableHints", 
			editor = "bool", default = false, },
		{ category = "Prefab", id = "TechState", 
			editor = "prop table", default = false, },
	},
}

