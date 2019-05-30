-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XPropControl",
	group = "PreGame",
	id = "PropTextInput",
	PlaceObj('XTemplateWindow', {
		'__class', "XPropControl",
		'RolloverOnFocus', true,
		'MouseCursor', "UI/Cursors/Rollover.tga",
		'FXMouseIn', "MenuItemHover",
		'FXPress', "MenuItemClick",
		'FXPressDisabled', "UIDisabledButtonPressed",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "PropName",
			'Dock', "left",
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "PropValue",
			'Margins', box(20, 0, 0, 0),
			'Clip', true,
			'Translate', false,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnPropUpdate(self, context, prop_meta, value)",
			'func', function (self, context, prop_meta, value)
				value = value or ""
				local display_text = prop_meta.password and string.rep("*", utf8.len(value)) or value
				self.idValue:SetText(display_text)
				if prop_meta.disabled and prop_meta.disabled() then
					self:SetEnabled(false)
				end
			end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnMouseButtonDown(self, pos, button)",
			'func', function (self, pos, button)
				XPropControl.OnMouseButtonDown(self, pos, button)
				if self.enabled then
					local prop_meta = self.prop_meta
					local obj = ResolvePropObj(self.context)
					CreateMarsRenameControl(GetDialog(self), prop_meta.name, obj[prop_meta.id],
						function(name)
							name = name:trim_spaces()
							obj:SetProperty(prop_meta.id, name)
							self:OnPropUpdate(self.context, prop_meta, name)
						end, nil, self.context, prop_meta)
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

