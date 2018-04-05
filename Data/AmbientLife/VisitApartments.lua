-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('AmbientLife', {
	group = "Visit",
	id = "VisitApartments",
	param1 = "unit",
	param2 = "bld",
	PlaceObj('XPrgDefineSlot', {
		'groups', "A",
		'spot_type', "Visitbed",
		'attach', "BaseBlinds",
		'goto_spot', "LeadToSpot",
		'flags_missing', 1,
	}),
	PlaceObj('XPrgDefineSlot', {
		'groups', "A",
		'spot_type', "Visitlounge,Standidle",
		'goto_spot', "LeadToSpot",
		'flags_missing', 1,
		'usable_night', false,
	}),
	PlaceObj('XPrgDefineSlot', {
		'groups', "A",
		'spot_type', "Visitbench",
		'attach', "DecorInt_04",
		'goto_spot', "LeadToSpot",
		'flags_missing', 1,
		'usable_night', false,
	}),
	PlaceObj('XPrgDefineSlot', {
		'groups', "A",
		'spot_type', "Visittable",
		'attach', "BaseBlinds",
		'goto_spot', "LeadToSpot",
		'flags_missing', 1,
	}),
	PlaceObj('XPrgDefineSlot', {
		'groups', "A",
		'spot_type', "Visitdesk",
		'attach', "BaseBlinds",
		'goto_spot', "LeadToSpot",
		'flags_missing', 1,
	}),
	PlaceObj('XPrgSelectSlot', {
		'unit', "unit",
		'bld', "bld",
		'group', "A",
		'var_obj', "obj",
		'var_spot', "spot",
		'var_slot_desc', "slot_desc",
		'var_slot', "slot",
		'var_slotname', "slotname",
	}),
	PlaceObj('XPrgCheckExpression', {
		'expression', "not spot",
	}, {
		PlaceObj('XPrgVisitSlot', {
			'unit', "unit",
			'bld', "bld",
			'group', "Holder",
		}),
		}),
	PlaceObj('XPrgCheckExpression', {
		'form', "else-if",
		'expression', 'IsKindOf(obj, "BaseBlinds")',
	}, {
		PlaceObj('XPrgCheckExpression', {
			'form', "A=",
			'var', "apartment",
			'expression', "obj",
		}),
		PlaceObj('XPrgCheckExpression', {
			'form', "A=",
			'var', "open_state",
			'expression', "apartment:GetOpenState()",
		}),
		PlaceObj('XPrgCheckExpression', {
			'expression', 'open_state == "Idle"',
		}, {
			PlaceObj('XPrgCheckExpression', {
				'expression', "bld:Random(100) < 50",
			}, {
				PlaceObj('XPrgCheckExpression', {
					'form', "A=",
					'var', "open_state",
					'expression', '"Open"',
				}),
				}),
			PlaceObj('XPrgCheckExpression', {
				'form', "else-if",
				'expression', "",
			}, {
				PlaceObj('XPrgCheckExpression', {
					'form', "A=",
					'var', "open_state",
					'expression', '"Open2"',
				}),
				}),
			}),
		PlaceObj('XPrgUseObject', {
			'obj', "apartment",
			'action', "",
			'action_var', "open_state",
			'dtor_action', "Close",
		}),
		PlaceObj('XPrgCheckExpression', {
			'expression', 'open_state == "Open"',
		}, {
			PlaceObj('XPrgVisitSelectedSlot', {
				'unit', "unit",
				'bld', "bld",
				'obj', "apartment",
				'spot', "spot",
				'slot_desc', "slot_desc",
				'slot', "slot",
				'slotname', "slotname",
			}),
			PlaceObj('XPrgLeadTo', {
				'loc', "Exit",
				'unit', "unit",
				'spot_obj', "apartment",
			}),
			}),
		PlaceObj('XPrgCheckExpression', {
			'form', "else-if",
			'expression', "",
		}, {
			PlaceObj('XPrgVisitSlot', {
				'unit', "unit",
				'bld', "bld",
				'group', "Holder",
			}),
			}),
		}),
	PlaceObj('XPrgCheckExpression', {
		'form', "else-if",
		'expression', "",
	}, {
		PlaceObj('XPrgVisitSelectedSlot', {
			'unit', "unit",
			'bld', "bld",
			'obj', "obj",
			'spot', "spot",
			'slot_desc', "slot_desc",
			'slot', "slot",
			'slotname', "slotname",
		}),
		PlaceObj('XPrgLeadTo', {
			'loc', "Exit",
			'unit', "unit",
			'spot_obj', "bld",
		}),
		}),
})

