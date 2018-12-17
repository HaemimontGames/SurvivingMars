-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Comment = "make this Follow-up immediate (no sol delay after the choice)",
	Effects = {},
	Image = "UI/Messages/Events/02_video_call_2.tga",
	Prerequisites = {},
	ScriptDone = true,
	Text = T(576575765241, --[[StoryBit RedMars_2 Text]] 'On the screen there is only a black silhouette. The person talks to you through a voice modulator.\n\n"Commander, you\'ve made  quite a mess by revealing the location of our facility. Now, we have to send a clean-up team, and it would cost us a lot of money and precious time. Of course, you can help us help you and do the dirty work yourself – remove all evidence that the facility you discovered ever existed. Your call."'),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(198669391331, --[[StoryBit RedMars_2 Title]] "Hot Seat"),
	VoicedText = T(317649281591, --[[voice:narrator]] "The expedition team returns and you diligently and dutifully file in the report about the discovery. It’s not too long before you get the call."),
	group = "Expeditions",
	id = "RedMars_2",
	PlaceObj('StoryBitReply', {
		'Text', T(617235319542, --[[StoryBit RedMars_2 Text]] "I don’t like being threatened!"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"RedMars_3",
		},
		'Effects', {},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(474144864309, --[[StoryBit RedMars_2 Text]] "I will organize the clean-up immediately!"),
	}),
	PlaceObj('StoryBitParamFunding', {
		'Name', "reward_funding",
		'Value', 250000000,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T(274260689272, --[[voice:narrator]] "You have the strong feeling that the mysterious figure isn’t joking. Probably it would be best to organize a new flight to the facility coordinates immediately."),
		'Text', T(646429066953, --[[StoryBit RedMars_2 Text]] "<goal>Return to the coordinates of the secret facility. Upon completion, you will receive <funding(reward_funding)> Funding."),
		'Enables', {
			"RedMars_4",
		},
		'Effects', {
			PlaceObj('CreatePlanetaryAnomaly', {
				'id', "RedMarsReturn",
				'display_name', T(11381, --[[StoryBit RedMars_2 display_name]] "Secret Nuke Facility"),
				'description', T(11382, --[[StoryBit RedMars_2 description]] "Top-secret facility from the Cold War period. You have promised to wipe all evidence of its existence."),
				'required_crew', 5,
				'required_crew_specialization', "security",
				'required_rover', "RCTransport",
				'reward', "custom",
			}),
		},
	}),
})

