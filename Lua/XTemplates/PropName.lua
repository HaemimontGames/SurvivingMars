-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XLabel",
	group = "PreGame",
	id = "PropName",
	PlaceObj('XTemplateWindow', {
		'__class', "XLabel",
		'Id', "idName",
		'TextFont', "PGListItem",
		'TextColor', RGBA(140, 156, 178, 255),
		'RolloverTextColor', RGBA(255, 255, 255, 255),
		'Translate', true,
	}, {
		PlaceObj('XTemplateFunc', {
			'name', "CalcTextColor",
			'func', function (self, ...)
return self.enabled and 
				(self.parent.rollover and self.RolloverTextColor or self.TextColor)
				or self.DisabledTextColor
end,
		}),
		}),
})

