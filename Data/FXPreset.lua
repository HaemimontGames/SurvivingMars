-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('ActionFXParticles', {
	Action = "Accelerate",
	Actor = "JumperShuttle",
	Attach = true,
	DetailLevel = 60,
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

PlaceObj('ActionFXSound', {
	Action = "ActionButtonClick",
	Moment = "start",
	Sound = "UI ButtonSaveNextBackClickIn",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "ActionButtonHover",
	Moment = "start",
	Sound = "UI ButtonHover",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "ActivateBlackCubes",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 2000,
	FadeOut = 2000,
	Moment = "start",
	Sound = "Mystery CubeSingle PulseLoop",
	Source = "ActionPos",
	handle = 254720159,
})

PlaceObj('ActionFXSound', {
	Action = "AirExplosion",
	Actor = "BombardRocket",
	Moment = "start",
	Sound = "Mystery Bombardment ExplodeAir",
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

PlaceObj('ActionFXSound', {
	Action = "AlienDiggerDigging",
	Actor = "AlienDigger",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1000,
	FadeOut = 500,
	Moment = "start",
	Sound = "Mystery AlienDigger Dig",
	handle = 2123763281,
})

PlaceObj('ActionFXSound', {
	Action = "AlienDiggerDigging",
	Actor = "AlienDigger",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 2000,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Mystery AlienDigger DigDebris",
	handle = 641111611,
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

PlaceObj('ActionFXSound', {
	Action = "AlienDiggerLanding",
	Actor = "AlienDigger",
	Moment = "hit-ground",
	Sound = "Mystery AlienDigger LandImpact",
})

PlaceObj('ActionFXSound', {
	Action = "AlienDiggerLanding",
	Actor = "AlienDigger",
	Moment = "hit-ground",
	Sound = "Mystery AlienDigger LandImpactDebris",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "AlienDiggerLanding",
	Actor = "AlienDigger",
	Moment = "hit-ground",
	Sound = "Mystery AlienDigger LandImpactPost",
	Source = "ActionPos",
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

PlaceObj('ActionFXLight', {
	Action = "AlienDiggerLanding",
	Actor = "AlienDigger",
	Attach = true,
	Color = -21191,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1000,
	FadeOut = 1000,
	FadeOutColor = -21191,
	GameTimeAnimated = true,
	Intensity = 180,
	Moment = "pre-hit-ground",
	Radius = 4000,
	StartColor = -21191,
	Target = "ignore",
	Time = 2000,
	handle = 1000801603,
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

PlaceObj('ActionFXLight', {
	Action = "AlienDiggerLanding",
	Actor = "AlienDiggerBig",
	Attach = true,
	Color = -21191,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1000,
	FadeOut = 1000,
	FadeOutColor = -21191,
	GameTimeAnimated = true,
	Intensity = 200,
	Moment = "pre-hit-ground",
	Radius = 10000,
	StartColor = -21191,
	Target = "ignore",
	Time = 2000,
	handle = 702392828,
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

PlaceObj('ActionFXSound', {
	Action = "AlienDiggerLanding",
	Actor = "AlienDigger",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 500,
	FadeOut = 500,
	Moment = "start",
	Sound = "Mystery AlienDigger Ambience",
	handle = 177466442,
})

PlaceObj('ActionFXSound', {
	Action = "AlienDiggerLanding",
	Actor = "AlienDigger",
	Moment = "start",
	Sound = "Mystery AlienDigger Land",
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

PlaceObj('ActionFXSound', {
	Action = "AlienDiggerTakeoff",
	Actor = "AlienDigger",
	Moment = "start",
	Sound = "Mystery AlienDigger Takeoff",
})

PlaceObj('ActionFXLight', {
	Action = "AlienDiggerTakeoff",
	Actor = "AlienDigger",
	Attach = true,
	Color = -21191,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1000,
	FadeOut = 1000,
	FadeOutColor = -21191,
	GameTimeAnimated = true,
	Intensity = 180,
	Moment = "start",
	Radius = 4000,
	StartColor = -21191,
	Target = "ignore",
	Time = 3000,
	handle = 1225925578,
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

PlaceObj('ActionFXLight', {
	Action = "AlienDiggerTakeoff",
	Actor = "AlienDiggerBig",
	Attach = true,
	Color = -21191,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1000,
	FadeOut = 1000,
	FadeOutColor = -21191,
	GameTimeAnimated = true,
	Intensity = 200,
	Moment = "start",
	Radius = 10000,
	StartColor = -21191,
	Target = "ignore",
	Time = 3000,
	handle = 1483904626,
})

PlaceObj('ActionFXSound', {
	Action = "AntennaRaise",
	Actor = "OmegaTelescope",
	Moment = "end",
	Sound = "Object OmegaTelescope LiftStop",
})

PlaceObj('ActionFXSound', {
	Action = "AntennaRaise",
	Actor = "OmegaTelescope",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1000,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Object OmegaTelescope LiftLoop",
	handle = 116133053,
})

PlaceObj('ActionFXSound', {
	Action = "AntennaRaise",
	Actor = "OmegaTelescope",
	Moment = "start",
	Sound = "Object OmegaTelescope LiftStart",
})

PlaceObj('ActionFXSound', {
	Action = "AntennaRaiseInterrupted",
	Actor = "OmegaTelescope",
	Moment = "start",
	Sound = "Object OmegaTelescope LiftStop",
})

PlaceObj('ActionFXSound', {
	Action = "AreasOfEffectButtonClick",
	Moment = "start",
	Sound = "UI ButtonGeneralClickIn",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "ArtificialSunCharge",
	Actor = "ArtificialSun",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 3000,
	FadeOut = 3000,
	Moment = "start",
	Sound = "Object ArtificialSun Charge",
	Target = "ignore",
	handle = 1694733844,
})

PlaceObj('ActionFXLight', {
	Action = "ArtificialSunCharge",
	Attach = true,
	Color = -22784,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1000,
	FadeOut = 1000,
	FadeOutColor = -39424,
	FadeOutIntensity = 98,
	Intensity = 120,
	Moment = "start",
	Offset = point(0, 0, 1250),
	Radius = 50000,
	StartColor = -22784,
	StartIntensity = 199,
	Target = "ignore",
	handle = 1654828722,
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

PlaceObj('ActionFXSound', {
	Action = "ArtificialSunProduce",
	Actor = "ArtificialSun",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 3000,
	FadeOut = 3000,
	Moment = "start",
	Sound = "Object ArtificialSun Produce",
	Target = "ignore",
	handle = 481140398,
})

PlaceObj('ActionFXSound', {
	Action = "ArtificialSunProduce",
	Actor = "ArtificialSun",
	Moment = "start",
	Sound = "Object ArtificialSun ProduceWave",
	Target = "ignore",
})

PlaceObj('ActionFXLight', {
	Action = "ArtificialSunProduce",
	Attach = true,
	Color = -22784,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1000,
	FadeOut = 1000,
	FadeOutColor = -39424,
	FadeOutIntensity = 98,
	Intensity = 200,
	Moment = "start",
	Offset = point(0, 0, 1250),
	Radius = 50000,
	StartColor = -22784,
	StartIntensity = 199,
	Target = "ignore",
	handle = 903760782,
})

PlaceObj('ActionFXObject', {
	Action = "ArtificialSunProduce",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "ArtificialSunSphere",
	Offset = point(0, 0, -400),
	Scale = 150,
	Target = "ignore",
	handle = 391608818,
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

PlaceObj('ActionFXSound', {
	Action = "BioroboticsArmMotion",
	Actor = "BioroboticsWorkshopArm",
	Moment = "start",
	Sound = "Building WorkshopBiorobotics Arm",
	Source = "ActionPos",
})

PlaceObj('ActionFXDecal', {
	Action = "BlackCubeDemolishBuilding",
	Color = -14277082,
	Decal1 = "DecRocketSplatter",
	FadeOut = 100,
	Moment = "hit",
	Scale = 40,
	ScaleVariation = 10,
	Target = "ignore",
	Time = 1200000,
})

PlaceObj('ActionFXParticles', {
	Action = "BlackCubeDemolishBuilding",
	Attach = true,
	DetailLevel = 40,
	Moment = "hit",
	Particles = "BlackCubeDemolishBuilding",
	Scale = 120,
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "BlackCubesRotate",
	Actor = "BlackCubeStockpile",
	Moment = "start",
	Sound = "Mystery CubeSingle Rotate",
})

PlaceObj('ActionFXSound', {
	Action = "Bombard",
	Actor = "BombardRocket",
	Moment = "start",
	Sound = "Mystery Bombardment Start",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "AdvancedStirlingGenerator",
	Moment = "start",
	Sound = "Object StirlingGeneratorAdv Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "Apartments",
	Moment = "start",
	Sound = "Building Apartments Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "Arcology",
	Moment = "start",
	Sound = "Building Arcology Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "ArtWorkshop",
	Moment = "start",
	Sound = "Building WorkshopArt Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "ArtificialSun",
	Moment = "start",
	Sound = "Object ArtificialSun Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "AtomicBattery",
	Moment = "start",
	Sound = "Object AtomicBattery Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "AttackRover",
	Moment = "start",
	Sound = "Unit RoverAttack Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "AutomaticMetalsExtractor",
	Moment = "start",
	Sound = "Object MetalExtractorAuto Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "Battery_WaterFuelCell",
	Moment = "start",
	Sound = "Object PowerAccumulator Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "BioroboticsWorkshop",
	Moment = "start",
	Sound = "Building WorkshopBiorobotics Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "CableSwitch",
	Moment = "start",
	Sound = "Object PowerSwitch Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "Casino Complex",
	Moment = "start",
	Sound = "Building Casino Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "CloningVats",
	Moment = "start",
	Sound = "Building CloningVats Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "ConcretePlant",
	Moment = "start",
	Sound = "Object ConcretePlant Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "CorporateOffice",
	Moment = "start",
	Sound = "Building CorporateOffice Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "DefenceTower",
	Moment = "start",
	Sound = "Object DefenceTower Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "Diner",
	Moment = "start",
	Sound = "Building Diner Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "DomeBasic",
	Moment = "start",
	Sound = "Building Dome Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "DomeDiamond",
	Moment = "start",
	Sound = "Building Dome Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "DomeGeoscape",
	Moment = "start",
	Sound = "Building Dome Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "DomeHexa",
	Moment = "start",
	Sound = "Building Dome Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "DomeMedium",
	Moment = "start",
	Sound = "Building Dome Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "DomeMega",
	Moment = "start",
	Sound = "Building Dome Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "DomeMegaTrigon",
	Moment = "start",
	Sound = "Building Dome Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "DomeMicro",
	Moment = "start",
	Sound = "Building Dome Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "DomeOval",
	Moment = "start",
	Sound = "Building Dome Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "DomeStar",
	Moment = "start",
	Sound = "Building Dome Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "DomeTrigon",
	Moment = "start",
	Sound = "Building Dome Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "Drone",
	Moment = "start",
	Sound = "Unit DroneLand Fail",
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

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "DroneFactory",
	Moment = "start",
	Sound = "Object Workshop Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "DroneHub",
	Moment = "start",
	Sound = "Object DroneHUB Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "ElectronicsFactory",
	Moment = "start",
	Sound = "Building ElectronicsFactory Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "ElectronicsFactory_Small",
	Moment = "start",
	Sound = "Building ElectronicsFactorySmall Fail",
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "ExplorerRover",
	Moment = "start",
	Sound = "Unit RoverExplorer Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "FXRocket",
	Moment = "start",
	Sound = "Unit Rocket Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "Farm",
	Moment = "start",
	Sound = "Building Farm Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "FlyingDrone",
	Moment = "start",
	Sound = "Unit DroneFly Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "FuelFactory",
	Moment = "start",
	Sound = "Object FuelRefinery Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "FungalFarm",
	Moment = "start",
	Sound = "Object FungalFarm Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "FusionReactor",
	Moment = "start",
	Sound = "Object FusionReactor Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "GameDeveloper",
	Moment = "start",
	Sound = "Building GameDeveloper Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "GiantLaser",
	Moment = "start",
	Sound = "Object GiantLaser Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "HangingGardens",
	Moment = "start",
	Sound = "Building HangingGardens Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "HydroponicFarm",
	Moment = "start",
	Sound = "Building HydroponicFarm Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "Infirmary",
	Moment = "start",
	Sound = "Building Infirmary Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "JumperShuttle",
	Moment = "start",
	Sound = "Unit ShuttleJumper Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "JumperShuttleHub",
	Moment = "start",
	Sound = "Object ShuttleHUBJumper Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "LandingPad",
	Moment = "start",
	Sound = "Object LandingPad Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "LargeWaterTank",
	Moment = "start",
	Sound = "Object WaterTankLarge Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "LightTrap",
	Moment = "start",
	Sound = "Object LightTrap Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "LivingQuarters",
	Moment = "start",
	Sound = "Building LivingQuarters Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "LowGLab",
	Moment = "start",
	Sound = "Object Low-GLab Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "MDSLaser",
	Moment = "start",
	Sound = "Object MDSLaser Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "MOXIE",
	Moment = "start",
	Sound = "Object MOXIE Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "MachinePartsFactory",
	Moment = "start",
	Sound = "Building MachinepartsFactory Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "MachinePartsFactory_Small",
	Moment = "start",
	Sound = "Building MachinepartsFactorySmall Fail",
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "MartianUniversity",
	Moment = "start",
	Sound = "Building MartianUni Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "MedicalCenter",
	Moment = "start",
	Sound = "Building MedicalCenter Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "MegaMall",
	Moment = "start",
	Sound = "Building Megamall Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "MetalsExtractor",
	Moment = "start",
	Sound = "Object MetalExtractor Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "MetalsRefinery",
	Moment = "start",
	Sound = "Object MetalsRefinery Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "MoholeMine",
	Moment = "start",
	Sound = "Object MoholeMine Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "MoistureVaporator",
	Moment = "start",
	Sound = "Object MoistureVaporator Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "NetworkNode",
	Moment = "start",
	Sound = "Building NetworkNode Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "Nursery",
	Moment = "start",
	Sound = "Building Nurcery Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "OmegaTelescope",
	Moment = "start",
	Sound = "Object OmegaTelescope Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "OpenAirGym",
	Moment = "start",
	Sound = "Building OpenAirGym Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "OxygenTank",
	Moment = "start",
	Sound = "Object AirStorage Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "Passage",
	Moment = "start",
	Sound = "Object Passage Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "PassageRamp",
	Moment = "start",
	Sound = "Object PassageRamp Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "Playground",
	Moment = "start",
	Sound = "Building Playground Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "PolymerPlant",
	Moment = "start",
	Sound = "Object PolymerPlant Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "PowerDecoy",
	Moment = "start",
	Sound = "Object PowerDecoy Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "PowerSwitch",
	Moment = "start",
	Sound = "Object PowerSwitch Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "PreciousMetalsExtractor",
	Moment = "start",
	Sound = "Object PreciousExtractor Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "ProjectMorpheus",
	Moment = "start",
	Sound = "Object ProjectMorpheus Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "RCConstructor",
	Moment = "start",
	Sound = "Unit RoverConstructor Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "RCDriller",
	Moment = "start",
	Sound = "Unit RoverDriller Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "RCHarvester",
	Moment = "start",
	Sound = "Unit RoverHarvester Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "RCRover",
	Moment = "start",
	Sound = "Unit Rover Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "RCSensor",
	Moment = "start",
	Sound = "Unit RoverSensor Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "RCSolar",
	Moment = "start",
	Sound = "Unit RoverSolar Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "RCTransport",
	Moment = "start",
	Sound = "Unit TransportRC Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "RareMetalsRefinery",
	Moment = "start",
	Sound = "Object MetalsRefineryRare Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "RechargeStation",
	Moment = "start",
	Sound = "Object RechargeStation Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "RegolithExtractor",
	Moment = "start",
	Sound = "Object RegolithExtractor Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "ResearchLab",
	Moment = "start",
	Sound = "Building ResearchLab Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "Sanatorium",
	Moment = "start",
	Sound = "Building Sanatorium Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "School",
	Moment = "start",
	Sound = "Building School Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "ScienceInstitute",
	Moment = "start",
	Sound = "Building ScienceInstitute Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "SecurityStation",
	Moment = "start",
	Sound = "Building SecurityStation Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "SensorTower",
	Moment = "start",
	Sound = "Object SensorTower Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "ShopsElectronics",
	Moment = "start",
	Sound = "Building ElectronicsStore Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "ShopsFood",
	Moment = "start",
	Sound = "Building Grocery Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "ShopsJewelry",
	Moment = "start",
	Sound = "Building Jewelry Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "Shuttle",
	Moment = "start",
	Sound = "Unit Shuttle Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "ShuttleHub",
	Moment = "start",
	Sound = "Object ShuttleHUB Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "SmartHome",
	Moment = "start",
	Sound = "Building SmartHome Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "SmartHome_Small",
	Moment = "start",
	Sound = "Building SmartHome Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "SmartHomes",
	Moment = "start",
	Sound = "Building SmartHome Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "SolarArray",
	Moment = "start",
	Sound = "Object SolarArray Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "SolarPanel",
	Moment = "start",
	Sound = "Object SolarPanel Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "SolarPanelBig",
	Moment = "start",
	Sound = "Object SolarPanelBig Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "SpaceElevator",
	Moment = "start",
	Sound = "Object SpaceElevator Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "Spacebar",
	Moment = "start",
	Sound = "Building Spacebar Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "Spacebar_Small",
	Moment = "start",
	Sound = "Building Spacebar Fail",
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "Spaceport",
	Moment = "start",
	Sound = "Object Spaceport Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "StirlingGenerator",
	Moment = "start",
	Sound = "Object StirlingGenerator Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "SubsurfaceHeater",
	Moment = "start",
	Sound = "Object SubsurfaceHeater Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "TaiChiGarden",
	Moment = "start",
	Sound = "Building TaiChiGarden Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "Temple",
	Moment = "start",
	Sound = "Building TempleSpire Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "TheExcavator",
	Moment = "start",
	Sound = "Object Excavator Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "TriboelectricScrubber",
	Moment = "start",
	Sound = "Object TriboelectricScrubber Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "VRWorkshop",
	Moment = "start",
	Sound = "Building WorkshopVR Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "WasteRockProcessor",
	Moment = "start",
	Sound = "Object WasteRockProcessor Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "WaterExtractor",
	Moment = "start",
	Sound = "Object WaterExtractor Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "WaterReclamation",
	Moment = "start",
	Sound = "Building WaterReclamation Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "WaterTank",
	Moment = "start",
	Sound = "Object WaterTower Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "WaterTower",
	Moment = "start",
	Sound = "Object WaterTower Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "WindTurbine",
	Moment = "start",
	Sound = "Object WindTurbine Fail",
})

PlaceObj('ActionFXSound', {
	Action = "BuildMenuButtonClick",
	Moment = "start",
	Sound = "UI ButtonGeneralClickIn",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "BuildMenuIn",
	Moment = "start",
	Sound = "UI MenuBuildFadeIN",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "BuildMenuOut",
	Moment = "start",
	Sound = "UI MenuBuildFadeOUT",
	Source = "UI",
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

PlaceObj('ActionFXSound', {
	Action = "BuildingModeChanged",
	Moment = "start",
	Sound = "UI ModeSwitch",
	Source = "UI",
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

PlaceObj('ActionFXSound', {
	Action = "BurstOut",
	Actor = "Geyser_01",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 1500,
	Moment = "start",
	Sound = "Ambience Geyser BurstLoop",
	Target = "PrefabFeatureMarker",
	handle = 52387592,
})

PlaceObj('ActionFXSound', {
	Action = "BurstOut",
	Actor = "Geyser_01",
	Moment = "start",
	Sound = "Ambience Geyser BurstStart",
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

PlaceObj('ActionFXSound', {
	Action = "BurstOut",
	Actor = "Geyser_02",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 1500,
	Moment = "start",
	Sound = "Ambience Geyser BurstLoop",
	Target = "PrefabFeatureMarker",
	handle = 916665293,
})

PlaceObj('ActionFXSound', {
	Action = "BurstOut",
	Actor = "Geyser_02",
	Moment = "start",
	Sound = "Ambience Geyser BurstStart",
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

PlaceObj('ActionFXSound', {
	Action = "BurstOut",
	Actor = "Geyser_03",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 1500,
	Moment = "start",
	Sound = "Ambience Geyser BurstLoop",
	Target = "PrefabFeatureMarker",
	handle = 1650400563,
})

PlaceObj('ActionFXSound', {
	Action = "BurstOut",
	Actor = "Geyser_03",
	Moment = "start",
	Sound = "Ambience Geyser BurstStart",
})

PlaceObj('ActionFXSound', {
	Action = "BuySupplyRocketClick",
	Moment = "start",
	Sound = "UI RocketBuy",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "CableConstructionSuccess",
	Moment = "start",
	Sound = "UI PlacePowerCables",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "CableSwitched",
	Actor = "CableSwitch",
	Moment = "off",
	Sound = "Object PowerSwitch SwitchOFF",
})

PlaceObj('ActionFXSound', {
	Action = "CableSwitched",
	Actor = "CableSwitch",
	Moment = "on",
	Sound = "Object PowerSwitch SwitchON",
})

PlaceObj('ActionFXSound', {
	Action = "CancelConstruction",
	Moment = "start",
	Sound = "UI BuildCancel",
	Source = "UI",
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

PlaceObj('ActionFXSound', {
	Action = "Capture",
	Actor = "MirrorSphere",
	Moment = "start",
	Sound = "Object PowerDecoy Capture",
	Source = "ActionPos",
	Target = "PowerDecoy",
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

PlaceObj('ActionFXSound', {
	Action = "Captured",
	Actor = "MirrorSphere",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1000,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Object PowerDecoy LoopCaptured",
	Source = "Target",
	Target = "PowerDecoy",
	handle = 1161789568,
})

PlaceObj('ActionFXSound', {
	Action = "ChangeDirection",
	Actor = "TheExcavator",
	Delay = 500,
	Moment = "start",
	Sound = "Object 0 Pressure",
})

PlaceObj('ActionFXSound', {
	Action = "ChangeDirection",
	Actor = "TheExcavator",
	Delay = 2500,
	Moment = "start",
	Sound = "Object 0 Pressure",
})

PlaceObj('ActionFXSound', {
	Action = "ChangeDirection",
	Actor = "TheExcavator",
	Delay = 3500,
	Moment = "start",
	Sound = "Object 0 Pressure",
})

PlaceObj('ActionFXSound', {
	Action = "ChangeDirection",
	Actor = "TheExcavator",
	Moment = "start",
	Sound = "Object Excavator LoopPeak",
})

PlaceObj('ActionFXSound', {
	Action = "ChangeDirection",
	Actor = "TheExcavator",
	FadeIn = 2000,
	FadeOut = 5000,
	Moment = "start",
	Sound = "Object Excavator Rotate",
	Time = 2000,
	handle = 1414496154,
})

PlaceObj('ActionFXSound', {
	Action = "ChargedClean",
	Actor = "TriboelectricScrubberSphere",
	Moment = "end",
	Sound = "Object TriboelectricScrubber Close",
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
	ScaleMember = "GetSelectionRadiusScale",
	Spot = "Ball",
	handle = 155984150,
})

PlaceObj('ActionFXSound', {
	Action = "ChargedClean",
	Actor = "TriboelectricScrubberSphere",
	Moment = "start",
	Sound = "Object TriboelectricScrubber Clean",
})

PlaceObj('ActionFXSound', {
	Action = "ChargedClean",
	Actor = "TriboelectricScrubberSphere",
	Moment = "start",
	Sound = "Object TriboelectricScrubber Open",
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

PlaceObj('ActionFXSound', {
	Action = "Clean",
	Actor = "Drone",
	Moment = "end",
	Sound = "Unit Drone CleanStop",
})

PlaceObj('ActionFXSound', {
	Action = "Clean",
	Actor = "RCRover",
	Moment = "end",
	Sound = "Unit Rover CleanStop",
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

PlaceObj('ActionFXSound', {
	Action = "Clean",
	Actor = "Drone",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 300,
	FadeOut = 500,
	Moment = "start",
	Sound = "Unit Drone CleanLoop",
	handle = 1920198486,
})

PlaceObj('ActionFXSound', {
	Action = "Clean",
	Actor = "Drone",
	Moment = "start",
	Sound = "Unit Drone CleanStart",
})

PlaceObj('ActionFXSound', {
	Action = "Clean",
	Actor = "RCRover",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 300,
	FadeOut = 500,
	Moment = "start",
	Sound = "Unit Rover CleanLoop",
	handle = 514450001,
})

PlaceObj('ActionFXSound', {
	Action = "Clean",
	Actor = "RCRover",
	Moment = "start",
	Sound = "Unit Rover CleanStart",
})

PlaceObj('ActionFXSound', {
	Action = "Clean",
	Moment = "start",
	Sound = "UI Clean",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "ClickInteract",
	Actor = "Drone",
	Moment = "start",
	Sound = "UI SendVehicleCultivate",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "ClickInteract",
	Actor = "FlyingDrone",
	Moment = "start",
	Sound = "UI SendVehicleCultivate",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "ClickInteract",
	Actor = "RCRover",
	Moment = "start",
	Sound = "UI SendVehicleCultivate",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "ClickInteract",
	Actor = "RCTransport",
	Moment = "start",
	Sound = "UI SendVehicleCultivate",
	Source = "UI",
})

PlaceObj('ActionFXColorization', {
	Action = "ClickInteract",
	Delay = 220,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndAction', "ClickInteract",
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	RealTime = true,
	Source = "Target",
	Time = 150,
	handle = 1632114727,
})

PlaceObj('ActionFXColorization', {
	Action = "ClickInteract",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndAction', "ClickInteract",
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	RealTime = true,
	Source = "Target",
	Time = 150,
	handle = 2034808583,
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

PlaceObj('ActionFXSound', {
	Action = "ClickMove",
	Actor = "Drone",
	Moment = "start",
	Sound = "UI SendVehicleClick",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "ClickMove",
	Actor = "ExplorerRover",
	Moment = "start",
	Sound = "UI SendVehicleClick",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "ClickMove",
	Actor = "FlyingDrone",
	Moment = "start",
	Sound = "UI SendVehicleClick",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "ClickMove",
	Actor = "RCConstructor",
	Moment = "start",
	Sound = "UI SendVehicleClick",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "ClickMove",
	Actor = "RCDriller",
	Moment = "start",
	Sound = "UI SendVehicleClick",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "ClickMove",
	Actor = "RCHarvester",
	Moment = "start",
	Sound = "UI SendVehicleClick",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "ClickMove",
	Actor = "RCRover",
	Moment = "start",
	Sound = "UI SendVehicleClick",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "ClickMove",
	Actor = "RCSensor",
	Moment = "start",
	Sound = "UI SendVehicleClick",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "ClickMove",
	Actor = "RCSolar",
	Moment = "start",
	Sound = "UI SendVehicleClick",
	Source = "UI",
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

PlaceObj('ActionFXSound', {
	Action = "ClickMove",
	Actor = "RCTransport",
	Moment = "start",
	Sound = "UI SendVehicleClick",
	Source = "UI",
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

PlaceObj('ActionFXSound', {
	Action = "Close",
	Actor = "RCDriller",
	Moment = "start",
	Sound = "Unit RoverDriller Close",
})

PlaceObj('ActionFXSound', {
	Action = "Close",
	Actor = "RoverChinaSolarPanel",
	Moment = "start",
	Sound = "Unit RoverSolar Close",
})

PlaceObj('ActionFXSound', {
	Action = "Close",
	Actor = "RoverEuropeAntena",
	Moment = "start",
	Sound = "Unit RoverSensor TowerOFF",
})

PlaceObj('ActionFXSound', {
	Action = "ColdWave",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeOut = 10000,
	Moment = "start",
	Sound = "Ambience Disaster ColdwaveCracks",
	Source = "Camera",
	handle = 1729118374,
})

PlaceObj('ActionFXSound', {
	Action = "ColdWave",
	Moment = "start",
	Sound = "Ambience Disaster ColdwaveWave",
	Source = "Camera",
	handle = 105846144,
})

PlaceObj('ActionFXSound', {
	Action = "ColdWave",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 10000,
	FadeOut = 10000,
	Moment = "start",
	Sound = "Ambience Disaster ColdwaveWind",
	Source = "Camera",
	handle = 1558581606,
})

PlaceObj('ActionFXSound', {
	Action = "ColdWave",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 10000,
	FadeOut = 10000,
	Moment = "start",
	Sound = "Ambience Wind Howl 4",
	Source = "Camera",
	handle = 910983145,
})

PlaceObj('ActionFXSound', {
	Action = "Construct",
	Actor = "Drone",
	Moment = "end",
	Sound = "Unit Drone BuildStop",
})

PlaceObj('ActionFXSound', {
	Action = "Construct",
	Actor = "ExplorerRover",
	Moment = "end",
	Sound = "Unit Rover BuildStop",
})

PlaceObj('ActionFXSound', {
	Action = "Construct",
	Actor = "RCConstructor",
	Moment = "end",
	Sound = "Unit RoverConstructor ConstructStop",
})

PlaceObj('ActionFXSound', {
	Action = "Construct",
	Actor = "RCDriller",
	Moment = "end",
	Sound = "Unit Rover BuildStop",
})

PlaceObj('ActionFXSound', {
	Action = "Construct",
	Actor = "RCHarvester",
	Moment = "end",
	Sound = "Unit Rover BuildStop",
})

PlaceObj('ActionFXSound', {
	Action = "Construct",
	Actor = "RCRover",
	Moment = "end",
	Sound = "Unit Rover BuildStop",
})

PlaceObj('ActionFXSound', {
	Action = "Construct",
	Actor = "RCSensor",
	Moment = "end",
	Sound = "Unit Rover BuildStop",
})

PlaceObj('ActionFXSound', {
	Action = "Construct",
	Actor = "RCSolar",
	Moment = "end",
	Sound = "Unit Rover BuildStop",
})

PlaceObj('ActionFXSound', {
	Action = "Construct",
	Actor = "RCTransport",
	Moment = "end",
	Sound = "Unit Rover BuildStop",
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

PlaceObj('ActionFXSound', {
	Action = "Construct",
	Actor = "Drone",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 300,
	FadeOut = 600,
	Moment = "start",
	Sound = "Unit Drone BuildLoop",
	handle = 1503180390,
})

PlaceObj('ActionFXSound', {
	Action = "Construct",
	Actor = "Drone",
	Moment = "start",
	Sound = "Unit Drone BuildStart",
})

PlaceObj('ActionFXSound', {
	Action = "Construct",
	Actor = "ExplorerRover",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 300,
	FadeOut = 600,
	Moment = "start",
	Sound = "Unit Rover BuildLoop",
	handle = 1089282843,
})

PlaceObj('ActionFXSound', {
	Action = "Construct",
	Actor = "ExplorerRover",
	Moment = "start",
	Sound = "Unit Rover BuildStart",
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

PlaceObj('ActionFXSound', {
	Action = "Construct",
	Actor = "RCConstructor",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Unit RoverConstructor ConstructLoop",
	handle = 151538234,
})

PlaceObj('ActionFXSound', {
	Action = "Construct",
	Actor = "RCConstructor",
	Moment = "start",
	Sound = "Unit RoverConstructor ConstructStart",
})

PlaceObj('ActionFXSound', {
	Action = "Construct",
	Actor = "RCDriller",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 300,
	FadeOut = 600,
	Moment = "start",
	Sound = "Unit Rover BuildLoop",
	handle = 128084400,
})

PlaceObj('ActionFXSound', {
	Action = "Construct",
	Actor = "RCDriller",
	Moment = "start",
	Sound = "Unit Rover BuildStart",
})

PlaceObj('ActionFXSound', {
	Action = "Construct",
	Actor = "RCHarvester",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 300,
	FadeOut = 600,
	Moment = "start",
	Sound = "Unit Rover BuildLoop",
	handle = 2091280512,
})

PlaceObj('ActionFXSound', {
	Action = "Construct",
	Actor = "RCHarvester",
	Moment = "start",
	Sound = "Unit Rover BuildStart",
})

PlaceObj('ActionFXSound', {
	Action = "Construct",
	Actor = "RCRover",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 300,
	FadeOut = 600,
	Moment = "start",
	Sound = "Unit Rover BuildLoop",
	handle = 1626787,
})

PlaceObj('ActionFXSound', {
	Action = "Construct",
	Actor = "RCRover",
	Moment = "start",
	Sound = "Unit Rover BuildStart",
})

PlaceObj('ActionFXSound', {
	Action = "Construct",
	Actor = "RCSensor",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 300,
	FadeOut = 600,
	Moment = "start",
	Sound = "Unit Rover BuildLoop",
	handle = 1738309836,
})

PlaceObj('ActionFXSound', {
	Action = "Construct",
	Actor = "RCSensor",
	Moment = "start",
	Sound = "Unit Rover BuildStart",
})

PlaceObj('ActionFXSound', {
	Action = "Construct",
	Actor = "RCSolar",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 300,
	FadeOut = 600,
	Moment = "start",
	Sound = "Unit Rover BuildLoop",
	handle = 1429028878,
})

PlaceObj('ActionFXSound', {
	Action = "Construct",
	Actor = "RCSolar",
	Moment = "start",
	Sound = "Unit Rover BuildStart",
})

PlaceObj('ActionFXSound', {
	Action = "Construct",
	Actor = "RCTransport",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 300,
	FadeOut = 600,
	Moment = "start",
	Sound = "Unit Rover BuildLoop",
	handle = 131654948,
})

PlaceObj('ActionFXSound', {
	Action = "Construct",
	Actor = "RCTransport",
	Moment = "start",
	Sound = "Unit Rover BuildStart",
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

PlaceObj('ActionFXSound', {
	Action = "ConstructingDrones",
	Actor = "DroneFactory",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 300,
	FadeOut = 2000,
	Moment = "start",
	Sound = "Object Workshop ProduceDrone",
	Time = 2000,
	handle = 964227760,
})

PlaceObj('ActionFXSound', {
	Action = "ConstructionCursor",
	Actor = "CursorSupply",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 300,
	FadeOut = 300,
	Moment = "start",
	Sound = "UI OrbitalProbeScan",
	Source = "UI",
	Target = "OrbitalProbe",
	handle = 51093019,
})

PlaceObj('ActionFXSound', {
	Action = "ConstructionCursor",
	Actor = "CursorSupply",
	FadeIn = 200,
	Moment = "start",
	Sound = "UI OrbitalProbeScanStart",
	Source = "UI",
	Target = "OrbitalProbe",
})

PlaceObj('ActionFXSound', {
	Action = "ConstructionFail",
	Moment = "start",
	Sound = "UI Forbidden",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "ContainFireflies",
	Actor = "LightTrap",
	Moment = "end",
	Sound = "Object LightTrap Deactivate",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "ContainFireflies",
	Actor = "LightTrap",
	Moment = "start",
	Sound = "Object LightTrap Activate",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "ContainFireflies",
	Actor = "LightTrap",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 3000,
	FadeOut = 3000,
	Moment = "start",
	Sound = "Object LightTrap LoopFull",
	Target = "ignore",
	handle = 1549441170,
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

PlaceObj('ActionFXSound', {
	Action = "CrystalActive",
	Actor = "Crystal",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 3000,
	FadeOut = 3000,
	Moment = "start",
	Sound = "Mystery AlienCrystalsBig Ambience",
	Target = "ignore",
	handle = 2067760447,
})

PlaceObj('ActionFXSound', {
	Action = "CrystalActive",
	Actor = "Crystal",
	Moment = "start",
	Sound = "Mystery AlienCrystalsBig Appear",
	Target = "ignore",
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

PlaceObj('ActionFXSound', {
	Action = "CrystalActive",
	Actor = "CrystalsBig",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 3000,
	FadeOut = 3000,
	Moment = "start",
	Sound = "Mystery AlienCrystals Ambience",
	Target = "ignore",
	handle = 2129075561,
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

PlaceObj('ActionFXSound', {
	Action = "CrystalActive",
	Actor = "CrystalsSmall",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 3000,
	FadeOut = 3000,
	Moment = "start",
	Sound = "Mystery AlienCrystals Ambience",
	Target = "ignore",
	handle = 464251062,
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

PlaceObj('ActionFXSound', {
	Action = "CrystalCompose",
	Actor = "CrystalShard",
	Moment = "attach",
	Sound = "Mystery AlienCrystals ShardComposeAttach",
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

PlaceObj('ActionFXSound', {
	Action = "CrystalCompose",
	Actor = "Crystal",
	Moment = "attach1",
	Sound = "Mystery AlienCrystalsBig Attach",
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

PlaceObj('ActionFXSound', {
	Action = "CrystalCompose",
	Actor = "Crystal",
	Moment = "attach10",
	Sound = "Mystery AlienCrystalsBig Attach",
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

PlaceObj('ActionFXSound', {
	Action = "CrystalCompose",
	Actor = "Crystal",
	Moment = "attach11",
	Sound = "Mystery AlienCrystalsBig Attach",
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

PlaceObj('ActionFXSound', {
	Action = "CrystalCompose",
	Actor = "Crystal",
	Moment = "attach12",
	Sound = "Mystery AlienCrystalsBig Attach",
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

PlaceObj('ActionFXSound', {
	Action = "CrystalCompose",
	Actor = "Crystal",
	Moment = "attach2",
	Sound = "Mystery AlienCrystalsBig Attach",
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

PlaceObj('ActionFXSound', {
	Action = "CrystalCompose",
	Actor = "Crystal",
	Moment = "attach3",
	Sound = "Mystery AlienCrystalsBig Attach",
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

PlaceObj('ActionFXSound', {
	Action = "CrystalCompose",
	Actor = "Crystal",
	Moment = "attach4",
	Sound = "Mystery AlienCrystalsBig Attach",
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

PlaceObj('ActionFXSound', {
	Action = "CrystalCompose",
	Actor = "Crystal",
	Moment = "attach5",
	Sound = "Mystery AlienCrystalsBig Attach",
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

PlaceObj('ActionFXSound', {
	Action = "CrystalCompose",
	Actor = "Crystal",
	Moment = "attach6",
	Sound = "Mystery AlienCrystalsBig Attach",
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

PlaceObj('ActionFXSound', {
	Action = "CrystalCompose",
	Actor = "Crystal",
	Moment = "attach7",
	Sound = "Mystery AlienCrystalsBig Attach",
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

PlaceObj('ActionFXSound', {
	Action = "CrystalCompose",
	Actor = "Crystal",
	Moment = "attach8",
	Sound = "Mystery AlienCrystalsBig Attach",
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

PlaceObj('ActionFXSound', {
	Action = "CrystalCompose",
	Actor = "Crystal",
	Moment = "attach9",
	Sound = "Mystery AlienCrystalsBig Attach",
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

PlaceObj('ActionFXSound', {
	Action = "CrystalCompose",
	Actor = "Crystal",
	Moment = "go",
	Sound = "Mystery AlienCrystals ShardComposeEnd",
})

PlaceObj('ActionFXSound', {
	Action = "CrystalCompose",
	Actor = "Crystal",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndAction', "CrystalCompose",
			'EndMoment', "end",
		}),
	},
	FadeIn = 3000,
	FadeOut = 3000,
	Moment = "go",
	Sound = "Mystery AlienCrystalsBig Go",
	handle = 1891236101,
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

PlaceObj('ActionFXSound', {
	Action = "CrystalCompose",
	Actor = "Crystal",
	Moment = "start",
	Sound = "Mystery AlienCrystals ShardComposeStart",
})

PlaceObj('ActionFXSound', {
	Action = "CrystalCompose",
	Actor = "Crystal",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndAction', "CrystalCompose",
			'EndMoment', "go",
		}),
	},
	FadeIn = 3000,
	FadeOut = 7000,
	Moment = "start",
	Sound = "Mystery AlienCrystals ShardVortex",
	handle = 1040174874,
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

PlaceObj('ActionFXSound', {
	Action = "CrystalLiftoff",
	Actor = "CrystalShard",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndAction', "CrystalCompose",
			'EndMoment', "start",
		}),
	},
	FadeIn = 3000,
	FadeOut = 3000,
	Moment = "hover",
	Sound = "Mystery AlienCrystals ShardAmbience",
	handle = 585454294,
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

PlaceObj('ActionFXSound', {
	Action = "CrystalLiftoff",
	Actor = "CrystalShard",
	Delay = 2000,
	Moment = "start",
	Sound = "Mystery AlienCrystals ShardTakeoff",
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

PlaceObj('ActionFXSound', {
	Action = "CrystalPoweredUp",
	Actor = "CrystalsBig",
	Moment = "start",
	Sound = "Mystery AlienCrystals BeamBoost",
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "CrystalPoweredUp",
	Actor = "CrystalsBig",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 2000,
	FadeOut = 5000,
	Moment = "start",
	Sound = "Mystery AlienCrystals BeamLoop",
	Target = "ignore",
	handle = 1486725929,
})

PlaceObj('ActionFXSound', {
	Action = "CrystalPoweredUp",
	Actor = "CrystalsBig",
	Moment = "start",
	Sound = "Mystery AlienCrystals BeamStart",
	Source = "ActionPos",
	Target = "ignore",
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

PlaceObj('ActionFXSound', {
	Action = "CrystalPoweredUp",
	Actor = "CrystalsSmall",
	Moment = "start",
	Sound = "Mystery AlienCrystals BeamBoost",
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "CrystalPoweredUp",
	Actor = "CrystalsSmall",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 2000,
	FadeOut = 5000,
	Moment = "start",
	Sound = "Mystery AlienCrystals BeamLoop",
	Target = "ignore",
	handle = 1567693725,
})

PlaceObj('ActionFXSound', {
	Action = "CrystalPoweredUp",
	Actor = "CrystalsSmall",
	Moment = "start",
	Sound = "Mystery AlienCrystals BeamStart",
	Source = "ActionPos",
	Target = "ignore",
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

PlaceObj('ActionFXSound', {
	Action = "Deconstruct",
	Actor = "AlienDigger",
	Moment = "end",
	Sound = "Mystery AlienDigger Disappear",
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

PlaceObj('ActionFXSound', {
	Action = "Deconstruct",
	Actor = "Drone",
	AttachToObj = true,
	Moment = "end",
	Sound = "Unit Drone BuildStop",
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

PlaceObj('ActionFXSound', {
	Action = "Deconstruct",
	Actor = "AlienDigger",
	Moment = "start",
	Sound = "Mystery AlienDigger Destruction",
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

PlaceObj('ActionFXSound', {
	Action = "Deconstruct",
	Actor = "Drone",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 300,
	FadeOut = 500,
	Moment = "start",
	Sound = "Unit Drone BuildLoop",
	handle = 1436802453,
})

PlaceObj('ActionFXSound', {
	Action = "Deconstruct",
	Actor = "Drone",
	AttachToObj = true,
	Moment = "start",
	Sound = "Unit Drone BuildStart",
})

PlaceObj('ActionFXSound', {
	Action = "Demolish",
	Actor = "CableSwitch",
	Moment = "end",
	Sound = "Object PowerSwitch Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXParticles', {
	Action = "Demolish",
	Actor = "ElectricityGridElement",
	DetailLevel = 60,
	Flags = "OnGround",
	Moment = "end",
	Particles = "Construction_RemoveBuilding",
	Spot = "Center",
	Time = 500,
})

PlaceObj('ActionFXSound', {
	Action = "Demolish",
	Actor = "ElectricityGridElement",
	Moment = "end",
	Sound = "Object PowerCables Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Demolish",
	Actor = "FountainLarge",
	Moment = "end",
	Sound = "Object DecorationConcrete Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Demolish",
	Actor = "FountainSmall",
	Moment = "end",
	Sound = "Object DecorationWood Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Demolish",
	Actor = "GardenAlleys_Medium",
	Moment = "end",
	Sound = "Object DecorationWood Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Demolish",
	Actor = "GardenAlleys_Small",
	Moment = "end",
	Sound = "Object DecorationWood Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Demolish",
	Actor = "GardenNatural_Small",
	Moment = "end",
	Sound = "Object DecorationWood Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Demolish",
	Actor = "GardenStone",
	Moment = "end",
	Sound = "Object DecorationConcrete Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Demolish",
	Actor = "Lake",
	Moment = "end",
	Sound = "Object DecorationConcrete Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXParticles', {
	Action = "Demolish",
	Actor = "LifeSupportGridElement",
	DetailLevel = 60,
	Flags = "OnGround",
	Moment = "end",
	Particles = "Construction_RemoveBuilding",
	Spot = "Center",
	Time = 500,
})

PlaceObj('ActionFXSound', {
	Action = "Demolish",
	Actor = "LifeSupportGridElement",
	Moment = "end",
	Sound = "Object Pipes Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Demolish",
	Actor = "MechanizedDepotConcrete",
	Moment = "end",
	Sound = "Object StorageDepot Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Demolish",
	Actor = "MechanizedDepotElectronics",
	Moment = "end",
	Sound = "Object StorageDepot Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Demolish",
	Actor = "MechanizedDepotFood",
	Moment = "end",
	Sound = "Object StorageDepot Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Demolish",
	Actor = "MechanizedDepotFuel",
	Moment = "end",
	Sound = "Object StorageDepot Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Demolish",
	Actor = "MechanizedDepotMachineParts",
	Moment = "end",
	Sound = "Object StorageDepot Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Demolish",
	Actor = "MechanizedDepotMetals",
	Moment = "end",
	Sound = "Object StorageDepot Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Demolish",
	Actor = "MechanizedDepotMysteryResource",
	Moment = "end",
	Sound = "Object StorageDepot Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Demolish",
	Actor = "MechanizedDepotPolymers",
	Moment = "end",
	Sound = "Object StorageDepot Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Demolish",
	Actor = "MechanizedDepotRareMetals",
	Moment = "end",
	Sound = "Object StorageDepot Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Demolish",
	Actor = "PipeValve",
	Moment = "end",
	Sound = "Object PipeValve Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Demolish",
	Actor = "Statue",
	Moment = "end",
	Sound = "Object DecorationConcrete Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Demolish",
	Actor = "Statue",
	Moment = "end",
	Sound = "Object DecorationConcrete Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Demolish",
	Actor = "StorageConcrete",
	Moment = "end",
	Sound = "Object StorageDepot Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Demolish",
	Actor = "StorageElectronics",
	Moment = "end",
	Sound = "Object StorageDepot Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Demolish",
	Actor = "StorageFood",
	Moment = "end",
	Sound = "Object StorageDepot Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Demolish",
	Actor = "StorageFuel",
	Moment = "end",
	Sound = "Object StorageDepot Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Demolish",
	Actor = "StorageMachineParts",
	Moment = "end",
	Sound = "Object StorageDepot Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Demolish",
	Actor = "StorageMetals",
	Moment = "end",
	Sound = "Object StorageDepot Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Demolish",
	Actor = "StorageMysteryResource",
	Moment = "end",
	Sound = "Object StorageDepot Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Demolish",
	Actor = "StoragePolymers",
	Moment = "end",
	Sound = "Object StorageDepot Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Demolish",
	Actor = "StorageRareMetals",
	Moment = "end",
	Sound = "Object StorageDepot Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Demolish",
	Actor = "UniversalStorageDepot",
	Moment = "end",
	Sound = "Object StorageDepot Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "DemolishButton",
	Moment = "start",
	Sound = "UI SalvageButton",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "DemolishCancel",
	Moment = "start",
	Sound = "UI SalvageCancel",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "DemolishingCountdown",
	Moment = "start",
	Sound = "UI SalvageTimer",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "DequeueResearch",
	Moment = "start",
	Sound = "UI MenuResearchItemRemove",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "AdvancedStirlingGenerator",
	Moment = "start",
	Sound = "Object StirlingGeneratorAdv Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "Apartments",
	Moment = "start",
	Sound = "Building Apartments Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "Arcology",
	Moment = "start",
	Sound = "Building Arcology Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "ArtWorkshop",
	Moment = "start",
	Sound = "Building WorkshopArt Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "ArtificialSun",
	Moment = "start",
	Sound = "Object ArtificialSun Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "AtomicBattery",
	Moment = "start",
	Sound = "Object AtomicBattery Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "AttackRover",
	Moment = "start",
	Sound = "Unit RoverAttack Crash",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "AutomaticMetalsExtractor",
	Moment = "start",
	Sound = "Object MetalExtractorAuto Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "Battery_WaterFuelCell",
	Moment = "start",
	Sound = "Object PowerAccumulator Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "BioroboticsWorkshop",
	Moment = "start",
	Sound = "Building WorkshopBiorobotics Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "Casino Complex",
	Moment = "start",
	Sound = "Building Casino Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "CloningVats",
	Moment = "start",
	Sound = "Building CloningVats Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "ConcretePlant",
	Moment = "start",
	Sound = "Object ConcretePlant Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "CorporateOffice",
	Moment = "start",
	Sound = "Building CorporateOffice Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "DefenceTower",
	Moment = "start",
	Sound = "Object DefenceTower Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "Diner",
	Moment = "start",
	Sound = "Building Diner Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "DomeBasic",
	Moment = "start",
	Sound = "Building DomeBasic Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "DomeDiamond",
	Moment = "start",
	Sound = "Building DomeDiamond Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "DomeGeoscape",
	Moment = "start",
	Sound = "Building DomeGeoscape Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "DomeHexa",
	Moment = "start",
	Sound = "Building DomeBarrel Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "DomeMedium",
	Moment = "start",
	Sound = "Building DomeMedium Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "DomeMega",
	Moment = "start",
	Sound = "Building DomeMega Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "DomeMegaTrigon",
	Moment = "start",
	Sound = "Building DomeTrigonMega Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "DomeMicro",
	Moment = "start",
	Sound = "Building DomeMicro Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "DomeOval",
	Moment = "start",
	Sound = "Building DomeOval Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "DomeStar",
	Moment = "start",
	Sound = "Building DomeStar Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "DomeTrigon",
	Moment = "start",
	Sound = "Building DomeTrigon Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "Drone",
	Moment = "start",
	Sound = "Unit DroneLand Crash",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "DroneFactory",
	Moment = "start",
	Sound = "Object Workshop Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "DroneHub",
	Moment = "start",
	Sound = "Object DroneHUB Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "ElectronicsFactory",
	Moment = "start",
	Sound = "Building ElectronicsFactory Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "ElectronicsFactory_Small",
	Moment = "start",
	Sound = "Building ElectronicsFactory Demolition",
	Source = "ActionPos",
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "ExplorerRover",
	Moment = "start",
	Sound = "Unit Rover Crash",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "FXRocket",
	Moment = "start",
	Sound = "Unit Rocket Crash",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "Farm",
	Moment = "start",
	Sound = "Building Farm Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "FlyingDrone",
	Moment = "start",
	Sound = "Unit DroneFly Crash",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "FuelFactory",
	Moment = "start",
	Sound = "Object FuelRefinery Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "FungalFarm",
	Moment = "start",
	Sound = "Object FungalFarm Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "FusionReactor",
	Moment = "start",
	Sound = "Object FusionReactor Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "GameDeveloper",
	Moment = "start",
	Sound = "Building GameDeveloper Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "GiantLaser",
	Moment = "start",
	Sound = "Object GiantLaser Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "HangingGardens",
	Moment = "start",
	Sound = "Building HangingGardens Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "HydroponicFarm",
	Moment = "start",
	Sound = "Building HydroponicFarm Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "Infirmary",
	Moment = "start",
	Sound = "Building Infirmary Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "JumperShuttle",
	Moment = "start",
	Sound = "Unit ShuttleJumper Crash",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "JumperShuttleHub",
	Moment = "start",
	Sound = "Object ShuttleHUBJumper Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "LandingPad",
	Moment = "start",
	Sound = "Object LandingPad Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "LargeWaterTank",
	Moment = "start",
	Sound = "Object WaterTankLarge Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "LightTrap",
	Moment = "start",
	Sound = "Object LightTrap Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "LivingQuarters",
	Moment = "start",
	Sound = "Building LivingQuarters Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "LowGLab",
	Moment = "start",
	Sound = "Object Low-GLab Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "MDSLaser",
	Moment = "start",
	Sound = "Object MDSLaser Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "MOXIE",
	Moment = "start",
	Sound = "Object MOXIE Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "MachinePartsFactory",
	Moment = "start",
	Sound = "Building MachinepartsFactory Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "MachinePartsFactory_Small",
	Moment = "start",
	Sound = "Building MachinepartsFactory Demolition",
	Source = "ActionPos",
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "MartianUniversity",
	Moment = "start",
	Sound = "Building MartianUni Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "MedicalCenter",
	Moment = "start",
	Sound = "Building MedicalCenter Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "MegaMall",
	Moment = "start",
	Sound = "Building Megamall Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "MetalsExtractor",
	Moment = "start",
	Sound = "Object MetalExtractor Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "MetalsRefinery",
	Moment = "start",
	Sound = "Object MetalsRefinery Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "MoholeMine",
	Moment = "start",
	Sound = "Object MoholeMine Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "MoistureVaporator",
	Moment = "start",
	Sound = "Object MoistureVaporator Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "NetworkNode",
	Moment = "start",
	Sound = "Building NetworkNode Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "Nursery",
	Moment = "start",
	Sound = "Building Nurcery Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "OmegaTelescope",
	Moment = "start",
	Sound = "Object OmegaTelescope Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "OpenAirGym",
	Moment = "start",
	Sound = "Building OpenAirGym Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "OxygenTank",
	Moment = "start",
	Sound = "Object AirStorage Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "PassageRamp",
	Moment = "start",
	Sound = "Object PassageRamp Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "Playground",
	Moment = "start",
	Sound = "Building Playground Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "PolymerFactory",
	Moment = "start",
	Sound = "Object PolymerPlant Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "PowerDecoy",
	Moment = "start",
	Sound = "Object PowerDecoy Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "PowerSwitch",
	Moment = "start",
	Sound = "Object PowerSwitch Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "PreciousMetalsExtractor",
	Moment = "start",
	Sound = "Object PreciousExtractor Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "ProjectMorpheus",
	Moment = "start",
	Sound = "Object ProjectMorpheus Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "RCConstructor",
	Moment = "start",
	Sound = "Unit Rover Crash",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "RCDriller",
	Moment = "start",
	Sound = "Unit Rover Crash",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "RCHarvester",
	Moment = "start",
	Sound = "Unit Rover Crash",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "RCRover",
	Moment = "start",
	Sound = "Unit Rover Crash",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "RCSensor",
	Moment = "start",
	Sound = "Unit Rover Crash",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "RCSolar",
	Moment = "start",
	Sound = "Unit Rover Crash",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "RCTransport",
	Moment = "start",
	Sound = "Unit TransportRC Crash",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "RareMetalsRefinery",
	Moment = "start",
	Sound = "Object MetalsRefinery Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "RechargeStation",
	Moment = "start",
	Sound = "Object RechargeStation Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "RegolithExtractor",
	Moment = "start",
	Sound = "Object RegolithExtractor Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "ResearchLab",
	Moment = "start",
	Sound = "Building ResearchLab Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "Sanatorium",
	Moment = "start",
	Sound = "Building Sanatorium Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "School",
	Moment = "start",
	Sound = "Building School Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "ScienceInstitute",
	Moment = "start",
	Sound = "Building ScienceInstitute Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "SecurityStation",
	Moment = "start",
	Sound = "Building SecurityStation Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "SensorTower",
	Moment = "start",
	Sound = "Object SensorTower Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "ShopsElectronics",
	Moment = "start",
	Sound = "Building ElectronicsStore Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "ShopsFood",
	Moment = "start",
	Sound = "Building Grocery Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "ShopsJewelry",
	Moment = "start",
	Sound = "Building Jewelry Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "Shuttle",
	Moment = "start",
	Sound = "Unit Shuttle Crash",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "ShuttleHub",
	Moment = "start",
	Sound = "Object ShuttleHUB Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "SmartHome",
	Moment = "start",
	Sound = "Building SmartHome Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "SmartHome_Small",
	Moment = "start",
	Sound = "Building SmartHome Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "SmartHomes",
	Moment = "start",
	Sound = "Building SmartHomes Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "SolarArray",
	Moment = "start",
	Sound = "Object SolarArray Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "SolarPanel",
	Moment = "start",
	Sound = "Object SolarPanel Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "SolarPanelBig",
	Moment = "start",
	Sound = "Object SolarPanelBig Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "SpaceElevator",
	Moment = "start",
	Sound = "Object SpaceElevator Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "Spacebar",
	Moment = "start",
	Sound = "Building Spacebar Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "Spacebar_Small",
	Moment = "start",
	Sound = "Building Spacebar Demolition",
	Source = "ActionPos",
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "Spaceport",
	Moment = "start",
	Sound = "Object Spaceport Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "StirlingGenerator",
	Moment = "start",
	Sound = "Object StirlingGenerator Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "SubsurfaceHeater",
	Moment = "start",
	Sound = "Object SubsurfaceHeater Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "TaiChiGarden",
	Moment = "start",
	Sound = "Building TaiChiGarden Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "Temple",
	Moment = "start",
	Sound = "Building TempleSpire Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "TheExcavator",
	Moment = "start",
	Sound = "Object Excavator Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "TriboelectricScrubber",
	Moment = "start",
	Sound = "Object TriboelectricScrubber Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "Tunnel",
	Moment = "start",
	Sound = "Object Tunnel Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "VRWorkshop",
	Moment = "start",
	Sound = "Building WorkshopVR Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "WasteRockProcessor",
	Moment = "start",
	Sound = "Object WasteRockProcessor Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "WaterExtractor",
	Moment = "start",
	Sound = "Object WaterExtractor Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "WaterReclamationSystem",
	Moment = "start",
	Sound = "Building WaterReclamation Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "WaterTank",
	Moment = "start",
	Sound = "Object WaterTower Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "WaterTower",
	Moment = "start",
	Sound = "Object WaterTower Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "WindTurbine",
	Moment = "start",
	Sound = "Object WindTurbine Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Moment = "start",
	Sound = "UI BuildDemolition",
	Source = "UI",
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

PlaceObj('ActionFXSound', {
	Action = "Dive",
	Actor = "Firefly",
	Delay = 1000,
	Moment = "start",
	Sound = "Mystery Lights FireflyDisappear",
})

PlaceObj('ActionFXSound', {
	Action = "DomeAcceptColonistsChanged",
	Moment = "start",
	Sound = "UI DomeAllowColonist",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "DomeExplosion",
	Actor = "BombardRocket",
	Moment = "start",
	Sound = "Mystery Bombardment ExplodeTarget",
})

PlaceObj('ActionFXParticles', {
	Action = "DomeExplosion",
	AlwaysVisible = true,
	DetailLevel = 60,
	Moment = "start",
	Particles = "Meteor_Explosion_Dome",
	Scale = 120,
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "DoorClose",
	Actor = "DomeDoorEntrance_01",
	Moment = "start",
	Sound = "Building Dome DoorClose",
})

PlaceObj('ActionFXSound', {
	Action = "DoorClose",
	Actor = "DomeDoorExit_01",
	Moment = "start",
	Sound = "Building Dome DoorClose",
})

PlaceObj('ActionFXSound', {
	Action = "DoorClose",
	Actor = "TunnelEntranceDoor",
	Moment = "start",
	Sound = "Object Tunnel DoorClose",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "DoorOpen",
	Actor = "DomeDoorEntrance_01",
	Moment = "start",
	Sound = "Building Dome DoorOpen",
})

PlaceObj('ActionFXSound', {
	Action = "DoorOpen",
	Actor = "DomeDoorExit_01",
	Moment = "start",
	Sound = "Building Dome DoorOpen",
})

PlaceObj('ActionFXSound', {
	Action = "DoorOpen",
	Actor = "TunnelEntranceDoor",
	Moment = "start",
	Sound = "Object Tunnel DoorOpen",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "DrainWater",
	Actor = "Firefly",
	Moment = "end",
	Sound = "Mystery Lights FireflyDrainStop",
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

PlaceObj('ActionFXSound', {
	Action = "DrainWater",
	Actor = "Firefly",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 5000,
	FadeOut = 5000,
	Moment = "start",
	Sound = "Mystery Lights FireflyDrainLoop",
	handle = 1021643390,
})

PlaceObj('ActionFXSound', {
	Action = "DrainWater",
	Actor = "Firefly",
	Moment = "start",
	Sound = "Mystery Lights FireflyDrainStart",
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

PlaceObj('ActionFXSound', {
	Action = "Drill",
	Actor = "RCDriller",
	Moment = "Hit",
	Sound = "Unit RoverDriller DrillHit",
})

PlaceObj('ActionFXSound', {
	Action = "Drill",
	Actor = "RCDriller",
	Moment = "end",
	Sound = "Unit RoverDriller DrillStop",
})

PlaceObj('ActionFXSound', {
	Action = "Drill",
	Actor = "RCDriller",
	Moment = "start",
	Sound = "Unit RoverDriller DrillStart",
})

PlaceObj('ActionFXSound', {
	Action = "DroneExplode",
	Actor = "Drone",
	Moment = "start",
	Sound = "Unit DroneLand Crash",
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "DroneExplode",
	Actor = "Drone",
	Moment = "start",
	Sound = "Unit DroneLand Explode",
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "DroneExplode",
	Actor = "FlyingDrone",
	Moment = "start",
	Sound = "Unit DroneFly Crash",
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "DroneExplode",
	Actor = "FlyingDrone",
	Moment = "start",
	Sound = "Unit DroneFly Explode",
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "DroneExplode",
	Attach = true,
	DetailLevel = 60,
	Moment = "start",
	Particles = "Drone_Explode",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "DroneRechargeCoilArc",
	Actor = "Drone",
	AttachToObj = true,
	FadeIn = 500,
	FadeOut = 500,
	Moment = "start",
	Sound = "Unit Drone RechargingWireless",
	handle = 915180932,
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

PlaceObj('ActionFXSound', {
	Action = "DroneRechargePulse",
	Actor = "RechargeStation",
	AttachToObj = true,
	FadeIn = 500,
	FadeOut = 500,
	Moment = "start",
	Sound = "Object RechargeStation ChargeLoopWireless",
	handle = 2124197660,
})

PlaceObj('ActionFXSound', {
	Action = "DroneRechargePulse",
	Actor = "RechargeStation",
	Moment = "start",
	Sound = "Object RechargeStation ChargeStart",
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

PlaceObj('ActionFXSound', {
	Action = "DustStorm",
	EndRules = {},
	Moment = "start",
	Sound = "Ambience Disaster DuststormStart",
	Source = "Camera",
	handle = 1657416982,
})

PlaceObj('ActionFXSound', {
	Action = "DustStorm",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 10000,
	FadeOut = 10000,
	Moment = "start",
	Sound = "Ambience Wind Howl 1",
	Source = "Camera",
	handle = 41516583,
})

PlaceObj('ActionFXSound', {
	Action = "DustStorm",
	Delay = 3000,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 10000,
	FadeOut = 10000,
	Moment = "start",
	Sound = "Ambience Wind Sand 1",
	Source = "Camera",
	handle = 2110103839,
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

PlaceObj('ActionFXSound', {
	Action = "ElectrostaticStorm",
	Moment = "hit-moment1",
	Sound = "Ambience ThunderClose 1",
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

PlaceObj('ActionFXSound', {
	Action = "ElectrostaticStorm",
	Moment = "hit-moment2",
	Sound = "Ambience ThunderClose 2",
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

PlaceObj('ActionFXSound', {
	Action = "ElectrostaticStorm",
	Moment = "hit-moment3",
	Sound = "Ambience ThunderClose 3",
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

PlaceObj('ActionFXSound', {
	Action = "ElectrostaticStorm",
	Moment = "hit-moment4",
	Sound = "Ambience ThunderClose 4",
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "ElectrostaticStorm",
	Moment = "start",
	Sound = "Ambience Disaster DustelectricStart",
	Source = "Camera",
	handle = 332090666,
})

PlaceObj('ActionFXSound', {
	Action = "ElectrostaticStorm",
	Moment = "start",
	Sound = "Ambience ThunderDistant 1",
	Source = "Camera",
	handle = 864922443,
})

PlaceObj('ActionFXSound', {
	Action = "ElectrostaticStorm",
	Delay = 20000,
	Moment = "start",
	Sound = "Ambience ThunderDistant 2",
	Source = "Camera",
	handle = 375815252,
})

PlaceObj('ActionFXSound', {
	Action = "ElectrostaticStorm",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 10000,
	FadeOut = 10000,
	Moment = "start",
	Sound = "Ambience Wind Howl 3",
	Source = "Camera",
	handle = 206407686,
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

PlaceObj('ActionFXSound', {
	Action = "ElectrostaticStormArea",
	Moment = "start",
	Sound = "Ambience Disaster DustElectricSparks",
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "ElectrostaticStormArea",
	FadeOut = 5000,
	Moment = "start",
	Sound = "Ambience ThunderDistant 2",
	Source = "ActionPos",
	Target = "ignore",
	handle = 407363112,
})

PlaceObj('ActionFXSound', {
	Action = "ElevatorMoving",
	Actor = "SpaceElevator",
	Delay = 800,
	Moment = "end",
	Sound = "Object 0 Pressure",
})

PlaceObj('ActionFXSound', {
	Action = "ElevatorMoving",
	Actor = "SpaceElevator",
	Moment = "end",
	Sound = "Object SpaceElevator MoveStop",
})

PlaceObj('ActionFXSound', {
	Action = "ElevatorMoving",
	Actor = "SpaceElevator",
	FadeOut = 1500,
	Moment = "end",
	Sound = "Object SpaceElevator Select",
	Time = 3000,
	handle = 1944034942,
})

PlaceObj('ActionFXSound', {
	Action = "ElevatorMoving",
	Actor = "SpaceElevator",
	Moment = "start",
	Sound = "Object 0 Pressure",
})

PlaceObj('ActionFXSound', {
	Action = "ElevatorMoving",
	Actor = "SpaceElevator",
	Moment = "start",
	Sound = "Object SpaceElevator MoveStart",
})

PlaceObj('ActionFXSound', {
	Action = "ElevatorMoving",
	Actor = "SpaceElevatorCabin",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 2000,
	FadeOut = 2000,
	Moment = "start",
	Sound = "Object SpaceElevator MoveLoop",
	handle = 1724070910,
})

PlaceObj('ActionFXSound', {
	Action = "ElevatorMoving",
	Actor = "SpaceElevatorCabin",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1000,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Object SpaceElevator MoveLoop",
	handle = 1536417259,
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

PlaceObj('ActionFXSound', {
	Action = "EmergencyPower",
	Actor = "Drone",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 100,
	FadeOut = 100,
	Moment = "start",
	Sound = "Unit Drone EmergencyPower",
	handle = 1729758656,
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

PlaceObj('ActionFXSound', {
	Action = "EmergencyPower",
	Actor = "ExplorerRover",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 100,
	FadeOut = 100,
	Moment = "start",
	Sound = "Unit Rover EmergencyPower",
	handle = 1590653260,
})

PlaceObj('ActionFXSound', {
	Action = "EmergencyPower",
	Actor = "FlyingDrone",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 100,
	FadeOut = 100,
	Moment = "start",
	Sound = "Unit Drone EmergencyPower",
	handle = 673392793,
})

PlaceObj('ActionFXSound', {
	Action = "EmergencyPower",
	Actor = "RCConstructor",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 100,
	FadeOut = 100,
	Moment = "start",
	Sound = "Unit Rover EmergencyPower",
	handle = 1265074056,
})

PlaceObj('ActionFXSound', {
	Action = "EmergencyPower",
	Actor = "RCDriller",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 100,
	FadeOut = 100,
	Moment = "start",
	Sound = "Unit Rover EmergencyPower",
	handle = 843537409,
})

PlaceObj('ActionFXSound', {
	Action = "EmergencyPower",
	Actor = "RCHarvester",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 100,
	FadeOut = 100,
	Moment = "start",
	Sound = "Unit Rover EmergencyPower",
	handle = 1880144671,
})

PlaceObj('ActionFXSound', {
	Action = "EmergencyPower",
	Actor = "RCRover",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 100,
	FadeOut = 100,
	Moment = "start",
	Sound = "Unit Rover EmergencyPower",
	handle = 1162181579,
})

PlaceObj('ActionFXSound', {
	Action = "EmergencyPower",
	Actor = "RCSensor",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 100,
	FadeOut = 100,
	Moment = "start",
	Sound = "Unit Rover EmergencyPower",
	handle = 2118386495,
})

PlaceObj('ActionFXSound', {
	Action = "EmergencyPower",
	Actor = "RCSolar",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 100,
	FadeOut = 100,
	Moment = "start",
	Sound = "Unit Rover EmergencyPower",
	handle = 114105059,
})

PlaceObj('ActionFXSound', {
	Action = "EmergencyPower",
	Actor = "RCTransport",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 100,
	FadeOut = 100,
	Moment = "start",
	Sound = "Unit Rover EmergencyPower",
	handle = 1634345564,
})

PlaceObj('ActionFXSound', {
	Action = "EmergencyRecharge",
	Moment = "end",
	Sound = "UI RechargeStop",
	Source = "UI",
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

PlaceObj('ActionFXSound', {
	Action = "EmergencyRecharge",
	Actor = "Drone",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 300,
	FadeOut = 300,
	Moment = "start",
	Sound = "Unit Drone Recharging",
	handle = 1359290943,
})

PlaceObj('ActionFXSound', {
	Action = "EmergencyRecharge",
	Actor = "ExplorerRover",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 300,
	FadeOut = 300,
	Moment = "start",
	Sound = "Unit Rover Recharging",
	handle = 359481213,
})

PlaceObj('ActionFXSound', {
	Action = "EmergencyRecharge",
	Actor = "FlyingDrone",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 300,
	FadeOut = 300,
	Moment = "start",
	Sound = "Unit Drone Recharging",
	handle = 589337029,
})

PlaceObj('ActionFXSound', {
	Action = "EmergencyRecharge",
	Actor = "RCConstructor",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 300,
	FadeOut = 300,
	Moment = "start",
	Sound = "Unit Rover Recharging",
	handle = 1881202227,
})

PlaceObj('ActionFXSound', {
	Action = "EmergencyRecharge",
	Actor = "RCDriller",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 300,
	FadeOut = 300,
	Moment = "start",
	Sound = "Unit Rover Recharging",
	handle = 1552057039,
})

PlaceObj('ActionFXSound', {
	Action = "EmergencyRecharge",
	Actor = "RCHarvester",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 300,
	FadeOut = 300,
	Moment = "start",
	Sound = "Unit Rover Recharging",
	handle = 30919720,
})

PlaceObj('ActionFXSound', {
	Action = "EmergencyRecharge",
	Actor = "RCRover",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 300,
	FadeOut = 300,
	Moment = "start",
	Sound = "Unit Rover Recharging",
	handle = 984021467,
})

PlaceObj('ActionFXSound', {
	Action = "EmergencyRecharge",
	Actor = "RCSensor",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 300,
	FadeOut = 300,
	Moment = "start",
	Sound = "Unit Rover Recharging",
	handle = 1973395482,
})

PlaceObj('ActionFXSound', {
	Action = "EmergencyRecharge",
	Actor = "RCSolar",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 300,
	FadeOut = 300,
	Moment = "start",
	Sound = "Unit Rover Recharging",
	handle = 452308687,
})

PlaceObj('ActionFXSound', {
	Action = "EmergencyRecharge",
	Actor = "RCTransport",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 300,
	FadeOut = 300,
	Moment = "start",
	Sound = "Unit Rover Recharging",
	handle = 2027626030,
})

PlaceObj('ActionFXSound', {
	Action = "EmergencyRecharge",
	Moment = "start",
	Sound = "UI RechargeStart",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "EncyclopediaButtonClick",
	Moment = "start",
	Sound = "UI ButtonGeneralClickIn",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "EnqueueResearch",
	Moment = "start",
	Sound = "UI MenuResearchItemAdd",
	Source = "UI",
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

PlaceObj('ActionFXSound', {
	Action = "Fireworks",
	Actor = "Dome",
	Delay = 1000,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndAction', "Fireworks",
			'EndMoment', "end",
		}),
	},
	FadeIn = 2000,
	FadeOut = 3000,
	Moment = "start",
	Sound = "Ambience Fireworks Multiple",
	Spot = " Top",
	handle = 974789398,
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

PlaceObj('ActionFXSound', {
	Action = "Fireworks_1",
	Delay = 1700,
	Moment = "start",
	Sound = "Ambience Fireworks Single",
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

PlaceObj('ActionFXSound', {
	Action = "Fireworks_10",
	Delay = 2600,
	Moment = "start",
	Sound = "Ambience Fireworks SingleLarge",
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

PlaceObj('ActionFXSound', {
	Action = "Fireworks_11",
	Delay = 500,
	Moment = "start",
	Sound = "Ambience Fireworks SingleSparks",
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

PlaceObj('ActionFXSound', {
	Action = "Fireworks_12",
	Delay = 500,
	Moment = "start",
	Sound = "Ambience Fireworks SingleSparks",
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

PlaceObj('ActionFXSound', {
	Action = "Fireworks_13",
	Delay = 500,
	Moment = "start",
	Sound = "Ambience Fireworks SingleSparks",
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

PlaceObj('ActionFXSound', {
	Action = "Fireworks_14",
	Delay = 1800,
	Moment = "start",
	Sound = "Ambience Fireworks Single",
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

PlaceObj('ActionFXSound', {
	Action = "Fireworks_15",
	Delay = 2200,
	Moment = "start",
	Sound = "Ambience Fireworks Single",
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

PlaceObj('ActionFXSound', {
	Action = "Fireworks_16",
	Delay = 2200,
	Moment = "start",
	Sound = "Ambience Fireworks Single",
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

PlaceObj('ActionFXSound', {
	Action = "Fireworks_17",
	Delay = 2200,
	Moment = "start",
	Sound = "Ambience Fireworks Single",
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

PlaceObj('ActionFXSound', {
	Action = "Fireworks_18",
	Delay = 2600,
	Moment = "start",
	Sound = "Ambience Fireworks SingleLarge",
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

PlaceObj('ActionFXSound', {
	Action = "Fireworks_2",
	Delay = 1500,
	Moment = "start",
	Sound = "Ambience Fireworks Single",
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

PlaceObj('ActionFXSound', {
	Action = "Fireworks_4",
	Delay = 2750,
	Moment = "start",
	Sound = "Ambience Fireworks SingleLarge",
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

PlaceObj('ActionFXSound', {
	Action = "Fireworks_5",
	Delay = 2450,
	Moment = "start",
	Sound = "Ambience Fireworks Single",
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

PlaceObj('ActionFXSound', {
	Action = "Fireworks_6",
	Delay = 2450,
	Moment = "start",
	Sound = "Ambience Fireworks Single",
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

PlaceObj('ActionFXSound', {
	Action = "Fireworks_7",
	Delay = 2500,
	Moment = "start",
	Sound = "Ambience Fireworks Single",
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

PlaceObj('ActionFXSound', {
	Action = "Fireworks_8",
	Delay = 2500,
	Moment = "start",
	Sound = "Ambience Fireworks Single",
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

PlaceObj('ActionFXSound', {
	Action = "Fireworks_9",
	Delay = 2500,
	Moment = "start",
	Sound = "Ambience Fireworks SingleLarge",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Freeze",
	Actor = "MirrorSphere",
	Moment = "end",
	Sound = "Mystery Sphere FreezeStop",
	Target = "ignore",
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

PlaceObj('ActionFXSound', {
	Action = "Freeze",
	Actor = "MirrorSphere",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 5000,
	FadeOut = 5000,
	Moment = "start",
	Sound = "Mystery Sphere Freeze",
	Source = "ActionPos",
	Target = "ignore",
	handle = 1497402366,
})

PlaceObj('ActionFXSound', {
	Action = "Freeze",
	Actor = "MirrorSphere",
	Moment = "start",
	Sound = "Mystery Sphere FreezeStart",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "Freeze",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeOut = 10000,
	Moment = "start",
	Sound = "Ambience Disaster ColdwaveCracks",
	Source = "ActionPos",
	handle = 372977775,
})

PlaceObj('ActionFXDecal', {
	Action = "FuelExplosion",
	Color = -14277082,
	Decal1 = "DecDebris_03",
	FadeIn = 100,
	FadeOut = 100,
	Moment = "start",
	Scale = 300,
	ScaleVariation = 20,
	Target = "ignore",
	Time = 10000,
})

PlaceObj('ActionFXParticles', {
	Action = "FuelExplosion",
	Delay = 100,
	DetailLevel = 60,
	Moment = "start",
	Particles = "MDSLaser_Meteor_Hit",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "FuelExplosion",
	Moment = "start",
	Sound = "Object StorageDepotFuel Explosion",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "GamePause",
	Moment = "end",
	Sound = "UI GamePauseOFF",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "GamePause",
	Moment = "start",
	Sound = "UI GamePauseON",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "GameSpeedDown",
	Moment = "start",
	Sound = "UI GameSpeedDOWN",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "GameSpeedUp",
	Moment = "start",
	Sound = "UI GameSpeedUP",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Gather",
	Actor = "Drone",
	Moment = "end",
	Sound = "Unit Drone ExtractionStop",
})

PlaceObj('ActionFXSound', {
	Action = "Gather",
	Actor = "RCRover",
	Moment = "end",
	Sound = "Unit Rover ExtractionStop",
})

PlaceObj('ActionFXSound', {
	Action = "Gather",
	Actor = "RCTransport",
	Moment = "end",
	Sound = "Unit TransportRC ExtractionStop",
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

PlaceObj('ActionFXSound', {
	Action = "Gather",
	Actor = "Drone",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 300,
	FadeOut = 500,
	Moment = "start",
	Sound = "Unit Drone ExtractionLoop",
	handle = 1181198361,
})

PlaceObj('ActionFXSound', {
	Action = "Gather",
	Actor = "Drone",
	Moment = "start",
	Sound = "Unit Drone ExtractionStart",
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

PlaceObj('ActionFXSound', {
	Action = "Gather",
	Actor = "RCRover",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 300,
	FadeOut = 500,
	Moment = "start",
	Sound = "Unit Rover ExtractionLoop",
	handle = 545306360,
})

PlaceObj('ActionFXSound', {
	Action = "Gather",
	Actor = "RCRover",
	Moment = "start",
	Sound = "Unit Rover ExtractionStart",
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

PlaceObj('ActionFXSound', {
	Action = "Gather",
	Actor = "RCTransport",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1000,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Unit TransportRC ExtractionLoop",
	handle = 886745829,
})

PlaceObj('ActionFXSound', {
	Action = "Gather",
	Actor = "RCTransport",
	Moment = "start",
	Sound = "Unit TransportRC ExtractionStart",
})

PlaceObj('ActionFXSound', {
	Action = "GreatStorm",
	Moment = "start",
	Sound = "Ambience Disaster DuststormStart",
	Source = "Camera",
	handle = 1727532524,
})

PlaceObj('ActionFXSound', {
	Action = "GreatStorm",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 10000,
	FadeOut = 10000,
	Moment = "start",
	Sound = "Ambience Disaster DuststormWind",
	Source = "Camera",
	handle = 185966247,
})

PlaceObj('ActionFXSound', {
	Action = "GreatStorm",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 10000,
	FadeOut = 10000,
	Moment = "start",
	Sound = "Ambience Wind Sand 1",
	Source = "Camera",
	handle = 615955934,
})

PlaceObj('ActionFXSound', {
	Action = "GridConstructionCancel",
	Moment = "start",
	Sound = "UI BuildCancel",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "GroundExplosion",
	Actor = "BombardRocket",
	Moment = "start",
	Sound = "Mystery Bombardment ExplodeTarget",
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

PlaceObj('ActionFXSound', {
	Action = "Harvest",
	Actor = "RCHarvester",
	Moment = "end",
	Sound = "Unit RoverHarvester HarvestStop",
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

PlaceObj('ActionFXSound', {
	Action = "Harvest",
	Actor = "RCHarvester",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 1500,
	Moment = "start",
	Sound = "Unit RoverHarvester HarvestLoop",
	handle = 82814365,
})

PlaceObj('ActionFXSound', {
	Action = "Harvest",
	Actor = "RCHarvester",
	Moment = "start",
	Sound = "Unit RoverHarvester HarvestStart",
})

PlaceObj('ActionFXSound', {
	Action = "HydroponicFarm",
	Actor = "HydroponicFarm",
	Moment = "LiftEnd",
	Sound = "Building HydroponicFarm Stop",
	Target = "HydroponicFarmElevator",
})

PlaceObj('ActionFXSound', {
	Action = "HydroponicFarm",
	Actor = "HydroponicFarm",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "LiftEnd",
		}),
	},
	FadeIn = 200,
	FadeOut = 200,
	Moment = "LiftStart",
	Sound = "Building HydroponicFarm LiftLoop",
	Target = "HydroponicFarmElevator",
	handle = 1922284149,
})

PlaceObj('ActionFXSound', {
	Action = "HydroponicFarm",
	Actor = "HydroponicFarm",
	Moment = "LiftStart",
	Sound = "Building HydroponicFarm LiftUp",
	Target = "HydroponicFarmElevator",
})

PlaceObj('ActionFXSound', {
	Action = "HydroponicFarm",
	Actor = "HydroponicFarm",
	Moment = "LiftStart",
	Sound = "Building HydroponicFarm Start",
	Target = "HydroponicFarmElevator",
})

PlaceObj('ActionFXSound', {
	Action = "HydroponicFarm",
	Actor = "HydroponicFarm",
	Moment = "RotateStart",
	Sound = "Building HydroponicFarm Rotate",
	Target = "HydroponicFarmElevator",
})

PlaceObj('ActionFXSound', {
	Action = "HydroponicFarm",
	Actor = "HydroponicFarm",
	Moment = "RotateStart",
	Sound = "Building HydroponicFarm Start",
	Target = "HydroponicFarmElevator",
})

PlaceObj('ActionFXSound', {
	Action = "HydroponicFarm",
	Actor = "HydroponicFarm",
	Moment = "SprayEnd",
	Sound = "Building HydroponicFarm Stop",
	Target = "HydroponicFarmElevator",
})

PlaceObj('ActionFXSound', {
	Action = "HydroponicFarm",
	Actor = "HydroponicFarm",
	Delay = 100,
	Moment = "SprayStart",
	Sound = "Building HydroponicFarm Spray",
	Target = "HydroponicFarmElevator",
})

PlaceObj('ActionFXSound', {
	Action = "HydroponicFarm",
	Actor = "HydroponicFarm",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "SprayEnd",
		}),
	},
	FadeIn = 200,
	FadeOut = 500,
	Moment = "SprayStart",
	Sound = "Building HydroponicFarm SprayLoop",
	Target = "HydroponicFarmElevator",
	handle = 277598697,
})

PlaceObj('ActionFXSound', {
	Action = "HydroponicFarm",
	Actor = "HydroponicFarm",
	Moment = "SprayStart",
	Sound = "Building HydroponicFarm Start",
	Target = "HydroponicFarmElevator",
})

PlaceObj('ActionFXSound', {
	Action = "InfopanelIn",
	Moment = "start",
	Sound = "UI MenuInfoFadeIN",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "InfopanelItemSelectorIn",
	Moment = "start",
	Sound = "UI MenuInfoFadeIN",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "InfopanelOut",
	Moment = "start",
	Sound = "UI MenuInfoFadeOUT",
	Source = "UI",
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

PlaceObj('ActionFXSound', {
	Action = "Jump",
	Actor = "JumperShuttle",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 700,
	Moment = "start",
	Sound = "Unit ShuttleJumper Fly",
	handle = 1931857235,
})

PlaceObj('ActionFXSound', {
	Action = "Jump",
	Actor = "JumperShuttle",
	Moment = "start",
	Sound = "Unit ShuttleJumper FlyStart",
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

PlaceObj('ActionFXSound', {
	Action = "Kill",
	Actor = "Firefly",
	Moment = "start",
	Sound = "Mystery Lights FireflyKill",
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "Land",
	Actor = "AttackRover",
	Moment = "end",
	Sound = "Unit RoverAttack LandImpact",
})

PlaceObj('ActionFXLight', {
	Action = "Land",
	Actor = "AttackRover",
	Attach = true,
	Behavior = "BehaviorDetach",
	BehaviorMoment = "end",
	Color = -42752,
	Delay = 1500,
	FadeIn = 1000,
	FadeOut = 1000,
	FadeOutColor = -42752,
	Intensity = 200,
	Moment = "start",
	OffsetDir = "SourceAxisY",
	Radius = 10000,
	StartColor = -42752,
	Time = 3000,
	handle = 1999013964,
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

PlaceObj('ActionFXSound', {
	Action = "Land",
	Actor = "AttackRover",
	Moment = "start",
	Sound = "Unit RoverAttack Landing",
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

PlaceObj('ActionFXSound', {
	Action = "Land",
	Actor = "JumperShuttle",
	Moment = "start",
	Sound = "Unit ShuttleJumper Land",
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

PlaceObj('ActionFXSound', {
	Action = "Land",
	Actor = "Shuttle",
	Moment = "start",
	Sound = "Unit Shuttle Land",
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

PlaceObj('ActionFXSound', {
	Action = "Laser",
	Actor = "MDSLaser",
	Delay = 200,
	Moment = "start",
	Sound = "Object MDSLaser Locate",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Laser",
	Actor = "MDSLaser",
	Moment = "start",
	Sound = "Object MDSLaser Shoot",
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

PlaceObj('ActionFXSound', {
	Action = "LaunchSupplyRocketClick",
	Moment = "start",
	Sound = "UI LaunchCargo",
	Source = "UI",
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

PlaceObj('ActionFXSound', {
	Action = "Load",
	Actor = "RCConstructor",
	Delay = 2000,
	Moment = "start",
	Sound = "Unit RoverConstructor CargoLoad",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "Load",
	Actor = "RCConstructor",
	AttachToObj = true,
	Delay = 2000,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 2000,
	FadeOut = 2000,
	Moment = "start",
	Sound = "Unit RoverConstructor CargoLoop",
	Target = "ignore",
	handle = 2123461496,
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

PlaceObj('ActionFXSound', {
	Action = "Load",
	Actor = "RCTransport",
	Moment = "start",
	Sound = "Unit TransportRC CargoLoad",
})

PlaceObj('ActionFXSound', {
	Action = "Load",
	Actor = "RCTransport",
	FadeIn = 1000,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Unit TransportRC ExtractionLoop",
	handle = 897168629,
})

PlaceObj('ActionFXSound', {
	Action = "MainMenuButtonClick",
	Moment = "start",
	Sound = "UI ButtonGeneralClickIn",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "MainMenuItemClick",
	Moment = "start",
	Sound = "UI ButtonGeneralClickIn",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "MainMenuItemHover",
	Moment = "start",
	Sound = "UI ButtonHover",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "MakeElectricity",
	Actor = "LightTrap",
	Moment = "end",
	Sound = "Object LightTrap Deactivate",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "Marsquake",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 3000,
	FadeOut = 3000,
	Moment = "start",
	Sound = "UI Marsquake",
	Source = "UI",
	handle = 761560426,
})

PlaceObj('ActionFXSound', {
	Action = "MenuItemClick",
	Moment = "start",
	Sound = "UI ButtonGeneralClickIn",
	Source = "UI",
	Target = "Buildings",
})

PlaceObj('ActionFXSound', {
	Action = "MenuItemClick",
	Moment = "start",
	Sound = "UI ButtonGeneralClickIn",
	Source = "UI",
	Target = "Disasters",
})

PlaceObj('ActionFXSound', {
	Action = "MenuItemClick",
	Moment = "start",
	Sound = "UI ButtonGeneralClickIn",
	Source = "UI",
	Target = "Resources",
})

PlaceObj('ActionFXSound', {
	Action = "MenuItemClick",
	Moment = "start",
	Sound = "UI ButtonGeneralClickIn",
	Source = "UI",
	Target = "Vehicles",
})

PlaceObj('ActionFXSound', {
	Action = "MenuItemClick",
	Moment = "start",
	Sound = "UI ButtonGeneralClickIn",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "MenuItemClick",
	Moment = "start",
	Sound = "UI ClearButton",
	Source = "UI",
	Target = "idDecommission",
})

PlaceObj('ActionFXSound', {
	Action = "MenuItemClick",
	Moment = "start",
	Sound = "UI ClearPropagate",
	Source = "UI",
	Target = "idDecommission",
})

PlaceObj('ActionFXSound', {
	Action = "MenuItemClick",
	Moment = "start",
	Sound = "UI SalvagePropagate",
	Source = "UI",
	Target = "idSalvage",
})

PlaceObj('ActionFXSound', {
	Action = "MenuItemHover",
	Moment = "start",
	Sound = "UI ButtonHover",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "MenuOptionPrevNext",
	Moment = "start",
	Sound = "UI MenuOptionPrevNext",
	Source = "UI",
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

PlaceObj('ActionFXSound', {
	Action = "MetatronAnomaly",
	Actor = "SubsurfaceAnomaly",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1000,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Mystery Metatron AnomalyLoop",
	Target = "ignore",
	handle = 1713830011,
})

PlaceObj('ActionFXSound', {
	Action = "MetatronAnomaly",
	Actor = "SubsurfaceAnomaly",
	Moment = "start",
	Sound = "Mystery Metatron AnomalySpawn",
	Source = "ActionPos",
	Target = "ignore",
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

PlaceObj('ActionFXSound', {
	Action = "MetatronArrive",
	Actor = "Metatron",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndAction', "MetatronLeave",
			'EndMoment', "start",
		}),
	},
	FadeIn = 3000,
	FadeOut = 3000,
	Moment = "end",
	Sound = "Mystery Metatron Ambience",
	Spot = "Origin",
	Target = "ignore",
	handle = 727102476,
})

PlaceObj('ActionFXSound', {
	Action = "MetatronArrive",
	Actor = "Metatron",
	Moment = "end",
	Sound = "Mystery Metatron Landing",
	Source = "ActionPos",
	Target = "ignore",
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

PlaceObj('ActionFXSound', {
	Action = "MetatronLeave",
	Actor = "Metatron",
	Delay = 550,
	Moment = "pre-leave",
	Sound = "Mystery Metatron AppearUI",
	Source = "UI",
	Target = "ignore",
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

PlaceObj('ActionFXSound', {
	Action = "MetatronLeave",
	Actor = "Metatron",
	Moment = "start",
	Sound = "Mystery Metatron Takeoff",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "MetatronLeave",
	Actor = "Metatron",
	Moment = "start",
	Sound = "Mystery Metatron TakeoffDebris",
	Source = "ActionPos",
	Target = "ignore",
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

PlaceObj('ActionFXSound', {
	Action = "MetatronPreArrive",
	Actor = "Metatron",
	Delay = 350,
	Moment = "start",
	Sound = "Mystery Metatron Appear",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "MetatronPreArrive",
	Actor = "Metatron",
	Delay = 350,
	Moment = "start",
	Sound = "Mystery Metatron AppearUI",
	Source = "UI",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "MetatronPreArrive",
	Actor = "Metatron",
	AttachToObj = true,
	Delay = 500,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndAction', "MetatronArrive",
			'EndMoment', "end",
		}),
	},
	FadeIn = 3000,
	FadeOut = 5000,
	Moment = "start",
	Sound = "Mystery Metatron Movement",
	Target = "ignore",
	handle = 2072100783,
})

PlaceObj('ActionFXSound', {
	Action = "MetatronPreArrive",
	Actor = "Metatron",
	Delay = 500,
	Moment = "start",
	Sound = "Mystery Metatron MovementStart",
	Target = "ignore",
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

PlaceObj('ActionFXSound', {
	Action = "MetatronRotation",
	Actor = "Metatron",
	Delay = 500,
	Moment = "hit-moment1",
	Sound = "Mystery Metatron Rotate",
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "MetatronRotation",
	Actor = "Metatron",
	Delay = 500,
	Moment = "hit-moment2",
	Sound = "Mystery Metatron Rotate",
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "MetatronRotation",
	Actor = "Metatron",
	Delay = 500,
	Moment = "hit-moment3",
	Sound = "Mystery Metatron Rotate",
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "MetatronRotation",
	Actor = "Metatron",
	Delay = 500,
	Moment = "hit-moment4",
	Sound = "Mystery Metatron Rotate",
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "MetatronRotation",
	Actor = "Metatron",
	Delay = 500,
	Moment = "hit-moment5",
	Sound = "Mystery Metatron Rotate",
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "MetatronRotation",
	Actor = "Metatron",
	Delay = 500,
	Moment = "hit-moment6",
	Sound = "Mystery Metatron Rotate",
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "MetatronRotation",
	Actor = "Metatron",
	Delay = 500,
	Moment = "hit-moment7",
	Sound = "Mystery Metatron Rotate",
	Source = "ActionPos",
	Target = "ignore",
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

PlaceObj('ActionFXSound', {
	Action = "MetatronSpawnGifts",
	Actor = "Metatron",
	Delay = 5000,
	Moment = "start",
	Sound = "Mystery Metatron Strew",
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "MetatronSpawnGifts",
	Actor = "Metatron",
	Moment = "start",
	Sound = "Mystery Metatron StrewCharge",
	Source = "ActionPos",
	Target = "ignore",
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

PlaceObj('ActionFXSound', {
	Action = "Meteor",
	Actor = "MeteorLarge1",
	Moment = "start",
	Sound = "Ambience Disaster MeteorFlydownLarge",
	Target = "ignore",
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

PlaceObj('ActionFXSound', {
	Action = "Meteor",
	Actor = "MeteorLarge2",
	Moment = "start",
	Sound = "Ambience Disaster MeteorFlydownLarge",
	Target = "ignore",
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

PlaceObj('ActionFXSound', {
	Action = "Meteor",
	Actor = "MeteorSmall1",
	Moment = "start",
	Sound = "Ambience Disaster MeteorFlydownSmall",
	Target = "ignore",
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

PlaceObj('ActionFXSound', {
	Action = "Meteor",
	Actor = "MeteorSmall2",
	Moment = "start",
	Sound = "Ambience Disaster MeteorFlydownSmall",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "MeteorDestruction",
	Actor = "Building",
	Moment = "start",
	Sound = "Ambience Disaster MeteorImpactObject",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "MeteorDestruction",
	Actor = "Drone",
	Moment = "start",
	Sound = "Ambience Disaster MeteorDebris",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "MeteorDestruction",
	Actor = "Drone",
	Moment = "start",
	Sound = "Ambience Disaster MeteorImpactObject",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "MeteorDestruction",
	Actor = "ExplorerRover",
	Moment = "start",
	Sound = "Ambience Disaster MeteorDebris",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "MeteorDestruction",
	Actor = "ExplorerRover",
	Moment = "start",
	Sound = "Ambience Disaster MeteorImpactObject",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "MeteorDestruction",
	Actor = "FlyingDrone",
	Moment = "start",
	Sound = "Ambience Disaster MeteorDebris",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "MeteorDestruction",
	Actor = "FlyingDrone",
	Moment = "start",
	Sound = "Ambience Disaster MeteorImpactObject",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "MeteorDestruction",
	Actor = "RCConstructor",
	Moment = "start",
	Sound = "Ambience Disaster MeteorDebris",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "MeteorDestruction",
	Actor = "RCConstructor",
	Moment = "start",
	Sound = "Ambience Disaster MeteorImpactObject",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "MeteorDestruction",
	Actor = "RCDriller",
	Moment = "start",
	Sound = "Ambience Disaster MeteorDebris",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "MeteorDestruction",
	Actor = "RCDriller",
	Moment = "start",
	Sound = "Ambience Disaster MeteorImpactObject",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "MeteorDestruction",
	Actor = "RCHarvester",
	Moment = "start",
	Sound = "Ambience Disaster MeteorDebris",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "MeteorDestruction",
	Actor = "RCHarvester",
	Moment = "start",
	Sound = "Ambience Disaster MeteorImpactObject",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "MeteorDestruction",
	Actor = "RCRover",
	Moment = "start",
	Sound = "Ambience Disaster MeteorDebris",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "MeteorDestruction",
	Actor = "RCRover",
	Moment = "start",
	Sound = "Ambience Disaster MeteorImpactObject",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "MeteorDestruction",
	Actor = "RCSensor",
	Moment = "start",
	Sound = "Ambience Disaster MeteorDebris",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "MeteorDestruction",
	Actor = "RCSensor",
	Moment = "start",
	Sound = "Ambience Disaster MeteorImpactObject",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "MeteorDestruction",
	Actor = "RCSolar",
	Moment = "start",
	Sound = "Ambience Disaster MeteorDebris",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "MeteorDestruction",
	Actor = "RCSolar",
	Moment = "start",
	Sound = "Ambience Disaster MeteorImpactObject",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "MeteorDestruction",
	Actor = "RCTransport",
	Moment = "start",
	Sound = "Ambience Disaster MeteorDebris",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "MeteorDestruction",
	Actor = "RCTransport",
	Moment = "start",
	Sound = "Ambience Disaster MeteorImpactObject",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "MeteorDestruction",
	Moment = "start",
	Sound = "Ambience Disaster MeteorExplosionLarge",
	Source = "ActionPos",
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

PlaceObj('ActionFXSound', {
	Action = "MeteorExplosion",
	Actor = "MeteorLarge1",
	Moment = "start",
	Sound = "Ambience Disaster MeteorDebris",
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "MeteorExplosion",
	Actor = "MeteorLarge1",
	Moment = "start",
	Sound = "Ambience Disaster MeteorImpactGround",
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

PlaceObj('ActionFXSound', {
	Action = "MeteorExplosion",
	Actor = "MeteorLarge2",
	Moment = "start",
	Sound = "Ambience Disaster MeteorDebris",
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "MeteorExplosion",
	Actor = "MeteorLarge2",
	Moment = "start",
	Sound = "Ambience Disaster MeteorImpactGround",
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

PlaceObj('ActionFXSound', {
	Action = "MeteorExplosion",
	Actor = "MeteorSmall1",
	Moment = "start",
	Sound = "Ambience Disaster MeteorDebris",
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "MeteorExplosion",
	Actor = "MeteorSmall1",
	Moment = "start",
	Sound = "Ambience Disaster MeteorImpactGround",
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

PlaceObj('ActionFXSound', {
	Action = "MeteorExplosion",
	Actor = "MeteorSmall2",
	Moment = "start",
	Sound = "Ambience Disaster MeteorDebris",
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "MeteorExplosion",
	Actor = "MeteorSmall2",
	Moment = "start",
	Sound = "Ambience Disaster MeteorImpactGround",
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXLight', {
	Action = "MeteorExplosion",
	Color = -27392,
	Delay = 30,
	FadeIn = 100,
	FadeOut = 1000,
	FadeOutColor = -47104,
	GameTimeAnimated = true,
	Intensity = 255,
	Moment = "start",
	Radius = 10000,
	Source = "ActionPos",
	StartColor = -27392,
	Target = "ignore",
	Time = 200,
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

PlaceObj('ActionFXSound', {
	Action = "MeteorExplosionAir",
	Actor = "MeteorLarge1",
	Moment = "start",
	Sound = "Ambience Disaster MeteorExplosionLarge",
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

PlaceObj('ActionFXSound', {
	Action = "MeteorExplosionAir",
	Actor = "MeteorLarge2",
	Moment = "start",
	Sound = "Ambience Disaster MeteorExplosionLarge",
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

PlaceObj('ActionFXSound', {
	Action = "MeteorExplosionAir",
	Actor = "MeteorSmall1",
	Moment = "start",
	Sound = "Ambience Disaster MeteorExplosionSmall",
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

PlaceObj('ActionFXSound', {
	Action = "MeteorExplosionAir",
	Actor = "MeteorSmall2",
	Moment = "start",
	Sound = "Ambience Disaster MeteorExplosionSmall",
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXParticles', {
	Action = "MeteorHitDome",
	Actor = "Dome",
	DetailLevel = 60,
	Moment = "start",
	OffsetDir = "ActionDir",
	Orientation = "ActionDir",
	Particles = "Meteor_Explosion_Dome",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "MeteorHitDome",
	Actor = "Dome",
	Moment = "start",
	Sound = "Ambience Disaster MeteorImpactDome",
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "MeteorHitDome",
	Actor = "Dome",
	Moment = "start",
	Sound = "Ambience Disaster MeteorImpactDome",
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "MeteorMalfunction",
	Actor = "Building",
	Moment = "start",
	Sound = "Ambience Disaster MeteorDebris",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "MeteorMalfunction",
	Actor = "Building",
	Moment = "start",
	Sound = "Ambience Disaster MeteorImpactObject",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "MeteorMalfunction",
	Actor = "Colonist",
	Moment = "start",
	Sound = "Ambience Disaster MeteorDebris",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "MeteorMalfunction",
	Actor = "Colonist",
	Moment = "start",
	Sound = "Ambience Disaster MeteorImpactGround",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "MeteorMalfunction",
	Actor = "Drone",
	Moment = "start",
	Sound = "Ambience Disaster MeteorDebris",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "MeteorMalfunction",
	Actor = "Drone",
	Moment = "start",
	Sound = "Ambience Disaster MeteorImpactObject",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "MeteorMalfunction",
	Actor = "ExplorerRover",
	Moment = "start",
	Sound = "Ambience Disaster MeteorDebris",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "MeteorMalfunction",
	Actor = "ExplorerRover",
	Moment = "start",
	Sound = "Ambience Disaster MeteorImpactObject",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "MeteorMalfunction",
	Actor = "FlyingDrone",
	Moment = "start",
	Sound = "Ambience Disaster MeteorDebris",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "MeteorMalfunction",
	Actor = "FlyingDrone",
	Moment = "start",
	Sound = "Ambience Disaster MeteorImpactObject",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "MeteorMalfunction",
	Actor = "RCConstructor",
	Moment = "start",
	Sound = "Ambience Disaster MeteorDebris",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "MeteorMalfunction",
	Actor = "RCConstructor",
	Moment = "start",
	Sound = "Ambience Disaster MeteorImpactObject",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "MeteorMalfunction",
	Actor = "RCDriller",
	Moment = "start",
	Sound = "Ambience Disaster MeteorDebris",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "MeteorMalfunction",
	Actor = "RCDriller",
	Moment = "start",
	Sound = "Ambience Disaster MeteorImpactObject",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "MeteorMalfunction",
	Actor = "RCHarvester",
	Moment = "start",
	Sound = "Ambience Disaster MeteorDebris",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "MeteorMalfunction",
	Actor = "RCHarvester",
	Moment = "start",
	Sound = "Ambience Disaster MeteorImpactObject",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "MeteorMalfunction",
	Actor = "RCRover",
	Moment = "start",
	Sound = "Ambience Disaster MeteorDebris",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "MeteorMalfunction",
	Actor = "RCRover",
	Moment = "start",
	Sound = "Ambience Disaster MeteorImpactObject",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "MeteorMalfunction",
	Actor = "RCSensor",
	Moment = "start",
	Sound = "Ambience Disaster MeteorDebris",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "MeteorMalfunction",
	Actor = "RCSensor",
	Moment = "start",
	Sound = "Ambience Disaster MeteorImpactObject",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "MeteorMalfunction",
	Actor = "RCSolar",
	Moment = "start",
	Sound = "Ambience Disaster MeteorDebris",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "MeteorMalfunction",
	Actor = "RCSolar",
	Moment = "start",
	Sound = "Ambience Disaster MeteorImpactObject",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "MeteorMalfunction",
	Actor = "RCTransport",
	Moment = "start",
	Sound = "Ambience Disaster MeteorDebris",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "MeteorMalfunction",
	Actor = "RCTransport",
	Moment = "start",
	Sound = "Ambience Disaster MeteorImpactObject",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "MeteorMalfunction",
	Moment = "start",
	Sound = "Ambience Disaster MeteorExplosionSmall",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "MeteorStorm",
	Moment = "start",
	Sound = "Ambience Disaster MeteorShower Start",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "MissileExplode",
	Actor = "AttackRover",
	Moment = "start",
	Sound = "Unit RoverAttack ShootImpact",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "MissileExplode",
	Actor = "DefenceTower",
	Moment = "start",
	Sound = "Object DefenceTower ShootImpact",
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

PlaceObj('ActionFXSound', {
	Action = "MissileFired",
	Actor = "AttackRover",
	Moment = "start",
	Sound = "Unit RoverAttack Shoot",
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

PlaceObj('ActionFXSound', {
	Action = "MissileFired",
	Actor = "DefenceTower",
	Moment = "start",
	Sound = "Object DefenceTower Shoot",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "MissileFired",
	Actor = "DefenceTower",
	Moment = "start",
	Sound = "Object DefenceTower ShootTail",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "Move",
	Actor = "FlyingDrone",
	Moment = "end",
	Sound = "Unit DroneFly MotionStop",
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

PlaceObj('ActionFXSound', {
	Action = "Move",
	Actor = "BombardMissile",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1000,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Mystery Bombardment MissileFly",
	Target = "ignore",
	handle = 1125694298,
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

PlaceObj('ActionFXSound', {
	Action = "Move",
	Actor = "FlyingDrone",
	Moment = "start",
	Sound = "UI SendVehicleAutonomous",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Move",
	Actor = "FlyingDrone",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 400,
	FadeOut = 400,
	Moment = "start",
	Sound = "Unit DroneFly MotionLoop",
	handle = 1216157090,
})

PlaceObj('ActionFXSound', {
	Action = "Move",
	Actor = "FlyingDrone",
	Moment = "start",
	Sound = "Unit DroneFly MotionStart",
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

PlaceObj('ActionFXSound', {
	Action = "Move",
	Actor = "JumperShuttle",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 700,
	Moment = "start",
	Sound = "Unit ShuttleJumper Fly",
	handle = 1337957345,
})

PlaceObj('ActionFXSound', {
	Action = "Move",
	Actor = "JumperShuttle",
	Moment = "start",
	Sound = "Unit ShuttleJumper FlyStart",
})

PlaceObj('ActionFXSound', {
	Action = "Move",
	Actor = "MirrorSphere",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 3000,
	FadeOut = 3000,
	Moment = "start",
	Sound = "Mystery Sphere Move",
	handle = 641989775,
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

PlaceObj('ActionFXSound', {
	Action = "Move",
	Actor = "Shuttle",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 700,
	Moment = "start",
	Sound = "Unit Shuttle Fly",
	handle = 1471857950,
})

PlaceObj('ActionFXSound', {
	Action = "Move",
	Actor = "Shuttle",
	Moment = "start",
	Sound = "Unit Shuttle FlyStart",
})

PlaceObj('ActionFXSound', {
	Action = "Moving",
	Actor = "AttackRover",
	Moment = "end",
	Sound = "Unit RoverAttack MotionStop",
})

PlaceObj('ActionFXSound', {
	Action = "Moving",
	Actor = "Drone",
	Moment = "end",
	Sound = "Unit DroneLand MotionStop",
})

PlaceObj('ActionFXSound', {
	Action = "Moving",
	Actor = "ExplorerRover",
	Moment = "end",
	Sound = "Unit RoverExplorer MotionStop",
})

PlaceObj('ActionFXSound', {
	Action = "Moving",
	Actor = "FlyingDrone",
	Moment = "end",
	Sound = "Unit DroneFly MotionStop",
})

PlaceObj('ActionFXSound', {
	Action = "Moving",
	Actor = "RCConstructor",
	Moment = "end",
	Sound = "Unit RoverConstructor MotionStop",
})

PlaceObj('ActionFXSound', {
	Action = "Moving",
	Actor = "RCDriller",
	Moment = "end",
	Sound = "Unit RoverDriller MotionStop",
})

PlaceObj('ActionFXSound', {
	Action = "Moving",
	Actor = "RCHarvester",
	Moment = "end",
	Sound = "Unit RoverHarvester MotionStop",
})

PlaceObj('ActionFXSound', {
	Action = "Moving",
	Actor = "RCRover",
	Moment = "end",
	Sound = "Unit Rover MotionStop",
})

PlaceObj('ActionFXSound', {
	Action = "Moving",
	Actor = "RCSensor",
	Moment = "end",
	Sound = "Unit RoverSensor MotionStop",
})

PlaceObj('ActionFXSound', {
	Action = "Moving",
	Actor = "RCSolar",
	Moment = "end",
	Sound = "Unit RoverSolar MotionStop",
})

PlaceObj('ActionFXSound', {
	Action = "Moving",
	Actor = "RCTransport",
	Moment = "end",
	Sound = "Unit TransportRC MotionStop",
})

PlaceObj('ActionFXSound', {
	Action = "Moving",
	Actor = "RCSolar",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 300,
	FadeOut = 1000,
	Moment = "move",
	Sound = "Unit RoverSolar MotionLoop",
	handle = 2060992466,
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

PlaceObj('ActionFXSound', {
	Action = "Moving",
	Actor = "AttackRover",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 200,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Unit RoverAttack MotionLoop",
	handle = 1482452171,
})

PlaceObj('ActionFXSound', {
	Action = "Moving",
	Actor = "AttackRover",
	Moment = "start",
	Sound = "Unit RoverAttack MotionStart",
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

PlaceObj('ActionFXSound', {
	Action = "Moving",
	Actor = "Drone",
	Moment = "start",
	Sound = "UI SendVehicleAutonomous",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Moving",
	Actor = "Drone",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 200,
	FadeOut = 200,
	Moment = "start",
	Sound = "Unit DroneLand MotionLoop",
	handle = 1370862110,
})

PlaceObj('ActionFXSound', {
	Action = "Moving",
	Actor = "Drone",
	Moment = "start",
	Sound = "Unit DroneLand MotionStart",
})

PlaceObj('ActionFXSound', {
	Action = "Moving",
	Actor = "ExplorerRover",
	Moment = "start",
	Sound = "UI SendVehicleAutonomous",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Moving",
	Actor = "ExplorerRover",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 200,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Unit RoverExplorer MotionLoop",
	handle = 1853261606,
})

PlaceObj('ActionFXSound', {
	Action = "Moving",
	Actor = "ExplorerRover",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Sound = "Unit RoverExplorer MotionStart",
	handle = 242603820,
})

PlaceObj('ActionFXSound', {
	Action = "Moving",
	Actor = "FXRocket",
	Moment = "start",
	Sound = "UI SendVehicleAutonomous",
	Source = "UI",
})

PlaceObj('ActionFXRemove', {
	Action = "Moving",
	Actor = "FlyingDrone",
	FxId = "Drone_Trail",
	Moment = "start",
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

PlaceObj('ActionFXSound', {
	Action = "Moving",
	Actor = "FlyingDrone",
	Moment = "start",
	Sound = "UI SendVehicleAutonomous",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Moving",
	Actor = "FlyingDrone",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 400,
	FadeOut = 400,
	Moment = "start",
	Sound = "Unit DroneFly MotionLoop",
	handle = 1471270010,
})

PlaceObj('ActionFXSound', {
	Action = "Moving",
	Actor = "FlyingDrone",
	Moment = "start",
	Sound = "Unit DroneFly MotionStart",
})

PlaceObj('ActionFXSound', {
	Action = "Moving",
	Actor = "RCConstructor",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 300,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Unit RoverConstructor MotionLoop",
	handle = 1256680272,
})

PlaceObj('ActionFXSound', {
	Action = "Moving",
	Actor = "RCConstructor",
	Moment = "start",
	Sound = "Unit RoverConstructor MotionStart",
})

PlaceObj('ActionFXSound', {
	Action = "Moving",
	Actor = "RCDriller",
	Moment = "start",
	Sound = "UI SendVehicleAutonomous",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Moving",
	Actor = "RCDriller",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 300,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Unit RoverDriller MotionLoop",
	handle = 668856066,
})

PlaceObj('ActionFXSound', {
	Action = "Moving",
	Actor = "RCDriller",
	Moment = "start",
	Sound = "Unit RoverDriller MotionStart",
})

PlaceObj('ActionFXSound', {
	Action = "Moving",
	Actor = "RCHarvester",
	Moment = "start",
	Sound = "UI SendVehicleAutonomous",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Moving",
	Actor = "RCHarvester",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 300,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Unit RoverHarvester MotionLoop",
	handle = 367890886,
})

PlaceObj('ActionFXSound', {
	Action = "Moving",
	Actor = "RCHarvester",
	Moment = "start",
	Sound = "Unit RoverHarvester MotionStart",
})

PlaceObj('ActionFXSound', {
	Action = "Moving",
	Actor = "RCRover",
	Moment = "start",
	Sound = "UI SendVehicleAutonomous",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Moving",
	Actor = "RCRover",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 200,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Unit Rover MotionLoop",
	handle = 1972620579,
})

PlaceObj('ActionFXSound', {
	Action = "Moving",
	Actor = "RCRover",
	Moment = "start",
	Sound = "Unit Rover MotionStart",
})

PlaceObj('ActionFXSound', {
	Action = "Moving",
	Actor = "RCSensor",
	Moment = "start",
	Sound = "UI SendVehicleAutonomous",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Moving",
	Actor = "RCSensor",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 300,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Unit RoverSensor MotionLoop",
	handle = 1115886048,
})

PlaceObj('ActionFXSound', {
	Action = "Moving",
	Actor = "RCSensor",
	Moment = "start",
	Sound = "Unit RoverSensor MotionStart",
})

PlaceObj('ActionFXSound', {
	Action = "Moving",
	Actor = "RCSolar",
	Moment = "start",
	Sound = "UI SendVehicleAutonomous",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Moving",
	Actor = "RCSolar",
	Moment = "start",
	Sound = "Unit RoverSolar MotionStart",
})

PlaceObj('ActionFXSound', {
	Action = "Moving",
	Actor = "RCTransport",
	Moment = "start",
	Sound = "UI SendVehicleAutonomous",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Moving",
	Actor = "RCTransport",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 200,
	FadeOut = 200,
	Moment = "start",
	Sound = "Unit TransportRC MotionLoop",
	handle = 936280916,
})

PlaceObj('ActionFXSound', {
	Action = "Moving",
	Actor = "RCTransport",
	Moment = "start",
	Sound = "Unit TransportRC MotionStart",
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

PlaceObj('ActionFXSound', {
	Action = "NewMissionParamsClick",
	Moment = "start",
	Sound = "UI ButtonGeneralClickIn",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "NewMissionParamsHover",
	Moment = "start",
	Sound = "UI ButtonHover",
	Source = "UI",
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

PlaceObj('ActionFXSound', {
	Action = "NoBattery",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Sound = "UI AlertGeneral",
	Source = "UI",
	handle = 1147757048,
})

PlaceObj('ActionFXSound', {
	Action = "NotificationDismissed",
	Moment = "start",
	Sound = "UI MenuNotificationDismissed",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "NotificationOut",
	Moment = "start",
	Sound = "UI MenuNotificationOUT",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "OccupationFull",
	Actor = "MartianUniversity",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 500,
	FadeOut = 500,
	Moment = "start",
	Sound = "Building MartianUni LoopFull",
	handle = 1092436099,
})

PlaceObj('ActionFXSound', {
	Action = "OccupationFull",
	Actor = "MegaMall",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 500,
	FadeOut = 500,
	Moment = "start",
	Sound = "Building Megamall LoopFull",
	handle = 186103212,
})

PlaceObj('ActionFXSound', {
	Action = "OccupationFull",
	Actor = "Nursery",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 500,
	FadeOut = 500,
	Moment = "start",
	Sound = "Building Nurcery LoopFull",
	handle = 440876565,
})

PlaceObj('ActionFXSound', {
	Action = "OccupationFull",
	Actor = "OpenAirGym",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 500,
	FadeOut = 500,
	Moment = "start",
	Sound = "Building OpenAirGym LoopFull",
	handle = 625036521,
})

PlaceObj('ActionFXSound', {
	Action = "OccupationFull",
	Actor = "Playground",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 500,
	FadeOut = 500,
	Moment = "start",
	Sound = "Building Playground LoopFull",
	handle = 2009392204,
})

PlaceObj('ActionFXSound', {
	Action = "OccupationFull",
	Actor = "School",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 500,
	FadeOut = 500,
	Moment = "start",
	Sound = "Building School LoopFull",
	handle = 2088634148,
})

PlaceObj('ActionFXSound', {
	Action = "OccupationLow",
	Actor = "MartianUniversity",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 500,
	FadeOut = 500,
	Moment = "start",
	Sound = "Building MartianUni LoopLow",
	handle = 1716545556,
})

PlaceObj('ActionFXSound', {
	Action = "OccupationLow",
	Actor = "MegaMall",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 500,
	FadeOut = 500,
	Moment = "start",
	Sound = "Building Megamall LoopLow",
	handle = 1285099383,
})

PlaceObj('ActionFXSound', {
	Action = "OccupationLow",
	Actor = "Nursery",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 500,
	FadeOut = 500,
	Moment = "start",
	Sound = "Building Nurcery LoopLow",
	handle = 1015115991,
})

PlaceObj('ActionFXSound', {
	Action = "OccupationLow",
	Actor = "OpenAirGym",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 500,
	FadeOut = 500,
	Moment = "start",
	Sound = "Building OpenAirGym LoopLow",
	handle = 79959358,
})

PlaceObj('ActionFXSound', {
	Action = "OccupationLow",
	Actor = "Playground",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 500,
	FadeOut = 500,
	Moment = "start",
	Sound = "Building Playground LoopLow",
	handle = 1824924454,
})

PlaceObj('ActionFXSound', {
	Action = "OccupationLow",
	Actor = "School",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 500,
	FadeOut = 500,
	Moment = "start",
	Sound = "Building School LoopLow",
	handle = 1600269993,
})

PlaceObj('ActionFXSound', {
	Action = "OccupationPopulated",
	Actor = "MartianUniversity",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 500,
	FadeOut = 500,
	Moment = "start",
	Sound = "Building MartianUni LoopMedium",
	handle = 1052164224,
})

PlaceObj('ActionFXSound', {
	Action = "OccupationPopulated",
	Actor = "MegaMall",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 500,
	FadeOut = 500,
	Moment = "start",
	Sound = "Building Megamall LoopMedium",
	handle = 1038834134,
})

PlaceObj('ActionFXSound', {
	Action = "OccupationPopulated",
	Actor = "Nursery",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 500,
	FadeOut = 500,
	Moment = "start",
	Sound = "Building Nurcery LoopMedium",
	handle = 1351900098,
})

PlaceObj('ActionFXSound', {
	Action = "OccupationPopulated",
	Actor = "OpenAirGym",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 500,
	FadeOut = 500,
	Moment = "start",
	Sound = "Building OpenAirGym LoopMedium",
	handle = 795519953,
})

PlaceObj('ActionFXSound', {
	Action = "OccupationPopulated",
	Actor = "Playground",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 500,
	FadeOut = 500,
	Moment = "start",
	Sound = "Building Playground LoopMedium",
	handle = 832914212,
})

PlaceObj('ActionFXSound', {
	Action = "OccupationPopulated",
	Actor = "School",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 500,
	FadeOut = 500,
	Moment = "start",
	Sound = "Building School LoopMedium",
	handle = 1203166234,
})

PlaceObj('ActionFXSound', {
	Action = "Open",
	Actor = "RCDriller",
	Moment = "start",
	Sound = "Unit RoverDriller Open",
})

PlaceObj('ActionFXSound', {
	Action = "Open",
	Actor = "RoverChinaSolarPanel",
	Moment = "start",
	Sound = "Unit RoverSolar Open",
})

PlaceObj('ActionFXSound', {
	Action = "Open",
	Actor = "RoverEuropeAntena",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndAction', "Close",
			'EndMoment', "start",
		}),
	},
	FadeIn = 3000,
	FadeOut = 3000,
	Moment = "start",
	Sound = "Unit RoverSensor TowerLoop",
	handle = 2026190135,
})

PlaceObj('ActionFXSound', {
	Action = "Open",
	Actor = "RoverEuropeAntena",
	Moment = "start",
	Sound = "Unit RoverSensor TowerON",
})

PlaceObj('ActionFXSound', {
	Action = "OpenInGameMenu",
	Moment = "start",
	Sound = "UI MenuESC",
	Source = "UI",
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

PlaceObj('ActionFXSound', {
	Action = "OutsourceButtonClick",
	Moment = "start",
	Sound = "UI ButtonGeneralClickIn",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "OutsourceButtonHover",
	Moment = "start",
	Sound = "UI ButtonHover",
	Source = "UI",
})

PlaceObj('ActionFXObject', {
	Action = "Overlays",
	Actor = "AdvancedStirlingGenerator",
	Attach = true,
	ColorModifier = -16711936,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
	handle = 1514857799,
})

PlaceObj('ActionFXObject', {
	Action = "Overlays",
	Actor = "AutomaticMetalsExtractor",
	Attach = true,
	ColorModifier = -16711936,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
	handle = 1583255410,
})

PlaceObj('ActionFXObject', {
	Action = "Overlays",
	Actor = "ConstructionSite",
	Attach = true,
	ColorModifier = -16711936,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
	Target = "AdvancedStirlingGenerator",
	handle = 1021717099,
})

PlaceObj('ActionFXObject', {
	Action = "Overlays",
	Actor = "ConstructionSite",
	Attach = true,
	ColorModifier = -16711936,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
	Target = "AutomaticMetalsExtractor",
	handle = 1268246882,
})

PlaceObj('ActionFXObject', {
	Action = "Overlays",
	Actor = "ConstructionSite",
	Attach = true,
	ColorModifier = -16711936,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
	Target = "DroneHub",
	handle = 1533412074,
})

PlaceObj('ActionFXObject', {
	Action = "Overlays",
	Actor = "ConstructionSite",
	Attach = true,
	ColorModifier = -16711936,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
	Target = "MetalsExtractor",
	handle = 1437318560,
})

PlaceObj('ActionFXObject', {
	Action = "Overlays",
	Actor = "ConstructionSite",
	Attach = true,
	ColorModifier = -16711936,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeRadius",
	ScaleMember = "GetSelectionRadiusScale",
	Target = "OrbitalProbe",
	handle = 1328167287,
})

PlaceObj('ActionFXObject', {
	Action = "Overlays",
	Actor = "ConstructionSite",
	Attach = true,
	ColorModifier = -16711936,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
	Target = "PreciousMetalsExtractor",
	handle = 472305261,
})

PlaceObj('ActionFXObject', {
	Action = "Overlays",
	Actor = "ConstructionSite",
	Attach = true,
	ColorModifier = -16711936,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
	Target = "SubsurfaceHeater",
	handle = 145498426,
})

PlaceObj('ActionFXObject', {
	Action = "Overlays",
	Actor = "ConstructionSite",
	Attach = true,
	ColorModifier = -16711936,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
	Target = "TriboelectricScrubber",
	handle = 783548697,
})

PlaceObj('ActionFXObject', {
	Action = "Overlays",
	Actor = "ConstructionSite",
	Attach = true,
	ColorModifier = -16711936,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
	Target = "WaterExtractor",
	handle = 2093816436,
})

PlaceObj('ActionFXObject', {
	Action = "Overlays",
	Actor = "ConstructionSite",
	Attach = true,
	ColorModifier = -16711936,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
	Target = "Workshop",
	handle = 1893592774,
})

PlaceObj('ActionFXObject', {
	Action = "Overlays",
	Actor = "LowGLab",
	Attach = true,
	ColorModifier = -16711936,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
	handle = 1593229899,
})

PlaceObj('ActionFXObject', {
	Action = "Overlays",
	Actor = "MetalsExtractor",
	Attach = true,
	ColorModifier = -16711936,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
	handle = 2138842496,
})

PlaceObj('ActionFXObject', {
	Action = "Overlays",
	Actor = "PreciousMetalsExtractor",
	Attach = true,
	ColorModifier = -16711936,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
	handle = 1581621208,
})

PlaceObj('ActionFXObject', {
	Action = "Overlays",
	Actor = "RCRover",
	Attach = true,
	ColorModifier = -16711936,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexMovableRadius",
	ScaleMember = "GetSelectionRadiusScale",
	handle = 660154455,
})

PlaceObj('ActionFXObject', {
	Action = "Overlays",
	Actor = "SubsurfaceHeater",
	Attach = true,
	ColorModifier = -16711936,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
	handle = 736586975,
})

PlaceObj('ActionFXObject', {
	Action = "Overlays",
	Actor = "TriboelectricScrubber",
	Attach = true,
	ColorModifier = -16711936,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
	handle = 248468619,
})

PlaceObj('ActionFXObject', {
	Action = "Overlays",
	Actor = "WaterExtractor",
	Attach = true,
	ColorModifier = -16711936,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
	handle = 1920521441,
})

PlaceObj('ActionFXObject', {
	Action = "Overlays",
	Actor = "Workshop",
	Attach = true,
	ColorModifier = -16711936,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
	handle = 94097129,
})

PlaceObj('ActionFXSound', {
	Action = "OverviewButtonClick",
	Moment = "start",
	Sound = "UI ButtonGeneralClickIn",
	Source = "UI",
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

PlaceObj('ActionFXSound', {
	Action = "OxygenLeak",
	Actor = "DomeMeteorFractureLarge",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndAction', "OxygenLeak",
			'EndMoment', "end",
		}),
	},
	FadeIn = 3000,
	FadeOut = 3000,
	Moment = "start",
	Sound = "Building Dome LeakBig",
	handle = 298145307,
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

PlaceObj('ActionFXSound', {
	Action = "OxygenLeak",
	Actor = "DomeMeteorFractureSmall",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndAction', "OxygenLeak",
			'EndMoment', "end",
		}),
	},
	FadeIn = 3000,
	FadeOut = 3000,
	Moment = "start",
	Sound = "Building Dome LeakSmall",
	handle = 1150236205,
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

PlaceObj('ActionFXSound', {
	Action = "OxygenLeak",
	Actor = "ElectricityGridElement",
	Moment = "start",
	Sound = "Object PowerCables Fail",
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

PlaceObj('ActionFXSound', {
	Action = "OxygenLeak",
	Actor = "LifeSupportGridElement",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 1500,
	Moment = "start",
	Sound = "Object Pipes Leak",
	handle = 1576975794,
})

PlaceObj('ActionFXSound', {
	Action = "PayloadItemHover",
	Moment = "start",
	Sound = "UI ButtonHover",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Pickup",
	Actor = "Drone",
	Moment = "end",
	Sound = "Unit Drone ExtractionStop",
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

PlaceObj('ActionFXSound', {
	Action = "Pickup",
	Actor = "Drone",
	Moment = "start",
	Sound = "Unit Drone ExtractionStart",
})

PlaceObj('ActionFXSound', {
	Action = "PipeConstructionSuccess",
	Moment = "start",
	Sound = "UI PlacePipes",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "PipeSwitched",
	Actor = "PipeValve",
	Moment = "off",
	Sound = "Object PipeValve Switch",
})

PlaceObj('ActionFXSound', {
	Action = "PipeSwitched",
	Actor = "PipeValve",
	Moment = "on",
	Sound = "Object PipeValve Switch",
})

PlaceObj('ActionFXSound', {
	Action = "PlantsGrowing",
	Actor = "Farm",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "idle2",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1000,
	FadeOut = 1000,
	Moment = "idle",
	Sound = "Building Farm Loop",
	Source = "ActionPos",
	handle = 327104850,
})

PlaceObj('ActionFXSound', {
	Action = "PlantsGrowing",
	Actor = "Farm",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "idle3",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1000,
	FadeOut = 1000,
	Moment = "idle2",
	Sound = "Building Farm Loop",
	Source = "ActionPos",
	handle = 2139478076,
})

PlaceObj('ActionFXSound', {
	Action = "PlantsGrowing",
	Actor = "Farm",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "idle4",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1000,
	FadeOut = 1000,
	Moment = "idle3",
	Sound = "Building Farm Loop",
	Source = "ActionPos",
	handle = 1721688117,
})

PlaceObj('ActionFXSound', {
	Action = "PlantsGrowing",
	Actor = "Farm",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "idle",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1000,
	FadeOut = 1000,
	Moment = "idle4",
	Sound = "Building Farm Loop",
	Source = "ActionPos",
	handle = 2011460892,
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

PlaceObj('ActionFXSound', {
	Action = "Popup",
	Moment = "start",
	Sound = "UI MenuPopup",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "PopupChoiceClick",
	Moment = "start",
	Sound = "UI ButtonPopupClick",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "PopupChoiceHover",
	Moment = "start",
	Sound = "UI ButtonPopupHover",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Pulse",
	Actor = "BlackCubeMonolith",
	Moment = "start",
	Sound = "Mystery CubeStructure Pulse",
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

PlaceObj('ActionFXSound', {
	Action = "RadioStationStarting",
	Sound = "UI SwitchRadioStations",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "RangeChange",
	Moment = "end",
	Sound = "UI RangeChangeEnd",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "RangeChange",
	Moment = "start",
	Sound = "UI RangeChangeStart",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Recharge",
	Moment = "end",
	Sound = "UI RechargeStop",
	Source = "UI",
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

PlaceObj('ActionFXSound', {
	Action = "Recharge",
	Actor = "Drone",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 300,
	FadeOut = 300,
	Moment = "start",
	Sound = "Unit Drone Recharging",
	handle = 1638938253,
})

PlaceObj('ActionFXSound', {
	Action = "Recharge",
	Actor = "ExplorerRover",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 500,
	FadeOut = 500,
	Moment = "start",
	Sound = "Unit Rover Recharging",
	handle = 1599033000,
})

PlaceObj('ActionFXSound', {
	Action = "Recharge",
	Actor = "RCConstructor",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 500,
	FadeOut = 500,
	Moment = "start",
	Sound = "Unit Rover Recharging",
	handle = 1255494677,
})

PlaceObj('ActionFXSound', {
	Action = "Recharge",
	Actor = "RCDriller",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 500,
	FadeOut = 500,
	Moment = "start",
	Sound = "Unit Rover Recharging",
	handle = 883150320,
})

PlaceObj('ActionFXSound', {
	Action = "Recharge",
	Actor = "RCHarvester",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 500,
	FadeOut = 500,
	Moment = "start",
	Sound = "Unit Rover Recharging",
	handle = 41788723,
})

PlaceObj('ActionFXSound', {
	Action = "Recharge",
	Actor = "RCRover",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 500,
	FadeOut = 500,
	Moment = "start",
	Sound = "Unit Rover Recharging",
	handle = 373194338,
})

PlaceObj('ActionFXSound', {
	Action = "Recharge",
	Actor = "RCSensor",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 500,
	FadeOut = 500,
	Moment = "start",
	Sound = "Unit Rover Recharging",
	handle = 1748905054,
})

PlaceObj('ActionFXSound', {
	Action = "Recharge",
	Actor = "RCSolar",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 500,
	FadeOut = 500,
	Moment = "start",
	Sound = "Unit Rover Recharging",
	handle = 141357082,
})

PlaceObj('ActionFXSound', {
	Action = "Recharge",
	Actor = "RCTransport",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 500,
	FadeOut = 500,
	Moment = "start",
	Sound = "Unit Rover Recharging",
	handle = 484639580,
})

PlaceObj('ActionFXSound', {
	Action = "Recharge",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Sound = "UI RechargeStart",
	Source = "UI",
	handle = 261642597,
})

PlaceObj('ActionFXSound', {
	Action = "RechargeStation",
	Actor = "RechargeStation",
	FadeIn = 500,
	Moment = "end",
	Sound = "Object RechargeStation ChargeStart",
})

PlaceObj('ActionFXSound', {
	Action = "RechargeStation",
	Actor = "RechargeStation",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1000,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Object RechargeStation ChargeLoop",
	handle = 1561317299,
})

PlaceObj('ActionFXSound', {
	Action = "RechargeStation",
	Actor = "RechargeStation",
	Moment = "start",
	Sound = "Object RechargeStation ChargeStart",
})

PlaceObj('ActionFXSound', {
	Action = "RegolithExtractorDigging",
	Actor = "ConcreteExtractorCP3JointShovel",
	Moment = "dig",
	Sound = "Object 0 Pressure",
})

PlaceObj('ActionFXSound', {
	Action = "RegolithExtractorDigging",
	Actor = "ConcreteExtractorCP3JointShovel",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndAction', "RegolithExtractorDigging",
			'EndMoment', "digEnd",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndAction', "Working",
			'EndMoment', "end",
		}),
	},
	FadeIn = 1000,
	FadeOut = 1000,
	Moment = "dig",
	Sound = "Object RegolithExtractorCP3 LoopDig",
	handle = 778351891,
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

PlaceObj('ActionFXSound', {
	Action = "RegolithExtractorDigging",
	Actor = "RegolithExtractorDigger",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndAction', "RegolithExtractorDigging",
			'EndMoment', "dig-reverse",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndAction', "Working",
			'EndMoment', "end",
		}),
	},
	FadeIn = 500,
	FadeOut = 500,
	Moment = "dig",
	Sound = "Object RegolithExtractor LoopDig",
	handle = 1618765532,
})

PlaceObj('ActionFXSound', {
	Action = "RegolithExtractorDigging",
	Actor = "RegolithExtractorDigger",
	Moment = "dig",
	Sound = "Object RegolithExtractor RollerOUT",
})

PlaceObj('ActionFXSound', {
	Action = "RegolithExtractorDigging",
	Actor = "ConcreteExtractorCP3JointShovel",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndAction', "RegolithExtractorDigging",
			'EndMoment', "digEnd",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndAction', "Working",
			'EndMoment', "end",
		}),
	},
	FadeIn = 1000,
	FadeOut = 1000,
	Moment = "dig-reveerse",
	Sound = "Object RegolithExtractorCP3 LoopDig",
	handle = 121179403,
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

PlaceObj('ActionFXSound', {
	Action = "RegolithExtractorDigging",
	Actor = "RegolithExtractorDigger",
	Moment = "dig-reverse",
	Sound = "Object 0 Pressure",
})

PlaceObj('ActionFXSound', {
	Action = "RegolithExtractorDigging",
	Actor = "RegolithExtractorDigger",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndAction', "RegolithExtractorDigging",
			'EndMoment', "digEnd",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndAction', "Working",
			'EndMoment', "end",
		}),
	},
	FadeIn = 500,
	FadeOut = 500,
	Moment = "dig-reverse",
	Sound = "Object RegolithExtractor LoopDig",
	handle = 257813715,
})

PlaceObj('ActionFXSound', {
	Action = "RegolithExtractorDigging",
	Actor = "RegolithExtractorDigger",
	Moment = "digEnd",
	Sound = "Object 0 Pressure",
})

PlaceObj('ActionFXSound', {
	Action = "RegolithExtractorDigging",
	Actor = "RegolithExtractorDigger",
	Moment = "digEnd",
	Sound = "Object RegolithExtractor RollerOUT",
})

PlaceObj('ActionFXSound', {
	Action = "RegolithExtractorDigging",
	Actor = "ConcreteExtractorCP3JointShovel",
	Moment = "enter",
	Sound = "Object 0 Pressure",
})

PlaceObj('ActionFXSound', {
	Action = "RegolithExtractorDigging",
	Actor = "ConcreteExtractorCP3JointShovel",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndAction', "RegolithExtractorDigging",
			'EndMoment', "dig-reverse",
		}),
	},
	FadeIn = 500,
	FadeOut = 500,
	Moment = "enter",
	Sound = "Object RegolithExtractorCP3 ArmClose",
	handle = 1256178309,
})

PlaceObj('ActionFXSound', {
	Action = "RegolithExtractorDigging",
	Actor = "RegolithExtractorDigger",
	Moment = "enter",
	Sound = "Object 0 Pressure",
})

PlaceObj('ActionFXSound', {
	Action = "RegolithExtractorDigging",
	Actor = "RegolithExtractorDigger",
	Moment = "enter",
	Sound = "Object RegolithExtractor Chains",
})

PlaceObj('ActionFXSound', {
	Action = "RegolithExtractorDigging",
	Actor = "RegolithExtractorDigger",
	Delay = 3500,
	Moment = "enter",
	Sound = "Object RegolithExtractor RollerIN",
})

PlaceObj('ActionFXSound', {
	Action = "RegolithExtractorDigging",
	Actor = "ConcreteExtractorCP3JointShovel",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndAction', "RegolithExtractorDigging",
			'EndMoment', "dig-reverse",
		}),
	},
	FadeIn = 500,
	FadeOut = 500,
	Moment = "exit",
	Sound = "Object RegolithExtractorCP3 ArmOpen",
	handle = 1624964392,
})

PlaceObj('ActionFXSound', {
	Action = "RegolithExtractorDigging",
	Actor = "RegolithExtractorDigger",
	Moment = "exit",
	Sound = "Object 0 Pressure",
})

PlaceObj('ActionFXSound', {
	Action = "RegolithExtractorDigging",
	Actor = "RegolithExtractorDigger",
	Moment = "exit",
	Sound = "Object RegolithExtractor RollerOUT",
})

PlaceObj('ActionFXSound', {
	Action = "RegolithExtractorDigging",
	Actor = "RegolithExtractorDigger",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndAction', "RegolithExtractorDigging",
			'EndMoment', "exit",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndAction', "Working",
			'EndMoment', "end",
		}),
	},
	FadeIn = 200,
	FadeOut = 200,
	Moment = "idle",
	Sound = "Object RegolithExtractor LoopIdle",
	handle = 1498149116,
})

PlaceObj('ActionFXParticles', {
	Action = "Release",
	Actor = "LightTrap",
	Attach = true,
	Moment = "start",
	Particles = "Fireflies_LightTrap_Trap",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "Release",
	Actor = "LightTrap",
	Delay = 1500,
	Moment = "start",
	Sound = "Object LightTrap Release",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "Release",
	Actor = "MirrorSphere",
	Moment = "start",
	Sound = "Object PowerDecoy Release",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Repair",
	Actor = "Drone",
	Moment = "end",
	Sound = "Unit Drone RepairStop",
})

PlaceObj('ActionFXSound', {
	Action = "Repair",
	Actor = "ExplorerRover",
	Moment = "end",
	Sound = "Unit Rover RepairStop",
})

PlaceObj('ActionFXSound', {
	Action = "Repair",
	Actor = "RCRover",
	Moment = "end",
	Sound = "Unit Rover RepairStop",
})

PlaceObj('ActionFXSound', {
	Action = "Repair",
	Actor = "RCTransport",
	Moment = "end",
	Sound = "Unit Rover RepairStop",
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

PlaceObj('ActionFXSound', {
	Action = "Repair",
	Actor = "Drone",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 300,
	FadeOut = 600,
	Moment = "start",
	Sound = "Unit Drone RepairLoop",
	handle = 327929531,
})

PlaceObj('ActionFXSound', {
	Action = "Repair",
	Actor = "Drone",
	Moment = "start",
	Sound = "Unit Drone RepairStart",
})

PlaceObj('ActionFXSound', {
	Action = "Repair",
	Actor = "ExplorerRover",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 300,
	FadeOut = 600,
	Moment = "start",
	Sound = "Unit Rover RepairLoop",
	handle = 610928569,
})

PlaceObj('ActionFXSound', {
	Action = "Repair",
	Actor = "ExplorerRover",
	Moment = "start",
	Sound = "Unit Rover RepairStart",
})

PlaceObj('ActionFXRemove', {
	Action = "Repair",
	Actor = "RCRover",
	FxId = "RCRoverRepair",
	Moment = "start",
	Target = "Drone",
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

PlaceObj('ActionFXSound', {
	Action = "Repair",
	Actor = "RCRover",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 300,
	FadeOut = 600,
	Moment = "start",
	Sound = "Unit Rover RepairLoop",
	handle = 164589301,
})

PlaceObj('ActionFXSound', {
	Action = "Repair",
	Actor = "RCRover",
	Moment = "start",
	Sound = "Unit Rover RepairStart",
})

PlaceObj('ActionFXSound', {
	Action = "Repair",
	Actor = "RCTransport",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 300,
	FadeOut = 600,
	Moment = "start",
	Sound = "Unit Rover RepairLoop",
	handle = 1491576594,
})

PlaceObj('ActionFXSound', {
	Action = "Repair",
	Actor = "RCTransport",
	Moment = "start",
	Sound = "Unit Rover RepairStart",
})

PlaceObj('ActionFXSound', {
	Action = "Repair",
	Moment = "start",
	Sound = "UI Repair",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "ResearchButtonClick",
	Moment = "start",
	Sound = "UI ButtonGeneralClickIn",
	Source = "UI",
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

PlaceObj('ActionFXSound', {
	Action = "ResourceOverviewButtonClick",
	Moment = "start",
	Sound = "UI ButtonGeneralClickIn",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "ResupplyButtonClick",
	Moment = "start",
	Sound = "UI ButtonGeneralClickIn",
	Source = "UI",
})

PlaceObj('ActionFXRemove', {
	Action = "Revealed",
	Actor = "CrystalsBig",
	FxId = "Revealed",
	Moment = "true",
	Target = "ignore",
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

PlaceObj('ActionFXRemove', {
	Action = "Revealed",
	Actor = "CrystalsSmall",
	FxId = "Revealed",
	Moment = "true",
	Target = "ignore",
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

PlaceObj('ActionFXRemove', {
	Action = "Revealed",
	Actor = "MetatronAnomaly",
	FxId = "Revealed",
	Moment = "true",
	Target = "ignore",
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

PlaceObj('ActionFXSound', {
	Action = "Revealed",
	Moment = "true",
	Sound = "UI Revealed",
	Source = "UI",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "RocketAddCargoClick",
	Moment = "start",
	Sound = "UI RocketCargoLoad",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "RocketAddCargoHover",
	Moment = "start",
	Sound = "UI ButtonHover",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "RocketDoorClose",
	Actor = "FXRocket",
	Moment = "start",
	Sound = "Unit Rocket DoorClose",
})

PlaceObj('ActionFXSound', {
	Action = "RocketDoorOpen",
	Actor = "FXRocket",
	Moment = "start",
	Sound = "Unit Rocket DoorOpen",
})

PlaceObj('ActionFXSound', {
	Action = "RocketDoorOpen",
	Actor = "FXRocket",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndAction', "RocketDoorClose",
			'EndMoment', "start",
		}),
	},
	FadeIn = 2000,
	FadeOut = 2000,
	Moment = "start",
	Sound = "Unit Rocket Idle",
	handle = 1083361612,
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

PlaceObj('ActionFXSound', {
	Action = "RocketEngine",
	Actor = "FXRocket",
	Delay = 6000,
	Moment = "start",
	Sound = "Unit Rocket Warmup",
})

PlaceObj('ActionFXSound', {
	Action = "RocketEngine",
	Actor = "FXRocket",
	Moment = "start",
	Sound = "Unit Rocket Warmup",
})

PlaceObj('ActionFXSound', {
	Action = "RocketEngine",
	Actor = "FXRocket",
	Delay = 2000,
	Moment = "start",
	Sound = "Unit Rocket Warmup",
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

PlaceObj('ActionFXSound', {
	Action = "RocketLand",
	Actor = "SupplyRocket",
	Moment = "hit-ground",
	Sound = "Unit Rocket LandAir",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "RocketLand",
	Actor = "SupplyRocket",
	Moment = "hit-ground",
	Sound = "Unit Rocket LandImpact",
	Source = "ActionPos",
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

PlaceObj('ActionFXSound', {
	Action = "RocketLand",
	Actor = "FXRocket",
	Delay = 5000,
	Moment = "pre-hit-ground",
	Sound = "Unit Rocket Land",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "RocketLand",
	Actor = "FXRocket",
	FadeIn = 500,
	Moment = "pre-hit-ground",
	Sound = "Unit Rocket Warmup",
	Source = "ActionPos",
})

PlaceObj('ActionFXLight', {
	Action = "RocketLand",
	Actor = "FXRocket",
	Attach = true,
	Color = -21191,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 2000,
	FadeOut = 1000,
	FadeOutColor = -21191,
	GameTimeAnimated = true,
	Intensity = 220,
	Moment = "pre-hit-ground",
	Radius = 6000,
	StartColor = -21191,
	Target = "ignore",
	Time = 10500,
	handle = 229179243,
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

PlaceObj('ActionFXSound', {
	Action = "RocketLand",
	Actor = "SupplyRocket",
	FadeIn = 1000,
	Moment = "pre-hit-ground",
	Sound = "Unit Rocket LandSteam",
})

PlaceObj('ActionFXSound', {
	Action = "RocketLand",
	Actor = "SupplyRocket",
	Delay = 4000,
	Moment = "pre-hit-ground",
	Sound = "Unit Rocket LandSteam",
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

PlaceObj('ActionFXSound', {
	Action = "RocketLand",
	Actor = "FXRocket",
	FadeIn = 5000,
	FadeOut = 3000,
	Moment = "start",
	Sound = "Unit Rocket EngineStop",
	handle = 927857520,
})

PlaceObj('ActionFXSound', {
	Action = "RocketLand",
	Actor = "FXRocket",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndAction', "RocketLand",
			'EndMoment', "end",
		}),
	},
	FadeIn = 3000,
	FadeOut = 2000,
	Moment = "start",
	Sound = "Unit Rocket Fly",
	handle = 77060519,
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

PlaceObj('ActionFXSound', {
	Action = "RocketLaunch",
	Actor = "FXRocket",
	Moment = "start",
	Sound = "Unit Rocket EngineStart",
})

PlaceObj('ActionFXSound', {
	Action = "RocketLaunch",
	Actor = "FXRocket",
	FadeIn = 2000,
	FadeOut = 2000,
	Moment = "start",
	Sound = "Unit Rocket Fly",
	handle = 178690969,
})

PlaceObj('ActionFXSound', {
	Action = "RocketLaunch",
	Actor = "FXRocket",
	Moment = "start",
	Sound = "Unit Rocket Takeoff",
})

PlaceObj('ActionFXLight', {
	Action = "RocketLaunch",
	Actor = "SupplyRocket",
	Attach = true,
	Color = -21191,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1000,
	FadeOut = 4000,
	FadeOutColor = -21191,
	GameTimeAnimated = true,
	Intensity = 200,
	Moment = "start",
	Radius = 6000,
	StartColor = -21191,
	Target = "ignore",
	Time = 10000,
	handle = 949919425,
})

PlaceObj('ActionFXSound', {
	Action = "RocketRemoveCargoClick",
	Moment = "start",
	Sound = "UI RocketCargoUnload",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "RocketRemoveCargoHover",
	Moment = "start",
	Sound = "UI ButtonHover",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "RocketTypeItemClick",
	Moment = "start",
	Sound = "UI SelectRocketType",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "RocketTypeItemHover",
	Moment = "start",
	Sound = "UI ButtonHover",
	Source = "UI",
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

PlaceObj('ActionFXSound', {
	Action = "RotateConstruction",
	Actor = "CursorBuilding",
	Moment = "start",
	Sound = "UI BuildRotate",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "RoverDeploy",
	Actor = "RCRover",
	Moment = "end",
	Sound = "Unit Rover DeployAntennaOFF",
})

PlaceObj('ActionFXSound', {
	Action = "RoverDeploy",
	Actor = "RCRover",
	Moment = "end",
	Sound = "Unit Rover DeployGateClose",
})

PlaceObj('ActionFXSound', {
	Action = "RoverDeploy",
	Actor = "RCSensor",
	Moment = "end",
	Sound = "Unit Rover DeployAntennaOFF",
})

PlaceObj('ActionFXSound', {
	Action = "RoverDeploy",
	Actor = "RCSensor",
	Moment = "end",
	Sound = "Unit Rover DeployGateClose",
})

PlaceObj('ActionFXSound', {
	Action = "RoverDeploy",
	Actor = "RCSolar",
	Moment = "end",
	Sound = "Unit Rover DeployAntennaOFF",
})

PlaceObj('ActionFXSound', {
	Action = "RoverDeploy",
	Actor = "RCSolar",
	Moment = "end",
	Sound = "Unit Rover DeployGateClose",
})

PlaceObj('ActionFXSound', {
	Action = "RoverDeploy",
	Actor = "RCRover",
	Moment = "start",
	Sound = "Unit Rover DeployAntennaON",
})

PlaceObj('ActionFXSound', {
	Action = "RoverDeploy",
	Actor = "RCRover",
	Delay = 1800,
	Moment = "start",
	Sound = "Unit Rover DeployGateOpen",
})

PlaceObj('ActionFXSound', {
	Action = "RoverDeploy",
	Actor = "RCRover",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 500,
	FadeOut = 500,
	Moment = "start",
	Sound = "Unit Rover DeployLoop",
	handle = 1236887865,
})

PlaceObj('ActionFXSound', {
	Action = "RoverDeploy",
	Actor = "RCRover",
	Moment = "start",
	Sound = "Unit Rover DeployStart",
})

PlaceObj('ActionFXSound', {
	Action = "RoverDeploy",
	Actor = "RCSensor",
	Moment = "start",
	Sound = "Unit Rover DeployAntennaON",
})

PlaceObj('ActionFXSound', {
	Action = "RoverDeploy",
	Actor = "RCSensor",
	Moment = "start",
	Sound = "Unit Rover DeployGateOpen",
})

PlaceObj('ActionFXSound', {
	Action = "RoverDeploy",
	Actor = "RCSensor",
	Moment = "start",
	Sound = "Unit Rover DeployStart",
})

PlaceObj('ActionFXSound', {
	Action = "RoverDeploy",
	Actor = "RCSensor",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 2000,
	FadeOut = 2000,
	Moment = "start",
	Sound = "Unit RoverSolar DeployLoop",
	handle = 1150754779,
})

PlaceObj('ActionFXSound', {
	Action = "RoverDeploy",
	Actor = "RCSolar",
	Moment = "start",
	Sound = "Unit Rover DeployAntennaON",
})

PlaceObj('ActionFXSound', {
	Action = "RoverDeploy",
	Actor = "RCSolar",
	Moment = "start",
	Sound = "Unit Rover DeployGateOpen",
})

PlaceObj('ActionFXSound', {
	Action = "RoverDeploy",
	Actor = "RCSolar",
	Moment = "start",
	Sound = "Unit Rover DeployStart",
})

PlaceObj('ActionFXSound', {
	Action = "RoverDeploy",
	Actor = "RCSolar",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 2000,
	FadeOut = 2000,
	Moment = "start",
	Sound = "Unit RoverSolar DeployLoop",
	handle = 378423770,
})

PlaceObj('ActionFXSound', {
	Action = "RoverUnsiege",
	Actor = "RCRover",
	Moment = "start",
	Sound = "Unit Rover DeployCallback",
})

PlaceObj('ActionFXSound', {
	Action = "RoverUnsiege",
	Actor = "RCSensor",
	Moment = "start",
	Sound = "Unit Rover DeployCallback",
})

PlaceObj('ActionFXSound', {
	Action = "RoverUnsiege",
	Actor = "RCSolar",
	Moment = "start",
	Sound = "Unit Rover DeployCallback",
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

PlaceObj('ActionFXSound', {
	Action = "SectorCancel",
	Moment = "start",
	Sound = "UI SectorCancel",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SectorClick",
	Moment = "start",
	Sound = "UI SectorSelect",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SectorHover",
	Moment = "start",
	Sound = "UI SectorHover",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SectorScan",
	Moment = "start",
	Sound = "UI SectorScan",
	Source = "UI",
})

PlaceObj('ActionFXParticles', {
	Action = "SectorScanInvalid",
	Moment = "start",
	Particles = "SensorTower_Sector_Scan_Invalid",
	Source = "ActionPos",
	Time = 3000,
})

PlaceObj('ActionFXSound', {
	Action = "SectorScanInvalid",
	Moment = "start",
	Sound = "UI SectorScanFail",
	Source = "UI",
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

PlaceObj('ActionFXObject', {
	Action = "Select",
	Actor = "ArtificialSun",
	Attach = true,
	ColorModifier = -16711936,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
	handle = 1589510546,
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

PlaceObj('ActionFXObject', {
	Action = "Select",
	Actor = "AutomaticMetalsExtractor",
	Attach = true,
	ColorModifier = -16711936,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
	handle = 1881373587,
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

PlaceObj('ActionFXObject', {
	Action = "Select",
	Actor = "ConstructionSite",
	ColorModifier = -16711936,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
	Target = "ArtificialSun",
	handle = 1849918127,
})

PlaceObj('ActionFXObject', {
	Action = "Select",
	Actor = "ConstructionSite",
	ColorModifier = -16711936,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
	Target = "Dome",
	handle = 129655361,
})

PlaceObj('ActionFXObject', {
	Action = "Select",
	Actor = "ConstructionSite",
	Attach = true,
	ColorModifier = -16711936,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
	Target = "MoholeMine",
	handle = 787324249,
})

PlaceObj('ActionFXObject', {
	Action = "Select",
	Actor = "ConstructionSite",
	Attach = true,
	ColorModifier = -16711936,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeRadius",
	ScaleMember = "GetSelectionRadiusScale",
	Target = "OrbitalProbe",
	handle = 764885304,
})

PlaceObj('ActionFXObject', {
	Action = "Select",
	Actor = "ConstructionSite",
	ColorModifier = -16711936,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
	Target = "Workshop",
	handle = 332158444,
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

PlaceObj('ActionFXObject', {
	Action = "Select",
	Actor = "FXRocket",
	Attach = true,
	ColorModifier = -16711936,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexMovableRadius",
	ScaleMember = "GetSelectionRadiusScale",
	handle = 624682135,
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

PlaceObj('ActionFXSound', {
	Action = "Select",
	Actor = "Firefly",
	Moment = "start",
	Sound = "Mystery Lights FireflySelect",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "Select",
	Actor = "Firefly",
	Moment = "start",
	Sound = "UI SelectMystery",
	Source = "UI",
	Target = "ignore",
})

PlaceObj('ActionFXRemove', {
	Action = "Select",
	Actor = "FlyingDrone",
	FxId = "SelectDrone",
	Moment = "start",
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

PlaceObj('ActionFXObject', {
	Action = "Select",
	Actor = "MoholeMine",
	Attach = true,
	ColorModifier = -16711936,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
	handle = 822051552,
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

PlaceObj('ActionFXSound', {
	Action = "Select",
	Actor = "SubsurfaceAnomaly",
	Moment = "start",
	Sound = "UI SelectResource",
	Source = "UI",
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

PlaceObj('ActionFXSound', {
	Action = "Select",
	Actor = "SubsurfaceDepositMetals",
	Moment = "start",
	Sound = "UI SelectResource",
	Source = "UI",
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

PlaceObj('ActionFXSound', {
	Action = "Select",
	Actor = "SubsurfaceDepositPreciousMetals",
	Moment = "start",
	Sound = "UI SelectResource",
	Source = "UI",
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

PlaceObj('ActionFXSound', {
	Action = "Select",
	Actor = "SubsurfaceDepositWater",
	Moment = "start",
	Sound = "UI SelectResource",
	Source = "UI",
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

PlaceObj('ActionFXSound', {
	Action = "Select",
	Actor = "SurfaceDepositConcrete",
	Moment = "start",
	Sound = "UI SelectResource",
	Source = "UI",
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

PlaceObj('ActionFXSound', {
	Action = "Select",
	Actor = "SurfaceDepositMetals",
	Moment = "start",
	Sound = "UI SelectResource",
	Source = "UI",
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

PlaceObj('ActionFXSound', {
	Action = "Select",
	Actor = "SurfaceDepositPolymers",
	Moment = "start",
	Sound = "UI SelectResource",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Select",
	Actor = "TerrainDepositConcrete",
	Moment = "start",
	Sound = "UI SelectResource",
	Source = "UI",
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

PlaceObj('ActionFXObject', {
	Action = "Select",
	Actor = "Workshop",
	Attach = true,
	ColorModifier = -16711936,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
	handle = 581006627,
})

PlaceObj('ActionFXSound', {
	Action = "SelectColonySite",
	Moment = "end",
	Sound = "UI SelectColonySiteEnd",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectColonySite",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Sound = "UI SelectColonySiteDrag",
	Source = "UI",
	handle = 430540817,
})

PlaceObj('ActionFXSound', {
	Action = "SelectColonySite",
	Moment = "start",
	Sound = "UI SelectColonySiteStart",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "AdvancedStirlingGenerator",
	Moment = "start",
	Sound = "Object StirlingGeneratorAdv Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "AdvancedStirlingGenerator",
	Moment = "start",
	Sound = "UI SelectObject",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "AlienDigger",
	Moment = "start",
	Sound = "Mystery AlienDigger Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "AlienDigger",
	Moment = "start",
	Sound = "UI SelectMystery",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "Apartments",
	Moment = "start",
	Sound = "UI SelectHome",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "Arcology",
	Moment = "start",
	Sound = "Building Arcology Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "Arcology",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "ArtWorkshop",
	Moment = "start",
	Sound = "Building WorkshopArt Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "ArtWorkshop",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "ArtificialSun",
	Moment = "start",
	Sound = "Object ArtificialSun Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "ArtificialSun",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "AtomicBattery",
	Moment = "start",
	Sound = "Object AtomicBattery Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "AtomicBattery",
	Moment = "start",
	Sound = "UI SelectObject",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "AttackRover",
	Moment = "start",
	Sound = "UI SelectVehicleAutonomous",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "AttackRover",
	Moment = "start",
	Sound = "Unit RoverAttack Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "AutomaticMetalsExtractor",
	Moment = "start",
	Sound = "Object MetalExtractorAuto Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "AutomaticMetalsExtractor",
	Moment = "start",
	Sound = "UI SelectObject",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "Battery_WaterFuelCell",
	Moment = "start",
	Sound = "Object PowerAccumulator Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "Battery_WaterFuelCell",
	Moment = "start",
	Sound = "UI SelectObject",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "BioroboticsWorkshop",
	Moment = "start",
	Sound = "Building WorkshopBiorobotics Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "BioroboticsWorkshop",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "BlackCube",
	Moment = "start",
	Sound = "Mystery Cube Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "BlackCube",
	Moment = "start",
	Sound = "UI SelectMystery",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "BlackCubeDump",
	Moment = "start",
	Sound = "Object StorageDepot Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "BlackCubeDump",
	Moment = "start",
	Sound = "UI SelectObject",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "BlackCubeLargeMonument",
	Moment = "start",
	Sound = "UI SelectDеcoration",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "BlackCubeMonolith",
	Moment = "start",
	Sound = "Mystery Cube Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "BlackCubeMonolith",
	Moment = "start",
	Sound = "UI SelectMystery",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "BlackCubeSmallMonument",
	Moment = "start",
	Sound = "UI SelectDеcoration",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "BlackCubeStockpile",
	Moment = "start",
	Sound = "Mystery Cube Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "BlackCubeStockpile",
	Moment = "start",
	Sound = "UI SelectMystery",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "Building",
	Moment = "start",
	Sound = "UI SelectRemains",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "CableSwitch",
	Moment = "start",
	Sound = "Object PowerSwitch Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "Casino Complex",
	Moment = "start",
	Sound = "Building Casino Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "Casino Complex",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "CloningVats",
	Moment = "start",
	Sound = "Building CloningVats Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "CloningVats",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "ConcretePlant",
	Moment = "start",
	Sound = "Object ConcretePlant Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "ConcretePlant",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "ConstructionSite",
	Moment = "start",
	Sound = "Building Apartments SelectIncomplete",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "ConstructionSite",
	Moment = "start",
	Sound = "UI SelectConstructionsite",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "CorporateOffice",
	Moment = "start",
	Sound = "Building CorporateOffice Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "CorporateOffice",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "CrystalsBig",
	Moment = "start",
	Sound = "Mystery AlienCrystals Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "CrystalsBig",
	Moment = "start",
	Sound = "UI SelectMystery",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "CrystalsSmall",
	Moment = "start",
	Sound = "Mystery AlienCrystals Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "CrystalsSmall",
	Moment = "start",
	Sound = "UI SelectMystery",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "DefenceTower",
	Moment = "start",
	Sound = "Object DefenceTower Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "DefenceTower",
	Moment = "start",
	Sound = "UI SelectObject",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "Diner",
	Moment = "start",
	Sound = "Building Diner Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "Diner",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "DomeBasic",
	Moment = "start",
	Sound = "Building DomeBasic Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "DomeBasic",
	Moment = "start",
	Sound = "UI SelectDome",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "DomeDiamond",
	Moment = "start",
	Sound = "Building DomeDiamond Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "DomeDiamond",
	Moment = "start",
	Sound = "UI SelectDome",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "DomeGeoscape",
	Moment = "start",
	Sound = "Building DomeGeoscape Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "DomeGeoscape",
	Moment = "start",
	Sound = "UI SelectDome",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "DomeHexa",
	Moment = "start",
	Sound = "Building DomeBarrel Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "DomeHexa",
	Moment = "start",
	Sound = "UI SelectDome",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "DomeMedium",
	Moment = "start",
	Sound = "Building DomeMedium Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "DomeMedium",
	Moment = "start",
	Sound = "UI SelectDome",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "DomeMega",
	Moment = "start",
	Sound = "Building DomeMega Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "DomeMega",
	Moment = "start",
	Sound = "UI SelectDome",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "DomeMegaTrigon",
	Moment = "start",
	Sound = "Building DomeTrigonMega Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "DomeMegaTrigon",
	Moment = "start",
	Sound = "UI SelectDome",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "DomeMicro",
	Moment = "start",
	Sound = "Building DomeMicro Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "DomeMicro",
	Moment = "start",
	Sound = "UI SelectDome",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "DomeOval",
	Moment = "start",
	Sound = "Building DomeOval Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "DomeOval",
	Moment = "start",
	Sound = "UI SelectDome",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "DomeStar",
	Moment = "start",
	Sound = "Building DomeStar Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "DomeStar",
	Moment = "start",
	Sound = "UI SelectDome",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "DomeTrigon",
	Moment = "start",
	Sound = "Building DomeTrigon Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "DomeTrigon",
	Moment = "start",
	Sound = "UI SelectDome",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "Drone",
	Moment = "start",
	Sound = "UI SelectVehicleAutonomous",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "Drone",
	Moment = "start",
	Sound = "Unit DroneLand Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "DroneFactory",
	Moment = "start",
	Sound = "Object Workshop Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "DroneFactory",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "DroneFactory",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "DroneHub",
	Moment = "start",
	Sound = "Object DroneHUB Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "DroneHub",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "ElectricityGridElement",
	Moment = "start",
	Sound = "Object PowerCables Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "ElectronicsFactory",
	Moment = "start",
	Sound = "Building ElectronicsFactory Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "ElectronicsFactory",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "ElectronicsFactory_Small",
	Moment = "start",
	Sound = "Building ElectronicsFactory Select",
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "ElectronicsFactory_Small",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "ExplorerRover",
	Moment = "start",
	Sound = "UI SelectVehicleAutonomous",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "ExplorerRover",
	Moment = "start",
	Sound = "Unit RoverExplorer Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "FXRocket",
	Moment = "start",
	Sound = "UI SelectVehicleAutonomous",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "FXRocket",
	Moment = "start",
	Sound = "Unit Rocket Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "Farm",
	Moment = "start",
	Sound = "Building Farm Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "Farm",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "FlyingDrone",
	Moment = "start",
	Sound = "UI SelectVehicleAutonomous",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "FlyingDrone",
	Moment = "start",
	Sound = "Unit DroneFly Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "FountainLarge",
	Moment = "start",
	Sound = "UI SelectDеcoration",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "FountainSmall",
	Moment = "start",
	Sound = "UI SelectDеcoration",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "FuelFactory",
	Moment = "start",
	Sound = "Object FuelRefinery Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "FuelFactory",
	Moment = "start",
	Sound = "UI SelectObject",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "FungalFarm",
	Moment = "start",
	Sound = "Object FungalFarm Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "FungalFarm",
	Moment = "start",
	Sound = "UI SelectObject",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "FusionReactor",
	Moment = "start",
	Sound = "Object FusionReactor Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "FusionReactor",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "GameDeveloper",
	Moment = "start",
	Sound = "Building GameDeveloper Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "GameDeveloper",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "GardenAlleys_Medium",
	Moment = "start",
	Sound = "UI SelectDеcoration",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "GardenAlleys_Small",
	Moment = "start",
	Sound = "UI SelectDеcoration",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "GardenNatural_Medium",
	Moment = "start",
	Sound = "UI SelectDеcoration",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "GardenNatural_Small",
	Moment = "start",
	Sound = "UI SelectDеcoration",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "GardenStone",
	Moment = "start",
	Sound = "UI SelectDеcoration",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "HangingGardens",
	Moment = "start",
	Sound = "Building HangingGardens Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "HangingGardens",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "HydroponicFarm",
	Moment = "start",
	Sound = "Building HydroponicFarm Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "HydroponicFarm",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "Infirmary",
	Moment = "start",
	Sound = "Building Infirmary Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "Infirmary",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "JumperShuttle",
	Moment = "start",
	Sound = "UI SelectVehicleAutonomous",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "JumperShuttle",
	Moment = "start",
	Sound = "Unit ShuttleJumper Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "JumperShuttleHub",
	Moment = "start",
	Sound = "Object ShuttleHUBJumper Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "JumperShuttleHub",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "Lake",
	Moment = "start",
	Sound = "UI SelectDеcoration",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "LampProjector",
	Moment = "start",
	Sound = "UI SelectDеcoration",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "LandingPad",
	Moment = "start",
	Sound = "Object LandingPad Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "LandingPad",
	Moment = "start",
	Sound = "UI SelectObject",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "LargeWaterTank",
	Moment = "start",
	Sound = "Object WaterTankLarge Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "LargeWaterTank",
	Moment = "start",
	Sound = "UI SelectObject",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "LifeSupportGridElement",
	Moment = "start",
	Sound = "Object Pipes Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "LightDecorationMedium",
	Moment = "start",
	Sound = "UI SelectDеcoration",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "LightDecorationSmall",
	Moment = "start",
	Sound = "UI SelectDеcoration",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "LightTrap",
	Moment = "start",
	Sound = "Object LightTrap Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "LightTrap",
	Moment = "start",
	Sound = "UI SelectObject",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "LivingQuarters",
	Moment = "start",
	Sound = "Building LivingQuarters Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "LivingQuarters",
	Moment = "start",
	Sound = "UI SelectHome",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "LowGLab",
	Moment = "start",
	Sound = "Object Low-GLab Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "MDSLaser",
	Moment = "start",
	Sound = "Object MDSLaser Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "MDSLaser",
	Moment = "start",
	Sound = "UI SelectObject",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "MOXIE",
	Moment = "start",
	Sound = "Object MOXIE Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "MOXIE",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "MachinePartsFactory",
	Moment = "start",
	Sound = "Building MachinepartsFactory Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "MachinePartsFactory",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "MachinePartsFactory_Small",
	Moment = "start",
	Sound = "Building MachinepartsFactory Select",
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "MachinePartsFactory_Small",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "MartianUniversity",
	Moment = "start",
	Sound = "Building MartianUni Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "MartianUniversity",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "MechanizedDepotConcrete",
	Moment = "start",
	Sound = "Object StorageCrane Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "MechanizedDepotConcrete",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "MechanizedDepotElectronics",
	Moment = "start",
	Sound = "Object StorageCrane Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "MechanizedDepotElectronics",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "MechanizedDepotFood",
	Moment = "start",
	Sound = "Object StorageCrane Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "MechanizedDepotFood",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "MechanizedDepotFuel",
	Moment = "start",
	Sound = "Object StorageCrane Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "MechanizedDepotFuel",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "MechanizedDepotMachineParts",
	Moment = "start",
	Sound = "Object StorageCrane Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "MechanizedDepotMachineParts",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "MechanizedDepotMetals",
	Moment = "start",
	Sound = "Object StorageCrane Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "MechanizedDepotMetals",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "MechanizedDepotMysteryResource",
	Moment = "start",
	Sound = "Object StorageCrane Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "MechanizedDepotMysteryResource",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "MechanizedDepotPolymers",
	Moment = "start",
	Sound = "Object StorageCrane Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "MechanizedDepotPolymers",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "MechanizedDepotRareMetals",
	Moment = "start",
	Sound = "Object StorageCrane Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "MechanizedDepotRareMetals",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "MedicalCenter",
	Moment = "start",
	Sound = "Building MedicalCenter Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "MedicalCenter",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "MegaMall",
	Moment = "start",
	Sound = "Building Megamall Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "MegaMall",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "MetalsExtractor",
	Moment = "start",
	Sound = "Object MetalExtractor Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "MetalsExtractor",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "MetalsRefinery",
	Moment = "start",
	Sound = "Object MetalsRefinery Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "MetalsRefinery",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "MirrorSphere",
	Moment = "start",
	Sound = "Mystery Sphere Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "MirrorSphere",
	Moment = "start",
	Sound = "UI SelectMystery",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "MoholeMine",
	Moment = "start",
	Sound = "Object MoholeMine Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "MoholeMine",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "MoistureVaporator",
	Moment = "start",
	Sound = "Object MoistureVaporator Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "MoistureVaporator",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "NetworkNode",
	Moment = "start",
	Sound = "Building NetworkNode Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "NetworkNode",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "Nurcery",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "Nursery",
	Moment = "start",
	Sound = "Building Nurcery Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "Nursery",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "Nursery",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "OmegaTelescope",
	Moment = "start",
	Sound = "Object OmegaTelescope Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "OmegaTelescope",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "OpenAirGym",
	Moment = "start",
	Sound = "Building OpenAirGym Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "OpenAirGym",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "OxygenTank",
	Moment = "start",
	Sound = "Object AirStorage Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "OxygenTank",
	Moment = "start",
	Sound = "UI SelectObject",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "Passage",
	Moment = "start",
	Sound = "Object Passage Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "Passage",
	Moment = "start",
	Sound = "UI SelectObject",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "PassageRamp",
	Moment = "start",
	Sound = "Object PassageRamp Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "PipeValve",
	Moment = "start",
	Sound = "Object PipeValve Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "Playground",
	Moment = "start",
	Sound = "Building Playground Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "Playground",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "PolymerPlant",
	Moment = "start",
	Sound = "Object PolymerPlant Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "PolymerPlant",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "PowerDecoy",
	Moment = "start",
	Sound = "Object PowerDecoy Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "PowerDecoy",
	Moment = "start",
	Sound = "UI SelectObject",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "PreciousMetalsExtractor",
	Moment = "start",
	Sound = "Object PreciousExtractor Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "PreciousMetalsExtractor",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "ProjectMorpheus",
	Moment = "start",
	Sound = "Object ProjectMorpheus Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "ProjectMorpheus",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "RCConstructor",
	Moment = "start",
	Sound = "UI SelectVehicleAutonomous",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "RCConstructor",
	Moment = "start",
	Sound = "Unit RoverConstructor Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "RCDriller",
	Moment = "start",
	Sound = "UI SelectVehicleAutonomous",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "RCDriller",
	Moment = "start",
	Sound = "Unit RoverDriller Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "RCHarvester",
	Moment = "start",
	Sound = "UI SelectVehicleAutonomous",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "RCHarvester",
	Moment = "start",
	Sound = "Unit RoverHarvester Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "RCRover",
	Moment = "start",
	Sound = "UI SelectVehicleAutonomous",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "RCRover",
	Moment = "start",
	Sound = "Unit Rover Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "RCSensor",
	Moment = "start",
	Sound = "UI SelectVehicleAutonomous",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "RCSensor",
	Moment = "start",
	Sound = "UI SelectVehicleAutonomous",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "RCSensor",
	Moment = "start",
	Sound = "Unit RoverSensor Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "RCSensor",
	Moment = "start",
	Sound = "Unit RoverSensor Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "RCSolar",
	Moment = "start",
	Sound = "UI SelectVehicleAutonomous",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "RCSolar",
	Moment = "start",
	Sound = "Unit RoverSolar Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "RCTransport",
	Moment = "start",
	Sound = "UI SelectVehicleAutonomous",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "RCTransport",
	Moment = "start",
	Sound = "Unit TransportRC Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "RareMetalsRefinery",
	Moment = "start",
	Sound = "Object MetalsRefineryRare Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "RechargeStation",
	Moment = "start",
	Sound = "Object RechargeStation Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "RechargeStation",
	Moment = "start",
	Sound = "UI SelectObject",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "RegolithExtractor",
	Moment = "start",
	Sound = "Object RegolithExtractor Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "RegolithExtractor",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "ResearchLab",
	Moment = "start",
	Sound = "Building ResearchLab Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "ResearchLab",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "ResourcePile",
	Moment = "start",
	Sound = "Object StorageDepot Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "ResourceStockpile",
	Moment = "start",
	Sound = "Object StorageDepot Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "Sanatorium",
	Moment = "start",
	Sound = "Building Sanatorium Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "Sanatorium",
	Moment = "start",
	Sound = "Building Sanatorium Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "Sanatorium",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "School",
	Moment = "start",
	Sound = "Building School Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "School",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "ScienceInstitute",
	Moment = "start",
	Sound = "Building ScienceInstitute Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "ScienceInstitute",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "SecurityStation",
	Moment = "start",
	Sound = "Building SecurityStation Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "SecurityStation",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "SensorTower",
	Moment = "start",
	Sound = "Object SensorTower Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "SensorTower",
	Moment = "start",
	Sound = "UI SelectObject",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "ShopsElectronics",
	Moment = "start",
	Sound = "Building ElectronicsStore Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "ShopsElectronics",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "ShopsFood",
	Moment = "start",
	Sound = "Building Grocery Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "ShopsFood",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "ShopsJewelry",
	Moment = "start",
	Sound = "Building Jewelry Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "ShopsJewelry",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "Shuttle",
	Moment = "start",
	Sound = "UI SelectVehicleAutonomous",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "Shuttle",
	Moment = "start",
	Sound = "Unit Shuttle Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "ShuttleHub",
	Moment = "start",
	Sound = "Object ShuttleHUB Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "ShuttleHub",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "Sinkhole",
	Moment = "start",
	Sound = "Mystery Lights SinkholeSelect",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "Sinkhole",
	Moment = "start",
	Sound = "UI SelectMystery",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "SmartHome",
	Moment = "start",
	Sound = "Building SmartHome Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "SmartHome",
	Moment = "start",
	Sound = "UI SelectHome",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "SmartHome_Small",
	Moment = "start",
	Sound = "Building SmartHome Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "SmartHome_Small",
	Moment = "start",
	Sound = "UI SelectHome",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "SmartHomes",
	Moment = "start",
	Sound = "Building SmartHomes Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "SmartHomes",
	Moment = "start",
	Sound = "UI SelectHome",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "SolarArray",
	Moment = "start",
	Sound = "Object SolarArray Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "SolarArray",
	Moment = "start",
	Sound = "UI SelectObject",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "SolarPanel",
	Moment = "start",
	Sound = "Object SolarPanel Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "SolarPanel",
	Moment = "start",
	Sound = "UI SelectObject",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "SolarPanelBig",
	Moment = "start",
	Sound = "Object SolarPanel Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "SolarPanelBig",
	Moment = "start",
	Sound = "UI SelectObject",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "SpaceElevator",
	Moment = "start",
	Sound = "Object SpaceElevator Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "SpaceElevator",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "Spacebar",
	Moment = "start",
	Sound = "Building Spacebar Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "Spacebar",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "Spacebar_Small",
	Moment = "start",
	Sound = "Building Spacebar Select",
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "Spacebar_Small",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "Spaceport",
	Moment = "start",
	Sound = "Object Spaceport Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "Spaceport",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "Statue",
	Moment = "start",
	Sound = "UI SelectDеcoration",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "StirlingGenerator",
	Moment = "start",
	Sound = "Object StirlingGenerator Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "StirlingGenerator",
	Moment = "start",
	Sound = "UI SelectObject",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "StorageConcrete",
	Moment = "start",
	Sound = "Object StorageDepot Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "StorageConcrete",
	Moment = "start",
	Sound = "UI SelectObject",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "StorageElectronics",
	Moment = "start",
	Sound = "Object StorageDepot Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "StorageElectronics",
	Moment = "start",
	Sound = "UI SelectObject",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "StorageFood",
	Moment = "start",
	Sound = "Object StorageDepot Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "StorageFood",
	Moment = "start",
	Sound = "UI SelectObject",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "StorageFuel",
	Moment = "start",
	Sound = "Object StorageDepot Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "StorageFuel",
	Moment = "start",
	Sound = "UI SelectObject",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "StorageMachineParts",
	Moment = "start",
	Sound = "Object StorageDepot Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "StorageMachineParts",
	Moment = "start",
	Sound = "UI SelectObject",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "StorageMetals",
	Moment = "start",
	Sound = "Object StorageDepot Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "StorageMetals",
	Moment = "start",
	Sound = "UI SelectObject",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "StorageMysteryResource",
	Moment = "start",
	Sound = "Object StorageDepot Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "StoragePolymers",
	Moment = "start",
	Sound = "Object StorageDepot Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "StoragePolymers",
	Moment = "start",
	Sound = "UI SelectObject",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "StorageRareMetals",
	Moment = "start",
	Sound = "Object StorageDepot Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "StorageRareMetals",
	Moment = "start",
	Sound = "UI SelectObject",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "SubsurfaceHeater",
	Moment = "start",
	Sound = "Object SubsurfaceHeater Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "SubsurfaceHeater",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "TaiChiGarden",
	Moment = "start",
	Sound = "Building TaiChiGarden Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "TaiChiGarden",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "Temple",
	Moment = "start",
	Sound = "Building TempleSpire Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "Temple",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "TheExcavator",
	Moment = "start",
	Sound = "Object Excavator Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "TheExcavator",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "TriboelectricScrubber",
	Moment = "start",
	Sound = "Object TriboelectricScrubber Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "TriboelectricScrubber",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "Tunnel",
	Moment = "start",
	Sound = "Object Tunnel Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "Tunnel",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "UniversalStorageDepot",
	Moment = "start",
	Sound = "Object StorageDepot Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "UniversalStorageDepot",
	Moment = "start",
	Sound = "UI SelectObject",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "VRWorkshop",
	Moment = "start",
	Sound = "Building WorkshopVR Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "VRWorkshop",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "WasteRockProcessor",
	Moment = "start",
	Sound = "Object WasteRockProcessor Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "WasteRockProcessor",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "WaterExtractor",
	Moment = "start",
	Sound = "Object WaterExtractor Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "WaterExtractor",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "WaterReclamationSystem",
	Moment = "start",
	Sound = "Building WaterReclamation Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "WaterReclamationSystem",
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "WaterTank",
	Moment = "start",
	Sound = "Object WaterTower Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "WaterTank",
	Moment = "start",
	Sound = "UI SelectObject",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "WindTurbine",
	Moment = "start",
	Sound = "Object WindTurbine Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "WindTurbine",
	Moment = "start",
	Sound = "UI SelectObject",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectedColonyParamsHover",
	Moment = "start",
	Sound = "UI ButtonHover",
	Source = "UI",
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

PlaceObj('ActionFXSound', {
	Action = "SensorTowerMeteorPos",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 200,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Object SensorTower Alert",
	handle = 1132182971,
})

PlaceObj('ActionFXObject', {
	Action = "ShowWorkRadius",
	Actor = "AttackRover",
	Attach = true,
	ColorModifier = -16711936,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexMovableRadius",
	ScaleMember = "GetSelectionRadiusScale",
	handle = 117100452,
})

PlaceObj('ActionFXObject', {
	Action = "ShowWorkRadius",
	Actor = "MirrorSphere",
	Attach = true,
	ColorModifier = -16711936,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeRadius",
	ScaleMember = "GetSelectionRadiusScale",
	handle = 495952139,
})

PlaceObj('ActionFXObject', {
	Action = "ShowWorkRadius",
	Actor = "Rover",
	Attach = true,
	ColorModifier = -16711936,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexMovableRadius",
	ScaleMember = "GetSelectionRadiusScale",
	handle = 1654975265,
})

PlaceObj('ActionFXSound', {
	Action = "ShuttleHubEnter",
	Actor = "Shuttle",
	Moment = "Hit",
	Sound = "Unit Shuttle LandHub",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "ShuttleHubEnter",
	Actor = "JumperShuttle",
	Moment = "end",
	Sound = "Unit ShuttleJumper LandHub",
	Source = "ActionPos",
	Target = "JumperShuttleHub",
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

PlaceObj('ActionFXSound', {
	Action = "ShuttleHubEnter",
	Actor = "JumperShuttle",
	Moment = "start",
	Sound = "Unit ShuttleJumper Land",
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

PlaceObj('ActionFXSound', {
	Action = "ShuttleHubEnter",
	Actor = "Shuttle",
	Moment = "start",
	Sound = "Unit Shuttle Land",
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

PlaceObj('ActionFXSound', {
	Action = "ShuttleHubExit",
	Actor = "Shuttle",
	Moment = "Hit",
	Sound = "Unit Shuttle Takeoff",
})

PlaceObj('ActionFXSound', {
	Action = "ShuttleHubExit",
	Actor = "JumperShuttle",
	Moment = "end",
	Sound = "Unit ShuttleJumper Takeoff",
})

PlaceObj('ActionFXSound', {
	Action = "ShuttleHubExit",
	Actor = "JumperShuttle",
	Moment = "start",
	Sound = "Unit ShuttleJumper TakeoffHub",
	Source = "ActionPos",
	Target = "JumperShuttleHub",
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

PlaceObj('ActionFXSound', {
	Action = "ShuttleHubExit",
	Actor = "Shuttle",
	Moment = "start",
	Sound = "Unit Shuttle TakeoffHub",
	Source = "ActionPos",
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

PlaceObj('ActionFXSound', {
	Action = "ShuttleLoad",
	Actor = "JumperShuttle",
	Moment = "start",
	Sound = "Unit ShuttleJumper CargoLoad",
	Source = "ActionPos",
	Target = "ignore",
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

PlaceObj('ActionFXSound', {
	Action = "ShuttleLoad",
	Actor = "Shuttle",
	Moment = "start",
	Sound = "Unit Shuttle CargoLoad",
	Source = "ActionPos",
	Target = "ignore",
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

PlaceObj('ActionFXSound', {
	Action = "ShuttleUnload",
	Actor = "JumperShuttle",
	Moment = "start",
	Sound = "Unit ShuttleJumper CargoUnload",
	Source = "ActionPos",
	Target = "ignore",
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

PlaceObj('ActionFXSound', {
	Action = "ShuttleUnload",
	Actor = "Shuttle",
	Moment = "start",
	Sound = "Unit Shuttle CargoUnload",
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "Building",
	Moment = "end",
	Sound = "UI RemoveRemains",
	Source = "UI",
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

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "MirrorSphere",
	Moment = "end",
	Sound = "Mystery Sphere Destruction",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "Passage",
	Moment = "end",
	Sound = "Object Passage Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "Sinkhole",
	Moment = "end",
	Sound = "Mystery Lights SinkholeDisappear",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "AdvancedStirlingGenerator",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
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

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "AlienDiggerMarker",
	Moment = "start",
	Sound = "Mystery AlienDigger Appear",
	Target = "ignore",
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

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "Apartments",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "Arcology",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "ArtWorkshop",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "ArtificialSun",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "AtomicBattery",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "AttackRover",
	Moment = "start",
	Sound = "Unit RoverAttack Complete",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "AutomaticMetalsExtractor",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "Battery_WaterFuelCell",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "BioroboticsWorkshop",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "CableConstructionSite",
	Moment = "start",
	Sound = "UI PlacePowerCables",
	Source = "UI",
	Target = "ElectricityGridElement",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "Casino Complex",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "CloningVats",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "ConcretePlant",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "ConstructionSite",
	Delay = 200,
	Moment = "start",
	Sound = "UI BuildCommence",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "ConstructionSite",
	Moment = "start",
	Sound = "UI PlaceBuildingGround",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "CorporateOffice",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "DefenceTower",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "Diner",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "DomeBasic",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "DomeDiamond",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "DomeGeoscape",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "DomeHexa",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "DomeMedium",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "DomeMega",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "DomeMegaTrigon",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "DomeMicro",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "DomeOval",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "DomeStar",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "DomeTrigon",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "Drone",
	Moment = "start",
	Sound = "Unit DroneLand Complete",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "DroneFactory",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "DroneHub",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
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

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "DustDevil1",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 2000,
	FadeOut = 2000,
	Moment = "start",
	Sound = "Ambience Disaster DustdevilLoop1",
	handle = 283131960,
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "DustDevil1",
	Moment = "start",
	Sound = "Ambience Disaster DustdevilStart",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "DustDevil1",
	Moment = "start",
	Sound = "Ambience Disaster DustdevilStartDebris",
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

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "DustDevil2",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 2000,
	FadeOut = 2000,
	Moment = "start",
	Sound = "Ambience Disaster DustdevilLoop2",
	handle = 543300648,
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "DustDevil2",
	Moment = "start",
	Sound = "Ambience Disaster DustdevilStart",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "DustDevil2",
	Moment = "start",
	Sound = "Ambience Disaster DustdevilStartDebris",
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

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "DustDevilMajor1",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 3000,
	FadeOut = 3000,
	Moment = "start",
	Sound = "Ambience Disaster DustdevilLoopMajor1",
	handle = 1392539587,
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "DustDevilMajor1",
	Moment = "start",
	Sound = "Ambience Disaster DustdevilStart",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "DustDevilMajor1",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 3000,
	FadeOut = 3000,
	Moment = "start",
	Sound = "Ambience Wind Sand 2",
	handle = 969037689,
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

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "DustDevilMajor2",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 3000,
	FadeOut = 3000,
	Moment = "start",
	Sound = "Ambience Disaster DustdevilLoopMajor2",
	handle = 1020709333,
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "DustDevilMajor2",
	Moment = "start",
	Sound = "Ambience Disaster DustdevilStart",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "DustDevilMajor2",
	Moment = "start",
	Sound = "Ambience Disaster DustdevilStartDebris",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "DustDevilMajor2",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 3000,
	FadeOut = 3000,
	Moment = "start",
	Sound = "Ambience Wind Sand 2",
	handle = 224796967,
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

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "ElectronicsFactory",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "ElectronicsFactory_Small",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "ExplorerRover",
	Moment = "start",
	Sound = "Unit RoverExplorer Complete",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "Farm",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "Firefly",
	Moment = "start",
	Sound = "Mystery Lights FireflyAppear",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "FlyingDrone",
	Moment = "start",
	Sound = "Unit DroneFly Complete",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "FuelFactory",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "FungalFarm",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "FusionReactor",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "GameDeveloper",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "GeoscapeDome",
	AttachToObj = true,
	Moment = "start",
	Sound = "Ambience WaterWaves 1",
	Spot = "Watersound1",
	SpotsPercent = 100,
	Target = "ignore",
	handle = 1923233861,
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "GeoscapeDome",
	AttachToObj = true,
	Moment = "start",
	Sound = "Ambience WaterWaves 2",
	Spot = "Watersound2",
	SpotsPercent = 100,
	Target = "ignore",
	handle = 1236759026,
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "GeoscapeDome",
	AttachToObj = true,
	Moment = "start",
	Sound = "Ambience WaterWaves 3",
	Spot = "Watersound3",
	SpotsPercent = 100,
	Target = "ignore",
	handle = 1560334841,
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "HydroponicFarm",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "Infirmary",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "JumperShuttle",
	Moment = "start",
	Sound = "Unit ShuttleJumper Complete",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "JumperShuttleHub",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "LandingPad",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "LargeWaterTank",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "LightTrap",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "LivingQuarters",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "LowGLab",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "MDSLaser",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "MOXIE",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "MachinePartsFactory",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "MachinePartsFactory_Small",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "MartianUniversity",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "MechanizedDepotConcrete",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "MechanizedDepotElectronics",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "MechanizedDepotFood",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "MechanizedDepotFuel",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "MechanizedDepotMachineParts",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "MechanizedDepotMetals",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "MechanizedDepotMysteryResource",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "MechanizedDepotPolymers",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "MechanizedDepotRareMetals",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "MedicalCenter",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "MegaMall",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "MetalsExtractor",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "MetalsRefinery",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
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

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "MetatronIonStorm",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1000,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Mystery Metatron StormLoop",
	Target = "ignore",
	handle = 1761811611,
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "MetatronIonStorm",
	Moment = "start",
	Sound = "Mystery Metatron StormSpawn",
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "MirrorSphere",
	Moment = "start",
	Sound = "Mystery Sphere Appear",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "MoholeMine",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "MoistureVaporator",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "NetworkNode",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "Nursery",
	Moment = "start",
	Sound = "UI BuildComplete",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "Nursery",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "OmegaTelescope",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "OpenAirGym",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "OxygenTank",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "Passage",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "PassageRamp",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "PipeConstructionSite",
	Moment = "start",
	Sound = "UI PlacePipes",
	Source = "UI",
	Target = "LifeSupportGridElement",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "Playground",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "PolymerPlant",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "PowerDecoy",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "PowerSwitch",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "PreciousMetalsExtractor",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "ProjectMorpheus",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "RCConstructor",
	Moment = "start",
	Sound = "Unit RoverConstructor Complete",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "RCDriller",
	Moment = "start",
	Sound = "Unit RoverDriller Complete",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "RCHarvester",
	Moment = "start",
	Sound = "Unit RoverHarvester Complete",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "RCRover",
	Moment = "start",
	Sound = "Unit Rover Complete",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "RCSensor",
	Moment = "start",
	Sound = "Unit RoverSensor Complete",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "RCSolar",
	Moment = "start",
	Sound = "Unit RoverSolar Complete",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "RCTransport",
	Moment = "start",
	Sound = "Unit TransportRC Complete",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "RechargeStation",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "RegolithExtractor",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "ResearchLab",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "RocketLandingSite",
	Moment = "start",
	Sound = "Unit Rocket PlaceMarker",
	Source = "ActionPos",
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

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "Sanatorium",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "School",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "ScienceInstitute",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "SecurityStation",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "SensorTower",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "ShopsElectronics",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "ShopsFood",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "ShopsFood",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "ShopsJewelry",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "Shuttle",
	Moment = "start",
	Sound = "Unit Shuttle Complete",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "ShuttleHub",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
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

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "Sinkhole",
	Moment = "start",
	Sound = "Mystery Lights SinkholeAppear",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "SmartHome",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "SmartHome_Small",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "SmartHomes",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "SolarArray",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "SolarPanel",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "SolarPanelBig",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "SpaceElevator",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "Spacebar",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "Spacebar_Small",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "Spaceport",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "StirlingGenerator",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "StorageConcrete",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "StorageElectronics",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "StorageFood",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "StorageFuel",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "StorageMachineParts",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "StorageMetals",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "StorageMysteryResource",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "StoragePolymers",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "StorageRareMetals",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "SubsurfaceHeater",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "TaiChiGarden",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "Temple",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "TheExcavator",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "TriboelectricScrubber",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "UniversalStorageDepot",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "VRWorkshop",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "WasteRockProcessor",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "WaterExtractor",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "WaterReclamationSystem",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "WaterTank",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "WindTurbine",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SpeedControlMouseOver",
	Moment = "start",
	Sound = "UI ButtonHover",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "StartGameButtonClick",
	Moment = "start",
	Sound = "UI ButtonGeneralClickIn",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "StartGameButtonClick",
	Moment = "start",
	Sound = "UI LaunchMission",
	Source = "UI",
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

PlaceObj('ActionFXSound', {
	Action = "StirlingGenerator",
	Actor = "AdvancedStirlingGenerator",
	Delay = 250,
	Moment = "close_start",
	Sound = "Object StirlingGeneratorAdv Close",
})

PlaceObj('ActionFXSound', {
	Action = "StirlingGenerator",
	Actor = "AdvancedStirlingGenerator",
	AttachToObj = true,
	Delay = 500,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndAction', "StirlingGenerator",
			'EndMoment', "open_start",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndAction', "Working",
			'EndMoment', "end",
		}),
	},
	FadeIn = 3000,
	FadeOut = 5000,
	Moment = "close_start",
	Sound = "Object StirlingGeneratorAdv LoopClosed",
	handle = 549121062,
})

PlaceObj('ActionFXSound', {
	Action = "StirlingGenerator",
	Actor = "StirlingGenerator",
	Delay = 250,
	Moment = "close_start",
	Sound = "Object StirlingGenerator Close",
})

PlaceObj('ActionFXSound', {
	Action = "StirlingGenerator",
	Actor = "StirlingGenerator",
	AttachToObj = true,
	Delay = 50,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndAction', "StirlingGenerator",
			'EndMoment', "open_start",
		}),
	},
	FadeIn = 3000,
	FadeOut = 5000,
	Moment = "close_start",
	Sound = "Object StirlingGenerator LoopClosed",
	handle = 1366947611,
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

PlaceObj('ActionFXSound', {
	Action = "StirlingGenerator",
	Actor = "AdvancedStirlingGenerator",
	Moment = "open_start",
	Sound = "Object 0 Pressure",
})

PlaceObj('ActionFXSound', {
	Action = "StirlingGenerator",
	Actor = "AdvancedStirlingGenerator",
	AttachToObj = true,
	Delay = 500,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndAction', "StirlingGenerator",
			'EndMoment', "close_start",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndAction', "Working",
			'EndMoment', "end",
		}),
	},
	FadeIn = 3000,
	FadeOut = 5000,
	Moment = "open_start",
	Sound = "Object StirlingGeneratorAdv LoopOpened",
	handle = 244904801,
})

PlaceObj('ActionFXSound', {
	Action = "StirlingGenerator",
	Actor = "AdvancedStirlingGenerator",
	Moment = "open_start",
	Sound = "Object StirlingGeneratorAdv Open",
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

PlaceObj('ActionFXSound', {
	Action = "StirlingGenerator",
	Actor = "StirlingGenerator",
	Moment = "open_start",
	Sound = "Object 0 Pressure",
})

PlaceObj('ActionFXSound', {
	Action = "StirlingGenerator",
	Actor = "StirlingGenerator",
	AttachToObj = true,
	Delay = 500,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndAction', "StirlingGenerator",
			'EndMoment', "close_start",
		}),
	},
	FadeIn = 3000,
	FadeOut = 5000,
	Moment = "open_start",
	Sound = "Object StirlingGenerator LoopOpened",
	handle = 616618472,
})

PlaceObj('ActionFXSound', {
	Action = "StirlingGenerator",
	Actor = "StirlingGenerator",
	Moment = "open_start",
	Sound = "Object StirlingGenerator Open",
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

PlaceObj('ActionFXSound', {
	Action = "Suspended",
	Moment = "start",
	Sound = "Ambience Disaster DustelectricSurge",
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "Suspended",
	Moment = "start",
	Sound = "Ambience ThunderDistant 3",
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "Suspended",
	Moment = "start",
	Sound = "Ambience ThunderDistant 4",
	Source = "ActionPos",
	Target = "ignore",
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

PlaceObj('ActionFXSound', {
	Action = "TakeOff",
	Actor = "JumperShuttle",
	Moment = "start",
	Sound = "Unit ShuttleJumper Takeoff",
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

PlaceObj('ActionFXSound', {
	Action = "TakeOff",
	Actor = "MirrorSphere",
	Moment = "start",
	Sound = "Mystery Sphere Takeoff",
	Target = "ignore",
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

PlaceObj('ActionFXSound', {
	Action = "TakeOff",
	Actor = "Shuttle",
	Moment = "start",
	Sound = "Unit Shuttle Takeoff",
})

PlaceObj('ActionFXSound', {
	Action = "TechFieldMouseIn",
	Moment = "start",
	Sound = "UI MenuResearchRowHover",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "TechMouseIn",
	Moment = "start",
	Sound = "UI MenuResearchItemHover",
	Source = "UI",
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

PlaceObj('ActionFXSound', {
	Action = "Trap",
	Actor = "LightTrap",
	Delay = 1000,
	Moment = "start",
	Sound = "Object LightTrap Trap",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "Trap",
	Actor = "LightTrap",
	Delay = 1200,
	Moment = "start",
	Sound = "Object LightTrap TrapGlow",
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

PlaceObj('ActionFXSound', {
	Action = "TurnToDepositComplete",
	Actor = "MirrorSphere",
	Moment = "start",
	Sound = "Mystery Sphere TransformComplete",
	Target = "PowerDecoy",
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

PlaceObj('ActionFXSound', {
	Action = "TurnToMetal",
	Actor = "MirrorSphere",
	Moment = "start",
	Sound = "Mystery Sphere Transform",
	Target = "PowerDecoy",
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

PlaceObj('ActionFXSound', {
	Action = "TurnToPolymer",
	Actor = "MirrorSphere",
	Moment = "start",
	Sound = "Mystery Sphere Transform",
	Target = "PowerDecoy",
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

PlaceObj('ActionFXSound', {
	Action = "TurnToPreciousMetal",
	Actor = "MirrorSphere",
	Moment = "start",
	Sound = "Mystery Sphere Transform",
	Target = "PowerDecoy",
})

PlaceObj('ActionFXSound', {
	Action = "UIButtonMouseIn",
	Moment = "start",
	Sound = "UI ButtonHover",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "UIButtonPressed",
	Actor = "Button",
	Moment = "start",
	Sound = "UI ButtonConfirm",
	Source = "UI",
	Target = "idCategory10",
})

PlaceObj('ActionFXSound', {
	Action = "UIButtonPressed",
	Actor = "Button",
	Moment = "start",
	Sound = "UI ButtonConfirm",
	Source = "UI",
	Target = "idCategory11",
})

PlaceObj('ActionFXSound', {
	Action = "UIButtonPressed",
	Actor = "Button",
	Moment = "start",
	Sound = "UI ButtonConfirm",
	Source = "UI",
	Target = "idCategory1",
})

PlaceObj('ActionFXSound', {
	Action = "UIButtonPressed",
	Actor = "Button",
	Moment = "start",
	Sound = "UI ButtonConfirm",
	Source = "UI",
	Target = "idCategory2",
})

PlaceObj('ActionFXSound', {
	Action = "UIButtonPressed",
	Actor = "Button",
	Moment = "start",
	Sound = "UI ButtonConfirm",
	Source = "UI",
	Target = "idCategory3",
})

PlaceObj('ActionFXSound', {
	Action = "UIButtonPressed",
	Actor = "Button",
	Moment = "start",
	Sound = "UI ButtonConfirm",
	Source = "UI",
	Target = "idCategory4",
})

PlaceObj('ActionFXSound', {
	Action = "UIButtonPressed",
	Actor = "Button",
	Moment = "start",
	Sound = "UI ButtonConfirm",
	Source = "UI",
	Target = "idCategory5",
})

PlaceObj('ActionFXSound', {
	Action = "UIButtonPressed",
	Actor = "Button",
	Moment = "start",
	Sound = "UI ButtonConfirm",
	Source = "UI",
	Target = "idCategory6",
})

PlaceObj('ActionFXSound', {
	Action = "UIButtonPressed",
	Actor = "Button",
	Moment = "start",
	Sound = "UI ButtonConfirm",
	Source = "UI",
	Target = "idCategory7",
})

PlaceObj('ActionFXSound', {
	Action = "UIButtonPressed",
	Actor = "Button",
	Moment = "start",
	Sound = "UI ButtonConfirm",
	Source = "UI",
	Target = "idCategory8",
})

PlaceObj('ActionFXSound', {
	Action = "UIButtonPressed",
	Actor = "Button",
	Moment = "start",
	Sound = "UI ButtonConfirm",
	Source = "UI",
	Target = "idCategory9",
})

PlaceObj('ActionFXSound', {
	Action = "UIDisabledButtonPressed",
	Moment = "start",
	Sound = "UI Forbidden",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "UIInfoPanelItemHover",
	Moment = "start",
	Sound = "UI ButtonHover",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "UINotification",
	Sound = "UI MenuNotificationGeneral",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "UINotificationAchievement",
	Moment = "start",
	Sound = "UI MenuNotificationAchievement",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "UINotificationAnomaly",
	Sound = "UI MenuNotificationAnomaly",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "UINotificationBreaktrough",
	Sound = "UI MenuNotificationResearch",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "UINotificationBuildingInactive",
	Sound = "UI MenuNotificationBuildingInactive",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "UINotificationColdWave",
	Sound = "UI MenuNotificationDisasterStart",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "UINotificationColonistsDie",
	Sound = "UI MenuNotificationColonistsDie",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "UINotificationDustStorm",
	Sound = "UI MenuNotificationDisasterStart",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "UINotificationDustStormElectrostatic",
	Sound = "UI MenuNotificationDisasterStart",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "UINotificationDustStormGreat",
	Sound = "UI MenuNotificationDisasterStart",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "UINotificationFracturedDome",
	Sound = "UI MenuNotificationFracturedDome",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "UINotificationFunding",
	Sound = "UI MenuNotificationFunding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "UINotificationGoalCompleted",
	Sound = "UI MenuNotificationGoalCompleted",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "UINotificationMeteorStorm",
	Sound = "UI MenuNotificationDisasterStart",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "UINotificationNewColonists",
	Sound = "UI MenuNotificationColonistsArrived",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "UINotificationNoOxygen",
	Sound = "UI MenuNotificationNoOxygen",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "UINotificationNoPower",
	Sound = "UI MenuNotificationNoPower",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "UINotificationNoWater",
	Sound = "UI MenuNotificationNoWater",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "UINotificationResearchComplete",
	Sound = "UI MenuNotificationResearch",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "UINotificationResource",
	Sound = "UI MenuNotificationResource",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "UINotificationTimer",
	Moment = "start",
	Sound = "UI MenuNotificationTimer",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "UIWorking",
	Moment = "end",
	Sound = "UI MenuTurnOFF",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "UIWorking",
	Moment = "start",
	Sound = "UI MenuTurnON",
	Source = "UI",
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

PlaceObj('ActionFXSound', {
	Action = "Unload",
	Actor = "RCConstructor",
	AttachToObj = true,
	Delay = 2000,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 2000,
	FadeOut = 2000,
	Moment = "start",
	Sound = "Unit RoverConstructor CargoLoop",
	Target = "ignore",
	handle = 1383739869,
})

PlaceObj('ActionFXSound', {
	Action = "Unload",
	Actor = "RCConstructor",
	Delay = 2000,
	Moment = "start",
	Sound = "Unit RoverConstructor CargoUnload",
	Target = "ignore",
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

PlaceObj('ActionFXSound', {
	Action = "Unload",
	Actor = "RCTransport",
	Moment = "start",
	Sound = "Unit TransportRC CargoUnload",
})

PlaceObj('ActionFXSound', {
	Action = "Unload",
	Actor = "RCTransport",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1000,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Unit TransportRC ExtractionLoop",
	handle = 464137758,
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

PlaceObj('ActionFXSound', {
	Action = "WarehouseBeamMovingVert",
	Actor = "WarehouseHoist",
	Moment = "end",
	Sound = "Object StorageCrane LiftStop",
})

PlaceObj('ActionFXSound', {
	Action = "WarehouseBeamMovingVert",
	Actor = "WarehouseHoist",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 150,
	FadeOut = 150,
	Moment = "start",
	Sound = "Object StorageCrane LiftLoop",
	handle = 1758113726,
})

PlaceObj('ActionFXSound', {
	Action = "WarehouseBeamMovingVert",
	Actor = "WarehouseHoist",
	Moment = "start",
	Sound = "Object StorageCrane LiftStart",
})

PlaceObj('ActionFXSound', {
	Action = "WarehouseCraneMovingHor",
	Actor = "WarehouseHoist",
	Moment = "end",
	Sound = "Object StorageCrane TransferStop",
})

PlaceObj('ActionFXSound', {
	Action = "WarehouseCraneMovingHor",
	Actor = "WarehouseHoist",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 300,
	FadeOut = 300,
	Moment = "start",
	Sound = "Object StorageCrane TransferLoop",
	handle = 1536806921,
})

PlaceObj('ActionFXSound', {
	Action = "WarehouseCraneMovingHor",
	Actor = "WarehouseHoist",
	Moment = "start",
	Sound = "Object StorageCrane TransferStart",
})

PlaceObj('ActionFXSound', {
	Action = "WarehouseHoistMovingHor",
	Actor = "WarehouseHoist",
	Moment = "end",
	Sound = "Object StorageCrane LiftStop",
})

PlaceObj('ActionFXSound', {
	Action = "WarehouseHoistMovingHor",
	Actor = "WarehouseHoist",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 150,
	FadeOut = 150,
	Moment = "start",
	Sound = "Object StorageCrane LiftLoop",
	handle = 247253050,
})

PlaceObj('ActionFXSound', {
	Action = "WarehouseHoistMovingHor",
	Actor = "WarehouseHoist",
	Moment = "start",
	Sound = "Object StorageCrane LiftStart",
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

PlaceObj('ActionFXSound', {
	Action = "WarmUp",
	Actor = "GeyserWarmup",
	Moment = "start",
	Sound = "Ambience Geyser Warmup",
	Target = "PrefabFeatureMarker",
})

PlaceObj('ActionFXSound', {
	Action = "WorkEmpty",
	Actor = "LightTrap",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 2000,
	FadeOut = 2000,
	Moment = "start",
	Sound = "Object LightTrap LoopEmpty",
	handle = 649546048,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "ArtificialSun",
	Moment = "end",
	Sound = "Object ArtificialSun LoopStop",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "AutomaticMetalsExtractor",
	Moment = "end",
	Sound = "Object MetalExtractorAuto LoopStop",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "Battery_WaterFuelCell",
	Moment = "end",
	Sound = "Object PowerAccumulator LoopStop",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "ConcretePlant",
	Moment = "end",
	Sound = "Object ConcretePlant LoopStop",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "DroneFactory",
	Moment = "end",
	Sound = "Object Workshop LoopStop",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "FuelFactory",
	Moment = "end",
	Sound = "Object FuelRefinery LoopStop",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "FungalFarm",
	Moment = "end",
	Sound = "Object FungalFarm LoopStop",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "FusionReactor",
	Moment = "end",
	Sound = "Object 0 Pressure",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "FusionReactor",
	Moment = "end",
	Sound = "Object FusionReactor LoopStop",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "HydroponicFarm",
	Moment = "end",
	Sound = "Building HydroponicFarm LoopStop",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "JumperShuttleHub",
	Moment = "end",
	Sound = "Object ShuttleHUBJumper LoopStop",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "LowGLab",
	Moment = "end",
	Sound = "Object Low-GLab LoopStop",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "MOXIE",
	Moment = "end",
	Sound = "Object 0 Pressure",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "MOXIE",
	Moment = "end",
	Sound = "Object MOXIE LoopStop",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "MetalsExtractor",
	Moment = "end",
	Sound = "Object MetalExtractor LoopStop",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "MetalsRefinery",
	Moment = "end",
	Sound = "Object MetalsRefinery LoopStop",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "MoholeMine",
	Moment = "end",
	Sound = "Object MoholeMine LoopStop",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "MoistureVaporator",
	Moment = "end",
	Sound = "Object MoistureVaporator LoopStop",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "OmegaTelescope",
	Moment = "end",
	Sound = "Object OmegaTelescope LoopStop",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "PolymerPlant",
	Moment = "end",
	Sound = "Object PolymerPlant LoopStop",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "PreciousMetalsExtractor",
	Delay = 1000,
	FadeIn = 1000,
	Moment = "end",
	Sound = "Object 0 Pressure",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "PreciousMetalsExtractor",
	Moment = "end",
	Sound = "Object PreciousExtractor LoopStop",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "ProjectMorpheus",
	Delay = 500,
	Moment = "end",
	Sound = "Object ProjectMorpheus LoopStop",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "RareMetalsRefinery",
	Moment = "end",
	Sound = "Object MetalsRefineryRare LoopStop",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "RegolithExtractor",
	Moment = "end",
	Sound = "Object RegolithExtractor LoopStop",
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

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "SolarPanel",
	Moment = "end",
	Sound = "Object SolarPanel Close",
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

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "SolarPanelBig",
	Moment = "end",
	Sound = "Object SolarPanelBig Close",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "SpaceElevator",
	Moment = "end",
	Sound = "Object SpaceElevator LoopStop",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "SubsurfaceHeater",
	Moment = "end",
	Sound = "Object 0 Pressure",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "SubsurfaceHeater",
	Moment = "end",
	Sound = "Object SubsurfaceHeater LoopStop",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "TheExcavator",
	Delay = 200,
	Moment = "end",
	Sound = "Object 0 Pressure",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "TheExcavator",
	Moment = "end",
	Sound = "Object Excavator LoopStop",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "TriboelectricScrubber",
	Moment = "end",
	Sound = "Object TriboelectricScrubber LoopStop",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "WasteRockProcessor",
	Moment = "end",
	Sound = "Object WasteRockProcessor LoopStop",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "WaterExtractor",
	Delay = 200,
	Moment = "end",
	Sound = "Object 0 Pressure",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "WaterExtractor",
	Moment = "end",
	Sound = "Object WaterExtractor LoopStop",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "WindTurbine",
	Moment = "end",
	Sound = "Object WindTurbine LoopStop",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "MOXIE",
	Moment = "hit-moment1",
	Sound = "Object MOXIE LoopPeaks",
	Target = "MoxiePump",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "MOXIE",
	Moment = "hit-moment1",
	Sound = "Object MOXIE LoopSteam",
	Target = "MoxiePump",
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

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "PreciousMetalsExtractor",
	Moment = "hit-moment1",
	Sound = "Object PreciousExtractor LoopPeaks",
	Target = "UniversalExtractorHammer",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "PreciousMetalsExtractor",
	Delay = 100,
	Moment = "hit-moment1",
	Sound = "Object PreciousExtractor LoopSmoke",
	Target = "UniversalExtractorHammer",
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
	Time = 5000,
	handle = 924651685,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "MOXIE",
	Moment = "hit-moment2",
	Sound = "Object MOXIE LoopPeaks",
	Target = "MoxiePump",
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

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "PreciousMetalsExtractor",
	Moment = "hit-moment2",
	Sound = "Object PreciousExtractor LoopPeaks",
	Target = "UniversalExtractorHammer",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "PreciousMetalsExtractor",
	Delay = 150,
	Moment = "hit-moment2",
	Sound = "Object PreciousExtractor LoopSmoke",
	Target = "UniversalExtractorHammer",
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
	Time = 5000,
	handle = 872033987,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "PreciousMetalsExtractor",
	Moment = "hit-moment3",
	Sound = "Object PreciousExtractor LoopPeaks",
	Target = "UniversalExtractorHammer",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "PreciousMetalsExtractor",
	Delay = 300,
	Moment = "hit-moment3",
	Sound = "Object PreciousExtractor LoopSmoke",
	Target = "UniversalExtractorHammer",
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
	Time = 5000,
	handle = 1980372174,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "PreciousMetalsExtractor",
	Moment = "hit-moment4",
	Sound = "Object PreciousExtractor LoopPeaks",
	Target = "UniversalExtractorHammer",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "PreciousMetalsExtractor",
	Delay = 500,
	Moment = "hit-moment4",
	Sound = "Object PreciousExtractor LoopSmoke",
	Target = "UniversalExtractorHammer",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "AdvancedStirlingGenerator",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndAction', "StirlingGenerator",
			'EndMoment', "open_start",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndAction', "Working",
			'EndMoment', "end",
		}),
	},
	FadeIn = 3000,
	FadeOut = 3000,
	Moment = "start",
	Sound = "Object StirlingGeneratorAdv LoopClosed",
	handle = 1313591657,
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

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "Arcology",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Building Arcology Loop",
	handle = 405613431,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "ArtWorkshop",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Building WorkshopArt Loop",
	handle = 16459394,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "ArtificialSun",
	Moment = "start",
	Sound = "Object ArtificialSun LoopStart",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "ArtificialSun",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 2000,
	FadeOut = 2000,
	Moment = "start",
	Sound = "Object ArtificialSun Loop",
	Target = "ignore",
	handle = 1639004563,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "AtomicBattery",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 1500,
	Moment = "start",
	Sound = "Object AtomicBattery Loop",
	handle = 1546384109,
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

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "AutomaticMetalsExtractor",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 1500,
	Moment = "start",
	Sound = "Object MetalExtractorAuto Loop",
	handle = 60739382,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "AutomaticMetalsExtractor",
	Moment = "start",
	Sound = "Object MetalExtractorAuto LoopStart",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "Battery_WaterFuelCell",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1000,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Object PowerAccumulator Loop",
	handle = 1005371745,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "Battery_WaterFuelCell",
	Moment = "start",
	Sound = "Object PowerAccumulator LoopStart",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "BioroboticsWorkshop",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Building WorkshopBiorobotics Loop",
	handle = 200791963,
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

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "BlackCubeMonolith",
	Moment = "start",
	Sound = "Mystery CubeStructure Appear",
	Target = "ignore",
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

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "BlackCubeStockpile",
	Moment = "start",
	Sound = "Mystery Cube Appear",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "Casino Complex",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1000,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Building Casino Loop",
	handle = 524590421,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "CloningVats",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Building CloningVats Loop",
	Target = "ignore",
	handle = 946878379,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "CloningVats",
	Moment = "start",
	Sound = "Building CloningVats LoopStart",
	Target = "ignore",
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

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "ConcretePlant",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 2000,
	FadeOut = 2000,
	Moment = "start",
	Sound = "Object ConcretePlant Loop",
	handle = 106003572,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "ConcretePlant",
	Moment = "start",
	Sound = "Object ConcretePlant LoopStart",
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

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "CorporateOffice",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Building CorporateOffice Loop",
	handle = 1559268601,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "Diner",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Building Diner Loop",
	handle = 2097489333,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "DomeBasic",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 1500,
	Moment = "start",
	Sound = "Building Dome Loop",
	handle = 1936463768,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "DomeGeoscape",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 1500,
	Moment = "start",
	Sound = "Building Dome Loop",
	handle = 1056223720,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "DomeMedium",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 1500,
	Moment = "start",
	Sound = "Building Dome Loop",
	handle = 418838988,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "DomeMega",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 1500,
	Moment = "start",
	Sound = "Building Dome Loop",
	handle = 1547690914,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "DomeOval",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 1500,
	Moment = "start",
	Sound = "Building Dome Loop",
	handle = 1241565250,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "DomeStar",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 1500,
	Moment = "start",
	Sound = "Building Dome Loop",
	handle = 1266483981,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "DroneFactory",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Object Workshop Loop",
	handle = 2085241972,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "DroneFactory",
	Moment = "start",
	Sound = "Object Workshop LoopStart",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "DroneHub",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 800,
	FadeOut = 800,
	Moment = "start",
	Sound = "Object DroneHUB Loop",
	handle = 1220875612,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "ElectricityGridElement",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "ElectronicsFactory",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Building ElectronicsFactory Loop",
	handle = 392851374,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "ElectronicsFactory_Small",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Building ElectronicsFactorySmall Loop",
	handle = 1221558095,
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "Farm",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 500,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Building Farm Loop",
	Target = "ignore",
	handle = 2138914827,
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

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "FountainLarge",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 2000,
	FadeOut = 2000,
	Moment = "start",
	Sound = "Object Fountain2 Loop1",
	Target = "GardenFountains_03",
	handle = 1178069867,
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

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "FountainSmall",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 2000,
	FadeOut = 2000,
	Moment = "start",
	Sound = "Object Fountain1 Loop1",
	Target = "GardenFountains_01",
	handle = 800305902,
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

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "FountainSmall",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 2000,
	FadeOut = 2000,
	Moment = "start",
	Sound = "Object Fountain1 Loop2",
	Target = "GardenFountains_02",
	handle = 616742763,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "FuelFactory",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 2000,
	FadeOut = 2000,
	Moment = "start",
	Sound = "Object FuelRefinery Loop",
	handle = 1642734048,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "FuelFactory",
	Moment = "start",
	Sound = "Object FuelRefinery LoopStart",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "FungalFarm",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 500,
	FadeOut = 1500,
	Moment = "start",
	Sound = "Object FungalFarm Loop",
	Target = "ignore",
	handle = 1073484892,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "FungalFarm",
	Moment = "start",
	Sound = "Object FungalFarm LoopStart",
	Target = "ignore",
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

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "FusionReactor",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1000,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Object FusionReactor Loop",
	handle = 271657131,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "FusionReactor",
	Moment = "start",
	Sound = "Object FusionReactor LoopStart",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "GameDeveloper",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Building GameDeveloper Loop",
	handle = 1210720012,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "GardenFountains_02",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 2000,
	FadeOut = 2000,
	Moment = "start",
	Sound = "Object Fountain2 Loop1",
	Target = "ignore",
	handle = 270594039,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "GardenFountains_03",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 2000,
	FadeOut = 2000,
	Moment = "start",
	Sound = "Object Fountain3 Loop",
	Target = "ignore",
	handle = 2083700414,
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

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "HangingGardens",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 3000,
	FadeOut = 3000,
	Moment = "start",
	Sound = "Building HangingGardens Loop",
	Target = "ignore",
	handle = 1492822796,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "HydroponicFarm",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 2000,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Building HydroponicFarm Loop",
	Target = "ignore",
	handle = 260845119,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "HydroponicFarm",
	Moment = "start",
	Sound = "Building HydroponicFarm LoopStart",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "Infirmary",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Building Infirmary Loop",
	handle = 1871390835,
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

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "JumperShuttleHub",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Object ShuttleHUBJumper Loop",
	handle = 1312646563,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "JumperShuttleHub",
	Moment = "start",
	Sound = "Object ShuttleHUBJumper LoopStart",
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

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "LifeSupportGridElement",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
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

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "LowGLab",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 1500,
	Moment = "start",
	Sound = "Object Low-GLab Loop",
	handle = 1747840066,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "LowGLab",
	Moment = "start",
	Sound = "Object Low-GLab LoopStart",
})

PlaceObj('ActionFXRemove', {
	Action = "Working",
	Actor = "MOXIE",
	FxId = "MoxieSmoke",
	Moment = "start",
	Target = "MoxieCP3Pump",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "MOXIE",
	Moment = "start",
	Sound = "Object 0 Pressure",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "MOXIE",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 500,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Object MOXIE Loop",
	handle = 1614902570,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "MOXIE",
	Moment = "start",
	Sound = "Object MOXIE LoopStart",
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

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "MachinePartsFactory",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 1500,
	Moment = "start",
	Sound = "Building MachinepartsFactory Loop",
	handle = 1377764503,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "MachinePartsFactory_Small",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 1500,
	Moment = "start",
	Sound = "Building MachinepartsFactorySmall Loop",
	handle = 1010761975,
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "MartianUniversity",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 500,
	FadeOut = 500,
	Moment = "start",
	Sound = "Building MartianUni LoopEmpty",
	handle = 1845930611,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "MedicalCenter",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1000,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Building MedicalCenter Loop",
	handle = 58208066,
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

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "MegaMall",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 500,
	FadeOut = 500,
	Moment = "start",
	Sound = "Building Megamall LoopEmpty",
	handle = 2123682085,
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

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "MetalsExtractor",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 300,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Object MetalExtractor Loop",
	handle = 1631595651,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "MetalsExtractor",
	Moment = "start",
	Sound = "Object MetalExtractor LoopStart",
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

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "MetalsRefinery",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 2000,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Object MetalsRefinery Loop",
	handle = 971998453,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "MetalsRefinery",
	Moment = "start",
	Sound = "Object MetalsRefinery LoopStart",
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

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "MoholeMine",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 3000,
	FadeOut = 1500,
	Moment = "start",
	Sound = "Object MoholeMine Loop",
	handle = 875359888,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "MoholeMine",
	Moment = "start",
	Sound = "Object MoholeMine LoopStart",
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

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "MoistureVaporator",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 500,
	FadeOut = 700,
	Moment = "start",
	Sound = "Object MoistureVaporator Loop",
	Target = "ignore",
	handle = 1619884769,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "MoistureVaporator",
	Moment = "start",
	Sound = "Object MoistureVaporator LoopStart",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "NetworkNode",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 1500,
	Moment = "start",
	Sound = "Building NetworkNode Loop",
	handle = 941981044,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "NetworkNode",
	FadeIn = 2000,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Building NetworkNode LoopStart",
	handle = 847278900,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "Nursery",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 500,
	FadeOut = 500,
	Moment = "start",
	Sound = "Building Nurcery LoopEmpty",
	handle = 2066254566,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "OmegaTelescope",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 2500,
	FadeOut = 2500,
	Moment = "start",
	Sound = "Object OmegaTelescope Loop",
	handle = 12239702,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "OmegaTelescope",
	Moment = "start",
	Sound = "Object OmegaTelescope LoopStart",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "OpenAirGym",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 500,
	FadeOut = 500,
	Moment = "start",
	Sound = "Building OpenAirGym LoopEmpty",
	handle = 431559711,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "OrbitalProbe",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Sound = "UI OrbitalProbe",
	Source = "UI",
	Target = "ignore",
	handle = 175130125,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "OrbitalProbe",
	Moment = "start",
	Sound = "UI OrbitalProbeScanStart",
	Source = "UI",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "OxygenTank",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 500,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Object AirStorage Loop",
	handle = 567147716,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "Passage",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 1500,
	Moment = "start",
	Sound = "Object Passage Loop",
	Target = "PassageEntrance",
	handle = 856355196,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "Playground",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 500,
	FadeOut = 500,
	Moment = "start",
	Sound = "Building Playground LoopEmpty",
	handle = 563803895,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "PolymerPlant",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Object PolymerPlant Loop",
	Target = "ignore",
	handle = 381984652,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "PolymerPlant",
	Moment = "start",
	Sound = "Object PolymerPlant LoopStart",
	Target = "ignore",
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
	handle = 1468021056,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "PreciousMetalsExtractor",
	Moment = "start",
	Sound = "Object 0 Pressure",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "PreciousMetalsExtractor",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 500,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Object PreciousExtractor Loop",
	Target = "ignore",
	handle = 548090264,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "PreciousMetalsExtractor",
	Moment = "start",
	Sound = "Object PreciousExtractor LoopStart",
	Target = "ignore",
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

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "ProjectMorpheus",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 1500,
	Moment = "start",
	Sound = "Object ProjectMorpheus Loop",
	handle = 1154878999,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "ProjectMorpheus",
	Delay = 500,
	Moment = "start",
	Sound = "Object ProjectMorpheus LoopStart",
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

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "RareMetalsRefinery",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 2000,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Object MetalsRefineryRare Loop",
	handle = 1378997954,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "RareMetalsRefinery",
	Moment = "start",
	Sound = "Object MetalsRefineryRare LoopStart",
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

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "RegolithExtractor",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndAction', "Working",
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 1500,
	Moment = "start",
	Sound = "Object RegolithExtractor Loop",
	handle = 157643498,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "RegolithExtractor",
	Moment = "start",
	Sound = "Object RegolithExtractor LoopStart",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "ResearchLab",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1000,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Building ResearchLab Loop",
	handle = 1832133116,
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

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "Sanatorium",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 1500,
	Moment = "start",
	Sound = "Building Sanatorium Loop",
	handle = 218806152,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "School",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 500,
	FadeOut = 500,
	Moment = "start",
	Sound = "Building School LoopEmpty",
	handle = 1294901360,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "ScienceInstitute",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1000,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Building ScienceInstitute Loop",
	handle = 505033540,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "SecurityStation",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Building SecurityStation Loop",
	handle = 225258666,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "SecurityStation",
	Moment = "start",
	Sound = "Building SecurityStation LoopStart",
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

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "SensorTower",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1000,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Object SensorTower Loop",
	handle = 1901121223,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "ShopsElectronics",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1000,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Building ElectronicsStore Loop",
	handle = 1551150179,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "ShopsFood",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 500,
	FadeOut = 500,
	Moment = "start",
	Sound = "Building Grocery Loop",
	handle = 34448065,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "ShopsJewelry",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 500,
	FadeOut = 500,
	Moment = "start",
	Sound = "Building Jewelry Loop",
	handle = 1935486087,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "ShuttleHub",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 800,
	FadeOut = 800,
	Moment = "start",
	Sound = "Object ShuttleHUB Loop",
	handle = 667733682,
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

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "SolarPanel",
	Delay = 400,
	Moment = "start",
	Sound = "Object SolarPanel Open",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "SolarPanel",
	Delay = 7000,
	Moment = "start",
	Sound = "Object SolarPanel Rotate",
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

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "SolarPanelBig",
	Delay = 600,
	Moment = "start",
	Sound = "Object SolarPanelBig Open",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "SolarPanelBig",
	Delay = 7000,
	Moment = "start",
	Sound = "Object SolarPanelBig Rotate",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "SpaceElevator",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 2000,
	FadeOut = 2000,
	Moment = "start",
	Sound = "Object SpaceElevator Loop",
	handle = 1681255522,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "SpaceElevator",
	Moment = "start",
	Sound = "Object SpaceElevator LoopStart",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "Spacebar",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 500,
	FadeOut = 500,
	Moment = "start",
	Sound = "Building Spacebar Loop",
	handle = 962530366,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "Spacebar_Small",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 500,
	FadeOut = 500,
	Moment = "start",
	Sound = "Building SpacebarSmall Loop",
	handle = 1600812945,
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "Spaceport",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1000,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Object Spaceport Loop",
	handle = 2016432117,
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

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "StirlingGenerator",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndAction', "StirlingGenerator",
			'EndMoment', "open_start",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndAction', "Working",
			'EndMoment', "end",
		}),
	},
	FadeIn = 3000,
	FadeOut = 3000,
	Moment = "start",
	Sound = "Object StirlingGeneratorAdv LoopClosed",
	handle = 722618436,
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

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "SubsurfaceHeater",
	Moment = "start",
	Sound = "Object 0 Pressure",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "SubsurfaceHeater",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Object SubsurfaceHeater Loop",
	handle = 1854610957,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "SubsurfaceHeater",
	Moment = "start",
	Sound = "Object SubsurfaceHeater LoopStart",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "TaiChiGarden",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Sound = "Building TaiChiGarden Loop",
	handle = 724460519,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "Temple",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Building TempleSpire Loop",
	handle = 726503186,
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

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "TheExcavator",
	Delay = 200,
	Moment = "start",
	Sound = "Object 0 Pressure",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "TheExcavator",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 2000,
	FadeOut = 3000,
	Moment = "start",
	Sound = "Object Excavator Loop",
	Target = "ignore",
	handle = 252746067,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "TheExcavator",
	Moment = "start",
	Sound = "Object Excavator LoopStart",
	Target = "ignore",
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

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "TriboelectricScrubber",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Object TriboelectricScrubber Loop",
	Target = "ignore",
	handle = 844959039,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "TriboelectricScrubber",
	Moment = "start",
	Sound = "Object TriboelectricScrubber LoopStart",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "VRWorkshop",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Building WorkshopVR Loop",
	handle = 1436077299,
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

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "WasteRockProcessor",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1000,
	FadeOut = 1500,
	Moment = "start",
	Sound = "Object WasteRockProcessor Loop",
	handle = 342910123,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "WasteRockProcessor",
	Moment = "start",
	Sound = "Object WasteRockProcessor LoopStart",
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

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "WaterExtractor",
	Delay = 100,
	Moment = "start",
	Sound = "Object 0 Pressure",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "WaterExtractor",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1000,
	FadeOut = 1500,
	Moment = "start",
	Sound = "Object WaterExtractor Loop",
	handle = 1547987038,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "WaterExtractor",
	Moment = "start",
	Sound = "Object WaterExtractor LoopStart",
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

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "WaterReclamationSystem",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 2000,
	FadeOut = 2000,
	Moment = "start",
	Sound = "Building WaterReclamation Loop",
	Target = "ignore",
	handle = 1470749492,
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

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "WindTurbine",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 500,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Object WindTurbine Loop",
	handle = 535291597,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "WindTurbine",
	Moment = "start",
	Sound = "Object WindTurbine LoopStart",
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

PlaceObj('ActionFXSound', {
	Action = "hum_extreme",
	Actor = "MirrorSphere",
	AttachToObj = true,
	Moment = "end",
	Sound = "Mystery Sphere Split",
})

PlaceObj('ActionFXSound', {
	Action = "hum_extreme",
	Actor = "MirrorSphere",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 1500,
	Moment = "start",
	Sound = "Mystery Sphere Hum-extreme",
	handle = 1936935475,
})

PlaceObj('ActionFXSound', {
	Action = "hum_high",
	Actor = "MirrorSphere",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 1500,
	Moment = "start",
	Sound = "Mystery Sphere Hum-high",
	handle = 471415642,
})

PlaceObj('ActionFXSound', {
	Action = "hum_low",
	Actor = "MirrorSphere",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 1500,
	Moment = "start",
	Sound = "Mystery Sphere Hum-low",
	handle = 256978378,
})

PlaceObj('ActionFXSound', {
	Action = "hum_medium",
	Actor = "MirrorSphere",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 1500,
	Moment = "start",
	Sound = "Mystery Sphere Hum-medium",
	handle = 167437780,
})

PlaceObj('ActionFXSound', {
	Action = "hum_none",
	Actor = "MirrorSphere",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 1500,
	Moment = "start",
	Sound = "Mystery Sphere Hum-none",
	handle = 1029074439,
})

PlaceObj('ActionFXSound', {
	Action = "working",
	Actor = "WaterExtractor",
	Delay = 2000,
	Moment = "Hit",
	Sound = "Object WaterExtractor LoopPeaks",
})

PlaceObj('ActionFXSound', {
	Action = "working",
	Actor = "WaterExtractor",
	Delay = 3000,
	FadeIn = 500,
	Moment = "Hit",
	Sound = "Object WaterExtractor LoopPeaks",
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

PlaceObj('ActionFXObject', {
	Action = "ConstructionCursor",
	Attach = true,
	ColorModifier = -16711936,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
	Target = "AdvancedStirlingGenerator",
})

PlaceObj('ActionFXObject', {
	Action = "ConstructionCursor",
	Attach = true,
	ColorModifier = -16711936,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
	Target = "ArtificialSun",
})

PlaceObj('ActionFXObject', {
	Action = "ConstructionCursor",
	Attach = true,
	ColorModifier = -16711936,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
	Target = "AutomaticMetalsExtractor",
})

PlaceObj('ActionFXObject', {
	Action = "ConstructionCursor",
	Attach = true,
	ColorModifier = -16711936,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
	Target = "Dome",
})

PlaceObj('ActionFXObject', {
	Action = "ConstructionCursor",
	Attach = true,
	ColorModifier = -16711936,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
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
	Particles = "Selection_Building_Area",
	ScaleMember = "GetSelectionRadiusScale",
	Spot = "Center",
	Target = "DroneHub",
})

PlaceObj('ActionFXObject', {
	Action = "ConstructionCursor",
	Attach = true,
	ColorModifier = -16711936,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
	Target = "MDSLaser",
})

PlaceObj('ActionFXObject', {
	Action = "ConstructionCursor",
	Attach = true,
	ColorModifier = -16711936,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
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
	Target = "MetalsExtractor",
})

PlaceObj('ActionFXObject', {
	Action = "ConstructionCursor",
	Attach = true,
	ColorModifier = -16711936,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
	Target = "MoholeMine",
})

PlaceObj('ActionFXObject', {
	Action = "ConstructionCursor",
	Attach = true,
	ColorModifier = -16711936,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
	Target = "MoistureVaporator",
})

PlaceObj('ActionFXObject', {
	Action = "ConstructionCursor",
	Attach = true,
	ColorModifier = -16711936,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeRadius",
	ScaleMember = "GetSelectionRadiusScale",
	Target = "OrbitalProbe",
})

PlaceObj('ActionFXObject', {
	Action = "ConstructionCursor",
	Attach = true,
	ColorModifier = -16711936,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
	Target = "PreciousMetalsExtractor",
})

PlaceObj('ActionFXObject', {
	Action = "ConstructionCursor",
	Attach = true,
	ColorModifier = -16711936,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
	Target = "RocketLandingSite",
})

PlaceObj('ActionFXObject', {
	Action = "ConstructionCursor",
	Attach = true,
	ColorModifier = -16711936,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
	Target = "SensorTower",
})

PlaceObj('ActionFXObject', {
	Action = "ConstructionCursor",
	Attach = true,
	ColorModifier = -16711936,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
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
	Target = "SubsurfaceHeater",
})

PlaceObj('ActionFXObject', {
	Action = "ConstructionCursor",
	Attach = true,
	ColorModifier = -16711936,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
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
	Target = "TriboelectricScrubber",
})

PlaceObj('ActionFXObject', {
	Action = "ConstructionCursor",
	Attach = true,
	ColorModifier = -16711936,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
	Target = "WaterExtractor",
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

PlaceObj('ActionFXObject', {
	Action = "ConstructionCursor",
	Attach = true,
	ColorModifier = -16711936,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
	Target = "Workshop",
})

PlaceObj('ActionFXSound', {
	Action = "ContainFireflies",
	Actor = "LightTrap",
	AttachToObj = true,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndAction', "ContainFireflies",
			'EndMoment', "start",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndAction', "Working",
			'EndMoment', "end",
		}),
	},
	FadeIn = 2000,
	FadeOut = 2000,
	Moment = "end",
	Sound = "Object LightTrap LoopEmpty",
	handle = 1372520554,
})

PlaceObj('ActionFXSound', {
	Action = "DoorClose",
	Actor = "DomeDoorEntrance_02",
	Disabled = true,
	Moment = "start",
	Sound = "Building Dome DoorClose",
})

PlaceObj('ActionFXSound', {
	Action = "DoorClose",
	Actor = "DomeDoorExit_02",
	Disabled = true,
	Moment = "start",
	Sound = "Building Dome DoorClose",
})

PlaceObj('ActionFXSound', {
	Action = "DoorOpen",
	Actor = "DomeDoorEntrance_02",
	Disabled = true,
	Moment = "start",
	Sound = "Building Dome DoorOpen",
})

PlaceObj('ActionFXSound', {
	Action = "DoorOpen",
	Actor = "DomeDoorExit_02",
	Disabled = true,
	Moment = "start",
	Sound = "Building Dome DoorOpen",
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
	handle = 556713359,
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
	handle = 196436419,
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
	handle = 313655416,
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
	handle = 1802703129,
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "EmergencyPower",
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 100,
	FadeOut = 100,
	Moment = "start",
	Sound = "UI AlertEmergencyPower",
	Source = "UI",
	handle = 2113700352,
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
	handle = 302154262,
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
	handle = 1372784935,
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

PlaceObj('ActionFXSound', {
	Action = "NoBattery",
	Actor = "RCExplorer",
	Disabled = true,
	Moment = "start",
	Sound = "Unit RoverExplorer Fail",
})

PlaceObj('ActionFXSound', {
	Action = "NoBattery",
	Actor = "RCRover",
	Disabled = true,
	Moment = "start",
	Sound = "Unit Rover Fail",
})

PlaceObj('ActionFXSound', {
	Action = "NoBattery",
	Actor = "RCTransport",
	Disabled = true,
	Moment = "start",
	Sound = "Unit TransportRC Fail",
})

PlaceObj('ActionFXObject', {
	Action = "Overlays",
	Actor = "DroneHub",
	Attach = true,
	ColorModifier = -16711936,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
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

PlaceObj('ActionFXSound', {
	Action = "RegolithExtractorDigging",
	Actor = "RegolithExtractorDigger",
	Disabled = true,
	Moment = "digEnd",
	Sound = "Object RegolithExtractor LoopStop",
})

PlaceObj('ActionFXSound', {
	Action = "RegolithExtractorDigging",
	Actor = "RegolithExtractorDigger",
	AttachToObj = true,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndAction', "RegolithExtractorDigging",
			'EndMoment', "enter",
		}),
	},
	FadeIn = 1000,
	FadeOut = 1000,
	Moment = "exit",
	Sound = "Object RegolithExtractor Loop",
	handle = 1331119746,
})

PlaceObj('ActionFXSound', {
	Action = "RegolithExtractorDigging",
	Actor = "RegolithExtractorDigger",
	Disabled = true,
	Moment = "exit",
	Sound = "Object RegolithExtractor LoopStart",
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

PlaceObj('ActionFXSound', {
	Action = "RocketLand",
	Actor = "FXRocket",
	Disabled = true,
	FadeIn = 5000,
	FadeOut = 3000,
	Moment = "pre-hit-ground",
	Sound = "Unit Rocket EngineStop",
	handle = 382667585,
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

PlaceObj('ActionFXObject', {
	Action = "Select",
	Actor = "AdvancedStirlingGenerator",
	Attach = true,
	ColorModifier = -16711936,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
})

PlaceObj('ActionFXObject', {
	Action = "Select",
	Actor = "ConstructionSite",
	ColorModifier = -16711936,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
	Target = "AdvancedStirlingGenerator",
})

PlaceObj('ActionFXObject', {
	Action = "Select",
	Actor = "ConstructionSite",
	ColorModifier = -16711936,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
	Target = "AutomaticMetalsExtractor",
})

PlaceObj('ActionFXObject', {
	Action = "Select",
	Actor = "ConstructionSite",
	ColorModifier = -16711936,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
	Target = "DroneHub",
})

PlaceObj('ActionFXObject', {
	Action = "Select",
	Actor = "ConstructionSite",
	ColorModifier = -16711936,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
	Target = "MDSLaser",
})

PlaceObj('ActionFXObject', {
	Action = "Select",
	Actor = "ConstructionSite",
	ColorModifier = -16711936,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
	Target = "MetalsExtractor",
})

PlaceObj('ActionFXObject', {
	Action = "Select",
	Actor = "ConstructionSite",
	Attach = true,
	ColorModifier = -16711936,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
	Target = "MoistureVaporator",
})

PlaceObj('ActionFXObject', {
	Action = "Select",
	Actor = "ConstructionSite",
	ColorModifier = -16711936,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
	Target = "PreciousMetalsExtractor",
})

PlaceObj('ActionFXObject', {
	Action = "Select",
	Actor = "ConstructionSite",
	ColorModifier = -16711936,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
	Target = "SubsurfaceHeater",
})

PlaceObj('ActionFXObject', {
	Action = "Select",
	Actor = "ConstructionSite",
	ColorModifier = -16711936,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
	Target = "TriboelectricScrubber",
})

PlaceObj('ActionFXObject', {
	Action = "Select",
	Actor = "ConstructionSite",
	ColorModifier = -16711936,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
	Target = "WaterExtractor",
})

PlaceObj('ActionFXObject', {
	Action = "Select",
	Actor = "Dome",
	Attach = true,
	ColorModifier = -16711936,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
	handle = 1569187198,
})

PlaceObj('ActionFXObject', {
	Action = "Select",
	Actor = "DroneHub",
	Attach = true,
	ColorModifier = -16711936,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexMultiSelectRadius",
	ScaleMember = "GetSelectionRadiusScale",
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

PlaceObj('ActionFXObject', {
	Action = "Select",
	Actor = "MDSLaser",
	ColorModifier = -16711936,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
})

PlaceObj('ActionFXObject', {
	Action = "Select",
	Actor = "MetalsExtractor",
	Attach = true,
	ColorModifier = -16711936,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
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

PlaceObj('ActionFXObject', {
	Action = "Select",
	Actor = "MoistureVaporator",
	Attach = true,
	ColorModifier = -16711936,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexMultiSelectRadius",
	ScaleMember = "GetSelectionRadiusScale",
})

PlaceObj('ActionFXObject', {
	Action = "Select",
	Actor = "PreciousMetalsExtractor",
	Attach = true,
	ColorModifier = -16711936,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
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

PlaceObj('ActionFXObject', {
	Action = "Select",
	Actor = "SubsurfaceHeater",
	Attach = true,
	ColorModifier = -16711936,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
	ScaleMember = "GetSelectionRadiusScale",
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

PlaceObj('ActionFXObject', {
	Action = "Select",
	Actor = "TriboelectricScrubber",
	Attach = true,
	ColorModifier = -16711936,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
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

PlaceObj('ActionFXObject', {
	Action = "Select",
	Actor = "WaterExtractor",
	Attach = true,
	ColorModifier = -16711936,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	Moment = "start",
	Object = "RangeHexRadius",
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

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "DustDevilMajor1",
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1000,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Ambience Wind High 1",
	handle = 561167909,
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "DustDevilMajor2",
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 800,
	FadeOut = 800,
	Moment = "start",
	Sound = "Ambience Wind High 3",
	handle = 1125841561,
})

PlaceObj('ActionFXSound', {
	Action = "UIButtonPressed",
	Disabled = true,
	Moment = "start",
	Sound = "UI ButtonSpecialClickIn",
	Source = "UI",
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

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "BlackCube",
	Disabled = true,
	Moment = "start",
	Sound = "Mystery Cube Appear",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "BlackCubeMonolith",
	Disabled = true,
	Moment = "start",
	Sound = "Mystery Cube Appear",
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

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "PowerDecoy",
	AttachToObj = true,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1000,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Object PowerDecoy LoopIdle",
	handle = 1607868112,
})

PlaceObj('ActionFXLight', {
	Action = "Working",
	Actor = "ProjectMorpheus",
	Attach = true,
	Color = -16755201,
	Delay = 3500,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1000,
	FadeOutColor = -16755201,
	FadeOutIntensity = 255,
	Intensity = 200,
	Moment = "start",
	Radius = 10000,
	Spot = "Projector",
	StartColor = -16755201,
	StartIntensity = 255,
})

PlaceObj('ActionFXLight', {
	Action = "Working",
	Actor = "ProjectMorpheus",
	Attach = true,
	Color = -16755201,
	Delay = 3500,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1000,
	FadeOutColor = -16755201,
	FadeOutIntensity = 120,
	Intensity = 220,
	Moment = "start",
	Offset = point(0, 0, 500),
	Radius = 50000,
	StartColor = -16755201,
	StartIntensity = 220,
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

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "RechargeStation",
	AttachToObj = true,
	Disabled = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
		PlaceObj('ActionFXEndRule', {
			'EndAction', "RechargeStation",
			'EndMoment', "start",
		}),
	},
	FadeIn = 1000,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Object RechargeStation Loop",
	handle = 372424243,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "TheExcavator",
	Delay = 7000,
	Disabled = true,
	Moment = "start",
	Sound = "Object Excavator LoopPeak",
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

