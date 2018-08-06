-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('AmbientLife', {
	group = "Visit",
	id = "VisitNursery",
	param1 = "unit",
	param2 = "bld",
	PlaceObj('XPrgDefineSlot', {
		'groups', "A",
		'spot_type', "Playground",
		'goto_spot', "LeadToSpot",
		'flags_missing', 1,
	}),
	PlaceObj('XPrgDefineSlot', {
		'groups', "A",
		'spot_type', "Playtablet",
		'goto_spot', "LeadToSpot",
		'flags_missing', 1,
	}),
	PlaceObj('XPrgSelectSlot', {
		'unit', "unit",
		'bld', "bld",
		'group', "A",
		'var_obj', "obj",
		'var_spot', "spot",
		'var_slot_desc', "desc",
		'var_slot', "slot",
		'var_slotname', "slotname",
		'var_pos', "pos",
	}),
	PlaceObj('XPrgCheckExpression', {
		'expression', "spot",
	}, {
		PlaceObj('XPrgCheckExpression', {
			'expression', 'slotname == "Playtablet"',
		}, {
			PlaceObj('XPrgPlaceObject', {
				'obj', "unit",
				'spot_type', "Tablet",
				'attach', true,
				'orient_axis', "1",
				'classname', "Tablet",
			}),
			}),
		PlaceObj('XPrgVisitSelectedSlot', {
			'unit', "unit",
			'bld', "bld",
			'obj', "obj",
			'spot', "spot",
			'slot_desc', "desc",
			'slot', "slot",
			'slotname', "slotname",
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

