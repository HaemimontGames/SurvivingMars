-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('AmbientLife', {
	group = "Visit",
	id = "VisitOpenAirGym",
	param1 = "unit",
	param2 = "bld",
	PlaceObj('XPrgDefineSlot', {
		'groups', "A",
		'spot_type', "Visitgympullup,Visitwarmup,Visitbasketball",
		'goto_spot', "Pathfind",
		'flags_missing', 1,
		'usable_by_child', false,
	}),
	PlaceObj('XPrgHasVisitTime', {
		'form', "while-do",
	}, {
		PlaceObj('XPrgVisitSlot', {
			'unit', "unit",
			'bld', "bld",
			'group', "A",
			'group_fallback', "Holder",
		}),
		}),
})

