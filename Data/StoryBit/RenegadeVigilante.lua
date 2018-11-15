-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('ForEachExecuteEffects', {
			'Label', "Colonist",
			'Filters', {
				PlaceObj('HasTrait', {
					'Trait', "Renegade",
				}),
			},
			'RandomCount', 3,
			'Effects', {
				PlaceObj('KillColonist', nil),
			},
		}),
		PlaceObj('ForEachExecuteEffects', {
			'Label', "Colonist",
			'Filters', {
				PlaceObj('HasTrait', {
					'Trait', "Youth",
				}),
			},
			'RandomCount', 2,
			'Effects', {
				PlaceObj('ForceSuicide', nil),
			},
		}),
	},
	Category = "Tick_FounderStageDone",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/04_interrogation.tga",
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'Filters', {
				PlaceObj('HasTrait', {
					'Trait', "Renegade",
				}),
			},
			'Condition', ">=",
			'Amount', 10,
		}),
		PlaceObj('PickFromLabel', {
			'Label', "Colonist",
			'Conditions', {
				PlaceObj('HasTrait', {
					'Trait', "Renegade",
					'Negate', true,
				}),
				PlaceObj('HasTrait', {
					'Trait', "Child",
					'Negate', true,
				}),
			},
		}),
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'Filters', {
				PlaceObj('HasTrait', {
					'Trait', "Youth",
				}),
			},
			'Condition', ">=",
			'Amount', 2,
		}),
	},
	ScriptDone = true,
	Text = T{308180305462, --[[StoryBit RenegadeVigilante Text]] "Several Renegades have been pushed to their deaths during the night, in what seems like nothing short of an execution.\n\nJust as you are about to are about to begin coordinating a plan with the ranking Officers, a Colonist admits to being the culprit.\n\n<DisplayName> says the murdered group of renegades had been tormenting youngsters left and right around the Domes - some of which had been pushed to suicide. \n\nWhen they saw that the authorities were not going to solve this problem, <DisplayName> decided to take matters into their own hands. They punished the predatory group of renegades and are now ready to accept their fate."},
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T{399708406552, --[[StoryBit RenegadeVigilante Title]] "Renegades: Vigilante Justice"},
	VoicedText = T{967910574769, --[[voice:narrator]] "News of the gruesome crime reach had reached your ears with the sunrise."},
	group = "Renegades",
	id = "RenegadeVigilante",
	PlaceObj('StoryBitReply', {
		'Text', T{317832898775, --[[StoryBit RenegadeVigilante Text]] "This is wrong and immoral. Prepare to ship <DisplayName> back to Earth."},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('EraseColonist', nil),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{834502749510, --[[StoryBit RenegadeVigilante Text]] "Maybe <DisplayName> is the antidote for our crime problem. Set them loose."},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"RenegateVigilante_KillRenegades",
			"RenegateVigilante_Disable",
		},
		'Effects', {},
	}),
})

