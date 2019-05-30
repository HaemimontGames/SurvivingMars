-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

local _slots = {
	{
		attach = "LivingQuartersHouseBase",
		flags_missing = 1,
		goto_spot = "LeadToSpot",
		groups = {
			["A"] = true,
		},
		move_end = "LeadToExit",
		move_start = "GoToExitSpot",
		spots = {
			"Visitlounge",
			"Visittable",
			"Visitchair1",
			"Visitchair2",
		},
		usable_night = false,
	},
	{
		attach = "LivingQuartersHouseBase",
		flags_missing = 1,
		goto_spot = "LeadToSpot",
		groups = {
			["A"] = true,
		},
		move_end = "LeadToExit",
		move_start = "GoToExitSpot",
		spots = {
			"Visitbed",
		},
		usable_day = false,
	},
	{
		attach = "LivingQuartersHouseBase",
		flags_missing = 1,
		goto_spot = "Teleport",
		groups = {
			["A"] = true,
		},
		move_end = "TeleportToExit",
		move_start = "GoToExitSpot",
		pet_only = true,
		spots = {
			"Petlay",
		},
		usable_by_child = false,
	},
	{
		attach = "DecorInt_03",
		flags_missing = 1,
		goto_spot = "Pathfind",
		groups = {
			["A"] = true,
		},
		spots = {
			"Visitbench",
		},
		usable_night = false,
	},
	{
		flags_missing = 1,
		goto_spot = "Pathfind",
		groups = {
			["A"] = true,
		},
		pet_only = true,
		spots = {
			"Petlay1",
		},
		usable_by_child = false,
	},
	{
		flags_missing = 1,
		goto_spot = "Pathfind",
		groups = {
			["A"] = true,
		},
		pet_only = true,
		spots = {
			"Petjump",
		},
		usable_by_child = false,
	},
	{
		flags_missing = 1,
		goto_spot = "Pathfind",
		groups = {
			["A"] = true,
		},
		pet_only = true,
		spots = {
			"Petpee",
		},
		usable_by_child = false,
	},
	{
		attach = "DecorInt_04",
		flags_missing = 1,
		goto_spot = "Pathfind",
		groups = {
			["A"] = true,
		},
		spots = {
			"Visitbench",
		},
		usable_night = false,
	},
	{
		attach = "LivingQuartersHouseBase",
		goto_spot = "LeadToSpot",
		groups = {
			Holder = true,
		},
		move_end = "LeadToExit",
		move_start = "GoToExitSpot",
	},
}
PrgAmbientLife["VisitLivingQuarters"] = function(unit, bld)
	local _spot, house, _slot_desc, _slot, _slotname
	_spot, house, _slot_desc, _slot, _slotname = PrgGetObjRandomSpotFromGroup(bld, nil, "A", _slots, unit)
	if _spot then
		PrgVisitSlot(unit, bld, house, _spot, _slot_desc, _slot, _slotname)
		if unit.visit_restart then return end
	else
		_spot, house, _slot_desc, _slot, _slotname = PrgGetObjRandomSpotFromGroup(bld, nil, "Holder", _slots, unit)
		if _spot then
			PrgVisitSlot(unit, bld, house, _spot, _slot_desc, _slot, _slotname)
			if unit.visit_restart then return end
		end
	end
end
