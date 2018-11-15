-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_FounderStageDone",
	Comment = "Give RP and Spawn Dust Devils",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/06_space_suit.tga",
	Prerequisites = {
		PlaceObj('PickFromLabel', {
			'Label', "Colonist",
			'Conditions', {
				PlaceObj('HasTrait', {
					'Trait', "scientist",
				}),
			},
		}),
	},
	ScriptDone = true,
	Text = T{490394298129, --[[StoryBit TheExperiment Text]] "Quick to assure you the experiment is perfectly safe, <DisplayName> reluctantly asks for permission to test within the vicinity of a Dome – in case they need to get to shelter really fast."},
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T{896405918607, --[[StoryBit TheExperiment Title]] "The Experiment"},
	VoicedText = T{492443614001, --[[voice:narrator]] "A Scientist barges into your office and says they have an important climate experiment to make."},
	group = "Colonists",
	id = "TheExperiment",
	PlaceObj('StoryBitParamResearchPoints', {
		'Name', "reward_small",
		'Value', 1500,
	}),
	PlaceObj('StoryBitParamResearchPoints', {
		'Name', "reward_big",
		'Value', 3000,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{902039096119, --[[StoryBit TheExperiment Text]] "Innovation is always welcome! Go ahead – test it near a Dome."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{623306731985, --[[StoryBit TheExperiment CustomOutcomeText]] "get Research, something might happen"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 50,
		'Effects', {
			PlaceObj('RewardResearchPoints', {
				'Amount', "<reward_big>",
			}),
			PlaceObj('StartDisaster', {
				'Disaster', "Dust Devils",
				'Label', "Dome",
			}),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 50,
		'Effects', {
			PlaceObj('AddTrait', {
				'Trait', "Genius",
			}),
			PlaceObj('RewardResearchPoints', {
				'Amount', "<reward_small>",
			}),
			PlaceObj('StartDisaster', {
				'Disaster', "Dust Devils",
				'Label', "Dome",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{399295356378, --[[StoryBit TheExperiment Text]] "Sounds intriguing but I’d rather play it safe. Test it somewhere far away."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{402353779881, --[[StoryBit TheExperiment CustomOutcomeText]] "get Research, something might happen"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardResearchPoints', {
				'Amount', "<reward_small>",
			}),
			PlaceObj('StartDisaster', {
				'Disaster', "Dust Devils",
				'Label', "Dome",
			}),
			PlaceObj('EraseColonist', nil),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{642549042924, --[[StoryBit TheExperiment Text]] "Enough crazy for today. Please, leave my office."},
	}),
})

