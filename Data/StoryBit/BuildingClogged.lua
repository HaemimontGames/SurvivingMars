-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('SetBuildingEnabledState', nil),
	},
	Category = "DustStromStart",
	Delay = 60000,
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/metatron_mystery_03.tga",
	Prerequisites = {
		PlaceObj('IsSolInRange', {
			'Max', 80,
		}),
		PlaceObj('PickFromLabel', {
			'Label', "Building",
			'Conditions', {
				PlaceObj('IsBuildingClass', {
					'Template', {
						"WaterExtractor",
						"RegolithExtractor",
						"MetalsExtractor",
						"PreciousMetalsExtractor",
						"PolymerPlant",
						"FuelFactory",
						"FungalFarm",
					},
				}),
			},
		}),
	},
	ScriptDone = true,
	Text = T{11052, --[[StoryBit BuildingClogged Text]] "One of our buildings has stopped working - a <DisplayName>. It looks like the fine dust from the storm has filled away a key component of the power supply. The repair task is too complex for a drone."},
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T{638269722928, --[[StoryBit BuildingClogged Title]] "Building Clogged"},
	Trigger = "DustStorm",
	VoicedText = T{348826743709, --[[voice:narrator]] "I don’t like dust. It’s coarse and rough and irritating… and it gets everywhere."},
	group = "Disasters",
	id = "BuildingClogged",
	PlaceObj('StoryBitReply', {
		'Text', T{774150409025, --[[StoryBit BuildingClogged Text]] "Send a Colonist."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{915583139331, --[[StoryBit BuildingClogged CustomOutcomeText]] "They may be hurt"},
		'Prerequisite', PlaceObj('CheckColonistCount', nil),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 30,
		'Text', T{625300347788, --[[StoryBit BuildingClogged Text]] "A colonist braved the storm and managed to fix the broken component. Our <DisplayName> is now operational."},
		'Effects', {
			PlaceObj('SetBuildingEnabledState', {
				'Enabled', true,
			}),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 70,
		'Text', T{384998371456, --[[StoryBit BuildingClogged Text]] "A colonist braved the storm and managed to fix the broken component. Our <DisplayName> is now operational. Regrettably, during the repairs the colonist's space suit was compromised and they didn't make it back."},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Colonist",
				'Filters', {
					PlaceObj('HasTrait', {
						'Trait', "Child",
						'Negate', true,
					}),
				},
				'RandomCount', 1,
				'Effects', {},
			}),
			PlaceObj('SetBuildingEnabledState', {
				'Enabled', true,
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{902102504705, --[[StoryBit BuildingClogged Text]] "We’ll fix it after the storm."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{681844902370, --[[StoryBit BuildingClogged CustomOutcomeText]] "<DisplayName> will be suspended"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"BuildingClogged_1_FixAfterStorm",
		},
		'Effects', {},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{326224564565, --[[StoryBit BuildingClogged Text]] "Have the Drones replace the entire component."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{920455332842, --[[StoryBit BuildingClogged CustomOutcomeText]] "<DisplayName> will require <electronics(repaircost)> emergency maintenance"},
	}),
	PlaceObj('StoryBitParamResource', {
		'Name', "repaircost",
		'Value', 3000,
		'Resource', "electronics",
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('SetBuildingBreakdownState', {
				'State', "Malfunction",
				'RepairResource', "Electronics",
				'RepairAmount', 3000,
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{539661399921, --[[StoryBit BuildingClogged Text]] "Step aside, I know regular expressions!"},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{802195888137, --[[StoryBit BuildingClogged CustomOutcomeText]] "use your expertise to fix <DisplayName> remotely"},
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "inventor",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('SetBuildingEnabledState', {
				'Enabled', true,
			}),
		},
	}),
})

