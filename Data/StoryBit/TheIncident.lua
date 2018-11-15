-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {},
	Category = "DustStromStart",
	Delay = 60000,
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/23_red_alert.tga",
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "FusionReactor",
			'Filters', {},
			'Condition', ">=",
			'Amount', 2,
		}),
		PlaceObj('IsTechId', {
			'Field', "Breakthroughs",
			'TechId', "EternalFusion",
			'Negate', true,
		}),
		PlaceObj('PickFromLabel', {
			'Label', "FusionReactor",
			'Conditions', {
				PlaceObj('IsBuildingWorking', nil),
			},
		}),
	},
	ScriptDone = true,
	Text = T{496403163205, --[[StoryBit TheIncident Text]] "There’s a potential breach in our Fusion Reactor. If the magnetic confinement fails, we may be sitting on a fusion bomb. Theoretically, the fail-safes should contain the explosion within the vicinity of the reactor.\n\nThe workers have a chance to evacuate. However, several of them have volunteered to try to stop the containment breach from inside."},
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T{975591644532, --[[StoryBit TheIncident Title]] "The Incident"},
	Trigger = "DustStorm",
	VoicedText = T{973682140790, --[[voice:narrator]] "An Engineer moves to compensate the tiny misalignment in the magnetic confinement caused by the Dust Storm. Suddenly, a siren starts to wail as red lights cover the terminal."},
	group = "Disasters",
	id = "TheIncident",
	PlaceObj('StoryBitReply', {
		'Text', T{392904520586, --[[StoryBit TheIncident Text]] "Allow the volunteers to try to stop the meltdown"},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{187767337180, --[[StoryBit TheIncident CustomOutcomeText]] "high chance of success; the workers will perish"},
	}),
	PlaceObj('StoryBitParamResource', {
		'Name', "breakdown_cost",
		'Value', 10000,
		'Resource', "electronics",
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 75,
		'Text', T{860256808258, --[[StoryBit TheIncident Text]] "The magnetic containment has failed but our brave Colonists managed to contain the meltdown to the Fusion Reactor. That comes at a great cost, as all the workers gave their lives to save us.\n\n<effect>Fusion Reactor has malfunctioned and needs extra <electronics(breakdown_cost)> for repair. All workers have died."},
		'Enables', {
			"TheIncident_3_Aftermath_NoExplosion",
		},
		'Effects', {
			PlaceObj('SetBuildingBreakdownState', {
				'State', "Malfunction",
				'RepairResource', "Electronics",
				'RepairAmount', "<breakdown_cost>",
			}),
			PlaceObj('ForEachWorker', {
				'Filters', {},
				'Effects', {
					PlaceObj('KillColonist', nil),
				},
			}),
		},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 25,
		'Text', T{112977249319, --[[StoryBit TheIncident Text]] "The volunteers have failed to contain the fusion reaction. An explosion is imminent…"},
		'Enables', {
			"TheIncident_1_Aftermath_Explosion",
		},
		'Effects', {
			PlaceObj('ExplodeBuilding', {
				'Radius', 6000,
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{397747015234, --[[StoryBit TheIncident Text]] "Initiate emergency shut down!"},
		'OutcomeText', "custom",
		'CustomOutcomeText', T{786336243600, --[[StoryBit TheIncident CustomOutcomeText]] "reaction will be contained but it will cause many Cable Faults and breakdowns"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"TheIncident_3_Aftermath_NoExplosion",
		},
		'Effects', {
			PlaceObj('CauseFault', {
				'Grid', "electricity",
				'Amount', 12,
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T{848365678714, --[[StoryBit TheIncident Text]] "Evacuate the building !(The Reactor will explode, all workers will be evacuated)"},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Enables', {
			"TheIncident_1_Aftermath_Explosion",
		},
		'Effects', {
			PlaceObj('ExplodeBuilding', {
				'KillColonists', false,
				'Radius', 6000,
			}),
		},
	}),
})

