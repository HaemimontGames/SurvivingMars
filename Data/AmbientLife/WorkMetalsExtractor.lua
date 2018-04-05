-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('AmbientLife', {
	group = "Work",
	id = "WorkMetalsExtractor",
	param1 = "unit",
	param2 = "bld",
	PlaceObj('XPrgExitOutside', {
		'unit', "unit",
	}),
	PlaceObj('XPrgNearestAttach', {
		'bld', "bld",
		'classname', "MetalsExtractorElevator",
		'spot_type', "Passenger",
		'target', "unit",
		'var_obj', "elevator",
	}),
	PlaceObj('XPrgUseObject', {
		'obj', "elevator",
		'param1', "unit",
		'param2', "1",
	}),
	PlaceObj('XPrgNearestSpot', {
		'obj', "bld",
		'spot_type', "Elevator",
		'target', "unit",
		'var_spot', "spot",
	}),
	PlaceObj('XPrgGetSlotFromSpot', {
		'obj', "bld",
		'spot', "spot",
		'var_slotname', "slotname",
		'var_slot', "slot",
	}),
	PlaceObj('XPrgVisitSlot', {
		'unit', "unit",
		'bld', "bld",
		'group', "Holder",
		'time', "1000",
	}),
	PlaceObj('XPrgCheckExpression', {
		'form', "while-do",
	}, {
		PlaceObj('XPrgWait', {
			'time', "1000",
		}),
		PlaceObj('XPrgHasVisitTime', {
			'Not', true,
		}, {
			PlaceObj('XPrgCheckSpotFlags', {
				'bld', "bld",
				'obj', "bld",
				'spot', "spot",
				'slotname', "slotname",
				'slot', "slot",
				'flags_missing', 1,
			}, {
				PlaceObj('XPrgCheckExpression', {
					'form', "break-if",
				}),
				}),
			}),
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
	PlaceObj('XPrgExitOutside', {
		'unit', "unit",
	}),
	PlaceObj('XPrgUseObject', {
		'obj', "elevator",
		'param1', "unit",
		'param2', "2",
	}),
})

