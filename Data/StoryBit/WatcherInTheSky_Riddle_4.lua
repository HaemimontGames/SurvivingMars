-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Comment = "Riddle 1",
	Effects = {},
	Prerequisites = {},
	ScriptDone = true,
	Text = T(690561941773, --[[StoryBit WatcherInTheSky_Riddle_4 Text]] "What am I?"),
	TextReadyForValidation = true,
	TextsDone = true,
	VoicedText = T(477879832505, --[[voice:narrator]] "I make two people out of one."),
	group = "Colonists",
	id = "WatcherInTheSky_Riddle_4",
	PlaceObj('StoryBitReply', {
		'Text', T(646400116293, --[[StoryBit WatcherInTheSky_Riddle_4 Text]] "A mirror."),
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
		'Text', T(811814188528, --[[StoryBit WatcherInTheSky_Riddle_4 Text]] "An obstetrician."),
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
		'Text', T(504298489674, --[[StoryBit WatcherInTheSky_Riddle_4 Text]] "Mood."),
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
		'Text', T(631309460279, --[[StoryBit WatcherInTheSky_Riddle_4 Text]] "Thought."),
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

