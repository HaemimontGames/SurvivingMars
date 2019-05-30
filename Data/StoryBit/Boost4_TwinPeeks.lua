-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_BeforeFounders",
	Effects = {
		PlaceObj('CreatePlanetaryAnomaly', {
			'id', "RemoteMartianLaboratory",
			'display_name', T(359173183292, --[[StoryBit Boost4_TwinPeeks display_name]] "Remote Martian Laboratory"),
			'description', T(468827671928, --[[StoryBit Boost4_TwinPeeks description]] "Reveals a new Breakthrough."),
			'required_resources', {
				PlaceObj('ResourceAmount', {
					'resource', "Electronics",
					'amount', 75000,
				}),
				PlaceObj('ResourceAmount', {
					'resource', "Polymers",
					'amount', 150000,
				}),
				PlaceObj('ResourceAmount', {
					'resource', "MachineParts",
					'amount', 100000,
				}),
			},
			'reward', "breakthrough",
			'outcome_text', T(470486781236, --[[StoryBit Boost4_TwinPeeks outcome_text]] "Breakthrough"),
		}),
	},
	EnableChance = 40,
	Enabled = true,
	Enables = {},
	Image = "UI/Messages/Events/03_discussion.tga",
	Prerequisites = {},
	ScriptDone = true,
	Text = T(991261367623, --[[StoryBit Boost4_TwinPeeks Text]] 'Two anomalous readings have been detected at the same time – one near your landing spot and one far away, in a different part of the Red Planet. One of your Scientists is looking at the data and asks you:\n\n"What do you think we’re seeing here, Commander?"\n\nYou look at the analysis and immediately know the answer.'),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(733373765468, --[[StoryBit Boost4_TwinPeeks Title]] "Twin Peeks"),
	VoicedText = T(650819529037, --[[voice:narrator]] "A new and intriguing report has been filed in from an orbital scan above your colony."),
	group = "Pre-Founder Stage",
	id = "Boost4_TwinPeeks",
	qa_info = PlaceObj('PresetQAInfo', {
		data = {
			{
				action = "Modified",
				time = 1549880739,
				user = "Momchil",
			},
			{
				action = "Verified",
				time = 1550056780,
				user = "Lina",
			},
			{
				action = "Modified",
				time = 1550489400,
				user = "Blizzard",
			},
			{
				action = "Modified",
				time = 1550574818,
				user = "Momchil",
			},
			{
				action = "Modified",
				time = 1550662545,
				user = "Momchil",
			},
			{
				action = "Modified",
				time = 1551172956,
				user = "Momchil",
			},
			{
				action = "Modified",
				time = 1551343819,
				user = "Momchil",
			},
			{
				action = "Modified",
				time = 1551966285,
				user = "Radomir",
			},
			{
				action = "Modified",
				time = 1552295114,
				user = "Momchil",
			},
			{
				action = "Modified",
				time = 1553175034,
				user = "Radomir",
			},
		},
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "spawn_radius",
		'Value', 100,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(681189508003, --[[StoryBit Boost4_TwinPeeks Text]] "A beautiful Vista, how could we have missed it before?"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(573815266225, --[[StoryBit Boost4_TwinPeeks CustomOutcomeText]] "reveals a Vista"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T(12236, --[[voice:narrator]] "The scientist looks at the data and nods in agreement."),
		'Text', T(123306816367, --[[StoryBit Boost4_TwinPeeks Text]] "“Indeed, Commander. But the nature of the other anomaly is yet unknown – there’s too little data to even make an educated guess.”\n\nThat’s right, the other coordinates require a thorough on-site investigation.\n\n<effect>You’ve discovered a new Planetary Anomaly – “Remote Martian Laboratory”."),
		'Effects', {
			PlaceObj('SpawnEffectDeposit', {
				'EffectType', "BeautyEffectDeposit",
				'Label', "Building",
				'Radius', 100,
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(893042286070, --[[StoryBit Boost4_TwinPeeks Text]] "A promising opportunity for a Research Site."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(337202213336, --[[StoryBit Boost4_TwinPeeks CustomOutcomeText]] "reveals a Research Site"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T(12236, --[[voice:narrator]] "The scientist looks at the data and nods in agreement."),
		'Text', T(190076805208, --[[StoryBit Boost4_TwinPeeks Text]] "“Indeed, Commander. But the nature of the other anomaly is yet unknown – there’s too little data to even make an educated guess.”\n\nThat’s right, the other coordinates require a thorough on-site investigation.\n\n<effect>You’ve discovered a new Planetary Anomaly – “Remote Martian Laboratory”."),
		'Effects', {
			PlaceObj('SpawnEffectDeposit', {
				'EffectType', "ResearchEffectDeposit",
				'Label', "Building",
				'Radius', 100,
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(790275459566, --[[StoryBit Boost4_TwinPeeks Text]] "An underground water deposit."),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T(12236, --[[voice:narrator]] "The scientist looks at the data and nods in agreement."),
		'Text', T(364707964323, --[[StoryBit Boost4_TwinPeeks Text]] "“Indeed, Commander. But the nature of the other anomaly is yet unknown – there’s too little data to even make an educated guess.”\n\nThat’s right, the other coordinates require a thorough on-site investigation.\n\n<effect>You’ve discovered a new Planetary Anomaly – “Remote Martian Laboratory”."),
		'Effects', {
			PlaceObj('SpawnSubsurfaceDeposits', {
				'Resource', "Water",
				'ResourceAmount', 5000000,
				'Grade', "Very High",
				'Label', "Building",
				'Radius', 100,
				'Conditions', {},
			}),
		},
	}),
})

