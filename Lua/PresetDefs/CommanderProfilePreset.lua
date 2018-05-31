-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

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
			editor = "func", default = function (self)
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
	
}

DefineModItemPreset("CommanderProfilePreset")

ModItemCommanderProfilePreset.EditorName = "Commander Profile"
