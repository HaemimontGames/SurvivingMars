-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "sectionAirStorage",
	PlaceObj('XTemplateTemplate', {
		'__context_of_kind', "AirStorage",
		'__template', "InfopanelSection",
		'RolloverText', T{520, --[[XTemplate sectionAirStorage RolloverText]] "Oxygen storage parameters and status. Oxygen is consumed only when demanded."},
		'RolloverTitle', T{186451833281, --[[XTemplate sectionAirStorage RolloverTitle]] "Oxygen Storage"},
		'Icon', "UI/Icons/Sections/Oxygen_4.tga",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__context', function (parent, context) return context.air end,
			'__template', "InfopanelProgress",
			'BindTo', "StoragePercent",
		}),
		PlaceObj('XTemplateTemplate', {
			'__context', function (parent, context) return context.air end,
			'__template', "InfopanelText",
			'Text', T{167218330040, --[[XTemplate sectionAirStorage Text]] "<UIMode>"},
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Text', T{521, --[[XTemplate sectionAirStorage Text]] "Stored Oxygen<right><air(StoredAir)>"},
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Text', T{522, --[[XTemplate sectionAirStorage Text]] "Capacity<right><air(air_capacity)>"},
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Text', T{7783, --[[XTemplate sectionAirStorage Text]] "Max output<right><air(max_air_discharge)>"},
		}),
		}),
})

