-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "ipSurfaceDeposit",
	PlaceObj('XTemplateTemplate', {
		'__template', "Infopanel",
		'Description', T{7420, --[[XTemplate ipSurfaceDeposit Description]] "<Description>"},
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelSection",
			'Title', T{489, --[[XTemplate ipSurfaceDeposit Title]] "Available resources"},
			'Icon', "UI/Icons/Sections/deposit.tga",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T{810, --[[XTemplate ipSurfaceDeposit Text]] "<ResourceName><right><resource(Amount,max_amount,resource)>"},
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'__template', "sectionCheats",
		}),
		}),
})

