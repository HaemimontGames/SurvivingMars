--When adding a new specialization - look into:
-- Consts, GatherLabels, ColonistClasses (and maybe others)
const.ColonistSpecialization = 
{
	["none"] = {
		display_name = T(3848, "No specialization"), display_name_plural = T(3848, "No specialization"), display_icon = "UI/Icons/Colonists/Malenone.tga",
		description = T(3849, "A brave citizen of Mars, ready to tame the final frontier."), },
	["scientist"]= {
		display_name = T(3850, "Scientist"), display_name_plural = T(3851, "Scientists"), display_icon = "UI/Icons/Colonists/Femalescientist.tga",
		description = T(3852, "A trained scientist, eager to discover the mysteries of the Cosmos."), },
	["engineer"] = {
		display_name = T(3853, "Engineer"),  display_name_plural = T(3854, "Engineers"), display_icon = "UI/Icons/Colonists/Femaleengineer.tga",
		description = T(3855, "A trained engineer, building a better future for humanity."), },
	["security"] = {
		display_name = T(3856, "Officer"),  display_name_plural = T(3857, "Officers"), display_icon = "UI/Icons/Colonists/Femalesecurity.tga",
		description = T(3858, "A trained security officer, protecting our Utopia."), },
	["geologist"] = {
		display_name = T(3859, "Geologist"),  display_name_plural = T(3860, "Geologists"), display_icon = "UI/Icons/Colonists/Malegeologist.tga",
		description = T(3861, "A trained geologist, securing vital resources for the Colony."), },
	["medic"] = {
		display_name = T(3862, "Medic"), display_name_plural = T(3863, "Medics"), display_icon = "UI/Icons/Colonists/Femalemedic.tga",
		description = T(3864, "A trained medic, facing new challenges on the red planet."), },
	["botanist"] = {
		display_name = T(3865, "Botanist"), display_name_plural = T(3866, "Botanists"), display_icon = "UI/Icons/Colonists/Malebotanist.tga",
		description = T(3867, "A trained botanist, dreaming of a green Mars."), },
}

ColonistSpecializationList = table.keys2(const.ColonistSpecialization, true)
table.remove_entry(ColonistSpecializationList, "none")

local ColonistSpecialization = const.ColonistSpecialization
function GetSpecialization(specialist)
	return ColonistSpecialization[specialist] or ColonistSpecialization["none"]
end

function GetColonistSpecializationCombo(empty, auto)
	return function()
		local items = {}
		for k, val in sorted_pairs(const.ColonistSpecialization) do
			if empty or k ~= "none" then
				items[#items + 1] = {value = k, text = val.display_name}
			end	
		end
		if auto then
			table.insert(items, 1, {value = "auto", text = T(669, "Auto")})
		end
		return items
	end
end

ColonistClasses = {
	["none"] = "",
	["scientist"] = "Scientist",
	["engineer"] = "Engineer",
	["security"] = "Security",
	["botanist"] = "Botanist",
	["geologist"] = "Geologist",
	["medic"] = "Medic",
}

local ColonistRace = {"Ca", "Af", "As", "Ar", "Hs"}

function GetSpecialistEntity(specialist, gender, race, age_trait, traits)
	local spec = ColonistClasses[specialist or "none"]
	if not spec or spec == "" then
		spec = "Colonist"
	end
	local race_prefix = race and ColonistRace[race]
	local variants
	if traits and traits.Android then
		race_prefix = "An"
		age_trait = "Adult"
		variants = 1
		spec = "Colonist"
	elseif traits and traits.Child then
		age_trait = "Child"
		variants = 2
	else
		if age_trait == "Youth" or age_trait == "Middle Aged" then
			age_trait = "Adult"
		elseif age_trait == "Senior" then
			age_trait = "Retiree"
		end
		if age_trait == "Retiree" or (gender == "Female" and (race_prefix == "Ar" or race_prefix == "Hs")) then
			variants = 2
		else
			variants = 4
		end
	end
	local variant = Random(1, variants)
	local str = string.format("%s_%s_%s_%.2d",  gender, race_prefix, age_trait, variant)
	local entity = string.format("Unit_%s_%s", spec, str)
	local infopanel_icon = string.format("UI/Icons/Colonists/IP/IP_Unit_%s.tga", str)
	local pin_icon = string.format("UI/Icons/Colonists/Pin/Unit_%s.tga", str)
	assert(IsValidEntity(entity))
	return entity, infopanel_icon, pin_icon
end

function GetOutsideEntity(gender, race, age_trait, traits)
	local spec = "Astronaut"
	local race_prefix = "All"
	local variant = 1
	local entity
	if traits and traits.Child then
		age_trait = "Child"
		entity = string.format("Unit_%s_%s_%s_%.2d", spec, race_prefix, age_trait, variant)
		assert(IsValidEntity(entity))
	else
		age_trait = "Adult"
		entity = string.format("Unit_%s_%s_%s_%s_%.2d", spec, gender, race_prefix, age_trait, variant)
		assert(IsValidEntity(entity))
	end
	return entity
end

function ValidateSpecialization(colonist)
	local specialization = colonist.specialist
	local traits = colonist.traits
	if not traits[specialization] then 
	--	sepcialization not added in traits
		colonist:AddTrait(specialization)
	end
	traits = colonist.traits
	for spec, _ in pairs(const.ColonistSpecialization) do
		if spec~=specialization and traits[spec] then
			--duplicated sepcialization added in traits
			colonist:RemoveTrait(spec)
		end
	end
end