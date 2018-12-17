-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "ColdWaveStart",
	Delay = 60000,
	Effects = {},
	Enables = {
		"BadMoxie_Tech",
	},
	Image = "UI/Messages/Events/18_moxie.tga",
	InheritsObject = false,
	Prerequisites = {
		PlaceObj('PickFromLabel', {
			'Label', "MOXIE",
			'Conditions', {},
		}),
	},
	ScriptDone = true,
	Text = T(940021000465, --[[StoryBit BadMOXIE_ColdWave Text]] "MOXIEs use a form of electrolysis to produce Oxygen from carbon dioxide. However, the process requires relatively high (for Mars) temperatures.\n\nIt looks like a failure in one of our MOXIE units has highlighted a design flaw in the technology. We have to find a solution that works for all MOXIEs."),
	TextReadyForValidation = true,
	TextsDone = true,
	Trigger = "ColdWave",
	VoicedText = T(728411744190, --[[voice:narrator]] "As the frost outside settles, an urgent maintenance report flashes on your terminal. There’s a problem with a MOXIE unit."),
	group = "Disasters",
	id = "BadMOXIE_ColdWave",
	PlaceObj('StoryBitReply', {
		'Text', T(899944302275, --[[StoryBit BadMOXIE_ColdWave Text]] "Install additional heaters."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(637039960544, --[[StoryBit BadMOXIE_ColdWave CustomOutcomeText]] "MOXIEs power consumption increased by <power(increased_consumption)>"),
	}),
	PlaceObj('StoryBitParamResource', {
		'Name', "increased_consumption",
		'Value', 5000,
		'Resource', "power",
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ModifyLabel', {
				'Label', "MOXIE",
				'Prop', "electricity_consumption",
				'Amount', "<increased_consumption>",
				'ModifyId', "BadMoxie_ColdWave",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(879385110893, --[[StoryBit BadMOXIE_ColdWave Text]] "Improve the insulation of the MOXIEs."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(929769322749, --[[StoryBit BadMOXIE_ColdWave CustomOutcomeText]] "<polymers(insulation)> extra construction cost for MOXIEs; existing MOXIEs will request <polymers(insulation)> maintenance"),
		'Comment', "some effects don't have a param option",
	}),
	PlaceObj('StoryBitParamResource', {
		'Name', "insulation",
		'Value', 5000,
		'Resource', "polymers",
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('AddBuildingExtraCost', {
				'BuildingClass', "MOXIE",
				'Resource', "Polymers",
				'Amount', 5000,
			}),
			PlaceObj('ForEachExecuteEffects', {
				'Label', "MOXIE",
				'Filters', {},
				'Effects', {
					PlaceObj('SetBuildingBreakdownState', {
						'RepairResource', "Polymers",
						'RepairAmount', "<insulation>",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(570399353506, --[[StoryBit BadMOXIE_ColdWave Text]] "Leave the MOXIEs as they are."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(982145860164, --[[StoryBit BadMOXIE_ColdWave CustomOutcomeText]] "MOXIEs will require maintenance more often"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ModifyLabel', {
				'Label', "MOXIE",
				'Prop', "maintenance_threshold_base",
				'Percent', -25,
				'ModifyId', "BadMoxie_ColdWave",
			}),
		},
	}),
})

