-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_BeforeFounders",
	Effects = {},
	EnableChance = 40,
	Enabled = true,
	Image = "UI/Messages/Events/03_discussion.tga",
	Prerequisites = {},
	ScriptDone = true,
	Text = T(525807588817, --[[StoryBit Boost2_DigDeep Text]] "The data seems correct, but our equipment wasn't calibrated to detect the sites. You congratulate your colleague for the discovery and decide on a further course of action.\n\n<effect>You have discovered several new deposits near the colony."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(252027768740, --[[StoryBit Boost2_DigDeep Title]] "Dig Deep"),
	VoicedText = T(417309031546, --[[voice:narrator]] "One of our Scientists has just re-analyzed the scan data and found traces of resource deposits that you didn’t know existed."),
	group = "Pre-Founder Stage",
	id = "Boost2_DigDeep",
	qa_info = PlaceObj('PresetQAInfo', {
		data = {
			{
				action = "Modified",
				time = 1549880229,
				user = "Momchil",
			},
			{
				action = "Modified",
				time = 1549966361,
				user = "Kmilushev",
			},
			{
				action = "Verified",
				time = 1549966939,
				user = "Kmilushev",
			},
			{
				action = "Verified",
				time = 1550059384,
				user = "Kmilushev",
			},
			{
				action = "Modified",
				time = 1550489063,
				user = "Blizzard",
			},
			{
				action = "Modified",
				time = 1551175391,
				user = "Momchil",
			},
			{
				action = "Modified",
				time = 1551274292,
				user = "Radomir",
			},
			{
				action = "Modified",
				time = 1551965696,
				user = "Radomir",
			},
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(540767662028, --[[StoryBit Boost2_DigDeep Text]] "Correct the search patterns."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(968824402245, --[[StoryBit Boost2_DigDeep CustomOutcomeText]] "gain discount on the Deep Scanning tech"),
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "astrogeologist",
			'Negate', true,
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('SpawnSubsurfaceDeposits', {
				'ResourceAmount', 5000000,
				'DepthLayer', 2,
			}),
			PlaceObj('SpawnSubsurfaceDeposits', {
				'Resource', "Water",
				'ResourceAmount', 5000000,
				'DepthLayer', 2,
			}),
			PlaceObj('RewardTechBoost', {
				'Field', "Physics",
				'Research', "DeepScanning",
				'Amount', 50,
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(494623791079, --[[StoryBit Boost2_DigDeep Text]] "Improve the drilling technology."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(818223058478, --[[StoryBit Boost2_DigDeep CustomOutcomeText]] "reveals Deep Water Extraction and Deep Metal Extraction tech"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('SpawnSubsurfaceDeposits', {
				'ResourceAmount', 5000000,
				'DepthLayer', 2,
			}),
			PlaceObj('SpawnSubsurfaceDeposits', {
				'Resource', "Water",
				'ResourceAmount', 5000000,
				'DepthLayer', 2,
			}),
			PlaceObj('DiscoverTech', {
				'Field', "Physics",
				'Tech', "DeepWaterExtraction",
			}),
			PlaceObj('DiscoverTech', {
				'Field', "Physics",
				'Tech', "DeepMetalExtraction",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(262277117951, --[[StoryBit Boost2_DigDeep Text]] "Immediately exploit the new deposits."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(297703279807, --[[StoryBit Boost2_DigDeep CustomOutcomeText]] "additional resources in all of the new deposits"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('SpawnSubsurfaceDeposits', {
				'ResourceAmount', 20000000,
				'Grade', "Very High",
			}),
			PlaceObj('SpawnSubsurfaceDeposits', {
				'Resource', "Water",
				'ResourceAmount', 20000000,
				'Grade', "Very High",
			}),
		},
	}),
})

