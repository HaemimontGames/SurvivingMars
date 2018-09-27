-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XTextButton",
	group = "Infopanel",
	id = "InfopanelUpgrade",
	PlaceObj('XTemplateWindow', {
		'__class', "XTextButton",
		'RolloverTemplate', "InfopanelRollover",
		'RolloverAnchor', "left",
		'VAlign', "center",
		'ScaleModifier', point(700, 700),
		'LayoutMethod', "Box",
		'Background', RGBA(0, 0, 0, 0),
		'MouseCursor', "UI/Cursors/Rollover.tga",
		'FXMouseIn', "MenuItemHover",
		'FXPress', "MenuItemClick",
		'FocusedBackground', RGBA(0, 0, 0, 0),
		'AltPress', true,
		'RolloverBackground', RGBA(0, 0, 0, 0),
		'PressedBackground', RGBA(0, 0, 0, 0),
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'Id', "idRollover",
			'Margins', box(-5, -5, -5, -5),
			'Visible', false,
			'FadeInTime', 100,
			'FadeOutTime', 100,
			'RelativeFocusOrder', "next-in-line",
			'Image', "UI/Common/Hex_small_shine.tga",
			'ImageFit', "stretch",
		}),
		}),
})

