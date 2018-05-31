-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "CCC",
	id = "CommandCenterCategories",
	PlaceObj('XTemplateTemplate', {
		'__template', "OverlayDlg",
		'MinWidth', 550,
		'HostInParent', true,
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "CommandCenterTitle",
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XContentTemplateList",
			'Id', "idList",
			'Margins', box(80, 20, 0, 0),
			'BorderWidth', 0,
			'LayoutVSpacing', 16,
			'Clip', false,
			'Background', RGBA(0, 0, 0, 0),
			'FocusedBackground', RGBA(0, 0, 0, 0),
			'ShowPartialItems', false,
		}, {
			PlaceObj('XTemplateForEach', {
				'comment', "categories",
				'array', function (parent, context) return Presets.ColonyControlCenterCategory.Default end,
				'condition', function (parent, context, item, i) return item.filter() end,
				'__context', function (parent, context, item, i, n) return item end,
			}, {
				PlaceObj('XTemplateTemplate', {
					'__template', "MenuEntrySmall",
					'Padding', box(0, 0, 0, 0),
					'HAlign', "right",
					'OnPress', function (self, gamepad)
SetDialogMode(self, self.context.id, self.context)
end,
					'Text', T{583679719179, --[[XTemplate CommandCenterCategories Text]] "<display_name>"},
				}),
				}),
			}),
		PlaceObj('XTemplateAction', {
			'ActionId', "close",
			'ActionName', T{4523, --[[XTemplate CommandCenterCategories ActionName]] "CLOSE"},
			'ActionToolbar', "ActionBar",
			'ActionShortcut', "Escape",
			'ActionGamepad', "ButtonB",
			'OnAction', function (self, host, source, toggled)
CloseCommandCenter()
end,
			'IgnoreRepeated', true,
		}),
		}),
})

