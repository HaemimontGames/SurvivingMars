-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('ModifyLabel', {
			'Label', "MOXIE",
			'Prop', "maintenance_threshold_base",
			'ModifyId', "BadMoxie",
		}),
		PlaceObj('ModifyLabel', {
			'Label', "MOXIE",
			'Prop', "maintenance_threshold_base",
			'ModifyId', "BadMoxie_ColdWave",
		}),
		PlaceObj('ModifyLabel', {
			'Label', "MOXIE",
			'Prop', "electricity_consumption",
			'ModifyId', "BadMoxie_ColdWave",
		}),
		PlaceObj('ModifyLabel', {
			'Label', "MOXIE",
			'Prop', "air_production",
			'ModifyId', "BadMoxie_AirProduction",
		}),
		PlaceObj('ModifyLabel', {
			'Label', "MOXIE",
			'Prop', "maintenance_resource_amount",
			'ModifyId', "BadMoxie_ExtraMaintenance",
		}),
	},
	Disables = {
		"BadMOXIE_ColdWave",
		"BadMOXIE_SecondTime",
	},
	Effects = {},
	Prerequisites = {
		PlaceObj('IsTechId', {
			'Field', "Storybits",
			'TechId', "MOXIE_2",
		}),
	},
	ScriptDone = true,
	Text = T{818790438441, --[[StoryBit BadMoxie_Finale Text]] "The new MOXIE 2.0 design is finally ready and we have updated all current MOXIEs to the new specs. MOXIE 2.0 also has increased air production.\n\n<effect>All negative effects on MOXIEs have been removed."},
	TextReadyForValidation = true,
	TextsDone = true,
	Trigger = "TechResearchedTrigger",
	group = "Disasters",
	id = "BadMoxie_Finale",
})

