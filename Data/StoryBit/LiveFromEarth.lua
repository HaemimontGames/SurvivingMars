-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "FounderRocketLanded",
	Delay = 1080000,
	Effects = {},
	EnableChance = 25,
	Enabled = true,
	Enables = {},
	Image = "UI/Messages/Events/01_video_call.tga",
	Prerequisites = {},
	ScriptDone = true,
	SuppressTime = 1080000,
	Text = T{591311707474, --[[StoryBit LiveFromEarth Text]] "Streaming the games to Mars is technically possible but will take bandwidth that we normally use for research data from Earth."},
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T{779725052209, --[[StoryBit LiveFromEarth Title]] "Live From Earth"},
	Trigger = "RocketLanded",
	VoicedText = T{613330784177, --[[voice:narrator]] "The Olympics are about to begin on Earth and the excitement among the colonists is tangible."},
	group = "Colonists",
	id = "LiveFromEarth",
	PlaceObj('StoryBitParamSols', {
		'Name', "small_timeframe",
		'Value', 3600000,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "big_timeframe",
		'Value', 7200000,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "small_penalty",
		'Value', -5,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "small_bonus",
		'Value', 10,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "big_bonus",
		'Value', 15,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{950812209567, --[[StoryBit LiveFromEarth Text]] "Not watching the Olympics was never on the table. Do it! "},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{808202649235, --[[StoryBit LiveFromEarth CustomOutcomeText]] "all Colonists get Morale boost, research from Earth suspended for <sols(big_timeframe)> Sols"},
		'Prerequisite', PlaceObj('IsSponsor', {
			'SponsorName', "BlueSun",
			'Negate', true,
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ModifyLabel', {
				'Label', "Colonist",
				'Prop', "base_morale",
				'Amount', "<small_bonus>",
				'Sols', "<big_timeframe>",
			}),
			PlaceObj('PauseResearch', {
				'Time', "<big_timeframe>",
				'ResearchType', "outsource",
			}),
			PlaceObj('PauseResearch', {
				'Time', "<big_timeframe>",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{582916197049, --[[StoryBit LiveFromEarth Text]] "Our survival depends on getting research done as quickly as possible. Even the most eager sport fans will understand."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{721759884281, --[[StoryBit LiveFromEarth CustomOutcomeText]] "all Colonists get Morale penalty"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ModifyLabel', {
				'Label', "Colonist",
				'Prop', "base_morale",
				'Amount', "<small_penalty>",
				'Sols', "<big_timeframe>",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{564481017497, --[[StoryBit LiveFromEarth Text]] "Some kind of compromise should be possible – broadcast the games for a few Sols. "},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{115114777460, --[[StoryBit LiveFromEarth CustomOutcomeText]] "all Colonists get Morale boost, research from Earth suspended for <sols(small_timeframe)> Sols"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ModifyLabel', {
				'Label', "Colonist",
				'Prop', "base_morale",
				'Amount', "<small_bonus>",
				'Sols', "<small_timeframe>",
			}),
			PlaceObj('PauseResearch', {
				'Time', "<small_timeframe>",
				'ResearchType', "outsource",
			}),
			PlaceObj('PauseResearch', {
				'Time', "<big_timeframe>",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{806151591322, --[[StoryBit LiveFromEarth Text]] "We’ll watch the games, alright – but with holograms! "},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{976120687786, --[[StoryBit LiveFromEarth CustomOutcomeText]] "Colonists get large Morale boost, research from Earth suspended for <sols(big_timeframe)> Sols"},
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "author",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ModifyLabel', {
				'Label', "Colonist",
				'Prop', "base_morale",
				'Amount', "<big_bonus>",
				'Sols', "<big_timeframe>",
			}),
			PlaceObj('PauseResearch', {
				'Time', "<big_timeframe>",
				'ResearchType', "outsource",
			}),
			PlaceObj('PauseResearch', {
				'Time', "<big_timeframe>",
			}),
		},
	}),
})

