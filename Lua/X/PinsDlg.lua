
DefineClass.PinsDlg = {
	__parents = {"XDrawCacheDialog"},
	
	HAlign = "center",
	VAlign = "bottom",
	LayoutMethod = "HOverlappingList",
	FocusOnOpen = "",
	LayoutHSpacing = 10,
	Margins = box(100, 0, 100, 50),
}

function PinsDlg:Open(...)
	self:RecalculateMargins()
	local gamepad_image = XTemplateSpawn("XImage", self)
	gamepad_image:SetId("idGamepadImage")
	gamepad_image:SetHAlign("left")
	gamepad_image:SetImage(GetPlatformSpecificImagePath("RB"))
	gamepad_image:SetImageScale(point(800,800))
	gamepad_image:SetMargins(box(0,0,10,0))
	local gamepad = GetUIStyleGamepad()
	gamepad_image:SetVisible(gamepad)
	gamepad_image:SetDock(gamepad and "left" or "ignore")
	
	for _, obj in ipairs(g_PinnedObjs) do
		self:Pin(obj, "open")
	end
	self:CreateThread("AutoUpdate", function(self)
		--this 1ms delay is here to quickly update the dialog after the first objects have been added
		Sleep(1)
		while true do
			for _, obj in ipairs(g_PinnedObjs) do
				ObjModified(obj)
			end
			Sleep(1000)
		end
	end, self)
	XDialog.Open(self, ...)
end

function PinsDlg:Pin(obj, on_open)
	local button = XTemplateSpawn("PinButton", self, obj)
	self:InitPinButton(button)
	if not on_open then
		button:Open()
		self:ResolveRelativeFocusOrder()
		self:UpdateGamepadHint()
	end
end

function PinsDlg:Unpin(obj)
	for _, win in ipairs(self) do
		if not win.Dock and win.context == obj then
			win:Close()
			self:ResolveRelativeFocusOrder()
			self:UpdateGamepadHint()
			return
		end
	end
end

function PinsDlg:RecalculateMargins()
	--This is temporarily and should be removed when implementing InGameInterface with new UI
	self:SetMargins(PinsDlg.Margins + GetSafeMargins())
end

function OnMsg.SafeAreaMarginsChanged()
	local pins_dlg = GetXDialog("PinsDlg")
	if pins_dlg then
		pins_dlg:RecalculateMargins()
	end
end

function PinsDlg:OnSetFocus()
	self:UpdateGamepadHint()
	XDialog.OnSetFocus(self)
end

function PinsDlg:OnKillFocus()
	self:UpdateGamepadHint()
	XDialog.OnKillFocus(self)
end

function PinsDlg:UpdateGamepadHint()
	if #self <= 1 or not GetUIStyleGamepad() then
		self.idGamepadImage:SetVisible(false)
		return
	end
	
	local focus = self.desktop:GetKeyboardFocus()
	if IsKindOfClasses(focus, "SelectionModeDialog", "OverviewModeDialog", "InGameInterface") then
		self.idGamepadImage:SetVisible(true)
	else
		self.idGamepadImage:SetVisible(false)
	end
end

function PinsDlg:OnXButtonDown(button)
	if button == "ButtonB" then
		self:SetFocus(false, true)
		return "break"
	elseif XShortcutToRelation[button] then
		self:OnShortcut(button)
		return "break"
	elseif button == "LeftShoulder" then
		self:OnShortcut("DPadLeft")
		return "break"
	elseif button == "RightShoulder" then
		self:OnShortcut("DPadRight")
		return "break"
	elseif button == "RightTrigger" then
		if SelectedObj then
			self:SetFocus(false, true)
			return "continue"
		end
	end
end

local blocked_xbox_shortcuts = {
	["LeftThumbLeft"] = true,
	["LeftThumbDownLeft"] = true,
	["LeftThumbUpLeft"] = true,
	["LeftThumbRight"] = true,
	["LeftThumbDownRight"] = true,
	["LeftThumbUpRight"] = true,
	["LeftThumbUp"] = true,
	["LeftThumbDown"] = true,
}

function PinsDlg:OnMouseEnter(pos)
	if GetUIStyleGamepad() then return end
	local igi = GetInGameInterface()
	local dlg = igi and igi.mode_dialog
	if dlg and dlg:IsKindOf("UnitDirectionModeDialog") and dlg.unit then
		dlg:HideMouseCursorText(pos)
	end	
	return XDialog.OnMouseEnter(self, pos)
end

function PinsDlg:OnShortcut(shortcut, source)
	if shortcut == "Escape" then
		self:SetFocus(false, true)
		return "break"
	elseif shortcut == "DPadLeft" then
		--implements looping around the ends of the pins dlg
		
		local focus = self.desktop:GetKeyboardFocus()
		if focus:IsWithin(self) and focus:GetFocusOrder():x() == 1 then
			self[#self]:SetFocus(true)
			return "break"
		end
	elseif shortcut == "DPadRight" then
		--implements looping around the ends of the pins dlg
		
		local focus = self.desktop:GetKeyboardFocus()
		--minus 1 because the first item is the gamepad hint icon
		--thus focus orders of pins start from 1 and end at #self-1
		if focus:IsWithin(self) and focus:GetFocusOrder():x() == (#self - 1) then
			self[2]:SetFocus(true) --2, for the same reason as above
			return "break"
		end
	elseif blocked_xbox_shortcuts[shortcut] then
		--block thumbstick from navigating the pins
		return "break"
	end
	return XDialog.OnShortcut(self, shortcut, source)
end

local command_center_filter = {
	class = "DroneControl",
	hexradius = const.CommandCenterMaxRadius,
	filter = function (center, sphere)
		return HexAxialDistance(sphere, center) <= center.work_radius
	end
}
function PinsDlg:GetPinConditionImage(obj)
	if not obj then return end
	local img
	if obj:IsKindOf("SupplyRocket") then
		img = obj.pin_status_img
	elseif obj:HasMember("ui_working") and not obj.ui_working then
		img = "UI/Icons/pin_turn_off.tga"
	elseif obj:IsKindOf("Demolishable") and obj.demolishing then
		img = "UI/Icons/pin_salvage.tga"
	elseif obj:HasMember("IsMalfunctioned") and obj:IsMalfunctioned() then
		img = "UI/Icons/pin_malfunction.tga"
	elseif obj:IsKindOf("ElectricityConsumer") and obj:ShouldShowNoElectricitySign() then
		img = "UI/Icons/pin_power.tga"
	elseif obj:IsKindOf("LifeSupportConsumer") and obj:ShouldShowNoAirSign() then
		img = "UI/Icons/pin_oxygen.tga"
	elseif obj:IsKindOf("LifeSupportConsumer") and obj:ShouldShowNoWaterSign() then
		img = "UI/Icons/pin_water.tga"
	elseif obj:IsKindOf("BaseRover") then
		if obj.goto_target then
			img = "UI/Icons/pin_moving.tga"
		elseif obj.command == "Idle" or obj.command == "LoadingComplete" then
			img = "UI/Icons/pin_idle.tga"
		elseif obj:IsLowBattery() then
			img = "UI/Icons/pin_power.tga"
		elseif obj.command == "Analyze" then
			img = "UI/Icons/pin_scan.tga"
		elseif obj.command == "DumpCargo" or obj.command == "Unload" then
			img = "UI/Icons/pin_unload.tga"
		elseif obj.command == "PickupResource" or obj.command == "Load" then
			img = "UI/Icons/pin_load.tga"
		end
	elseif obj:IsKindOf("Drone") and obj.command == "Idle" then
		img = "UI/Icons/pin_idle.tga"
	elseif IsKindOf(obj, "Building") and obj:ShouldShowNoCCSign() then
		img = "UI/Icons/pin_drone.tga"
	elseif obj:HasMember("working") and not obj.working then
		img = "UI/Icons/pin_not_working.tga"
	end
	return img
end

local function resolve_pin_rollover_hint(obj, hint_property)
	local hint = obj:GetProperty(hint_property)
	if not hint then
		return PinnableObject[hint_property]
	elseif hint ~= "" then
		return T{hint, obj}
	else
		return hint
	end
end

function PinsDlg:InitPinButton(button)
	local obj = button.context
	button.keep_highlighted = false
		
	if obj.pin_summary2 ~= "" then
		button.idTextBackground:SetImage("UI/Common/pin_shadow_2.tga")
	end
	
	local icon = obj:GetPinIcon()
	button:SetIcon(icon)
	if obj:IsKindOf("Colonist") then
		button.idSpecialization:SetImage(obj.pin_specialization_icon)
	end
	button.idIcon.Columns = 2
	button.idIcon:SetColumn(1)
	
	local old_SetRollover = button.SetRollover
	function button:SetRollover(rollover)
		old_SetRollover(self, rollover or self.keep_highlighted)
		self.idIcon:SetColumn(button:GetColumn())
	end
	
	function button:OnPress(gamepad)
		if self.context:OnPinClicked(gamepad) then
			return
		end
		if SelectedObj == obj then
			ViewObjectMars(self.context)
		else
			SelectObj(self.context)
		end
	end
	
	function button:OnAltPress(gamepad)
		if SelectedObj and self.context and IsKindOf(SelectedObj, "Drone")
			and IsKindOf(self.context, "DroneControl") and SelectedObj.interaction_mode == "reassign"
			and self.context:CanHaveMoreDrones() and SelectedObj.command_center ~= self.context then
			
			SelectedObj:SetCommandCenterUser(self.context)
		end
	end
	
	--achieve proper highlighting of pin btn - highlight when interacting with it, zoom-in in other cases
	local old_OnMouseLeft = button.OnMouseLeft
	function button:OnMouseLeft()
		old_OnMouseLeft(self)
		local mouse_pos = self.desktop.last_mouse_pos
		if mouse_pos and not self:MouseInWindow(mouse_pos) and not self.blinking then
			self.idRollover:SetVisible(false)
		end
	end
	
	--achieve proper highlighting of pin btn - highlight when interacting with it, zoom-in in other cases
	local old_OnMouseEnter = button.OnMouseEnter
	function button:OnMouseEnter()
		old_OnMouseEnter(self)
		local mouse_pos = self.desktop.last_mouse_pos
		if mouse_pos and self:MouseInWindow(mouse_pos) then
			self.idRollover:SetVisible(true)
		end
	end
	
	function button:OnContextUpdate(context)
		local icon = context:GetPinIcon()
		if icon ~= self:GetIcon() then
			self:SetIcon(icon)
			if context:IsKindOf("Colonist") then
				self.idSpecialization:SetImage(obj.pin_specialization_icon)
			end		
		end
		local condition_icon = self.parent:GetPinConditionImage(context)
		self.idCondition:SetVisible(not not condition_icon)
		if condition_icon then
			self.idCondition:SetImage(condition_icon)
		end
		if context.pin_blink ~= self.blinking then
			self:SetBlinking(context.pin_blink, context.pin_obvious_blink)
		end
		return XTextButton.OnContextUpdate(self, context)
	end
	
	assert(obj.pin_rollover~="" or (type(obj.description)== "string" and obj.description~="")or obj:GetProperty("description"), "Add pin description for object: ".. tostring(obj.class))
	local text = "" 
	local rollover = obj.pin_rollover
	if rollover == "" then
		text = (obj.description ~= "" and T{obj.description, obj}) or obj:GetProperty("description") or ""
	elseif IsT(rollover) or type(rollover) == "string" then
		text = T{rollover, obj}
	end
	
	button:SetRolloverTitle(T{8108, "<Title>", obj})
	button:SetRolloverText(text)
	button:SetRolloverHint(resolve_pin_rollover_hint(obj, "pin_rollover_hint"))
	button:SetRolloverHintGamepad(resolve_pin_rollover_hint(obj, "pin_rollover_hint_xbox"))
	
	local old_OnSetFocus = button.OnSetFocus
	if obj and IsValid(obj) and obj:IsKindOf("InfopanelObj") and obj:HasMember("GetPos") then
		function button:OnSetFocus(...)
			if self.context:GetPos() ~= InvalidPos() then
				SelectObj(self.context)
			else
				SelectObj()
			end
			return old_OnSetFocus(self, ...)
		end
	else
		function button:OnSetFocus(...)
			SelectObj()
			return old_OnSetFocus(self, ...)
		end
	end	
	
	--achieve proper highlighting of pin btn - highlight when interacting with it, zoom-in in other cases
	local old_OnKillFocus = button.OnKillFocus
	function button:OnKillFocus()
		old_OnKillFocus(self)
		if not self.blinking then
			self.idRollover:SetVisible(false)
		end
	end
end

local function AddPinnedObjs(objects_to_add, list, used)
	for i,obj in ipairs(objects_to_add or empty_table) do
		if obj:IsPinned() and not used[obj] then
			list[#list + 1] = obj
			used[obj] = true
		end
	end
end

function SortPinnedObjs()
	local used, new_order = {}, {}
	local labels = UICity.labels or empty_table
	
	--supply rockets
	AddPinnedObjs(labels.SupplyRocket, new_order, used)
	--rovers
	AddPinnedObjs(labels.Rover, new_order, used)
	--domes
	AddPinnedObjs(labels.Dome, new_order, used)
	--drones
	AddPinnedObjs(labels.Drone, new_order, used)
	--orbital probes (only the first in the label is pinned)
	local probes = labels.OrbitalProbe or empty_table
	if probes[1] and probes[1]:IsPinned() then
		new_order[#new_order + 1] = probes[1]
		used[probes[1]] = true
	end
	--buildings
	AddPinnedObjs(labels.Building, new_order, used)
	--colonists
	AddPinnedObjs(labels.Colonist, new_order, used)
	--everything else
	AddPinnedObjs(g_PinnedObjs, new_order, used)
	
	--update global list
	g_PinnedObjs = new_order

	--update order of ctrls in the pins dialog
	local pins_dlg = GetXDialog("PinsDlg")
	if pins_dlg then
		local obj_to_ctrl = {}
		--the first ctrl in PinsDlg is the gamepad hint icon
		for i=2,#pins_dlg do
			local ctrl = pins_dlg[i]
			obj_to_ctrl[ctrl.context] = ctrl
			rawset(pins_dlg, i, nil)
		end
		for i,obj in ipairs(g_PinnedObjs) do
			rawset(pins_dlg, i + 1, obj_to_ctrl[obj])
		end
		pins_dlg:InvalidateLayout()
		pins_dlg:ResolveRelativeFocusOrder()
	end
end

function OnMsg.LoadGame()
	SortPinnedObjs()
end

function OnMsg.GamepadUIStyleChanged()
	local pins_dlg = GetXDialog("PinsDlg")
	if pins_dlg then
		local gamepad = GetUIStyleGamepad()
		pins_dlg.idGamepadImage:SetVisible(gamepad)
		pins_dlg.idGamepadImage:SetDock(gamepad and "left" or "ignore")
	end
end

function OnMsg.OnControllerTypeChanged(controller_type)
	local pins_dlg = GetXDialog("PinsDlg")
	if pins_dlg then
		pins_dlg.idGamepadImage:SetImage(GetPlatformSpecificImagePath("RB"))
	end
end

function OnMsg.SelectedObjChange(obj, prev)
	local pins_dlg = GetXDialog("PinsDlg")
	if not pins_dlg then
		return
	end
	
	for i,pin in ipairs(pins_dlg) do
		if not pin.Dock then
			if pin.context == prev then
				pin.keep_highlighted = false
				pin:OnMouseLeft()
				pin:SetFocus(false, true)
			end
			
			if pin.context == obj then
				pin.keep_highlighted = true
				local focus = pin.desktop:GetKeyboardFocus()
				if focus and focus:IsWithin(pins_dlg) then
					pin:SetFocus(true)
				else
					pin:OnMouseEnter()
				end
			end
		end
	end
end
