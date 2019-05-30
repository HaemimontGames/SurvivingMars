-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('MalfunctionRocket', {
			'Resource', "Electronics",
			'Amount', 10000,
		}),
	},
	Category = "RocketManualLaunch",
	Effects = {
		PlaceObj('RewardSupplyPods', {
			'Amount', "<freesupplypods>",
		}),
		PlaceObj('RewardFunding', {
			'Amount', "<extrafunding>",
		}),
	},
	Enabled = true,
	Enables = {
		"Boost17_Shortcircuit_Success",
	},
	Image = "UI/Messages/rocket_1.tga",
	NotificationText = "",
	Prerequisites = {
		PlaceObj('IsSolInRange', {
			'Min', 2,
			'Max', 30,
		}),
		PlaceObj('CheckObjectCount', {
			'Label', "Building",
			'Filters', {},
			'Condition', ">=",
			'Amount', 3,
		}),
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'Filters', {},
			'Condition', "<=",
			'Amount', 0,
		}),
	},
	ScriptDone = true,
	Text = T(322756072947, --[[StoryBit Boost17_Shortcircuit Text]] "Quick troubleshooting reveals that a short-circuit has completely fried the board computer, leaving the Rocket in a damaged state.\n\nYou quickly notify the Sponsor of the potentially disastrous consequences of the failed rocket launch. Luckily, they lose no time in green lighting <freesupplypods> free Supply Pods and <funding(extrafunding)> in funding to help the mission through this situation."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(492449281236, --[[StoryBit Boost17_Shortcircuit Title]] "Rocket Short-circuit"),
	Trigger = "RocketManualLaunch",
	VoicedText = T(747533208220, --[[voice:narrator]] "The whole board flares up in red warning signs. Emergency rocket launch abort initiated!"),
	group = "Pre-Founder Stage",
	id = "Boost17_Shortcircuit",
	qa_info = PlaceObj('PresetQAInfo', {
		data = {
			{
				action = "Modified",
				time = 1550049900,
				user = "Boyan",
			},
			{
				action = "Modified",
				time = 1550491863,
				user = "Boyan",
			},
			{
				action = "Modified",
				time = 1550493467,
				user = "Blizzard",
			},
			{
				action = "Modified",
				time = 1551964908,
				user = "Radomir",
			},
		},
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "freesupplypods",
		'Value', 5,
	}),
	PlaceObj('StoryBitParamFunding', {
		'Name', "extrafunding",
		'Value', 500000000,
	}),
})

