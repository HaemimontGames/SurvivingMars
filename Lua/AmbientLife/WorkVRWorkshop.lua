-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

local _slots = {
	{
		flags_missing = 4,
		goto_spot = "Pathfind",
		groups = {
			["A"] = true,
		},
		spots = {
			"Workvr",
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
PrgAmbientLife["WorkVRWorkshop"] = function(unit, bld)
	local spot, _obj, slotdata, slot, slotname, __placed, _unit_move, fspot, fslotdata, fslot, fslotname, fpos

	unit:PushDestructor(function(unit)
		PrgChangeSpotFlags(bld, bld, spot, 0, 4, slotname, slot)
		if IsValid(__placed) then
			DoneObject(__placed)
		end
		if _unit_move then
			unit:SetMoveAnim(_unit_move)
		end
	end)

	spot, _obj, slotdata, slot, slotname = PrgGetObjRandomSpotFromGroup(bld, nil, "A", _slots, unit)
	if spot then
		PrgChangeSpotFlags(bld, bld, spot, 4, 0, slotname, slot)
		PrgVisitHolder(unit, bld, bld, 0)
		if unit.visit_restart then unit:PopAndCallDestructor() return end
		__placed = PlaceObject("VRHeadset", nil, const.cfComponentEx + const.cfComponentAttach)
		NetTempObject(__placed)
		unit:Attach(__placed, unit:GetRandomSpot("Head"))
		_unit_move = _unit_move or unit:GetMoveAnim()
		unit:SetMoveAnim("moveVR")
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
