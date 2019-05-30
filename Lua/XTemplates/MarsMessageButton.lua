-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XTextButton",
	group = "Default",
	id = "MarsMessageButton",
	PlaceObj('XTemplateWindow', {
		'__class', "XTextButton",
		'RolloverTemplate', "Rollover",
		'RolloverAnchor', "bottom",
		'MinHeight', 70,
		'Background', RGBA(0, 0, 0, 0),
		'MouseCursor', "UI/Cursors/Rollover.tga",
		'RelativeFocusOrder', "new-line",
		'OnContextUpdate', function (self, context, ...)
			self.idText:SetZOrder(2)
		end,
		'FXMouseIn', "PopupChoiceHover",
		'FXPress', "PopupChoiceClick",
		'FocusedBackground', RGBA(0, 0, 0, 0),
		'RolloverBackground', RGBA(0, 0, 0, 0),
		'PressedBackground', RGBA(0, 0, 0, 0),
		'Translate', true,
	}, {
		PlaceObj('XTemplateFunc', {
			'name', "SetText",
			'func', function (self, ...)
				self.idText:SetText(...)
			end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "SetSelected(self, selected)",
			'func', function (self, selected)
				if GetUIStyleGamepad() or (self.context and self.context.force_ui_style == "gamepad") then
					self:SetFocus(selected)
					self.idGamepadSelectedIcon:SetVisible(selected)
					self.idGamepadButtonIcon:SetVisible(not selected)
					local current = self.idButtonIcon:GetImage()
					self.idButtonIcon:SetImage(self.idButtonSelectedIcon:GetImage())
					self.idButtonSelectedIcon:SetImage(current)
				end
			end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "IsSelectable",
			'func', function (self, ...)
				return self:GetEnabled()
			end,
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'Id', "idButtonIcon",
			'IdNode', false,
			'ZOrder', 2,
			'Shape', "InEllipse",
			'Dock', "left",
			'HandleMouse', true,
			'Image', "UI/CommonNew/message_1.tga",
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XImage",
				'Id', "idRollover",
				'IdNode', false,
				'Margins', box(-3, -3, -3, -3),
				'Dock', "box",
				'Visible', false,
				'Image', "UI/CommonNew/message_number_highlight.tga",
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XImage",
				'Id', "idGamepadButtonIcon",
				'IdNode', false,
				'Dock', "box",
				'HAlign', "center",
				'VAlign', "center",
				'ScaleModifier', point(450, 450),
				'Visible', false,
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XImage",
				'Id', "idGamepadSelectedIcon",
				'IdNode', false,
				'Dock', "box",
				'HAlign', "center",
				'VAlign', "center",
				'ScaleModifier', point(450, 450),
				'Visible', false,
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XImage",
				'Id', "idButtonSelectedIcon",
				'IdNode', false,
				'Visible', false,
				'Image', "UI/CommonNew/message_1.tga",
			}),
			}),
		PlaceObj('XTemplateWindow', {
			'__class', "XText",
			'Id', "idText",
			'Margins', box(-5, 0, 20, 0),
			'Padding', box(0, 10, 10, 10),
			'HAlign', "left",
			'VAlign', "center",
			'TextStyle', "MessageChoice",
			'Translate', true,
		}, {
			PlaceObj('XTemplateFunc', {
				'name', "CalcTextColor",
				'func', function (self, ...)
					return self.enabled and 
									(self.parent.rollover and self.RolloverTextColor or self.TextColor)
									or self.DisabledTextColor
				end,
			}),
			}),
		}),
})

