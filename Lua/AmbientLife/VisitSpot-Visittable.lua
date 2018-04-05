-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PrgAmbientLife["Visittable"] = function(unit, bld, obj, spot, slot_data, slot, slotname)
	unit:PlayState("sitEatStart")
	while unit:VisitTimeLeft() > 0 do
		unit:PlayState("sitEatIdle", 1, const.eDontCrossfade)
		if unit.visit_restart then return end
	end
	unit:PlayState("sitEatEnd", 1, const.eDontCrossfadeNext)
	unit:SetAngle(unit:GetVisualAngle() + 10800, 0)
	unit:SetStateText("idle", const.eDontCrossfade)
end
