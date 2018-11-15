-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {
		PlaceObj('RewardResearchPoints', {
			'Amount', "<research_points>",
		}),
	},
	Enables = {},
	Prerequisites = {
		PlaceObj('IsAssociatedObject', nil),
	},
	ScriptDone = true,
	Text = T{104900665385, --[[StoryBit MissingRover_5_Repaired Text]] "The Rover is up and running once more. Its sensors have captured a ton of data on the Dust Storms and the most extreme conditions of the Martian environment.\n\n<effect>The Rover’s telemetry has granted us <research(research_points)>"},
	TextReadyForValidation = true,
	TextsDone = true,
	Trigger = "Repaired",
	VoicedText = T{670755450579, --[[voice:narrator]] "As the repairs are completed, our Rover’s lights and telemetry spring to life."},
	group = "Disasters",
	id = "MissingRover_5_Repaired",
	PlaceObj('StoryBitParamResearchPoints', {
		'Name', "research_points",
		'Value', 5000,
	}),
})

