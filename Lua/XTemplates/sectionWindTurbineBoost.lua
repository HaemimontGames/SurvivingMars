-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "sectionWindTurbineBoost",
	PlaceObj('XTemplateTemplate', {
		'__context_of_kind', "WindTurbine",
		'__template', "InfopanelSection",
		'OnContextUpdate', function (self, context, ...)
			self:SetVisible(context.dust_storm_boost)
		end,
		'Title', T(277, --[[XTemplate sectionWindTurbineBoost Title]] "Attention"),
		'Icon', "UI/Icons/Sections/attention.tga",
		'TitleHAlign', "stretch",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Text', T(677612553229, --[[XTemplate sectionWindTurbineBoost Text]] "Power production increased due to Dust Storm"),
		}),
		}),
})

