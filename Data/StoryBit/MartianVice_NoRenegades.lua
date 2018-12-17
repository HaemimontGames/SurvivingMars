-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Disables = {
		"MartianVice_NoShuttlesLeft",
		"MartianVice_NoCrash",
		"MartianVice_Crash",
		"MartianViceStopRaces",
	},
	Effects = {},
	NotificationText = T(366045494299, --[[StoryBit MartianVice_NoRenegades NotificationText]] "The races have ceased"),
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'Filters', {
				PlaceObj('HasTrait', {
					'Trait', "Renegade",
				}),
			},
			'Condition', "==",
			'Amount', 0,
		}),
	},
	ScriptDone = true,
	TextReadyForValidation = true,
	TextsDone = true,
	group = "Renegades",
	id = "MartianVice_NoRenegades",
})

