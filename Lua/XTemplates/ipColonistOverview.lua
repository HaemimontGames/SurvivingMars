-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "ipColonistOverview",
	PlaceObj('XTemplateTemplate', {
		'__template', "Infopanel",
		'Description', T{7383, --[[XTemplate ipColonistOverview Description]] "<description>"},
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "customColonyOverviewButtons",
		}),
		PlaceObj('XTemplateTemplate', {
			'comment', "Colonists",
			'__template', "InfopanelSection",
			'RolloverText', T{131743729104, --[[XTemplate ipColonistOverview RolloverText]] "<AgeGroupsText>"},
			'RolloverTitle', T{987289847467, --[[XTemplate ipColonistOverview RolloverTitle]] "Age Groups"},
			'Title', T{892778823326, --[[XTemplate ipColonistOverview Title]] "<nbsp>Colonists<right><colonist(ColonistCount)>"},
			'Icon', "UI/Icons/Sections/colonist.tga",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T{826833284493, --[[XTemplate ipColonistOverview Text]] "<EmploymentMessage>"},
			}),
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T{943829010907, --[[XTemplate ipColonistOverview Text]] "<ResidenceMessage>"},
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelSection",
			'RolloverText', T{976447044595, --[[XTemplate ipColonistOverview RolloverText]] "The average <em>Health</em> of all Colonists."},
			'RolloverTitle', T{455859065748, --[[XTemplate ipColonistOverview RolloverTitle]] "Average Health <Stat(AverageHealth)>"},
			'Icon', "UI/Icons/Sections/health.tga",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelStat",
				'BindTo', "AverageHealth",
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelSection",
			'RolloverText', T{892876077694, --[[XTemplate ipColonistOverview RolloverText]] "The average <em>Sanity</em> of all Colonists."},
			'RolloverTitle', T{942703008133, --[[XTemplate ipColonistOverview RolloverTitle]] "Average Sanity <Stat(AverageSanity)>"},
			'Icon', "UI/Icons/Sections/stress.tga",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelStat",
				'BindTo', "AverageSanity",
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelSection",
			'RolloverText', T{272439898097, --[[XTemplate ipColonistOverview RolloverText]] "The average <em>Comfort</em> of all Colonists."},
			'RolloverTitle', T{577070564514, --[[XTemplate ipColonistOverview RolloverTitle]] "Average Comfort <Stat(AverageComfort)>"},
			'Icon', "UI/Icons/Sections/comfort.tga",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelStat",
				'BindTo', "AverageComfort",
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelSection",
			'RolloverText', T{829473930900, --[[XTemplate ipColonistOverview RolloverText]] "The average <em>Morale</em> of all Colonists."},
			'RolloverTitle', T{765210150801, --[[XTemplate ipColonistOverview RolloverTitle]] "Average Morale <Stat(AverageMorale)>"},
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
			'Title', T{282453782313, --[[XTemplate ipColonistOverview Title]] "Jobs"},
			'Icon', "UI/Icons/Sections/colonist.tga",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T{496659953784, --[[XTemplate ipColonistOverview Text]] "<JobsText>"},
			}),
			}),
		PlaceObj('XTemplateTemplate', {
			'comment', "Living Space",
			'__template', "InfopanelSection",
			'Title', T{591768750642, --[[XTemplate ipColonistOverview Title]] "Living space"},
			'Icon', "UI/Icons/Sections/colonist.tga",
		}, {
			PlaceObj('XTemplateTemplate', {
				'__template', "InfopanelText",
				'Text', T{576195608635, --[[XTemplate ipColonistOverview Text]] "<LivingSpaceText>"},
			}),
			}),
		}),
})

