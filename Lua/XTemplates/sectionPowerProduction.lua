-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "sectionPowerProduction",
	PlaceObj('XTemplateTemplate', {
		'__context_of_kind', "ElectricityProducer",
		'__condition', function (parent, context) return context and context:ShowUISectionElectricityProduction() end,
		'__template', "InfopanelSection",
		'RolloverText', T{508800248152, --[[XTemplate sectionPowerProduction RolloverText]] "Production per Sol<right><power(UIPowerProductionToday)><newline><left>Lifetime production<right><power(UIPowerProductionLifetime)>"},
		'Title', T{80, --[[XTemplate sectionPowerProduction Title]] "Production"},
		'Icon', "UI/Icons/Sections/electricity_2.tga",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Text', T{437, --[[XTemplate sectionPowerProduction Text]] "Power production<right><power(UIPowerProduction)>"},
		}),
		PlaceObj('XTemplateTemplate', {
			'__context_of_kind', "WindTurbine",
			'__template', "InfopanelText",
			'Text', T{438, --[[XTemplate sectionPowerProduction Text]] "Elevation boost<right><ElevationBonus>%"},
		}),
		}),
	PlaceObj('XTemplateTemplate', {
		'__context_of_kind', "SolarPanel",
		'__condition', function (parent, context) return (rawget(context, "black_cube_interaction_perc_for_ui") or 0) > 0 end,
		'__template', "InfopanelSection",
		'RolloverText', T{439, --[[XTemplate sectionPowerProduction RolloverText]] "When in close proximity, a high number of Black Cubes seem to improve the efficiency of the Solar Panels."},
		'Title', T{405, --[[XTemplate sectionPowerProduction Title]] "Proximity to Black Cubes"},
		'Icon', "UI/Icons/Sections/attention.tga",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Text', T{440, --[[XTemplate sectionPowerProduction Text]] "<em><percent(black_cube_interaction_perc_for_ui)></em> improved Power production"},
		}),
		}),
	PlaceObj('XTemplateTemplate', {
		'__context_of_kind', "SolarPanel",
		'__template', "InfopanelSection",
		'OnContextUpdate', function (self, context, ...)
self:SetVisible(context:GetEletricityUnderproduction() ~= 0)
end,
		'Title', T{277, --[[XTemplate sectionPowerProduction Title]] "Attention"},
		'Icon', "UI/Icons/Sections/attention.tga",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'FoldWhenHidden', true,
			'ContextUpdateOnOpen', true,
			'OnContextUpdate', function (self, context, ...)
self:SetVisible(g_DustStorm and context:GetUIPowerProduction() ~= 0)
XText.OnContextUpdate(self, context, ...)				
end,
			'Text', T{442, --[[XTemplate sectionPowerProduction Text]] "Producing <em><power(EletricityUnderproduction)></em> less than optimal output due to Dust Storm"},
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'FoldWhenHidden', true,
			'ContextUpdateOnOpen', true,
			'OnContextUpdate', function (self, context, ...)
self:SetVisible(context:GetUIPowerProduction() == 0)
end,
			'Text', T{443, --[[XTemplate sectionPowerProduction Text]] "Not producing Power during the night"},
		}),
		}),
})

