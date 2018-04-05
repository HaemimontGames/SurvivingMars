-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "sectionAirGrid",
	PlaceObj('XTemplateTemplate', {
		'__context', function (parent, context)
return context:IsKindOfClasses("AirProducer", "AirStorage") and context.air and context.air.grid 
	or context:IsKindOf("LifeSupportGridElement") and context.pillar and context.water and context.water.grid and context.water.grid.air_grid
end,
		'__condition', function (parent, context) return context end,
		'__template', "InfopanelSection",
		'RolloverText', T{946079411041, --[[XTemplate sectionAirGrid RolloverText]] "<UISectionAirGridRollover>"},
		'Title', T{536, --[[XTemplate sectionAirGrid Title]] "Oxygen grid"},
		'Icon', "UI/Icons/Sections/life_support_grid.tga",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Text', T{541, --[[XTemplate sectionAirGrid Text]] "Oxygen production<right><air(current_production)>"},
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Text', T{327, --[[XTemplate sectionAirGrid Text]] "Total demand<right><air(consumption)>"},
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Text', T{328, --[[XTemplate sectionAirGrid Text]] "Stored Oxygen<right><air(current_storage)>"},
		}),
		}),
})

