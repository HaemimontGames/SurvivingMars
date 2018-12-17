local function TutorialsCombo()
	local combo = { }
	for name in pairs(g_TutorialScenarios) do
		table.insert(combo, name)
	end
	table.sort(combo)
	table.insert(combo, 1, "none")
	
	return combo
end

DefineClass.OnScreenHint = {
	__parents = {"Preset"},
	properties = {
		{  id = "save_in", editor = false,},
		{ category = "General", id = "title",        name = T(1000016, "Title"),        editor = "text",            default = "", translate = true },
		{ category = "General", id = "voiced_text",  name = T(6855, "Voiced Text"),        editor = "multi_line_text", default = "", translate = true, context = VoicedContextFromField("actor")},
		{ category = "General", id = "actor",        name = T(6857, "Voice Actor"),        editor = "combo",           default = "narrator", items = VoiceActors },
		{ category = "General", id = "text",         name = T(1000145, "Text"),         editor = "multi_line_text", default = "", translate = true },
		{ category = "General", id = "gamepad_text", name = T(4094, "Gamepad text"), editor = "multi_line_text", default = "", translate = true },
		{ category = "General", id = "tutorial",     name = T(8982, "Tutorial"),                 editor = "combo",           default = "none", items = TutorialsCombo },
		{ category = "Misc", id = "encyclopedia_image",     name = T(161, "Encyclopedia Image"),         editor = "browse",           default = "", folder = "UI" },
		{ cateogry = "Misc", id = "video",           name = T(1000124, "Video"),              editor = "browse", folder = "Movies", filter = "Video files|*.ivf", default = "" },
		{ cateogry = "Misc", id = "video_durango",      name = T(11832, "Xbox Video"),         editor = "browse", folder = "Movies", filter = "Video files|*.ivf", default = "" },
		{ cateogry = "Misc", id = "video_ps4",       name = T(11833, "PS4 Video"),          editor = "browse", folder = "Movies", filter = "Video files|*.ivf", default = "" },
	},

	GlobalMap = "OnScreenHintPresets",
	EditorMenubarName = "On-Screen Hints",
	EditorMenubar = "Editors.GameUI",
	HasSortKey = true,
}

function OnScreenHint:GetVideoFilename()
	if GetUIStyleGamepad() then
		return ShouldShowPS4Images() and self.video_ps4 or self.video_durango
	else
		return self.video
	end
end

GlobalVar("g_ShownOnScreenHints", {})

DefineClass.OnScreenHintDlg =
{
	__parents = { "XDialog" },
	ZOrder = 100,
	FocusOnOpen = "",
	HAlign = "center",
	VAlign = "top",
	
	hidden_minimized = 0, --if the minimized state is currently hidden (number, to immitate a stack)
	minimized = true,
	current_page = false,
}

function OnScreenHintDlg:Init()
	--------- minimized controls
	local min_win = XWindow:new({
		Id = "idMinimizedControls",
		FoldWhenHidden = true,
		LayoutMethod = "VList",
	}, self)
	min_win:SetVisible(false)
	XTextButton:new({
		Id = "idMinimized",
		Image = "UI/CommonNew/hint_small.tga",
		ColumnsUse = "abaa",
		HAlign = "center",
		LayoutMethod = "VList",
		MouseCursor = "UI/Cursors/Rollover.tga",
		Press = function(this)
			OpenEncyclopedia(LastDisabledHint or "HintGameStart")
		end,
	}, min_win)
	XText:new({
		Id = "idActualText",
		Margins = box(0, 5, 0, 0),
		HAlign = "center",
		TextStyle = "OnScreenHintTitle",
		Translate = true,
	}, self.idMinimized)
	self.idMinimized.idActualText:SetText(GetUIStyleGamepad() and T(8983, "<Back> Hints") or T(4248, "Hints"))
	-------- maximized controls
	local maximized_win = XFrame:new({
		Id = "idMaximizedControls",
		Margins = box(0, 5, 0, 0),
		MinWidth = 550,
		Image = "UI/CommonNew/hint_multiple.tga",
		FrameBox = box(45, 45, 45, 60),
		FoldWhenHidden = true,
		IdNode = false,
		HandleMouse = true,
	}, self)
	maximized_win:SetVisible(false)
	-------- bottom navigation
	local bottom_buttons = XWindow:new({
		Dock = "bottom",
	}, maximized_win)
	XTextButton:new({
		Id = "idPrev",
		Image = "UI/CommonNew/hint_button_left.tga",
		HAlign = "left",
		ColumnsUse = "abaa",
		MouseCursor = "UI/Cursors/Rollover.tga",
		Press = function(this)
			self:ShowPage(self.current_page - 1)
		end,
	}, bottom_buttons)
	XTextButton:new({
		Id = "idNext",
		Image = "UI/CommonNew/hint_button_right.tga",
		HAlign = "right",
		ColumnsUse = "abaa",
		MouseCursor = "UI/Cursors/Rollover.tga",
		Press = function(this)
			self:ShowPage(self.current_page + 1)
		end,
	}, bottom_buttons)
	XText:new({
		Id = "idPage",
		Translate = true,
		TextStyle = "OnScreenHintPage",
		HAlign = "center",
		TextHAlign = "center",
		TextVAlign = "center",
		HandleMouse = false,
	}, bottom_buttons)
	-------- gamepad button
	local gamepad_close_win = XWindow:new({
		Id = "idGamepadDismiss",
		Dock = "bottom",
		Margins = box(25, 0, 25, 0),
		HandleMouse = false,
		FoldWhenHidden = true,
	}, maximized_win)
	local transparent = RGBA(0, 0, 0, 0)
	local gamepad_close_btn = XButton:new({
		Id = "idGamepadDismissButton",
		IdNode = false,
		HAlign = "center",
		Padding = box(0, 0, 0, 0),
		MouseCursor = "UI/Cursors/Rollover.tga",
		OnPress = function(this)
			HintDisable(self:CurrentHintId())
		end,
		Background = transparent,
		BorderColor = transparent,
		DisabledBorderColor = transparent,
		FocusedBackground = transparent,
		FocusedBorderColor = transparent,
		PressedBackground = transparent,
		RolloverBackground = transparent,
	}, gamepad_close_win)
	XText:new({
		Id = "idGamepadHint",
		Translate = true,
		TextStyle = "OnScreenHintTitle",
		HandleMouse = false,
	}, gamepad_close_btn)
	self.idGamepadHint:SetText(T(7586, --[[hint]] "<Back> Dismiss hint"))
	-------- title and buttons
	local win = XWindow:new({
		Dock = "top",
	}, maximized_win)
	XText:new({
		Id = "idTitle",
		Margins = box(45, 0, 15, 0),
		VAlign = "top",
		MinHeight = 45,
		MaxHeight = 45,
		Translate = true,
		TextStyle = "OnScreenHintTitle",
		TextHAlign = "center",
		TextVAlign = "center",
		HandleMouse = false,
	}, win)
	local button_window = XWindow:new({
		LayoutMethod = "HList",
		Margins = box(0, -5, 45 - 10, 0),
		LayoutHSpacing = -15,
		Dock = "right",
		HAlign = "right",
	}, win)
	XTextButton:new({
		Id = "idEncyclopediaBtn",
		Image = "UI/CommonNew/encyclopedia_button.tga",
		ColumnsUse = "abaa",
		MouseCursor = "UI/Cursors/Rollover.tga",
		Press = function(this)
			CloseDialog("Resupply")
			OpenEncyclopedia("HintGameStart")
		end,
	}, button_window)
	XTextButton:new({
		Id = "idClose",
		Image = "UI/CommonNew/X.tga",
		ColumnsUse = "abaa",
		MouseCursor = "UI/Cursors/Rollover.tga",
		Press = function(this)
			HintDisable(self:CurrentHintId())
		end,
	}, button_window)
	-------- text
	local content = XWindow:new({
		Dock = "box",
		Padding = box(25, 15, 25, 0),
	}, maximized_win)
	XText:new({
		Id = "idText",
		Translate = true,
		MinHeight = 70,
		MaxWidth = 600,
		TextStyle = "OnScreenHintText",
		HAlign = "center",
		TextHAlign = "center",
		TextVAlign = "center",
		HandleMouse = false,
	}, content)
	XVideo:new({
		Id = "idVideo",
		Dock = "right",
		VAlign = "center",
		FoldWhenHidden = true,
		Margins = box(20, 0, 0, 0),
		MinWidth = 360,
		MaxWidth = 360,
		MinHeight = 270,
		MaxHeight = 270,
		Looping = true,
	}, content)
	
	self.current_page = self.current_page or #g_ShownOnScreenHints
	self:UpdateVisuals()
end

function OnScreenHintDlg:Open(...)
	self:RecalculateMargins()
	XDialog.Open(self, ...)
end

function OnScreenHintDlg:RecalculateMargins()
	--This is temporarily and should be removed when implementing InGameInterface with new UI
	local margins = OnScreenHintDlg.Margins + GetSafeMargins()
	local infobar = GetDialog("Infobar")
	if infobar then
		local left, top, right, bottom = margins:xyxy()
		local infobar_offset = infobar.PadHeight
		margins = box(left, top + infobar_offset, right, bottom)
	end
	self:SetMargins(margins)
end

function OnMsg.SafeAreaMarginsChanged()
	local dlg = GetDialog("OnScreenHintDlg")
	if dlg then
		dlg:RecalculateMargins()
	end
end

function OnScreenHintDlg:CurrentHintId()
	return g_ShownOnScreenHints[self.current_page]
end

function OnScreenHintDlg:ShowHint(hint_id)
	local page = table.find(g_ShownOnScreenHints, hind_id)
	if not page then
		return
	end
	
	self:ShowPage(page)
	return true
end

function OnScreenHintDlg:ShowPage(page)
	page = Clamp(page, 1, #g_ShownOnScreenHints)
	self.current_page = page
	
	local hint_id = self:CurrentHintId()
	if hint_id then
		local hint_obj = g_ActiveHints[hint_id]
		self.context = hint_obj
		self:SetMinimized(false)
		UpdateHintHighlight(g_Classes[hint_id].highlight_dialog)
		Msg("OnScreenHintChanged", hint_obj)
	else--if not hint_id then
		self:SetMinimized(true)
		self.current_page = 0
		Msg("OnScreenHintChanged", false)
	end
end

function OnScreenHintDlg:AddHint(hint_id)
	if table.find(g_ShownOnScreenHints, hint_id) then
		return
	end
	local new_page = #g_ShownOnScreenHints + 1
	g_ShownOnScreenHints[new_page] = hint_id
	self:ShowPage(new_page)
end

function OnScreenHintDlg:DismissCurrentHint()
	return HintDisable(self:CurrentHintId())
end

function OnScreenHintDlg:RemoveHint(hint_id)
	if not table.remove_entry(g_ShownOnScreenHints, hint_id) then
		return false
	end
	self:ShowPage(self.current_page)
	return true
end

function OnScreenHintDlg:RemoveMultipleHints(hint_ids_set)
	local new_hints = {}
		
	for i,hint_id in ipairs(g_ShownOnScreenHints) do
		if not hint_ids_set[hint_id] then
			new_hints[#new_hints + 1] = hint_id
		end
	end
	
	g_ShownOnScreenHints = new_hints
	self:ShowPage(self.current_page)
	return true
end

function OnScreenHintDlg:SetMinimized(minimized)
	if self.minimized == minimized then
		self:UpdateVisuals()
		return
	end
	self.minimized = minimized
	if self:IsMinimizedVisible() then
		self.idMinimizedControls:SetVisible(true, "instant")
	elseif not minimized then
		self.idMaximizedControls:SetVisible(true, "instant")
	end
	self:DeleteThread("HideMinimized")
	self:CreateThread("HideMinimized", function(self)
		local minimized = self.minimized
		local visible_minimized = self:IsMinimizedVisible()
		local duration = const.InterfaceAnimDuration
		local ctrls = {"idMinimizedControls", "idMaximizedControls"}
		for i,id in ipairs(ctrls) do
			local ctrl = self[id]
			local show_this_ctrl = not minimized
			if ctrl.Id == "idMinimizedControls" and visible_minimized then
				show_this_ctrl = minimized
			end
			
			ctrl:AddInterpolation{
				id = "move",
				type = const.intRect,
				duration = duration,
				startRect = ctrl.box,
				endRect = box(ctrl.box:minx(), -ctrl.box:sizey(), ctrl.box:maxx(), 0),
				flags = show_this_ctrl and const.intfInverse or 0,
				autoremove = true,
			}
			if show_this_ctrl then
				ctrl:SetVisible(true, "instant")
			end
		end
		Sleep(duration)
		if not minimized then
			self.idMinimizedControls:SetVisible(false, "instant")
		else
			self.idMaximizedControls:SetVisible(false, "instant")
		end
	end, self)
	
	self:UpdateVisuals()
end

function OnScreenHintDlg:SetHiddenMinimized(hidden)
	self.hidden_minimized = self.hidden_minimized + (hidden and 1 or -1)
	--each 'set hidden' call must correspond to exactly one 'set visible' call
	assert(self.hidden_minimized >= 0)
	self:UpdateMinimizedVisibility()
end

------------------------------------------------------------------------------------

function GetOnScreenHintDlg()
	local dlg = GetDialog("OnScreenHintDlg")
	if not dlg and (HintsEnabled or g_Tutorial) and GameState.gameplay then
		dlg = OpenDialog("OnScreenHintDlg", GetInGameInterface())
	elseif not HintsEnabled and not g_Tutorial then
		CloseDialog("OnScreenHintDlg")
		return
	end
	
	return dlg
end

function AddOnScreenHint(hint)
	local dlg = GetOnScreenHintDlg()
	if dlg then
		local hint_id = type(hint) == "string" and hint or hint.class
		dlg:AddHint(hint_id)
	end
end

function RemoveOnScreenHint(hint)
	local dlg = GetOnScreenHintDlg()
	if dlg then
		local hint_id = type(hint) == "string" and hint or hint.class
		dlg:RemoveHint(hint_id)
	end
end

function RemoveMultipleOnScreenHints(hint_ids_set)
	local dlg = GetOnScreenHintDlg()
	if dlg then dlg:RemoveMultipleHints(hint_ids_set) end
end

function DismissCurrentOnScreenHint()
	local dlg = GetOnScreenHintDlg()
	if dlg and not dlg.minimized then
		dlg:DismissCurrentHint()
		return true
	end
end

function UpdateHintHighlight(dialog_id)
	if not dialog_id then return end
	
	--dialog_id can either be a string (some ID) or a table of dialog IDs
	local dialog_id = type(dialog_id)=="table" and dialog_id or {dialog_id} 
	
	for i=1, #dialog_id do
		local highlight_dialog = GetDialog(dialog_id[i])
		if highlight_dialog and highlight_dialog:HasMember("UpdateHintHighlight") then
			highlight_dialog:UpdateHintHighlight()
		end
	end	
end

function UpdateOnScreenHintDlg()
	local dlg = GetOnScreenHintDlg()
	if dlg then
		dlg:ShowPage(dlg.current_page)
	end
end

ShowLastHint = UpdateOnScreenHintDlg

------------------------------------------------------------------------------------

function OnScreenHintDlg:OnSetFocus()
	--this prevents focusing this dlg in the research dlg (conflicting old/new UI)
	self:SetFocus(false)
end

function OnScreenHintDlg:OnXButtonDown(button, controller_id)
	--We should never be here (see InterfaceModeDialog:OnXButtonDown), but just in case
	assert(false, "Invalid focus on OnScreenHintDlg")
	if button == "Back" then
		self.idClose:Press()
		return "break"
	elseif button == "ButtonB" then
		self:SetFocus(false)
		return "break"
	end
	
	return "break"
end

function OnScreenHintDlg:GetVideoFilename(hint)
	hint = hint or OnScreenHintPresets[self:CurrentHintId()]
	return hint:GetVideoFilename()
end

function OnScreenHintDlg:UpdateVisuals()
	local gamepad = GetUIStyleGamepad()
	local data = OnScreenHintPresets[self:CurrentHintId()]
	--set texts
	local video
	if data then
		self.idTitle:SetText(data.title)
		local body_text = (gamepad and data.gamepad_text ~= "") and data.gamepad_text or data.text
		body_text = T{body_text, self.context}
		local text = (data.voiced_text ~= "") and (data.voiced_text.."\n\n"..body_text) or body_text
		self.idText:SetText(T{text, self.context})
		self.idPage:SetText(Untranslated(string.format("%d/%d", self.current_page, #g_ShownOnScreenHints)))
		self.idGamepadHint:SetText(self.idGamepadHint:GetText())
		video = self:GetVideoFilename(data)
	end
	if video ~= "" then
		self.idText:SetMaxWidth(400)
		self.idText:SetTextHAlign("left")
		self.idVideo:SetVisible(true)
		self.idVideo.resolution = point(512, 384)
		if video ~= self.idVideo:GetFileName() or self.idVideo.state ~= "playing" then
			self.idVideo:SetFileName(video)
			self.idVideo:Play()
		end
	else
		self.idText:SetMaxWidth(600)
		self.idText:SetTextHAlign("center")
		self.idVideo:Stop()
		self.idVideo:SetVisible(false)
	end
	--update pages
	if gamepad or self.minimized then
		self.idNext:SetVisible(false, "instant")
		self.idPrev:SetVisible(false, "instant")
	else
		local bNext = self.current_page < #g_ShownOnScreenHints
		self.idNext:SetVisible(bNext, "instant")
		local bPrev = self.current_page > 1
		self.idPrev:SetVisible(bPrev, "instant")
	end
	local maximized = not self.minimized
	--gamepad ctrls
	self.idGamepadHint:SetVisible(gamepad and maximized)
	self.idGamepadDismiss:SetVisible(gamepad and maximized)
	--non-gamepad ctrls
	self.idEncyclopediaBtn:SetVisible(not gamepad and maximized)
	self.idClose:SetVisible(not gamepad and maximized)
	self:UpdateMinimizedVisibility()
	self.idMinimized.idActualText:SetText(gamepad and T(8983, "<Back> Hints") or T(4248, "Hints"))
end

function OnScreenHintDlg:UpdateMinimizedVisibility()
	self.idMinimizedControls:SetVisible(self:IsMinimizedVisible())
end

function OnScreenHintDlg:IsMinimizedVisible()
	return self.minimized and self.hidden_minimized == 0
end

function OnMsg.GamepadUIStyleChanged()
	local hintdlg = GetDialog("OnScreenHintDlg")
	if hintdlg then
		hintdlg:UpdateVisuals()
	end
end

function OnMsg.OnControllerTypeChanged(controller_type)
	local hintdlg = GetDialog("OnScreenHintDlg")
	if hintdlg then
		hintdlg:UpdateVisuals()
	end
end

function HintHighlightIconAnimation(element)
	local origianl_size = element.box
	local small_size = origianl_size:grow(-1)
	local big_size = origianl_size:grow(1)
	while true do
		element:AddInterpolation{
			id = "fadein",
			type = const.intAlpha,
			startValue = 0,
			endValue = 255,
			duration = 150,
			autoremove = true,
		}
		element:AddInterpolation{
			id = "zoomin",
			type = const.intRect,
			startRect = small_size,
			endRect = big_size,
			duration = 150,
		}
		Sleep(200)
		element:AddInterpolation{
			id = "fadeout",
			type = const.intAlpha,
			startValue = 255,
			endValue = 0,
			duration = 1000,
			autoremove = true,
		}
		element:AddInterpolation{
			id = "zoomout",
			type = const.intRect,
			startRect = big_size,
			endRect = small_size,
			duration = 1000,
		}
		Sleep(1000)
	end
end
