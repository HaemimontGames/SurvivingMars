DefineDataInstance("OnScreenHint",
	{
		{ category = "General", id = "title",        name = T{1000016, "Title"},        editor = "text",            default = "", translate = true },
		{ category = "General", id = "text",         name = T{1000145, "Text"},         editor = "multi_line_text", default = "", translate = true },
		{ category = "General", id = "gamepad_text", name = T{4094, "Gamepad text"}, editor = "multi_line_text", default = "", translate = true },
	},
	"[203]Editors/[01]Mars/OnScreenHint Editor"
)

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
	XImage:new({
		Id = "idMinimizedPad",
		Margins = box(0,-455,0,0),
		Image = "UI/Common/hint_pad.tga",
		HAlign = "center",
		VAlign = "top",
	}, min_win)
	XTextButton:new({
		Id = "idMinimized",
		Image = "UI/Common/hint_buton_minimize.tga",
		ColumnsUse = "abaa",
		HAlign = "center",
		LayoutMethod = "VList",
		TextColor = RGBA(244,228,117,255),
		RolloverTextColor = RGBA(244,228,117,255),
		TextFont = "HUDButton",
		Translate = true,
		MouseCursor = "UI/Cursors/Rollover.tga",
		Press = function(this)
			OpenEncyclopedia("HintGameStart")
		end,
	}, min_win)
	self.idMinimized:SetText(T{4248, "Hints"})
	-------- maximized controls
	local maximized_win = XWindow:new({
		Id = "idMaximizedControls",
		FoldWhenHidden = true,
		LayoutMethod = "VList",
	}, self)
	maximized_win:SetVisible(false)
	-------- background images
	local background_win = XWindow:new({
		Margins = box(0,-232,0,0),
		Dock = "box",
		HAlign = "center",
		VAlign = "bottom",
		LayoutMethod = "VList",
	}, maximized_win)
	XImage:new({
		Id = "idHintPad",
		Image = "UI/Common/hint_pad.tga",
	}, background_win)
	XImage:new({
		Id = "idWatermark",
		Margins = box(0,0,0,30),
		Dock = "box",
		HAlign = "center",
		VAlign = "bottom",
		Image = "UI/Common/hint_pad_watermark.tga",
	}, background_win)
	-------- bottom navigation
	local bottom_buttons = XWindow:new({
		HAlign = "center",
	}, background_win)
	XImage:new({
		Id = "idDown",
		HAlign = "center",
		Image = "UI/Common/hint_buton_pad.tga",
	}, bottom_buttons)
	XTextButton:new({
		Id = "idPrev",
		Image = "UI/Common/hint_buton_left.tga",
		HAlign = "left",
		VAlign = "center",
		ColumnsUse = "abaa",
		MouseCursor = "UI/Cursors/Rollover.tga",
		Press = function(this)
			self:ShowPage(self.current_page - 1)
		end,
	}, bottom_buttons)
	XTextButton:new({
		Id = "idNext",
		Image = "UI/Common/hint_buton_right.tga",
		HAlign = "right",
		VAlign = "center",
		ColumnsUse = "abaa",
		MouseCursor = "UI/Cursors/Rollover.tga",
		Press = function(this)
			self:ShowPage(self.current_page + 1)
		end,
	}, bottom_buttons)
	XText:new({
		Id = "idPage",
		Translate = true,
		TextFont = "Help",
		TextColor = RGBA(244,228,117,255),
		HAlign = "center",
		TextHAlign = "center",
		TextVAlign = "center",
		HandleMouse = false,
	}, bottom_buttons)
	-------- title and buttons
	local win = XWindow:new({
		Margins = box(0,20,0,0),
		MinWidth = 710,
		MaxWidth = 710,
		HAlign = "center",
	}, maximized_win)
	XText:new({
		Id = "idTitle",
		Translate = true,
		Dock = "box",
		TextFont = "RolloverTitle",
		TextColor = RGBA(255,188,59,255),
		TextHAlign = "center",
		TextVAlign = "center",
		HandleMouse = false,
	}, win)
	local button_window = XWindow:new({
		LayoutMethod = "HList",
		LayoutHSpacing = 10,
		Dock = "box",
		HAlign = "right",
	}, win)
	XTextButton:new({
		Id = "idEncyclopediaBtn",
		HAlign = "right",
		VAlign = "center",
		Image = "UI/Common/hint_encyclopedia.tga",
		ColumnsUse = "abaa",
		MouseCursor = "UI/Cursors/Rollover.tga",
		Press = function(this)
			CloseXDialog("Resupply")
			OpenEncyclopedia("HintGameStart")
		end,
	}, button_window)
	XTextButton:new({
		Id = "idClose",
		HAlign = "right",
		VAlign = "center",
		Image = "UI/Common/hint_close.tga",
		ColumnsUse = "abaa",
		MouseCursor = "UI/Cursors/Rollover.tga",
		Press = function(this)
			HintDisable(self:CurrentHintId())
		end,
	}, button_window)
	-------- text
	XText:new({
		Id = "idText",
		Translate = true,
		MinHeight = 135,
		MinWidth = 660,
		MaxWidth = 660,
		TextFont = "HelpHint",
		TextColor = RGBA(255,255,255,255),
		HAlign = "center",
		TextHAlign = "center",
		TextVAlign = "center",
		HandleMouse = false,
	}, maximized_win)
	XText:new({
		Id = "idGamepadHint",
		Margins = box(0,0,0,35),
		Translate = true,
		TextFont = "RolloverHint",
		TextColor = RGBA(181,182,192,255),
		HAlign = "center",
		TextHAlign = "center",
		TextVAlign = "center",
		HandleMouse = false,
	}, maximized_win)
	self.idGamepadHint:SetText(T{7586, --[[hint]] "<center><Back> Dismiss hint"})
	
	self.current_page = self.current_page or #g_ShownOnScreenHints
end

function OnScreenHintDlg:Open(...)
	self:RecalculateMargins()
	XDialog.Open(self, ...)
end

function OnScreenHintDlg:RecalculateMargins()
	--This is temporarily and should be removed when implementing InGameInterface with new UI
	self:SetMargins(OnScreenHintDlg.Margins + GetSafeMargins())
end

function OnMsg.SafeAreaMarginsChanged()
	local dlg = GetXDialog("OnScreenHintDlg")
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
		self:SetMinimized(false)
		UpdateHintHighlight(g_Classes[hint_id].highlight_dialog)
		Msg("OnScreenHintChanged", g_ActiveHints[hint_id])
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

local minimizedCtrls = {
	idMinimized = true,
	idMinimizedPad = true,
}
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
	local dlg = GetXDialog("OnScreenHintDlg")
	if not dlg and HintsEnabled and GameState.gameplay then
		dlg = OpenXDialog("OnScreenHintDlg", GetInGameInterface())
	elseif not HintsEnabled then
		CloseXDialog("OnScreenHintDlg")
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

function OnScreenHintDlg:UpdateVisuals()
	--set texts
	local data = DataInstances.OnScreenHint[self:CurrentHintId()]
	if data then
		self.idTitle:SetText(data.title)
		local text = (GetUIStyleGamepad() and data.gamepad_text ~= "") and data.gamepad_text or data.text
		self.idText:SetText(T{text, self.context})
		self.idPage:SetText(Untranslated(string.format("%d/%d", self.current_page, #g_ShownOnScreenHints)))
	end
	--update pages
	if GetUIStyleGamepad() or self.minimized then
		self.idNext:SetVisible(false, "instant")
		self.idPrev:SetVisible(false, "instant")
	else
		local bNext = self.current_page < #g_ShownOnScreenHints
		self.idNext:SetVisible(bNext, "instant")
		local bPrev = self.current_page > 1
		self.idPrev:SetVisible(bPrev, "instant")
	end
	local gamepad = GetUIStyleGamepad()
	local maximized = not self.minimized
	--gamepad ctrls
	self.idGamepadHint:SetVisible(gamepad and maximized)
	--non-gamepad ctrls
	self.idEncyclopediaBtn:SetVisible(not gamepad and maximized)
	self.idClose:SetVisible(not gamepad and maximized)
	self:UpdateMinimizedVisibility()
end

function OnScreenHintDlg:UpdateMinimizedVisibility()
	self.idMinimizedControls:SetVisible(self:IsMinimizedVisible())
end

function OnScreenHintDlg:IsMinimizedVisible()
	return self.minimized and not GetUIStyleGamepad() and self.hidden_minimized == 0
end

function OnMsg.GamepadUIStyleChanged()
	local hintdlg = GetXDialog("OnScreenHintDlg")
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
