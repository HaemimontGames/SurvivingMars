-- we'll store here temporarily the deposition types we need to remove while the effect is active
GlobalVar("g_CoverArtStoredDepositionTypes", setmetatable({}, weak_values_meta))

-- list of classes of objects that will be hidden - small rocks that break up the surface of the terrain
g_CoverArtStyle_HideClasses = {
	"StonesDarkSmall_01",
	"StonesDarkSmall_02",
	"StonesDarkSmall_03",
	"StonesDarkSmall_04",
	"StonesDarkSmall_05",
	"StonesDarkSmall_06",
	"StonesDarkGroup_01",
	"StonesDarkGroup_02",
	"StonesDarkGroup_03",
	"StonesRedSmall_01",
	"StonesRedSmall_02",
	"StonesRedSmall_03",
	"StonesRedSmall_04",
	"StonesRedSmall_05",
	"StonesSlateSmall_01",
	"StonesSlateSmall_02",
	"StonesSlateSmall_03",
	"StonesSlateSmall_04",
	"StonesSlateSmall_05",
	"StonesSlateSmall_06",
}

g_CoverArtStyle_RockCliffClasses_Deposition = false
g_CoverArtStyle_RockCliffClasses_NotDeposition = false

function CoverArtStyle_Activate()
	SuspendPassEdits("CoverArt") -- all operations modifying multiple objects need to be bracketed in SuspendPassEdits/ResumePassEdits with matching names for perf reasons
	g_CoverArtStoredDepositionTypes = {}
	
	MapClearEnumFlags(const.efVisible, "map", g_CoverArtStyle_HideClasses) -- hide small rocks
	if not g_CoverArtStyle_RockCliffClasses_Deposition or not g_CoverArtStyle_RockCliffClasses_NotDeposition then
		g_CoverArtStyle_RockCliffClasses_Deposition, g_CoverArtStyle_RockCliffClasses_NotDeposition = {}, {}
		for _, class in ipairs(ClassDescendantsList("CObject")) do
			if class:find("Cliff", 1, true) or class:find("Rocks", 1, true) or class:find("Slate_", 1, true) then
				table.insert( IsKindOf(g_Classes[class], "Deposition") and g_CoverArtStyle_RockCliffClasses_Deposition or g_CoverArtStyle_RockCliffClasses_NotDeposition, class)
			end
		end
	end
	MapForEach("map", 
		g_CoverArtStyle_RockCliffClasses_Deposition, 
		function(obj)
			g_CoverArtStoredDepositionTypes[obj] = obj:GetDepositionType() -- remember deposition type for this rock
			obj:SetDepositionType("None") -- clear deposition type for this rock
			obj:SetGameFlags(const.gofWhiteColored) -- set obnoxious color that will be recognized by shader; not really "white"
		end )
	MapSetGameFlags(const.gofWhiteColored, "map", g_CoverArtStyle_RockCliffClasses_NotDeposition )
	ResumePassEdits("CoverArt")
end

function CoverArtStyle_Deactivate()
	SuspendPassEdits("CoverArt")
	MapSetEnumFlags(const.efVisible, "map", g_CoverArtStyle_HideClasses) -- show small rocks again
	for obj,dep_type in pairs(g_CoverArtStoredDepositionTypes) do -- restore stored deposition types
		obj:SetDepositionType(dep_type)
		obj:ClearGameFlags(const.gofWhiteColored) -- remove obnoxious color
	end
	MapClearGameFlags(const.gofWhiteColored, "map", g_CoverArtStyle_RockCliffClasses_NotDeposition )
	ResumePassEdits("CoverArt")
end