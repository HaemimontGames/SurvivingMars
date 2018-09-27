-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	__is_kind_of = "XWindow",
	group = "PreGame",
	id = "GalleryActionBar",
	PlaceObj('XTemplateWindow', {
		'Id', "idActionBar",
		'Dock', "bottom",
		'HAlign', "right",
	}, {
		PlaceObj('XTemplateWindow', {
			'__class', "XText",
			'Id', "idChallengeName",
			'Margins', box(0, -100, 0, -10),
			'HAlign', "center",
			'TextFont', "PGMissionDescr",
			'TextColor', RGBA(255, 239, 164, 255),
			'RolloverTextColor', RGBA(255, 239, 164, 255),
			'Translate', true,
			'Text', T{10517, --[[XTemplate GalleryActionBar Text]] "Challenging Content"},
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XText",
			'Id', "idChallengeScore",
			'Margins', box(0, -70, 0, -10),
			'HAlign', "center",
			'TextFont', "PGMissionDescr",
			'TextColor', RGBA(255, 239, 164, 255),
			'RolloverTextColor', RGBA(255, 239, 164, 255),
			'Translate', true,
			'Text', T{10518, --[[XTemplate GalleryActionBar Text]] "Challenging Content Score"},
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XFrame",
			'Margins', box(-340, -70, -40, -10),
			'Image', "UI/Common/pm_pad_small.tga",
			'FrameBox', box(320, 0, 40, 0),
			'SqueezeY', false,
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XToolBar",
			'Id', "idToolBar",
			'HAlign', "right",
			'VAlign', "bottom",
			'LayoutHSpacing', 60,
			'Background', RGBA(0, 0, 0, 0),
			'Toolbar', "ActionBar",
			'Show', "text",
			'ButtonTemplate', "MenuEntry",
		}),
		}),
})

