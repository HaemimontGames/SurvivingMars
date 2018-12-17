-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_FounderStageDone",
	Effects = {
		PlaceObj('AddTrait', {
			'Trait', "Guru",
		}),
	},
	Enabled = true,
	Enables = {
		"FlatMars_End",
	},
	Image = "UI/Messages/Events/11_idiot.tga",
	Prerequisites = {
		PlaceObj('PickFromLabel', {
			'Label', "Colonist",
			'Conditions', {
				PlaceObj('HasTrait', {
					'Trait', "Martianborn",
				}),
				PlaceObj('HasTrait', {
					'Trait', "Idiot",
				}),
			},
		}),
	},
	ScriptDone = true,
	Text = T(268197203070, --[[StoryBit FlatMars Text]] "Thinking it a mere joke, you read through it and find out that a colonist by the name of <DisplayName>, who is born on Mars and has never been to Space, is propagating the notion that Mars is indeed flat, along with other conspiracy theories which naturally accompany such an idea.\n\n<DisplayName> has broken no laws thus far but perhaps something should be done."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(824016019765, --[[StoryBit FlatMars Title]] "Flat Mars Society"),
	VoicedText = T(351156901843, --[[voice:narrator]] "A message is forwarded to your inbox with the most curious title – Flat Mars Society."),
	group = "Colonists",
	id = "FlatMars",
	PlaceObj('StoryBitReply', {
		'Text', T(411325419282, --[[StoryBit FlatMars Text]] "I’m sure our colonists are reasonable enough not to board that wacky train."),
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(283369878972, --[[StoryBit FlatMars Text]] "People. People never change."),
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(419354067015, --[[StoryBit FlatMars Text]] "*Eyeroll* Whatever..."),
	}),
})

