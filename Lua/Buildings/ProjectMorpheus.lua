DefineClass.ProjectMorpheus = {
	__parents = { "ElectricityConsumer"},
	added_traits_log = false,
	lifetime = false,
	wait_working_anims_to_finish = true,
}

function ProjectMorpheus:Init()
	self.added_traits_log = {}
	self.lifetime = 0
end

function ProjectMorpheus:AddTrait(unit)
	local trait = GetRandomTrait(unit.traits, {}, {}, "Positive", "base")
	unit:AddTrait(trait)
	self.added_traits_log[trait] = (self.added_traits_log[trait] or 0)+ 1
	self.lifetime = self.lifetime + 1
end

function ProjectMorpheus:GetUISectionProjectMorpheusRollover()
	local items = {}
	for trait_id, val in sorted_pairs(self.added_traits_log) do
		local trait = TraitPresets[trait_id]
		items[#items + 1] = T{432, "<trait_name><right><value>", trait_name = trait.display_name, value = val}
	end	
	return next(items) and table.concat(items, "<newline><left>") or T{433, "Information about the traits developed by Colonists under the effect of Project Morpheus"}
end