-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Mods",
	id = "ModsUIRateThankYou",
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
title:SetText(T{10387, "Thank you!"})
title:SetHAlign("center")
title:SetMargins(title:GetMargins() + box(0,60,0,0))
XWindow.Open(self, ...)
end,
			}),
			PlaceObj('XTemplateWindow', {
				'__class', "XText",
				'Id', "idText",
				'Margins', box(0, 10, 0, 0),
				'HAlign', "center",
				'HandleMouse', false,
				'TextStyle', "ModsUIMsgText",
				'Translate', true,
				'TextHAlign', "center",
			}),
			}),
		}),
})

