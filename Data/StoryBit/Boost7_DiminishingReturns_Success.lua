-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {},
	Prerequisites = {
		PlaceObj('IsTechId', {
			'Field', "Breakthroughs",
			'TechId', "PrefabCompression",
		}),
	},
	ScriptDone = true,
	Text = T(131161849926, --[[StoryBit Boost7_DiminishingReturns_Success Text]] "They want to close the deal as soon as possible and obtain the intellectual property on the research, and offer you several final payment options."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(777867363093, --[[StoryBit Boost7_DiminishingReturns_Success Title]] "Diminishing Returns"),
	Trigger = "TechResearchedTrigger",
	VoicedText = T(613945381819, --[[voice:narrator]] "The Prefab Compression project has demonstrated immense potential for commercial expansion and your partners are quite happy about it."),
	group = "Pre-Founder Stage",
	id = "Boost7_DiminishingReturns_Success",
	qa_info = PlaceObj('PresetQAInfo', {
		data = {
			{
				action = "Modified",
				time = 1549880873,
				user = "Momchil",
			},
			{
				action = "Modified",
				time = 1549984138,
				user = "Kmilushev",
			},
			{
				action = "Verified",
				time = 1549987850,
				user = "Lina",
			},
			{
				action = "Modified",
				time = 1550490292,
				user = "Blizzard",
			},
		},
	}),
	PlaceObj('StoryBitParamFunding', {
		'Name', "direct_payment",
		'Value', 500000000,
	}),
	PlaceObj('StoryBitParamPercent', {
		'Name', "boost",
		'Value', 35,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "arcologies",
		'Value', 2,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "stirlings",
		'Value', 5,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(838024366453, --[[StoryBit Boost7_DiminishingReturns_Success Text]] "Direct payment."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(356607953277, --[[StoryBit Boost7_DiminishingReturns_Success CustomOutcomeText]] "gain <funding(direct_payment)>"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardFunding', {
				'Amount', "<direct_payment>",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(916749725800, --[[StoryBit Boost7_DiminishingReturns_Success Text]] "Payment in royalties."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(993109934364, --[[StoryBit Boost7_DiminishingReturns_Success CustomOutcomeText]] "the Martian Patents tech costs <boost>% less"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardTechBoost', {
				'Field', "Social",
				'Research', "MartianPatents",
				'Amount', 35,
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(121944684700, --[[StoryBit Boost7_DiminishingReturns_Success Text]] "Logistics aid."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(723404829087, --[[StoryBit Boost7_DiminishingReturns_Success CustomOutcomeText]] "gain <arcologies> Arcology Prefabs and <stirlings> Stirling Generator Prefabs"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardPrefab', {
				'Amount', "<arcologies>",
				'Prefab', "Arcology",
			}),
			PlaceObj('RewardPrefab', {
				'Amount', "<stirlings>",
				'Prefab', "StirlingGenerator",
			}),
		},
	}),
})

