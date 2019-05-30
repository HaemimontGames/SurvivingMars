-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_BeforeFounders",
	Effects = {},
	EnableChance = 40,
	Enabled = true,
	Image = "UI/Messages/debris.tga",
	Prerequisites = {},
	ScriptDone = true,
	Text = T(137697402993, --[[StoryBit Boost1_TheExtract Text]] "The pod cannot be identified, as its hull is too burnt and its black box is missing. We discovered several blueprints of unknown purpose inside.\n\nYour team stares at the strange designs and is trying to make sense of them, you decide to join in. Hmm, clearly the part designated as 01-K64 goes into the power couplings here and – eureka! You know what this is!"),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(572583625022, --[[StoryBit Boost1_TheExtract Title]] "The Extract"),
	VoicedText = T(126468848280, --[[voice:narrator]] "While digging in the dirt, a Drone has stumbled upon a crashed supply pod, almost entirely buried below the red sand."),
	group = "Pre-Founder Stage",
	id = "Boost1_TheExtract",
	qa_info = PlaceObj('PresetQAInfo', {
		data = {
			{
				action = "Modified",
				time = 1549880214,
				user = "Momchil",
			},
			{
				action = "Modified",
				time = 1549984138,
				user = "Kmilushev",
			},
			{
				action = "Verified",
				time = 1549987816,
				user = "Lina",
			},
			{
				action = "Modified",
				time = 1550048884,
				user = "Kmilushev",
			},
			{
				action = "Modified",
				time = 1550488754,
				user = "Blizzard",
			},
			{
				action = "Modified",
				time = 1551965546,
				user = "Radomir",
			},
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(544658980797, --[[StoryBit Boost1_TheExtract Text]] "Gain 1 Triboelectric Scrubber."),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardPrefab', {
				'Amount', 1,
				'Prefab', "TriboelectricScrubber",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(524204579648, --[[StoryBit Boost1_TheExtract Text]] "Gain 1 Subsurface Heater."),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardPrefab', {
				'Amount', 1,
				'Prefab', "SubsurfaceHeater",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(836738501163, --[[StoryBit Boost1_TheExtract Text]] "Gain 2 MDS Lasers."),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardPrefab', {
				'Amount', 2,
				'Prefab', "MDSLaser",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(766538143511, --[[StoryBit Boost1_TheExtract Text]] "Gain 1 Shuttle Hub."),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardPrefab', {
				'Amount', 1,
				'Prefab', "ShuttleHub",
			}),
		},
	}),
})

