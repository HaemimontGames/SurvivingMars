-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('ModifyObject', {
			'Prop', "electricity_consumption",
			'Percent', "<power_increase_prc>",
			'ModifyId', "DomeHeating",
		}),
	},
	Category = "ColdWaveStart",
	Comment = "the activation effect is wrong",
	Delay = 60000,
	Effects = {},
	Enabled = true,
	Enables = {
		"DomeHeating_1_NoDeaths",
		"DomeHeating_2_Deaths",
	},
	Image = "UI/Messages/Events/19_frozen_landscape.tga",
	Prerequisites = {
		PlaceObj('PickFromLabel', {
			'Label', "Dome",
			'Conditions', {
				PlaceObj('CheckObjectCount', {
					'Label', "Colonist",
					'InDome', true,
					'Filters', {},
					'Condition', ">",
					'Amount', 0,
				}),
				PlaceObj('IsBuildingWorking', nil),
			},
		}),
	},
	ScriptDone = true,
	Text = T(916296186236, --[[StoryBit DomeHeating Text]] "A power surge has caused a massive failure in the heating system of dome <DisplayName>. Using backup heaters we can keep everybody warm enough but the dome’s power consumption has been increased by <power_increase_prc>%.\n\nThe Cold Wave will persist for several sols. If the power supply fails many colonists may freeze to death."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(831220657167, --[[StoryBit DomeHeating Title]] "Dome Heating"),
	Trigger = "ColdWave",
	VoicedText = T(398112054271, --[[voice:narrator]] "A blanket-clad colonist hands you a report, shivering from the cold. It is as you feared - all of the dome heaters have failed."),
	group = "Disasters",
	id = "DomeHeating",
	PlaceObj('StoryBitParamNumber', {
		'Name', "power_increase_prc",
		'Value', 200,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(650748426214, --[[StoryBit DomeHeating Text]] "Replace the Dome’s heating systems."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(412308178283, --[[StoryBit DomeHeating CustomOutcomeText]] "Costs <machineparts(repair_cost)> but the Dome won’t consume extra power"),
		'Comment', "fix this to use parameter in the outcome when I can use a parameter in the effect",
	}),
	PlaceObj('StoryBitParamResource', {
		'Name', "repair_cost",
		'Value', 15000,
		'Resource', "machineparts",
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('SetBuildingBreakdownState', {
				'RepairResource', "MachineParts",
				'RepairAmount', 15000,
			}),
			PlaceObj('ModifyObject', {
				'Prop', "electricity_consumption",
				'ModifyId', "DomeHeating",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(851106623231, --[[StoryBit DomeHeating Text]] "We have trained for such situations. We will persevere!"),
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(277274783674, --[[StoryBit DomeHeating Text]] "Salvage some heaters from Drones."),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(922837155040, --[[StoryBit DomeHeating CustomOutcomeText]] "<drone_prc>% of drones will freeze"),
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "inventor",
		}),
	}),
	PlaceObj('StoryBitParamPercent', {
		'Name', "drone_prc",
		'Value', 50,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Drone",
				'Filters', {},
				'RandomPercent', "<drone_prc>",
				'Effects', {
					PlaceObj('FreezeDrone', nil),
				},
			}),
			PlaceObj('ModifyObject', {
				'Prop', "electricity_consumption",
				'ModifyId', "DomeHeating",
			}),
		},
	}),
})

