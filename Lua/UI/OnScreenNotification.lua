
DefineClass.OnScreenNotification =
{
	__parents = {"XDrawCacheDialog"},
	LayoutMethod = "HList",
	FocusOnOpen = "",
	RolloverOnFocus = true,
	RolloverTemplate = "Rollover",
	RolloverAnchorId = "idButton",
	RelativeFocusOrder = "new-line",
	
	default_icon = "UI/Icons/Notifications/placeholder.tga",
	background_image = "UI/Common/notification_pad.tga",
	title_color = RGBA(255,230,60,255),
	title_shadow_color = RGBA(0,0,0,0),
	title_shadow_size = 0,
	button_shine = "UI/Common/Hex_small_shine_2.tga",
	text_shadow_color = RGBA(0,0,0,0),
	text_shadow_size = 0,
	
	notification_id = false,
	dismissable = false,
	expiration = false,
	last_seen = false,
	game_time_expiration_thread = false,
	preset = false,
	show_vignette = false,
	vignette_image = "UI/Vignette_Red.tga",
	vignette_pulse_duration = 2000,
	vignette_thread = false,
	can_be_activated = false,
}

function OnScreenNotification:Open(...)
	XDialog.Open(self, ...)
	self:InitControls()
	self:CreateThread("show_thread", function()
		self:Show(true)
	end)
end

function OnScreenNotification:Init()
	local button = XBlinkingButton:new({
		Id = "idButton",
		ZOrder = 2,
		Shape = "InHHex",
		Dock = "left",
		HAlign = "center",
		VAlign = "center",
		ScaleModifier = point(850,850),
		LayoutMethod = "Box",
		Background = RGBA(0,0,0,0),
		FocusedBackground = RGBA(0,0,0,0),
		RolloverBackground = RGBA(0,0,0,0),
		PressedBackground = RGBA(0,0,0,0),
		MouseCursor = "UI/Cursors/Rollover.tga",
		FXMouseIn = "UIButtonMouseIn",
		FXPress = "UIButtonPressed",
		Icon = self.default_icon,
		AltPress = true,
		OnAltPress = function(ctrl, gamepad)
			if self:IsDismissable() then
				PlayFX("NotificationDismissed", "start")
				RemoveOnScreenNotification(self.notification_id)
			end
		end,
	}, self)
	XImage:new({
		Id = "idRollover",
		Margins = box(-7,-7,-7,-7),
		Visible = false,
		FadeInTime = 100,
		FadeOutTime = 100,
		Image = self.button_shine,
		ImageFit = "stretch",
	}, self.idButton)
	self.idButton.idRollover:SetVisible(false, true)
	local background = XImage:new({
		IdNode = false,
		Margins = box(-20,-9,0,0),
		ChildrenHandleMouse = false,
		Image = self.background_image,
	}, self)
	local text_win = XWindow:new({
		Padding = box(25,0,0,0),
		VAlign = "center",
		MaxWidth = 350,
		LayoutMethod = "VList",
		LayoutVSpacing = -3,
	}, background)
	XText:new({
		Id = "idTitle",
		Translate = true,
		Shorten = true,
		Margins = box(0,3,0,0),
		Padding = box(0,0,0,0),
		HandleMouse = false,
		TextFont = "OnScreenTitle",
		TextColor = self.title_color,
		ShadowColor = self.title_shadow_color,
		ShadowType = "outline",
		ShadowSize = self.title_shadow_size,
		MaxHeight = 35,
	}, text_win)
	XText:new({
		Id = "idText",
		Translate = true,
		Shorten = true,
		Padding = box(0,0,0,0),
		MaxHeight = 45,
		HandleMouse = false,
		TextFont = "OnScreenText",
		TextColor = RGBA(255,255,255,255),
		ShadowColor = self.text_shadow_color,
		ShadowType = "outline",
		ShadowSize = self.text_shadow_size,
	}, text_win)
end

function OnScreenNotification:InitControls()
end

function OnScreenNotification:OnSetRollover(rollover)
	if self.window_state ~= "destroying" then
		XDialog.OnSetRollover(self, rollover)
		self.idButton:OnSetRollover(rollover)
	end
end

function OnScreenNotification:OnMouseEnter(pos)
	if GetUIStyleGamepad() then return end
	local igi = GetInGameInterface()
	local dlg = igi and igi.mode_dialog
	if dlg and dlg:IsKindOf("UnitDirectionModeDialog") and dlg.unit then
		dlg:HideMouseCursorText(pos)
	end	
	return XDialog.OnMouseEnter(self, pos)
end

function OnScreenNotification:OnSetFocus()
	XDialog.OnSetFocus(self)
	local parent = GetDialog(self.parent)
	parent.gamepad_selection = self:GetFocusOrder():y()
	parent:UpdateRollover()
end

function OnScreenNotification:OnShortcut(shortcut, source)
	if shortcut == "ButtonA" then
		self.idButton:Press()
		GetDialog(self.parent):SetFocus(false, true)
		return "break"
	elseif shortcut == "ButtonX" then
		self.idButton:Press(true)
		return "break"
	end
	XDialog.OnShortcut(self, shortcut, source)
end

function OnScreenNotification:CycleObjs(cycle_objs)
	if cycle_objs then
		local idx = (self.last_seen or 0) + 1
		if idx > #cycle_objs then
			idx = 1
		end
		local obj = cycle_objs[idx]
		if IsPoint(obj) then
			ViewObjectMars(obj)
		elseif IsValid(obj) then
			if obj:GetEnumFlags(const.efVisible) ~= 0 then
				ViewAndSelectObject(obj)
			elseif obj:IsValidPos() then
				ViewObjectMars(obj:GetPos())
			end
		end
		self.last_seen = idx
		return obj
	end
end

function OnScreenNotification:SetTexts(preset, params)
	self.idTitle:SetText(T{preset.title, params})
	local text = params and params.override_text or preset.text
	text = T{text, params}
	if params.additional_text then
		text = text .. T{params.additional_text, params}
	end
	self.idText:SetText(T{text, params})
	
	if params.rollover_title then
		if params.context then
			self:SetContext(params.context)
		end
		self:SetRolloverTitle(params.rollover_title or "")
		self:SetRolloverText(params.rollover_text or "")
		self:SetRolloverHint(params.rollover_hint or "")
		self:SetRolloverHintGamepad(params.rollover_hint_gamepad or "")
	end
end

local day_duration = const.DayDuration
local hour_duration = const.HourDuration

function OnScreenNotification:FillData(preset, callback, params, cycle_objs)
	self.preset = preset
	local id = preset.id
	self.notification_id = id
	self.show_vignette = preset.ShowVignette
	self.vignette_image = preset.VignetteImage
	self.vignette_pulse_duration = preset.VignettePulseDuration
	if preset.image ~= "" then
		self.idButton.idIcon:SetImage(preset.image)
	end
	self:SetTexts(preset, params)
	
	local popup_preset = preset.popup_preset
	local encyclopedia_id = preset.encyclopedia_id
	self.can_be_activated = encyclopedia_id ~= "" or popup_preset ~= "" or (cycle_objs and not not next(cycle_objs)) or (not not callback) or preset.close_on_read
	self.idButton.OnPress = function()
		if self:IsThreadRunning("press_btn") then return end
		self:CreateThread("press_btn", function()
			if encyclopedia_id and encyclopedia_id ~= "" then
				OpenEncyclopedia(encyclopedia_id)
			else
				local res
				if popup_preset ~= "" then
					if type(params.GetPopupPreset)== "function" then 
						popup_preset = params.GetPopupPreset(params)
					end
					if popup_preset and PopupNotificationPresets[popup_preset] then
						res = WaitPopupNotification(popup_preset, {params = params})
					end
				end
				local cur_obj = self:CycleObjs(cycle_objs)
				if callback then
					callback(cur_obj, params, res)
				end
				if preset.close_on_read then
					PlayFX("NotificationDismissed", "start")
					RemoveOnScreenNotification(id)
				end
			end
		end)
	end
		
	--Assign initial expiration time
	if not self.expiration then
		self.expiration = preset.expiration
	end
	-- Overwrite expiration from params
	local current_expiration = self.expiration
	if params and params.expiration then
		current_expiration = params.expiration
	end
	--Close after the expiration time is over (self.expiration is subject to change)
	local expiration = preset.expiration ~= -1 and Min(current_expiration, preset.expiration) or current_expiration
	if expiration and expiration ~= -1 then
		local start_time = params.start_time or GameTime()
		local end_time = params.end_time or (start_time + expiration)
		params.end_time = end_time
		if preset.display_countdown then
			assert(preset.game_time, "'Display Countdown' must be used only on 'Game Time' notifications!")
			self:DeleteThread("countdown")
			self:CreateThread("countdown", function(self, preset, params, start_time, end_time)
				while true do
					for i = 1, 3 do
						local st, et = start_time, end_time
						local cd_param = "countdown"
						
						if i > 1 then 
							if params["start_time"..i] then
								st = params["start_time"..i]
							end
							if params["end_time"..i] then
								et = params["end_time"..i]
							elseif params["expiration"..i] then
								et = st + params["expiration"..i]
							end
							cd_param = "countdown"..i
						end
						
					
						local time = et - GameTime()
						local sols = time / day_duration
						local hours = (time % day_duration) / hour_duration
						if time > day_duration then
							if hours > 0 then
								params[cd_param] = sols > 1 and T{4108, "<sols> Sols <hours> h", sols = sols, hours = hours} or T{4109, "1 Sol <hours> h", hours = hours}
							else
								params[cd_param] = sols > 1 and T{4110, "<sols> Sols", sols = sols} or T{4111, "1 Sol"}
							end
						else
							params[cd_param] = T{4112, "<hours> h", hours = hours}
						end
					end
					self:SetTexts(preset, params)
					Sleep(1000)
				end
			end, self, preset, params, start_time, end_time)
		end
		
		local function remove_notif()
			Sleep(Max(end_time - GameTime(), 0))
			RemoveOnScreenNotification(id)
		end
		
		if preset.game_time then
			DeleteThread(self.game_time_expiration_thread)
			self.game_time_expiration_thread = CreateGameTimeThread(remove_notif)
		else
			self:DeleteThread("expire")
			self:CreateThread("expire", remove_notif)
		end
	end
end

function OnScreenNotification:Show(bShow, time)
	time = time or const.InterfaceAnimDuration
	EdgeAnimation(bShow, self, -(self.box:minx() + self.box:sizex()), 0, time)
	if bShow then
		if self.show_vignette then
			self:PulseVignette()
		end
		local sound_effect = self.preset and self.preset.SoundEffectOnShow
		if sound_effect and sound_effect ~= "" then
			PlayFX(sound_effect, "start")
		end
		PlayFX("NotificationIn", "start")
	else
		PlayFX("NotificationOut", "start")
	end
end

function OnScreenNotification:PulseVignette()
	DeleteThread(self.vignette_thread)
	self.vignette_thread = CreateRealTimeThread(function()
		local vignette = GetInGameInterface():GetVignette()
		if vignette then
			vignette:SetVisible(true)
			vignette:SetImage(self.vignette_image)
			vignette:Pulse(self.vignette_pulse_duration)
			Sleep(self.vignette_pulse_duration)
			vignette:SetVisible(false)
		end
	end)
end

function OnScreenNotification:IsDismissable()
	return self.dismissable or self.preset and self.preset.dismissable
end

DefineClass.OnScreenNotificationImportant =
{
	__parents = { "OnScreenNotification" },
	default_icon = "UI/Icons/Notifications/placeholder_2.tga",
	background_image = "UI/Common/notification_pad_2.tga",
	title_color = RGBA(255,182,111,255),
	title_shadow_color = RGBA(109,50,50,255),
	title_shadow_size = 2,
	button_shine = "UI/Common/Hex_2_shine_2.tga",
}

DefineClass.OnScreenNotificationCritical =
{
	__parents = { "OnScreenNotificationImportant" },
	show_vignette = true,
	
	background_image = "UI/Common/notification_pad_3.tga",
	title_shadow_color = RGBA(145,0,0,255),
	text_shadow_color = RGBA(145,0,0,255),
	text_shadow_size = 2,
}

function OnScreenNotificationCritical:InitControls()
	self.idButton:SetBlinking(true)
end

DefineClass.OnScreenNotificationsDlg =
{
	__parents = {"XDialog"},
	Margins = box(60,60,0,220),
	FocusOnOpen = "",
	HAlign = "left",
	VAlign = "top",
	
	gamepad_selection = false,
}

function OnScreenNotificationsDlg:Init()
	XWindow:new({
		Id = "idNotifications",
		LayoutMethod = "VOverlappingList",
		LayoutVSpacing = 10,
		IdNode = true,
	}, self)
	local rollover = XWindow:new({
		Id = "idRolloverWindow",
		Margins = box(0,20,0,0),
		Dock = "bottom",
		BorderWidth = 0,
		MinWidth = 450,
		MaxWidth = 450,
		HAlign = "left",
	}, self)
	rollover:SetVisible(false)
	local background_frame = XWindow:new({
		Dock = "box",
	}, rollover)
	XImage:new({
		Dock = "top",
		Image = "UI/Common/rollover_up_a.tga",
		ImageFit = "stretch-x",
	}, background_frame)
	XImage:new({
		Dock = "bottom",
		Image = "UI/Common/rollover_down_a.tga",
		ImageFit = "stretch-x",
	}, background_frame)
	XImage:new({
		Dock = "box",
		Image = "UI/Common/rollover_middle_a.tga",
		ImageFit = "stretch",
	}, background_frame)
	local background_watermark = XWindow:new({
		Dock = "box",
	}, rollover)
	XImage:new({
		Dock = "top",
		Image = "UI/Common/rollover_watermark_2.tga",
		ImageFit = "stretch-x",
	}, background_watermark)
	XImage:new({
		Dock = "bottom",
		Image = "UI/Common/rollover_watermark_2.tga",
		ImageFit = "stretch-x",
		Angle = 180 * 60,
	}, background_watermark)
	XFrame:new({
		Dock = "box",
		Image = "UI/Common/rollover_watermark.tga",
		TileFrame = true,
	}, background_watermark)
	local content_window = XWindow:new({
		Margins = box(24,6,24,6),
		LayoutMethod = "VList",
	}, rollover)
	XText:new({
		Id = "idTitle",
		Translate = true,
		TextFont = "RolloverTitle",
		TextColor = RGBA(255,188,59,255),
		RolloverTextColor = RGBA(255,188,59,255),
		TextHAlign = "center",
	}, content_window)
	XImage:new({
		Image = "UI/Common/rollover_line.tga",
		ImageFit = "stretch-x",
	}, content_window)
	XText:new({
		Id = "idText",
		Translate = true,
		MinHeight = 100,
		TextFont = "RolloverText",
		TextColor = RGBA(233,242,255,255),
		RolloverTextColor = RGBA(233,242,255,255),
		ShadowColor = RGBA(0,0,0,0),
		TextVAlign = "center",
	}, content_window)
end

function OnScreenNotificationsDlg:UpdateRollover()
	local selection = self.gamepad_selection
	local notif = selection and self.idNotifications[selection]
	if not notif then
		return
	end
	
	local descr = T{7548, "<LB> / <DPadUp> Navigate <DPadDown> / <RB>"}
	
	local can_activate = notif.can_be_activated
	if can_activate then
		descr = descr .. T{7888, "<newline><ButtonA> Activate"}
	end
	
	if notif:IsDismissable() then
		descr = descr .. T{7889, "<newline><ButtonX> Dismiss"}
	end
	
	self.idTitle:SetText(T{7582, "Notifications"})
	self.idText:SetText(descr)
end

function OnScreenNotificationsDlg:Open(...)
	self:RecalculateMargins()
	XDialog.Open(self, ...)
end

local notification_classes = {
	Normal = "OnScreenNotification",
	Important = "OnScreenNotificationImportant",
	Critical = "OnScreenNotificationCritical",
}

OnScreenNotificationVoicesQueue = { }
function OnScreenNotificationsDlgPlayNextVoice()
	-- This fn. is called from within Voice:Play() (this is the callback).
	-- This creates a sort of loop that goes on until the voices queue is empty
	--     or the notif. voice is interrupted by someone else calling Voice:Play().
	-- Note: the queue is cleared before starting the loop.
	local notif_dlg = GetDialog("OnScreenNotificationsDlg")
	while next(OnScreenNotificationVoicesQueue) do
		local preset = OnScreenNotificationVoicesQueue[1]
		table.remove(OnScreenNotificationVoicesQueue, 1)
		--skip over voices for notifs. that have been dismissed
		if notif_dlg:IsActive(preset.id) then
			g_Voice:Play(preset.voiced_text, not "actor", "Voiceover", not "subtitles", nil, nil, OnScreenNotificationsDlgPlayNextVoice)
			break
		end
	end
end

local ForbidNotificationVoicesBeforeTime = 15*1000 --15 seconds

function OnScreenNotificationsDlg:AddNotification(id, callback, params, cycle_objs)
	local preset = OnScreenNotificationPresets[id]
	local notif = self:GetNotificationById(id)
	if notif then
		notif:FillData(preset, callback, params, cycle_objs)
	else
		local class = notification_classes[preset.priority]
		local new_item = g_Classes[class]:new({}, self.idNotifications)
		
		local total_colonists = #(UICity.labels.Colonist or empty_table)
		local voiced_text = preset.voiced_text or ""
		if voiced_text ~= "" and GameTime() > ForbidNotificationVoicesBeforeTime and (total_colonists <= 100 or (id ~= "BrokenCables" and id ~= "BrokenPipes")) then
			if g_Voice:IsPlaying() or IsValidThread(g_Voice.thread) then
				table.insert(OnScreenNotificationVoicesQueue, preset) --enqueue voice
			else
				OnScreenNotificationVoicesQueue = { } --begin new voice queue
				g_Voice:Play(voiced_text, not "actor", "Voiceover", not "subtitles", nil, nil, OnScreenNotificationsDlgPlayNextVoice)
			end
		end
		
		new_item:FillData(preset, callback, params, cycle_objs)
		new_item:Open()
		self:ResolveRelativeFocusOrder()
	end
end

function OnScreenNotificationsDlg:AddCustomNotification(data, callback, params, cycle_objs)
	local notif = self:GetNotificationById(data.id)
	if notif then
		notif:FillData(data, callback, params, cycle_objs)
	else
		local class = notification_classes[data.priority]
		local new_item = g_Classes[class]:new({}, self.idNotifications)
		
		new_item:FillData(data, callback, params, cycle_objs)
		new_item:Open()
		self:ResolveRelativeFocusOrder()
	end
end

function OnScreenNotificationsDlg:CancelAllNotifications()
	local notif_container = self.idNotifications
	for i = #notif_container, 1, -1 do
		notif_container[i].idButton:Press(true)
	end
end

function OnScreenNotificationsDlg:RemoveNotification(id)
	local ctrl = self:GetNotificationById(id)
	if ctrl then
		local notif_container = self.idNotifications
		if ctrl:IsThreadRunning("show_thread") then return end
		ctrl:CreateThread("show_thread", function()
			local time = const.InterfaceAnimDuration
			if ctrl.window_state ~= "destroying" then
				ctrl:Show(false, time)
			end
			Sleep(time)
			if ctrl.window_state ~= "destroying" then
				local new_selection
				if self.gamepad_selection then
					local notif_count = #notif_container
					local pos = notif_count == self.gamepad_selection and (notif_count - 1) or Min(self.gamepad_selection + 1, notif_count)
					new_selection = notif_container[pos]
					if new_selection then
						new_selection:SetFocus(true)
					end
				end
				ctrl:Close()
				if #notif_container > 0 then
					self:ResolveRelativeFocusOrder()
					if new_selection then
						self.gamepad_selection = new_selection:GetFocusOrder():y()
					end
				else
					self:SetFocus(false, true)
					self.gamepad_selection = false
				end
			end
		end)
	end
	local idx = table.find(g_ActiveOnScreenNotifications, 1, id)
	if idx then
		table.remove(g_ActiveOnScreenNotifications, idx)
	end
end

function OnScreenNotificationsDlg:OnShortcut(shortcut, source)
	if shortcut == "ButtonB" or shortcut == "Escape" then
		self:SetFocus(false, true)
		return "break"
	elseif shortcut == "LeftShoulder" or shortcut == "+LeftShoulder" or shortcut == "RightShoulder" then
		shortcut = (shortcut == "LeftShoulder" or shortcut == "+LeftShoulder") and "DPadUp" or "DPadDown"
		XDialog.OnShortcut(self, shortcut, source)
		return "break"
	end
	XDialog.OnShortcut(self, shortcut, source)
	return source == "gamepad" and not shortcut:starts_with("+") and "break"
end

function OnScreenNotificationsDlg:GetRelativeFocus(order, relation)
	local focus = XDialog.GetRelativeFocus(self, order, relation)
	if not focus then
		local notif_container = self.idNotifications
		if relation == "down" then
			focus = notif_container[1]
		elseif relation == "up" then
			focus = notif_container[#notif_container]
		end
	end
	return focus
end

function OnScreenNotificationsDlg:OnSetFocus()
	LockHRXboxLeftThumb(self.class)

	local notif_container = self.idNotifications
	if #notif_container == 0 then
		return
	end
	
	self.gamepad_selection = #notif_container
	self.idNotifications[self.gamepad_selection]:SetFocus(true)
	self.idRolloverWindow:SetVisible(true)
	XDialog.OnSetFocus(self)
end

function OnScreenNotificationsDlg:OnKillFocus()
	UnlockHRXboxLeftThumb(self.class)
	if self.window_state ~= "destroying" then
		local notif_container = self.idNotifications
		local selection = self.gamepad_selection
		if selection and #notif_container >= selection then
			notif_container[selection]:SetFocus(false)
		end
		self.gamepad_selection = false
		self.idRolloverWindow:SetVisible(false)
		XDialog.OnKillFocus(self)
	end
end

function OnScreenNotificationsDlg:GetNotificationById(id)
	return table.find_value(self.idNotifications, "notification_id", id)
end

function OnScreenNotificationsDlg:IsActive(id)
	return not not self:GetNotificationById(id)
end

function OnScreenNotificationsDlg:RecalculateMargins()
	--This is temporary and should be removed when implementing InGameInterface with new UI
	self:SetMargins(OnScreenNotificationsDlg.Margins + GetSafeMargins())
end

function HandleNewObjsNotif(container, notif_id, bExpire, params_func, contains_objects, keep_destroyed)
	contains_objects = (contains_objects ~= false) and true or false
	local duration = 60000
	local expiration = 0
	local displayed_in_notif = {}
	while true do
		local change
		if contains_objects then
			for i = #container, 1, -1 do
				local obj = container[i]
				if not IsValid(obj) or IsKindOf(obj, "BaseBuilding") and obj.destroyed and not keep_destroyed then
					table.remove(container, i)
				end
			end
		end
		if not table.is_isubset(container, displayed_in_notif) then
			expiration = GameTime() + duration
			change = true
		elseif #container ~= #displayed_in_notif then
			change = true
		end
		if change then
			displayed_in_notif = table.copy(container)
			local params = params_func and type(params_func) == "function" and params_func(displayed_in_notif) or {count = #displayed_in_notif}
			AddOnScreenNotification(notif_id, nil, params, displayed_in_notif)
		end
		Sleep(1000)
		if bExpire and (expiration > 0 and expiration < GameTime()) or not bExpire and #container == 0 then
			RemoveOnScreenNotification(notif_id)
			for i = #container, 1, -1 do
				table.remove(container, i)
			end
			displayed_in_notif = {}
			expiration = 0
		end
	end
end

GlobalVar("g_ActiveOnScreenNotifications", {}) -- currently active onscreen notifications
GlobalVar("g_ShownOnScreenNotifications",{})-- show once notifications support
function AddOnScreenNotification(id, callback, params, cycle_objs)
	params = params or {}
	local preset = OnScreenNotificationPresets[id]
	if not preset then
		print("!!!No OnScreenNotification preset " .. id)
		return
	end
	if preset.show_once and g_ShownOnScreenNotifications[id] then
		return
	end
	-- edit the existing one instead of creating new one on each update, e.g. SA_CustomNotification
	local entry = pack_params(id, callback, params, cycle_objs)
	local idx = table.find(g_ActiveOnScreenNotifications, 1, id) or (#g_ActiveOnScreenNotifications + 1)
	g_ActiveOnScreenNotifications[idx] = entry
	
	local dlg = GetDialog("OnScreenNotificationsDlg")
	if not dlg then
		if not GetInGameInterface() then
			return
		end
		dlg = OpenDialog("OnScreenNotificationsDlg", GetInGameInterface())
	end
	dlg:AddNotification(id, callback, params, cycle_objs)
	g_ShownOnScreenNotifications[id] = true
	if preset.fx_action ~= "" then
		PlayFX(preset.fx_action)
	end
end

--[[@@@
Display a custom on-screen notification.
@function void AddCustomOnScreenNotification(string id, string title, string text, string image, function callback, table params)
@param string id - unique identifier of the notification.
@param string title - title of the notification.
@param string text - body text of the notification.
@param string image - path to the notification icon.
@param function callback - optional. Function called when the user clicks the notification.
@param table params - optional. additional parameters.
Additional parameters are supplied to the translatable texts, but can also be used to tweak the functionality of the notification:
- _'cycle_objs'_ will cause the camera to cycle through a list of _GameObjects_ or _points_ when the user clicks the notification.
- _'priority'_ changes the priority of the notification (choose between _"Normal"_, _"Important"_ and _"Critical"_; default=_"Normal"_).
- _'dismissable'_ dictates the dismissability of the notification (default=_true_)
- _'close_on_read'_ will cause the notification to disappear when the user clicks on it (default=_false_).
- _'expiration'_ is the amount of time (in _milliseconds_) that the notification will stay on the screen (default=_-1_).
- _'game_time'_ decides if the expiration countdown is done in _RealTime_ or _GameTime_ (default=_false_).
- _'display_countdown'_ must be _true_ if the _expiration_ countdown will be displayed in the notification texts (will be formatted and supplied to the translatable texts as _'countdown'_ parameter; this requires _'game_time'_ to be _true_).
]]
function AddCustomOnScreenNotification(id, title, text, image, callback, params)
	assert(not OnScreenNotificationPresets[id], string.format("Custom OnScreenNotification: Duplicates the id of preset.(id - %s).",tostring(id)))
	params = params or {}
	local cycle_objs = params.cycle_objs
	
	local entry = pack_params(id, callback, params, cycle_objs)

	--The difference between this function and the original 'AddOnScreenNotification()' is that here we create a mock preset:
	--Note: this function is useful for modding, but not all functionality is documented.
	local data = {
		id = id,
		name = id,
		title = title,
		text = text,
		image = image,
	}
	table.set_defaults(data, params)
	table.set_defaults(data, OnScreenNotificationPreset)
	entry.custom_preset = data
	-- edit the existing one instead of creating new one on each update
	local idx = table.find(g_ActiveOnScreenNotifications, 1, id) or #g_ActiveOnScreenNotifications + 1
	g_ActiveOnScreenNotifications[idx] = entry
	
	local dlg = GetDialog("OnScreenNotificationsDlg")
	if not dlg then
		if not GetInGameInterface() then
			return
		end
		dlg = OpenDialog("OnScreenNotificationsDlg", GetInGameInterface())
	end
	dlg:AddCustomNotification(data, callback, params, cycle_objs)
	g_ShownOnScreenNotifications[id] = true
	
	if type(params.fx_action) == "string" and params.fx_action ~= "" then
		PlayFX(params.fx_action)
	end
end

function LoadCustomOnScreenNotification(notification)
	local data = notification.custom_preset or empty_table
	local id, callback, params, cycle_objs = unpack_params(notification)

	g_ActiveOnScreenNotifications[#g_ActiveOnScreenNotifications + 1] = notification
	
	local dlg = GetDialog("OnScreenNotificationsDlg")
	if not dlg then
		if not GetInGameInterface() then
			return
		end
		dlg = OpenDialog("OnScreenNotificationsDlg", GetInGameInterface())
	end
	dlg:AddCustomNotification(data, callback, params, cycle_objs)
	g_ShownOnScreenNotifications[id] = true
	
	if type(params.fx_action) == "string" and params.fx_action ~= "" then
		PlayFX(params.fx_action)
	end
end

function RemoveOnScreenNotification(id)
	local dlg = GetDialog("OnScreenNotificationsDlg")
	if dlg then
		dlg:RemoveNotification(id)
	end
end

function IsOnScreenNotificationShown(id)
	local dlg = GetDialog("OnScreenNotificationsDlg")
	return dlg and dlg:IsActive(id)
end

function ShowNotifications() -- called on load game
	local notifications = g_ActiveOnScreenNotifications
	g_ActiveOnScreenNotifications = {}
	for _, notification in ipairs(notifications) do
		if notification.custom_preset then
			LoadCustomOnScreenNotification(notification)
		else		
			AddOnScreenNotification(unpack_params(notification))
		end
	end
end

OnMsg.InGameInterfaceCreated = ShowNotifications

function OnMsg.AchievementUnlocked(xplayer, achievement)
	if not Platform.developer then
		return
	end
	if Platform.desktop then
		local data = AchievementPresets[achievement]
		local params = { achievement = data.display_name, description = data.description }
		AddOnScreenNotification("AchievementUnlocked", nil, params)
	end
end

function OnMsg.GatherFXActions(list)
	list[#list + 1] = "NotificationDismissed"
end

function SetOnScreenNotificationDismissable(id, dismissable)
	local dlg = GetDialog("OnScreenNotificationsDlg")
	if dlg then
		local notification = dlg:GetNotificationById(id)
		if notification then
			notification.dismissable = dismissable
		end
	end
end

function OnMsg.SafeAreaMarginsChanged()
	local notifications_dlg = GetDialog("OnScreenNotificationsDlg")
	if notifications_dlg then
		notifications_dlg:RecalculateMargins()
	end
end