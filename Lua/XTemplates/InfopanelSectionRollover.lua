-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XRolloverWindow",
	group = "Infopanel",
	id = "InfopanelSectionRollover",
	PlaceObj('XTemplateCode', {
		'comment', "if no RolloverTitle use section title",
		'run', function (self, parent, context)
local title = context.control:GetRolloverTitle()
if title == "" then
	context.RolloverTitle = context.control:GetTitle()
end
end,
	}),
	PlaceObj('XTemplateTemplate', {
		'__template', "InfopanelRollover",
	}),
})

