-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('PauseExpedition', nil),
	},
	Category = "PlanetaryAnomaly",
	Effects = {},
	EnableChance = 30,
	Enabled = true,
	Image = "UI/Messages/Events/21_meteors.tga",
	Prerequisites = {},
	ScriptDone = true,
	Text = T(267471171681, --[[StoryBit TheFloorIsLava Text]] "Our initial scans must be incorrect, but the terrain is treacherous and filled with solid, sharp rocks which prevent the rocket from safely landing at the coordinates."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(689826963957, --[[StoryBit TheFloorIsLava Title]] "The Floor is Lava"),
	Trigger = "PlanetaryAnomalyEvent",
	VoicedText = T(498825560267, --[[voice:narrator]] "The expedition Rocket cannot find a suitable place to land near the Anomaly’s location."),
	group = "Expeditions",
	id = "TheFloorIsLava",
	PlaceObj('StoryBitReply', {
		'Text', T(933665533936, --[[StoryBit TheFloorIsLava Text]] "Don’t risk it."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(448573301757, --[[StoryBit TheFloorIsLava CustomOutcomeText]] "The expedition will return"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ResumeExpedition', nil),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(846515294692, --[[StoryBit TheFloorIsLava Text]] "Circle and find a good landing spot."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(203604204585, --[[StoryBit TheFloorIsLava CustomOutcomeText]] "unknown consequences"),
	}),
	PlaceObj('StoryBitParamResource', {
		'Name', "polymer_cargo",
		'Value', 30000,
		'Resource', "polymers",
	}),
	PlaceObj('StoryBitParamResource', {
		'Name', "metals_cargo",
		'Value', 50000,
		'Resource', "metals",
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 25,
		'VoicedText', T(851567857021, --[[voice:narrator]] "After circling on the spot for hours, the Rocket finds a good landing spot."),
		'Text', T(363871460978, --[[StoryBit TheFloorIsLava Text]] "The cracked crust of the planet which prevented us from landing actually reveals rich metal veins. The expedition makes sure the rocket is filled to the brim before taking off – and for a good reason. The rocky terrain of the landing spot crumbles under the immense force of the engines, making the landing spot forever inaccessible, like a treasure vault lost in legends.\n\n<effect>The expedition will return with <polymers(polymer_cargo)> and <metals(metals_cargo)>."),
		'Effects', {
			PlaceObj('AddExpeditionRocketResources', {
				'amount', 30000,
				'resource', "Polymers",
			}),
			PlaceObj('AddExpeditionRocketResources', {
				'amount', 50000,
			}),
			PlaceObj('ResumeExpedition', nil),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 65,
		'VoicedText', T(452137831556, --[[voice:narrator]] "After circling near the spot for hours, the Rocket finds no suitable place to land."),
		'Text', T(309357914331, --[[StoryBit TheFloorIsLava Text]] "It’s a pity, for the on-board scanners have detected massive amounts of easily-accessible ore veins right under the jagged rocks. Still, better safe than sorry.\n\n<effect>The expedition will return shortly."),
		'Effects', {
			PlaceObj('ResumeExpedition', nil),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 10,
		'Enables', {},
		'Effects', {
			PlaceObj('ActivateStoryBit', {
				'Id', "TheFloorIsLava2",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(408701806770, --[[StoryBit TheFloorIsLava Text]] "Let's try an unorthodox landing procedure."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(400066985738, --[[StoryBit TheFloorIsLava CustomOutcomeText]] "The expedition returns with <polymers(rocket_polymers)> and <metals(rocket_metals)>"),
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "rocketscientist",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('AddExpeditionRocketResources', {
				'amount', 20000,
			}),
			PlaceObj('AddExpeditionRocketResources', {
				'amount', 10000,
				'resource', "Polymers",
			}),
			PlaceObj('ResumeExpedition', nil),
		},
	}),
	PlaceObj('StoryBitParamResource', {
		'Name', "rocket_polymers",
		'Value', 10000,
		'Resource', "polymers",
	}),
	PlaceObj('StoryBitParamResource', {
		'Name', "rocket_metals",
		'Value', 20000,
		'Resource', "metals",
	}),
})

