-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

local _slots = {
	{
		goto_spot = "Teleport",
		groups = {
			Holder = true,
		},
	},
	{
		attach = "BaseElevator",
		goto_spot = "Teleport",
		groups = {
			Elevator = true,
		},
		spots = {
			"Origin",
		},
	},
}
PrgAmbientLife["WorkElectronicsFactory"] = function(unit, bld)
	local _spot, elevator, epos, _obj, _slot_desc, _slot, _slotname
	_spot, elevator = PrgGetObjRandomSpotFromGroup(bld, nil, "Elevator", _slots, unit)
	if elevator then
		elevator:Use(unit)
		if unit.visit_restart then return end
		epos = unit:GetSpotLocPos(-1)
	end
	_spot, _obj, _slot_desc, _slot, _slotname = PrgGetObjRandomSpotFromGroup(bld, nil, "Holder", _slots, unit)
	if _spot then
		PrgVisitSlot(unit, bld, _obj, _spot, _slot_desc, _slot, _slotname)
		if unit.visit_restart then return end
	end
	if elevator then
		unit:SetPos(epos)
		elevator:Use(unit)
		if unit.visit_restart then return end
	end
end
