-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_BeforeFounders",
	Disables = {
		"Boost12_DarkSideSun",
	},
	Effects = {},
	EnableChance = 40,
	Enabled = true,
	Image = "UI/Messages/colony_founding.tga",
	Prerequisites = {},
	ScriptDone = true,
	Text = T(771648929505, --[[StoryBit Boost11_OtherSideSun Text]] "The ink has almost completely vanished, but with extra effort and creativity you manage to press through.\n\nIn the distant 1973 an isolated country made a secret landing on Mars in preparation for further colonization of the entire Solar system!\n\nLed personally by the Great Leader Himself, their tireless engineers created many wonders of architecture and creativity. This deed was made possible only by the eternal wisdom and guidance of the Great Leader!"),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(557787200675, --[[StoryBit Boost11_OtherSideSun Title]] "The Other Side of the Sun"),
	VoicedText = T(406797731077, --[[voice:narrator]] "While sifting through the red dust, our Drones discovered the remains of an old concrete bunker. The treasure inside is a folder of old documents."),
	group = "Pre-Founder Stage",
	id = "Boost11_OtherSideSun",
	qa_info = PlaceObj('PresetQAInfo', {
		data = {
			{
				action = "Modified",
				time = 1549880134,
				user = "Momchil",
			},
			{
				action = "Modified",
				time = 1550053658,
				user = "Momchil",
			},
			{
				action = "Verified",
				time = 1550056994,
				user = "Lina",
			},
			{
				action = "Modified",
				time = 1550491629,
				user = "Blizzard",
			},
			{
				action = "Modified",
				time = 1551959261,
				user = "Radomir",
			},
		},
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "tanks",
		'Value', 4,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "rechargestations",
		'Value', 10,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "statuesandgardens",
		'Value', 40,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(463146563081, --[[StoryBit Boost11_OtherSideSun Text]] "Thank you, Glorious Leader!"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(776958472119, --[[StoryBit Boost11_OtherSideSun CustomOutcomeText]] "gain <rechargestations> Recharge Station prefabs, reveals techs in the Robotics tree"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardPrefab', {
				'Amount', "<rechargestations>",
				'Prefab', "RechargeStation",
			}),
			PlaceObj('RevealNextTechInField', {
				'Field', "Robotics",
				'Amount', 3,
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(998738848563, --[[StoryBit Boost11_OtherSideSun Text]] "Thank you, Glorious Leader!"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(555966538256, --[[StoryBit Boost11_OtherSideSun CustomOutcomeText]] "gain <tanks> Water Tower and <tanks> Oxygen Tank prefabs, reveals tech in the Engineering tree"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardPrefab', {
				'Amount', "<tanks>",
				'Prefab', "WaterTank",
			}),
			PlaceObj('RewardPrefab', {
				'Amount', "<tanks>",
				'Prefab', "OxygenTank",
			}),
			PlaceObj('RevealNextTechInField', {
				'Field', "Engineering",
				'Amount', 3,
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(267655385115, --[[StoryBit Boost11_OtherSideSun Text]] "Thank you, Glorious Leader!"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(101146018367, --[[StoryBit Boost11_OtherSideSun CustomOutcomeText]] "gain <statuesandgardens> Statue prefabs, reveals tech in the Social tree"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardPrefab', {
				'Amount', "<statuesandgardens>",
				'Prefab', "Statue",
			}),
			PlaceObj('RevealNextTechInField', {
				'Field', "Social",
				'Amount', 3,
			}),
		},
	}),
})

