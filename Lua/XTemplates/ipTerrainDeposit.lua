-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "ipTerrainDeposit",
	PlaceObj('XTemplateTemplate', {
		'__template', "Infopanel",
		'Description', T{313911890683, --[[XTemplate ipTerrainDeposit Description]] "<description>"},
	}, {
		PlaceObj('XTemplateTemplate', {
			'__context_of_kind', "TerrainDeposit",
			'__template', "InfopanelSection",
			'RolloverText', T{785, --[[XTemplate ipTerrainDeposit RolloverText]] "Remaining resources in the deposit."},
			'Title', T{489, --[[XTemplate ipTerrainDeposit Title]] "Available resources"},
			'Icon', "UI/Icons/Sections/deposit.tga",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T{810, --[[XTemplate ipTerrainDeposit Text]] "<ResourceName><right><resource(Amount,max_amount,resource)>"},
			}),
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T{787, --[[XTemplate ipTerrainDeposit Text]] "Grade<right><grade_name>"},
			}),
			}),
		}),
})

