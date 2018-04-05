-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "customWasteRockDumpBig",
	PlaceObj('XTemplateTemplate', {
		'__context_of_kind', "WasteRockDumpSite",
		'__template', "InfopanelSection",
		'RolloverText', T{490, --[[XTemplate customWasteRockDumpBig RolloverText]] "Amount Waste Rock stored."},
		'Title', T{489, --[[XTemplate customWasteRockDumpBig Title]] "Available resources"},
		'Icon', "UI/Icons/Sections/WasteRock_4.tga",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Text', T{491, --[[XTemplate customWasteRockDumpBig Text]] "<resource('WasteRock')><right><wasterock(Stored_WasteRock, MaxAmount_WasteRock)>"},
		}),
		}),
})

