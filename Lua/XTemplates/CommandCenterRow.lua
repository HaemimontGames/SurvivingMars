-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XContextControl",
	group = "CCC",
	id = "CommandCenterRow",
	PlaceObj('XTemplateWindow', {
		'__class', "XContextControl",
		'RolloverTemplate', "Rollover",
		'RolloverAnchor', "left",
		'RolloverTitle', T{7412, --[[XTemplate CommandCenterRow RolloverTitle]] "<DisplayName>"},
		'RolloverHint', T{115984499466, --[[XTemplate CommandCenterRow RolloverHint]] "<left_click> View <left_click><left_click> Select"},
		'RolloverHintGamepad', T{764097870353, --[[XTemplate CommandCenterRow RolloverHintGamepad]] "<ButtonA> View <ButtonX> Select"},
		'Id', "idRow",
		'MinHeight', 46,
		'MaxHeight', 46,
		'LayoutMethod', "HList",
		'RolloverOnFocus', true,
		'MouseCursor', "UI/Cursors/Rollover.tga",
		'RelativeFocusOrder', "new-line",
		'FXMouseIn', "MenuItemHover",
		'FXPress', "MenuItemClick",
	}, {
		PlaceObj('XTemplateFunc', {
			'name', "OnSetRollover(self, rollover)",
			'func', function (self, rollover)
--delay this a bit so that idRollover2 is measured
CreateRealTimeThread(function()
	if self.window_state ~= "destroying" then
		XContextControl.OnSetRollover(self, rollover)
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
		PlaceObj('XTemplateFunc', {
			'name', "OnMouseButtonDown(self, pos, button)",
			'func', function (self, pos, button)
if button == "L" then
	self:PlayFX(self.FXPress, "start")
	ViewObjectMars(self.context)
	return "break"
end
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnMouseButtonDoubleClick(self, pos, button)",
			'func', function (self, pos, button)
if button == "L" then
	ViewObjectMars(self.context)
	SelectObj(self.context)
	CloseCommandCenter()
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
			'name', "OnShortcut(self, shortcut, source)",
			'func', function (self, shortcut, source)
if shortcut == "ButtonA" then
	self:OnMouseButtonDown(nil, "L")
	return "break"
elseif shortcut == "ButtonX" then
	self:OnMouseButtonDoubleClick(nil, "L")
	return "break"
elseif XShortcutToRelation[shortcut] == "right" or XShortcutToRelation[shortcut] == "left" then
	local focus = self.desktop and self.desktop.keyboard_focus
	local order = point(0,0)
	while focus and focus ~= self do
		order = focus:GetFocusOrder() or order
		focus = focus.parent
	end
	focus = self:GetRelativeFocus(order, XShortcutToRelation[shortcut])
	if focus then
		focus:SetFocus()
	elseif not focus and XShortcutToRelation[shortcut] == "left" then
		self:SetFocus()
		XCreateRolloverWindow(self, true)
	end
	return "break"
end
return XContextControl.OnShortcut(self, shortcut, source)
end,
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'Id', "idRollover2",
			'IdNode', false,
			'ZOrder', 0,
			'Margins', box(0, 0, 0, -8),
			'Padding', box(25, 0, 0, 0),
			'Dock', "box",
			'Visible', false,
			'FadeInTime', 150,
			'Image', "UI/Common/message_choice_shine.tga",
			'ImageFit', "stretch",
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'IdNode', false,
			'ZOrder', 0,
			'Margins', box(0, 0, 0, -6),
			'Padding', box(25, 0, 0, 0),
			'Dock', "box",
			'Image', "UI/Infopanel/section.tga",
			'ImageFit', "stretch",
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'Id', "idButtonIcon",
			'IdNode', false,
			'ZOrder', 2,
			'Shape', "InHHex",
			'Dock', "left",
			'MinWidth', 53,
			'MinHeight', 46,
			'MaxWidth', 53,
			'MaxHeight', 46,
			'HandleMouse', true,
			'ImageFit', "smallest",
			'Columns', 2,
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XImage",
				'Id', "idSpecialization",
				'Dock', "box",
				'ImageFit', "smallest",
				'Columns', 2,
			}),
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
				'Id', "idWarningShine",
				'IdNode', false,
				'Margins', box(-3, -3, -3, -3),
				'Dock', "box",
				'Visible', false,
				'Image', "UI/Common/Hex_2_shine_2.tga",
				'ImageFit', "smallest",
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XImage",
				'Id', "idWarning",
				'Margins', box(0, 0, -3, 0),
				'Dock', "box",
				'HAlign', "right",
				'VAlign', "bottom",
				'MinWidth', 24,
				'MaxWidth', 24,
				'Visible', false,
				'Image', "UI/Icons/Sections/warning.tga",
				'ImageFit', "smallest",
			}),
			}),
		}),
})

