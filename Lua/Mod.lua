--Allowed tags (display_name is not translated, because tags, as displayed to the user, never get translated)
PredefinedModTags = {
	{ id = "TagCommanderProfiles", display_name = "Commander Profile" },
	{ id = "TagMissionSponsors",   display_name = "Mission Sponsors" },
	{ id = "TagColonyLogos",       display_name = "Colony Logos" },
	{ id = "TagGameplay",          display_name = "Gameplay" },
	{ id = "TagBuildings",         display_name = "Buildings" },
	{ id = "TagResearch",          display_name = "Research" },
	{ id = "TagCrops",             display_name = "Crops" },
	{ id = "TagTraits",            display_name = "Traits" },
	{ id = "TagRadio",             display_name = "Radio" },
	{ id = "TagLightmodels",       display_name = "Lightmodels" },
	{ id = "TagTranslations",      display_name = "Translations" },
	{ id = "TagPhotoFilters",      display_name = "Photo Filters" },	
	{ id = "TagCosmetics",         display_name = "Cosmetics" },
	{ id = "TagInterface",         display_name = "Interface" },
	{ id = "TagTools",             display_name = "Tools" },
	{ id = "TagOther",             display_name = "Other" },
}

PredefinedModTagsByName = { }
for i,tag in ipairs(PredefinedModTags) do
	PredefinedModTagsByName[tag.display_name] = tag
end

function OnMsg.ClassesGenerate(classdefs)
	local mod = classdefs["ModDef"]
	local properties = mod.properties
	
	for i,tag in ipairs(PredefinedModTags) do
		local prop_meta = { category = "Tags", id = tag.id, name = Untranslated(tag.display_name), editor = "bool", default = false }
		table.insert(properties, prop_meta)
	end
end

function ModDef:GetTags()
	local tags_used = { }
	for i,tag in ipairs(PredefinedModTags) do
		if self[tag.id] then
			table.insert(tags_used, tag.display_name)
		end
	end
	
	return tags_used
end
