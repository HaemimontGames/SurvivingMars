-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_BeforeFounders",
	Effects = {},
	EnableChance = 40,
	Enabled = true,
	Image = "UI/Messages/Events/08_arrival.tga",
	Prerequisites = {},
	ScriptDone = true,
	Text = T(534101555685, --[[StoryBit Boost3_Heirloom Text]] "It informs you that your old friend and teacher, Professor Richtmann, has just passed away. You often accompanied him on his trips and expeditions and discussed many aspects of science and philosophy together.\n\nThe strongbox contains his legacy, protected by a three-letter password and a short message in his handwriting: “You’ll know.”"),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(467521367779, --[[StoryBit Boost3_Heirloom Title]] "Heirloom"),
	VoicedText = T(482314099204, --[[voice:narrator]] "You have received a strange package with a letter attached. As you read the letter, your eyes fill with tears."),
	group = "Pre-Founder Stage",
	id = "Boost3_Heirloom",
	qa_info = PlaceObj('PresetQAInfo', {
		data = {
			{
				action = "Modified",
				time = 1549880234,
				user = "Momchil",
			},
			{
				action = "Modified",
				time = 1549966975,
				user = "Kmilushev",
			},
			{
				action = "Verified",
				time = 1549968632,
				user = "Kmilushev",
			},
			{
				action = "Modified",
				time = 1550489311,
				user = "Blizzard",
			},
			{
				action = "Modified",
				time = 1551195759,
				user = "Momchil",
			},
			{
				action = "Modified",
				time = 1551965965,
				user = "Radomir",
			},
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(216773253505, --[[StoryBit Boost3_Heirloom Text]] "TOY"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(782964401825, --[[StoryBit Boost3_Heirloom CustomOutcomeText]] "reveals Superfungus breakthrough tech"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T(615994905538, --[[voice:narrator]] "The gears unlock with a mechanical click. You know what you would find inside, and yet you are grateful for this last gesture of love and goodwill."),
		'Text', T(807551716703, --[[StoryBit Boost3_Heirloom Text]] "“Transgenetics of Yeasts” was the last thing that kept the Professor awake late at night. He was working on the project in a complete secrecy and you doubt that anyone else than you and some others knew about it. And there it is, the complete theory ready to be applied in practice, in front of you, alongside his precious mascot – a cute little teddy bear.\n\n<effect>The Breakthrough tech Superfungus has been revealed."),
		'Effects', {
			PlaceObj('DiscoverTech', {
				'Field', "Breakthroughs",
				'Tech', "Superfungus",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(962637343622, --[[StoryBit Boost3_Heirloom Text]] "PAC"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(105148182299, --[[StoryBit Boost3_Heirloom CustomOutcomeText]] "reveals Superior Cables and Superior Pipes breakthrough techs"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T(615994905538, --[[voice:narrator]] "The gears unlock with a mechanical click. You know what you would find inside, and yet you are grateful for this last gesture of love and goodwill."),
		'Text', T(471177073062, --[[StoryBit Boost3_Heirloom Text]] "“Prototype Autonomous Convectors” was the last thing that kept the Professor awake late at night. He was working on the project in a complete secrecy and you doubt that anyone else than you and some others knew about it. And there it is, the complete theory ready to be applied in practice, in front of you, alongside his precious mascot – an old crystal ashtray.\n\n<effect>The Breakthrough techs Superior Pipes and Superior Cables have been revealed."),
		'Effects', {
			PlaceObj('DiscoverTech', {
				'Field', "Breakthroughs",
				'Tech', "SuperiorCables",
			}),
			PlaceObj('DiscoverTech', {
				'Field', "Breakthroughs",
				'Tech', "SuperiorPipes",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(280000553262, --[[StoryBit Boost3_Heirloom Text]] "PAX"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(153005841239, --[[StoryBit Boost3_Heirloom CustomOutcomeText]] "reveals Plasma Rocket breakthrough tech"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T(615994905538, --[[voice:narrator]] "The gears unlock with a mechanical click. You know what you would find inside, and yet you are grateful for this last gesture of love and goodwill."),
		'Text', T(404647647118, --[[StoryBit Boost3_Heirloom Text]] "“Perpetual Acceleration eXperiments” was the last thing that kept the Professor awake late at night. He was working on the project in a complete secrecy and you doubt that anyone else than you and some others knew about it. And there it is, the complete theory ready to be applied in practice, in front of you, alongside his precious mascot – an exotic figurine of a lion-headed humanoid.\n\n<effect>The Breakthrough tech Plasma Rocket has been revealed."),
		'Effects', {
			PlaceObj('DiscoverTech', {
				'Field', "Breakthroughs",
				'Tech', "PlasmaRocket",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(767352131748, --[[StoryBit Boost3_Heirloom Text]] "JFD"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(384284146432, --[[StoryBit Boost3_Heirloom CustomOutcomeText]] "reveals Nano Refinement breakthrough tech"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T(615994905538, --[[voice:narrator]] "The gears unlock with a mechanical click. You know what you would find inside, and yet you are grateful for this last gesture of love and goodwill."),
		'Text', T(209428433920, --[[StoryBit Boost3_Heirloom Text]] "“Junk-Filtration Derivatives” was the last thing that kept the Professor awake late at night. He was working on the project in a complete secrecy and you doubt that anyone else than you and some others knew about it. And there it is, the complete theory ready to be applied in practice, in front of you, alongside his precious mascot – a laughing-face ball.\n\n<effect>The Breakthrough tech Nano Refinement has been revealed."),
		'Effects', {
			PlaceObj('DiscoverTech', {
				'Field', "Breakthroughs",
				'Tech', "NanoRefinement",
			}),
		},
	}),
})

