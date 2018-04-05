-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PrgAmbientLife["Visitmedic"] = function(unit, bld, obj, spot, slot_data, slot, slotname)
	unit:PushDestructor(function(unit)
		PrgChangeSpotFlags(bld, obj, spot, 0, 2, slotname, slot)
	end)

	PrgChangeSpotFlags(bld, obj, spot, 2, 0, slotname, slot)
	unit:PlayState("layLoungeStart")
	while true do
		unit:PlayState("layLoungeIdle", 1, const.eDontCrossfade)
		if unit:VisitTimeLeft() == 0 then
			if band(PrgChangeSpotFlags(bld, bld, spot, 0, 0, slotname, slot), 8) ~= 8 then
				break
			end
		end
		if unit.visit_restart then unit:PopAndCallDestructor() return end
	end
	PrgChangeSpotFlags(bld, obj, spot, 0, 2, slotname, slot)
	unit:PlayState("layLoungeEnd", 1, const.eDontCrossfade + const.eDontCrossfadeNext)
	unit:SetAngle(unit:GetVisualAngle() + 10800, 0)
	unit:SetStateText("idle")

	unit:PopAndCallDestructor()
end
