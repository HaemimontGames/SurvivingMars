-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_FounderStageDone",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/03_discussion.tga",
	Prerequisites = {
		PlaceObj('IsMysteryActive', {
			'Mystery', "WorldWar3",
			'Negate', true,
		}),
		PlaceObj('SupplyMissionsEnabled', nil),
	},
	ScriptDone = true,
	Text = T(217672553828, --[[StoryBit RefugeeCrisis Text]] "Accepting some refugees in the colony will generate both Funding and good press for us. Social transitions are never entirely smooth, though.\n\n<hint>Refugees are untrained for life on Mars and will initially have reduced work performance at all jobs. Some of them may have trouble adjusting to the Martian lifestyle and may become Renegades."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(622308797695, --[[StoryBit RefugeeCrisis Title]] "Refugee Crisis"),
	VoicedText = T(670867179809, --[[voice:narrator]] "Recent political turmoil on Earth has driven many refugees to seek shelter as far from the mother planet as possible."),
	group = "Earth",
	id = "RefugeeCrisis",
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_penalty",
		'Value', -15,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "morale_penalty_sols",
		'Value', 14400000,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(506337150904, --[[StoryBit RefugeeCrisis Text]] "We will grant asylum to some of the refugees."),
		'OutcomeText', "auto",
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"RefugeeCrisis_DeadInOrbit",
		},
		'Effects', {
			PlaceObj('SpawnRefugeeRocket', {
				'DisplayName', T(926576950080, --[[StoryBit RefugeeCrisis DisplayName]] "Refugee Rocket"),
				'RocketDescription', T(867511534813, --[[StoryBit RefugeeCrisis RocketDescription]] "Refugees from Earth want to join our colony."),
				'TravelTimeMars', 0,
				'RefugeeCount', 10,
				'AssociateWithStoryBit', true,
			}),
			PlaceObj('RewardFunding', {
				'Amount', 200000000,
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(554423692409, --[[StoryBit RefugeeCrisis Text]] "We will grant asylum to as many as we can."),
		'OutcomeText', "auto",
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"RefugeeCrisis_DeadInOrbit",
		},
		'Effects', {
			PlaceObj('SpawnRefugeeRocket', {
				'DisplayName', T(612078175972, --[[StoryBit RefugeeCrisis DisplayName]] "Refugee Rocket"),
				'RocketDescription', T(257814543149, --[[StoryBit RefugeeCrisis RocketDescription]] "Refugees from Earth want to join our colony."),
				'TravelTimeMars', 0,
				'RefugeeCount', 30,
				'AssociateWithStoryBit', true,
			}),
			PlaceObj('RewardFunding', {
				'Amount', 200000000,
			}),
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {},
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<small_morale_penalty>",
						'Sols', "<small_morale_penalty_sols>",
					}),
				},
				'Description', T(626635884898, --[[StoryBit RefugeeCrisis Description]] "<small_morale_penalty> Colonist Morale for the next <sols(morale_penalty_sols)> Sols"),
			}),
		},
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "small_morale_penalty",
		'Value', -5,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "small_morale_penalty_sols",
		'Value', 14400000,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(213421070648, --[[StoryBit RefugeeCrisis Text]] "Mars is not a place for untrained civilians."),
		'OutcomeText', "auto",
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "politician",
			'Negate', true,
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
						'Sols', "<morale_penalty_sols>",
					}),
				},
				'Description', T(406588280703, --[[StoryBit RefugeeCrisis Description]] "<morale_penalty> Colonist Morale for the next <sols(morale_penalty_sols)> Sols"),
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(992105123674, --[[StoryBit RefugeeCrisis Text]] "Let me make a tweet to distract the journalists!"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(396329867719, --[[StoryBit RefugeeCrisis CustomOutcomeText]] "no consequences"),
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "politician",
		}),
	}),
})

