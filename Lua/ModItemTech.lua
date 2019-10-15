DefineModItemPreset("TechPreset", {
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

DefineModItemPreset("TechFieldPreset", {
	EditorName = "TechField",
	GedEditor = false,
})