-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XWindow",
	group = "PreGame",
	id = "TutorialContentWindow",
	PlaceObj('XTemplateWindow', {
		'HAlign', "right",
		'MinWidth', 550,
		'MinHeight', 550,
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XContentTemplateList",
			'Id', "idList",
			'Margins', box(0, 40, 0, 40),
			'BorderWidth', 0,
			'Dock', "top",
			'LayoutVSpacing', 16,
			'UniformRowHeight', true,
			'Clip', false,
			'Background', RGBA(0, 0, 0, 0),
			'FocusedBackground', RGBA(0, 0, 0, 0),
			'VScroll', "idScroll",
			'ShowPartialItems', false,
			'MouseScroll', true,
			'RespawnOnContext', false,
		}, {
			PlaceObj('XTemplateAction', {
				'ActionId', "close",
				'ActionName', T(4523, --[[XTemplate TutorialContentWindow ActionName]] "CLOSE"),
				'ActionToolbar', "ActionBar",
				'ActionShortcut', "Escape",
				'ActionGamepad', "ButtonB",
				'OnActionEffect', "back",
			}),
			PlaceObj('XTemplateForEach', {
				'array', function (parent, context) return Presets.TutorialPreset.Default end,
				'__context', function (parent, context, item, i, n) return item end,
			}, {
				PlaceObj('XTemplateWindow', {
					'IdNode', true,
				}, {
					PlaceObj('XTemplateFunc', {
						'name', "SetSelected",
						'func', function (self, ...)
self.idbutton:SetSelected(...)
end,
					}),
					PlaceObj('XTemplateWindow', {
						'__class', "XImage",
						'Dock', "right",
						'HAlign', "right",
						'Image', "UI/Common/mission_yes.tga",
					}, {
						PlaceObj('XTemplateCode', {
							'run', function (self, parent, context)
parent:SetVisible(AccountStorage and AccountStorage.CompletedTutorials and AccountStorage.CompletedTutorials[context.id])
end,
						}),
						}),
					PlaceObj('XTemplateTemplate', {
						'__template', "MenuEntrySmall",
						'RolloverTemplate', "Rollover",
						'RolloverText', T(463510675096, --[[XTemplate TutorialContentWindow RolloverText]] "<description>"),
						'RolloverTitle', T(384759114882, --[[XTemplate TutorialContentWindow RolloverTitle]] "<display_name>"),
						'Id', "idbutton",
						'Padding', box(0, 0, 0, 0),
						'Dock', "right",
						'HAlign', "right",
						'OnPress', function (self, gamepad)
CreateRealTimeThread(StartTutorial, self.context.id)
end,
						'Text', T(175928588179, --[[XTemplate TutorialContentWindow Text]] "<display_name>"),
					}),
					}),
				}),
			}),
		PlaceObj('XTemplateTemplate', {
			'__template', "Scrollbar",
			'Id', "idScroll",
			'Target', "idList",
		}),
		}),
})

