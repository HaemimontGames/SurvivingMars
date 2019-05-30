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
				'comment', "MM Video player base game",
				'__condition', function (parent, context) return not IsDlcAvailable("armstrong") end,
				'__class', "XVideo",
				'VideoDefId', "Movies_Main Menu.avi",
				'Looping', true,
				'AutoPlay', true,
			}),
			PlaceObj('XTemplateWindow', {
				'comment', "MM Video player armstrong",
				'__condition', function (parent, context) return IsDlcAvailable("armstrong") end,
				'__class', "XVideo",
				'VideoDefId', "MainMenu_Armstrong",
				'Looping', true,
				'AutoPlay', true,
			}),
			}),
		}),
})

