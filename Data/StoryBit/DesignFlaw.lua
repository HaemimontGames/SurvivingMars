-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('ModifyLabel', {
			'Label', "WindTurbine",
			'Prop', "electricity_production",
			'Percent', -50,
			'ModifyId', "DesignFlaw",
		}),
		PlaceObj('LockUnlockBuildingFromBuildMenu', {
			'Building', "WindTurbine",
			'Lock', true,
		}),
	},
	Category = "BuildingConstructed",
	Effects = {
		PlaceObj('DiscoverTech', {
			'Field', "Storybits",
			'Tech', "WindTurbineRedesign",
			'Cost', 1500,
		}),
	},
	Enabled = true,
	Enables = {
		"DesignFlaw_TechResearched",
	},
	Image = "UI/Messages/emergency.tga",
	Prerequisites = {
		PlaceObj('IsSolInRange', {
			'Min', 3,
			'Max', 40,
		}),
		PlaceObj('CheckObjectCount', {
			'Label', "WindTurbine",
			'Filters', {},
			'Condition', ">=",
			'Amount', 5,
		}),
		PlaceObj('IsBuildingClass', {
			'Template', {
				"WindTurbine",
			},
		}),
	},
	ScriptDone = true,
	Text = T{642922031786, --[[StoryBit DesignFlaw Text]] "A major flaw in our Wind Turbine design is now apparent. Their working is hampered by the gradual accumulation of fine Martian dust that is an inevitability on Mars. As a result all Wind Turbines are producing less power than we expected.\n\nMission control has suspended the further construction of Wind Turbines until we manage to come up with a lighter design and a better mechanism.\n\n<goal>Research the “Wind Turbine Redesign” tech to solve the problem. "},
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T{985524422361, --[[StoryBit DesignFlaw Title]] "Design Flaw"},
	Trigger = "ConstructionComplete",
	VoicedText = T{449492151038, --[[voice:narrator]] "The wind turbine’s propeller barely rotates under the Martian wind. We have a problem."},
	group = "Buildings",
	id = "DesignFlaw",
	PlaceObj('StoryBitParamResource', {
		'Name', "repair_cost",
		'Value', 1000,
		'Resource', "machineparts",
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{673249604226, --[[StoryBit DesignFlaw Text]] "Try to fix all existing Wind Turbines."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{753525441106, --[[StoryBit DesignFlaw CustomOutcomeText]] "<machineparts(repair_cost)> emergency maintenance for turbines but they will return to full power production"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ModifyLabel', {
				'Label', "WindTurbine",
				'Prop', "electricity_production",
				'ModifyId', "DesignFlaw",
			}),
			PlaceObj('ForEachExecuteEffects', {
				'Label', "WindTurbine",
				'Filters', {},
				'Effects', {
					PlaceObj('SetBuildingBreakdownState', {
						'RepairResource', "MachineParts",
						'RepairAmount', "<repair_cost>",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{795515312660, --[[StoryBit DesignFlaw Text]] "Convince Mission control to provide an alternative power source."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{133291974970, --[[StoryBit DesignFlaw CustomOutcomeText]] "get 1 Sterling Generator prefab"},
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "politician",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('RewardPrefab', {
				'Amount', 1,
				'Prefab', "StirlingGenerator",
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{574851804220, --[[StoryBit DesignFlaw Text]] "Some design problems are to be expected when dealing with a new planet."},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{981536210397, --[[StoryBit DesignFlaw CustomOutcomeText]] "no effect"},
	}),
})

