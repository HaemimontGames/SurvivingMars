-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('AmbientLife', {
	group = "VisitSpot",
	id = "Visitbasketball",
	param1 = "unit",
	param2 = "bld",
	param3 = "obj",
	param4 = "spot",
	param5 = "slot_data",
	param6 = "slot",
	param7 = "slotname",
	PlaceObj('XPrgPlaceObject', {
		'obj', "unit",
		'spot_type', "Origin",
		'attach', true,
		'orient_axis', "1",
		'classname', "Basketball",
		'animation', "playBasketball",
	}),
	PlaceObj('XPrgPlayAnim', {
		'obj', "unit",
		'anim', "playBasketball",
		'blending', false,
		'blending_next', false,
	}),
	PlaceObj('XPrgSnapToSpot', {
		'actor', "unit",
		'obj', "bld",
		'spot_type', "Visitbasketballout",
		'time', 0,
	}),
})

