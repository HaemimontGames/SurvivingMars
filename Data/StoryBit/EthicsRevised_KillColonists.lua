-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {
		PlaceObj('ForEachExecuteEffects', {
			'Label', "Colonist",
			'Filters', {},
			'RandomCount', "<number_of_killed>",
			'Effects', {
				PlaceObj('KillColonist', nil),
			},
		}),
	},
	Enables = {
		"EthicsRevised_KillColonists",
	},
	NotificationText = T(11059, --[[StoryBit EthicsRevised_KillColonists NotificationText]] "<number_of_killed> colonists have died in research experiments"),
	Prerequisites = {},
	ScriptDone = true,
	SuppressTime = 2880000,
	TextReadyForValidation = true,
	TextsDone = true,
	group = "Sponsor",
	id = "EthicsRevised_KillColonists",
	PlaceObj('StoryBitParamNumber', {
		'Name', "number_of_killed",
		'Value', 4,
	}),
})

