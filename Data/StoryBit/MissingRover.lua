-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('UnitDisappear', nil),
	},
	Category = "DustStromStart",
	Delay = 60000,
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/dust_storm.tga",
	Prerequisites = {
		PlaceObj('PickFromLabel', {
			'Label', "Rover",
			'Conditions', {},
		}),
	},
	ScriptDone = true,
	Text = T(364329823116, --[[StoryBit MissingRover Text]] "We have lost contact with one of our Rovers - <DisplayName>. We believe the problem was caused by the Dust Storm and hopefully we will be able to locate it easily once the storm is over."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(283357494259, --[[StoryBit MissingRover Title]] "Missing Rover"),
	Trigger = "DustStorm",
	VoicedText = T(918275190481, --[[voice:narrator]] "The monitor shows only static as the Rover’s GPS tracker shows an error message."),
	group = "Disasters",
	id = "MissingRover",
	PlaceObj('StoryBitReply', {
		'Text', T(312584139772, --[[StoryBit MissingRover Text]] "We can't wait. Send out drones to search for the Rover."),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"MissingRover_1_Drones",
		},
		'Effects', {},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(820347352761, --[[StoryBit MissingRover Text]] "Send out shuttles to search for the Rover despite the Dust Storm."),
		'Prerequisite', PlaceObj('CheckBuildingCount', {
			'Building', "ShuttleHub",
			'Amount', 1,
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"MissingRover_2_Shuttles",
		},
		'Effects', {},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(445594090877, --[[StoryBit MissingRover Text]] "We can use our Sensor Towers to triangulate the signal."),
		'Prerequisite', PlaceObj('CheckBuildingCount', {
			'Building', "SensorTower",
			'Amount', 6,
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"MissingRover_3_SensorTowers",
		},
		'Effects', {},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(303164088279, --[[StoryBit MissingRover Text]] "No reason to worry. We can wait."),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"MissingRover_4_DustStormEnd",
		},
		'Effects', {},
	}),
})

