-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {
		PlaceObj('UnitAppear', nil),
		PlaceObj('ModifyStatus', {
			'Status', "StatusEffect_UnableToWork",
		}),
		PlaceObj('ForEachExecuteEffects', {
			'Label', "Drone",
			'Filters', {},
			'RandomCount', 3,
			'Effects', {
				PlaceObj('DestroyVehicle', nil),
			},
		}),
	},
	Prerequisites = {},
	ScriptDone = true,
	SuppressTime = 180000,
	Text = T{319923292430, --[[StoryBit WinterWonderland_SaveKidDrones Text]] "The exposure to the cold and the oxygen deprivation have left <DisplayName> with permanent injuries. The kid won't be able to go to school or work after growing up."},
	TextReadyForValidation = true,
	TextsDone = true,
	VoicedText = T{196655073607, --[[voice:narrator]] "It took us four attempts to find the correct approach and we lost several Drones in the process. We managed to rescue the kid in the nick of time. "},
	group = "Disasters",
	id = "WinterWonderland_SaveKidDrones",
})

