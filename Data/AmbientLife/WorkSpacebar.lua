-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('AmbientLife', {
	group = "Work",
	id = "WorkSpacebar",
	param1 = "unit",
	param2 = "bld",
	PlaceObj('XPrgDefineSlot', {
		'groups', "A",
		'spot_type', "Workbar",
		'goto_spot', "Pathfind",
		'flags_missing', 1,
		'usable_by_child', false,
	}),
	PlaceObj('XPrgNearestAttach', {
		'bld', "bld",
		'classname', "SpacebarElevator",
		'spot_type', "Passenger",
		'target', "unit",
		'var_obj', "elevator",
	}),
	PlaceObj('XPrgUseObject', {
		'obj', "elevator",
		'param1', "unit",
	}),
	PlaceObj('XPrgVisitSlot', {
		'unit', "unit",
		'bld', "bld",
		'group', "A",
		'group_fallback', "Holder",
	}),
	PlaceObj('XPrgNearestSpot', {
		'obj', "bld",
		'spot_type', "Elevator",
		'target', "unit",
		'var_spot', "spot",
		'var_pos', "pos",
	}),
	PlaceObj('XPrgGetSlotFromSpot', {
		'obj', "bld",
		'spot', "spot",
		'var_slotname', "slotname",
		'var_slot', "slot",
	}),
	PlaceObj('XPrgChangeSlotFlags', {
		'bld', "bld",
		'obj', "bld",
		'spot', "spot",
		'slotname', "slotname",
		'slot', "slot",
		'flags_add', 1,
		'dtor_flags_clear', 1,
	}),
	PlaceObj('XPrgNearestAttach', {
		'bld', "bld",
		'classname', "SpacebarElevator",
		'spot_type', "Passenger",
		'target', "pos",
		'var_obj', "elevator",
	}),
	PlaceObj('XPrgUseObject', {
		'obj', "elevator",
		'param1', "unit",
	}),
})

