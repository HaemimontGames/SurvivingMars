-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XWindow",
	group = "PreGame",
	id = "ActionBarNew",
	PlaceObj('XTemplateWindow', {
		'Id', "idActionBar",
		'Dock', "bottom",
		'HAlign', "right",
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XFrame",
			'Margins', box(-20, 0, -60, 0),
			'Image', "UI/CommonNew/action_bar.tga",
			'SqueezeY', false,
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XToolBar",
			'Id', "idToolBar",
			'HAlign', "right",
			'VAlign', "bottom",
			'LayoutHSpacing', 60,
			'Background', RGBA(0, 0, 0, 0),
			'Toolbar', "ActionBar",
			'Show', "text",
			'ButtonTemplate', "MenuEntry",
		}),
		}),
})

