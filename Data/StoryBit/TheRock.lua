-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_FounderStageDone",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/meteors.tga",
	Prerequisites = {
		PlaceObj('PickFromLabel', {
			'Label', "Colonist",
			'Conditions', {
				PlaceObj('HasTrait', {
					'Trait', "Child",
					'Negate', true,
				}),
				PlaceObj('HasTrait', {
					'Trait', "Celebrity",
					'Negate', true,
				}),
			},
		}),
		PlaceObj('SupplyMissionsEnabled', nil),
	},
	ScriptDone = true,
	Text = T{434622504972, --[[StoryBit TheRock Text]] "Several influencers on the social networks had asked about your viewpoint. What would you reply?"},
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T{250539297830, --[[StoryBit TheRock Title]] "The Rock"},
	VoicedText = T{230630993939, --[[voice:narrator]] "A huge chunk of rock has been spotted near the planet. It has a highly unusual shape and the Internet has gone crazy with speculations about its nature."},
	group = "Earth",
	id = "TheRock",
	PlaceObj('StoryBitReply', {
		'Text', T{146557117171, --[[StoryBit TheRock Text]] "Actually, our colleague <DisplayName> can explain this better."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{705966573496, --[[StoryBit TheRock CustomOutcomeText]] "they become a Celebrity"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('AddTrait', {
				'Trait', "Celebrity",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{210613657044, --[[StoryBit TheRock Text]] "Come and see yourselves!"},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{770522775412, --[[StoryBit TheRock CustomOutcomeText]] "<tourist_people> Tourist applicants"},
		'Prerequisite', PlaceObj('CheckBuildingCount', {
			'Building', "OmegaTelescope",
			'Amount', 1,
		}),
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "tourist_people",
		'Value', 50,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardApplicants', {
				'Amount', "<tourist_people>",
				'Trait', "Tourist",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{955209688256, --[[StoryBit TheRock Text]] "A plain rock. Ideal for carving names on it - for a price!"},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{522030725423, --[[StoryBit TheRock CustomOutcomeText]] "gain <funding(funding_gain)>"},
		'Prerequisite', PlaceObj('CheckBuildingCount', {
			'Building', "MDSLaser",
			'Amount', 5,
		}),
	}),
	PlaceObj('StoryBitParamFunding', {
		'Name', "funding_gain",
		'Value', 500000000,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardFunding', {
				'Amount', "<funding_gain>",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{435026120945, --[[StoryBit TheRock Text]] "We'll place it in orbit so people can admire it forever. Because it's cool!"},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{543016386869, --[[StoryBit TheRock CustomOutcomeText]] "gain <enthusiasts> Enthusiast applicants and <funding(cool_funding)>"},
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "rocketscientist",
		}),
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "enthusiasts",
		'Value', 50,
	}),
	PlaceObj('StoryBitParamFunding', {
		'Name', "cool_funding",
		'Value', 750000000,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardFunding', {
				'Amount', "<cool_funding>",
			}),
			PlaceObj('RewardApplicants', {
				'Amount', "<enthusiasts>",
				'Trait', "Enthusiast",
			}),
		},
	}),
})

