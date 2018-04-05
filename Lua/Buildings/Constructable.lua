--[[@@@
@class Constructable
holds common props for objects that are constructable through the regular construction pipeline
--]]
DefineClass.Constructable = {
	__parents = { "SyncObject" },
	properties = {
		{ template = true, name = T{95, "Concrete Cost"},        id = "construction_cost_Concrete", category = "Construction", editor = "number", default = 0, scale = const.ResourceScale, modifiable = true},
		{ template = true, name = T{96, "Metals Cost"},          id = "construction_cost_Metals",   category = "Construction", editor = "number", default = 0, scale = const.ResourceScale, modifiable = true},
		{ template = true, name = T{97, "Polymers Cost"},        id = "construction_cost_Polymers", category = "Construction", editor = "number", default = 0, scale = const.ResourceScale, modifiable = true},
		{ template = true, name = T{98, "Electronics Cost"},     id = "construction_cost_Electronics",    category = "Construction", editor = "number", default = 0, scale = const.ResourceScale, modifiable = true},
		{ template = true, name = T{99, "Machine Parts Cost"},   id = "construction_cost_MachineParts",    category = "Construction", editor = "number", default = 0, scale = const.ResourceScale, modifiable = true},
		{ template = true, name = T{100, "Rare Metals Cost"},     id = "construction_cost_PreciousMetals",    category = "Construction", editor = "number", default = 0, scale = const.ResourceScale, modifiable = true},
--		{ template = true, name = T{"Water Cost"},           id = "construction_cost_Water",    category = "Construction", editor = "number", default = 0, scale = const.ResourceScale, modifiable = true},
		{ template = true, name = T{131, "Black Cubes Cost"},     id = "construction_cost_BlackCube",    category = "Construction", editor = "number", default = 0, scale = const.ResourceScale, modifiable = true},
		{ template = true, name = T{132, "Construction Entity"},  id = "construction_entity", category = "Construction", editor = "dropdownlist", items = function() return GetBuildingEntities(false) end, default = false },
		{ template = true, name = T{133, "Build Points"},         id = "build_points",      category = "Construction", editor = "number",       default = 10000},
		{ template = true, name = T{134, "Instant Build"},        id = "instant_build",     category = "Construction", editor = "bool",         default = false },
		{ template = true, name = T{135, "Requires Prefab"},      id = "require_prefab",     category = "Construction", editor = "bool",         default = false },
		{ template = true, name = T{136, "Can Rotate"},        	  id = "can_rotate_during_placement",     category = "Construction", editor = "bool", default = true, help = "Whether the building can be rotated during placement.", },
		{ template = true, name = T{137, "Too Tall for Pipes"},   id = "is_tall",     category = "Construction", editor = "bool", default = false, help = "Whether the building can be placed under life support pipes.", no_edit = function(self) return IsKindOf(g_Classes[self.template_class], "LifeSupportGridObject") end},
		{ template = true, name = T{138, "Construction Site Applies Height Surfaces"},  id = "construction_site_applies_height_surfaces",     category = "Construction", editor = "bool", default = false, help = "Whether the construction site should apply it's height surfaces.", },
		{ template = true, name = T{139, "Does Require Dome"},  id = "dome_required",     category = "Construction", editor = "bool", default = false, help = "Whether the building should be placed inside a dome.", },
		{ template = true, name = T{140, "Specific Dome Spot"},  id = "dome_spot",     category = "Construction", editor = "text", default = "none", help = "Only for buildings that can be built in a dome, will snap to the cursor closest such dome spot during placement.", },
		{ template = true, name = T{141, "Cannot Build in Dome"},  id = "dome_forbidden",     category = "Construction", editor = "bool", default = false, help = "Whether the building is prohibited from placement inside a dome.", },
		{ template = true, name = T{142, "Wonder"},               id = "wonder",     category = "Construction", editor = "bool", default = false, help = "Whether the building is considered a Wonder or not.", },
		{ modifiable = true, name = T{143, "In-Dome Construction Modifer"},  id = "in_dome_construction_modifier", category = "Construction", editor = "number", default = 100, help = "If constructed inside a dome, this mod will be applied to construction cost.", },
		{ template = true, name = T{144, "Extend entity bb during placement checks"},  id = "force_extend_bb_during_placement_checks", category = "Construction", editor = "number", default = 0, help = "During placement, entity bb will be extended this much to catch obstructors in the hex shape way out of the entity bb.", },
		{ template = true, name = T{145, "Can cancel?"}, id = "can_cancel", editor = "bool", default = true, category = "Construction", },
		{ template = true, name = T{146, "Can change prio?"}, id = "can_user_change_prio", editor = "bool", default = true, category = "Construction",},
		{ template = true, name = T{147, "Don’t show in Build Menu"}, id = "hide_from_build_menu", editor = "bool", default = false, category = "Construction",},
		{ template = true, name = T{148, "Construction State"}, id = "construction_state", editor = "combo", default = "idle", items = function(obj) return GetEntityStatesForTemplateObj(obj,true) end,category = "Construction",},
		{ template = true, name = T{149, "Show Decals During Placement"}, id = "show_decals_on_placement", editor = "bool", default = false, category = "Construction",},
		{ template = true, name = T{150, "Show range of specific building"}, id = "show_range_class", category = "Construction", editor = "dropdownlist", default = "", items = BuildingClassesCombo },
		{ template = true, name = T{7330, "Unlocked Achievement"},            id = "achievement",      category = "Construction", editor = "text",         default = "", help = "Achievement unlocked when completely constructing this building" },
		{ template = true, name = T{8491, "Lights On During Placement"}, id = "lights_on_during_placement", category = "Construction", editor = "bool", default = false },
	},
}