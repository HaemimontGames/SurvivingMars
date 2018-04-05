-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PrgAmbientLife["Workbar"] = function(unit, bld, obj, spot, slot_data, slot, slotname)
	local espot, eslotname, eslot
	while true do
		unit:PlayState("spacebarOperate")
		if unit:VisitTimeLeft() == 0 then
			espot = bld:GetNearestSpot("Elevator", unit)
			eslot, eslotname = PrgGetSlotBySpot(bld, espot)
			if band(PrgChangeSpotFlags(bld, obj, espot, 0, 0, eslotname, eslot), 1) == 0 then
				break
			end
		end
		if unit.visit_restart then return end
	end
end
