-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "sectionWaterGrid",
	PlaceObj('XTemplateTemplate', {
		'__context', function (parent, context)
			return context:IsKindOfClasses("WaterProducer", "WaterStorage") and context.water  
				or context:IsKindOf("LifeSupportGridElement") and not IsKindOf(context, "ConstructionSite") and context.pillar and context.water
		end,
		'__condition', function (parent, context) return context and context.grid end,
		'__template', "InfopanelSection",
		'RolloverText', T(733271764708, --[[XTemplate sectionWaterGrid RolloverText]] "<UISectionWaterGridRollover>"),
		'OnContextUpdate', function (self, context, ...)
			self.idCurrentProduction:SetText(T{545, --[[XTemplate sectionWaterGrid Text]] "Water production<right><water(current_production)>", context.grid})
			self.idConsumption:SetText(T{332, --[[XTemplate sectionWaterGrid Text]] "Total demand<right><water(consumption)>", context.grid})
			self.idCurrentStorage:SetText(T{333, --[[XTemplate sectionWaterGrid Text]] "Stored Water<right><water(current_storage)>", current_storage = context.grid and context.grid.current_storage or 0})
			XSection.OnContextUpdate(self, context, ...)
		end,
		'Title', T(542, --[[XTemplate sectionWaterGrid Title]] "Water grid"),
		'Icon', "UI/Icons/Sections/life_support_grid.tga",
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

