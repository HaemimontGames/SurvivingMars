-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "InGame",
	id = "GamepadCheatsDlg",
	PlaceObj('XTemplateTemplate', {
		'__template', "OverlayDlg",
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XLabel",
			'Dock', "top",
			'HAlign', "right",
			'TextStyle', "OverlayTitle",
			'Translate', true,
			'Text', T{554083515055, --[[XTemplate GamepadCheatsDlg Text]] "CHEATS"},
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XFrame",
			'Margins', box(-80, 6, -160, -100),
			'Dock', "top",
			'VAlign', "top",
			'Image', "UI/Common/bm_pad_small.tga",
			'FrameBox', box(170, 0, 170, 0),
			'SqueezeY', false,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "close",
			'ActionName', T{4523, --[[XTemplate GamepadCheatsDlg ActionName]] "CLOSE"},
			'ActionToolbar', "ActionBar",
			'ActionShortcut', "Escape",
			'ActionGamepad', "ButtonB",
			'OnActionEffect', "close",
		}),
		PlaceObj('XTemplateWindow', {
			'__context', function (parent, context) return Music end,
			'__class', "XContentTemplateList",
			'Id', "idList",
			'BorderWidth', 0,
			'LayoutVSpacing', 6,
			'Clip', false,
			'Background', RGBA(0, 0, 0, 0),
			'FocusedBackground', RGBA(0, 0, 0, 0),
			'OnContextUpdate', function (self, context, ...)
XContentTemplate.OnContextUpdate(self, context, ...)
if self.focused_item then
	self:DeleteThread("select")
	self:CreateThread("select", function()
		self:SetSelection(self.focused_item)
	end)
end
end,
		}, {
			PlaceObj('XTemplateForEach', {
				'comment', "gamepad cheats",
				'array', function (parent, context) return GamepadCheatsList end,
				'__context', function (parent, context, item, i, n) return item end,
			}, {
				PlaceObj('XTemplateTemplate', {
					'__template', "MenuEntrySmall",
					'HAlign', "right",
					'OnPress', function (self, gamepad)
self.context.func()
end,
					'TextColor', RGBA(221, 215, 170, 255),
					'Text', T{867595017482, --[[XTemplate GamepadCheatsDlg Text]] "<display_name>"},
				}),
				}),
			}),
		}),
})

