-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('AmbientLife', {
	group = "Work",
	id = "WorkFarm",
	param1 = "unit",
	param2 = "bld",
	PlaceObj('XPrgDefineSlot', {
		'groups', "A",
		'spot_type', "Workcrop",
		'goto_spot', "Pathfind",
		'flags_missing', 1,
		'usable_by_child', false,
	}),
	PlaceObj('XPrgDefineSlot', {
		'groups', "A",
		'spot_type', "Visitterminal",
		'attach', "DecorInt_10",
		'goto_spot', "Pathfind",
		'flags_missing', 1,
		'usable_by_child', false,
	}),
	PlaceObj('XPrgDefineSlot', {
		'groups', "A",
		'spot_type', "Worktablet",
		'goto_spot', "Pathfind",
		'flags_missing', 1,
		'usable_by_child', false,
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
})

