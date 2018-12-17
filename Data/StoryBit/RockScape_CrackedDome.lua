-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {},
	Prerequisites = {},
	ScriptDone = true,
	SuppressTime = 1080000,
	Text = T(360477300749, --[[StoryBit RockScape_CrackedDome Text]] "It seems we hadn't properly estimated the noise levels and that even our Domes were not made to withstand the power of Rock and Roll.\n\n<effect>The concert caused several fractures in the superstructure of the hosting Dome."),
	TextReadyForValidation = true,
	TextsDone = true,
	VoicedText = T(242571177980, --[[voice:narrator]] "The concert was awesome - everyone had a blast but..."),
	group = "Default",
	id = "RockScape_CrackedDome",
	PlaceObj('StoryBitReply', {
		'Text', T(763073168647, --[[StoryBit RockScape_CrackedDome Text]] "I guess we didn't think this through."),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('CauseFracture', nil),
			PlaceObj('CauseFracture', nil),
			PlaceObj('CauseFracture', nil),
		},
	}),
})

