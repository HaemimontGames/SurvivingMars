-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('RewardFunding', {
			'Amount', "<royalties>",
		}),
	},
	Effects = {},
	Enables = {
		"BattleRoyale_RoyaltiesParadox",
	},
	NotificationText = T(520518425404, --[[StoryBit BattleRoyale_RoyaltiesParadox NotificationText]] "Profited <funding(royalties)> from game sales"),
	Prerequisites = {},
	ScriptDone = true,
	SuppressTime = 3600000,
	TextReadyForValidation = true,
	TextsDone = true,
	group = "Buildings",
	id = "BattleRoyale_RoyaltiesParadox",
	PlaceObj('StoryBitParamFunding', {
		'Name', "royalties",
		'Value', 300000000,
	}),
})

