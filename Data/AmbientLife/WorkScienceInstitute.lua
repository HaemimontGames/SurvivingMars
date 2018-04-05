-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('AmbientLife', {
	group = "Work",
	id = "WorkScienceInstitute",
	param1 = "unit",
	param2 = "bld",
	PlaceObj('XPrgDefineSlot', {
		'groups', "A",
		'spot_type', "Workterminal",
		'goto_spot', "LeadToSpot",
		'flags_missing', 1,
		'usable_by_child', false,
	}),
	PlaceObj('XPrgDefineSlot', {
		'groups', "A",
		'spot_type', "Visitdesk",
		'goto_spot', "LeadToSpot",
		'flags_missing', 1,
		'usable_by_child', false,
	}),
	PlaceObj('XPrgDefineSlot', {
		'groups', "A",
		'spot_type', "Worktablet",
		'goto_spot', "LeadToSpot",
		'flags_missing', 1,
		'usable_by_child', false,
	}),
	PlaceObj('XPrgSelectSlot', {
		'unit', "unit",
		'bld', "bld",
		'group', "A",
		'var_spot', "spot",
		'var_slot_desc', "slot_data",
		'var_slot', "slot",
		'var_slotname', "slotname",
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
	PlaceObj('XPrgCheckExpression', {
		'expression', "spot",
	}, {
		PlaceObj('XPrgCheckExpression', {
			'expression', 'slotname == "Worktablet"',
		}, {
			PlaceObj('XPrgPlaceObject', {
				'obj', "unit",
				'spot_type', "Tablet",
				'attach', true,
				'orient_axis', "1",
				'classname', "Tablet",
			}),
			}),
		PlaceObj('XPrgLeadTo', {
			'unit', "unit",
			'spot_obj', "bld",
			'spot', "spot",
			'orient_to_spot', true,
		}),
		PlaceObj('XPrgPlaySpotPrg', {
			'unit', "unit",
			'bld', "bld",
			'obj', "bld",
			'spot', "spot",
			'slot_data', "slot_data",
			'slotname', "slotname",
			'slot', "slot",
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
	PlaceObj('XPrgLeadTo', {
		'loc', "Exit",
		'unit', "unit",
		'spot_obj', "bld",
	}),
})

