-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XTextButton",
	group = "PreGame",
	id = "GameRuleItem",
	PlaceObj('XTemplateWindow', {
		'__class', "XTextButton",
		'RolloverTemplate', "Rollover",
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
		'TextStyle', "PGListItemName",
		'Translate', true,
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'Id', "idRollover",
			'ZOrder', 0,
			'Margins', box(-30, -4, 0, -4),
			'Dock', "box",
			'HAlign', "left",
			'MaxHeight', 32,
			'Visible', false,
			'Image', "UI/CommonNew/pg_selection.tga",
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'Id', "idCheckbox",
			'Margins', box(0, 0, 10, 0),
			'Dock', "left",
			'VAlign', "center",
			'MinWidth', 37,
			'MinHeight', 32,
			'MaxWidth', 37,
			'MaxHeight', 32,
			'FoldWhenHidden', true,
			'Image', "UI/Common/mod_button.tga",
			'ImageFit', "stretch",
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XText",
			'Id', "idName",
			'Padding', box(0, 0, 0, 0),
			'Clip', false,
			'RolloverOnFocus', true,
			'FXMouseIn', "MenuItemHover",
			'FXPress', "MenuItemClick",
			'FXPressDisabled', "UIDisabledButtonPressed",
			'TextStyle', "PGListItemName",
			'Translate', true,
			'Text', T(714247552511, --[[XTemplate GameRuleItem Text]] "<text>"),
			'Shorten', true,
			'TextVAlign', "center",
		}, {
			PlaceObj('XTemplateFunc', {
				'name', "CalcTextColor",
				'func', function (self, ...)
local list = GetDialog(self):ResolveId("idList")
return self.enabled and 
			((self.parent.rollover or (list and list.focused_item == ResolveValue(self.context, "number")))
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

