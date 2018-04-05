-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('AmbientLife', {
	group = "VisitSpot",
	id = "Visitmediccenter",
	param1 = "unit",
	param2 = "bld",
	param3 = "obj",
	param4 = "spot",
	param5 = "slot_data",
	param6 = "slot",
	param7 = "slotname",
	PlaceObj('XPrgCheckExpression', {
		'expression', "bld:Random(2)==0",
	}, {
		PlaceObj('XPrgPlayAnim', {
			'obj', "unit",
			'anim', "layLoungeStart",
		}),
		PlaceObj('XPrgHasVisitTime', {
			'form', "while-do",
		}, {
			PlaceObj('XPrgPlayAnim', {
				'obj', "unit",
				'anim', "layLoungeIdle",
			}),
			}),
		PlaceObj('XPrgPlayAnim', {
			'obj', "unit",
			'anim', "layLoungeEnd",
		}),
		}),
	PlaceObj('XPrgCheckExpression', {
		'form', "else-if",
		'expression', "",
	}, {
		PlaceObj('XPrgPlayAnim', {
			'obj', "unit",
			'anim', "layInjuredStart",
		}),
		PlaceObj('XPrgHasVisitTime', {
			'form', "while-do",
		}, {
			PlaceObj('XPrgPlayAnim', {
				'obj', "unit",
				'anim', "layInjuredIdle",
			}),
			}),
		PlaceObj('XPrgPlayAnim', {
			'obj', "unit",
			'anim', "layInjuredEnd",
		}),
		}),
})

