-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "sectionCustom",
	PlaceObj('XTemplateCode', {
		'comment', "building ip_section",
		'run', function (self, parent, context)
if IsKindOf(context, "Building") then
	local template = XTemplates["custom" .. context.template_name]
	return template and template:Eval(parent, context)
end
end,
	}),
})

