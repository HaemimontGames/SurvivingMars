-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('ModifyLabel', {
			'Label', "WaterExtractor",
			'Prop', "water_production",
			'ModifyId', "LongWinter",
		}),
		PlaceObj('ModifyLabel', {
			'Label', "MoistureVaporator",
			'Prop', "water_production",
			'ModifyId', "LongWinter",
		}),
		PlaceObj('ModifyLabel', {
			'Label', "Dome",
			'Prop', "water_consumption",
			'ModifyId', "LongWinter",
		}),
		PlaceObj('ModifyLabel', {
			'Label', "Dome",
			'Prop', "electricity_consumption",
			'ModifyId', "LongWinter",
		}),
		PlaceObj('ModifyConst', {
			'Const', "ColdWaveSanityDamage",
			'ModifyId', "LongWinter",
		}),
		PlaceObj('ModifyConst', {
			'Const', "eat_food_per_visit",
			'ModifyId', "LongWinter",
		}),
		PlaceObj('ModifyLabel', {
			'Label', "MedicalBuilding",
			'Prop', "sanity_change",
			'ModifyId', "LongWinter",
		}),
		PlaceObj('ModifyLabel', {
			'Label', "Spacebar",
			'Prop', "sanity_change",
			'ModifyId', "LongWinter",
		}),
		PlaceObj('ModifyLabel', {
			'Label', "Casino Complex",
			'Prop', "sanity_change",
			'ModifyId', "LongWinter",
		}),
	},
	Effects = {
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
		PlaceObj('ModifyLabel', {
			'Label', "SubsurfaceHeater",
			'Prop', "electricity_consumption",
			'Percent', -50,
			'ModifyId', "LongWinterPermanent",
		}),
	},
	Prerequisites = {},
	ScriptDone = true,
	Text = T(591787829966, --[[StoryBit LongWinter_End Text]] "We have survived the Cold Wave. People are celebrating in the streets. \n\nIt was quite an ordeal but we've learned a lot about surviving in the cold. Some of our Engineers have come up with a way to improve our Subsurface Heaters.\n\n<effect><morale_bonus> Morale for <sols(morale_bonus_duration)> Sols. Subsurface Heaters power consumption halved."),
	TextReadyForValidation = true,
	TextsDone = true,
	Trigger = "ColdWaveEnded",
	VoicedText = T(936109222821, --[[voice:narrator]] "You never thought that you’d be so happy to see the red dust of Mars again. The long winter is over."),
	group = "Disasters",
	id = "LongWinter_End",
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_bonus",
		'Value', 15,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "morale_bonus_duration",
		'Value', 3600000,
	}),
})

