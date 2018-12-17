-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Default",
	id = "XMarsAutosaveScreen",
	PlaceObj('XTemplateWindow', {
		'__class', "MarsAutosaveScreen",
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XAspectWindow",
			'Fit', "smallest",
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XImage",
				'Margins', box(0, 0, 130, 90),
				'HAlign', "right",
				'VAlign', "bottom",
				'Image', "UI/loading_anim.tga",
				'Columns', 30,
				'Animate', true,
				'FPS', 12,
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XFrame",
				'Padding', box(90, 20, 90, 20),
				'HAlign', "center",
				'VAlign', "center",
				'Image', "UI/CommonNew/autosaving.tga",
				'FrameBox', box(40, 40, 40, 40),
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XText",
					'HandleMouse', false,
					'TextStyle', "Autosave",
					'Translate', true,
					'Text', T(4252, --[[XTemplate XMarsAutosaveScreen Text]] "Autosaving..."),
					'TextHAlign', "center",
				}),
				}),
			}),
		}),
})

