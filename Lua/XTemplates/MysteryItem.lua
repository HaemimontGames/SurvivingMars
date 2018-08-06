-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XWindow",
	group = "PreGame",
	id = "MysteryItem",
	PlaceObj('XTemplateWindow', {
		'__class', "XTextButton",
		'RolloverTemplate', "Rollover",
		'Padding', box(0, 2, 0, 2),
		'HAlign', "right",
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
			'Dock', "right",
			'HAlign', "right",
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
			'Text', T{714247552511, --[[XTemplate MysteryItem Text]] "<text>"},
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

