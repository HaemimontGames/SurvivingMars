-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "FounderRocketLanded",
	Effects = {},
	EnableChance = 25,
	Enabled = true,
	Image = "UI/Messages/Events/27_rocket_launch.tga",
	Prerequisites = {},
	ScriptDone = true,
	Text = T(424267233026, --[[StoryBit TheFugitive Text]] "Turns out one of our Founders-to-be, despite having passed a rigorous vetting program, is now identified as a wanted fugitive.\n\nInterpol hasn't secured the proper permits and currently holds no jurisdiction to force us to turn them in but offers a significant financial incentive if we do so on our own accord.\n\nIf we accept, we will effectively have one less Founder."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(317107822895, --[[StoryBit TheFugitive Title]] "The Fugitive"),
	Trigger = "RocketLanded",
	VoicedText = T(102165467589, --[[voice:narrator]] "Just mere hours after the Founders blasted off for Mars, Interpol contacted us."),
	group = "Colonists",
	id = "TheFugitive",
	PlaceObj('StoryBitReply', {
		'Text', T(598270459918, --[[StoryBit TheFugitive Text]] "I believe in second chances! Welcome them to the Colony."),
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(933123454442, --[[StoryBit TheFugitive Text]] "We don't want a criminal as one of our Founders. Send them back with the next flight to Earth."),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('PickFromLabelEffect', {
				'Label', "Colonist",
				'Conditions', {},
			}),
			PlaceObj('EraseColonist', nil),
		},
	}),
})

