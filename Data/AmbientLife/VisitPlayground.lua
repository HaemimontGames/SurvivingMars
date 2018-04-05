-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('AmbientLife', {
	group = "Visit",
	id = "VisitPlayground",
	param1 = "unit",
	param2 = "bld",
	PlaceObj('XPrgDefineSlot', {
		'groups', "A",
		'spot_type', "Visitslide",
	}),
	PlaceObj('XPrgDefineSlot', {
		'groups', "B",
		'spot_type', "Visitbench",
		'attach', "DecorInt_04",
		'goto_spot', "Pathfind",
	}),
	PlaceObj('XPrgHasVisitTime', {
		'form', "while-do",
	}, {
		PlaceObj('XPrgHasVisitTime', nil, {
			PlaceObj('XPrgVisitSlot', {
				'unit', "unit",
				'bld', "bld",
				'group', "A",
			}),
			}),
		PlaceObj('XPrgHasVisitTime', nil, {
			PlaceObj('XPrgVisitSlot', {
				'unit', "unit",
				'bld', "bld",
				'group', "A",
			}),
			}),
		PlaceObj('XPrgCheckExpression', {
			'expression', "unit:Random(100) < 50",
		}, {
			PlaceObj('XPrgHasVisitTime', nil, {
				PlaceObj('XPrgVisitSlot', {
					'unit', "unit",
					'bld', "bld",
					'group', "A",
				}),
				}),
			}),
		PlaceObj('XPrgHasVisitTime', nil, {
			PlaceObj('XPrgVisitSlot', {
				'unit', "unit",
				'bld', "bld",
				'group', "B",
				'time', "60000",
			}),
			}),
		}),
	PlaceObj('XPrgNearestSpot', {
		'obj', "bld",
		'spot_type', "Door",
		'target', "unit",
		'var_pos', "pos",
	}),
	PlaceObj('XPrgGoto', {
		'unit', "unit",
		'pos', "pos",
	}),
})

