-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_BeforeFounders",
	Effects = {},
	EnableChance = 40,
	Enabled = true,
	Image = "UI/Messages/artificial_intelligence_mystery_02.tga",
	Prerequisites = {},
	ScriptDone = true,
	Text = T(317492104434, --[[StoryBit Boost9_Eureka Text]] "While looking for the glitch, your data technicians discovered the possibility to boost the performance of the program by running secondary analytical trials, just this once."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(941158028958, --[[StoryBit Boost9_Eureka Title]] "Eureka!"),
	VoicedText = T(377529619516, --[[voice:narrator]] "Our scientific analysis servers just crashed! We tried turning them off and on again, but the problem persisted after reboot."),
	group = "Pre-Founder Stage",
	id = "Boost9_Eureka",
	qa_info = PlaceObj('PresetQAInfo', {
		data = {
			{
				action = "Modified",
				time = 1549880926,
				user = "Momchil",
			},
			{
				action = "Modified",
				time = 1549984138,
				user = "Kmilushev",
			},
			{
				action = "Verified",
				time = 1549987856,
				user = "Lina",
			},
			{
				action = "Modified",
				time = 1550491362,
				user = "Blizzard",
			},
			{
				action = "Modified",
				time = 1551966819,
				user = "Radomir",
			},
			{
				action = "Modified",
				time = 1554901161,
				user = "Radomir",
			},
		},
	}),
	PlaceObj('StoryBitParamResearchPoints', {
		'Name', "sponsor_research",
		'Value', 100,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(193345244030, --[[StoryBit Boost9_Eureka Text]] "Improve the performance."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(620355360059, --[[StoryBit Boost9_Eureka CustomOutcomeText]] "gain <research(sponsor_research)> Sponsor research"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardSponsorResearch', {
				'Amount', 100,
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(189917588567, --[[StoryBit Boost9_Eureka Text]] "Focus on single topic."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(961435424262, --[[StoryBit Boost9_Eureka CustomOutcomeText]] "a random tech will be researched"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardTech', {
				'Field', "Biotech",
			}),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardTech', {
				'Field', "Engineering",
			}),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardTech', {
				'Field', "Physics",
			}),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardTech', {
				'Field', "Robotics",
			}),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardTech', {
				'Field', "Social",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(889407832580, --[[StoryBit Boost9_Eureka Text]] "Do various optimizations."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(854997226158, --[[StoryBit Boost9_Eureka CustomOutcomeText]] "reveals several techs in a random field"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RevealNextTechInField', {
				'Field', "Biotech",
				'Amount', 3,
			}),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RevealNextTechInField', {
				'Field', "Engineering",
				'Amount', 3,
			}),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RevealNextTechInField', {
				'Field', "Physics",
				'Amount', 3,
			}),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RevealNextTechInField', {
				'Field', "Robotics",
				'Amount', 3,
			}),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RevealNextTechInField', {
				'Field', "Social",
				'Amount', 3,
			}),
		},
	}),
})

