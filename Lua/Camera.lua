function ViewObjectRTS(obj, force_time, forced_pos, zoom)
	local cur_pos, cur_la = cameraRTS.GetPosLookAt()
	local cur_off = cur_la - cur_pos
	
	local la = IsPoint(obj) and obj or obj:HasMember("GetLogicalPos") and obj:GetLogicalPos() or obj:GetVisualPos()
	if la == InvalidPos() then
		return
	end
	local z = la:z()
	la = la:SetTerrainZ()
	
	local z1, z2 = 100*guim, 300*guim
	local dz = z and (z - la:z()) or 0
	if dz >= z1 then
		dz = Min(dz, z2)
		local dx, dy = SetLen2D(cur_off, dz):xy()
		local x, y, z = la:xy()
		la = point(x + dx, y + dy):SetTerrainZ()
		local min, max = cameraRTS.GetZoomLimits()
		zoom = min + (max - min) * (dz - z1) / (z2 - z1)
	end
	
	local pos = forced_pos or (la - cur_off)
	
	local min_dist, max_dist = 200*guim, 1000*guim
	local min_time, max_time = 200, 500
	local dist_factor = Clamp(pos:Dist2D(cur_pos) - min_dist, 0, max_dist) * 100 / (max_dist - min_dist)
	local time = force_time or (min_time + (max_time - min_time) * dist_factor / 100)
	LockCamera("ViewObjectRTS")
	cameraRTS.SetCamera(pos, la, time, const.Easing.SinInOut)
	if zoom then
		cameraRTS.SetZoom(zoom, time)
	end
	while cameraRTS.IsMoving() do
		WaitMsg("OnRender")
	end
	UnlockCamera("ViewObjectRTS")
end

function CameraObjUpdate()
	g_CameraObj:SnapToCamera()
	if InGameInterfaceMode == "overview" or InMarkingVolume() then
		g_CameraObj:ClearEnumFlags(const.efVisible)
	else
		g_CameraObj:SetEnumFlags(const.efVisible)
	end
end
