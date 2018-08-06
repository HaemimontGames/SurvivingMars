-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('AmbientLife', {
	group = "VisitSpot",
	id = "Playground",
	param1 = "unit",
	param2 = "bld",
	param3 = "obj",
	param4 = "spot",
	param5 = "slot_data",
	param6 = "slot",
	param7 = "slotname",
	PlaceObj('XPrgCheckExpression', {
		'expression', "bld:Random(100) < 50",
	}, {
		PlaceObj('XPrgPlayAnim', {
			'obj', "unit",
			'anim', "playGround1Start",
		}),
		PlaceObj('XPrgHasVisitTime', {
			'form', "while-do",
		}, {
			PlaceObj('XPrgPlayAnim', {
				'obj', "unit",
				'anim', "playGround1Idle",
				'blending', false,
			}),
			}),
		PlaceObj('XPrgPlayAnim', {
			'obj', "unit",
			'anim', "playGround1End",
			'blending_next', false,
		}),
		}),
	PlaceObj('XPrgCheckExpression', {
		'form', "else-if",
		'expression', "",
	}, {
		PlaceObj('XPrgPlayAnim', {
			'obj', "unit",
			'anim', "playGround2Start",
		}),
		PlaceObj('XPrgHasVisitTime', {
			'form', "while-do",
		}, {
			PlaceObj('XPrgPlayAnim', {
				'obj', "unit",
				'anim', "playGround2Idle",
				'blending', false,
			}),
			}),
		PlaceObj('XPrgPlayAnim', {
			'obj', "unit",
			'anim', "playGround2End",
			'blending_next', false,
		}),
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

