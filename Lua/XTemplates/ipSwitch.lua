-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "ipSwitch",
	PlaceObj('XTemplateTemplate', {
		'__context_of_kind', "SupplyGridSwitch",
		'__condition', function (parent, context) return context.is_switch end,
		'__template', "Infopanel",
		'Description', T(313911890683, --[[XTemplate ipSwitch Description]] "<description>"),
	}, {
		PlaceObj('XTemplateTemplate', {
			'comment', "on/off",
			'__template', "InfopanelButton",
			'RolloverText', T(607170415280, --[[XTemplate ipSwitch RolloverText]] "A switch or a valve can be used to split the grid into two sections."),
			'RolloverHint', T(7650, --[[XTemplate ipSwitch RolloverHint]] "<left_click> Activate/Deactivate <newline><em>Ctrl + <left_click></em> Activate/Deactivate all"),
			'OnContextUpdate', function (self, context, ...)
if context.switched_state then
	self:SetRolloverTitle(T(598, "Connect"))
	self:SetIcon("UI/Icons/IPButtons/turn_on.tga")
else
	self:SetRolloverTitle(T(599, "Split grid"))
	self:SetIcon("UI/Icons/IPButtons/turn_off.tga")
end
end,
			'OnPressParam', "Switch",
			'OnPress', function (self, gamepad)
self.context:Switch(not gamepad and IsMassUIModifierPressed())
end,
		}),
		PlaceObj('XTemplateTemplate', {
			'comment', "salvage",
			'__template', "InfopanelButton",
			'RolloverText', T(640016954592, --[[XTemplate ipSwitch RolloverText]] "Remove this switch or valve."),
			'RolloverTitle', T(3973, --[[XTemplate ipSwitch RolloverTitle]] "Salvage"),
			'RolloverHintGamepad', T(7657, --[[XTemplate ipSwitch RolloverHintGamepad]] "<ButtonY> Activate"),
			'ContextUpdateOnOpen', false,
			'OnPressParam', "Demolish",
			'Icon', "UI/Icons/IPButtons/salvage_1.tga",
		}, {
			PlaceObj('XTemplateFunc', {
				'name', "OnXButtonDown(self, button)",
				'func', function (self, button)
if button == "ButtonY" then
	return self:OnButtonDown(false)
elseif button == "ButtonX" then
	return self:OnButtonDown(true)
end
return (button == "ButtonA") and "break"
end,
			}),
			PlaceObj('XTemplateFunc', {
				'name', "OnXButtonUp(self, button)",
				'func', function (self, button)
if button == "ButtonY" then
	return self:OnButtonUp(false)
elseif button == "ButtonX" then
	return self:OnButtonUp(true)
end
return (button == "ButtonA") and "break"
end,
			}),
			}),
		}),
})

