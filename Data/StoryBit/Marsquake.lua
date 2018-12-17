-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('Marsquake', {
			'Epicenter', "MoholeMine",
			'Radius', 160,
		}),
	},
	Category = "Tick_FounderStageDone",
	Disables = {},
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/22_collapsing_building.tga",
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "MoholeMine",
			'Filters', {
				PlaceObj('IsBuildingWorking', nil),
			},
			'Condition', ">",
			'Amount', 0,
		}),
	},
	ScriptDone = true,
	Text = T(865219886218, --[[StoryBit Marsquake Text]] "Minutes later a report comes in, detailing the considerable damage done to several buildings by a Marsquake.\n\nThe epicenter of the unlikely event was pinpointed to be beneath the Mohole Mine.\n\nThe fact that the most serious damage was done to buildings within the Mine’s vicinity also suggests that the Mohole Mine has caused the quake."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(382404446864, --[[StoryBit Marsquake Title]] "Marsquake"),
	VoicedText = T(511992473193, --[[voice:narrator]] "Suddenly the ground starts to rumble and office supplies begin to fall all over your cabinet. "),
	group = "Wonders",
	id = "Marsquake",
	PlaceObj('StoryBitParamResource', {
		'Name', "repair",
		'Value', 100000,
		'Resource', "concrete",
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "duration",
		'Value', 7200000,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(939324164268, --[[StoryBit Marsquake Text]] "Shut down the Mohole Mine and use Concrete to stabilize the foundations."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(613640932790, --[[StoryBit Marsquake CustomOutcomeText]] "force maintenance with <concrete(repair)>"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('SetBuildingBreakdownState', {
				'State', "Malfunction",
				'RepairResource', "Concrete",
				'RepairAmount', 100000,
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(704468791297, --[[StoryBit Marsquake Text]] "Keep drilling!"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(733118015742, --[[StoryBit Marsquake CustomOutcomeText]] "causing more Marsquakes during the next <sols(duration)> Sols"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"Marsquake_KillQuakes",
			"Marsquake_MoreQuakes",
		},
		'Effects', {},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(539438561589, --[[StoryBit Marsquake Text]] "Lend your expertise to improve the Mohole design and prevent further accidents."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(447033112642, --[[StoryBit Marsquake CustomOutcomeText]] "resolve the issue without further consequences"),
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "astrogeologist",
		}),
	}),
})

