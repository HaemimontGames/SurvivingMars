-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {
		PlaceObj('RewardFunding', {
			'Amount', "<reward_funding>",
		}),
	},
	Image = "UI/Messages/Events/02_video_call_2.tga",
	Prerequisites = {
		PlaceObj('IsCustomAnomalyWithID', {
			'id', "RedMarsReturn",
		}),
	},
	ScriptDone = true,
	Text = T{370495929341, --[[StoryBit RedMars_4 Text]] 'The mysterious stranger appears once more on the screen. You hear only two words this time: "Good job!"\n\n<effect>You have received <funding(reward_funding)> Funding. The clean-up team will return shortly.'},
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T{963683254562, --[[StoryBit RedMars_4 Title]] "Tabula Rasa"},
	Trigger = "ExpeditionSent",
	VoicedText = T{315971334198, --[[voice:narrator]] "The clean-up team has been instructed well about the operation goals and parameters. They act like professionals, and finish up quite quickly."},
	group = "Expeditions",
	id = "RedMars_4",
	PlaceObj('StoryBitParamFunding', {
		'Name', "reward_funding",
		'Value', 250000000,
	}),
})

