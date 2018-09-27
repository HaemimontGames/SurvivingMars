-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XTextButton",
	group = "PreGame",
	id = "GameRuleItem",
	PlaceObj('XTemplateWindow', {
		'__class', "XTextButton",
		'RolloverTemplate', "Rollover",
		'Padding', box(0, 2, 0, 2),
		'HAlign', "right",
		'MaxHeight', 50,
		'Background', RGBA(0, 0, 0, 0),
		'MouseCursor', "UI/Cursors/Rollover.tga",
		'OnContextUpdate', function (self, context, ...)
self:UpdateImage()
end,
		'FXMouseIn', "MenuItemHover",
		'FXPress', "MenuItemClick",
		'FXPressDisabled', "UIDisabledButtonPressed",
		'FocusedBackground', RGBA(0, 0, 0, 0),
		'OnPress', function (self, gamepad)
local id = self.context.value
ToggleGameRule(id, self.parent)
self:UpdateImage()
end,
		'RolloverBackground', RGBA(0, 0, 0, 0),
		'PressedBackground', RGBA(0, 0, 0, 0),
		'TextFont', "PGListItem",
		'TextColor', RGBA(140, 156, 178, 255),
		'RolloverTextColor', RGBA(255, 255, 255, 255),
		'DisabledTextColor', RGBA(114, 114, 114, 255),
		'Translate', true,
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'Id', "idRollover",
			'ZOrder', 0,
			'Margins', box(-60, 0, -60, -6),
			'Dock', "box",
			'Visible', false,
			'Image', "UI/Common/bm_buildings_pad.tga",
			'ImageFit', "stretch",
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'Id', "idCheckbox",
			'Margins', box(10, 0, 0, 0),
			'Dock', "right",
			'HAlign', "center",
			'VAlign', "center",
			'MinWidth', 40,
			'MinHeight', 34,
			'MaxWidth', 40,
			'MaxHeight', 34,
			'FoldWhenHidden', true,
			'Image', "UI/Common/mod_button.tga",
			'ImageFit', "stretch",
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XText",
			'Id', "idName",
			'Padding', box(0, 2, 0, 2),
			'Dock', "right",
			'Clip', false,
			'RolloverOnFocus', true,
			'FXMouseIn', "MenuItemHover",
			'FXPress', "MenuItemClick",
			'FXPressDisabled', "UIDisabledButtonPressed",
			'TextFont', "PGListItem",
			'TextColor', RGBA(221, 215, 170, 255),
			'RolloverTextColor', RGBA(255, 255, 255, 255),
			'DisabledTextColor', RGBA(114, 114, 114, 255),
			'Translate', true,
			'Text', T{714247552511, --[[XTemplate GameRuleItem Text]] "<text>"},
			'Shorten', true,
		}, {
			PlaceObj('XTemplateFunc', {
				'name', "CalcTextColor",
				'func', function (self, ...)
return self.enabled and 
			((self.parent.rollover or GetDialog(self).idList.focused_item == self.context.number)
				and self.RolloverTextColor or self.TextColor)
				or self.DisabledTextColor
end,
			}),
			}),
		PlaceObj('XTemplateFunc', {
			'name', "OnSetFocus",
			'func', function (self, ...)
XCreateRolloverWindow(self, true)
XTextButton.OnSetFocus(self, ...)
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnXButtonDown",
			'func', function (self, ...)
local button = ...
if button == "ButtonA" then
	return self:OnButtonDown(false)
end
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnXButtonUp",
			'func', function (self, ...)
local button = ...
if button == "ButtonA" then
	return self:OnButtonUp(false)
end
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnShortcut(self, shortcut, source)",
			'func', function (self, shortcut, source)
if shortcut == "Enter" or shortcut == "Space" or shortcut == "ButtonA" then
	self:Press(false)
	return "break"
end
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "SetSelected(self, selected)",
			'func', function (self, selected)
self:SetFocus(selected)
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "UpdateImage",
			'func', function (self, ...)
local id = self.context.value
self.idCheckbox:SetImage(GetCheckboxImage(g_CurrentMissionParams.idGameRules[id]))
end,
		}),
		}),
})

