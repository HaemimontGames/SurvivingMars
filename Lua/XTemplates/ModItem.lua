-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XTextButton",
	group = "PreGame",
	id = "ModItem",
	PlaceObj('XTemplateWindow', {
		'__class', "XTextButton",
		'Margins', box(18, 0, 0, 0),
		'Background', RGBA(0, 0, 0, 0),
		'MouseCursor', "UI/Cursors/Rollover.tga",
		'FXMouseIn', "MenuItemHover",
		'FXPress', "MenuItemClick",
		'FXPressDisabled', "UIDisabledButtonPressed",
		'FocusedBackground', RGBA(0, 0, 0, 0),
		'OnPress', function (self, gamepad)
			if not self.context.corrupted then
				local id = self.context.id
				local state = ToggleLoadMod(id)
				self.idCheckbox:SetImage(GetCheckboxImage(state))
			end
		end,
		'RolloverBackground', RGBA(0, 0, 0, 0),
		'PressedBackground', RGBA(0, 0, 0, 0),
		'TextStyle', "ListItem3",
		'Translate', true,
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'Id', "idRollover",
			'ZOrder', 0,
			'Margins', box(-12, -10, 0, -10),
			'Dock', "box",
			'HAlign', "left",
			'Visible', false,
			'Image', "UI/CommonNew/pg_selection.tga",
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'Id', "idCheckbox",
			'Dock', "left",
			'HAlign', "left",
			'VAlign', "center",
			'MinWidth', 40,
			'MinHeight', 34,
			'MaxWidth', 40,
			'MaxHeight', 34,
			'Visible', false,
			'Image', "UI/Common/mod_button.tga",
			'ImageFit', "stretch",
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'Id', "idCorrupted",
			'Margins', box(-40, 0, 0, 0),
			'Dock', "left",
			'HAlign', "left",
			'VAlign', "center",
			'MinWidth', 40,
			'MinHeight', 34,
			'MaxWidth', 40,
			'MaxHeight', 34,
			'Visible', false,
			'Image', "UI/Common/mod_problem.tga",
			'ImageFit', "stretch",
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XText",
			'Id', "idValue",
			'Padding', box(2, 0, 0, 0),
			'HAlign', "left",
			'VAlign', "center",
			'Clip', false,
			'RolloverOnFocus', true,
			'FXMouseIn', "MenuItemHover",
			'FXPress', "MenuItemClick",
			'FXPressDisabled', "UIDisabledButtonPressed",
			'Translate', true,
			'Shorten', true,
		}, {
			PlaceObj('XTemplateFunc', {
				'name', "CalcTextColor",
				'func', function (self, ...)
					return self.enabled and 
								((self.parent.rollover or self.parent.parent:ResolveId("idList").focused_item == self.context.number)
									and self.RolloverTextColor or self.TextColor)
									or self.DisabledTextColor
				end,
			}),
			PlaceObj('XTemplateFunc', {
				'name', "Open",
				'func', function (self, ...)
					self:SetTextStyle(self.parent.TextStyle)
					XText.Open(self, ...)
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
				local context = self.context
				if not context.corrupted then
					local state = table.find(AccountStorage.LoadMods, context.id)
					self.idCheckbox:SetImage(GetCheckboxImage(state))
				end
			end,
		}),
		}),
})

