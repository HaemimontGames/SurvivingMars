-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {},
	Prerequisites = {},
	ScriptDone = true,
	SuppressTime = 180000,
	Text = T{559258650143, --[[StoryBit Vandals_FollowUp_1 Text]] "After some commotion, the renegades ran away but the so called Street King was captured and brought to your office.\n\nYou look the Renegade in the eyes. Yet you see intelligence and you see potential."},
	TextReadyForValidation = true,
	TextsDone = true,
	VoicedText = T{840891259939, --[[voice:narrator]] "The vandals have fallen for your trap. They just couldn't resist vandalizing the \"un-watched\" rover just idling there."},
	group = "Renegades",
	id = "Vandals_FollowUp_1",
	PlaceObj('StoryBitReply', {
		'Text', T{540665456146, --[[StoryBit Vandals_FollowUp_1 Text]] "A two hour scolding session seems in order. Then a waist band to always monitor the kid."},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{744106523743, --[[StoryBit Vandals_FollowUp_1 Text]] "Convince <DisplayName> that they could put their talents to improving the Colony instead."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{421053057209, --[[StoryBit Vandals_FollowUp_1 CustomOutcomeText]] "replace Renegade trait with workaholic"},
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "citymayor",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RemoveTrait', {
				'Trait', "Renegade",
			}),
			PlaceObj('AddTrait', {
				'Trait', "Workaholic",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{839261660548, --[[StoryBit Vandals_FollowUp_1 Text]] "Clarify how difficult survival on Mars is and that such actions make things harder. "},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{589676254682, --[[StoryBit Vandals_FollowUp_1 CustomOutcomeText]] "Replace Renegade trait with Survivor"},
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "oligarch",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RemoveTrait', {
				'Trait', "Renegade",
			}),
			PlaceObj('AddTrait', {
				'Trait', "Survivor",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{885995323610, --[[StoryBit Vandals_FollowUp_1 Text]] "Have a nice chat about the positive side of our live on Mars."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{364353215225, --[[StoryBit Vandals_FollowUp_1 CustomOutcomeText]] "Replace Renegade trait with Enthusiast"},
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "psychologist",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RemoveTrait', {
				'Trait', "Renegade",
			}),
			PlaceObj('AddTrait', {
				'Trait', "Enthusiast",
			}),
		},
	}),
})

