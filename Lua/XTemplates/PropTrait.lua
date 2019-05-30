-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XPropControl",
	group = "PreGame",
	id = "PropTrait",
	PlaceObj('XTemplateWindow', {
		'__class', "XPropControl",
		'RolloverOnFocus', true,
		'MouseCursor', "UI/Cursors/Rollover.tga",
		'FXMouseIn', "MenuItemHover",
		'FXPress', "NewMissionParamsClick",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "PropArrow",
			'Id', "idArrow",
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "PropName",
			'VAlign', "center",
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "PropCheckBoxValue",
			'Id', "idNegative",
			'HandleMouse', true,
			'Image', "UI/Icons/traits_disapprove_disable.tga",
		}, {
			PlaceObj('XTemplateFunc', {
				'name', "OnMouseButtonDown(self, pos, button)",
				'func', function (self, pos, button)
					if button == "L" and not self.parent.prop_meta.submenu then
						self:Press()
						return "break"
					end
				end,
			}),
			PlaceObj('XTemplateFunc', {
				'name', "Press",
				'func', function (self, ...)
					local obj = ResolvePropObj(self.parent.context)
					local dlg = GetDialog(self)
					local prop_meta = self.parent.prop_meta
					obj:FilterTrait(prop_meta, false)
				end,
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'__template', "PropCheckBoxValue",
			'RolloverAnchor', "left",
			'Id', "idPositive",
			'Margins', box(0, 0, 5, 0),
			'HandleMouse', true,
			'Image', "UI/Icons/traits_approve_disable.tga",
		}, {
			PlaceObj('XTemplateFunc', {
				'name', "OnMouseButtonDown(self, pos, button)",
				'func', function (self, pos, button)
					if button == "L" and not self.parent.prop_meta.submenu then
						self:Press()
						return "break"
					end
				end,
			}),
			PlaceObj('XTemplateFunc', {
				'name', "Press",
				'func', function (self, ...)
					local obj = ResolvePropObj(self.parent.context)
					local dlg = GetDialog(self)
					local prop_meta = self.parent.prop_meta
					obj:FilterTrait(prop_meta, true)
				end,
			}),
			}),
		PlaceObj('XTemplateFunc', {
			'name', "OnPropUpdate(self, context, prop_meta, value)",
			'func', function (self, context, prop_meta, value)
				self.idArrow:SetVisible(prop_meta.submenu)
				local obj = ResolvePropObj(context)
				if prop_meta.add_count_in_name then
					local name = obj:GetPropTraitDisplayName(prop_meta)
					self.idName:SetText(name)
				end
				obj:UpdateImages(self, prop_meta)
			end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnMouseButtonDown(self, pos, button)",
			'func', function (self, pos, button)
				local obj = ResolvePropObj(self.context)
				if self.prop_meta.submenu or obj.dome then
					XPropControl.OnMouseButtonDown(self, pos, button)
					if button == "L" and self.prop_meta.submenu then
						obj:CountApprovedColonistsForCategory(self.prop_meta.id)
						SetDialogMode(self, "items", self.prop_meta)
						return "break"
					end
				end
			end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnMouseButtonDoubleClick(self, pos, button)",
			'func', function (self, pos, button)
				local obj = ResolvePropObj(self.context)
				if obj.dome and button == "L" then
					XPropControl.OnMouseButtonDoubleClick(self, pos, button)
					CloseDialog("DomeTraits")
					CreateRealTimeThread(function()
						OpenCommandCenter({dome = obj.dome, trait = {name = self.prop_meta.value, display_name = self.prop_meta.name}}, "Colonists")
					end)
					return "break"
				end
			end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnShortcut(self, shortcut, source)",
			'func', function (self, shortcut, source)
				if self.prop_meta.submenu and (shortcut == "DPadLeft" or shortcut == "LeftThumbLeft" or shortcut == "DPadRight" or shortcut == "LeftThumbRight") then
				  return self:OnMouseButtonDown(nil, "L")
				elseif not self.prop_meta.submenu and shortcut == "ButtonX" then
				  return self:OnMouseButtonDoubleClick(nil, "L")
				elseif shortcut == "DPadLeft" or shortcut == "LeftThumbLeft" then
					self.idPositive:Press()
					return "break"
				elseif shortcut == "DPadRight" or shortcut == "LeftThumbRight" then
					self.idNegative:Press()
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
	PlaceObj('XTemplateWindow', {
		'__condition', function (parent, context) return context.prop_meta.leave_space end,
		'__class', "XContextWindow",
	}, {
		PlaceObj('XTemplateFunc', {
			'name', "IsSelectable",
			'func', function (self, ...)
				return false
			end,
		}),
		}),
})

