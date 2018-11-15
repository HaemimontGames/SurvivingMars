-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {
		PlaceObj('RewardResearchPoints', {
			'Amount', "<granted_research>",
		}),
	},
	Prerequisites = {},
	ScriptDone = true,
	SuppressTime = 2160000,
	Text = T{130433001207, --[[StoryBit Masterpiece_Research Text]] "The change of perspective their alternative world view brought to the labs has inspired advances in research areas previously thought as dead ends. \n\n<effect>Gain <research(granted_research)>"},
	TextReadyForValidation = true,
	TextsDone = true,
	VoicedText = T{298226207810, --[[voice:narrator]] "Our prodigy's talents proved to reach far beyond art masterpieces. "},
	group = "Buildings",
	id = "Masterpiece_Research",
	PlaceObj('StoryBitParamResearchPoints', {
		'Name', "granted_research",
		'Value', 8000,
	}),
})

