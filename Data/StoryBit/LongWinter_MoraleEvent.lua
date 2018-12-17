-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {},
	Prerequisites = {},
	ScriptDone = true,
	SuppressTime = 1080000,
	Text = T(146624104168, --[[StoryBit LongWinter_MoraleEvent Text]] "This damned long Cold Wave has everybody on edge. We have to do something about the Sanity of our colonists.\n\nNote: All effects will last until the end of the Cold Wave."),
	TextReadyForValidation = true,
	TextsDone = true,
	VoicedText = T(120250251183, --[[voice:narrator]] "Two Colonists bump into each other accidentally. A heated argument follows. It’s not the first one."),
	group = "Disasters",
	id = "LongWinter_MoraleEvent",
	PlaceObj('StoryBitParamNumber', {
		'Name', "sanity_restored",
		'Value', 40,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(838846202028, --[[StoryBit LongWinter_MoraleEvent Text]] "I know! Let’s organize a winter festival!"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(823788722118, --[[StoryBit LongWinter_MoraleEvent CustomOutcomeText]] "every colonists will regain <sanity_restored> Sanity"),
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "citymayor",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {},
				'Effects', {
					PlaceObj('ModifyColonistStat', {
						'Stat', "Sanity",
						'Amount', "<sanity_restored>",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitParamPercent', {
		'Name', "food_increase",
		'Value', 100,
	}),
	PlaceObj('StoryBitParamPercent', {
		'Name', "cold_wave_dmg",
		'Value', -50,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(637665293491, --[[StoryBit LongWinter_MoraleEvent Text]] "Warm food and a warm bed are the answer."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(284727608577, --[[StoryBit LongWinter_MoraleEvent CustomOutcomeText]] "Colonists will consume <food_increase>% more food and take less sanity damage from the disaster"),
		'Comment', "",
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ModifyConst', {
				'Const', "eat_food_per_visit",
				'Percent', "<food_increase>",
				'ModifyId', "LongWinter",
			}),
			PlaceObj('ModifyConst', {
				'Const', "ColdWaveSanityDamage",
				'Percent', "<cold_wave_dmg>",
				'ModifyId', "LongWinter",
			}),
		},
	}),
	PlaceObj('StoryBitParamPercent', {
		'Name', "medical_boost",
		'Value', 100,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(582720633961, --[[StoryBit LongWinter_MoraleEvent Text]] "Leave it to the doctors."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(899364202147, --[[StoryBit LongWinter_MoraleEvent CustomOutcomeText]] "double Sanity restored from medical buildings"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ModifyLabel', {
				'Label', "MedicalBuilding",
				'Prop', "sanity_change",
				'Percent', "<medical_boost>",
				'ModifyId', "LongWinter",
			}),
		},
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "extra_sanity",
		'Value', 5,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(793784829446, --[[StoryBit LongWinter_MoraleEvent Text]] "Let’s party!"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(507145556590, --[[StoryBit LongWinter_MoraleEvent CustomOutcomeText]] "Spacebars and Casinos will restore <extra_sanity> Sanity on visit"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ModifyLabel', {
				'Label', "Spacebar",
				'Prop', "sanity_change",
				'Amount', "<extra_sanity>",
				'ModifyId', "LongWinter",
			}),
			PlaceObj('ModifyLabel', {
				'Label', "Casino Complex",
				'Prop', "sanity_change",
				'Amount', "<extra_sanity>",
				'ModifyId', "LongWinter",
			}),
		},
	}),
})

