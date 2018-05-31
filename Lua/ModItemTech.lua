local function folder_fn(obj)
	return {
		{ obj.mod.path, os_path = true },
		{ "UI", game_path = true },
	}
end

DefineClass.ModItemTech = { --Kept for backwards compatibility (mods with DataInstances, instead of Presets)
	__parents = { "ModItem", "Tech" },
	properties = {
		{ category = "Tech", id = "icon", name = T{94, "Icon"}, editor = "browse", help = "Tech Game Icon", default = "", folder = folder_fn, os_path = true, filter = "Image files|*.tga" },
		{ category = "Tech", id = "field", name = T{3721, "Field"}, editor = "combo", default = "Breakthroughs", items = function() return ResearchFieldsCombo() end, },
	},
	EditorName = "",
}

function ModItemTech:OnModLoad()
	local mod = self.mod
	local tech = ConvertTechToTechPreset(self)
	tech.mod = mod
	
	local index = table.find(mod.items, self) or (#mod.items + 1)
	mod.items[index] = tech
	tech:OnModLoad()
end

DefineModItemPreset("TechPreset", {
	properties = {
		{ category = "Tech", id = "icon", name = T{94, "Icon"}, editor = "browse", help = T{448278754672, "Tech Game Icon"}, default = "UI/Icons/Research/rm_placeholder.tga", folder = folder_fn, os_path = true, filter = "Image files|*.tga" },
	},
	group = "Breakthroughs",
	EditorName = "Technology",	
	GedEditor = false,
})

function ModItemTechPreset:OnModLoad()
	if self.condition() then
		ModItemPreset.OnModLoad(self)
		self:OnDataLoaded()
	end
end

function ModItemTechPreset:TestModItem(ged)
	if not UICity then return end
	UICity:SetTechResearched(self.id)
end

function OnMsg.ClassesBuilt()
	local meta = ModItemTechPreset:GetPropertyMetadata("Group")
	meta.default = "Breakthroughs"
end