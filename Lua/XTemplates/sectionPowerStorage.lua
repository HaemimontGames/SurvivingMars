-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "sectionPowerStorage",
	PlaceObj('XTemplateTemplate', {
		'__context_of_kind', "ElectricityStorage",
		'__template', "InfopanelSection",
		'RolloverText', T{462, --[[XTemplate sectionPowerStorage RolloverText]] "Power storage parameters and status."},
		'RolloverTitle', T{461, --[[XTemplate sectionPowerStorage RolloverTitle]] "Power Storage"},
		'Icon', "UI/Icons/Sections/electricity_4.tga",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__context', function (parent, context) return context.electricity end,
			'__template', "InfopanelProgress",
			'BindTo', "StoragePercent",
		}),
		PlaceObj('XTemplateTemplate', {
			'__context', function (parent, context) return context.electricity end,
			'__template', "InfopanelText",
			'Text', T{463, --[[XTemplate sectionPowerStorage Text]] "<ElectricityUIMode>"},
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Text', T{464, --[[XTemplate sectionPowerStorage Text]] "Stored Power<right><power(StoredPower)>"},
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Text', T{465, --[[XTemplate sectionPowerStorage Text]] "Capacity<right><power(capacity)>"},
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Text', T{7784, --[[XTemplate sectionPowerStorage Text]] "Max output<right><power(max_electricity_discharge)>"},
		}),
		}),
})

