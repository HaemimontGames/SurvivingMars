-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PrgAmbientLife["Visitbench"] = function(unit, bld, obj, spot, slot_data, slot, slotname)
	unit:PlayState("sitRelaxStart")
	while unit:VisitTimeLeft() > 0 do
		unit:PlayState("sitRelaxIdle", 1, const.eDontCrossfade)
		if unit.visit_restart then return end
	end
	unit:PlayState("sitRelaxEnd", 1, const.eDontCrossfadeNext)
	unit:SetAngle(unit:GetVisualAngle() + 10800, 0)
	unit:SetStateText("idle", const.eDontCrossfade)
end
