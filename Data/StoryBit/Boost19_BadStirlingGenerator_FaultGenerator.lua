-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('CauseFault', {
			'Grid', "electricity",
		}),
	},
	Effects = {},
	Enables = {
		"Boost19_BadStirlingGenerator_FaultGenerator",
	},
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "StirlingGenerator",
			'Filters', {
				PlaceObj('IsBuildingWorking', nil),
			},
			'Condition', ">=",
			'Amount', 1,
		}),
	},
	ScriptDone = true,
	SuppressTime = 840000,
	TextReadyForValidation = true,
	TextsDone = true,
	group = "Pre-Founder Stage",
	id = "Boost19_BadStirlingGenerator_FaultGenerator",
	qa_info = PlaceObj('PresetQAInfo', {
		data = {
			{
				action = "Modified",
				time = 1550049900,
				user = "Boyan",
			},
			{
				action = "Verified",
				time = 1549972807,
				user = "Kmilushev",
			},
			{
				action = "Modified",
				time = 1550491863,
				user = "Boyan",
			},
			{
				action = "Modified",
				time = 1550494090,
				user = "Blizzard",
			},
		},
	}),
})

