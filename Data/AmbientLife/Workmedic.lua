-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('AmbientLife', {
	group = "VisitSpot",
	id = "Workmedic",
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
		'var_pos', "ptDesk",
	}),
	PlaceObj('XPrgSelectWaypoints', {
		'obj', "bld",
		'waypoints', "Pathwork",
		'last_target', "ptDesk",
		'var_waypoints', "pathWork",
	}),
	PlaceObj('XPrgGetWaypointsPos', {
		'obj', "bld",
		'waypoints_var', "pathWork",
		'waypoints_idx', "1",
		'fallback_pos', "ptDesk",
		'var_pos', "ptBed",
	}),
	PlaceObj('XPrgNearestSpot', {
		'obj', "bld",
		'spot_type', "Workbed",
		'target', "ptBed",
		'var_spot', "spotWork",
	}),
	PlaceObj('XPrgNearestSpot', {
		'obj', "bld",
		'spot_type', "Visitmedic",
		'target', "ptBed",
		'var_spot', "spotPatient",
	}),
	PlaceObj('XPrgGetSlotFromSpot', {
		'obj', "bld",
		'spot', "spotPatient",
		'var_slotname', "slotnamePatient",
		'var_slot', "slotPatient",
	}),
	PlaceObj('XPrgChangeSlotFlags', {
		'bld', "bld",
		'obj', "bld",
		'spot', "spotPatient",
		'slotname', "slotnamePatient",
		'slot', "slotPatient",
		'flags_add', 4,
		'dtor_flags_clear', 12,
	}),
	PlaceObj('XPrgPlayAnim', {
		'obj', "unit",
		'anim', "sitDeskStart",
	}),
	PlaceObj('XPrgCheckExpression', {
		'form', "while-do",
	}, {
		PlaceObj('XPrgCheckSpotFlags', {
			'bld', "bld",
			'obj', "bld",
			'spot', "spotPatient",
			'slotname', "slotnamePatient",
			'slot', "slotPatient",
			'flags_required', 2,
		}, {
			PlaceObj('XPrgChangeSlotFlags', {
				'bld', "bld",
				'obj', "bld",
				'spot', "spotPatient",
				'slotname', "slotnamePatient",
				'slot', "slotPatient",
				'flags_add', 8,
			}),
			PlaceObj('XPrgPlayAnim', {
				'obj', "unit",
				'anim', "sitDeskEnd",
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
				'blending', false,
			}),
			PlaceObj('XPrgFollowWaypoints', {
				'unit', "unit",
				'dir', "Backward",
				'waypoints_var', "pathWork",
			}),
			PlaceObj('XPrgSnapToSpot', {
				'actor', "unit",
				'obj', "bld",
				'spot', "spotWork",
			}),
			PlaceObj('XPrgPlayAnim', {
				'obj', "unit",
				'anim', "standScan",
			}),
			PlaceObj('XPrgPlayAnim', {
				'obj', "unit",
				'anim', "standScan",
			}),
			PlaceObj('XPrgPlayAnim', {
				'obj', "unit",
				'anim', "standScan",
			}),
			PlaceObj('XPrgHasVisitTime', nil, {
				PlaceObj('XPrgChangeSlotFlags', {
					'bld', "bld",
					'obj', "bld",
					'spot', "spotPatient",
					'slotname', "slotnamePatient",
					'slot', "slotPatient",
					'flags_clear', 8,
				}),
				}),
			PlaceObj('XPrgCheckExpression', {
				'form', "else-if",
				'expression', "",
			}, {
				PlaceObj('XPrgChangeSlotFlags', {
					'bld', "bld",
					'obj', "bld",
					'spot', "spotPatient",
					'slotname', "slotnamePatient",
					'slot', "slotPatient",
					'flags_clear', 12,
				}),
				}),
			PlaceObj('XPrgFollowWaypoints', {
				'unit', "unit",
				'waypoints_var', "pathWork",
			}),
			PlaceObj('XPrgSnapToSpot', {
				'actor', "unit",
				'obj', "bld",
				'spot', "spot",
			}),
			PlaceObj('XPrgPlayAnim', {
				'obj', "unit",
				'anim', "sitDeskStart",
			}),
			PlaceObj('XPrgPlayAnim', {
				'obj', "unit",
				'anim', "sitDeskIdle",
				'blending', false,
			}),
			}),
		PlaceObj('XPrgCheckExpression', {
			'form', "else-if",
			'expression', "",
		}, {
			PlaceObj('XPrgHasVisitTime', {
				'Not', true,
			}, {
				PlaceObj('XPrgCheckSpotFlags', {
					'Not', true,
					'bld', "bld",
					'obj', "bld",
					'spot', "spotPatient",
					'slotname', "slotnamePatient",
					'slot', "slotPatient",
					'flags_required', 1,
				}, {
					PlaceObj('XPrgCheckExpression', {
						'form', "break-if",
					}),
					}),
				}),
			PlaceObj('XPrgPlayAnim', {
				'obj', "unit",
				'anim', "sitDeskIdle",
				'blending', false,
			}),
			}),
		}),
	PlaceObj('XPrgPlayAnim', {
		'obj', "unit",
		'anim', "sitDeskEnd",
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
		'blending', false,
	}),
})

