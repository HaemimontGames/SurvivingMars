-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('ModifyCargoPrice', {
			'Cargo', "-associated cargo object-",
			'Percent', "<price_increase>",
		}),
	},
	Effects = {},
	NotificationText = T(469477525181, --[[StoryBit IncreaseResourceCost_Other NotificationText]] "The import price of <name> has been increased by <price_increase>%"),
	Prerequisites = {},
	ScriptDone = true,
	SuppressTime = "<delay>",
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(288730772888, --[[StoryBit IncreaseResourceCost_Other Title]] "<name> price increased"),
	group = "Earth",
	id = "IncreaseResourceCost_Other",
	PlaceObj('StoryBitParamPercent', {
		'Name', "price_increase",
		'Value', 100,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "delay",
		'Value', 3600000,
	}),
})

