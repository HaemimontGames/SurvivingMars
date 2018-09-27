PopupPropagateShortcuts = {
	["Ctrl-F1"] = true,
	["F9"] = true,
	["F11"] = true,
}

DefineClass.XMarsMessageBox =
{
	__parents = {"XDialog"},
	ZOrder = 1000001,
	ContextUpdateOnOpen = true,
	
	template = false,
}

function XMarsMessageBox:Init()
	local template = "MarsMessageBox"
	if XTemplates[self.template] then
		template = self.template
	end
	XTemplateSpawn(template, self, self.context)
end

function XMarsMessageBox:OnContextUpdate(context, ...)
	self.idTitle:SetText(context.title or "")
	if not context.popup_notification then
		self.idDescription:SetText(context.text)
	else
		SetPopupNotificationText(self, context)
	end

	if context.image and context.image ~= "" then
		local background = self:ResolveId("idBackground")
		if background then
			background:SetImage(context.image)
		end
	end
end

function XMarsMessageBox:Open(...)
	PlayFX("Popup", "start")
	XDialog.Open(self, ...)
	self:SetModal()
	local context = self.context
	if GetUIStyleGamepad() or (context and context.force_ui_style == "gamepad") then
		self.idList:SetSelection(context.initial_focus or 1)
	end
	if not self.context.popup_notification then
		g_OpenMessageBoxes[self] = true
		ShowMouseCursor(self)
	else
		PopupNotificationBegin(self)
	end
end

function XMarsMessageBox:Close(...)
	PlayFX("Popup", "end")
	if not self.context.popup_notification then
		g_OpenMessageBoxes[self] = nil
		HideMouseCursor(self)
	else
		PopupNotificationEnd(self, ...)
	end
	XDialog.Close(self, ...)
end

function XMarsMessageBox:PreventClose()
	self.idBottomFrameWindow:SetVisible(false)
	self.idBottomLine:SetVisible(false)
	self.OnShortcut = function() end
end

----- Message

function GetMarsMessageBox()
	return GetDialog("MarsMessageBox")
end

function CreateMarsMessageBox(caption, text, ok_text, parent, image, context, template)
	parent = parent or terminal.desktop
	local subcontext = SubContext(context, {
		title = caption,
		text = text,
		image = image,
	})
	local actions = {}
	actions[#actions + 1] = XAction:new({
		ActionId = "idOk",
		ActionName = ok_text or T{6877, "OK"},
		ActionShortcut = "Escape",
		ActionShortcut2 = "Enter",
		ActionGamepad = "ButtonA",
		ActionIcon = "UI/Icons/message_ok.tga",
		OnActionEffect = "close",
	})
	local msg = XMarsMessageBox:new({actions = actions, template = template}, parent, subcontext)
	msg.OnShortcut = function(self, shortcut, source)
		if shortcut == "ButtonB" or shortcut == "1" then
			self:Close()
			return "break"
		end
		local res = XDialog.OnShortcut(self, shortcut, source)
		return not PopupPropagateShortcuts[shortcut] and not shortcut:starts_with("+") and "break" or res
	end
	msg:Open()
	return msg
end

function CreateMessageBox(caption, text, ok_text, parent, obj, template)
	return CreateMarsMessageBox(caption, text, ok_text, parent, nil, obj, template)
end

--function should always be called from a thread
function WaitMarsMessage(parent, caption, text, ok_text, image, context, template)
	local msg = CreateMarsMessageBox(caption, text, ok_text, parent, image, context, template)
	local result, dataset, xInputStateAtClose = msg:Wait()
	return result, dataset, xInputStateAtClose
end

function WaitMessage(parent, caption, text, ok_text, obj, template)
	return WaitMarsMessage(parent, caption, text, ok_text, nil, obj, template)
end

----- Question

function CreateMarsQuestionBox(caption, text, ok_text, cancel_text, parent, image, context, template)
	parent = parent or terminal.desktop
	local subcontext = SubContext(context, {
		title = caption,
		text = text,
		image = image,
	})
	local actions = {}
	actions[#actions + 1] = XAction:new({
		ActionId = "idOk",
		ActionName = ok_text or T{6878, "OK"},
		ActionShortcut = "Enter",
		ActionShortcut2 = "1",
		ActionIcon = "UI/Icons/message_1.tga",
		OnAction = function(self, host, source)
			host:Close("ok")
		end
	})
	actions[#actions + 1] = XAction:new({
		ActionId = "idCancel",
		ActionName = cancel_text or T{6879, "Cancel"},
		ActionShortcut = "Escape",
		ActionShortcut2 = "2",
		ActionGamepad = "ButtonB",
		ActionIcon = "UI/Icons/message_2.tga",
		OnAction = function(self, host, source)
			host:Close("cancel")
		end
	})
	local msg = XMarsMessageBox:new({actions = actions, template = template}, parent, subcontext)
	msg.OnShortcut = function(self, shortcut, source)
		local res = XDialog.OnShortcut(self, shortcut, source)
		return not PopupPropagateShortcuts[shortcut] and not shortcut:starts_with("+") and "break" or res
	end
	msg:Open()
	return msg
end

-- returns "ok", "cancel"  or false (if killed prematurely)
function WaitMarsQuestion(parent, caption, text, ok_text, cancel_text, image, context, template)
	local msg = CreateMarsQuestionBox(caption, text, ok_text, cancel_text, parent, image, context, template)
	local result, dataset, xInputStateAtClose = msg:Wait()
	return result, dataset, xInputStateAtClose
end

function WaitQuestion(parent, caption, text, ok_text, cancel_text, obj, template)
	return WaitMarsQuestion(parent, caption, text, ok_text, cancel_text, nil, obj, template)
end

----- Overrides and other members for the "Switch to controller?" question box (special case)

if FirstLoad then
	SwitchToControllerQuestionThread = false
end

local function RollBackDialogs()
	if GameState.gameplay then --during gameplay phase
		--close all dialogs and leave only InGameInterface
		local igi = GetInGameInterface()
		local dlgs_to_close = { }
		for name,dlg in pairs(Dialogs) do
			if type(name) == "string" then
				--hints dlg can change its parent
				if not dlg:IsWithin(igi) and dlg ~= igi.mode_dialog and name ~= "OnScreenHintDlg" and name ~= "MarsPauseDlg" then
					dlgs_to_close[#dlgs_to_close + 1] = dlg
					--also remove popups, which are children to this dialog
					for i = #g_PopupQueue, 1, -1 do
						if 	g_PopupQueue[i].parent == dlg then
							table.remove(g_PopupQueue, i)
						end
					end
				end
			end
		end
		for i,dlg in ipairs(dlgs_to_close) do
			if dlg.window_state ~= "destroying" then
				dlg:Close()
			end
		end
	else --in pregame menu
		local main_menu = GetDialog("PGMainMenu")
		if main_menu then
			CloseDialog("Achievements")
			if main_menu:GetMode() == "Mission" then
				main_menu:SetMode("Mission")
			else
				main_menu:SetMode("")
			end
		end
	end
end

function ShowControlsSwitchQuestion(parent)
	assert(not GetUIStyleGamepad())
	if not Platform.desktop or IsValidThread(SwitchToControllerQuestionThread) then
		return
	end
	
	local reason = "gamepad_question"
	PopupNotificationSuspend(reason)
	SwitchToControllerQuestionThread = CreateRealTimeThread(function()
		if GameState.gameplay then
			Pause(reason)
			ShowPauseDialog(true)
		end
		if WaitMarsQuestion(parent or terminal.desktop, SwitchToControllerTitle, SwitchToController, nil, nil, nil, { force_ui_style = "gamepad" }) == "ok" then
			AccountStorage.Options.Gamepad = true
			ChangeGamepadUIStyle({ true })
			SaveAccountStorage(5000)
			RollBackDialogs()
		end
		if GameState.gameplay then
			Resume(reason)
			local igi = GetInGameInterface()
			ShowPauseDialog(not igi or not igi:GetVisible())
		end
		PopupNotificationResume(reason)
	end)
end

function OnMsg.GamepadUIStyleChanged()
	--lock gamepad thumbsticks while not in gamepad mode to avoid moving the camera
	--(also see OnMsg.XInputInited in config.lua)
	local delta = GetUIStyleGamepad() and -1 or 1
	hr.XBoxLeftThumbLocked = hr.XBoxLeftThumbLocked + delta
	hr.XBoxRightThumbLocked = hr.XBoxRightThumbLocked + delta
end

local oldKeyboardEvent = XDesktop.KeyboardEvent
function XDesktop:KeyboardEvent(event, ...)
	if event == "OnXButtonDown" and not GetUIStyleGamepad() then
		local focus = self.keyboard_focus
		local splash_screen = IsKindOf(focus, "SplashScreen")
		local same_question = IsKindOf(focus, "XContextWindow") and focus.context and rawget(focus.context, "force_ui_style") == "gamepad"
		if not (splash_screen or same_question) then
			--'force_ui_style' is specific for the question box shown in 'ShowControlsSwitchQuestion'
			ShowControlsSwitchQuestion(terminal.desktop)
			return "break"
		end
	end
	
	return oldKeyboardEvent(self, event, ...)
end

function CloseAllMessagesAndQuestions()
	for window,dummy in pairs(g_OpenMessageBoxes) do
		if window.window_state ~= "destroying" then
			window:Close()
		end
	end
end
