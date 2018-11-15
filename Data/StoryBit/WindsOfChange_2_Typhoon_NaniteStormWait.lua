-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('ForEachExecuteEffects', {
			'Label', "Drone",
			'Filters', {},
			'RandomCount', 5,
			'Effects', {
				PlaceObj('DestroyVehicle', nil),
			},
		}),
		PlaceObj('ForEachExecuteEffects', {
			'Label', "OutsideBuildingsTargets",
			'Filters', {},
			'RandomCount', 3,
			'Effects', {
				PlaceObj('DestroyBuilding', nil),
			},
		}),
	},
	Delay = 300000,
	Effects = {},
	Enables = {
		"WindsOfChange_2_Typhoon_NaniteStorm",
	},
	Image = "UI/Messages/dust_storm.tga",
	NotificationText = "",
	Prerequisites = {},
	ScriptDone = true,
	TextReadyForValidation = true,
	TextsDone = true,
	group = "Breakthroughs",
	id = "WindsOfChange_2_Typhoon_NaniteStormWait",
})

