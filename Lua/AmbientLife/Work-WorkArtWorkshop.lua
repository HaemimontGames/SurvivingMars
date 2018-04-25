-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

local _slots = {
	{
		flags_missing = 4,
		goto_spot = "Pathfind",
		groups = {
			["A"] = true,
		},
		spots = {
			"Workpiano",
		},
		usable_by_child = false,
	},
	{
		flags_missing = 4,
		goto_spot = "Pathfind",
		groups = {
			["A"] = true,
		},
		spots = {
			"Workdraw",
		},
		usable_by_child = false,
	},
	{
		goto_spot = "LeadToSpot",
		groups = {
			["B"] = true,
		},
		spots = {
			"Floor",
		},
		usable_by_child = false,
	},
}
PrgAmbientLife["WorkArtWorkshop"] = function(unit, bld)
	local spot, _obj, slotdata, slot, slotname, fspot, fslotdata, fslot, fslotname, fpos

	unit:PushDestructor(function(unit)
		PrgChangeSpotFlags(bld, bld, spot, 0, 4, slotname, slot)
	end)

	spot, _obj, slotdata, slot, slotname = PrgGetObjRandomSpotFromGroup(bld, nil, "A", _slots, unit)
	if spot then
		PrgChangeSpotFlags(bld, bld, spot, 4, 0, slotname, slot)
		fspot, _obj, fslotdata, fslot, fslotname = PrgGetObjRandomSpotFromGroup(bld, nil, "B", _slots, unit)
		PrgLeadToSpot(unit, PrgResolvePathObj(bld), bld, fspot, false)
		if unit.visit_restart then unit:PopAndCallDestructor() return end
		PrgVisitSlot(unit, bld, bld, spot, slotdata, slot, slotname)
		if unit.visit_restart then unit:PopAndCallDestructor() return end
		PrgChangeSpotFlags(bld, bld, spot, 0, 4, slotname, slot)
		-- disable flags destructor
		slotname = ""
		fspot, _obj, fslotdata, fslot, fslotname = PrgGetObjRandomSpotFromGroup(bld, nil, "B", _slots, unit)
		fpos = fspot and _obj:GetSpotLocPos(fspot)
		unit:Goto(fpos)
	end
	PrgLeadToExit(unit, bld)
	if unit.visit_restart then unit:PopAndCallDestructor() return end

	unit:PopAndCallDestructor()
end
