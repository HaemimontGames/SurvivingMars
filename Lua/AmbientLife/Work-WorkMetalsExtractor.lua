-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

local _slots = {}
PrgAmbientLife["WorkMetalsExtractor"] = function(unit, bld)
	local elevator, spot, slotname, slot

	unit:PushDestructor(function(unit)
		PrgChangeSpotFlags(bld, bld, spot, 0, 1, slotname, slot)
	end)

	unit:SetOutside(true)
	elevator = PrgGetNearestAttach(IsCloser, "Passenger", unit, bld, "MetalsExtractorElevator")
	elevator:Use(unit, 1)
	if unit.visit_restart then unit:PopAndCallDestructor() return end
	spot = bld:GetNearestSpot("Elevator", unit)
	slot, slotname = PrgGetSlotBySpot(bld, spot)
	PrgVisitHolder(unit, bld, bld, 1000)
	if unit.visit_restart then unit:PopAndCallDestructor() return end
	while true do
		Sleep(1000)
		if unit:VisitTimeLeft() == 0 then
			if band(PrgChangeSpotFlags(bld, bld, spot, 0, 0, slotname, slot), 1) == 0 then
				break
			end
		end
		if unit.visit_restart then unit:PopAndCallDestructor() return end
	end
	PrgChangeSpotFlags(bld, bld, spot, 1, 0, slotname, slot)
	unit:SetOutside(true)
	elevator:Use(unit, 2)
	if unit.visit_restart then unit:PopAndCallDestructor() return end

	unit:PopAndCallDestructor()
end
