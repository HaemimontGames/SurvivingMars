-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_BeforeFounders",
	Effects = {
		PlaceObj('DiscoverTech', {
			'Field', "Physics",
			'Tech', "ExtractorAmplification",
		}),
		PlaceObj('RewardTechBoost', {
			'Field', "Physics",
			'Research', "ExtractorAmplification",
			'Amount', 50,
		}),
	},
	EnableChance = 40,
	Enabled = true,
	Image = "UI/Messages/hints.tga",
	Prerequisites = {},
	ScriptDone = true,
	Text = T(754140094868, --[[StoryBit Boost14_MandatoryUpgrades Text]] "The Extractor Amplification project has received a massive funding increase and a lot of scientific focus has been shifted towards it. The top brass wants you to begin installing the new upgrades as soon as possible.\n\n<effect>The tech Extractor Amplification has been revealed and it costs <extractor_discount>% less."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(209192312346, --[[StoryBit Boost14_MandatoryUpgrades Title]] "Mandatory Upgrades"),
	VoicedText = T(692741143557, --[[voice:narrator]] "The Mission HQ on Earth has declared the effectiveness of our resource extraction as main priority."),
	group = "Pre-Founder Stage",
	id = "Boost14_MandatoryUpgrades",
	qa_info = PlaceObj('PresetQAInfo', {
		data = {
			{
				action = "Modified",
				time = 1549880190,
				user = "Momchil",
			},
			{
				action = "Modified",
				time = 1549966361,
				user = "Kmilushev",
			},
			{
				action = "Verified",
				time = 1549970703,
				user = "Kmilushev",
			},
			{
				action = "Modified",
				time = 1550492047,
				user = "Blizzard",
			},
			{
				action = "Modified",
				time = 1551964089,
				user = "Radomir",
			},
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(351840329473, --[[StoryBit Boost14_MandatoryUpgrades Text]] "Request materials."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(585295715697, --[[StoryBit Boost14_MandatoryUpgrades CustomOutcomeText]] "gain a Supply Pod with <drones> Drones and <polymers> Polymers"),
	}),
	PlaceObj('StoryBitParamPercent', {
		'Name', "extractor_discount",
		'Value', 50,
	}),
	PlaceObj('StoryBitParamPercent', {
		'Name', "others_discount",
		'Value', 20,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "drones",
		'Value', 10,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "polymers",
		'Value', 60,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('SpawnRocketInOrbit', {
				'is_supply_pod', true,
				'cargo_list', {
					PlaceObj('RocketCargoItem', {
						'cargo', "Drone",
						'amount', 10,
					}),
					PlaceObj('RocketCargoItem', {
						'cargo', "Polymers",
						'amount', 60,
					}),
				},
				'AssociateWithStoryBit', false,
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(689754585441, --[[StoryBit Boost14_MandatoryUpgrades Text]] "Request scientific grants."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(314617657823, --[[StoryBit Boost14_MandatoryUpgrades CustomOutcomeText]] "reveals the rest of the Amplification techs and they cost <others_discount>% less"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('DiscoverTech', {
				'Field', "Physics",
				'Tech', "FactoryAmplification",
			}),
			PlaceObj('DiscoverTech', {
				'Field', "Physics",
				'Tech', "ResearchAmplification",
			}),
			PlaceObj('RewardTechBoost', {
				'Field', "Physics",
				'Research', "FactoryAmplification",
				'Amount', 20,
			}),
			PlaceObj('RewardTechBoost', {
				'Field', "Physics",
				'Research', "ResearchAmplification",
				'Amount', 20,
			}),
		},
	}),
})

