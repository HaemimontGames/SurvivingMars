-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('AmbientLife', {
	group = "VisitSpot",
	id = "Visitbarchair",
	param1 = "unit",
	param2 = "bld",
	param3 = "obj",
	param4 = "spot",
	param5 = "slot_data",
	param6 = "slot",
	param7 = "slotname",
	PlaceObj('XPrgPlayAnim', {
		'obj', "unit",
		'anim', "spacebarSitStart",
	}),
	PlaceObj('XPrgPlayAnim', {
		'obj', "unit",
		'anim', "spacebarSitIdle",
		'loops', "0",
		'blending', false,
	}),
	PlaceObj('XPrgOrient', {
		'actor', "unit",
		'obj', "obj",
		'spot', "spot",
		'attach', true,
		'orient_time', 0,
	}),
	PlaceObj('XPrgPlayAnim', {
		'obj', "obj",
		'anim', "up",
		'blending', false,
		'blending_next', false,
	}),
	PlaceObj('XPrgHasVisitTime', {
		'form', "while-do",
	}, {
		PlaceObj('XPrgCheckExpression', {
			'form', "A=",
			'var', "rnd",
			'expression', "bld:Random(100)",
		}),
		PlaceObj('XPrgCheckExpression', {
			'expression', "rnd < 50",
		}, {
			PlaceObj('XPrgPlayAnim', {
				'obj', "unit",
				'anim', "spacebarSitDrinkStart",
				'blending', false,
			}),
			PlaceObj('XPrgPlayAnim', {
				'obj', "unit",
				'anim', "spacebarSitDrinkIdle",
				'blending', false,
			}),
			PlaceObj('XPrgPlayAnim', {
				'obj', "unit",
				'anim', "spacebarSitDrinkEnd",
				'blending', false,
			}),
			}),
		PlaceObj('XPrgPlayAnim', {
			'obj', "unit",
			'anim', "spacebarSitIdle",
			'blending', false,
		}),
		}),
	PlaceObj('XPrgPlayAnim', {
		'obj', "obj",
		'anim', "up",
		'reversed', true,
		'blending', false,
		'blending_next', false,
	}),
	PlaceObj('XPrgPlayAnim', {
		'obj', "obj",
		'anim', "idle",
		'loops', "0",
		'reversed', true,
		'blending', false,
		'blending_next', false,
	}),
	PlaceObj('XPrgOrient', {
		'actor', "unit",
		'detach', true,
		'orient_time', 0,
	}),
	PlaceObj('XPrgOrient', {
		'actor', "unit",
		'obj', "obj",
		'spot', "spot",
		'direction', "SpotX 2D",
		'pos', "spot",
		'orient_time', 0,
	}),
	PlaceObj('XPrgPlayAnim', {
		'obj', "unit",
		'anim', "spacebarSitEnd",
		'blending_next', false,
	}),
	PlaceObj('XPrgRotateObj', {
		'obj', "unit",
		'angle', 10800,
	}),
	PlaceObj('XPrgPlayAnim', {
		'obj', "unit",
		'anim', "idle",
		'loops', "0",
		'time', "0",
		'blending', false,
	}),
})

