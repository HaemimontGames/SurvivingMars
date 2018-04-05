-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XPropControl",
	group = "PreGame",
	id = "PropPayload",
	PlaceObj('XTemplateWindow', {
		'__class', "XPropControl",
		'RolloverAnchor', "left",
		'RolloverOnFocus', true,
		'MouseCursor', "UI/Cursors/Rollover.tga",
		'FXMouseIn', "MenuItemHover",
		'FXPress', "NewMissionParamsClick",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "PropArrow",
			'Id', "idArrow",
			'Visible', false,
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "PropName",
		}),
		PlaceObj('XTemplateWindow', {
			'Dock', "right",
			'LayoutMethod', "HList",
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XText",
				'Id', "idPrice",
				'HAlign', "right",
				'VAlign', "center",
				'TextFont', "PGResource",
				'TextColor', RGBA(250, 236, 208, 255),
				'RolloverTextColor', RGBA(255, 255, 255, 255),
				'Translate', true,
			}, {
				PlaceObj('XTemplateFunc', {
					'name', "CalcTextColor",
					'func', function (self, ...)
return self.enabled and 
				(self.parent.parent.rollover and self.RolloverTextColor or self.TextColor)
				or self.DisabledTextColor
end,
				}),
				}),
			PlaceObj('XTemplateWindow', {
				'__class', "XTextButton",
				'Id', "idRemove",
				'HAlign', "right",
				'VAlign', "center",
				'MouseCursor', "UI/Cursors/Rollover.tga",
				'FXMouseIn', "RocketRemoveCargoHover",
				'FXPress', "RocketRemoveCargoClick",
				'RepeatStart', 300,
				'RepeatInterval', 300,
				'OnPress', function (self, gamepad)
GetDialogContext(self):RemoveItem(self.context.prop_meta.id)
end,
				'Image', "UI/Infopanel/arrow_remove.tga",
				'ColumnsUse', "abcc",
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XText",
				'Id', "idAmount",
				'Padding', box(2, 2, 5, 2),
				'HAlign', "right",
				'VAlign', "center",
				'MinWidth', 50,
				'MaxWidth', 50,
				'TextFont', "PGResource",
				'TextColor', RGBA(255, 248, 233, 255),
				'RolloverTextColor', RGBA(255, 255, 255, 255),
				'WordWrap', false,
				'TextHAlign', "right",
				'TextVAlign', "center",
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XTextButton",
				'Id', "idAdd",
				'HAlign', "right",
				'VAlign', "center",
				'MouseCursor', "UI/Cursors/Rollover.tga",
				'FXMouseIn', "RocketAddCargoHover",
				'FXPress', "RocketAddCargoClick",
				'RepeatStart', 300,
				'RepeatInterval', 300,
				'OnPress', function (self, gamepad)
GetDialogContext(self):AddItem(self.context.prop_meta.id)
end,
				'Image', "UI/Infopanel/arrow_add.tga",
				'ColumnsUse', "abcc",
			}),
			}),
		PlaceObj('XTemplateFunc', {
			'name', "OnPropUpdate(self, context, prop_meta, value)",
			'func', function (self, context, prop_meta, value)
local obj = ResolvePropObj(context)
local item = RocketPayload_GetMeta(prop_meta.id)
self.idAmount:SetText(tostring(obj:GetAmount(item)))
self.idPrice:SetText(obj:GetPrice(item))
self.idRemove:SetVisible(obj:CanUnload(item))
self.idAdd:SetVisible(obj:CanLoad(item))
self.idArrow:SetVisible(prop_meta.submenu)
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnMouseButtonDown(self, pos, button)",
			'func', function (self, pos, button)
if self.prop_meta.submenu then
	XPropControl.OnMouseButtonDown(self, pos, button)
	if button == "L" then
  	SetDialogMode(self, "prefabs", self.prop_meta)
	end
end
end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnShortcut(self, shortcut, source)",
			'func', function (self, shortcut, source)
if shortcut == "ButtonA" then
	self:OnMouseButtonDown(nil, "L")
	return "break"
elseif (shortcut == "DPadLeft" or shortcut == "LeftThumbLeft") and self.idRemove:GetVisible() then
	self.idRemove:Press()
	return "break"
elseif (shortcut == "DPadRight" or shortcut == "LeftThumbRight") and self.idAdd:GetVisible() then
	self.idAdd:Press()
	return "break"
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

