-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XWindow",
	group = "Default",
	id = "MarsEdit",
	PlaceObj('XTemplateWindow', {
		'Dock', "top",
		'HAlign', "center",
		'MinWidth', 308,
		'MinHeight', 46,
		'MaxWidth', 308,
		'MaxHeight', 46,
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XFrame",
			'Image', "UI/Common/rollover_tiny.tga",
			'FrameBox', box(20, 0, 20, 0),
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XEdit",
			'Id', "idEdit",
			'Margins', box(20, 0, 20, 0),
			'BorderWidth', 0,
			'VAlign', "center",
			'Background', RGBA(0, 0, 0, 0),
			'FocusedBackground', RGBA(0, 0, 0, 0),
			'TextFont', "ParadoxEdit",
			'TextColor', RGBA(83, 131, 161, 255),
			'RolloverTextColor', RGBA(83, 131, 161, 255),
			'MaxLen', 22,
			'AutoSelectAll', true,
			'NegFilter', "<>",
			'SelectionBackground', RGBA(255, 255, 255, 255),
			'SelectionColor', RGBA(0, 0, 0, 255),
		}),
		}),
})

