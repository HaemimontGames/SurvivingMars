-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "sectionAirProduction",
	PlaceObj('XTemplateTemplate', {
		'__context_of_kind', "AirProducer",
		'__template', "InfopanelSection",
		'RolloverText', T(145812907055, --[[XTemplate sectionAirProduction RolloverText]] "<UISectionAirProductionRollover>"),
		'Title', T(80, --[[XTemplate sectionAirProduction Title]] "Production"),
		'Icon', "UI/Icons/Sections/Oxygen_2.tga",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Text', T(486, --[[XTemplate sectionAirProduction Text]] "Oxygen production<right><air(AirProduction)>"),
		}),
		PlaceObj('XTemplateTemplate', {
			'__dlc', "armstrong",
			'__context_of_kind', "MOXIE",
			'__condition', function (parent, context) return not g_NoTerraforming end,
			'__template', "InfopanelText",
			'Text', T(938653781377, --[[XTemplate sectionAirProduction Text]] "Terraforming boost<right><modifier_percent('air_production', 'TP Boost Atmosphere')>"),
		}),
		}),
})

