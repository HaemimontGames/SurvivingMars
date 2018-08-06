-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Ged",
	id = "ModEditorCheats",
	PlaceObj('XTemplateAction', {
		'ActionId', "Exploration",
		'ActionTranslate', false,
		'ActionName', "Exploration",
		'OnActionEffect', "popup",
	}, {
		PlaceObj('XTemplateAction', {
			'ActionId', "ScanAllSectors",
			'ActionTranslate', false,
			'ActionName', "Scan All Sectors",
			'OnAction', function (self, host, source)
host:Op("GedOpTriggerCheat", "root", "CheatMapExplore", "scanned")
end,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "DeepScanAllSectors",
			'ActionTranslate', false,
			'ActionName', "Deep Scan All Sectors",
			'OnAction', function (self, host, source)
host:Op("GedOpTriggerCheat", "root", "CheatMapExplore", "deep scanned")
end,
		}),
		}),
	PlaceObj('XTemplateAction', {
		'ActionId', "TriggerDisasters",
		'ActionTranslate', false,
		'ActionName', "Trigger Disasters",
		'OnActionEffect', "popup",
	}, {
		PlaceObj('XTemplateAction', {
			'ActionId', "DustDevil",
			'ActionTranslate', false,
			'ActionName', "Dust Devil",
			'OnAction', function (self, host, source)
host:Op("GedOpTriggerCheat", "root", "CheatDustDevil")
end,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "DustDevilMajor",
			'ActionTranslate', false,
			'ActionName', "Dust Devil (Major)",
			'OnAction', function (self, host, source)
host:Op("GedOpTriggerCheat", "root", "CheatDustDevil", "major")
end,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "DustStorm",
			'ActionTranslate', false,
			'ActionName', "Dust Storm",
			'OnAction', function (self, host, source)
host:Op("GedOpTriggerCheat", "root", "CheatDustStorm", "normal")
end,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "DustStormGreat",
			'ActionTranslate', false,
			'ActionName', "Dust Storm (Great)",
			'OnAction', function (self, host, source)
host:Op("GedOpTriggerCheat", "root", "CheatDustStorm", "great")
end,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "DustStormElectrostatic",
			'ActionTranslate', false,
			'ActionName', "Dust Storm (Electrostatic)",
			'OnAction', function (self, host, source)
host:Op("GedOpTriggerCheat", "root", "CheatDustStorm", "electrostatic")
end,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "ColdWave",
			'ActionTranslate', false,
			'ActionName', "Cold Wave",
			'OnAction', function (self, host, source)
host:Op("GedOpTriggerCheat", "root", "CheatColdWave")
end,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "MeteorsSingle",
			'ActionTranslate', false,
			'ActionName', "Meteors (Single)",
			'OnAction', function (self, host, source)
host:Op("GedOpTriggerCheat", "root", "CheatMeteors", "single")
end,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "MeteorsMulti",
			'ActionTranslate', false,
			'ActionName', "Meteors (Multi)",
			'OnAction', function (self, host, source)
host:Op("GedOpTriggerCheat", "root", "CheatMeteors", "multispawn")
end,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "MeteorsStorm",
			'ActionTranslate', false,
			'ActionName', "Meteors (Storm)",
			'OnAction', function (self, host, source)
host:Op("GedOpTriggerCheat", "root", "CheatMeteors", "storm")
end,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "StopDisaster",
			'ActionTranslate', false,
			'ActionName', "Stop Disaster",
			'OnAction', function (self, host, source)
host:Op("GedOpTriggerCheat", "root", "CheatStopDisaster")
end,
		}),
		}),
	PlaceObj('XTemplateAction', {
		'ActionId', "Research",
		'ActionTranslate', false,
		'ActionName', "Research",
		'OnActionEffect', "popup",
	}, {
		PlaceObj('XTemplateAction', {
			'ActionId', "ResearchCurrentTech",
			'ActionTranslate', false,
			'ActionName', "Research Current Tech",
			'OnAction', function (self, host, source)
host:Op("GedOpTriggerCheat", "root", "CheatResearchCurrent")
end,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "ResearchAllTech",
			'ActionTranslate', false,
			'ActionName', "Research All Tech",
			'OnAction', function (self, host, source)
host:Op("GedOpTriggerCheat", "root", "CheatResearchAll")
end,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "UnlockAllTech",
			'ActionTranslate', false,
			'ActionName', "Unlock All Tech",
			'OnAction', function (self, host, source)
host:Op("GedOpTriggerCheat", "root", "CheatUnlockAllTech")
end,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "UnlockBreakthroughs",
			'ActionTranslate', false,
			'ActionName', "Unlock Breakthroughs",
			'OnAction', function (self, host, source)
host:Op("GedOpTriggerCheat", "root", "CheatUnlockBreakthroughs")
end,
		}),
		}),
	PlaceObj('XTemplateAction', {
		'ActionId', "SpawnColonists",
		'ActionTranslate', false,
		'ActionName', "Spawn Colonists",
		'OnActionEffect', "popup",
	}, {
		PlaceObj('XTemplateAction', {
			'ActionId', "SpawnColonists1",
			'ActionTranslate', false,
			'ActionName', "+1 Colonist",
			'OnAction', function (self, host, source)
host:Op("GedOpTriggerCheat", "root", "CheatSpawnNColonists", 1)
end,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "SpawnColonists10",
			'ActionTranslate', false,
			'ActionName', "+10 Colonists",
			'OnAction', function (self, host, source)
host:Op("GedOpTriggerCheat", "root", "CheatSpawnNColonists", 10)
end,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "SpawnColonists100",
			'ActionTranslate', false,
			'ActionName', "+100 Colonists",
			'OnAction', function (self, host, source)
host:Op("GedOpTriggerCheat", "root", "CheatSpawnNColonists", 100)
end,
		}),
		}),
	PlaceObj('XTemplateAction', {
		'ActionId', "CheatToggleInfopanelCheats",
		'ActionTranslate', false,
		'ActionName', "Toggle Infopanel Cheats",
		'OnAction', function (self, host, source)
host:Op("GedOpTriggerCheat", "root", "CheatToggleInfopanelCheats")
end,
	}),
	PlaceObj('XTemplateAction', {
		'ActionId', "UnlockBuildings",
		'ActionTranslate', false,
		'ActionName', "Unlock All Buildings",
		'OnAction', function (self, host, source)
host:Op("GedOpTriggerCheat", "root", "CheatUnlockAllBuildings")
end,
	}),
	PlaceObj('XTemplateAction', {
		'ActionId', "CompleteWiresPipes",
		'ActionTranslate', false,
		'ActionName', "Complete All Wires/Pipes",
		'OnAction', function (self, host, source)
host:Op("GedOpTriggerCheat", "root", "CheatCompleteAllWiresAndPipes")
end,
	}),
	PlaceObj('XTemplateAction', {
		'ActionId', "CompleteConstructions",
		'ActionTranslate', false,
		'ActionName', "Complete All Constructions",
		'OnAction', function (self, host, source)
host:Op("GedOpTriggerCheat", "root", "CheatCompleteAllConstructions")
end,
	}),
	PlaceObj('XTemplateAction', {
		'ActionId', "AddFunding500000000",
		'ActionTranslate', false,
		'ActionName', "Add Funding ($500,000,000)",
		'OnAction', function (self, host, source)
host:Op("GedOpTriggerCheat", "root", "CheatAddFunding", 500000000)
end,
	}),
})

