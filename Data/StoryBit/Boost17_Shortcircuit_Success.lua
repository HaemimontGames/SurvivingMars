-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {
		PlaceObj('ModifyConst', {
			'Const', "RocketPrice",
			'Percent', "<rebate>",
			'ModifyId', "Shortsicruit",
		}),
	},
	Prerequisites = {
		PlaceObj('IsRocketStatus', nil),
	},
	ScriptDone = true,
	Text = T(362286686363, --[[StoryBit Boost17_Shortcircuit_Success Text]] "In fact, we learned a lot about our Rockets during the repairs and a full review of the design has found several possible improvements to future designs that can reduce our production costs.\n\n<effect>Rocket cost decreased by <rebate>%."),
	TextReadyForValidation = true,
	TextsDone = true,
	VoicedText = T(955611107511, --[[voice:narrator]] "Rocket <DisplayName> has safely landed on Earth. The replacement of all onboard electronics has resolved the issue."),
	group = "Pre-Founder Stage",
	id = "Boost17_Shortcircuit_Success",
	qa_info = PlaceObj('PresetQAInfo', {
		data = {
			{
				action = "Modified",
				time = 1550049900,
				user = "Boyan",
			},
			{
				action = "Modified",
				time = 1550491863,
				user = "Boyan",
			},
			{
				action = "Modified",
				time = 1550493633,
				user = "Blizzard",
			},
		},
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "rebate",
		'Value', -25,
	}),
})

