config.FollowCameraMinZoom = 50
config.FollowCameraMaxZoom = 600
config.FollowCameraEyeOffset = point(0, 0, -10*guim)
config.FollowCameraLookAtOffset = point(0, 0, -18*guim)

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
	if CameraFollowObj then
		Camera3pUnfollow()
		CloseModeDialog("follow_camera")
	end
end

function Camera3pChangeZoom(change, time)
	camera3p.SetZoom(Clamp(camera3p.GetZoom(1) + change, config.FollowCameraMinZoom, config.FollowCameraMaxZoom), time or 0, 1)
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
		camera3p.SetEyeOffset(config.FollowCameraEyeOffset, 0, 1)
		camera3p.SetLookAtOffset(config.FollowCameraLookAtOffset, 0, 1)
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
		UnfollowObjAndCloseModeDialog()
	end
end

OnMsg.SaveGame = UnfollowObjAndCloseModeDialog
OnMsg.SelectedObjChange = UnfollowObjAndCloseModeDialog
OnMsg.MessageBoxPreOpen = UnfollowObjAndCloseModeDialog

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
	self.visibility_states = false
	ShowGamepadCursor("FollowCamera")
end

function FollowCameraModeDialog:OnShortcut(shortcut, source)
	if shortcut == "Escape" or shortcut == "ButtonA" or shortcut == "ButtonB" or shortcut == "Start" then
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