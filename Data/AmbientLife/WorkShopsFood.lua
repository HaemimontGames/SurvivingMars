-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('AmbientLife', {
	group = "Work",
	id = "WorkShopsFood",
	param1 = "unit",
	param2 = "bld",
	PlaceObj('XPrgDefineSlot', {
		'groups', "A",
		'spot_type', "Workshop",
		'move_start', "Pathfind",
		'goto_spot', "LeadToSpot",
		'flags_missing', 1,
		'usable_by_child', false,
	}),
	PlaceObj('XPrgVisitSlot', {
		'unit', "unit",
		'bld', "bld",
		'group', "A",
	}),
	PlaceObj('XPrgLeadTo', {
		'loc', "PassableExit",
		'unit', "unit",
		'spot_obj', "bld",
	}),
})

