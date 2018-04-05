-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('CommanderProfile', {
	'name', "inventor",
	'display_name', T{5319, --[[CommanderProfile inventor display_name]] "Inventor"},
	'challenge_mod', 10,
	'effect', T{5320, --[[CommanderProfile inventor effect]] "- Drones are gradually optimized to work and construct faster until Sol 100\n- Bonus Tech: <em>Autonomous Hubs</em> (Drone Hubs no longer require Power or maintenance)"},
}, {
	PlaceObj('TechEffect_ModifyLabelOverTime', {
		'Label', "Consts",
		'Prop', "DroneConstructAmount",
		'Percent', 1,
		'TimeInterval', 2,
		'TimeUnits', 750000,
		'Repetitions', 50,
	}),
	PlaceObj('TechEffect_GrantTech', {
		'Field', "Breakthroughs",
		'Research', "AutonomousHubs",
	}),
	PlaceObj('TechEffect_ModifyLabelOverTime', {
		'Label', "Consts",
		'Prop', "DroneBuildingRepairAmount",
		'Percent', 1,
		'TimeInterval', 2,
		'TimeUnits', 750000,
		'Repetitions', 50,
	}),
	PlaceObj('TechEffect_ModifyLabelOverTime', {
		'Label', "Consts",
		'Prop', "DroneGatherResourceWorkTime",
		'Percent', -1,
		'TimeInterval', 2,
		'TimeUnits', 750000,
		'Repetitions', 50,
	}),
	})

PlaceObj('CommanderProfile', {
	'name', "oligarch",
	'display_name', T{5321, --[[CommanderProfile oligarch display_name]] "Oligarch"},
	'challenge_mod', 10,
	'effect', T{5322, --[[CommanderProfile oligarch effect]] "- Fuel production increased by 25%\n- Bonus Tech: <em>Arcology</em> (unlocks a residential spire)"},
}, {
	PlaceObj('TechEffect_ModifyLabel', {
		'Label', "FuelFactory",
		'Prop', "production_per_day1",
		'Percent', 25,
	}),
	PlaceObj('TechEffect_GrantTech', {
		'Field', "Engineering",
		'Research', "Arcology",
	}),
	})

PlaceObj('CommanderProfile', {
	'name', "hydroengineer",
	'display_name', T{5323, --[[CommanderProfile hydroengineer display_name]] "Hydro Engineer"},
	'challenge_mod', 20,
	'effect', T{5324, --[[CommanderProfile hydroengineer effect]] "- Start with a Water deposit revealed\n- Domes consume 25% less Water\n- Bonus Tech: <em>Water Reclamation</em> (unlocks a spire which reduces Water consumption)"},
}, {
	PlaceObj('TechEffect_ModifyLabel', {
		'Label', "Dome",
		'Prop', "water_consumption",
		'Percent', -25,
	}),
	PlaceObj('TechEffect_GrantTech', {
		'Field', "Biotech",
		'Research', "WaterReclamation",
	}),
	})

PlaceObj('CommanderProfile', {
	'name', "doctor",
	'display_name', T{5325, --[[CommanderProfile doctor display_name]] "Doctor"},
	'challenge_mod', 10,
	'effect', T{5326, --[[CommanderProfile doctor effect]] "- Minimum Comfort required for birth lowered by 15\n- Bonus Tech: <em>Stem Reconstruction</em> (colonist lifespan is increased)"},
}, {
	PlaceObj('TechEffect_ModifyLabel', {
		'Label', "Consts",
		'Prop', "MinComfortBirth",
		'Amount', -15,
	}),
	PlaceObj('TechEffect_GrantTech', {
		'Field', "Biotech",
		'Research', "StemReconstruction",
	}),
	})

PlaceObj('CommanderProfile', {
	'name', "psychologist",
	'display_name', T{5327, --[[CommanderProfile psychologist display_name]] "Psychologist"},
	'challenge_mod', 10,
	'effect', T{5328, --[[CommanderProfile psychologist effect]] "- Colonists recover 5 additional Sanity while resting in their homes\n- Bonus Tech: <em>Behavioral Shaping</em> (unlocks a Sanatorium spire which treats colonists' flaws)"},
	'param1', 5,
}, {
	PlaceObj('TechEffect_GrantTech', {
		'Field', "Social",
		'Research', "BehavioralShaping",
	}),
	})

PlaceObj('CommanderProfile', {
	'name', "politician",
	'display_name', T{5329, --[[CommanderProfile politician display_name]] "Politician"},
	'effect', T{5330, --[[CommanderProfile politician effect]] "- All Funding gains are increased by <percent(20)>\n- Bonus Tech: <em>Martian Patents</em> (repeatable tech that grants Funding)"},
}, {
	PlaceObj('TechEffect_ModifyLabel', {
		'Label', "Consts",
		'Prop', "FundingGainsModifier",
		'Percent', 20,
	}),
	PlaceObj('TechEffect_GrantTech', {
		'Field', "Social",
		'Research', "MartianPatents",
	}),
	})

PlaceObj('CommanderProfile', {
	'name', "author",
	'display_name', T{5331, --[[CommanderProfile author display_name]] "Futurist"},
	'challenge_mod', 30,
	'effect', T{5332, --[[CommanderProfile author effect]] "- Breakthrough techs are researched <percent(30)> faster\n- Bonus Tech: <em>Autonomous Sensors</em> (Sensor Towers no longer require Power or maintenance)"},
}, {
	PlaceObj('TechEffect_ModifyLabel', {
		'Label', "Consts",
		'Prop', "BreakThroughTechCostMod",
		'Amount', -30,
	}),
	PlaceObj('TechEffect_GrantTech', {
		'Field', "Physics",
		'Research', "AutonomousSensors",
	}),
	})

PlaceObj('CommanderProfile', {
	'name', "ecologist",
	'display_name', T{5333, --[[CommanderProfile ecologist display_name]] "Ecologist"},
	'challenge_mod', 10,
	'effect', T{5334, --[[CommanderProfile ecologist effect]] "- Service Comfort of decorations increased by 10\n- Bonus Tech: <em>Hanging Gardens</em> (unlocks a spire which improves residences in the Dome)"},
}, {
	PlaceObj('TechEffect_ModifyLabel', {
		'Label', "Decorations",
		'Prop', "service_comfort",
		'Amount', 10,
	}),
	PlaceObj('TechEffect_GrantTech', {
		'Field', "Biotech",
		'Research', "HangingGardens",
	}),
	})

PlaceObj('CommanderProfile', {
	'name', "astrogeologist",
	'display_name', T{5335, --[[CommanderProfile astrogeologist display_name]] "Astrogeologist"},
	'challenge_mod', 20,
	'effect', T{5336, --[[CommanderProfile astrogeologist effect]] "- Start with a Rare Metal deposit revealed\n- Extractor production increased by 10%\n- Bonus Tech: <em>Deep Scanning</em> (allows the scanning of sectors for deep deposits)"},
}, {
	PlaceObj('TechEffect_ModifyLabel', {
		'Label', "WaterExtractor",
		'Prop', "water_production",
		'Percent', 10,
	}),
	PlaceObj('TechEffect_ModifyLabel', {
		'Label', "MetalsExtractor",
		'Prop', "production_per_day1",
		'Percent', 10,
	}),
	PlaceObj('TechEffect_ModifyLabel', {
		'Label', "PreciousMetalsExtractor",
		'Prop', "production_per_day1",
		'Percent', 10,
	}),
	PlaceObj('TechEffect_ModifyLabel', {
		'Label', "RegolithExtractor",
		'Prop', "production_per_day1",
		'Percent', 10,
	}),
	PlaceObj('TechEffect_GrantTech', {
		'Field', "Physics",
		'Research', "DeepScanning",
	}),
	})

PlaceObj('CommanderProfile', {
	'name', "rocketscientist",
	'display_name', T{5337, --[[CommanderProfile rocketscientist display_name]] "Rocket Scientist"},
	'challenge_mod', 20,
	'effect', T{5338, --[[CommanderProfile rocketscientist effect]] "- Start with an extra Rocket\n- Bonus Tech: <em>CO2 Jet Propulsion</em> (unlocks Shuttle Hub and long-range transportation)"},
	'bonus_rockets', 1,
}, {
	PlaceObj('TechEffect_GrantTech', {
		'Field', "Robotics",
		'Research', "CO2JetPropulsion",
	}),
	})

PlaceObj('CommanderProfile', {
	'name', "random",
	'display_name', T{3490, --[[CommanderProfile random display_name]] "Random"},
})

