DefineClass.ResourceItems = {
 __parents = {"ItemMenuBase"},
 
 hide_single_category = true,
 align_pos = false,
 ScaleModifier = point(750,750),
 lines_stretch_time_init = 350,
}

function ResourceItems:Init()
	self.align_pos = GetUIStyleGamepad() and self.desktop.box:Center() or terminal:GetMousePos()
	self:SetModal()
	PlayFX("ItemSelectorIn", "start")
	UICity:Gossip("ItemSelector", "open")
	ShowMouseCursor("ResourceItems")
end

function ResourceItems:Close()
	ItemMenuBase.Close(self)
	PlayFX("ItemSelectorOut", "start")
	UICity:Gossip("ItemSelector", "close")
	HideMouseCursor("ResourceItems")
	if self.context.on_close_callback then
		self.context.on_close_callback()
	end

	local igi = GetInGameInterface()
	if igi then
		if igi.mode_dialog then
			igi.mode_dialog:SetFocus()
		else
			igi:SetMode("selection")
		end
	end
end

function ResourceItems:UpdateLayout()
	local margins_x1, margins_y1, margins_x2, margins_y2 = ScaleXY(self.scale, self.Margins:xyxy())
	local anchor = sizebox(self.align_pos, 1, 1)
	local safe_area_box = GetSafeAreaBox()
	local x, y = self.box:minxyz()
	local width, height = self.measure_width - margins_x1 - margins_x2, self.measure_height - margins_y1 - margins_y2
	x = anchor:minx() + ((anchor:maxx() - anchor:minx())  -  width)/2
	y = anchor:miny() - height - margins_y2
	if y<safe_area_box:miny() then
		x = anchor:minx() + ((anchor:maxx() - anchor:minx())  -  width)/2
		y = anchor:maxy() + margins_y2
	end	
	-- fit window to safe_area_box
	if x + width + margins_x2 > safe_area_box:maxx() then
		x = safe_area_box:maxx() - width - margins_x2
	elseif x < safe_area_box:minx() then
		x = safe_area_box:minx()
	end
	if y + height + margins_y2 > safe_area_box:maxy() then
		y = safe_area_box:maxy() - height - margins_y2
	elseif y < safe_area_box:miny() then
		y = safe_area_box:miny()
	end
	-- layout
	self:SetBox(x, y, width, height)
	return XControl.UpdateLayout(self)
end

function ResourceItems:GetCategories()
	return empty_table
end

function ResourceItems:GetItems(category_id)
	local buttons = {}
	local items = self.context.object:GetSelectorItems(self.context)
	if #items<=0 then self:delete() end	
	
	for i=1, #items do
		local item = items[i]
		item.ButtonAlign = i%2==1 and "top" or "bottom"
		item.hint = item.hint or false 
		item.gamepad_hint = item.gamepad_hint or false
		local button = HexButtonResource:new(item, self.idButtonsList)
		buttons[#buttons + 1] = button
	end
	return buttons
end

function ResourceItems:OpenItemsInterpolation(bFirst, set_focus)
	ItemMenuBase.OpenItemsInterpolation(self, bFirst, set_focus)
	self:CreateThread(function()
		local items = self.items
		local offs = self.idBackground.box:miny() - self.idBackground.box:maxy()
		local item_pop_time = self.lines_stretch_time_init/#items
		local duration = item_pop_time 
		for i = 1, #items do
			items[i]:SetVisible(true, "instant")
			if duration > 0 then
				if i % 2 == 0 then
					EdgeAnimation(true, items[i], 0, offs / 4, duration)
				else
					EdgeAnimation(true, items[i], 0, -offs / 4, duration)
				end
			end
		end
		self:SetInitFocus(set_focus)
	end)
end

function ResourceItems:CancelMenu()
	self:SelectParentCategory()
	local obj = self.context and self.context.object
	if obj then 
		obj:SetInteractionMode(obj.interaction_mode)
	end	
end

function ResourceItems:OnKbdKeyDown(virtual_key)
	if virtual_key == const.vkEsc then
		self:CancelMenu()
		return "break"
	end
	return ItemMenuBase.OnKbdKeyDown(self, virtual_key)
end

function ResourceItems:OnXButtonDown(button, source)
	if button == "ButtonA" then
		local focus = self.desktop and self.desktop.keyboard_focus
		if focus then
			if focus:GetEnabled() then
				focus.idButton:Press()
			end
		end
		return "break"
	elseif button == "ButtonX" and self.context.meta_key then
		local focus = self.desktop and self.desktop.keyboard_focus
		if focus then
			if focus:GetEnabled() then				
				focus.idButton:Press(nil, false, true)
			end
		end
		return "break"
	elseif button == "ButtonB" then
		self:CancelMenu()
		return "break"
	end
	
	return ItemMenuBase.OnXButtonDown(self, button, source)
end

function ResourceItems:OnMouseButtonDown(pt, button)
	if button == "R" then
		self:CancelMenu()
		return "break"
	end
	return ItemMenuBase:OnMouseButtonDown(pt, button)
end

function OpenResourceSelector(object, context)
	local dlg = GetDialog("ResourceItems")
	if dlg then
		if not dlg.context or dlg.context.object~=object then
			CloseDialog("ResourceItems")
		else
			return
		end
	end
	context.object = object
	return OpenDialog("ResourceItems", GetInGameInterface(), context)
end

function CloseResourceSelector()
	CloseDialog("ResourceItems")
end

function OnMsg.UIModeChange(mode)
	CloseResourceSelector()
end

function OnMsg.SelectionChange()
	CloseResourceSelector()
end
