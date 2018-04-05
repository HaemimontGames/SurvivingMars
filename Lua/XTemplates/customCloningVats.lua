-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "customCloningVats",
	PlaceObj('XTemplateTemplate', {
		'__context_of_kind', "CloningVats",
		'__template', "InfopanelSection",
		'RolloverText', T{535, --[[XTemplate customCloningVats RolloverText]] "Progress creating the next clone."},
		'RolloverTitle', T{534, --[[XTemplate customCloningVats RolloverTitle]] "Cloning progress"},
		'Icon', "UI/Icons/Sections/colonist.tga",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelProgress",
			'BindTo', "CloningProgress",
		}),
		}),
})

