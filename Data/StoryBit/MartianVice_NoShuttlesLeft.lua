-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Disables = {
		"MartianVice_Crash",
		"MartianVice_NoCrash",
		"MartianVice_NoRenegades",
		"MartianViceStopRaces",
	},
	Effects = {},
	NotificationText = T(827414290311, --[[StoryBit MartianVice_NoShuttlesLeft NotificationText]] "The races have ceased"),
	Prerequisites = {
		PlaceObj('CountShuttles', {
			'Condition', "==",
		}),
	},
	ScriptDone = true,
	TextReadyForValidation = true,
	TextsDone = true,
	group = "Renegades",
	id = "MartianVice_NoShuttlesLeft",
})

