-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XContextControl",
	group = "CCC",
	id = "ColonistOverviewRow",
	PlaceObj('XTemplateTemplate', {
		'__template', "CommandCenterRow",
		'RolloverText', T(699308107676, --[[XTemplate ColonistOverviewRow RolloverText]] "<OverviewInfo>"),
		'RolloverHint', T(115984499466, --[[XTemplate ColonistOverviewRow RolloverHint]] "<left_click><left_click> Select"),
		'RolloverHintGamepad', T(764097870353, --[[XTemplate ColonistOverviewRow RolloverHintGamepad]] "<ButtonA> Select"),
		'OnContextUpdate', function (self, context, ...)
UpdateUICommandCenterRow(self, context, "colonist")
XContextControl.OnContextUpdate(self, context, ...)
end,
	}, {
		PlaceObj('XTemplateWindow', {
			'comment', "name",
			'__class', "XText",
			'Margins', box(10, 0, 0, 0),
			'Padding', box(0, 0, 0, 0),
			'HAlign', "left",
			'VAlign', "center",
			'MinWidth', 200,
			'MaxWidth', 200,
			'TextStyle', "OverviewItemName",
			'Translate', true,
			'Text', T(7412, --[[XTemplate ColonistOverviewRow Text]] "<DisplayName>"),
			'Shorten', true,
		}),
		PlaceObj('XTemplateForEach', {
			'comment', "stats",
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
				'ContextUpdateOnOpen', true,
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XText",
					'Id', "idLabel",
					'Padding', box(0, 0, 0, 0),
					'HAlign', "center",
					'VAlign', "center",
					'FoldWhenHidden', true,
					'TextStyle', "OverviewItemValue",
					'Translate', true,
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XImage",
					'Id', "idNoStat",
					'HAlign', "center",
					'VAlign', "center",
					'Visible', false,
					'FoldWhenHidden', true,
					'Image', "UI/Common/line.tga",
				}),
				}),
			}),
		PlaceObj('XTemplateWindow', {
			'comment', "traits",
			'__class', "XText",
			'Id', "idTraits",
			'Margins', box(30, 0, 0, 0),
			'Padding', box(0, 0, 0, 0),
			'HAlign', "center",
			'VAlign', "center",
			'MinWidth', 480,
			'MaxWidth', 480,
			'FoldWhenHidden', true,
			'TextStyle', "OverviewItemTraits",
			'Translate', true,
			'Text', T(756262261802, --[[XTemplate ColonistOverviewRow Text]] "<UITraitsLine>"),
			'Shorten', true,
		}),
		PlaceObj('XTemplateWindow', {
			'comment', "interests",
			'__class', "XText",
			'Id', "idInterests",
			'Margins', box(30, 0, 0, 0),
			'Padding', box(0, 0, 0, 0),
			'HAlign', "center",
			'VAlign', "center",
			'MinWidth', 480,
			'MaxWidth', 480,
			'Visible', false,
			'FoldWhenHidden', true,
			'TextStyle', "OverviewItemTraits",
			'Translate', true,
			'Text', T(619047486767, --[[XTemplate ColonistOverviewRow Text]] "<UIInterestsLine>"),
			'Shorten', true,
		}),
		}),
})

