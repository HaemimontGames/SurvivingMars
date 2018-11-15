-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "ipEffectDeposit",
	PlaceObj('XTemplateTemplate', {
		'__template', "Infopanel",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__context_of_kind', "EffectDeposit",
			'__condition', function (parent, context) return context:GetInfopanelDetails() ~= "" end,
			'__template', "InfopanelSection",
			'RolloverText', T{785, --[[XTemplate ipEffectDeposit RolloverText]] "Remaining resources in the deposit."},
			'Title', T{439960885808, --[[XTemplate ipEffectDeposit Title]] "Effects"},
			'Icon', "UI/Icons/Sections/deposit.tga",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T{367944427588, --[[XTemplate ipEffectDeposit Text]] "<InfopanelDetails>"},
			}),
			}),
		}),
})

