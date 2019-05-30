-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "sectionCustom",
	PlaceObj('XTemplateCode', {
		'comment', "building ip_section",
		'run', function (self, parent, context)
			local template = XTemplates["custom" .. context.template_name] or XTemplates["custom" .. context.class]
			return template and template:Eval(parent, context)
		end,
	}),
})

