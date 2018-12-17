-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "DustStromStart",
	Delay = 120000,
	Effects = {},
	Enabled = true,
	Enables = {
		"DustSickness_Deaths",
		"DustSickness_Cure",
	},
	Image = "UI/Messages/Events/25_medical_check.tga",
	Prerequisites = {
		PlaceObj('IsSolInRange', {
			'Max', 88,
		}),
	},
	ScriptDone = true,
	Text = T(986339173594, --[[StoryBit DustSickness Text]] "The fine Martian dust can be a serious health hazard. We thought that our airlock filters could handle it well enough but this particular Dust Storm got the better of them.\n\nSome colonists have developed the Dust Sickness trait. They will take Health damage during Dust Storms even when inside the dome. \n\nOur medical staff strongly recommends that we discharge those affected with the Dust Sickness from work so they can better manage the ailment."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(924901666901, --[[StoryBit DustSickness Title]] "Dust Sickness"),
	Trigger = "DustStorm",
	VoicedText = T(160844448952, --[[voice:narrator]] "The Colonist on the bed keeps coughing uncontrollably. It’s the third such case since the Dust Storm started."),
	group = "Disasters",
	id = "DustSickness",
	PlaceObj('StoryBitReply', {
		'Text', T(872746393591, --[[StoryBit DustSickness Text]] "Colonists suffering from the Dust Sickness shouldn’t work."),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"DustSickness_GeneratSickNotWorking",
		},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {
					PlaceObj('HasTrait', {
						'Trait', "Child",
						'Negate', true,
					}),
				},
				'RandomCount', 5,
				'Effects', {
					PlaceObj('AddTrait', {
						'Trait', "DustSickness",
					}),
				},
			}),
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {
					PlaceObj('HasTrait', {
						'Trait', "DustSickness",
					}),
				},
				'Effects', {
					PlaceObj('ModifyStatus', {
						'Status', "StatusEffect_UnableToWork",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(270248667480, --[[StoryBit DustSickness Text]] "We need everyone to pull their weight. They should continue to work."),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"DustSickness_GeneratSick",
		},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {
					PlaceObj('HasTrait', {
						'Trait', "Child",
						'Negate', true,
					}),
				},
				'RandomCount', 5,
				'Effects', {
					PlaceObj('AddTrait', {
						'Trait', "DustSickness",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(287026287551, --[[StoryBit DustSickness Text]] "We can alleviate the symptoms with allergy medication."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(647813477190, --[[StoryBit DustSickness CustomOutcomeText]] "the Dust Sickness trait will not appear in the colony"),
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "doctor",
		}),
	}),
})

