-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "sectionResearchProject",
	PlaceObj('XTemplateTemplate', {
		'__context_of_kind', "ResearchBuilding",
		'__template', "InfopanelButton",
		'RolloverText', T{368, --[[XTemplate sectionResearchProject RolloverText]] "Open the Research screen to select a new Technology to be researched."},
		'RolloverTitle', T{367, --[[XTemplate sectionResearchProject RolloverTitle]] "Research technology"},
		'OnPressParam', "UIResearchTech",
		'Icon', "UI/Icons/IPButtons/research.tga",
	}),
	PlaceObj('XTemplateTemplate', {
		'__context_of_kind', "ResearchBuilding",
		'__template', "InfopanelSection",
		'RolloverText', T{765045268446, --[[XTemplate sectionResearchProject RolloverText]] "Contributes to the currently selected research project: <em><UIResearchProject></em>. The following stats are summary of the predicted Research production for the current Sol.<newline><newline>Base research per Sol<right><research(EstimatedDailyTotal)><newline><left>Research per Sol<right><research(EstimatedDailyProduction)><newline><left>Collaboration loss<right><research(EstimatedDailyLoss)><newline><newline><left>Lifetime research<right><research(research_points_lifetime)>"},
		'RolloverTitle', T{308, --[[XTemplate sectionResearchProject RolloverTitle]] "Research Progress <percent(ResearchProgress)>"},
		'Title', T{452635643808, --[[XTemplate sectionResearchProject Title]] "<UIResearchProject>"},
		'Icon', "UI/Icons/Sections/research_1.tga",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelProgress",
			'BindTo', "ResearchProgress",
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Text', T{445070088246, --[[XTemplate sectionResearchProject Text]] "Research per Sol<right><research(EstimatedDailyProduction)>"},
		}),
		}),
})

