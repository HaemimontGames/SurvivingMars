-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "sectionResidence",
	PlaceObj('XTemplateTemplate', {
		'__context_of_kind', "Residence",
		'__template', "InfopanelSection",
		'RolloverText', T{327961439148, --[[XTemplate sectionResidence RolloverText]] "Colonists live and rest in Residential Buildings. Their Health and Sanity will deteriorate if they are homeless."},
		'Title', T{702480492408, --[[XTemplate sectionResidence Title]] "Residents<right><UIResidentsCount> / <colonist(UICapacity)>"},
		'Icon', "UI/Icons/Sections/colonist.tga",
		'TitleHAlign', "stretch",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "sectionResidenceList",
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Text', T{424588493338, --[[XTemplate sectionResidence Text]] "Comfort of residents<right><em><Stat(service_comfort)></em>"},
		}),
		}),
})

