local function folder_fn(obj)
	return {
		{ obj.mod.content_path, os_path = true },
		{ "UI", game_path = true },
	}
end

DefineModItemPreset("TechPreset", {
	properties = {
		{ category = "Tech", id = "icon", name = T(94, "Icon"), editor = "browse", help = T(448278754672, "Tech Game Icon"), default = "UI/Icons/Research/rm_placeholder.tga", folder = folder_fn, os_path = true, filter = "Image files|*.png;*.tga" },
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