-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {
		PlaceObj('CreatePlanetaryAnomaly', {
			'id', "XMarksTheSpot",
			'display_name', T(11394, --[[StoryBit TreasureHunt_2 display_name]] "X Marks the Spot"),
			'description', T(11395, --[[StoryBit TreasureHunt_2 description]] "A location which is supposed to hide a precious treasure."),
			'required_crew', 3,
			'required_rover', "RCTransport",
			'reward', "custom",
			'outcome_text', T(348212280239, --[[StoryBit TreasureHunt_2 outcome_text]] "Unknown"),
		}),
	},
	Enables = {
		"TreasureHunt_3",
	},
	InheritsObject = false,
	Prerequisites = {
		PlaceObj('IsTechId', {
			'Field', "Storybits",
			'TechId', "TheCypher",
		}),
	},
	ScriptDone = true,
	Text = T(205524022423, --[[StoryBit TreasureHunt_2 Text]] '<effect>A new Planetary Anomaly has been discovered – "X Marks the Spot". Send an expedition to the coordinates!'),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(314767421578, --[[StoryBit TreasureHunt_2 Title]] "Treasure Hunt: It's a Map!"),
	Trigger = "TechResearchedTrigger",
	VoicedText = T(287164706277, --[[voice:narrator]] "After quite the hassle with the strange coding, your Scientists manage to decode the message from the strange pod. It’s a map!"),
	group = "Expeditions",
	id = "TreasureHunt_2",
	qa_info = PlaceObj('PresetQAInfo', {
		data = {
			{
				action = "Modified",
				time = 1553174840,
				user = "Radomir",
			},
		},
	}),
})

