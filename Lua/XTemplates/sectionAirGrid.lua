-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "sectionAirGrid",
	PlaceObj('XTemplateTemplate', {
		'__context', function (parent, context)
			return context:IsKindOfClasses("AirProducer", "AirStorage") and context.air 
				or context:IsKindOf("LifeSupportGridElement") and context.pillar and context.water
		end,
		'__condition', function (parent, context)
			if not context then return end
			local building = context.building
			return building:IsKindOfClasses("AirProducer", "AirStorage") and building.air and building.air.grid
				or building:IsKindOf("LifeSupportGridElement") and building.pillar and building.water and building.water.grid and building.water.grid.air_grid
		end,
		'__template', "InfopanelSection",
		'RolloverText', T(946079411041, --[[XTemplate sectionAirGrid RolloverText]] "<UISectionAirGridRollover>"),
		'OnContextUpdate', function (self, context, ...)
			local building = context.building
			local grid = building:IsKindOfClasses("AirProducer", "AirStorage") and building.air and building.air.grid
					or building:IsKindOf("LifeSupportGridElement") and building.pillar and building.water and building.water.grid and building.water.grid.air_grid
			self.idCurrentProduction:SetText(T{541, --[[XTemplate sectionAirGrid Text]] "Oxygen production<right><air(current_production)>", grid})
			self.idConsumption:SetText( T{327, --[[XTemplate sectionAirGrid Text]] "Total demand<right><air(consumption)>", grid})
			self.idCurrentStorage:SetText(T{328, --[[XTemplate sectionAirGrid Text]] "Stored Oxygen<right><air(current_storage)>", current_storage = grid.current_storage})
			XSection.OnContextUpdate(self, context, ...)
		end,
		'Title', T(536, --[[XTemplate sectionAirGrid Title]] "Oxygen grid"),
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

