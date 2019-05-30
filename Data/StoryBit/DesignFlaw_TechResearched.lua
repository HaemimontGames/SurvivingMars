-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Effects = {
		PlaceObj('ModifyLabel', {
			'Label', "WindTurbine",
			'Prop', "electricity_production",
			'Percent', "<power_production_boost>",
			'ModifyId', "DesignFlaw",
		}),
		PlaceObj('LockUnlockBuildingFromBuildMenu', {
			'Building', "WindTurbine",
		}),
		PlaceObj('LockUnlockBuildingFromBuildMenu', {
			'Building', "WindTurbine_Large",
		}),
	},
	Prerequisites = {
		PlaceObj('IsTechId', {
			'Field', "Storybits",
			'TechId', "WindTurbineRedesign",
		}),
	},
	ScriptDone = true,
	Text = T(282758386912, --[[StoryBit DesignFlaw_TechResearched Text]] "The schematics for our Wind Turbines have been updated. The new design is so good that we expect to boost their production by <power_production_boost>%.\n\n<effect>Construction ban of Wind Turbines has been lifted."),
	TextReadyForValidation = true,
	TextsDone = true,
	Trigger = "TechResearchedTrigger",
	VoicedText = T(964901043382, --[[voice:narrator]] "A brief, tired cheer emanates from the science team indicating they have finally found a solution."),
	group = "Buildings",
	id = "DesignFlaw_TechResearched",
	PlaceObj('StoryBitParamPercent', {
		'Name', "power_production_boost",
		'Value', 15,
	}),
})

