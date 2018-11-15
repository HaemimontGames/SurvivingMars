-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {},
	Enables = {},
	Prerequisites = {},
	ScriptDone = true,
	Text = T{118568947215, --[[StoryBit DomeLeaks_3_Aftermath Text]] "It is now safe to send a repair team to seal the crack in the dome and stop any further leaks. Do you have any special instructions?"},
	TextReadyForValidation = true,
	TextsDone = true,
	Trigger = "DustStormEnded",
	VoicedText = T{666675033619, --[[voice:narrator]] "The Dust Storm has settled but the damage to the Dome remains a constant threat to the Colonists. "},
	group = "Disasters",
	id = "DomeLeaks_3_Aftermath",
	PlaceObj('StoryBitParamNumber', {
		'Name', "reapair_time_slow",
		'Value', 24,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "reapair_time_fast",
		'Value', 8,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{768819441128, --[[StoryBit DomeLeaks_3_Aftermath Text]] "Double check everything and make sure all safety protocols are followed."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{798232673864, --[[StoryBit DomeLeaks_3_Aftermath CustomOutcomeText]] "repairs will take <reapair_time_slow> hours"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"DomeLeaks_4_SlowFix",
		},
		'Effects', {},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{358231154594, --[[StoryBit DomeLeaks_3_Aftermath Text]] "We need to fix the issue asap. Tell them to hurry up!"},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{121583731094, --[[StoryBit DomeLeaks_3_Aftermath CustomOutcomeText]] "repairs will take <reapair_time_fast> hours, additional damage may be caused"},
		'Comment', "fix parameter when effect is done",
	}),
	PlaceObj('StoryBitParamResource', {
		'Name', "penalty",
		'Value', 10000,
		'Resource', "electronics",
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 80,
		'Enables', {
			"DomeLeaks_5_QuickFix",
		},
		'Effects', {},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 20,
		'VoicedText', T{509849610730, --[[voice:narrator]] "You observe as the repair team works on top of the Dome above your head. Suddenly a Colonist slips and tumbles down… Fortunately the safety rope stops his fall."},
		'Text', T{271629919240, --[[StoryBit DomeLeaks_3_Aftermath Text]] "Rushing to get the job done and seal the crack in the dome has resulted in several accidents and missteps.\n\n<effect>The dome will need <electronics(penalty)> emergency maintenance"},
		'Enables', {
			"DomeLeaks_5_QuickFix",
		},
		'Effects', {
			PlaceObj('SetBuildingBreakdownState', {
				'RepairResource', "Electronics",
				'RepairAmount', 10000,
			}),
		},
	}),
})

