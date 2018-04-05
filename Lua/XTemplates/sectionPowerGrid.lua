-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "sectionPowerGrid",
	PlaceObj('XTemplateTemplate', {
		'__context', function (parent, context) return context:IsKindOfClasses("ElectricityProducer", "ElectricityStorage") and context.electricity and context.electricity.grid end,
		'__condition', function (parent, context) return context end,
		'__template', "InfopanelSection",
		'RolloverText', T{957982342940, --[[XTemplate sectionPowerGrid RolloverText]] "<UISectionPowerGridRollover>"},
		'Title', T{571, --[[XTemplate sectionPowerGrid Title]] "Power grid"},
		'Icon', "UI/Icons/Sections/electricity_1.tga",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Text', T{576, --[[XTemplate sectionPowerGrid Text]] "Power production<right><power(current_production)>"},
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Text', T{321, --[[XTemplate sectionPowerGrid Text]] "Total demand<right><power(consumption)>"},
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Text', T{322, --[[XTemplate sectionPowerGrid Text]] "Stored Power<right><power(current_storage)>"},
		}),
		}),
})

