-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "SanityBreakdown",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/02_video_call_2.tga",
	Prerequisites = {
		PlaceObj('HasTrait', {
			'Trait', "Celebrity",
		}),
		PlaceObj('SupplyMissionsEnabled', nil),
	},
	ScriptDone = true,
	Text = T{551271623148, --[[StoryBit VagranciesOfFame Text]] 'Obviously, the Celebrity had too much of public attention focused on personal matters that other people are privileged not to share. Now, <DisplayName> is running naked in the dome, screaming:\n\n"Is that what you wanted? Here, have it all!"\n\nThis could have a disastrous effect on the reputation of anyone in these days, especially when someone uploads the video online. Which is about to happen when we make our next data transmission to Earth.'},
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T{444314383348, --[[StoryBit VagranciesOfFame Title]] "Sanity Breakdown - Vagrancies of Fame"},
	Trigger = "SanityBreakdown",
	VoicedText = T{954587907189, --[[voice:narrator]] "A well-known Celebrity has lost it and is now making a shameful display around the Dome. The Colonists are in shock and don’t know how to react!"},
	group = "Sanity Breakdown",
	id = "VagranciesOfFame",
	PlaceObj('StoryBitReply', {
		'Text', T{827433522948, --[[StoryBit VagranciesOfFame Text]] "Ban the upload."},
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_down",
		'Value', 10,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "morale_down_time",
		'Value', 7200000,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T{801101664621, --[[voice:narrator]] "The Celebrity gets to keep their good reputation, but the other Colonists are infuriated with such displays of power and attempts to censorship their communications."},
		'Text', T{234248150922, --[[StoryBit VagranciesOfFame Text]] "<effect>All Colonists lose <morale_down> Morale for <morale_down_time> Sols."},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {},
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<morale_down>",
						'Sols', "<morale_down_time>",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{977486754602, --[[StoryBit VagranciesOfFame Text]] "Let it happen."},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ForceSuicide', nil),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{847994728439, --[[StoryBit VagranciesOfFame Text]] "This is a valuable display of social criticism!"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 50,
		'Effects', {
			PlaceObj('ForceSuicide', nil),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 50,
		'Effects', {},
	}),
})

