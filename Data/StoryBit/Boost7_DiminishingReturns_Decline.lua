-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Delay = 14400000,
	Effects = {},
	InheritsObject = false,
	Prerequisites = {
		PlaceObj('CheckResource', {
			'Resource', "Funding",
			'Amount', "<cost>",
		}),
		PlaceObj('CheckTechStatus', {
			'Field', "Breakthroughs",
			'TechId', "PrefabCompression",
			'Status', "unknown",
		}),
	},
	ScriptDone = true,
	SelectObject = false,
	Text = T(298755595962, --[[StoryBit Boost7_DiminishingReturns_Decline Text]] "This technology will allow us to transport prefabs of monumental Spire buildings from Earth. We will have to pay quite a lot to license it for use on Mars."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(765287049417, --[[StoryBit Boost7_DiminishingReturns_Decline Title]] "Diminishing Returns"),
	VoicedText = T(152993529896, --[[voice:narrator]] "In a recent news article it became apparent that the Prefab Compression technology has become a commercial reality on Earth."),
	group = "Pre-Founder Stage",
	id = "Boost7_DiminishingReturns_Decline",
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
				time = 1549987846,
				user = "Lina",
			},
			{
				action = "Modified",
				time = 1550051159,
				user = "Momchil",
			},
			{
				action = "Modified",
				time = 1550490015,
				user = "Blizzard",
			},
		},
	}),
	PlaceObj('StoryBitParamFunding', {
		'Name', "cost",
		'Value', 1000000000,
	}),
	PlaceObj('StoryBitParamFunding', {
		'Name', "oligarch_cost",
		'Value', 350000000,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(12237, --[[StoryBit Boost7_DiminishingReturns_Decline Text]] "Decline."),
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(161953209991, --[[StoryBit Boost7_DiminishingReturns_Decline Text]] "License it."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(978276703260, --[[StoryBit Boost7_DiminishingReturns_Decline CustomOutcomeText]] "research the Prefab Compression Breakthrough tech"),
		'Cost', "<cost>",
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardTech', {
				'Field', "Breakthroughs",
				'Research', "PrefabCompression",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(837599279496, --[[StoryBit Boost7_DiminishingReturns_Decline Text]] "License it after aggressive negotiations."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(669768229484, --[[StoryBit Boost7_DiminishingReturns_Decline CustomOutcomeText]] "research the Prefab Compression Breakthrough tech"),
		'Cost', "<oligarch_cost>",
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "oligarch",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardTech', {
				'Field', "Breakthroughs",
				'Research', "PrefabCompression",
			}),
		},
	}),
})

