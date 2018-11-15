-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('ModifyObject', {
			'Prop', "electricity_consumption",
			'ModifyId', "DomeHeating",
		}),
	},
	Disables = {
		"DomeHeating_2_Deaths",
	},
	Effects = {
		PlaceObj('ModifyLabel', {
			'Label', "Consts",
			'Prop', "electricity_consumption",
			'Percent', "<power_increase_prc_neg>",
		}),
		PlaceObj('ForEachExecuteEffects', {
			'Label', "Colonist",
			'Filters', {},
			'Effects', {
				PlaceObj('ModifyObject', {
					'Prop', "base_morale",
					'Amount', "<morale_bonus>",
					'Sols', "<morale_bonus_sols>",
				}),
			},
		}),
	},
	Prerequisites = {},
	ScriptDone = true,
	SuppressTime = 240000,
	Text = T{778254946156, --[[StoryBit DomeHeating_1_NoDeaths Text]] "You finish the report on Dome <DisplayName> and the issue with the heaters assuring our sponsor that the problem has been fully resolved. It seems that the accident has energized the colonists.\n\n<effect>Morale +<morale_bonus> for <sols(morale_bonus_sols)> Sols."},
	TextReadyForValidation = true,
	TextsDone = true,
	Trigger = "ColdWaveEnded",
	VoicedText = T{362675231293, --[[voice:narrator]] "As the frost outside melts you can see that colonists are returning to their normal routines. The atmosphere is even a bit cheerful."},
	group = "Disasters",
	id = "DomeHeating_1_NoDeaths",
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_bonus",
		'Value', 20,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "morale_bonus_sols",
		'Value', 3600000,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{281358208530, --[[StoryBit DomeHeating_1_NoDeaths Text]] "Another day, another disaster averted!"},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{712824560205, --[[StoryBit DomeHeating_1_NoDeaths Text]] "Tell colonists to take it easy for the next few days and to drink a lot of fluids."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{538158839441, --[[StoryBit DomeHeating_1_NoDeaths CustomOutcomeText]] "grant Sanity boost"},
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "doctor",
		}),
		'Comment', "",
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {},
				'Effects', {
					PlaceObj('ModifyColonistStat', {
						'Stat', "Sanity",
						'Amount', "<sanity_boost>",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "sanity_boost",
		'Value', 10,
	}),
})

