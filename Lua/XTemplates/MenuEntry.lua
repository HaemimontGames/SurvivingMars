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
		'TextStyle', "Action",
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

