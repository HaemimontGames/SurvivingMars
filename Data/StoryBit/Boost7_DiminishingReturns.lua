-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_BeforeFounders",
	Effects = {},
	EnableChance = 40,
	Enabled = true,
	Image = "UI/Messages/Events/21_meteors.tga",
	Prerequisites = {
		PlaceObj('CheckTechStatus', {
			'Field', "Breakthroughs",
			'TechId', "PrefabCompression",
			'Status', "unknown",
		}),
	},
	ScriptDone = true,
	Text = T(418636798137, --[[StoryBit Boost7_DiminishingReturns Text]] "They want to outsource the R&D of their newest project “Prefab Compression” - a technology that could potentially allow us to transport prefabs of monumental buildings from Earth. They have a list of specific requirements which makes us the best candidate for this – our colony is remote, far from prying eyes, almost depopulated in case of nanite contamination and you would hardly break an agreement of confidentiality."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(457039863534, --[[StoryBit Boost7_DiminishingReturns Title]] "Diminishing Returns"),
	VoicedText = T(204197070048, --[[voice:narrator]] "One of the leading companies in the field of nanotechnology and miniaturization has made you an interesting offer."),
	group = "Pre-Founder Stage",
	id = "Boost7_DiminishingReturns",
	qa_info = PlaceObj('PresetQAInfo', {
		data = {
			{
				action = "Modified",
				time = 1549880873,
				user = "Momchil",
			},
			{
				action = "Modified",
				time = 1549981013,
				user = "Lina",
			},
			{
				action = "Verified",
				time = 1549983066,
				user = "Lina",
			},
			{
				action = "Modified",
				time = 1550051273,
				user = "Momchil",
			},
			{
				action = "Modified",
				time = 1550489954,
				user = "Blizzard",
			},
			{
				action = "Modified",
				time = 1551966782,
				user = "Radomir",
			},
		},
	}),
	PlaceObj('StoryBitParamResearchPoints', {
		'Name', "logistics",
		'Value', 150,
	}),
	PlaceObj('StoryBitParamFunding', {
		'Name', "advance",
		'Value', 500000000,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(529294716909, --[[StoryBit Boost7_DiminishingReturns Text]] "Decline."),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"Boost7_DiminishingReturns_Decline",
		},
		'Effects', {},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(638469984152, --[[StoryBit Boost7_DiminishingReturns Text]] "Accept and request an advance."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(598934057404, --[[StoryBit Boost7_DiminishingReturns CustomOutcomeText]] "gain <funding(advance)>, reveals the Breakthrough Prefab Compression"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"Boost7_DiminishingReturns_Success",
		},
		'Effects', {
			PlaceObj('RewardFunding', {
				'Amount', "<advance>",
			}),
			PlaceObj('DiscoverTech', {
				'Field', "Breakthroughs",
				'Tech', "PrefabCompression",
				'Cost', 10000,
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(502039835747, --[[StoryBit Boost7_DiminishingReturns Text]] "Accept and request logistics aid."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(242706034397, --[[StoryBit Boost7_DiminishingReturns CustomOutcomeText]] "gain <research(logistics)> Sponsor Research, reveals the Breakthrough Prefab Compression"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"Boost7_DiminishingReturns_Success",
		},
		'Effects', {
			PlaceObj('DiscoverTech', {
				'Field', "Breakthroughs",
				'Tech', "PrefabCompression",
				'Cost', 10000,
			}),
			PlaceObj('RewardSponsorResearch', {
				'Amount', 150,
			}),
		},
	}),
})

