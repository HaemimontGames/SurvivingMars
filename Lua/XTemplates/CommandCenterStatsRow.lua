-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "CCC",
	id = "CommandCenterStatsRow",
	PlaceObj('XTemplateWindow', {
		'IdNode', true,
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XLabel",
			'Id', "idName",
			'TextStyle', "CCCStatsValue",
			'Translate', true,
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XText",
			'Id', "idValue",
			'HAlign', "right",
			'TextStyle', "CCCStatsValue",
			'Translate', true,
		}),
		}),
	PlaceObj('XTemplateProperty', {
		'id', "Name",
		'editor', "text",
		'Set', function (self, value)
			self.idName:SetText(value)
		end,
	}),
	PlaceObj('XTemplateProperty', {
		'id', "Value",
		'editor', "text",
		'Set', function (self, value)
			self.idValue:SetText(value)
		end,
	}),
})

