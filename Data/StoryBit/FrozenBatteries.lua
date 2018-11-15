-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "ColdWaveStart",
	Delay = 60000,
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/19_frozen_landscape.tga",
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "Building",
			'Filters', {
				PlaceObj('IsBuildingClass', {
					'Template', {
						"Battery_WaterFuelCell",
						"AtomicBattery",
					},
				}),
			},
			'Condition', ">=",
			'Amount', 3,
		}),
		PlaceObj('CheckResource', {
			'Resource', "Power",
			'Amount', 200,
		}),
	},
	ScriptDone = true,
	Text = T{434575933005, --[[StoryBit FrozenBatteries Text]] "The temperatures have dropped to a new all-time low, well outside the operational range of our Power Accumulators. Batteries outside of heated zones will begin to freeze and stop working for the duration of the Cold Wave."},
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T{133503274607, --[[StoryBit FrozenBatteries Title]] "Frozen Batteries"},
	Trigger = "ColdWave",
	VoicedText = T{945924979440, --[[voice:narrator]] "The morning is particularly chilly. Sipping your cup of tea, you survey the frozen landscape just in time to see the warning lights of several accumulators flash red."},
	group = "Disasters",
	id = "FrozenBatteries",
	PlaceObj('StoryBitReply', {
		'Text', T{471620908577, --[[StoryBit FrozenBatteries Text]] "Increase the voltage to heat the grid."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{994275456673, --[[StoryBit FrozenBatteries CustomOutcomeText]] "cause cable faults"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('CauseFault', {
				'Grid', "electricity",
				'Amount', 3,
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{463270204896, --[[StoryBit FrozenBatteries Text]] "Install heater units."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{496923911490, --[[StoryBit FrozenBatteries CustomOutcomeText]] "each Accumulator will need <electronics(maintenance)> emergency maintenance"},
	}),
	PlaceObj('StoryBitParamResource', {
		'Name', "maintenance",
		'Value', 2000,
		'Resource', "electronics",
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Building",
				'Filters', {
					PlaceObj('IsBuildingClass', {
						'Template', {
							"Battery_WaterFuelCell",
							"AtomicBattery",
						},
					}),
				},
				'Effects', {
					PlaceObj('SetBuildingBreakdownState', {
						'RepairResource', "Electronics",
						'RepairAmount', "<maintenance>",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{918784541030, --[[StoryBit FrozenBatteries Text]] "We can manage without our Power reserves for now."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{656980410328, --[[StoryBit FrozenBatteries CustomOutcomeText]] "all Accumulators will freeze"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Building",
				'Filters', {
					PlaceObj('IsBuildingClass', {
						'Template', {
							"Battery_WaterFuelCell",
							"AtomicBattery",
						},
					}),
				},
				'Effects', {
					PlaceObj('FreezeBuilding', nil),
				},
			}),
		},
	}),
})

