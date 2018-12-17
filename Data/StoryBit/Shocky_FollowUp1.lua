-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {
		PlaceObj('ForEachExecuteEffects', {
			'Label', "scientist",
			'Filters', {},
			'RandomCount', 3,
			'Effects', {
				PlaceObj('ModifyColonistStat', {
					'Stat', "Sanity",
					'Amount', "<sanity_penalty>",
				}),
			},
		}),
	},
	Prerequisites = {},
	ScriptDone = true,
	Text = T(557128800716, --[[StoryBit Shocky_FollowUp1 Text]] "However, after the initial frustration, they were quite astonished by the radical ideas of the boy.\n\n<effect>Three Scientists lost Sanity."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(964998422954, --[[StoryBit Shocky_FollowUp1 Title]] "Shocky"),
	VoicedText = T(673870183943, --[[voice:narrator]] "The scientists were confronted with new ideas which undermined the very foundations of modern Physics."),
	group = "Colonists",
	id = "Shocky_FollowUp1",
	PlaceObj('StoryBitParamNumber', {
		'Name', "sanity_penalty",
		'Value', -50,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_boost_high",
		'Value', 50,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_boost_low",
		'Value', 5,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(937827097882, --[[StoryBit Shocky_FollowUp1 Text]] "Science is a process. Nothing is written in stone."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(335435437142, --[[StoryBit Shocky_FollowUp1 CustomOutcomeText]] "3 Scientist Colonists gain a high Morale boost"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "scientist",
				'Filters', {},
				'RandomCount', 3,
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<morale_boost_high>",
						'Sols', 3600000,
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(343593808076, --[[StoryBit Shocky_FollowUp1 Text]] "So a twelve-year-old knows more about the universe than our best Physicists?"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(594124241370, --[[StoryBit Shocky_FollowUp1 CustomOutcomeText]] "all non-Scientist Colonists gain a small Morale boost"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {
					PlaceObj('HasTrait', {
						'Trait', "scientist",
						'Negate', true,
					}),
				},
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<morale_boost_low>",
						'Sols', 3600000,
					}),
				},
			}),
		},
	}),
})

