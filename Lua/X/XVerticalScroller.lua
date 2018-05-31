DefineClass.XVerticalScroller = {
	__parents = {"XScroll"},
	LayoutMethod = "VList",
	VAlign = "center",
	FoldWhenHidden = false,
}

function XVerticalScroller:Init()
	local top_arrow = XImage:new({
		Id = "idTopArrow",
		HAlign = "center",
		Margins = box(0,-50,0,0),
		ScaleModifier = point(600, 500),
		HandleMouse = true,
		Image = "UI/Onscreen/onscreen_normalspeed.tga",
		Angle = 16200,
	}, self)
	top_arrow:SetTransparency(95)
	top_arrow:SetVisible(false)
	top_arrow.OnMouseButtonDown = function(top_arrow, pos, button)
		if button == "L" then
			return self:ResolveId(self.Target):OnMouseWheelForward()
		end
	end
	XImage:new({
		Margins = box(0,5,0,5),
		ScaleModifier = point(650, 650),
		Image = GetUIStyleGamepad() and GetPlatformSpecificImagePath("RS") or "UI/Common/mouse_middle_click.tga",
		HAlign = "center",
		VAlign = "center",
	}, self)
	local bottom_arrow = XImage:new({
		Id = "idBottomArrow",
		HAlign = "center",
		Margins = box(0,0,0,-50),
		ScaleModifier = point(600, 500),
		HandleMouse = true,
		Image = "UI/Onscreen/onscreen_normalspeed.tga",
		Angle = 5400,
	}, self)
	bottom_arrow:SetTransparency(95)
	bottom_arrow:SetVisible(false)
	bottom_arrow.OnMouseButtonDown = function(bottom_arrow, pos, button)
		if button == "L" then
			return self:ResolveId(self.Target):OnMouseWheelBack()
		end
	end
	XAction:new({
		ActionId = "actionScrollAreaDown",
		ActionGamepad = "RightThumbDown",
		OnAction = function(action, host, win, toggled)
			if self:GetVisible() then
				local target = self:ResolveId(self.Target)
				return target:OnMouseWheelBack()
			end
		end,
	}, self)
	XAction:new({
		ActionId = "actionScrollAreaUp",
		ActionGamepad = "RightThumbUp",
		OnAction = function(action, host, win, toggled)
			if self:GetVisible() then
				local target = self:ResolveId(self.Target)
				return target:OnMouseWheelForward()
			end
		end,
	}, self)
end

function XVerticalScroller:SetScroll(current)
	XScroll.SetScroll(self, current)
	local diff = self.Max - self.PageSize
	self.idTopArrow:SetVisible(diff > 0 and current > 0)
	self.idBottomArrow:SetVisible(diff > 0 and current < diff)
	self:SetVisible(diff > 0 and (current > 0 or current < diff))
end

function XVerticalScroller:UpdateLayout()
	XControl.UpdateLayout(self)
	self:ResolveId(self.Target):ScrollTo(0,0)
end