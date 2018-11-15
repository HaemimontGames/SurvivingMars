-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XText",
	group = "PreGame",
	id = "PropValue",
	PlaceObj('XTemplateWindow', {
		'__class', "XText",
		'Id', "idValue",
		'Padding', box(0, 0, 0, 0),
		'HAlign', "left",
		'HandleMouse', false,
		'TextStyle', "PGListItemValue",
		'Translate', true,
		'TextVAlign', "center",
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

