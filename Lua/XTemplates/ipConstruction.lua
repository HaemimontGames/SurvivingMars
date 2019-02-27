-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "ipConstruction",
	PlaceObj('XTemplateTemplate', {
		'__template', "Infopanel",
		'Description', T(10, --[[XTemplate ipConstruction Description]] "<Description>"),
	}, {
		PlaceObj('XTemplateTemplate', {
			'comment', "construction cost",
			'__condition', function (parent, context) return context:HasConstructionCost() and not IsGameRuleActive("FreeConstruction") end,
			'__template', "InfopanelSection",
			'RolloverText', T(900, --[[XTemplate ipConstruction RolloverText]] "All resources have to be delivered to the site by Drones."),
			'Title', T(899, --[[XTemplate ipConstruction Title]] "Construction cost"),
			'Icon', "UI/Icons/Sections/construction.tga",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T(383306856338, --[[XTemplate ipConstruction Text]] "<ConstructionCost>"),
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'comment', "consumption",
			'__condition', function (parent, context) return context:HasConsumption() end,
			'__template', "InfopanelSection",
			'RolloverText', T(903, --[[XTemplate ipConstruction RolloverText]] "Base resource consumption of the building."),
			'Title', T(347, --[[XTemplate ipConstruction Title]] "Consumption"),
			'Icon', "UI/Icons/Sections/grid.tga",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T(705011232956, --[[XTemplate ipConstruction Text]] "<Consumption>"),
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'comment', "wind turbine terrain",
			'__condition', function (parent, context) return context.template_obj:IsKindOf("WindTurbine") end,
			'__template', "InfopanelSection",
			'RolloverText', T(905, --[[XTemplate ipConstruction RolloverText]] "Wind Turbines produce more Power at higher elevation."),
			'Title', T(904, --[[XTemplate ipConstruction Title]] "Terrain"),
			'Icon', "UI/Icons/Sections/construction.tga",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T(906, --[[XTemplate ipConstruction Text]] "Elevation Boost<right><ElevationBoost>%"),
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'comment', "status texts",
			'__template', "InfopanelSection",
			'RolloverText', T(907, --[[XTemplate ipConstruction RolloverText]] "Issues related to the placement of this building."),
			'Title', T(49, --[[XTemplate ipConstruction Title]] "Status"),
			'Icon', "UI/Icons/Sections/warning.tga",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T(969016274382, --[[XTemplate ipConstruction Text]] "<construction_statuses_property>"),
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'comment', "control hints",
			'__template', "InfopanelSection",
			'RolloverText', T(894, --[[XTemplate ipConstruction RolloverText]] "List of applicable shortcuts and what they do."),
			'Id', "idControlHints",
			'Title', T(893, --[[XTemplate ipConstruction Title]] "Control hints"),
			'Icon', "UI/Icons/Sections/attention.tga",
		}, {
			PlaceObj('XTemplateGroup', {
				'__condition', function (parent, context) return not UseGamepadUI() end,
			}, {
				PlaceObj('XTemplateTemplate', {
					'__template', "InfopanelText",
					'Text', T(908, --[[XTemplate ipConstruction Text]] "<left_click> Place"),
				}),
				PlaceObj('XTemplateTemplate', {
					'__template', "InfopanelText",
					'Text', T(909, --[[XTemplate ipConstruction Text]] "<right_click> Cancel"),
				}),
				PlaceObj('XTemplateTemplate', {
					'__condition', function (parent, context) return context.template_obj.can_rotate_during_placement end,
					'__template', "InfopanelText",
					'Text', T(910, --[[XTemplate ipConstruction Text]] "<middle_click> <em>(press)</em> / <em><ShortcutName('actionRotBuildingLeft')>, <ShortcutName('actionRotBuildingRight')></em> Rotate"),
				}),
				PlaceObj('XTemplateTemplate', {
					'__template', "InfopanelText",
					'Text', T(911, --[[XTemplate ipConstruction Text]] "<middle_click> Zoom in/out"),
				}),
				PlaceObj('XTemplateTemplate', {
					'__condition', function (parent, context) return not context.rocket end,
					'__template', "InfopanelText",
					'Text', T(912, --[[XTemplate ipConstruction Text]] "<em>Hold Shift</em> Place multiple"),
				}),
				PlaceObj('XTemplateTemplate', {
					'__condition', function (parent, context) return context:HasVariants() end,
					'__template', "InfopanelText",
					'Text', T(913, --[[XTemplate ipConstruction Text]] "Use <em>[</em> or <em>]</em> to cycle between visual variants for this building"),
				}),
				PlaceObj('XTemplateTemplate', {
					'__condition', function (parent, context) return context:HasTemplateVariants() end,
					'__template', "InfopanelText",
					'Text', T(8904, --[[XTemplate ipConstruction Text]] "Use <em>[</em> or <em>]</em> to cycle between buildings from the category"),
				}),
				}),
			PlaceObj('XTemplateGroup', {
				'__condition', function (parent, context) return UseGamepadUI() end,
			}, {
				PlaceObj('XTemplateTemplate', {
					'__template', "InfopanelText",
					'Text', T(914, --[[XTemplate ipConstruction Text]] "<ButtonA> Place"),
				}),
				PlaceObj('XTemplateTemplate', {
					'__template', "InfopanelText",
					'Text', T(915, --[[XTemplate ipConstruction Text]] "<ButtonB> Cancel"),
				}),
				PlaceObj('XTemplateTemplate', {
					'__condition', function (parent, context) return context.template_obj.can_rotate_during_placement end,
					'__template', "InfopanelText",
					'Text', T(916, --[[XTemplate ipConstruction Text]] "<LB> Rotate <RB>"),
				}),
				PlaceObj('XTemplateTemplate', {
					'__condition', function (parent, context) return not context.rocket end,
					'__template', "InfopanelText",
					'Text', T(7365, --[[XTemplate ipConstruction Text]] "<em>Hold<LT></em> Place multiple"),
				}),
				PlaceObj('XTemplateTemplate', {
					'__condition', function (parent, context) return context:HasVariants() end,
					'__template', "InfopanelText",
					'Text', T(917, --[[XTemplate ipConstruction Text]] "<DPadLeft> cycle visual variants <DPadRight>"),
				}),
				PlaceObj('XTemplateTemplate', {
					'__condition', function (parent, context) return context:HasTemplateVariants() end,
					'__template', "InfopanelText",
					'Text', T(8905, --[[XTemplate ipConstruction Text]] "<DPadLeft> cycle buildings from category <DPadRight>"),
				}),
				}),
			}),
		}),
})

