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
				'Padding', box(90, 0, 90, 0),
				'HAlign', "center",
				'VAlign', "center",
				'Image', "UI/Common/rollover_tiny_a.tga",
				'FrameBox', box(20, 0, 20, 0),
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XText",
					'HandleMouse', false,
					'TextFont', "AutosaveText",
					'TextColor', RGBA(255, 255, 255, 255),
					'ShadowType', "outline",
					'ShadowSize', 2,
					'ShadowColor', RGBA(0, 0, 0, 255),
					'Translate', true,
					'Text', T{4252, --[[XTemplate XMarsAutosaveScreen Text]] "Autosaving..."},
					'TextHAlign', "center",
				}),
				}),
			}),
		}),
})

