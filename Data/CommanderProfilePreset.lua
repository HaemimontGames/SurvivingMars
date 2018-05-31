-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('CommanderProfilePreset', {
	group = "Default",
	id = "None",
	filter = function (self) return false end,
})
PlaceObj('CommanderProfilePreset', {
	SortKey = 1000,
	challenge_mod = 10,
	display_name = T{5319, --[[CommanderProfilePreset Default inventor display_name]] "Inventor"},
	effect = T{5320, --[[CommanderProfilePreset Default inventor effect]] "- Drones are gradually optimized to work and construct faster until Sol 100\n- Bonus Tech: <em>Autonomous Hubs</em> (Drone Hubs no longer require Power or maintenance)"},
	id = "inventor",
	PlaceObj('Effect_ModifyLabelOverTime', {
		Label = "Consts",
		Percent = 1,
		Prop = "DroneConstructAmount",
		Repetitions = 50,
		TimeInterval = 2,
		TimeUnits = 720000,
	}),
	PlaceObj('Effect_GrantTech', {
		Field = "Breakthroughs",
		Research = "AutonomousHubs",
	}),
	PlaceObj('Effect_ModifyLabelOverTime', {
		Label = "Consts",
		Percent = 1,
		Prop = "DroneBuildingRepairAmount",
		Repetitions = 50,
		TimeInterval = 2,
		TimeUnits = 720000,
	}),
	PlaceObj('Effect_ModifyLabelOverTime', {
		Label = "Consts",
		Percent = -1,
		Prop = "DroneGatherResourceWorkTime",
		Repetitions = 50,
		TimeInterval = 2,
		TimeUnits = 720000,
	}),
})

PlaceObj('CommanderProfilePreset', {
	SortKey = 2000,
	challenge_mod = 10,
	display_name = T{5321, --[[CommanderProfilePreset Default oligarch display_name]] "Oligarch"},
	effect = T{5322, --[[CommanderProfilePreset Default oligarch effect]] "- Fuel production increased by 25%\n- Bonus Tech: <em>Arcology</em> (unlocks a residential spire)"},
	group = "Default",
	id = "oligarch",
	PlaceObj('Effect_ModifyLabel', {
		Label = "FuelFactory",
		Percent = 25,
		Prop = "production_per_day1",
	}),
	PlaceObj('Effect_GrantTech', {
		Field = "Engineering",
		Research = "Arcology",
	}),
})

PlaceObj('CommanderProfilePreset', {
	SortKey = 3000,
	challenge_mod = 20,
	display_name = T{5323, --[[CommanderProfilePreset Default hydroengineer display_name]] "Hydro Engineer"},
	effect = T{5324, --[[CommanderProfilePreset Default hydroengineer effect]] "- Start with a Water deposit revealed\n- Domes consume 25% less Water\n- Bonus Tech: <em>Water Reclamation</em> (unlocks a spire which reduces Water consumption)"},
	group = "Default",
	id = "hydroengineer",
	PlaceObj('Effect_ModifyLabel', {
		Label = "Dome",
		Percent = -25,
		Prop = "water_consumption",
	}),
	PlaceObj('Effect_GrantTech', {
		Field = "Biotech",
		Research = "WaterReclamation",
	}),
})

PlaceObj('CommanderProfilePreset', {
	SortKey = 4000,
	challenge_mod = 10,
	display_name = T{5325, --[[CommanderProfilePreset Default doctor display_name]] "Doctor"},
	effect = T{5326, --[[CommanderProfilePreset Default doctor effect]] "- Minimum Comfort required for birth lowered by 15\n- Bonus Tech: <em>Stem Reconstruction</em> (colonist lifespan is increased)"},
	group = "Default",
	id = "doctor",
	PlaceObj('Effect_ModifyLabel', {
		Amount = -15,
		Label = "Consts",
		Prop = "MinComfortBirth",
	}),
	PlaceObj('Effect_GrantTech', {
		Field = "Biotech",
		Research = "StemReconstruction",
	}),
})

PlaceObj('CommanderProfilePreset', {
	SortKey = 5000,
	challenge_mod = 10,
	display_name = T{5327, --[[CommanderProfilePreset Default psychologist display_name]] "Psychologist"},
	effect = T{5328, --[[CommanderProfilePreset Default psychologist effect]] "- Colonists recover 5 additional Sanity while resting in their homes\n- Bonus Tech: <em>Behavioral Shaping</em> (unlocks a Sanatorium spire which treats colonists' flaws)"},
	group = "Default",
	id = "psychologist",
	param1 = 5,
	PlaceObj('Effect_GrantTech', {
		Field = "Social",
		Research = "BehavioralShaping",
	}),
})

PlaceObj('CommanderProfilePreset', {
	SortKey = 6000,
	display_name = T{5329, --[[CommanderProfilePreset Default politician display_name]] "Politician"},
	effect = T{5330, --[[CommanderProfilePreset Default politician effect]] "- All Funding gains are increased by <percent(20)>\n- Bonus Tech: <em>Martian Patents</em> (repeatable tech that grants Funding)"},
	group = "Default",
	id = "politician",
	PlaceObj('Effect_ModifyLabel', {
		Label = "Consts",
		Percent = 20,
		Prop = "FundingGainsModifier",
	}),
	PlaceObj('Effect_GrantTech', {
		Field = "Social",
		Research = "MartianPatents",
	}),
})

PlaceObj('CommanderProfilePreset', {
	SortKey = 7000,
	challenge_mod = 30,
	display_name = T{5331, --[[CommanderProfilePreset Default author display_name]] "Futurist"},
	effect = T{5332, --[[CommanderProfilePreset Default author effect]] "- Breakthrough techs are researched <percent(30)> faster\n- Bonus Tech: <em>Autonomous Sensors</em> (Sensor Towers no longer require Power or maintenance)"},
	group = "Default",
	id = "author",
	PlaceObj('Effect_ModifyLabel', {
		Amount = -30,
		Label = "Consts",
		Prop = "BreakThroughTechCostMod",
	}),
	PlaceObj('Effect_GrantTech', {
		Field = "Physics",
		Research = "AutonomousSensors",
	}),
})

PlaceObj('CommanderProfilePreset', {
	SortKey = 8000,
	challenge_mod = 10,
	display_name = T{5333, --[[CommanderProfilePreset Default ecologist display_name]] "Ecologist"},
	effect = T{5334, --[[CommanderProfilePreset Default ecologist effect]] "- Service Comfort of decorations increased by 10\n- Bonus Tech: <em>Hanging Gardens</em> (unlocks a spire which improves residences in the Dome)"},
	group = "Default",
	id = "ecologist",
	PlaceObj('Effect_ModifyLabel', {
		Amount = 10,
		Label = "Decorations",
		Prop = "service_comfort",
	}),
	PlaceObj('Effect_GrantTech', {
		Field = "Biotech",
		Research = "HangingGardens",
	}),
})

PlaceObj('CommanderProfilePreset', {
	SortKey = 9000,
	challenge_mod = 20,
	display_name = T{5335, --[[CommanderProfilePreset Default astrogeologist display_name]] "Astrogeologist"},
	effect = T{5336, --[[CommanderProfilePreset Default astrogeologist effect]] "- Start with a Rare Metal deposit revealed\n- Extractor production increased by 10%\n- Bonus Tech: <em>Deep Scanning</em> (allows the scanning of sectors for deep deposits)"},
	group = "Default",
	id = "astrogeologist",
	PlaceObj('Effect_ModifyLabel', {
		Label = "WaterExtractor",
		Percent = 10,
		Prop = "water_production",
	}),
	PlaceObj('Effect_ModifyLabel', {
		Label = "MetalsExtractor",
		Percent = 10,
		Prop = "production_per_day1",
	}),
	PlaceObj('Effect_ModifyLabel', {
		Label = "PreciousMetalsExtractor",
		Percent = 10,
		Prop = "production_per_day1",
	}),
	PlaceObj('Effect_ModifyLabel', {
		Label = "RegolithExtractor",
		Percent = 10,
		Prop = "production_per_day1",
	}),
	PlaceObj('Effect_GrantTech', {
		Field = "Physics",
		Research = "DeepScanning",
	}),
})

PlaceObj('CommanderProfilePreset', {
	SortKey = 10000,
	bonus_rockets = 1,
	challenge_mod = 20,
	display_name = T{5337, --[[CommanderProfilePreset Default rocketscientist display_name]] "Rocket Scientist"},
	effect = T{5338, --[[CommanderProfilePreset Default rocketscientist effect]] "- Start with an extra Rocket\n- Bonus Tech: <em>CO2 Jet Propulsion</em> (unlocks Shuttle Hub and long-range transportation)"},
	group = "Default",
	id = "rocketscientist",
	PlaceObj('Effect_GrantTech', {
		Field = "Robotics",
		Research = "CO2JetPropulsion",
	}),
})

PlaceObj('CommanderProfilePreset', {
	SortKey = 11000,
	display_name = T{3490, --[[CommanderProfilePreset Default random display_name]] "Random"},
	group = "Default",
	id = "random",
})

