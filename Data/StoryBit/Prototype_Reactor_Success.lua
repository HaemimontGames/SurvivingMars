-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {
		PlaceObj('RewardPrefab', {
			'Amount', 1,
			'Prefab', "FusionReactor",
		}),
		PlaceObj('RewardTechBoost', {
			'Field', "Physics",
			'Research', "NuclearFusion",
			'Amount', 10,
		}),
	},
	Prerequisites = {},
	ScriptDone = true,
	SuppressTime = 3600000,
	Text = T(614163462789, --[[StoryBit Prototype_Reactor_Success Text]] '<effect>Fusion Reactor prefab has been added. Insights gained from the project have resulted in a <tech_boost>% progress towards the "Nuclear Fusion" technology.'),
	TextReadyForValidation = true,
	TextsDone = true,
	VoicedText = T(842216842512, --[[voice:narrator]] "Our Scientists have succeeded in building the prototype Fusion Reactor."),
	group = "Buildings",
	id = "Prototype_Reactor_Success",
	PlaceObj('StoryBitParamPercent', {
		'Name', "tech_boost",
		'Value', 10,
	}),
})

