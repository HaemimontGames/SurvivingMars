-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Default",
	id = "RolloverBackground",
	PlaceObj('XTemplateWindow', {
		'comment', "frame",
		'Dock', "box",
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'Dock', "top",
			'Image', "UI/Common/rollover_up_a.tga",
			'ImageFit', "stretch-x",
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'Dock', "bottom",
			'Image', "UI/Common/rollover_down_a.tga",
			'ImageFit', "stretch-x",
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'Dock', "box",
			'Image', "UI/Common/rollover_middle_a.tga",
			'ImageFit', "stretch",
		}),
		}),
	PlaceObj('XTemplateWindow', {
		'comment', "watermark",
		'Dock', "box",
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'Dock', "top",
			'Image', "UI/Common/rollover_watermark_2.tga",
			'ImageFit', "stretch-x",
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'Dock', "bottom",
			'Image', "UI/Common/rollover_watermark_2.tga",
			'ImageFit', "stretch-x",
			'Angle', 10800,
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XFrame",
			'Dock', "box",
			'Image', "UI/Common/rollover_watermark.tga",
			'TileFrame', true,
		}),
		}),
})

