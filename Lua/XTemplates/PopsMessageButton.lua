-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Default",
	id = "PopsMessageButton",
	PlaceObj('XTemplateWindow', {
		'__class', "XTextButton",
		'RolloverTemplate', "Rollover",
		'RolloverAnchor', "bottom",
		'Padding', box(0, 0, 50, 0),
		'MaxHeight', 45,
		'Background', RGBA(0, 0, 0, 0),
		'MouseCursor', "UI/Cursors/Rollover.tga",
		'RelativeFocusOrder', "new-line",
		'OnContextUpdate', function (self, context, ...)
self.idText:SetZOrder(2)
end,
		'FXMouseIn', "PopupChoiceHover",
		'FXPress', "PopupChoiceClick",
		'FocusedBackground', RGBA(235, 235, 235, 255),
		'RolloverBackground', RGBA(235, 235, 235, 255),
		'PressedBackground', RGBA(235, 235, 235, 255),
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
end
end,
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'IdNode', false,
			'ZOrder', 2,
			'Shape', "InHHex",
			'Dock', "left",
			'MinWidth', 50,
			'MinHeight', 43,
			'MaxWidth', 50,
			'MaxHeight', 43,
			'HandleMouse', true,
			'ImageFit', "smallest",
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XImage",
				'Id', "idGamepadButtonIcon",
				'IdNode', false,
				'Dock', "box",
				'HAlign', "center",
				'VAlign', "center",
				'MaxWidth', 30,
				'MaxHeight', 30,
				'Visible', false,
				'ImageFit', "smallest",
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XImage",
				'Id', "idGamepadSelectedIcon",
				'IdNode', false,
				'Dock', "box",
				'HAlign', "center",
				'VAlign', "center",
				'MaxWidth', 30,
				'MaxHeight', 30,
				'Visible', false,
				'ImageFit', "smallest",
			}),
			}),
		PlaceObj('XTemplateWindow', {
			'__class', "XLabel",
			'Id', "idNumber",
			'HAlign', "left",
			'VAlign', "center",
			'TextFont', "ModsUISortText",
			'TextColor', RGBA(0, 0, 0, 255),
			'DisabledTextColor', RGBA(196, 196, 196, 255),
			'ShadowSize', 0,
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
		PlaceObj('XTemplateWindow', {
			'__class', "XText",
			'Id', "idText",
			'Padding', box(2, 0, 2, 0),
			'HAlign', "left",
			'VAlign', "center",
			'TextFont', "HexChoice",
			'TextColor', RGBA(0, 0, 0, 255),
			'DisabledTextColor', RGBA(196, 196, 196, 255),
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

