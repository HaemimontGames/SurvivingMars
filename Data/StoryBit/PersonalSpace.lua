-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_FounderStageDone",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/26_colonist.tga",
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'Filters', {},
			'Condition', ">=",
			'Amount', 30,
		}),
	},
	ScriptDone = true,
	Text = T{477346266344, --[[StoryBit PersonalSpace Text]] 'You arrive at the scene just to see a chair flying out of the window, smashing right in front of the crowd of concerned citizens. You hear the hysterical cries from inside: "Leave me alone! I don’t need to see any of you!"\n\nAs you come closer, the crowd turns towards you.'},
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T{317075983830, --[[StoryBit PersonalSpace Title]] "Personal Space"},
	VoicedText = T{916015661721, --[[voice:narrator]] "A Colonist has snapped. They demand more personal space and are barricaded inside their house until their demands are met."},
	group = "Colonists",
	id = "PersonalSpace",
	PlaceObj('StoryBitParamNumber', {
		'Name', "colonist_comfort_penalty",
		'Value', -20,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "residence_livingspace_penalty",
		'Value', -2,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "residence_comfort_bonus",
		'Value', 10,
	}),
	PlaceObj('StoryBitParamPercent', {
		'Name', "residence_cost_reduction",
		'Value', -20,
	}),
	PlaceObj('StoryBitParamPercent', {
		'Name', "home_collective_boost",
		'Value', 50,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{406456092282, --[[StoryBit PersonalSpace Text]] "He's right. We all need more personal space."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{980781990422, --[[StoryBit PersonalSpace CustomOutcomeText]] "all residences will grant more Comfort, but provide less living space"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ModifyLabel', {
				'Label', "Residence",
				'Prop', "service_comfort",
				'Amount', "<residence_comfort_bonus>",
			}),
			PlaceObj('ModifyLabel', {
				'Label', "Residence",
				'Prop', "capacity",
				'Amount', "<residence_livingspace_penalty>",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{201055595548, --[[StoryBit PersonalSpace Text]] "Personal space is a luxury we cannot afford."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{249584970646, --[[StoryBit PersonalSpace CustomOutcomeText]] "all Colonists lose Comfort"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {},
				'Effects', {
					PlaceObj('ModifyColonistStat', {
						'Stat', "Comfort",
						'Amount', "<colonist_comfort_penalty>",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{305006395090, --[[StoryBit PersonalSpace Text]] "No problems! We will just build more residences!"},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{557165901802, --[[StoryBit PersonalSpace CustomOutcomeText]] "Residences costs are decreased permanently"},
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "citymayor",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ModifyLabel', {
				'Label', "Residence",
				'Prop', "Concrete_cost_modifier",
				'Percent', "<residence_cost_reduction>",
			}),
			PlaceObj('ModifyLabel', {
				'Label', "Residence",
				'Prop', "Metals_cost_modifier",
				'Percent', "<residence_cost_reduction>",
			}),
			PlaceObj('ModifyLabel', {
				'Label', "Residence",
				'Prop', "Electronics_cost_modifier",
				'Percent', "<residence_cost_reduction>",
			}),
			PlaceObj('ModifyLabel', {
				'Label', "Residence",
				'Prop', "Polymers_cost_modifier",
				'Percent', "<residence_cost_reduction>",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{452114444171, --[[StoryBit PersonalSpace Text]] "We must harmonize the living environment!"},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{373007909943, --[[StoryBit PersonalSpace CustomOutcomeText]] "Home Collective tech research cost is reduced"},
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "psychologist",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardTechBoost', {
				'Field', "Social",
				'Research', "HomeCollective",
				'Amount', 50,
			}),
		},
	}),
})

