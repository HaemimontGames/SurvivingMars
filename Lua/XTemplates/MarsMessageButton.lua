-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XTextButton",
	group = "Default",
	id = "MarsMessageButton",
	PlaceObj('XTemplateWindow', {
		'__class', "XTextButton",
		'RolloverTemplate', "Rollover",
		'RolloverAnchor', "bottom",
		'Padding', box(25, 0, 0, 0),
		'MaxHeight', 45,
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
			'name', "OnSetRollover(self, rollover)",
			'func', function (self, rollover)
--delay this a bit so that idRollover2 is measured
CreateRealTimeThread(function()
	if self.window_state ~= "destroying" then
		XTextButton.OnSetRollover(self, rollover)
		self.idRollover2:SetVisible(rollover)
		local b = self.idRollover2.box
		self.idRollover2:AddInterpolation{
			type = const.intRect,
			duration = self.idRollover2:GetFadeInTime(),
			startRect = b,
			endRect = sizebox(b:minx(), b:miny(), 40, b:sizey()),
			flags = const.intfInverse,
			autoremove = true,
		}
	end
end)
end,
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'Id', "idRollover2",
			'IdNode', false,
			'ZOrder', 0,
			'Margins', box(0, 0, 0, -6),
			'Dock', "box",
			'Visible', false,
			'FadeInTime', 150,
			'Image', "UI/Common/message_choice_shine.tga",
			'ImageFit', "stretch",
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'Id', "idButtonIcon",
			'IdNode', false,
			'ZOrder', 2,
			'Margins', box(-25, 0, 0, 0),
			'Shape', "InHHex",
			'Dock', "left",
			'MinWidth', 50,
			'MinHeight', 43,
			'MaxWidth', 50,
			'MaxHeight', 43,
			'HandleMouse', true,
			'Image', "UI/Common/message_button.tga",
			'ImageFit', "smallest",
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XImage",
				'Id', "idRollover",
				'IdNode', false,
				'Margins', box(-3, -3, -3, -3),
				'Dock', "box",
				'Visible', false,
				'Image', "UI/Common/Hex_small_shine_2.tga",
				'ImageFit', "smallest",
			}),
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
			PlaceObj('XTemplateWindow', {
				'__class', "XImage",
				'Id', "idButtonSelectedIcon",
				'IdNode', false,
				'Visible', false,
				'Image', "UI/Common/message_button.tga",
			}),
			}),
		PlaceObj('XTemplateWindow', {
			'__class', "XText",
			'Id', "idText",
			'Padding', box(2, 0, 2, 0),
			'HAlign', "left",
			'VAlign', "center",
			'TextFont', "HexChoice",
			'TextColor', RGBA(254, 237, 122, 255),
			'RolloverTextColor', RGBA(255, 255, 255, 255),
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

