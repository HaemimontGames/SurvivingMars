-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XPropControl",
	group = "PreGame",
	id = "PropCheckbox",
	PlaceObj('XTemplateWindow', {
		'__class', "XPropControl",
		'RolloverAnchor', "left",
		'RolloverOnFocus', true,
		'MouseCursor', "UI/Cursors/Rollover.tga",
		'FXMouseIn', "MenuItemHover",
		'FXPress', "MenuItemClick",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "PropName",
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "PropCheckBoxValue",
			'Id', "idOn",
			'FoldWhenHidden', true,
			'Image', "UI/Icons/Research/researched.tga",
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "PropCheckBoxValue",
			'Id', "idOff",
			'FoldWhenHidden', true,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnPropUpdate(self, context, prop_meta, value)",
			'func', function (self, context, prop_meta, value)
self.idOn:SetVisible(value)
self.idOff:SetVisible(not value)
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnMouseButtonDown(self, pos, button)",
			'func', function (self, pos, button)
XPropControl.OnMouseButtonDown(self, pos, button)
if button == "L" then
	local id = self.prop_meta.id
	local value = not ResolveValue(self.context, id)
	local obj = ResolvePropObj(self.context)
	SetProperty(obj, id, value)
	self:OnPropUpdate(self.context, self.prop_meta, value)
end
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnShortcut(self, shortcut, source)",
			'func', function (self, shortcut, source)
if shortcut == "ButtonA" then
  self:OnMouseButtonDown(nil, "L")
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

