-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XTextButton",
	group = "PreGame",
	id = "MenuEntrySmall",
	PlaceObj('XTemplateWindow', {
		'__class', "XTextButton",
		'Background', RGBA(0, 0, 0, 0),
		'MouseCursor', "UI/Cursors/Rollover.tga",
		'FXMouseIn', "MenuItemHover",
		'FXPress', "MenuItemClick",
		'FXPressDisabled', "UIDisabledButtonPressed",
		'FocusedBackground', RGBA(0, 0, 0, 0),
		'RolloverBackground', RGBA(0, 0, 0, 0),
		'PressedBackground', RGBA(0, 0, 0, 0),
		'TextStyle', "PGListItemName",
		'Translate', true,
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XText",
			'Id', "idText",
			'Padding', box(0, 0, 0, 0),
			'Translate', true,
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
			PlaceObj('XTemplateFunc', {
				'name', "Open",
				'func', function (self, ...)
					self:SetTextStyle(self.parent.TextStyle)
					XText.Open(self, ...)
				end,
			}),
			}),
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'Id', "idRollover",
			'ZOrder', 0,
			'Margins', box(-35, -3, 0, -5),
			'Dock', "box",
			'HAlign', "left",
			'MaxHeight', 32,
			'Visible', false,
			'Image', "UI/CommonNew/pg_selection.tga",
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnSetFocus",
			'func', function (self, ...)
				XCreateRolloverWindow(self, true)
				XTextButton.OnSetFocus(self, ...)
			end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "SetSelected(self, selected)",
			'func', function (self, selected)
				self:SetFocus(selected)
			end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "SetText(self, text)",
			'func', function (self, text)
				self.Text = text
				self.idText:SetText(text)
			end,
		}),
		}),
})

