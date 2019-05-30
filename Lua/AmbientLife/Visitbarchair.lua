-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PrgAmbientLife["Visitbarchair"] = function(unit, bld, obj, spot, slot_data, slot, slotname)
	local rnd, _x, _y, _z

	unit:PushDestructor(function(unit)
		unit:Detach()
	end)

	obj:SetStateText("idle", const.eDontCrossfade)
	unit:PlayState("spacebarSitStart")
	unit:SetStateText("spacebarSitIdle", const.eDontCrossfade)
	obj:Attach(unit, spot)
	obj:PlayState("up", 1, const.eDontCrossfade)
	while unit:VisitTimeLeft() > 0 do
		rnd = bld:Random(100)
		if rnd < 50 then
			unit:PlayState("spacebarSitDrinkStart", 1, const.eDontCrossfade)
			unit:PlayState("spacebarSitDrinkIdle", 1, const.eDontCrossfade)
			unit:PlayState("spacebarSitDrinkEnd", 1, const.eDontCrossfade)
		end
		unit:PlayState("spacebarSitIdle", 1, const.eDontCrossfade)
		if unit.visit_restart then unit:PopAndCallDestructor() return end
	end
	obj:PlayState("up", 1, const.eReverse + const.eDontCrossfade + const.eDontCrossfadeNext)
	obj:SetStateText("idle", const.eDontCrossfade)
	unit:Detach()
	_x, _y, _z = obj:GetSpotLocPosXYZ(spot)
	unit:SetPos(_x, _y, _z, 0)
	unit:SetAngle(obj:GetSpotAngle2D(spot), 0)
	unit:PlayState("spacebarSitEnd", 1, const.eDontCrossfadeNext)
	unit:SetAngle(unit:GetVisualAngle() + 10800, 0)
	unit:SetStateText("idle", const.eDontCrossfade)

	unit:PopAndCallDestructor()
end
