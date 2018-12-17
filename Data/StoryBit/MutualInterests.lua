-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_FounderStageDone",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/01_video_call.tga",
	Prerequisites = {
		PlaceObj('IsSponsors', {
			'Sponsors', {
				"BlueSun",
				"CNSA",
				"ISRO",
				"Roscosmos",
			},
		}),
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'Filters', {},
			'Condition', "<=",
			'Amount', 100,
		}),
		PlaceObj('CheckResource', {
			'Condition', "<=",
			'Resource', "Funding",
			'Amount', "<trigger_funding>",
		}),
		PlaceObj('SupplyMissionsEnabled', nil),
	},
	ScriptDone = true,
	Text = T(380399730133, --[[StoryBit MutualInterests Text]] "The offer goes like this:\n\n<funding(offered_funding)> in exchange for <base_price_reduction>% of all revenue earned from any Rare Metal exports we make in the future.  "),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(986839457225, --[[StoryBit MutualInterests Title]] "Mutual Interests"),
	VoicedText = T(773465986129, --[[voice:narrator]] "A multi-billionaire and entrepreneur from Earth has caught wind of our financial troubles and is willing to lend a helping hand. For a price, of course."),
	group = "Sponsor",
	id = "MutualInterests",
	PlaceObj('StoryBitParamFunding', {
		'Name', "trigger_funding",
		'Value', 300000000,
	}),
	PlaceObj('StoryBitParamFunding', {
		'Name', "offered_funding",
		'Value', 2000000000,
	}),
	PlaceObj('StoryBitParamPercent', {
		'Name', "base_price_reduction",
		'Value', -10,
	}),
	PlaceObj('StoryBitParamPercent', {
		'Name', "oligarch_price_reduction",
		'Value', -5,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(626591313491, --[[StoryBit MutualInterests Text]] "We are not in the position to bargain. Agree to their terms."),
		'Comment', "if we decide we can make the price lower only for a limited duration",
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ModifyConst', {
				'Const', "ExportPricePreciousMetals",
				'Percent', "<base_price_reduction>",
				'ModifyId', "MutualInterests",
			}),
			PlaceObj('RewardFunding', {
				'Amount', "<offered_funding>",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(388265064266, --[[StoryBit MutualInterests Text]] "Heh, I know them. We offer <oligarch_price_reduction>% commission and their secrets will remain such."),
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "oligarch",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ModifyConst', {
				'Const', "ExportPricePreciousMetals",
				'Percent', "<oligarch_price_reduction>",
				'ModifyId', "MutualInterests",
			}),
			PlaceObj('RewardFunding', {
				'Amount', "<offered_funding>",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(250524918480, --[[StoryBit MutualInterests Text]] "These vultures want to take advantage of us. Decline!"),
	}),
})

