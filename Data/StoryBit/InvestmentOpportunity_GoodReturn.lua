-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {
		PlaceObj('RewardFunding', {
			'Amount', "<recived_funds>",
		}),
	},
	Prerequisites = {},
	ScriptDone = true,
	SuppressTime = 7200000,
	Text = T{122982186877, --[[StoryBit InvestmentOpportunity_GoodReturn Text]] "Still, we have doubled our investment! The Colony's financial future looks bright!"},
	TextReadyForValidation = true,
	TextsDone = true,
	VoicedText = T{925944487962, --[[voice:narrator]] "DreamWeb is holding pretty well on the Stock Market – yet not even close to the levels of success it was speculated to reach."},
	group = "Sponsor",
	id = "InvestmentOpportunity_GoodReturn",
	PlaceObj('StoryBitParamPercent', {
		'Name', "return",
		'Value', 100,
	}),
	PlaceObj('StoryBitParamFunding', {
		'Name', "recived_funds",
		'Value', 1000000000,
	}),
})

