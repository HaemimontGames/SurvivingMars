-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('SetConstructionSiteState', {
			'State', "Disable",
		}),
	},
	Category = "PlacePrefab",
	Effects = {},
	EnableChance = 30,
	Enabled = true,
	Image = "UI/Messages/Events/28_building_construction.tga",
	NotificationText = "",
	Prerequisites = {},
	ScriptDone = true,
	Text = T{434294412464, --[[StoryBit BadPrefab Text]] "We seem to be missing some parts for our <DisplayName> prefab. Also there seem to be parts that don’t fit anywhere and the instructions are no help at all."},
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T{725085981948, --[[StoryBit BadPrefab Title]] "Bad Prefab"},
	Trigger = "ConstructionPrefabPlaced",
	VoicedText = T{800200228748, --[[voice:narrator]] "The drone attempts to put the square part into the round hole for the third consecutive time, determined to find a solution."},
	group = "Buildings",
	id = "BadPrefab",
	PlaceObj('StoryBitReply', {
		'Text', T{935411421898, --[[StoryBit BadPrefab Text]] "Let’s try to jury rig something…"},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{437660882746, --[[StoryBit BadPrefab CustomOutcomeText]] "chance to fix the building or lose the drone"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 75,
		'Text', T{320806415324, --[[StoryBit BadPrefab Text]] "Taking manual control over the drone, we were able to put together the building but there were some places we had to improvise.\n\n<effect>The <DisplayName> has been constructed but it will require additional maintenance every time the building malfunctions."},
		'Effects', {
			PlaceObj('SetConstructionSiteState', {
				'State', "Complete",
				'AssociateCompletedBuilding', true,
			}),
			PlaceObj('ModifyObject', {
				'Prop', "maintenance_resource_amount",
				'Percent', 100,
				'ModifyId', "BadPrefab",
			}),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 20,
		'Text', T{686508844040, --[[StoryBit BadPrefab Text]] "Well we had to use some of the parts from the drone itself but we were able to assemble the <DisplayName> prefab."},
		'Effects', {
			PlaceObj('SetConstructionSiteState', {
				'State', "Complete",
			}),
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Drone",
				'Filters', {},
				'RandomCount', 1,
				'Effects', {
					PlaceObj('DestroyVehicle', nil),
				},
			}),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 5,
		'Text', T{934749540017, --[[StoryBit BadPrefab Text]] "Taking manual control over the drone, we were able to assemble the <DisplayName> prefab but we are left with a lot of spare parts. Come to think of it I believe we can make another <DisplayName> with them.\n\n<effect>The <DisplayName> has been constructed and we’ve gained another <DisplayName> prefab."},
		'Effects', {
			PlaceObj('SetConstructionSiteState', {
				'State', "Complete",
				'AssociateCompletedBuilding', true,
			}),
			PlaceObj('RewardPrefab', {
				'Amount', 1,
			}),
		},
	}),
	PlaceObj('StoryBitParamFunding', {
		'Name', "money",
		'Value', 400000000,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{994167938498, --[[StoryBit BadPrefab Text]] "I demand a refund"},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{114700726900, --[[StoryBit BadPrefab CustomOutcomeText]] "lose prefab but get <funding(money)>"},
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "politician",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('SetConstructionSiteState', {
				'State', "Destroy",
			}),
			PlaceObj('RewardFunding', {
				'Amount', "<money>",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{510262001596, --[[StoryBit BadPrefab Text]] "Let me see the instructions…"},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{473537269654, --[[StoryBit BadPrefab CustomOutcomeText]] "unknown consequences"},
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "inventor",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Text', T{627403057022, --[[StoryBit BadPrefab Text]] "Ah, I see what the problem is. This is not a prefab for <DisplayName> - it’s a prefab for an Electronics Factory.\n\n<effect>Construction of <DisplayName> has been canceled. A prefab for an Electronics Factory has been added."},
		'Effects', {
			PlaceObj('SetConstructionSiteState', {
				'State', "Destroy",
			}),
			PlaceObj('RewardPrefab', {
				'Amount', 1,
				'Prefab', "ElectronicsFactory",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{666526200537, --[[StoryBit BadPrefab Text]] "Just leave it"},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{802483656668, --[[StoryBit BadPrefab CustomOutcomeText]] "lose the prefab"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('SetConstructionSiteState', {
				'State', "Destroy",
			}),
		},
	}),
})

