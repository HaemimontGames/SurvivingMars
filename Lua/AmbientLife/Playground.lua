-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PrgAmbientLife["Playground"] = function(unit, bld, obj, spot, slot_data, slot, slotname)
	if bld:Random(100) < 50 then
		unit:PlayState("playGround1Start")
		while unit:VisitTimeLeft() > 0 do
			unit:PlayState("playGround1Idle", 1, const.eDontCrossfade)
			if unit.visit_restart then return end
		end
		unit:PlayState("playGround1End", 1, const.eDontCrossfadeNext)
	else
		unit:PlayState("playGround2Start")
		while unit:VisitTimeLeft() > 0 do
			unit:PlayState("playGround2Idle", 1, const.eDontCrossfade)
			if unit.visit_restart then return end
		end
		unit:PlayState("playGround2End", 1, const.eDontCrossfadeNext)
	end
	unit:SetAngle(unit:GetVisualAngle() + 10800, 0)
	unit:SetStateText("idle", const.eDontCrossfade)
end
