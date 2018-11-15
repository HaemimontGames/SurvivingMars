-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {
		PlaceObj('RewardResearchPoints', {
			'Amount', "<rp>",
		}),
	},
	Prerequisites = {},
	ScriptDone = true,
	SuppressTime = 3600000,
	Text = T{514355662437, --[[StoryBit GeoLife_GainResearch Text]] 'Our understanding of what is known as "accelerated evolution" has greatly increased and has shed light on many former mysteries within the field.\n\n<effect>Gain <research(rp)>'},
	TextReadyForValidation = true,
	TextsDone = true,
	VoicedText = T{942658394545, --[[voice:narrator]] "Observing the new life within the GeoDome has proven to be of great scientific value to us."},
	group = "Wonders",
	id = "GeoLife_GainResearch",
	PlaceObj('StoryBitParamResearchPoints', {
		'Name', "rp",
		'Value', 5000,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{435116994823, --[[StoryBit GeoLife_GainResearch Text]] "Good job!"},
	}),
})

