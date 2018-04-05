-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "sectionVisitors",
	PlaceObj('XTemplateTemplate', {
		'__context_of_kind', "Service",
		'__template', "InfopanelSection",
		'RolloverText', T{7423, --[[XTemplate sectionVisitors RolloverText]] "Each Service Building will accept a number of visitors during each open work shift. Colonists seek to visit a building corresponding to one of their interests chosen every Sol at random. The visit will improve their Comfort up to the Service Comfort value."},
		'Title', T{526, --[[XTemplate sectionVisitors Title]] "Visitors"},
		'Icon', "UI/Icons/Sections/colonist.tga",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Text', T{708009583391, --[[XTemplate sectionVisitors Text]] "Inside<right><count(visitors)>/<colonist(max_visitors)>"},
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Text', T{529, --[[XTemplate sectionVisitors Text]] "Today<right><colonist(visitors_per_day)>"},
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Text', T{530, --[[XTemplate sectionVisitors Text]] "Lifetime<right><colonist(visitors_lifetime)>"},
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Text', T{531, --[[XTemplate sectionVisitors Text]] "Service Comfort<right><Stat(EffectiveServiceComfort)>"},
		}),
		}),
})

