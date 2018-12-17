-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {},
	Prerequisites = {},
	ScriptDone = true,
	SuppressTime = 7200000,
	Text = T(11058, --[[StoryBit EthicsRevised_EarlyExit Text]] "However, they know full well they don't have any jurisdiction over us, making all this little more than wishful thinking on their part. \n\nHow do we answer?"),
	TextReadyForValidation = true,
	TextsDone = true,
	VoicedText = T(220227793346, --[[voice:narrator]] "Amnesty International has learned of our practice to test dangerous research on volunteer colonists and has submitted a Cease and Desist order."),
	group = "Sponsor",
	id = "EthicsRevised_EarlyExit",
	PlaceObj('StoryBitReply', {
		'Text', T(176756549596, --[[StoryBit EthicsRevised_EarlyExit Text]] "We have forgotten ourselves. We went too far. This stops today!"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(233098834636, --[[StoryBit EthicsRevised_EarlyExit CustomOutcomeText]] "lose the research boost"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Disables', {
			"EthicsRevised_KillColonists",
			"EthicsRevised_Finale",
		},
		'Effects', {
			PlaceObj('ModifyLabel', {
				'Label', "ResearchBuildings",
				'Prop', "ResearchPointsPerDay",
				'ModifyId', "EthicsRevised",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(370673392125, --[[StoryBit EthicsRevised_EarlyExit Text]] "A meaningless jab coming from a place where no one understands the problems we face on Mars. Carry on!"),
	}),
})

