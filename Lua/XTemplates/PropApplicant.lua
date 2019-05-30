-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XPropControl",
	group = "PreGame",
	id = "PropApplicant",
	PlaceObj('XTemplateWindow', {
		'__class', "XPropControl",
		'RolloverTemplate', "Rollover",
		'RolloverAnchor', "right",
		'RolloverAnchorId', "idRightList",
		'MinWidth', 300,
		'MaxWidth', 300,
		'RolloverOnFocus', true,
		'MouseCursor', "UI/Cursors/Rollover.tga",
		'FXMouseIn', "MenuItemHover",
		'FXPress', "MenuItemClick",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "PropName",
			'HAlign', "right",
			'VAlign', "center",
			'MinWidth', 0,
			'MaxWidth', 1000000,
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
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'Id', "idArrow",
			'Margins', box(0, 0, -30, 0),
			'Dock', "box",
			'HAlign', "right",
			'VAlign', "center",
			'Visible', false,
			'Image', "UI/Infopanel/arrow_add.tga",
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XFrame",
			'Id', "idRollover",
			'ZOrder', 0,
			'Margins', box(-20, -12, -20, -12),
			'Dock', "box",
			'Visible', false,
			'Image', "UI/CommonNew/re_candidate_rollover.tga",
			'FrameBox', box(25, 0, 25, 0),
			'SqueezeY', false,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "Open",
			'func', function (self, ...)
				XPropControl.Open(self, ...)
				local rollover = self.prop_meta.rollover
				self:SetRolloverTitle(rollover.title)
				self:SetRolloverText(rollover.descr)
				self:SetRolloverHint(rollover.hint)
				self:SetRolloverHintGamepad(rollover.gamepad_hint)
			end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnMouseButtonDown(self, pos, button)",
			'func', function (self, pos, button)
				if button == "L" then
					local obj = ResolvePropObj(self.context)
					local prop_meta = self.prop_meta
					obj:ApproveApplicant(prop_meta.applicant)
					return "break"
				end
			end,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnShortcut(self, shortcut, source)",
			'func', function (self, shortcut, source)
				if shortcut == "ButtonA" then
					return self:OnMouseButtonDown(nil, "L")
				end
				return XPropControl.OnShortcut(self, shortcut, source)
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
		PlaceObj('XTemplateFunc', {
			'name', "OnSetRollover(self, rollover)",
			'func', function (self, rollover)
				XPropControl.OnSetRollover(self, rollover)
				local arrow = self:ResolveId("idArrow")
				if arrow then
					arrow:SetVisible(rollover)
				end
			end,
		}),
		}),
})

