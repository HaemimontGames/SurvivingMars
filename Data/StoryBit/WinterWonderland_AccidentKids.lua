-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('UnitDisappear', nil),
	},
	Category = "ColdWaveStart",
	Effects = {},
	Prerequisites = {
		PlaceObj('PickFromLabel', {
			'Label', "Colonist",
			'Conditions', {
				PlaceObj('HasTrait', {
					'Trait', "Child",
				}),
			},
		}),
	},
	ScriptDone = true,
	Text = T{124137637088, --[[StoryBit WinterWonderland_AccidentKids Text]] "It seems that little <DisplayName> went missing while playing in the frost outside. Apparently the kid decided to adventure further out and fell down a ravine.\n\nThe kid's air reserves are running low, but the approach to the ravine is dangerous."},
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T{943560966919, --[[StoryBit WinterWonderland_AccidentKids Title]] "Winter Wonderland"},
	Trigger = "ColdWave",
	VoicedText = T{878104682959, --[[voice:narrator]] "The worried mother is staring at the monitor as the Drones search for the missing kid. "},
	group = "Disasters",
	id = "WinterWonderland_AccidentKids",
	PlaceObj('StoryBitReply', {
		'Text', T{929937391927, --[[StoryBit WinterWonderland_AccidentKids Text]] "Attempt to rescue the kid with Drones."},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"WinterWonderland_SaveKidDrones",
		},
		'Effects', {},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{958671867768, --[[StoryBit WinterWonderland_AccidentKids Text]] "Attempt a rescue with a Shuttle."},
		'Prerequisite', PlaceObj('CheckBuildingCount', {
			'Building', "ShuttleHub",
			'Amount', 1,
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Text', T{992880475107, --[[StoryBit WinterWonderland_AccidentKids Text]] "\n"},
		'Enables', {
			"WinterWonderland_SaveKidShuttle",
		},
		'Effects', {},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{602359636718, --[[StoryBit WinterWonderland_AccidentKids Text]] "Send a Colonist on the rescue mission."},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 25,
		'Effects', {
			PlaceObj('UnitAppear', nil),
			PlaceObj('ActivateStoryBit', {
				'Id', "WinterWonderland_SaveKidHero",
			}),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 25,
		'Effects', {
			PlaceObj('UnitAppear', nil),
			PlaceObj('ActivateStoryBit', {
				'Id', "WinterWonderland_SaveKidDeadHero",
			}),
		},
	}),
})

