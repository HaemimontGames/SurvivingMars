-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Delay = 7200000,
	Effects = {},
	Image = "UI/Messages/Events/02_video_call_2.tga",
	Prerequisites = {},
	ScriptDone = true,
	Text = T(886083767492, --[[StoryBit TheDoorToSummer_LetNoNobleDeed Text]] '"It would be an honor to live and work with people like you, Commander!"'),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(224642914065, --[[StoryBit TheDoorToSummer_LetNoNobleDeed Title]] "Let No Noble Deed"),
	VoicedText = T(253719320060, --[[voice:narrator]] "Inspired by your act of genuine nobility, the Eternal Summer's lead scientist, Satoshi Nisei, has requested permission to join your colony."),
	group = "Earth",
	id = "TheDoorToSummer_LetNoNobleDeed",
	qa_info = PlaceObj('PresetQAInfo', {
		data = {
			{
				action = "Modified",
				time = 1550845065,
				user = "Radomir",
			},
		},
	}),
	PlaceObj('StoryBitParamFunding', {
		'Name', "alternative_funding",
		'Value', 750000000,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(861880941581, --[[StoryBit TheDoorToSummer_LetNoNobleDeed Text]] "Welcome, Nisei-sama!"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('SpawnColonist', {
				'Name', T(541587713663, --[[StoryBit TheDoorToSummer_LetNoNobleDeed Name]] "Satoshi Nisei"),
				'Gender', "OtherGender",
				'Age', "Youth",
				'Specialization', "scientist",
				'Trait1', "Genius",
				'Trait2', "Workaholic",
			}),
			PlaceObj('DiscoverTech', nil),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(297691849913, --[[StoryBit TheDoorToSummer_LetNoNobleDeed Text]] "I'm honored, but it would be if you continue working from Earth"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(147627927433, --[[StoryBit TheDoorToSummer_LetNoNobleDeed CustomOutcomeText]] "Discover new Breakthrough, <funding(alternative_funding)>"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('DiscoverTech', nil),
			PlaceObj('RewardFunding', {
				'Amount', "<alternative_funding>",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(485622515119, --[[StoryBit TheDoorToSummer_LetNoNobleDeed Text]] "Maybe not at this time..."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(119873029419, --[[StoryBit TheDoorToSummer_LetNoNobleDeed CustomOutcomeText]] "Postpone for 10 Sols"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"TheDoorToSummer_LetNoNobleDeed",
		},
		'Effects', {},
	}),
})

