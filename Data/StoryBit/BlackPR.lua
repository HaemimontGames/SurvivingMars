-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_FounderStageDone",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/03_discussion.tga",
	Prerequisites = {
		PlaceObj('IsSponsors', {
			'Sponsors', {
				"IMM",
				"SpaceY",
				"NewArk",
				"Brazil",
			},
		}),
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'Filters', {},
			'Condition', "<",
			'Amount', 100,
		}),
		PlaceObj('SupplyMissionsEnabled', nil),
	},
	ScriptDone = true,
	Text = T{271424986819, --[[StoryBit BlackPR Text]] "Perhaps it all started on a slow news days, perhaps journalists on Earth are just bitter, but various prominent news networks all over the globe have been openly criticizing our mission and questioning every aspect of it – from its economic feasibility to its necessity for the future of the human race.\n\nOur sponsor is deflecting blows left and right and has formally requested that we break our silence and hold a press conference."},
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T{753343622372, --[[StoryBit BlackPR Title]] "Black PR"},
	VoicedText = T{912519929383, --[[voice:narrator]] "Our colony has come under media fire by a global news conglomerate. "},
	group = "Sponsor",
	id = "BlackPR",
	PlaceObj('StoryBitReply', {
		'Text', T{951841540318, --[[StoryBit BlackPR Text]] "We will dare to dream!"},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{922240221345, --[[StoryBit BlackPR CustomOutcomeText]] "attract Applicants"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardApplicants', {
				'Amount', 50,
			}),
		},
	}),
	PlaceObj('StoryBitParamFunding', {
		'Name', "reward_funding",
		'Value', 500000000,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{891962457395, --[[StoryBit BlackPR Text]] "Yes, there are challenges to overcome, but humanity is ready for the ultimate test."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{303564073505, --[[StoryBit BlackPR CustomOutcomeText]] "get <funding(reward_funding)>"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardFunding', {
				'Amount', "<reward_funding>",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{554550946036, --[[StoryBit BlackPR Text]] "Your faith can move mountains and your doubt can create them."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{256582095446, --[[StoryBit BlackPR CustomOutcomeText]] "get <funding(reward_newark)>"},
		'Prerequisite', PlaceObj('IsSponsor', {
			'SponsorName', "NewArk",
		}),
	}),
	PlaceObj('StoryBitParamFunding', {
		'Name', "reward_newark",
		'Value', 800000000,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardFunding', {
				'Amount', "<reward_newark>",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{129762610121, --[[StoryBit BlackPR Text]] "As a great man once said, humans need to be a multiplanetary species."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{263503051645, --[[StoryBit BlackPR CustomOutcomeText]] "get factory Prefabs"},
		'Prerequisite', PlaceObj('IsSponsor', {
			'SponsorName', "SpaceY",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardPrefab', {
				'Amount', 1,
				'Prefab', "PolymerPlant",
			}),
			PlaceObj('RewardPrefab', {
				'Amount', 1,
				'Prefab', "ElectronicsFactory",
			}),
			PlaceObj('RewardPrefab', {
				'Amount', 1,
				'Prefab', "MachinePartsFactory",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{309878440227, --[[StoryBit BlackPR Text]] "We would not grace them with a reply."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{979805883702, --[[StoryBit BlackPR CustomOutcomeText]] "no effect"},
	}),
})

