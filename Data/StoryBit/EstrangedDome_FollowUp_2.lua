-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {
		PlaceObj('SetBuildingRogueState', {
			'RogueState', false,
		}),
		PlaceObj('ForEachExecuteEffects', {
			'Label', "Colonist",
			'InDome', true,
			'Filters', {},
			'Effects', {
				PlaceObj('ModifyColonistStat', {
					'Stat', "Comfort",
					'Amount', 20,
				}),
			},
		}),
		PlaceObj('ForEachExecuteEffects', {
			'Label', "Colonist",
			'InDome', true,
			'Filters', {},
			'Effects', {
				PlaceObj('RemoveTrait', {
					'Trait', "Renegade",
				}),
			},
		}),
	},
	Prerequisites = {},
	ScriptDone = true,
	SuppressTime = 7200000,
	Text = T(339798237497, --[[StoryBit EstrangedDome_FollowUp_2 Text]] "They promise never to do this again as they now realize the many difficulties that you face on a daily basis.\n\n<effect>All colonists in the <Display_Name> Dome lose the renegade trait."),
	TextReadyForValidation = true,
	TextsDone = true,
	VoicedText = T(352728298711, --[[voice:narrator]] "The rogue Dome is begging us to rejoin the colony."),
	group = "Renegades",
	id = "EstrangedDome_FollowUp_2",
	PlaceObj('StoryBitReply', {
		'Text', T(535842221844, --[[StoryBit EstrangedDome_FollowUp_2 Text]] "Welcome back!"),
	}),
})

