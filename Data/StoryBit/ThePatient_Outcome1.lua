-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {},
	Prerequisites = {},
	ScriptDone = true,
	SuppressTime = 720000,
	Text = T(410121366144, --[[StoryBit ThePatient_Outcome1 Text]] "Sickness is rare amongst humans in this age. We were all taken aback by how unprepared we were to fight this vicious foe. Yet through aiding the mysterious patient as much as we did, we realized that he is no stranger to us. We stand by one another as humans.\n\nThe patient's stay with us was brief, but they left a changed colony behind them.\n\n<effect>Many Colonists have gained the Enthusiast perk."),
	TextReadyForValidation = true,
	TextsDone = true,
	VoicedText = T(758810994237, --[[voice:narrator]] "The patient has died. We did all we could but fell short at the end."),
	group = "Colonists",
	id = "ThePatient_Outcome1",
	PlaceObj('StoryBitReply', {
		'Text', T(422244717600, --[[StoryBit ThePatient_Outcome1 Text]] "An odd chapter of our colony's history ends."),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {},
				'RandomCount', 25,
				'Effects', {
					PlaceObj('AddTrait', {
						'Trait', "Enthusiast",
					}),
				},
			}),
		},
	}),
})

