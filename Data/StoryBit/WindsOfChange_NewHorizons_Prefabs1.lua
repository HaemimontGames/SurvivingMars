-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Delay = 14400000,
	Effects = {},
	Enables = {
		"WindsOfChange_NewHorizons_Prefabs1",
	},
	Image = "UI/Messages/Events/03_discussion.tga",
	Prerequisites = {},
	ScriptDone = true,
	Text = T(498104112595, --[[StoryBit WindsOfChange_NewHorizons_Prefabs1 Text]] "The prefabs are in early state and we can command the Nanites to use the resources they have gathered to create whatever we need."),
	TextReadyForValidation = true,
	TextsDone = true,
	VoicedText = T(784091228074, --[[voice:narrator]] "Tamed Nanites crafted new prefabs!"),
	group = "Breakthroughs",
	id = "WindsOfChange_NewHorizons_Prefabs1",
	PlaceObj('StoryBitReply', {
		'Text', T(181568953799, --[[StoryBit WindsOfChange_NewHorizons_Prefabs1 Text]] "Create Stirling Generators."),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardPrefab', {
				'Amount', 5,
				'Prefab', "StirlingGenerator",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(807804120827, --[[StoryBit WindsOfChange_NewHorizons_Prefabs1 Text]] "Create Drone Prefabs."),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardPrefab', {
				'Amount', 20,
				'Prefab', "DronePrefab",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(770528057910, --[[StoryBit WindsOfChange_NewHorizons_Prefabs1 Text]] "Create Life Support Buildings."),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardPrefab', {
				'Amount', 4,
				'Prefab', "OxygenTank",
			}),
			PlaceObj('RewardPrefab', {
				'Amount', 2,
				'Prefab', "MOXIE",
			}),
			PlaceObj('RewardPrefab', {
				'Amount', 2,
				'Prefab', "MoistureVaporator",
			}),
			PlaceObj('RewardPrefab', {
				'Amount', 2,
				'Prefab', "LargeWaterTank",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(124164018325, --[[StoryBit WindsOfChange_NewHorizons_Prefabs1 Text]] "Create resource Extractors."),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardPrefab', {
				'Amount', 1,
				'Prefab', "MetalsExtractor",
			}),
			PlaceObj('RewardPrefab', {
				'Amount', 1,
				'Prefab', "WaterExtractor",
			}),
			PlaceObj('RewardPrefab', {
				'Amount', 1,
				'Prefab', "RegolithExtractor",
			}),
			PlaceObj('RewardPrefab', {
				'Amount', 1,
				'Prefab', "PreciousMetalsExtractor",
			}),
		},
	}),
})

