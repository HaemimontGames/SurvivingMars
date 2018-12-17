-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_FounderStageDone",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/13_renegades.tga",
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "FactoryBuildings",
			'Filters', {},
			'Condition', ">",
			'Amount', 1,
		}),
		PlaceObj('PickFromLabel', {
			'Label', "Colonist",
			'Conditions', {
				PlaceObj('HasTrait', {
					'Trait', "Youth",
				}),
				PlaceObj('HasTrait', {
					'Trait', "Renegade",
				}),
			},
		}),
	},
	ScriptDone = true,
	Text = T(796006225278, --[[StoryBit Vandals Text]] "Albeit the biggest such incident lately, it is not the first. We suspect a gang of renegades led by a self-declared Street King named <DisplayName> to be responsible.\n\nSo far they have always smartly evaded our attempts to catch them in the act."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(633068112353, --[[StoryBit Vandals Title]] "Renegades: Street King"),
	VoicedText = T(842725828714, --[[voice:narrator]] "Vandals have sprayed obscene signs and drawings on several factories this night."),
	group = "Renegades",
	id = "Vandals",
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_penalty",
		'Value', -15,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "penalty_sols",
		'Value', 7200000,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(827569042931, --[[StoryBit Vandals Text]] "Clean up the factories and make sure this doesn't happen again."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(558574066840, --[[StoryBit Vandals CustomOutcomeText]] "emergency maintenance for all Factories"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('AddTrait', {
				'Trait', "Guru",
			}),
			PlaceObj('ForEachExecuteEffects', {
				'Label', "FactoryBuildings",
				'Filters', {},
				'Effects', {
					PlaceObj('SetBuildingBreakdownState', {
						'RepairAmount', 3000,
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(568368955260, --[[StoryBit Vandals Text]] "We can't stop the factories right now. The workers will have to tolerate the drawings."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(755181016807, --[[StoryBit Vandals CustomOutcomeText]] "all factory workers lose Morale"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('AddTrait', {
				'Trait', "Guru",
			}),
			PlaceObj('ForEachExecuteEffects', {
				'Label', "FactoryBuildings",
				'Filters', {},
				'Effects', {
					PlaceObj('ForEachWorker', {
						'Filters', {},
						'Effects', {
							PlaceObj('ModifyObject', {
								'Prop', "base_morale",
								'Amount', "<morale_penalty>",
								'Sols', "<penalty_sols>",
							}),
						},
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(260925240976, --[[StoryBit Vandals Text]] "Use a Rover as a trap and attempt to catch the leader."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(563737516480, --[[StoryBit Vandals CustomOutcomeText]] "lose one Rover"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"Vandals_FollowUp_1",
		},
		'Disables', {},
		'Effects', {
			PlaceObj('AddTrait', nil),
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Rover",
				'Filters', {},
				'RandomCount', 1,
				'Effects', {
					PlaceObj('DestroyVehicle', nil),
				},
			}),
		},
	}),
})

