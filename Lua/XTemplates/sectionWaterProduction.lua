-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "sectionWaterProduction",
	PlaceObj('XTemplateTemplate', {
		'__context_of_kind', "WaterProducer",
		'__template', "InfopanelSection",
		'RolloverText', T{502733614779, --[[XTemplate sectionWaterProduction RolloverText]] "<UISectionWaterProductionRollover>"},
		'Title', T{80, --[[XTemplate sectionWaterProduction Title]] "Production"},
		'Icon', "UI/Icons/Sections/Water_2.tga",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Text', T{840359936837, --[[XTemplate sectionWaterProduction Text]] "<WaterProductionText>"},
		}),
		PlaceObj('XTemplateTemplate', {
			'__condition', function (parent, context) return context:IsKindOf("ResourceProducer") and context.wasterock_producer end,
			'__template', "InfopanelText",
			'Text', T{474, --[[XTemplate sectionWaterProduction Text]] "Stored Waste Rock<right><wasterock(GetWasterockAmountStored,wasterock_max_storage)>"},
		}),
		}),
})

