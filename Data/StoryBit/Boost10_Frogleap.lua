-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_BeforeFounders",
	Effects = {},
	EnableChance = 40,
	Enabled = true,
	Image = "UI/Messages/Events/15_artist.tga",
	Prerequisites = {},
	ScriptDone = true,
	Text = T(820124822035, --[[StoryBit Boost10_Frogleap Text]] "With the downpour of new scientific data from Mars, our team made an unheard breakthrough in the field.\n\n<effect>A new advanced technology has been revealed in the chosen field. The new technology costs less to research."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(621643800025, --[[StoryBit Boost10_Frogleap Title]] "The Great Leap"),
	VoicedText = T(865692770383, --[[voice:narrator]] "Our scientific team on Earth has just made a daunting discovery!"),
	group = "Pre-Founder Stage",
	id = "Boost10_Frogleap",
	qa_info = PlaceObj('PresetQAInfo', {
		data = {
			{
				action = "Modified",
				time = 1549880083,
				user = "Momchil",
			},
			{
				action = "Modified",
				time = 1549973988,
				user = "Momchil",
			},
			{
				action = "Modified",
				time = 1549984138,
				user = "Kmilushev",
			},
			{
				action = "Verified",
				time = 1549987775,
				user = "Lina",
			},
			{
				action = "Modified",
				time = 1550491595,
				user = "Blizzard",
			},
			{
				action = "Modified",
				time = 1551958252,
				user = "Radomir",
			},
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(144383271199, --[[StoryBit Boost10_Frogleap Text]] "Physics."),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('DiscoverTech', {
				'Field', "Physics",
				'Tech', "NuclearFusion",
			}),
			PlaceObj('RewardTechBoost', {
				'Field', "Physics",
				'Research', "NuclearFusion",
				'Amount', 50,
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(808337110434, --[[StoryBit Boost10_Frogleap Text]] "Robotics."),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('DiscoverTech', {
				'Field', "Robotics",
				'Tech', "FactoryAI",
			}),
			PlaceObj('RewardTechBoost', {
				'Field', "Robotics",
				'Research', "FactoryAI",
				'Amount', 50,
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(663749184133, --[[StoryBit Boost10_Frogleap Text]] "Engineering."),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('DiscoverTech', {
				'Field', "Engineering",
				'Tech', "ResilientArchitecture",
			}),
			PlaceObj('RewardTechBoost', {
				'Field', "Engineering",
				'Research', "ResilientArchitecture",
				'Amount', 50,
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(552052969566, --[[StoryBit Boost10_Frogleap Text]] "Biotech."),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('DiscoverTech', {
				'Field', "Biotech",
				'Tech', "WaterCoservationSystem",
			}),
			PlaceObj('RewardTechBoost', {
				'Field', "Biotech",
				'Research', "WaterCoservationSystem",
				'Amount', 50,
			}),
		},
	}),
})

