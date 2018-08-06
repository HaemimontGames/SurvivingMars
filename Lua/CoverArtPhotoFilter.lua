-- we'll store here temporarily the deposition types we need to remove while the effect is active
GlobalVar("g_CoverArtStoredDepositionTypes", {})

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
}

g_CoverArtStyle_RockCliffClasses = false

function CoverArtStyle_Activate()
	SuspendPassEdits("CoverArt") -- all operations modifying multiple objects need to be bracketed in SuspendPassEdits/ResumePassEdits with matching names for perf reasons
	g_CoverArtStoredDepositionTypes = {}
	MapClearEnumFlags(const.efVisible, "map", g_CoverArtStyle_HideClasses) -- hide small rocks
	if not g_CoverArtStyle_RockCliffClasses then
		g_CoverArtStyle_RockCliffClasses = table.ifilter(
			ClassDescendantsList("CObject"), 
			function(_, x)
				return x:find("Cliff", 1, true) or x:find("Rocks", 1, true)
			end)
	end
	MapForEach("map", 
		g_CoverArtStyle_RockCliffClasses, 
		function(obj)
			g_CoverArtStoredDepositionTypes[obj] = obj:GetDepositionType() -- remember deposition type for this rock
			obj:SetDepositionType("None") -- clear deposition type for this rock
			obj:SetGameFlags(const.gofWhiteColored) -- set obnoxious color that will be recognized by shader; not really "white"
		end )
	ResumePassEdits("CoverArt")
end

function CoverArtStyle_Deactivate()
	SuspendPassEdits("CoverArt")
	MapSetEnumFlags(const.efVisible, "map", g_CoverArtStyle_HideClasses) -- show small rocks again
	for obj,dep_type in pairs(g_CoverArtStoredDepositionTypes) do -- restore stored deposition types
		obj:SetDepositionType(dep_type)
		obj:ClearGameFlags(const.gofWhiteColored) -- remove obnoxious color
	end
	ResumePassEdits("CoverArt")
end