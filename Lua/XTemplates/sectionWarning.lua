-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "sectionWarning",
	PlaceObj('XTemplateTemplate', {
		'__context_of_kind', "InfopanelObj",
		'__template', "InfopanelSection",
		'OnContextUpdate', function (self, context, ...)
self:SetVisible(ResolveValue(context, "UIWarning") and true)
end,
		'Title', T{47, --[[XTemplate sectionWarning Title]] "<red>Warning</red>"},
		'Icon', "UI/Icons/Sections/warning.tga",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Text', T{584, --[[XTemplate sectionWarning Text]] "<center><UIWarning>"},
		}),
		}),
})

