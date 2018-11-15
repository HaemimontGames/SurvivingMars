-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('UnitAppear', {
			'Location', "MapBorder",
		}),
		PlaceObj('Malfunction', nil),
		PlaceObj('EraseShuttles', {
			'Count', "<shuttles_killed>",
		}),
	},
	Effects = {},
	Enables = {
		"MissingRover_5_Repaired",
	},
	Prerequisites = {},
	ScriptDone = true,
	SuppressTime = 180000,
	Text = T{282893267545, --[[StoryBit MissingRover_2_Shuttles Text]] "From what we can tell from the cameras, the Rover has suffered a critical malfunction. We have no idea how it ended up on its current location.\n\n<effect>You will need to send Drones to repair the malfunctioned Rover."},
	TextReadyForValidation = true,
	TextsDone = true,
	VoicedText = T{541991435112, --[[voice:narrator]] "The spotlight locks on to the missing Rover as a shuttle orbits the location. The search mission was successful but several Shuttles were lost in the Dust Storm."},
	group = "Disasters",
	id = "MissingRover_2_Shuttles",
	PlaceObj('StoryBitParamNumber', {
		'Name', "shuttles_killed",
		'Value', 2,
	}),
})

