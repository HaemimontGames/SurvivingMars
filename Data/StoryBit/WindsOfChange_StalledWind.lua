-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Disables = {
		"WindsOfChange_WaitEvacuationOnSite",
	},
	Effects = {},
	Image = "UI/Messages/Events/24_dome_in_ruins.tga",
	Prerequisites = {
		PlaceObj('IsTechId', {
			'Field', "Storybits",
			'TechId', "RogueNanitesAnalysis",
		}),
	},
	ScriptDone = true,
	SuppressTime = 7200000,
	Text = T(199581165792, --[[StoryBit WindsOfChange_StalledWind Text]] "Only the monstrous husk of the unfinished Dome remains to tell the story that unfolded here.\n\n<effect>The expedition team will return shortly. The rogue nanites have been deactivated."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(869861831744, --[[StoryBit WindsOfChange_StalledWind Title]] "Winds of Change: Stalled Wind"),
	Trigger = "TechResearchedTrigger",
	VoicedText = T(584095326756, --[[voice:narrator]] "The deactivation signal is broadcasted and rogue nanites fall down to join the millennia-old dust of the Red Planet. "),
	group = "Breakthroughs",
	id = "WindsOfChange_StalledWind",
})

