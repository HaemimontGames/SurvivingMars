local function folder_fn(obj)
	return {
		{ obj.mod.path, os_path = true },
		{ "UI", game_path = true },
	}
end

DefineClass.ModItemTech = {
	__parents = { "ModItem", "Tech" },
	properties = {
		{ category = "Tech", id = "icon", name = T{94, "Icon"}, editor = "browse", help = "Tech Game Icon", default = "", folder = folder_fn, os_path = true, filter = "Image files|*.tga" },
		{ category = "Tech", id = "field", name = T{3721, "Field"}, editor = "combo", default = "Breakthroughs", items = function() return GetTechFieldsCombo() end, },
	},
	
	EditorName = "Technology",
}

function ModItemTech:Setid(id)
	self.id = id
end

function ModItemTech:OnModLoad()
	ModItem.OnModLoad(self)

	local prev = TechDef[self.id]
	TechDef[self.id] = self
	if prev then
		local field = TechTree[prev.field]
		table.remove_entry(field, prev)
	end
	local field = TechFields[self.field] or TechFields.Breakthroughs
	field[#field + 1] = self
end