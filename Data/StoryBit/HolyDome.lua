-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "BuildingConstructed",
	Effects = {},
	EnableChance = 70,
	Enabled = true,
	Image = "UI/Messages/dome.tga",
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'Filters', {
				PlaceObj('HasTrait', {
					'Trait', "Religious",
				}),
			},
			'Condition', ">",
			'Amount', 20,
		}),
	},
	ScriptDone = true,
	Text = T(108526154483, --[[StoryBit HolyDome Text]] "This is a sensitive subject that could stir some controversy in the colony."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(924614555851, --[[StoryBit HolyDome Title]] "Holy Dome"),
	Trigger = "ConstructionComplete",
	VoicedText = T(432395236589, --[[voice:narrator]] "With the further expansion of the colony, there is a petition among our growing religious community to proclaim Mars a holy land."),
	group = "Colonists",
	id = "HolyDome",
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_penalty",
		'Value', -25,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_boost",
		'Value', 25,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_boost_high",
		'Value', 50,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "confort_penalty",
		'Value', -100,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "effect_duration",
		'Value', 7200000,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(300601467516, --[[StoryBit HolyDome Text]] "Such a great idea! Halleluiah! "),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(665054099831, --[[StoryBit HolyDome CustomOutcomeText]] "all Religious get Morale boost, all other Colonists get Morale penalty"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {
					PlaceObj('HasTrait', {
						'Trait', "Religious",
					}),
				},
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<morale_boost>",
						'Sols', "<effect_duration>",
					}),
				},
			}),
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {
					PlaceObj('HasTrait', {
						'Trait', "Religious",
						'Negate', true,
					}),
				},
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<morale_penalty>",
						'Sols', "<effect_duration>",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(343947485572, --[[StoryBit HolyDome Text]] "Mars is for all humans regardless of their beliefs."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(865714388679, --[[StoryBit HolyDome CustomOutcomeText]] "all Religious get Morale penalty, all other Colonists get Morale boost"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {
					PlaceObj('HasTrait', {
						'Trait', "Religious",
					}),
				},
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<morale_penalty>",
						'Sols', "<effect_duration>",
					}),
				},
			}),
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {
					PlaceObj('HasTrait', {
						'Trait', "Religious",
						'Negate', true,
					}),
				},
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<morale_boost>",
						'Sols', "<effect_duration>",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(647099338216, --[[StoryBit HolyDome Text]] "We value all members of the human race equally."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(934516630047, --[[StoryBit HolyDome CustomOutcomeText]] "no consequences"),
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "politician",
		}),
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(726945663827, --[[StoryBit HolyDome Text]] "This is absurd! Religion has no place on Mars."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(863876715500, --[[StoryBit HolyDome CustomOutcomeText]] "Comfort of all Religious Colonists is set to 0, non-Religious Colonists get Morale boost"),
		'Prerequisite', PlaceObj('IsSponsor', {
			'SponsorName', "NewArk",
			'Negate', true,
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {
					PlaceObj('HasTrait', {
						'Trait', "Religious",
						'Negate', true,
					}),
				},
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<morale_boost_high>",
						'Sols', "<effect_duration>",
					}),
				},
			}),
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {
					PlaceObj('HasTrait', {
						'Trait', "Religious",
					}),
				},
				'Effects', {
					PlaceObj('ModifyColonistStat', {
						'Stat', "Comfort",
						'Amount', "<confort_penalty>",
					}),
				},
			}),
		},
	}),
})

