-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('AmbientLife', {
	group = "Visit",
	id = "VisitGardenAlleys_Medium_Deer",
	param1 = "unit",
	param2 = "bld",
	PlaceObj('XPrgDefineSlot', {
		'groups', "A",
		'spot_type', "Petgraze",
		'goto_spot', "Pathfind",
		'flags_missing', 1,
		'usable_by_child', false,
		'pet_only', true,
	}),
	PlaceObj('XPrgHasVisitTime', {
		'form', "while-do",
	}, {
		PlaceObj('XPrgHasVisitTime', nil, {
			PlaceObj('XPrgVisitSlot', {
				'unit', "unit",
				'bld', "bld",
				'group', "A",
				'group_fallback', "Holder",
			}),
			}),
		}),
})

