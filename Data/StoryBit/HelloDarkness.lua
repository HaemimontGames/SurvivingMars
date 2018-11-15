-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('ModifyStatus', {
			'Status', "StatusEffect_UnableToWork",
		}),
	},
	Category = "SanityBreakdown",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/25_medical_check.tga",
	Prerequisites = {},
	ScriptDone = true,
	Text = T{423557782917, --[[StoryBit HelloDarkness Text]] "<DisplayName> couldn’t bear any responsibility anymore and lost the motivation to go on. His co-workers fear that their colleague could make some irreparable mistakes.\n\n<effect>Colonist <DisplayName> is unable to work."},
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T{759695017800, --[[StoryBit HelloDarkness Title]] "Sanity Breakdown - Hello Darkness, My Old Friend"},
	Trigger = "SanityBreakdown",
	VoicedText = T{220340351580, --[[voice:narrator]] "A colonist has snapped, and after regaining consciousness, has plunged into the deepest depression."},
	group = "Sanity Breakdown",
	id = "HelloDarkness",
	PlaceObj('StoryBitReply', {
		'Text', T{828525431944, --[[StoryBit HelloDarkness Text]] "Who am I to judge?"},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{352933879773, --[[StoryBit HelloDarkness CustomOutcomeText]] "no change"},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{712925396407, --[[StoryBit HelloDarkness Text]] "I would suggest seeking professional help."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{781025256836, --[[StoryBit HelloDarkness CustomOutcomeText]] "unknown outcome"},
		'Prerequisite', PlaceObj('CheckBuildingCount', {
			'Building', "Infirmary",
			'Amount', 1,
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 40,
		'Effects', {},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 30,
		'Enables', {},
		'Effects', {
			PlaceObj('ModifyStatus', {
				'Status', "StatusEffect_UnableToWork",
				'Apply', false,
			}),
			PlaceObj('ActivateStoryBit', {
				'Id', "HelloDarkness_FollowRecovery",
			}),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 30,
		'Effects', {
			PlaceObj('ForceSuicide', nil),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{557690492403, --[[StoryBit HelloDarkness Text]] "Together we could find the answer why the previous self was unwanted."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{554106228353, --[[StoryBit HelloDarkness CustomOutcomeText]] "unknown outcome"},
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "psychologist",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 75,
		'Effects', {
			PlaceObj('ModifyStatus', {
				'Status', "StatusEffect_UnableToWork",
				'Apply', false,
			}),
			PlaceObj('ActivateStoryBit', {
				'Id', "HelloDarkness_FollowRecovery",
			}),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 25,
		'Effects', {},
	}),
})

