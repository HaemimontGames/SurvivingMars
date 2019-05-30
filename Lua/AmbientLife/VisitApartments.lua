-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

local _slots = {
	{
		attach = "BaseBlinds",
		flags_missing = 1,
		goto_spot = "LeadToSpot",
		groups = {
			["A"] = true,
		},
		spots = {
			"Visitbed",
		},
	},
	{
		flags_missing = 1,
		goto_spot = "LeadToSpot",
		groups = {
			["A"] = true,
		},
		spots = {
			"Visitbed",
		},
	},
	{
		flags_missing = 1,
		goto_spot = "LeadToSpot",
		groups = {
			["A"] = true,
		},
		spots = {
			"Visitlounge",
			"Standidle",
		},
		usable_night = false,
	},
	{
		attach = "DecorInt_04",
		flags_missing = 1,
		goto_spot = "LeadToSpot",
		groups = {
			["A"] = true,
		},
		spots = {
			"Visitbench",
		},
		usable_night = false,
	},
	{
		attach = "BaseBlinds",
		flags_missing = 1,
		goto_spot = "LeadToSpot",
		groups = {
			["A"] = true,
		},
		spots = {
			"Visittable",
		},
	},
	{
		flags_missing = 1,
		goto_spot = "Teleport",
		groups = {
			["A"] = true,
		},
		move_end = "TeleportToExit",
		pet_only = true,
		spots = {
			"Petlay",
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
			"Visittable",
		},
	},
	{
		attach = "BaseBlinds",
		flags_missing = 1,
		goto_spot = "LeadToSpot",
		groups = {
			["A"] = true,
		},
		spots = {
			"Visitdesk",
		},
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
	},
}
PrgAmbientLife["VisitApartments"] = function(unit, bld)
	local spot, obj, slot_desc, slot, slotname, apartment, open_state

	unit:PushDestructor(function(unit)
		if IsValid(apartment) then
			apartment:Close()
		end
	end)

	spot, obj, slot_desc, slot, slotname = PrgGetObjRandomSpotFromGroup(bld, nil, "A", _slots, unit)
	if not spot then
		PrgVisitHolder(unit, bld)
		if unit.visit_restart then unit:PopAndCallDestructor() return end
	elseif IsKindOf(obj, "BaseBlinds") then
		apartment = obj
		open_state = apartment:GetOpenState()
		if open_state == "Idle" then
			if bld:Random(100) < 50 then
				open_state = "Open"
			else
				open_state = "Open2"
			end
		end
		apartment[open_state](apartment)
		if unit.visit_restart then unit:PopAndCallDestructor() return end
		if open_state == "Open" then
			PrgVisitSlot(unit, bld, apartment, spot, slot_desc, slot, slotname)
			if unit.visit_restart then unit:PopAndCallDestructor() return end
			PrgLeadToExit(unit, apartment)
			if unit.visit_restart then unit:PopAndCallDestructor() return end
		else
			PrgVisitHolder(unit, bld)
			if unit.visit_restart then unit:PopAndCallDestructor() return end
		end
	else
		PrgVisitSlot(unit, bld, obj, spot, slot_desc, slot, slotname)
		if unit.visit_restart then unit:PopAndCallDestructor() return end
		PrgLeadToExit(unit, bld)
		if unit.visit_restart then unit:PopAndCallDestructor() return end
	end

	unit:PopAndCallDestructor()
end
