-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

local _slots = {
	{
		flags_missing = 1,
		goto_spot = "LeadToSpot",
		groups = {
			["A"] = true,
		},
		spots = {
			"Visituniversity",
		},
		usable_by_child = false,
	},
}
PrgAmbientLife["WorkMartianUniversity"] = function(unit, bld)
	local __placed, _spot, _obj, _slot_desc, _slot, _slotname

	unit:PushDestructor(function(unit)
		if IsValid(__placed) then
			DoneObject(__placed)
		end
	end)

	__placed = PlaceObject("Tablet", nil, const.cfComponentEx + const.cfComponentAttach)
	NetTempObject(__placed)
	unit:Attach(__placed, unit:GetRandomSpot("Tablet"))
	_spot, _obj, _slot_desc, _slot, _slotname = PrgGetObjRandomSpotFromGroup(bld, nil, "A", _slots, unit)
	if _spot then
		PrgVisitSlot(unit, bld, _obj, _spot, _slot_desc, _slot, _slotname)
		if unit.visit_restart then unit:PopAndCallDestructor() return end
	else
		PrgVisitHolder(unit, bld)
		if unit.visit_restart then unit:PopAndCallDestructor() return end
	end
	PrgLeadToExit(unit, bld)
	if unit.visit_restart then unit:PopAndCallDestructor() return end

	unit:PopAndCallDestructor()
end
