-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "customWasteRockDumpBig",
	PlaceObj('XTemplateTemplate', {
		'__template', "InfopanelSection",
		'RolloverText', T(10461, --[[XTemplate customWasteRockDumpBig RolloverText]] "Drones and Shuttles will attempt to stockpile at least <DesiredAmountUI> of each resources stored here."),
		'RolloverHint', T(116367034467, --[[XTemplate customWasteRockDumpBig RolloverHint]] "<left_click> Set Desired Amount <newline><em>Ctrl + <left_click></em> Set Desired Amount in all <display_name_pl>"),
		'RolloverHintGamepad', T(10462, --[[XTemplate customWasteRockDumpBig RolloverHintGamepad]] "<LB> / <RB>    change desired amount"),
		'Title', T(10463, --[[XTemplate customWasteRockDumpBig Title]] "Desired Amount <DesiredAmountUI>"),
		'Icon', "UI/Icons/Sections/facility.tga",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelSlider",
			'BindTo', "DesiredAmountSlider",
		}),
		}),
	PlaceObj('XTemplateTemplate', {
		'__context_of_kind', "WasteRockDumpSite",
		'__template', "InfopanelSection",
		'RolloverText', T(490, --[[XTemplate customWasteRockDumpBig RolloverText]] "Amount Waste Rock stored."),
		'Title', T(489, --[[XTemplate customWasteRockDumpBig Title]] "Available resources"),
		'Icon', "UI/Icons/Sections/WasteRock_4.tga",
	}, {
		PlaceObj('XTemplateTemplate', {
			'__template', "InfopanelText",
			'Text', T(491, --[[XTemplate customWasteRockDumpBig Text]] "<resource('WasteRock')><right><wasterock(Stored_WasteRock, MaxAmount_WasteRock)>"),
		}),
		}),
})

