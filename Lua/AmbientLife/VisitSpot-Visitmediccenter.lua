-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PrgAmbientLife["Visitmediccenter"] = function(unit, bld, obj, spot, slot_data, slot, slotname)
	if bld:Random(2)==0 then
		unit:PlayState("layLoungeStart")
		while unit:VisitTimeLeft() > 0 do
			unit:PlayState("layLoungeIdle")
			if unit.visit_restart then return end
		end
		unit:PlayState("layLoungeEnd")
	else
		unit:PlayState("layInjuredStart")
		while unit:VisitTimeLeft() > 0 do
			unit:PlayState("layInjuredIdle")
			if unit.visit_restart then return end
		end
		unit:PlayState("layInjuredEnd")
	end
end
