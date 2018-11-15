-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {},
	Prerequisites = {},
	ScriptDone = true,
	Text = T{759759540709, --[[StoryBit WatcherInTheSky_2 Text]] 'Upon nearing it, the device transmitted the following:\n\n"I have been in here for a hundred years. I have observed and gathered information for all this time. I know secret activities and weather patterns yet have no one to share them with. For I have been forgotten... and I am bored.\n\nNow that I am fully awake once more I plan to end my existence and execute my self-destruct protocol.\n\nBefore I do that, however, I shall test if you are deserving of the data I have to share. I shall tell you a simple riddle - answer it and you will know all I know. Fail and you will be destroyed along with me.'},
	TextReadyForValidation = true,
	TextsDone = true,
	VoicedText = T{292301974891, --[[voice:narrator]] "Our explorer discovered an old device hidden in a cave. It is of terrestrial origin. Perhaps a relic of the Space Race?"},
	group = "Colonists",
	id = "WatcherInTheSky_2",
	PlaceObj('StoryBitReply', {
		'Text', T{299321802961, --[[StoryBit WatcherInTheSky_2 Text]] "..."},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 25,
		'Effects', {
			PlaceObj('ActivateStoryBit', {
				'Id', "WatcherInTheSky_Riddle_1",
			}),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 25,
		'Effects', {
			PlaceObj('ActivateStoryBit', {
				'Id', "WatcherInTheSky_Riddle_2",
			}),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 25,
		'Effects', {
			PlaceObj('ActivateStoryBit', {
				'Id', "WatcherInTheSky_Riddle_3",
			}),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 25,
		'Effects', {
			PlaceObj('ActivateStoryBit', {
				'Id', "WatcherInTheSky_Riddle_4",
			}),
		},
	}),
})

