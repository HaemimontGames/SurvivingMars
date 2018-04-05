-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('AmbientLife', {
	group = "Visit",
	id = "VisitLivingQuarters",
	param1 = "unit",
	param2 = "bld",
	PlaceObj('XPrgDefineSlot', {
		'groups', "A",
		'spot_type', "Visitlounge, Visittable",
		'attach', "LivingQuartersHouseBase",
		'move_start', "GoToExitSpot",
		'goto_spot', "LeadToSpot",
		'flags_missing', 1,
		'usable_night', false,
	}),
	PlaceObj('XPrgDefineSlot', {
		'groups', "A",
		'spot_type', "Visitbed",
		'attach', "LivingQuartersHouseBase",
		'move_start', "GoToExitSpot",
		'goto_spot', "LeadToSpot",
		'flags_missing', 1,
		'usable_day', false,
	}),
	PlaceObj('XPrgDefineSlot', {
		'groups', "A",
		'spot_type', "Visitbench",
		'attach', "DecorInt_03",
		'goto_spot', "Pathfind",
		'flags_missing', 1,
		'usable_night', false,
	}),
	PlaceObj('XPrgDefineSlot', {
		'groups', "A",
		'spot_type', "Visitbench",
		'attach', "DecorInt_04",
		'goto_spot', "Pathfind",
		'flags_missing', 1,
		'usable_night', false,
	}),
	PlaceObj('XPrgDefineSlot', {
		'groups', "Holder",
		'attach', "LivingQuartersHouseBase",
		'move_start', "GoToExitSpot",
		'goto_spot', "LeadToSpot",
	}),
	PlaceObj('XPrgVisitSlot', {
		'unit', "unit",
		'bld', "bld",
		'group', "A",
		'group_fallback', "Holder",
		'var_obj', "house",
	}),
	PlaceObj('XPrgCheckExpression', {
		'expression', 'IsKindOf(house, "LivingQuartersHouseBase")',
	}, {
		PlaceObj('XPrgLeadTo', {
			'loc', "Exit",
			'unit', "unit",
			'spot_obj', "house",
		}),
		}),
})

