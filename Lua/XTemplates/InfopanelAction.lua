-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XTextButton",
	group = "Infopanel",
	id = "InfopanelAction",
	PlaceObj('XTemplateWindow', {
		'__parent', function (parent, context) return GetActionsHost(parent).idActionButtons end,
		'__condition', function (parent, context) return parent end,
		'__class', "XTextButton",
		'RolloverTemplate', "InfopanelRollover",
		'RolloverAnchor', "left",
		'RolloverHint', T{608042494285, --[[XTemplate InfopanelAction RolloverHint]] "<left_click> Activate"},
		'RolloverHintGamepad', T{643294919927, --[[XTemplate InfopanelAction RolloverHintGamepad]] "<ButtonA> Activate"},
		'Margins', box(-12, -12, -12, -12),
		'Padding', box(12, 12, 12, 12),
		'MinWidth', 85,
		'MinHeight', 85,
		'MaxWidth', 85,
		'MaxHeight', 85,
		'LayoutMethod', "Box",
		'MouseCursor', "UI/Cursors/Rollover.tga",
		'FXMouseIn', "MenuItemHover",
		'FXPress', "MenuItemClick",
		'FXPressDisabled', "UIDisabledButtonPressed",
		'Image', "UI/CommonNew/ip_button_2.tga",
		'FrameBox', box(14, 14, 14, 14),
		'Columns', 2,
		'ColumnsUse', "abaaa",
	}, {
		PlaceObj('XTemplateFunc', {
			'name', "OnSetRollover(self, rollover)",
			'func', function (self, rollover)
XTextButton.OnSetRollover(self, rollover)
self.idIcon:SetColumn(rollover and 2 or 1)
end,
		}),
		}),
})

