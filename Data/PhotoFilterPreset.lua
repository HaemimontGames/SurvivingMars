-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('PhotoFilterPreset', {
	SortKey = 1000,
	desc = T(7072, --[[PhotoFilterPreset None desc]] "None"),
	displayName = T(7071, --[[PhotoFilterPreset None displayName]] "None"),
	id = "None",
})

PlaceObj('PhotoFilterPreset', {
	SortKey = 2000,
	desc = T(5682, --[[PhotoFilterPreset BlackAndWhite1 desc]] "Black and White 1"),
	displayName = T(5681, --[[PhotoFilterPreset BlackAndWhite1 displayName]] "B&W 1"),
	filename = "PhotoFilter.fx|BLACK_AND_WHITE_1",
	group = "Default",
	id = "BlackAndWhite1",
})

PlaceObj('PhotoFilterPreset', {
	SortKey = 3000,
	desc = T(7313, --[[PhotoFilterPreset BlackAndWhite2 desc]] "Black and White 2"),
	displayName = T(7312, --[[PhotoFilterPreset BlackAndWhite2 displayName]] "B&W 2"),
	filename = "PhotoFilter.fx|BLACK_AND_WHITE_2",
	group = "Default",
	id = "BlackAndWhite2",
})

PlaceObj('PhotoFilterPreset', {
	SortKey = 4000,
	desc = T(7315, --[[PhotoFilterPreset BlackAndWhite3 desc]] "Black and White 3"),
	displayName = T(7314, --[[PhotoFilterPreset BlackAndWhite3 displayName]] "B&W 3"),
	filename = "PhotoFilter.fx|BLACK_AND_WHITE_3",
	group = "Default",
	id = "BlackAndWhite3",
})

PlaceObj('PhotoFilterPreset', {
	SortKey = 5000,
	desc = T(7316, --[[PhotoFilterPreset BleachBypass desc]] "Bleach Bypass"),
	displayName = T(7316, --[[PhotoFilterPreset BleachBypass displayName]] "Bleach Bypass"),
	filename = "PhotoFilter.fx|BLEACH_BYPASS",
	group = "Default",
	id = "BleachBypass",
})

PlaceObj('PhotoFilterPreset', {
	SortKey = 6000,
	desc = T(725335706535, --[[PhotoFilterPreset OrtonEffect desc]] "A vivid effect"),
	displayName = T(206642846467, --[[PhotoFilterPreset OrtonEffect displayName]] "Orton"),
	filename = "PhotoFilter.fx|ORTON_EFFECT",
	group = "Default",
	id = "OrtonEffect",
})

PlaceObj('PhotoFilterPreset', {
	SortKey = 7000,
	activate = function (self)
CoverArtStyle_Activate()
end,
	deactivate = function (self)
CoverArtStyle_Deactivate()
end,
	desc = T(204340117651, --[[PhotoFilterPreset CoverArt desc]] "Cover Art-style"),
	displayName = T(276606203553, --[[PhotoFilterPreset CoverArt displayName]] "Cover Art"),
	filename = "PhotoFilter.fx|COVER_ART",
	group = "Default",
	id = "CoverArt",
	texture1 = "Textures/Misc/coverart_palette.tga",
	texture2 = "Textures/Misc/coverart_terrain_palette.tga",
})

