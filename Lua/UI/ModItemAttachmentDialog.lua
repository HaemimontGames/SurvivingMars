--------------------------------------------------------------------------------------------------------------------------------------------
DefineClass.ModItemAttachmentDialog = {
	__parents = {"MouseTrackWin"},
	camera = false,
}

function ModItemAttachmentDialog:Init()
	------ background images
	XImage:new({
		Id = "idPadLeft",
		Margins = box(-572,0,0,-81),
		Image = "UI/Common/bm_pad.tga",
		Dock = "box",
		HAlign = "left",
		VAlign = "bottom",
	}, self)
	XImage:new({
		Id = "idWatermarkLeft",
		Margins = box(-572,0,0,-81),
		Dock = "box",
		HAlign = "left",
		VAlign = "bottom",
		Image = "UI/Common/bm_pad_watermark.tga",
	}, self)
	XImage:new({
		Id = "idPadMiddle",
		Margins = box(401,0,0,-81),
		Image = "UI/Common/bm_pad.tga",
		Dock = "box",
		HAlign = "center",
		VAlign = "bottom",
	}, self)
	XImage:new({
		Id = "idWatermarkMiddle",
		Margins = box(401,0,0,-81),
		Dock = "box",
		HAlign = "center",
		VAlign = "bottom",
		Image = "UI/Common/bm_pad_watermark.tga",
	}, self)
	XImage:new({
		Id = "idPadRight",
		Margins = box(0,0,-572,-81),
		Image = "UI/Common/bm_pad.tga",
		Dock = "box",
		HAlign = "right",
		VAlign = "bottom",
	}, self)
	XImage:new({
		Id = "idWatermarkRight",
		Margins = box(0,0,-572,-81),
		Dock = "box",
		HAlign = "right",
		VAlign = "bottom",
		Image = "UI/Common/bm_pad_watermark.tga",
	}, self)
	------ middle status text
	XText:new({
		Id = "idStatus",
		Translate = true,
		HandleMouse = false,
		TextFont = "HUDDrones",
		Margins = box(0,0,0,5),
		TextColor = RGBA(255,255,255,255),
		HAlign = "center",
		VAlign = "bottom",
	}, self)
	------- buttons
	local buttons_win = XWindow:new({
		HAlign = "right",
		VAlign = "bottom",
		Margins = box(0,0,47,3),
		LayoutMethod = "HList",
		LayoutHSpacing = -5,
	}, self)
	HUDButton:new({
		Id = "idParent",
		Image = "UI/Icons/mod_0.tga",
		RolloverText = T{4258, --[[default]] "Control Parent Object"},
		GamepadButton = "ButtonB",
		Rows = 2,
	}, buttons_win)
	HUDButton:new({
		Id = "idAxisX",
		Image = "UI/Icons/mod_x.tga",
		RolloverText = T{4255, --[[default]] "Control X Axis of Anchored Object"},
		GamepadButton = "ButtonX",
		Rows = 2,
	}, buttons_win)
	HUDButton:new({
		Id = "idAxisY",
		Image = "UI/Icons/mod_y.tga",
		RolloverText = T{4256, --[[default]] "Control Y Axis of Anchored Object"},
		GamepadButton = "ButtonY",
		Rows = 2,
	}, buttons_win)
	HUDButton:new({
		Id = "idAxisZ",
		Image = "UI/Icons/mod_z.tga",
		RolloverText = T{4257, --[[default]] "Control Z Axis of Anchored Object"},
		GamepadButton = "ButtonB",
		Rows = 2,
	}, buttons_win)
	HUDButton:new({
		Id = "idHelpButton",
		Margins = box(50,0,0,0),
		Image = "UI/HUD/encyclopedia.tga",
		HAlign = "right",
		ScaleModifier = point(600,600),
		OnPress = function(button)
			self.idHelpWindow:SetVisible(not self.idHelpWindow:GetVisible(),true)
		end,
	}, buttons_win)
	------ help panel
	local help_win = XWindow:new({
		Id = "idHelpWindow",
		Margins = box(0,0,20,60),
		HAlign = "right",
		VAlign = "bottom",
		MaxWidth = 400,
	}, self)
	local help_background = XImage:new({
		Dock = "box",
		Image = "UI/Infopanel/pad.tga",
		ImageFit = "stretch",
	}, help_win)
	local outer_frame = XFrame:new({
		Image = "UI/Infopanel/watermark.tga",
		TileFrame = true,
	}, help_background)
	XFrame:new({
		Image = "UI/Common/rollover_watermark_3.tga",
		FrameBox = box(2,0,2,0),
		TileFrame = true,
	}, outer_frame)
	XText:new({
		Id = "idHelpText",
		Translate = true,
		Padding = box(20,20,20,20),
		HandleMouse = false,
		TextFont = "InfopanelText",
		TextColor = RGBA(255,255,255,255),
	}, help_win)
	help_win:SetVisible(false)
	
	self:SetModal()
	self.camera = {GetCamera()}
	OnGameEnterEditor()
	XSuppressInputLayer:new(nil, self)
	XPauseLayer:new({togglePauseDialog = false}, self)
end

function ModItemAttachmentDialog:Open(...)
	self:RecalculateMargins()
	MouseTrackWin.Open(self, ...)
end

function ModItemAttachmentDialog:RecalculateMargins()
	self:SetMargins(ModItemAttachmentDialog.Margins + GetSafeMargins())
end

function OnMsg.SafeAreaMarginsChanged()
	local dlg = GetXDialog("ModItemAttachmentDialog")
	if dlg then
		dlg:RecalculateMargins()
	end
end

function ModItemAttachmentDialog:Done()
	if self.camera then
		SetCamera(table.unpack(self.camera))
		self.camera = false
	end
	OnGameExitEditor()
end

function ModItemAttachmentDialog:OnShortcut(shortcut, source, repeated)
	if not repeated then
		if shortcut == "X" then
			self.idAxisX:SetToggled(true)
			return "break"
		elseif shortcut == "-X" then
			self.idAxisX:SetToggled(false)
			return "break"
		end
		
		if shortcut == "C" then
			self.idAxisY:SetToggled(true)
			return "break"
		elseif shortcut == "-C" then
			self.idAxisY:SetToggled(false)
			return "break"
		end
		
		if shortcut == "Z" then
			self.idAxisZ:SetToggled(true)
			return "break"
		elseif shortcut == "-Z" then
			self.idAxisZ:SetToggled(false)
			return "break"
		end
		
		if shortcut == "Alt" then
			self.idParent:SetToggled(true)
			return "break"
		elseif shortcut == "-Alt" then
			self.idParent:SetToggled(false)
			return "break"
		end
	end
end