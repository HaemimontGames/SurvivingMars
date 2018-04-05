-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "customBlackCubeDump",
	PlaceObj('XTemplateTemplate', {
		'__context_of_kind', "BlackCubeDumpSite",
		'__template', "InfopanelSection",
		'RolloverText', T{492, --[[XTemplate customBlackCubeDump RolloverText]] "Amount of stored Black Cubes."},
		'Title', T{489, --[[XTemplate customBlackCubeDump Title]] "Available resources"},
		'Icon', "UI/Icons/Sections/BlackCube_4.tga",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Text', T{493, --[[XTemplate customBlackCubeDump Text]] "<resource('BlackCube' )><right><blackcube(Stored_BlackCube, MaxAmount_BlackCube)>"},
		}),
		}),
})

