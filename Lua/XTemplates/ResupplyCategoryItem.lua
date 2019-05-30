-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XTextButton",
	group = "InGame",
	id = "ResupplyCategoryItem",
	PlaceObj('XTemplateWindow', {
		'__class', "XTextButton",
		'RolloverTemplate', "Rollover",
		'RolloverAnchor', "right",
		'Padding', box(15, 0, 0, 0),
		'HAlign', "left",
		'MouseCursor', "UI/Cursors/Rollover.tga",
		'FXMouseIn', "RocketTypeItemHover",
		'FXPress', "RocketTypeItemClick",
		'FXPressDisabled', "UIDisabledButtonPressed",
		'DisabledBackground', RGBA(255, 255, 255, 128),
		'Image', "UI/CommonNew/re_button.tga",
		'Columns', 2,
		'TextStyle', "ResupplyCategory",
		'Translate', true,
		'ColumnsUse', "abaaa",
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XText",
			'Id', "idText",
			'Margins', box(15, 0, 0, 0),
			'Padding', box(0, 0, 0, 0),
			'HAlign', "left",
			'VAlign', "center",
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
		PlaceObj('XTemplateFunc', {
			'name', "SetText(self, text)",
			'func', function (self, text)
				self.Text = text
				self.idText:SetText(text)
			end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "SetSelected(self, selected)",
			'func', function (self, selected)
				self:SetFocus(selected)
			end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnSetFocus",
			'func', function (self, ...)
				XCreateRolloverWindow(self, true)
				XTextButton.OnSetFocus(self, ...)
			end,
		}),
		}),
})

