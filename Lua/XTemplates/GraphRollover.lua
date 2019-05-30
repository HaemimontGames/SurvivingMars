-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XRolloverWindow",
	group = "Default",
	id = "GraphRollover",
	PlaceObj('XTemplateWindow', {
		'__class', "XRolloverWindow",
		'BorderWidth', 0,
		'Background', RGBA(0, 0, 0, 0),
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XContextControl",
			'Id', "idContent",
			'OnContextUpdate', function (self, context, ...)
				local control = context.control
				self.idText:SetText(context.RolloverText or control:GetRolloverText())
			end,
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "RolloverText",
				'Id', "idText",
				'Padding', box(0, 0, 0, 0),
				'TextStyle', "GraphRollover",
			}),
			}),
		}),
})

