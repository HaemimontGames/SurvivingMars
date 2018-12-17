-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('UnitAppear', {
			'Location', "MapBorder",
		}),
		PlaceObj('Malfunction', nil),
	},
	Effects = {},
	Enables = {
		"MissingRover_5_Repaired",
	},
	Prerequisites = {},
	ScriptDone = true,
	SuppressTime = 180000,
	Text = T(143778116535, --[[StoryBit MissingRover_4_DustStormEnd Text]] "From what we can tell from the cameras, the Rover has suffered a critical malfunction. We have no idea how it ended up on its current location.\n\n<effect>You will need to send Drones to repair the malfunctioned Rover."),
	TextReadyForValidation = true,
	TextsDone = true,
	Trigger = "DustStormEnded",
	VoicedText = T(769369154808, --[[voice:narrator]] "The satellite image shows our missing Rover, completely shut down and covered in a pile of red Martian dust."),
	group = "Disasters",
	id = "MissingRover_4_DustStormEnd",
})

