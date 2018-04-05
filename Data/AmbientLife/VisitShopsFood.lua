-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('AmbientLife', {
	group = "Visit",
	id = "VisitShopsFood",
	param1 = "unit",
	param2 = "bld",
	PlaceObj('XPrgDefineSlot', {
		'groups', "A",
		'spot_type', "Visitshop",
		'goto_spot', "Pathfind",
		'flags_missing', 1,
	}),
	PlaceObj('XPrgVisitSlot', {
		'unit', "unit",
		'bld', "bld",
		'group', "A",
		'group_fallback', "Holder",
	}),
})

