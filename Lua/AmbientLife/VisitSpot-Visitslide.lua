-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PrgAmbientLife["Visitslide"] = function(unit, bld, obj, spot, slot_data, slot, slotname)
	local spot_pos, wp, wait_pos, _x, _y, _x2, _y2, _z, _angle, slideOut

	unit:PushDestructor(function(unit)
		PrgChangeSpotFlags(bld, bld, spot, 0, 1, slotname, slot)
	end)

	spot_pos = bld:GetSpotLocPos(spot)
	wp = bld:FindWaypointsInRange("Path", 50, spot_pos, "Nearest", unit)
	wait_pos = wp and wp[#wp]
	unit:Goto(wait_pos)
	if band(PrgChangeSpotFlags(bld, bld, spot, 0, 0, slotname, slot), 1) == 1 then
		_x, _y = bld:GetSpotLocPosXYZ(spot)
		_x2, _y2 = unit:GetSpotLocPosXYZ(-1)
		_x, _y, _z, _angle = OrientAxisToVectorXYZ(1, _x - _x2, _y - _y2, 0)
		unit:SetAxisAngle(_x, _y, _z, _angle, 200)
		unit:SetStateText("idle")
		while band(PrgChangeSpotFlags(bld, bld, spot, 0, 0, slotname, slot), 1) == 1 do
			Sleep(500)
			if unit.visit_restart then unit:PopAndCallDestructor() return end
		end
	end
	PrgChangeSpotFlags(bld, bld, spot, 1, 0, slotname, slot)
	FollowWaypointPath(unit, wp, nil, 1)	-- move [nil .. 1]
	unit:PlayState("playSlideUp")
	PrgChangeSpotFlags(bld, bld, spot, 0, 1, slotname, slot)
	spot = nil
	slideOut = bld:GetRandomSpot("Visitslideout")
	_x, _y, _z = bld:GetSpotLocPosXYZ(slideOut)
	unit:SetPos(_x, _y, _z, 0)
	unit:SetAngle(bld:GetSpotAngle2D(slideOut), 0)
	unit:PlayState("playSlideDown", 1, const.eDontCrossfade)

	unit:PopAndCallDestructor()
end
