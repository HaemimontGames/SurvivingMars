-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XScrollThumb",
	group = "Default",
	id = "ScrollbarNew",
	PlaceObj('XTemplateWindow', {
		'__class', "XScrollThumb",
		'ZOrder', 10,
		'Padding', box(5, 0, 5, 0),
		'Dock', "right",
		'MinWidth', 18,
		'MaxWidth', 18,
		'Visible', false,
		'FoldWhenHidden', false,
		'MouseCursor', "UI/Cursors/Rollover.tga",
		'FullPageAtEnd', true,
		'SnapToItems', true,
		'AutoHide', true,
		'MinThumbSize', 30,
		'FixedSizeThumb', false,
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XFrame",
			'Dock', "box",
			'Image', "UI/CommonNew/scrollbar_line.tga",
			'FrameBox', box(0, 5, 0, 5),
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XFrame",
			'Id', "idThumb",
			'Image', "UI/CommonNew/scrollbar.tga",
			'ImageScale', point(400, 400),
			'FrameBox', box(0, 10, 0, 10),
			'SqueezeX', false,
		}),
		}),
})

