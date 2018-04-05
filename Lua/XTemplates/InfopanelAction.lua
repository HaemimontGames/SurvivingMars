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
		'LayoutMethod', "Box",
		'MouseCursor', "UI/Cursors/Rollover.tga",
		'FXMouseIn', "MenuItemHover",
		'FXPress', "MenuItemClick",
		'FXPressDisabled', "UIDisabledButtonPressed",
		'ColumnsUse', "abaaa",
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'Id', "idRollover",
			'Visible', false,
			'FadeInTime', 100,
			'FadeOutTime', 100,
			'FXMouseIn', "MenuItemHover",
			'FXPress', "MenuItemClick",
			'FXPressDisabled', "UIDisabledButtonPressed",
			'Image', "UI/HUD/selection.tga",
			'ImageFit', "stretch",
		}),
		}),
})

