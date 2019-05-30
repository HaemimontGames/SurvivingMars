-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_FounderStageDone",
	Effects = {},
	EnableChance = 70,
	Enabled = true,
	Image = "UI/Messages/Events/02_video_call_2.tga",
	Prerequisites = {},
	ScriptDone = true,
	Text = T(11051, --[[StoryBit TheBomb Text]] 'This comes shortly after we received the following cryptic message:\n\n"Seth requires permission to test \'The Bomb\' at a safe distance from your Martian colony. These funds should cover inconvenience. \n\nDoes Seth have permission?"'),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(795946245567, --[[StoryBit TheBomb Title]] "The Bomb"),
	VoicedText = T(622537882777, --[[voice:narrator]] "An unbelievable amount of unaccounted funds has suddenly appeared in our accounts but are currently kept frozen."),
	group = "Default",
	id = "TheBomb",
	PlaceObj('StoryBitParamFunding', {
		'Name', "reward",
		'Value', 5000000000,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(309805897896, --[[StoryBit TheBomb Text]] "What's this? Some kind of a joke? Disregard."),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Title', T(239700477889, --[[StoryBit TheBomb Title]] "The Bomb"),
		'VoicedText', T(349098674066, --[[voice:narrator]] "The money has been withdrawn from our account."),
		'Text', T(729037260246, --[[StoryBit TheBomb Text]] "It looks like the mysterious offer is now off the table."),
		'Effects', {},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(237231218931, --[[StoryBit TheBomb Text]] 'The Colony can use the additional funding. Answer "YES".'),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Title', T(795946245567, --[[StoryBit TheBomb Title]] "The Bomb"),
		'VoicedText', T(612588115064, --[[voice:narrator]] "An enormous blast has been detected, measuring at a mind boggling 500 megatons of TNT."),
		'Text', T(301127704634, --[[StoryBit TheBomb Text]] "The blast was very far away. A small marsquake was detected but the debris from the blast and the winds of the blast wave will hit our base very soon - both at the same time.\n\nAt least the money has been unfrozen. Hope we survive long enough to spend it."),
		'Image', "UI/Messages/dust_storm.tga",
		'Effects', {
			PlaceObj('RewardFunding', {
				'Amount', "<reward>",
			}),
			PlaceObj('StartDisaster', {
				'Disaster', "Dust Storm",
				'Strength', 3,
			}),
			PlaceObj('StartDisaster', {
				'Disaster', "Meteors",
				'Strength', 3,
				'Meteors', "storm",
				'Label', "Dome",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(254032092763, --[[StoryBit TheBomb Text]] "Follow the message and identify the sender. Do it now!"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Title', T(239700477889, --[[StoryBit TheBomb Title]] "The Bomb"),
		'VoicedText', T(11002, --[[voice:narrator]] "We tried to trace the message but whomever was behind it took extreme precautions to prevent this."),
		'Text', T(11003, --[[StoryBit TheBomb Text]] "The sum has been withdrawn from our account. It looks like the mysterious offer is now off the table."),
		'Effects', {},
	}),
})

