-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {},
	Prerequisites = {
		PlaceObj('IsTechId', {
			'Field', "Storybits",
			'TechId', "ResearchCooperation",
		}),
	},
	ScriptDone = true,
	TextReadyForValidation = true,
	TextsDone = true,
	Trigger = "TechResearchedTrigger",
	VoicedText = T(916866866299, --[[voice:narrator]] "Lambda Industries is immensely satisfied with our helping hand in the data analysis and wish to repay us with a reward of our choosing."),
	group = "Pre-Founder Stage",
	id = "Boost18_ResearchCooperation_Finale",
	max_reply_id = 3,
	qa_info = PlaceObj('PresetQAInfo', {
		data = {
			{
				action = "Modified",
				time = 1550049900,
				user = "Boyan",
			},
			{
				action = "Modified",
				time = 1549984138,
				user = "Kmilushev",
			},
			{
				action = "Modified",
				time = 1550054589,
				user = "Boyan",
			},
			{
				action = "Verified",
				time = 1550059206,
				user = "Kmilushev",
			},
			{
				action = "Modified",
				time = 1550491863,
				user = "Boyan",
			},
			{
				action = "Modified",
				time = 1550493831,
				user = "Blizzard",
			},
		},
	}),
	PlaceObj('StoryBitParamResearchPoints', {
		'Name', "sponsorresearch",
		'Value', 100,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "outsourcereduction",
		'Value', -20,
	}),
	PlaceObj('StoryBitParamFunding', {
		'Name', "moneys",
		'Value', 500000000,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(415677651028, --[[StoryBit Boost18_ResearchCooperation_Finale Text]] "We could use a helpful hand with our own research projects."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(747881156950, --[[StoryBit Boost18_ResearchCooperation_Finale CustomOutcomeText]] "<research(sponsorresearch)> Sponsor Research"),
		'unique_id', 1,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardSponsorResearch', {
				'Amount', 100,
				'ModifyId', "Research_Cooperation",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(147684209744, --[[StoryBit Boost18_ResearchCooperation_Finale Text]] "How about a discount on outsourcing projects."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(404477208554, --[[StoryBit Boost18_ResearchCooperation_Finale CustomOutcomeText]] "<outsourcereduction>% research outsource cost"),
		'unique_id', 2,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ModifyConst', {
				'Const', "OutsourceResearchCost",
				'Percent', "<outsourcereduction>",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(817892778642, --[[StoryBit Boost18_ResearchCooperation_Finale Text]] "Money will do fine."),
		'OutcomeText', "auto",
		'unique_id', 3,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardFunding', {
				'Amount', "<moneys>",
			}),
		},
	}),
})

