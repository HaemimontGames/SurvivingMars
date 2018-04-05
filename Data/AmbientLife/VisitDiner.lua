-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('AmbientLife', {
	group = "Visit",
	id = "VisitDiner",
	param1 = "unit",
	param2 = "bld",
	PlaceObj('XPrgDefineSlot', {
		'groups', "A",
		'spot_type', "Visittable",
		'goto_spot', "LeadToSpot",
		'flags_missing', 1,
	}),
	PlaceObj('XPrgVisitSlot', {
		'unit', "unit",
		'bld', "bld",
		'group', "A",
		'group_fallback', "Holder",
	}),
	PlaceObj('XPrgLeadTo', {
		'loc', "Exit",
		'unit', "unit",
		'spot_obj', "bld",
	}),
})

