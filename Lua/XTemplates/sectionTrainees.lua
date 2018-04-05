-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "sectionTrainees",
	PlaceObj('XTemplateTemplate', {
		'__context_of_kind', "TrainingBuilding",
		'__condition', function (parent, context) return #context.visitors > 0 end,
		'__template', "InfopanelSection",
		'RolloverText', T{527, --[[XTemplate sectionTrainees RolloverText]] "Each Service Building will accept a number of visitors during each open work shift. Colonists seek to visit a building corresponding to one of their interests chosen every Sol at random. The visit will improve their Comfort up to the Service Comfort value."},
		'Title', T{526, --[[XTemplate sectionTrainees Title]] "Visitors"},
		'Icon', "UI/Icons/Sections/colonist.tga",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Text', T{708009583391, --[[XTemplate sectionTrainees Text]] "Inside<right><count(visitors)>/<colonist(max_visitors)>"},
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Text', T{529, --[[XTemplate sectionTrainees Text]] "Today<right><colonist(visitors_per_day)>"},
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Text', T{530, --[[XTemplate sectionTrainees Text]] "Lifetime<right><colonist(visitors_lifetime)>"},
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Text', T{531, --[[XTemplate sectionTrainees Text]] "Service Comfort<right><Stat(EffectiveServiceComfort)>"},
		}),
		}),
})

