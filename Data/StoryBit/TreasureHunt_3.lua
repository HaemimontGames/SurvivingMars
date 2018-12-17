-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('PauseExpedition', nil),
	},
	Effects = {
		PlaceObj('ResumeExpedition', nil),
	},
	Prerequisites = {
		PlaceObj('IsCustomAnomaly', {
			'id', "XMarksTheSpot",
		}),
	},
	ScriptDone = true,
	Text = T(977602410832, --[[StoryBit TreasureHunt_3 Text]] "It becomes apparent that the cube is made of Martian concrete, not unlike the one you’ve been using for so long. There are no doors or any other protrusions, but after circling around the structure, the expedition discovers a distinct red circular shape that suspiciously looks like a big red button."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(849436614321, --[[StoryBit TreasureHunt_3 Title]] "Treasure Hunt: The Treasure"),
	Trigger = "ExpeditionSent",
	VoicedText = T(585812383570, --[[voice:narrator]] "The expedition has landed on the mysterious coordinates. Even before the dust has settled, the visual telemetry shows a distinct cubical shape not far from the landing zone."),
	group = "Expeditions",
	id = "TreasureHunt_3",
	PlaceObj('StoryBitReply', {
		'Text', T(380824145520, --[[StoryBit TreasureHunt_3 Text]] "Press the button!"),
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "prefab_amount",
		'Value', 4,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T(283097283368, --[[voice:narrator]] "The ground trembles as the walls of the building sink down to reveal a large metal container, wrapped with colorful paper and red ribbons."),
		'Text', T(507302989825, --[[StoryBit TreasureHunt_3 Text]] "When opened, it reveals its precious contents – Dome Spire prefabs!\n\n<effect>The expedition will return with <prefab_amount> Spire Prefabs!"),
		'Effects', {
			PlaceObj('RewardPrefab', {
				'Amount', 2,
				'Prefab', "Arcology",
			}),
			PlaceObj('RewardPrefab', {
				'Amount', 1,
				'Prefab', "HangingGardens",
			}),
			PlaceObj('RewardPrefab', {
				'Amount', 1,
				'Prefab', "NetworkNode",
			}),
		},
	}),
	PlaceObj('StoryBitParamResource', {
		'Name', "food_amount",
		'Value', 100000,
		'Resource', "food",
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "morale_bonus",
		'Value', 20,
	}),
	PlaceObj('StoryBitParamSols', {
		'Name', "morale_bonus_sols",
		'Value', 7200000,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T(972927991249, --[[voice:narrator]] "The ground trembles as the walls of the building sink down to reveal a large metal container, wrapped with colorful paper and red ribbons."),
		'Text', T(450526729594, --[[StoryBit TreasureHunt_3 Text]] "When opened, it reveals its precious contents – Food! And not just any kind of food, but delicious products which cannot be found on Mars otherwise, all well-preserved in polymer foam. The colony would have quite the feast, to be sure!\n\n<effect>The expedition will return with <food(food_amount)>. All Colonists gain <morale_bonus> Morale for <sols(morale_bonus_sols)> Sols."),
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {},
				'Effects', {
					PlaceObj('ModifyObject', {
						'Prop', "base_morale",
						'Amount', "<morale_bonus>",
						'Sols', "<morale_bonus_sols>",
					}),
				},
			}),
			PlaceObj('AddExpeditionRocketResources', {
				'amount', 100000,
				'resource', "Food",
			}),
		},
	}),
	PlaceObj('StoryBitParamResource', {
		'Name', "polymer_amount",
		'Value', 50000,
		'Resource', "polymers",
	}),
	PlaceObj('StoryBitParamResource', {
		'Name', "machine_amount",
		'Value', 50000,
		'Resource', "machineparts",
	}),
	PlaceObj('StoryBitParamResource', {
		'Name', "electronics_amount",
		'Value', 50000,
		'Resource', "electronics",
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T(173113718229, --[[voice:narrator]] "The ground trembles as the walls of the building sink down to reveal a large metal container, wrapped with colorful paper and red ribbons."),
		'Text', T(741729198769, --[[StoryBit TreasureHunt_3 Text]] "When opened, it reveals its precious contents – tons of advanced resources, readied for use, just laying there!\n\n<effect>The expedition will return with <polymers(polymer_amount)>, <electronics(electronics_amount)> and <machineparts(machine_amount)>."),
		'Effects', {
			PlaceObj('AddExpeditionRocketResources', {
				'amount', 50000,
				'resource', "Polymers",
			}),
			PlaceObj('AddExpeditionRocketResources', {
				'amount', 50000,
				'resource', "MachineParts",
			}),
			PlaceObj('AddExpeditionRocketResources', {
				'amount', 50000,
				'resource', "Electronics",
			}),
		},
	}),
	PlaceObj('StoryBitParamFunding', {
		'Name', "funding_reward",
		'Value', 1000000000,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'VoicedText', T(706829508338, --[[voice:narrator]] "The ground trembles as the walls of the building sink down to reveal a large metal container, wrapped with colorful paper and red ribbons."),
		'Text', T(506142760967, --[[StoryBit TreasureHunt_3 Text]] "When opened, it reveals its precious contents. Inside, there’s another box. When opened, the box reveals another, smaller box. After several hours of unboxing, the expedition reaches a tiny box, inside of which there’s a check for an outrageously large sum of money. It was worth it!\n\n<effect>The expedition will return with <funding(funding_reward)>."),
		'Effects', {
			PlaceObj('RewardFunding', {
				'Amount', "<funding_reward>",
			}),
		},
	}),
})

