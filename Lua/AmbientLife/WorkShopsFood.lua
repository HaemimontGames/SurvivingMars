-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

local _slots = {
	{
		flags_missing = 1,
		goto_spot = "LeadToSpot",
		groups = {
			["A"] = true,
		},
		move_start = "Pathfind",
		spots = {
			"Workshop",
		},
		usable_by_child = false,
	},
}
PrgAmbientLife["WorkShopsFood"] = function(unit, bld)
	local _spot, _obj, _slot_desc, _slot, _slotname
	_spot, _obj, _slot_desc, _slot, _slotname = PrgGetObjRandomSpotFromGroup(bld, nil, "A", _slots, unit)
	if _spot then
		PrgVisitSlot(unit, bld, _obj, _spot, _slot_desc, _slot, _slotname)
		if unit.visit_restart then return end
	end
	PrgLeadToExit(unit, bld)
	if unit.visit_restart then return end
end
