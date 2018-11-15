-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "ipResourceOverview",
	PlaceObj('XTemplateTemplate', {
		'__context_of_kind', "ResourceOverview",
		'__template', "Infopanel",
		'InitialMode', "ResourceOverview",
		'InternalModes', "ResourceOverview,ColonistOverview,TraitsOverview",
		'Description', T{7383, --[[XTemplate ipResourceOverview Description]] "<description>"},
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "customColonyOverviewButtons",
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XContentTemplate",
			'IdNode', false,
			'LayoutMethod', "VList",
			'RespawnOnContext', false,
		}, {
			PlaceObj('XTemplateMode', {
				'mode', "ResourceOverview",
			}, {
				PlaceObj('XTemplateTemplate', {
					'__template', "InfopanelSection",
					'RolloverText', T{436167298715, --[[XTemplate ipResourceOverview RolloverText]] "<FundingRollover>"},
					'Title', T{3613, --[[XTemplate ipResourceOverview Title]] "Funding"},
					'Icon', "UI/Icons/Sections/PreciousMetals_1.tga",
				}, {
					PlaceObj('XTemplateTemplate', {
						'__template', "InfopanelText",
						'Text', T{3617, --[[XTemplate ipResourceOverview Text]] "Available funding<right><white><funding(Funding)></white>"},
					}),
					}),
				PlaceObj('XTemplateTemplate', {
					'__template', "InfopanelSection",
					'RolloverText', T{491631842119, --[[XTemplate ipResourceOverview RolloverText]] "<ResearchRollover>"},
					'Title', T{357380421238, --[[XTemplate ipResourceOverview Title]] "Research"},
					'Icon', "UI/Icons/Sections/research_1.tga",
				}, {
					PlaceObj('XTemplateTemplate', {
						'__template', "InfopanelText",
						'Text', T{7873, --[[XTemplate ipResourceOverview Text]] "Research per Sol<right><white><ResearchPoints(EstimatedRP)></white>"},
					}),
					}),
				PlaceObj('XTemplateTemplate', {
					'__template', "InfopanelSection",
					'RolloverText', T{293266371918, --[[XTemplate ipResourceOverview RolloverText]] "<GridRollover>"},
					'Title', T{3618, --[[XTemplate ipResourceOverview Title]] "Grid Resources"},
					'Icon', "UI/Icons/Sections/grid.tga",
				}, {
					PlaceObj('XTemplateTemplate', {
						'__template', "InfopanelText",
						'Text', T{195574843186, --[[XTemplate ipResourceOverview Text]] "<PowerLine>"},
					}),
					PlaceObj('XTemplateTemplate', {
						'__template', "InfopanelText",
						'Text', T{865218030019, --[[XTemplate ipResourceOverview Text]] "<AirLine>"},
					}),
					PlaceObj('XTemplateTemplate', {
						'__template', "InfopanelText",
						'Text', T{414702080411, --[[XTemplate ipResourceOverview Text]] "<WaterLine>"},
					}),
					}),
				PlaceObj('XTemplateTemplate', {
					'__template', "InfopanelSection",
					'RolloverText', T{973078040656, --[[XTemplate ipResourceOverview RolloverText]] "<BasicResourcesRollover>"},
					'Title', T{494, --[[XTemplate ipResourceOverview Title]] "Basic Resources"},
					'Icon', "UI/Icons/Sections/basic.tga",
				}, {
					PlaceObj('XTemplateTemplate', {
						'__template', "InfopanelText",
						'Text', T{3650, --[[XTemplate ipResourceOverview Text]] "Metals<right><metals(AvailableMetals)>"},
					}),
					PlaceObj('XTemplateTemplate', {
						'__template', "InfopanelText",
						'Text', T{3651, --[[XTemplate ipResourceOverview Text]] "Concrete<right><concrete(AvailableConcrete)>"},
					}),
					PlaceObj('XTemplateTemplate', {
						'__template', "InfopanelText",
						'Text', T{3652, --[[XTemplate ipResourceOverview Text]] "Food<right><food(AvailableFood)>"},
					}),
					PlaceObj('XTemplateTemplate', {
						'__template', "InfopanelText",
						'Text', T{3653, --[[XTemplate ipResourceOverview Text]] "Rare Metals<right><preciousmetals(AvailablePreciousMetals)>"},
					}),
					}),
				PlaceObj('XTemplateTemplate', {
					'__template', "InfopanelSection",
					'RolloverText', T{574634411619, --[[XTemplate ipResourceOverview RolloverText]] "<AdvancedResourcesRollover>"},
					'Title', T{500, --[[XTemplate ipResourceOverview Title]] "Advanced Resources"},
					'Icon', "UI/Icons/Sections/advanced.tga",
				}, {
					PlaceObj('XTemplateTemplate', {
						'__template', "InfopanelText",
						'Text', T{3669, --[[XTemplate ipResourceOverview Text]] "Polymers<right><polymers(AvailablePolymers)>"},
					}),
					PlaceObj('XTemplateTemplate', {
						'__template', "InfopanelText",
						'Text', T{3670, --[[XTemplate ipResourceOverview Text]] "Electronics<right><electronics(AvailableElectronics)>"},
					}),
					PlaceObj('XTemplateTemplate', {
						'__template', "InfopanelText",
						'Text', T{3671, --[[XTemplate ipResourceOverview Text]] "Machine Parts<right><machineparts(AvailableMachineParts)>"},
					}),
					PlaceObj('XTemplateTemplate', {
						'__template', "InfopanelText",
						'Text', T{3672, --[[XTemplate ipResourceOverview Text]] "Fuel<right><fuel(AvailableFuel)>"},
					}),
					}),
				}),
			PlaceObj('XTemplateMode', {
				'mode', "ColonistOverview",
			}, {
				PlaceObj('XTemplateTemplate', {
					'comment', "Colonists",
					'__template', "InfopanelSection",
					'RolloverText', T{131743729104, --[[XTemplate ipResourceOverview RolloverText]] "<AgeGroupsText>"},
					'RolloverTitle', T{987289847467, --[[XTemplate ipResourceOverview RolloverTitle]] "Age Groups"},
					'Title', T{782298266613, --[[XTemplate ipResourceOverview Title]] "<nbsp>Colonists<right><colonist(ColonistCount)>"},
					'Icon', "UI/Icons/Sections/colonist.tga",
				}, {
					PlaceObj('XTemplateTemplate', {
						'__template', "InfopanelText",
						'Text', T{826833284493, --[[XTemplate ipResourceOverview Text]] "<EmploymentMessage>"},
					}),
					PlaceObj('XTemplateTemplate', {
						'__template', "InfopanelText",
						'Text', T{943829010907, --[[XTemplate ipResourceOverview Text]] "<ResidenceMessage>"},
					}),
					}),
				PlaceObj('XTemplateTemplate', {
					'__template', "InfopanelSection",
					'RolloverText', T{976447044595, --[[XTemplate ipResourceOverview RolloverText]] "The average <em>Health</em> of all Colonists."},
					'RolloverTitle', T{455859065748, --[[XTemplate ipResourceOverview RolloverTitle]] "Average Health <Stat(AverageHealth)>"},
					'Icon', "UI/Icons/Sections/health.tga",
				}, {
					PlaceObj('XTemplateTemplate', {
						'__template', "InfopanelStat",
						'BindTo', "AverageHealth",
					}),
					}),
				PlaceObj('XTemplateTemplate', {
					'__template', "InfopanelSection",
					'RolloverText', T{892876077694, --[[XTemplate ipResourceOverview RolloverText]] "The average <em>Sanity</em> of all Colonists."},
					'RolloverTitle', T{942703008133, --[[XTemplate ipResourceOverview RolloverTitle]] "Average Sanity <Stat(AverageSanity)>"},
					'Icon', "UI/Icons/Sections/stress.tga",
				}, {
					PlaceObj('XTemplateTemplate', {
						'__template', "InfopanelStat",
						'BindTo', "AverageSanity",
					}),
					}),
				PlaceObj('XTemplateTemplate', {
					'__template', "InfopanelSection",
					'RolloverText', T{272439898097, --[[XTemplate ipResourceOverview RolloverText]] "The average <em>Comfort</em> of all Colonists."},
					'RolloverTitle', T{577070564514, --[[XTemplate ipResourceOverview RolloverTitle]] "Average Comfort <Stat(AverageComfort)>"},
					'Icon', "UI/Icons/Sections/comfort.tga",
				}, {
					PlaceObj('XTemplateTemplate', {
						'__template', "InfopanelStat",
						'BindTo', "AverageComfort",
					}),
					}),
				PlaceObj('XTemplateTemplate', {
					'__template', "InfopanelSection",
					'RolloverText', T{829473930900, --[[XTemplate ipResourceOverview RolloverText]] "The average <em>Morale</em> of all Colonists."},
					'RolloverTitle', T{765210150801, --[[XTemplate ipResourceOverview RolloverTitle]] "Average Morale <Stat(AverageMorale)>"},
					'Icon', "UI/Icons/Sections/morale.tga",
				}, {
					PlaceObj('XTemplateTemplate', {
						'__template', "InfopanelStat",
						'BindTo', "AverageMorale",
					}),
					}),
				PlaceObj('XTemplateTemplate', {
					'comment', "Jobs",
					'__template', "InfopanelSection",
					'Title', T{282453782313, --[[XTemplate ipResourceOverview Title]] "Jobs"},
					'Icon', "UI/Icons/Sections/colonist.tga",
				}, {
					PlaceObj('XTemplateTemplate', {
						'__template', "InfopanelText",
						'Text', T{496659953784, --[[XTemplate ipResourceOverview Text]] "<JobsText>"},
					}),
					}),
				PlaceObj('XTemplateTemplate', {
					'comment', "Living Space",
					'__template', "InfopanelSection",
					'Title', T{591768750642, --[[XTemplate ipResourceOverview Title]] "Living space"},
					'Icon', "UI/Icons/Sections/colonist.tga",
				}, {
					PlaceObj('XTemplateTemplate', {
						'__template', "InfopanelText",
						'Text', T{576195608635, --[[XTemplate ipResourceOverview Text]] "<LivingSpaceText>"},
					}),
					}),
				}),
			PlaceObj('XTemplateMode', {
				'mode', "TraitsOverview",
			}, {
				PlaceObj('XTemplateTemplate', {
					'comment', "specializations",
					'__template', "InfopanelSection",
					'RolloverText', T{7860, --[[XTemplate ipResourceOverview RolloverText]] "Specializations allow your colonists to perform particular jobs better."},
					'RolloverTitle', T{7856, --[[XTemplate ipResourceOverview RolloverTitle]] "Specializations"},
					'Title', T{7856, --[[XTemplate ipResourceOverview Title]] "Specializations"},
					'Icon', "UI/Icons/Sections/colonist.tga",
				}, {
					PlaceObj('XTemplateTemplate', {
						'__template', "InfopanelText",
						'Text', T{280884154178, --[[XTemplate ipResourceOverview Text]] "<SpecializationsText>"},
					}),
					}),
				PlaceObj('XTemplateTemplate', {
					'comment', "Perks",
					'__template', "InfopanelSection",
					'RolloverText', T{7978, --[[XTemplate ipResourceOverview RolloverText]] "<PerksRolloverText>"},
					'RolloverTitle', T{3934, --[[XTemplate ipResourceOverview RolloverTitle]] "Perks"},
					'Title', T{3934, --[[XTemplate ipResourceOverview Title]] "Perks"},
					'Icon', "UI/Icons/Sections/colonist.tga",
				}, {
					PlaceObj('XTemplateTemplate', {
						'__template', "InfopanelText",
						'Text', T{954721631190, --[[XTemplate ipResourceOverview Text]] "<PerksText>"},
					}),
					}),
				PlaceObj('XTemplateTemplate', {
					'comment', "Flaws",
					'__template', "InfopanelSection",
					'RolloverText', T{7979, --[[XTemplate ipResourceOverview RolloverText]] "<FlawsRolloverText>"},
					'RolloverTitle', T{3936, --[[XTemplate ipResourceOverview RolloverTitle]] "Flaws"},
					'Title', T{3936, --[[XTemplate ipResourceOverview Title]] "Flaws"},
					'Icon', "UI/Icons/Sections/colonist.tga",
				}, {
					PlaceObj('XTemplateTemplate', {
						'__template', "InfopanelText",
						'Text', T{300967997980, --[[XTemplate ipResourceOverview Text]] "<FlawsText>"},
					}),
					}),
				PlaceObj('XTemplateTemplate', {
					'comment', "Rare Traits",
					'__template', "InfopanelSection",
					'RolloverText', T{7980, --[[XTemplate ipResourceOverview RolloverText]] "<RareTraitsRollover>"},
					'RolloverTitle', T{7857, --[[XTemplate ipResourceOverview RolloverTitle]] "Rare Traits"},
					'Title', T{7857, --[[XTemplate ipResourceOverview Title]] "Rare Traits"},
					'Icon', "UI/Icons/Sections/colonist.tga",
				}, {
					PlaceObj('XTemplateTemplate', {
						'__template', "InfopanelText",
						'Text', T{779865575637, --[[XTemplate ipResourceOverview Text]] "<RareTraits>"},
					}),
					}),
				}),
			}),
		PlaceObj('XTemplateTemplate', {
			'__template', "sectionCheats",
		}),
		}),
})

