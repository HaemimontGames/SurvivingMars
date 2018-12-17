-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {
		PlaceObj('RewardPrefab', {
			'Amount', 1,
			'Prefab', "DomeMedium",
		}),
		PlaceObj('RewardTechBoost', {
			'Field', "Engineering",
			'Research', "LowGEngineering",
			'Amount', 10,
		}),
	},
	Prerequisites = {},
	ScriptDone = true,
	SuppressTime = 3600000,
	Text = T(922577396950, --[[StoryBit Prototype_MediumDome_Success Text]] '<effect>Medium Dome prefab has been added. Insights gained from the project have resulted in a <tech_boost>% progress towards the "Low-G Engineering" technology.'),
	TextReadyForValidation = true,
	TextsDone = true,
	VoicedText = T(733475515777, --[[voice:narrator]] "Our Scientists have succeeded in building the prototype Medium Dome."),
	group = "Buildings",
	id = "Prototype_MediumDome_Success",
	PlaceObj('StoryBitParamPercent', {
		'Name', "tech_boost",
		'Value', 10,
	}),
})

