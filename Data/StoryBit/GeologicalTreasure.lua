-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_FounderStageDone",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/crater.tga",
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "TheExcavator",
			'Filters', {
				PlaceObj('IsBuildingWorking', nil),
			},
			'Condition', ">",
			'Amount', 0,
		}),
	},
	ScriptDone = true,
	Text = T{164344231102, --[[StoryBit GeologicalTreasure Text]] "The formation hints of active lava flows during a time when they were considered to have been geologically dead for millions of years. \n\nCalls from geologists, both from Earth and Mars to cease work of the Extractor until the formation is properly studied, are mounting."},
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T{888732991901, --[[StoryBit GeologicalTreasure Title]] "Geological Treasure"},
	VoicedText = T{792209125412, --[[voice:narrator]] "The Excavator has unearthed a rare geological formation which challenges our understanding of Mars."},
	group = "Wonders",
	id = "GeologicalTreasure",
	PlaceObj('StoryBitParamSols', {
		'Name', "disable_duration",
		'Value', 7200000,
	}),
	PlaceObj('StoryBitParamResearchPoints', {
		'Name', "reward_rp",
		'Value', 15000,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{328584950902, --[[StoryBit GeologicalTreasure Text]] "Disable the Excavator for <sols(disable_duration)> Sols."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{865307225585, --[[StoryBit GeologicalTreasure CustomOutcomeText]] "get <research(reward_rp)>afterwards"},
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "astrogeologist",
			'Negate', true,
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"GeologicalTreasure_NotGeologist",
		},
		'Effects', {
			PlaceObj('PickFromLabelEffect', {
				'Label', "TheExcavator",
				'Conditions', {},
			}),
			PlaceObj('SetBuildingEnabledState', {
				'Duration', "<disable_duration>",
			}),
		},
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "number_of_geologist",
		'Value', 5,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{800125679398, --[[StoryBit GeologicalTreasure Text]] "Continue excavating - we need the resources."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{481672845398, --[[StoryBit GeologicalTreasure CustomOutcomeText]] "<number_of_geologist> become Alcoholics"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "geologist",
				'Filters', {},
				'RandomCount', "<number_of_geologist>",
				'Effects', {
					PlaceObj('AddTrait', {
						'Trait', "Alcoholic",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{450534072037, --[[StoryBit GeologicalTreasure Text]] "Perhaps there is something more to be discovered there. Disable the Excavator for <sols(disable_duration)> Sols."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{737239476656, --[[StoryBit GeologicalTreasure CustomOutcomeText]] "get a random Breakthrough"},
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "astrogeologist",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"GeologicalTreasure_Geologist",
		},
		'Effects', {
			PlaceObj('PickFromLabelEffect', {
				'Label', "TheExcavator",
				'Conditions', {},
			}),
			PlaceObj('SetBuildingEnabledState', {
				'Duration', "<disable_duration>",
			}),
		},
	}),
})

