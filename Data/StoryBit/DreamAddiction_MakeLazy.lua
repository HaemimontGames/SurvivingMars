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
			'RandomCount', 10,
			'Effects', {
				PlaceObj('AddTrait', {
					'Trait', "Lazy",
				}),
			},
		}),
	},
	Effects = {},
	Enables = {
		"DreamAddication_MakeLazy",
	},
	Prerequisites = {},
	ScriptDone = true,
	SuppressTime = 2880000,
	TextReadyForValidation = true,
	TextsDone = true,
	group = "Wonders",
	id = "DreamAddiction_MakeLazy",
})

