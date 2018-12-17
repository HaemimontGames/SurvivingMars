-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "DustStromStart",
	Effects = {
		PlaceObj('CreatePlanetaryAnomaly', {
			'id', "MysteriousDomeStructure",
			'display_name', T(11397, --[[StoryBit WindsOfChange_0 display_name]] "Mysterious Dome Structure"),
			'description', T(11398, --[[StoryBit WindsOfChange_0 description]] "A Dome is gradually built here without any personnel or machines nearby."),
			'required_crew', 5,
			'required_rover', "ExplorerRover",
			'reward', "custom",
		}),
	},
	Enabled = true,
	Enables = {
		"WindsOfChange_1_Expedition",
	},
	Image = "UI/Messages/Events/24_dome_in_ruins.tga",
	Prerequisites = {
		PlaceObj('CheckTechStatus', {
			'Field', "Breakthroughs",
			'TechId', "ConstructionNanites",
		}),
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'Filters', {},
			'Condition', ">=",
			'Amount', 100,
		}),
	},
	ScriptDone = true,
	Text = T(634350043591, --[[StoryBit WindsOfChange_0 Text]] 'The long-range telemetry can tell us just as much as this. If we want to investigate this, we have to send a rocket with exploration equipment and personnel.\n\n<effect>New Planetary Anomaly detected - "Mysterious Dome Structure". Send an expedition to the coordinates to investigate.'),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(914969323131, --[[StoryBit WindsOfChange_0 Title]] "Winds of Change"),
	Trigger = "DustStorm",
	VoicedText = T(266324616837, --[[voice:narrator]] "We have detected a Dome construction within several clicks of the colony site. No vehicles or personnel are to be found at the location, yet the Dome gradually emerges from thin air."),
	group = "Breakthroughs",
	id = "WindsOfChange_0",
})

