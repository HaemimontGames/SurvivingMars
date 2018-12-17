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
				PlaceObj('HasTrait', {
					'Trait', "Child",
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
	id = "DustSickness_GeneratSick",
})

