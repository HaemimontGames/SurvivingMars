-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Disables = {
		"WindsOfChange_2_Typhoon_NaniteStorm",
		"WindsOfChange_WaitRogueNaniteAnalysisTech",
		"WindsOfChange_2_Typhoon_NaniteStormWait",
	},
	Effects = {},
	Image = "UI/Messages/game_over.tga",
	Prerequisites = {
		PlaceObj('IsTechId', {
			'Field', "Storybits",
			'TechId', "RogueNaniteDeactivation",
		}),
	},
	ScriptDone = true,
	Text = T{267590364085, --[[StoryBit WindsOfChange_ClearSkies Text]] "The colony is saved, but at what price?\n\n<effect>Nanite Storms will stop."},
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T{578774729545, --[[StoryBit WindsOfChange_ClearSkies Title]] "Winds of Change: Clear Skies"},
	Trigger = "TechResearchedTrigger",
	VoicedText = T{360041634932, --[[voice:narrator]] "Broadcasting the deactivation signal brings the rogue nanites to the ground, dooming them to become nothing more than the millennia-old dust that covers the Red Planet."},
	group = "Breakthroughs",
	id = "WindsOfChange_ClearSkies",
})

