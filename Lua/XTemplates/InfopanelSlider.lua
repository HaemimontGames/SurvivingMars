-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XScrollControl",
	group = "Infopanel",
	id = "InfopanelSlider",
	PlaceObj('XTemplateWindow', {
		'__class', "XScrollThumb",
		'Margins', box(0, 16, 0, 16),
		'MouseCursor', "UI/Cursors/Rollover.tga",
		'Horizontal', true,
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XFrame",
			'ZOrder', 0,
			'Image', "UI/Infopanel/progress_bar.tga",
			'FrameBox', box(5, 0, 5, 0),
			'SqueezeY', false,
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'Id', "idThumb",
			'Image', "UI/Infopanel/progress_bar_slider.tga",
		}),
		}),
})

