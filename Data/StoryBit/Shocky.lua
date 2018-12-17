-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('RenameObject', {
			'Label', "Colonist",
			'Filters', {
				PlaceObj('IsAssociatedObject', nil),
			},
			'Name', T(121706768632, --[[StoryBit Shocky Name]] "Matthew Gore"),
		}),
	},
	Category = "Tick_FounderStageDone",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/30_playing_children.tga",
	InheritsObject = false,
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'Filters', {
				PlaceObj('HasTrait', {
					'Trait', "Child",
				}),
			},
			'Condition', ">=",
			'Amount', 3,
		}),
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'Filters', {
				PlaceObj('HasTrait', {
					'Trait', "scientist",
				}),
			},
			'Condition', ">=",
			'Amount', 3,
		}),
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'Filters', {},
			'Condition', "<=",
			'Amount', 200,
		}),
		PlaceObj('PickFromLabel', {
			'Label', "ColonistMale",
			'Conditions', {
				PlaceObj('HasTrait', {
					'Trait', "Child",
				}),
			},
		}),
	},
	ScriptDone = true,
	Text = T(296918281569, --[[StoryBit Shocky Text]] "Troubling is, it seems Matthew's new “friend” knows about quantum physics a lot more than his age suggests."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(108325383725, --[[StoryBit Shocky Title]] "Shocky"),
	VoicedText = T(469756439220, --[[voice:narrator]] "A twelve-year-old boy living in the colony has an imaginary friend he calls Shocky."),
	group = "Colonists",
	id = "Shocky",
	PlaceObj('StoryBitReply', {
		'Text', T(835976003019, --[[StoryBit Shocky Text]] "Is that so? Summon three of our leading scientists and let them interview this boy."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(773406787448, --[[StoryBit Shocky CustomOutcomeText]] "Morale boost"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"Shocky_FollowUp1",
		},
		'Effects', {},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(818912701584, --[[StoryBit Shocky Text]] "Intriguing. Take this boy from his parents and study him in a Research Lab."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(262325591598, --[[StoryBit Shocky CustomOutcomeText]] "all Colonists lose Morale, gain Research"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"Shocky_FollowUp2",
		},
		'Effects', {},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(288448008514, --[[StoryBit Shocky Text]] "We should not meddle with a young person’s mind. Let him be."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(740211480205, --[[StoryBit Shocky CustomOutcomeText]] "unknown consequences"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"Shocky_FollowUp4",
		},
		'Effects', {},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(203253739940, --[[StoryBit Shocky Text]] "This boy has great potential. I will personally help him unfold it."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(392307472905, --[[StoryBit Shocky CustomOutcomeText]] "unknown consequences"),
		'Prerequisite', PlaceObj('IsCommander2', {
			'CommanderProfile1', "psychologist",
			'CommanderProfile2', "doctor",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"Shocky_FollowUp5",
		},
		'Effects', {},
	}),
})

