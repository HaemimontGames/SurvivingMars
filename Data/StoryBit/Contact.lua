-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_FounderStageDone",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/17_omega_telescope.tga",
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "OmegaTelescope",
			'Filters', {},
			'Condition', ">",
			'Amount', 0,
		}),
	},
	ScriptDone = true,
	Text = T(378869041535, --[[StoryBit Contact Text]] "The signal has been traced to come from hundreds of light years away and while the civilization that transmitted it may no longer exist, there is little question to the validity of the signal itself.\n\nWe may send a signal of our own in their direction. It will travel for hundreds of years more but it will eventually reach whoever, if anyone, is still around there to listen to it. Using universal mathematical laws as means to communicate, we can only hope that who receives it will understand.\n\nWriting the right opening sentence is said to be an art by itself. How will our message begin?"),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(196461487352, --[[StoryBit Contact Title]] "A Long Time Ago, in a Galaxy Far Far Away..."),
	VoicedText = T(550636127486, --[[voice:narrator]] "What news, Commander! Definitive evidence of intelligent beings is found within a signal caught by our Omega Telescope."),
	group = "Wonders",
	id = "Contact",
	PlaceObj('StoryBitReply', {
		'Text', T(286886163001, --[[StoryBit Contact Text]] "No response is needed. We don’t know the nature of the listener on the other side and may doom the future of the human race."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(237526020091, --[[StoryBit Contact CustomOutcomeText]] "no benefit"),
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(614996596339, --[[StoryBit Contact Text]] '"Hello there!"'),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(907147835662, --[[StoryBit Contact CustomOutcomeText]] "morale boost for significant number of Colonists"),
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_boost",
		'Value', 20,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "morale_boost_duration",
		'Value', 14400000,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {},
				'RandomCount', 60,
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<morale_boost>",
						'Sols', "<morale_boost_duration>",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(586117840253, --[[StoryBit Contact Text]] '"Let us learn from each other!"'),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(829950182308, --[[StoryBit Contact CustomOutcomeText]] "inspire the colony to discover a new Breakthrough"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('DiscoverTech', {
				'Field', "Breakthroughs",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(468704802159, --[[StoryBit Contact Text]] '"One day, we will meet in peace."'),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(116028277021, --[[StoryBit Contact CustomOutcomeText]] "attract new Applicants"),
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "applicants",
		'Value', 100,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardApplicants', {
				'Amount', "<applicants>",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(238751655010, --[[StoryBit Contact Text]] '"It is our hope to prosper in cooperation."'),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(377108899067, --[[StoryBit Contact CustomOutcomeText]] "get Funding"),
		'Prerequisite', PlaceObj('IsSponsor', {
			'SponsorName', "BlueSun",
		}),
	}),
	PlaceObj('StoryBitParamFunding', {
		'Name', "funding_gain",
		'Value', 1000000000,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardFunding', {
				'Amount', "<funding_gain>",
			}),
		},
	}),
})

