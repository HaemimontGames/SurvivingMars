-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('KillColonist', nil),
	},
	Category = "Tick_FounderStageDone",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/10_protest.tga",
	Prerequisites = {
		PlaceObj('PickFromLabel', {
			'Label', "Colonist",
			'Conditions', {
				PlaceObj('HasTrait', {
					'Trait', "Renegade",
				}),
				PlaceObj('HasTrait', {
					'Trait', "Senior",
					'Negate', true,
				}),
			},
		}),
		PlaceObj('CheckObjectCount', {
			'Label', "SecurityStation",
			'Filters', {},
			'Condition', ">=",
			'Amount', 1,
		}),
	},
	ScriptDone = true,
	Text = T(837464417554, --[[StoryBit Oppression Text]] "A young renegade, <DisplayName>, has been killed by our security forces in a tragic sequence of events. \n\nThe colony is shocked and many Colonists are coming forward with accusations of Security Officers using excessive force when confronting mere acts of vandalism.\n\nThe community, both Renegade and non-Renegade citizens, demand justice in the form of retaliatory actions against the Officers involved."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(685295205241, --[[StoryBit Oppression Title]] "Renegades: Justice"),
	VoicedText = T(960167046928, --[[voice:narrator]] "A tragedy has mired the colony today."),
	group = "Renegades",
	id = "Oppression",
	PlaceObj('StoryBitReply', {
		'Text', T(121445056181, --[[StoryBit Oppression Text]] "This kind of behavior doesn't suit their station. Punish the Officers."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(447741238430, --[[StoryBit Oppression CustomOutcomeText]] " all workers in Security Stations lose Morale"),
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "sols",
		'Value', 7200000,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_penalty",
		'Value', -35,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "SecurityStation",
				'Filters', {},
				'Effects', {
					PlaceObj('ForEachWorker', {
						'Filters', {},
						'Effects', {
							PlaceObj('ModifyObject', {
								'Prop', "base_morale",
								'Amount', "<morale_penalty>",
								'Sols', "<sols>",
							}),
						},
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(714078729397, --[[StoryBit Oppression Text]] "The Officers were doing their jobs. No punishment is necessary. "),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(451541096754, --[[StoryBit Oppression CustomOutcomeText]] "some Colonists will become Renegades"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T(181587119678, --[[voice:narrator]] "Your answer was met by furry from the colonists."),
		'Text', T(807192936015, --[[StoryBit Oppression Text]] "Violent protests and unflattering slurs could be heard for several more hours.\n\nWhile we do not have precise numbers, its safe to say that our renegade population has increased."),
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {
					PlaceObj('HasTrait', {
						'Trait', "Renegade",
						'Negate', true,
					}),
				},
				'RandomCount', 10,
				'Effects', {
					PlaceObj('AddTrait', {
						'Trait', "Renegade",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(573455130085, --[[StoryBit Oppression Text]] "Close all Security Stations for <sols(sols)> Sols for retraining. This must never happen again."),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "SecurityStation",
				'Filters', {},
				'Effects', {
					PlaceObj('SetBuildingEnabledState', {
						'Duration', "<sols>",
					}),
				},
			}),
		},
	}),
})

