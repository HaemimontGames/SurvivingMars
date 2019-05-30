-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('ActionFXParticles', {
	Action = "Accelerate",
	Actor = "JumperShuttle",
	Attach = true,
	DetailLevel = 60,
	EndRules = {},
	Moment = "end",
	Offset = point(-100, 0, 0),
	Particles = "Shuttle_Jumper_Ignition_Jump",
	Scale = 150,
	Spot = "Particle",
	SpotsPercent = 100,
	Target = "ignore",
	Time = 1000,
})

PlaceObj('ActionFXParticles', {
	Action = "Accelerate",
	Actor = "JumperShuttle",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(-100, 0, 0),
	Particles = "Shuttle_Jumper_Ignition_Accelerate",
	Spot = "Particle",
	SpotsPercent = 100,
	handle = 1812238595,
})

PlaceObj('ActionFXParticles', {
	Action = "AirExplosion",
	AlwaysVisible = true,
	DetailLevel = 60,
	EndRules = {},
	Moment = "start",
	Particles = "MDSLaser_Meteor_Hit",
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "AlienDiggerDigging",
	Actor = "AlienDigger",
	AlwaysVisible = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "AlienDigger_Digging",
	Scale = 150,
	SpotsPercent = 100,
	handle = 1952946677,
})

PlaceObj('ActionFXParticles', {
	Action = "AlienDiggerDigging",
	Actor = "AlienDiggerBig",
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "AlienDigger_Big_Sparks",
	Scale = 150,
	Spot = "Particle2",
	SpotsPercent = 100,
	handle = 986966770,
})

PlaceObj('ActionFXParticles', {
	Action = "AlienDiggerDigging",
	Actor = "AlienDiggerBig",
	AlwaysVisible = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "AlienDigger_Digging_Big",
	Scale = 150,
	SpotsPercent = 100,
	handle = 285066019,
})

PlaceObj('ActionFXParticles', {
	Action = "AlienDiggerLanding",
	Actor = "AlienDigger",
	AlwaysVisible = true,
	Delay = 250,
	DetailLevel = 60,
	Flags = "OnGround",
	Moment = "pre-hit-ground-2",
	Particles = "AlienDigger_Landing_Explosion",
	Scale = 120,
	SpotsPercent = 100,
	Time = 10000,
})

PlaceObj('ActionFXParticles', {
	Action = "AlienDiggerLanding",
	Actor = "AlienDiggerBig",
	AlwaysVisible = true,
	Delay = 250,
	DetailLevel = 60,
	Flags = "OnGround",
	Moment = "pre-hit-ground-2",
	Particles = "AlienDigger_Landing_Explosion",
	Scale = 220,
	SpotsPercent = 100,
	Time = 10000,
})

PlaceObj('ActionFXParticles', {
	Action = "AlienDiggerLanding",
	Actor = "AlienDigger",
	AlwaysVisible = true,
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "hit-ground",
		}),
	},
	Moment = "pre-hit-ground",
	Particles = "AlienDigger_Landing_Trail_Hit-Ground",
	Spot = "Particle",
	SpotsPercent = 100,
	Time = 10000,
	handle = 1077988191,
})

PlaceObj('ActionFXParticles', {
	Action = "AlienDiggerLanding",
	Actor = "AlienDiggerBig",
	AlwaysVisible = true,
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "hit-ground",
		}),
	},
	Moment = "pre-hit-ground",
	Particles = "AlienDigger_Landing_Trail_Hit-Ground",
	Scale = 160,
	Spot = "Particle",
	SpotsPercent = 100,
	Time = 10000,
	handle = 102452153,
})

PlaceObj('ActionFXParticles', {
	Action = "AlienDiggerLanding",
	Actor = "AlienDigger",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "hit-ground",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "AlienDigger_Landing_Lines",
	SpotsPercent = 100,
	handle = 1702375096,
})

PlaceObj('ActionFXParticles', {
	Action = "AlienDiggerLanding",
	Actor = "AlienDigger",
	AlwaysVisible = true,
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "hit-ground",
		}),
	},
	Moment = "start",
	Particles = "AlienDigger_Landing_Trail",
	Scale = 40,
	Spot = "Particle",
	SpotsPercent = 100,
	handle = 1741439970,
})

PlaceObj('ActionFXParticles', {
	Action = "AlienDiggerLanding",
	Actor = "AlienDiggerBig",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "hit-ground",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "AlienDigger_Landing_Lines",
	Scale = 200,
	SpotsPercent = 100,
	handle = 77587906,
})

PlaceObj('ActionFXParticles', {
	Action = "AlienDiggerLanding",
	Actor = "AlienDiggerBig",
	AlwaysVisible = true,
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "hit-ground",
		}),
	},
	Moment = "start",
	Particles = "AlienDigger_Landing_Trail_Big",
	Scale = 80,
	Spot = "Particle",
	SpotsPercent = 100,
	handle = 1838925717,
})

PlaceObj('ActionFXParticles', {
	Action = "AlienDiggerTakeoff",
	Actor = "AlienDigger",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "Mirrored",
	Moment = "start",
	Orientation = "SpotZ",
	Particles = "AlienDigger_Landing_Lines",
	SpotsPercent = 100,
	Time = 1000,
	handle = 1857962760,
})

PlaceObj('ActionFXParticles', {
	Action = "AlienDiggerTakeoff",
	Actor = "AlienDigger",
	AlwaysVisible = true,
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "hit-ground",
		}),
	},
	Moment = "start",
	Particles = "AlienDigger_Landing_Trail",
	Scale = 40,
	Spot = "Particle",
	SpotsPercent = 100,
	handle = 242054801,
})

PlaceObj('ActionFXParticles', {
	Action = "AlienDiggerTakeoff",
	Actor = "AlienDigger",
	AlwaysVisible = true,
	Attach = true,
	Delay = 100,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "AlienDigger_Launch",
	SpotsPercent = 100,
	Time = 10000,
	handle = 1750737710,
})

PlaceObj('ActionFXParticles', {
	Action = "AlienDiggerTakeoff",
	Actor = "AlienDigger",
	AlwaysVisible = true,
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "AlienDigger_LaunchSmoke",
	SpotsPercent = 100,
	Time = 10000,
	handle = 886620901,
})

PlaceObj('ActionFXParticles', {
	Action = "AlienDiggerTakeoff",
	Actor = "AlienDiggerBig",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "Mirrored",
	Moment = "start",
	Orientation = "SpotZ",
	Particles = "AlienDigger_Landing_Lines",
	Scale = 200,
	SpotsPercent = 100,
	Time = 1000,
	handle = 1786201516,
})

PlaceObj('ActionFXParticles', {
	Action = "AlienDiggerTakeoff",
	Actor = "AlienDiggerBig",
	AlwaysVisible = true,
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "hit-ground",
		}),
	},
	Moment = "start",
	Particles = "AlienDigger_Landing_Trail_Big",
	Scale = 80,
	Spot = "Particle",
	SpotsPercent = 100,
	handle = 278486630,
})

PlaceObj('ActionFXParticles', {
	Action = "AlienDiggerTakeoff",
	Actor = "AlienDiggerBig",
	AlwaysVisible = true,
	Attach = true,
	Delay = 100,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "AlienDigger_Launch",
	Scale = 200,
	SpotsPercent = 100,
	Time = 10000,
	handle = 2073879263,
})

PlaceObj('ActionFXParticles', {
	Action = "AlienDiggerTakeoff",
	Actor = "AlienDiggerBig",
	AlwaysVisible = true,
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "AlienDigger_LaunchSmoke_Big",
	SpotsPercent = 100,
	Time = 10000,
	handle = 946882393,
})

PlaceObj('ActionFXParticles', {
	Action = "ArtificialSunCharge",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(0, 0, 1250),
	OrientationAxis = -3,
	Particles = "ArtificialSun_Flare_Charge",
	Scale = 60,
	Spot = "Base",
	SpotsPercent = 100,
	Target = "ignore",
	handle = 611092961,
})

PlaceObj('ActionFXParticles', {
	Action = "ArtificialSunCharge",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	OrientationAxis = -3,
	Particles = "ArtificialSun_Lasers_Charge",
	Scale = 20,
	Spot = "Beam",
	SpotsPercent = 100,
	Target = "ignore",
	handle = 1912564986,
})

PlaceObj('ActionFXParticles', {
	Action = "ArtificialSunProduce",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(0, 0, 1250),
	OrientationAxis = -3,
	Particles = "ArtificialSun_Flare_Produce",
	Scale = 60,
	Spot = "Base",
	SpotsPercent = 100,
	Target = "ignore",
	handle = 1872530848,
})

PlaceObj('ActionFXParticles', {
	Action = "ArtificialSunProduce",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	OrientationAxis = -3,
	Particles = "ArtificialSun_Lasers_Charge",
	Scale = 20,
	Spot = "Beam",
	SpotsPercent = 100,
	Target = "ignore",
	handle = 340918211,
})

PlaceObj('ActionFXParticles', {
	Action = "BlackCubeDemolishBuilding",
	Attach = true,
	DetailLevel = 40,
	EndRules = {},
	Moment = "hit",
	Particles = "BlackCubeDemolishBuilding",
	Scale = 120,
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "Breakdown",
	Actor = "Drone",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Drone_Breakdown",
	Spot = "Lantern",
	Target = "ignore",
	handle = 2104076008,
})

PlaceObj('ActionFXParticles', {
	Action = "BuildingBigDemolishInside",
	DetailLevel = 60,
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "Construction_DemolishBuilding_Inside",
	Source = "ActionPos",
	Target = "ignore",
	Time = 5000,
})

PlaceObj('ActionFXParticles', {
	Action = "BuildingBigDemolishOutside",
	DetailLevel = 60,
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "Construction_DemolishBuilding_Big",
	Source = "ActionPos",
	Target = "ignore",
	Time = 5000,
})

PlaceObj('ActionFXParticles', {
	Action = "BuildingBigRemoveOutside",
	DetailLevel = 60,
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "Construction_RemoveBuilding_Big",
	Source = "ActionPos",
	Target = "ignore",
	Time = 5000,
})

PlaceObj('ActionFXParticles', {
	Action = "BuildingSmallDemolishInside",
	DetailLevel = 60,
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "Construction_DemolishBuilding_Inside",
	Source = "ActionPos",
	Target = "ignore",
	Time = 5000,
})

PlaceObj('ActionFXParticles', {
	Action = "BuildingSmallDemolishOutside",
	DetailLevel = 60,
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "Construction_DemolishBuilding",
	Source = "ActionPos",
	Target = "ignore",
	Time = 5000,
})

PlaceObj('ActionFXParticles', {
	Action = "BuildingSmallRemoveInside",
	DetailLevel = 60,
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "Construction_RemoveBuilding_Inside",
	Source = "ActionPos",
	Target = "ignore",
	Time = 5000,
})

PlaceObj('ActionFXParticles', {
	Action = "BuildingSmallRemoveOutside",
	DetailLevel = 60,
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "Construction_RemoveBuilding",
	Source = "ActionPos",
	Target = "ignore",
	Time = 5000,
})

PlaceObj('ActionFXParticles', {
	Action = "BurstOut",
	Actor = "Geyser_01",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Env_CO2Geyser",
	Target = "PrefabFeatureMarker",
	handle = 1558988116,
})

PlaceObj('ActionFXParticles', {
	Action = "BurstOut",
	Actor = "Geyser_02",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Env_CO2Geyser_02",
	Target = "PrefabFeatureMarker",
	handle = 499685799,
})

PlaceObj('ActionFXParticles', {
	Action = "BurstOut",
	Actor = "Geyser_03",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Env_SandGeyser",
	Target = "PrefabFeatureMarker",
	handle = 870162794,
})

PlaceObj('ActionFXParticles', {
	Action = "Capture",
	Actor = "MirrorSphere",
	Behavior = "BehaviorDetachAndDestroy",
	BehaviorMoment = "end",
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "OnGround",
	Moment = "start",
	Particles = "PowerDecoy_Capture",
	Scale = 150,
	Source = "Target",
	Target = "PowerDecoy",
	handle = 1643809009,
})

PlaceObj('ActionFXParticles', {
	Action = "Captured",
	Actor = "MirrorSphere",
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "OnGround",
	Moment = "start",
	Particles = "PowerDecoy_Captured",
	Scale = 150,
	Source = "Target",
	Target = "PowerDecoy",
	handle = 717317846,
})

PlaceObj('ActionFXParticles', {
	Action = "ChargedClean",
	Actor = "TriboelectricScrubberSphere",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "TriboelectricScrubber_CleanBuilding",
	Spot = "Ball",
	handle = 155984150,
})

PlaceObj('ActionFXParticles', {
	Action = "Charging",
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(0, 0, 100),
	Particles = "Rover_Charging",
	Target = "ElectricityGridElement",
	handle = 1563329989,
})

PlaceObj('ActionFXParticles', {
	Action = "Charging",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(0, 0, 100),
	Particles = "Rover_Charging",
	handle = 591310391,
})

PlaceObj('ActionFXParticles', {
	Action = "Clean",
	Actor = "Drone",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	OrientationAxis = 2,
	Particles = "Drone_Clean",
	Spot = "Lefthand",
	handle = 871479530,
})

PlaceObj('ActionFXParticles', {
	Action = "Clean",
	Actor = "Drone",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	OrientationAxis = 2,
	Particles = "Drone_Clean",
	Spot = "Righthand",
	handle = 31618428,
})

PlaceObj('ActionFXParticles', {
	Action = "ClickMove",
	Actor = "Drone",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndAction', "ClickMove",
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Click",
	Source = "ActionPos",
	Time = 500,
	handle = 77670855,
})

PlaceObj('ActionFXParticles', {
	Action = "ClickMove",
	Actor = "MultiSelectionWrapper",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndAction', "ClickMove",
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Click",
	Source = "ActionPos",
	Time = 500,
	group = "Default",
	handle = 53844045,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "ClickMove",
	Actor = "RCTransport",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndAction', "ClickMove",
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Click",
	Source = "ActionPos",
	Time = 500,
	handle = 571232911,
})

PlaceObj('ActionFXParticles', {
	Action = "ClickMove",
	Actor = "Rover",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndAction', "ClickMove",
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Click",
	Source = "ActionPos",
	Time = 500,
	handle = 1585923160,
})

PlaceObj('ActionFXParticles', {
	Action = "ClickMove",
	Actor = "Workshop",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndAction', "ClickMove",
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Click",
	Source = "ActionPos",
	Time = 500,
	handle = 875155462,
})

PlaceObj('ActionFXParticles', {
	Action = "ClickPosMarker",
	Actor = "Workshop",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Click_Pos",
	Scale = 200,
	Source = "ActionPos",
	Spot = "Center",
	Time = 500,
	handle = 1605847635,
})

PlaceObj('ActionFXParticles', {
	Action = "Construct",
	Actor = "RCTerraformer",
	AlwaysVisible = true,
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "Hit2",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "Hit1",
	Particles = "RCTerraformer_Construct",
	Spot = "Digger",
	handle = 730280233,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Construct",
	Actor = "Drone",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "Mirrored",
	Moment = "start",
	Particles = "Drone_Construct",
	Spot = "Lefthand",
	handle = 672170701,
})

PlaceObj('ActionFXParticles', {
	Action = "Construct",
	Actor = "Drone",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Drone_Construct",
	Spot = "Righthand",
	handle = 191691285,
})

PlaceObj('ActionFXParticles', {
	Action = "Construct",
	Actor = "RCConstructor",
	Attach = true,
	Behavior = "BehaviorDetachAndDestroy",
	BehaviorMoment = "end",
	DetailLevel = 60,
	Moment = "start",
	Particles = "RCConstructor_Construct",
	Spot = "Hand",
	SpotsPercent = 100,
	handle = 2076050412,
})

PlaceObj('ActionFXParticles', {
	Action = "ConstructingDrones",
	Actor = "DroneHub",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "End1",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "Hit1",
	OrientationAxis = 2,
	Particles = "DroneHub_Construciton",
	Source = "Target",
	Spot = "Particle",
	SpotsPercent = 100,
	handle = 1596320585,
})

PlaceObj('ActionFXParticles', {
	Action = "ConstructingDrones",
	Actor = "DroneHub",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "End2",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "Hit2",
	OrientationAxis = 2,
	Particles = "DroneHub_Construciton",
	Source = "Target",
	Spot = "Particle",
	SpotsPercent = 100,
	handle = 556279411,
})

PlaceObj('ActionFXParticles', {
	Action = "ConstructingDrones",
	Actor = "DroneHub",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "End3",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "Hit3",
	OrientationAxis = 2,
	Particles = "DroneHub_Construciton",
	Source = "Target",
	Spot = "Particle",
	SpotsPercent = 100,
	handle = 793738565,
})

PlaceObj('ActionFXParticles', {
	Action = "ConstructingDrones",
	Actor = "DroneHub",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "End4",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "Hit4",
	OrientationAxis = 2,
	Particles = "DroneHub_Construciton",
	Source = "Target",
	Spot = "Particle",
	SpotsPercent = 100,
	handle = 1191098491,
})

PlaceObj('ActionFXParticles', {
	Action = "CrystalActive",
	Actor = "Crystal",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Crystal_Center_Alive",
	Scale = 200,
	Spot = "Crystalb1",
	handle = 164259958,
})

PlaceObj('ActionFXParticles', {
	Action = "CrystalActive",
	Actor = "Crystal",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Crystal_Center_Alive",
	Scale = 200,
	Spot = "Crystalb4",
	handle = 545149899,
})

PlaceObj('ActionFXParticles', {
	Action = "CrystalActive",
	Actor = "Crystal",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Crystal_Center_Alive",
	Scale = 200,
	Spot = "Crystalb6",
	handle = 1422245656,
})

PlaceObj('ActionFXParticles', {
	Action = "CrystalActive",
	Actor = "CrystalsBig",
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "OnGround",
	Moment = "start",
	OffsetDir = "",
	Particles = "Crystal_PoweredUp",
	Scale = 80,
	Target = "ignore",
	handle = 671374803,
})

PlaceObj('ActionFXParticles', {
	Action = "CrystalActive",
	Actor = "CrystalsSmall",
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "OnGround",
	Moment = "start",
	OffsetDir = "",
	Particles = "Crystal_PoweredUp",
	Scale = 55,
	Target = "ignore",
	handle = 618709516,
})

PlaceObj('ActionFXParticles', {
	Action = "CrystalCompose",
	Actor = "CrystalShard",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "go",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "attach",
	Particles = "Crystal_Shard_Attach",
	Scale = 600,
	handle = 53888569,
})

PlaceObj('ActionFXParticles', {
	Action = "CrystalCompose",
	Actor = "CrystalShard",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "attach",
	Particles = "Crystal_Shard_Attach_Trail",
	handle = 1636033009,
})

PlaceObj('ActionFXParticles', {
	Action = "CrystalCompose",
	Actor = "Crystal",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "go",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "attach1",
	Particles = "Crystal_Center_Compose_Grow",
	Scale = 150,
	handle = 1315322880,
})

PlaceObj('ActionFXParticles', {
	Action = "CrystalCompose",
	Actor = "Crystal",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "go",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "attach10",
	Particles = "Crystal_Center_Compose_Grow_02",
	Scale = 540,
	handle = 305216978,
})

PlaceObj('ActionFXParticles', {
	Action = "CrystalCompose",
	Actor = "Crystal",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "go",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "attach11",
	Particles = "Crystal_Center_Compose_Grow_02",
	Scale = 580,
	handle = 1354817621,
})

PlaceObj('ActionFXParticles', {
	Action = "CrystalCompose",
	Actor = "Crystal",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "go",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "attach12",
	Particles = "Crystal_Center_Compose_Grow_02",
	Scale = 600,
	handle = 1669220949,
})

PlaceObj('ActionFXParticles', {
	Action = "CrystalCompose",
	Actor = "Crystal",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "go",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "attach2",
	Particles = "Crystal_Center_Compose_Grow",
	Scale = 250,
	handle = 363544333,
})

PlaceObj('ActionFXParticles', {
	Action = "CrystalCompose",
	Actor = "Crystal",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "go",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "attach3",
	Particles = "Crystal_Center_Compose_Grow",
	Scale = 400,
	handle = 525261199,
})

PlaceObj('ActionFXParticles', {
	Action = "CrystalCompose",
	Actor = "Crystal",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "go",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "attach4",
	Particles = "Crystal_Center_Compose_Grow_02",
	Scale = 300,
	handle = 1510101083,
})

PlaceObj('ActionFXParticles', {
	Action = "CrystalCompose",
	Actor = "Crystal",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "go",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "attach5",
	Particles = "Crystal_Center_Compose_Grow_02",
	Scale = 340,
	handle = 298879274,
})

PlaceObj('ActionFXParticles', {
	Action = "CrystalCompose",
	Actor = "Crystal",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "go",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "attach6",
	Particles = "Crystal_Center_Compose_Grow_02",
	Scale = 380,
	handle = 677442557,
})

PlaceObj('ActionFXParticles', {
	Action = "CrystalCompose",
	Actor = "Crystal",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "go",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "attach7",
	Particles = "Crystal_Center_Compose_Grow_02",
	Scale = 420,
	handle = 961001260,
})

PlaceObj('ActionFXParticles', {
	Action = "CrystalCompose",
	Actor = "Crystal",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "go",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "attach8",
	Particles = "Crystal_Center_Compose_Grow_02",
	Scale = 460,
	handle = 124011569,
})

PlaceObj('ActionFXParticles', {
	Action = "CrystalCompose",
	Actor = "Crystal",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "go",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "attach9",
	Particles = "Crystal_Center_Compose_Grow_02",
	Scale = 500,
	handle = 1169587951,
})

PlaceObj('ActionFXParticles', {
	Action = "CrystalCompose",
	Actor = "Crystal",
	DetailLevel = 60,
	Moment = "end",
	Particles = "Crystal_Center_Compose_End",
	Scale = 300,
	Time = 10000,
})

PlaceObj('ActionFXParticles', {
	Action = "CrystalCompose",
	Actor = "Crystal",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "go",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "go",
	Particles = "Crystal_Center_Compose_Go",
	Scale = 300,
	handle = 965014142,
})

PlaceObj('ActionFXParticles', {
	Action = "CrystalCompose",
	Actor = "Crystal",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "go",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Crystal_Center_Compose",
	Scale = 300,
	handle = 560942446,
})

PlaceObj('ActionFXParticles', {
	Action = "CrystalCompose",
	Actor = "CrystalShard",
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "attach",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	OffsetDir = "",
	Orientation = "ActionDir",
	Particles = "Crystal_Center_Compose_Direction",
	Scale = 200,
	Source = "ActionPos",
	handle = 898467372,
})

PlaceObj('ActionFXParticles', {
	Action = "CrystalCompose",
	Actor = "CrystalShard",
	Behavior = "BehaviorFollow",
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "attach",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	OffsetDir = "",
	Orientation = "ActionDir",
	Particles = "Crystal_Takeoff_Approach",
	Scale = 60,
	Target = "ignore",
	handle = 2118871931,
})

PlaceObj('ActionFXParticles', {
	Action = "CrystalLiftoff",
	Actor = "Crystal",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "go",
	Particles = "Crystal_Leave",
	Scale = 200,
	handle = 1490851637,
})

PlaceObj('ActionFXParticles', {
	Action = "CrystalLiftoff",
	Actor = "Crystal",
	Attach = true,
	Behavior = "BehaviorDetachAndDestroy",
	BehaviorMoment = "end",
	Delay = 500,
	DetailLevel = 60,
	Moment = "go",
	Particles = "Crystal_Leave_Beam_Takeoff",
	Scale = 200,
	handle = 819256430,
})

PlaceObj('ActionFXParticles', {
	Action = "CrystalLiftoff",
	Actor = "Crystal",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "go",
	Particles = "Crystal_Leave_Dust",
	Scale = 200,
	handle = 134620235,
})

PlaceObj('ActionFXParticles', {
	Action = "CrystalLiftoff",
	Actor = "Crystal",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Crystal_Leave_Charge",
	Scale = 200,
	Time = 8000,
	handle = 433506680,
})

PlaceObj('ActionFXParticles', {
	Action = "CrystalLiftoff",
	Actor = "CrystalShard",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Crystal_Shard_Beam_Takeoff",
	Scale = 60,
	Spot = "Crystal",
	handle = 593937359,
})

PlaceObj('ActionFXParticles', {
	Action = "CrystalLiftoff",
	Actor = "CrystalShard",
	Attach = true,
	Delay = 1500,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "hover",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	OffsetDir = "",
	Particles = "Crystals_Leave_Dust",
	Scale = 150,
	handle = 2038953783,
})

PlaceObj('ActionFXParticles', {
	Action = "CrystalPoweredUp",
	Actor = "CrystalsBig",
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "OnGround",
	Moment = "start",
	Particles = "Crystal_PoweredUp_Beam",
	Scale = 80,
	Target = "ignore",
	handle = 1936566628,
})

PlaceObj('ActionFXParticles', {
	Action = "CrystalPoweredUp",
	Actor = "CrystalsBig",
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "OnGround",
	Moment = "start",
	Particles = "Crystal_PoweredUp_Beam_Overview",
	Target = "ignore",
	handle = 1049539094,
})

PlaceObj('ActionFXParticles', {
	Action = "CrystalPoweredUp",
	Actor = "CrystalsSmall",
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "OnGround",
	Moment = "start",
	Particles = "Crystal_PoweredUp_Beam",
	Scale = 55,
	Target = "ignore",
	handle = 386043488,
})

PlaceObj('ActionFXParticles', {
	Action = "CrystalPoweredUp",
	Actor = "CrystalsSmall",
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "OnGround",
	Moment = "start",
	Particles = "Crystal_PoweredUp_Beam_Overview",
	Scale = 75,
	Target = "ignore",
	handle = 1261550412,
})

PlaceObj('ActionFXParticles', {
	Action = "Dead",
	Attach = true,
	DetailLevel = 40,
	Moment = "start",
	Particles = "Drone_Dead_Smoke",
	Target = "ignore",
	Time = 5000,
})

PlaceObj('ActionFXParticles', {
	Action = "Decelerate",
	Actor = "JumperShuttle",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(-100, 0, 0),
	Particles = "Shuttle_Jumper_Ignition_Decelerate",
	Spot = "Particle",
	SpotsPercent = 100,
	handle = 1319421591,
})

PlaceObj('ActionFXParticles', {
	Action = "Decelerate",
	Actor = "JumperShuttle",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Shuttle_Jumper_Land",
	Spot = "Particle",
	SpotsPercent = 100,
	handle = 1472520070,
})

PlaceObj('ActionFXParticles', {
	Action = "Deconstruct",
	Actor = "AlienDigger",
	AlwaysVisible = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "OnGround",
	Moment = "end",
	Particles = "AlienDigger_Destruction",
	Scale = 150,
	SpotsPercent = 100,
})

PlaceObj('ActionFXParticles', {
	Action = "Deconstruct",
	Actor = "AlienDiggerBig",
	AlwaysVisible = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "OnGround",
	Moment = "end",
	Particles = "AlienDigger_Destruction",
	Scale = 200,
	SpotsPercent = 100,
})

PlaceObj('ActionFXParticles', {
	Action = "Deconstruct",
	Actor = "AlienDigger",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndAction', "AlienDiggerTakeoff",
			'EndMoment', "start",
		}),
	},
	Moment = "start",
	Particles = "AlienDigger_Deconstruct",
	SpotsPercent = 100,
	handle = 795683759,
})

PlaceObj('ActionFXParticles', {
	Action = "Deconstruct",
	Actor = "AlienDiggerBig",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndAction', "AlienDiggerTakeoff",
			'EndMoment', "start",
		}),
	},
	Moment = "start",
	Particles = "AlienDigger_Deconstruct",
	Scale = 190,
	SpotsPercent = 100,
	handle = 94999724,
})

PlaceObj('ActionFXParticles', {
	Action = "Deconstruct",
	Actor = "Drone",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "Mirrored",
	Moment = "start",
	Particles = "Drone_Deconstruct",
	Spot = "Lefthand",
	handle = 893047132,
})

PlaceObj('ActionFXParticles', {
	Action = "Deconstruct",
	Actor = "Drone",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Drone_Deconstruct",
	Spot = "Righthand",
	handle = 1124406887,
})

PlaceObj('ActionFXParticles', {
	Action = "Demolish",
	Actor = "ElectricityGridElement",
	DetailLevel = 60,
	EndRules = {},
	Flags = "OnGround",
	Moment = "end",
	Particles = "Construction_RemoveBuilding",
	Spot = "Center",
	Time = 500,
})

PlaceObj('ActionFXParticles', {
	Action = "Demolish",
	Actor = "LifeSupportGridElement",
	DetailLevel = 60,
	EndRules = {},
	Flags = "OnGround",
	Moment = "end",
	Particles = "Construction_RemoveBuilding",
	Spot = "Center",
	Time = 500,
})

PlaceObj('ActionFXParticles', {
	Action = "Dig",
	Actor = "MirrorSphere",
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "OnGround",
	Moment = "hit-moment1",
	Offset = point(0, 0, 1000),
	Particles = "MirrorSphere_Dig",
	Spot = "Center",
	Target = "ignore",
	Time = 3000,
	handle = 1556751352,
})

PlaceObj('ActionFXParticles', {
	Action = "Dig",
	Actor = "MirrorSphere",
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "OnGround",
	Moment = "hit-moment2",
	Offset = point(0, 0, 1000),
	Particles = "MirrorSphere_Dig",
	Scale = 125,
	Spot = "Center",
	Target = "ignore",
	Time = 3000,
	handle = 895669484,
})

PlaceObj('ActionFXParticles', {
	Action = "Dig",
	Actor = "MirrorSphere",
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "OnGround",
	Moment = "hit-moment3",
	Offset = point(0, 0, 1000),
	Particles = "MirrorSphere_Dig",
	Scale = 150,
	Spot = "Center",
	Target = "ignore",
	Time = 3000,
	handle = 1129804633,
})

PlaceObj('ActionFXParticles', {
	Action = "Discharging",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(0, -200, 0),
	Particles = "Rover_Discharging",
	Scale = 150,
	Spot = "Particle1",
	handle = 757623046,
})

PlaceObj('ActionFXParticles', {
	Action = "DomeExplosion",
	AlwaysVisible = true,
	DetailLevel = 60,
	EndRules = {},
	Moment = "start",
	Particles = "Meteor_Explosion_Dome",
	Scale = 120,
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "DrainWater",
	Actor = "Firefly",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Firefly_DranWater_Trail",
	Spot = "Particle",
	handle = 697999810,
})

PlaceObj('ActionFXParticles', {
	Action = "Drill",
	Actor = "RCDriller",
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "Hit",
	OrientationAxis = 2,
	Particles = "RCDriller_Steam",
	Spot = "Particle",
	SpotsPercent = 100,
	Time = 5000,
	handle = 998049653,
})

PlaceObj('ActionFXParticles', {
	Action = "DroneExplode",
	Attach = true,
	DetailLevel = 60,
	Moment = "start",
	Particles = "Drone_Explode",
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "DroneRechargeCoilArc",
	Actor = "RechargeStation",
	Attach = true,
	DetailLevel = 60,
	Moment = "start",
	Particles = "Drone_WirelessCharging",
	Source = "Target",
	Target = "Drone",
	Time = 5000,
})

PlaceObj('ActionFXParticles', {
	Action = "DroneRechargePulse",
	Actor = "RechargeStation",
	Moment = "start",
	Particles = "RechargeStation_WirelessCharging",
	Target = "ignore",
	Time = 5000,
})

PlaceObj('ActionFXParticles', {
	Action = "Dust",
	Actor = "JumperShuttle",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(0, 0, 100),
	Particles = "Shuttle_LaunchSmoke",
	SpotsPercent = 100,
	handle = 331067818,
})

PlaceObj('ActionFXParticles', {
	Action = "Dust",
	Actor = "Shuttle",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(0, 0, 100),
	Particles = "Shuttle_LaunchSmoke",
	SpotsPercent = 100,
	handle = 1986624365,
})

PlaceObj('ActionFXParticles', {
	Action = "ElectrostaticStorm",
	AlwaysVisible = true,
	DetailLevel = 40,
	Moment = "hit-moment1",
	Particles = "ElStorm_Clouds",
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "ElectrostaticStorm",
	AlwaysVisible = true,
	Moment = "hit-moment1",
	Particles = "ElStorm_Lightning_01",
	Scale = 200,
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "ElectrostaticStorm",
	AlwaysVisible = true,
	DetailLevel = 40,
	Moment = "hit-moment2",
	Particles = "ElStorm_Clouds",
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "ElectrostaticStorm",
	AlwaysVisible = true,
	Moment = "hit-moment2",
	Particles = "ElStorm_Lightning_02",
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "ElectrostaticStorm",
	AlwaysVisible = true,
	DetailLevel = 40,
	Moment = "hit-moment3",
	Particles = "ElStorm_Clouds",
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "ElectrostaticStorm",
	AlwaysVisible = true,
	Moment = "hit-moment3",
	Particles = "ElStorm_Lightning_03",
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "ElectrostaticStorm",
	AlwaysVisible = true,
	DetailLevel = 40,
	Moment = "hit-moment4",
	Particles = "ElStorm_Clouds",
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "ElectrostaticStorm",
	AlwaysVisible = true,
	Moment = "hit-moment4",
	Particles = "ElStorm_Lightning_01",
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "ElectrostaticStormArea",
	Moment = "start",
	Particles = "ElStorm_Lightning_01_Area",
	Scale = 400,
	Source = "ActionPos",
	Target = "ignore",
	Time = 15000,
})

PlaceObj('ActionFXParticles', {
	Action = "ElectrostaticStormArea",
	Moment = "start",
	Particles = "ElStorm_Lightning_01_Area_Hit",
	Scale = 400,
	Source = "ActionPos",
	Target = "ignore",
	Time = 5000,
})

PlaceObj('ActionFXParticles', {
	Action = "Emerge",
	Actor = "Firefly",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Offset = point(0, 0, -500),
	Particles = "Fireflies_Spawn",
	Scale = 600,
	Source = "Target",
	Time = 5000,
	handle = 243394727,
})

PlaceObj('ActionFXParticles', {
	Action = "EmergencyPower",
	Actor = "Drone",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Drone_Emergency",
	Spot = "Lantern",
	Target = "ignore",
	handle = 583284500,
})

PlaceObj('ActionFXParticles', {
	Action = "EmergencyRecharge",
	Actor = "Drone",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "hooking",
	Offset = point(130, 0, 0),
	Particles = "Drone_Recharge_Emergency",
	Spot = "Headlight",
	handle = 929162598,
})

PlaceObj('ActionFXParticles', {
	Action = "EmergencyRecharge",
	Actor = "Drone",
	Attach = true,
	Delay = 2800,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(0, 20, 0),
	Particles = "Drone_EM_Recharge_Hands",
	Spot = "Lefthand",
	handle = 76954587,
})

PlaceObj('ActionFXParticles', {
	Action = "EmergencyRecharge",
	Actor = "Drone",
	Attach = true,
	Delay = 2800,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(0, 20, 0),
	Particles = "Drone_EM_Recharge_Hands",
	Spot = "Righthand",
	handle = 622014909,
})

PlaceObj('ActionFXParticles', {
	Action = "ExcavatorDigging",
	Actor = "ExcavatorShovel",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "Out1",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "Hit1",
	Particles = "Excavator_Shovel_Dig",
	Spot = "Particle1",
	handle = 1229058711,
})

PlaceObj('ActionFXParticles', {
	Action = "ExcavatorDigging",
	Actor = "ExcavatorShovel",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "Out10",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "Hit10",
	Particles = "Excavator_Shovel_Dig",
	Spot = "Particle10",
	handle = 1814009259,
})

PlaceObj('ActionFXParticles', {
	Action = "ExcavatorDigging",
	Actor = "ExcavatorShovel",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "Out11",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "Hit11",
	Particles = "Excavator_Shovel_Dig",
	Spot = "Particle11",
	handle = 1044340999,
})

PlaceObj('ActionFXParticles', {
	Action = "ExcavatorDigging",
	Actor = "ExcavatorShovel",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "Out12",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "Hit12",
	Particles = "Excavator_Shovel_Dig",
	Spot = "Particle12",
	handle = 1924406229,
})

PlaceObj('ActionFXParticles', {
	Action = "ExcavatorDigging",
	Actor = "ExcavatorShovel",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "Out2",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "Hit2",
	Particles = "Excavator_Shovel_Dig",
	Spot = "Particle2",
	handle = 1580766137,
})

PlaceObj('ActionFXParticles', {
	Action = "ExcavatorDigging",
	Actor = "ExcavatorShovel",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "Out3",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "Hit3",
	Particles = "Excavator_Shovel_Dig",
	Spot = "Particle3",
	handle = 943797499,
})

PlaceObj('ActionFXParticles', {
	Action = "ExcavatorDigging",
	Actor = "ExcavatorShovel",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "Out4",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "Hit4",
	Particles = "Excavator_Shovel_Dig",
	Spot = "Particle4",
	handle = 1234553762,
})

PlaceObj('ActionFXParticles', {
	Action = "ExcavatorDigging",
	Actor = "ExcavatorShovel",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "Out5",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "Hit5",
	Particles = "Excavator_Shovel_Dig",
	Spot = "Particle5",
	handle = 685167536,
})

PlaceObj('ActionFXParticles', {
	Action = "ExcavatorDigging",
	Actor = "ExcavatorShovel",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "Out6",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "Hit6",
	Particles = "Excavator_Shovel_Dig",
	Spot = "Particle6",
	handle = 975300927,
})

PlaceObj('ActionFXParticles', {
	Action = "ExcavatorDigging",
	Actor = "ExcavatorShovel",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "Out7",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "Hit7",
	Particles = "Excavator_Shovel_Dig",
	Spot = "Particle7",
	handle = 2010674702,
})

PlaceObj('ActionFXParticles', {
	Action = "ExcavatorDigging",
	Actor = "ExcavatorShovel",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "Out8",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "Hit8",
	Particles = "Excavator_Shovel_Dig",
	Spot = "Particle8",
	handle = 2090870590,
})

PlaceObj('ActionFXParticles', {
	Action = "ExcavatorDigging",
	Actor = "ExcavatorShovel",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "Out9",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "Hit9",
	Particles = "Excavator_Shovel_Dig",
	Spot = "Particle9",
	handle = 1701891853,
})

PlaceObj('ActionFXParticles', {
	Action = "ExcavatorDigging",
	Actor = "ExcavatorShovel",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "Out1",
	Particles = "Excavator_Shovel_Throw",
	Spot = "Particle1",
	Time = 5000,
	handle = 1832530462,
})

PlaceObj('ActionFXParticles', {
	Action = "ExcavatorDigging",
	Actor = "ExcavatorShovel",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "Out10",
	Particles = "Excavator_Shovel_Throw",
	Spot = "Particle10",
	Time = 5000,
	handle = 265019335,
})

PlaceObj('ActionFXParticles', {
	Action = "ExcavatorDigging",
	Actor = "ExcavatorShovel",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "Out11",
	Particles = "Excavator_Shovel_Throw",
	Spot = "Particle11",
	Time = 5000,
	handle = 1679438606,
})

PlaceObj('ActionFXParticles', {
	Action = "ExcavatorDigging",
	Actor = "ExcavatorShovel",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "Out12",
	Particles = "Excavator_Shovel_Throw",
	Spot = "Particle12",
	Time = 5000,
	handle = 1456641064,
})

PlaceObj('ActionFXParticles', {
	Action = "ExcavatorDigging",
	Actor = "ExcavatorShovel",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "Out2",
	Particles = "Excavator_Shovel_Throw",
	Spot = "Particle2",
	Time = 5000,
	handle = 134122140,
})

PlaceObj('ActionFXParticles', {
	Action = "ExcavatorDigging",
	Actor = "ExcavatorShovel",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "Out3",
	Particles = "Excavator_Shovel_Throw",
	Spot = "Particle3",
	Time = 5000,
	handle = 146344676,
})

PlaceObj('ActionFXParticles', {
	Action = "ExcavatorDigging",
	Actor = "ExcavatorShovel",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "Out4",
	Particles = "Excavator_Shovel_Throw",
	Spot = "Particle4",
	Time = 5000,
	handle = 2130912515,
})

PlaceObj('ActionFXParticles', {
	Action = "ExcavatorDigging",
	Actor = "ExcavatorShovel",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "Out5",
	Particles = "Excavator_Shovel_Throw",
	Spot = "Particle5",
	Time = 5000,
	handle = 1367953511,
})

PlaceObj('ActionFXParticles', {
	Action = "ExcavatorDigging",
	Actor = "ExcavatorShovel",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "Out6",
	Particles = "Excavator_Shovel_Throw",
	Spot = "Particle6",
	Time = 5000,
	handle = 2087704513,
})

PlaceObj('ActionFXParticles', {
	Action = "ExcavatorDigging",
	Actor = "ExcavatorShovel",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "Out7",
	Particles = "Excavator_Shovel_Throw",
	Spot = "Particle7",
	Time = 5000,
	handle = 540407678,
})

PlaceObj('ActionFXParticles', {
	Action = "ExcavatorDigging",
	Actor = "ExcavatorShovel",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "Out8",
	Particles = "Excavator_Shovel_Throw",
	Spot = "Particle8",
	Time = 5000,
	handle = 502179266,
})

PlaceObj('ActionFXParticles', {
	Action = "ExcavatorDigging",
	Actor = "ExcavatorShovel",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "Out9",
	Particles = "Excavator_Shovel_Throw",
	Spot = "Particle9",
	Time = 5000,
	handle = 133210846,
})

PlaceObj('ActionFXParticles', {
	Action = "FarmWater",
	Actor = "FarmSprinkler",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "HydroponicFarm_Shower",
	Spot = "Particle",
	SpotsPercent = 100,
	handle = 74047923,
})

PlaceObj('ActionFXParticles', {
	Action = "Fireworks_1",
	Delay = 400,
	Moment = "start",
	OffsetDir = "ActionDir",
	Orientation = "ActionDir",
	OrientationAxis = 3,
	Particles = "Fireworks_Ball_Blue_Mighty",
	Scale = 80,
	Source = "ActionPos",
})

PlaceObj('ActionFXParticles', {
	Action = "Fireworks_1",
	Moment = "start",
	OffsetDir = "ActionDir",
	Orientation = "ActionDir",
	OrientationAxis = 3,
	Particles = "Fireworks_Ball_Start",
	Scale = 80,
	Source = "ActionPos",
})

PlaceObj('ActionFXParticles', {
	Action = "Fireworks_10",
	Moment = "start",
	OffsetDir = "ActionDir",
	Orientation = "ActionDir",
	OrientationAxis = 3,
	Particles = "Fireworks_Ball_Planet_02",
	Scale = 80,
	Source = "ActionPos",
})

PlaceObj('ActionFXParticles', {
	Action = "Fireworks_11",
	Moment = "start",
	OffsetDir = "ActionDir",
	Orientation = "ActionDir",
	OrientationAxis = 3,
	Particles = "Fireworks_Snake",
	Scale = 80,
	Source = "ActionPos",
})

PlaceObj('ActionFXParticles', {
	Action = "Fireworks_12",
	Moment = "start",
	OffsetDir = "ActionDir",
	Orientation = "ActionDir",
	OrientationAxis = 3,
	Particles = "Fireworks_Snake_02",
	Scale = 80,
	Source = "ActionPos",
})

PlaceObj('ActionFXParticles', {
	Action = "Fireworks_13",
	Moment = "start",
	OffsetDir = "ActionDir",
	Orientation = "ActionDir",
	OrientationAxis = 3,
	Particles = "Fireworks_Snake_03",
	Scale = 80,
	Source = "ActionPos",
})

PlaceObj('ActionFXParticles', {
	Action = "Fireworks_14",
	Moment = "start",
	OffsetDir = "ActionDir",
	Orientation = "ActionDir",
	OrientationAxis = 3,
	Particles = "Fireworks_Snake_Boom",
	Scale = 80,
	Source = "ActionPos",
})

PlaceObj('ActionFXParticles', {
	Action = "Fireworks_15",
	Moment = "start",
	OffsetDir = "ActionDir",
	Orientation = "ActionDir",
	OrientationAxis = 3,
	Particles = "Fireworks_Snake_Boom_02",
	Scale = 80,
	Source = "ActionPos",
})

PlaceObj('ActionFXParticles', {
	Action = "Fireworks_16",
	Moment = "start",
	OffsetDir = "ActionDir",
	Orientation = "ActionDir",
	OrientationAxis = 3,
	Particles = "Fireworks_Snake_Boom_03",
	Scale = 80,
	Source = "ActionPos",
})

PlaceObj('ActionFXParticles', {
	Action = "Fireworks_17",
	Moment = "start",
	OffsetDir = "ActionDir",
	Orientation = "ActionDir",
	OrientationAxis = 3,
	Particles = "Fireworks_Snake_Boom_04",
	Scale = 80,
	Source = "ActionPos",
})

PlaceObj('ActionFXParticles', {
	Action = "Fireworks_18",
	Moment = "start",
	OffsetDir = "ActionDir",
	Orientation = "ActionDir",
	OrientationAxis = 3,
	Particles = "Fireworks_Ball_TrailsOnly",
	Scale = 80,
	Source = "ActionPos",
})

PlaceObj('ActionFXParticles', {
	Action = "Fireworks_2",
	Delay = 400,
	Moment = "start",
	OffsetDir = "ActionDir",
	Orientation = "ActionDir",
	OrientationAxis = 3,
	Particles = "Fireworks_Ball_Red_Mighty",
	Scale = 80,
	Source = "ActionPos",
})

PlaceObj('ActionFXParticles', {
	Action = "Fireworks_2",
	Moment = "start",
	OffsetDir = "ActionDir",
	Orientation = "ActionDir",
	OrientationAxis = 3,
	Particles = "Fireworks_Ball_Start",
	Scale = 80,
	Source = "ActionPos",
})

PlaceObj('ActionFXParticles', {
	Action = "Fireworks_3",
	Moment = "start",
	OffsetDir = "ActionDir",
	Orientation = "ActionDir",
	OrientationAxis = 3,
	Particles = "Fireworks_Ball_MultipleTimes",
	Scale = 80,
	Source = "ActionPos",
})

PlaceObj('ActionFXParticles', {
	Action = "Fireworks_3",
	Moment = "start",
	OffsetDir = "ActionDir",
	Orientation = "ActionDir",
	OrientationAxis = 3,
	Particles = "Fireworks_Ball_MultipleTimes_Start",
	Scale = 80,
	Source = "ActionPos",
})

PlaceObj('ActionFXParticles', {
	Action = "Fireworks_4",
	Moment = "start",
	OffsetDir = "ActionDir",
	Orientation = "ActionDir",
	OrientationAxis = 3,
	Particles = "Fireworks_Ball_Multicolored",
	Scale = 80,
	Source = "ActionPos",
})

PlaceObj('ActionFXParticles', {
	Action = "Fireworks_5",
	Moment = "start",
	OffsetDir = "ActionDir",
	Orientation = "ActionDir",
	OrientationAxis = 3,
	Particles = "Fireworks_Ball_Green",
	Scale = 80,
	Source = "ActionPos",
})

PlaceObj('ActionFXParticles', {
	Action = "Fireworks_6",
	Moment = "start",
	OffsetDir = "ActionDir",
	Orientation = "ActionDir",
	OrientationAxis = 3,
	Particles = "Fireworks_Ball_Purple",
	Scale = 80,
	Source = "ActionPos",
})

PlaceObj('ActionFXParticles', {
	Action = "Fireworks_7",
	Moment = "start",
	OffsetDir = "ActionDir",
	Orientation = "ActionDir",
	OrientationAxis = 3,
	Particles = "Fireworks_Ball_Red",
	Scale = 80,
	Source = "ActionPos",
})

PlaceObj('ActionFXParticles', {
	Action = "Fireworks_8",
	Moment = "start",
	OffsetDir = "ActionDir",
	Orientation = "ActionDir",
	OrientationAxis = 3,
	Particles = "Fireworks_Ball_Yellow",
	Scale = 80,
	Source = "ActionPos",
})

PlaceObj('ActionFXParticles', {
	Action = "Fireworks_9",
	Moment = "start",
	OffsetDir = "ActionDir",
	Orientation = "ActionDir",
	OrientationAxis = 3,
	Particles = "Fireworks_Ball_Planet",
	Scale = 80,
	Source = "ActionPos",
})

PlaceObj('ActionFXParticles', {
	Action = "Freeze",
	Actor = "MirrorSphere",
	Attach = true,
	BehaviorMoment = "end",
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "MirrorShpere_Freeze",
	Scale = 150,
	Spot = "Center",
	Target = "ignore",
	handle = 72443782,
})

PlaceObj('ActionFXParticles', {
	Action = "FuelExplosion",
	Delay = 100,
	DetailLevel = 60,
	Moment = "start",
	Particles = "MDSLaser_Meteor_Hit",
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "Gather",
	Actor = "Drone",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Drone_Gather_Metals",
	Spot = "Lefthand",
	Target = "SurfaceDepositMetals",
	handle = 1981238510,
})

PlaceObj('ActionFXParticles', {
	Action = "Gather",
	Actor = "Drone",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Drone_Gather_Metals",
	Spot = "Righthand",
	Target = "SurfaceDepositMetals",
	handle = 930363818,
})

PlaceObj('ActionFXParticles', {
	Action = "Gather",
	Actor = "Drone",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Drone_Gather_Polymers",
	Spot = "Lefthand",
	Target = "SurfaceDepositPolymers",
	handle = 283953348,
})

PlaceObj('ActionFXParticles', {
	Action = "Gather",
	Actor = "Drone",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Drone_Gather_Polymers",
	Spot = "Righthand",
	Target = "SurfaceDepositPolymers",
	handle = 1051719277,
})

PlaceObj('ActionFXParticles', {
	Action = "Gather",
	Actor = "RCConstructor",
	Attach = true,
	Delay = 500,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "RCTransport_Load",
	handle = 379168720,
})

PlaceObj('ActionFXParticles', {
	Action = "Gather",
	Actor = "RCHarvester",
	Attach = true,
	Delay = 500,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "RCTransport_Load",
	handle = 965072450,
})

PlaceObj('ActionFXParticles', {
	Action = "Gather",
	Actor = "RCTransport",
	Attach = true,
	Delay = 500,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "RCTransport_Load",
	handle = 1392401793,
})

PlaceObj('ActionFXParticles', {
	Action = "GroundExplosion",
	AlwaysVisible = true,
	DetailLevel = 60,
	Moment = "start",
	Particles = "BombardProjectile_Explosion",
	Scale = 120,
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "Harvest",
	Actor = "RCHarvester",
	AlwaysVisible = true,
	Attach = true,
	Delay = 500,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "RCHarvest_Steam",
	Spot = "Steam",
	handle = 604366284,
})

PlaceObj('ActionFXParticles', {
	Action = "Harvest",
	Actor = "RCHarvester",
	AlwaysVisible = true,
	Attach = true,
	Delay = 500,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(500, 0, 0),
	Particles = "RCTransport_Harvest",
	handle = 1784841325,
})

PlaceObj('ActionFXParticles', {
	Action = "Jump",
	Actor = "JumperShuttle",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(-100, 0, 0),
	Particles = "Shuttle_Jumper_Jump",
	Spot = "Particle",
	SpotsPercent = 100,
	handle = 1533470606,
})

PlaceObj('ActionFXParticles', {
	Action = "Kill",
	Actor = "Firefly",
	Moment = "end",
	Particles = "Fireflies_LightTrap_Kill",
	Scale = 60,
	Spot = "Particle",
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "Kill",
	Actor = "DustDevil1",
	AlwaysVisible = true,
	DetailLevel = 60,
	Moment = "start",
	Particles = "DustDevil_01_End",
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "Kill",
	Actor = "DustDevil2",
	AlwaysVisible = true,
	DetailLevel = 60,
	Moment = "start",
	Particles = "DustDevil_01_End",
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "Kill",
	Actor = "DustDevilMajor1",
	AlwaysVisible = true,
	DetailLevel = 60,
	Moment = "start",
	Particles = "DustDevil_01_End",
	Scale = 400,
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "Kill",
	Actor = "DustDevilMajor2",
	AlwaysVisible = true,
	DetailLevel = 60,
	Moment = "start",
	Particles = "DustDevil_01_End",
	Scale = 400,
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "Kill",
	Actor = "Firefly",
	Attach = true,
	Moment = "start",
	Particles = "Fireflies_Death",
	Spot = "Particle",
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "Land",
	Actor = "AttackRover",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	OffsetDir = "SourceAxisZ",
	Particles = "AttackRover_Land_Ignition",
	SpotsPercent = 100,
	handle = 1656630352,
})

PlaceObj('ActionFXParticles', {
	Action = "Land",
	Actor = "AttackRover",
	Attach = true,
	Behavior = "BehaviorDetachAndDestroy",
	BehaviorMoment = "end",
	Delay = 1000,
	DetailLevel = 60,
	EndRules = {},
	Moment = "start",
	Offset = point(0, 0, 100),
	OffsetDir = "SourceAxisZ",
	Particles = "AttackRover_Land_Smoke",
	SpotsPercent = 100,
	handle = 867148979,
})

PlaceObj('ActionFXParticles', {
	Action = "Land",
	Actor = "AttackRover",
	Attach = true,
	Behavior = "BehaviorDetachAndDestroy",
	BehaviorMoment = "end",
	Delay = 2500,
	DetailLevel = 60,
	Flags = "OnGround",
	Moment = "start",
	OffsetDir = "",
	Orientation = "SourceAxisZ",
	Particles = "AttackRover_Land_SpotFire",
	SpotsPercent = 100,
	handle = 336486195,
})

PlaceObj('ActionFXParticles', {
	Action = "Land",
	Actor = "JumperShuttle",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Shuttle_Jumper_Ignition",
	Spot = "Particle",
	SpotsPercent = 100,
	handle = 1804089786,
})

PlaceObj('ActionFXParticles', {
	Action = "Land",
	Actor = "JumperShuttle",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(-100, 0, 0),
	Particles = "Shuttle_Jumper_Ignition_Decelerate",
	Spot = "Particle",
	SpotsPercent = 100,
	handle = 726011628,
})

PlaceObj('ActionFXParticles', {
	Action = "Land",
	Actor = "Shuttle",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Shuttle_Sides_Ignition",
	Spot = "Particle2",
	SpotsPercent = 100,
	handle = 1097088542,
})

PlaceObj('ActionFXParticles', {
	Action = "Land",
	Actor = "Shuttle",
	Attach = true,
	Delay = 200,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Shuttle_Sides_Ignition_Start",
	Spot = "Particle2",
	SpotsPercent = 100,
	Time = 1000,
	handle = 2027129219,
})

PlaceObj('ActionFXParticles', {
	Action = "Laser",
	Actor = "MDSLaser",
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	OffsetDir = "ActionDir",
	Orientation = "ActionDir",
	Particles = "MDSLaser",
	Source = "ActionPos",
	handle = 1807225086,
})

PlaceObj('ActionFXParticles', {
	Action = "Laser",
	Actor = "MDSLaser",
	Attach = true,
	Delay = 200,
	DetailLevel = 40,
	Moment = "start",
	OffsetDir = "ActionDir",
	Orientation = "ActionDir",
	Particles = "MDSLaser_CatchMeteor",
	Source = "Target",
})

PlaceObj('ActionFXParticles', {
	Action = "Laser",
	Actor = "MDSLaser",
	Delay = 200,
	DetailLevel = 40,
	Moment = "start",
	OffsetDir = "ActionDir",
	Orientation = "ActionDir",
	Particles = "MDSLaser_Shoot",
	Source = "ActionPos",
})

PlaceObj('ActionFXParticles', {
	Action = "LaserCooldown",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(0, 100, 0),
	Orientation = "SourceAxisX",
	OrientationAxis = -2,
	Particles = "MDSLaser_Cooldown",
	Spot = "Conusdirection",
	handle = 1099148575,
})

PlaceObj('ActionFXParticles', {
	Action = "Load",
	Actor = "RCTerraformer",
	AlwaysVisible = true,
	Attach = true,
	Delay = 500,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "Hit2",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "Hit1",
	Particles = "RCTerraformer_Construct",
	Spot = "Digger",
	handle = 1420553208,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Load",
	Actor = "RCConstructor",
	Attach = true,
	Delay = 500,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "RCTransport_Load",
	handle = 275803746,
})

PlaceObj('ActionFXParticles', {
	Action = "Load",
	Actor = "RCHarvester",
	Attach = true,
	Delay = 500,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "RCTransport_Load",
	handle = 1991625099,
})

PlaceObj('ActionFXParticles', {
	Action = "Load",
	Actor = "RCTerraformer",
	Attach = true,
	Delay = 500,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(200, 0, -200),
	Particles = "RCTransport_Load",
	handle = 623513069,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Load",
	Actor = "RCTransport",
	Attach = true,
	Delay = 500,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "RCTransport_Load",
	handle = 86461706,
})

PlaceObj('ActionFXParticles', {
	Action = "MetatronAnomaly",
	Actor = "SubsurfaceAnomaly",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(0, 0, 1000),
	Particles = "Metatron_Small_Alive",
	Scale = 50,
	handle = 1793029463,
})

PlaceObj('ActionFXParticles', {
	Action = "MetatronArrive",
	Actor = "Metatron",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndAction', "MetatronLeave",
			'EndMoment', "start",
		}),
	},
	Moment = "end",
	Offset = point(0, 0, 500),
	Particles = "Metatron_Alive",
	Scale = 600,
	Target = "ignore",
	handle = 1223956593,
})

PlaceObj('ActionFXParticles', {
	Action = "MetatronArrive",
	Actor = "Metatron",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(0, 0, 1000),
	Particles = "Metatron_Arrive",
	Scale = 600,
	Target = "ignore",
	handle = 1329953790,
})

PlaceObj('ActionFXParticles', {
	Action = "MetatronGiftShrink",
	Actor = "MetatronGiftAnomaly",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(0, 0, 1000),
	Particles = "Metatron_Small_Alive",
	Scale = 50,
	Source = "ActionPos",
	Target = "ignore",
	Time = 5000,
	handle = 2099764912,
})

PlaceObj('ActionFXParticles', {
	Action = "MetatronGiftShrink",
	Actor = "MetatronGiftIonStorm",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "0",
		}),
	},
	Moment = "start",
	Offset = point(0, 0, 1000),
	Particles = "Metatron_Shrink_AnomalyStorm",
	Scale = 135,
	Source = "ActionPos",
	Target = "ignore",
	Time = 10000,
	handle = 1050633322,
})

PlaceObj('ActionFXParticles', {
	Action = "MetatronLeave",
	Actor = "Metatron",
	Delay = 560,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "pre-leave",
	Particles = "Metatron_Disappear",
	Scale = 600,
	Source = "ActionPos",
	Target = "ignore",
	handle = 491924001,
})

PlaceObj('ActionFXParticles', {
	Action = "MetatronLeave",
	Actor = "Metatron",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(0, 0, 1000),
	Particles = "AlienDigger_Launch",
	Scale = 600,
	Target = "ignore",
	handle = 1414892019,
})

PlaceObj('ActionFXParticles', {
	Action = "MetatronLeave",
	Actor = "Metatron",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(0, 0, 1000),
	Particles = "Metatron_Leave",
	Scale = 600,
	Target = "ignore",
	handle = 78491542,
})

PlaceObj('ActionFXParticles', {
	Action = "MetatronLeave",
	Actor = "Metatron",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(0, 0, -5000),
	Particles = "Metatron_Leave_Dust",
	Scale = 400,
	Target = "ignore",
	Time = 1000,
	handle = 564355049,
})

PlaceObj('ActionFXParticles', {
	Action = "MetatronPreArrive",
	Actor = "Metatron",
	Delay = 580,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Metatron_Appear",
	Scale = 600,
	Source = "ActionPos",
	Target = "ignore",
	handle = 465996884,
})

PlaceObj('ActionFXParticles', {
	Action = "MetatronRotation",
	Actor = "Metatron",
	Attach = true,
	Delay = 500,
	Moment = "End1",
	Offset = point(0, 0, 10000),
	Particles = "Metatron_Rotate",
	Scale = 600,
	Target = "ignore",
	Time = 3000,
})

PlaceObj('ActionFXParticles', {
	Action = "MetatronRotation",
	Actor = "Metatron",
	Attach = true,
	Delay = 500,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "End2",
	Offset = point(0, 0, 10000),
	Particles = "Metatron_Rotate",
	Scale = 600,
	Target = "ignore",
	Time = 3000,
	handle = 113780486,
})

PlaceObj('ActionFXParticles', {
	Action = "MetatronRotation",
	Actor = "Metatron",
	Attach = true,
	Delay = 500,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "End3",
	Offset = point(0, 0, 10000),
	Particles = "Metatron_Rotate",
	Scale = 600,
	Target = "ignore",
	Time = 3000,
	handle = 787283685,
})

PlaceObj('ActionFXParticles', {
	Action = "MetatronRotation",
	Actor = "Metatron",
	Attach = true,
	Delay = 500,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "End4",
	Offset = point(0, 0, 10000),
	Particles = "Metatron_Rotate",
	Scale = 600,
	Target = "ignore",
	Time = 3000,
	handle = 989380486,
})

PlaceObj('ActionFXParticles', {
	Action = "MetatronRotation",
	Actor = "Metatron",
	Attach = true,
	Delay = 500,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "End5",
	Offset = point(0, 0, 10000),
	Particles = "Metatron_Rotate",
	Scale = 600,
	Target = "ignore",
	Time = 3000,
	handle = 137249348,
})

PlaceObj('ActionFXParticles', {
	Action = "MetatronRotation",
	Actor = "Metatron",
	Attach = true,
	Delay = 500,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "End6",
	Offset = point(0, 0, 10000),
	Particles = "Metatron_Rotate",
	Scale = 600,
	Target = "ignore",
	Time = 3000,
	handle = 1433178185,
})

PlaceObj('ActionFXParticles', {
	Action = "MetatronRotation",
	Actor = "Metatron",
	Attach = true,
	Delay = 500,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "End7",
	Offset = point(0, 0, 10000),
	Particles = "Metatron_Rotate",
	Scale = 600,
	Target = "ignore",
	Time = 3000,
	handle = 1265411348,
})

PlaceObj('ActionFXParticles', {
	Action = "MetatronSpawnGifts",
	Actor = "Metatron",
	Attach = true,
	Delay = 5000,
	Moment = "start",
	Offset = point(0, 0, 10000),
	Particles = "Metatron_SpawnGifts",
	Scale = 600,
	Target = "ignore",
	Time = 10000,
})

PlaceObj('ActionFXParticles', {
	Action = "MetatronSpawnGifts",
	Actor = "Metatron",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(0, 0, 10000),
	Particles = "Metatron_SpawnGifts_Charge",
	Scale = 600,
	Target = "ignore",
	Time = 5500,
	handle = 2141033319,
})

PlaceObj('ActionFXParticles', {
	Action = "Meteor",
	Actor = "AttackRover",
	AlwaysVisible = true,
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndAction', "Land",
			'EndMoment', "start",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndAction', "Meteor",
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	OffsetDir = "",
	Orientation = "SourceAxisZ",
	OrientationAxis = -1,
	Particles = "AttackRover_CapsuleGlow",
	Scale = 600,
	Target = "ignore",
	handle = 179575055,
})

PlaceObj('ActionFXParticles', {
	Action = "Meteor",
	Actor = "AttackRover",
	AlwaysVisible = true,
	Attach = true,
	Behavior = "BehaviorDetachAndDestroy",
	BehaviorMoment = "end",
	Moment = "start",
	OffsetDir = "",
	Orientation = "SourceAxisZ",
	OrientationAxis = -1,
	Particles = "AttackRover_Trail",
	Scale = 600,
	Target = "ignore",
	handle = 386613972,
})

PlaceObj('ActionFXParticles', {
	Action = "Meteor",
	Actor = "MeteorLarge1",
	AlwaysVisible = true,
	Attach = true,
	Behavior = "BehaviorDetachAndDestroy",
	BehaviorMoment = "end",
	Moment = "start",
	OffsetDir = "ActionDir",
	Orientation = "ActionDir",
	Particles = "Meteor_Trail_01",
	Scale = 150,
	Target = "ignore",
	handle = 1814329576,
})

PlaceObj('ActionFXParticles', {
	Action = "Meteor",
	Actor = "MeteorLarge2",
	AlwaysVisible = true,
	Attach = true,
	Behavior = "BehaviorDetachAndDestroy",
	BehaviorMoment = "end",
	Moment = "start",
	OffsetDir = "ActionDir",
	Orientation = "ActionDir",
	Particles = "Meteor_Trail_01",
	Scale = 150,
	Target = "ignore",
	handle = 115487250,
})

PlaceObj('ActionFXParticles', {
	Action = "Meteor",
	Actor = "MeteorSmall1",
	AlwaysVisible = true,
	Attach = true,
	Behavior = "BehaviorDetachAndDestroy",
	BehaviorMoment = "end",
	Moment = "start",
	OffsetDir = "ActionDir",
	Orientation = "ActionDir",
	Particles = "Meteor_Trail_01",
	Target = "ignore",
	handle = 58167484,
})

PlaceObj('ActionFXParticles', {
	Action = "Meteor",
	Actor = "MeteorSmall2",
	AlwaysVisible = true,
	Attach = true,
	Behavior = "BehaviorDetachAndDestroy",
	BehaviorMoment = "end",
	Moment = "start",
	OffsetDir = "ActionDir",
	Orientation = "ActionDir",
	Particles = "Meteor_Trail_01",
	Target = "ignore",
	handle = 710061525,
})

PlaceObj('ActionFXParticles', {
	Action = "MeteorExplosion",
	Actor = "MeteorLarge1",
	AlwaysVisible = true,
	Delay = 100,
	Moment = "start",
	Particles = "Meteor_Explosion_01",
	Scale = 300,
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "MeteorExplosion",
	Actor = "MeteorLarge1",
	AlwaysVisible = true,
	Delay = 100,
	DetailLevel = 60,
	Moment = "start",
	OffsetDir = "ActionDir",
	Orientation = "ActionDir",
	Particles = "Meteor_Explosion_01_Flash",
	Scale = 300,
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "MeteorExplosion",
	Actor = "MeteorLarge2",
	AlwaysVisible = true,
	Delay = 100,
	Moment = "start",
	Particles = "Meteor_Explosion_01",
	Scale = 300,
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "MeteorExplosion",
	Actor = "MeteorLarge2",
	AlwaysVisible = true,
	Delay = 100,
	DetailLevel = 60,
	Moment = "start",
	OffsetDir = "ActionDir",
	Orientation = "ActionDir",
	Particles = "Meteor_Explosion_01_Flash",
	Scale = 300,
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "MeteorExplosion",
	Actor = "MeteorSmall1",
	AlwaysVisible = true,
	Delay = 100,
	Moment = "start",
	Particles = "Meteor_Explosion_01",
	Scale = 200,
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "MeteorExplosion",
	Actor = "MeteorSmall1",
	AlwaysVisible = true,
	Delay = 100,
	DetailLevel = 60,
	Moment = "start",
	OffsetDir = "ActionDir",
	Orientation = "ActionDir",
	Particles = "Meteor_Explosion_01_Flash",
	Scale = 200,
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "MeteorExplosion",
	Actor = "MeteorSmall2",
	AlwaysVisible = true,
	Delay = 100,
	Moment = "start",
	Particles = "Meteor_Explosion_01",
	Scale = 200,
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "MeteorExplosion",
	Actor = "MeteorSmall2",
	AlwaysVisible = true,
	Delay = 100,
	DetailLevel = 60,
	Moment = "start",
	OffsetDir = "ActionDir",
	Orientation = "ActionDir",
	Particles = "Meteor_Explosion_01_Flash",
	Scale = 200,
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "MeteorExplosionAir",
	Actor = "MeteorLarge1",
	AlwaysVisible = true,
	DetailLevel = 60,
	Moment = "start",
	OffsetDir = "ActionDir",
	Orientation = "ActionDir",
	Particles = "MDSLaser_Meteor_Hit",
	Scale = 150,
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "MeteorExplosionAir",
	Actor = "MeteorLarge2",
	AlwaysVisible = true,
	DetailLevel = 60,
	Moment = "start",
	OffsetDir = "ActionDir",
	Orientation = "ActionDir",
	Particles = "MDSLaser_Meteor_Hit",
	Scale = 150,
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "MeteorExplosionAir",
	Actor = "MeteorSmall1",
	AlwaysVisible = true,
	DetailLevel = 60,
	Moment = "start",
	OffsetDir = "ActionDir",
	Orientation = "ActionDir",
	Particles = "MDSLaser_Meteor_Hit",
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "MeteorExplosionAir",
	Actor = "MeteorSmall2",
	AlwaysVisible = true,
	DetailLevel = 60,
	Moment = "start",
	OffsetDir = "ActionDir",
	Orientation = "ActionDir",
	Particles = "MDSLaser_Meteor_Hit",
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "MeteorHitDome",
	Actor = "Dome",
	DetailLevel = 60,
	EndRules = {},
	Moment = "start",
	OffsetDir = "ActionDir",
	Orientation = "ActionDir",
	Particles = "Meteor_Explosion_Dome",
	Source = "ActionPos",
})

PlaceObj('ActionFXParticles', {
	Action = "MissileExplode",
	AlwaysVisible = true,
	DetailLevel = 60,
	Moment = "start",
	Particles = "RocketProjectile_Explosion",
	Scale = 60,
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "MissileFired",
	Actor = "AttackRover",
	AlwaysVisible = true,
	Behavior = "BehaviorDetachAndDestroy",
	BehaviorMoment = "end",
	DetailLevel = 60,
	Moment = "start",
	Offset = point(0, 0, 200),
	Particles = "RocketProjectile_Explosion_Small",
	Scale = 10,
	Source = "ActionPos",
	Target = "ignore",
	handle = 1932913336,
})

PlaceObj('ActionFXParticles', {
	Action = "MissileFired",
	Actor = "DefenceTower",
	AlwaysVisible = true,
	Behavior = "BehaviorDetachAndDestroy",
	BehaviorMoment = "end",
	DetailLevel = 40,
	Moment = "start",
	Particles = "DefenseTower_Fire",
	Source = "ActionPos",
	Target = "ignore",
	handle = 213416085,
})

PlaceObj('ActionFXParticles', {
	Action = "Move",
	Actor = "BombardMissile",
	AlwaysVisible = true,
	Attach = true,
	Behavior = "BehaviorDetachAndDestroy",
	BehaviorMoment = "end",
	DetailLevel = 60,
	Moment = "start",
	Particles = "BombardProjectile_Trail",
	Target = "ignore",
	handle = 2094984344,
})

PlaceObj('ActionFXParticles', {
	Action = "Move",
	Actor = "FlyingDrone",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Drone_Engine_Flying",
	Spot = "Particle",
	SpotsPercent = 100,
	handle = 1262826533,
})

PlaceObj('ActionFXParticles', {
	Action = "Move",
	Actor = "JumperShuttle",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Shuttle_Jumper_Ignition_Decelerate",
	Spot = "Particle",
	SpotsPercent = 100,
	handle = 157223172,
})

PlaceObj('ActionFXParticles', {
	Action = "Move",
	Actor = "Shuttle",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Shuttle_Sides_Ignition",
	Spot = "Particle2",
	SpotsPercent = 100,
	handle = 25522232,
})

PlaceObj('ActionFXParticles', {
	Action = "Move",
	Actor = "Shuttle",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Shuttle_Sides_Ignition_Start",
	Scale = 80,
	Spot = "Particle2",
	SpotsPercent = 100,
	Time = 500,
	handle = 9866420,
})

PlaceObj('ActionFXParticles', {
	Action = "Move",
	Actor = "Shuttle",
	AlwaysVisible = true,
	Attach = true,
	Behavior = "BehaviorDetachAndDestroy",
	BehaviorMoment = "end",
	Delay = 1000,
	DetailLevel = 60,
	FxId = "Ignition",
	Moment = "start",
	Particles = "Shuttle_Trail",
	Spot = "Particle1",
	handle = 394893362,
})

PlaceObj('ActionFXParticles', {
	Action = "Move",
	Actor = "Shuttle",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FxId = "Ignition",
	Moment = "start",
	Particles = "Shuttle_Trail_Ignition",
	Scale = 80,
	Spot = "Particle1",
	handle = 2112479323,
})

PlaceObj('ActionFXParticles', {
	Action = "Moving",
	Actor = "Rover",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "move",
	Offset = point(0, 800, 0),
	Particles = "RCRover_Trail",
	Scale = 150,
	Spot = "Dust1",
	Time = 4000,
	handle = 207388925,
})

PlaceObj('ActionFXParticles', {
	Action = "Moving",
	Actor = "Rover",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "move",
	Offset = point(0, 800, 0),
	Particles = "RCRover_Trail",
	Scale = 150,
	Spot = "Dust2",
	Time = 4000,
	handle = 1696910507,
})

PlaceObj('ActionFXParticles', {
	Action = "Moving",
	Actor = "Drone",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FxId = "Drone_Trail",
	Moment = "start",
	OrientationAxis = 2,
	Particles = "Drone_Trail",
	Target = "Outside",
	handle = 2036862718,
})

PlaceObj('ActionFXParticles', {
	Action = "Moving",
	Actor = "FlyingDrone",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Drone_Enging_Flying_Ground",
	Spot = "Particle",
	SpotsPercent = 100,
	handle = 1050210067,
})

PlaceObj('ActionFXParticles', {
	Action = "Moving",
	Actor = "FlyingDrone",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "OnGround",
	Moment = "start",
	Particles = "Drone_Trail_Ground_Flying",
	handle = 357048200,
})

PlaceObj('ActionFXParticles', {
	Action = "MysteryDream",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "hit-moment",
	Offset = point(0, 0, 200),
	Particles = "Mystery_MirageDream",
	Target = "ignore",
	handle = 1644398120,
})

PlaceObj('ActionFXParticles', {
	Action = "MysteryDream",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "hit-moment",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Mystery_MirageFallingAsleep",
	Target = "ignore",
	Time = 5500,
	handle = 975344401,
})

PlaceObj('ActionFXParticles', {
	Action = "NoBattery",
	Actor = "Drone",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Drone_NoBattery",
	Spot = "Lantern",
	Target = "ignore",
	handle = 40636454,
})

PlaceObj('ActionFXParticles', {
	Action = "OpenAirState",
	Actor = "DomeBasic",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "revert",
		}),
	},
	Moment = "dissolve",
	Particles = "Dome_OpenSpace",
	Time = 10000,
	group = "Default",
	handle = 1475695294,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "OrbitalProbeScan",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "OrbitalProbe_Scan",
	Scale = 120,
	Source = "ActionPos",
	handle = 1232090752,
})

PlaceObj('ActionFXParticles', {
	Action = "OxygenLeak",
	Actor = "DomeMeteorFractureLarge",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	OffsetDir = "ActionDir",
	Orientation = "ActionDir",
	Particles = "Meteor_Hit_O2Leak",
	Scale = 200,
	handle = 1832798832,
})

PlaceObj('ActionFXParticles', {
	Action = "OxygenLeak",
	Actor = "DomeMeteorFractureSmall",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	OffsetDir = "ActionDir",
	Orientation = "ActionDir",
	Particles = "Meteor_Hit_O2Leak",
	Scale = 150,
	ScaleMember = "size",
	handle = 1708438318,
})

PlaceObj('ActionFXParticles', {
	Action = "OxygenLeak",
	Actor = "ElectricityGridElement",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	OffsetDir = "ActionDir",
	Orientation = "ActionDir",
	Particles = "Cable_Damaged",
	Scale = 50,
	Spot = "Sparks",
	handle = 620035867,
})

PlaceObj('ActionFXParticles', {
	Action = "OxygenLeak",
	Actor = "LifeSupportGridElement",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	OffsetDir = "ActionDir",
	Orientation = "ActionDir",
	Particles = "Pipe_Damaged",
	ScaleMember = "GetLeakParticleScale",
	Source = "ActionPos",
	handle = 1020262719,
})

PlaceObj('ActionFXParticles', {
	Action = "Pickup",
	Actor = "Drone",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Drone_Gather_BlackCube",
	Spot = "Lefthand",
	Target = "BlackCube",
	handle = 1618925873,
})

PlaceObj('ActionFXParticles', {
	Action = "Pickup",
	Actor = "Drone",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Drone_Gather_BlackCube",
	Spot = "Righthand",
	Target = "BlackCube",
	handle = 1082964582,
})

PlaceObj('ActionFXParticles', {
	Action = "Pickup",
	Actor = "Drone",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Drone_Gather_Concrete",
	Spot = "Lefthand",
	Target = "Concrete",
	handle = 2106081999,
})

PlaceObj('ActionFXParticles', {
	Action = "Pickup",
	Actor = "Drone",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Drone_Gather_Concrete",
	Spot = "Righthand",
	Target = "Concrete",
	handle = 220585390,
})

PlaceObj('ActionFXParticles', {
	Action = "Pickup",
	Actor = "Drone",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Drone_Gather_Metals",
	Spot = "Lefthand",
	Target = "Metals",
	handle = 1666554823,
})

PlaceObj('ActionFXParticles', {
	Action = "Pickup",
	Actor = "Drone",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Drone_Gather_Metals",
	Spot = "Righthand",
	Target = "Metals",
	handle = 2033207768,
})

PlaceObj('ActionFXParticles', {
	Action = "Pickup",
	Actor = "Drone",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Drone_Gather_WasteRock",
	Spot = "Lefthand",
	Target = "WasteRock",
	handle = 567683892,
})

PlaceObj('ActionFXParticles', {
	Action = "Pickup",
	Actor = "Drone",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Drone_Gather_WasteRock",
	Spot = "Righthand",
	Target = "WasteRock",
	handle = 890252372,
})

PlaceObj('ActionFXParticles', {
	Action = "PodFlip",
	Actor = "SupplyPod",
	AlwaysVisible = true,
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "SupplyPod_Flip_Trail",
	Spot = "Particle",
	SpotsPercent = 100,
	handle = 1715526921,
})

PlaceObj('ActionFXParticles', {
	Action = "Pulse",
	Actor = "BlackCubeMonolith",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(0, 0, 500),
	Particles = "BlackCubeMonolith_Pulse",
	Scale = 120,
	Spot = "Center",
	Target = "ignore",
	handle = 222969909,
})

PlaceObj('ActionFXParticles', {
	Action = "Recharge",
	Actor = "Drone",
	Attach = true,
	Delay = 2000,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Drone_Recharge",
	Spot = "Headlight",
	Target = "Drone",
	handle = 1730955179,
})

PlaceObj('ActionFXParticles', {
	Action = "Recharge",
	Actor = "Drone",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Drone_Recharge_Hands",
	Source = "Target",
	Spot = "Lefthand",
	Target = "Drone",
	handle = 1002746590,
})

PlaceObj('ActionFXParticles', {
	Action = "Recharge",
	Actor = "Drone",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Drone_Recharge_Hands",
	Source = "Target",
	Spot = "Righthand",
	Target = "Drone",
	handle = 722600665,
})

PlaceObj('ActionFXParticles', {
	Action = "Recharge",
	Actor = "Drone",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	OrientationAxis = 2,
	Particles = "RCRover_Repair_Drone",
	Source = "Target",
	Spot = "Particle2",
	Target = "RCRover",
	handle = 2056510195,
})

PlaceObj('ActionFXParticles', {
	Action = "RegolithExtractorDigging",
	Actor = "RegolithExtractorDigger",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "dig-reverse",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "digEnd",
		}),
	},
	Moment = "dig",
	Particles = "RegolithExtractor_Dig",
	handle = 1453213127,
})

PlaceObj('ActionFXParticles', {
	Action = "RegolithExtractorDigging",
	Actor = "ConcreteExtractorCP3JointShovel",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "enter",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "digEnd",
		}),
	},
	Moment = "dig-reverse",
	OffsetDir = "",
	OrientationAxis = 3,
	Particles = "RegolithExtractorShovel_Dig",
	handle = 544480144,
})

PlaceObj('ActionFXParticles', {
	Action = "RegolithExtractorDigging",
	Actor = "RegolithExtractorDigger",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "enter",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "digEnd",
		}),
	},
	Moment = "dig-reverse",
	Particles = "RegolithExtractor_DigReverse",
	handle = 491105276,
})

PlaceObj('ActionFXParticles', {
	Action = "Release",
	Actor = "LightTrap",
	Attach = true,
	Moment = "start",
	Particles = "Fireflies_LightTrap_Trap",
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "Repair",
	Actor = "Drone",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	OrientationAxis = 2,
	Particles = "Drone_Repair",
	Spot = "Lefthand",
	handle = 1858744742,
})

PlaceObj('ActionFXParticles', {
	Action = "Repair",
	Actor = "Drone",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	OrientationAxis = 2,
	Particles = "Drone_Repair",
	Spot = "Righthand",
	handle = 527586301,
})

PlaceObj('ActionFXParticles', {
	Action = "Repair",
	Actor = "RCRover",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	OrientationAxis = 2,
	Particles = "RCRover_Repair_Drone",
	Spot = "Particle2",
	Target = "Drone",
	handle = 749013437,
})

PlaceObj('ActionFXParticles', {
	Action = "Repair",
	Actor = "RCRover",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FxId = "RCRoverRepair",
	Moment = "start",
	OrientationAxis = 2,
	Particles = "RCRover_Repair",
	Spot = "Particle1",
	handle = 187981429,
})

PlaceObj('ActionFXParticles', {
	Action = "Repair",
	Actor = "RCRover",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FxId = "RCRoverRepair",
	Moment = "start",
	OrientationAxis = 2,
	Particles = "RCRover_Repair",
	Spot = "Particle2",
	handle = 55311957,
})

PlaceObj('ActionFXParticles', {
	Action = "Reset",
	Actor = "Drone",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Drone_NoBattery",
	Spot = "Lantern",
	Target = "ignore",
	handle = 1401570970,
})

PlaceObj('ActionFXParticles', {
	Action = "Revealed",
	Actor = "CrystalsBig",
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "OnGround",
	Moment = "true",
	Particles = "AnomalyMarker_Revealed",
	Scale = 300,
	Target = "ignore",
	handle = 268598213,
})

PlaceObj('ActionFXParticles', {
	Action = "Revealed",
	Actor = "CrystalsSmall",
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "OnGround",
	Moment = "true",
	Particles = "AnomalyMarker_Revealed",
	Scale = 200,
	Target = "ignore",
	handle = 970291401,
})

PlaceObj('ActionFXParticles', {
	Action = "Revealed",
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "OnGround",
	FxId = "Revealed",
	Moment = "true",
	Particles = "AnomalyMarker_Revealed",
	Scale = 120,
	Target = "ignore",
	handle = 153400784,
})

PlaceObj('ActionFXParticles', {
	Action = "Revealed",
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "true",
	Offset = point(0, 0, 100),
	Particles = "ConstructionSite_Spawn",
	Target = "ignore",
	handle = 75502441,
})

PlaceObj('ActionFXParticles', {
	Action = "RocketEngine",
	Actor = "FXRocket",
	AlwaysVisible = true,
	Delay = 7000,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(0, 0, 100),
	Particles = "SpaceRocket_TakeOff_Ignition",
	Spot = "Trail",
	SpotsPercent = 100,
	handle = 1455110395,
})

PlaceObj('ActionFXParticles', {
	Action = "RocketEngine",
	Actor = "FXRocket",
	AlwaysVisible = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(0, 0, 100),
	Particles = "SpaceRocket_WarmUp",
	SpotsPercent = 100,
	handle = 565474274,
})

PlaceObj('ActionFXParticles', {
	Action = "RocketExplosion",
	Actor = "SupplyRocket",
	AlwaysVisible = true,
	Moment = "start",
	Particles = "BombardProjectile_Explosion",
	Scale = 150,
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "RocketLand",
	Actor = "FXRocket",
	AlwaysVisible = true,
	Delay = 4750,
	DetailLevel = 60,
	Flags = "OnGround",
	Moment = "pre-hit-ground",
	Offset = point(0, 0, 500),
	Particles = "Rocket_Land",
	Scale = 150,
	Source = "ActionPos",
	SpotsPercent = 100,
	Time = 10000,
})

PlaceObj('ActionFXParticles', {
	Action = "RocketLand",
	Actor = "FXRocket",
	AlwaysVisible = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "pre-hit-ground",
	Offset = point(0, 0, 100),
	Particles = "Rocket_LandSmoke",
	Scale = 120,
	Source = "ActionPos",
	SpotsPercent = 100,
	handle = 615058756,
})

PlaceObj('ActionFXParticles', {
	Action = "RocketLand",
	Actor = "SupplyPod",
	AlwaysVisible = true,
	Delay = 4750,
	DetailLevel = 60,
	Flags = "OnGround",
	Moment = "pre-hit-ground",
	Offset = point(0, 0, 500),
	Particles = "Rocket_Land",
	Source = "ActionPos",
	SpotsPercent = 100,
	Time = 10000,
})

PlaceObj('ActionFXParticles', {
	Action = "RocketLand",
	Actor = "SupplyPod",
	AlwaysVisible = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "pre-hit-ground",
	Offset = point(0, 0, 100),
	Particles = "Rocket_LandSmoke",
	Scale = 80,
	Source = "ActionPos",
	SpotsPercent = 100,
	handle = 240726915,
})

PlaceObj('ActionFXParticles', {
	Action = "RocketLand",
	Actor = "FXRocket",
	AlwaysVisible = true,
	DetailLevel = 60,
	Moment = "pre-hit-ground2",
	Offset = point(0, 0, 100),
	Particles = "Rocket_LandSmoke_02",
	Scale = 120,
	Source = "ActionPos",
	SpotsPercent = 100,
	Time = 8000,
})

PlaceObj('ActionFXParticles', {
	Action = "RocketLand",
	Actor = "SupplyPod",
	AlwaysVisible = true,
	DetailLevel = 60,
	Moment = "pre-hit-ground2",
	Offset = point(0, 0, 100),
	Particles = "Rocket_LandSmoke_02",
	Scale = 80,
	Source = "ActionPos",
	SpotsPercent = 100,
	Time = 8000,
})

PlaceObj('ActionFXParticles', {
	Action = "RocketLand",
	Actor = "FXRocket",
	AlwaysVisible = true,
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(0, 0, 100),
	Particles = "SpaceRocket_Landing_Trail",
	Spot = "Trail",
	SpotsPercent = 100,
	handle = 1687043967,
})

PlaceObj('ActionFXParticles', {
	Action = "RocketLand",
	Actor = "FXRocket",
	AlwaysVisible = true,
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(0, 0, 100),
	Particles = "SpaceRocket_Landing_Trail_Smoke",
	handle = 2059959332,
})

PlaceObj('ActionFXParticles', {
	Action = "RocketLand",
	Actor = "SupplyPod",
	AlwaysVisible = true,
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "hit-ground",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(0, 0, 100),
	Particles = "SupplyPod_Arrive",
	SpotsPercent = 100,
	handle = 2034832044,
})

PlaceObj('ActionFXParticles', {
	Action = "RocketLand",
	Actor = "SupplyPod",
	AlwaysVisible = true,
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "SupplyPod_Landing_Trail",
	Scale = 50,
	Spot = "Particle",
	SpotsPercent = 100,
	handle = 1406002957,
})

PlaceObj('ActionFXParticles', {
	Action = "RocketLaunch",
	Actor = "FXRocket",
	AlwaysVisible = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Rocket_Launch",
	SpotsPercent = 100,
	Time = 15000,
	handle = 1781309684,
})

PlaceObj('ActionFXParticles', {
	Action = "RocketLaunch",
	Actor = "FXRocket",
	AlwaysVisible = true,
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Rocket_LaunchWave",
	Spot = "Nose",
	SpotsPercent = 100,
	Time = 10000,
	handle = 1343675146,
})

PlaceObj('ActionFXParticles', {
	Action = "RocketLaunch",
	Actor = "FXRocket",
	AlwaysVisible = true,
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	OrientationAxis = -1,
	Particles = "Rocket_LaunchWave",
	Spot = "Nose",
	SpotsPercent = 100,
	Time = 10000,
	handle = 333407190,
})

PlaceObj('ActionFXParticles', {
	Action = "RocketLaunch",
	Actor = "FXRocket",
	AlwaysVisible = true,
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Rocket_LaunchWave_Middle",
	Spot = "Nose",
	SpotsPercent = 100,
	Time = 10000,
	handle = 1800334685,
})

PlaceObj('ActionFXParticles', {
	Action = "RocketLaunch",
	Actor = "FXRocket",
	AlwaysVisible = true,
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(0, 0, 100),
	Particles = "SpaceRocket_Trail",
	Spot = "Trail",
	SpotsPercent = 100,
	handle = 1168755514,
})

PlaceObj('ActionFXParticles', {
	Action = "RocketLaunch",
	Actor = "FXRocket",
	AlwaysVisible = true,
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(0, 0, 100),
	Particles = "SpaceRocket_Trail_Smoke",
	SpotsPercent = 100,
	handle = 1864001670,
})

PlaceObj('ActionFXParticles', {
	Action = "Rotate",
	Actor = "JumperShuttle",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Shuttle_Jumper_Ignition",
	Spot = "Particle",
	SpotsPercent = 100,
	handle = 1423785073,
})

PlaceObj('ActionFXParticles', {
	Action = "Rotate",
	Actor = "JumperShuttle",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(-100, 0, 0),
	Particles = "Shuttle_Jumper_Ignition_Start",
	Spot = "Particle",
	SpotsPercent = 100,
	handle = 368019057,
})

PlaceObj('ActionFXParticles', {
	Action = "Rotate",
	Actor = "Shuttle",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Shuttle_Sides_Ignition",
	Spot = "Particle2",
	SpotsPercent = 100,
	handle = 1594525919,
})

PlaceObj('ActionFXParticles', {
	Action = "Rotate",
	Actor = "Shuttle",
	Attach = true,
	Delay = 200,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Shuttle_Sides_Ignition_Start",
	Spot = "Particle2",
	SpotsPercent = 100,
	Time = 500,
	handle = 1617205820,
})

PlaceObj('ActionFXParticles', {
	Action = "RoverUnsiege",
	Actor = "Rover",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "RCRover_Unsiege",
	Scale = 200,
	Target = "ignore",
	handle = 578430178,
})

PlaceObj('ActionFXParticles', {
	Action = "Scan",
	Actor = "ExplorerRover",
	Attach = true,
	Delay = 1000,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Offset = point(0, 0, 1600),
	Particles = "Rover_Scan",
	Scale = 55,
	Source = "Target",
	handle = 1488152584,
})

PlaceObj('ActionFXParticles', {
	Action = "Scan",
	Actor = "ExplorerRover",
	Attach = true,
	Delay = 1000,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Offset = point(0, 0, 1600),
	Particles = "Rover_Scan_02",
	Scale = 55,
	Source = "Target",
	handle = 149481672,
})

PlaceObj('ActionFXParticles', {
	Action = "Scan",
	Actor = "ExplorerRover",
	Attach = true,
	Delay = 1000,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "Rover_Scan_Base",
	Scale = 55,
	Source = "Target",
	handle = 1540291444,
})

PlaceObj('ActionFXParticles', {
	Action = "Scan",
	Actor = "ExplorerRover",
	Attach = true,
	Delay = 200,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	OrientationAxis = 2,
	Particles = "Rover_Scan_Cone",
	Spot = "Particle1",
	handle = 364319783,
})

PlaceObj('ActionFXParticles', {
	Action = "Scan",
	Actor = "ExplorerRover",
	Attach = true,
	Delay = 1000,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Offset = point(0, 0, 800),
	Particles = "Rover_Scan_Middle",
	Scale = 55,
	Source = "Target",
	handle = 1880215744,
})

PlaceObj('ActionFXParticles', {
	Action = "SectorScanInvalid",
	Moment = "start",
	Particles = "SensorTower_Sector_Scan_Invalid",
	Source = "ActionPos",
	Time = 3000,
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "AlienDigger",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "Selection_Rover",
	Scale = 350,
	handle = 2033817846,
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "AlienDiggerBig",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "Selection_AlienDigger_Big",
	Scale = 350,
	handle = 2116847888,
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "ArtificialSun",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Big",
	Scale = 40,
	handle = 289650190,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "ArtificialSun",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Big_Base",
	Scale = 40,
	handle = 2127245395,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "AttackRover",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "Selection_Rover",
	Scale = 250,
	handle = 1844150474,
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "BlackCubeStockpile",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "Selection_Rover",
	handle = 530251619,
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "CarbonateProcessor",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(200, 0, 0),
	Particles = "Selection_Buildings_Big",
	Scale = 62,
	handle = 745439677,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "CarbonateProcessor",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(200, 0, 0),
	Particles = "Selection_Buildings_Big_Base",
	Scale = 62,
	handle = 1538094425,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "ColonistFemale",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "Selection_Colonist",
	Spot = "Lantern",
	handle = 745219851,
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "ColonistMale",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "Selection_Colonist",
	Spot = "Lantern",
	handle = 686021139,
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "ConstructionSite",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Big",
	Scale = 40,
	Target = "ArtificialSun",
	handle = 93795498,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "ConstructionSite",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Big_Base",
	Scale = 40,
	Target = "ArtificialSun",
	handle = 644916307,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "ConstructionSite",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(200, 0, 0),
	Particles = "Selection_Buildings_Big",
	Scale = 62,
	Target = "CarbonateProcessor",
	handle = 285645465,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "ConstructionSite",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(200, 0, 0),
	Particles = "Selection_Buildings_Big_Base",
	Scale = 62,
	Target = "CarbonateProcessor",
	handle = 936372839,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "ConstructionSite",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Big",
	Scale = 55,
	Target = "CoreHeatConvector",
	handle = 1076466235,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "ConstructionSite",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Big_Base",
	Scale = 55,
	Target = "CoreHeatConvector",
	handle = 901332233,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "ConstructionSite",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Lakes",
	Scale = 110,
	Spot = "Center",
	Target = "LandscapeLakeBig",
	handle = 524673051,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "ConstructionSite",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Lakes_Base",
	Scale = 110,
	Spot = "Center",
	Target = "LandscapeLakeBig",
	handle = 819359300,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "ConstructionSite",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(1000, -1000, 0),
	Particles = "Selection_Buildings_Lakes",
	Scale = 208,
	Spot = "Center",
	Target = "LandscapeLakeHuge",
	handle = 1237454629,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "ConstructionSite",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(1000, -1000, 0),
	Particles = "Selection_Buildings_Lakes_Base",
	Scale = 208,
	Spot = "Center",
	Target = "LandscapeLakeHuge",
	handle = 493551134,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "ConstructionSite",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Lakes",
	Scale = 75,
	Spot = "Center",
	Target = "LandscapeLakeMid",
	handle = 975646415,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "ConstructionSite",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Lakes_Base",
	Scale = 75,
	Spot = "Center",
	Target = "LandscapeLakeMid",
	handle = 1049776278,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "ConstructionSite",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Lakes",
	Scale = 52,
	Spot = "Center",
	Target = "LandscapeLakeSmall",
	handle = 517912219,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "ConstructionSite",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Lakes_Base",
	Scale = 52,
	Spot = "Center",
	Target = "LandscapeLakeSmall",
	handle = 158056710,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "ConstructionSite",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Big",
	Scale = 42,
	Target = "MagneticFieldGenerator",
	handle = 1675798260,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "ConstructionSite",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Big_Base",
	Scale = 42,
	Target = "MagneticFieldGenerator",
	handle = 581627741,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "ConstructionSite",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Big",
	Scale = 70,
	Target = "MoholeMine",
	handle = 1160424787,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "ConstructionSite",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Big_Base",
	Scale = 70,
	Target = "MoholeMine",
	handle = 1357828570,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "ConstructionSite",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Big",
	Scale = 78,
	Target = "OmegaTelescope",
	handle = 1913480980,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "ConstructionSite",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Big_Base",
	Scale = 78,
	Target = "OmegaTelescope",
	handle = 964205368,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "ConstructionSite",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Big",
	Scale = 108,
	Target = "OpenFarm",
	handle = 861767954,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "ConstructionSite",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Big_Base",
	Scale = 108,
	Target = "OpenFarm",
	handle = 1129704175,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "ConstructionSite",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Big",
	Scale = 60,
	Target = "SpaceElevator",
	handle = 220787310,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "ConstructionSite",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Big_Base",
	Scale = 60,
	Target = "SpaceElevator",
	handle = 1195899934,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "ConstructionSite",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Big",
	Scale = 95,
	Target = "TheExcavator",
	handle = 2025013728,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "ConstructionSite",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Big_Base",
	Scale = 95,
	Target = "TheExcavator",
	handle = 501159714,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "ConstructionSiteWithHeightSurfaces",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Huge",
	Scale = 79,
	Target = "DomeBasic",
	handle = 1618796180,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "ConstructionSiteWithHeightSurfaces",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Huge_Base",
	Scale = 79,
	Target = "DomeBasic",
	handle = 420079181,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "ConstructionSiteWithHeightSurfaces",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Huge",
	Scale = 180,
	Target = "DomeDiamond",
	handle = 669020137,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "ConstructionSiteWithHeightSurfaces",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Huge_Base",
	Scale = 180,
	Target = "DomeDiamond",
	handle = 1944987472,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "ConstructionSiteWithHeightSurfaces",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Huge",
	Scale = 104,
	Target = "DomeHexa",
	handle = 1980424764,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "ConstructionSiteWithHeightSurfaces",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Huge_Base",
	Scale = 104,
	Target = "DomeHexa",
	handle = 655590213,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "ConstructionSiteWithHeightSurfaces",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Huge",
	Scale = 112,
	Target = "DomeMedium",
	handle = 312967932,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "ConstructionSiteWithHeightSurfaces",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Huge_Base",
	Scale = 112,
	Target = "DomeMedium",
	handle = 111741626,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "ConstructionSiteWithHeightSurfaces",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Huge",
	Scale = 144,
	Target = "DomeMega",
	handle = 543354166,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "ConstructionSiteWithHeightSurfaces",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Huge_Base",
	Scale = 144,
	Target = "DomeMega",
	handle = 32132184,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "ConstructionSiteWithHeightSurfaces",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Huge",
	Scale = 158,
	Target = "DomeMegaTrigon",
	handle = 978874454,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "ConstructionSiteWithHeightSurfaces",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Huge_Base",
	Scale = 158,
	Target = "DomeMegaTrigon",
	handle = 600911824,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "ConstructionSiteWithHeightSurfaces",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(0, -650, 0),
	Particles = "Selection_Buildings_Huge",
	Scale = 85,
	Target = "DomeMicro",
	handle = 1786411535,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "ConstructionSiteWithHeightSurfaces",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(0, -650, 0),
	Particles = "Selection_Buildings_Huge_Base",
	Scale = 85,
	Target = "DomeMicro",
	handle = 1214062162,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "ConstructionSiteWithHeightSurfaces",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Huge",
	Scale = 140,
	Target = "DomeOval",
	handle = 1334833919,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "ConstructionSiteWithHeightSurfaces",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Huge_Base",
	Scale = 140,
	Target = "DomeOval",
	handle = 1082565216,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "ConstructionSiteWithHeightSurfaces",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Huge",
	Scale = 137,
	Target = "DomeTrigon",
	handle = 1991471675,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "ConstructionSiteWithHeightSurfaces",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Huge_Base",
	Scale = 137,
	Target = "DomeTrigon",
	handle = 125740823,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "ConstructionSiteWithHeightSurfaces",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Huge",
	Scale = 144,
	Target = "GeoscapeDome",
	handle = 906082982,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "ConstructionSiteWithHeightSurfaces",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Huge_Base",
	Scale = 144,
	Target = "GeoscapeDome",
	handle = 2035035250,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "CoreHeatConvector",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Big",
	Scale = 55,
	handle = 992764795,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "CoreHeatConvector",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Big_Base",
	Scale = 55,
	handle = 148157343,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "DomeBasic",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Huge",
	Scale = 79,
	handle = 1534539512,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "DomeBasic",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Huge_Base",
	Scale = 79,
	handle = 564587442,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "DomeDiamond",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Huge",
	Scale = 180,
	handle = 927381031,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "DomeDiamond",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Huge_Base",
	Scale = 180,
	handle = 311455546,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "DomeHexa",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Huge",
	Scale = 104,
	handle = 1809978376,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "DomeHexa",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Huge_Base",
	Scale = 104,
	handle = 966474313,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "DomeMedium",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Huge",
	Scale = 112,
	handle = 676553843,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "DomeMedium",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Huge_Base",
	Scale = 112,
	handle = 1649140954,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "DomeMega",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Huge",
	Scale = 144,
	handle = 860749811,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "DomeMega",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Huge_Base",
	Scale = 144,
	handle = 1466881388,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "DomeMegaTrigon",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Huge",
	Scale = 158,
	handle = 1971474711,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "DomeMegaTrigon",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Huge_Base",
	Scale = 158,
	handle = 717168922,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "DomeMicro",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(0, -650, 0),
	Particles = "Selection_Buildings_Huge",
	Scale = 85,
	handle = 1248885176,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "DomeMicro",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(0, -650, 0),
	Particles = "Selection_Buildings_Huge_Base",
	Scale = 85,
	handle = 213461907,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "DomeOval",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Huge",
	Scale = 140,
	handle = 1135178359,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "DomeOval",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Huge_Base",
	Scale = 140,
	handle = 1585726335,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "DomeTrigon",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Huge",
	Scale = 137,
	handle = 1335808247,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "DomeTrigon",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Huge_Base",
	Scale = 137,
	handle = 187649113,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "Drone",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	FxId = "SelectDrone",
	Moment = "start",
	Particles = "Selection_Drone",
	Spot = "Lantern",
	handle = 1957356953,
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "Firefly",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "Selection_Shuttle",
	Scale = 50,
	Spot = "Particle",
	handle = 1971415119,
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "FlyingDrone",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Offset = point(0, 0, 100),
	Particles = "Selection_Shuttle",
	handle = 1942183439,
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "GeoscapeDome",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Huge",
	Scale = 144,
	handle = 859341874,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "GeoscapeDome",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Huge_Base",
	Scale = 144,
	handle = 332692109,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "JumperShuttle",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "Selection_Shuttle",
	Scale = 250,
	handle = 239282925,
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "LandscapeLakeBig",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Lakes",
	Scale = 110,
	Spot = "Center",
	handle = 1679674469,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "LandscapeLakeBig",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Lakes_Base",
	Scale = 110,
	Spot = "Center",
	handle = 1369751072,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "LandscapeLakeHuge",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(1000, -1000, 0),
	Particles = "Selection_Buildings_Lakes",
	Scale = 208,
	Spot = "Center",
	handle = 1227445675,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "LandscapeLakeHuge",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(1000, -1000, 0),
	Particles = "Selection_Buildings_Lakes_Base",
	Scale = 208,
	Spot = "Center",
	handle = 1021345063,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "LandscapeLakeMid",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Lakes",
	Scale = 75,
	Spot = "Center",
	handle = 1137650543,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "LandscapeLakeMid",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Lakes_Base",
	Scale = 75,
	Spot = "Center",
	handle = 1284060452,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "LandscapeLakeSmall",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Lakes",
	Scale = 52,
	Spot = "Center",
	handle = 1676725612,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "LandscapeLakeSmall",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Lakes_Base",
	Scale = 52,
	Spot = "Center",
	handle = 207817618,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "MagneticFieldGenerator",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Big",
	Scale = 42,
	handle = 57501540,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "MagneticFieldGenerator",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Big_Base",
	Scale = 42,
	handle = 1740648523,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "MirrorSphere",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Offset = point(0, 0, -1500),
	Particles = "Selection_Shuttle",
	Scale = 500,
	Spot = "Center",
	handle = 313867437,
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "MoholeMine",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Big",
	Scale = 70,
	handle = 32734155,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "MoholeMine",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Big_Base",
	Scale = 70,
	handle = 634784112,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "OmegaTelescope",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Big",
	Scale = 78,
	handle = 1563573455,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "OmegaTelescope",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Big_Base",
	Scale = 78,
	handle = 220056361,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "OpenFarm",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Big",
	Scale = 108,
	handle = 1001421125,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "OpenFarm",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Big_Base",
	Scale = 108,
	handle = 203550770,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "Pet",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "Selection_Colonist",
	Spot = "Lantern",
	handle = 1080252883,
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "ResourcePile",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "Selection_Rover",
	Scale = 40,
	handle = 996524097,
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "ResourceStockpile",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "Selection_Rover",
	Scale = 150,
	handle = 179236125,
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "RoamingPet",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "Selection_Colonist",
	Spot = "Lantern",
	handle = 1521497341,
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "Rover",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "Selection_Rover",
	Scale = 250,
	handle = 2057521529,
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "Shuttle",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "Selection_Shuttle",
	Scale = 250,
	handle = 1580797660,
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "Sinkhole",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "Selection_Rover",
	Scale = 500,
	handle = 7860856,
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "SpaceElevator",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Big",
	Scale = 60,
	handle = 1913284040,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "SpaceElevator",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Big_Base",
	Scale = 60,
	handle = 2099896732,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "StaticPet",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "Selection_Colonist",
	Spot = "Lantern",
	handle = 1086047294,
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "SubsurfaceAnomaly",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "Selection_Rover",
	Scale = 250,
	handle = 2084321246,
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "SubsurfaceDepositMetals",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "Selection_Rover",
	Scale = 250,
	handle = 422085182,
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "SubsurfaceDepositPreciousMetals",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	FollowTick = 250,
	Moment = "start",
	Particles = "Selection_Rover",
	Scale = 250,
	handle = 1146794682,
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "SubsurfaceDepositWater",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "Selection_Rover",
	Scale = 250,
	handle = 779773990,
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "SupplyPod",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "Selection_Rover",
	Scale = 500,
	handle = 1833974336,
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "SupplyPod",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "Selection_Rover",
	Scale = 500,
	handle = 560469883,
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "SupplyRocket",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "Selection_Rover",
	Scale = 500,
	handle = 1996499938,
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "SurfaceDepositConcrete",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	FollowTick = 250,
	Moment = "start",
	Particles = "Selection_Rover",
	Scale = 300,
	handle = 1708381373,
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "SurfaceDepositGroup",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "Selection_Rover",
	Scale = 400,
	ScaleMember = "GetSelectionRadiusScale",
	handle = 206834243,
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "SurfaceDepositMetals",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "Selection_Rover",
	Scale = 250,
	handle = 94218645,
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "SurfaceDepositPolymers",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "Selection_Rover",
	Scale = 250,
	handle = 898941411,
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "TerrainDepositConcrete",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "Selection_Rover",
	Scale = 250,
	Target = "ignore",
	handle = 1008833529,
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "TheExcavator",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Big",
	Scale = 95,
	handle = 2085583848,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "TheExcavator",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Big_Base",
	Scale = 95,
	handle = 1743998982,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "TheExcavator",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Buildings_Big_Base",
	Scale = 95,
	handle = 763880743,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "UnitLarge",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "Selection_Rover",
	Scale = 250,
	handle = 1507758897,
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "UnitMedium",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "Selection_Drone",
	handle = 842084787,
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "UnitSmall",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "Selection_Colonist",
	handle = 444202067,
})

PlaceObj('ActionFXParticles', {
	Action = "SensorTowerMeteorPos",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "OnGround",
	Moment = "start",
	Particles = "SensorTower_RevealDevil_Pos",
	Scale = 150,
	Source = "ActionPos",
	handle = 1519940700,
})

PlaceObj('ActionFXParticles', {
	Action = "ShuttleHubEnter",
	Actor = "JumperShuttle",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "Hit",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Shuttle_Jumper_Ignition",
	Spot = "Particle",
	SpotsPercent = 100,
	handle = 2072552341,
})

PlaceObj('ActionFXParticles', {
	Action = "ShuttleHubEnter",
	Actor = "JumperShuttle",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(-100, 0, 0),
	Particles = "Shuttle_Jumper_Ignition_Decelerate",
	Spot = "Particle",
	SpotsPercent = 100,
	handle = 976531282,
})

PlaceObj('ActionFXParticles', {
	Action = "ShuttleHubEnter",
	Actor = "Shuttle",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "Hit",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Shuttle_Sides_Ignition",
	Spot = "Particle2",
	SpotsPercent = 100,
	handle = 736650592,
})

PlaceObj('ActionFXParticles', {
	Action = "ShuttleHubEnter",
	Actor = "Shuttle",
	Attach = true,
	Delay = 200,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "Hit",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Shuttle_Sides_Ignition_Start",
	Spot = "Particle2",
	SpotsPercent = 100,
	Time = 500,
	handle = 957734665,
})

PlaceObj('ActionFXParticles', {
	Action = "ShuttleHubExit",
	Actor = "Shuttle",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "Hit",
	Particles = "Shuttle_Sides_Ignition",
	Spot = "Particle2",
	SpotsPercent = 100,
	handle = 1843552122,
})

PlaceObj('ActionFXParticles', {
	Action = "ShuttleHubExit",
	Actor = "Shuttle",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "Hit",
	Particles = "Shuttle_Sides_Ignition_Start",
	Spot = "Particle2",
	SpotsPercent = 100,
	Time = 500,
	handle = 2058648649,
})

PlaceObj('ActionFXParticles', {
	Action = "ShuttleHubExit",
	Actor = "JumperShuttle",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Shuttle_Jumper_HubExit",
	Source = "Target",
	SpotsPercent = 100,
	handle = 300870832,
})

PlaceObj('ActionFXParticles', {
	Action = "ShuttleHubExit",
	Actor = "JumperShuttle",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Shuttle_Jumper_Ignition",
	Spot = "Particle",
	SpotsPercent = 100,
	handle = 445112078,
})

PlaceObj('ActionFXParticles', {
	Action = "ShuttleHubExit",
	Actor = "JumperShuttle",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(-100, 0, 0),
	Particles = "Shuttle_Jumper_Ignition_Start",
	Spot = "Particle",
	SpotsPercent = 100,
	handle = 983294488,
})

PlaceObj('ActionFXParticles', {
	Action = "ShuttleHubExit",
	Actor = "Shuttle",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "Hit",
		}),
	},
	Moment = "start",
	Particles = "Shuttle_Trail_Ignition",
	Scale = 80,
	Spot = "Particle1",
	handle = 113817654,
})

PlaceObj('ActionFXParticles', {
	Action = "ShuttleLoad",
	Actor = "JumperShuttle",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Orientation = "ActionDir",
	OrientationAxis = -1,
	Particles = "Shuttle_Load",
	SpotsPercent = 100,
	Time = 1500,
	handle = 2046005437,
})

PlaceObj('ActionFXParticles', {
	Action = "ShuttleLoad",
	Actor = "Shuttle",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Orientation = "ActionDir",
	OrientationAxis = -1,
	Particles = "Shuttle_Load",
	SpotsPercent = 100,
	Time = 1500,
	handle = 1477537043,
})

PlaceObj('ActionFXParticles', {
	Action = "ShuttleUnload",
	Actor = "JumperShuttle",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Orientation = "ActionDir",
	Particles = "Shuttle_Unload",
	SpotsPercent = 100,
	Time = 1500,
	handle = 1377622944,
})

PlaceObj('ActionFXParticles', {
	Action = "ShuttleUnload",
	Actor = "Shuttle",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Orientation = "ActionDir",
	Particles = "Shuttle_Unload",
	SpotsPercent = 100,
	Time = 1500,
	handle = 878239950,
})

PlaceObj('ActionFXParticles', {
	Action = "Spawn",
	Actor = "DustDevil1",
	DetailLevel = 60,
	Moment = "end",
	Particles = "DustDevil_01_End",
})

PlaceObj('ActionFXParticles', {
	Action = "Spawn",
	Actor = "DustDevil2",
	DetailLevel = 60,
	Moment = "end",
	Particles = "DustDevil_01_End",
})

PlaceObj('ActionFXParticles', {
	Action = "Spawn",
	Actor = "DustDevilElectro",
	AlwaysVisible = true,
	DetailLevel = 60,
	Moment = "end",
	Particles = "DustDevil_Electrostatic_End",
	Scale = 150,
})

PlaceObj('ActionFXParticles', {
	Action = "Spawn",
	Actor = "DustDevilMajor1",
	DetailLevel = 60,
	Moment = "end",
	Particles = "DustDevil_01_End",
	Scale = 400,
})

PlaceObj('ActionFXParticles', {
	Action = "Spawn",
	Actor = "DustDevilMajor2",
	DetailLevel = 60,
	Moment = "end",
	Particles = "DustDevil_01_End",
	Scale = 400,
})

PlaceObj('ActionFXParticles', {
	Action = "Spawn",
	Actor = "DustDevilMajorElectro",
	AlwaysVisible = true,
	DetailLevel = 60,
	Moment = "end",
	Particles = "DustDevil_Electrostatic_End",
	Scale = 300,
})

PlaceObj('ActionFXParticles', {
	Action = "Spawn",
	Actor = "AlienDiggerMarker",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "OnGround",
	Moment = "start",
	Particles = "Rocket_Landing_Pos_02",
	Scale = 150,
	Source = "ActionPos",
	Target = "ignore",
	handle = 508817571,
})

PlaceObj('ActionFXParticles', {
	Action = "Spawn",
	Actor = "AlienDiggerMarkerBig",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "OnGround",
	Moment = "start",
	Particles = "Rocket_Landing_Pos_02",
	Scale = 150,
	Source = "ActionPos",
	Target = "ignore",
	handle = 1548717185,
})

PlaceObj('ActionFXParticles', {
	Action = "Spawn",
	Actor = "DustDevil1",
	AlwaysVisible = true,
	Attach = true,
	Behavior = "BehaviorDetachAndDestroy",
	BehaviorMoment = "end",
	Moment = "start",
	Particles = "DustDevil_04",
	Scale = 800,
	handle = 2102815325,
})

PlaceObj('ActionFXParticles', {
	Action = "Spawn",
	Actor = "DustDevil2",
	AlwaysVisible = true,
	Attach = true,
	Behavior = "BehaviorDetachAndDestroy",
	BehaviorMoment = "end",
	Moment = "start",
	Particles = "DustDevil_04",
	Scale = 800,
	handle = 353684318,
})

PlaceObj('ActionFXParticles', {
	Action = "Spawn",
	Actor = "DustDevilElectro",
	AlwaysVisible = true,
	Attach = true,
	Behavior = "BehaviorDetachAndDestroy",
	BehaviorMoment = "end",
	Moment = "start",
	Particles = "DustDevil_04_Electrostatic",
	Scale = 800,
	handle = 1022713216,
})

PlaceObj('ActionFXParticles', {
	Action = "Spawn",
	Actor = "DustDevilMajor1",
	AlwaysVisible = true,
	Attach = true,
	Behavior = "BehaviorDetachAndDestroy",
	BehaviorMoment = "end",
	Moment = "start",
	Particles = "DustDevil_04",
	Scale = 1400,
	handle = 1691741188,
})

PlaceObj('ActionFXParticles', {
	Action = "Spawn",
	Actor = "DustDevilMajor2",
	AlwaysVisible = true,
	Attach = true,
	Behavior = "BehaviorDetachAndDestroy",
	BehaviorMoment = "end",
	Moment = "start",
	Particles = "DustDevil_04",
	Scale = 1400,
	handle = 1430933536,
})

PlaceObj('ActionFXParticles', {
	Action = "Spawn",
	Actor = "DustDevilMajorElectro",
	AlwaysVisible = true,
	Attach = true,
	Behavior = "BehaviorDetachAndDestroy",
	BehaviorMoment = "end",
	Moment = "start",
	Particles = "DustDevil_04_Electrostatic",
	Scale = 1400,
	handle = 283834862,
})

PlaceObj('ActionFXParticles', {
	Action = "Spawn",
	Actor = "MetatronGiftAnomaly",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Metatron_Small_Alive",
	Scale = 30,
	handle = 255029010,
})

PlaceObj('ActionFXParticles', {
	Action = "Spawn",
	Actor = "MetatronGiftAnomaly",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Metatron_Small_Alive_Trail",
	Scale = 30,
	handle = 1659281785,
})

PlaceObj('ActionFXParticles', {
	Action = "Spawn",
	Actor = "MetatronGiftIonStorm",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Metatron_Small_Alive",
	Scale = 30,
	handle = 1762545609,
})

PlaceObj('ActionFXParticles', {
	Action = "Spawn",
	Actor = "MetatronGiftIonStorm",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Metatron_Small_Alive_Trail",
	Scale = 30,
	handle = 419237361,
})

PlaceObj('ActionFXParticles', {
	Action = "Spawn",
	Actor = "MetatronIonStorm",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "IonicStorm",
	Scale = 135,
	Target = "ignore",
	handle = 1917046783,
})

PlaceObj('ActionFXParticles', {
	Action = "Spawn",
	Actor = "RocketProjectile",
	AlwaysVisible = true,
	Attach = true,
	Behavior = "BehaviorDetachAndDestroy",
	BehaviorMoment = "end",
	DetailLevel = 60,
	Moment = "start",
	Particles = "RocketProjectile_Trail",
	Target = "ignore",
	handle = 1306156112,
})

PlaceObj('ActionFXParticles', {
	Action = "Spawn",
	Actor = "RotatyThing",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Demolish_Warning",
	Spot = "Light",
	SpotsPercent = 100,
	handle = 909612563,
})

PlaceObj('ActionFXParticles', {
	Action = "Spawn",
	Actor = "Sinkhole",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "Fireflies_SinkHole_Spawn",
	Scale = 175,
	Spot = "Particle",
	handle = 131495745,
})

PlaceObj('ActionFXParticles', {
	Action = "StirlingGenerator",
	Actor = "StirlingGenerator",
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "close",
		}),
	},
	Moment = "close",
	Particles = "StirlingGenerator_Close",
	Spot = "Light",
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "StirlingGenerator",
	Actor = "AdvancedStirlingGenerator",
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "close",
		}),
	},
	Moment = "hit-moment",
	Offset = point(0, 0, -400),
	Particles = "AdvancedStirlingGenerator_Close",
	Spot = "Center",
	Target = "ignore",
	handle = 116922091,
})

PlaceObj('ActionFXParticles', {
	Action = "StirlingGenerator",
	Actor = "AdvancedStirlingGenerator",
	Attach = true,
	Delay = 3200,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "close_start",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "close",
		}),
	},
	Moment = "open_start",
	Offset = point(0, 0, -500),
	Particles = "AdvancedStirlingGenerator_Open",
	Spot = "Center",
	Target = "ignore",
	handle = 1641285356,
})

PlaceObj('ActionFXParticles', {
	Action = "StirlingGenerator",
	Actor = "AdvancedStirlingGenerator",
	Attach = true,
	Delay = 4000,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "close_start",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "close",
		}),
	},
	Moment = "open_start",
	Particles = "AdvancedStirlingGenerator_Open_Center",
	Spot = "Center",
	Target = "ignore",
	handle = 606045418,
})

PlaceObj('ActionFXParticles', {
	Action = "StirlingGenerator",
	Actor = "AdvancedStirlingGenerator",
	Attach = true,
	Delay = 3000,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "close_start",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "close",
		}),
	},
	Moment = "open_start",
	Particles = "AdvancedStirlingGenerator_Open_Lasers",
	Spot = "Laser",
	SpotsPercent = 100,
	Target = "ignore",
	handle = 1298565669,
})

PlaceObj('ActionFXParticles', {
	Action = "StirlingGenerator",
	Actor = "AdvancedStirlingGenerator",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "open",
		}),
	},
	Moment = "open_start",
	Offset = point(0, 0, -400),
	Particles = "AdvancedStirlingGenerator_Open_Start",
	Spot = "Center",
	Target = "ignore",
	handle = 907851255,
})

PlaceObj('ActionFXParticles', {
	Action = "StirlingGenerator",
	Actor = "StirlingGenerator",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "close_start",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "close",
		}),
	},
	Moment = "open_start",
	Particles = "StirlingGenerator_Open",
	Spot = "Light",
	Target = "ignore",
	handle = 1673199288,
})

PlaceObj('ActionFXParticles', {
	Action = "StirlingGenerator",
	Actor = "StirlingGenerator",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "open",
		}),
	},
	Moment = "open_start",
	Particles = "StirlingGenerator_Open_Start",
	Spot = "Light",
	Target = "ignore",
	handle = 1140640155,
})

PlaceObj('ActionFXParticles', {
	Action = "Suspended",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "ElStorm_Lightning_01_Hit",
	Spot = "Center",
	Target = "ignore",
	handle = 519786273,
})

PlaceObj('ActionFXParticles', {
	Action = "TakeOff",
	Actor = "JumperShuttle",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Shuttle_Jumper_Ignition",
	Spot = "Particle",
	SpotsPercent = 100,
	handle = 1846069231,
})

PlaceObj('ActionFXParticles', {
	Action = "TakeOff",
	Actor = "JumperShuttle",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(-100, 0, 0),
	Particles = "Shuttle_Jumper_Ignition_Start",
	Spot = "Particle",
	SpotsPercent = 100,
	handle = 622341295,
})

PlaceObj('ActionFXParticles', {
	Action = "TakeOff",
	Actor = "JumperShuttle",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Shuttle_TakeOff",
	SpotsPercent = 100,
	handle = 465193584,
})

PlaceObj('ActionFXParticles', {
	Action = "TakeOff",
	Actor = "MirrorSphere",
	Attach = true,
	Behavior = "BehaviorDetachAndDestroy",
	BehaviorMoment = "end",
	DetailLevel = 40,
	Flags = "OnGround",
	Moment = "start",
	Offset = point(0, 0, 1000),
	Particles = "AlienDigger_LaunchSmoke_Big",
	Spot = "Center",
	Target = "ignore",
	Time = 1000,
	handle = 629107575,
})

PlaceObj('ActionFXParticles', {
	Action = "TakeOff",
	Actor = "MirrorSphere",
	DetailLevel = 40,
	Flags = "OnGround",
	Moment = "start",
	Offset = point(0, 0, 1000),
	Particles = "MirrorSphere_Dig",
	Scale = 150,
	Spot = "Center",
	Target = "ignore",
	Time = 2000,
})

PlaceObj('ActionFXParticles', {
	Action = "TakeOff",
	Actor = "Shuttle",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Shuttle_Sides_Ignition",
	Spot = "Particle2",
	SpotsPercent = 100,
	handle = 1009318132,
})

PlaceObj('ActionFXParticles', {
	Action = "TakeOff",
	Actor = "Shuttle",
	Attach = true,
	Delay = 200,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Shuttle_Sides_Ignition_Start",
	Spot = "Particle2",
	SpotsPercent = 100,
	Time = 1000,
	handle = 478627819,
})

PlaceObj('ActionFXParticles', {
	Action = "TakeOff",
	Actor = "Shuttle",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Shuttle_TakeOff",
	SpotsPercent = 100,
	handle = 1958416987,
})

PlaceObj('ActionFXParticles', {
	Action = "Thrusters",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "RocketUI_Glow",
	SpotsPercent = 100,
	Target = "ignore",
	handle = 571659848,
})

PlaceObj('ActionFXParticles', {
	Action = "Thrusters",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	OrientationAxis = -3,
	Particles = "RocketUI_Trail",
	Spot = "Trail",
	SpotsPercent = 100,
	Target = "ignore",
	handle = 1159442663,
})

PlaceObj('ActionFXParticles', {
	Action = "Trap",
	Actor = "Firefly",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndAction', "Release",
			'EndMoment', "start",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndAction', "Kill",
			'EndMoment', "start",
		}),
	},
	Moment = "end",
	Particles = "Firefly_LightTrap_Trapped",
	Scale = 60,
	Spot = "Particle",
	Target = "ignore",
	handle = 1045178950,
})

PlaceObj('ActionFXParticles', {
	Action = "Trap",
	Actor = "LightTrap",
	Attach = true,
	Delay = 1200,
	Moment = "start",
	Offset = point(0, 0, 500),
	Particles = "Fireflies_LightTrap_Trap",
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "TurnToDepositComplete",
	Actor = "MirrorSphere",
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "OnGround",
	Moment = "start",
	Particles = "MirrorSphere_Destruction",
	Scale = 150,
	Spot = "Center",
	Target = "PowerDecoy",
	handle = 888005894,
})

PlaceObj('ActionFXParticles', {
	Action = "TurnToMetal",
	Actor = "MirrorSphere",
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "OnGround",
	Moment = "start",
	Particles = "PowerDecoy_TurnToMetal",
	Scale = 90,
	Source = "Target",
	Target = "PowerDecoy",
	handle = 1827249790,
})

PlaceObj('ActionFXParticles', {
	Action = "TurnToPolymer",
	Actor = "MirrorSphere",
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "OnGround",
	Moment = "start",
	Particles = "PowerDecoy_TurnToPolymers",
	Scale = 90,
	Source = "Target",
	Target = "PowerDecoy",
	handle = 1451599375,
})

PlaceObj('ActionFXParticles', {
	Action = "TurnToPreciousMetal",
	Actor = "MirrorSphere",
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "OnGround",
	Moment = "start",
	Particles = "PowerDecoy_TurnToPreciousMetal",
	Scale = 90,
	Source = "Target",
	Target = "PowerDecoy",
	handle = 1316222846,
})

PlaceObj('ActionFXParticles', {
	Action = "Unload",
	Actor = "RCConstructor",
	Attach = true,
	Delay = 500,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "RCTransport_Unload",
	handle = 98301979,
})

PlaceObj('ActionFXParticles', {
	Action = "Unload",
	Actor = "RCHarvester",
	Attach = true,
	Delay = 500,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "RCTransport_Unload",
	handle = 6990296,
})

PlaceObj('ActionFXParticles', {
	Action = "Unload",
	Actor = "RCTerraformer",
	Attach = true,
	Delay = 500,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(200, 0, -200),
	Particles = "RCTransport_Unload",
	handle = 67247621,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Unload",
	Actor = "RCTransport",
	Attach = true,
	Delay = 500,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "RCTransport_Unload",
	handle = 747824266,
})

PlaceObj('ActionFXParticles', {
	Action = "Waiting",
	Actor = "JumperShuttle",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Shuttle_Jumper_Ignition",
	Spot = "Particle",
	SpotsPercent = 100,
	handle = 178937622,
})

PlaceObj('ActionFXParticles', {
	Action = "Waiting",
	Actor = "Shuttle",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Shuttle_Sides_Ignition",
	Spot = "Particle2",
	SpotsPercent = 100,
	handle = 929600623,
})

PlaceObj('ActionFXParticles', {
	Action = "WaitingCommand",
	Actor = "Drone",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Drone_NoBattery",
	Spot = "Lantern",
	Target = "ignore",
	handle = 463081900,
})

PlaceObj('ActionFXParticles', {
	Action = "WarmUp",
	Actor = "GeyserWarmup",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Env_CO2Geyser_Ground",
	Target = "PrefabFeatureMarker",
	handle = 1725447203,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "SolarPanel",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "close",
		}),
	},
	Moment = "end",
	Particles = "SolarPanel_Close",
	Time = 3200,
	handle = 1154901248,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "SolarPanelBig",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "close",
		}),
	},
	Moment = "end",
	Particles = "SolarPanelBig_Close",
	Spot = "Center",
	Time = 3200,
	handle = 1952068180,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "MOXIE",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "hit-moment1",
	Particles = "MOXIE_Steam",
	Source = "Target",
	Spot = "Steam2",
	Time = 10000,
	handle = 4545713,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "PreciousMetalsExtractor",
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "hit-moment1",
	OrientationAxis = 2,
	Particles = "UniversalExtractor_Steam",
	Spot = "Smoke",
	SpotsPercent = 100,
	Target = "UniversalExtractorHammer",
	Time = 5000,
	handle = 924651685,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "MOXIE",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "hit-moment2",
	Particles = "MOXIE_Steam",
	Source = "Target",
	Spot = "Steam1",
	Time = 10000,
	handle = 1828342383,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "PreciousMetalsExtractor",
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "hit-moment2",
	OrientationAxis = 2,
	Particles = "UniversalExtractor_Steam",
	Spot = "Smoke",
	SpotsPercent = 100,
	Target = "UniversalExtractorHammer",
	Time = 5000,
	handle = 872033987,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "PreciousMetalsExtractor",
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "hit-moment3",
	OrientationAxis = 2,
	Particles = "UniversalExtractor_Steam",
	Spot = "Smoke",
	SpotsPercent = 100,
	Target = "UniversalExtractorHammer",
	Time = 5000,
	handle = 1980372174,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "Arcology",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "Arcology_Beacon",
	Spot = "Beacon",
	SpotsPercent = 100,
	Target = "Arcology",
	handle = 1002566868,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "AutomaticMetalsExtractor",
	Delay = 200,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "AutoMetalExtractor_Digging",
	handle = 957357658,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "BlackCubeMonolith",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(0, 0, 500),
	Particles = "BlackCubeMonolith_Alive",
	Scale = 120,
	Spot = "Center",
	Target = "ignore",
	handle = 542518272,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "BlackCubeStockpile",
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "BlackCube_Appearance",
	Scale = 200,
	ScaleMember = "GetSelectionRadiusScale",
	handle = 414319488,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "CarbonateProcessor",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "CarbonateProcessor_Smoke",
	Scale = 300,
	Spot = "Smoke",
	SpotsPercent = 100,
	Target = "ignore",
	handle = 1334392866,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "ConcretePlant",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "ConcretePlantCylinder_Steam",
	Source = "Target",
	Spot = "Cylinder",
	Target = "ConcretePlantCylinder",
	handle = 1084202036,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "ConcretePlant",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "ConcretePlant_Steam",
	Spot = "Smoke",
	SpotsPercent = 100,
	Target = "ignore",
	handle = 527341895,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "CoreHeatConvector",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(0, 0, 6),
	OrientationAxis = 3,
	Particles = "CoreHeatConvector_Steam",
	Spot = "Steam",
	SpotsPercent = 100,
	handle = 1457994987,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "ForestationPlant",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Lake_WaterPump",
	Scale = 180,
	Source = "Target",
	Spot = "Water",
	SpotsPercent = 100,
	Target = "ForestationPlantSprinkler",
	handle = 1108200734,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "FountainLarge",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "GardenFountains_06",
	Scale = 120,
	Spot = "Waterstream_01",
	Target = "GardenFountains_03",
	handle = 958665284,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "FountainLarge",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "GardenFountains_06",
	Scale = 120,
	Spot = "Waterstream_02",
	Target = "GardenFountains_03",
	handle = 965557898,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "FountainLarge",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "GardenFountains_06",
	Scale = 120,
	Spot = "Waterstream_03",
	Target = "GardenFountains_03",
	handle = 84997794,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "FountainLarge",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "GardenFountains_07",
	Scale = 120,
	Spot = "Waterstream_04",
	Target = "GardenFountains_03",
	handle = 102460336,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "FountainLarge",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "GardenFountains_07",
	Scale = 120,
	Spot = "Waterstream_05",
	Target = "GardenFountains_03",
	handle = 1535509170,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "FountainLarge",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "GardenFountains_07",
	Scale = 120,
	Spot = "Waterstream_06",
	Target = "GardenFountains_03",
	handle = 1294349971,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "FountainLarge",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "GardenFountains_07",
	Scale = 120,
	Spot = "Waterstream_07",
	Target = "GardenFountains_03",
	handle = 1153806249,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "FountainLarge",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "GardenFountains_07",
	Scale = 120,
	Spot = "Waterstream_08",
	Target = "GardenFountains_03",
	handle = 1899550762,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "FountainSmall",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "GardenFountains_01",
	Spot = "Waterstream_01",
	Target = "GardenFountains_01",
	handle = 1042696498,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "FountainSmall",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "GardenFountains_02",
	Scale = 120,
	Spot = "Waterstream_02",
	Target = "GardenFountains_01",
	handle = 2050236328,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "FountainSmall",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "GardenFountains_02",
	Scale = 120,
	Spot = "Waterstream_03",
	Target = "GardenFountains_01",
	handle = 1778724574,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "FountainSmall",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "GardenFountains_02",
	Scale = 120,
	Spot = "Waterstream_04",
	Target = "GardenFountains_01",
	handle = 618050979,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "FountainSmall",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "GardenFountains_03",
	Spot = "Waterstream_01",
	Target = "GardenFountains_01",
	handle = 482363157,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "FountainSmall",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "GardenFountains_04",
	Spot = "Waterfall_01",
	Target = "GardenFountains_02",
	handle = 225001510,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "FountainSmall",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "GardenFountains_04",
	Scale = 140,
	Spot = "Waterfall_02",
	Target = "GardenFountains_02",
	handle = 1860374564,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "FountainSmall",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "GardenFountains_04",
	Scale = 180,
	Spot = "Waterfall_03",
	Target = "GardenFountains_02",
	handle = 1759757674,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "FountainSmall",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "GardenFountains_05",
	Scale = 180,
	Spot = "Waterstream",
	Target = "GardenFountains_02",
	handle = 772471396,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "FusionReactor",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	OffsetDir = "",
	Orientation = "SpotZ",
	OrientationAxis = 3,
	Particles = "MOXIE_Smoke",
	Spot = "Smoke",
	SpotsPercent = 100,
	handle = 1523631227,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "GHGFactory",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "GHGFactory_Smoke",
	Scale = 80,
	Spot = "Smoke",
	SpotsPercent = 100,
	Target = "ignore",
	handle = 1422453533,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "GeoscapeDome",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Wonder_Dome_Waves",
	Spot = "Water",
	SpotsPercent = 100,
	handle = 1258450243,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "HangingGardens",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "HangingGardens_FallingLeaves",
	Spot = "Tree",
	Target = "ignore",
	handle = 1524961436,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "HangingGardens",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "HangingGardens_Pool_Ripples",
	Spot = "Tree",
	Target = "ignore",
	handle = 1176683658,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "HangingGardens",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "HangingGardens_Pool_Ripples_02",
	Spot = "Pool",
	SpotsPercent = 100,
	Target = "ignore",
	handle = 93111606,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "HangingGardens",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "HangingGardens_Waterfall",
	Spot = "Waterfall",
	SpotsPercent = 100,
	Target = "ignore",
	handle = 595646306,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "Infirmary",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Infirmary_Sign",
	Spot = "Light",
	Target = "ignore",
	handle = 1684431911,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "Lake",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Lake_Ripples",
	Target = "GardenLake",
	handle = 531240068,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "LightTrap",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(0, 0, 1000),
	Particles = "Fireflies_LightTrap_Alive",
	Scale = 300,
	handle = 2114993826,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "MOXIE",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FxId = "MoxieSmoke",
	Moment = "start",
	Particles = "MOXIE_Smoke",
	Spot = "Smoke",
	SpotsPercent = 100,
	Target = "ignore",
	handle = 400140290,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "MedicalCenter",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Medical_Sign",
	Spot = "Light",
	Target = "ignore",
	handle = 64743940,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "MetalsExtractor",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	OrientationAxis = 2,
	Particles = "Mine_Metal_Steam",
	Spot = "Smoke",
	SpotsPercent = 100,
	handle = 1499197166,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "MetalsExtractor",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Mine_Metal_Steam_Inside",
	Spot = "Hole",
	SpotsPercent = 100,
	handle = 1833011760,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "MetalsRefinery",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "MetalsRefineryBarrel_Steam",
	Source = "Target",
	Spot = "Barrel",
	Target = "ReprocessingPlantBarrel",
	handle = 1918261700,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "MetalsRefinery",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "MetalsRefinery_Smoke",
	Spot = "Smoke",
	SpotsPercent = 100,
	Target = "ignore",
	handle = 1105502697,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "MoistureVaporator",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "MoistureVaporator_Sparks",
	Spot = "Steam",
	Target = "ignore",
	handle = 1385185963,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "MoistureVaporator",
	Attach = true,
	Delay = 5000,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "MoistureVaporator_Steam",
	Spot = "Steam",
	Target = "ignore",
	handle = 1583035579,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "OpenFarm",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "OpenFarm_Water",
	Scale = 180,
	Source = "Target",
	Spot = "Water",
	SpotsPercent = 100,
	Target = "OpenFarmSprinkler",
	handle = 1515388247,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "PreciousMetalsExtractor",
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	OrientationAxis = 2,
	Particles = "UniversalExtractor_Steam_02",
	Spot = "Smoke",
	SpotsPercent = 100,
	Target = "RareMetalExtractorCP3Drill",
	handle = 2045044960,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "PreciousMetalsExtractor",
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	OrientationAxis = 2,
	Particles = "UniversalExtractor_Smoke",
	Spot = "Smoke",
	SpotsPercent = 100,
	Target = "UniversalExtractorHammer",
	handle = 1468021056,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "ProjectMorpheus",
	Attach = true,
	Delay = 5000,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	OrientationAxis = 2,
	Particles = "ProjectMorpheus_Dreamcatcher",
	Scale = 50,
	Spot = "Particle",
	handle = 220777504,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "ProjectMorpheus",
	Attach = true,
	Delay = 5000,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	OrientationAxis = -1,
	Particles = "ProjectMorpheus_Dreamcatcher_Rays",
	Spot = "Beam",
	SpotsPercent = 100,
	handle = 1410061420,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "ProjectMorpheus",
	Attach = true,
	Delay = 5000,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	OrientationAxis = 2,
	Particles = "ProjectMorpheus_Dreamcatcher_Rotating",
	Scale = 40,
	Spot = "Rotation",
	handle = 259950637,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "ProjectMorpheus",
	Attach = true,
	Delay = 3500,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	OrientationAxis = -1,
	Particles = "ProjectMorpheus_Projector",
	Spot = "Projector",
	SpotsPercent = 100,
	handle = 1100606828,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "RareMetalsRefinery",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "RareMetalsProcessor_Pipe",
	Source = "Target",
	Spot = "Pipe",
	SpotsPercent = 100,
	Target = "RareMetalProcessorCrusher",
	handle = 69231751,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "RareMetalsRefinery",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "WasteRockProcessor_Crusher",
	Source = "Target",
	Spot = "Crusher",
	SpotsPercent = 100,
	Target = "RareMetalProcessorCrusher",
	handle = 71326117,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "RareMetalsRefinery",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "RareMetalsRefinery_Smoke",
	Spot = "Smoke",
	SpotsPercent = 100,
	handle = 453991261,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "RareMetalsRefinery",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "RareMetalsRefinery_Smoke_Chimney",
	Spot = "Steam",
	Target = "ignore",
	handle = 277023385,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "RechargeStation",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	OrientationAxis = -1,
	Particles = "RechargeStation_Lines",
	Source = "Target",
	Spot = "Light",
	SpotsPercent = 100,
	handle = 1424627908,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "RegolithExtractor",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	OrientationAxis = 2,
	Particles = "Mine_Regolith_Steam",
	Spot = "Toplight",
	SpotsPercent = 100,
	handle = 1188826289,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "RoverEuropeAntena",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "RCSensor_Working",
	Scale = 80,
	Spot = "Particle",
	handle = 869270926,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "SensorTower",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "SensorTower_Working",
	handle = 175562619,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "SensorTower",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Offset = point(0, 0, 4500),
	Particles = "WaterTank_Working",
	Scale = 80,
	Spot = "Light",
	SpotsPercent = 100,
	handle = 1107861611,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "SolarPanel",
	Attach = true,
	Delay = 1000,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "open",
		}),
	},
	Moment = "start",
	Particles = "SolarPanel_Open",
	Time = 3500,
	handle = 1335767679,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "SolarPanelBig",
	Attach = true,
	Delay = 1000,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "open",
		}),
	},
	Moment = "start",
	Particles = "SolarPanelBig_Open",
	Spot = "Center",
	Time = 3500,
	handle = 424285411,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "SpireFrame",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "Arcology_Beacon",
	Scale = 50,
	Spot = "Beacon",
	SpotsPercent = 100,
	handle = 807418135,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "SubsurfaceHeater",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "SubsurfaceHeater_Working",
	Spot = "Center",
	handle = 942538653,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "TheExcavator",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Mine_Regolith_Steam",
	Scale = 200,
	Spot = "Steam",
	handle = 126680097,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "TriboelectricScrubber",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Offset = point(0, 0, 3430),
	Particles = "WaterTank_Working",
	Scale = 75,
	Spot = "Light",
	SpotsPercent = 100,
	handle = 1867986095,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "WasteRockProcessor",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "RareMetalsProcessor_Pipe",
	Source = "Target",
	Spot = "Pipe",
	SpotsPercent = 100,
	Target = "WasteRockProcessorCrusher",
	handle = 271852141,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "WasteRockProcessor",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(0, 0, 100),
	Particles = "WasteRockProcessor_Crusher",
	Source = "Target",
	Spot = "Crusher",
	SpotsPercent = 100,
	Target = "WasteRockProcessorCrusher",
	handle = 1614376291,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "WasteRockProcessor",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "ConcretePlant_Steam",
	Spot = "Smoke",
	SpotsPercent = 100,
	Target = "ignore",
	handle = 1781522944,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "WasteRockProcessor",
	Attach = true,
	DetailLevel = 40,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "RareMetalsRefinery_Smoke",
	Spot = "Steam",
	SpotsPercent = 100,
	Target = "ignore",
	handle = 1316498239,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "WaterExtractor",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	OrientationAxis = -3,
	Particles = "WaterExtractor_Steam",
	Spot = "Water",
	SpotsPercent = 100,
	Target = "ignore",
	handle = 1362950274,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "WaterPump",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Lake_WaterPump_Water",
	Scale = 180,
	Spot = "Water",
	SpotsPercent = 100,
	Target = "ignore",
	handle = 2132581210,
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "WaterReclamationSystem",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(0, 0, -100),
	Particles = "WaterReclamationSystem_Fall_Blue",
	Spot = "Water4",
	SpotsPercent = 100,
	Target = "ignore",
	handle = 2133263568,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "WaterReclamationSystem",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(0, 0, -100),
	Particles = "WaterReclamationSystem_Fall_Clear",
	Spot = "Water1",
	SpotsPercent = 100,
	Target = "ignore",
	handle = 241613903,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "WaterReclamationSystem",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(0, 0, -100),
	Particles = "WaterReclamationSystem_Fall_Green",
	Spot = "Water7",
	SpotsPercent = 100,
	Target = "ignore",
	handle = 360689100,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "WaterReclamationSystem",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(0, 0, -100),
	Particles = "WaterReclamationSystem_Fall_GreenBlue",
	Spot = "Water5",
	SpotsPercent = 100,
	Target = "ignore",
	handle = 1884963033,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "WaterReclamationSystem",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(0, 0, -100),
	Particles = "WaterReclamationSystem_Fall_GreenBlue",
	Spot = "Water6",
	SpotsPercent = 100,
	Target = "ignore",
	handle = 1327655129,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "WaterReclamationSystem",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(0, 0, -100),
	Particles = "WaterReclamationSystem_Fall_LightBlue",
	Spot = "Water2",
	SpotsPercent = 100,
	Target = "ignore",
	handle = 1723445957,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "WaterReclamationSystem",
	Attach = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(0, 0, -100),
	Particles = "WaterReclamationSystem_Fall_LightBlue",
	Spot = "Water3",
	SpotsPercent = 100,
	Target = "ignore",
	handle = 1166406266,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "WaterReclamationSystem",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "WaterReclamationSystem_Ripples",
	Scale = 140,
	Spot = "Poolbottom",
	SpotsPercent = 100,
	Target = "ignore",
	handle = 1161212700,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "WaterReclamationSystem",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	OrientationAxis = 2,
	Particles = "WaterReclamationSystem_WaterShader",
	Scale = 140,
	Spot = "Pool",
	SpotsPercent = 100,
	Target = "ignore",
	handle = 1645258711,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "WaterTank",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Offset = point(0, 0, 20),
	Particles = "WaterTank_Working_Blue",
	Spot = "Toplight",
	SpotsPercent = 100,
	handle = 107975081,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "WindTurbine",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Offset = point(0, 0, -40),
	Particles = "WaterTank_Working",
	Scale = 75,
	Spot = "Light",
	SpotsPercent = 100,
	handle = 1885949109,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "WindTurbine_Large",
	Attach = true,
	DetailLevel = 60,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "WindTurbine_Large",
	Spot = "Light",
	SpotsPercent = 100,
	handle = 1268132526,
})

PlaceObj('ActionFXParticles', {
	Action = "BuildingBigPlaceInside",
	Actor = "ConstructionSite",
	DetailLevel = 60,
	Disabled = true,
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "Construction_PlaceBuilding",
	Source = "ActionPos",
	Target = "ignore",
	Time = 10000,
})

PlaceObj('ActionFXParticles', {
	Action = "BuildingBigPlaceOutside",
	Actor = "ConstructionSite",
	DetailLevel = 60,
	Disabled = true,
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "Construction_PlaceBuilding",
	Source = "ActionPos",
	Target = "ignore",
	Time = 10000,
})

PlaceObj('ActionFXParticles', {
	Action = "BuildingBigRemoveInside",
	DetailLevel = 60,
	Disabled = true,
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "Construction_RemoveBuilding_Inside",
	Source = "ActionPos",
	Target = "ignore",
	Time = 5000,
})

PlaceObj('ActionFXParticles', {
	Action = "BuildingInteractableComponent",
	Actor = "SolarArray",
	Attach = true,
	DetailLevel = 60,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "close",
		}),
	},
	Moment = "close_start",
	Particles = "SolarPanel_Close",
	Spot = "Light2",
	SpotsPercent = 100,
	Target = "ignore",
	Time = 3200,
})

PlaceObj('ActionFXParticles', {
	Action = "BuildingInteractableComponent",
	Actor = "SolarArray",
	Attach = true,
	DetailLevel = 40,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "close_start",
		}),
	},
	Moment = "open",
	OrientationAxis = 3,
	Particles = "SolarPanel_Blinks",
	Spot = "Light",
	SpotsPercent = 100,
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "BuildingInteractableComponent",
	Actor = "SolarArray",
	Attach = true,
	DetailLevel = 40,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "close_start",
		}),
	},
	Moment = "open",
	OrientationAxis = 3,
	Particles = "SolarPanel_SunDust",
	Spot = "Light",
	SpotsPercent = 100,
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "BuildingInteractableComponent",
	Actor = "SolarPanel",
	Attach = true,
	DetailLevel = 40,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "close_start",
		}),
	},
	Moment = "open",
	OrientationAxis = 3,
	Particles = "SolarPanel_Blinks",
	Spot = "Light",
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "BuildingInteractableComponent",
	Actor = "SolarPanel",
	Attach = true,
	DetailLevel = 40,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "close_start",
		}),
	},
	Moment = "open",
	OrientationAxis = 3,
	Particles = "SolarPanel_SunDust",
	Spot = "Light",
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "BuildingInteractableComponent",
	Actor = "SolarPanelBig",
	Attach = true,
	DetailLevel = 40,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "close_start",
		}),
	},
	Moment = "open",
	Particles = "SolarPanelBig_Blinks",
	Spot = "Light",
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "BuildingInteractableComponent",
	Actor = "SolarPanelBig",
	Attach = true,
	DetailLevel = 40,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "close_start",
		}),
	},
	Moment = "open",
	OrientationAxis = 3,
	Particles = "SolarPanel_SunDust",
	Scale = 200,
	Spot = "Light",
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "BuildingInteractableComponent",
	Actor = "SolarArray",
	Attach = true,
	Delay = 1000,
	DetailLevel = 60,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "open",
		}),
	},
	Moment = "open_start",
	Particles = "SolarPanel_Open",
	Spot = "Light2",
	SpotsPercent = 100,
	Target = "ignore",
	Time = 4500,
})

PlaceObj('ActionFXParticles', {
	Action = "BuildingSmallPlaceInside",
	Actor = "ConstructionSite",
	DetailLevel = 60,
	Disabled = true,
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "Construction_PlaceBuilding",
	Source = "ActionPos",
	Target = "ignore",
	Time = 10000,
})

PlaceObj('ActionFXParticles', {
	Action = "BuildingSmallPlaceInside",
	Actor = "ConstructionSite",
	DetailLevel = 60,
	Disabled = true,
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "Construction_PlaceBuilding_Inside",
	Source = "ActionPos",
	Target = "ignore",
	Time = 10000,
})

PlaceObj('ActionFXParticles', {
	Action = "BuildingSmallPlaceOutside",
	Actor = "ConstructionSite",
	DetailLevel = 60,
	Disabled = true,
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "Construction_PlaceBuilding",
	Source = "ActionPos",
	Target = "ignore",
	Time = 10000,
})

PlaceObj('ActionFXParticles', {
	Action = "BuildingSmallPlaceOutside",
	Actor = "ConstructionSite",
	DetailLevel = 60,
	Disabled = true,
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "Construction_PlaceBuilding_Inside",
	Source = "ActionPos",
	Target = "ignore",
	Time = 10000,
})

PlaceObj('ActionFXParticles', {
	Action = "Clean",
	Actor = "RCRover",
	Attach = true,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	OrientationAxis = 2,
	Particles = "RCRover_Clean",
	Spot = "Particle1",
})

PlaceObj('ActionFXParticles', {
	Action = "Clean",
	Actor = "RCRover",
	Attach = true,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	OrientationAxis = 2,
	Particles = "RCRover_Clean",
	Spot = "Particle2",
})

PlaceObj('ActionFXParticles', {
	Action = "ClickInteract",
	Actor = "RCTransport",
	DetailLevel = 80,
	Disabled = true,
	Moment = "start",
	Particles = "Click",
	Source = "Target",
	Time = 500,
})

PlaceObj('ActionFXParticles', {
	Action = "ClickMove",
	Actor = "ExplorerRover",
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndAction', "ClickMove",
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Click",
	Source = "ActionPos",
	Time = 500,
})

PlaceObj('ActionFXParticles', {
	Action = "ClickMove",
	Actor = "RCRover",
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndAction', "ClickMove",
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Click",
	Source = "ActionPos",
	Time = 500,
})

PlaceObj('ActionFXParticles', {
	Action = "ColdWave",
	Attach = true,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "OnGround",
	Moment = "start",
	Offset = point(20000, 0, 0),
	OrientationAxis = 2,
	Particles = "Camera_ColdWave",
	Source = "Camera",
})

PlaceObj('ActionFXParticles', {
	Action = "Construct",
	Actor = "RCRover",
	Attach = true,
	Delay = 500,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	OrientationAxis = 2,
	Particles = "RCRover_Construction_01",
	Spot = "Particle1",
})

PlaceObj('ActionFXParticles', {
	Action = "Construct",
	Actor = "RCRover",
	Attach = true,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	OrientationAxis = 2,
	Particles = "RCRover_Construction_02",
	Spot = "Particle2",
})

PlaceObj('ActionFXParticles', {
	Action = "ConstructionCursor",
	Actor = "CursorBuilding",
	Attach = true,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Building_Area",
	ScaleMember = "GetSelectionRadiusScale",
	Spot = "Center",
	Target = "SensorTower",
})

PlaceObj('ActionFXParticles', {
	Action = "ConstructionCursor",
	Attach = true,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Building_Area",
	ScaleMember = "GetSelectionRadiusScale",
	Spot = "Center",
	Target = "DroneHub",
})

PlaceObj('ActionFXParticles', {
	Action = "ConstructionCursor",
	Attach = true,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Mine_Area",
	ScaleMember = "GetSelectionRadiusScale",
	Spot = "Center",
	Target = "MetalsExtractor",
})

PlaceObj('ActionFXParticles', {
	Action = "ConstructionCursor",
	Attach = true,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Mine_Area",
	ScaleMember = "GetSelectionRadiusScale",
	Spot = "Center",
	Target = "SubsurfaceHeater",
})

PlaceObj('ActionFXParticles', {
	Action = "ConstructionCursor",
	Attach = true,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Mine_Area",
	ScaleMember = "GetSelectionRadiusScale",
	Spot = "Center",
	Target = "TriboelectricScrubber",
})

PlaceObj('ActionFXParticles', {
	Action = "ConstructionCursor",
	Attach = true,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Mine_Area",
	ScaleMember = "GetSelectionRadiusScale",
	Spot = "Center",
	Target = "WaterExtractor",
})

PlaceObj('ActionFXParticles', {
	Action = "Drop",
	Actor = "ConstructionSite",
	DetailLevel = 60,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "ConstructionSite_Spawn",
})

PlaceObj('ActionFXParticles', {
	Action = "Drop",
	Actor = "RCRover",
	DetailLevel = 60,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "ConstructionSite_Spawn",
	Scale = 150,
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "Drop",
	Actor = "ResourceStockpile",
	DetailLevel = 60,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "ConstructionSite_Spawn",
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "DustStorm",
	AlwaysVisible = true,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	OffsetDir = "",
	Particles = "DustStorm_Macro_Base",
	Source = "ActionPos",
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "DustStorm",
	AlwaysVisible = true,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	OffsetDir = "",
	Particles = "DustStorm_Overview",
	Source = "ActionPos",
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "ElectrostaticStorm",
	Attach = true,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "OnGround",
	Moment = "start",
	Offset = point(20000, 0, 0),
	OrientationAxis = 2,
	Particles = "Camera_ElectrostaticStorm",
	Source = "Camera",
})

PlaceObj('ActionFXParticles', {
	Action = "ElectrostaticStorm",
	AlwaysVisible = true,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	OffsetDir = "",
	Particles = "DustStorm_Macro_Electrostatic",
	Source = "ActionPos",
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "ElectrostaticStorm",
	AlwaysVisible = true,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	OffsetDir = "",
	Particles = "DustStorm_Overview_Electrostatic",
	Source = "ActionPos",
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Gather",
	Actor = "RCTransport",
	Attach = true,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	OrientationAxis = 2,
	Particles = "RCRover_Gather_02",
	Spot = "Particle2",
})

PlaceObj('ActionFXParticles', {
	Action = "GreatStorm",
	AlwaysVisible = true,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	OffsetDir = "",
	Particles = "DustStorm_Macro_Base",
	Source = "ActionPos",
})

PlaceObj('ActionFXParticles', {
	Action = "GreatStorm",
	AlwaysVisible = true,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	OffsetDir = "",
	Particles = "DustStorm_Overview_GreatStorm",
	Source = "ActionPos",
	id = "",
})

PlaceObj('ActionFXParticles', {
	Action = "Moving",
	Actor = "ExplorerRover",
	Attach = true,
	DetailLevel = 60,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "move",
	Offset = point(0, 800, 0),
	Particles = "RCRover_Trail",
	Scale = 150,
	Spot = "Dust1",
	Time = 4000,
})

PlaceObj('ActionFXParticles', {
	Action = "Moving",
	Actor = "ExplorerRover",
	Attach = true,
	DetailLevel = 60,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "move",
	Offset = point(0, 800, 0),
	Particles = "RCRover_Trail",
	Scale = 150,
	Spot = "Dust2",
	Time = 4000,
})

PlaceObj('ActionFXParticles', {
	Action = "Moving",
	Actor = "RCRover",
	Attach = true,
	DetailLevel = 60,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "move",
	Offset = point(0, 800, 0),
	Particles = "RCRover_Trail",
	Scale = 150,
	Spot = "Dust1",
	Time = 4000,
})

PlaceObj('ActionFXParticles', {
	Action = "Moving",
	Actor = "RCRover",
	Attach = true,
	DetailLevel = 60,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "move",
	Offset = point(0, 800, 0),
	Particles = "RCRover_Trail",
	Scale = 150,
	Spot = "Dust2",
	Time = 4000,
})

PlaceObj('ActionFXParticles', {
	Action = "Moving",
	Actor = "RCTransport",
	Attach = true,
	DetailLevel = 60,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "move",
	Offset = point(0, 800, 0),
	Particles = "RCRover_Trail",
	Scale = 150,
	Spot = "Dust1",
	Time = 4000,
})

PlaceObj('ActionFXParticles', {
	Action = "Moving",
	Actor = "RCTransport",
	Attach = true,
	DetailLevel = 60,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "move",
	Offset = point(0, 800, 0),
	Particles = "RCRover_Trail",
	Scale = 150,
	Spot = "Dust2",
	Time = 4000,
})

PlaceObj('ActionFXParticles', {
	Action = "MysteryDream",
	Attach = true,
	Disabled = true,
	Moment = "end",
	Offset = point(0, 0, 100),
	Particles = "Mystery_MirageHalo",
	Scale = 10,
	Spot = "Wound",
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "RechargeStationPlatform",
	Actor = "RechargeStationPlatform",
	Attach = true,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(0, -20, 0),
	OrientationAxis = -2,
	Particles = "Drone_BeingCleaned",
	Spot = "Clean1",
	Target = "Drone",
})

PlaceObj('ActionFXParticles', {
	Action = "RechargeStationPlatform",
	Actor = "RechargeStationPlatform",
	Attach = true,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(0, 20, 0),
	OrientationAxis = 2,
	Particles = "Drone_BeingCleaned",
	Spot = "Clean2",
	Target = "Drone",
})

PlaceObj('ActionFXParticles', {
	Action = "Research",
	Actor = "ResearchLab",
	Attach = true,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndAction', "Research",
			'EndMoment', "done",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndAction', "Research",
			'EndMoment', "end",
		}),
	},
	Moment = "50+",
	OrientationAxis = -1,
	Particles = "ResearchLab_Text_Atom_50",
	Spot = "Screen",
})

PlaceObj('ActionFXParticles', {
	Action = "Research",
	Actor = "Academy",
	Attach = true,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "off",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "start",
		}),
	},
	Moment = "done",
	OrientationAxis = -1,
	Particles = "ResearchLab_Working",
	Spot = "Light",
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "Research",
	Actor = "ResearchLab",
	Attach = true,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "off",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "start",
		}),
	},
	Moment = "done",
	OrientationAxis = -1,
	Particles = "ResearchLab_Text_Einstein",
	Spot = "Screen",
})

PlaceObj('ActionFXParticles', {
	Action = "Research",
	Actor = "ResearchLab",
	Attach = true,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "off",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "start",
		}),
	},
	Moment = "done",
	OrientationAxis = -1,
	Particles = "ResearchLab_Text_Einstein_Research",
	Spot = "Index1",
})

PlaceObj('ActionFXParticles', {
	Action = "Research",
	Actor = "ResearchLab",
	Attach = true,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "off",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "start",
		}),
	},
	Moment = "done",
	OrientationAxis = -1,
	Particles = "ResearchLab_Text_Einstein_Research",
	Spot = "Index2",
})

PlaceObj('ActionFXParticles', {
	Action = "Research",
	Actor = "ResearchLab",
	Attach = true,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndAction', "Research",
			'EndMoment', "50+",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndAction', "Research",
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	OrientationAxis = -1,
	Particles = "ResearchLab_Text_Atom",
	Spot = "Screen",
})

PlaceObj('ActionFXParticles', {
	Action = "RocketWarning",
	Actor = "SupplyRocket",
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "OnGround",
	Moment = "start",
	Particles = "Rocket_Pos",
	Scale = 200,
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "Scan",
	Actor = "ExplorerRover",
	Attach = true,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	OrientationAxis = 2,
	Particles = "Rover_Scan",
	Spot = "Particle2",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "DroneHub",
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Building_Area",
	ScaleMember = "GetSelectionRadiusScale",
	Spot = "Center",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "ElectricityGridElement",
	DetailLevel = 60,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(0, 0, 100),
	Particles = "Selection_Buildings_Single",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "MetalsExtractor",
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Mine_Area",
	ScaleMember = "GetSelectionRadiusScale",
	Spot = "Center",
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "RCRover",
	Attach = true,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "Selection_Rover",
	Scale = 250,
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "RCTransport",
	Attach = true,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "Selection_Rover",
	Scale = 250,
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "SubsurfaceHeater",
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Mine_Area",
	ScaleMember = "GetSelectionRadiusScale",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "TriboelectricScrubber",
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_TriboelectricScrubber_Area",
	ScaleMember = "GetSelectionRadiusScale",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "WaterExtractor",
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Mine_Area",
	ScaleMember = "GetSelectionRadiusScale",
	Spot = "Center",
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "Select",
	Actor = "Workshop",
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Building_Area",
	ScaleMember = "GetSelectionRadiusScale",
	Spot = "Center",
})

PlaceObj('ActionFXParticles', {
	Action = "ShowWorkRadius",
	Actor = "RCRover",
	Attach = true,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Selection_Mine_Area",
	ScaleMember = "GetSelectionRadiusScale",
})

PlaceObj('ActionFXParticles', {
	Action = "Spawn",
	Actor = "Battery_WaterFuelCell",
	Attach = true,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndAction', "Battery",
			'EndMoment', "charge50",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndAction', "Spawn",
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Battery_0",
	Spot = "Light",
	SpotsPercent = 100,
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "Spawn",
	Actor = "ConstructionSite",
	DetailLevel = 60,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "ConstructionSite_Spawn",
	Scale = 120,
	Spot = "Center",
	Target = "Battery_WaterFuelCell",
})

PlaceObj('ActionFXParticles', {
	Action = "Spawn",
	Actor = "ConstructionSite",
	DetailLevel = 60,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "ConstructionSite_Spawn",
	Scale = 140,
	Spot = "Center",
	Target = "DroneHub",
})

PlaceObj('ActionFXParticles', {
	Action = "Spawn",
	Actor = "ConstructionSite",
	DetailLevel = 60,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "ConstructionSite_Spawn",
	Scale = 50,
	Target = "ElectricityGridElement",
})

PlaceObj('ActionFXParticles', {
	Action = "Spawn",
	Actor = "ConstructionSite",
	DetailLevel = 60,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "ConstructionSite_Spawn",
	Scale = 80,
	Target = "LifeSupportGridElement",
})

PlaceObj('ActionFXParticles', {
	Action = "Spawn",
	Actor = "ConstructionSite",
	DetailLevel = 60,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "ConstructionSite_Spawn_02",
	Spot = "Center",
	Target = "MOXIE",
})

PlaceObj('ActionFXParticles', {
	Action = "Spawn",
	Actor = "ConstructionSite",
	DetailLevel = 60,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "ConstructionSite_Spawn_02",
	Spot = "Center",
	Target = "MetalsExtractor",
})

PlaceObj('ActionFXParticles', {
	Action = "Spawn",
	Actor = "ConstructionSite",
	DetailLevel = 60,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "ConstructionSite_Spawn",
	Scale = 120,
	Spot = "Center",
	Target = "MoistureVaporator",
})

PlaceObj('ActionFXParticles', {
	Action = "Spawn",
	Actor = "ConstructionSite",
	DetailLevel = 60,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "ConstructionSite_Spawn",
	Target = "RechargeStation",
})

PlaceObj('ActionFXParticles', {
	Action = "Spawn",
	Actor = "ConstructionSite",
	DetailLevel = 60,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "ConstructionSite_Spawn_02",
	Target = "RegolithExtractor",
})

PlaceObj('ActionFXParticles', {
	Action = "Spawn",
	Actor = "ConstructionSite",
	DetailLevel = 60,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "ConstructionSite_Spawn",
	Scale = 120,
	Target = "SensorTower",
})

PlaceObj('ActionFXParticles', {
	Action = "Spawn",
	Actor = "ConstructionSite",
	DetailLevel = 80,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "ConstructionSite_Spawn",
	Scale = 180,
	Target = "SolarArray",
})

PlaceObj('ActionFXParticles', {
	Action = "Spawn",
	Actor = "ConstructionSite",
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "ConstructionSite_Spawn",
	Scale = 200,
	Target = "SolarArray",
})

PlaceObj('ActionFXParticles', {
	Action = "Spawn",
	Actor = "ConstructionSite",
	DetailLevel = 60,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "ConstructionSite_Spawn",
	Target = "SolarPanel",
})

PlaceObj('ActionFXParticles', {
	Action = "Spawn",
	Actor = "ConstructionSite",
	DetailLevel = 60,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "ConstructionSite_Spawn",
	Scale = 180,
	Target = "SolarPanelBig",
})

PlaceObj('ActionFXParticles', {
	Action = "Spawn",
	Actor = "ConstructionSite",
	DetailLevel = 60,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "ConstructionSite_Spawn",
	Target = "StirlingGenerator",
})

PlaceObj('ActionFXParticles', {
	Action = "Spawn",
	Actor = "ConstructionSite",
	DetailLevel = 60,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "ConstructionSite_Spawn_02",
	Target = "StorageDepot",
})

PlaceObj('ActionFXParticles', {
	Action = "Spawn",
	Actor = "ConstructionSite",
	DetailLevel = 60,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "ConstructionSite_Spawn_02",
	Scale = 140,
	Target = "WaterExtractor",
})

PlaceObj('ActionFXParticles', {
	Action = "Spawn",
	Actor = "ConstructionSite",
	DetailLevel = 60,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "ConstructionSite_Spawn",
	Scale = 120,
	Spot = "Center",
	Target = "WaterTank",
})

PlaceObj('ActionFXParticles', {
	Action = "Spawn",
	Actor = "ConstructionSiteWithHeightSurfaces",
	Attach = true,
	DetailLevel = 60,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Orientation = "SpotX",
	Particles = "ConstructionSite_Spawn_Dome_02",
	Target = "DomeMedium",
})

PlaceObj('ActionFXParticles', {
	Action = "Spawn",
	Actor = "ConstructionSiteWithHeightSurfaces",
	DetailLevel = 60,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "ConstructionSite_Spawn_Dome",
	Scale = 200,
	Target = "DomeMega",
})

PlaceObj('ActionFXParticles', {
	Action = "Spawn",
	Actor = "ConstructionSiteWithHeightSurfaces",
	DetailLevel = 60,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "ConstructionSite_Spawn_Dome",
	Target = "DomeOval",
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "BlackCubeStockpile",
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "end",
	Particles = "BlackCube_End",
	ScaleMember = "GetSelectionRadiusScale",
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "FusionReactor",
	Attach = true,
	DetailLevel = 60,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	OffsetDir = "",
	Orientation = "SpotZ",
	OrientationAxis = 3,
	Particles = "FusionReactor_Electricity",
	Spot = "Sparks",
	SpotsPercent = 100,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "FusionReactor",
	Attach = true,
	DetailLevel = 60,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Flags = "LockedOrientation",
	Moment = "start",
	Particles = "FusionReactor_Electricity_Center",
	Spot = "Spark",
	SpotsPercent = 100,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "MetalsExtractor",
	Attach = true,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "Mine_Metal_Lights",
	Spot = "Lightinside",
	SpotsPercent = 100,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "RechargeStation",
	Attach = true,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	OrientationAxis = -1,
	Particles = "RechargeStation_Sign",
	Source = "Target",
	Spot = "Sign",
	SpotsPercent = 100,
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "WaterExtractor",
	Attach = true,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	OrientationAxis = -3,
	Particles = "WaterExtractor_Bottom",
	Spot = "Bottom",
	SpotsPercent = 100,
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "WaterExtractor",
	Attach = true,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	OrientationAxis = -3,
	Particles = "WaterExtractor_Lazer",
	Spot = "Lazer2",
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "WaterExtractor",
	Attach = true,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	OrientationAxis = -3,
	Particles = "WaterExtractor_Lazer_Base",
	Spot = "Lazer2",
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "WaterExtractor",
	Attach = true,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Particles = "WaterExtractor_Sparks",
	Spot = "Spark",
	SpotsPercent = 100,
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "Working",
	Actor = "WaterReclamationSystem",
	Attach = true,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Offset = point(0, 0, -100),
	Particles = "WaterReclamationSystem_Fall_DarkGreen",
	Spot = "Water8",
	SpotsPercent = 100,
	Target = "ignore",
})

