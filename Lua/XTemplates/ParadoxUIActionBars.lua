-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XContentTemplate",
	group = "Paradox",
	id = "ParadoxUIActionBars",
	PlaceObj('XTemplateWindow', {
		'__class', "XContentTemplate",
		'IdNode', false,
		'Dock', "bottom",
	}, {
		PlaceObj('XTemplateWindow', {
			'comment', "action bars",
			'__condition', function (parent, context) return GetUIStyleGamepad() end,
			'Margins', box(0, 20, 0, 0),
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XFrame",
				'Image', "UI/Mods/Circle32Black.tga",
				'ImageScale', point(500, 500),
				'FrameBox', box(15, 15, 15, 15),
				'SqueezeX', false,
				'SqueezeY', false,
			}),
			PlaceObj('XTemplateWindow', {
				'Padding', box(60, 0, 60, 0),
			}, {
				PlaceObj('XTemplateTemplate', {
					'__template', "ParadoxUIToolbar",
					'Id', "idActionBarLeft",
					'HAlign', "left",
					'FoldWhenHidden', true,
					'Toolbar', "ActionBarLeft",
				}),
				PlaceObj('XTemplateTemplate', {
					'__template', "ParadoxUIToolbar",
					'Id', "idActionBarRight",
					'HAlign', "right",
					'FoldWhenHidden', true,
					'Toolbar', "ActionBarRight",
				}),
				}),
			}),
		}),
})

