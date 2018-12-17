-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {},
	Prerequisites = {},
	ScriptDone = true,
	SuppressTime = 7200000,
	TextReadyForValidation = true,
	TextsDone = true,
	VoicedText = T(386218699957, --[[voice:narrator]] "Starving, cold and lost, the Colonists from the rogue Dome wish to return to the colony."),
	group = "Renegades",
	id = "EstrangedDome_FollowUp",
	PlaceObj('StoryBitReply', {
		'Text', T(811404767908, --[[StoryBit EstrangedDome_FollowUp Text]] "Welcome back!"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('SetBuildingRogueState', {
				'RogueState', false,
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(655328995444, --[[StoryBit EstrangedDome_FollowUp Text]] "No, I think you haven't tried hard enough. We will not accept you back in the colony."),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"EstrangedDome_FollowUp_2",
		},
		'Effects', {},
	}),
})

