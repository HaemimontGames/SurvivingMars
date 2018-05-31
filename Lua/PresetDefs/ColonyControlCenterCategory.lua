-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

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
	
}


