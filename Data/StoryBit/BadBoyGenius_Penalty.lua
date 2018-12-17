-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {
		PlaceObj('RewardFunding', {
			'Amount', "<further_penalty>",
		}),
		PlaceObj('ExplodeRocket', nil),
	},
	Enables = {
		"",
	},
	Prerequisites = {
		PlaceObj('PickRocketWithStatus', {
			'Status', "landed",
		}),
	},
	ScriptDone = true,
	Text = T(181142051359, --[[StoryBit BadBoyGenius_Penalty Text]] '"You think I haven\'t taken all the necessary precautions? You think I\'ve left things to chance? Boy, this hurts!\n\nI intended to leave you some cash to spare but I think this insult deserves a response."\n\n<effect>Further <funding(further_penalty)> was taken out of our accounts.'),
	TextReadyForValidation = true,
	TextsDone = true,
	VoicedText = T(621684411501, --[[voice:narrator]] "The Genius Renegade just laughs and adds:"),
	group = "Renegades",
	id = "BadBoyGenius_Penalty",
	PlaceObj('StoryBitParamFunding', {
		'Name', "further_penalty",
		'Value', 500000000,
	}),
})

