-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XTextButton",
	group = "PreGame",
	id = "MenuEntry",
	PlaceObj('XTemplateWindow', {
		'__class', "XTextButton",
		'HAlign', "center",
		'Background', RGBA(0, 0, 0, 0),
		'RolloverZoom', 1100,
		'MouseCursor', "UI/Cursors/Rollover.tga",
		'FXMouseIn', "ActionButtonHover",
		'FXPress', "ActionButtonClick",
		'FXPressDisabled', "UIDisabledButtonPressed",
		'FocusedBackground', RGBA(0, 0, 0, 0),
		'RolloverBackground', RGBA(0, 0, 0, 0),
		'PressedBackground', RGBA(0, 0, 0, 0),
		'TextFont', "MarsMenuItemButton",
		'TextColor', RGBA(255, 239, 164, 255),
		'RolloverTextColor', RGBA(255, 255, 255, 255),
		'DisabledTextColor', RGBA(114, 114, 114, 255),
		'DisabledRolloverTextColor', RGBA(180, 180, 180, 255),
		'ShadowType', "outline",
		'ShadowSize', 3,
		'ShadowColor', RGBA(76, 48, 0, 255),
		'DisabledShadowColor', RGBA(32, 32, 32, 255),
		'Translate', true,
		'ShowGamepadShortcut', true,
	}, {
		PlaceObj('XTemplateFunc', {
			'name', "OnSetFocus",
			'func', function (self, ...)
XCreateRolloverWindow(self, true)
XTextButton.OnSetFocus(self, ...)
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "SetSelected(self, selected)",
			'func', function (self, selected)
self:SetFocus(selected)
end,
		}),
		}),
})

