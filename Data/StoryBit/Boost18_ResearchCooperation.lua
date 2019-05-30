-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_BeforeFounders",
	Effects = {},
	Enabled = true,
	Enables = {
		"Boost18_ResearchCooperation_Tech",
	},
	Image = "UI/Messages/space.tga",
	Prerequisites = {},
	ScriptDone = true,
	Text = T(180441673797, --[[StoryBit Boost18_ResearchCooperation Text]] "The company behind the telescope, Lambda Industries, has partnered with our sponsor to share the financial burden of the deep space launch.\n\nOur sponsor, not one to waste an opportunity to help their most ambitious project, says the splitting of the launch bill will basically pay for a single Supply Pod they can fill with cargo of our choosing.\n\nWhat do we pick?"),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(698041105984, --[[StoryBit Boost18_ResearchCooperation Title]] "Research Cooperation"),
	VoicedText = T(756850281236, --[[voice:narrator]] "A new deep-space telescope will be launched to scan the cosmos from a point even further out than Mars."),
	group = "Pre-Founder Stage",
	id = "Boost18_ResearchCooperation",
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
				time = 1549880032,
				user = "Boyan",
			},
			{
				action = "Modified",
				time = 1549984138,
				user = "Kmilushev",
			},
			{
				action = "Verified",
				time = 1550059203,
				user = "Kmilushev",
			},
			{
				action = "Modified",
				time = 1550491863,
				user = "Boyan",
			},
			{
				action = "Modified",
				time = 1550493669,
				user = "Blizzard",
			},
			{
				action = "Modified",
				time = 1551965115,
				user = "Radomir",
			},
		},
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "orbital_probes",
		'Value', 10,
	}),
	PlaceObj('StoryBitParamResource', {
		'Name', "resources_mp",
		'Value', 15000,
		'Resource', "machineparts",
	}),
	PlaceObj('StoryBitParamResource', {
		'Name', "resources_ele",
		'Value', 15000,
		'Resource', "electronics",
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(583664306608, --[[StoryBit Boost18_ResearchCooperation Text]] "We could use some help with sector scanning."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(615444876652, --[[StoryBit Boost18_ResearchCooperation CustomOutcomeText]] "<orbital_probes> Orbital Probes"),
		'unique_id', 1,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('SpawnRocketInOrbit', {
				'is_supply_pod', true,
				'cargo_list', {
					PlaceObj('RocketCargoItem', {
						'cargo', "OrbitalProbe",
						'amount', 10,
					}),
				},
				'AssociateWithStoryBit', false,
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(822369713406, --[[StoryBit Boost18_ResearchCooperation Text]] "Some extra resources would be welcome."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(361865775796, --[[StoryBit Boost18_ResearchCooperation CustomOutcomeText]] "<machineparts(resources_mp)> and <electronics(resources_ele)>"),
		'unique_id', 2,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('SpawnRocketInOrbit', {
				'is_supply_pod', true,
				'cargo_list', {
					PlaceObj('RocketCargoItem', {
						'cargo', "MachineParts",
						'amount', 15,
					}),
					PlaceObj('RocketCargoItem', {
						'cargo', "Electronics",
						'amount', 15,
					}),
				},
				'AssociateWithStoryBit', false,
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(770430881627, --[[StoryBit Boost18_ResearchCooperation Text]] "We can always find a use for an extra Transport."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(379884503103, --[[StoryBit Boost18_ResearchCooperation CustomOutcomeText]] "A new RC Transport"),
		'unique_id', 3,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('SpawnRocketInOrbit', {
				'is_supply_pod', true,
				'cargo_list', {
					PlaceObj('RocketCargoItem', {
						'cargo', "RCTransport",
						'amount', 1,
					}),
				},
				'AssociateWithStoryBit', false,
			}),
		},
	}),
})

