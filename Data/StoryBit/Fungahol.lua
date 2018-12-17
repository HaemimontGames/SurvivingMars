-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_FounderStageDone",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/14_fungal_farm.tga",
	Prerequisites = {
		PlaceObj('PickWorker', {
			'ParentBuildingLabel', "FungalFarm",
			'WorkerConditions', {
				PlaceObj('HasTrait', {
					'Trait', "Male",
				}),
				PlaceObj('HasTrait', {
					'Trait', "Alcoholic",
				}),
			},
		}),
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'Filters', {},
			'Condition', "<=",
			'Amount', 100,
		}),
	},
	ScriptDone = true,
	Text = T(901953834498, --[[StoryBit Fungahol Text]] "We will definitely bring Mr. <DisplayName> to your attention, if only we could catch him sober enough...\n\nYet his still apparatus is an example for an amazingly simple and effective design. It’s a shame he didn’t focus these skills on his work."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(807550739670, --[[StoryBit Fungahol Title]] "Fungahol"),
	VoicedText = T(992498811031, --[[voice:narrator]] "A Colonist has discovered a new way to use fungal waste by-products in order to create alcohol. "),
	group = "Colonists",
	id = "Fungahol",
	PlaceObj('StoryBitReply', {
		'Text', T(614026050258, --[[StoryBit Fungahol Text]] "Destroy the still and forbid such experiments."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(101452796812, --[[StoryBit Fungahol CustomOutcomeText]] "<DisplayName> loses Sanity"),
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "sanity",
		'Value', -50,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ModifyColonistStat', {
				'Stat', "Sanity",
				'Amount', "<sanity>",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(225319379638, --[[StoryBit Fungahol Text]] "Does it have a good kick? People may enjoy some distraction."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(682610105617, --[[StoryBit Fungahol CustomOutcomeText]] "<DisplayName> becomes Guru"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"Fungahol_FollowUp",
		},
		'Effects', {
			PlaceObj('AddTrait', {
				'Trait', "Guru",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(448447666755, --[[StoryBit Fungahol Text]] "Sounds cool. We should advertise this as a unique local beverage!"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(432408400957, --[[StoryBit Fungahol CustomOutcomeText]] "<DisplayName> becomes Guru, <applicant_tourist> Tourist Applicants"),
		'Prerequisite', PlaceObj('IsCommander2', {
			'CommanderProfile1', "citymayor",
			'CommanderProfile2', "oligarch",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"Fungahol_FollowUp",
		},
		'Effects', {
			PlaceObj('AddTrait', {
				'Trait', "Guru",
			}),
			PlaceObj('RewardApplicants', {
				'Amount', "<applicant_tourist>",
				'Trait', "Tourist",
			}),
			PlaceObj('RewardApplicants', {
				'Amount', "<applicant_alcohol>",
				'Trait', "Alcoholic",
			}),
		},
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "applicant_tourist",
		'Value', 100,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "applicant_alcohol",
		'Value', 20,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(211624421150, --[[StoryBit Fungahol Text]] "This design can be improved. Mars deserves the first hangover-free alcohol!"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(222726070206, --[[StoryBit Fungahol CustomOutcomeText]] "<DisplayName> becomes Guru; Spacebar +<spacebar_comfort> Service Comfort"),
		'Prerequisite', PlaceObj('IsCommander2', {
			'CommanderProfile1', "author",
			'CommanderProfile2', "doctor",
		}),
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "spacebar_comfort",
		'Value', 10,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"Fungahol_FollowUp",
		},
		'Effects', {
			PlaceObj('AddTrait', {
				'Trait', "Guru",
			}),
			PlaceObj('ModifyLabel', {
				'Label', "Spacebar",
				'Prop', "service_comfort",
				'Amount', "<spacebar_comfort>",
			}),
		},
	}),
})

