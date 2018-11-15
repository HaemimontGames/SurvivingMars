-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('ExtendDisaster', {
			'Time', 24,
			'Disaster', "Cold Wave",
		}),
	},
	Category = "ColdWaveStart",
	Delay = 60000,
	Effects = {},
	Enabled = true,
	Enables = {
		"LongWinter_BigExtension_NoTech",
		"LongWinter_BigExtension_Tech",
		"LongWinter_End",
	},
	Image = "UI/Messages/Events/19_frozen_landscape.tga",
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'Filters', {},
			'Condition', ">=",
			'Amount', 50,
		}),
		PlaceObj('SupplyMissionsEnabled', nil),
	},
	ScriptDone = true,
	Text = T{687327488485, --[[StoryBit LongWinter Text]] "It looks like our weather predictions were a little off. The Cold Wave will probably last a Sol more than we previously thought."},
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T{123102472982, --[[StoryBit LongWinter Title]] "Long Winter"},
	Trigger = "ColdWave",
	VoicedText = T{839881602984, --[[voice:narrator]] "As you sip your hot Earl Gray tea, a weather update comes up on your monitor."},
	group = "Disasters",
	id = "LongWinter",
	PlaceObj('StoryBitReply', {
		'Text', T{944660397278, --[[StoryBit LongWinter Text]] "Our first priority is make sure our power generation is in working order."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{918266029112, --[[StoryBit LongWinter CustomOutcomeText]] "all power producers receive a free maintenance check"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Building",
				'Filters', {
					PlaceObj('IsBuildingClass', {
						'BuildingClass', {
							"ElectricityProducer",
						},
					}),
				},
				'Effects', {
					PlaceObj('SetBuildingBreakdownState', {
						'RepairResource', "no_resource",
						'RepairAmount', 0,
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{724054178242, --[[StoryBit LongWinter Text]] "This sounds like a good opportunity to runs some survival drills."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{483628397173, --[[StoryBit LongWinter CustomOutcomeText]] "several Colonists gain the Survivor trait"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {
					PlaceObj('HasTrait', {
						'Trait', "Child",
						'Negate', true,
					}),
				},
				'RandomCount', 5,
				'Effects', {
					PlaceObj('AddTrait', {
						'Trait', "Survivor",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitParamPercent', {
		'Name', "water_boost",
		'Value', 10,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{194987000057, --[[StoryBit LongWinter Text]] "The storage tanks are frozen, but I know a way to increase our Water production."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{511769758303, --[[StoryBit LongWinter CustomOutcomeText]] "<water_boost>% Water production for the duration of the Cold Wave"},
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "hydroengineer",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ModifyLabel', {
				'Label', "WaterExtractor",
				'Prop', "water_production",
				'Percent', "<water_boost>",
				'ModifyId', "LongWinter",
			}),
			PlaceObj('ModifyLabel', {
				'Label', "MoistureVaporator",
				'Prop', "water_production",
				'Percent', "<water_boost>",
				'ModifyId', "LongWinter",
			}),
		},
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_bonus",
		'Value', 10,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "morale_bonus_duration",
		'Value', 7200000,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{557046368970, --[[StoryBit LongWinter Text]] "Fellow Martians, we’ve gotten through worse before. Just do your duty and don’t panic!"},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{952769577915, --[[StoryBit LongWinter CustomOutcomeText]] "<morale_bonus> Morale for <sols(morale_bonus_duration)> Sols"},
		'Prerequisite', PlaceObj('IsCommander2', {
			'CommanderProfile1', "citymayor",
			'CommanderProfile2', "politician",
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
						'Amount', "<morale_bonus>",
						'Sols', "<morale_bonus_duration>",
					}),
				},
			}),
		},
	}),
})

