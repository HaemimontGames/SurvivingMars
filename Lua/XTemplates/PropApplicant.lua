-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XPropControl",
	group = "PreGame",
	id = "PropApplicant",
	PlaceObj('XTemplateWindow', {
		'__class', "XPropControl",
		'RolloverAnchor', "left",
		'Padding', box(20, 0, 0, 0),
		'RolloverOnFocus', true,
		'MouseCursor', "UI/Cursors/Rollover.tga",
		'FXMouseIn', "MenuItemHover",
		'FXPress', "MenuItemClick",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "PropName",
			'VAlign', "center",
		}, {
			PlaceObj('XTemplateFunc', {
				'name', "CalcTextColor",
				'func', function (self, ...)
local traits = self.context.prop_meta.applicant[1].traits
for trait_id, val in pairs(traits) do
	local trait = TraitPresets[trait_id]
	if trait and trait.rare then
		return self.parent.rollover and self.RolloverTextColor or RGBA(250, 236, 208,255)
	end
end
return self.enabled and 
				(self.parent.rollover and self.RolloverTextColor or self.TextColor)
				or self.DisabledTextColor
end,
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'__template', "PropCheckBoxValue",
			'Id', "idPositive",
			'Margins', box(0, 0, 5, 0),
			'HandleMouse', true,
			'Image', "UI/Icons/traits_approve_disable.tga",
		}, {
			PlaceObj('XTemplateFunc', {
				'name', "OnMouseButtonDown(self, pos, button)",
				'func', function (self, pos, button)
if button == "L" then
	local obj = ResolvePropObj(self.parent.context)
	local prop_meta = self.parent.prop_meta
	obj:ToggleApplicant(self, prop_meta)
	return "break"
end
end,
			}),
			}),
		PlaceObj('XTemplateFunc', {
			'name', "OnPropUpdate(self, context, prop_meta, value)",
			'func', function (self, context, prop_meta, value)
self.idPositive:SetImage(prop_meta.approved_for_flight  and "UI/Icons/traits_approve.tga" or "UI/Icons/traits_approve_disable.tga")
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnMouseButtonDown(self, pos, button)",
			'func', function (self, pos, button)
return self.idPositive:OnMouseButtonDown(pos, button)
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnShortcut(self, shortcut, source)",
			'func', function (self, shortcut, source)
if shortcut == "ButtonA" then
  self:OnMouseButtonDown(nil, "L")
elseif shortcut == "DPadLeft" or shortcut == "LeftThumbLeft" or
	shortcut == "DPadRight" or shortcut == "LeftThumbRight" then
	return self.idPositive:OnMouseButtonDown(nil, "L")
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

