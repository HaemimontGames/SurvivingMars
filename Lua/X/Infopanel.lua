--[[@@@
@class InfopanelObj
class overview...
--]]

DefineClass.InfopanelObj = {
	__parents = { "PropertyObject", "InitDone" },
	ip_template = false,
}

function InfopanelObj:Done()
	if self == SelectedObj then
		SelectObj()
	end
end

function InfopanelObj:GetInfopanelTemplate()
	return self.ip_template
end

function InfopanelObj:GetUIWarning()
end

function InfopanelObj:CreateCheatActions(win)
	local t = self
	local cheats
	while type(t) == "table" do
		for name, value in pairs(t) do
			if type(name) == "string" and type(value) == "function" and name:starts_with("Cheat") then
				cheats = cheats or {}
				cheats[#cheats + 1] = name:sub(6, -1)
			end
		end
		t = getmetatable(t)
		t = t and t.__index
	end
	if not cheats then return IsKindOf(self, "Modifiable") end
	table.sort(cheats)
	win = GetActionsHost(win)
	for _, name in ipairs(cheats or empty_table) do
		win:AddAction(XAction:new{
			ActionId = name,
			ActionToolbar = "cheats",
			OnAction = function(action, host)
				self["Cheat" .. name](self)
			end
		})
	end
	return true
end

function InfopanelObj:GetCheatsRollover()
	if not IsKindOf(self, "Modifiable") then
		return ""
	end
	local descr = {}
	for name, mods in pairs(self.modifications or empty_table) do
		descr[#descr + 1] = string.format("<left>%s<right>%d, %d%%", name, mods.amount, mods.percent - 100)
		for i=1,#mods do
			local mod = mods[i]
			descr[#descr + 1] = string.format("<left>    %d. %s<right>%d, %d%%", i, mod.id, mod.amount, mod.percent)
		end
	end
	return Untranslated(table.concat(descr, '\n'))
end


----- InfopanelDlg

DefineClass.InfopanelDlg = {
	__parents = { "XDrawCacheDialog" },
	RolloverTemplate = "InfopanelRollover",
	RolloverTitle = T{7331, "Infopanel"},
}

if FirstLoad then
	InfopanelSlideIn = true
	InfopanelFocused = false
end

function InfopanelDlg:Open(...)
	self:RecalculateMargins()
	if InfopanelFocused then
		self:SetFocus()
		self:ShowIPRollover()
	end
	InfopanelFocused = false
	if InfopanelSlideIn then
		self:AddInterpolation{
			type = const.intRect,
			duration = 100,
			startRect = box(0, 0, 100, 100),
			endRect = box(400, 0, 500, 100),
			flags = const.intfInverse,
			autoremove = true,
		}
	end
	InfopanelSlideIn = true
	self:CreateThread("update", function(self)
		while true do
			RebuildInfopanel(ResolvePropObj(self.context), 999)
			Sleep(1000)
		end
	end, self)
	return XDialog.Open(self, ...)
end

function InfopanelDlg:RecalculateMargins()
	local margins = GetSafeMargins()
	margins = box(margins:minx(), margins:miny() + 58, margins:maxx(), margins:maxy())
	self:SetMargins(margins)
end

function OnMsg.SafeAreaMarginsChanged()
	local dlg = GetDialog("Infopanel")
	if dlg then
		dlg:RecalculateMargins()
	end
end

function InfopanelDlg:ShowIPRollover()
	local items = {
		T{7557, "<DPad>    Navigates the infopanel sections"},
	}
	if self.context:GetPropertyMetadata("UIWorkRadius") or self.context:GetPropertyMetadata("UIRange") then
		items[#items + 1] = T{7680, "<LB> / <RB>    Decrease / increase service radius"}
	end
	if self.context:IsKindOf("CycleMember") then
		items[#items + 1] = T{7681, "<LB> / <RB>    Previous / next colonist"}
	end
	local intro = T{7558, "<newline><center>Selection specific shortcuts"}
	for _, action in ipairs(XShortcutsTarget.actions) do
		if action.ActionToolbar == "SelectedObj" 
			and action.ActionGamepad ~= "" 
			and action:ActionState(XShortcutsTarget) ~= "disabled"
		then
			items[#items + 1] = intro
			intro = nil
			items[#items + 1] = T{7559, "<GamepadShortcutName(shortcut)>    <name>", shortcut = action.ActionGamepad, name = action.ActionName }
		end
	end
	XCreateRolloverWindow(self, true, true, { RolloverText = table.concat(items, "<newline><left>") })
end

function InfopanelDlg:OnSetFocus()
	LockHRXboxLeftThumb(self.class)
	XDialog.OnSetFocus(self)
end

function InfopanelDlg:OnKillFocus()
	UnlockHRXboxLeftThumb(self.class)
	if self == RolloverControl then
		XDestroyRolloverWindow()
	end
	self.desktop:RemoveKeyboardFocus(self, true)
	XDialog.OnKillFocus(self)
end

function InfopanelDlg:OnMouseEnter(pos)
	if GetUIStyleGamepad() then return end

	local igi = GetInGameInterface()
	local dlg = igi and igi.mode_dialog
	if dlg and dlg:IsKindOf("UnitDirectionModeDialog") and dlg.unit then
		dlg:HideMouseCursorText(pos)
	end	
	return XDialog.OnMouseEnter(self, pos)
end

function InfopanelDlg:OnShortcut(button, source)
	local obj = self.context
	if button == "LeftShoulder" then
		local prop_meta = obj:GetPropertyMetadata("UIWorkRadius") or obj:GetPropertyMetadata("UIRange") or obj:GetPropertyMetadata("DesiredAmountSlider")
		if prop_meta then
			local radius = obj:GetProperty(prop_meta.id)
			radius = Max(prop_meta.min, radius - 1)
			obj:SetProperty(prop_meta.id, radius)
			ObjModified(obj)
		end
		if obj:IsKindOf("CycleMember") then
			obj:CyclePrev(true)
		end
		return "break"
	elseif button == "RightShoulder" then
		local prop_meta = obj:GetPropertyMetadata("UIWorkRadius") or obj:GetPropertyMetadata("UIRange") or obj:GetPropertyMetadata("DesiredAmountSlider")
		if prop_meta then
			local radius = obj:GetProperty(prop_meta.id)
			local max = type(prop_meta.max) == "function" and prop_meta.max(obj) or prop_meta.max
			radius = Min(max, radius + 1)
			obj:SetProperty(prop_meta.id, radius)
			ObjModified(obj)
		end
		if obj:IsKindOf("CycleMember") then
			obj:CycleNext(true)
		end
		return "break"
	elseif button == "RightTrigger" then
		return "break"	
	elseif button == "ButtonB" then
		self:SetFocus(false, true)
		return "break"
	else	
		if IsKindOf(obj,"ResourceOverview") then
			local result = obj:OnShortcut(button, source)
			if result then
				return result
			end
		end
	end
	if XShortcutToRelation[button] then
		XDialog.OnShortcut(self, button)
		return "break"
	end
		
end

----- XSection

DefineClass.XSection = {
	__parents = { "XContextControl" },
	properties = {
		{ category = "General", id = "InternalLeftRightNav", editor = "bool", default = true, }
	}
}

function XSection:Open(...)
	self:ResolveRelativeFocusOrder()
	return XContextControl.Open(self, ...)
end

function XSection:OnActivate(context, gamepad)
end

function XSection:OnAltActivate(context, gamepad)
end

function XSection:OnMouseButtonDown(pos, button)
	if button == "L" then
		self:OnActivate(self.context)
		return "break"
	end
	if button == "R" then
		self:OnAltActivate(self.context)
		return "break"
	end
end

function XSection:OnShortcut(shortcut, source)
	if shortcut == "ButtonA" then
		self:OnActivate(self.context, true)
		return "break"
	end
	if shortcut == "ButtonX" then
		self:OnAltActivate(self.context, true)
		return "break"
	end
	if self.InternalLeftRightNav and (XShortcutToRelation[shortcut] == "left" or XShortcutToRelation[shortcut] == "right") then
		local focus = self.desktop and self.desktop.keyboard_focus
		local order = focus and (focus == self and point(0, 1) or focus:GetFocusOrder())
		focus = self:GetRelativeFocus(order, XShortcutToRelation[shortcut])
		local result = self.RelativeFocusOrder == "new-line" and "break" or nil --because of the Command Center UI
		if focus then
			focus:SetFocus()
			if RolloverControl ~= focus then
				XCreateRolloverWindow(focus, true)
			end
			result = "break"
		end
		if XShortcutToRelation[shortcut] == "left" and not focus and not self:IsFocused() then
			self:SetFocus()
			if RolloverControl ~= self then
				XCreateRolloverWindow(self, true)
			end
			result = "break"
		end
		return result
	end
	if shortcut == "DPadUp" or shortcut == "DPadDown" then
		self:SetFocus()
	end
end


----- globals

function OpenXInfopanel(parent, context, template)
	template = template or IsKindOf(context, "InfopanelObj") and context:GetInfopanelTemplate()
	if not template then
		CloseXInfopanel()
		return
	end
	if not XTemplates[template] then return end
	parent = parent or GetInGameInterface()
	CloseXInfopanel()
	return OpenDialog(template, parent, context, nil, "Infopanel")
end

function CloseXInfopanel()
	CloseDialog("Infopanel")
end

function ReopenSelectionXInfopanel(obj, slide_in)
	local mode, template
	if obj == nil then
		obj = SelectedObj
	end
	if IsValid(obj) then
		if not slide_in then InfopanelSlideIn = false end
		local infopanel = OpenXInfopanel(nil, obj, template)
		if mode and mode ~= infopanel.Mode then
			infopanel:SetMode(mode)
		end
		return
	end
	if not GetDialog("XBuildMenu") then
		CloseXInfopanel()
	end
end

function OnMsg.ReloadLua()
	CreateGameTimeThread(function()
		SelectObj(false)
		CloseInfopanelItems()
	end)
end

function RebuildInfopanel(obj, time)
	if obj == SelectedObj then
		if time == "now" then
			ObjModified(obj)
			local electricity = rawget(obj, "electricity")
			ObjModified(electricity)
			ObjModified(electricity and electricity.grid)
			local water = rawget(obj, "water")
			ObjModified(water) 
			ObjModified(water and water.grid)
			local air = rawget(obj, "air")
			ObjModified(air)
			ObjModified(air and air.grid)
		else
			DelayedCall(time or 20, RebuildInfopanel, obj, "now")
		end
	end
end

function ActivateControlModeDlgAction()
	local dlg = GetInGameInterfaceModeDlg()
	if dlg and dlg:IsKindOf("UnitDirectionModeDialog") then
		local gamepad = GetUIStyleGamepad()
		local cursor_pos = gamepad and GetTerrainGamepadCursor() or GetTerrainCursor()
		local selection = gamepad and (dlg.interaction_obj or SelectionGamepadObj()) or SelectionMouseObj()
		dlg:UpdateInteractionObj(selection, cursor_pos)
		dlg:Interact(cursor_pos)
		SetUnitControlInteractionMode(dlg.unit, false)
	end
end

function IsMassUIModifierPressed()
	return Platform.desktop and terminal.IsKeyPressed(const.vkControl)
end
