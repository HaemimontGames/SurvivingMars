-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('PauseExpedition', nil),
	},
	Category = "PlanetaryAnomaly",
	Effects = {
		PlaceObj('ResumeExpedition', nil),
	},
	Enabled = true,
	Image = "UI/Messages/Events/03_discussion.tga",
	Prerequisites = {},
	ScriptDone = true,
	Text = T{970564184506, --[[StoryBit TreasureHunt_1 Text]] "When approached, the probe projected a message of complex cyphers and codes. It’s definitely something of human origin, no aliens there, for better or worse, but questions still remain. Who put it there? What is the message? What’s the purpose of all this?\n\n<effect> A new technology has been revealed - The Cypher. Research it to decode the signal’s meaning."},
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T{944528490400, --[[StoryBit TreasureHunt_1 Title]] "Treasure Hunt"},
	Trigger = "PlanetaryAnomalyEvent",
	VoicedText = T{111199252507, --[[voice:narrator]] "Following a signal of exact mathematical sequences, the expedition has discovered a tiny probe buried in the sand."},
	group = "Expeditions",
	id = "TreasureHunt_1",
	PlaceObj('StoryBitReply', {
		'Text', T{446522155452, --[[StoryBit TreasureHunt_1 Text]] "Interesting..."},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"TreasureHunt_2",
		},
		'Effects', {
			PlaceObj('DiscoverTech', {
				'Field', "Storybits",
				'Tech', "TheCypher",
				'Cost', 5000,
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{224063884487, --[[StoryBit TreasureHunt_1 Text]] "I've read enough sci-fi to have some ideas!"},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{364263924113, --[[StoryBit TreasureHunt_1 CustomOutcomeText]] "Gain 50% discount to the tech"},
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "author",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"TreasureHunt_2",
		},
		'Effects', {
			PlaceObj('DiscoverTech', {
				'Field', "Storybits",
				'Tech', "TheCypher",
				'Cost', 2500,
			}),
		},
	}),
})

