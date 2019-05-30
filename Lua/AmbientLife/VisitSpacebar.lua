-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

local _slots = {
	{
		attach = "SpacebarChair",
		flags_missing = 1,
		goto_spot = "Pathfind",
		groups = {
			["A"] = true,
		},
		spot_state = "idle",
		spots = {
			"Visitbarchair",
		},
		usable_by_child = false,
	},
}
PrgAmbientLife["VisitSpacebar"] = function(unit, bld)
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
