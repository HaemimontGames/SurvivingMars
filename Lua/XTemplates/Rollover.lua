-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XRolloverWindow",
	id = "Rollover",
	PlaceObj('XTemplateWindow', {
		'__class', "XRolloverWindow",
		'Margins', box(50, 30, 50, 30),
		'BorderWidth', 0,
		'MinWidth', 450,
		'Background', RGBA(0, 0, 0, 0),
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "RolloverBackgroundNew",
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XContextControl",
			'Id', "idContent",
			'Margins', box(24, 6, 24, 6),
			'LayoutMethod', "VList",
			'OnContextUpdate', function (self, context, ...)
				local control = context.control
				local enabled = control:GetEnabled()
				local title = not enabled and context.RolloverDisabledTitle ~= "" and context.RolloverDisabledTitle or context.RolloverTitle ~= "" and context.RolloverTitle or control:GetRolloverTitle()
				self.idTitle:SetText(title)
				local show = self.idTitle.text ~= ""
				self.idTitle:SetVisible(show)
				
				self.idText:SetText(not enabled and context.RolloverDisabledText ~= "" and context.RolloverDisabledText or context.RolloverText ~= "" and context.RolloverText or control:GetRolloverText())
				
				if enabled then
					local hint = context.gamepad and control:GetRolloverHintGamepad() or ""
					if hint == "" then
						hint = control:GetRolloverHint() or ""
					end
					self.idHint:SetText(context.gamepad and context.RolloverHintGamepad ~= "" and context.RolloverHintGamepad or context.RolloverHint ~= "" and context.RolloverHint or hint)
				else
					self.idHint:SetText("")
				end
				show = self.idHint.text ~= ""
				self.idHint:SetVisible(show)
				if not show then
					self.idText:SetMargins(box(0, 0, 0, 15))
				end
			end,
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XText",
				'Id', "idTitle",
				'MinHeight', 45,
				'MaxHeight', 45,
				'FoldWhenHidden', true,
				'TextStyle', "RolloverTitleStyle",
				'Translate', true,
				'TextHAlign', "center",
			}),
			PlaceObj('XTemplateTemplate', {
				'__template', "RolloverText",
				'Id', "idText",
				'HAlign', "left",
				'MinWidth', 400,
				'MaxWidth', 400,
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XText",
				'Id', "idHint",
				'Margins', box(0, 2, 0, 2),
				'FoldWhenHidden', true,
				'TextStyle', "RolloverHintStyle",
				'Translate', true,
				'TextHAlign', "center",
			}),
			}),
		}),
})

