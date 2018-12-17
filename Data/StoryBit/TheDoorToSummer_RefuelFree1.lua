-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('CallTradeRocket', {
			'rocket_id', "TheEternalSummerFree",
			'display_name', T(11386, --[[StoryBit TheDoorToSummer_RefuelFree1 display_name]] "The Eternal Summer"),
			'description', T(11387, --[[StoryBit TheDoorToSummer_RefuelFree1 description]] "An orbital cryopod sanctuary for the filthy rich."),
			'travel_time_mars', 300000,
			'travel_time_earth', 300000,
			'fuel_amount', 80000,
			'resource1', "Electronics",
			'amount1', 20000,
			'resource2', "MachineParts",
			'amount2', 25000,
		}),
	},
	Delay = 14400000,
	Effects = {},
	Enables = {
		"TheDoorToSummer_SleepersHaveAwaken",
		"TheDoorToSummer_LetNoNobleDeed",
	},
	NotificationText = "",
	Prerequisites = {
		PlaceObj('IsRocketID', {
			'rocket_id', "TheEternalSummerFree",
		}),
	},
	ScriptDone = true,
	TextReadyForValidation = true,
	TextsDone = true,
	Trigger = "RocketLaunchedEvent",
	group = "Earth",
	id = "TheDoorToSummer_RefuelFree1",
})

