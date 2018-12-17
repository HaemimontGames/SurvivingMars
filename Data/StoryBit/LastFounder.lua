-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_FounderStageDone",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/12_domes_airlock.tga",
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'Filters', {
				PlaceObj('HasTrait', {
					'Trait', "Founder",
				}),
			},
			'Condition', "==",
			'Amount', 1,
		}),
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'Filters', {},
			'Condition', ">=",
			'Amount', 30,
		}),
		PlaceObj('CheckObjectCount', {
			'Label', "ShuttleHub",
			'Filters', {},
			'Condition', ">=",
			'Amount', 1,
		}),
		PlaceObj('PickFromLabel', {
			'Label', "Colonist",
			'Conditions', {
				PlaceObj('HasTrait', {
					'Trait', "Founder",
				}),
			},
		}),
	},
	ScriptDone = true,
	Text = T(160689527642, --[[StoryBit LastFounder Text]] "<DisplayName> feels their time will come soon and wishes to die with their boots on – on one final adventure.\n\nThey will keep transmitting data of anything they stumble upon until the very end."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(324228265844, --[[StoryBit LastFounder Title]] "The Last Founder"),
	VoicedText = T(944407265072, --[[voice:narrator]] "The last living Founder asks you for a shuttle with enabled manual controls and enough fuel to make it over the horizon."),
	group = "Colonists",
	id = "LastFounder",
	PlaceObj('StoryBitReply', {
		'Text', T(295725844615, --[[StoryBit LastFounder Text]] "How can I deny our great Founder? Permission granted!"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(967076598421, --[[StoryBit LastFounder CustomOutcomeText]] "lose a Shuttle and a Founder"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 30,
		'Title', T(750829484669, --[[StoryBit LastFounder Title]] "The Last Founder"),
		'VoicedText', T(811378569911, --[[voice:narrator]] '"I am eternally grateful, Commander!", says the Founder.'),
		'Text', T(366264377752, --[[StoryBit LastFounder Text]] '"I feel there is one last adventure left for me. It has been more than a privilege!"'),
		'Enables', {
			"LastFounder_Breakthrough_Reward",
		},
		'Effects', {
			PlaceObj('EraseColonist', nil),
			PlaceObj('EraseShuttles', nil),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 70,
		'Title', T(324228265844, --[[StoryBit LastFounder Title]] "The Last Founder"),
		'VoicedText', T(811378569911, --[[voice:narrator]] '"I am eternally grateful, Commander!", says the Founder.'),
		'Text', T(366264377752, --[[StoryBit LastFounder Text]] '"I feel there is one last adventure left for me. It has been more than a privilege!"'),
		'Enables', {
			"LastFounder_TechReward",
		},
		'Effects', {
			PlaceObj('EraseColonist', nil),
			PlaceObj('EraseShuttles', nil),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(525818036917, --[[StoryBit LastFounder Text]] "We have no shuttles to spare, I'm sure you will understand. You may go on foot, however."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(641150699489, --[[StoryBit LastFounder CustomOutcomeText]] "lose a Founder"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 10,
		'Title', T(750829484669, --[[StoryBit LastFounder Title]] "The Last Founder"),
		'VoicedText', T(541710719172, --[[voice:narrator]] "Without the slightest change in expression the Founder nods."),
		'Text', T(555227274788, --[[StoryBit LastFounder Text]] '"It was a selfish request by my part. I shall head out now..."'),
		'Enables', {
			"LastFounder_Breakthrough_Reward",
		},
		'Effects', {
			PlaceObj('EraseColonist', nil),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 90,
		'Title', T(324228265844, --[[StoryBit LastFounder Title]] "The Last Founder"),
		'VoicedText', T(541710719172, --[[voice:narrator]] "Without the slightest change in expression the Founder nods."),
		'Text', T(555227274788, --[[StoryBit LastFounder Text]] '"It was a selfish request by my part. I shall head out now..."'),
		'Enables', {
			"LastFounder_TechReward",
		},
		'Effects', {
			PlaceObj('EraseColonist', nil),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(175884259815, --[[StoryBit LastFounder Text]] "You've been through a lot. Enjoy the rest you've earned here with us. Permission denied."),
	}),
})

