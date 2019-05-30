-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('ForEachExecuteEffects', {
			'Label', "Drone",
			'Filters', {},
			'RandomCount', 1,
			'Effects', {
				PlaceObj('DestroyVehicle', nil),
			},
		}),
	},
	Effects = {},
	Enables = {
		"Boost20_DronePrototypes_BreakDrone",
	},
	NotificationText = T(12235, --[[StoryBit Boost20_DronePrototypes_BreakDrone NotificationText]] "Division by 0 error! A Drone has critically malfunctioned."),
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "Drone",
			'Filters', {},
			'Condition', ">",
			'Amount', 6,
		}),
	},
	ScriptDone = true,
	SuppressTime = 360000,
	TextReadyForValidation = true,
	TextsDone = true,
	group = "Pre-Founder Stage",
	id = "Boost20_DronePrototypes_BreakDrone",
	qa_info = PlaceObj('PresetQAInfo', {
		data = {
			{
				action = "Modified",
				time = 1549880929,
				user = "Boyan",
			},
			{
				action = "Verified",
				time = 1549979494,
				user = "Kmilushev",
			},
			{
				action = "Modified",
				time = 1550049900,
				user = "Boyan",
			},
			{
				action = "Modified",
				time = 1550491863,
				user = "Boyan",
			},
			{
				action = "Modified",
				time = 1550494320,
				user = "Blizzard",
			},
		},
	}),
})

