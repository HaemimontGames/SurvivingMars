-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PrgAmbientLife["Visitchair2"] = function(unit, bld, obj, spot, slot_data, slot, slotname)
	unit:PlayState("sitChair2Start")
	while unit:VisitTimeLeft() > 0 do
		unit:PlayState("sitChair2Idle", 1, const.eDontCrossfade)
		if unit.visit_restart then return end
	end
	unit:PlayState("sitChair2End", 1, const.eDontCrossfadeNext)
	unit:SetAngle(unit:GetVisualAngle() + 10800, 0)
	unit:SetStateText("idle", const.eDontCrossfade)
end
