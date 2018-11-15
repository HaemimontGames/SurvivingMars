-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {},
	Prerequisites = {},
	ScriptDone = true,
	SelectObject = false,
	SuppressTime = 14400000,
	Text = T{463070013902, --[[StoryBit BloodMusic_2 Text]] "We still have the key to stopping this before the Colonists begin to suspect a sinister plan on our side."},
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T{558683602378, --[[StoryBit BloodMusic_2 Title]] "Blood Music: Interphase"},
	VoicedText = T{683492349841, --[[voice:narrator]] "The effects of the mutated nanites have become too widespread and people begin to worry."},
	group = "Breakthroughs",
	id = "BloodMusic_2",
	PlaceObj('StoryBitReply', {
		'Text', T{757460357516, --[[StoryBit BloodMusic_2 Text]] "Maybe it’s time we stop..."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{181538485225, --[[StoryBit BloodMusic_2 CustomOutcomeText]] "stops the transformation effects"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Disables', {
			"BloodMusic_Repeatable",
		},
		'Effects', {},
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "morale_sols",
		'Value', 7200000,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_down",
		'Value', 10,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{147027599080, --[[StoryBit BloodMusic_2 Text]] "They’ll manage ."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{541482925814, --[[StoryBit BloodMusic_2 CustomOutcomeText]] "the effect continue, all colonists lose <morale_down> for <sols(morale_sols)> Sols"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"BloodMusic_2",
		},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {},
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<morale_down>",
						'Sols', "<morale_sols>",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{836503150238, --[[StoryBit BloodMusic_2 Text]] "I will give a motivational speech about the future of humankind."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{268350622764, --[[StoryBit BloodMusic_2 CustomOutcomeText]] "the effects continue"},
		'Prerequisite', PlaceObj('IsCommander2', {
			'CommanderProfile1', "politician",
			'CommanderProfile2', "ecologist",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"BloodMusic_2",
		},
		'Effects', {},
	}),
})

