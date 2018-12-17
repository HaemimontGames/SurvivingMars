-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {
		PlaceObj('KillColonist', nil),
		PlaceObj('ForEachExecuteEffects', {
			'Label', "Casino Complex",
			'Filters', {},
			'RandomCount', 1,
			'Effects', {
				PlaceObj('ExplodeBuilding', {
					'Radius', 500,
				}),
			},
		}),
	},
	Prerequisites = {},
	ScriptDone = true,
	Text = T(201359118385, --[[StoryBit HostageSituation_BlowUp Text]] "The moment <DisplayName> realized you were not about to give them what they wanted, they detonated the bomb, taking many innocent lives with them."),
	TextReadyForValidation = true,
	TextsDone = true,
	VoicedText = T(756464274994, --[[voice:narrator]] "A blast echoes throughout the colony As the smoke clears it becomes apparent - nothing is left of the Casino and its immediate surroundings."),
	group = "Renegades",
	id = "HostageSituation_BlowUp",
})

