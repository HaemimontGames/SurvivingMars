DefineClass.ItemMenuBase = {
	__parents = {"XDialog"},
	hide_single_category = false,	
	show_sel_cat_name_lag = 200,
	Margins = box(0,0,0,0),
	category = false,
	selected_category_name = false,
	parent_category = false,
	items = false,
	rollover_anchor = "center-top",
	
	lines_stretch_time_init = 120,
	lines_stretch_time = 200,
	cat_section_show_time = 120,
	show_sel_cat_name_lag = 200,
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
	XSuppressInputLayer:new(nil, self)

	self:InitButtonsUI()
	local first_category = table.find_value(self.cat_items, "Id", self.context and self.context.first_category)
	self:SelectCategory(first_category, true)
end

function ItemMenuBase:InitButtonsUI()
	-- buttons container
	XWindow:new({
		Margins  = box(0, 0, 0, self.hide_single_category and 40 or 160),
		HAlign =  "center",
		VAlign =  "bottom",
		Id = "idContainer",
		RolloverTemplate = "Rollover",
		RolloverAnchor = self.rollover_anchor,
		IdNode = false,
		Background = RGBA(255, 255, 255, 0),
		}, self)

	--background
	XWindow:new({		
		--HAlign = "center"
		Margins = box(-104, 0,-104,0),
		VAlign  =  "center",
		LayoutMethod = "VList",
		LayoutVSpacing = 43,
		Id = "idBackground",
		IdNode = false,
	}, self.idContainer)
			
	XWindow:new({VAlign="top",Id = "idTopBackWnd"}, self.idBackground)
			
		--upper watermark
		XFrame:new({
			VAlign = "bottom",
			Image = "UI/Common/bm_buildings_watermark_A.tga",
			TileFrame = true,
			SqueezeY = false,
			FrameBox = box(280, 0, 280, 0),
		},self.idTopBackWnd)
		
		--upper line
		XFrame:new({ 
			VAlign = "bottom",
			Image = "UI/Common/bm_buildings_pad.tga",
			ImageFit = "stretch-x",
			ImageScale = point(600, 600),
			SqueezeY = false,
		}, self.idTopBackWnd)
		
	XWindow:new({Id = "idBottomBackWnd"}, self.idBackground)
	
	--lower watermark
	XFrame:new({
		VAlign = "top",
		Image = "UI/Common/bm_buildings_watermark_A.tga",
		TileFrame = true,
		FrameBox = box(280, 0, 280, 0),
		SqueezeY = false,
		FlipY = true,
	},self.idBottomBackWnd)	
	
	--lower line
	XFrame:new({
		VAlign = "top",
		Image = "UI/Common/bm_buildings_pad.tga",
		ImageFit = "stretch-x",
		ImageScale = point(600, 600),
		SqueezeY = false,
		FlipY = true,
	},self.idBottomBackWnd)
		
	--	buttons list
	XWindow:new( {
		HAlign =  "center",
		VAlign =  "center",
		Margins = box(-168, 0,0,0),
		MinHeight =  220,
		LayoutMethod =  "HList",
		LayoutHSpacing =  -168,
		UniformColumnWidth =  true,
		Dock = "box",
		Id = "idButtonsList",
	}, self.idContainer)
end

local function stretch_close(ctrl, duration, invert)
	ctrl:AddInterpolation{
		id = "stretch",
		type = const.intRect,
		duration = duration or const.InterfaceAnimDuration,
		startRect = ctrl.box,
		endRect = box(ctrl.box:minx() + ctrl.box:sizex() / 2, ctrl.box:miny(), ctrl.box:minx() + ctrl.box:sizex() / 2, ctrl.box:maxy()),
		autoremove = true,
		flags = invert and const.intfInverse or nil,
	}
end

function ItemMenuBase:Close()
	UnlockHRXboxLeftThumb(self.class)
	local pins_dlg = GetDialog("PinsDlg")
	if pins_dlg then pins_dlg:SetVisible(true, "instant") end
	self:CreateThread(function()
		if not self.hide_single_category then
			EdgeAnimation(false, self.idCategoryList, 0, self.box:sizey() - self.idCategoryList.idCatBkg.box:miny())
		end	
		stretch_close(self.idTopBackWnd)
		stretch_close(self.idBottomBackWnd)
		
		Sleep(const.InterfaceAnimDuration)
		
		--Remove building buttons and everything else
		if not self.hide_single_category then
			self.idCategoryList:SetVisible(false, "instant")
		end
		
		XDialog.Close(self)		
	end)		
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
	self.idContainer:SetRollover(true)
	set_focus:SetFocus()
	set_focus:FillRollover()
	XCreateRolloverWindow(self.idContainer, true, self.context)
	set_focus:SelectButton()
end

function  ItemMenuBase:OpenItemsInterpolation(bFirst, set_focus)
	self:CreateThread(function()
		if bFirst then		
				self.idTopBackWnd:SetVisible(false, "instant")
				self.idBottomBackWnd:SetVisible(false, "instant")

				local ctrl = self.idTopBackWnd
				ctrl:SetVisible(true)
				stretch_close(ctrl,self.lines_stretch_time_init, "invert")
				ctrl = self.idBottomBackWnd
				ctrl:SetVisible(true)
				stretch_close(ctrl,self.lines_stretch_time_init, "invert")
				
				--Sleep(self.lines_stretch_time_init)
		else
		--[[	self.idTopBackWnd:AddInterpolation{
				id = "stretch",
				type = const.intRect,
				duration = self.lines_stretch_time,
				startRect = self.idTopBackWnd.box,
				endRect = start_rect_up,
				flags = const.intfInverse,
				autoremove = true,
			}
			self.idBottomBackWnd:AddInterpolation{
				id = "stretch",
				type = const.intRect,
				duration = self.lines_stretch_time,
				startRect = self.idBottomBackWnd.box,
				endRect = start_rect_down,
				flags = const.intfInverse,
				autoremove = true,
			}--]]
		end
		if set_focus and set_focus:GetParent() then
			self:SetInitFocus(set_focus)	
		end
	end)
end

function ItemMenuBase:SelectCategory(category, bFirst)
	local sel_cat = self.category and table.find_value(self.cat_items, "Id", self.category)
	if type(category) == "string" then
		category = table.find_value(self.cat_items, "Id", category)
	end
	category = category or self:DefaultCategory() or self.cat_items[1]
	self.category = category and category.id
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
		if not set_focus and GetUIStyleGamepad() then
			if bFirst and first_selected_item then
				if first_selected_item == button.name then
					set_focus = button
				end
			elseif i==1 then	
				set_focus = button
			end
		end
	end
	if not set_focus and GetUIStyleGamepad() then
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
		if self.parent_category then
			self:SelectCategory(self.parent_category)
			return "break"
		end	
		local ptx = pt:x()
		local pty = pt:y()
		if not self.hide_single_category and pt:InBox(self.idCategoryList.idCategoriesList.box) then 
			return "break" 
		end
	elseif button=="L" then
		local mode_dialog = GetInGameInterfaceModeDlg()
		return mode_dialog and mode_dialog:OnMouseButtonDown(pt, button)
	end
end

function ItemMenuBase:OnMouseEnter(pos)
	if GetUIStyleGamepad() then return end

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
	if pins_dlg then pins_dlg:SetVisible(false, "instant") end
	PlayFX("BuildMenuIn", "start")
end

function ItemMenu:Done()
	PlayFX("BuildMenuOut", "start")
end