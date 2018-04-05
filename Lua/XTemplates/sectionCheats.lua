-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Infopanel Sections",
	id = "sectionCheats",
	PlaceObj('XTemplateTemplate', {
		'__context_of_kind', "InfopanelObj",
		'__condition', function (parent, context) return config.BuildingInfopanelCheats and context:CreateCheatActions(parent) end,
		'__template', "InfopanelSection",
		'RolloverText', T{331402867293, --[[XTemplate sectionCheats RolloverText]] "<CheatsRollover>"},
		'Title', T{27, --[[XTemplate sectionCheats Title]] "Cheats"},
		'Icon', "UI/Icons/Sections/dust.tga",
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XToolBar",
			'Margins', box(0, 6, 0, 0),
			'LayoutMethod', "HWrap",
			'LayoutHSpacing', 20,
			'Background', RGBA(0, 0, 0, 0),
			'Toolbar', "cheats",
			'ButtonTemplate', "InfopanelCheat",
		}),
		}),
})

