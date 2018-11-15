-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Default",
	id = "PinButton",
	PlaceObj('XTemplateWindow', {
		'__class', "XBlinkingButtonWithRMB",
		'RolloverTemplate', "PinRollover",
		'RolloverAnchor', "top",
		'Shape', "InHHex",
		'HAlign', "center",
		'VAlign', "center",
		'LayoutMethod', "Box",
		'Background', RGBA(0, 0, 0, 0),
		'RolloverZoom', 1200,
		'MouseCursor', "UI/Cursors/Rollover.tga",
		'RelativeFocusOrder', "next-in-line",
		'FXMouseIn', "UIButtonMouseIn",
		'FXPress', "UIButtonPressed",
		'FXPressDisabled', "UIDisabledButtonPressed",
		'FocusedBackground', RGBA(0, 0, 0, 0),
		'RolloverBackground', RGBA(0, 0, 0, 0),
		'PressedBackground', RGBA(0, 0, 0, 0),
		'Icon', "UI/Icons/bmb_demo.tga",
		'IconScale', point(650, 650),
		'ColumnsUse', "abbba",
	}, {
		PlaceObj('XTemplateFunc', {
			'name', "OnSetRollover(self, rollover)",
			'func', function (self, rollover)
--achieve proper highlighting of pin btn - highlight when interacting with it, zoom-in in other cases
XBlinkingButton.OnSetRollover(self, rollover)
local kb_focus = self.desktop:GetKeyboardFocus()
local focus_within = kb_focus and kb_focus:IsWithin(self)
local mouse_pos = self.desktop.last_mouse_pos
local mouse_over = mouse_pos and self:MouseInWindow(mouse_pos)
if not (focus_within or mouse_over) and not self.blinking then
	self.idRollover:SetVisible(false)
end
end,
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'Id', "idSpecialization",
			'ZOrder', 2,
			'Dock', "box",
			'ImageFit', "stretch",
			'Columns', 2,
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'Id', "idRollover",
			'Margins', box(-5, -5, -5, -5),
			'Visible', false,
			'FadeInTime', 100,
			'FadeOutTime', 100,
			'Image', "UI/Common/Hex_small_shine_2.tga",
			'ImageFit', "stretch",
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'Id', "idCondition",
			'Margins', box(0, -11, 5, 0),
			'HAlign', "right",
			'VAlign', "top",
			'Image', "UI/Icons/pin_drone.tga",
		}),
		PlaceObj('XTemplateWindow', {
			'__condition', function (parent, context) return context.pin_progress_value ~= "" end,
			'__class', "XFrameProgress",
			'Id', "idProgress",
			'Margins', box(0, 0, 0, -3),
			'HAlign', "center",
			'VAlign', "bottom",
			'MinWidth', 42,
			'MaxWidth', 42,
			'Image', "UI/Infopanel/progress_bar.tga",
			'FrameBox', box(5, 0, 5, 0),
			'BindTo', "PinProgress",
			'MinProgressSize', 8,
			'ProgressImage', "UI/Infopanel/progress_bar_green.tga",
			'ProgressFrameBox', box(4, 0, 4, 0),
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'Id', "idTextBackground",
			'HAlign', "center",
			'VAlign', "bottom",
			'Image', "UI/Common/pin_shadow.tga",
			'ImageFit', "stretch-y",
			'ImageScale', point(650, 650),
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XText",
				'Id', "idText",
				'Margins', box(0, 23, 0, 0),
				'HAlign', "center",
				'VAlign', "bottom",
				'TextStyle', "PinStat",
				'Translate', true,
				'Text', T{415232371915, --[[XTemplate PinButton Text]] "<PinSummary>"},
				'HideOnEmpty', true,
				'TextHAlign', "center",
			}),
			}),
		}),
})

