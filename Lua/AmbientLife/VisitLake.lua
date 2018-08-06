-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

local _slots = {
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
	},
	{
		flags_missing = 1,
		goto_spot = "Pathfind",
		groups = {
			["A"] = true,
		},
		spots = {
			"Visitwarmup",
		},
		usable_by_child = false,
	},
}
PrgAmbientLife["VisitLake"] = function(unit, bld)
	local _spot, _obj, _slot_desc, _slot, _slotname
	_spot, _obj, _slot_desc, _slot, _slotname = PrgGetObjRandomSpotFromGroup(bld, nil, "A", _slots, unit)
	if _spot then
		PrgVisitSlot(unit, bld, _obj, _spot, _slot_desc, _slot, _slotname)
		if unit.visit_restart then return end
	else
		PrgVisitHolder(unit, bld)
		if unit.visit_restart then return end
	end
end
