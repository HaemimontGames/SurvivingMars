-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {},
	Prerequisites = {},
	ScriptDone = true,
	Text = T{122603915673, --[[StoryBit WatcherInTheSky_Outcome_Good Text]] "A huge package of data has been sent to our servers. We will scan the files for any malicious software and then thoroughly go through them."},
	TextReadyForValidation = true,
	TextsDone = true,
	VoicedText = T{303943628391, --[[voice:narrator]] "The AI seems pleased with the answer and gave our Colonist a head start before executing self-destruction."},
	group = "Colonists",
	id = "WatcherInTheSky_Outcome_Good",
	PlaceObj('StoryBitParamResearchPoints', {
		'Name', "research_reward",
		'Value', 10000,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{896315274404, --[[StoryBit WatcherInTheSky_Outcome_Good Text]] "Yes!"},
		'OutcomeText', "custom",
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardResearchPoints', {
				'Amount', "<research_reward>",
			}),
		},
	}),
})

