-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_FounderStageDone",
	Effects = {
		PlaceObj('EraseShuttles', nil),
		PlaceObj('ForEachExecuteEffects', {
			'Label', "Dome",
			'Filters', {},
			'RandomCount', 1,
			'Effects', {
				PlaceObj('CauseFracture', nil),
			},
		}),
		PlaceObj('ForEachExecuteEffects', {
			'Label', "Colonist",
			'Filters', {
				PlaceObj('HasTrait', {
					'Trait', "Renegade",
				}),
			},
			'RandomCount', 1,
			'Effects', {
				PlaceObj('KillColonist', nil),
			},
		}),
	},
	Enabled = true,
	Enables = {},
	Image = "UI/Messages/Events/29_shuttle.tga",
	Prerequisites = {
		PlaceObj('AreDomesOpen', {
			'Negate', true,
		}),
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'Filters', {
				PlaceObj('HasTrait', {
					'Trait', "Renegade",
				}),
			},
			'Condition', ">=",
			'Amount', 15,
		}),
		PlaceObj('CountShuttles', {
			'Amount', 5,
		}),
	},
	ScriptDone = true,
	Text = T(330030982921, --[[StoryBit MartianVice Text]] "As you go out, two Cargo Shuttles buzz near the Dome - one actually crashes and leaves a nasty crack.\n\nLater you learn that Renegade colonists organized a race with people actually piloting the Shuttles. One of them died in the crash.\n\nThe other pilot somehow got away after leaving the shuttle. Rumor is a race tournament is about to begin and that will last around 10 sols."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(226978526928, --[[StoryBit MartianVice Title]] "Renegades: Martian Vice"),
	VoicedText = T(390815295270, --[[voice:narrator]] "Busy at your office one day, you decide to take a walk and breath in some of the, well, less stale Dome air outside."),
	group = "Renegades",
	id = "MartianVice",
	qa_info = PlaceObj('PresetQAInfo', {
		data = {
			{
				action = "Modified",
				time = 1550837288,
				user = "Radomir",
			},
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(306971651058, --[[StoryBit MartianVice Text]] "Close all Shuttle Hubs for <sols(time_off)> Sols to improve security."),
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "time_off",
		'Value', 2160000,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "ShuttleHub",
				'Filters', {},
				'Effects', {
					PlaceObj('SetBuildingEnabledState', {
						'Duration', "<time_off>",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(516925378078, --[[StoryBit MartianVice Text]] "We need our Shuttles operating and can't afford to stop them now."),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"MartianViceStopRaces",
			"MartianVice_NoRenegades",
			"MartianVice_NoShuttlesLeft",
		},
		'Effects', {
			PlaceObj('EnableRandomStoryBit', {
				'StoryBits', {
					"MartianVice_Crash",
					"MartianVice_NoCrash",
				},
				'Weights', {
					50,
					50,
				},
			}),
		},
	}),
})

