-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('ForEachExecuteEffects', {
			'Label', "Colonist",
			'Filters', {
				PlaceObj('HasTrait', {
					'Trait', "Child",
					'Negate', true,
				}),
			},
			'RandomCount', "<number_of_injured>",
			'Effects', {
				PlaceObj('ModifyColonistStat', {
					'Stat', "Health",
					'Amount', "<health_damage>",
				}),
			},
		}),
	},
	Category = "ColdWaveStart",
	Effects = {},
	Enables = {
		"WinterWonderland_SeriousAccident",
	},
	NotificationText = T{11098, --[[StoryBit WinterWonderland_SeriousAccident NotificationText]] "<number_of_injured> Colonists have been injured"},
	Prerequisites = {},
	ScriptDone = true,
	SuppressTime = 120000,
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T{184108419157, --[[StoryBit WinterWonderland_SeriousAccident Title]] "Snowball Fight!"},
	Trigger = "ColdWave",
	group = "Disasters",
	id = "WinterWonderland_SeriousAccident",
	PlaceObj('StoryBitParamNumber', {
		'Name', "number_of_injured",
		'Value', 3,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "health_damage",
		'Value', -40,
	}),
})

