-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "TechResearched",
	Effects = {
		PlaceObj('EraseColonist', nil),
	},
	Enabled = true,
	Prerequisites = {
		PlaceObj('PickResident', {
			'ParentBuildingLabel', "Arcology",
			'ResidentConditions', {},
		}),
		PlaceObj('IsTechId', {
			'Field', "Storybits",
			'TechId', "ViolentUrges",
		}),
	},
	ScriptDone = true,
	Text = T(448914075587, --[[StoryBit FreeWill_2 Text]] "When a criminal mastermind, a true psychopath, like our Colonist <DisplayName> enters the close-knit society of the hive mind, the sheer will of the said individual could overpower the ones who are weak-willed and prone to suggestion. Constantly projecting thoughts of crime and murder into the mental network steadily erodes the sanity of the victims who become unwilling pawns of the criminal.\n\n<effect><DisplayName> has been exiled and has left the Colony."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(496191481746, --[[StoryBit FreeWill_2 Title]] "Free Will: Violent Urges Solved"),
	Trigger = "TechResearchedTrigger",
	VoicedText = T(569428296629, --[[voice:narrator]] "The mysterious crime spree by Arcology residents has been solved. As with most complicated cases, the truth is hard to believe, but yet evident."),
	group = "Breakthroughs",
	id = "FreeWill_2",
	PlaceObj('StoryBitReply', {
		'Text', T(858940240505, --[[StoryBit FreeWill_2 Text]] "Upgrade Hive Mind hardware in all Arcologies."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(680220767258, --[[StoryBit FreeWill_2 CustomOutcomeText]] "all Arcologies enter maintenance for <electronics(shield_cost)> and gain <comfort_bonus> residence Comfort forever"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ModifyLabel', {
				'Label', "Arcology",
				'Prop', "service_comfort",
				'Amount', "<comfort_bonus>",
			}),
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Arcology",
				'Filters', {},
				'Effects', {
					PlaceObj('SetBuildingBreakdownState', {
						'RepairResource', "Electronics",
						'RepairAmount', "<shield_cost>",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "comfort_bonus",
		'Value', 10,
	}),
	PlaceObj('StoryBitParamResource', {
		'Name', "shield_cost",
		'Value', 2000,
		'Resource', "electronics",
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(942041620016, --[[StoryBit FreeWill_2 Text]] "Concentrate on boosting personal motivation in Arcologies."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(945783556355, --[[StoryBit FreeWill_2 CustomOutcomeText]] "All Arcology residents gain <morale_up> Morale for <sols(morale_sols)> Sols"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Arcology",
				'Filters', {},
				'Effects', {
					PlaceObj('ForEachResident', {
						'Filters', {},
						'Effects', {
							PlaceObj('ModifyObject', {
								'Prop', "base_morale",
								'Amount', "<morale_up>",
								'Sols', "<morale_sols>",
							}),
						},
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_up",
		'Value', 10,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "morale_sols",
		'Value', 7200000,
	}),
})

