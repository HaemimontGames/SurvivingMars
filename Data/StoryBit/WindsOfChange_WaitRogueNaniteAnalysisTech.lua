-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {
		PlaceObj('RewardTechBoost', {
			'Field', "Storybits",
			'Research', "RogueNaniteDeactivation",
			'Amount', 50,
		}),
	},
	Image = "UI/Messages/Events/03_discussion.tga",
	Prerequisites = {
		PlaceObj('CheckTechStatus', {
			'Field', "Storybits",
			'TechId', "RogueNanitesAnalysis",
		}),
	},
	ScriptDone = true,
	Text = T(252316382326, --[[StoryBit WindsOfChange_WaitRogueNaniteAnalysisTech Text]] "<effect>Your Colony is well-informed on the properties of the Rogue Nanites should they become a problem in the future. All future tech on the behavior of the Rogue Nanites will gain a 50% discount."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(724080103869, --[[StoryBit WindsOfChange_WaitRogueNaniteAnalysisTech Title]] "Winds of Change: Analysis"),
	Trigger = "TechResearchedTrigger",
	VoicedText = T(208953690287, --[[voice:narrator]] 'The completion of "Rogue Nanite Analysis" research has given us new insight on how to interact and control the negative effects of the nanites.'),
	group = "Breakthroughs",
	id = "WindsOfChange_WaitRogueNaniteAnalysisTech",
})

