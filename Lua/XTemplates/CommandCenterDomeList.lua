-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XContentTemplateList",
	group = "CCC",
	id = "CommandCenterDomeList",
	PlaceObj('XTemplateWindow', {
		'__class', "XContentTemplateList",
		'Id', "idList",
		'BorderWidth', 0,
		'Padding', box(0, 0, 0, 0),
		'LayoutVSpacing', 16,
		'UniformRowHeight', true,
		'Clip', false,
		'Background', RGBA(0, 0, 0, 0),
		'FocusedBackground', RGBA(0, 0, 0, 0),
		'VScroll', "idScroll",
		'ShowPartialItems', false,
		'MouseScroll', true,
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "MenuEntrySmall",
			'OnPress', function (self, gamepad)
				local dlg = GetDialog(self)
				dlg.context.dome = nil
				SetBackDialogMode(self)
			end,
			'Text', T(596159635934, --[[XTemplate CommandCenterDomeList Text]] "Entire Colony"),
		}),
		PlaceObj('XTemplateForEach', {
			'comment', "domes",
			'array', function (parent, context) return GetCommandCenterDomesList() end,
			'__context', function (parent, context, item, i, n) return item end,
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "MenuEntrySmall",
				'OnPress', function (self, gamepad)
					local dlg = GetDialog(self)
					dlg.context.dome = self.context
					SetBackDialogMode(self)
				end,
				'Text', T(7412, --[[XTemplate CommandCenterDomeList Text]] "<DisplayName>"),
			}),
			}),
		PlaceObj('XTemplateAction', {
			'ActionId', "back",
			'ActionName', T(4254, --[[XTemplate CommandCenterDomeList ActionName]] "BACK"),
			'ActionToolbar', "ActionBar",
			'ActionShortcut', "Escape",
			'ActionGamepad', "ButtonB",
			'OnActionEffect', "back",
		}),
		}),
	PlaceObj('XTemplateCode', {
		'run', function (self, parent, context)
			parent:ResolveId("idScroll"):SetMargins(box(99,0,0,0))
		end,
	}),
})

