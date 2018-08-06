DefineClass.OverviewMapCurtains = {
	__parents = { "XDialog" }, 
	curtains_width = -1,
	curtains_height = -1,
	ZOrder = -1000,
	FadeInTime = const.InterfaceAnimDuration,
	FadeOutTime = const.InterfaceAnimDuration,
	pending_update = false,
}

function OverviewMapCurtains:Open()
	XDialog.Open(self)
	self:SetOverviewCurtains()
end

function OverviewMapCurtains:Close()
	XWindow.Close(self)
end

function OverviewMapCurtains:SetVisible(visible, instant)
	if self.pending_update and not self:GetVisible() and visible then
		self:DeleteThread("OverviewCurtains")
		self:CreateThread("OverviewCurtains", function(self)
			WaitNextFrame(5)
			self:SetOverviewCurtains()
		end, self)
		self.pending_update = false
	end
	XDialog.SetVisible(self, visible, instant)
end

function OverviewMapCurtains:ForceDelete()
	--delete the dialog during fade out interpolation
	local modifier = self:FindModifier("fade")
	if modifier then
		modifier.on_complete = function() end
	end
	self:delete()
end

function OverviewMapCurtains:UpdateLayout()
	if not self.layout_update then return end
	
	XDialog.UpdateLayout(self)
	if not self:GetVisible() then
		self.pending_update = true
		return
	end
	local pos, lookat = CalcOverviewCameraPos()
	local width, height = CalcOverviewCurtainsSize(pos, lookat, self.parent.box:sizex(), self.parent.box:sizey())
	self:SetOverviewCurtains(Max(width, self.curtains_width), Max(height, self.curtains_height))
	self:DeleteThread("OverviewCurtains")
	if width < self.curtains_width or height < self.curtains_height then
		self:CreateThread("OverviewCurtains", function(self)
			WaitNextFrame(3)
			self:SetOverviewCurtains()
		end, self)
	end
end

function OverviewMapCurtains:SetOverviewCurtains(width, height)
	local screen_w = self.parent.box:sizex()
	local screen_h = self.parent.box:sizey()
	if not width or not height then
		local pos, lookat = CalcOverviewCameraPos()
		width, height = CalcOverviewCurtainsSize(pos, lookat, screen_w, screen_h)
	end
	local twidth = 80
	local sizex = (width+twidth-1)/twidth*twidth + 2*twidth
	local left = width + twidth - sizex
	local right = screen_w - width - twidth
	local top_sizex = (screen_w - left + 2 * twidth) / twidth * twidth

	if self.idLeft then
		self.idLeft:SetBox(left, 0, sizex, screen_h)
		self.idLeft:SetVisible(width > 0, true)
	end
	if self.idRight then
		self.idRight:SetBox(right, 0, sizex, screen_h)
		self.idRight:SetVisible(width > 0, true)
	end
	if self.idTop then
		self.idTop:SetBox(left, 0, top_sizex, height)
		self.idTop:SetVisible(height > 0, true)
	end
	if self.idBottom then
		self.idBottom:SetBox(left, screen_h - height, top_sizex, height)
		self.idBottom:SetVisible(height > 0, true)
	end
	self.curtains_width = width
	self.curtains_height = height
end

function ShowOverviewMapCurtains(bShow, forceClose)
	local dlg = GetDialog("OverviewMapCurtains")
	if bShow then
		if not dlg or dlg and dlg.window_state == "closing" then
			if dlg then
				dlg:ForceDelete()
			end
			OpenDialog("OverviewMapCurtains")
		end
	elseif dlg then
		if forceClose then
			dlg:SetFadeOutTime(0)
		end
		CloseDialog("OverviewMapCurtains")
	end
end

function HideOverviewMapCurtains(bHide)
	local dlg = GetDialog("OverviewMapCurtains")
	if dlg then
		dlg:SetVisible(not bHide, "instant")
	end
end