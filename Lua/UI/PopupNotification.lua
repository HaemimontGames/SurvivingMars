DefineClass.PopupNotificationPreset = {
	__parents = { "DataInstance" },

	properties = {
		{ category = "General", id = "title",  name = T{1000016, "Title"},     editor = "text", default = "", translate = true},
		{ category = "General", id = "voiced_text",   name = T{6855, "Voiced Text"}, editor = "multi_line_text", default = "", translate = true, context = VoicedContextFromField("actor")},
		{ category = "General", id = "text",   name = T{3793, "Body Text"}, editor = "multi_line_text", default = "", translate = true},
		{ category = "General", id = "log_entry", name = T{6856, "Log Entry"}, editor = "bool", default = false },
		{ category = "General", id = "actor",   name = T{6857, "Voice Actor"}, editor = "combo", items = VoiceActors, default = "narrator" },
		{ category = "General", id = "image",  name = T{3794, "Image"},    editor = "browse", default = "", folder = "UI"},

		{ category = "Choice", id = "choice1",     		      name = T{3785, "Choice 1"},         editor = "multi_line_text", default = "", translate = true, use_registers = true },
		{ category = "Choice", id = "choice1_img", 		      name = T{3807, "Choice 1 Image"},   editor = "browse",          default = "", folder = "UI" },
		{ category = "Choice", id = "choice1_rollover",      name = T{3808, "Rollover 1"},       editor = "multi_line_text", default = "", translate = true, use_registers = true },
		{ category = "Choice", id = "choice1_rollover_title",name = T{3809, "Rollover Title 1"}, editor = "text", default = "", translate = true, use_registers = true },
		{ category = "Choice", id = "choice1_hint1",   name = T{3810, "Rollover 1 Hint 1"},           editor = "text", default = "", translate = true, use_registers = true },
		{ category = "Choice", id = "choice1_hint2",   name = T{3811, "Rollover 1 Hint 2"},           editor = "text", default = "", translate = true, use_registers = true },
		
		{ category = "Choice", id = "choice2",     		      name = T{3786, "Choice 2"},         editor = "multi_line_text", default = "", translate = true, use_registers = true },
		{ category = "Choice", id = "choice2_img", 		      name = T{3812, "Choice 2 Image"},   editor = "browse",          default = "", folder = "UI" },
		{ category = "Choice", id = "choice2_rollover",      name = T{3813, "Rollover 2"},       editor = "multi_line_text", default = "", translate = true, use_registers = true },
		{ category = "Choice", id = "choice2_rollover_title",name = T{3814, "Rollover Title 2"}, editor = "text", default = "", translate = true, use_registers = true },
		{ category = "Choice", id = "choice2_hint1",   name = T{3815, "Rollover 2 Hint 1"},      editor = "text", default = "", translate = true, use_registers = true },
		{ category = "Choice", id = "choice2_hint2",   name = T{3816, "Rollover 2 Hint 2"},      editor = "text", default = "", translate = true, use_registers = true },
	
		{ category = "Choice", id = "choice3",     		name = T{3787, "Choice 3"},       	editor = "multi_line_text", default = "", translate = true, use_registers = true },
		{ category = "Choice", id = "choice3_img", 		name = T{3817, "Choice 3 Image"}, 	editor = "browse",          default = "", folder = "UI" },
		{ category = "Choice", id = "choice3_rollover",      name = T{3818, "Rollover 3"},       editor = "multi_line_text", default = "", translate = true, use_registers = true },
		{ category = "Choice", id = "choice3_rollover_title",name = T{3819, "Rollover Title 3"}, editor = "text", default = "", translate = true, use_registers = true },
		{ category = "Choice", id = "choice3_hint1",   name = T{3820, "Rollover 3 Hint 1"},      editor = "text", default = "", translate = true, use_registers = true },
		{ category = "Choice", id = "choice3_hint2",   name = T{3821, "Rollover 3 Hint 2"},      editor = "text", default = "", translate = true, use_registers = true },
		
		{ category = "Choice", id = "choice4",     		      name = T{3788, "Choice 4"},         editor = "multi_line_text", default = "", translate = true, use_registers = true },
		{ category = "Choice", id = "choice4_img", 		      name = T{3822, "Choice 4 Image"},   editor = "browse",          default = "", folder = "UI" },
		{ category = "Choice", id = "choice4_rollover",      name = T{3823, "Rollover 4"},       editor = "multi_line_text", default = "", translate = true, use_registers = true },
		{ category = "Choice", id = "choice4_rollover_title",name = T{3824, "Rollover Title 4"}, editor = "text", default = "", translate = true, use_registers = true },
		{ category = "Choice", id = "choice4_hint1",   name = T{3825, "Rollover 4 Hint 1"},      editor = "text", default = "", translate = true, use_registers = true },
		{ category = "Choice", id = "choice4_hint2",   name = T{3826, "Rollover 4 Hint 2"},      editor = "text", default = "", translate = true, use_registers = true },
	},	
	
	PropEditorCopy = true,
}

DefineClass.PopupNotification = {
	__parents = {"XMarsMessageBox"},
}

function PopupNotification:Init()
	XCameraLockLayer:new(nil, self)
	XSuppressInputLayer:new(nil, self)
	XPauseLayer:new(nil, self)
end

GlobalVar("LogEntryNumber", 1)

function GetLogEntryNumber()
	local old = LogEntryNumber
	LogEntryNumber = LogEntryNumber + AsyncRand(15) + 1
	return old
end

function _GetPopupNotificationContext(preset_name, params, bPersistable)
	local context = params -- not a deep copy because it brеаks concat Ts
	if preset_name then
		local preset = DataInstances.PopupNotificationPreset[preset_name]
		if preset then
			table.set_defaults(context, preset)
		else
			print("No such popup:", preset_name)
		end
	end
	if context then
		context.persistable = bPersistable
	else
		assert(false, "Wtf, no context?")
		context = {persistable = bPersistable}
	end
	context.popup_notification = true
	return context
end

function PopupNotificationBegin(self)
	-- close different construction or demolish mode dialogs
	if GetInGameInterfaceMode() ~= "overview" then	
		CloseModeDialog()
	else
		GetInGameInterface().mode_dialog:SelectSector()
	end
	--close photo mode if it is open
	AbortPhotoMode()
	--close colony command center if it is open
	CloseCommandCenter()
	HideGamepadCursor("Popup")
	--call this in a thread to handle the case when photo mode or 
	--command center have just been closed and we have lost focus
	CreateRealTimeThread(function()
		self:SetModal()
	end)
end

function PopupNotificationEnd(self, reason)
	ShowGamepadCursor("Popup")
	if g_Voice:IsPlaying() and g_Voice:GetPlayingVoiceType() == "Voiceover" then
		g_Voice:Stop()
	end
	
	if reason == "suspend" then
		return
	end
	
	if self.context.sync_popup_id then
		local idx = table.find(g_PopupQueue, "sync_popup_id", self.context.sync_popup_id)
		if idx then
			table.remove(g_PopupQueue, idx)
		end
		NetSyncEvent("PopupResult", self.context.sync_popup_id, reason)
	elseif self.context.async_signal then
		local idx = table.find(g_PopupQueue, "async_signal", self.context.async_signal)
		if idx then
			table.remove(g_PopupQueue, idx)
		end
		Msg(self.context.async_signal, reason)
	end
	
	CreateRealTimeThread(function()
		PopPopupNotification()
	end)
end

local function OpenPopupNotification(parent, context)
	if not context then
		return
	end
	
	local choices = {}
	for i = 1, 4 do
		local choice = context["choice" .. i]
		choices[i] = (choice and choice ~= "") and T{choice, context.params, context} or nil
		assert(not (i > 1 and choices[i] and not choices[i - 1]))
	end
	if not choices[1] then
		choices[1] = T{6895, "OK"}
	end
	
	local choice_count = #choices
	local actions = {}
	local disabled = context.disabled
	for i = 1, choice_count do
		local choice = choices[i]
		local hint1, hint2 = context["choice" .. i .. "_hint1"], context["choice" .. i .. "_hint2"]
		local hint = hint1 and hint2 and table.concat({hint1, hint2}, "    ") or hint1 or hint2
		
		local prop_name = "choice" .. i .. "_img"
		local image = context[prop_name] and context[prop_name] ~= "" and context[prop_name] or (choice_count == 1 and "UI/Icons/message_ok.tga") or "UI/Icons/message_" .. i .. ".tga"
		actions[#actions + 1] = XAction:new({
			ActionName = choice,
			ActionShortcut = tostring(i),
			ActionShortcut2 = choice_count == i and "Escape" or "",
			ActionGamepad = choice_count == i and "ButtonB" or "",
			ActionIcon = image,
			OnAction = function(self, host, source, toggled)
				host:Close(i)
			end,
			ActionState = function(host)
				return disabled and disabled[i] and "disabled"
			end,
			RolloverTitle = context["choice" .. i .. "_rollover_title"] or "",
			RolloverText = context["choice" .. i .. "_rollover"] or "",
			RolloverHint = hint or "",
			RolloverHintGamepad = context["choice" .. i .. "_hint2"] or "",
		})
	end
	
	local dlg = PopupNotification:new({actions = actions}, parent, context)
	dlg.OnShortcut = function(self, shortcut, source)
		if shortcut == "ButtonB" and choice_count == 1 then
			self:Close(1)
			return "break"
		end
		local res = XDialog.OnShortcut(self, shortcut, source)
		return not PopupPropagateShortcuts[shortcut] and not shortcut:starts_with("+") and "break" or res
	end
	
	dlg.OnMouseWheelBack = function()
		return "break" --prevent going in and out of overview while a popup is shown
	end
	
	dlg.OnMouseWheelForward = function()
		return "break" --prevent going in and out of overview while a popup is shown
	end
	
	-- register in XDialogs manually
	local id = "PopupNotification"
	XDialogs[id] = dlg
	XDialogs[dlg] = id
	dlg:Open()
	dlg:AddOpenReason()
	return dlg
end

function SetPopupNotificationText(self, context)
	local img_tags = {
		image1 = context.image1 and Untranslated("<image " .. context.image1 .. ">") or nil,
		image2 = context.image2 and Untranslated("<image " .. context.image2 .. ">") or nil,
		image3 = context.image3 and Untranslated("<image " .. context.image3 .. ">") or nil,
		image4 = context.image4 and Untranslated("<image " .. context.image4 .. ">") or nil,
	}
	local voiced_text = context.voiced_text
	local body_text = context.params and context.params.override_popup_text or context.text
	body_text = T{body_text, context.params, context}
	if GetUIStyleGamepad() then
		if context.x_voiced_text and context.x_voiced_text ~= "" then
			voiced_text = context.x_voiced_text
		end
		if context.x_text and context.x_text ~= "" then
			body_text = T{ context.x_text, context.params, context}
		end
	end
	local text
	if not voiced_text then
		text = T{body_text, img_tags, context.params, context}
	else
		g_Voice:Play(voiced_text, not "actor", "Voiceover", not "subtitles")
		if Platform.developer then
			local vtext = TDevModeGetEnglishText(voiced_text)
			assert(not vtext:istagged(), "Voiced text can not containg tags! '" .. vtext .. "'")
		end
		if not body_text then
			text = voiced_text
		else
			text = voiced_text .. "\n\n" .. T{body_text, img_tags, context.params, context}
		end
	end
	if context.log_entry then
		text = T{6896, "Mission Control, Log #<number><newline><newline>", number = GetLogEntryNumber() } .. text
	end
	self.idDescription:SetText(text)
end

function PopPopupNotification(parent)
	local context = g_PopupQueue[1]
	parent = parent or (context and context.parent)
	parent = parent and parent.window_state ~= "destroying" and parent or GetInGameInterface()
	if parent and not GetXDialog("PopupNotification") and context and ArePopupsEnabled() then
		OpenPopupNotification(parent, context)
	end
end

if FirstLoad then
	g_PopupQueue = {}
	SyncPopupId = 0
	g_PopupsSuspended = {}
end

function ShowPopupNotification(preset, params, bPersistable, parent)
	assert(not bPersistable) -- we don't support these
	local context = _GetPopupNotificationContext(preset, params or {}, bPersistable)
	context.parent = parent
	if bPersistable then
		SyncPopupId = SyncPopupId + 1
		context.sync_popup_id = SyncPopupId
	else
		context.async_signal = {}
	end
	table.insert(g_PopupQueue, context)
	PopPopupNotification(parent)
	return context.sync_popup_id, context.async_signal
end

function WaitPopupNotification(preset, params, bPersistable, parent)
	assert(not bPersistable or IsGameTimeThread(), "This will desync the game.")
	local sync_popup_id, async_signal = ShowPopupNotification(preset, params, bPersistable, parent)
	local _, res
	if sync_popup_id then
		_, res = WaitMsg("PopupNotification" .. sync_popup_id)
	else
		_, res = WaitMsg(async_signal)
	end
	return res
end

--[[@@@
Displays a custom popup notification and waits for the players response.
This function should always be called from within a GameTime thread.
@function int choice WaitCustomPopupNotification(string title, string text, table choices, window parent)
@param string title - title of the popup.
@param string text - body text of the popup.
@param table choices - array of up to four choices for the user.
@param window parent - parent window (this is optional only ingame).
@result int choice - The users choice.
]]
function WaitCustomPopupNotification(title, text, choices, parent)
	local params = { title = title, text = text }
	for i,choice in ipairs(choices) do
		params["choice"..i] = choice
	end
	
	return WaitPopupNotification(false, params, false, parent)
end

function PopupNotificationSuspend(reason)
	g_PopupsSuspended[reason] = true
	local dlg = GetXDialog("PopupNotification")
	if dlg then
		dlg:Close("suspend")
	end
end

function PopupNotificationResume(reason)
	g_PopupsSuspended[reason] = nil
	PopPopupNotification()
end

function ArePopupsEnabled()
	return (g_PopupQueue[1] and g_PopupQueue[1].async_signal or (not IsPaused() or GetTimeFactor() > 0)) and not next(g_PopupsSuspended)
end

OnMsg.LoadGame = PopupNotificationResume
OnMsg.Resume = PopupNotificationResume

function OnMsg.PersistSave(data)
	local sync_popups = {}
	for i = 1, #g_PopupQueue do
		if g_PopupQueue[i].sync_popup_id then
			sync_popups[#sync_popups + 1] = g_PopupQueue[i]
		end
	end
	data.g_PopupQueue = sync_popups
end

function OnMsg.PersistLoad(data)
	g_PopupQueue = data.g_PopupQueue or {}
end

function OnMsg.ChangeMap()
	CloseXDialog("PopupNotification")
end

function OnMsg.NewMap()
	g_PopupQueue = {}
end

-- usually called when desktop is resized, so call in thread, in order to prevent accessing children which are being deleted
function PlaceWatermarkLines(parent, container, pad, org_watermark, id)
	id = id or "idDescrWatermark"
	for i = #container, 1, -1 do
		container[i]:delete()
		table.remove(container, i)
	end
	local num = pad:GetHeight() / org_watermark:GetHeight() + 1
	local pos = pad:GetPos()
	local step = point(0, org_watermark:GetHeight())
	for i = 1, num do
		local ctrl = Image:new(parent)
		ctrl:SetId(id .. i)
		ctrl:SetSize(org_watermark:GetSize())
		ctrl:SetImage(org_watermark:GetImage())
		ctrl.ZOrder = org_watermark.ZOrder
		ctrl:SetPos(pos)
		ctrl.ParentListAutoresize = false
		ctrl.HandleMouse = false
		ctrl.clip_ctrl = pad
		pos = pos + step
		container[i] = ctrl
	end
end
