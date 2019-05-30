-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_BeforeFounders",
	Effects = {},
	EnableChance = 40,
	Enabled = true,
	Enables = {
		"Boost15_ColonyInvestmentFollowup",
	},
	Image = "UI/Messages/Events/01_video_call.tga",
	Prerequisites = {
		PlaceObj('CheckResource', {
			'Condition', "<=",
			'Resource', "Funding",
			'Amount', 500000000,
		}),
	},
	ScriptDone = true,
	Text = T(109851937466, --[[StoryBit Boost15_ColonyInvestment Text]] "No matter how much you bang your head against the wall, the budget charts don’t start to make sense. We are severely overstretched. What are they thinking! Do they think colonizing Mars is a walk in the… then the call comes in.\n\nThe mission’s board has decided to bail us out after catching wind of your financial woes, and not a moment too soon.\n\nYou give out a sigh of relief."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(201837685410, --[[StoryBit Boost15_ColonyInvestment Title]] "Colony Investment"),
	VoicedText = T(488586618641, --[[voice:narrator]] "Slash it... Spread it... Prioritize... Then start all over again."),
	group = "Pre-Founder Stage",
	id = "Boost15_ColonyInvestment",
	max_reply_id = 3,
	qa_info = PlaceObj('PresetQAInfo', {
		data = {
			{
				action = "Modified",
				time = 1549623566,
				user = "Boyan",
			},
			{
				action = "Modified",
				time = 1549984138,
				user = "Kmilushev",
			},
			{
				action = "Modified",
				time = 1550491862,
				user = "Boyan",
			},
			{
				action = "Modified",
				time = 1550492835,
				user = "Blizzard",
			},
			{
				action = "Modified",
				time = 1550752016,
				user = "Boyan",
			},
			{
				action = "Modified",
				time = 1551964089,
				user = "Radomir",
			},
		},
	}),
	PlaceObj('StoryBitParamFunding', {
		'Name', "basereward",
		'Value', 500000000,
	}),
	PlaceObj('StoryBitParamFunding', {
		'Name', "bluesunreward",
		'Value', 2000000000,
	}),
	PlaceObj('StoryBitParamResearchPoints', {
		'Name', "sponsorreserachreward",
		'Value', 100,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(636146241083, --[[StoryBit Boost15_ColonyInvestment Text]] "Sure, take your time."),
		'OutcomeText', "auto",
		'unique_id', 1,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardFunding', {
				'Amount', "<basereward>",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(320565583039, --[[StoryBit Boost15_ColonyInvestment Text]] "It is the lack of knowledge that burdens us more."),
		'OutcomeText', "auto",
		'unique_id', 2,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardSponsorResearch', {
				'Amount', 100,
				'ModifyId', "Colony_Investment",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(455932341890, --[[StoryBit Boost15_ColonyInvestment Text]] "Threaten to submit report of gross failure unless further funding is secured."),
		'OutcomeText', "auto",
		'Prerequisite', PlaceObj('IsSponsor', {
			'SponsorName', "BlueSun",
		}),
		'unique_id', 3,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardFunding', {
				'Amount', "<bluesunreward>",
			}),
		},
	}),
})

