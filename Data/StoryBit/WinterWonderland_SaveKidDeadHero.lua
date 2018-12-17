-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('PickFromLabelEffect', {
			'Label', "Colonist",
			'Conditions', {
				PlaceObj('HasTrait', {
					'Trait', "Child",
					'Negate', true,
				}),
			},
		}),
	},
	Effects = {
		PlaceObj('KillColonist', nil),
	},
	Prerequisites = {},
	ScriptDone = true,
	Text = T(651798025808, --[[StoryBit WinterWonderland_SaveKidDeadHero Text]] "We managed to get the kid to safety before the Oxygen supply ran out. However, the volunteer rescuer - <DisplayName> was seriously injured when climbing down the ravine and did not survive.\n\nThe kid's parents held an impromptu wake for the fallen hero."),
	TextReadyForValidation = true,
	TextsDone = true,
	group = "Disasters",
	id = "WinterWonderland_SaveKidDeadHero",
	PlaceObj('StoryBitReply', {
		'Text', T(546850898042, --[[StoryBit WinterWonderland_SaveKidDeadHero Text]] "Join the mourners at the wake."),
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(225320441084, --[[StoryBit WinterWonderland_SaveKidDeadHero Text]] "Rename a dome in honor of <DisplayName>."),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RenameObject', {
				'Label', "Dome",
				'Filters', {},
			}),
		},
	}),
})

