-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Disables = {
		"Boost20_DronePrototypes_BreakDrone",
	},
	Effects = {},
	Prerequisites = {},
	ScriptDone = true,
	SuppressTime = 1500000,
	Text = T(250911336687, --[[StoryBit Boost20_DronePrototypes_Finale Text]] "Let’s hope they got it right this time. They have offered <number_of_drones> more Drones as compensation for our troubles."),
	TextReadyForValidation = true,
	TextsDone = true,
	VoicedText = T(160908280172, --[[voice:narrator]] "A patch is ready to be downloaded from Alpenglow Robotix’s servers, carrying with it the promise of fixing the mess they brought upon us with the previous version of their Drones’ software."),
	group = "Pre-Founder Stage",
	id = "Boost20_DronePrototypes_Finale",
	max_reply_id = 3,
	qa_info = PlaceObj('PresetQAInfo', {
		data = {
			{
				action = "Modified",
				time = 1549883088,
				user = "Boyan",
			},
			{
				action = "Modified",
				time = 1549978863,
				user = "Kmilushev",
			},
			{
				action = "Verified",
				time = 1549979638,
				user = "Kmilushev",
			},
			{
				action = "Modified",
				time = 1550049900,
				user = "Boyan",
			},
			{
				action = "Modified",
				time = 1550491863,
				user = "Boyan",
			},
			{
				action = "Modified",
				time = 1550494320,
				user = "Blizzard",
			},
		},
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "number_of_drones",
		'Value', 8,
	}),
	PlaceObj('StoryBitParamFunding', {
		'Name', "reparations",
		'Value', 500000000,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(640631201207, --[[StoryBit Boost20_DronePrototypes_Finale Text]] "Goodbye and thanks for all the drones!"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(439360708972, --[[StoryBit Boost20_DronePrototypes_Finale CustomOutcomeText]] "Supply pod with <number_of_drones> drones"),
		'unique_id', 1,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('SpawnRocketInOrbit', {
				'is_supply_pod', true,
				'cargo_list', {
					PlaceObj('RocketCargoItem', {
						'cargo', "Drone",
						'amount', 8,
					}),
				},
				'AssociateWithStoryBit', false,
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(325632281085, --[[StoryBit Boost20_DronePrototypes_Finale Text]] "We prefer to get an RC Commander instead."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(531022342862, --[[StoryBit Boost20_DronePrototypes_Finale CustomOutcomeText]] "Supply pod with an RC Commander"),
		'unique_id', 2,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('SpawnRocketInOrbit', {
				'is_supply_pod', true,
				'cargo_list', {
					PlaceObj('RocketCargoItem', {
						'cargo', "RCRover",
						'amount', 1,
					}),
				},
				'AssociateWithStoryBit', false,
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(639953872404, --[[StoryBit Boost20_DronePrototypes_Finale Text]] "They should provide some financial compensation as well."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(376706762847, --[[StoryBit Boost20_DronePrototypes_Finale CustomOutcomeText]] "Supply pod with <number_of_drones> drones AND <funding(reparations)>"),
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "politician",
		}),
		'unique_id', 3,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('SpawnRocketInOrbit', {
				'is_supply_pod', true,
				'cargo_list', {
					PlaceObj('RocketCargoItem', {
						'cargo', "Drone",
						'amount', 8,
					}),
				},
				'AssociateWithStoryBit', false,
			}),
			PlaceObj('RewardFunding', {
				'Amount', "<reparations>",
			}),
		},
	}),
})

