-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {},
	Enables = {
		"DustSickness_CureFound",
	},
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'Filters', {
				PlaceObj('HasTrait', {
					'Trait', "DustSickness",
				}),
			},
			'Condition', ">=",
			'Amount', 30,
		}),
	},
	ScriptDone = true,
	SuppressTime = 7200000,
	Text = T(683350336026, --[[StoryBit DustSickness_Cure Text]] "One of our Scientists has come up with a paper that proposes two possible solutions to the Dust Sickness. The research may take a long time to complete but there are possible shortcuts.\n\n<goal>Research the “Dust Sickness Cure” tech to cure all Colonists from the affliction"),
	TextReadyForValidation = true,
	TextsDone = true,
	VoicedText = T(358011942030, --[[voice:narrator]] "The Scientist coughs mid-sentence – a sign of the Dust Sickness – but his ideas make sense. Perhaps there is a way to cure this illness."),
	group = "Disasters",
	id = "DustSickness_Cure",
	PlaceObj('StoryBitParamNumber', {
		'Name', "comfort_penalty",
		'Value', -30,
	}),
	PlaceObj('StoryBitParamPercent', {
		'Name', "tech_reduction_tests",
		'Value', 25,
	}),
	PlaceObj('StoryBitParamPercent', {
		'Name', "tech_reduction_pay",
		'Value', 50,
	}),
	PlaceObj('StoryBitParamFunding', {
		'Name', "cure_cost",
		'Value', 1000000000,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(526151288378, --[[StoryBit DustSickness_Cure Text]] "Subject dust sick Colonists to invasive tests."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(105294187788, --[[StoryBit DustSickness_Cure CustomOutcomeText]] "sick Colonists suffer <comfort_penalty> Comfort; tech cost reduced by <tech_reduction_tests>%"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('DiscoverTech', {
				'Field', "Storybits",
				'Tech', "DustSicknessCure",
				'Cost', 6000,
			}),
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {
					PlaceObj('HasTrait', {
						'Trait', "DustSickness",
					}),
				},
				'Effects', {
					PlaceObj('ModifyColonistStat', {
						'Stat', "Comfort",
						'Amount', "<comfort_penalty>",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(944544502255, --[[StoryBit DustSickness_Cure Text]] "Spare no expense."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(725813827810, --[[StoryBit DustSickness_Cure CustomOutcomeText]] "tech cost reduced by <tech_reduction_pay>%"),
		'Cost', "<cure_cost>",
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('DiscoverTech', {
				'Field', "Storybits",
				'Tech', "DustSicknessCure",
				'Cost', 4000,
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(884338765484, --[[StoryBit DustSickness_Cure Text]] "Our sponsor can connect us to some of the best medical minds in the world."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(340073631258, --[[StoryBit DustSickness_Cure CustomOutcomeText]] "tech cost reduced by <tech_reduction_pay>%"),
		'Prerequisite', PlaceObj('IsSponsor', {
			'SponsorName', "ESA",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('DiscoverTech', {
				'Field', "Storybits",
				'Tech', "DustSicknessCure",
				'Cost', 4000,
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(505527338268, --[[StoryBit DustSickness_Cure Text]] "We won’t take any shortcuts!\n"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('DiscoverTech', {
				'Field', "Storybits",
				'Tech', "DustSicknessCure",
				'Cost', 8000,
			}),
		},
	}),
})

