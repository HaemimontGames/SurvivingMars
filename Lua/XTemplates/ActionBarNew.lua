-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XWindow",
	group = "PreGame",
	id = "ActionBarNew",
	PlaceObj('XTemplateWindow', {
		'Id', "idActionBar",
		'Dock', "bottom",
		'HAlign', "left",
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XFrame",
			'Margins', box(-350, 0, -100, 0),
			'MinWidth', 618,
			'Image', "UI/CommonNew/pg_action_bar.tga",
			'FrameBox', box(42, 0, 341, 0),
			'TileFrame', true,
			'SqueezeY', false,
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XToolBar",
			'Id', "idToolBar",
			'HAlign', "left",
			'VAlign', "center",
			'LayoutHSpacing', 60,
			'Background', RGBA(0, 0, 0, 0),
			'Toolbar', "ActionBar",
			'Show', "text",
			'ButtonTemplate', "MenuEntry",
		}),
		}),
})

