-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('ModifyObject', {
			'Prop', "water_consumption",
			'Percent', "<baseincrease>",
			'ModifyId', "WaterChip",
		}),
	},
	Category = "Tick_FounderStageDone",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/26_colonist.tga",
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'Filters', {},
			'Condition', "<=",
			'Amount', 500,
		}),
		PlaceObj('PickFromLabel', {
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
		PlaceObj('SupplyMissionsEnabled', nil),
	},
	ScriptDone = true,
	Text = T(727840641132, --[[StoryBit WaterChip Text]] "The chip controls the water recycling for <DisplayName> dome. Without it water consumption there will increase by <baseincrease>%.\n\nWe were supposed to get replacement water chips but it seems they were wrongly delivered somewhere in Southern California on Earth.\n\nThe water chip is quite complex and it will take us <sols(base_time_to_fix)> Sols to manufacture it here on Mars. Alternatively, we can import a new one from Earth."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(648156407702, --[[StoryBit WaterChip Title]] "Water Chip"),
	VoicedText = T(958368945245, --[[voice:narrator]] "The terminal softly beeps, indicating that the water chip for one of our Domes has failed."),
	group = "Buildings",
	id = "WaterChip",
	PlaceObj('StoryBitParamPercent', {
		'Name', "baseincrease",
		'Value', 400,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "base_time_to_fix",
		'Value', 4320000,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(691139803107, --[[StoryBit WaterChip Text]] "Import Water Chip from Earth."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(526125635228, --[[StoryBit WaterChip CustomOutcomeText]] "It should arrive in <sols(short_time)> Sols and will cost us <funding(funding_cost)>"),
		'Cost', "<funding_cost>",
		'Comment', "IMPORTANT - remember to change follow up events and use WaterChip modifier ID",
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "short_time",
		'Value', 1440000,
	}),
	PlaceObj('StoryBitParamFunding', {
		'Name', "funding_cost",
		'Value', 250000000,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"WaterChip_QuickFix",
		},
		'Effects', {},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(936678147521, --[[StoryBit WaterChip Text]] "We can build a temporary filtration device."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(706858999316, --[[StoryBit WaterChip CustomOutcomeText]] "Dome consumption reduced to <hydroincrease>%"),
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "hydroengineer",
		}),
	}),
	PlaceObj('StoryBitParamPercent', {
		'Name', "hydroincrease",
		'Value', 200,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"WaterChip_NormalFix",
		},
		'Effects', {
			PlaceObj('ModifyObject', {
				'Prop', "water_consumption",
				'Percent', "<hydroincrease>",
				'ModifyId', "WaterChip",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(600215200963, --[[StoryBit WaterChip Text]] "Try to speed up the manufacture process."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(203822416172, --[[StoryBit WaterChip CustomOutcomeText]] "Chance to fail, wasting even more Water"),
	}),
	PlaceObj('StoryBitParamPercent', {
		'Name', "failincrease",
		'Value', 600,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 50,
		'Text', T(502618099999, --[[StoryBit WaterChip Text]] "The repair team managed to find a workaround and have cut down the repair time down to <sols(short_time)> Sols."),
		'Enables', {
			"WaterChip_QuickFix",
		},
		'Effects', {},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 50,
		'Text', T(624966350717, --[[StoryBit WaterChip Text]] "The repair team failed to find a quicker solution and one of their pipe probes caused a serious issue, raising the total Water consumption by <failincrease>%."),
		'Enables', {
			"WaterChip_NormalFix",
		},
		'Effects', {
			PlaceObj('ModifyObject', {
				'Prop', "water_consumption",
				'Percent', "<failincrease>",
				'ModifyId', "WaterChip",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(733902281605, --[[StoryBit WaterChip Text]] "Let’s hope our Water reserves will hold until the chip is manufactured."),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"WaterChip_NormalFix",
		},
		'Effects', {},
	}),
})

