-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
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
				PlaceObj('SetBuildingEnabledState', {
					'Enabled', true,
				}),
			},
		}),
	},
	Effects = {},
	Prerequisites = {},
	Trigger = "ColdWaveEnded",
	group = "Disasters",
	id = "FrozenBatteries_EndEffect",
})

