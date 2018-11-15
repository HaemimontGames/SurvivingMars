-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('UnitAppear', {
			'Location', "MapBorder",
		}),
		PlaceObj('Malfunction', nil),
		PlaceObj('ForEachExecuteEffects', {
			'Label', "Drone",
			'Filters', {},
			'RandomCount', "<drones_killed>",
			'Effects', {
				PlaceObj('DestroyVehicle', nil),
			},
		}),
	},
	Effects = {},
	Enables = {
		"MissingRover_5_Repaired",
	},
	Prerequisites = {},
	ScriptDone = true,
	SuppressTime = 360000,
	Text = T{117327520780, --[[StoryBit MissingRover_1_Drones Text]] "From what we can tell from the cameras, the Rover has suffered a critical malfunction. We have no idea how it ended up on its current location.\n\n<effect>You will need to send Drones to repair the malfunctioned Rover."},
	TextReadyForValidation = true,
	TextsDone = true,
	VoicedText = T{135893783580, --[[voice:narrator]] "The lights of a Drone illuminate the dust-covered missing Rover. Unfortunately other Drones have been damaged beyond repair during the search mission."},
	group = "Disasters",
	id = "MissingRover_1_Drones",
	PlaceObj('StoryBitParamNumber', {
		'Name', "drones_killed",
		'Value', 5,
	}),
})

