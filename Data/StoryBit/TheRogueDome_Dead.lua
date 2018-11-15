-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('ForEachExecuteEffects', {
			'Label', "Colonist",
			'Filters', {
				PlaceObj('HasTrait', {
					'Trait', "Renegade",
					'Negate', true,
				}),
			},
			'RandomPercent', 15,
			'Effects', {
				PlaceObj('AddTrait', {
					'Trait', "Renegade",
				}),
			},
		}),
		PlaceObj('SetBuildingRogueState', {
			'RogueState', false,
		}),
	},
	Effects = {},
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'InDome', true,
			'Filters', {},
			'Condition', "==",
			'Amount', 0,
		}),
	},
	ScriptDone = true,
	Text = T{127545542605, --[[StoryBit TheRogueDome_Dead Text]] "The average colonist perceived the entire chain of events as a tragedy and it had devastating effects on the Morale of our entire Colony. It will take a lot of hard work to regain the trust of our people.\n\n<effect>A wave of Renegades has appeared throughout the Colony. At least we regained control over the now empty <DisplayName> Dome."},
	TextReadyForValidation = true,
	TextsDone = true,
	VoicedText = T{732685877861, --[[voice:narrator]] "The First Martian Republic is no more. The entire population of the rogue Dome is now deceased."},
	group = "Renegades",
	id = "TheRogueDome_Dead",
	PlaceObj('StoryBitReply', {
		'Text', T{734813490091, --[[StoryBit TheRogueDome_Dead Text]] "What a pointless waste of human life..."},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{135232637553, --[[StoryBit TheRogueDome_Dead Text]] "These renegades had it coming!"},
	}),
})

