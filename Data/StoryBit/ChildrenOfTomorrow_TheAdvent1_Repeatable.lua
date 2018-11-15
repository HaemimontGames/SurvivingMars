-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('ForEachExecuteEffects', {
			'Label', "Colonist",
			'Filters', {
				PlaceObj('HasTrait', {
					'Trait', "Martianborn",
				}),
			},
			'Effects', {
				PlaceObj('ModifyColonistStat', {
					'Stat', "Comfort",
					'Amount', "<comfort_gain>",
				}),
			},
		}),
	},
	Effects = {},
	Enables = {
		"ChildrenOfTomorrow_TheAdvent1_Repeatable",
	},
	NotificationText = "",
	Prerequisites = {},
	ScriptDone = true,
	SuppressTime = 7200000,
	TextReadyForValidation = true,
	TextsDone = true,
	group = "Breakthroughs",
	id = "ChildrenOfTomorrow_TheAdvent1_Repeatable",
	PlaceObj('StoryBitParamNumber', {
		'Name', "comfort_gain",
		'Value', 30,
	}),
})

