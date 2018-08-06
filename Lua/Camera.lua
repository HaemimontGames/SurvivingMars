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

GlobalVar("CameraFollowObj", false)
GlobalVar("CameraFollowObjWaiting", false)

function Camera3pUnfollow()
	local obj = CameraFollowObj
	if IsValid(obj) then
		camera3p.DetachObject(obj)
		CameraFollowObj = false
		CameraFollowObjWaiting = false
		SetSignsVisible(true)
	end
	if camera3p.IsActive() then
		camera3p.EnableMouseControl(false, 1)
		if XPlayerActive then
			camera3p.DisableController(XPlayerActive, 1)
		end
		cameraRTS.Activate(1)
		if IsValid(obj) then
			ViewObjectRTS(obj, 0, nil, 8 * camera3p.GetZoom())
		end
	end
end

function UnfollowObjAndCloseModeDialog()
	Camera3pUnfollow()
	CloseModeDialog("follow_camera")
end

function OnMsg.PopupNotificationBegin()
	UnfollowObjAndCloseModeDialog()
end

local max_zoom = 600
local min_zoom = 50
local function Camera3pChangeZoom(change, time)
	camera3p.SetZoom(Clamp(camera3p.GetZoom(1) + change, min_zoom, max_zoom), time or 0, 1)
end

function Camera3pFollow(obj)
	if not IsValid(obj) then
		Camera3pUnfollow()
		return
	end
	if SelectedObj == obj then
		SelectObj()
	end
	local igi = GetInGameInterface()
	if igi then
		igi:SetMode("follow_camera")
	end
	g_CameraMakeTransparentEnabled = false
	if IsValid(CameraFollowObj) then
		camera3p.DetachObject(CameraFollowObj)
	end
	if not camera3p.IsActive() then
		camera3p.Activate(1)
		camera3p.EnableFollow(true, 1)
		if XPlayerActive then
			camera3p.EnableController(XPlayerActive, 1)
		end
		Camera3pChangeZoom(0)
		camera3p.SetEyeOffset(point(0, 0, -10*guim), 0, 1)
		camera3p.SetLookAtOffset(point(0, 0, -18*guim), 0, 1)
	end
	CameraFollowObj = obj
	camera3p.AttachObject(obj)
	camera3p.AlignBehindCharacter(1)
	camera3p.EnableCollisionAdjust(false)
	SetSignsVisible(false)
	if not CameraFollowObj:IsValidPos() then
		if CameraFollowObj:HasMember("holder") and CameraFollowObj.holder then
			CameraFollowObjWaiting = CameraFollowObj
			Camera3pFollow(CameraFollowObj.holder)
		end
	end
end

function Camera3pZoomIn()
	Camera3pChangeZoom(-30, 300)
end

function Camera3pZoomOut()
	Camera3pChangeZoom(30, 300)
end

function OnMsg.UIModeChange(mode)
	if mode ~= "follow_camera" then
		Camera3pUnfollow()
	end
end

function OnMsg.SaveGame()
	UnfollowObjAndCloseModeDialog()
end

DefineClass.CameraFollowObject = {
	__parents = { "Object", },
	camera_follow_disabled = false,
}

function CameraFollowObject:Done()
	if self == CameraFollowObj then
		UnfollowObjAndCloseModeDialog()
	end
end

DefineClass.FollowCameraModeDialog = {
	__parents = {"SelectionModeDialog"},
	mode_name = "follow_camera",
	visibility_states = false,
}

function FollowCameraModeDialog:Open()
	SelectionModeDialog.Open(self)
	self.visibility_states = {}
	for i, dlg in ipairs(self.parent) do
		if dlg ~= self then
			self.visibility_states[dlg] = dlg:GetVisible()
			dlg:SetVisible(false)
		end
	end
	HideGamepadCursor("FollowCamera")
end

function FollowCameraModeDialog:Close()
	local parent = self.parent
	SelectionModeDialog.Close(self)
	for dlg, visibility in pairs(self.visibility_states) do
		if dlg.window_state ~= "destroying" then
			dlg:SetVisible(visibility)
		end
	end
	ShowGamepadCursor("FollowCamera")
end

function FollowCameraModeDialog:OnShortcut(shortcut, source)
	if shortcut == "Escape" or shortcut == "ButtonA" or shortcut == "ButtonB" then
		self:ExitMode()
		return "break"
	elseif shortcut == "Alt" then
		camera3p.EnableMouseControl(true, 1)
		return "break"
	elseif shortcut == "-Alt" then
		camera3p.EnableMouseControl(false, 1)
		return "break"
	elseif shortcut == "-LeftTrigger" then
		return "break"
	end
	local invertLook = const.CameraControlInvertLook
	if (shortcut == "RightThumbDown" and not invertLook) or (shortcut == "RightThumbUp" and invertLook) then
		Camera3pZoomOut()
	elseif (shortcut == "RightThumbUp" and not invertLook) or (shortcut == "RightThumbDown" and invertLook) then
		Camera3pZoomIn()
	end
	return SelectionModeDialog.OnShortcut(self, shortcut, source)
end

function FollowCameraModeDialog:OnMouseButtonDown(pt, button)
	if button == "L" or button == "R" then
		self:ExitMode()
		return "break"
	elseif button == "M" then
		camera3p.EnableMouseControl(true, 1)
	end
	return SelectionModeDialog.OnMouseButtonDown(self, pt, button)
end

function FollowCameraModeDialog:OnMouseButtonUp(pt, button)
	if button == "M" then
		camera3p.EnableMouseControl(false, 1)
	end
	return SelectionModeDialog.OnMouseButtonUp(self, pt, button)
end

function FollowCameraModeDialog:OnMouseWheelBack()
	Camera3pZoomOut()
end

function FollowCameraModeDialog:OnMouseWheelForward()
	Camera3pZoomIn()
end

function FollowCameraModeDialog:ExitMode()
	Camera3pUnfollow()
	CloseModeDialog()
end