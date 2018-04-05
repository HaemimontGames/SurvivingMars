-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PrgAmbientLife["Visitbasketball"] = function(unit, bld, obj, spot, slot_data, slot, slotname)
	local __placed, _x, _y, _z

	unit:PushDestructor(function(unit)
		if IsValid(__placed) then
			DoneObject(__placed)
		end
	end)

	__placed = PlaceObject("Basketball", nil, const.cfComponentEx + const.cfComponentAttach)
	NetTempObject(__placed)
	__placed:SetState("playBasketball", const.eDontCrossfade)
	unit:Attach(__placed, unit:GetRandomSpot("Origin"))
	unit:PlayState("playBasketball", 1, const.eDontCrossfade + const.eDontCrossfadeNext)
	_x, _y, _z = bld:GetSpotLocPosXYZ(bld:GetRandomSpot("Visitbasketballout"))
	unit:SetPos(_x, _y, _z, 0)
	unit:SetAngle(bld:GetSpotAngle2D(bld:GetRandomSpot("Visitbasketballout")), 0)

	unit:PopAndCallDestructor()
end
