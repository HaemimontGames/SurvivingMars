-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('ForEachExecuteEffects', {
			'Label', "Colonist",
			'Filters', {
				PlaceObj('HasTrait', {
					'Trait', "DustSickness",
					'Negate', true,
				}),
			},
			'RandomCount', 6,
			'Effects', {
				PlaceObj('AddTrait', {
					'Trait', "DustSickness",
				}),
			},
		}),
		PlaceObj('ForEachExecuteEffects', {
			'Label', "Colonist",
			'Filters', {
				PlaceObj('HasTrait', {
					'Trait', "DustSickness",
				}),
			},
			'Effects', {
				PlaceObj('ModifyStatus', {
					'Status', "StatusEffect_UnableToWork",
				}),
			},
		}),
	},
	Effects = {},
	Enables = {
		"DustSickness_GeneratSick",
	},
	Prerequisites = {},
	ScriptDone = true,
	TextReadyForValidation = true,
	TextsDone = true,
	Trigger = "DustStorm",
	group = "Disasters",
	id = "DustSickness_GeneratSickNotWorking",
})

