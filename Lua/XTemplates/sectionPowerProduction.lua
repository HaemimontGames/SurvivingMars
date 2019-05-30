-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "sectionPowerProduction",
	PlaceObj('XTemplateTemplate', {
		'__condition', function (parent, context) return context and context:ShowUISectionElectricityProduction() end,
		'__template', "InfopanelSection",
		'RolloverText', T(508800248152, --[[XTemplate sectionPowerProduction RolloverText]] "Production per Sol<right><power(UIPowerProductionToday)><newline><left>Lifetime production<right><power(UIPowerProductionLifetime)>"),
		'Title', T(80, --[[XTemplate sectionPowerProduction Title]] "Production"),
		'Icon', "UI/Icons/Sections/electricity_2.tga",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Text', T(437, --[[XTemplate sectionPowerProduction Text]] "Power production<right><power(UIPowerProduction)>"),
		}),
		PlaceObj('XTemplateTemplate', {
			'__context_of_kind', "WindTurbine",
			'__template', "InfopanelText",
			'Text', T(438, --[[XTemplate sectionPowerProduction Text]] "Elevation boost<right><ElevationBonus>%"),
		}),
		PlaceObj('XTemplateTemplate', {
			'__dlc', "armstrong",
			'__context_of_kind', "WindTurbine",
			'__condition', function (parent, context) return not g_NoTerraforming end,
			'__template', "InfopanelText",
			'Text', T(433366911234, --[[XTemplate sectionPowerProduction Text]] "Terraforming boost<right><modifier_percent('electricity_production', 'TP Boost Atmosphere')>"),
		}),
		PlaceObj('XTemplateTemplate', {
			'__dlc', "armstrong",
			'__context_of_kind', "SolarPanel",
			'__condition', function (parent, context) return not g_NoTerraforming end,
			'__template', "InfopanelText",
			'Text', T(12120, --[[XTemplate sectionPowerProduction Text]] "Atmospheric effect<right><percent(TPBoostAtmosphere)>"),
		}),
		PlaceObj('XTemplateTemplate', {
			'__dlc', "armstrong",
			'__context_of_kind', "SolarPanelBuilding",
			'__condition', function (parent, context) return g_SpecialProjectCompleted and g_SpecialProjectCompleted["LaunchSpaceMirror"] end,
			'__template', "InfopanelText",
			'Text', T(272429157241, --[[XTemplate sectionPowerProduction Text]] "Space Mirror<right><modifier_percent('electricity_production', 'spacemirror')>"),
		}),
		}),
	PlaceObj('XTemplateTemplate', {
		'__context_of_kind', "SolarPanel",
		'__condition', function (parent, context) return (rawget(context, "black_cube_interaction_perc_for_ui") or 0) > 0 end,
		'__template', "InfopanelSection",
		'RolloverText', T(439, --[[XTemplate sectionPowerProduction RolloverText]] "When in close proximity, a high number of Black Cubes seem to improve the efficiency of the Solar Panels."),
		'Title', T(405, --[[XTemplate sectionPowerProduction Title]] "Proximity to Black Cubes"),
		'Icon', "UI/Icons/Sections/attention.tga",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Text', T(440, --[[XTemplate sectionPowerProduction Text]] "<em><percent(black_cube_interaction_perc_for_ui)></em> improved Power production"),
		}),
		}),
	PlaceObj('XTemplateTemplate', {
		'__context_of_kind', "SolarPanelBuilding",
		'__template', "InfopanelSection",
		'OnContextUpdate', function (self, context, ...)
			self:SetVisible(context:GetEletricityUnderproduction() ~= 0)
		end,
		'Title', T(277, --[[XTemplate sectionPowerProduction Title]] "Attention"),
		'Icon', "UI/Icons/Sections/attention.tga",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'FoldWhenHidden', true,
			'ContextUpdateOnOpen', true,
			'OnContextUpdate', function (self, context, ...)
				self:SetVisible(not g_DustStorm and context:GetUIPowerProduction() == 0)
			end,
			'Text', T(443, --[[XTemplate sectionPowerProduction Text]] "Not producing Power during the night"),
		}),
		}),
})

