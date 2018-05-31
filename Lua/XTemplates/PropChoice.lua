-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "PreGame",
	id = "PropChoice",
	PlaceObj('XTemplateWindow', {
		'__class', "XPropControl",
		'RolloverAnchor', "left",
		'RolloverOnFocus', true,
		'MouseCursor', "UI/Cursors/Rollover.tga",
		'FXMouseIn', "MenuItemHover",
		'FXPress', "MenuItemClick",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__condition', function (parent, context) return context.prop_meta and context.prop_meta.submenu end,
			'__template', "PropArrow",
			'Id', "idArrow",
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "PropName",
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "PropValue",
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnPropUpdate(self, context, prop_meta, value)",
			'func', function (self, context, prop_meta, value)
local items = prop_meta.items
if type(items) == "function" then
	items = items(context, prop_meta.id)
end
local text
if type(value) == "table" then
	local count = 0
	for k,v in pairs(value) do
		count = count + 1
	end
	text = count == 0 and T{9813, "None selected"} or Untranslated("x" .. count)
else
	local entry = items and table.find_value(items, "value", value)
	text = entry and entry.text or ""
end

self.idValue:SetText(text)
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnMouseButtonDown(self, pos, button)",
			'func', function (self, pos, button)
XPropControl.OnMouseButtonDown(self, pos, button)
if button == "L" then
  SetDialogMode(self, "items", self.prop_meta)
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
			'name', "OnSetRollover(self, rollover)",
			'func', function (self, rollover)
XPropControl.OnSetRollover(self, rollover)
local arrow = self:ResolveId("idArrow")
if arrow then
	arrow:OnSetRollover(rollover)
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

