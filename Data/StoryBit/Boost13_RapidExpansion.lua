-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_BeforeFounders",
	Effects = {},
	EnableChance = 40,
	Enabled = true,
	Image = "UI/Messages/rc_transport.tga",
	Prerequisites = {},
	ScriptDone = true,
	Text = T(680882280822, --[[StoryBit Boost13_RapidExpansion Text]] "It will carry an RC Transport rover on board, ready to be used immediately on arrival. Just give the call, Commander!"),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(623377373865, --[[StoryBit Boost13_RapidExpansion Title]] "Rapid Expansion"),
	VoicedText = T(168663689612, --[[voice:narrator]] "The Mission HQ on Earth has decided to boost the expansion capabilities of the colony by providing a priority Supply Pod."),
	group = "Pre-Founder Stage",
	id = "Boost13_RapidExpansion",
	qa_info = PlaceObj('PresetQAInfo', {
		data = {
			{
				action = "Modified",
				time = 1549880189,
				user = "Momchil",
			},
			{
				action = "Modified",
				time = 1549984138,
				user = "Kmilushev",
			},
			{
				action = "Modified",
				time = 1550051480,
				user = "Momchil",
			},
			{
				action = "Verified",
				time = 1550056182,
				user = "Kmilushev",
			},
			{
				action = "Modified",
				time = 1550491985,
				user = "Blizzard",
			},
			{
				action = "Modified",
				time = 1551959511,
				user = "Radomir",
			},
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(12234, --[[StoryBit Boost13_RapidExpansion Text]] "Sure, we can use a new Transport!"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('SpawnRocketInOrbit', {
				'is_supply_pod', true,
				'cargo_list', {
					PlaceObj('RocketCargoItem', {
						'cargo', "RCTransport",
						'amount', 1,
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitParamFunding', {
		'Name', "funding",
		'Value', 500000000,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(619799806338, --[[StoryBit Boost13_RapidExpansion Text]] "I prefer financial aid."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(616424790161, --[[StoryBit Boost13_RapidExpansion CustomOutcomeText]] "gain <funding(funding)>"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardFunding', {
				'Amount', "<funding>",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(910309937932, --[[StoryBit Boost13_RapidExpansion Text]] "Why not improve the Transport technology instead?"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(917540190741, --[[StoryBit Boost13_RapidExpansion CustomOutcomeText]] "the tech Transport Optimization is researched"),
		'Prerequisite', PlaceObj('CheckTechStatus', {
			'Field', "Robotics",
			'TechId', "TransportOptimization",
			'Negate', true,
		}),
		'HideIfDisabled', true,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardTech', {
				'Field', "Robotics",
				'Research', "TransportOptimization",
			}),
		},
	}),
})

