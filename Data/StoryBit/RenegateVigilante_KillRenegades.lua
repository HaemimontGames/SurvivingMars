-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {
		PlaceObj('ForEachExecuteEffects', {
			'Label', "Colonist",
			'Filters', {
				PlaceObj('HasTrait', {
					'Trait', "Renegade",
				}),
			},
			'RandomCount', 3,
			'Effects', {
				PlaceObj('KillColonist', nil),
			},
		}),
	},
	Enables = {
		"RenegateVigilante_KillRenegades",
	},
	NotificationText = T{11384, --[[StoryBit RenegateVigilante_KillRenegades NotificationText]] "The vigilante takes another victim"},
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'Filters', {
				PlaceObj('HasTrait', {
					'Trait', "Renegade",
				}),
			},
			'Condition', ">=",
			'Amount', 3,
		}),
	},
	ScriptDone = true,
	SuppressTime = 600000,
	TextReadyForValidation = true,
	TextsDone = true,
	group = "Renegades",
	id = "RenegateVigilante_KillRenegades",
})

