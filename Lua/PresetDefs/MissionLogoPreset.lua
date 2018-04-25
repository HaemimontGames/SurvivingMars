-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

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
	effect = "",
	rollover_text = false,
	enabled = false,
	challenge_mod = 0,
}


