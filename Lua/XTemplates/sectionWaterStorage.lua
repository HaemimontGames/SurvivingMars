-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "sectionWaterStorage",
	PlaceObj('XTemplateTemplate', {
		'__context_of_kind', "WaterStorage",
		'__template', "InfopanelSection",
		'RolloverText', T(692032513952, --[[XTemplate sectionWaterStorage RolloverText]] "Water storage parameters and status. Water is consumed only when demanded."),
		'RolloverTitle', T(956519352717, --[[XTemplate sectionWaterStorage RolloverTitle]] "Water Storage"),
		'Icon', "UI/Icons/Sections/Water_4.tga",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__context', function (parent, context) return context.water end,
			'__template', "InfopanelProgress",
			'BindTo', "StoragePercent",
		}),
		PlaceObj('XTemplateTemplate', {
			'__context', function (parent, context) return context.water end,
			'__template', "InfopanelText",
			'Text', T(167218330040, --[[XTemplate sectionWaterStorage Text]] "<UIMode>"),
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Text', T(523, --[[XTemplate sectionWaterStorage Text]] "Stored Water<right><water(StoredWater)>"),
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Text', T(111319356806, --[[XTemplate sectionWaterStorage Text]] "Capacity<right><water(water_capacity)>"),
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Text', T(7785, --[[XTemplate sectionWaterStorage Text]] "Max output<right><water(max_water_discharge)>"),
		}),
		}),
})

