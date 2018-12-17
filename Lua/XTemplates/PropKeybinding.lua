-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XPropControl",
	group = "PreGame",
	id = "PropKeybinding",
	PlaceObj('XTemplateWindow', {
		'__class', "XPropControl",
		'LayoutMethod', "HList",
		'RolloverOnFocus', true,
		'MouseCursor', "UI/Cursors/Rollover.tga",
		'FXMouseIn', "MenuItemHover",
		'FXPress', "MenuItemClick",
		'FXPressDisabled', "UIDisabledButtonPressed",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "PropName",
			'MinWidth', 400,
			'MaxWidth', 400,
			'TextStyle', "ListItem3",
		}),
		PlaceObj('XTemplateWindow', {
			'MinWidth', 400,
			'MaxWidth', 400,
			'LayoutMethod', "Grid",
			'UniformColumnWidth', true,
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XText",
				'Id', "idBinding1",
				'HAlign', "center",
				'TextStyle', "ListItem2",
				'Translate', true,
				'Shorten', true,
			}, {
				PlaceObj('XTemplateFunc', {
					'name', "OnMouseButtonDown(self, pos, button)",
					'func', function (self, pos, button)
if button == "L" then
	self.desktop:SetMouseCapture(self)
	self.binding = true
	return "break"
end
end,
				}),
				PlaceObj('XTemplateFunc', {
					'name', "OnMouseButtonUp(self, pos, button)",
					'func', function (self, pos, button)
if button == "L" then
	self.desktop:SetMouseCapture(false)
	if self.binding then
		RebindKeys(1, self.parent.parent)
	end
	return "break"
end
end,
				}),
				PlaceObj('XTemplateProperty', {
					'id', "binding",
				}),
				}),
			PlaceObj('XTemplateWindow', {
				'__class', "XText",
				'Id', "idBinding2",
				'HAlign', "center",
				'GridX', 2,
				'TextStyle', "ListItem2",
				'Translate', true,
				'Shorten', true,
			}, {
				PlaceObj('XTemplateFunc', {
					'name', "OnMouseButtonDown(self, pos, button)",
					'func', function (self, pos, button)
if button == "L" then
	self.desktop:SetMouseCapture(self)
	self.binding = true
	return "break"
end
end,
				}),
				PlaceObj('XTemplateFunc', {
					'name', "OnMouseButtonUp(self, pos, button)",
					'func', function (self, pos, button)
if button == "L" then
	self.desktop:SetMouseCapture(false)
	if self.binding then
		RebindKeys(2, self.parent.parent)
	end
	return "break"
end
end,
				}),
				PlaceObj('XTemplateProperty', {
					'id', "binding",
				}),
				}),
			}),
		PlaceObj('XTemplateFunc', {
			'name', "OnPropUpdate(self, context, prop_meta, value)",
			'func', function (self, context, prop_meta, value)
self.idBinding1:SetText(KeybindingName(value and value[1]) or T(7875, "(  )"))
self.idBinding2:SetText(KeybindingName(value and value[2]) or T(7875, "(  )"))
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnMouseButtonDown(self, pos, button)",
			'func', function (self, pos, button)
XPropControl.OnMouseButtonDown(self, pos, button)
if button == "L" then
	return self.idBinding1:OnMouseButtonDown(pos, button)
end
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnMouseButtonUp(self, pos, button)",
			'func', function (self, pos, button)
if button == "L" then
	return self.idBinding1:OnMouseButtonUp(pos, button)
end
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnShortcut(self, shortcut, source)",
			'func', function (self, shortcut, source)
if shortcut == "ButtonA" then
  self:OnMouseButtonDown(nil, "L")
  self:OnMouseButtonUp(nil, "L")
end
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "SetSelected(self, selected)",
			'func', function (self, selected)
if GetUIStyleGamepad() then
	self:SetFocus(selected)
end
end,
		}),
		}),
})

