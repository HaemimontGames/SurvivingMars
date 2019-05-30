-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_BeforeFounders",
	Disables = {
		"Boost11_OtherSideSun",
	},
	Effects = {},
	EnableChance = 40,
	Enabled = true,
	Image = "UI/Messages/colony_founding.tga",
	Prerequisites = {},
	ScriptDone = true,
	Text = T(369279789795, --[[StoryBit Boost12_DarkSideSun Text]] "The ink has almost completely vanished, but with extra effort and creativity you manage to press through.\n\nIn the distant 1973 an isolated country made a secret landing on Mars in preparation for further colonization of the entire Solar system!\n\nUnder the watchful supervision of the Great Leader Himself, their genius scientists have discovered many marvels of the universe. They helped the Glorious Leader hold the atom in His hands and watched in awe as He conversed with the Universe itself about its nature, purpose and origin."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(334978193909, --[[StoryBit Boost12_DarkSideSun Title]] "The Dark Side of the Sun"),
	VoicedText = T(474564745763, --[[voice:narrator]] "While sifting through the red dust, your Drones discover the remains of an old concrete bunker. The treasure inside is a folder of old documents."),
	group = "Pre-Founder Stage",
	id = "Boost12_DarkSideSun",
	qa_info = PlaceObj('PresetQAInfo', {
		data = {
			{
				action = "Modified",
				time = 1549880156,
				user = "Momchil",
			},
			{
				action = "Modified",
				time = 1549974456,
				user = "Momchil",
			},
			{
				action = "Verified",
				time = 1550059189,
				user = "Kmilushev",
			},
			{
				action = "Modified",
				time = 1550491889,
				user = "Blizzard",
			},
			{
				action = "Modified",
				time = 1551959261,
				user = "Radomir",
			},
			{
				action = "Modified",
				time = 1554801986,
				user = "Momchil",
			},
		},
	}),
	PlaceObj('StoryBitParamResearchPoints', {
		'Name', "smallrp",
		'Value', 50,
	}),
	PlaceObj('StoryBitParamResearchPoints', {
		'Name', "bigrp",
		'Value', 150,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(626886649692, --[[StoryBit Boost12_DarkSideSun Text]] "Thank you, Glorious Leader!"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(329677357422, --[[StoryBit Boost12_DarkSideSun CustomOutcomeText]] "reveals technologies in the Biotech tree; gain <research(smallrp)> Sponsor research"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardSponsorResearch', {
				'Amount', 50,
			}),
			PlaceObj('RevealNextTechInField', {
				'Field', "Biotech",
				'Amount', 3,
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(486893019886, --[[StoryBit Boost12_DarkSideSun Text]] "Thank you, Glorious Leader!"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(940087920995, --[[StoryBit Boost12_DarkSideSun CustomOutcomeText]] "reveals technologies in the Physics tree; gain <research(smallrp)> Sponsor research"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardSponsorResearch', {
				'Amount', 50,
			}),
			PlaceObj('RevealNextTechInField', {
				'Field', "Physics",
				'Amount', 3,
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(280456698416, --[[StoryBit Boost12_DarkSideSun Text]] "Thank you, Glorious Leader!"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(842189578976, --[[StoryBit Boost12_DarkSideSun CustomOutcomeText]] "gain <research(bigrp)> Sponsor research"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardSponsorResearch', {
				'Amount', 150,
			}),
		},
	}),
})

