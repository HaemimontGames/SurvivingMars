-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "DustStormEnd",
	Effects = {},
	Enabled = true,
	Enables = {
		"BadMOXIE_ColdWave",
		"BadMOXIE_SecondTime",
	},
	Image = "UI/Messages/Events/18_moxie.tga",
	Prerequisites = {
		PlaceObj('PickFromLabel', {
			'Label', "MOXIE",
			'Conditions', {},
		}),
	},
	ScriptDone = true,
	Text = T(995546790730, --[[StoryBit BadMOXIE Text]] "MOXIEs shut down during Dust Storms to prevent their dust filter from jamming up and damaging the unit. However, the filter on this one is completely clogged.\n\nOxygen production is vital for the colony but the filter repair will take <duration> hours. What should we do?"),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(506079231667, --[[StoryBit BadMOXIE Title]] "Problematic MOXIE"),
	Trigger = "DustStormEnded",
	VoicedText = T(231334389170, --[[voice:narrator]] "You tap the red light on the terminal with your finger. It should have turned green when the Dust Storm dissipated. Looks like a MOXIE unit is out of order."),
	group = "Disasters",
	id = "BadMOXIE",
	PlaceObj('StoryBitReply', {
		'Text', T(651105259439, --[[StoryBit BadMOXIE Text]] "Let’s bypass the filter."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(901749272193, --[[StoryBit BadMOXIE CustomOutcomeText]] "the MOXIE will start working immediately but will request maintenance more often"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ModifyObject', {
				'Prop', "maintenance_threshold_base",
				'Percent', -25,
				'ModifyId', "BadMoxie",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(239117513617, --[[StoryBit BadMOXIE Text]] "We can wait for the repairs."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(318573624664, --[[StoryBit BadMOXIE CustomOutcomeText]] "MOXIE will not work for <duration> hours"),
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "duration",
		'Value', 24,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('SetBuildingEnabledState', {
				'Duration', 720000,
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(331842067220, --[[StoryBit BadMOXIE Text]] "We can make a new filter."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(760882373564, --[[StoryBit BadMOXIE CustomOutcomeText]] "MOXIE will request <polymers(maintenance)> emergency maintenance"),
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "inventor",
		}),
	}),
	PlaceObj('StoryBitParamResource', {
		'Name', "maintenance",
		'Value', 3000,
		'Resource', "polymers",
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('SetBuildingBreakdownState', {
				'RepairResource', "Polymers",
				'RepairAmount', "<maintenance>",
			}),
		},
	}),
})

