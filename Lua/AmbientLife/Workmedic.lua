-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PrgAmbientLife["Workmedic"] = function(unit, bld, obj, spot, slot_data, slot, slotname)
	local ptDesk, pathWork, ptBed, spotWork, spotPatient, slotnamePatient, slotPatient, _x, _y, _z

	unit:PushDestructor(function(unit)
		PrgChangeSpotFlags(bld, bld, spotPatient, 0, 12, slotnamePatient, slotPatient)
	end)

	ptDesk = bld:GetSpotLocPos(spot)
	pathWork = bld:FindWaypointsInRange("Pathwork", 50, nil, 50, ptDesk)
	ptBed = pathWork and pathWork[1] or ptDesk
	spotWork = bld:GetNearestSpot("Workbed", ptBed)
	spotPatient = bld:GetNearestSpot("Visitmedic", ptBed)
	slotPatient, slotnamePatient = PrgGetSlotBySpot(bld, spotPatient)
	PrgChangeSpotFlags(bld, bld, spotPatient, 4, 0, slotnamePatient, slotPatient)
	unit:PlayState("sitDeskStart")
	while true do
		if band(PrgChangeSpotFlags(bld, bld, spotPatient, 0, 0, slotnamePatient, slotPatient), 2) == 2 then
			PrgChangeSpotFlags(bld, bld, spotPatient, 8, 0, slotnamePatient, slotPatient)
			unit:PlayState("sitDeskEnd", 1, const.eDontCrossfade + const.eDontCrossfadeNext)
			unit:SetAngle(unit:GetVisualAngle() + 10800, 0)
			unit:SetStateText("idle", const.eDontCrossfade)
			FollowWaypointPath(unit, pathWork, nil, 1)	-- move [nil .. 1]
			_x, _y, _z = bld:GetSpotLocPosXYZ(spotWork)
			unit:SetPos(_x, _y, _z, 200)
			unit:SetAngle(bld:GetSpotAngle2D(spotWork), 200)
			unit:PlayState("standScan")
			unit:PlayState("standScan")
			unit:PlayState("standScan")
			if unit:VisitTimeLeft() > 0 then
				PrgChangeSpotFlags(bld, bld, spotPatient, 0, 8, slotnamePatient, slotPatient)
			else
				PrgChangeSpotFlags(bld, bld, spotPatient, 0, 12, slotnamePatient, slotPatient)
			end
			FollowWaypointPath(unit, pathWork, 1, nil)	-- move [1 .. nil]
			_x, _y, _z = bld:GetSpotLocPosXYZ(spot)
			unit:SetPos(_x, _y, _z, 200)
			unit:SetAngle(bld:GetSpotAngle2D(spot), 200)
			unit:PlayState("sitDeskStart")
			unit:PlayState("sitDeskIdle", 1, const.eDontCrossfade)
		else
			if unit:VisitTimeLeft() == 0 then
				if band(PrgChangeSpotFlags(bld, bld, spotPatient, 0, 0, slotnamePatient, slotPatient), 1) ~= 1 then
					break
				end
			end
			unit:PlayState("sitDeskIdle", 1, const.eDontCrossfade)
		end
		if unit.visit_restart then unit:PopAndCallDestructor() return end
	end
	unit:PlayState("sitDeskEnd", 1, const.eDontCrossfade + const.eDontCrossfadeNext)
	unit:SetAngle(unit:GetVisualAngle() + 10800, 0)
	unit:SetStateText("idle", const.eDontCrossfade)

	unit:PopAndCallDestructor()
end
