-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('ModifyCargoPrice', {
			'Cargo', "-associated cargo object-",
			'Percent', "<price_increase_oligarch>",
		}),
	},
	Effects = {},
	NotificationText = T(216329628415, --[[StoryBit IncreaseResourceCost_Oligarch NotificationText]] "The import price of <name> has been increased by <price_increase_oligarch>%"),
	Prerequisites = {},
	ScriptDone = true,
	SuppressTime = "<delay>",
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(288730772888, --[[StoryBit IncreaseResourceCost_Oligarch Title]] "<name> price increased"),
	group = "Earth",
	id = "IncreaseResourceCost_Oligarch",
	PlaceObj('StoryBitParamPercent', {
		'Name', "price_increase_oligarch",
		'Value', 50,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "delay",
		'Value', 3600000,
	}),
})

