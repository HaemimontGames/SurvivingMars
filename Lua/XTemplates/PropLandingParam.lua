-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XPropControl",
	group = "PreGame",
	id = "PropLandingParam",
	PlaceObj('XTemplateWindow', {
		'__class', "XPropControl",
		'RolloverAnchor', "left",
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'Id', "idImage",
			'Dock', "right",
			'Image', "UI/Common/pm_progress_bar.tga",
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XLabel",
			'Id', "idName",
			'Margins', box(0, 0, 10, 0),
			'Dock', "right",
			'VAlign', "center",
			'TextFont', "PGResource",
			'TextColor', RGBA(140, 156, 178, 255),
			'Translate', true,
		}),
		PlaceObj('XTemplateFunc', {
			'name', "OnPropUpdate(self, context, prop_meta, value)",
			'func', function (self, context, prop_meta, value)
local obj = ResolvePropObj(context)
local image = obj:GetParamValue(prop_meta)
self.idImage:SetImage(image)
end,
		}),
		}),
})

