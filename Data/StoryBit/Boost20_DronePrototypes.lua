-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_BeforeFounders",
	Effects = {},
	EnableChance = 40,
	Enabled = true,
	Image = "UI/Messages/hints.tga",
	Prerequisites = {},
	ScriptDone = true,
	Text = T(686431170323, --[[StoryBit Boost20_DronePrototypes Text]] "As a means to propel their ambitions into the new field, they have made a Drone prototype, similar to the ones we use here on Mars. \n\nAnd what better location to showcase the feasibility of their Drones than the surface of another planet? If we accept their offer they will provide us with a free batch of <number_of_drones> drones delivered via a Supply Pod."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(828725269560, --[[StoryBit Boost20_DronePrototypes Title]] "Drone Prototypes"),
	VoicedText = T(766447148090, --[[voice:narrator]] "Alpenglow Robotix, a cutting edge tech company specializing in military and medical automation, are pushing to expand their resume with robotics as well."),
	group = "Pre-Founder Stage",
	id = "Boost20_DronePrototypes",
	max_reply_id = 3,
	qa_info = PlaceObj('PresetQAInfo', {
		data = {
			{
				action = "Modified",
				time = 1549879665,
				user = "Boyan",
			},
			{
				action = "Verified",
				time = 1549979498,
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
				time = 1550494117,
				user = "Blizzard",
			},
			{
				action = "Modified",
				time = 1551273970,
				user = "Radomir",
			},
			{
				action = "Modified",
				time = 1551965563,
				user = "Radomir",
			},
		},
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "number_of_drones",
		'Value', 8,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(872465752278, --[[StoryBit Boost20_DronePrototypes Text]] "Accept -  we could always use more Drones!"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(594990013290, --[[StoryBit Boost20_DronePrototypes CustomOutcomeText]] "<number_of_drones> new drones will arrive in a Supply Pod"),
		'unique_id', 1,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"Boost20_DronePrototypes_BreakDrone",
			"Boost20_DronePrototypes_Problem",
		},
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
		'Text', T(903714616723, --[[StoryBit Boost20_DronePrototypes Text]] "Reject - there are risks associated with introducing foreign tech in the colony."),
		'unique_id', 2,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(168272159280, --[[StoryBit Boost20_DronePrototypes Text]] "Twice the drones, double the gain!"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(345112037285, --[[StoryBit Boost20_DronePrototypes CustomOutcomeText]] "Two Supply Pods with <number_of_drones> drones each"),
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "oligarch",
		}),
		'unique_id', 3,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"Boost20_DronePrototypes_BreakDrone",
			"Boost20_DronePrototypes_Problem",
		},
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
})

