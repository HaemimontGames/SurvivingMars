-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

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
			editor = "number", default = 0, min = -500, max = 500, },
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
	effect = "",
}

DefineModItemPreset("GameRules")

ModItemGameRules.EditorName = "Game Rule"
