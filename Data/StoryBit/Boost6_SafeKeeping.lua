-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_BeforeFounders",
	Effects = {},
	EnableChance = 40,
	Enabled = true,
	Image = "UI/Messages/Events/02_video_call_2.tga",
	Prerequisites = {},
	ScriptDone = true,
	Text = T(612362415360, --[[StoryBit Boost6_SafeKeeping Text]] "“Commander, we have an offer for you. Recently our organization has run into severe problems with one of our more delicate projects. We want you to take care of it.”\n\nAll in all, the mysterious man wants you to shelter a number of Clone applicants in your project, no questions asked, no answers given."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(242900907357, --[[StoryBit Boost6_SafeKeeping Title]] "Safe Keeping"),
	VoicedText = T(516223096443, --[[voice:narrator]] "The message screen is dark and only a vague silhouette of a bald man can be seen. The man speaks with a modulated voice."),
	group = "Pre-Founder Stage",
	id = "Boost6_SafeKeeping",
	qa_info = PlaceObj('PresetQAInfo', {
		data = {
			{
				action = "Modified",
				time = 1549880765,
				user = "Momchil",
			},
			{
				action = "Modified",
				time = 1549984138,
				user = "Kmilushev",
			},
			{
				action = "Verified",
				time = 1549987825,
				user = "Lina",
			},
			{
				action = "Modified",
				time = 1550489650,
				user = "Blizzard",
			},
			{
				action = "Modified",
				time = 1551966490,
				user = "Radomir",
			},
		},
	}),
	PlaceObj('StoryBitParamFunding', {
		'Name', "money_reward",
		'Value', 1000000000,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "clone_applicants",
		'Value', 10,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(586882778761, --[[StoryBit Boost6_SafeKeeping Text]] "Accept."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(578975104046, --[[StoryBit Boost6_SafeKeeping CustomOutcomeText]] "gain <funding(money_reward)> and <clone_applicants> Officer Clone applicants"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 20,
		'Enables', {
			"Boost6_SafeKeeping_Complication",
		},
		'Effects', {
			PlaceObj('RewardApplicants', {
				'Amount', "<clone_applicants>",
				'Trait', "Clone",
				'Specialization', "security",
			}),
			PlaceObj('RewardFunding', {
				'Amount', "<money_reward>",
			}),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 80,
		'Effects', {
			PlaceObj('RewardApplicants', {
				'Amount', "<clone_applicants>",
				'Trait', "Clone",
				'Specialization', "security",
			}),
			PlaceObj('RewardFunding', {
				'Amount', "<money_reward>",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(991773665637, --[[StoryBit Boost6_SafeKeeping Text]] "Accept and have a look at the medical data."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(990321363155, --[[StoryBit Boost6_SafeKeeping CustomOutcomeText]] "gain <funding(money_reward)> and <clone_applicants> Security Clone applicants; reveals the Breakthrough tech Cloning"),
		'Prerequisite', PlaceObj('IsCommander2', {
			'CommanderProfile1', "doctor",
			'CommanderProfile2', "inventor",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 20,
		'Enables', {
			"Boost6_SafeKeeping_Complication",
		},
		'Effects', {
			PlaceObj('RewardApplicants', {
				'Amount', "<clone_applicants>",
				'Trait', "Clone",
				'Specialization', "security",
			}),
			PlaceObj('RewardFunding', {
				'Amount', "<money_reward>",
			}),
			PlaceObj('DiscoverTech', {
				'Field', "Breakthroughs",
				'Tech', "Cloning",
			}),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 80,
		'Effects', {
			PlaceObj('RewardApplicants', {
				'Amount', "<clone_applicants>",
				'Trait', "Clone",
				'Specialization', "security",
			}),
			PlaceObj('RewardFunding', {
				'Amount', "<money_reward>",
			}),
			PlaceObj('DiscoverTech', {
				'Field', "Breakthroughs",
				'Tech', "Cloning",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(616074144012, --[[StoryBit Boost6_SafeKeeping Text]] "Decline."),
	}),
})

