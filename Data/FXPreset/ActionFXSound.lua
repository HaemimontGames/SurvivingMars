-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('ActionFXSound', {
	Action = "ActionButtonClick",
	EndRules = {},
	Moment = "start",
	Sound = "UI ButtonSaveNextBackClickIn",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "ActionButtonHover",
	EndRules = {},
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

PlaceObj('ActionFXSound', {
	Action = "AlienDiggerTakeoff",
	Actor = "AlienDigger",
	Moment = "start",
	Sound = "Mystery AlienDigger Takeoff",
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

PlaceObj('ActionFXSound', {
	Action = "BioroboticsArmMotion",
	Actor = "BioroboticsWorkshopArm",
	EndRules = {},
	Moment = "start",
	Sound = "Building WorkshopBiorobotics Arm",
	Source = "ActionPos",
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
	EndRules = {},
	Moment = "start",
	Sound = "Object StirlingGeneratorAdv Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "Apartments",
	EndRules = {},
	Moment = "start",
	Sound = "Building Apartments Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "Arcology",
	EndRules = {},
	Moment = "start",
	Sound = "Building Arcology Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "ArtWorkshop",
	EndRules = {},
	Moment = "start",
	Sound = "Building WorkshopArt Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "ArtificialSun",
	EndRules = {},
	Moment = "start",
	Sound = "Object ArtificialSun Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "AtomicBattery",
	EndRules = {},
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
	EndRules = {},
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
	Actor = "CarbonateProcessor",
	EndRules = {},
	Moment = "start",
	Sound = "Object CarbonateProcessor Fail",
	id = "",
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
	Actor = "CoreHeatConvector",
	EndRules = {},
	Moment = "start",
	Sound = "Object CoreHeatConvector Fail",
	id = "",
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
	EndRules = {},
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
	Actor = "ForestationPlant",
	Moment = "start",
	Sound = "Object ForestationPlant Fail",
	id = "",
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
	Actor = "GHGFactory",
	EndRules = {},
	Moment = "start",
	Sound = "Object GHGFactory Fail",
	id = "",
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
	Actor = "InsidePasture",
	EndRules = {},
	Moment = "start",
	Sound = "Building Ranch Fail",
	id = "",
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
	EndRules = {},
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
	Actor = "MagneticFieldGenerator",
	EndRules = {},
	Moment = "start",
	Sound = "Object MagneticFieldGenerator Fail",
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
	Actor = "OpenFarm",
	EndRules = {},
	Moment = "start",
	Sound = "Object OpenFarm Fail",
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "OpenPasture",
	EndRules = {},
	Moment = "start",
	Sound = "Building Ranch Fail",
	id = "",
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
	EndRules = {},
	Moment = "start",
	Sound = "Unit RoverDriller Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "RCHarvester",
	EndRules = {},
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
	Actor = "RCTerraformer",
	EndRules = {},
	Moment = "start",
	Sound = "Unit RoverDozer Fail",
	id = "",
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
	Actor = "TradePad",
	EndRules = {},
	Moment = "start",
	Sound = "Object StorageTrade Fail",
	id = "",
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
	EndRules = {},
	Moment = "start",
	Sound = "Object WindTurbine Fail",
})

PlaceObj('ActionFXSound', {
	Action = "Breakdown",
	Actor = "WindTurbine_Large",
	EndRules = {},
	Moment = "start",
	Sound = "Object WindTurbineLarge Fail",
	id = "",
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

PlaceObj('ActionFXSound', {
	Action = "BuildingModeChanged",
	Moment = "start",
	Sound = "UI ModeSwitch",
	Source = "UI",
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
	EndRules = {},
	Moment = "start",
	Sound = "Object PowerCables Complete",
})

PlaceObj('ActionFXSound', {
	Action = "CableSwitched",
	Actor = "CableSwitch",
	EndRules = {},
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

PlaceObj('ActionFXSound', {
	Action = "Capture",
	Actor = "MirrorSphere",
	Moment = "start",
	Sound = "Object PowerDecoy Capture",
	Source = "ActionPos",
	Target = "PowerDecoy",
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
	Actor = "MultiSelectionWrapper",
	Moment = "start",
	Sound = "UI SendVehicleClick",
	Source = "UI",
	group = "Default",
	id = "",
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
	EndRules = {},
	Moment = "start",
	Sound = "UI SendVehicleClick",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "ClickMove",
	Actor = "RCHarvester",
	EndRules = {},
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

PlaceObj('ActionFXSound', {
	Action = "ClickMove",
	Actor = "RCTerraformer",
	EndRules = {},
	Moment = "start",
	Sound = "UI SendVehicleClick",
	Source = "UI",
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "ClickMove",
	Actor = "RCTransport",
	Moment = "start",
	Sound = "UI SendVehicleClick",
	Source = "UI",
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
	Action = "ColonyControlCenterButtonClick",
	EndRules = {},
	Moment = "start",
	Sound = "UI ButtonGeneralClickIn",
	Source = "UI",
	id = "",
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
	EndRules = {},
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

PlaceObj('ActionFXSound', {
	Action = "CrystalCompose",
	Actor = "CrystalShard",
	Moment = "attach",
	Sound = "Mystery AlienCrystals ShardComposeAttach",
})

PlaceObj('ActionFXSound', {
	Action = "CrystalCompose",
	Actor = "Crystal",
	Moment = "attach1",
	Sound = "Mystery AlienCrystalsBig Attach",
})

PlaceObj('ActionFXSound', {
	Action = "CrystalCompose",
	Actor = "Crystal",
	Moment = "attach10",
	Sound = "Mystery AlienCrystalsBig Attach",
})

PlaceObj('ActionFXSound', {
	Action = "CrystalCompose",
	Actor = "Crystal",
	Moment = "attach11",
	Sound = "Mystery AlienCrystalsBig Attach",
})

PlaceObj('ActionFXSound', {
	Action = "CrystalCompose",
	Actor = "Crystal",
	Moment = "attach12",
	Sound = "Mystery AlienCrystalsBig Attach",
})

PlaceObj('ActionFXSound', {
	Action = "CrystalCompose",
	Actor = "Crystal",
	Moment = "attach2",
	Sound = "Mystery AlienCrystalsBig Attach",
})

PlaceObj('ActionFXSound', {
	Action = "CrystalCompose",
	Actor = "Crystal",
	Moment = "attach3",
	Sound = "Mystery AlienCrystalsBig Attach",
})

PlaceObj('ActionFXSound', {
	Action = "CrystalCompose",
	Actor = "Crystal",
	Moment = "attach4",
	Sound = "Mystery AlienCrystalsBig Attach",
})

PlaceObj('ActionFXSound', {
	Action = "CrystalCompose",
	Actor = "Crystal",
	Moment = "attach5",
	Sound = "Mystery AlienCrystalsBig Attach",
})

PlaceObj('ActionFXSound', {
	Action = "CrystalCompose",
	Actor = "Crystal",
	Moment = "attach6",
	Sound = "Mystery AlienCrystalsBig Attach",
})

PlaceObj('ActionFXSound', {
	Action = "CrystalCompose",
	Actor = "Crystal",
	Moment = "attach7",
	Sound = "Mystery AlienCrystalsBig Attach",
})

PlaceObj('ActionFXSound', {
	Action = "CrystalCompose",
	Actor = "Crystal",
	Moment = "attach8",
	Sound = "Mystery AlienCrystalsBig Attach",
})

PlaceObj('ActionFXSound', {
	Action = "CrystalCompose",
	Actor = "Crystal",
	Moment = "attach9",
	Sound = "Mystery AlienCrystalsBig Attach",
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

PlaceObj('ActionFXSound', {
	Action = "CrystalLiftoff",
	Actor = "CrystalShard",
	Delay = 2000,
	Moment = "start",
	Sound = "Mystery AlienCrystals ShardTakeoff",
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

PlaceObj('ActionFXSound', {
	Action = "Deconstruct",
	Actor = "AlienDigger",
	Moment = "end",
	Sound = "Mystery AlienDigger Disappear",
})

PlaceObj('ActionFXSound', {
	Action = "Deconstruct",
	Actor = "Drone",
	AttachToObj = true,
	Moment = "end",
	Sound = "Unit Drone BuildStop",
})

PlaceObj('ActionFXSound', {
	Action = "Deconstruct",
	Actor = "AlienDigger",
	Moment = "start",
	Sound = "Mystery AlienDigger Destruction",
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
	EndRules = {},
	Moment = "end",
	Sound = "Object DecorationConcrete Demolition",
	Source = "ActionPos",
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
	EndRules = {},
	Moment = "start",
	Sound = "Building Apartments Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "Arcology",
	EndRules = {},
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
	EndRules = {},
	Moment = "start",
	Sound = "Object ArtificialSun Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "AtomicBattery",
	EndRules = {},
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
	Actor = "CarbonateProcessor",
	EndRules = {},
	Moment = "start",
	Sound = "Object CarbonateProcessor Demolition",
	Source = "ActionPos",
	id = "",
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
	Actor = "CoreHeatConvector",
	EndRules = {},
	Moment = "start",
	Sound = "Object CoreHeatConvector Demolition",
	Source = "ActionPos",
	id = "",
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
	Actor = "ForestationPlant",
	Moment = "start",
	Sound = "Object ForestationPlant Demolition",
	Source = "ActionPos",
	id = "",
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
	Actor = "GHGFActory",
	EndRules = {},
	Moment = "start",
	Sound = "Object GHGFactory Demolition",
	Source = "ActionPos",
	id = "",
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
	Actor = "InsidePasture",
	Moment = "start",
	Sound = "Building Ranch Demolition",
	Source = "ActionPos",
	id = "",
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
	EndRules = {},
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
	Actor = "MagneticFieldGenerator",
	EndRules = {},
	Moment = "start",
	Sound = "Object MagneticFieldGenerator Demolition",
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
	Actor = "OpenFarm",
	EndRules = {},
	Moment = "start",
	Sound = "Object OpenFarm Demolition",
	Source = "ActionPos",
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "OpenPasture",
	Moment = "start",
	Sound = "Building Ranch Demolition",
	Source = "ActionPos",
	id = "",
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
	EndRules = {},
	Moment = "start",
	Sound = "Unit Rover Crash",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "RCHarvester",
	EndRules = {},
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
	Actor = "RCTerraformer",
	EndRules = {},
	Moment = "start",
	Sound = "Unit Rover Crash",
	Source = "ActionPos",
	id = "",
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
	Actor = "TradePad",
	EndRules = {},
	Moment = "start",
	Sound = "Object StorageTrade Demolition",
	Source = "ActionPos",
	id = "",
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
	EndRules = {},
	Moment = "start",
	Sound = "Object WindTurbine Demolition",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Actor = "WindTurbine_Large",
	EndRules = {},
	Moment = "start",
	Sound = "Object WindTurbine Demolition",
	Source = "ActionPos",
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "Destroyed",
	Moment = "start",
	Sound = "UI BuildDemolition",
	Source = "UI",
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
	EndRules = {},
	Moment = "start",
	Sound = "Mystery Lights FireflyDrainStart",
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

PlaceObj('ActionFXSound', {
	Action = "ElectrostaticStorm",
	EndRules = {},
	Moment = "hit-moment1",
	Offset = point(100, 0, 0),
	Sound = "Ambience ThunderClose 1",
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "ElectrostaticStorm",
	EndRules = {},
	Moment = "hit-moment2",
	Offset = point(100, 0, 0),
	Sound = "Ambience ThunderClose 2",
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "ElectrostaticStorm",
	EndRules = {},
	Moment = "hit-moment3",
	Offset = point(100, 0, 0),
	Sound = "Ambience ThunderClose 3",
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "ElectrostaticStorm",
	EndRules = {},
	Moment = "hit-moment4",
	Offset = point(100, 0, 0),
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
	Actor = "RCTerraformer",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 100,
	FadeOut = 100,
	Moment = "start",
	Sound = "Unit Rover EmergencyPower",
	handle = 956026780,
	id = "",
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

PlaceObj('ActionFXSound', {
	Action = "Fireworks_1",
	Delay = 1700,
	Moment = "start",
	Sound = "Ambience Fireworks Single",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Fireworks_10",
	Delay = 2600,
	Moment = "start",
	Sound = "Ambience Fireworks SingleLarge",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Fireworks_11",
	Delay = 500,
	Moment = "start",
	Sound = "Ambience Fireworks SingleSparks",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Fireworks_12",
	Delay = 500,
	Moment = "start",
	Sound = "Ambience Fireworks SingleSparks",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Fireworks_13",
	Delay = 500,
	Moment = "start",
	Sound = "Ambience Fireworks SingleSparks",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Fireworks_14",
	Delay = 1800,
	Moment = "start",
	Sound = "Ambience Fireworks Single",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Fireworks_15",
	Delay = 2200,
	Moment = "start",
	Sound = "Ambience Fireworks Single",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Fireworks_16",
	Delay = 2200,
	Moment = "start",
	Sound = "Ambience Fireworks Single",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Fireworks_17",
	Delay = 2200,
	Moment = "start",
	Sound = "Ambience Fireworks Single",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Fireworks_18",
	Delay = 2600,
	Moment = "start",
	Sound = "Ambience Fireworks SingleLarge",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Fireworks_2",
	Delay = 1500,
	Moment = "start",
	Sound = "Ambience Fireworks Single",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Fireworks_4",
	Delay = 2750,
	Moment = "start",
	Sound = "Ambience Fireworks SingleLarge",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Fireworks_5",
	Delay = 2450,
	Moment = "start",
	Sound = "Ambience Fireworks Single",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Fireworks_6",
	Delay = 2450,
	Moment = "start",
	Sound = "Ambience Fireworks Single",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Fireworks_7",
	Delay = 2500,
	Moment = "start",
	Sound = "Ambience Fireworks Single",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "Fireworks_8",
	Delay = 2500,
	Moment = "start",
	Sound = "Ambience Fireworks Single",
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

PlaceObj('ActionFXSound', {
	Action = "Harvest",
	Actor = "RCHarvester",
	Moment = "end",
	Sound = "Unit RoverHarvester HarvestStop",
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

PlaceObj('ActionFXSound', {
	Action = "Land",
	Actor = "AttackRover",
	Moment = "start",
	Sound = "Unit RoverAttack Landing",
})

PlaceObj('ActionFXSound', {
	Action = "Land",
	Actor = "JumperShuttle",
	Moment = "start",
	Sound = "Unit ShuttleJumper Land",
})

PlaceObj('ActionFXSound', {
	Action = "Land",
	Actor = "Shuttle",
	Moment = "start",
	Sound = "Unit Shuttle Land",
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

PlaceObj('ActionFXSound', {
	Action = "LaunchSupplyRocketClick",
	Moment = "start",
	Sound = "UI LaunchCargo",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Load",
	Actor = "RCTerraformer",
	EndRules = {},
	Moment = "Hit1",
	Sound = "Unit RoverDozer Shovel",
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "Load",
	Actor = "RCTerraformer",
	EndRules = {},
	Moment = "end",
	Sound = "Unit Rover ExtractionStop",
	id = "",
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

PlaceObj('ActionFXSound', {
	Action = "Load",
	Actor = "RCTerraformer",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Unit Rover ExtractionLoop",
	handle = 522595264,
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "Load",
	Actor = "RCTerraformer",
	EndRules = {},
	Moment = "start",
	Sound = "Unit Rover ExtractionStart",
	id = "",
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
	EndRules = {},
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
	EndRules = {},
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

PlaceObj('ActionFXSound', {
	Action = "MetatronLeave",
	Actor = "Metatron",
	Delay = 550,
	Moment = "pre-leave",
	Sound = "Mystery Metatron AppearUI",
	Source = "UI",
	Target = "ignore",
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

PlaceObj('ActionFXSound', {
	Action = "Meteor",
	Actor = "MeteorLarge1",
	Moment = "start",
	Sound = "Ambience Disaster MeteorFlydownLarge",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "Meteor",
	Actor = "MeteorLarge2",
	Moment = "start",
	Sound = "Ambience Disaster MeteorFlydownLarge",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "Meteor",
	Actor = "MeteorSmall1",
	Moment = "start",
	Sound = "Ambience Disaster MeteorFlydownSmall",
	Target = "ignore",
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

PlaceObj('ActionFXSound', {
	Action = "MeteorExplosionAir",
	Actor = "MeteorLarge1",
	Moment = "start",
	Sound = "Ambience Disaster MeteorExplosionLarge",
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

PlaceObj('ActionFXSound', {
	Action = "MeteorExplosionAir",
	Actor = "MeteorSmall1",
	Moment = "start",
	Sound = "Ambience Disaster MeteorExplosionSmall",
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

PlaceObj('ActionFXSound', {
	Action = "MissileFired",
	Actor = "AttackRover",
	Moment = "start",
	Sound = "Unit RoverAttack Shoot",
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
	EndRules = {},
	Moment = "end",
	Sound = "Unit RoverDriller MotionStop",
})

PlaceObj('ActionFXSound', {
	Action = "Moving",
	Actor = "RCHarvester",
	EndRules = {},
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
	Actor = "RCTerraformer",
	EndRules = {},
	Moment = "end",
	Sound = "Unit RoverDozer MotionStop",
	id = "",
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
	EndRules = {},
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
	EndRules = {},
	Moment = "start",
	Sound = "Unit RoverDriller MotionStart",
})

PlaceObj('ActionFXSound', {
	Action = "Moving",
	Actor = "RCHarvester",
	EndRules = {},
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
	Actor = "RCTerraformer",
	EndRules = {},
	Moment = "start",
	Sound = "UI SendVehicleAutonomous",
	Source = "UI",
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "Moving",
	Actor = "RCTerraformer",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 300,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Unit RoverDozer MotionLoop",
	handle = 581637808,
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "Moving",
	Actor = "RCTerraformer",
	EndRules = {},
	Moment = "start",
	Sound = "Unit RoverDozer MotionStart",
	id = "",
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
	Action = "OpenAirState",
	Moment = "construct",
	Sound = "Building Dome Construct",
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "OpenAirState",
	Moment = "deconstruct",
	Sound = "Building Dome Deconstruct",
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "OpenAirState",
	Moment = "dissolve",
	Sound = "Building Dome Glassdissolve",
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "OpenInGameMenu",
	Moment = "start",
	Sound = "UI MenuESC",
	Source = "UI",
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

PlaceObj('ActionFXSound', {
	Action = "OverviewButtonClick",
	Moment = "start",
	Sound = "UI ButtonGeneralClickIn",
	Source = "UI",
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

PlaceObj('ActionFXSound', {
	Action = "OxygenLeak",
	Actor = "ElectricityGridElement",
	Moment = "start",
	Sound = "Object PowerCables Fail",
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

PlaceObj('ActionFXSound', {
	Action = "RadioButtonClick",
	EndRules = {},
	Sound = "UI ButtonGeneralClickIn",
	Source = "UI",
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "RadioStationStarting",
	EndRules = {},
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
	Actor = "RCTerraformer",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 500,
	FadeOut = 500,
	Moment = "start",
	Sound = "Unit Rover Recharging",
	handle = 85661882,
	id = "",
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
	EndRules = {},
	Moment = "start",
	Sound = "Object 0 Hydraulic",
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "RocketDoorClose",
	Actor = "FXRocket",
	EndRules = {},
	Moment = "start",
	Sound = "Unit Rocket DoorClose",
})

PlaceObj('ActionFXSound', {
	Action = "RocketDoorClose",
	Actor = "SupplyRocket",
	EndRules = {},
	Moment = "start",
	Sound = "Object 0 Hydraulic",
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "RocketDoorOpen",
	Actor = "FXRocket",
	EndRules = {},
	Moment = "start",
	Sound = "Object 0 Hydraulic",
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "RocketDoorOpen",
	Actor = "FXRocket",
	EndRules = {},
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

PlaceObj('ActionFXSound', {
	Action = "RocketDoorOpen",
	Actor = "SupplyRocket",
	EndRules = {},
	Moment = "start",
	Sound = "Object 0 Hydraulic",
	id = "",
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

PlaceObj('ActionFXSound', {
	Action = "SectorScanInvalid",
	Moment = "start",
	Sound = "UI SectorScanFail",
	Source = "UI",
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

PlaceObj('ActionFXSound', {
	Action = "Select",
	Actor = "SubsurfaceAnomaly",
	Moment = "start",
	Sound = "UI SelectResource",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Select",
	Actor = "SubsurfaceDepositMetals",
	Moment = "start",
	Sound = "UI SelectResource",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Select",
	Actor = "SubsurfaceDepositPreciousMetals",
	Moment = "start",
	Sound = "UI SelectResource",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Select",
	Actor = "SubsurfaceDepositWater",
	Moment = "start",
	Sound = "UI SelectResource",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Select",
	Actor = "SurfaceDepositConcrete",
	Moment = "start",
	Sound = "UI SelectResource",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Select",
	Actor = "SurfaceDepositMetals",
	Moment = "start",
	Sound = "UI SelectResource",
	Source = "UI",
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
	EndRules = {},
	Moment = "start",
	Sound = "UI SelectResource",
	Source = "UI",
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
	EndRules = {},
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
	EndRules = {},
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "ArtificialSun",
	EndRules = {},
	Moment = "start",
	Sound = "Object ArtificialSun Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "ArtificialSun",
	EndRules = {},
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "AtomicBattery",
	EndRules = {},
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
	Actor = "CableConstructionSite",
	EndRules = {},
	Moment = "start",
	Sound = "UI SelectConstructionsite",
	Source = "UI",
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "CableSwitch",
	EndRules = {},
	Moment = "start",
	Sound = "Object PowerSwitch Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "CarbonateProcessor",
	EndRules = {},
	Moment = "start",
	Sound = "Object CarbonateProcessor Select",
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "CarbonateProcessor",
	EndRules = {},
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
	id = "",
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
	Actor = "CoreHeatConvector",
	EndRules = {},
	Moment = "start",
	Sound = "Object CoreHeatConvector Select",
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "CoreHeatConvector",
	EndRules = {},
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
	id = "",
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
	EndRules = {},
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
	EndRules = {},
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
	EndRules = {},
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
	EndRules = {},
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
	Actor = "ForestationPlant",
	Moment = "start",
	Sound = "Object ForestationPlant Select",
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "ForestationPlant",
	Moment = "start",
	Sound = "UI SelectObject",
	Source = "UI",
	id = "",
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
	EndRules = {},
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
	Actor = "GHGFactory",
	EndRules = {},
	Moment = "start",
	Sound = "Object GHGFactory Select",
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "GHGFactory",
	EndRules = {},
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
	id = "",
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
	Actor = "InsidePasture",
	Moment = "start",
	Sound = "Building Ranch Select",
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "InsidePasture",
	EndRules = {},
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
	id = "",
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
	EndRules = {},
	Moment = "start",
	Sound = "UI SelectDеcoration",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "LakeBig",
	EndRules = {},
	Moment = "start",
	Sound = "UI SelectDеcoration",
	Source = "UI",
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "LakeHuge",
	EndRules = {},
	Moment = "start",
	Sound = "UI SelectDеcoration",
	Source = "UI",
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "LakeMid",
	EndRules = {},
	Moment = "start",
	Sound = "UI SelectDеcoration",
	Source = "UI",
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "LakeSmall",
	EndRules = {},
	Moment = "start",
	Sound = "UI SelectDеcoration",
	Source = "UI",
	id = "",
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
	EndRules = {},
	Moment = "start",
	Sound = "Object LandingPad Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "LandingPad",
	EndRules = {},
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
	EndRules = {},
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
	Actor = "MagneticFieldGenerator",
	EndRules = {},
	Moment = "start",
	Sound = "Object MagneticFieldGenerator Select",
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "MagneticFieldGenerator",
	EndRules = {},
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
	Actor = "OpenFarm",
	EndRules = {},
	Moment = "start",
	Sound = "Object OpenFarm Select",
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "OpenFarm",
	EndRules = {},
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "OpenPasture",
	Moment = "start",
	Sound = "Building Ranch Select",
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "OpenPasture",
	Moment = "start",
	Sound = "Building Ranch Select",
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "OpenPasture",
	EndRules = {},
	Moment = "start",
	Sound = "UI SelectBuilding",
	Source = "UI",
	id = "",
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
	Actor = "PipeConstructionSite",
	EndRules = {},
	Moment = "start",
	Sound = "UI SelectConstructionsite",
	Source = "UI",
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "PipeValve",
	EndRules = {},
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
	EndRules = {},
	Moment = "start",
	Sound = "UI SelectVehicleAutonomous",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "RCDriller",
	EndRules = {},
	Moment = "start",
	Sound = "Unit RoverDriller Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "RCHarvester",
	EndRules = {},
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
	Actor = "RCTerraformer",
	EndRules = {},
	Moment = "start",
	Sound = "UI SelectVehicleAutonomous",
	Source = "UI",
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "RCTerraformer",
	EndRules = {},
	Moment = "start",
	Sound = "Unit RoverDozer Select",
	id = "",
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
	Actor = "TradePad",
	EndRules = {},
	Moment = "start",
	Sound = "Object StorageTrade Select",
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "TradePad",
	EndRules = {},
	Moment = "start",
	Sound = "UI SelectObject",
	Source = "UI",
	id = "",
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
	EndRules = {},
	Moment = "start",
	Sound = "Object WindTurbine Select",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "WindTurbine",
	EndRules = {},
	Moment = "start",
	Sound = "UI SelectObject",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "WindTurbine_Large",
	EndRules = {},
	Moment = "start",
	Sound = "Object WindTurbineLarge Select",
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "SelectObj",
	Actor = "WindTurbine_Large",
	EndRules = {},
	Moment = "start",
	Sound = "UI SelectObject",
	Source = "UI",
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "SelectRandomColonySite",
	Delay = 100,
	EndRules = {},
	Moment = "start",
	Sound = "UI SelectColonySiteEnd",
	Source = "UI",
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "SelectRandomColonySite",
	Delay = 50,
	EndRules = {},
	Moment = "start",
	Sound = "UI SelectColonySiteStart",
	Source = "UI",
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "SelectedColonyParamsHover",
	Moment = "start",
	Sound = "UI ButtonHover",
	Source = "UI",
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

PlaceObj('ActionFXSound', {
	Action = "ShuttleHubEnter",
	Actor = "JumperShuttle",
	Moment = "start",
	Sound = "Unit ShuttleJumper Land",
})

PlaceObj('ActionFXSound', {
	Action = "ShuttleHubEnter",
	Actor = "Shuttle",
	Moment = "start",
	Sound = "Unit Shuttle Land",
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

PlaceObj('ActionFXSound', {
	Action = "ShuttleHubExit",
	Actor = "Shuttle",
	Moment = "start",
	Sound = "Unit Shuttle TakeoffHub",
	Source = "ActionPos",
})

PlaceObj('ActionFXSound', {
	Action = "ShuttleLoad",
	Actor = "JumperShuttle",
	Moment = "start",
	Sound = "Unit ShuttleJumper CargoLoad",
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "ShuttleLoad",
	Actor = "Shuttle",
	Moment = "start",
	Sound = "Unit Shuttle CargoLoad",
	Source = "ActionPos",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "ShuttleUnload",
	Actor = "JumperShuttle",
	Moment = "start",
	Sound = "Unit ShuttleJumper CargoUnload",
	Source = "ActionPos",
	Target = "ignore",
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

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "AlienDiggerMarker",
	Moment = "start",
	Sound = "Mystery AlienDigger Appear",
	Target = "ignore",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "Apartments",
	EndRules = {},
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "Arcology",
	EndRules = {},
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
	EndRules = {},
	Moment = "start",
	Sound = "UI PlacePowerCables",
	Source = "UI",
	Target = "ElectricityGridElement",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "CarbonateProcessor",
	EndRules = {},
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
	id = "",
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
	EndRules = {},
	Moment = "start",
	Sound = "UI BuildCommence",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "ConstructionSite",
	EndRules = {},
	Moment = "start",
	Sound = "UI PlaceBuildingGround",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "CoreHeatConvector",
	EndRules = {},
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
	id = "",
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

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "ElectricityGridElement",
	EndRules = {},
	Moment = "start",
	Sound = "Object PowerCables Complete",
	id = "",
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
	Actor = "GHGFactory",
	EndRules = {},
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
	id = "",
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
	Actor = "InsidePasture",
	EndRules = {},
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
	id = "",
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
	EndRules = {},
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
	Actor = "MagneticFieldGenerator",
	EndRules = {},
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
	Actor = "OpenFarm",
	EndRules = {},
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "OpenPasture",
	EndRules = {},
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
	id = "",
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
	EndRules = {},
	Moment = "start",
	Sound = "Unit RoverDriller Complete",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "RCHarvester",
	EndRules = {},
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
	Actor = "RCTerraformer",
	EndRules = {},
	Moment = "start",
	Sound = "Unit RoverDozer Complete",
	id = "",
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
	Actor = "TradePad",
	EndRules = {},
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
	id = "",
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
	EndRules = {},
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "Spawn",
	Actor = "WindTurbine_Large",
	EndRules = {},
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
	id = "",
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

PlaceObj('ActionFXSound', {
	Action = "TakeOff",
	Actor = "JumperShuttle",
	Moment = "start",
	Sound = "Unit ShuttleJumper Takeoff",
})

PlaceObj('ActionFXSound', {
	Action = "TakeOff",
	Actor = "MirrorSphere",
	Moment = "start",
	Sound = "Mystery Sphere Takeoff",
	Target = "ignore",
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

PlaceObj('ActionFXSound', {
	Action = "ToxicRain",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndAction', "ToxicRain",
			'EndMoment', "end",
		}),
	},
	FadeIn = 3000,
	FadeOut = 3000,
	Moment = "start",
	Sound = "UI RainAcid",
	Source = "UI",
	handle = 1446183436,
	id = "",
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

PlaceObj('ActionFXSound', {
	Action = "TurnToDepositComplete",
	Actor = "MirrorSphere",
	Moment = "start",
	Sound = "Mystery Sphere TransformComplete",
	Target = "PowerDecoy",
})

PlaceObj('ActionFXSound', {
	Action = "TurnToMetal",
	Actor = "MirrorSphere",
	Moment = "start",
	Sound = "Mystery Sphere Transform",
	Target = "PowerDecoy",
})

PlaceObj('ActionFXSound', {
	Action = "TurnToPolymer",
	Actor = "MirrorSphere",
	Moment = "start",
	Sound = "Mystery Sphere Transform",
	Target = "PowerDecoy",
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
	EndRules = {},
	Moment = "start",
	Sound = "UI ButtonHover",
	Source = "UI",
})

PlaceObj('ActionFXSound', {
	Action = "UIButtonPressed",
	Actor = "Button",
	EndRules = {},
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
	EndRules = {},
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
	EndRules = {},
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

PlaceObj('ActionFXSound', {
	Action = "Unload",
	Actor = "RCTerraformer",
	EndRules = {},
	Moment = "end",
	Sound = "Unit Rover ExtractionStop",
	id = "",
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

PlaceObj('ActionFXSound', {
	Action = "Unload",
	Actor = "RCTerraformer",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Unit Rover ExtractionLoop",
	handle = 356104398,
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "Unload",
	Actor = "RCTerraformer",
	EndRules = {},
	Moment = "start",
	Sound = "Unit Rover ExtractionStart",
	id = "",
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

PlaceObj('ActionFXSound', {
	Action = "WarmUp",
	Actor = "GeyserWarmup",
	Moment = "start",
	Sound = "Ambience Geyser Warmup",
	Target = "PrefabFeatureMarker",
})

PlaceObj('ActionFXSound', {
	Action = "WaterRain",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndAction', "WaterRain",
			'EndMoment', "end",
		}),
	},
	FadeIn = 3000,
	FadeOut = 3000,
	Moment = "start",
	Sound = "UI RainClean",
	Source = "UI",
	handle = 111653238,
	id = "",
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
	Actor = "CarbonateProcessor",
	AttachToObj = true,
	EndRules = {},
	Moment = "end",
	Sound = "Object CarbonateProcessor LoopStop",
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "ConcretePlant",
	Moment = "end",
	Sound = "Object ConcretePlant LoopStop",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "CoreHeatConvector",
	AttachToObj = true,
	EndRules = {},
	Moment = "end",
	Sound = "Object CoreHeatConvector LoopStop",
	Target = "ignore",
	id = "",
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
	Actor = "MagneticFieldGenerator",
	AttachToObj = true,
	EndRules = {},
	Moment = "end",
	Sound = "Object MagneticFieldGenerator LoopStop",
	Target = "ignore",
	id = "",
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
	Actor = "OpenFarm",
	EndRules = {},
	Moment = "end",
	Sound = "Object OpenFarm LoopStop",
	id = "",
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

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "SolarPanel",
	EndRules = {},
	Moment = "end",
	Sound = "Object SolarPanel Close",
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
	EndRules = {},
	Moment = "end",
	Sound = "Object WindTurbine LoopStop",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "WindTurbine_Large",
	EndRules = {},
	Moment = "end",
	Sound = "Object WindTurbineLarge LoopStop",
	id = "",
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

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "MOXIE",
	Moment = "hit-moment2",
	Sound = "Object MOXIE LoopPeaks",
	Target = "MoxiePump",
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
	EndRules = {},
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

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "BlackCubeMonolith",
	Moment = "start",
	Sound = "Mystery CubeStructure Appear",
	Target = "ignore",
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
	Actor = "CarbonateProcessor",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Object CarbonateProcessor Loop",
	handle = 1604723170,
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "CarbonateProcessor",
	AttachToObj = true,
	EndRules = {},
	Moment = "start",
	Sound = "Object CarbonateProcessor LoopStart",
	id = "",
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

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "CoreHeatConvector",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Object CoreHeatConvector Loop",
	Target = "ignore",
	handle = 1259562940,
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "CoreHeatConvector",
	AttachToObj = true,
	EndRules = {},
	Moment = "start",
	Sound = "Object CoreHeatConvector LoopStart",
	Target = "ignore",
	id = "",
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
	EndRules = {},
	Moment = "start",
	Sound = "Object PowerCables Complete",
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

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "ForestationPlant",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 2000,
	FadeOut = 2000,
	Moment = "start",
	Sound = "Object ForestationPlant Loop",
	Target = "ignore",
	handle = 1701800998,
	id = "",
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
	Actor = "GHGFactory",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 1500,
	Moment = "start",
	Sound = "Object GHGFactory Loop",
	handle = 1174386099,
	id = "",
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

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "InsidePasture",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Building Ranch Loop",
	handle = 58228348,
	id = "",
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

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "LifeSupportGridElement",
	EndRules = {},
	Moment = "start",
	Sound = "Object Pipes Complete",
	group = "Default",
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "LifeSupportGridElement",
	Moment = "start",
	Sound = "UI BuildComplete",
	Source = "UI",
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
	Actor = "MagneticFieldGenerator",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Object MagneticFieldGenerator Loop",
	Target = "ignore",
	handle = 1116575770,
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "MagneticFieldGenerator",
	AttachToObj = true,
	EndRules = {},
	Moment = "start",
	Sound = "Object MagneticFieldGenerator LoopStart",
	Target = "ignore",
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
	Actor = "OpenFarm",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 1500,
	Moment = "start",
	Sound = "Object OpenFarm Loop",
	handle = 1086431494,
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "OpenFarm",
	AttachToObj = true,
	EndRules = {},
	Moment = "start",
	Sound = "Object OpenFarm LoopStart",
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "OpenPasture",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Building Ranch Loop",
	handle = 989116997,
	id = "",
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

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "WaterPump",
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Object WaterPump LoopRPMHigh",
	handle = 2102441681,
	id = "",
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

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "WindTurbine",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1000,
	FadeOut = 1000,
	Moment = "start",
	Sound = "Object WindTurbine Loop",
	handle = 535291597,
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "WindTurbine",
	EndRules = {},
	Moment = "start",
	Sound = "Object WindTurbine LoopStart",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "WindTurbine_Large",
	AttachToObj = true,
	EndRules = {
		PlaceObj('ActionFXEndRule', {
			'EndMoment', "end",
		}),
	},
	FadeIn = 1500,
	FadeOut = 1500,
	Moment = "start",
	Sound = "Object WindTurbineLarge Loop",
	handle = 1189403260,
	id = "",
})

PlaceObj('ActionFXSound', {
	Action = "Working",
	Actor = "WindTurbine_Large",
	EndRules = {},
	Moment = "start",
	Sound = "Object WindTurbineLarge LoopStart",
	id = "",
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

