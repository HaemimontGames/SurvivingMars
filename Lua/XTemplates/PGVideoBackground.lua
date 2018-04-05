-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XLayer",
	group = "Layers",
	id = "PGVideoBackground",
	PlaceObj('XTemplateWindow', {
		'__class', "XLayer",
		'ZOrder', -1,
		'Background', RGBA(0, 0, 0, 255),
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XAspectWindow",
			'Fit', "smallest",
		}, {
			PlaceObj('XTemplateWindow', {
				'comment', "MM Video player",
				'__class', "XVideo",
				'FileName', "Movies/Main Menu",
				'Looping', true,
				'AutoPlay', true,
			}),
			}),
		}),
})

