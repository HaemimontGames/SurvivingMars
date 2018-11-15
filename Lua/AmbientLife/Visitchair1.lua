-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PrgAmbientLife["Visitchair1"] = function(unit, bld, obj, spot, slot_data, slot, slotname)
	unit:PlayState("sitChair1Start")
	while unit:VisitTimeLeft() > 0 do
		unit:PlayState("sitChair1Idle", 1, const.eDontCrossfade)
		if unit.visit_restart then return end
	end
	unit:PlayState("sitChair1End", 1, const.eDontCrossfadeNext)
	unit:SetAngle(unit:GetVisualAngle() + 10800, 0)
	unit:SetStateText("idle", const.eDontCrossfade)
end
