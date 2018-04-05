-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('AmbientLife', {
	group = "Work",
	id = "WorkWaterReclamationSystem",
	param1 = "unit",
	param2 = "bld",
	PlaceObj('XPrgDefineSlot', {
		'groups', "A",
		'spot_type', "Worktablet",
		'move_start', "Pathfind",
		'goto_spot', "LeadToSpot",
		'flags_missing', 1,
		'usable_by_child', false,
	}),
	PlaceObj('XPrgPlaceObject', {
		'obj', "unit",
		'spot_type', "Tablet",
		'attach', true,
		'orient_axis', "1",
		'classname', "Tablet",
	}),
	PlaceObj('XPrgVisitSlot', {
		'unit', "unit",
		'bld', "bld",
		'group', "A",
	}),
	PlaceObj('XPrgLeadTo', {
		'loc', "Exit",
		'unit', "unit",
		'spot_obj', "bld",
	}),
})

