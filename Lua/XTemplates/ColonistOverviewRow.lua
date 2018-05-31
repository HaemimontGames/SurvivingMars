-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XContextControl",
	group = "CCC",
	id = "ColonistOverviewRow",
	PlaceObj('XTemplateTemplate', {
		'__template', "CommandCenterRow",
		'RolloverText', T{699308107676, --[[XTemplate ColonistOverviewRow RolloverText]] "<OverviewInfo>"},
		'OnContextUpdate', function (self, context, ...)
UpdateUICommandCenterRow(self, context, "colonist")
XContextControl.OnContextUpdate(self, context, ...)
end,
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XText",
			'Margins', box(10, 0, 0, 0),
			'Padding', box(0, 0, 0, 0),
			'HAlign', "left",
			'VAlign', "center",
			'MinWidth', 200,
			'MaxWidth', 200,
			'TextFont', "InfopanelTitle",
			'TextColor', RGBA(255, 248, 233, 255),
			'RolloverTextColor', RGBA(255, 248, 233, 255),
			'Translate', true,
			'Text', T{7412, --[[XTemplate ColonistOverviewRow Text]] "<DisplayName>"},
			'Shorten', true,
		}),
		PlaceObj('XTemplateForEach', {
			'array', function (parent, context) return ColonistStatList end,
			'run_after', function (child, context, item, i, n)
child.OnContextUpdate = function(self, context)
	context:UICommandCenterStatUpdate(self, item)
end
end,
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XContextWindow",
				'IdNode', true,
				'MinWidth', 60,
				'MaxWidth', 60,
				'LayoutMethod', "HList",
				'ContextUpdateOnOpen', true,
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XImage",
					'Id', "idImage",
					'Margins', box(0, 0, 3, 0),
					'VAlign', "center",
					'MinWidth', 27,
					'MaxWidth', 27,
					'ImageFit', "smallest",
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XLabel",
					'Id', "idLabel",
					'Padding', box(0, 0, 0, 0),
					'HAlign', "center",
					'VAlign', "center",
					'TextFont', "InfopanelTitle",
					'TextColor', RGBA(255, 255, 255, 255),
					'RolloverTextColor', RGBA(255, 255, 255, 255),
				}),
				}),
			}),
		PlaceObj('XTemplateWindow', {
			'__class', "XText",
			'Id', "idTraits",
			'Margins', box(30, 0, 0, 0),
			'Padding', box(0, 0, 0, 0),
			'HAlign', "center",
			'VAlign', "center",
			'MinWidth', 370,
			'MaxWidth', 370,
			'FoldWhenHidden', true,
			'TextFont', "InfopanelTitle",
			'TextColor', RGBA(197, 201, 204, 255),
			'RolloverTextColor', RGBA(197, 201, 204, 255),
			'Translate', true,
			'Text', T{756262261802, --[[XTemplate ColonistOverviewRow Text]] "<UITraitsLine>"},
			'Shorten', true,
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XText",
			'Id', "idInterests",
			'Margins', box(30, 0, 0, 0),
			'Padding', box(0, 0, 0, 0),
			'HAlign', "center",
			'VAlign', "center",
			'MinWidth', 370,
			'MaxWidth', 370,
			'Visible', false,
			'FoldWhenHidden', true,
			'TextFont', "InfopanelTitle",
			'TextColor', RGBA(197, 201, 204, 255),
			'RolloverTextColor', RGBA(197, 201, 204, 255),
			'Translate', true,
			'Text', T{619047486767, --[[XTemplate ColonistOverviewRow Text]] "<UIInterestsLine>"},
			'Shorten', true,
		}),
		}),
})

