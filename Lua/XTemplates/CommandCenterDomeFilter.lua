-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XTextButton",
	group = "CCC",
	id = "CommandCenterDomeFilter",
	PlaceObj('XTemplateWindow', {
		'__class', "XTextButton",
		'RolloverTemplate', "Rollover",
		'RolloverAnchor', "left",
		'RolloverTitle', T{1234, --[[XTemplate CommandCenterDomeFilter RolloverTitle]] "Dome"},
		'RolloverHint', T{797025539601, --[[XTemplate CommandCenterDomeFilter RolloverHint]] "<left_click> Set filter"},
		'Margins', box(0, 0, 20, 0),
		'VAlign', "center",
		'ScaleModifier', point(700, 700),
		'Background', RGBA(0, 0, 0, 0),
		'RolloverZoom', 1100,
		'RolloverDrawOnTop', true,
		'MouseCursor', "UI/Cursors/Rollover.tga",
		'RelativeFocusOrder', "next-in-line",
		'OnContextUpdate', function (self, context, ...)
XTextButton.OnContextUpdate(self, context, ...)
self:SetRolloverText(GetDomeFilterRolloverText(self))
self.idDomeName:SetText(context.dome and context.dome:GetDisplayName() or T{596159635934, "Entire Colony"})
local hint_gamepad = T{238409413444, "<ButtonA> Set filter"} .. " " .. T{9802, "<RB> Inspect"}
self:SetRolloverHintGamepad(hint_gamepad)
end,
		'FXMouseIn', "MenuItemHover",
		'FXPress', "MenuItemClick",
		'FXPressDisabled', "UIDisabledButtonPressed",
		'FocusedBackground', RGBA(0, 0, 0, 0),
		'OnPress', function (self, gamepad)
local dlg = GetDialog(self)
dlg:SetMode("domes")
end,
		'RolloverBackground', RGBA(0, 0, 0, 0),
		'PressedBackground', RGBA(0, 0, 0, 0),
		'ColumnsUse', "abbba",
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'IdNode', false,
			'ZOrder', 2,
			'Shape', "InHHex",
			'Dock', "left",
			'MinWidth', 72,
			'MinHeight', 84,
			'MaxWidth', 72,
			'MaxHeight', 84,
			'HandleMouse', true,
			'Image', "UI/Icons/ColonyControlCenter/dome.tga",
			'ImageFit', "smallest",
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XImage",
				'Id', "idRollover",
				'IdNode', false,
				'Margins', box(-7, -7, -7, -7),
				'Dock', "box",
				'Visible', false,
				'Image', "UI/Common/Hex_small_shine.tga",
				'ImageFit', "smallest",
			}),
			}),
		PlaceObj('XTemplateWindow', {
			'__class', "XText",
			'Id', "idDomeName",
			'Margins', box(6, 0, 0, 0),
			'Padding', box(0, 0, 0, 0),
			'VAlign', "center",
			'MinWidth', 180,
			'MinHeight', 40,
			'MaxWidth', 180,
			'MaxHeight', 40,
			'ScaleModifier', point(1450, 1450),
			'HandleMouse', false,
			'TextFont', "PGLogo",
			'TextColor', RGBA(255, 255, 255, 255),
			'ContextUpdateOnOpen', true,
			'Translate', true,
			'Shorten', true,
		}),
		}),
})

