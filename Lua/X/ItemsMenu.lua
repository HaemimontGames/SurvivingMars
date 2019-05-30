DefineClass.ItemMenuBase = {
	__parents = {"XDialog"},
	hide_single_category = false,	
	show_sel_cat_name_lag = 200,
	Margins = box(0,0,0,0),
	category = false,
	category_id = false,
	selected_category_name = false,
	parent_category = false,
	items = false,
	rollover_anchor = "center-top",
	
	lines_stretch_time_init = 120,
	lines_stretch_time = 200,
	cat_section_show_time = 120,
	show_sel_cat_name_lag = 200,
	
	idContainer = false,
	idBackground = false,
	idButtonsListScroll = false,
} 

function ItemMenuBase:Init()
	self.items = {}
	self.cat_items = {}
	local categories = self:GetCategories()
	self.hide_single_category = #categories<=1 or self.hide_single_category 
	if not self.hide_single_category then
		CategoryList:new({Id = "idCategoryList"},self)
		self:CreateCategoryItems(categories)
	end
	self.category = false
	self.selected_category_name = false
	
	LockHRXboxLeftThumb(self.class)
	XSuppressInputLayer:new({ SuppressTime = 1 }, self)

	self:InitButtonsUI()
	local first_category = table.find_value(self.cat_items, "Id", self.context and self.context.first_category)
	self:SelectCategory(first_category, true)
end

function ItemMenuBase:InitButtonsUI()
	-- buttons container
	XWindow:new({
		Margins = box(-90, 0, -90, self.hide_single_category and 40 or 145),
		HAlign = "center",
		VAlign = "bottom",
		Id = "idContainer",
		MinHeight = 230,
		RolloverTemplate = "Rollover",
		RolloverAnchor = self.rollover_anchor,
		IdNode = false,
		Background = RGBA(255, 255, 255, 0),
		HandleMouse = true,
	}, self)
	self.idContainer.OnMouseButtonDown = function(pt, button)
		return "break"
	end

	--background
	XFrame:new({
		Id = "idBackground",
		Image = "UI/CommonNew/bm.tga",
		Margins = box(0, -20, 0, -20),
		FrameBox = box(155, 0, 155, 0),
	}, self.idContainer)
	
	--	buttons list
	local buttons_list = XScrollArea:new( {
		VAlign =  "center",
		Margins = box(50, 0, 50, 0),
		LayoutMethod =  "HList",
		LayoutHSpacing =  -142,
		Id = "idButtonsList",
		HScroll = "idButtonsListScroll",
		IdNode = false,
		MouseWheelStep = 60,
	}, self.idContainer)
	
	local buttons_scroll = XScrollThumb:new({
		Id = "idButtonsListScroll",
		Margins = box(100, -5, 100, 0),
		Padding = box(0,5,0,5),
		Dock = "bottom",
		MinHeight = 20,
		MaxHeight = 20,
		FoldWhenHidden = false,
		MouseCursor = "UI/Cursors/Rollover.tga",
		FullPageAtEnd = true,
		SnapToItems = false,
		AutoHide = true,
		MinThumbSize = 30,
		FixedSizeThumb = false,
		Horizontal = true,
		Target = "idButtonsList",
	}, self.idContainer)
	XFrame:new({
		Dock = "box",
		Image = "UI/CommonNew/bm_scrollbar_line.tga",
		FrameBox = box(5, 0, 5, 0),
	}, buttons_scroll)
	XFrame:new({
		Id = "idThumb",
		Image = "UI/CommonNew/bm_scrollbar.tga",
		FrameBox = box(4, 3, 4, 3),
		SqueezeY = false,
	}, buttons_scroll)
end

function ItemMenuBase:StretchCloseAnimation(ctrl, start_time, duration, invert)
	if not ctrl then return end
	ctrl:AddInterpolation{
		id = "stretch",
		type = const.intRect,
		duration = duration or const.InterfaceAnimDuration,
		start = start_time or GetPreciseTicks(),
		originalRect = ctrl.box,
		targetRect = box(ctrl.box:minx() + ctrl.box:sizex() / 2, ctrl.box:miny(), ctrl.box:minx() + ctrl.box:sizex() / 2, ctrl.box:maxy()),
		autoremove = not not invert,
		flags = invert and const.intfInverse or nil,
		easing = const.Easing.CubicIn,
	}
end

function ItemMenuBase:Done()
	if GetDialog("XBuildMenu") then return end
	local dlg = GetDialog("XHideNonEssentialUILayer")
	local pins_dlg = GetDialog("PinsDlg")
	if dlg and dlg.window_state ~= "destroying" and pins_dlg then
		dlg:SetVisibleState(pins_dlg, true)
		return
	end
	if pins_dlg then pins_dlg:SetVisible(true) end
end

function ItemMenuBase:Close()
	UnlockHRXboxLeftThumb(self.class)
	self:CloseItemsInterpolation()
	if RolloverControl == self.idContainer then
		XDestroyRolloverWindow()
	end
end

function ItemMenuBase:OnSetFocus()
	LockHRXboxLeftThumb(self.class)
	XDialog.OnSetFocus(self)
end

function ItemMenuBase:OnKillFocus()
	UnlockHRXboxLeftThumb(self.class)
	XDialog.OnKillFocus(self)
end

function ItemMenuBase:GetCategories()
	return BuildCategories
end

function ItemMenuBase:DefaultCategory()
	return false
end

function ItemMenuBase:FindCategoryOfItem(item_name)
end

function ItemMenuBase:CreateCategoryItems(all_categories)
	self.cat_items = {}
end

function ItemMenuBase:SetInitFocus(set_focus)
	if not set_focus then return end
	
	if UseGamepadUI() then
		self.idContainer:SetRollover(true)
		set_focus:SetVisible(true)
		set_focus:SetFocus()
		set_focus:FillRollover()
		XCreateRolloverWindow(self.idContainer, true, self.context)
		set_focus:SelectButton()
	else
		self.idButtonsList:ScrollIntoView(set_focus)
	end
end

function ItemMenuBase:OpenItemsInterpolation(bFirst, set_focus)
	if self.window_state=="destroying" then
		return
	end	
	if self:IsThreadRunning("OpenAnimation") then
		return
	end	
	if self:IsThreadRunning("CloseAnimation") then
		self:DeleteThread("CloseAnimation")
	end
	self.idButtonsList:SetMargins(self.idButtonsList:GetMargins())
	self:SetFocus()
	self:CreateThread("OpenAnimation", function()
		if bFirst then
			local ctrl = self.idBackground
			ctrl:SetVisible(false, "instant")
			ctrl:SetVisible(true)
			self:StretchCloseAnimation(ctrl, false, self.lines_stretch_time_init, "invert")
			local ctrl = self.idButtonsListScroll
			if ctrl:ShouldShow() then
				ctrl:SetVisible(true)
			end
		end
		if set_focus and set_focus:GetParent() then
			self:SetInitFocus(set_focus)	
		end
	end)
end

function ItemMenuBase:CloseItemsInterpolation()
	if self:IsThreadRunning("CloseAnimation") then
		return
	end
	if self:IsThreadRunning("OpenAnimation") then
		self:DeleteThread("OpenAnimation")
	end
	self:CreateThread("CloseAnimation", function()
		if not self.hide_single_category then
			EdgeAnimation(false, self.idCategoryList, 0, self.box:sizey() - self.idCategoryList.idCatBkg.box:miny())
		end	
		self:StretchCloseAnimation(self.idBackground)
		if self.idButtonsListScroll then
			self.idButtonsListScroll:SetVisible(false)
		end
		
		Sleep(const.InterfaceAnimDuration)
		
		--Remove building buttons and everything else
		if not self.hide_single_category then
			self.idCategoryList:SetVisible(false, "instant")
		end
		
		XDialog.Close(self)
	end)
end

function ItemMenuBase:SelectCategory(category, bFirst)
	local sel_cat = self.category and table.find_value(self.cat_items, "Id", self.category)
	if type(category) == "string" then
		category = table.find_value(self.cat_items, "Id", category)
	end
	category = category or self:DefaultCategory() or self.cat_items[1]
	self.category = category and category.id
	self.category_id = category and category.id
	self.selected_category_name = category and category.name
	self.parent_category = false
	
	if sel_cat then
		sel_cat:OnMouseLeft()
	end
	if not self.hide_single_category then
		local list = self.idCategoryList
		list.idSelectedCat:SetText(category.name)
	end
	if bFirst or GetUIStyleGamepad() then
		sel_cat = category and table.find_value(self.cat_items, "Id", category.id)
		if sel_cat then
			sel_cat:OnMouseEnter()
		end		
	end
	self:FillCategoryItems(self.category, bFirst)
end

function ItemMenuBase:SelectSubCategory(category, parent_category)
	local sel_cat = self.category and table.find_value(self.cat_items, "Id", self.category)
	if type(parent_category) == "string" then
		parent_category = table.find_value(self.cat_items, "Id", parent_category)
	end
	--parent_category = parent_category or self:DefaultCategory() or self.cat_items[1]
	self.category_id = category and category.name
	self.category = parent_category and parent_category.id
	self.selected_category_name = category and category.display_name
	self.parent_category = parent_category
	
	if sel_cat then
		sel_cat:OnMouseLeft()
	end
	if not self.hide_single_category then
		local list = self.idCategoryList
		list.idSelectedCat:SetText(self.selected_category_name)
	end
	self:FillCategoryItems(category.name)
end

function ItemMenuBase:SelectParentCategory()
	if not self.parent_category then
		self:Close()
		return
	end
	self:SelectCategory(self.parent_category)
end

function ItemMenuBase:FillCategoryItems(category_id, bFirst)
	if next(self.items) then
		for i = #self.items, 1, -1 do
			self.items[i]:Done()
		end
	end
	self.items = {}
	local buttons = self:GetItems(category_id)
	local first_selected_item = self.context and self.context.first_selected_item
	local set_focus = false
	for i=1,#buttons do
		local button = buttons[i]
		self.items[#self.items+1] = button
		button:SetFocusOrder(point(i, 0))
		if not set_focus then
			if bFirst and first_selected_item then
				if first_selected_item == button.name then
					set_focus = button
				end
			elseif i==1 then	
				set_focus = button
			end
		end
	end
	if not set_focus then
		set_focus = self.items[1]
	end
	self:OpenItemsInterpolation(bFirst, set_focus)	
	
	self:CreateThread(function()
		self:UpdateHintHighlight()
	end)
end

function ItemMenuBase:GetItems(category_id)
	return empty_table
end

function ItemMenuBase:GamepadChangeCategory(dir)
	local previous_cat = table.find(self.cat_items, "Id", self.category)
	if not previous_cat then return end
	local new_cat
	if dir == 1 then
		new_cat = (previous_cat % #self.cat_items) + 1
	elseif dir == -1 then
		new_cat = previous_cat - 1
		if new_cat < 1 then
			new_cat = #self.cat_items
		end
	end
	
	if previous_cat == new_cat then
		return
	end
	
	self:SelectCategory(self.cat_items[new_cat])
end

function ItemMenuBase:OnXButtonDown(button, source)
	button = XInput.LeftThumbToDirection[button] or button
	--print(button)	
	if button == "DPadLeft" or button == "DPadRight" then
		local focus = self.desktop and self.desktop.keyboard_focus
		local order = focus and focus:GetFocusOrder()
		local new_focus = self:GetRelativeFocus(order, XShortcutToRelation[button])
		if not new_focus and order then
			local x = order:x()
			local count = #self.items
			if x == 1 and button == "DPadLeft" then
				new_focus = self.items[count]
			elseif x == count	and button == "DPadRight" then
				new_focus = self.items[1]
			end
		end
		if new_focus then
			if focus then
				focus:DeselectButton()
			end
			new_focus:SetVisible(true)
			new_focus:SetFocus(true)
			new_focus:FillRollover()
			XCreateRolloverWindow(self.idContainer, true, self.context)
			new_focus:SelectButton()
		end
		return "break"
	elseif button == "LeftShoulder" then
		self:GamepadChangeCategory(-1)
		return "break"
	elseif button == "RightShoulder" then
		self:GamepadChangeCategory(1)
		return "break"
	elseif button == "ButtonA" then
		local focus = self.desktop and self.desktop.keyboard_focus
		if focus then
			if focus:GetEnabled() then
				focus.idButton:Press()
			end
		end
		return "break"
	elseif button == "ButtonX" then
		local res
		local focus = self.desktop and self.desktop.keyboard_focus
		if focus then
			res = focus.idButton:OnMouseButtonDoubleClick(nil, "L")
		end
		if res == "break" then return res end
	elseif button == "ButtonB" then
		self:SelectParentCategory()
		return "break"
	end
	
	--consume those, so they don't get passed through to the ingame interface
	if button == "DPadUp" or button == "DPadDown" or button == "RightTrigger" or
		button == "LeftThumbUpRight" or button == "LeftThumbDownRight" or
		button == "LeftThumbUpLeft" or button == "LeftThumbDownLeft"
	then
		return "break"
	end
	
	return XDialog.OnShortcut(self, button)
end

function ItemMenuBase:OnKbdKeyDown(virtual_key)
	if virtual_key == const.vkEsc then
		self:SelectParentCategory()
		return "break"
	end
	return "continue"
end

function ItemMenuBase:OnMouseButtonDown(pt, button)
	if button=="R" then
		self:SelectParentCategory()
		return "break"
	elseif button=="L" then
		local mode_dialog = GetInGameInterfaceModeDlg()
		return mode_dialog and mode_dialog:OnMouseButtonDown(pt, button)
	end
end

function ItemMenuBase:OnMouseEnter(pos)
	if UseGamepadUI() then return end

	local igi = GetInGameInterface()
	local dlg = igi and igi.mode_dialog
	if dlg and dlg:IsKindOf("UnitDirectionModeDialog") and dlg.unit then
		dlg:HideMouseCursorText(pos)
	end	
	return XDialog.OnMouseEnter(self, pos)
end

function ItemMenuBase:UpdateHintHighlight(force)
	--local element = self.idCategoryHighlight
	local id = HintsGetHighlightedID(self.class)
	
	if self.hide_single_category then
		--find hex button and show its hint
		for i=1,#self.items do
			local item = self.items[i]
			item:SetHighlighting(item.name == id)
		end
		return
	end	
	
	--no ID means nothing to highlight
	local show = not not id	
	local category
	if show then
		category = self:FindCategoryOfItem(id) or false
		show = not not category
	end
	
	if not show then --no highlights to show - hide it all
		if self:IsThreadRunning("CategoryHighlight") then
			--element:SetVisible(false)
			self:DeleteThread("CategoryHighlight")
		end
		for i=1,#self.items do
			self.items[i]:SetHighlighting(false)
		end
	else
		--if we're in the same category we should hide the category hint and show the hex button hint
		if self.category == category then
			--hide category hint
			if self:IsThreadRunning("CategoryHighlight") then
				local cat_original = table.find_value(self.cat_items, "Id", category)
				local element = cat_original.idCategoryHighlight
				element:SetVisible(false)
				self:DeleteThread("CategoryHighlight")
			end
		
			--find hex button and show its hint
			for i=1,#self.items do
				local item = self.items[i]
				if item.name == id then
					item:SetHighlighting(true)
					break
				end
			end
		--else if we're not in the same category, check if we're already playing the category hint animation
		else
			if force and self:IsThreadRunning("CategoryHighlight") then
				self:DeleteThread("CategoryHighlight")
			end
			if not self:IsThreadRunning("CategoryHighlight") then
				--button highlighting might be left from the previous hint - stop it
				for i=1,#self.items do
					self.items[i]:SetHighlighting(false)
				end
			
				--apparently not - find the category button and show the hint animation
				local cat_original = table.find_value(self.cat_items, "Id", category)
				if cat_original then
					local element = cat_original.idCategoryHighlight
					element:SetVisible(true)
					element:SetImage(cat_original.highlight)
					element:SetZOrder(50)
					self:CreateThread("CategoryHighlight", HintHighlightIconAnimation, element)
				end
			end
		end
	end
end		

function OnMsg.OnScreenHintChanged(hint)
	local children = ClassDescendantsList("ItemMenuBase")
	for i=1,#children do
		local child = GetDialog(children[i])
		if child then
			child:UpdateHintHighlight("force")
		end
	end
end

DefineClass.ItemMenu = {
	__parents = {"ItemMenuBase"},
}

function ItemMenu:Init()
	CloseInfopanelItems()
	SelectObj(false)
	local pins_dlg = GetDialog("PinsDlg")
	if pins_dlg then pins_dlg:SetVisible(false) end
	PlayFX("BuildMenuIn", "start")
end

function ItemMenu:Close()
	PlayFX("BuildMenuOut", "start")
	ItemMenuBase.Close(self)
end