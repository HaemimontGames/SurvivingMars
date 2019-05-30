-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('CauseFracture', {
			'ChanceLarge', 100,
		}),
	},
	Effects = {},
	Enables = {
		"DomeLeaks_1_DelayFix",
	},
	Prerequisites = {
		PlaceObj('AreDomesOpen', {
			'Negate', true,
		}),
	},
	ScriptDone = true,
	SuppressTime = 180000,
	TextReadyForValidation = true,
	TextsDone = true,
	group = "Disasters",
	id = "DomeLeaks_1_DelayFix",
	qa_info = PlaceObj('PresetQAInfo', {
		data = {
			{
				action = "Modified",
				time = 1550837046,
				user = "Radomir",
			},
		},
	}),
})

