-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Comment = "Riddle 1",
	Effects = {},
	Prerequisites = {},
	ScriptDone = true,
	Text = T(111632145192, --[[StoryBit WatcherInTheSky_Riddle_3 Text]] "No one ever saw me, nor ever will. \n\nAnd yet I am the confidence of all, to live and breathe on any terrestrial ball.\n\nWhat am I?"),
	TextReadyForValidation = true,
	TextsDone = true,
	VoicedText = T(711577254378, --[[voice:narrator]] "I never was, am always to be."),
	group = "Colonists",
	id = "WatcherInTheSky_Riddle_3",
	PlaceObj('StoryBitReply', {
		'Text', T(715744969837, --[[StoryBit WatcherInTheSky_Riddle_3 Text]] "Tomorrow."),
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
		'Text', T(195576610768, --[[StoryBit WatcherInTheSky_Riddle_3 Text]] "Death."),
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
		'Text', T(886011805980, --[[StoryBit WatcherInTheSky_Riddle_3 Text]] "God."),
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
		'Text', T(599460294888, --[[StoryBit WatcherInTheSky_Riddle_3 Text]] "Time."),
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

