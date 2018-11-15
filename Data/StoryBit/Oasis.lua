-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('PauseExpedition', nil),
	},
	Category = "PlanetaryAnomaly",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/06_space_suit.tga",
	Prerequisites = {},
	ScriptDone = true,
	Text = T{699649194732, --[[StoryBit Oasis Text]] "We rubbed our eyes, but no, we weren’t seeing mirages. By some weird quirk of physics the tiny pond was there – right before our eyes! After the initial excitement has passed, we need to make an important decision."},
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T{862786698827, --[[StoryBit Oasis Title]] "Oasis"},
	Trigger = "PlanetaryAnomalyEvent",
	VoicedText = T{217884530957, --[[voice:narrator]] "No spectrographic traces of water could prepare us for the breath-taking sight. Amidst the red dunes a tiny pond of liquid water was shimmering under the bleak sun."},
	group = "Expeditions",
	id = "Oasis",
	PlaceObj('StoryBitParamResearchPoints', {
		'Name', "research_large",
		'Value', 4000,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{429265964089, --[[StoryBit Oasis Text]] "Extract the water and conduct research."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{131007441040, --[[StoryBit Oasis CustomOutcomeText]] "gain <research(research_large)>"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardResearchPoints', {
				'Amount', "<research_large>",
			}),
			PlaceObj('ResumeExpedition', nil),
		},
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "tourist_gain",
		'Value', 50,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{621284953568, --[[StoryBit Oasis Text]] "Leave it pristine."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{140249216333, --[[StoryBit Oasis CustomOutcomeText]] "+<tourist_gain> Tourist applicants"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardApplicants', {
				'Amount', "<tourist_gain>",
				'Trait', "Tourist",
			}),
			PlaceObj('ResumeExpedition', nil),
		},
	}),
	PlaceObj('StoryBitParamPercent', {
		'Name', "water_spire_discount",
		'Value', 50,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{275906575784, --[[StoryBit Oasis Text]] "This confirms an old hypothesis of mine!"},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{150661701632, --[[StoryBit Oasis CustomOutcomeText]] "Water Reclamation Spires will cost <water_spire_discount>% less"},
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "hydroengineer",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ModifyLabel', {
				'Label', "WaterReclamationSystem_Construction",
				'Prop', "construction_cost_Concrete",
				'Percent', "<water_spire_discount>",
			}),
			PlaceObj('ModifyLabel', {
				'Label', "WaterReclamationSystem_Construction",
				'Prop', "construction_cost_Polymers",
				'Percent', "<water_spire_discount>",
			}),
			PlaceObj('ModifyLabel', {
				'Label', "WaterReclamationSystem_Construction",
				'Prop', "construction_cost_MachineParts",
				'Percent', "<water_spire_discount>",
			}),
			PlaceObj('ResumeExpedition', nil),
		},
	}),
	PlaceObj('StoryBitParamResearchPoints', {
		'Name', "research_small",
		'Value', 2000,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_up",
		'Value', 10,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "morale_up_duration",
		'Value', 14400000,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{438853430136, --[[StoryBit Oasis Text]] "Find a way to conduct research without harming the site!"},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{115694739807, --[[StoryBit Oasis CustomOutcomeText]] "<research(research_small)>, +<morale_up> Morale for <sols(morale_up_duration)> Sols"},
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "ecologist",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardResearchPoints', {
				'Amount', "<research_small>",
			}),
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {},
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<morale_up>",
						'Sols', "<morale_up_duration>",
					}),
				},
			}),
			PlaceObj('ResumeExpedition', nil),
		},
	}),
})

