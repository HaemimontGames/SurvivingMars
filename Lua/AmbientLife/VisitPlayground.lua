-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

local _slots = {
	{
		goto_spot = "",
		groups = {
			["A"] = true,
		},
		spots = {
			"Visitslide",
		},
	},
	{
		attach = "DecorInt_04",
		flags_missing = 1,
		goto_spot = "Pathfind",
		groups = {
			["B"] = true,
		},
		spots = {
			"Visitbench",
		},
	},
}
PrgAmbientLife["VisitPlayground"] = function(unit, bld)
	local _spot, _obj, _slot_desc, _slot, _slotname
	while unit:VisitTimeLeft() > 0 do
		if unit:VisitTimeLeft() > 0 then
			_spot, _obj, _slot_desc, _slot, _slotname = PrgGetObjRandomSpotFromGroup(bld, nil, "A", _slots, unit)
			if _spot then
				PrgVisitSlot(unit, bld, _obj, _spot, _slot_desc, _slot, _slotname)
				if unit.visit_restart then return end
			end
		end
		if unit:VisitTimeLeft() > 0 then
			_spot, _obj, _slot_desc, _slot, _slotname = PrgGetObjRandomSpotFromGroup(bld, nil, "A", _slots, unit)
			if _spot then
				PrgVisitSlot(unit, bld, _obj, _spot, _slot_desc, _slot, _slotname)
				if unit.visit_restart then return end
			end
		end
		if unit:Random(100) < 50 then
			if unit:VisitTimeLeft() > 0 then
				_spot, _obj, _slot_desc, _slot, _slotname = PrgGetObjRandomSpotFromGroup(bld, nil, "A", _slots, unit)
				if _spot then
					PrgVisitSlot(unit, bld, _obj, _spot, _slot_desc, _slot, _slotname)
					if unit.visit_restart then return end
				end
			end
		end
		if unit:VisitTimeLeft() > 0 then
			_spot, _obj, _slot_desc, _slot, _slotname = PrgGetObjRandomSpotFromGroup(bld, nil, "B", _slots, unit)
			if _spot then
				PrgVisitSlot(unit, bld, _obj, _spot, _slot_desc, _slot, _slotname, 60000)
				if unit.visit_restart then return end
			end
		end
		if unit.visit_restart then return end
	end
end
