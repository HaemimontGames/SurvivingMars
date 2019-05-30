-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('StoryBitCategory', {
	Prerequisites = {},
	Trigger = "ConstructionComplete",
	group = "Default",
	id = "BuildingConstructed",
})

PlaceObj('StoryBitCategory', {
	Chance = 10,
	Prerequisites = {},
	Trigger = "RocketLaunchFromEarth",
	group = "Default",
	id = "ExperimentalRocketLaunched",
})

PlaceObj('StoryBitCategory', {
	Chance = 100,
	Prerequisites = {},
	id = "FollowUp",
})

PlaceObj('StoryBitCategory', {
	Prerequisites = {
		PlaceObj('IsFoundersRocket', nil),
	},
	Trigger = "RocketLanded",
	group = "Default",
	id = "FounderRocketLanded",
})

PlaceObj('StoryBitCategory', {
	Prerequisites = {},
	Trigger = "ConstructionPrefabPlaced",
	group = "Default",
	id = "PlacePrefab",
})

PlaceObj('StoryBitCategory', {
	Chance = 20,
	Prerequisites = {},
	Trigger = "RocketLandAttempt",
	group = "Default",
	id = "RocketLandingAttempt",
})

PlaceObj('StoryBitCategory', {
	Chance = 20,
	Prerequisites = {},
	Trigger = "RocketManualLaunch",
	group = "Default",
	id = "RocketManualLaunch",
})

PlaceObj('StoryBitCategory', {
	Chance = 10,
	Prerequisites = {},
	Trigger = "SanityBreakdown",
	group = "Default",
	id = "SanityBreakdown",
})

PlaceObj('StoryBitCategory', {
	Prerequisites = {},
	Trigger = "TechResearchedTrigger",
	group = "Default",
	id = "TechResearched",
})

PlaceObj('StoryBitCategory', {
	Prerequisites = {},
	Trigger = "StoryBitTick",
	group = "Default",
	id = "Tick",
})

PlaceObj('StoryBitCategory', {
	DecreaseCooldownPercent = 60,
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'Filters', {},
			'Condition', "<=",
			'Amount', 0,
		}),
		PlaceObj('IsSolInRange', {
			'Min', 2,
			'Max', 40,
		}),
		PlaceObj('CheckObjectCount', {
			'Label', "Building",
			'Filters', {},
			'Condition', ">=",
			'Amount', 3,
		}),
	},
	Trigger = "StoryBitTick",
	group = "Default",
	id = "Tick_BeforeFounders",
})

PlaceObj('StoryBitCategory', {
	Prerequisites = {
		PlaceObj('FounderStageCompleted', nil),
	},
	Trigger = "StoryBitTick",
	group = "Default",
	id = "Tick_FounderStageDone",
})

PlaceObj('StoryBitCategory', {
	Chance = 25,
	DecreaseCooldownPercent = 75,
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'Filters', {},
			'Condition', ">",
			'Amount', 0,
		}),
	},
	Trigger = "ColdWaveEnded",
	group = "Diasters",
	id = "ColdWaveEnd",
})

PlaceObj('StoryBitCategory', {
	Chance = 25,
	DecreaseCooldownPercent = 75,
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'Filters', {},
			'Condition', ">",
			'Amount', 0,
		}),
	},
	Trigger = "ColdWave",
	group = "Diasters",
	id = "ColdWaveStart",
})

PlaceObj('StoryBitCategory', {
	Chance = 25,
	DecreaseCooldownPercent = 75,
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'Filters', {},
			'Condition', ">",
			'Amount', 0,
		}),
	},
	Trigger = "DustStormEnded",
	group = "Diasters",
	id = "DustStormEnd",
})

PlaceObj('StoryBitCategory', {
	Chance = 25,
	DecreaseCooldownPercent = 75,
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'Filters', {},
			'Condition', ">",
			'Amount', 0,
		}),
	},
	Trigger = "DustStorm",
	group = "Diasters",
	id = "DustStromStart",
})

PlaceObj('StoryBitCategory', {
	Chance = 25,
	DecreaseCooldownPercent = 75,
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'Filters', {},
			'Condition', ">",
			'Amount', 0,
		}),
	},
	Trigger = "MeteorStormEnded",
	group = "Diasters",
	id = "MeteorStormEnd",
})

PlaceObj('StoryBitCategory', {
	Chance = 25,
	DecreaseCooldownPercent = 75,
	Prerequisites = {
		PlaceObj('CheckObjectCount', {
			'Label', "Colonist",
			'Filters', {},
			'Condition', ">",
			'Amount', 0,
		}),
	},
	Trigger = "MeteorStorm",
	group = "Diasters",
	id = "MeteorStormStart",
})

PlaceObj('StoryBitCategory', {
	Chance = 100,
	Comment = "must be forced, must be out of normal story bit logic and out of the game rule which toggles them off",
	Prerequisites = {},
	Trigger = "PlanetaryAnomalyEvent",
	group = "PlanetaryAnomaly",
	id = "PlanetaryAnomaly",
})

PlaceObj('StoryBitCategory', {
	Chance = 10,
	Prerequisites = {},
	Trigger = "RivalMilestone",
	group = "Rivals",
	id = "RivalMilestone",
})

PlaceObj('StoryBitCategory', {
	Chance = 10,
	Prerequisites = {},
	Trigger = "RivalStartsAnomaly",
	group = "Rivals",
	id = "RivalStartsAnomaly",
})

