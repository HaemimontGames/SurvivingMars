DefineClass.InterfaceModeDialog = {
	__parents = { "XDialog" },
	MouseCursor = const.DefaultMouseCursor,
	HandleMouse = true,
	
	last_speed_change = 0, --used to avoid game speed jitters from accidentally pressing dpad down/up right after left/right
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
				OpenXDialog("GamepadCheatsDlg")
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
		if FocusInfopanel and GetXDialog("Infopanel") then 
			GetXDialog("Infopanel"):ShowIPRollover()
		end
	elseif shortcut == "-RightTrigger" then
		if GetXDialog("Infopanel") then
			if FocusInfopanel then 
				GetXDialog("Infopanel"):SetFocus()
			elseif RolloverControl == GetXDialog("Infopanel") and GetXDialog("Infopanel") ~= self.desktop.keyboard_focus then
				XDestroyRolloverWindow()
			end
		end
		FocusInfopanel = false
	--right trigger + right thumbstick (tilt camera) disables focusing the infopanel (same as infopanel quick actions)
	elseif infopanel_focus_cancelling_shortcuts[shortcut] then
		local infopanel = GetXDialog("Infopanel")
		if infopanel then
			FocusInfopanel = false
			if RolloverControl == infopanel and IsKindOf(infopanel:GetContext(), "ResourceOverview") then
				XDestroyRolloverWindow()
			end
		end
		return "break"
	
	--Tutorial hint dismissing
	elseif shortcut == "Back" or shortcut == "TouchPadClick" then
		if DismissCurrentOnScreenHint() then
			return "break"
		end
	end
	
	--Common gamepad button actions (selection/build menu)
	local cursor = g_GamepadObjects and GetGamepadCursor()
	if shortcut == "ButtonA" and cursor then
		SelectObj(g_GamepadObjects:GetObject())
		return "break"
	elseif shortcut == "ButtonX" and cursor then
		SelectObj(g_GamepadObjects:GetUnit())
		return "break"
	elseif shortcut == "ButtonB" then
		if SelectedObj then
			SelectObj(nil)
		elseif ShowResourceOverview then
			ShowResourceOverview = false
			CloseResourceOverviewInfopanel()
		end
		return "break"
	elseif shortcut == "ButtonY" and cursor then
		if not GetXDialog("XBuildMenu") then
			OpenXBuildMenu()
		end
		return "break"
		
	--Zoom-out to overview
	elseif shortcut == "RightThumbDown" and InGameInterfaceMode ~= "overview" and cameraRTS.IsActive() then
		local minZoom, maxZoom = cameraRTS.GetZoomLimits()
		if cameraRTS.GetZoom() >= maxZoom then
			if not self:IsThreadRunning("ZoomOutToOverview") then
				self:CreateThread("ZoomOutToOverview", function(self)
					Sleep(300)
					GetInGameInterface():SetMode("overview")
				end, self)
			end
		end
	elseif shortcut == "-RightThumbDown" then
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
		local pins_dlg = GetXDialog("PinsDlg")
		--pins_dlg[2] because the first element is the gamepad RB hint icon
		if pins_dlg and #pins_dlg > 1 then pins_dlg[2]:SetFocus(true) end
		return "break"
		
	--DPad -> Game speed manipulation
	elseif shortcut == "DPadLeft" then --Slow down
		if (RealTime() - self.last_speed_change) > speed_change_block_ms then
			ChangeGameSpeedState(-1)
		end
		self.last_speed_change = RealTime()
		return "break"
	elseif shortcut == "DPadRight" then --Speed up
		if (RealTime() - self.last_speed_change) > speed_change_block_ms then
			ChangeGameSpeedState(1)
		end
		self.last_speed_change = RealTime()
		return "break"
	elseif shortcut == "DPadUp" then --Pause/unpause (opposite to DPadDown)
		--restore only from paused state
		if UISpeedState == "pause" and (RealTime() - self.last_speed_change) > speed_change_block_ms then
			SetGameSpeedState(speed_state_before_pause)
		end
		self.last_speed_change = RealTime()
		return "break"
	elseif shortcut == "DPadDown" then --Pause/unpause (opposite to DPadUp)
		--prevent speed_state_before_pause to get "pause" value
		if UISpeedState ~= "pause" and (RealTime() - self.last_speed_change) > speed_change_block_ms then
			speed_state_before_pause = UISpeedState
			SetGameSpeedState("pause")
		end
		self.last_speed_change = RealTime()
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
end

function InterfaceModeDialog:OnKillFocus()
	local pins = GetDialog("PinsDlg")
	if pins then pins:UpdateGamepadHint() end
end