DefineClass.XPageScroll = {
	__parents = { "XScroll", "XFontControl" },
	properties = {
		{ category = "Visual", id = "PageFormat", editor = "text", default = "%d/%d", },
		{ category = "Visual", id = "ForceFocusFirstItem", editor = "bool", default = false, },
	},
	Max = 0,
	HAlign = "right",
	VAlign = "center",
	MinWidth = 260,
	TextFont = "PGPage",
	TextColor = RGB(255,255,255),
	current_page = 1,
	page_info = false,
	visible = false,
	target_visible = false,
	AutoHide = true,
}
LinkFontPropertiesToChild(XPageScroll, "idPage")

function XPageScroll:Init()
	XImage:new({
		Dock = "box",
		Image = "UI/Common/pages_pad.tga",
		ImageFit = "stretch",
	}, self)
	local prev_image, prev_col_use = "UI/Common/pages_left.tga", "acaabd"
	local next_image, next_col_use = "UI/Common/pages_right.tga", "bdbba"
	local margins_left, margins_right = box(0, 0, -30, 0), box(-30, 0, 0, 0)
	local scale_left, scale_right = point(1000, 1000), point(1000, 1000)
	if GetUIStyleGamepad() then
		prev_image = GetPlatformSpecificImagePath("LB")
		next_image = GetPlatformSpecificImagePath("RB")
		prev_col_use = "aaaa"
		next_col_use = "aaaa"
		margins_left = box(50, 0, -30, 0)
		margins_right = box(-30, 0, 50, 0)
		scale_left = point(650, 650)
		scale_right = point(650, 650)
	end
	XTextButton:new({
		Id = "idPrev",
		Dock = "left",
		Image = prev_image,
		Margins = margins_left,
		ScaleModifier = scale_left,
		ColumnsUse = prev_col_use,
		SqueezeX = false,
		SqueezeY = false,
		Background = RGB(255,255,255),
		RolloverBackground = RGB(255,255,255),
		PressedBackground = RGB(255,255,255),
		DisabledBackground = RGB(255,255,255),
		MouseCursor = "UI/Cursors/Rollover.tga",
		OnPress = function(self)
			self.parent:PreviousPage()
		end,
	}, self)
	XTextButton:new({
		Id = "idNext",
		Dock = "right",
		Image = next_image,
		Margins = margins_right,
		ScaleModifier = scale_right,
		ColumnsUse = next_col_use,
		SqueezeX = false,
		SqueezeY = false,
		Background = RGB(255,255,255),
		RolloverBackground = RGB(255,255,255),
		PressedBackground = RGB(255,255,255),
		DisabledBackground = RGB(255,255,255),
		MouseCursor = "UI/Cursors/Rollover.tga",
		OnPress = function(self)
			self.parent:NextPage()
		end,
	}, self)
	XLabel:new({
		Id = "idPage",
		HAlign = "center",
		VAlign = "center",
	}, self)
	self.idPage:SetFontProps(self)
	XAction:new({
		ActionId = "actionNextPage",
		ActionGamepad = "RightShoulder",
		OnAction = function(action, host, win)
			if self:GetVisible() then
				self:NextPage()
				return "break"
			end
		end,
	}, self)
	XAction:new({
		ActionId = "actionPrevPage",
		ActionGamepad = "LeftShoulder",
		OnAction = function(action, host, win)
			if self:GetVisible() then
				self:PreviousPage()
				return "break"
			end
		end,
	}, self)
end

function XPageScroll:SetPageSize(page_size)
	page_size = page_size - page_size % self.StepSize
	self.PageSize = Max(page_size, 1)
	local page = self.current_page
	local area = self.parent:ResolveId(self.Target)
	local page_info = {}
	self.page_info = page_info
	if not area then return end
	-- !!! assume children are sorted in ascending order
	local horizontal = self.Horizontal
	local offset = horizontal and area.content_box:minx() - area.OffsetX or area.content_box:miny() - area.OffsetY
	local page_end
	for i, item in ipairs(area) do
		local box = item.box
		local e = horizontal and box:maxx() or box:maxy()
		if not page_end or e > page_end then -- new page
			local page_start = horizontal and box:minx() or box:miny()
			page_info[#page_info + 1] = point(page_start - offset, i)
			page_end = page_start + page_size
		end
	end
	self:SetPage(page)
end

function XPageScroll:SetPage(page, focus_first)
	local page_info = self.page_info or empty_table
	page = Clamp(page, 1, #page_info)
	local info = page_info[page]
	local list = self.parent:ResolveId(self.Target)
	local new_page = self.current_page ~= page
	if new_page then
		self.current_page = page
		self:OnPageChanged()
	end
	self:ScrollTo(info and info:x() or 0)
	list:DoScroll(list.PendingOffsetX, list.PendingOffsetY)
	self.idPrev:SetVisible(page > 1)
	self.idNext:SetVisible(page < #page_info)
	self.idPage:SetText(string.format(self.PageFormat, page, #page_info))
	if self.AutoHide then
		self:SetVisible(#page_info > 1, true)
	end
	if new_page and focus_first then
		if (GetUIStyleGamepad() and list.GamepadInitialSelection) or self.ForceFocusFirstItem then
			list:SetSelection(info:y())
		end
	end
end

function XPageScroll:ScrollIntoView(x)
	local page_info = self.page_info or empty_table
	local info = page_info[self.current_page]
	if info and info:x() ~= x then
		for i, info in ipairs(page_info) do
			if info:x() > x then
				self:SetPage(i - 1)
				return
			end
		end
		self:SetPage(#page_info)
	end
end

function XPageScroll:NextPage()
	local list = self.parent:ResolveId(self.Target)
	local focus_first = list.ForceInitialSelection or (list.GamepadInitialSelection and GetUIStyleGamepad())
	self:SetPage(self.current_page + 1, focus_first)
end

function XPageScroll:PreviousPage()
	local list = self.parent:ResolveId(self.Target)
	local focus_first = list.ForceInitialSelection or (list.GamepadInitialSelection and GetUIStyleGamepad())
	self:SetPage(self.current_page - 1, focus_first)
end

function XPageScroll:OnPageChanged()
end
