-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XTextButton",
	group = "CCC",
	id = "CommandCenterPopupItem",
	PlaceObj('XTemplateWindow', {
		'__class', "XTextButton",
		'Background', RGBA(255, 255, 255, 0),
		'MouseCursor', "UI/Cursors/Rollover.tga",
		'RelativeFocusOrder', "new-line",
		'FocusedBackground', RGBA(255, 255, 255, 0),
		'RolloverBackground', RGBA(255, 255, 255, 0),
		'PressedBackground', RGBA(255, 255, 255, 0),
		'TextStyle', "CCCItem",
		'Translate', true,
	}, {
		PlaceObj('XTemplateFunc', {
			'name', "SetSelected(self, selected)",
			'func', function (self, selected)
self:SetFocus(selected)
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnSetFocus",
			'func', function (self, ...)
XCreateRolloverWindow(self, true)
XTextButton.OnSetFocus(self, ...)
end,
		}),
		}),
})

