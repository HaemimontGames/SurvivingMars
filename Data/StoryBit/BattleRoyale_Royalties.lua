-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('RewardFunding', {
			'Amount', "<royalties>",
		}),
	},
	Effects = {},
	Enables = {
		"BattleRoyale_Royalties",
	},
	NotificationText = T(11041, --[[StoryBit BattleRoyale_Royalties NotificationText]] "Profited <funding(royalties)> from game sales"),
	Prerequisites = {},
	ScriptDone = true,
	SuppressTime = 3600000,
	TextReadyForValidation = true,
	TextsDone = true,
	group = "Buildings",
	id = "BattleRoyale_Royalties",
	PlaceObj('StoryBitParamFunding', {
		'Name', "royalties",
		'Value', 200000000,
	}),
})

