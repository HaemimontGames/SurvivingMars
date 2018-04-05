-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('AmbientLife', {
	group = "VisitSpot",
	id = "Visitmedic",
	param1 = "unit",
	param2 = "bld",
	param3 = "obj",
	param4 = "spot",
	param5 = "slot_data",
	param6 = "slot",
	param7 = "slotname",
	PlaceObj('XPrgChangeSlotFlags', {
		'bld', "bld",
		'obj', "obj",
		'spot', "spot",
		'slotname', "slotname",
		'slot', "slot",
		'flags_add', 2,
		'dtor_flags_clear', 2,
	}),
	PlaceObj('XPrgPlayAnim', {
		'obj', "unit",
		'anim', "layLoungeStart",
	}),
	PlaceObj('XPrgCheckExpression', {
		'form', "while-do",
	}, {
		PlaceObj('XPrgPlayAnim', {
			'obj', "unit",
			'anim', "layLoungeIdle",
			'blending', false,
		}),
		PlaceObj('XPrgHasVisitTime', {
			'Not', true,
		}, {
			PlaceObj('XPrgCheckSpotFlags', {
				'Not', true,
				'bld', "bld",
				'obj', "bld",
				'spot', "spot",
				'slotname', "slotname",
				'slot', "slot",
				'flags_required', 8,
			}, {
				PlaceObj('XPrgCheckExpression', {
					'form', "break-if",
				}),
				}),
			}),
		}),
	PlaceObj('XPrgChangeSlotFlags', {
		'bld', "bld",
		'obj', "obj",
		'spot', "spot",
		'slotname', "slotname",
		'slot', "slot",
		'flags_clear', 2,
	}),
	PlaceObj('XPrgPlayAnim', {
		'obj', "unit",
		'anim', "layLoungeEnd",
		'blending', false,
		'blending_next', false,
	}),
	PlaceObj('XPrgRotateObj', {
		'obj', "unit",
		'angle', 10800,
	}),
	PlaceObj('XPrgPlayAnim', {
		'obj', "unit",
		'anim', "idle",
		'loops', "0",
		'time', "0",
	}),
})

