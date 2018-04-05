-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XLabel",
	group = "PreGame",
	id = "PropValue",
	PlaceObj('XTemplateWindow', {
		'__class', "XLabel",
		'Id', "idValue",
		'Dock', "right",
		'TextFont', "PGListItem",
		'TextColor', RGBA(221, 215, 170, 255),
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

