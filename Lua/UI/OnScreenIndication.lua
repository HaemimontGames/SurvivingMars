DefineClass.OnScreenIndication = {
	__parents = { "XDialog" },
	mode = "no_mode",
	temp_icon_remove = 0,
	Margins = box(80,0,0,110),
	FocusOnOpen = "",
}

local mode_to_img = {
	no_mode = false,
	normal_speed = "UI/Onscreen/onscreen_normalspeed.tga",
	medium_speed = "UI/Onscreen/onscreen_fastspeed.tga",
	fast_speed = "UI/Onscreen/onscreen_super_fastspeed.tga",
	paused = "UI/Onscreen/onscreen_pause.tga",
}

function OnScreenIndication:Init()
	XImage:new({
		Id = "idImage",
		Image = "UI/Onscreen/onscreen.pause.tga",
		FadeInTime = 200,
		FadeOutTime = 200,
		HAlign = "left",
		VAlign = "bottom",
	}, self)
	self:CreateThread(function()
		while true do
			self:UpdateIcon()
			Sleep(500)
		end
	end)
end

function OnScreenIndication:Open(...)
	self:RecalculateMargins()
	XDialog.Open(self, ...)
end

function OnScreenIndication:GetTimeMode()
	local time_factor = GetTimeFactor()
	if IsPaused() or time_factor==0 then
		return "paused"
	elseif time_factor > 0 and time_factor <= const.DefaultTimeFactor then
		return "normal_speed"
	elseif time_factor > const.DefaultTimeFactor and time_factor < const.DefaultTimeFactor * const.fastGameSpeed then
		return "medium_speed"
	elseif time_factor >= const.DefaultTimeFactor * const.fastGameSpeed then
		return "fast_speed"
	end
end

function OnScreenIndication:UpdateIcon()
	local time_mode = self:GetTimeMode()
	local mode = time_mode
	local img = mode_to_img[mode or self.mode]
	if img then
		self.idImage:SetImage(img)
	end
	if time_mode == "paused" then
		self.idImage:SetVisible(true)
	elseif self.mode ~= time_mode then
		self.temp_icon_remove = RealTime() + 3000
		self.idImage:SetVisible(true)
	elseif self.temp_icon_remove < RealTime() then
		self.idImage:SetVisible(false)
	end
	self.mode = mode
end

function OnScreenIndication:RecalculateMargins()
	--This is temporary and should be removed when implementing InGameInterface with new UI
	self:SetMargins(OnScreenIndication.Margins + GetSafeMargins())
end

function OnMsg.SafeAreaMarginsChanged()
	local osi_dlg = GetXDialog("OnScreenIndication")
	if osi_dlg then
		osi_dlg:RecalculateMargins()
	end
end

DefineClass.MarsPauseDlg = {
	__parents = {"XDialog"},
	FadeInTime = 300,
	FadeOutTime = 300,
	FocusOnOpen = "",
	ZOrder = -1,
	Dock = "box",
}

function MarsPauseDlg:Init()
	XImage:new({
		Id = "idVignette",
		Image = "UI/Vignette.tga",
		ImageFit = "stretch",
	}, self)
	self.idVignette:SetTransparency(155)
	XVignetteOverlay:new({}, self)
end

function MarsPauseDlg:ShowBottomLine(bShow)
	local igi = GetInGameInterface()
	local b = igi and igi:GetVisible()
	self.idVignetteOverlay.idBottom:SetVisible(bShow and not b)
end

function MarsPauseDlg:Close()
	XWindow.Close(self)
end

function MarsPauseDlg:ForceDelete()
	--delete the dialog during fade out interpolation
	local modifier = self:FindModifier("fade")
	if modifier then
		modifier.on_complete = function() end
	end
	self:delete()
end

function ShowPauseDialog(bShow, force)
	if bShow then
		local dlg = GetMarsPauseDlg()
		if not dlg or dlg and dlg.window_state == "closing" then
			if dlg then
				dlg:ForceDelete()
			end
			dlg = OpenMarsPauseDlg()
		elseif dlg and GetXDialog("Resupply") then
			dlg:SetParent(GetInGameInterface())
		end
		if dlg then
			dlg:ShowBottomLine(bShow)
		end
	else
		if IsEditorActive() or force then
			CloseMarsPauseDlg()
		elseif GetTimeFactor() > 0 then
			Msg("MarsResume")
		else
			local dlg = GetMarsPauseDlg()
			local desktop = terminal.desktop
			if dlg then
				if dlg:GetParent() ~= desktop then
					dlg:SetParent(desktop)
				end
				dlg:ShowBottomLine(bShow)
			end
		end
	end
end

function OpenMarsPauseDlg()
	if not GetXDialog("Resupply") and GameState.gameplay then
		return OpenXDialog("MarsPauseDlg")
	end
end

function GetMarsPauseDlg()
	return GetXDialog("MarsPauseDlg")
end

function OnMsg.MarsPause()
	ShowPauseDialog(true)
end

function OnMsg.MarsResume()
	CloseMarsPauseDlg()
end

function OnMsg.ChangeMap()
	local dlg = GetMarsPauseDlg()
	if dlg then
		dlg:SetFadeOutTime(0)
		CloseMarsPauseDlg()
	end
end

function CloseMarsPauseDlg()
	CloseXDialog("MarsPauseDlg")
end
