-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_FounderStageDone",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/25_medical_check.tga",
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'Filters', {},
			'Condition', "<=",
			'Amount', 100,
		}),
		PlaceObj('IsSponsors', {
			'Sponsors', {
				"NASA",
				"ESA",
				"Japan",
				"paradox",
			},
		}),
		PlaceObj('SupplyMissionsEnabled', nil),
	},
	ScriptDone = true,
	Text = T{11056, --[[StoryBit Cure4Cancer Text]] "Although there is little reason to believe there will be any dramatic benefit for the colony, the cure for cancer is a holy grail for the human civilization as a whole.\n\nThere is not a person on any world that is neutral to the cause."},
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T{768222698049, --[[StoryBit Cure4Cancer Title]] "Cure For Cancer"},
	VoicedText = T{258870220497, --[[voice:narrator]] "In pursuit of the technologies that allow us to exist on Mars, our advanced science practices have earned us an invitation to take part in a currently ongoing prestigious and noble science project dedicated to finding the cure for cancer."},
	group = "Sponsor",
	id = "Cure4Cancer",
	PlaceObj('StoryBitReply', {
		'Text', T{232751411319, --[[StoryBit Cure4Cancer Text]] "If we have a shot at bringing this dragon down, then, by all means!"},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{689014446530, --[[StoryBit Cure4Cancer CustomOutcomeText]] "enables a new research tech"},
		'Comment', "Remember to check the texts of the related tech",
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 95,
		'Enables', {
			"Cure4Cancer_NormalOutcome",
		},
		'Effects', {
			PlaceObj('DiscoverTech', {
				'Field', "Storybits",
				'Tech', "Cure4Cancer",
				'Cost', 5000,
			}),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 5,
		'Enables', {
			"Cure4Cancer_RareOutcome",
		},
		'Effects', {
			PlaceObj('DiscoverTech', {
				'Field', "Storybits",
				'Tech', "Cure4Cancer",
				'Cost', 5000,
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{712302010325, --[[StoryBit Cure4Cancer Text]] "I have already mapped the best way to approach the problem."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{875662434866, --[[StoryBit Cure4Cancer CustomOutcomeText]] "enables a new tech, increased success chance"},
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "doctor",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 90,
		'Enables', {
			"Cure4Cancer_NormalOutcome",
		},
		'Effects', {
			PlaceObj('DiscoverTech', {
				'Field', "Storybits",
				'Tech', "Cure4Cancer",
				'Cost', 5000,
			}),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 10,
		'Enables', {
			"Cure4Cancer_RareOutcome",
		},
		'Effects', {
			PlaceObj('DiscoverTech', {
				'Field', "Storybits",
				'Tech', "Cure4Cancer",
				'Cost', 5000,
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{729762647444, --[[StoryBit Cure4Cancer Text]] "We just can’t spare the research time."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{290037214296, --[[StoryBit Cure4Cancer CustomOutcomeText]] "no effect"},
	}),
})

