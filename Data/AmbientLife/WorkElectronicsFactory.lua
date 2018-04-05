-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('AmbientLife', {
	group = "Work",
	id = "WorkElectronicsFactory",
	param1 = "unit",
	param2 = "bld",
	PlaceObj('XPrgDefineSlot', {
		'groups', "Holder",
		'goto_spot', "Teleport",
	}),
	PlaceObj('XPrgDefineSlot', {
		'groups', "Elevator",
		'spot_type', "Origin",
		'attach', "BaseElevator",
		'goto_spot', "Teleport",
	}),
	PlaceObj('XPrgSelectSlot', {
		'unit', "unit",
		'bld', "bld",
		'group', "Elevator",
		'var_obj', "elevator",
	}),
	PlaceObj('XPrgCheckExpression', {
		'expression', "elevator",
	}, {
		PlaceObj('XPrgUseObject', {
			'obj', "elevator",
			'param1', "unit",
		}),
		PlaceObj('XPrgGetSpotPos', {
			'obj', "unit",
			'spot_var', "-1",
			'var_pos', "epos",
		}),
		}),
	PlaceObj('XPrgVisitSlot', {
		'unit', "unit",
		'bld', "bld",
		'group', "Holder",
	}),
	PlaceObj('XPrgCheckExpression', {
		'expression', "elevator",
	}, {
		PlaceObj('XPrgTeleport', {
			'unit', "unit",
			'pos', "epos",
		}),
		PlaceObj('XPrgUseObject', {
			'obj', "elevator",
			'param1', "unit",
		}),
		}),
})

