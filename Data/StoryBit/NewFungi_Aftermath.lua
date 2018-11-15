-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('ModifyLabel', {
			'Label', "FungalFarm",
			'Prop', "production_per_day1",
			'Percent', 15,
			'ModifyId', "NewFungi",
		}),
		PlaceObj('ForEachExecuteEffects', {
			'Label', "FungalFarm",
			'Filters', {},
			'Effects', {
				PlaceObj('SetBuildingEnabledState', {
					'Enabled', true,
				}),
			},
		}),
	},
	Effects = {},
	Prerequisites = {},
	ScriptDone = true,
	SuppressTime = 7200000,
	TextReadyForValidation = true,
	TextsDone = true,
	group = "Buildings",
	id = "NewFungi_Aftermath",
})

