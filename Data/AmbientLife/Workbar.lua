-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('AmbientLife', {
	group = "VisitSpot",
	id = "Workbar",
	param1 = "unit",
	param2 = "bld",
	param3 = "obj",
	param4 = "spot",
	param5 = "slot_data",
	param6 = "slot",
	param7 = "slotname",
	PlaceObj('XPrgCheckExpression', {
		'form', "while-do",
	}, {
		PlaceObj('XPrgPlayAnim', {
			'obj', "unit",
			'anim', "spacebarOperate",
		}),
		PlaceObj('XPrgHasVisitTime', {
			'Not', true,
		}, {
			PlaceObj('XPrgNearestSpot', {
				'obj', "bld",
				'spot_type', "Elevator",
				'target', "unit",
				'var_spot', "espot",
			}),
			PlaceObj('XPrgGetSlotFromSpot', {
				'obj', "bld",
				'spot', "espot",
				'var_slotname', "eslotname",
				'var_slot', "eslot",
			}),
			PlaceObj('XPrgCheckSpotFlags', {
				'bld', "bld",
				'obj', "obj",
				'spot', "espot",
				'slotname', "eslotname",
				'slot', "eslot",
				'flags_missing', 1,
			}, {
				PlaceObj('XPrgCheckExpression', {
					'form', "break-if",
				}),
				}),
			}),
		}),
})

