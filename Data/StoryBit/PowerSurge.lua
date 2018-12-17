-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBit', {
	ActivationEffects = {
		PlaceObj('CauseFault', {
			'Grid', "electricity",
			'Amount', 3,
		}),
	},
	Category = "Tick",
	Disables = {},
	Effects = {},
	Enabled = true,
	Image = "UI/Messages/Events/23_red_alert.tga",
	Prerequisites = {
		PlaceObj('CheckResource', {
			'Resource', "Power",
			'Amount', 200,
		}),
		PlaceObj('CheckObjectCount', {
			'Label', "Building",
			'Filters', {
				PlaceObj('IsBuildingClass', {
					'BuildingClass', {
						"ElectricityProducer",
					},
				}),
			},
			'Condition', ">",
			'Amount', "<number_of_buildings>",
		}),
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
	},
	ScriptDone = true,
	Text = T(726992247519, --[[StoryBit PowerSurge Text]] "Stress on one of our power networks is causing a massive power surge. There’s a serious threat of overloading the entire network if we don’t do something quickly."),
	TextReadyForValidation = true,
	TextsDone = true,
	Title = T(942882055765, --[[StoryBit PowerSurge Title]] "Power Surge"),
	VoicedText = T(424202355279, --[[voice:narrator]] "A number of red lights go off as sparks start flying from the terminal that monitors our power networks."),
	group = "Buildings",
	id = "PowerSurge",
	PlaceObj('StoryBitParamSols', {
		'Name', "shutdown_duration",
		'Value', 2160000,
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "number_of_buildings",
		'Value', 10,
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(215331417381, --[[StoryBit PowerSurge Text]] "Shut down <number_of_buildings> power producers for <sols(shutdown_duration)> Sols!"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Building",
				'Filters', {
					PlaceObj('IsBuildingClass', {
						'BuildingClass', {
							"SolarPanel",
							"WindTurbine",
							"StirlingGenerator",
							"AdvancedStirlingGenerator",
							"FusionReactor",
							"SolarArray",
						},
					}),
				},
				'RandomCount', "<number_of_buildings>",
				'Effects', {
					PlaceObj('SetBuildingEnabledState', {
						'Duration', "<shutdown_duration>",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(648548815711, --[[StoryBit PowerSurge Text]] "Reroute power to Batteries!"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(617341107964, --[[StoryBit PowerSurge CustomOutcomeText]] "some Batteries may explode"),
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "exploding_batteries",
		'Value', 3,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 60,
		'Text', T(463342277379, --[[StoryBit PowerSurge Text]] "We have successfully rerouted power to Batteries. Although they were overloaded for a while, no accidents have occurred this time."),
		'Effects', {},
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 40,
		'Text', T(511745994378, --[[StoryBit PowerSurge Text]] "We rerouted the excess power to our Batteries. Unfortunately, several of them exploded, damaging the nearby buildings."),
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
				'RandomCount', "<exploding_batteries>",
				'Effects', {
					PlaceObj('ExplodeBuilding', nil),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(983462571917, --[[StoryBit PowerSurge Text]] "I know how to contain the surge!"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(143962451500, --[[StoryBit PowerSurge CustomOutcomeText]] "unknown effect"),
		'Prerequisite', PlaceObj('IsCommander', {
			'CommanderProfile', "inventor",
		}),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 50,
		'Text', T(994944412222, --[[StoryBit PowerSurge Text]] "It worked! The power surge has been contained without any damage to our power network."),
		'Effects', {},
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "number_of_faults",
		'Value', 8,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 30,
		'Text', T(693340219248, --[[StoryBit PowerSurge Text]] "It worked… well mostly. We sort of blew up some cables but the Drones will take care of that.\n\n<effect><number_of_faults> cable faults have appeared."),
		'Effects', {},
	}),
	PlaceObj('StoryBitParamNumber', {
		'Name', "number_of_brokenbuildings",
		'Value', 5,
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Weight', 20,
		'Text', T(398529352978, --[[StoryBit PowerSurge Text]] "Oops, your calculations were a little off. I guess you should’ve used metric.\n \n<effect>Several power producers and consumers have broken down."),
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Building",
				'Filters', {
					PlaceObj('IsBuildingClass', {
						'BuildingClass', {
							"StirlingGenerator",
							"AdvancedStirlingGenerator",
							"FusionReactor",
							"RegolithExtractor",
							"PreciousMetalsExtractor",
							"PolymerPlant",
							"WaterExtractor",
							"MetalsExtractor",
						},
					}),
				},
				'RandomCount', "<number_of_brokenbuildings>",
				'Effects', {
					PlaceObj('SetBuildingBreakdownState', {
						'State', "Malfunction",
					}),
				},
			}),
		},
	}),
	PlaceObj('StoryBitReply', {
		'Text', T(664247718695, --[[StoryBit PowerSurge Text]] "Panic!"),
		'OutcomeText', "custom",
		'CustomOutcomeText', T(213398042104, --[[StoryBit PowerSurge CustomOutcomeText]] "several buildings will breakdown"),
	}),
	PlaceObj('StoryBitOutcome', {
		'Prerequisites', {},
		'Effects', {
			PlaceObj('ForEachExecuteEffects', {
				'Label', "Building",
				'Filters', {
					PlaceObj('IsBuildingClass', {
						'BuildingClass', {
							"StirlingGenerator",
							"AdvancedStirlingGenerator",
							"FusionReactor",
							"RegolithExtractor",
							"PreciousMetalsExtractor",
							"PolymerPlant",
							"WaterExtractor",
							"MetalsExtractor",
						},
					}),
				},
				'RandomCount', "<number_of_brokenbuildings>",
				'Effects', {
					PlaceObj('SetBuildingBreakdownState', {
						'State', "Malfunction",
					}),
				},
			}),
		},
	}),
})

