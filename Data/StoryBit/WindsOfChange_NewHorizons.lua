-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Disables = {
		"WindsOfChange_2_Typhoon_NaniteStorm",
		"WindsOfChange_WaitRogueNaniteAnalysisTech",
		"WindsOfChange_2_Typhoon_NaniteStormWait",
	},
	Effects = {},
	Enables = {
		"WindsOfChange_NewHorizons_Prefabs1",
	},
	Image = "UI/Messages/Events/03_discussion.tga",
	Prerequisites = {
		PlaceObj('IsTechId', {
			'Field', "Storybits",
			'TechId', "RogueNaniteDeactivation",
		}),
	},
	ScriptDone = true,
	Text = T(527447412585, --[[StoryBit WindsOfChange_NewHorizons Text]] "Progress inevitably leads to mistakes, but the progress also finds solutions.\n\n<effect>The Nanite Storms will stop. You will periodically receive building prefabs."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(601765514231, --[[StoryBit WindsOfChange_NewHorizons Title]] "Winds of Change: New Horizons"),
	Trigger = "TechResearchedTrigger",
	VoicedText = T(894459397508, --[[voice:narrator]] "Broadcasting the deactivation signal brings the rogue nanites back to being what they were supposed to be – an instrument of creation, not destruction."),
	group = "Breakthroughs",
	id = "WindsOfChange_NewHorizons",
})

