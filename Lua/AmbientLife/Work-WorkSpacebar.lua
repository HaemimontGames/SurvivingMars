-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

local _slots = {
	{
		flags_missing = 1,
		goto_spot = "Pathfind",
		groups = {
			["A"] = true,
		},
		spots = {
			"Workbar",
		},
		usable_by_child = false,
	},
}
PrgAmbientLife["WorkSpacebar"] = function(unit, bld)
	local elevator, _spot, _obj, _slot_desc, _slot, _slotname, spot, pos, slotname, slot

	unit:PushDestructor(function(unit)
		PrgChangeSpotFlags(bld, bld, spot, 0, 1, slotname, slot)
	end)

	elevator = PrgGetNearestAttach(IsCloser, "Passenger", unit, bld, "SpacebarElevator")
	elevator:Use(unit)
	if unit.visit_restart then unit:PopAndCallDestructor() return end
	_spot, _obj, _slot_desc, _slot, _slotname = PrgGetObjRandomSpotFromGroup(bld, nil, "A", _slots, unit)
	if _spot then
		PrgVisitSlot(unit, bld, _obj, _spot, _slot_desc, _slot, _slotname)
		if unit.visit_restart then unit:PopAndCallDestructor() return end
	else
		PrgVisitHolder(unit, bld)
		if unit.visit_restart then unit:PopAndCallDestructor() return end
	end
	spot = bld:GetNearestSpot("Elevator", unit)
	pos = bld:GetSpotLocPos(spot)
	slot, slotname = PrgGetSlotBySpot(bld, spot)
	PrgChangeSpotFlags(bld, bld, spot, 1, 0, slotname, slot)
	elevator = PrgGetNearestAttach(IsCloser, "Passenger", pos, bld, "SpacebarElevator")
	elevator:Use(unit)
	if unit.visit_restart then unit:PopAndCallDestructor() return end

	unit:PopAndCallDestructor()
end
