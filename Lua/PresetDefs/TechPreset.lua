-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

DefineClass.TechPreset = {
	__parents = { "Preset", "GameEffectsContainer", },
	properties = {
		{ category = "Tech", id = "display_name", name = T{1000067, "Display Name"}, help = T{239538425780, "Tech Game Name - translated string"}, 
			editor = "text", default = T{3900, "<no name>"}, translate = true, },
		{ category = "Tech", id = "icon", name = T{94, "Icon"}, help = T{448278754672, "Tech Game Icon"}, 
			editor = "browse", default = "UI/Icons/Research/rm_placeholder.tga", folder = "UI", filter = "Image files|*.tga", },
		{ category = "Tech", id = "dlc", name = T{3895, "Required DLC"}, help = T{3895, "Required DLC"}, 
			editor = "combo", default = "", items = function (self) return DlcCombo() end, },
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
	EditorShortcut = "Ctrl-Alt-T",
	GedEditor = "TechEditor",
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
