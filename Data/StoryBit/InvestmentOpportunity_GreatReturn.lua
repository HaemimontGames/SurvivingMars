-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {
		PlaceObj('RewardFunding', {
			'Amount', "<recived_funds>",
		}),
		PlaceObj('RewardTech', {
			'Field', "Social",
			'Research', "DreamReality",
		}),
	},
	Prerequisites = {},
	ScriptDone = true,
	SuppressTime = 7200000,
	Text = T{333547415315, --[[StoryBit InvestmentOpportunity_GreatReturn Text]] "We stand to gain <return>% return on our initial investment. The colony's financial future looks brighter than it ever was!\n\nDreamWeb's success enabled us with the opportunity to build a grand project based on the new technology here, on Mars.\n\n<effect>You have received the Dream Reality tech."},
	TextReadyForValidation = true,
	TextsDone = true,
	VoicedText = T{822302863249, --[[voice:narrator]] "First few hours after DreamWeb went public look were astonishing! The new tech fad has exceeded everyone's expectations and is a smashing hit."},
	group = "Sponsor",
	id = "InvestmentOpportunity_GreatReturn",
	PlaceObj('StoryBitParamPercent', {
		'Name', "return",
		'Value', 400,
	}),
	PlaceObj('StoryBitParamFunding', {
		'Name', "recived_funds",
		'Value', 2500000000,
	}),
})

