-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('AmbientLife', {
	group = "VisitSpot",
	id = "Visitslide",
	param1 = "unit",
	param2 = "bld",
	param3 = "obj",
	param4 = "spot",
	param5 = "slot_data",
	param6 = "slot",
	param7 = "slotname",
	PlaceObj('XPrgGetSpotPos', {
		'obj', "bld",
		'spot_var', "spot",
		'var_pos', "spot_pos",
	}),
	PlaceObj('XPrgSelectWaypoints', {
		'obj', "bld",
		'waypoints', "Path",
		'first_target', "spot_pos",
		'last_target', "unit",
		'last_target_range', "Nearest",
		'var_waypoints', "wp",
	}),
	PlaceObj('XPrgGetWaypointsPos', {
		'obj', "bld",
		'waypoints_var', "wp",
		'var_pos', "wait_pos",
	}),
	PlaceObj('XPrgGoto', {
		'unit', "unit",
		'pos', "wait_pos",
	}),
	PlaceObj('XPrgCheckSpotFlags', {
		'bld', "bld",
		'obj', "bld",
		'spot', "spot",
		'slotname', "slotname",
		'slot', "slot",
		'flags_required', 1,
	}, {
		PlaceObj('XPrgOrient', {
			'actor', "unit",
			'obj', "bld",
			'spot', "spot",
			'direction', "Face",
		}),
		PlaceObj('XPrgPlayAnim', {
			'obj', "unit",
			'anim', "idle",
			'loops', "0",
		}),
		PlaceObj('XPrgCheckSpotFlags', {
			'form', "while-do",
			'bld', "bld",
			'obj', "bld",
			'spot', "spot",
			'slotname', "slotname",
			'slot', "slot",
			'flags_required', 1,
		}, {
			PlaceObj('XPrgWait', {
				'time', "500",
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
	PlaceObj('XPrgFollowWaypoints', {
		'unit', "unit",
		'dir', "Backward",
		'waypoints_var', "wp",
	}),
	PlaceObj('XPrgPlayAnim', {
		'obj', "unit",
		'anim', "playSlideUp",
	}),
	PlaceObj('XPrgChangeSlotFlags', {
		'bld', "bld",
		'obj', "bld",
		'spot', "spot",
		'slotname', "slotname",
		'slot', "slot",
		'flags_clear', 1,
	}),
	PlaceObj('XPrgCheckExpression', {
		'form', "A=",
		'var', "spot",
		'expression', "nil",
	}),
	PlaceObj('XPrgRandomSpot', {
		'obj', "bld",
		'spot_type', "Visitslideout",
		'var_spot', "slideOut",
	}),
	PlaceObj('XPrgSnapToSpot', {
		'actor', "unit",
		'obj', "bld",
		'spot', "slideOut",
		'time', 0,
	}),
	PlaceObj('XPrgPlayAnim', {
		'obj', "unit",
		'anim', "playSlideDown",
		'blending', false,
	}),
})

