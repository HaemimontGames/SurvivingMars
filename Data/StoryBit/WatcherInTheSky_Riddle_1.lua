-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Comment = "Riddle 1",
	Effects = {},
	Prerequisites = {},
	ScriptDone = true,
	TextReadyForValidation = true,
	TextsDone = true,
	VoicedText = T{546111776679, --[[voice:narrator]] "Until I am measured, I am not known, Yet how you miss me when I have flown. What Am I?"},
	group = "Colonists",
	id = "WatcherInTheSky_Riddle_1",
	PlaceObj('StoryBitReply', {
		'Text', T{472399984628, --[[StoryBit WatcherInTheSky_Riddle_1 Text]] "Light."},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ActivateStoryBit', {
				'Id', "WatcherInTheSky_Outcome_Bad",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{465475800158, --[[StoryBit WatcherInTheSky_Riddle_1 Text]] "Youth."},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ActivateStoryBit', {
				'Id', "WatcherInTheSky_Outcome_Bad",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{668277893501, --[[StoryBit WatcherInTheSky_Riddle_1 Text]] "Time."},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ActivateStoryBit', {
				'Id', "WatcherInTheSky_Outcome_Good",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{688006415364, --[[StoryBit WatcherInTheSky_Riddle_1 Text]] "Pizza."},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ActivateStoryBit', {
				'Id', "WatcherInTheSky_Outcome_Bad",
			}),
		},
	}),
})

