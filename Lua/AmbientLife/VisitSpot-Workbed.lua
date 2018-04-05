-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PrgAmbientLife["Workbed"] = function(unit, bld, obj, spot, slot_data, slot, slotname)
	while unit:VisitTimeLeft() > 0 do
		unit:PlayState("standScan")
		if unit.visit_restart then return end
	end
	unit:SetAngle(unit:GetVisualAngle() + 10800, 0)
	unit:PlayState("idle")
end
