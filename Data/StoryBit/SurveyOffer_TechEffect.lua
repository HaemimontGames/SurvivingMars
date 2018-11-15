-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "TechResearched",
	Effects = {
		PlaceObj('SpawnSubsurfaceDeposits', {
			'Amount', 5,
			'ResourceAmount', 750000,
			'Grade', "High",
		}),
		PlaceObj('SpawnSubsurfaceDeposits', {
			'Amount', 3,
			'Resource', "PreciousMetals",
			'ResourceAmount', 500000,
			'Grade', "High",
		}),
	},
	Enabled = true,
	Prerequisites = {
		PlaceObj('IsTechId', {
			'Field', "Storybits",
			'TechId', "SurveyOffer",
		}),
	},
	ScriptDone = true,
	TextReadyForValidation = true,
	TextsDone = true,
	Trigger = "TechResearchedTrigger",
	group = "Sponsor",
	id = "SurveyOffer_TechEffect",
})

