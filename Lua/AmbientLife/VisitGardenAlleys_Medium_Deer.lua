-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

local _slots = {
	{
		flags_missing = 1,
		goto_spot = "Pathfind",
		groups = {
			["A"] = true,
		},
		pet_only = true,
		spots = {
			"Petgraze",
		},
		usable_by_child = false,
	},
}
PrgAmbientLife["VisitGardenAlleys_Medium_Deer"] = function(unit, bld)
	local _spot, _obj, _slot_desc, _slot, _slotname
	while unit:VisitTimeLeft() > 0 do
		if unit:VisitTimeLeft() > 0 then
			_spot, _obj, _slot_desc, _slot, _slotname = PrgGetObjRandomSpotFromGroup(bld, nil, "A", _slots, unit)
			if _spot then
				PrgVisitSlot(unit, bld, _obj, _spot, _slot_desc, _slot, _slotname)
				if unit.visit_restart then return end
			else
				PrgVisitHolder(unit, bld)
				if unit.visit_restart then return end
			end
		end
		if unit.visit_restart then return end
	end
end
