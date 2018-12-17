-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('CallTradeRocket', {
			'rocket_id', "TheEternalSummerMoney",
			'display_name', T(11386, --[[StoryBit TheDoorToSummer_Refuel display_name]] "The Eternal Summer"),
			'description', T(11387, --[[StoryBit TheDoorToSummer_Refuel description]] "An orbital cryopod sanctuary for the filthy rich."),
			'travel_time_mars', 300000,
			'travel_time_earth', 300000,
			'fuel_amount', 80000,
			'resource1', "Electronics",
			'amount1', 20000,
			'resource2', "MachineParts",
			'amount2', 25000,
			'funding_on_mars_launch', 150000000,
		}),
	},
	Effects = {},
	Enables = {
		"TheDoorToSummer_Refuel1",
	},
	NotificationText = "",
	Prerequisites = {},
	ScriptDone = true,
	TextReadyForValidation = true,
	TextsDone = true,
	group = "Earth",
	id = "TheDoorToSummer_Refuel",
	PlaceObj('StoryBitParamFunding', {
		'Name', "eternal_summer_reward",
		'Value', 150000000,
	}),
})

