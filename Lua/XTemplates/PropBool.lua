-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "PreGame",
	id = "PropBool",
	PlaceObj('XTemplateWindow', {
		'__class', "XPropControl",
		'RolloverAnchor', "left",
		'LayoutMethod', "HList",
		'RolloverOnFocus', true,
		'MouseCursor', "UI/Cursors/Rollover.tga",
		'FXMouseIn', "MenuItemHover",
		'FXPress', "MenuItemClick",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "PropName",
			'MinWidth', 400,
			'MaxWidth', 400,
			'TextStyle', "ListItem3",
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "PropValue",
			'Id', "idOn",
			'FoldWhenHidden', true,
			'TextStyle', "ListItem4",
			'Text', T(498175633247, --[[XTemplate PropBool Text]] "On"),
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "PropValue",
			'Id', "idOff",
			'FoldWhenHidden', true,
			'TextStyle', "ListItem4",
			'Text', T(222832671596, --[[XTemplate PropBool Text]] "Off"),
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnPropUpdate(self, context, prop_meta, value)",
			'func', function (self, context, prop_meta, value)
if prop_meta.on_value ~= nil then
	self.idOn:SetVisible(value == prop_meta.on_value)
else
	self.idOn:SetVisible(value)
end
if prop_meta.off_value ~= nil then
	self.idOff:SetVisible(value == prop_meta.off_value)
else
	self.idOff:SetVisible(not value)
end
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnMouseButtonDown(self, pos, button)",
			'func', function (self, pos, button)
XPropControl.OnMouseButtonDown(self, pos, button)
if button == "L" then
	local id = self.prop_meta.id
	local value = ResolveValue(self.context, id)
	local on_value, off_value = self.prop_meta.on_value, self.prop_meta.off_value
	if on_value ~= nil and value == on_value and off_value ~= nil then
		value = off_value
	elseif off_value ~= nil and value == off_value and on_value ~= nil then
		value = on_value
	else
		value = not value
	end
	
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

