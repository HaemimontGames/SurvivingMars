-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {
		PlaceObj('RewardFunding', {
			'Amount', "<refund>",
		}),
		PlaceObj('EraseColonist', nil),
	},
	Enables = {
		"",
	},
	Prerequisites = {},
	ScriptDone = true,
	Text = T(935811765411, --[[StoryBit BadBoyGenius_Success Text]] "Damn... I... I did not think of this. Actually, I did, I just thought that... I give up. I'll behave.\"\n\n<effect>Stolen funding was refunded."),
	TextReadyForValidation = true,
	TextsDone = true,
	VoicedText = T(453668807094, --[[voice:narrator]] '"Er... say what now?'),
	group = "Renegades",
	id = "BadBoyGenius_Success",
	PlaceObj('StoryBitParamFunding', {
		'Name', "refund",
		'Value', 500000000,
	}),
})

