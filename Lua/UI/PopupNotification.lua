
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
		local preset = PopupNotificationPresets[preset_name]
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
	Msg("PopupNotificationBegin")
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
			ActionId = "idChoice" .. i,
			ActionName = choice,
			ActionShortcut = tostring(i),
			ActionShortcut2 = choice_count == i and "Escape" or "",
			ActionGamepad = choice_count == i and "ButtonB" or "",
			ActionIcon = image,
			OnAction = function(self, host, source)
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
		local res = XDialog.OnShortcut(self, shortcut, source)
		return not PopupPropagateShortcuts[shortcut] and not shortcut:starts_with("+") and "break" or res
	end
	
	dlg.OnMouseWheelBack = function()
		return "break" --prevent going in and out of overview while a popup is shown
	end
	
	dlg.OnMouseWheelForward = function()
		return "break" --prevent going in and out of overview while a popup is shown
	end
	
	-- register in Dialogs manually
	local id = "PopupNotification"
	Dialogs[id] = dlg
	Dialogs[dlg] = id
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
	local text
	if (voiced_text or "") == "" then
		text = T{body_text, img_tags, context.params, context}
	else
		g_Voice:Play(voiced_text, not "actor", "Voiceover", not "subtitles")
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
	if parent and not GetDialog("PopupNotification") and context and ArePopupsEnabled() then
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
	local dlg = GetDialog("PopupNotification")
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
	CloseDialog("PopupNotification")
end

function OnMsg.NewMap()
	g_PopupQueue = {}
end
