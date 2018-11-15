-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {},
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'Filters', {
				PlaceObj('HasTrait', {
					'Trait', "Idiot",
				}),
			},
			'Condition', ">=",
			'Amount', 5,
		}),
	},
	ScriptDone = true,
	SuppressTime = 7200000,
	Text = T{329246546403, --[[StoryBit FlatMars_End Text]] "Their plan involves some home-built craft that will take as many as <number_of_idiots> people high enough into the stratosphere to disprove that Mars is round once and for all. Needless to say, the craft looks incredibly dangerous and a far cry from having even the slimmest chance of success."},
	TextReadyForValidation = true,
	TextsDone = true,
	VoicedText = T{150695526934, --[[voice:narrator]] "The head of the, now quite grown in numbers, Flat Mars Society has come up with a plan that will, quote - “bring down the veil of lies that the Martian government is feeding its colonists and will enlighten anyone who is willing to see past it!”"},
	group = "Colonists",
	id = "FlatMars_End",
	PlaceObj('StoryBitParamNumber', {
		'Name', "number_of_idiots",
		'Value', 10,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{702018806145, --[[StoryBit FlatMars_End Text]] "This has gone on long enough. Ban the Flat Mars Society!"},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{803513882897, --[[StoryBit FlatMars_End CustomOutcomeText]] "Martianborn Colonists lose Morale"},
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_penalty",
		'Value', -15,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "morale_penalty_sols",
		'Value', 14400000,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {
					PlaceObj('HasTrait', {
						'Trait', "Martianborn",
					}),
				},
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<morale_penalty>",
						'Sols', "<morale_penalty_sols>",
					}),
				},
				'Description', T{406588280703, --[[StoryBit FlatMars_End Description]] "<morale_penalty> Colonist Morale for the next <sols(morale_penalty_sols)> Sols"},
			}),
			PlaceObj('RemoveTrait', {
				'Trait', "Guru",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{635136282832, --[[StoryBit FlatMars_End Text]] "You know what, let them do it!"},
		'CustomOutcomeText', T{368587624296, --[[StoryBit FlatMars_End CustomOutcomeText]] "unknown outcome"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ActivateStoryBit', {
				'Id', "FlatMars_Outcome1",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{366479108230, --[[StoryBit FlatMars_End Text]] "<DisplayName> has done enough harm, they may board the craft alone."},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ActivateStoryBit', {
				'Id', "FlatMars_Outcome2",
			}),
		},
	}),
})

