-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "sectionPowerGrid",
	PlaceObj('XTemplateTemplate', {
		'__context', function (parent, context) return context:ShowUISectionElectricityGrid() and context.electricity end,
		'__condition', function (parent, context) return context and context.grid end,
		'__template', "InfopanelSection",
		'RolloverText', T(957982342940, --[[XTemplate sectionPowerGrid RolloverText]] "<UISectionPowerGridRollover>"),
		'OnContextUpdate', function (self, context, ...)
self.idCurrentProduction:SetText(T{576, --[[XTemplate sectionPowerGrid Text]] "Power production<right><power(current_production)>", context.grid})
self.idConsumption:SetText(T{321, --[[XTemplate sectionPowerGrid Text]] "Total demand<right><power(consumption)>", context.grid})
self.idCurrentStorage:SetText( T{322, --[[XTemplate sectionPowerGrid Text]] "Stored Power<right><power(current_storage)>", current_storage = context.grid and context.grid.current_storage or 0})
XSection.OnContextUpdate(self, context, ...)
end,
		'Title', T(571, --[[XTemplate sectionPowerGrid Title]] "Power grid"),
		'Icon', "UI/Icons/Sections/electricity_1.tga",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Id', "idCurrentProduction",
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Id', "idConsumption",
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Id', "idCurrentStorage",
		}),
		}),
})

