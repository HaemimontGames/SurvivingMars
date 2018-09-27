DefineClass.InterfaceModeDialog = {
	__parents = { "XDialog" },
	MouseCursor = const.DefaultMouseCursor,
	HandleMouse = true,
	
	mode_name = false,
}

function InterfaceModeDialog:Init()
	self:SetZOrder(-1)
	self:SetFocus()
end

function InterfaceModeDialog:DoneMap()
end

FocusInfopanel = false
CancelAllNotificationsThread = false
GamepadCheatsMenuThread = false --TEMP trigger GamepadCheatsDlg

local speed_state_before_pause = "play"
local speed_change_block_ms = 50
local infopanel_focus_cancelling_shortcuts = {
	["RightTrigger-RightThumbLeft"] = true,
	["RightTrigger-RightThumbUp"] = true,
	["RightTrigger-RightThumbRight"] = true,
	["RightTrigger-RightThumbDown"] = true,
	["RightTrigger-RightThumbUpLeft"] = true,
	["RightTrigger-RightThumbUpRight"] = true,
	["RightTrigger-RightThumbDownRight"] = true,
	["RightTrigger-RightThumbDownLeft"] = true,
}
function InterfaceModeDialog:OnShortcut(shortcut)
	--Trigger gamepad cheats (hold both triggers for 1sec)
	if CheatsEnabled() then
		--note: cheats can only be triggered by player 1 (they are for console users, but checks for all controllers are done only on PC)
		local xstate = XInput.CurrentState[XPlayerActive]
		if (shortcut == "+LeftTrigger" and (xstate.RightTrigger or 0) > 0) or (shortcut == "+RightTrigger" and (xstate.LeftTrigger or 0) > 0) then
			DeleteThread(GamepadCheatsMenuThread)
			GamepadCheatsMenuThread = CreateRealTimeThread(function()
				Sleep(1000)
				GamepadCheatsMenuThread = false
				OpenDialog("GamepadCheatsDlg")
			end)
		end
		if shortcut == "-LeftTrigger" or shortcut == "-RightTrigger" then
			DeleteThread(GamepadCheatsMenuThread)
		end
	end

	--Trigger in-game gamepad menu
	if shortcut == "-LeftTrigger" then
		OpenXGamepadMainMenu()
		return "break"
	end
	
	--Focusing the infopanel
	if shortcut == "RightTrigger" then
		FocusInfopanel = true
		if FocusInfopanel and GetDialog("Infopanel") then 
			GetDialog("Infopanel"):ShowIPRollover()
		end
	elseif shortcut == "-RightTrigger" then
		if FocusInfopanel then
			if GetDialog("Infopanel") then
				GetDialog("Infopanel"):SetFocus()
			end
		else
			if RolloverControl == GetDialog("Infopanel") and GetDialog("Infopanel") ~= self.desktop.keyboard_focus then
				XDestroyRolloverWindow()
			end
		end
		FocusInfopanel = false
	--right trigger + right thumbstick (tilt camera) disables focusing the infopanel (same as infopanel quick actions)
	elseif infopanel_focus_cancelling_shortcuts[shortcut] then
		FocusInfopanel = false
		local infopanel = GetDialog("Infopanel")
		if infopanel then
			if RolloverControl == infopanel and IsKindOf(infopanel:GetContext(), "ResourceOverview") then
				XDestroyRolloverWindow()
			end
		end
		return "break"
	
	--Tutorial hint dismissing
	elseif shortcut == "Back" or shortcut == "TouchPadClick" then
		local dlg = GetOnScreenHintDlg()
		if dlg and not dlg.minimized then
			dlg:DismissCurrentHint()
			return "break"
		else
			OpenEncyclopedia(LastDisabledHint or "HintGameStart")
			return "break"
		end
	end
	
	--Common gamepad button actions (selection/build menu)
	local cursor = g_GamepadObjects and GetGamepadCursor()
	local invertLook = const.CameraControlInvertLook
	if shortcut == "ButtonA" and cursor then
		SelectObj(g_GamepadObjects:GetObject())
		return "break"
	elseif shortcut == "ButtonX" and cursor then
		SelectObj(g_GamepadObjects:GetUnit())
		return "break"
	elseif shortcut == "ButtonB" then
		if SelectedObj then
			SelectObj(nil)
		end
		return "break"
	elseif shortcut == "ButtonY" and cursor then
		if not GetDialog("XBuildMenu") and GetInGameInterfaceMode() == "selection" then
			OpenXBuildMenu()
		end
		return "break"
		
	--Zoom-out to overview
	elseif ((shortcut == "+RightThumbDown" and not invertLook) or (shortcut == "+RightThumbUp" and invertLook)) and InGameInterfaceMode ~= "overview" and cameraRTS.IsActive() then
		local minZoom, maxZoom = cameraRTS.GetZoomLimits()
		if cameraRTS.GetZoom() >= maxZoom then
			if not self:IsThreadRunning("ZoomOutToOverview") then
				self:CreateThread("ZoomOutToOverview", function(self)
					Sleep(300)
					GetInGameInterface():SetMode("overview")
				end, self)
			end
		end
	elseif (shortcut == "-RightThumbDown" and not invertLook) or (shortcut == "-RightThumbUp" and invertLook) then
		if self:IsThreadRunning("ZoomOutToOverview") then
			self:DeleteThread("ZoomOutToOverview")
		end
		
	--Focusing the on-screen notifications dialog
	elseif shortcut == "+LeftShoulder" and self == self.desktop:GetKeyboardFocus() then
		DeleteThread(CancelAllNotificationsThread)
		CancelAllNotificationsThread = CreateRealTimeThread(function ()
			Sleep(800)
			CancelAllNotificationsThread = false
			local notifications = GetDialog("OnScreenNotificationsDlg")
			if notifications then
				notifications:CancelAllNotifications()
			end
		end)
	elseif shortcut == "-LeftShoulder" and self == self.desktop:GetKeyboardFocus() then
		if IsValidThread(CancelAllNotificationsThread) then
			DeleteThread(CancelAllNotificationsThread)
			local notifications = GetDialog("OnScreenNotificationsDlg")
			if notifications and #notifications.idNotifications > 0 then
				notifications:SetFocus(true)
			end
		end
		return "break"
		
	--Focusing the pin dialog
	elseif shortcut == "RightShoulder" then
		local pins_dlg = GetDialog("PinsDlg")
		--pins_dlg[2] because the first element is the gamepad RB hint icon
		if pins_dlg and #pins_dlg > 1 then pins_dlg[2]:SetFocus(true) end
		return "break"
		
	--DPad -> Game speed manipulation
	elseif shortcut == "DPadLeft" then --Slow down
		ChangeGameSpeedState(-1)
		return "break"
	elseif shortcut == "DPadRight" then --Speed up
		ChangeGameSpeedState(1)
		return "break"
	elseif shortcut == "DPadUp" then --Pause/unpause (opposite to DPadDown)
		UpdateInfobarVisibility("force")
		GetDialog("Infobar").idPad.idGridResources:SetFocus()
		return "break"
	elseif shortcut == "DPadDown" then --Pause/unpause (opposite to DPadUp)
		return "break"
		
	--Object cycling using thumb-stick clicks
	elseif shortcut == "LeftThumbClick" then
		CycleDomes()
		return "break"
	elseif shortcut == "RightThumbClick" then
		CycleRovers()
		return "break"
	end
end

function InterfaceModeDialog:OnSetFocus()
	local pins = GetDialog("PinsDlg")
	if pins then pins:UpdateGamepadHint() end
	local notifs = GetDialog("OnScreenNotificationsDlg")
	if notifs then notifs:UpdateGamepadHint() end
	local infobar = GetDialog("Infobar")
	if infobar then infobar:UpdateGamepadHint() end
end

function InterfaceModeDialog:OnKillFocus()
	local pins = GetDialog("PinsDlg")
	if pins then pins:UpdateGamepadHint() end
	local notifs = GetDialog("OnScreenNotificationsDlg")
	if notifs then notifs:UpdateGamepadHint() end
	local infobar = GetDialog("Infobar")
	if infobar then infobar:UpdateGamepadHint() end
end