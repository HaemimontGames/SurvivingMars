--Allowed tags (display_name is not translated)
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
	{ id = "TagCosmetics",         display_name = "Cosmetics" },
	{ id = "TagInterface",         display_name = "Interface" },
	{ id = "TagTools",             display_name = "Tools" },
	{ id = "TagOther",             display_name = "Other" },
}

if IsDlcAvailable("armstrong") then
	table.insert(PredefinedModTags, 8, { id = "TagTerraforming",      display_name = "Terraforming" })
	table.insert(PredefinedModTags, 9, { id = "TagLandscaping",       display_name = "Landscaping" })
	table.insert(PredefinedModTags, 10, { id = "TagVegetation",        display_name = "Vegetation" })
end

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

--Backward compatibility with mods that use old tags system
local function ParseOldTags(tags_str)
	local tags = { }
	for tag in tags_str:gmatch("([^,; ]+)[,; ]?") do
		tag = tag:match("^%s*(.-)%s*$")
		tag = tag:gsub("%s+", " ")
		if not tags[tag] then
			tags[#tags + 1] = tag
			tags[tag] = true
		end
	end
	return tags
end

function OnMsg.ModDefsLoaded()
	local lowercase_tags = { }
	for i, tag in ipairs(PredefinedModTags) do
		lowercase_tags[string.lower(tag.id)] = tag.id
	end
	
	for i,mod in ipairs(ModsList) do
		local tags = ParseOldTags(mod.tags)
		for j,tag in ipairs(tags) do
			local member_id = lowercase_tags["tag" .. string.lower(tag)]
			if member_id then
				mod[member_id] = true
			end
		end
	end
end

function OnMsg.GatherTestableModItemClasses(classes)
	classes[#classes + 1] = "ModItemMissionSponsorPreset"
	classes[#classes + 1] = "ModItemCommanderProfilePreset"
end

function OnMsg.CurrentlyEditedModItemsChosen(chosen_items, all_items)
	local sponsor = chosen_items["ModItemMissionSponsorPreset"]
	local any_sponsor = next(all_items["ModItemMissionSponsorPreset"] or empty_table)
	if sponsor then
		g_CurrentMissionParams.idMissionSponsor = sponsor.id
		ModLog(T{12430, "Using the <sponsor> Sponsor Mod Item", sponsor = sponsor.display_name})
	elseif any_sponsor then
		ModLog(T(12431, "Cannot determine Sponsor Mod Item. More than one Sponsor Mod Items are active."))
	end
	
	local commander = chosen_items["ModItemCommanderProfilePreset"]
	local any_commander = next(all_items["ModItemCommanderProfilePreset"] or empty_table)
	if commander then
		g_CurrentMissionParams.idCommanderProfile = commander.id
		ModLog(T{12432, "Using the <commander> Commander Profile Mod Item", commander = commander.display_name})
	elseif any_commander then
		ModLog(T(12433, "Cannot determine Commander Profile Mod Item. More than one Commander Profile Mod Items are active."))
	end
end

function OnMsg.VerifyModItemEntity(moditem, entity, ged)
	if not IsKindOf(moditem, "ModItemBuildingTemplate") then return end
	
	ModLog(T{12434, "Checking validity of building entity <u(entity)> used in building <u(building)>.", building = moditem.id, entity = entity})
	local any_errors
	
	local required_surfaces = { "HexShape", "Selection", "Collision" }
	for i,surf in ipairs(required_surfaces) do
		if not HasAllSurfaces(entity, EntitySurfaces[surf]) then
			ModLog(T{12435, "Entity <u(entity)> used in building <u(building)> must have a <u(surf)> surface.", building = moditem.id, entity = entity, surf = surf})
			any_errors = true
		end
	end
	
	local optional_surfaces = { "Walk" }
	for i,surf in ipairs(optional_surfaces) do
		if not HasAllSurfaces(entity, EntitySurfaces[surf]) then
			ModLog(T{12436, "Entity <u(entity)> used in <u(building)> may have a <u(surf)> surface.", building = moditem.id, entity = entity, surf = surf})
		end
	end
	
	local required_spots = { "Top", "Workdrone" }
	for i,spot in ipairs(required_spots) do
		local first, last = GetSpotRange(entity, 0, spot)
		if first == -1 then
			ModLog(T{12437, "Entity <u(entity)> used in <u(building)> must have at least one <u(spot)> spot.", building = moditem.id, entity = entity, spot = spot})
			any_errors = true
		end
	end
	
	local optional_spots = { "Tube", "Lifesupportgrid", "Autolight", "Door" }
	for i,spot in ipairs(optional_spots) do
		local first, last = GetSpotRange(entity, 0, spot)
		if first == -1 then
			ModLog(T{12438, "Entity <u(entity)> used in <u(building)> may have <u(spot)> spots.", building = moditem.id, entity = entity, spot = spot})
		end
	end
	
	local hex_spots = { ["Tube"] = "inside", ["Lifesupportgrid"] = "outside" }
	local misalligned_spots_list = { }
	local misplaced_inside_spots_list = { }
	local misplaced_outside_spots_list = { }
	local shape = GetEntityOutlineShape(entity)
	for spot,kind in pairs(hex_spots) do
		local first, last = GetSpotRange(entity, 0, spot)
		if first ~= -1 then
			for i=first,last do
				local pos = GetEntitySpotPos(entity, i)
				local center = HexGetNearestCenter(pos)
				if pos ~= center then
					misalligned_spots_list[spot] = true
				end
				local hex = point(WorldToHex(center))
				if table.find(shape, hex) then
					if kind == "outside" then
						misplaced_outside_spots_list[spot] = true
					end
				elseif kind == "inside" then
					misplaced_inside_spots_list[spot] = true
				end
			end
		end
	end
	if next(misalligned_spots_list) then
		for spot in pairs(misalligned_spots_list) do
			ModLog(T{12439, "Entity <u(entity)> used in <u(building)> must have all its <u(spot)> spots in the centers of respective hexes.", building = moditem.id, entity = entity, spot = spot})
		end
	end
	if next(misplaced_outside_spots_list) then
		for spot in pairs(misplaced_outside_spots_list) do
			ModLog(T{12440, "Entity <u(entity)> used in <u(building)> must have all its <u(spot)> spots outside the building hex shape.", building = moditem.id, entity = entity, spot = spot})
		end
	end
	if next(misplaced_inside_spots_list) then
		for spot in pairs(misplaced_inside_spots_list) do
			ModLog(T{12441, "Entity <u(entity)> used in <u(building)> must have all its <u(spot)> spots inside the building hex shape.", building = moditem.id, entity = entity, spot = spot})
		end
	end
	
	if not any_errors then
		ModLog(T{12442, "Entity <u(entity)> used in <u(building)> is valid.", building = moditem.id, entity = entity})
	else
		ModLog(T{12443, "Entity <u(entity)> used in <u(building)> is invalid.", building = moditem.id, entity = entity})
	end
end

----

GlobalVar("ReportedModLuaError", false)

function OnMsg.OnModLuaError(mod, err, stack)
	if ReportedModLuaError then
		return
	end
	ReportedModLuaError = true
	CreateMessageBox(T(6902, "Warning"), T(12646, "Mod-related problem detected in the game logic. Try disabling the mods in case of unexpected game behavior."), T(1000136, "OK"))
end