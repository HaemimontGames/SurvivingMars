-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XRolloverWindow",
	id = "Rollover",
	PlaceObj('XTemplateWindow', {
		'__class', "XRolloverWindow",
		'Margins', box(50, 30, 50, 30),
		'BorderWidth', 0,
		'MinWidth', 450,
		'MaxWidth', 450,
		'Background', RGBA(0, 0, 0, 0),
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "RolloverBackground",
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XContextControl",
			'Id', "idContent",
			'Margins', box(24, 6, 24, 6),
			'LayoutMethod', "VList",
			'OnContextUpdate', function (self, context, ...)
local control = context.control
local enabled = control:GetEnabled()
local title = not enabled and context.RolloverDisabledTitle ~= "" and context.RolloverDisabledTitle or context.RolloverTitle or control:GetRolloverTitle()
self.idTitle:SetText(title)
local show = self.idTitle.text ~= ""
self.idTitle:SetVisible(show)
self.idTitleLine:SetVisible(show)

self.idText:SetText(not enabled and context.RolloverDisabledText ~= "" and context.RolloverDisabledText or context.RolloverText or control:GetRolloverText())

if enabled then
local hint = context.gamepad and control:GetRolloverHintGamepad() or ""
if hint == "" then
	hint = control:GetRolloverHint() or ""
end
self.idHint:SetText(context.gamepad and context.RolloverHintGamepad or context.RolloverHint or hint)
else
self.idHint:SetText("")
end
show = self.idHint.text ~= ""
self.idHint:SetVisible(show)
self.idHintLine:SetVisible(show)
end,
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XText",
				'Id', "idTitle",
				'FoldWhenHidden', true,
				'TextFont', "RolloverTitle",
				'TextColor', RGBA(255, 188, 59, 255),
				'Translate', true,
				'TextHAlign', "center",
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XImage",
				'Id', "idTitleLine",
				'FoldWhenHidden', true,
				'Image', "UI/Common/rollover_line.tga",
				'ImageFit', "stretch-x",
			}),
			PlaceObj('XTemplateTemplate', {
				'__template', "RolloverText",
				'Id', "idText",
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XImage",
				'Id', "idHintLine",
				'Margins', box(0, 4, 0, 0),
				'FoldWhenHidden', true,
				'Image', "UI/Common/rollover_line.tga",
				'ImageFit', "stretch-x",
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XText",
				'Id', "idHint",
				'Margins', box(0, 2, 0, 2),
				'FoldWhenHidden', true,
				'TextFont', "RolloverHint",
				'TextColor', RGBA(181, 182, 192, 255),
				'Translate', true,
				'TextHAlign', "center",
			}),
			}),
		}),
})

