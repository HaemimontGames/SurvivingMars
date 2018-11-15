-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('ExtendDisaster', {
			'Time', 4,
			'Disaster', "Cold Wave",
		}),
	},
	Disables = {
		"LongWinter_BigExtension_Tech",
	},
	Effects = {
		PlaceObj('DiscoverTech', {
			'Field', "Physics",
			'Tech', "SubsurfaceHeating",
		}),
	},
	Enables = {
		"LongWinter_MoraleEvent",
	},
	Prerequisites = {
		PlaceObj('CheckTechStatus', {
			'Field', "Physics",
			'TechId', "SubsurfaceHeating",
			'Status', "unknown",
		}),
	},
	ScriptDone = true,
	SuppressTime = 1440000,
	Text = T{645871813292, --[[StoryBit LongWinter_BigExtension_NoTech Text]] "New weather data has come and the situation is dire – the Cold Wave prediction has been extended by another 4 Sols.\n\nOur Scientists have come up with a technology that will allow us to build Subsurface Heaters to heat our buildings and prevent them from freezing."},
	TextReadyForValidation = true,
	TextsDone = true,
	VoicedText = T{180937437987, --[[voice:narrator]] "A team of Scientists argues over the satellite data as you quietly ponder the situation. It’s going to be a long winter."},
	group = "Disasters",
	id = "LongWinter_BigExtension_NoTech",
	PlaceObj('StoryBitParamFunding', {
		'Name', "sponsor_help",
		'Value', 500000000,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "free_pods",
		'Value', 5,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "free_prefabs",
		'Value', 3,
	}),
	PlaceObj('StoryBitParamPercent', {
		'Name', "consumption_reduction",
		'Value', -25,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{733496095586, --[[StoryBit LongWinter_BigExtension_NoTech Text]] "We need help from Earth."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{967002416936, --[[StoryBit LongWinter_BigExtension_NoTech CustomOutcomeText]] "gain <funding(sponsor_help)>; <free_pods> free Supply Pods"},
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
		'Text', T{501731859602, --[[StoryBit LongWinter_BigExtension_NoTech Text]] "Gather our best minds. We should assemble some Heaters immediately."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{266444178302, --[[StoryBit LongWinter_BigExtension_NoTech CustomOutcomeText]] "<free_prefabs> Subsurface Heater prefabs"},
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
		'Text', T{776571783341, --[[StoryBit LongWinter_BigExtension_NoTech Text]] "Ration Power and Water until this is over."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{863739302280, --[[StoryBit LongWinter_BigExtension_NoTech CustomOutcomeText]] "<consumption_reduction>% Dome water and power consumption for the duration of the Cold Wave"},
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

