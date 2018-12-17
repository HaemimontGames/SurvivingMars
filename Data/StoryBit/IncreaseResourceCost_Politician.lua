-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('ModifyCargoPrice', {
			'Cargo', "-associated cargo object-",
			'Percent', "<price_increase>",
		}),
	},
	Effects = {},
	NotificationText = T(469477525181, --[[StoryBit IncreaseResourceCost_Politician NotificationText]] "The import price of <name> has been increased by <price_increase>%"),
	Prerequisites = {},
	ScriptDone = true,
	SuppressTime = "<delay_politician>",
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(288730772888, --[[StoryBit IncreaseResourceCost_Politician Title]] "<name> price increased"),
	group = "Earth",
	id = "IncreaseResourceCost_Politician",
	PlaceObj('StoryBitParamPercent', {
		'Name', "price_increase",
		'Value', 100,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "delay_politician",
		'Value', 7200000,
	}),
})

