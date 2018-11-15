-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XText",
	group = "PreGame",
	id = "PropName",
	PlaceObj('XTemplateWindow', {
		'__class', "XText",
		'Id', "idName",
		'Padding', box(0, 0, 0, 0),
		'HAlign', "left",
		'MinWidth', 250,
		'MaxWidth', 250,
		'MaxHeight', 35,
		'HandleMouse', false,
		'TextStyle', "PGListItemName",
		'Translate', true,
		'Shorten', true,
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

