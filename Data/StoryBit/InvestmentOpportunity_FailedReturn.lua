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
	Text = T(785868501763, --[[StoryBit InvestmentOpportunity_FailedReturn Text]] "Preliminary damage assessment suggests that we will lose <return>% of our investment."),
	TextReadyForValidation = true,
	TextsDone = true,
	VoicedText = T(876048136739, --[[voice:narrator]] "The Stock Market has closed. Results are in. DreamWeb has flopped dramatically."),
	group = "Sponsor",
	id = "InvestmentOpportunity_FailedReturn",
	PlaceObj('StoryBitParamPercent', {
		'Name', "return",
		'Value', 80,
	}),
	PlaceObj('StoryBitParamFunding', {
		'Name', "recived_funds",
		'Value', 100000000,
	}),
})

