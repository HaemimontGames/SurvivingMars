----- XHideMapOverviewCurtainsLayer

DefineClass.XHideMapOverviewCurtainsLayer = {
	__parents = { "XLayer" },
	Dock = "ignore",
	HandleMouse = false,
}

function XHideMapOverviewCurtainsLayer:Init()
	HideOverviewMapCurtains(true)
end

function XHideMapOverviewCurtainsLayer:Done()
	HideOverviewMapCurtains(false)
end


----- XHideInfopanelLayer

DefineClass.XHideInfopanelLayer = {
	__parents = { "XLayer" },
	Dock = "ignore",
	HandleMouse = false,
}

function XHideInfopanelLayer:Init()
	CloseXInfopanel()
end

function XHideInfopanelLayer:Done()
	ReopenSelectionXInfopanel()
end

----- XHideInfobarLayer

DefineClass.XHideInfobarLayer = {
	__parents = { "XLayer" },
	Dock = "ignore",
	HandleMouse = false,
	infobar_state = false,
}

function XHideInfobarLayer:Init()
	local dlg = GetDialog("Infobar")
	if dlg then
		self.infobar_state = dlg:GetVisible()
		dlg:SetVisible(false, "instant")
	end
end

function XHideInfobarLayer:Done()
	local dlg = GetDialog("Infobar")
	if dlg then
		dlg:SetVisible(self.infobar_state, "instant")
	end
end

----- XHideNonEssentialUILayer

local essential_ui = { "Infobar", "Infopanel", "PopupNotification", "PlanetaryView" }

DefineClass.XHideNonEssentialUILayer = {
	__parents = { "XLayer" },
	Dock = "ignore",
	HandleMouse = false,
	visible_states = false,
}

function XHideNonEssentialUILayer:Init()
	self.visible_states = {}
	for _, dialog in ipairs(GetInGameInterface() or empty_table) do
		local essential = false
		for _, id in ipairs(essential_ui) do
			if GetDialog(id) == dialog then
				essential = true
				break
			end
		end
		if not essential then
			self.visible_states[dialog] = dialog:GetVisible()
			dialog:SetVisible(false, "instant")
		end
	end
end

function XHideNonEssentialUILayer:Done()
	for dialog, visible in pairs(self.visible_states) do
		if dialog.window_state ~= "destroying" then
			dialog:SetVisible(visible, "instant")
		end
	end
	self.visible_states = nil
	local mode_dlg = GetInGameInterfaceModeDlg()
	if mode_dlg then
		--restore focus to mode dialog
		mode_dlg:SetFocus()
	end
end

function XHideNonEssentialUILayer:SetVisibleState(dlg, state)
	self.visible_states[dlg] = state
end
