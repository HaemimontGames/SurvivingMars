-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_FounderStageDone",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/02_video_call_2.tga",
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'Filters', {},
			'Condition', ">=",
			'Amount', 300,
		}),
		PlaceObj('CheckTechStatus', {
			'Field', "Social",
			'TechId', "DreamReality",
			'Negate', true,
		}),
		PlaceObj('CheckResource', {
			'Resource', "Funding",
			'Amount', "<requested_funds>",
		}),
		PlaceObj('IsSponsors', {
			'Sponsors', {
				"BlueSun",
				"CNSA",
				"ISRO",
				"Roscosmos",
			},
		}),
		PlaceObj('SupplyMissionsEnabled', nil),
	},
	ScriptDone = true,
	Text = T(629928711723, --[[StoryBit InvestmentOpportunity Text]] "Word is that they are about to unveil a new virtual reality tech called DreamWeb. If this new tech fad catches on, it could become bigger than anything that Microsoft or Apple had ever done!\n\nOne sympathizer of our colony shared this information with us fairly early on, giving us the opportunity to invest and make a lot of money. But make no mistake, at the end of the day this is all highly speculative. If DreamWeb tanks, we will almost certainly lose most of the invested funds."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(271983493200, --[[StoryBit InvestmentOpportunity Title]] "Investment Opportunity"),
	VoicedText = T(234249987527, --[[voice:narrator]] "On Earth, a new company is making waves on the stock market. "),
	group = "Sponsor",
	id = "InvestmentOpportunity",
	PlaceObj('StoryBitParamFunding', {
		'Name', "requested_funds",
		'Value', 500000000,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(105204324977, --[[StoryBit InvestmentOpportunity Text]] "Sounds promising, we should invest."),
		'Cost', "<requested_funds>",
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 50,
		'Enables', {
			"InvestmentOpportunity_FailedReturn",
		},
		'Effects', {},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 45,
		'Enables', {
			"InvestmentOpportunity_GoodReturn",
		},
		'Effects', {},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 5,
		'Enables', {
			"InvestmentOpportunity_GreatReturn",
		},
		'Effects', {},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(839026293408, --[[StoryBit InvestmentOpportunity Text]] " We are not in the gambling business. Pass."),
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(651297334336, --[[StoryBit InvestmentOpportunity Text]] "Send this sympathizer a bottle of something nice and get Blue Sun's tech team on the comm. We'll ride the hype train with a product of our own."),
		'Prerequisite', PlaceObj('IsSponsor', {
			'SponsorName', "BlueSun",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"InvestmentOpportunity_BlueSun",
		},
		'Effects', {},
	}),
})

