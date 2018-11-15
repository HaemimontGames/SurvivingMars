-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_FounderStageDone",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/10_protest.tga",
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'Filters', {
				PlaceObj('HasTrait', {
					'Trait', "Renegade",
				}),
			},
			'Condition', ">=",
			'Amount', 10,
		}),
		PlaceObj('CheckObjectCount', {
			'Label', "Infirmary",
			'Filters', {},
			'Condition', ">",
			'Amount', 2,
		}),
	},
	ScriptDone = true,
	Text = T{347399580817, --[[StoryBit Protest Text]] "They have closed off several Infirmaries by threatening the personnel inside. All this to make their point, we can guess."},
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T{390884583184, --[[StoryBit Protest Title]] "Renegades: Health Care, who Cares?"},
	VoicedText = T{531026986547, --[[voice:narrator]] "Renegade colonists are protesting against the allegedly bad health conditions in the colony."},
	group = "Renegades",
	id = "Protest",
	PlaceObj('StoryBitReply', {
		'Text', T{562817921444, --[[StoryBit Protest Text]] "Another day in life...on Mars."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{729876011234, --[[StoryBit Protest CustomOutcomeText]] "All Infirmaries disabled for <sols(disabled_infirmaries)> Sols"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Infirmary",
				'Filters', {},
				'Effects', {
					PlaceObj('SetBuildingEnabledState', {
						'Duration', "<disabled_infirmaries>",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{906559251331, --[[StoryBit Protest Text]] "Send in officers to disperse the crowd."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{337714254015, --[[StoryBit Protest CustomOutcomeText]] "All Colonists lose Morale for <sols(penalty_duration)> Sols"},
		'Prerequisite', PlaceObj('CheckColonistCount', {
			'Amount', 5,
			'Trait', "security",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {},
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<morale_penalty>",
						'Sols', "<penalty_duration>",
						'ModifyId', "Health Care, Who Cares",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_penalty",
		'Value', -35,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "penalty_duration",
		'Value', 10800000,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "disabled_infirmaries",
		'Value', 3600000,
	}),
})

