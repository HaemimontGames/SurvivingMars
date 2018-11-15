--------------------------------------------------------------------------------------------------------------------------------------------
DefineClass.ModItemAttachmentDialog = {
	__parents = {"MouseTrackWin"},
	camera = false,
}

function ModItemAttachmentDialog:Init()
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
	local dlg = GetDialog("ModItemAttachmentDialog")
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