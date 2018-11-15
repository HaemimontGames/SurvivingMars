-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('RewardFunding', {
			'Amount', "<funds>",
		}),
	},
	Effects = {},
	Enables = {
		"Masterpiece_PeriodicFunding",
	},
	NotificationText = T{11042, --[[StoryBit Masterpiece_PeriodicFunding NotificationText]] "Received <funds> from art sales"},
	Prerequisites = {},
	ScriptDone = true,
	SuppressTime = 3600000,
	TextReadyForValidation = true,
	TextsDone = true,
	group = "Buildings",
	id = "Masterpiece_PeriodicFunding",
	PlaceObj('StoryBitParamFunding', {
		'Name', "funds",
		'Value', 250000000,
	}),
})

