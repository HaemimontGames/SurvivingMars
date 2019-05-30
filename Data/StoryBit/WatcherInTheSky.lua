-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_FounderStageDone",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/06_space_suit.tga",
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'Filters', {},
			'Condition', ">=",
			'Amount', 50,
		}),
		PlaceObj('CheckObjectCount', {
			'Label', "ShuttleHub",
			'Filters', {},
			'Condition', ">=",
			'Amount', 1,
		}),
		PlaceObj('PickFromLabel', {
			'Label', "Colonist",
			'Conditions', {
				PlaceObj('HasTrait', {
					'Trait', "Child",
					'Negate', true,
				}),
			},
		}),
	},
	ScriptDone = true,
	Text = T(12240, --[[StoryBit WatcherInTheSky Text]] "The signal seems harmless but can very well be a spying device.\n\nDo we ignore it?"),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(348128839780, --[[StoryBit WatcherInTheSky Title]] "The Watcher"),
	VoicedText = T(284947371309, --[[voice:narrator]] "A faint signal was traced to originate from the high mountains just outside our Colony's vicinity."),
	group = "Colonists",
	id = "WatcherInTheSky",
	qa_info = PlaceObj('PresetQAInfo', {
		data = {
			{
				action = "Modified",
				time = 1550843475,
				user = "Radomir",
			},
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(982697491816, --[[StoryBit WatcherInTheSky Text]] "Send a Colonist in a Shuttle to investigate."),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ActivateStoryBit', {
				'Id', "WatcherInTheSky_2",
				'ForcePopup', false,
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(567951828202, --[[StoryBit WatcherInTheSky Text]] "Jam the signal and carry on."),
	}),
})

