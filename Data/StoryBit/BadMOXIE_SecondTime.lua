-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "Tick_FounderStageDone",
	Effects = {},
	Enables = {
		"BadMoxie_Tech",
	},
	Image = "UI/Messages/Events/18_moxie.tga",
	InheritsObject = false,
	Prerequisites = {
		PlaceObj('AreDomesOpen', {
			'Negate', true,
		}),
	},
	ScriptDone = true,
	Text = T(164476060825, --[[StoryBit BadMOXIE_SecondTime Text]] "Once again, a MOXIE unit has shut down and stopped producing Oxygen. Drones report that many of the internal parts of the MOXIE have suffered structural damage much earlier than expected."),
	TextReadyForValidation = true,
	TextsDone = true,
	VoicedText = T(536896361272, --[[voice:narrator]] "A yellow light starts flashing on your terminal. Sure enough it is one of those damned MOXIE units again."),
	group = "Disasters",
	id = "BadMOXIE_SecondTime",
	qa_info = PlaceObj('PresetQAInfo', {
		data = {
			{
				action = "Modified",
				time = 1550844439,
				user = "Radomir",
			},
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(335704931889, --[[StoryBit BadMOXIE_SecondTime Text]] "Reinforce the failing parts."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(411896115173, --[[StoryBit BadMOXIE_SecondTime CustomOutcomeText]] "MOXIE cost increased by <metals(cost_increase)>, existing MOXIEs will need emergency maintenance"),
	}),
	PlaceObj('StoryBitParamResource', {
		'Name', "cost_increase",
		'Value', 10000,
		'Resource', "metals",
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('AddBuildingExtraCost', {
				'BuildingClass', "MOXIE",
				'Resource', "Metals",
				'Amount', 10000,
			}),
			PlaceObj('ForEachExecuteEffects', {
				'Label', "MOXIE",
				'Filters', {},
				'Effects', {
					PlaceObj('SetBuildingBreakdownState', {
						'RepairResource', "Metals",
						'RepairAmount', "<cost_increase>",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(573967371988, --[[StoryBit BadMOXIE_SecondTime Text]] "Reduce the pressure in the system."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(616017426323, --[[StoryBit BadMOXIE_SecondTime CustomOutcomeText]] "<o2_production_reduction>% MOXIE Oxygen production"),
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "hydroengineer",
		}),
	}),
	PlaceObj('StoryBitParamPercent', {
		'Name', "o2_production_reduction",
		'Value', -33,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ModifyLabel', {
				'Label', "MOXIE",
				'Prop', "air_production",
				'Percent', "<o2_production_reduction>",
				'ModifyId', "BadMoxie_AirProduction",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(595570821891, --[[StoryBit BadMOXIE_SecondTime Text]] "Keep repairing the MOXIEs as problems occur."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(899898739102, --[[StoryBit BadMOXIE_SecondTime CustomOutcomeText]] "MOXIE maintenance increased by <metals(increased_maintenance)> permanently"),
	}),
	PlaceObj('StoryBitParamResource', {
		'Name', "increased_maintenance",
		'Value', 2000,
		'Resource', "metals",
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ModifyLabel', {
				'Label', "MOXIE",
				'Prop', "maintenance_resource_amount",
				'Amount', 2,
				'ModifyId', "BadMoxie_ExtraMaintenance",
			}),
		},
	}),
})

