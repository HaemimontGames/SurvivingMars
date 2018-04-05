-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('AmbientLife', {
	group = "VisitSpot",
	id = "Visitgympullup",
	param1 = "unit",
	param2 = "bld",
	param3 = "obj",
	param4 = "spot",
	param5 = "slot_data",
	param6 = "slot",
	param7 = "slotname",
	PlaceObj('XPrgPlayAnim', {
		'obj', "unit",
		'anim', "standPullUpStart",
	}),
	PlaceObj('XPrgPlayAnim', {
		'obj', "unit",
		'anim', "standPullUpIdle",
		'loops', "3 + bld:Random(3)",
		'blending', false,
	}),
	PlaceObj('XPrgPlayAnim', {
		'obj', "unit",
		'anim', "standPullUpEnd",
		'blending', false,
	}),
})

