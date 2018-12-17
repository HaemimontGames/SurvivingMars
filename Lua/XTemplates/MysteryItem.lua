-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XWindow",
	group = "PreGame",
	id = "MysteryItem",
	PlaceObj('XTemplateWindow', {
		'__class', "XTextButton",
		'RolloverTemplate', "Rollover",
		'MaxHeight', 50,
		'Background', RGBA(0, 0, 0, 0),
		'MouseCursor', "UI/Cursors/Rollover.tga",
		'FXMouseIn', "MenuItemHover",
		'FXPress', "MenuItemClick",
		'FXPressDisabled', "UIDisabledButtonPressed",
		'FocusedBackground', RGBA(0, 0, 0, 0),
		'OnPress', function (self, gamepad)
local obj = GetDialogContext(self)
local new_val = self.context.value
SetProperty(obj, "idMystery", new_val)
g_CurrentMissionParams.idMystery = new_val
ObjModified(obj)
SetBackDialogMode(self)
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
			'Margins', box(-45, -4, 0, -4),
			'Dock', "box",
			'HAlign', "left",
			'MaxHeight', 32,
			'Visible', false,
			'Image', "UI/CommonNew/pg_selection.tga",
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'Margins', box(-33, 0, 3, 0),
			'Dock', "left",
			'Image', "UI/Common/mission_yes.tga",
		}, {
			PlaceObj('XTemplateCode', {
				'run', function (self, parent, context)
parent:SetVisible(AccountStorage and AccountStorage.FinishedMysteries and AccountStorage.FinishedMysteries[context.value])
end,
			}),
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
			'Text', T(714247552511, --[[XTemplate MysteryItem Text]] "<text>"),
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
		}),
})

