-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('RewardResearchPoints', {
			'Amount', "<reward_rp>",
		}),
	},
	Effects = {},
	NotificationText = T(11001, --[[StoryBit GeologicalTreasure_NotGeologist NotificationText]] "Gained <research(reward_rp)>. The Excavator is back in operation."),
	Prerequisites = {},
	ScriptDone = true,
	SuppressTime = 7200000,
	TextReadyForValidation = true,
	TextsDone = true,
	group = "Wonders",
	id = "GeologicalTreasure_NotGeologist",
	PlaceObj('StoryBitParamResearchPoints', {
		'Name', "reward_rp",
		'Value', 15000,
	}),
})

