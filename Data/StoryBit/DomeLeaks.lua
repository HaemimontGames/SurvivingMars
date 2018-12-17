-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('CauseFracture', {
			'ChanceLarge', 100,
		}),
	},
	Category = "DustStromStart",
	Delay = 60000,
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/metatron_mystery_03.tga",
	Prerequisites = {
		PlaceObj('PickFromLabel', {
			'Label', "Dome",
			'Conditions', {
				PlaceObj('CheckObjectCount', {
					'Label', "Colonist",
					'InDome', true,
					'Filters', {},
					'Condition', ">=",
					'Amount', 10,
				}),
			},
		}),
	},
	ScriptDone = true,
	Text = T(11053, --[[StoryBit DomeLeaks Text]] "The dust storm has caused a giant crack in the glass of dome <DisplayName>. New leaks spring up constantly and our drones will struggle to fix all of them.\n\nTo fix the initial crack we’ll have to send colonists outside. However this may be dangerous and it may be wise to first wait out the storm."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(179679317862, --[[StoryBit DomeLeaks Title]] "Broken Dome"),
	Trigger = "DustStorm",
	VoicedText = T(711159505860, --[[voice:narrator]] "Nervous colonists watch as a crack in the Dome slowly leaks out precious air into the Dust Storm outside."),
	group = "Disasters",
	id = "DomeLeaks",
	PlaceObj('StoryBitReply', {
		'Text', T(202749987241, --[[StoryBit DomeLeaks Text]] "I need volunteers to go outside!"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(881902321348, --[[StoryBit DomeLeaks CustomOutcomeText]] "Colonists may perish but the leaks will be contained"),
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "killed_colonists",
		'Value', 2,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T(311356627542, --[[voice:narrator]] "Several brave souls risked their lives and went out into the dust storm. Using a special sealant they managed to stop the crack from spreading. "),
		'Text', T(866965817357, --[[StoryBit DomeLeaks Text]] "We are sad to report that we lost <killed_colonists> Colonists during the repairs. Let their sacrifice be an inspiration for us all.\n\n<effect>New fractures will cease to occur in Dome “<DisplayName>”. Existing fractures will be fixed automatically by drones."),
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {
					PlaceObj('HasTrait', {
						'Trait', "Child",
						'Negate', true,
					}),
				},
				'RandomCount', "<killed_colonists>",
				'Effects', {
					PlaceObj('KillColonist', nil),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(366109342163, --[[StoryBit DomeLeaks Text]] "We have to weather the storm for now."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(944043196483, --[[StoryBit DomeLeaks CustomOutcomeText]] "Delay repairs"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"DomeLeaks_1_DelayFix",
			"DomeLeaks_3_Aftermath",
		},
		'Effects', {},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(800099341153, --[[StoryBit DomeLeaks Text]] "Try to reduce the pressure differential."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(144158110055, --[[StoryBit DomeLeaks CustomOutcomeText]] "delay repairs, leaks will happen less often"),
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "hydroengineer",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"DomeLeaks_2_Hydroengineer",
			"DomeLeaks_3_Aftermath",
		},
		'Effects', {},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(525524188976, --[[StoryBit DomeLeaks Text]] "Fellow Colonists, we have all trained for this. We will weather this storm."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(756565801155, --[[StoryBit DomeLeaks CustomOutcomeText]] "delay repairs, Colonists gain Sanity"),
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "citymayor",
		}),
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "sanity_gain",
		'Value', 20,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"DomeLeaks_1_DelayFix",
			"DomeLeaks_3_Aftermath",
		},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {},
				'Effects', {
					PlaceObj('ModifyColonistStat', {
						'Stat', "Sanity",
						'Amount', "<sanity_gain>",
					}),
				},
			}),
		},
	}),
})

