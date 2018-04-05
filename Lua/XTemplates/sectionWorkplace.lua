-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "sectionWorkplace",
	PlaceObj('XTemplateTemplate', {
		'comment', "Specialist Enforce/Reject",
		'__context_of_kind', "Workplace",
		'__template', "InfopanelButton",
		'OnPressParam', "ToggleSpecialistEnforce",
		'OnPress', function (self, gamepad)
self.context:ToggleSpecialistEnforce(not gamepad and IsMassUIModifierPressed())
end,
		'OnAltPress', function (self, gamepad)
if gamepad then
	self.context:ToggleSpecialistEnforce(true)
end
end,
		'Icon', "UI/Icons/IPButtons/specialization_all.tga",
	}),
})

