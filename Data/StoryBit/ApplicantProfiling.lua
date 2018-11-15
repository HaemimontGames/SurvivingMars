-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_FounderStageDone",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/07_explorer_flag.tga",
	Prerequisites = {
		PlaceObj('IsSponsors', {
			'Sponsors', {
				"IMM",
				"Brazil",
				"SpaceY",
				"NewArk",
			},
		}),
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'Filters', {},
			'Condition', ">=",
			'Amount', 50,
		}),
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'Filters', {},
			'Condition', "<",
			'Amount', 150,
		}),
		PlaceObj('SupplyMissionsEnabled', nil),
	},
	ScriptDone = true,
	Text = T{236847981261, --[[StoryBit ApplicantProfiling Text]] "This in a golden opportunity for us to attract more applicants to join our cause.\n"},
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T{501606335985, --[[StoryBit ApplicantProfiling Title]] "Applicants Profiling"},
	VoicedText = T{582542899282, --[[voice:narrator]] "Our efforts and triumphs on Mars have not gone unnoticed back on Earth. A hit movie based on real events from the early days of the Martian colony just broke the all time box office record."},
	group = "Sponsor",
	id = "ApplicantProfiling",
	PlaceObj('StoryBitParamNumber', {
		'Name', "random_applicants",
		'Value', 300,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "specialists_applicants",
		'Value', 100,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{349057879254, --[[StoryBit ApplicantProfiling Text]] "Attract as many new applicants as possible."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{169781298392, --[[StoryBit ApplicantProfiling CustomOutcomeText]] "adds <random_applicants> random applicants"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardApplicants', {
				'Amount', "<random_applicants>",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{310613834993, --[[StoryBit ApplicantProfiling Text]] "Attract specialists."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{140066723894, --[[StoryBit ApplicantProfiling CustomOutcomeText]] "adds <specialists_applicants> applicants with various specializations"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardApplicants', {
				'Amount', 5,
				'Specialization', "medic",
			}),
			PlaceObj('RewardApplicants', {
				'Amount', 5,
				'Specialization', "security",
			}),
			PlaceObj('RewardApplicants', {
				'Amount', 30,
				'Specialization', "scientist",
			}),
			PlaceObj('RewardApplicants', {
				'Amount', 20,
				'Specialization', "botanist",
			}),
			PlaceObj('RewardApplicants', {
				'Amount', 20,
				'Specialization', "geologist",
			}),
			PlaceObj('RewardApplicants', {
				'Amount', 20,
				'Specialization', "engineer",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{663474664512, --[[StoryBit ApplicantProfiling Text]] "Attract some truly exceptional people."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{784809964510, --[[StoryBit ApplicantProfiling CustomOutcomeText]] "adds a Genius, a Celebrity and a Guru applicant"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardApplicants', {
				'Amount', 1,
				'Trait', "Genius",
			}),
			PlaceObj('RewardApplicants', {
				'Amount', 1,
				'Trait', "Celebrity",
			}),
			PlaceObj('RewardApplicants', {
				'Amount', 1,
				'Trait', "Guru",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{999237412498, --[[StoryBit ApplicantProfiling Text]] "We don't need more applicants, we will rely on our own Martianborn!"},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{313021678820, --[[StoryBit ApplicantProfiling CustomOutcomeText]] "Morale boost for all Martianborn"},
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_boost",
		'Value', 10,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "morale_boost_duration",
		'Value', 7200000,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {
					PlaceObj('HasTrait', {
						'Trait', "Martianborn",
					}),
				},
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<morale_boost>",
						'Sols', "<morale_boost_duration>",
					}),
				},
			}),
		},
	}),
})

