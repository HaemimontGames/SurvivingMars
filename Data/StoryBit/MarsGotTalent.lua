-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_FounderStageDone",
	Comment = "Prerequisit should be 5 domes with colonists living inside instead of the current one",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/09_fireworks.tga",
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "Dome",
			'Filters', {
				PlaceObj('CheckObjectCount', {
					'Label', "Colonist",
					'InDome', true,
					'Filters', {},
					'Condition', ">",
					'Amount', 0,
				}),
			},
			'Condition', ">=",
			'Amount', 5,
		}),
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'Filters', {},
			'Condition', ">=",
			'Amount', 100,
		}),
	},
	ScriptDone = true,
	Text = T(240324041401, --[[StoryBit MarsGotTalent Text]] "If you agree to this proposal, it will most likely stir some passions among the participants."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(184129225242, --[[StoryBit MarsGotTalent Title]] "Mars's Got Talent"),
	VoicedText = T(961220782542, --[[voice:narrator]] "Our Colonists have been watching various talent shows from Earth and are eager to organize a contest of our own."),
	group = "Colonists",
	id = "MarsGotTalent",
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_penalty_low",
		'Value', -15,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_penalty_very_low",
		'Value', -10,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_penalty_high",
		'Value', -25,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_boost_high",
		'Value', 35,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_boost_low",
		'Value', 10,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "morale_duration_sols",
		'Value', 7200000,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(251698343905, --[[StoryBit MarsGotTalent Text]] "I see no benefits of such a contest. It would be just a needless distraction."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(817022357132, --[[StoryBit MarsGotTalent CustomOutcomeText]] "Colonists lose Morale"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T(291180184020, --[[voice:narrator]] "Everyone is saddened by your decision."),
		'Text', T(714890403365, --[[StoryBit MarsGotTalent Text]] "<effect>All colonists lose Morale."),
		'Effects', {
			PlaceObj('ModifyLabel', {
				'Label', "Colonist",
				'Prop', "base_morale",
				'Amount', "<morale_penalty_low>",
				'Sols', "<morale_duration_sols>",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(11044, --[[StoryBit MarsGotTalent Text]] "What a splendid idea! Let's call it \"A Game of Domes\"!"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(368937553603, --[[StoryBit MarsGotTalent CustomOutcomeText]] "Residents of one Dome will get a Morale boost, the residents of the Dome that places last suffer a morale loss"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T(968833768822, --[[voice:narrator]] "With the tournament's end the winner Dome celebrates while all others feel down."),
		'Text', T(11045, --[[StoryBit MarsGotTalent Text]] "<effect>Residents of the winner Dome receive a Morale boost while the last placed Dome suffers a morale penalty for its residents. "),
		'Effects', {
			PlaceObj('PickFromLabelEffect', {
				'Label', "Dome",
				'Conditions', {
					PlaceObj('CheckObjectCount', {
						'Label', "Colonist",
						'InDome', true,
						'Filters', {},
						'Condition', ">",
						'Amount', 0,
					}),
				},
			}),
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'InDome', true,
				'Filters', {},
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<morale_boost_low>",
						'Sols', "<morale_duration_sols>",
					}),
				},
			}),
			PlaceObj('PickFromLabelEffect', {
				'Label', "Dome",
				'PickDifferent', true,
				'Conditions', {
					PlaceObj('CheckObjectCount', {
						'Label', "Colonist",
						'InDome', true,
						'Filters', {},
						'Condition', ">",
						'Amount', 0,
					}),
				},
			}),
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'InDome', true,
				'Filters', {},
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<morale_penalty_low>",
						'Sols', "<morale_duration_sols>",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(551082808172, --[[StoryBit MarsGotTalent Text]] "Our Colonists have survived everything Mars could throw at them. I would say they have already proven their talents!"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(410161117236, --[[StoryBit MarsGotTalent CustomOutcomeText]] "no effects"),
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "politician",
		}),
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(699220655680, --[[StoryBit MarsGotTalent Text]] "Stream the competition to Earth and use the event to fund the colony."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(623916642380, --[[StoryBit MarsGotTalent CustomOutcomeText]] "Get Funding, residents of one Dome will get a large Morale boost, the last placed Dome's residents suffer a greater morale loss"),
	}),
	PlaceObj('StoryBitParamFunding', {
		'Name', "funding_reward",
		'Value', 500000000,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T(315611663055, --[[voice:narrator]] "The publicity around the event stirred strong passions all around the colony."),
		'Text', T(549567676510, --[[StoryBit MarsGotTalent Text]] "<effect>Winner Dome's residents gain a significant Morale boost while the last placed Dome suffers a morale penalty for its residents. "),
		'Effects', {
			PlaceObj('PickFromLabelEffect', {
				'Label', "Dome",
				'Conditions', {
					PlaceObj('CheckObjectCount', {
						'Label', "Colonist",
						'InDome', true,
						'Filters', {},
						'Condition', ">",
						'Amount', 0,
					}),
				},
			}),
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'InDome', true,
				'Filters', {},
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<morale_boost_high>",
						'Sols', "<morale_duration_sols>",
					}),
				},
			}),
			PlaceObj('PickFromLabelEffect', {
				'Label', "Dome",
				'PickDifferent', true,
				'Conditions', {
					PlaceObj('CheckObjectCount', {
						'Label', "Colonist",
						'InDome', true,
						'Filters', {},
						'Condition', ">",
						'Amount', 0,
					}),
				},
			}),
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'InDome', true,
				'Filters', {},
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<morale_penalty_high>",
						'Sols', "<morale_duration_sols>",
					}),
				},
			}),
			PlaceObj('RewardFunding', {
				'Amount', "<funding_reward>",
			}),
		},
	}),
})

