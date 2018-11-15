-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('PauseExpedition', nil),
	},
	Category = "PlanetaryAnomaly",
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/20_crashed_rocket.tga",
	Prerequisites = {},
	ScriptDone = true,
	Text = T{508840112037, --[[StoryBit TheDerelict Text]] "The rocket had smashed with its nose in the ground, leaving a miles-long trail behind before the red sand and rocks quenched the immense force of its inertia. The hull is damaged and twisted beyond recognition, rending all attempts to identify the vehicle useless. No information can be found about the crash on any international flight records, either.\n\nWe can order the hull to be investigated, but the only way to proceed is to cut through it with blow-torches, which could be dangerous in case there are any dangerous substances or remaining fuel on board."},
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T{742771251020, --[[StoryBit TheDerelict Title]] "The Derelict"},
	Trigger = "PlanetaryAnomalyEvent",
	VoicedText = T{675593494766, --[[voice:narrator]] "We have discovered the remains of a crashed rocket at the expedition location."},
	group = "Expeditions",
	id = "TheDerelict",
	PlaceObj('StoryBitReply', {
		'Text', T{461027303859, --[[StoryBit TheDerelict Text]] "Enter the remains and investigate!"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 50,
		'VoicedText', T{158776645197, --[[voice:narrator]] "The blow-torches ignite a fuel pocket inside the Rocket’s hull. Nothing could have survived the titanic explosion which followed."},
		'Text', T{387688567689, --[[StoryBit TheDerelict Text]] "<effect>The expedition has been lost."},
		'Effects', {
			PlaceObj('KillExpedition', nil),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 50,
		'VoicedText', T{976690332107, --[[voice:narrator]] "Cutting carefully through the twisted hull, the expedition managed to gain a safe access to the dark cargo hold of the rocket."},
		'Text', T{565849607196, --[[StoryBit TheDerelict Text]] "It’s a miracle that anything on board survived, but after sifting through the twisted scrap inside the crashed vehicle, the expedition discovered some useful prefabs which were meant for some failed colonization effort.\n\n<effect>You have gained several Building Prefabs. The expedition will return shortly."},
		'Effects', {
			PlaceObj('RewardPrefab', {
				'Amount', 1,
				'Prefab', "StirlingGenerator",
			}),
			PlaceObj('RewardPrefab', {
				'Amount', 1,
				'Prefab', "DroneHub",
			}),
			PlaceObj('RewardPrefab', {
				'Amount', 1,
				'Prefab', "MoistureVaporator",
			}),
			PlaceObj('ResumeExpedition', nil),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{267030088136, --[[StoryBit TheDerelict Text]] "Leave the crash site and return home!"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ResumeExpedition', nil),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{793095022301, --[[StoryBit TheDerelict Text]] "We can access through the weak rock layers around the hull."},
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "astrogeologist",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T{816846361579, --[[voice:narrator]] "After hours of tedious tunneling, the expedition manages to access the hull from below."},
		'Text', T{132610025679, --[[StoryBit TheDerelict Text]] "Immediately afterwards, the hull caves in with ear-piercing screech and a stream of fuel starts pouring through the hole, filling the tunnel. Only a quick evacuation prevented further damage and you’re thankful that you avoided the imminent disaster if you decided to use blow-torches. After a short hassle, the hull is breached in an alternative spot and the cargo hold of the rocket is exposed. Not much has been left intact, but there are still precious items to be salvaged.\n\n<effect>You have gained several Building Prefabs. The expedition will return shortly."},
		'Effects', {
			PlaceObj('RewardPrefab', {
				'Amount', 1,
				'Prefab', "StirlingGenerator",
			}),
			PlaceObj('RewardPrefab', {
				'Amount', 1,
				'Prefab', "DroneHub",
			}),
			PlaceObj('RewardPrefab', {
				'Amount', 1,
				'Prefab', "MoistureVaporator",
			}),
			PlaceObj('ResumeExpedition', nil),
		},
	}),
})

