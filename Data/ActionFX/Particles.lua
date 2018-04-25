-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('ActionFXParticles', {
	'Action', "AirExplosion",
	'Moment', "start",
	'Target', "ignore",
	'DetailLevel', 60,
	'Particles', "MDSLaser_Meteor_Hit",
	'AlwaysVisible', true,
	'Source', "ActionPos",
})

PlaceObj('ActionFXParticles', {
	'Action', "AlienDiggerDigging",
	'Moment', "start",
	'Actor', "AlienDigger",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 1952946677,
	'Particles', "AlienDigger_Digging",
	'AlwaysVisible', true,
	'Scale', 150,
	'SpotsPercent', 100,
})

PlaceObj('ActionFXParticles', {
	'Action', "AlienDiggerDigging",
	'Moment', "start",
	'Actor', "AlienDiggerBig",
	'DetailLevel', 40,
	'EndMoment1', "end",
	'handle', 986966770,
	'Particles', "AlienDigger_Big_Sparks",
	'Scale', 150,
	'Spot', "Particle2",
	'SpotsPercent', 100,
})

PlaceObj('ActionFXParticles', {
	'Action', "AlienDiggerDigging",
	'Moment', "start",
	'Actor', "AlienDiggerBig",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 285066019,
	'Particles', "AlienDigger_Digging_Big",
	'AlwaysVisible', true,
	'Scale', 150,
	'SpotsPercent', 100,
})

PlaceObj('ActionFXParticles', {
	'Action', "AlienDiggerLanding",
	'Moment', "pre-hit-ground",
	'Actor', "AlienDigger",
	'DetailLevel', 60,
	'Time', 10000,
	'EndMoment1', "hit-ground",
	'handle', 1077988191,
	'Particles', "AlienDigger_Landing_Trail_Hit-Ground",
	'AlwaysVisible', true,
	'Spot', "Particle",
	'SpotsPercent', 100,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "AlienDiggerLanding",
	'Moment', "pre-hit-ground",
	'Actor', "AlienDiggerBig",
	'DetailLevel', 60,
	'Time', 10000,
	'EndMoment1', "hit-ground",
	'handle', 102452153,
	'Particles', "AlienDigger_Landing_Trail_Hit-Ground",
	'AlwaysVisible', true,
	'Scale', 160,
	'Spot', "Particle",
	'SpotsPercent', 100,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "AlienDiggerLanding",
	'Moment', "pre-hit-ground-2",
	'Actor', "AlienDigger",
	'DetailLevel', 60,
	'Delay', 250,
	'Time', 10000,
	'Particles', "AlienDigger_Landing_Explosion",
	'Flags', "OnGround",
	'AlwaysVisible', true,
	'Scale', 120,
	'SpotsPercent', 100,
})

PlaceObj('ActionFXParticles', {
	'Action', "AlienDiggerLanding",
	'Moment', "pre-hit-ground-2",
	'Actor', "AlienDiggerBig",
	'DetailLevel', 60,
	'Delay', 250,
	'Time', 10000,
	'Particles', "AlienDigger_Landing_Explosion",
	'Flags', "OnGround",
	'AlwaysVisible', true,
	'Scale', 220,
	'SpotsPercent', 100,
})

PlaceObj('ActionFXParticles', {
	'Action', "AlienDiggerLanding",
	'Moment', "start",
	'Actor', "AlienDigger",
	'DetailLevel', 40,
	'EndMoment1', "hit-ground",
	'EndMoment2', "end",
	'handle', 1702375096,
	'Particles', "AlienDigger_Landing_Lines",
	'SpotsPercent', 100,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "AlienDiggerLanding",
	'Moment', "start",
	'Actor', "AlienDigger",
	'DetailLevel', 60,
	'EndMoment1', "hit-ground",
	'handle', 1741439970,
	'Particles', "AlienDigger_Landing_Trail",
	'AlwaysVisible', true,
	'Scale', 40,
	'Spot', "Particle",
	'SpotsPercent', 100,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "AlienDiggerLanding",
	'Moment', "start",
	'Actor', "AlienDiggerBig",
	'DetailLevel', 40,
	'EndMoment1', "hit-ground",
	'EndMoment2', "end",
	'handle', 77587906,
	'Particles', "AlienDigger_Landing_Lines",
	'Scale', 200,
	'SpotsPercent', 100,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "AlienDiggerLanding",
	'Moment', "start",
	'Actor', "AlienDiggerBig",
	'DetailLevel', 60,
	'EndMoment1', "hit-ground",
	'handle', 1838925717,
	'Particles', "AlienDigger_Landing_Trail_Big",
	'AlwaysVisible', true,
	'Scale', 80,
	'Spot', "Particle",
	'SpotsPercent', 100,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "AlienDiggerTakeoff",
	'Moment', "start",
	'Actor', "AlienDigger",
	'DetailLevel', 40,
	'Time', 1000,
	'EndMoment1', "end",
	'handle', 1857962760,
	'Particles', "AlienDigger_Landing_Lines",
	'Flags', "Mirrored",
	'SpotsPercent', 100,
	'Attach', true,
	'Orientation', "SpotZ",
})

PlaceObj('ActionFXParticles', {
	'Action', "AlienDiggerTakeoff",
	'Moment', "start",
	'Actor', "AlienDigger",
	'DetailLevel', 60,
	'Delay', 100,
	'Time', 10000,
	'EndMoment1', "end",
	'handle', 1750737710,
	'Particles', "AlienDigger_Launch",
	'AlwaysVisible', true,
	'SpotsPercent', 100,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "AlienDiggerTakeoff",
	'Moment', "start",
	'Actor', "AlienDigger",
	'DetailLevel', 60,
	'EndMoment1', "hit-ground",
	'handle', 242054801,
	'Particles', "AlienDigger_Landing_Trail",
	'AlwaysVisible', true,
	'Scale', 40,
	'Spot', "Particle",
	'SpotsPercent', 100,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "AlienDiggerTakeoff",
	'Moment', "start",
	'Actor', "AlienDigger",
	'DetailLevel', 60,
	'Time', 10000,
	'EndMoment1', "end",
	'handle', 886620901,
	'Particles', "AlienDigger_LaunchSmoke",
	'AlwaysVisible', true,
	'SpotsPercent', 100,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "AlienDiggerTakeoff",
	'Moment', "start",
	'Actor', "AlienDiggerBig",
	'DetailLevel', 40,
	'Time', 1000,
	'EndMoment1', "end",
	'handle', 1786201516,
	'Particles', "AlienDigger_Landing_Lines",
	'Flags', "Mirrored",
	'Scale', 200,
	'SpotsPercent', 100,
	'Attach', true,
	'Orientation', "SpotZ",
})

PlaceObj('ActionFXParticles', {
	'Action', "AlienDiggerTakeoff",
	'Moment', "start",
	'Actor', "AlienDiggerBig",
	'DetailLevel', 60,
	'Delay', 100,
	'Time', 10000,
	'EndMoment1', "end",
	'handle', 2073879263,
	'Particles', "AlienDigger_Launch",
	'AlwaysVisible', true,
	'Scale', 200,
	'SpotsPercent', 100,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "AlienDiggerTakeoff",
	'Moment', "start",
	'Actor', "AlienDiggerBig",
	'DetailLevel', 60,
	'EndMoment1', "hit-ground",
	'handle', 278486630,
	'Particles', "AlienDigger_Landing_Trail_Big",
	'AlwaysVisible', true,
	'Scale', 80,
	'Spot', "Particle",
	'SpotsPercent', 100,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "AlienDiggerTakeoff",
	'Moment', "start",
	'Actor', "AlienDiggerBig",
	'DetailLevel', 60,
	'Time', 10000,
	'EndMoment1', "end",
	'handle', 946882393,
	'Particles', "AlienDigger_LaunchSmoke_Big",
	'AlwaysVisible', true,
	'SpotsPercent', 100,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "ArtificialSunCharge",
	'Moment', "start",
	'Target', "ignore",
	'EndMoment1', "end",
	'handle', 1912564986,
	'Particles', "ArtificialSun_Lasers_Charge",
	'Scale', 20,
	'Spot', "Beam",
	'SpotsPercent', 100,
	'Attach', true,
	'OrientationAxis', -3,
})

PlaceObj('ActionFXParticles', {
	'Action', "ArtificialSunCharge",
	'Moment', "start",
	'Target', "ignore",
	'EndMoment1', "end",
	'handle', 611092961,
	'Particles', "ArtificialSun_Flare_Charge",
	'Scale', 60,
	'Spot', "Base",
	'SpotsPercent', 100,
	'Attach', true,
	'Offset', point(0, 0, 1250),
	'OrientationAxis', -3,
})

PlaceObj('ActionFXParticles', {
	'Action', "ArtificialSunProduce",
	'Moment', "start",
	'Target', "ignore",
	'EndMoment1', "end",
	'handle', 1872530848,
	'Particles', "ArtificialSun_Flare_Produce",
	'Scale', 60,
	'Spot', "Base",
	'SpotsPercent', 100,
	'Attach', true,
	'Offset', point(0, 0, 1250),
	'OrientationAxis', -3,
})

PlaceObj('ActionFXParticles', {
	'Action', "ArtificialSunProduce",
	'Moment', "start",
	'Target', "ignore",
	'EndMoment1', "end",
	'handle', 340918211,
	'Particles', "ArtificialSun_Lasers_Charge",
	'Scale', 20,
	'Spot', "Beam",
	'SpotsPercent', 100,
	'Attach', true,
	'OrientationAxis', -3,
})

PlaceObj('ActionFXParticles', {
	'Action', "BlackCubeDemolishBuilding",
	'Moment', "hit",
	'Target', "ignore",
	'DetailLevel', 40,
	'Particles', "BlackCubeDemolishBuilding",
	'Scale', 120,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Breakdown",
	'Moment', "start",
	'Actor', "Drone",
	'Target', "ignore",
	'EndMoment1', "end",
	'handle', 2104076008,
	'Particles', "Drone_Breakdown",
	'Spot', "Lantern",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "BuildingBigDemolishInside",
	'Moment', "start",
	'Target', "ignore",
	'DetailLevel', 60,
	'Time', 5000,
	'Particles', "Construction_DemolishBuilding_Inside",
	'Flags', "LockedOrientation",
	'Source', "ActionPos",
})

PlaceObj('ActionFXParticles', {
	'Action', "BuildingBigDemolishOutside",
	'Moment', "start",
	'Target', "ignore",
	'DetailLevel', 60,
	'Time', 5000,
	'Particles', "Construction_DemolishBuilding_Big",
	'Flags', "LockedOrientation",
	'Source', "ActionPos",
})

PlaceObj('ActionFXParticles', {
	'Action', "BuildingBigPlaceInside",
	'Moment', "start",
	'Actor', "ConstructionSite",
	'Target', "ignore",
	'DetailLevel', 60,
	'Disabled', true,
	'Time', 10000,
	'Particles', "Construction_PlaceBuilding",
	'Flags', "LockedOrientation",
	'Source', "ActionPos",
})

PlaceObj('ActionFXParticles', {
	'Action', "BuildingBigPlaceOutside",
	'Moment', "start",
	'Actor', "ConstructionSite",
	'Target', "ignore",
	'DetailLevel', 60,
	'Disabled', true,
	'Time', 10000,
	'Particles', "Construction_PlaceBuilding",
	'Flags', "LockedOrientation",
	'Source', "ActionPos",
})

PlaceObj('ActionFXParticles', {
	'Action', "BuildingBigRemoveInside",
	'Moment', "start",
	'Target', "ignore",
	'DetailLevel', 60,
	'Disabled', true,
	'Time', 5000,
	'Particles', "Construction_RemoveBuilding_Inside",
	'Flags', "LockedOrientation",
	'Source', "ActionPos",
})

PlaceObj('ActionFXParticles', {
	'Action', "BuildingBigRemoveOutside",
	'Moment', "start",
	'Target', "ignore",
	'DetailLevel', 60,
	'Time', 5000,
	'Particles', "Construction_RemoveBuilding_Big",
	'Flags', "LockedOrientation",
	'Source', "ActionPos",
})

PlaceObj('ActionFXParticles', {
	'Action', "BuildingInteractableComponent",
	'Moment', "close_start",
	'Actor', "SolarArray",
	'Target', "ignore",
	'DetailLevel', 60,
	'Disabled', true,
	'Time', 3200,
	'EndMoment1', "close",
	'Particles', "SolarPanel_Close",
	'Spot', "Light2",
	'SpotsPercent', 100,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "BuildingInteractableComponent",
	'Moment', "open",
	'Actor', "SolarArray",
	'Target', "ignore",
	'DetailLevel', 40,
	'Disabled', true,
	'EndMoment1', "close_start",
	'Particles', "SolarPanel_Blinks",
	'Spot', "Light",
	'SpotsPercent', 100,
	'Attach', true,
	'OrientationAxis', 3,
})

PlaceObj('ActionFXParticles', {
	'Action', "BuildingInteractableComponent",
	'Moment', "open",
	'Actor', "SolarArray",
	'Target', "ignore",
	'DetailLevel', 40,
	'Disabled', true,
	'EndMoment1', "close_start",
	'Particles', "SolarPanel_SunDust",
	'Spot', "Light",
	'SpotsPercent', 100,
	'Attach', true,
	'OrientationAxis', 3,
})

PlaceObj('ActionFXParticles', {
	'Action', "BuildingInteractableComponent",
	'Moment', "open",
	'Actor', "SolarPanel",
	'Target', "ignore",
	'DetailLevel', 40,
	'Disabled', true,
	'EndMoment1', "close_start",
	'Particles', "SolarPanel_Blinks",
	'Spot', "Light",
	'Attach', true,
	'OrientationAxis', 3,
})

PlaceObj('ActionFXParticles', {
	'Action', "BuildingInteractableComponent",
	'Moment', "open",
	'Actor', "SolarPanel",
	'Target', "ignore",
	'DetailLevel', 40,
	'Disabled', true,
	'EndMoment1', "close_start",
	'Particles', "SolarPanel_SunDust",
	'Spot', "Light",
	'Attach', true,
	'OrientationAxis', 3,
})

PlaceObj('ActionFXParticles', {
	'Action', "BuildingInteractableComponent",
	'Moment', "open",
	'Actor', "SolarPanelBig",
	'Target', "ignore",
	'DetailLevel', 40,
	'Disabled', true,
	'EndMoment1', "close_start",
	'Particles', "SolarPanelBig_Blinks",
	'Spot', "Light",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "BuildingInteractableComponent",
	'Moment', "open",
	'Actor', "SolarPanelBig",
	'Target', "ignore",
	'DetailLevel', 40,
	'Disabled', true,
	'EndMoment1', "close_start",
	'Particles', "SolarPanel_SunDust",
	'Scale', 200,
	'Spot', "Light",
	'Attach', true,
	'OrientationAxis', 3,
})

PlaceObj('ActionFXParticles', {
	'Action', "BuildingInteractableComponent",
	'Moment', "open_start",
	'Actor', "SolarArray",
	'Target', "ignore",
	'DetailLevel', 60,
	'Disabled', true,
	'Delay', 1000,
	'Time', 4500,
	'EndMoment1', "open",
	'Particles', "SolarPanel_Open",
	'Spot', "Light2",
	'SpotsPercent', 100,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "BuildingSmallDemolishInside",
	'Moment', "start",
	'Target', "ignore",
	'DetailLevel', 60,
	'Time', 5000,
	'Particles', "Construction_DemolishBuilding_Inside",
	'Flags', "LockedOrientation",
	'Source', "ActionPos",
})

PlaceObj('ActionFXParticles', {
	'Action', "BuildingSmallDemolishOutside",
	'Moment', "start",
	'Target', "ignore",
	'DetailLevel', 60,
	'Time', 5000,
	'Particles', "Construction_DemolishBuilding",
	'Flags', "LockedOrientation",
	'Source', "ActionPos",
})

PlaceObj('ActionFXParticles', {
	'Action', "BuildingSmallPlaceInside",
	'Moment', "start",
	'Actor', "ConstructionSite",
	'Target', "ignore",
	'DetailLevel', 60,
	'Disabled', true,
	'Time', 10000,
	'Particles', "Construction_PlaceBuilding",
	'Flags', "LockedOrientation",
	'Source', "ActionPos",
})

PlaceObj('ActionFXParticles', {
	'Action', "BuildingSmallPlaceInside",
	'Moment', "start",
	'Actor', "ConstructionSite",
	'Target', "ignore",
	'DetailLevel', 60,
	'Disabled', true,
	'Time', 10000,
	'Particles', "Construction_PlaceBuilding_Inside",
	'Flags', "LockedOrientation",
	'Source', "ActionPos",
})

PlaceObj('ActionFXParticles', {
	'Action', "BuildingSmallPlaceOutside",
	'Moment', "start",
	'Actor', "ConstructionSite",
	'Target', "ignore",
	'DetailLevel', 60,
	'Disabled', true,
	'Time', 10000,
	'Particles', "Construction_PlaceBuilding",
	'Flags', "LockedOrientation",
	'Source', "ActionPos",
})

PlaceObj('ActionFXParticles', {
	'Action', "BuildingSmallPlaceOutside",
	'Moment', "start",
	'Actor', "ConstructionSite",
	'Target', "ignore",
	'DetailLevel', 60,
	'Disabled', true,
	'Time', 10000,
	'Particles', "Construction_PlaceBuilding_Inside",
	'Flags', "LockedOrientation",
	'Source', "ActionPos",
})

PlaceObj('ActionFXParticles', {
	'Action', "BuildingSmallRemoveInside",
	'Moment', "start",
	'Target', "ignore",
	'DetailLevel', 60,
	'Time', 5000,
	'Particles', "Construction_RemoveBuilding_Inside",
	'Flags', "LockedOrientation",
	'Source', "ActionPos",
})

PlaceObj('ActionFXParticles', {
	'Action', "BuildingSmallRemoveOutside",
	'Moment', "start",
	'Target', "ignore",
	'DetailLevel', 60,
	'Time', 5000,
	'Particles', "Construction_RemoveBuilding",
	'Flags', "LockedOrientation",
	'Source', "ActionPos",
})

PlaceObj('ActionFXParticles', {
	'Action', "BurstOut",
	'Moment', "start",
	'Actor', "Geyser_01",
	'Target', "PrefabFeatureMarker",
	'EndMoment1', "end",
	'handle', 1558988116,
	'Particles', "Env_CO2Geyser",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "BurstOut",
	'Moment', "start",
	'Actor', "Geyser_02",
	'Target', "PrefabFeatureMarker",
	'EndMoment1', "end",
	'handle', 499685799,
	'Particles', "Env_CO2Geyser_02",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "BurstOut",
	'Moment', "start",
	'Actor', "Geyser_03",
	'Target', "PrefabFeatureMarker",
	'EndMoment1', "end",
	'handle', 870162794,
	'Particles', "Env_SandGeyser",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Capture",
	'Moment', "start",
	'Actor', "MirrorSphere",
	'Target', "PowerDecoy",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'Behavior', "BehaviorDetachAndDestroy",
	'BehaviorMoment', "end",
	'handle', 1643809009,
	'Particles', "PowerDecoy_Capture",
	'Flags', "OnGround",
	'Scale', 150,
	'Source', "Target",
})

PlaceObj('ActionFXParticles', {
	'Action', "Captured",
	'Moment', "start",
	'Actor', "MirrorSphere",
	'Target', "PowerDecoy",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 717317846,
	'Particles', "PowerDecoy_Captured",
	'Flags', "OnGround",
	'Scale', 150,
	'Source', "Target",
})

PlaceObj('ActionFXParticles', {
	'Action', "ChargedClean",
	'Moment', "start",
	'Actor', "TriboelectricScrubberSphere",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 155984150,
	'Particles', "TriboelectricScrubber_CleanBuilding",
	'ScaleMember', "GetSelectionRadiusScale",
	'Spot', "Ball",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Charging",
	'Moment', "start",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 591310391,
	'Particles', "Rover_Charging",
	'Attach', true,
	'Offset', point(0, 0, 100),
})

PlaceObj('ActionFXParticles', {
	'Action', "Charging",
	'Moment', "start",
	'Target', "ElectricityGridElement",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 1563329989,
	'Particles', "Rover_Charging",
	'Offset', point(0, 0, 100),
})

PlaceObj('ActionFXParticles', {
	'Action', "Clean",
	'Moment', "start",
	'Actor', "Drone",
	'DetailLevel', 40,
	'EndMoment1', "end",
	'handle', 31618428,
	'Particles', "Drone_Clean",
	'Spot', "Righthand",
	'Attach', true,
	'OrientationAxis', 2,
})

PlaceObj('ActionFXParticles', {
	'Action', "Clean",
	'Moment', "start",
	'Actor', "Drone",
	'DetailLevel', 40,
	'EndMoment1', "end",
	'handle', 871479530,
	'Particles', "Drone_Clean",
	'Spot', "Lefthand",
	'Attach', true,
	'OrientationAxis', 2,
})

PlaceObj('ActionFXParticles', {
	'Action', "Clean",
	'Moment', "start",
	'Actor', "RCRover",
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "RCRover_Clean",
	'Spot', "Particle1",
	'Attach', true,
	'OrientationAxis', 2,
})

PlaceObj('ActionFXParticles', {
	'Action', "Clean",
	'Moment', "start",
	'Actor', "RCRover",
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "RCRover_Clean",
	'Spot', "Particle2",
	'Attach', true,
	'OrientationAxis', 2,
})

PlaceObj('ActionFXParticles', {
	'Action', "ClickInteract",
	'Moment', "start",
	'Actor', "RCTransport",
	'DetailLevel', 80,
	'Disabled', true,
	'Time', 500,
	'Particles', "Click",
	'Source', "Target",
})

PlaceObj('ActionFXParticles', {
	'Action', "ClickMove",
	'Moment', "start",
	'Actor', "AttackRover",
	'Time', 500,
	'EndAction1', "ClickMove",
	'EndMoment1', "end",
	'handle', 1585923160,
	'Particles', "Click",
	'Source', "ActionPos",
})

PlaceObj('ActionFXParticles', {
	'Action', "ClickMove",
	'Moment', "start",
	'Actor', "Drone",
	'Time', 500,
	'EndAction1', "ClickMove",
	'EndMoment1', "end",
	'handle', 77670855,
	'Particles', "Click",
	'Source', "ActionPos",
})

PlaceObj('ActionFXParticles', {
	'Action', "ClickMove",
	'Moment', "start",
	'Actor', "ExplorerRover",
	'Time', 500,
	'EndAction1', "ClickMove",
	'EndMoment1', "end",
	'handle', 275555055,
	'Particles', "Click",
	'Source', "ActionPos",
})

PlaceObj('ActionFXParticles', {
	'Action', "ClickMove",
	'Moment', "start",
	'Actor', "RCRover",
	'Time', 500,
	'EndAction1', "ClickMove",
	'EndMoment1', "end",
	'handle', 920183547,
	'Particles', "Click",
	'Source', "ActionPos",
})

PlaceObj('ActionFXParticles', {
	'Action', "ClickMove",
	'Moment', "start",
	'Actor', "RCTransport",
	'Time', 500,
	'EndAction1', "ClickMove",
	'EndMoment1', "end",
	'handle', 571232911,
	'Particles', "Click",
	'Source', "ActionPos",
})

PlaceObj('ActionFXParticles', {
	'Action', "ClickMove",
	'Moment', "start",
	'Actor', "Workshop",
	'Time', 500,
	'EndAction1', "ClickMove",
	'EndMoment1', "end",
	'handle', 875155462,
	'Particles', "Click",
	'Source', "ActionPos",
})

PlaceObj('ActionFXParticles', {
	'Action', "ClickPosMarker",
	'Moment', "start",
	'Actor', "Workshop",
	'Time', 500,
	'EndMoment1', "end",
	'handle', 1605847635,
	'Particles', "Click_Pos",
	'Scale', 200,
	'Source', "ActionPos",
	'Spot', "Center",
})

PlaceObj('ActionFXParticles', {
	'Action', "ColdWave",
	'Moment', "start",
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "Camera_ColdWave",
	'Flags', "OnGround",
	'Source', "Camera",
	'Attach', true,
	'Offset', point(20000, 0, 0),
	'OrientationAxis', 2,
})

PlaceObj('ActionFXParticles', {
	'Action', "Construct",
	'Moment', "start",
	'Actor', "Drone",
	'DetailLevel', 40,
	'EndMoment1', "end",
	'handle', 191691285,
	'Particles', "Drone_Construct",
	'Spot', "Righthand",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Construct",
	'Moment', "start",
	'Actor', "Drone",
	'DetailLevel', 40,
	'EndMoment1', "end",
	'handle', 672170701,
	'Particles', "Drone_Construct",
	'Flags', "Mirrored",
	'Spot', "Lefthand",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Construct",
	'Moment', "start",
	'Actor', "RCRover",
	'Disabled', true,
	'Delay', 500,
	'EndMoment1', "end",
	'Particles', "RCRover_Construction_01",
	'Spot', "Particle1",
	'Attach', true,
	'OrientationAxis', 2,
})

PlaceObj('ActionFXParticles', {
	'Action', "Construct",
	'Moment', "start",
	'Actor', "RCRover",
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "RCRover_Construction_02",
	'Spot', "Particle2",
	'Attach', true,
	'OrientationAxis', 2,
})

PlaceObj('ActionFXParticles', {
	'Action', "ConstructingDrones",
	'Moment', "Hit1",
	'Actor', "DroneHub",
	'DetailLevel', 40,
	'EndMoment1', "End1",
	'EndMoment2', "end",
	'handle', 1596320585,
	'Particles', "DroneHub_Construciton",
	'Source', "Target",
	'Spot', "Particle",
	'SpotsPercent', 100,
	'Attach', true,
	'OrientationAxis', 2,
})

PlaceObj('ActionFXParticles', {
	'Action', "ConstructingDrones",
	'Moment', "Hit2",
	'Actor', "DroneHub",
	'DetailLevel', 40,
	'EndMoment1', "End2",
	'EndMoment2', "end",
	'handle', 556279411,
	'Particles', "DroneHub_Construciton",
	'Source', "Target",
	'Spot', "Particle",
	'SpotsPercent', 100,
	'Attach', true,
	'OrientationAxis', 2,
})

PlaceObj('ActionFXParticles', {
	'Action', "ConstructingDrones",
	'Moment', "Hit3",
	'Actor', "DroneHub",
	'DetailLevel', 40,
	'EndMoment1', "End3",
	'EndMoment2', "end",
	'handle', 793738565,
	'Particles', "DroneHub_Construciton",
	'Source', "Target",
	'Spot', "Particle",
	'SpotsPercent', 100,
	'Attach', true,
	'OrientationAxis', 2,
})

PlaceObj('ActionFXParticles', {
	'Action', "ConstructingDrones",
	'Moment', "Hit4",
	'Actor', "DroneHub",
	'DetailLevel', 40,
	'EndMoment1', "End4",
	'EndMoment2', "end",
	'handle', 1191098491,
	'Particles', "DroneHub_Construciton",
	'Source', "Target",
	'Spot', "Particle",
	'SpotsPercent', 100,
	'Attach', true,
	'OrientationAxis', 2,
})

PlaceObj('ActionFXParticles', {
	'Action', "ConstructionCursor",
	'Moment', "start",
	'Actor', "CursorBuilding",
	'Target', "SensorTower",
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "Selection_Building_Area",
	'ScaleMember', "GetSelectionRadiusScale",
	'Spot', "Center",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "ConstructionCursor",
	'Moment', "start",
	'Target', "DroneHub",
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "Selection_Building_Area",
	'ScaleMember', "GetSelectionRadiusScale",
	'Spot', "Center",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "ConstructionCursor",
	'Moment', "start",
	'Target', "MetalsExtractor",
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "Selection_Mine_Area",
	'ScaleMember', "GetSelectionRadiusScale",
	'Spot', "Center",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "ConstructionCursor",
	'Moment', "start",
	'Target', "RegolithExtractor",
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "Selection_Mine_Area",
	'ScaleMember', "GetSelectionRadiusScale",
	'Spot', "Center",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "ConstructionCursor",
	'Moment', "start",
	'Target', "SubsurfaceHeater",
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "Selection_Mine_Area",
	'ScaleMember', "GetSelectionRadiusScale",
	'Spot', "Center",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "ConstructionCursor",
	'Moment', "start",
	'Target', "TriboelectricScrubber",
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "Selection_Mine_Area",
	'ScaleMember', "GetSelectionRadiusScale",
	'Spot', "Center",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "ConstructionCursor",
	'Moment', "start",
	'Target', "WaterExtractor",
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "Selection_Mine_Area",
	'ScaleMember', "GetSelectionRadiusScale",
	'Spot', "Center",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Dead",
	'Moment', "start",
	'Target', "ignore",
	'DetailLevel', 40,
	'Time', 5000,
	'Particles', "Drone_Dead_Smoke",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Deconstruct",
	'Moment', "end",
	'Actor', "AlienDigger",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'Particles', "AlienDigger_Destruction",
	'Flags', "OnGround",
	'AlwaysVisible', true,
	'Scale', 150,
	'SpotsPercent', 100,
})

PlaceObj('ActionFXParticles', {
	'Action', "Deconstruct",
	'Moment', "end",
	'Actor', "AlienDiggerBig",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'Particles', "AlienDigger_Destruction",
	'Flags', "OnGround",
	'AlwaysVisible', true,
	'Scale', 200,
	'SpotsPercent', 100,
})

PlaceObj('ActionFXParticles', {
	'Action', "Deconstruct",
	'Moment', "start",
	'Actor', "AlienDigger",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'EndAction2', "AlienDiggerTakeoff",
	'EndMoment2', "start",
	'handle', 795683759,
	'Particles', "AlienDigger_Deconstruct",
	'SpotsPercent', 100,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Deconstruct",
	'Moment', "start",
	'Actor', "AlienDiggerBig",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'EndAction2', "AlienDiggerTakeoff",
	'EndMoment2', "start",
	'handle', 94999724,
	'Particles', "AlienDigger_Deconstruct",
	'Scale', 190,
	'SpotsPercent', 100,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Deconstruct",
	'Moment', "start",
	'Actor', "Drone",
	'DetailLevel', 40,
	'EndMoment1', "end",
	'handle', 1124406887,
	'Particles', "Drone_Deconstruct",
	'Spot', "Righthand",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Deconstruct",
	'Moment', "start",
	'Actor', "Drone",
	'DetailLevel', 40,
	'EndMoment1', "end",
	'handle', 893047132,
	'Particles', "Drone_Deconstruct",
	'Flags', "Mirrored",
	'Spot', "Lefthand",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Demolish",
	'Moment', "end",
	'Actor', "ElectricityGridElement",
	'DetailLevel', 60,
	'Time', 500,
	'Particles', "Construction_RemoveBuilding",
	'Flags', "OnGround",
	'Spot', "Center",
})

PlaceObj('ActionFXParticles', {
	'Action', "Demolish",
	'Moment', "end",
	'Actor', "LifeSupportGridElement",
	'DetailLevel', 60,
	'Time', 500,
	'Particles', "Construction_RemoveBuilding",
	'Flags', "OnGround",
	'Spot', "Center",
})

PlaceObj('ActionFXParticles', {
	'Action', "Demolish",
	'Moment', "end",
	'Disabled', true,
	'Time', 500,
	'Particles', "Building_Destruction_Inside",
	'Flags', "OnGround",
	'Scale', 120,
	'Spot', "Center",
})

PlaceObj('ActionFXParticles', {
	'Action', "Dig",
	'Moment', "hit-moment1",
	'Actor', "MirrorSphere",
	'Target', "ignore",
	'DetailLevel', 40,
	'Time', 3000,
	'EndMoment1', "end",
	'handle', 1556751352,
	'Particles', "MirrorSphere_Dig",
	'Flags', "OnGround",
	'Spot', "Center",
	'Offset', point(0, 0, 1000),
})

PlaceObj('ActionFXParticles', {
	'Action', "Dig",
	'Moment', "hit-moment2",
	'Actor', "MirrorSphere",
	'Target', "ignore",
	'DetailLevel', 40,
	'Time', 3000,
	'EndMoment1', "end",
	'handle', 895669484,
	'Particles', "MirrorSphere_Dig",
	'Flags', "OnGround",
	'Scale', 125,
	'Spot', "Center",
	'Offset', point(0, 0, 1000),
})

PlaceObj('ActionFXParticles', {
	'Action', "Dig",
	'Moment', "hit-moment3",
	'Actor', "MirrorSphere",
	'Target', "ignore",
	'DetailLevel', 40,
	'Time', 3000,
	'EndMoment1', "end",
	'handle', 1129804633,
	'Particles', "MirrorSphere_Dig",
	'Flags', "OnGround",
	'Scale', 150,
	'Spot', "Center",
	'Offset', point(0, 0, 1000),
})

PlaceObj('ActionFXParticles', {
	'Action', "Discharging",
	'Moment', "start",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 757623046,
	'Particles', "Rover_Discharging",
	'Scale', 150,
	'Spot', "Particle1",
	'Attach', true,
	'Offset', point(0, -200, 0),
})

PlaceObj('ActionFXParticles', {
	'Action', "DomeExplosion",
	'Moment', "start",
	'Target', "ignore",
	'DetailLevel', 60,
	'Particles', "Meteor_Explosion_Dome",
	'AlwaysVisible', true,
	'Scale', 120,
	'Source', "ActionPos",
})

PlaceObj('ActionFXParticles', {
	'Action', "DroneExplode",
	'Moment', "start",
	'Target', "ignore",
	'DetailLevel', 60,
	'Particles', "Drone_Explode",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "DroneRechargeCoilArc",
	'Moment', "start",
	'Actor', "RechargeStation",
	'Target', "Drone",
	'DetailLevel', 60,
	'Time', 5000,
	'Particles', "Drone_WirelessCharging",
	'Source', "Target",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "DroneRechargePulse",
	'Moment', "start",
	'Actor', "RechargeStation",
	'Target', "ignore",
	'Time', 5000,
	'Particles', "RechargeStation_WirelessCharging",
})

PlaceObj('ActionFXParticles', {
	'Action', "Drop",
	'Moment', "start",
	'Actor', "ConstructionSite",
	'DetailLevel', 60,
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "ConstructionSite_Spawn",
})

PlaceObj('ActionFXParticles', {
	'Action', "Drop",
	'Moment', "start",
	'Actor', "RCRover",
	'Target', "ignore",
	'DetailLevel', 60,
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "ConstructionSite_Spawn",
	'Scale', 150,
})

PlaceObj('ActionFXParticles', {
	'Action', "Drop",
	'Moment', "start",
	'Actor', "ResourceStockpile",
	'Target', "ignore",
	'DetailLevel', 60,
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "ConstructionSite_Spawn",
})

PlaceObj('ActionFXParticles', {
	'Action', "Dust",
	'Moment', "start",
	'Actor', "Shuttle",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 1986624365,
	'Particles', "Shuttle_LaunchSmoke",
	'SpotsPercent', 100,
	'Attach', true,
	'Offset', point(0, 0, 100),
})

PlaceObj('ActionFXParticles', {
	'Action', "DustStorm",
	'Moment', "start",
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "DustStorm",
	'Source', "Camera",
	'Attach', true,
	'OffsetDir', "",
})

PlaceObj('ActionFXParticles', {
	'Action', "DustStorm",
	'Moment', "start",
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "Test__Env_Rain",
	'Source', "Camera",
	'Attach', true,
	'OffsetDir', "",
})

PlaceObj('ActionFXParticles', {
	'Action', "Electrostatic",
	'Moment', "end",
	'Actor', "DustDevil1",
	'DetailLevel', 60,
	'Particles', "DustDevil_Electrostatic_End",
	'AlwaysVisible', true,
	'Scale', 400,
})

PlaceObj('ActionFXParticles', {
	'Action', "Electrostatic",
	'Moment', "end",
	'Actor', "DustDevil2",
	'DetailLevel', 60,
	'Particles', "DustDevil_Electrostatic_End",
	'AlwaysVisible', true,
	'Scale', 400,
})

PlaceObj('ActionFXParticles', {
	'Action', "Electrostatic",
	'Moment', "end",
	'Actor', "DustDevilMajor1",
	'DetailLevel', 60,
	'Particles', "DustDevil_Electrostatic_End",
	'AlwaysVisible', true,
	'Scale', 800,
})

PlaceObj('ActionFXParticles', {
	'Action', "Electrostatic",
	'Moment', "end",
	'Actor', "DustDevilMajor2",
	'DetailLevel', 60,
	'Particles', "DustDevil_Electrostatic_End",
	'AlwaysVisible', true,
	'Scale', 800,
})

PlaceObj('ActionFXParticles', {
	'Action', "Electrostatic",
	'Moment', "start",
	'Actor', "DustDevil1",
	'Behavior', "BehaviorDetachAndDestroy",
	'BehaviorMoment', "end",
	'handle', 766838729,
	'Particles', "DustDevil_Electrostattic",
	'AlwaysVisible', true,
	'Scale', 400,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Electrostatic",
	'Moment', "start",
	'Actor', "DustDevil2",
	'Behavior', "BehaviorDetachAndDestroy",
	'BehaviorMoment', "end",
	'handle', 1212499477,
	'Particles', "DustDevil_Electrostattic",
	'AlwaysVisible', true,
	'Scale', 400,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Electrostatic",
	'Moment', "start",
	'Actor', "DustDevilMajor1",
	'Behavior', "BehaviorDetachAndDestroy",
	'BehaviorMoment', "end",
	'handle', 340353600,
	'Particles', "DustDevil_Electrostattic",
	'AlwaysVisible', true,
	'Scale', 800,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Electrostatic",
	'Moment', "start",
	'Actor', "DustDevilMajor2",
	'Behavior', "BehaviorDetachAndDestroy",
	'BehaviorMoment', "end",
	'handle', 1277454235,
	'Particles', "DustDevil_Electrostattic",
	'AlwaysVisible', true,
	'Scale', 800,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "ElectrostaticStorm",
	'Moment', "hit-moment1",
	'Target', "ignore",
	'DetailLevel', 40,
	'Particles', "ElStorm_Clouds",
	'AlwaysVisible', true,
	'Source', "ActionPos",
})

PlaceObj('ActionFXParticles', {
	'Action', "ElectrostaticStorm",
	'Moment', "hit-moment1",
	'Target', "ignore",
	'Particles', "ElStorm_Lightning_01",
	'AlwaysVisible', true,
	'Scale', 200,
	'Source', "ActionPos",
})

PlaceObj('ActionFXParticles', {
	'Action', "ElectrostaticStorm",
	'Moment', "hit-moment2",
	'Target', "ignore",
	'DetailLevel', 40,
	'Particles', "ElStorm_Clouds",
	'AlwaysVisible', true,
	'Source', "ActionPos",
})

PlaceObj('ActionFXParticles', {
	'Action', "ElectrostaticStorm",
	'Moment', "hit-moment2",
	'Target', "ignore",
	'Particles', "ElStorm_Lightning_02",
	'AlwaysVisible', true,
	'Source', "ActionPos",
})

PlaceObj('ActionFXParticles', {
	'Action', "ElectrostaticStorm",
	'Moment', "hit-moment3",
	'Target', "ignore",
	'DetailLevel', 40,
	'Particles', "ElStorm_Clouds",
	'AlwaysVisible', true,
	'Source', "ActionPos",
})

PlaceObj('ActionFXParticles', {
	'Action', "ElectrostaticStorm",
	'Moment', "hit-moment3",
	'Target', "ignore",
	'Particles', "ElStorm_Lightning_03",
	'AlwaysVisible', true,
	'Source', "ActionPos",
})

PlaceObj('ActionFXParticles', {
	'Action', "ElectrostaticStorm",
	'Moment', "hit-moment4",
	'Target', "ignore",
	'DetailLevel', 40,
	'Particles', "ElStorm_Clouds",
	'AlwaysVisible', true,
	'Source', "ActionPos",
})

PlaceObj('ActionFXParticles', {
	'Action', "ElectrostaticStorm",
	'Moment', "hit-moment4",
	'Target', "ignore",
	'Particles', "ElStorm_Lightning_01",
	'AlwaysVisible', true,
	'Source', "ActionPos",
})

PlaceObj('ActionFXParticles', {
	'Action', "ElectrostaticStorm",
	'Moment', "start",
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "Camera_ElectrostaticStorm",
	'Flags', "OnGround",
	'Source', "Camera",
	'Attach', true,
	'Offset', point(20000, 0, 0),
	'OrientationAxis', 2,
})

PlaceObj('ActionFXParticles', {
	'Action', "ElectrostaticStormArea",
	'Moment', "start",
	'Target', "ignore",
	'Time', 15000,
	'Particles', "ElStorm_Lightning_01_Area",
	'Scale', 400,
	'Source', "ActionPos",
})

PlaceObj('ActionFXParticles', {
	'Action', "EmergencyPower",
	'Moment', "start",
	'Actor', "Drone",
	'Target', "ignore",
	'EndMoment1', "end",
	'handle', 583284500,
	'Particles', "Drone_Emergency",
	'Spot', "Lantern",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "EmergencyRecharge",
	'Moment', "hooking",
	'Actor', "Drone",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 929162598,
	'Particles', "Drone_Recharge_Emergency",
	'Spot', "Headlight",
	'Attach', true,
	'Offset', point(130, 0, 0),
})

PlaceObj('ActionFXParticles', {
	'Action', "EmergencyRecharge",
	'Moment', "start",
	'Actor', "Drone",
	'DetailLevel', 40,
	'Delay', 2800,
	'EndMoment1', "end",
	'handle', 622014909,
	'Particles', "Drone_EM_Recharge_Hands",
	'Spot', "Righthand",
	'Attach', true,
	'Offset', point(0, 20, 0),
})

PlaceObj('ActionFXParticles', {
	'Action', "EmergencyRecharge",
	'Moment', "start",
	'Actor', "Drone",
	'DetailLevel', 40,
	'Delay', 2800,
	'EndMoment1', "end",
	'handle', 76954587,
	'Particles', "Drone_EM_Recharge_Hands",
	'Spot', "Lefthand",
	'Attach', true,
	'Offset', point(0, 20, 0),
})

PlaceObj('ActionFXParticles', {
	'Action', "ExcavatorDigging",
	'Moment', "Hit1",
	'Actor', "ExcavatorShovel",
	'DetailLevel', 60,
	'EndMoment1', "Out1",
	'EndMoment2', "end",
	'handle', 1229058711,
	'Particles', "Excavator_Shovel_Dig",
	'Spot', "Particle1",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "ExcavatorDigging",
	'Moment', "Hit10",
	'Actor', "ExcavatorShovel",
	'DetailLevel', 60,
	'EndMoment1', "Out10",
	'EndMoment2', "end",
	'handle', 1814009259,
	'Particles', "Excavator_Shovel_Dig",
	'Spot', "Particle10",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "ExcavatorDigging",
	'Moment', "Hit11",
	'Actor', "ExcavatorShovel",
	'DetailLevel', 60,
	'EndMoment1', "Out11",
	'EndMoment2', "end",
	'handle', 1044340999,
	'Particles', "Excavator_Shovel_Dig",
	'Spot', "Particle11",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "ExcavatorDigging",
	'Moment', "Hit12",
	'Actor', "ExcavatorShovel",
	'DetailLevel', 60,
	'EndMoment1', "Out12",
	'EndMoment2', "end",
	'handle', 1924406229,
	'Particles', "Excavator_Shovel_Dig",
	'Spot', "Particle12",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "ExcavatorDigging",
	'Moment', "Hit2",
	'Actor', "ExcavatorShovel",
	'DetailLevel', 60,
	'EndMoment1', "Out2",
	'EndMoment2', "end",
	'handle', 1580766137,
	'Particles', "Excavator_Shovel_Dig",
	'Spot', "Particle2",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "ExcavatorDigging",
	'Moment', "Hit3",
	'Actor', "ExcavatorShovel",
	'DetailLevel', 60,
	'EndMoment1', "Out3",
	'EndMoment2', "end",
	'handle', 943797499,
	'Particles', "Excavator_Shovel_Dig",
	'Spot', "Particle3",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "ExcavatorDigging",
	'Moment', "Hit4",
	'Actor', "ExcavatorShovel",
	'DetailLevel', 60,
	'EndMoment1', "Out4",
	'EndMoment2', "end",
	'handle', 1234553762,
	'Particles', "Excavator_Shovel_Dig",
	'Spot', "Particle4",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "ExcavatorDigging",
	'Moment', "Hit5",
	'Actor', "ExcavatorShovel",
	'DetailLevel', 60,
	'EndMoment1', "Out5",
	'EndMoment2', "end",
	'handle', 685167536,
	'Particles', "Excavator_Shovel_Dig",
	'Spot', "Particle5",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "ExcavatorDigging",
	'Moment', "Hit6",
	'Actor', "ExcavatorShovel",
	'DetailLevel', 60,
	'EndMoment1', "Out6",
	'EndMoment2', "end",
	'handle', 975300927,
	'Particles', "Excavator_Shovel_Dig",
	'Spot', "Particle6",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "ExcavatorDigging",
	'Moment', "Hit7",
	'Actor', "ExcavatorShovel",
	'DetailLevel', 60,
	'EndMoment1', "Out7",
	'EndMoment2', "end",
	'handle', 2010674702,
	'Particles', "Excavator_Shovel_Dig",
	'Spot', "Particle7",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "ExcavatorDigging",
	'Moment', "Hit8",
	'Actor', "ExcavatorShovel",
	'DetailLevel', 60,
	'EndMoment1', "Out8",
	'EndMoment2', "end",
	'handle', 2090870590,
	'Particles', "Excavator_Shovel_Dig",
	'Spot', "Particle8",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "ExcavatorDigging",
	'Moment', "Hit9",
	'Actor', "ExcavatorShovel",
	'DetailLevel', 60,
	'EndMoment1', "Out9",
	'EndMoment2', "end",
	'handle', 1701891853,
	'Particles', "Excavator_Shovel_Dig",
	'Spot', "Particle9",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "ExcavatorDigging",
	'Moment', "Out1",
	'Actor', "ExcavatorShovel",
	'DetailLevel', 60,
	'Time', 5000,
	'EndMoment1', "end",
	'handle', 1832530462,
	'Particles', "Excavator_Shovel_Throw",
	'Spot', "Particle1",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "ExcavatorDigging",
	'Moment', "Out10",
	'Actor', "ExcavatorShovel",
	'DetailLevel', 60,
	'Time', 5000,
	'EndMoment1', "end",
	'handle', 265019335,
	'Particles', "Excavator_Shovel_Throw",
	'Spot', "Particle10",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "ExcavatorDigging",
	'Moment', "Out11",
	'Actor', "ExcavatorShovel",
	'DetailLevel', 60,
	'Time', 5000,
	'EndMoment1', "end",
	'handle', 1679438606,
	'Particles', "Excavator_Shovel_Throw",
	'Spot', "Particle11",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "ExcavatorDigging",
	'Moment', "Out12",
	'Actor', "ExcavatorShovel",
	'DetailLevel', 60,
	'Time', 5000,
	'EndMoment1', "end",
	'handle', 1456641064,
	'Particles', "Excavator_Shovel_Throw",
	'Spot', "Particle12",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "ExcavatorDigging",
	'Moment', "Out2",
	'Actor', "ExcavatorShovel",
	'DetailLevel', 60,
	'Time', 5000,
	'EndMoment1', "end",
	'handle', 134122140,
	'Particles', "Excavator_Shovel_Throw",
	'Spot', "Particle2",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "ExcavatorDigging",
	'Moment', "Out3",
	'Actor', "ExcavatorShovel",
	'DetailLevel', 60,
	'Time', 5000,
	'EndMoment1', "end",
	'handle', 146344676,
	'Particles', "Excavator_Shovel_Throw",
	'Spot', "Particle3",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "ExcavatorDigging",
	'Moment', "Out4",
	'Actor', "ExcavatorShovel",
	'DetailLevel', 60,
	'Time', 5000,
	'EndMoment1', "end",
	'handle', 2130912515,
	'Particles', "Excavator_Shovel_Throw",
	'Spot', "Particle4",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "ExcavatorDigging",
	'Moment', "Out5",
	'Actor', "ExcavatorShovel",
	'DetailLevel', 60,
	'Time', 5000,
	'EndMoment1', "end",
	'handle', 1367953511,
	'Particles', "Excavator_Shovel_Throw",
	'Spot', "Particle5",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "ExcavatorDigging",
	'Moment', "Out6",
	'Actor', "ExcavatorShovel",
	'DetailLevel', 60,
	'Time', 5000,
	'EndMoment1', "end",
	'handle', 2087704513,
	'Particles', "Excavator_Shovel_Throw",
	'Spot', "Particle6",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "ExcavatorDigging",
	'Moment', "Out7",
	'Actor', "ExcavatorShovel",
	'DetailLevel', 60,
	'Time', 5000,
	'EndMoment1', "end",
	'handle', 540407678,
	'Particles', "Excavator_Shovel_Throw",
	'Spot', "Particle7",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "ExcavatorDigging",
	'Moment', "Out8",
	'Actor', "ExcavatorShovel",
	'DetailLevel', 60,
	'Time', 5000,
	'EndMoment1', "end",
	'handle', 502179266,
	'Particles', "Excavator_Shovel_Throw",
	'Spot', "Particle8",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "ExcavatorDigging",
	'Moment', "Out9",
	'Actor', "ExcavatorShovel",
	'DetailLevel', 60,
	'Time', 5000,
	'EndMoment1', "end",
	'handle', 133210846,
	'Particles', "Excavator_Shovel_Throw",
	'Spot', "Particle9",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "FarmWater",
	'Moment', "start",
	'Actor', "FarmSprinkler",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'Behavior', "BehaviorDetachAndDestroy",
	'BehaviorMoment', "end",
	'handle', 74047923,
	'Particles', "HydroponicFarm_Shower",
	'Spot', "Particle",
	'SpotsPercent', 100,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Freeze",
	'Moment', "start",
	'Actor', "MirrorSphere",
	'Target', "ignore",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'BehaviorMoment', "end",
	'handle', 72443782,
	'Particles', "MirrorShpere_Freeze",
	'Scale', 150,
	'Spot', "Center",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "FuelExplosion",
	'Moment', "start",
	'Target', "ignore",
	'DetailLevel', 60,
	'Delay', 100,
	'Particles', "MDSLaser_Meteor_Hit",
})

PlaceObj('ActionFXParticles', {
	'Action', "Gather",
	'Moment', "start",
	'Actor', "Drone",
	'Target', "SurfaceDepositMetals",
	'DetailLevel', 40,
	'EndMoment1', "end",
	'handle', 1981238510,
	'Particles', "Drone_Gather_Metals",
	'Spot', "Lefthand",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Gather",
	'Moment', "start",
	'Actor', "Drone",
	'Target', "SurfaceDepositMetals",
	'DetailLevel', 40,
	'EndMoment1', "end",
	'handle', 930363818,
	'Particles', "Drone_Gather_Metals",
	'Spot', "Righthand",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Gather",
	'Moment', "start",
	'Actor', "Drone",
	'Target', "SurfaceDepositPolymers",
	'DetailLevel', 40,
	'EndMoment1', "end",
	'handle', 1051719277,
	'Particles', "Drone_Gather_Polymers",
	'Spot', "Righthand",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Gather",
	'Moment', "start",
	'Actor', "Drone",
	'Target', "SurfaceDepositPolymers",
	'DetailLevel', 40,
	'EndMoment1', "end",
	'handle', 283953348,
	'Particles', "Drone_Gather_Polymers",
	'Spot', "Lefthand",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Gather",
	'Moment', "start",
	'Actor', "RCTransport",
	'DetailLevel', 60,
	'Delay', 500,
	'EndMoment1', "end",
	'handle', 1392401793,
	'Particles', "RCTransport_Load",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Gather",
	'Moment', "start",
	'Actor', "RCTransport",
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "RCRover_Gather_02",
	'Spot', "Particle2",
	'Attach', true,
	'OrientationAxis', 2,
})

PlaceObj('ActionFXParticles', {
	'Action', "GreatStorm",
	'Moment', "start",
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "Camera_GreatDustStorm",
	'Flags', "OnGround",
	'Source', "Camera",
	'Attach', true,
	'Offset', point(20000, 0, 0),
	'OrientationAxis', 2,
})

PlaceObj('ActionFXParticles', {
	'Action', "GroundExplosion",
	'Moment', "start",
	'Target', "ignore",
	'DetailLevel', 60,
	'Particles', "BombardProjectile_Explosion",
	'AlwaysVisible', true,
	'Scale', 120,
	'Source', "ActionPos",
})

PlaceObj('ActionFXParticles', {
	'Action', "Kill",
	'Moment', "start",
	'Actor', "DustDevil1",
	'Target', "ignore",
	'DetailLevel', 60,
	'Particles', "DustDevil_01_End",
	'AlwaysVisible', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Kill",
	'Moment', "start",
	'Actor', "DustDevil2",
	'Target', "ignore",
	'DetailLevel', 60,
	'Particles', "DustDevil_01_End",
	'AlwaysVisible', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Kill",
	'Moment', "start",
	'Actor', "DustDevilMajor1",
	'Target', "ignore",
	'DetailLevel', 60,
	'Particles', "DustDevil_01_End",
	'AlwaysVisible', true,
	'Scale', 400,
})

PlaceObj('ActionFXParticles', {
	'Action', "Kill",
	'Moment', "start",
	'Actor', "DustDevilMajor2",
	'Target', "ignore",
	'DetailLevel', 60,
	'Particles', "DustDevil_01_End",
	'AlwaysVisible', true,
	'Scale', 400,
})

PlaceObj('ActionFXParticles', {
	'Action', "Land",
	'Moment', "start",
	'Actor', "AttackRover",
	'DetailLevel', 60,
	'Delay', 1000,
	'Behavior', "BehaviorDetachAndDestroy",
	'BehaviorMoment', "end",
	'handle', 867148979,
	'Particles', "AttackRover_Land_Smoke",
	'SpotsPercent', 100,
	'Attach', true,
	'Offset', point(0, 0, 100),
	'OffsetDir', "SourceAxisZ",
})

PlaceObj('ActionFXParticles', {
	'Action', "Land",
	'Moment', "start",
	'Actor', "AttackRover",
	'DetailLevel', 60,
	'Delay', 2500,
	'Behavior', "BehaviorDetachAndDestroy",
	'BehaviorMoment', "end",
	'handle', 336486195,
	'Particles', "AttackRover_Land_SpotFire",
	'Flags', "OnGround",
	'SpotsPercent', 100,
	'Attach', true,
	'OffsetDir', "",
	'Orientation', "SourceAxisZ",
})

PlaceObj('ActionFXParticles', {
	'Action', "Land",
	'Moment', "start",
	'Actor', "AttackRover",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 1656630352,
	'Particles', "AttackRover_Land_Ignition",
	'SpotsPercent', 100,
	'Attach', true,
	'OffsetDir', "SourceAxisZ",
})

PlaceObj('ActionFXParticles', {
	'Action', "Land",
	'Moment', "start",
	'Actor', "Shuttle",
	'DetailLevel', 60,
	'Delay', 200,
	'Time', 1000,
	'EndMoment1', "end",
	'handle', 2027129219,
	'Particles', "Shuttle_Sides_Ignition_Start",
	'Spot', "Particle2",
	'SpotsPercent', 100,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Land",
	'Moment', "start",
	'Actor', "Shuttle",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 1097088542,
	'Particles', "Shuttle_Sides_Ignition",
	'Spot', "Particle2",
	'SpotsPercent', 100,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Laser",
	'Moment', "start",
	'Actor', "MDSLaser",
	'DetailLevel', 40,
	'Delay', 200,
	'Particles', "MDSLaser_CatchMeteor",
	'Source', "Target",
	'Attach', true,
	'OffsetDir', "ActionDir",
	'Orientation', "ActionDir",
})

PlaceObj('ActionFXParticles', {
	'Action', "Laser",
	'Moment', "start",
	'Actor', "MDSLaser",
	'DetailLevel', 40,
	'Delay', 200,
	'Particles', "MDSLaser_Shoot",
	'Source', "ActionPos",
	'OffsetDir', "ActionDir",
	'Orientation', "ActionDir",
})

PlaceObj('ActionFXParticles', {
	'Action', "Laser",
	'Moment', "start",
	'Actor', "MDSLaser",
	'DetailLevel', 40,
	'EndMoment1', "end",
	'handle', 1807225086,
	'Particles', "MDSLaser",
	'Source', "ActionPos",
	'OffsetDir', "ActionDir",
	'Orientation', "ActionDir",
})

PlaceObj('ActionFXParticles', {
	'Action', "LaserCooldown",
	'Moment', "start",
	'DetailLevel', 40,
	'EndMoment1', "end",
	'handle', 1099148575,
	'Particles', "MDSLaser_Cooldown",
	'Spot', "Conusdirection",
	'Attach', true,
	'Offset', point(0, 100, 0),
	'Orientation', "SourceAxisX",
	'OrientationAxis', -2,
})

PlaceObj('ActionFXParticles', {
	'Action', "Load",
	'Moment', "start",
	'Actor', "RCTransport",
	'DetailLevel', 60,
	'Delay', 500,
	'EndMoment1', "end",
	'handle', 86461706,
	'Particles', "RCTransport_Load",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Meteor",
	'Moment', "start",
	'Actor', "AttackRover",
	'Target', "ignore",
	'Behavior', "BehaviorDetachAndDestroy",
	'BehaviorMoment', "end",
	'handle', 386613972,
	'Particles', "AttackRover_Trail",
	'AlwaysVisible', true,
	'Scale', 600,
	'Attach', true,
	'OffsetDir', "",
	'Orientation', "SourceAxisZ",
	'OrientationAxis', -1,
})

PlaceObj('ActionFXParticles', {
	'Action', "Meteor",
	'Moment', "start",
	'Actor', "AttackRover",
	'Target', "ignore",
	'EndAction1', "Land",
	'EndMoment1', "start",
	'EndAction2', "Meteor",
	'EndMoment2', "end",
	'handle', 179575055,
	'Particles', "AttackRover_CapsuleGlow",
	'AlwaysVisible', true,
	'Scale', 600,
	'Attach', true,
	'OffsetDir', "",
	'Orientation', "SourceAxisZ",
	'OrientationAxis', -1,
})

PlaceObj('ActionFXParticles', {
	'Action', "Meteor",
	'Moment', "start",
	'Actor', "MeteorLarge1",
	'Target', "ignore",
	'Behavior', "BehaviorDetachAndDestroy",
	'BehaviorMoment', "end",
	'handle', 1814329576,
	'Particles', "Meteor_Trail_01",
	'AlwaysVisible', true,
	'Scale', 150,
	'Attach', true,
	'OffsetDir', "ActionDir",
	'Orientation', "ActionDir",
})

PlaceObj('ActionFXParticles', {
	'Action', "Meteor",
	'Moment', "start",
	'Actor', "MeteorLarge2",
	'Target', "ignore",
	'Behavior', "BehaviorDetachAndDestroy",
	'BehaviorMoment', "end",
	'handle', 115487250,
	'Particles', "Meteor_Trail_01",
	'AlwaysVisible', true,
	'Scale', 150,
	'Attach', true,
	'OffsetDir', "ActionDir",
	'Orientation', "ActionDir",
})

PlaceObj('ActionFXParticles', {
	'Action', "Meteor",
	'Moment', "start",
	'Actor', "MeteorSmall1",
	'Target', "ignore",
	'Behavior', "BehaviorDetachAndDestroy",
	'BehaviorMoment', "end",
	'handle', 58167484,
	'Particles', "Meteor_Trail_01",
	'AlwaysVisible', true,
	'Attach', true,
	'OffsetDir', "ActionDir",
	'Orientation', "ActionDir",
})

PlaceObj('ActionFXParticles', {
	'Action', "Meteor",
	'Moment', "start",
	'Actor', "MeteorSmall2",
	'Target', "ignore",
	'Behavior', "BehaviorDetachAndDestroy",
	'BehaviorMoment', "end",
	'handle', 710061525,
	'Particles', "Meteor_Trail_01",
	'AlwaysVisible', true,
	'Attach', true,
	'OffsetDir', "ActionDir",
	'Orientation', "ActionDir",
})

PlaceObj('ActionFXParticles', {
	'Action', "MeteorExplosion",
	'Moment', "start",
	'Actor', "MeteorLarge1",
	'Target', "ignore",
	'Delay', 100,
	'Particles', "Meteor_Explosion_01",
	'AlwaysVisible', true,
	'Scale', 300,
	'Source', "ActionPos",
})

PlaceObj('ActionFXParticles', {
	'Action', "MeteorExplosion",
	'Moment', "start",
	'Actor', "MeteorLarge1",
	'Target', "ignore",
	'DetailLevel', 60,
	'Delay', 100,
	'Particles', "Meteor_Explosion_01_Flash",
	'AlwaysVisible', true,
	'Scale', 300,
	'Source', "ActionPos",
	'OffsetDir', "ActionDir",
	'Orientation', "ActionDir",
})

PlaceObj('ActionFXParticles', {
	'Action', "MeteorExplosion",
	'Moment', "start",
	'Actor', "MeteorLarge2",
	'Target', "ignore",
	'Delay', 100,
	'Particles', "Meteor_Explosion_01",
	'AlwaysVisible', true,
	'Scale', 300,
	'Source', "ActionPos",
})

PlaceObj('ActionFXParticles', {
	'Action', "MeteorExplosion",
	'Moment', "start",
	'Actor', "MeteorLarge2",
	'Target', "ignore",
	'DetailLevel', 60,
	'Delay', 100,
	'Particles', "Meteor_Explosion_01_Flash",
	'AlwaysVisible', true,
	'Scale', 300,
	'Source', "ActionPos",
	'OffsetDir', "ActionDir",
	'Orientation', "ActionDir",
})

PlaceObj('ActionFXParticles', {
	'Action', "MeteorExplosion",
	'Moment', "start",
	'Actor', "MeteorSmall1",
	'Target', "ignore",
	'Delay', 100,
	'Particles', "Meteor_Explosion_01",
	'AlwaysVisible', true,
	'Scale', 200,
	'Source', "ActionPos",
})

PlaceObj('ActionFXParticles', {
	'Action', "MeteorExplosion",
	'Moment', "start",
	'Actor', "MeteorSmall1",
	'Target', "ignore",
	'DetailLevel', 60,
	'Delay', 100,
	'Particles', "Meteor_Explosion_01_Flash",
	'AlwaysVisible', true,
	'Scale', 200,
	'Source', "ActionPos",
	'OffsetDir', "ActionDir",
	'Orientation', "ActionDir",
})

PlaceObj('ActionFXParticles', {
	'Action', "MeteorExplosion",
	'Moment', "start",
	'Actor', "MeteorSmall2",
	'Target', "ignore",
	'Delay', 100,
	'Particles', "Meteor_Explosion_01",
	'AlwaysVisible', true,
	'Scale', 200,
	'Source', "ActionPos",
})

PlaceObj('ActionFXParticles', {
	'Action', "MeteorExplosion",
	'Moment', "start",
	'Actor', "MeteorSmall2",
	'Target', "ignore",
	'DetailLevel', 60,
	'Delay', 100,
	'Particles', "Meteor_Explosion_01_Flash",
	'AlwaysVisible', true,
	'Scale', 200,
	'Source', "ActionPos",
	'OffsetDir', "ActionDir",
	'Orientation', "ActionDir",
})

PlaceObj('ActionFXParticles', {
	'Action', "MeteorExplosionAir",
	'Moment', "start",
	'Actor', "MeteorLarge1",
	'Target', "ignore",
	'DetailLevel', 60,
	'Particles', "MDSLaser_Meteor_Hit",
	'AlwaysVisible', true,
	'Scale', 150,
	'Source', "ActionPos",
	'OffsetDir', "ActionDir",
	'Orientation', "ActionDir",
})

PlaceObj('ActionFXParticles', {
	'Action', "MeteorExplosionAir",
	'Moment', "start",
	'Actor', "MeteorLarge2",
	'Target', "ignore",
	'DetailLevel', 60,
	'Particles', "MDSLaser_Meteor_Hit",
	'AlwaysVisible', true,
	'Scale', 150,
	'Source', "ActionPos",
	'OffsetDir', "ActionDir",
	'Orientation', "ActionDir",
})

PlaceObj('ActionFXParticles', {
	'Action', "MeteorExplosionAir",
	'Moment', "start",
	'Actor', "MeteorSmall1",
	'Target', "ignore",
	'DetailLevel', 60,
	'Particles', "MDSLaser_Meteor_Hit",
	'AlwaysVisible', true,
	'Source', "ActionPos",
	'OffsetDir', "ActionDir",
	'Orientation', "ActionDir",
})

PlaceObj('ActionFXParticles', {
	'Action', "MeteorExplosionAir",
	'Moment', "start",
	'Actor', "MeteorSmall2",
	'Target', "ignore",
	'DetailLevel', 60,
	'Particles', "MDSLaser_Meteor_Hit",
	'AlwaysVisible', true,
	'Source', "ActionPos",
	'OffsetDir', "ActionDir",
	'Orientation', "ActionDir",
})

PlaceObj('ActionFXParticles', {
	'Action', "MeteorHitDome",
	'Moment', "start",
	'Actor', "Dome",
	'DetailLevel', 60,
	'Particles', "Meteor_Explosion_Dome",
	'Source', "ActionPos",
	'OffsetDir', "ActionDir",
	'Orientation', "ActionDir",
})

PlaceObj('ActionFXParticles', {
	'Action', "MissileExplode",
	'Moment', "start",
	'Target', "ignore",
	'DetailLevel', 60,
	'Particles', "RocketProjectile_Explosion",
	'AlwaysVisible', true,
	'Scale', 60,
	'Source', "ActionPos",
})

PlaceObj('ActionFXParticles', {
	'Action', "MissileFired",
	'Moment', "start",
	'Actor', "AttackRover",
	'Target', "ignore",
	'DetailLevel', 60,
	'Behavior', "BehaviorDetachAndDestroy",
	'BehaviorMoment', "end",
	'handle', 1932913336,
	'Particles', "RocketProjectile_Explosion_Small",
	'AlwaysVisible', true,
	'Scale', 10,
	'Source', "ActionPos",
	'Offset', point(0, 0, 200),
})

PlaceObj('ActionFXParticles', {
	'Action', "MissileFired",
	'Moment', "start",
	'Actor', "DefenceTower",
	'Target', "ignore",
	'DetailLevel', 40,
	'Behavior', "BehaviorDetachAndDestroy",
	'BehaviorMoment', "end",
	'handle', 213416085,
	'Particles', "DefenseTower_Fire",
	'AlwaysVisible', true,
	'Source', "ActionPos",
})

PlaceObj('ActionFXParticles', {
	'Action', "Move",
	'Moment', "start",
	'Actor', "BombardMissile",
	'Target', "ignore",
	'DetailLevel', 60,
	'Behavior', "BehaviorDetachAndDestroy",
	'BehaviorMoment', "end",
	'handle', 2094984344,
	'Particles', "BombardProjectile_Trail",
	'AlwaysVisible', true,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Move",
	'Moment', "start",
	'Actor', "Shuttle",
	'DetailLevel', 60,
	'Delay', 1000,
	'Behavior', "BehaviorDetachAndDestroy",
	'BehaviorMoment', "end",
	'handle', 394893362,
	'Particles', "Shuttle_Trail",
	'AlwaysVisible', true,
	'Spot', "Particle1",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Move",
	'Moment', "start",
	'Actor', "Shuttle",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 2112479323,
	'Particles', "Shuttle_Trail_Ignition",
	'Scale', 80,
	'Spot', "Particle1",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Move",
	'Moment', "start",
	'Actor', "Shuttle",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 25522232,
	'Particles', "Shuttle_Sides_Ignition",
	'Spot', "Particle2",
	'SpotsPercent', 100,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Move",
	'Moment', "start",
	'Actor', "Shuttle",
	'DetailLevel', 60,
	'Time', 500,
	'EndMoment1', "end",
	'handle', 9866420,
	'Particles', "Shuttle_Sides_Ignition_Start",
	'Scale', 80,
	'Spot', "Particle2",
	'SpotsPercent', 100,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Moving",
	'Moment', "move",
	'Actor', "AttackRover",
	'DetailLevel', 60,
	'Time', 4000,
	'EndMoment1', "end",
	'handle', 1696910507,
	'Particles', "RCRover_Trail",
	'Scale', 150,
	'Spot', "Dust2",
	'Attach', true,
	'Offset', point(0, 800, 0),
})

PlaceObj('ActionFXParticles', {
	'Action', "Moving",
	'Moment', "move",
	'Actor', "AttackRover",
	'DetailLevel', 60,
	'Time', 4000,
	'EndMoment1', "end",
	'handle', 207388925,
	'Particles', "RCRover_Trail",
	'Scale', 150,
	'Spot', "Dust1",
	'Attach', true,
	'Offset', point(0, 800, 0),
})

PlaceObj('ActionFXParticles', {
	'Action', "Moving",
	'Moment', "move",
	'Actor', "ExplorerRover",
	'DetailLevel', 60,
	'Time', 4000,
	'EndMoment1', "end",
	'handle', 609784267,
	'Particles', "RCRover_Trail",
	'Scale', 150,
	'Spot', "Dust2",
	'Attach', true,
	'Offset', point(0, 800, 0),
})

PlaceObj('ActionFXParticles', {
	'Action', "Moving",
	'Moment', "move",
	'Actor', "ExplorerRover",
	'DetailLevel', 60,
	'Time', 4000,
	'EndMoment1', "end",
	'handle', 986798324,
	'Particles', "RCRover_Trail",
	'Scale', 150,
	'Spot', "Dust1",
	'Attach', true,
	'Offset', point(0, 800, 0),
})

PlaceObj('ActionFXParticles', {
	'Action', "Moving",
	'Moment', "move",
	'Actor', "RCRover",
	'DetailLevel', 60,
	'Time', 4000,
	'EndMoment1', "end",
	'handle', 1087422164,
	'Particles', "RCRover_Trail",
	'Scale', 150,
	'Spot', "Dust2",
	'Attach', true,
	'Offset', point(0, 800, 0),
})

PlaceObj('ActionFXParticles', {
	'Action', "Moving",
	'Moment', "move",
	'Actor', "RCRover",
	'DetailLevel', 60,
	'Time', 4000,
	'EndMoment1', "end",
	'handle', 866683978,
	'Particles', "RCRover_Trail",
	'Scale', 150,
	'Spot', "Dust1",
	'Attach', true,
	'Offset', point(0, 800, 0),
})

PlaceObj('ActionFXParticles', {
	'Action', "Moving",
	'Moment', "move",
	'Actor', "RCTransport",
	'DetailLevel', 60,
	'Time', 4000,
	'EndMoment1', "end",
	'handle', 1419141026,
	'Particles', "RCRover_Trail",
	'Scale', 150,
	'Spot', "Dust1",
	'Attach', true,
	'Offset', point(0, 800, 0),
})

PlaceObj('ActionFXParticles', {
	'Action', "Moving",
	'Moment', "move",
	'Actor', "RCTransport",
	'DetailLevel', 60,
	'Time', 4000,
	'EndMoment1', "end",
	'handle', 930413333,
	'Particles', "RCRover_Trail",
	'Scale', 150,
	'Spot', "Dust2",
	'Attach', true,
	'Offset', point(0, 800, 0),
})

PlaceObj('ActionFXParticles', {
	'Action', "Moving",
	'Moment', "start",
	'Actor', "Drone",
	'Target', "Outside",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 2036862718,
	'Particles', "Drone_Trail",
	'Attach', true,
	'OrientationAxis', 2,
})

PlaceObj('ActionFXParticles', {
	'Action', "MysteryDream",
	'Moment', "end",
	'Target', "ignore",
	'Disabled', true,
	'Particles', "Mystery_MirageHalo",
	'Scale', 10,
	'Spot', "Wound",
	'Attach', true,
	'Offset', point(0, 0, 100),
})

PlaceObj('ActionFXParticles', {
	'Action', "MysteryDream",
	'Moment', "hit-moment",
	'Target', "ignore",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 1644398120,
	'Particles', "Mystery_MirageDream",
	'Attach', true,
	'Offset', point(0, 0, 200),
})

PlaceObj('ActionFXParticles', {
	'Action', "MysteryDream",
	'Moment', "start",
	'Target', "ignore",
	'DetailLevel', 60,
	'Time', 5500,
	'EndMoment1', "hit-moment",
	'EndMoment2', "end",
	'handle', 975344401,
	'Particles', "Mystery_MirageFallingAsleep",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "NoBattery",
	'Moment', "start",
	'Actor', "Drone",
	'Target', "ignore",
	'EndMoment1', "end",
	'handle', 40636454,
	'Particles', "Drone_NoBattery",
	'Spot', "Lantern",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "OrbitalProbeScan",
	'Moment', "start",
	'EndMoment1', "end",
	'handle', 1232090752,
	'Particles', "OrbitalProbe_Scan",
	'Scale', 120,
	'Source', "ActionPos",
})

PlaceObj('ActionFXParticles', {
	'Action', "OxygenLeak",
	'Moment', "start",
	'Actor', "DomeMeteorFractureLarge",
	'EndMoment1', "end",
	'handle', 1832798832,
	'Particles', "Meteor_Hit_O2Leak",
	'Scale', 200,
	'Attach', true,
	'OffsetDir', "ActionDir",
	'Orientation', "ActionDir",
})

PlaceObj('ActionFXParticles', {
	'Action', "OxygenLeak",
	'Moment', "start",
	'Actor', "DomeMeteorFractureSmall",
	'EndMoment1', "end",
	'handle', 1708438318,
	'Particles', "Meteor_Hit_O2Leak",
	'Scale', 150,
	'ScaleMember', "size",
	'Attach', true,
	'OffsetDir', "ActionDir",
	'Orientation', "ActionDir",
})

PlaceObj('ActionFXParticles', {
	'Action', "OxygenLeak",
	'Moment', "start",
	'Actor', "ElectricityGridElement",
	'EndMoment1', "end",
	'handle', 620035867,
	'Particles', "Cable_Damaged",
	'Scale', 50,
	'Spot', "Sparks",
	'OffsetDir', "ActionDir",
	'Orientation', "ActionDir",
})

PlaceObj('ActionFXParticles', {
	'Action', "OxygenLeak",
	'Moment', "start",
	'Actor', "LifeSupportGridElement",
	'EndMoment1', "end",
	'handle', 1020262719,
	'Particles', "Pipe_Damaged",
	'ScaleMember', "GetLeakParticleScale",
	'Source', "ActionPos",
	'OffsetDir', "ActionDir",
	'Orientation', "ActionDir",
})

PlaceObj('ActionFXParticles', {
	'Action', "Pickup",
	'Moment', "start",
	'Actor', "Drone",
	'Target', "BlackCube",
	'DetailLevel', 40,
	'EndMoment1', "end",
	'handle', 1082964582,
	'Particles', "Drone_Gather_BlackCube",
	'Spot', "Righthand",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Pickup",
	'Moment', "start",
	'Actor', "Drone",
	'Target', "BlackCube",
	'DetailLevel', 40,
	'EndMoment1', "end",
	'handle', 1618925873,
	'Particles', "Drone_Gather_BlackCube",
	'Spot', "Lefthand",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Pickup",
	'Moment', "start",
	'Actor', "Drone",
	'Target', "Concrete",
	'DetailLevel', 40,
	'EndMoment1', "end",
	'handle', 2106081999,
	'Particles', "Drone_Gather_Concrete",
	'Spot', "Lefthand",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Pickup",
	'Moment', "start",
	'Actor', "Drone",
	'Target', "Concrete",
	'DetailLevel', 40,
	'EndMoment1', "end",
	'handle', 220585390,
	'Particles', "Drone_Gather_Concrete",
	'Spot', "Righthand",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Pickup",
	'Moment', "start",
	'Actor', "Drone",
	'Target', "Metals",
	'DetailLevel', 40,
	'EndMoment1', "end",
	'handle', 1666554823,
	'Particles', "Drone_Gather_Metals",
	'Spot', "Lefthand",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Pickup",
	'Moment', "start",
	'Actor', "Drone",
	'Target', "Metals",
	'DetailLevel', 40,
	'EndMoment1', "end",
	'handle', 2033207768,
	'Particles', "Drone_Gather_Metals",
	'Spot', "Righthand",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Pickup",
	'Moment', "start",
	'Actor', "Drone",
	'Target', "WasteRock",
	'DetailLevel', 40,
	'EndMoment1', "end",
	'handle', 567683892,
	'Particles', "Drone_Gather_WasteRock",
	'Spot', "Lefthand",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Pickup",
	'Moment', "start",
	'Actor', "Drone",
	'Target', "WasteRock",
	'DetailLevel', 40,
	'EndMoment1', "end",
	'handle', 890252372,
	'Particles', "Drone_Gather_WasteRock",
	'Spot', "Righthand",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Recharge",
	'Moment', "start",
	'Actor', "Drone",
	'Target', "Drone",
	'DetailLevel', 40,
	'EndMoment1', "end",
	'handle', 1002746590,
	'Particles', "Drone_Recharge_Hands",
	'Source', "Target",
	'Spot', "Lefthand",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Recharge",
	'Moment', "start",
	'Actor', "Drone",
	'Target', "Drone",
	'DetailLevel', 40,
	'EndMoment1', "end",
	'handle', 722600665,
	'Particles', "Drone_Recharge_Hands",
	'Source', "Target",
	'Spot', "Righthand",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Recharge",
	'Moment', "start",
	'Actor', "Drone",
	'Target', "Drone",
	'DetailLevel', 60,
	'Delay', 2000,
	'EndMoment1', "end",
	'handle', 1730955179,
	'Particles', "Drone_Recharge",
	'Spot', "Headlight",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Recharge",
	'Moment', "start",
	'Actor', "Drone",
	'Target', "RCRover",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 2056510195,
	'Particles', "RCRover_Repair_Drone",
	'Source', "Target",
	'Spot', "Particle2",
	'Attach', true,
	'OrientationAxis', 2,
})

PlaceObj('ActionFXParticles', {
	'Action', "RechargeStationPlatform",
	'Moment', "start",
	'Actor', "RechargeStationPlatform",
	'Target', "Drone",
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "Drone_BeingCleaned",
	'Spot', "Clean1",
	'Attach', true,
	'Offset', point(0, -20, 0),
	'OrientationAxis', -2,
})

PlaceObj('ActionFXParticles', {
	'Action', "RechargeStationPlatform",
	'Moment', "start",
	'Actor', "RechargeStationPlatform",
	'Target', "Drone",
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "Drone_BeingCleaned",
	'Spot', "Clean2",
	'Attach', true,
	'Offset', point(0, 20, 0),
	'OrientationAxis', 2,
})

PlaceObj('ActionFXParticles', {
	'Action', "RegolithExtractorDigging",
	'Moment', "dig",
	'Actor', "RegolithExtractorDigger",
	'DetailLevel', 60,
	'EndMoment1', "dig-reverse",
	'EndMoment2', "digEnd",
	'handle', 1453213127,
	'Particles', "RegolithExtractor_Dig",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "RegolithExtractorDigging",
	'Moment', "dig-reverse",
	'Actor', "RegolithExtractorDigger",
	'DetailLevel', 60,
	'EndMoment1', "enter",
	'EndMoment2', "digEnd",
	'handle', 491105276,
	'Particles', "RegolithExtractor_DigReverse",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Repair",
	'Moment', "start",
	'Actor', "Drone",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 1858744742,
	'Particles', "Drone_Repair",
	'Spot', "Lefthand",
	'Attach', true,
	'OrientationAxis', 2,
})

PlaceObj('ActionFXParticles', {
	'Action', "Repair",
	'Moment', "start",
	'Actor', "Drone",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 527586301,
	'Particles', "Drone_Repair",
	'Spot', "Righthand",
	'Attach', true,
	'OrientationAxis', 2,
})

PlaceObj('ActionFXParticles', {
	'Action', "Repair",
	'Moment', "start",
	'Actor', "RCRover",
	'Id', "RCRoverRepair",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 187981429,
	'Particles', "RCRover_Repair",
	'Spot', "Particle1",
	'Attach', true,
	'OrientationAxis', 2,
})

PlaceObj('ActionFXParticles', {
	'Action', "Repair",
	'Moment', "start",
	'Actor', "RCRover",
	'Id', "RCRoverRepair",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 55311957,
	'Particles', "RCRover_Repair",
	'Spot', "Particle2",
	'Attach', true,
	'OrientationAxis', 2,
})

PlaceObj('ActionFXParticles', {
	'Action', "Repair",
	'Moment', "start",
	'Actor', "RCRover",
	'Target', "Drone",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 749013437,
	'Particles', "RCRover_Repair_Drone",
	'Spot', "Particle2",
	'Attach', true,
	'OrientationAxis', 2,
})

PlaceObj('ActionFXParticles', {
	'Action', "Research",
	'Moment', "50+",
	'Actor', "ResearchLab",
	'Disabled', true,
	'EndAction1', "Research",
	'EndMoment1', "done",
	'EndAction2', "Research",
	'EndMoment2', "end",
	'Particles', "ResearchLab_Text_Atom_50",
	'Spot', "Screen",
	'Attach', true,
	'OrientationAxis', -1,
})

PlaceObj('ActionFXParticles', {
	'Action', "Research",
	'Moment', "done",
	'Actor', "Academy",
	'Target', "ignore",
	'Disabled', true,
	'EndMoment1', "off",
	'EndMoment2', "start",
	'Particles', "ResearchLab_Working",
	'Spot', "Light",
	'Attach', true,
	'OrientationAxis', -1,
})

PlaceObj('ActionFXParticles', {
	'Action', "Research",
	'Moment', "done",
	'Actor', "ResearchLab",
	'Disabled', true,
	'EndMoment1', "off",
	'EndMoment2', "start",
	'Particles', "ResearchLab_Text_Einstein",
	'Spot', "Screen",
	'Attach', true,
	'OrientationAxis', -1,
})

PlaceObj('ActionFXParticles', {
	'Action', "Research",
	'Moment', "done",
	'Actor', "ResearchLab",
	'Disabled', true,
	'EndMoment1', "off",
	'EndMoment2', "start",
	'Particles', "ResearchLab_Text_Einstein_Research",
	'Spot', "Index1",
	'Attach', true,
	'OrientationAxis', -1,
})

PlaceObj('ActionFXParticles', {
	'Action', "Research",
	'Moment', "done",
	'Actor', "ResearchLab",
	'Disabled', true,
	'EndMoment1', "off",
	'EndMoment2', "start",
	'Particles', "ResearchLab_Text_Einstein_Research",
	'Spot', "Index2",
	'Attach', true,
	'OrientationAxis', -1,
})

PlaceObj('ActionFXParticles', {
	'Action', "Research",
	'Moment', "start",
	'Actor', "ResearchLab",
	'Disabled', true,
	'EndAction1', "Research",
	'EndMoment1', "50+",
	'EndAction2', "Research",
	'EndMoment2', "end",
	'Particles', "ResearchLab_Text_Atom",
	'Spot', "Screen",
	'Attach', true,
	'OrientationAxis', -1,
})

PlaceObj('ActionFXParticles', {
	'Action', "Reset",
	'Moment', "start",
	'Actor', "Drone",
	'Target', "ignore",
	'EndMoment1', "end",
	'handle', 1401570970,
	'Particles', "Drone_NoBattery",
	'Spot', "Lantern",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Revealed",
	'Moment', "true",
	'Target', "ignore",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 268598213,
	'Particles', "AnomalyMarker_Revealed",
	'Flags', "OnGround",
	'Scale', 120,
})

PlaceObj('ActionFXParticles', {
	'Action', "Revealed",
	'Moment', "true",
	'Target', "ignore",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 75502441,
	'Particles', "ConstructionSite_Spawn",
	'Flags', "LockedOrientation",
	'Offset', point(0, 0, 100),
})

PlaceObj('ActionFXParticles', {
	'Action', "RocketEngine",
	'Moment', "start",
	'Actor', "FXRocket",
	'DetailLevel', 40,
	'EndMoment1', "end",
	'handle', 565474274,
	'Particles', "SpaceRocket_WarmUp",
	'AlwaysVisible', true,
	'SpotsPercent', 100,
	'Offset', point(0, 0, 100),
})

PlaceObj('ActionFXParticles', {
	'Action', "RocketEngine",
	'Moment', "start",
	'Actor', "FXRocket",
	'DetailLevel', 60,
	'Delay', 7000,
	'EndMoment1', "end",
	'handle', 1455110395,
	'Particles', "SpaceRocket_TakeOff_Ignition",
	'AlwaysVisible', true,
	'Spot', "Trail",
	'SpotsPercent', 100,
	'Offset', point(0, 0, 100),
})

PlaceObj('ActionFXParticles', {
	'Action', "RocketLand",
	'Moment', "pre-hit-ground",
	'Actor', "FXRocket",
	'DetailLevel', 60,
	'Delay', 4750,
	'Time', 10000,
	'Particles', "Rocket_Land",
	'Flags', "OnGround",
	'AlwaysVisible', true,
	'Scale', 150,
	'Source', "ActionPos",
	'SpotsPercent', 100,
	'Offset', point(0, 0, 500),
})

PlaceObj('ActionFXParticles', {
	'Action', "RocketLand",
	'Moment', "pre-hit-ground",
	'Actor', "FXRocket",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 615058756,
	'Particles', "Rocket_LandSmoke",
	'AlwaysVisible', true,
	'Scale', 120,
	'Source', "ActionPos",
	'SpotsPercent', 100,
	'Offset', point(0, 0, 100),
})

PlaceObj('ActionFXParticles', {
	'Action', "RocketLand",
	'Moment', "pre-hit-ground2",
	'Actor', "FXRocket",
	'DetailLevel', 60,
	'Time', 8000,
	'Particles', "Rocket_LandSmoke_02",
	'AlwaysVisible', true,
	'Scale', 120,
	'Source', "ActionPos",
	'SpotsPercent', 100,
	'Offset', point(0, 0, 100),
})

PlaceObj('ActionFXParticles', {
	'Action', "RocketLand",
	'Moment', "start",
	'Actor', "FXRocket",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 1687043967,
	'Particles', "SpaceRocket_Landing_Trail",
	'AlwaysVisible', true,
	'Spot', "Trail",
	'SpotsPercent', 100,
	'Attach', true,
	'Offset', point(0, 0, 100),
})

PlaceObj('ActionFXParticles', {
	'Action', "RocketLand",
	'Moment', "start",
	'Actor', "FXRocket",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 2059959332,
	'Particles', "SpaceRocket_Landing_Trail_Smoke",
	'AlwaysVisible', true,
	'SpotsPercent', 100,
	'Attach', true,
	'Offset', point(0, 0, 100),
})

PlaceObj('ActionFXParticles', {
	'Action', "RocketLaunch",
	'Moment', "start",
	'Actor', "FXRocket",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 1168755514,
	'Particles', "SpaceRocket_Trail",
	'AlwaysVisible', true,
	'Spot', "Trail",
	'SpotsPercent', 100,
	'Attach', true,
	'Offset', point(0, 0, 100),
})

PlaceObj('ActionFXParticles', {
	'Action', "RocketLaunch",
	'Moment', "start",
	'Actor', "FXRocket",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 1864001670,
	'Particles', "SpaceRocket_Trail_Smoke",
	'AlwaysVisible', true,
	'SpotsPercent', 100,
	'Attach', true,
	'Offset', point(0, 0, 100),
})

PlaceObj('ActionFXParticles', {
	'Action', "RocketLaunch",
	'Moment', "start",
	'Actor', "FXRocket",
	'DetailLevel', 60,
	'Time', 10000,
	'EndMoment1', "end",
	'handle', 1343675146,
	'Particles', "Rocket_LaunchWave",
	'AlwaysVisible', true,
	'Spot', "Nose",
	'SpotsPercent', 100,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "RocketLaunch",
	'Moment', "start",
	'Actor', "FXRocket",
	'DetailLevel', 60,
	'Time', 10000,
	'EndMoment1', "end",
	'handle', 1800334685,
	'Particles', "Rocket_LaunchWave_Middle",
	'AlwaysVisible', true,
	'Spot', "Nose",
	'SpotsPercent', 100,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "RocketLaunch",
	'Moment', "start",
	'Actor', "FXRocket",
	'DetailLevel', 60,
	'Time', 10000,
	'EndMoment1', "end",
	'handle', 333407190,
	'Particles', "Rocket_LaunchWave",
	'AlwaysVisible', true,
	'Spot', "Nose",
	'SpotsPercent', 100,
	'Attach', true,
	'OrientationAxis', -1,
})

PlaceObj('ActionFXParticles', {
	'Action', "RocketLaunch",
	'Moment', "start",
	'Actor', "FXRocket",
	'DetailLevel', 60,
	'Time', 15000,
	'EndMoment1', "end",
	'handle', 1781309684,
	'Particles', "Rocket_Launch",
	'AlwaysVisible', true,
	'SpotsPercent', 100,
})

PlaceObj('ActionFXParticles', {
	'Action', "RocketWarning",
	'Moment', "start",
	'Actor', "SupplyRocket",
	'Target', "ignore",
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "Rocket_Pos",
	'Flags', "OnGround",
	'Scale', 200,
	'Source', "ActionPos",
})

PlaceObj('ActionFXParticles', {
	'Action', "Rotate",
	'Moment', "start",
	'Actor', "Shuttle",
	'DetailLevel', 60,
	'Delay', 200,
	'Time', 500,
	'EndMoment1', "end",
	'handle', 1617205820,
	'Particles', "Shuttle_Sides_Ignition_Start",
	'Spot', "Particle2",
	'SpotsPercent', 100,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Rotate",
	'Moment', "start",
	'Actor', "Shuttle",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 1594525919,
	'Particles', "Shuttle_Sides_Ignition",
	'Spot', "Particle2",
	'SpotsPercent', 100,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "RoverUnsiege",
	'Moment', "start",
	'Actor', "RCRover",
	'Target', "ignore",
	'EndMoment1', "end",
	'handle', 578430178,
	'Particles', "RCRover_Unsiege",
	'Scale', 200,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Scan",
	'Moment', "end",
	'Actor', "ExplorerRover",
	'Disabled', true,
	'Particles', "AnomalyMarker_Revealed",
	'Flags', "LockedOrientation",
	'Source', "Target",
})

PlaceObj('ActionFXParticles', {
	'Action', "Scan",
	'Moment', "start",
	'Actor', "ExplorerRover",
	'DetailLevel', 60,
	'Delay', 1000,
	'EndMoment1', "end",
	'handle', 1488152584,
	'Particles', "Rover_Scan",
	'Flags', "LockedOrientation",
	'Scale', 55,
	'Source', "Target",
	'Offset', point(0, 0, 1600),
})

PlaceObj('ActionFXParticles', {
	'Action', "Scan",
	'Moment', "start",
	'Actor', "ExplorerRover",
	'DetailLevel', 60,
	'Delay', 1000,
	'EndMoment1', "end",
	'handle', 1540291444,
	'Particles', "Rover_Scan_Base",
	'Flags', "LockedOrientation",
	'Scale', 55,
	'Source', "Target",
})

PlaceObj('ActionFXParticles', {
	'Action', "Scan",
	'Moment', "start",
	'Actor', "ExplorerRover",
	'DetailLevel', 60,
	'Delay', 1000,
	'EndMoment1', "end",
	'handle', 1880215744,
	'Particles', "Rover_Scan_Middle",
	'Flags', "LockedOrientation",
	'Scale', 55,
	'Source', "Target",
	'Offset', point(0, 0, 800),
})

PlaceObj('ActionFXParticles', {
	'Action', "Scan",
	'Moment', "start",
	'Actor', "ExplorerRover",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 364319783,
	'Particles', "Rover_Scan_Cone",
	'Spot', "Particle1",
	'Attach', true,
	'OrientationAxis', 2,
})

PlaceObj('ActionFXParticles', {
	'Action', "Scan",
	'Moment', "start",
	'Actor', "ExplorerRover",
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "Rover_Scan",
	'Spot', "Particle2",
	'Attach', true,
	'OrientationAxis', 2,
})

PlaceObj('ActionFXParticles', {
	'Action', "SectorScanInvalid",
	'Moment', "start",
	'Time', 3000,
	'Particles', "SensorTower_Sector_Scan_Invalid",
	'Source', "ActionPos",
})

PlaceObj('ActionFXParticles', {
	'Action', "Select",
	'Moment', "start",
	'Actor', "AlienDigger",
	'EndMoment1', "end",
	'handle', 2033817846,
	'Particles', "Selection_Rover",
	'Flags', "LockedOrientation",
	'Scale', 350,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Select",
	'Moment', "start",
	'Actor', "AlienDiggerBig",
	'EndMoment1', "end",
	'handle', 2116847888,
	'Particles', "Selection_AlienDigger_Big",
	'Flags', "LockedOrientation",
	'Scale', 350,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Select",
	'Moment', "start",
	'Actor', "AttackRover",
	'EndMoment1', "end",
	'handle', 1844150474,
	'Particles', "Selection_Rover",
	'Flags', "LockedOrientation",
	'Scale', 250,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Select",
	'Moment', "start",
	'Actor', "BlackCubeStockpile",
	'EndMoment1', "end",
	'handle', 530251619,
	'Particles', "Selection_Rover",
	'Flags', "LockedOrientation",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Select",
	'Moment', "start",
	'Actor', "ColonistFemale",
	'EndMoment1', "end",
	'handle', 745219851,
	'Particles', "Selection_Colonist",
	'Flags', "LockedOrientation",
	'Spot', "Lantern",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Select",
	'Moment', "start",
	'Actor', "ColonistMale",
	'EndMoment1', "end",
	'handle', 686021139,
	'Particles', "Selection_Colonist",
	'Flags', "LockedOrientation",
	'Spot', "Lantern",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Select",
	'Moment', "start",
	'Actor', "Drone",
	'EndMoment1', "end",
	'handle', 1957356953,
	'Particles', "Selection_Drone",
	'Flags', "LockedOrientation",
	'Spot', "Lantern",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Select",
	'Moment', "start",
	'Actor', "DroneHub",
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "Selection_Building_Area",
	'ScaleMember', "GetSelectionRadiusScale",
	'Spot', "Center",
})

PlaceObj('ActionFXParticles', {
	'Action', "Select",
	'Moment', "start",
	'Actor', "ElectricityGridElement",
	'DetailLevel', 60,
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "Selection_Buildings_Single",
	'Offset', point(0, 0, 100),
})

PlaceObj('ActionFXParticles', {
	'Action', "Select",
	'Moment', "start",
	'Actor', "ExplorerRover",
	'EndMoment1', "end",
	'handle', 2057521529,
	'Particles', "Selection_Rover",
	'Flags', "LockedOrientation",
	'Scale', 250,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Select",
	'Moment', "start",
	'Actor', "MetalsExtractor",
	'Target', "ignore",
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "Selection_Mine_Area",
	'ScaleMember', "GetSelectionRadiusScale",
	'Spot', "Center",
})

PlaceObj('ActionFXParticles', {
	'Action', "Select",
	'Moment', "start",
	'Actor', "MirrorSphere",
	'EndMoment1', "end",
	'handle', 313867437,
	'Particles', "Selection_Shuttle",
	'Flags', "LockedOrientation",
	'Scale', 500,
	'Spot', "Center",
	'Attach', true,
	'Offset', point(0, 0, -1500),
})

PlaceObj('ActionFXParticles', {
	'Action', "Select",
	'Moment', "start",
	'Actor', "RCRover",
	'EndMoment1', "end",
	'handle', 1265186709,
	'Particles', "Selection_Rover",
	'Flags', "LockedOrientation",
	'Scale', 250,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Select",
	'Moment', "start",
	'Actor', "RCTransport",
	'EndMoment1', "end",
	'handle', 1214264437,
	'Particles', "Selection_Rover",
	'Flags', "LockedOrientation",
	'Scale', 250,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Select",
	'Moment', "start",
	'Actor', "RegolithExtractor",
	'Target', "ignore",
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "Selection_Mine_Area",
	'ScaleMember', "GetSelectionRadiusScale",
	'Spot', "Center",
})

PlaceObj('ActionFXParticles', {
	'Action', "Select",
	'Moment', "start",
	'Actor', "ResourcePile",
	'EndMoment1', "end",
	'handle', 996524097,
	'Particles', "Selection_Rover",
	'Flags', "LockedOrientation",
	'Scale', 40,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Select",
	'Moment', "start",
	'Actor', "ResourceStockpile",
	'EndMoment1', "end",
	'handle', 179236125,
	'Particles', "Selection_Rover",
	'Flags', "LockedOrientation",
	'Scale', 150,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Select",
	'Moment', "start",
	'Actor', "Shuttle",
	'EndMoment1', "end",
	'handle', 1580797660,
	'Particles', "Selection_Shuttle",
	'Flags', "LockedOrientation",
	'Scale', 250,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Select",
	'Moment', "start",
	'Actor', "Sinkhole",
	'EndMoment1', "end",
	'handle', 2123928958,
	'Particles', "Selection_Rover",
	'Flags', "LockedOrientation",
	'Scale', 500,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Select",
	'Moment', "start",
	'Actor', "SubsurfaceAnomaly",
	'EndMoment1', "end",
	'handle', 2084321246,
	'Particles', "Selection_Rover",
	'Flags', "LockedOrientation",
	'Scale', 250,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Select",
	'Moment', "start",
	'Actor', "SubsurfaceDepositMetals",
	'EndMoment1', "end",
	'handle', 422085182,
	'Particles', "Selection_Rover",
	'Flags', "LockedOrientation",
	'Scale', 250,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Select",
	'Moment', "start",
	'Actor', "SubsurfaceDepositPreciousMetals",
	'EndMoment1', "end",
	'handle', 1146794682,
	'Particles', "Selection_Rover",
	'Flags', "LockedOrientation",
	'Scale', 250,
	'Attach', true,
	'FollowTick', 250,
})

PlaceObj('ActionFXParticles', {
	'Action', "Select",
	'Moment', "start",
	'Actor', "SubsurfaceDepositWater",
	'EndMoment1', "end",
	'handle', 779773990,
	'Particles', "Selection_Rover",
	'Flags', "LockedOrientation",
	'Scale', 250,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Select",
	'Moment', "start",
	'Actor', "SubsurfaceHeater",
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "Selection_Mine_Area",
	'ScaleMember', "GetSelectionRadiusScale",
})

PlaceObj('ActionFXParticles', {
	'Action', "Select",
	'Moment', "start",
	'Actor', "SupplyRocket",
	'EndMoment1', "end",
	'handle', 560469883,
	'Particles', "Selection_Rover",
	'Flags', "LockedOrientation",
	'Scale', 500,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Select",
	'Moment', "start",
	'Actor', "SurfaceDepositConcrete",
	'EndMoment1', "end",
	'handle', 1708381373,
	'Particles', "Selection_Rover",
	'Flags', "LockedOrientation",
	'Scale', 300,
	'Attach', true,
	'FollowTick', 250,
})

PlaceObj('ActionFXParticles', {
	'Action', "Select",
	'Moment', "start",
	'Actor', "SurfaceDepositGroup",
	'EndMoment1', "end",
	'handle', 206834243,
	'Particles', "Selection_Rover",
	'Flags', "LockedOrientation",
	'Scale', 400,
	'ScaleMember', "GetSelectionRadiusScale",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Select",
	'Moment', "start",
	'Actor', "SurfaceDepositMetals",
	'EndMoment1', "end",
	'handle', 94218645,
	'Particles', "Selection_Rover",
	'Flags', "LockedOrientation",
	'Scale', 250,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Select",
	'Moment', "start",
	'Actor', "SurfaceDepositPolymers",
	'EndMoment1', "end",
	'handle', 898941411,
	'Particles', "Selection_Rover",
	'Flags', "LockedOrientation",
	'Scale', 250,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Select",
	'Moment', "start",
	'Actor', "TerrainDepositConcrete",
	'Target', "ignore",
	'EndMoment1', "end",
	'handle', 1008833529,
	'Particles', "Selection_Rover",
	'Flags', "LockedOrientation",
	'Scale', 250,
})

PlaceObj('ActionFXParticles', {
	'Action', "Select",
	'Moment', "start",
	'Actor', "TriboelectricScrubber",
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "Selection_TriboelectricScrubber_Area",
	'ScaleMember', "GetSelectionRadiusScale",
})

PlaceObj('ActionFXParticles', {
	'Action', "Select",
	'Moment', "start",
	'Actor', "UnitLarge",
	'EndMoment1', "end",
	'handle', 1507758897,
	'Particles', "Selection_Rover",
	'Flags', "LockedOrientation",
	'Scale', 250,
})

PlaceObj('ActionFXParticles', {
	'Action', "Select",
	'Moment', "start",
	'Actor', "UnitMedium",
	'EndMoment1', "end",
	'handle', 842084787,
	'Particles', "Selection_Drone",
	'Flags', "LockedOrientation",
})

PlaceObj('ActionFXParticles', {
	'Action', "Select",
	'Moment', "start",
	'Actor', "UnitSmall",
	'EndMoment1', "end",
	'handle', 444202067,
	'Particles', "Selection_Colonist",
	'Flags', "LockedOrientation",
})

PlaceObj('ActionFXParticles', {
	'Action', "Select",
	'Moment', "start",
	'Actor', "WaterExtractor",
	'Target', "ignore",
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "Selection_Mine_Area",
	'ScaleMember', "GetSelectionRadiusScale",
	'Spot', "Center",
})

PlaceObj('ActionFXParticles', {
	'Action', "Select",
	'Moment', "start",
	'Actor', "Workshop",
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "Selection_Building_Area",
	'ScaleMember', "GetSelectionRadiusScale",
	'Spot', "Center",
})

PlaceObj('ActionFXParticles', {
	'Action', "SensorTowerMeteorPos",
	'Moment', "start",
	'EndMoment1', "end",
	'handle', 1519940700,
	'Particles', "SensorTower_RevealDevil_Pos",
	'Flags', "OnGround",
	'Scale', 150,
	'Source', "ActionPos",
})

PlaceObj('ActionFXParticles', {
	'Action', "ShowWorkRadius",
	'Moment', "start",
	'Actor', "RCRover",
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "Selection_Mine_Area",
	'ScaleMember', "GetSelectionRadiusScale",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "ShuttleHubEnter",
	'Moment', "start",
	'Actor', "Shuttle",
	'DetailLevel', 60,
	'Delay', 200,
	'Time', 500,
	'EndMoment1', "Hit",
	'EndMoment2', "end",
	'handle', 957734665,
	'Particles', "Shuttle_Sides_Ignition_Start",
	'Spot', "Particle2",
	'SpotsPercent', 100,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "ShuttleHubEnter",
	'Moment', "start",
	'Actor', "Shuttle",
	'DetailLevel', 60,
	'EndMoment1', "Hit",
	'EndMoment2', "end",
	'handle', 736650592,
	'Particles', "Shuttle_Sides_Ignition",
	'Spot', "Particle2",
	'SpotsPercent', 100,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "ShuttleHubExit",
	'Moment', "Hit",
	'Actor', "Shuttle",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 1843552122,
	'Particles', "Shuttle_Sides_Ignition",
	'Spot', "Particle2",
	'SpotsPercent', 100,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "ShuttleHubExit",
	'Moment', "Hit",
	'Actor', "Shuttle",
	'DetailLevel', 60,
	'Time', 500,
	'EndMoment1', "end",
	'handle', 2058648649,
	'Particles', "Shuttle_Sides_Ignition_Start",
	'Spot', "Particle2",
	'SpotsPercent', 100,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "ShuttleHubExit",
	'Moment', "start",
	'Actor', "Shuttle",
	'DetailLevel', 60,
	'EndMoment1', "Hit",
	'handle', 113817654,
	'Particles', "Shuttle_Trail_Ignition",
	'Scale', 80,
	'Spot', "Particle1",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "ShuttleLoad",
	'Moment', "start",
	'Actor', "Shuttle",
	'DetailLevel', 60,
	'Time', 1500,
	'EndMoment1', "end",
	'handle', 1477537043,
	'Particles', "Shuttle_Load",
	'SpotsPercent', 100,
	'Attach', true,
	'Orientation', "ActionDir",
	'OrientationAxis', -1,
})

PlaceObj('ActionFXParticles', {
	'Action', "ShuttleUnload",
	'Moment', "start",
	'Actor', "Shuttle",
	'DetailLevel', 60,
	'Time', 1500,
	'EndMoment1', "end",
	'handle', 878239950,
	'Particles', "Shuttle_Unload",
	'SpotsPercent', 100,
	'Attach', true,
	'Orientation', "ActionDir",
})

PlaceObj('ActionFXParticles', {
	'Action', "Spawn",
	'Moment', "end",
	'Actor', "DustDevil1",
	'DetailLevel', 60,
	'Particles', "DustDevil_01_End",
})

PlaceObj('ActionFXParticles', {
	'Action', "Spawn",
	'Moment', "end",
	'Actor', "DustDevil2",
	'DetailLevel', 60,
	'Particles', "DustDevil_01_End",
})

PlaceObj('ActionFXParticles', {
	'Action', "Spawn",
	'Moment', "end",
	'Actor', "DustDevilMajor1",
	'DetailLevel', 60,
	'Particles', "DustDevil_01_End",
	'Scale', 400,
})

PlaceObj('ActionFXParticles', {
	'Action', "Spawn",
	'Moment', "end",
	'Actor', "DustDevilMajor2",
	'DetailLevel', 60,
	'Particles', "DustDevil_01_End",
	'Scale', 400,
})

PlaceObj('ActionFXParticles', {
	'Action', "Spawn",
	'Moment', "start",
	'Actor', "AlienDiggerMarker",
	'Target', "ignore",
	'EndMoment1', "end",
	'handle', 508817571,
	'Particles', "Rocket_Landing_Pos_02",
	'Flags', "OnGround",
	'Scale', 150,
	'Source', "ActionPos",
})

PlaceObj('ActionFXParticles', {
	'Action', "Spawn",
	'Moment', "start",
	'Actor', "AlienDiggerMarkerBig",
	'Target', "ignore",
	'EndMoment1', "end",
	'handle', 1548717185,
	'Particles', "Rocket_Landing_Pos_02",
	'Flags', "OnGround",
	'Scale', 150,
	'Source', "ActionPos",
})

PlaceObj('ActionFXParticles', {
	'Action', "Spawn",
	'Moment', "start",
	'Actor', "Battery_WaterFuelCell",
	'Target', "ignore",
	'Disabled', true,
	'EndAction1', "Battery",
	'EndMoment1', "charge50",
	'EndAction2', "Spawn",
	'EndMoment2', "end",
	'Particles', "Battery_0",
	'Spot', "Light",
	'SpotsPercent', 100,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Spawn",
	'Moment', "start",
	'Actor', "ConstructionSite",
	'Target', "Battery_WaterFuelCell",
	'DetailLevel', 60,
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "ConstructionSite_Spawn",
	'Flags', "LockedOrientation",
	'Scale', 120,
	'Spot', "Center",
})

PlaceObj('ActionFXParticles', {
	'Action', "Spawn",
	'Moment', "start",
	'Actor', "ConstructionSite",
	'Target', "DroneHub",
	'DetailLevel', 60,
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "ConstructionSite_Spawn",
	'Flags', "LockedOrientation",
	'Scale', 140,
	'Spot', "Center",
})

PlaceObj('ActionFXParticles', {
	'Action', "Spawn",
	'Moment', "start",
	'Actor', "ConstructionSite",
	'Target', "ElectricityGridElement",
	'DetailLevel', 60,
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "ConstructionSite_Spawn",
	'Flags', "LockedOrientation",
	'Scale', 50,
})

PlaceObj('ActionFXParticles', {
	'Action', "Spawn",
	'Moment', "start",
	'Actor', "ConstructionSite",
	'Target', "LifeSupportGridElement",
	'DetailLevel', 60,
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "ConstructionSite_Spawn",
	'Flags', "LockedOrientation",
	'Scale', 80,
})

PlaceObj('ActionFXParticles', {
	'Action', "Spawn",
	'Moment', "start",
	'Actor', "ConstructionSite",
	'Target', "MOXIE",
	'DetailLevel', 60,
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "ConstructionSite_Spawn_02",
	'Flags', "LockedOrientation",
	'Spot', "Center",
})

PlaceObj('ActionFXParticles', {
	'Action', "Spawn",
	'Moment', "start",
	'Actor', "ConstructionSite",
	'Target', "MetalsExtractor",
	'DetailLevel', 60,
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "ConstructionSite_Spawn_02",
	'Flags', "LockedOrientation",
	'Spot', "Center",
})

PlaceObj('ActionFXParticles', {
	'Action', "Spawn",
	'Moment', "start",
	'Actor', "ConstructionSite",
	'Target', "MoistureVaporator",
	'DetailLevel', 60,
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "ConstructionSite_Spawn",
	'Flags', "LockedOrientation",
	'Scale', 120,
	'Spot', "Center",
})

PlaceObj('ActionFXParticles', {
	'Action', "Spawn",
	'Moment', "start",
	'Actor', "ConstructionSite",
	'Target', "RechargeStation",
	'DetailLevel', 60,
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "ConstructionSite_Spawn",
	'Flags', "LockedOrientation",
})

PlaceObj('ActionFXParticles', {
	'Action', "Spawn",
	'Moment', "start",
	'Actor', "ConstructionSite",
	'Target', "RegolithExtractor",
	'DetailLevel', 60,
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "ConstructionSite_Spawn_02",
	'Flags', "LockedOrientation",
})

PlaceObj('ActionFXParticles', {
	'Action', "Spawn",
	'Moment', "start",
	'Actor', "ConstructionSite",
	'Target', "SensorTower",
	'DetailLevel', 60,
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "ConstructionSite_Spawn",
	'Flags', "LockedOrientation",
	'Scale', 120,
})

PlaceObj('ActionFXParticles', {
	'Action', "Spawn",
	'Moment', "start",
	'Actor', "ConstructionSite",
	'Target', "SolarArray",
	'DetailLevel', 80,
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "ConstructionSite_Spawn",
	'Flags', "LockedOrientation",
	'Scale', 180,
})

PlaceObj('ActionFXParticles', {
	'Action', "Spawn",
	'Moment', "start",
	'Actor', "ConstructionSite",
	'Target', "SolarArray",
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "ConstructionSite_Spawn",
	'Flags', "LockedOrientation",
	'Scale', 200,
})

PlaceObj('ActionFXParticles', {
	'Action', "Spawn",
	'Moment', "start",
	'Actor', "ConstructionSite",
	'Target', "SolarPanel",
	'DetailLevel', 60,
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "ConstructionSite_Spawn",
	'Flags', "LockedOrientation",
})

PlaceObj('ActionFXParticles', {
	'Action', "Spawn",
	'Moment', "start",
	'Actor', "ConstructionSite",
	'Target', "SolarPanelBig",
	'DetailLevel', 60,
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "ConstructionSite_Spawn",
	'Flags', "LockedOrientation",
	'Scale', 180,
})

PlaceObj('ActionFXParticles', {
	'Action', "Spawn",
	'Moment', "start",
	'Actor', "ConstructionSite",
	'Target', "StirlingGenerator",
	'DetailLevel', 60,
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "ConstructionSite_Spawn",
	'Flags', "LockedOrientation",
})

PlaceObj('ActionFXParticles', {
	'Action', "Spawn",
	'Moment', "start",
	'Actor', "ConstructionSite",
	'Target', "StorageDepot",
	'DetailLevel', 60,
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "ConstructionSite_Spawn_02",
	'Flags', "LockedOrientation",
})

PlaceObj('ActionFXParticles', {
	'Action', "Spawn",
	'Moment', "start",
	'Actor', "ConstructionSite",
	'Target', "WaterExtractor",
	'DetailLevel', 60,
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "ConstructionSite_Spawn_02",
	'Flags', "LockedOrientation",
	'Scale', 140,
})

PlaceObj('ActionFXParticles', {
	'Action', "Spawn",
	'Moment', "start",
	'Actor', "ConstructionSite",
	'Target', "WaterTank",
	'DetailLevel', 60,
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "ConstructionSite_Spawn",
	'Flags', "LockedOrientation",
	'Scale', 120,
	'Spot', "Center",
})

PlaceObj('ActionFXParticles', {
	'Action', "Spawn",
	'Moment', "start",
	'Actor', "ConstructionSite",
	'Target', "WindTurbine",
	'DetailLevel', 60,
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "ConstructionSite_Spawn",
	'Flags', "LockedOrientation",
	'Scale', 120,
	'Spot', "Center",
})

PlaceObj('ActionFXParticles', {
	'Action', "Spawn",
	'Moment', "start",
	'Actor', "ConstructionSiteWithHeightSurfaces",
	'Target', "DomeMedium",
	'DetailLevel', 60,
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "ConstructionSite_Spawn_Dome_02",
	'Attach', true,
	'Orientation', "SpotX",
})

PlaceObj('ActionFXParticles', {
	'Action', "Spawn",
	'Moment', "start",
	'Actor', "ConstructionSiteWithHeightSurfaces",
	'Target', "DomeMega",
	'DetailLevel', 60,
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "ConstructionSite_Spawn_Dome",
	'Scale', 200,
})

PlaceObj('ActionFXParticles', {
	'Action', "Spawn",
	'Moment', "start",
	'Actor', "ConstructionSiteWithHeightSurfaces",
	'Target', "DomeOval",
	'DetailLevel', 60,
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "ConstructionSite_Spawn_Dome",
})

PlaceObj('ActionFXParticles', {
	'Action', "Spawn",
	'Moment', "start",
	'Actor', "DustDevil1",
	'Behavior', "BehaviorDetachAndDestroy",
	'BehaviorMoment', "end",
	'handle', 2102815325,
	'Particles', "DustDevil_04",
	'Scale', 800,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Spawn",
	'Moment', "start",
	'Actor', "DustDevil2",
	'Behavior', "BehaviorDetachAndDestroy",
	'BehaviorMoment', "end",
	'handle', 353684318,
	'Particles', "DustDevil_04",
	'Scale', 800,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Spawn",
	'Moment', "start",
	'Actor', "DustDevilMajor1",
	'Behavior', "BehaviorDetachAndDestroy",
	'BehaviorMoment', "end",
	'handle', 1691741188,
	'Particles', "DustDevil_04",
	'Scale', 1400,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Spawn",
	'Moment', "start",
	'Actor', "DustDevilMajor2",
	'Behavior', "BehaviorDetachAndDestroy",
	'BehaviorMoment', "end",
	'handle', 1430933536,
	'Particles', "DustDevil_04",
	'Scale', 1400,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Spawn",
	'Moment', "start",
	'Actor', "Firefly",
	'Disabled', true,
	'Particles', "FireflyGlow_01",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Spawn",
	'Moment', "start",
	'Actor', "RocketProjectile",
	'Target', "ignore",
	'DetailLevel', 60,
	'Behavior', "BehaviorDetachAndDestroy",
	'BehaviorMoment', "end",
	'handle', 1306156112,
	'Particles', "RocketProjectile_Trail",
	'AlwaysVisible', true,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Spawn",
	'Moment', "start",
	'Actor', "RotatyThing",
	'EndMoment1', "end",
	'handle', 909612563,
	'Particles', "Demolish_Warning",
	'Spot', "Light",
	'SpotsPercent', 100,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "StirlingGenerator",
	'Moment', "close",
	'Actor', "StirlingGenerator",
	'Target', "ignore",
	'DetailLevel', 40,
	'EndMoment1', "close",
	'Particles', "StirlingGenerator_Close",
	'Spot', "Light",
})

PlaceObj('ActionFXParticles', {
	'Action', "StirlingGenerator",
	'Moment', "open_start",
	'Actor', "StirlingGenerator",
	'Target', "ignore",
	'DetailLevel', 40,
	'EndMoment1', "open",
	'handle', 1140640155,
	'Particles', "StirlingGenerator_Open_Start",
	'Spot', "Light",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "StirlingGenerator",
	'Moment', "open_start",
	'Actor', "StirlingGenerator",
	'Target', "ignore",
	'DetailLevel', 60,
	'EndMoment1', "close_start",
	'EndMoment2', "close",
	'handle', 1673199288,
	'Particles', "StirlingGenerator_Open",
	'Spot', "Light",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Suspended",
	'Moment', "start",
	'Target', "ignore",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 519786273,
	'Particles', "ElStorm_Lightning_01_Hit",
	'Spot', "Center",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "TakeOff",
	'Moment', "start",
	'Actor', "MirrorSphere",
	'Target', "ignore",
	'DetailLevel', 40,
	'Time', 1000,
	'Behavior', "BehaviorDetachAndDestroy",
	'BehaviorMoment', "end",
	'handle', 629107575,
	'Particles', "AlienDigger_LaunchSmoke_Big",
	'Flags', "OnGround",
	'Spot', "Center",
	'Attach', true,
	'Offset', point(0, 0, 1000),
})

PlaceObj('ActionFXParticles', {
	'Action', "TakeOff",
	'Moment', "start",
	'Actor', "MirrorSphere",
	'Target', "ignore",
	'DetailLevel', 40,
	'Time', 2000,
	'Particles', "MirrorSphere_Dig",
	'Flags', "OnGround",
	'Scale', 150,
	'Spot', "Center",
	'Offset', point(0, 0, 1000),
})

PlaceObj('ActionFXParticles', {
	'Action', "TakeOff",
	'Moment', "start",
	'Actor', "Shuttle",
	'DetailLevel', 60,
	'Delay', 200,
	'Time', 1000,
	'EndMoment1', "end",
	'handle', 478627819,
	'Particles', "Shuttle_Sides_Ignition_Start",
	'Spot', "Particle2",
	'SpotsPercent', 100,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "TakeOff",
	'Moment', "start",
	'Actor', "Shuttle",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 1009318132,
	'Particles', "Shuttle_Sides_Ignition",
	'Spot', "Particle2",
	'SpotsPercent', 100,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "TakeOff",
	'Moment', "start",
	'Actor', "Shuttle",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 1958416987,
	'Particles', "Shuttle_TakeOff",
	'SpotsPercent', 100,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Thrusters",
	'Moment', "start",
	'Target', "ignore",
	'EndMoment1', "end",
	'handle', 1159442663,
	'Particles', "RocketUI_Trail",
	'Spot', "Trail",
	'SpotsPercent', 100,
	'Attach', true,
	'OrientationAxis', -3,
})

PlaceObj('ActionFXParticles', {
	'Action', "Thrusters",
	'Moment', "start",
	'Target', "ignore",
	'EndMoment1', "end",
	'handle', 571659848,
	'Particles', "RocketUI_Glow",
	'SpotsPercent', 100,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "TurnToDepositComplete",
	'Moment', "start",
	'Actor', "MirrorSphere",
	'Target', "PowerDecoy",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 888005894,
	'Particles', "MirrorSphere_Destruction",
	'Flags', "OnGround",
	'Scale', 150,
	'Spot', "Center",
})

PlaceObj('ActionFXParticles', {
	'Action', "TurnToMetal",
	'Moment', "start",
	'Actor', "MirrorSphere",
	'Target', "PowerDecoy",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 1827249790,
	'Particles', "PowerDecoy_TurnToMetal",
	'Flags', "OnGround",
	'Scale', 90,
	'Source', "Target",
})

PlaceObj('ActionFXParticles', {
	'Action', "TurnToPolymer",
	'Moment', "start",
	'Actor', "MirrorSphere",
	'Target', "PowerDecoy",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 1451599375,
	'Particles', "PowerDecoy_TurnToPolymers",
	'Flags', "OnGround",
	'Scale', 90,
	'Source', "Target",
})

PlaceObj('ActionFXParticles', {
	'Action', "TurnToPreciousMetal",
	'Moment', "start",
	'Actor', "MirrorSphere",
	'Target', "PowerDecoy",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 1316222846,
	'Particles', "PowerDecoy_TurnToPreciousMetal",
	'Flags', "OnGround",
	'Scale', 90,
	'Source', "Target",
})

PlaceObj('ActionFXParticles', {
	'Action', "Unload",
	'Moment', "start",
	'Actor', "RCTransport",
	'DetailLevel', 60,
	'Delay', 500,
	'EndMoment1', "end",
	'handle', 747824266,
	'Particles', "RCTransport_Unload",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Waiting",
	'Moment', "start",
	'Actor', "Shuttle",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 929600623,
	'Particles', "Shuttle_Sides_Ignition",
	'Spot', "Particle2",
	'SpotsPercent', 100,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "WaitingCommand",
	'Moment', "start",
	'Actor', "Drone",
	'Target', "ignore",
	'EndMoment1', "end",
	'handle', 463081900,
	'Particles', "Drone_NoBattery",
	'Spot', "Lantern",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "WarmUp",
	'Moment', "start",
	'Actor', "GeyserWarmup",
	'Target', "PrefabFeatureMarker",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 1725447203,
	'Particles', "Env_CO2Geyser_Ground",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "end",
	'Actor', "BlackCubeStockpile",
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "BlackCube_End",
	'ScaleMember', "GetSelectionRadiusScale",
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "end",
	'Actor', "SolarPanel",
	'DetailLevel', 60,
	'Time', 3200,
	'EndMoment1', "close",
	'handle', 1154901248,
	'Particles', "SolarPanel_Close",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "end",
	'Actor', "SolarPanelBig",
	'DetailLevel', 60,
	'Time', 3200,
	'EndMoment1', "close",
	'handle', 1952068180,
	'Particles', "SolarPanelBig_Close",
	'Spot', "Center",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "hit-moment1",
	'Actor', "MOXIE",
	'DetailLevel', 60,
	'Time', 10000,
	'EndMoment1', "end",
	'handle', 4545713,
	'Particles', "MOXIE_Steam",
	'Source', "Target",
	'Spot', "Steam2",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "hit-moment1",
	'Actor', "PreciousMetalsExtractor",
	'DetailLevel', 60,
	'Time', 5000,
	'EndMoment1', "end",
	'handle', 924651685,
	'Particles', "UniversalExtractor_Steam",
	'Spot', "Smoke",
	'SpotsPercent', 100,
	'OrientationAxis', 2,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "hit-moment2",
	'Actor', "MOXIE",
	'DetailLevel', 60,
	'Time', 10000,
	'EndMoment1', "end",
	'handle', 1828342383,
	'Particles', "MOXIE_Steam",
	'Source', "Target",
	'Spot', "Steam1",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "hit-moment2",
	'Actor', "PreciousMetalsExtractor",
	'DetailLevel', 60,
	'Time', 5000,
	'EndMoment1', "end",
	'handle', 872033987,
	'Particles', "UniversalExtractor_Steam",
	'Spot', "Smoke",
	'SpotsPercent', 100,
	'OrientationAxis', 2,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "hit-moment3",
	'Actor', "PreciousMetalsExtractor",
	'DetailLevel', 60,
	'Time', 5000,
	'EndMoment1', "end",
	'handle', 1980372174,
	'Particles', "UniversalExtractor_Steam",
	'Spot', "Smoke",
	'SpotsPercent', 100,
	'OrientationAxis', 2,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "Arcology",
	'DetailLevel', 40,
	'EndMoment1', "end",
	'handle', 1002566868,
	'Particles', "Arcology_Beacon",
	'Flags', "LockedOrientation",
	'Spot', "Beacon",
	'SpotsPercent', 100,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "BlackCubeMonolith",
	'Target', "ignore",
	'DetailLevel', 40,
	'EndMoment1', "end",
	'handle', 222969909,
	'Particles', "BlackCubeMonolith_Pulse",
	'Scale', 120,
	'Spot', "Center",
	'Attach', true,
	'Offset', point(0, 0, 500),
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "BlackCubeStockpile",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 414319488,
	'Particles', "BlackCube_Appearance",
	'Scale', 200,
	'ScaleMember', "GetSelectionRadiusScale",
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "FountainLarge",
	'Target', "GardenFountains_03",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 102460336,
	'Particles', "GardenFountains_07",
	'Scale', 120,
	'Spot', "Waterstream_04",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "FountainLarge",
	'Target', "GardenFountains_03",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 1153806249,
	'Particles', "GardenFountains_07",
	'Scale', 120,
	'Spot', "Waterstream_07",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "FountainLarge",
	'Target', "GardenFountains_03",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 1294349971,
	'Particles', "GardenFountains_07",
	'Scale', 120,
	'Spot', "Waterstream_06",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "FountainLarge",
	'Target', "GardenFountains_03",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 1535509170,
	'Particles', "GardenFountains_07",
	'Scale', 120,
	'Spot', "Waterstream_05",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "FountainLarge",
	'Target', "GardenFountains_03",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 1899550762,
	'Particles', "GardenFountains_07",
	'Scale', 120,
	'Spot', "Waterstream_08",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "FountainLarge",
	'Target', "GardenFountains_03",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 84997794,
	'Particles', "GardenFountains_06",
	'Scale', 120,
	'Spot', "Waterstream_03",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "FountainLarge",
	'Target', "GardenFountains_03",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 958665284,
	'Particles', "GardenFountains_06",
	'Scale', 120,
	'Spot', "Waterstream_01",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "FountainLarge",
	'Target', "GardenFountains_03",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 965557898,
	'Particles', "GardenFountains_06",
	'Scale', 120,
	'Spot', "Waterstream_02",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "FountainSmall",
	'Target', "GardenFountains_01",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 1042696498,
	'Particles', "GardenFountains_01",
	'Spot', "Waterstream_01",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "FountainSmall",
	'Target', "GardenFountains_01",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 1778724574,
	'Particles', "GardenFountains_02",
	'Scale', 120,
	'Spot', "Waterstream_03",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "FountainSmall",
	'Target', "GardenFountains_01",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 2050236328,
	'Particles', "GardenFountains_02",
	'Scale', 120,
	'Spot', "Waterstream_02",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "FountainSmall",
	'Target', "GardenFountains_01",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 482363157,
	'Particles', "GardenFountains_03",
	'Spot', "Waterstream_01",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "FountainSmall",
	'Target', "GardenFountains_01",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 618050979,
	'Particles', "GardenFountains_02",
	'Scale', 120,
	'Spot', "Waterstream_04",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "FountainSmall",
	'Target', "GardenFountains_02",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 1759757674,
	'Particles', "GardenFountains_04",
	'Scale', 180,
	'Spot', "Waterfall_03",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "FountainSmall",
	'Target', "GardenFountains_02",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 1860374564,
	'Particles', "GardenFountains_04",
	'Scale', 140,
	'Spot', "Waterfall_02",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "FountainSmall",
	'Target', "GardenFountains_02",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 225001510,
	'Particles', "GardenFountains_04",
	'Spot', "Waterfall_01",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "FountainSmall",
	'Target', "GardenFountains_02",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 772471396,
	'Particles', "GardenFountains_05",
	'Scale', 180,
	'Spot', "Waterstream",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "FusionReactor",
	'DetailLevel', 60,
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "FusionReactor_Electricity",
	'Spot', "Sparks",
	'SpotsPercent', 100,
	'Attach', true,
	'OffsetDir', "",
	'Orientation', "SpotZ",
	'OrientationAxis', 3,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "FusionReactor",
	'DetailLevel', 60,
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "FusionReactor_Electricity_Center",
	'Flags', "LockedOrientation",
	'Spot', "Spark",
	'SpotsPercent', 100,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "FusionReactor",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 1523631227,
	'Particles', "MOXIE_Smoke",
	'Flags', "LockedOrientation",
	'Spot', "Smoke",
	'SpotsPercent', 100,
	'Attach', true,
	'OffsetDir', "",
	'Orientation', "SpotZ",
	'OrientationAxis', 3,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "GeoscapeDome",
	'DetailLevel', 40,
	'EndMoment1', "end",
	'handle', 1258450243,
	'Particles', "Wonder_Dome_Waves",
	'Spot', "Water",
	'SpotsPercent', 100,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "HangingGardens",
	'Target', "ignore",
	'DetailLevel', 40,
	'EndMoment1', "end",
	'handle', 1176683658,
	'Particles', "HangingGardens_Pool_Ripples",
	'Spot', "Tree",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "HangingGardens",
	'Target', "ignore",
	'DetailLevel', 40,
	'EndMoment1', "end",
	'handle', 1524961436,
	'Particles', "HangingGardens_FallingLeaves",
	'Spot', "Tree",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "HangingGardens",
	'Target', "ignore",
	'DetailLevel', 40,
	'EndMoment1', "end",
	'handle', 93111606,
	'Particles', "HangingGardens_Pool_Ripples_02",
	'Spot', "Pool",
	'SpotsPercent', 100,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "HangingGardens",
	'Target', "ignore",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 595646306,
	'Particles', "HangingGardens_Waterfall",
	'Spot', "Waterfall",
	'SpotsPercent', 100,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "Infirmary",
	'Target', "ignore",
	'DetailLevel', 40,
	'EndMoment1', "end",
	'handle', 1684431911,
	'Particles', "Infirmary_Sign",
	'Spot', "Light",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "Lake",
	'Target', "GardenLake",
	'DetailLevel', 40,
	'EndMoment1', "end",
	'handle', 531240068,
	'Particles', "Lake_Ripples",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "MOXIE",
	'Target', "ignore",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 400140290,
	'Particles', "MOXIE_Smoke",
	'Spot', "Smoke",
	'SpotsPercent', 100,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "MedicalCenter",
	'Target', "ignore",
	'DetailLevel', 40,
	'EndMoment1', "end",
	'handle', 64743940,
	'Particles', "Medical_Sign",
	'Spot', "Light",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "MetalsExtractor",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 1499197166,
	'Particles', "Mine_Metal_Steam",
	'Spot', "Smoke",
	'SpotsPercent', 100,
	'Attach', true,
	'OrientationAxis', 2,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "MetalsExtractor",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 1833011760,
	'Particles', "Mine_Metal_Steam_Inside",
	'Spot', "Hole",
	'SpotsPercent', 100,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "MetalsExtractor",
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "Mine_Metal_Lights",
	'Spot', "Lightinside",
	'SpotsPercent', 100,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "MoistureVaporator",
	'Target', "ignore",
	'DetailLevel', 40,
	'EndMoment1', "end",
	'handle', 1385185963,
	'Particles', "MoistureVaporator_Sparks",
	'Spot', "Steam",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "MoistureVaporator",
	'Target', "ignore",
	'DetailLevel', 60,
	'Delay', 5000,
	'EndMoment1', "end",
	'handle', 1583035579,
	'Particles', "MoistureVaporator_Steam",
	'Spot', "Steam",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "PreciousMetalsExtractor",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 1468021056,
	'Particles', "UniversalExtractor_Smoke",
	'Spot', "Smoke",
	'SpotsPercent', 100,
	'OrientationAxis', 2,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "ProjectMorpheus",
	'DetailLevel', 60,
	'Delay', 3500,
	'EndMoment1', "end",
	'handle', 1100606828,
	'Particles', "ProjectMorpheus_Projector",
	'Spot', "Projector",
	'SpotsPercent', 100,
	'Attach', true,
	'OrientationAxis', -1,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "ProjectMorpheus",
	'DetailLevel', 60,
	'Delay', 5000,
	'EndMoment1', "end",
	'handle', 1410061420,
	'Particles', "ProjectMorpheus_Dreamcatcher_Rays",
	'Spot', "Beam",
	'SpotsPercent', 100,
	'Attach', true,
	'OrientationAxis', -1,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "ProjectMorpheus",
	'DetailLevel', 60,
	'Delay', 5000,
	'EndMoment1', "end",
	'handle', 220777504,
	'Particles', "ProjectMorpheus_Dreamcatcher",
	'Scale', 50,
	'Spot', "Particle",
	'Attach', true,
	'OrientationAxis', 2,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "ProjectMorpheus",
	'DetailLevel', 60,
	'Delay', 5000,
	'EndMoment1', "end",
	'handle', 259950637,
	'Particles', "ProjectMorpheus_Dreamcatcher_Rotating",
	'Scale', 40,
	'Spot', "Rotation",
	'Attach', true,
	'OrientationAxis', 2,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "RechargeStation",
	'DetailLevel', 40,
	'EndMoment1', "end",
	'handle', 1424627908,
	'Particles', "RechargeStation_Lines",
	'Source', "Target",
	'Spot', "Light",
	'SpotsPercent', 100,
	'Attach', true,
	'OrientationAxis', -1,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "RechargeStation",
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "RechargeStation_Sign",
	'Source', "Target",
	'Spot', "Sign",
	'SpotsPercent', 100,
	'Attach', true,
	'OrientationAxis', -1,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "RegolithExtractor",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 1188826289,
	'Particles', "Mine_Regolith_Steam",
	'Spot', "Toplight",
	'SpotsPercent', 100,
	'Attach', true,
	'OrientationAxis', 2,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "SensorTower",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 1107861611,
	'Particles', "WaterTank_Working",
	'Flags', "LockedOrientation",
	'Scale', 80,
	'Spot', "Light",
	'SpotsPercent', 100,
	'Attach', true,
	'Offset', point(0, 0, 4500),
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "SensorTower",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 175562619,
	'Particles', "SensorTower_Working",
	'Flags', "LockedOrientation",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "SolarPanel",
	'DetailLevel', 60,
	'Delay', 1000,
	'Time', 3500,
	'EndMoment1', "open",
	'handle', 1335767679,
	'Particles', "SolarPanel_Open",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "SolarPanelBig",
	'DetailLevel', 60,
	'Delay', 1000,
	'Time', 3500,
	'EndMoment1', "open",
	'handle', 424285411,
	'Particles', "SolarPanelBig_Open",
	'Spot', "Center",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "SubsurfaceHeater",
	'DetailLevel', 40,
	'EndMoment1', "end",
	'handle', 942538653,
	'Particles', "SubsurfaceHeater_Working",
	'Spot', "Center",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "TheExcavator",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 126680097,
	'Particles', "Mine_Regolith_Steam",
	'Scale', 200,
	'Spot', "Steam",
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "TriboelectricScrubber",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 1867986095,
	'Particles', "WaterTank_Working",
	'Flags', "LockedOrientation",
	'Scale', 75,
	'Spot', "Light",
	'SpotsPercent', 100,
	'Attach', true,
	'Offset', point(0, 0, 3430),
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "WaterExtractor",
	'Target', "ignore",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 1362950274,
	'Particles', "WaterExtractor_Steam",
	'Spot', "Water",
	'SpotsPercent', 100,
	'Attach', true,
	'OrientationAxis', -3,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "WaterExtractor",
	'Target', "ignore",
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "WaterExtractor_Bottom",
	'Spot', "Bottom",
	'SpotsPercent', 100,
	'Attach', true,
	'OrientationAxis', -3,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "WaterExtractor",
	'Target', "ignore",
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "WaterExtractor_Lazer",
	'Spot', "Lazer2",
	'Attach', true,
	'OrientationAxis', -3,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "WaterExtractor",
	'Target', "ignore",
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "WaterExtractor_Lazer_Base",
	'Spot', "Lazer2",
	'Attach', true,
	'OrientationAxis', -3,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "WaterExtractor",
	'Target', "ignore",
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "WaterExtractor_Sparks",
	'Spot', "Spark",
	'SpotsPercent', 100,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "WaterReclamationSystem",
	'Target', "ignore",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 1161212700,
	'Particles', "WaterReclamationSystem_Ripples",
	'Scale', 140,
	'Spot', "Poolbottom",
	'SpotsPercent', 100,
	'Attach', true,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "WaterReclamationSystem",
	'Target', "ignore",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 1645258711,
	'Particles', "WaterReclamationSystem_WaterShader",
	'Scale', 140,
	'Spot', "Pool",
	'SpotsPercent', 100,
	'Attach', true,
	'OrientationAxis', 2,
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "WaterReclamationSystem",
	'Target', "ignore",
	'Disabled', true,
	'EndMoment1', "end",
	'Particles', "WaterReclamationSystem_Fall_DarkGreen",
	'Spot', "Water8",
	'SpotsPercent', 100,
	'Attach', true,
	'Offset', point(0, 0, -100),
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "WaterReclamationSystem",
	'Target', "ignore",
	'EndMoment1', "end",
	'handle', 1166406266,
	'Particles', "WaterReclamationSystem_Fall_LightBlue",
	'Spot', "Water3",
	'SpotsPercent', 100,
	'Attach', true,
	'Offset', point(0, 0, -100),
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "WaterReclamationSystem",
	'Target', "ignore",
	'EndMoment1', "end",
	'handle', 1327655129,
	'Particles', "WaterReclamationSystem_Fall_Green/Blue",
	'Spot', "Water6",
	'SpotsPercent', 100,
	'Attach', true,
	'Offset', point(0, 0, -100),
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "WaterReclamationSystem",
	'Target', "ignore",
	'EndMoment1', "end",
	'handle', 1723445957,
	'Particles', "WaterReclamationSystem_Fall_LightBlue",
	'Spot', "Water2",
	'SpotsPercent', 100,
	'Attach', true,
	'Offset', point(0, 0, -100),
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "WaterReclamationSystem",
	'Target', "ignore",
	'EndMoment1', "end",
	'handle', 1884963033,
	'Particles', "WaterReclamationSystem_Fall_Green/Blue",
	'Spot', "Water5",
	'SpotsPercent', 100,
	'Attach', true,
	'Offset', point(0, 0, -100),
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "WaterReclamationSystem",
	'Target', "ignore",
	'EndMoment1', "end",
	'handle', 2133263568,
	'Particles', "WaterReclamationSystem_Fall_Blue",
	'Spot', "Water4",
	'SpotsPercent', 100,
	'Attach', true,
	'Offset', point(0, 0, -100),
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "WaterReclamationSystem",
	'Target', "ignore",
	'EndMoment1', "end",
	'handle', 241613903,
	'Particles', "WaterReclamationSystem_Fall_Clear",
	'Spot', "Water1",
	'SpotsPercent', 100,
	'Attach', true,
	'Offset', point(0, 0, -100),
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "WaterReclamationSystem",
	'Target', "ignore",
	'EndMoment1', "end",
	'handle', 360689100,
	'Particles', "WaterReclamationSystem_Fall_Green",
	'Spot', "Water7",
	'SpotsPercent', 100,
	'Attach', true,
	'Offset', point(0, 0, -100),
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "WaterTank",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 107975081,
	'Particles', "WaterTank_Working_Blue",
	'Flags', "LockedOrientation",
	'Spot', "Toplight",
	'SpotsPercent', 100,
	'Attach', true,
	'Offset', point(0, 0, 20),
})

PlaceObj('ActionFXParticles', {
	'Action', "Working",
	'Moment', "start",
	'Actor', "WindTurbine",
	'DetailLevel', 60,
	'EndMoment1', "end",
	'handle', 1885949109,
	'Particles', "WaterTank_Working",
	'Flags', "LockedOrientation",
	'Scale', 75,
	'Spot', "Light",
	'SpotsPercent', 100,
	'Attach', true,
	'Offset', point(0, 0, -40),
})

