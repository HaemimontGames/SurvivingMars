-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "sectionWaterGrid",
	PlaceObj('XTemplateTemplate', {
		'__context', function (parent, context)
return context:IsKindOfClasses("WaterProducer", "WaterStorage") and context.water and context.water.grid 
	or context:IsKindOf("LifeSupportGridElement") and context.pillar and context.water and context.water.grid
end,
		'__condition', function (parent, context) return context end,
		'__template', "InfopanelSection",
		'RolloverText', T{733271764708, --[[XTemplate sectionWaterGrid RolloverText]] "<UISectionWaterGridRollover>"},
		'Title', T{542, --[[XTemplate sectionWaterGrid Title]] "Water grid"},
		'Icon', "UI/Icons/Sections/life_support_grid.tga",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Text', T{545, --[[XTemplate sectionWaterGrid Text]] "Water production<right><water(current_production)>"},
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Text', T{332, --[[XTemplate sectionWaterGrid Text]] "Total demand<right><water(consumption)>"},
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Text', T{333, --[[XTemplate sectionWaterGrid Text]] "Stored Water<right><water(current_storage)>"},
		}),
		}),
})

