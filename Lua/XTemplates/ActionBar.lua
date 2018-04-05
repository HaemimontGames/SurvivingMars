-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XWindow",
	group = "PreGame",
	id = "ActionBar",
	PlaceObj('XTemplateWindow', {
		'Id', "idActionBar",
		'Dock', "bottom",
		'HAlign', "right",
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XFrame",
			'Margins', box(-340, -70, -40, -10),
			'Image', "UI/Common/pm_pad_large.tga",
			'FrameBox', box(320, 0, 40, 0),
			'SqueezeY', false,
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XToolBar",
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

