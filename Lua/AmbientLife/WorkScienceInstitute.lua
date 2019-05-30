-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

local _slots = {
	{
		flags_missing = 1,
		goto_spot = "LeadToSpot",
		groups = {
			["A"] = true,
		},
		spots = {
			"Workterminal",
		},
		usable_by_child = false,
	},
	{
		flags_missing = 1,
		goto_spot = "LeadToSpot",
		groups = {
			["A"] = true,
		},
		spots = {
			"Visitdesk",
		},
		usable_by_child = false,
	},
	{
		flags_missing = 1,
		goto_spot = "LeadToSpot",
		groups = {
			["A"] = true,
		},
		spots = {
			"Worktablet",
		},
		usable_by_child = false,
	},
}
PrgAmbientLife["WorkScienceInstitute"] = function(unit, bld)
	local spot, _obj, slot_data, slot, slotname, __placed

	unit:PushDestructor(function(unit)
		PrgChangeSpotFlags(bld, bld, spot, 0, 1, slotname, slot)
		if IsValid(__placed) then
			DoneObject(__placed)
		end
	end)

	spot, _obj, slot_data, slot, slotname = PrgGetObjRandomSpotFromGroup(bld, nil, "A", _slots, unit)
	PrgChangeSpotFlags(bld, bld, spot, 1, 0, slotname, slot)
	if spot then
		if slotname == "Worktablet" then
			__placed = PlaceObject("Tablet", nil, const.cofComponentAttach)
			NetTempObject(__placed)
			unit:Attach(__placed, unit:GetRandomSpot("Tablet"))
		end
		PrgLeadToSpot(unit, PrgResolvePathObj(bld), bld, spot, true)
		if unit.visit_restart then unit:PopAndCallDestructor() return end
		PrgAmbientLife[slotname](unit, bld, bld, spot, slot_data, slot, slotname)
	else
		PrgVisitHolder(unit, bld)
		if unit.visit_restart then unit:PopAndCallDestructor() return end
	end
	PrgLeadToExit(unit, bld)
	if unit.visit_restart then unit:PopAndCallDestructor() return end

	unit:PopAndCallDestructor()
end
