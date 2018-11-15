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
	Text = T{774697787211, --[[StoryBit InvestmentOpportunity_BlueSun Text]] "While it is uncertain if DreamWeb will survive us piggybacking on their momentum, we are projected to make a solid <return>% return on our investment."},
	TextReadyForValidation = true,
	TextsDone = true,
	VoicedText = T{366666244307, --[[voice:narrator]] "Our product, The Dreamfarer, went public on the exact same day as DreamWeb and is riding hard on the hype that DreamWeb had generated. "},
	group = "Sponsor",
	id = "InvestmentOpportunity_BlueSun",
	PlaceObj('StoryBitParamPercent', {
		'Name', "return",
		'Value', 25,
	}),
	PlaceObj('StoryBitParamFunding', {
		'Name', "recived_funds",
		'Value', 625000000,
	}),
})

