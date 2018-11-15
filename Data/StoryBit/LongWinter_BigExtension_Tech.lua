-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('ExtendDisaster', {
			'Time', 4,
			'Disaster', "Cold Wave",
		}),
	},
	Disables = {
		"LongWinter_BigExtension_NoTech",
	},
	Effects = {},
	Enables = {
		"LongWinter_MoraleEvent",
	},
	Prerequisites = {},
	ScriptDone = true,
	SuppressTime = 1500000,
	Text = T{134795915021, --[[StoryBit LongWinter_BigExtension_Tech Text]] "New weather data has come and the situation is dire – the Cold Wave prediction has been extended by another 4 Sols.\n\nWill our Power and Water grids sustain us for that long?"},
	TextReadyForValidation = true,
	TextsDone = true,
	VoicedText = T{486621856457, --[[voice:narrator]] "A team of Scientists argues over the satellite data as you quietly ponder the situation. It’s going to be a long winter."},
	group = "Disasters",
	id = "LongWinter_BigExtension_Tech",
	PlaceObj('StoryBitParamFunding', {
		'Name', "sponsor_help",
		'Value', 500000000,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "free_prefabs",
		'Value', 3,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "free_pods",
		'Value', 5,
	}),
	PlaceObj('StoryBitParamPercent', {
		'Name', "consumption_reduction",
		'Value', -25,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{724633167414, --[[StoryBit LongWinter_BigExtension_Tech Text]] "We need help from Earth."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{406975278731, --[[StoryBit LongWinter_BigExtension_Tech CustomOutcomeText]] "gain <funding(sponsor_help)>; <free_pods> free Supply Pods"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardFunding', {
				'Amount', "<sponsor_help>",
			}),
			PlaceObj('RewardSupplyPods', {
				'Amount', "<free_pods>",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{245506315180, --[[StoryBit LongWinter_BigExtension_Tech Text]] "Gather our best minds. We should assemble some Heaters immediately."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{202332993250, --[[StoryBit LongWinter_BigExtension_Tech CustomOutcomeText]] "<free_prefabs> Subsurface Heater prefabs"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardPrefab', {
				'Amount', "<free_prefabs>",
				'Prefab', "SubsurfaceHeater",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{211471474407, --[[StoryBit LongWinter_BigExtension_Tech Text]] "Ration Power and Water until this is over."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{787846832142, --[[StoryBit LongWinter_BigExtension_Tech CustomOutcomeText]] "<consumption_reduction>% Dome water and power consumption for the duration of the Cold Wave"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ModifyLabel', {
				'Label', "Dome",
				'Prop', "electricity_consumption",
				'Percent', "<consumption_reduction>",
				'ModifyId', "LongWinter",
			}),
			PlaceObj('ModifyLabel', {
				'Label', "Dome",
				'Prop', "water_consumption",
				'Percent', "<consumption_reduction>",
				'ModifyId', "LongWinter",
			}),
		},
	}),
})

