-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "sectionConsumption",
	PlaceObj('XTemplateTemplate', {
		'__context_of_kind', "Building",
		'__condition', function (parent, context) return context:ShowUISectionConsumption() end,
		'__template', "InfopanelSection",
		'RolloverText', T(792334033908, --[[XTemplate sectionConsumption RolloverText]] "<UISectionConsumptionRollover>"),
		'OnContextUpdate', function (self, context, ...)
context:UpdateUISectionConsumption(self)
end,
		'Title', T(425713963756, --[[XTemplate sectionConsumption Title]] "Consumption"),
		'Icon', "UI/Icons/Sections/grid.tga",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Id', "idPower",
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Id', "idAir",
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Id', "idWater",
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Id', "idStoredWater",
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Id', "idResource",
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Id', "idFood",
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Id', "idUpgrade",
		}),
		}),
})

