-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Comment = "Riddle 1",
	Effects = {},
	Prerequisites = {},
	ScriptDone = true,
	Text = T{782723864648, --[[StoryBit WatcherInTheSky_Riddle_2 Text]] "Who am I?"},
	TextReadyForValidation = true,
	TextsDone = true,
	VoicedText = T{129204299226, --[[voice:narrator]] "I am a god. I am a planet, and I measure heat."},
	group = "Colonists",
	id = "WatcherInTheSky_Riddle_2",
	PlaceObj('StoryBitReply', {
		'Text', T{545299403584, --[[StoryBit WatcherInTheSky_Riddle_2 Text]] "Mars."},
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
		'Text', T{432161367463, --[[StoryBit WatcherInTheSky_Riddle_2 Text]] "Mercury."},
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
		'Text', T{521669663784, --[[StoryBit WatcherInTheSky_Riddle_2 Text]] "Kelvin.\n"},
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
		'Text', T{790900673594, --[[StoryBit WatcherInTheSky_Riddle_2 Text]] "Triton."},
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

