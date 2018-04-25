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
			'__class', "XText",
			'Id', "idTextValue",
			'Padding', box(0, 0, 0, 0),
			'Dock', "right",
			'VAlign', "center",
			'MinWidth', 103,
			'Visible', false,
			'FoldWhenHidden', true,
			'HandleMouse', false,
			'TextFont', "PGResource",
			'TextColor', RGBA(140, 156, 178, 255),
			'Translate', true,
			'TextHAlign', "center",
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XImage",
			'Id', "idImage",
			'Dock', "right",
			'FoldWhenHidden', true,
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
local text = ""
local hide_image = false
if NoThreats(prop_meta.id) then
	text = T{130, "N/A"}
	hide_image = true
end
if MaxThreat(prop_meta.id) then
	text = T{8780, "MAX"}
	hide_image = true
end
if hide_image then
	self.idImage:SetVisible(false)
	self.idTextValue:SetText(text)
	self.idTextValue:SetVisible(true)
else
	self.idImage:SetImage(image)
	self.idImage:SetVisible(true)
	self.idTextValue:SetVisible(false)
end
end,
		}),
		}),
})

