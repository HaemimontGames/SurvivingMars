-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XPropControl",
	group = "PreGame",
	id = "PropUrl",
	PlaceObj('XTemplateWindow', {
		'__class', "XPropControl",
		'RolloverOnFocus', true,
		'MouseCursor', "UI/Cursors/Rollover.tga",
		'FXMouseIn', "MenuItemHover",
		'FXPress', "MenuItemClick",
		'FXPressDisabled', "UIDisabledButtonPressed",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "PropValue",
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnPropUpdate(self, context, prop_meta, value)",
			'func', function (self, context, prop_meta, value)
self.idValue:SetText(prop_meta.name)
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnMouseButtonDown(self, pos, button)",
			'func', function (self, pos, button)
XPropControl.OnMouseButtonDown(self, pos, button)
local prop_meta = self.prop_meta
local obj = ResolvePropObj(self.context)
local open_func = prop_meta.open_func
if open_func then
	open_func()
	return
end
local url = obj[prop_meta.id]
if type(url) == "function" then
	OpenUrl(url())
else
	OpenUrl(url)
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

