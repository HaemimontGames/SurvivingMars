-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Mods",
	id = "ModsUIFlagThankYou",
	PlaceObj('XTemplateTemplate', {
		'__template', "ModsUIPopupBase",
	}, {
		PlaceObj('XTemplateWindow', {
			'Margins', box(110, 0, 110, 110),
			'LayoutMethod', "VList",
			'LayoutVSpacing', 40,
		}, {
			PlaceObj('XTemplateFunc', {
				'name', "Open",
				'func', function (self, ...)
local title = self.parent:ResolveId("idTitle")
title:SetText(T(10387, "Thank you!"))
title:SetHAlign("center")
title:SetMargins(title:GetMargins() + box(0,60,0,0))
XWindow.Open(self, ...)
end,
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XText",
				'Margins', box(0, 10, 0, 0),
				'HAlign', "center",
				'MaxWidth', 600,
				'HandleMouse', false,
				'TextStyle', "ModsUIMsgText",
				'Translate', true,
				'Text', T(10398, --[[XTemplate ModsUIFlagThankYou Text]] "You have successfully flagged this mod for review.\nThank you for making Paradox better and safer."),
				'TextHAlign', "center",
			}),
			}),
		}),
})

