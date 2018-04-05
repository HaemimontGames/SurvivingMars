DefineClass.MenuActionLine = {
	__parents = { "UILayer" },
	action_ctrls = false,
	color = RGB(255, 239, 164),
	rollover_color = RGB(255, 255, 255),
	disabled_color = RGB(158, 158, 158),
	shadow_color = RGB(76, 48, 0),
	disabled_shadow_color = RGB(32, 32, 32),
}

function MenuActionLine:PostInit()
	self:InitControls()
end

function MenuActionLine:SetDataset()
	self:InitControls()
end

local SmallXButtons = {
	ButtonA = true,
	ButtonB = true,
	ButtonX = true,
	ButtonY = true,
}

function MenuActionLine:InitControls()
	self.action_ctrls = {}
	self.idCenterButton:SetVisible(false)
	local idx = 1
	while self:HasMember("idAction" .. idx) do
		self["idAction" .. idx]:delete()
		idx = idx + 1
	end
	idx = 1
	local actions = self.dataset.actions or {DataInstances.MenuAction.Back}
	local template = self.idButton
	template:SetId("")
	template:SetText("")
	template:SetVisible(true)
	for i = 1, #actions do
		local action = actions[i]
		local param = action.select_param
		if type(param) == "string" then
			local containers = {
				["const."] = const,
				["g_Consts."] = g_Consts,
				["sponsor."] = GetMissionSponsor(),
			}
			for key, val in pairs(containers) do
				if string.starts_with(param, key) then
					local container, constant = string.match(param, "^(.-)%.(.*)$")
					if constant then
						param = val[constant]
						break
					end
				end
			end
		end
		action.param_value = param
		local btn = action.center_button and self.idCenterButton or template:Clone(nil, self)
		if action.center_button then
			self.idCenterButton:SetVisible(true)
		else
			btn:SetId("idAction" .. idx)
			idx = idx + 1
			btn:SetSize(template:GetSize())
			btn:SetPos(template:GetPos())
		end
		btn:SetVisible(not action.hidden)
		local enabled_condition = MenuSelectActionsEnabled[action.select_action]
		local btn_enabled = not enabled_condition or enabled_condition(self, param)
		local xinput_btn = action.xinput
		if btn_enabled and xinput_btn ~= "" and GetUIStyleGamepad() then
			local control_img = GetPlatformSpecificImageTag(xinput_btn, 1400)
			local action_text = T{action.text, param = param}
			if action.center_button or not SmallXButtons[xinput_btn] then
				btn:SetText(T{4083, "<u(control_img)><action>", control_img = control_img, action = action_text})
			else
				btn:SetText(T{4084, "<u(control_img)><action>", control_img = control_img, action = action_text})
			end
		else
			btn:SetText(T{action.text, param = param})
		end
		if action:HasMember("ActionFXBtnPressed") then
			btn.ActionFXBtnPressed = action.ActionFXBtnPressed
		end
		if action:HasMember("ActionFXMouseIn") then
			btn.ActionFXMouseIn = action.ActionFXMouseIn
		end
		if action:HasMember("ActionFXBtnPressedDisabled") then
			btn.ActionFXBtnPressedDisabled = action.ActionFXBtnPressedDisabled
		end
		btn.OnButtonPressed = function()
			if self.sound_enabled then
				if btn:GetEnabled() then
					if btn.ActionFXBtnPressed and btn.ActionFXBtnPressed ~= "" then
						PlayFX(btn.ActionFXBtnPressed, "start", btn, btn.id)
					end
				else
					if btn.ActionFXBtnPressedDisabled and btn.ActionFXBtnPressedDisabled ~= "" then
						PlayFX(btn.ActionFXBtnPressedDisabled, "start", btn, btn.id)
					end
				end
			end
			if not btn:GetEnabled() then return end
			local parent = self.parent -- take the parent before the select_action callback, since it may change it (transition to another menu)
			self:SelectActionCallback(action)
			if action.close_parent or action.go_back or action.open_dialog ~= "" then
				if parent.ctrl_state ~= "destroying" then
					if action.go_back then
						parent:GoBack()
					else
						parent:delete(action.open_dialog ~= "" and action.open_dialog or nil)
					end
				end
			end
			if parent.ctrl_state ~= "destroying" and enabled_condition then
				btn:SetEnabled(btn_enabled)
			end
		end
		self.action_ctrls[i] = btn
		self:InitActionButton(btn)
		
		if MenuSelectActionsVerified[action.select_action] then
			btn:SetVisible(MenuSelectActionsVerified[action.select_action](self, param))
		end
		
		btn.SetEnabled = function(this, enabled)
			Button.SetEnabled(this, enabled)
			btn:SetTextColor(enabled and self.color or self.disabled_color)
			btn:SetShadowColor(enabled and self.shadow_color or self.disabled_shadow_color)
		end
		btn.SetVisible = function(this, visible)
			Button.SetVisible(this, visible)
			self:AlignButtons()
		end
		if MenuSelectActionsEnabled[action.select_action] then
			btn:SetEnabled(MenuSelectActionsEnabled[action.select_action](self, param))
		end
	end
	template:SetId("idButton")
	template:SetVisible(false)
	self.idBkg:SetVisible(self:HasMember("idAction1") and not self.dataset.centered_line)
	self:AlignButtons()
end

function MenuActionLine:RecalcWindowScale()
	self:AlignButtons()
end

function MenuActionLine:SelectActionCallback(action)
	local parent = self.parent -- take the parent before the select_action callback, since it may change it (transition to another menu)
	if action.select_action ~= "" and MenuSelectActions[action.select_action] then
		MenuSelectActions[action.select_action](self, action.param_value)
	end
	if parent.ctrl_state ~= "destroying" and parent:HasMember("Update") then
		parent:Update()
	end
end

function MenuActionLine:AlignButtons()
	if self.dataset.centered_line then
		local idx = 1
		local first_ctrl, last_ctrl, prev_pos_x
		while self:HasMember("idAction" .. idx) do
			local btn = self["idAction" .. idx]
			if btn:GetVisible() then
				first_ctrl = first_ctrl or btn
				last_ctrl = btn
				btn:SetWidth(btn.text_width)
				if prev_pos_x then
					btn:SetX(prev_pos_x - btn:GetWidth() - 80 * self:GetWindowScale() / 100)
				else
					btn:SetX(self.idButton:GetX() + self.idButton:GetWidth() - btn:GetWidth())
				end
				prev_pos_x = btn:GetX()
			end
			idx = idx + 1
		end
	
		-- centering
		if last_ctrl then
			local offset = last_ctrl:GetX() - (self:GetWidth() - (first_ctrl:GetX() + first_ctrl:GetWidth() - last_ctrl:GetX())) / 2
			local idx = 1
			while self:HasMember("idAction" .. idx) do
				local btn = self["idAction" .. idx]
				if btn:GetVisible() then
					btn:SetX(btn:GetX() - offset)
				end
				idx = idx + 1
			end
		end
	else
		local prev_pos_x
		local idx = 1
		while self:HasMember("idAction" .. idx) do
			local btn = self["idAction" .. idx]
			if btn:GetVisible() then
				btn:SetWidth(btn.text_width)
				if prev_pos_x then
					btn:SetX(prev_pos_x - btn:GetWidth() - 30 * self:GetWindowScale() / 100)
				else
					btn:SetX(self.idButton:GetX() + self.idButton:GetWidth() - btn:GetWidth())
				end
				prev_pos_x = btn:GetX()
			end
			idx = idx + 1
		end
	end
end

function MenuActionLine:SetButtonsY(y)
	local idx = 1
	while self:HasMember("idAction" .. idx) do
		self["idAction" .. idx]:SetY(y)
		idx = idx + 1
	end
end

function MenuActionLine:InitActionButton(btn)
	btn.OnMouseEnter = function()
		Window.OnMouseEnter(btn)
		if btn:GetEnabled() then
			if self.sound_enabled and btn:GetEnabled() and btn.ActionFXMouseIn and btn.ActionFXMouseIn ~= "" then
				PlayFX(btn.ActionFXMouseIn, "start", btn, btn.id)
			end
			btn:SetTextColor(self.rollover_color)
		end
	end
	btn.OnMouseLeft = function()
		Window.OnMouseLeft(btn)
		if btn:GetEnabled() then
			btn:SetTextColor(self.color)
		end
	end
	btn.OnLButtonDown = function()
		btn:OnButtonPressed()
	end
end

function MenuActionLine:GetValidActionCtrl(field, value)
	for i = 1, #self.dataset.actions do
		if self.dataset.actions[i][field] == value and self.action_ctrls[i]:GetVisible() then
			return self.action_ctrls[i]
		end
	end
end

function MenuActionLine:OnKbdKeyDown(char, virtual_key)
	local allow_press = true
	if Platform.developer and virtual_key == const.vkEnter then
		allow_press = terminal.IsKeyPressed(const.vkControl)
	end
	if allow_press then
		local ctrl = self:GetValidActionCtrl("virtual_key", virtual_key)
		if ctrl then
			ctrl:OnButtonPressed()
			return "break"
		end
	end
	return "continue"
end

function MenuActionLine:OnXButtonDown(button, controller_id)
	if button == "Back" then
		local ctrl = self:GetValidActionCtrl("back_button", true)
		if ctrl then
			ctrl:OnButtonPressed()
			return "break"
		end
	end
	
	local ctrl = self:GetValidActionCtrl("xinput", button)
	if ctrl then
		ctrl:OnButtonPressed()
		return "break"
	end
	return "continue"
end

function MenuActionLine:UpdateButtons()
	local ctrls = self.action_ctrls
	local actions = self.dataset.actions or {DataInstances.MenuAction.Back}
	for i=1,#actions do
		local action = actions[i]
		local ctrl = ctrls[i]
		
		--enable or disable
		local condition = MenuSelectActionsEnabled[action.select_action]
		local ctrl_enabled = not condition or condition(self, action.param_value)
		if condition then
			ctrl:SetEnabled(ctrl_enabled)
		end
		
		--visibility
		condition = MenuSelectActionsVerified[action.select_action]
		if condition then
			ctrl:SetVisible(condition(self, action.param_value))
		end
		
		--update text
		local xinput_btn = action.xinput
		if ctrl_enabled and xinput_btn ~= "" and GetUIStyleGamepad() then
			local control_img = GetPlatformSpecificImageTag(xinput_btn, 1400)
			local action_text = T{action.text, param = action.param_value}
			if action.center_button or not SmallXButtons[xinput_btn] then
				ctrl:SetText(T{4083, "<u(control_img)><action>", control_img = control_img, action = action_text})
			else
				ctrl:SetText(T{4084, "<u(control_img)><action>", control_img = control_img, action = action_text})
			end
		else
			ctrl:SetText(T{action.text, param = action.param_value})
		end
	end
end