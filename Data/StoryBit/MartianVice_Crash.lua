-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {
		PlaceObj('EraseShuttles', nil),
		PlaceObj('PickFromLabelEffect', {
			'Label', "Dome",
			'Conditions', {},
		}),
		PlaceObj('CauseFracture', nil),
		PlaceObj('EnableRandomStoryBit', {
			'StoryBits', {
				"MartianVice_Crash",
				"MartianVice_NoCrash",
			},
			'Weights', {
				50,
				50,
			},
		}),
	},
	NotificationText = T{11377, --[[StoryBit MartianVice_Crash NotificationText]] "Another shuttle race - another crash"},
	Prerequisites = {},
	ScriptDone = true,
	SuppressTime = 1440000,
	TextReadyForValidation = true,
	TextsDone = true,
	group = "Renegades",
	id = "MartianVice_Crash",
})

