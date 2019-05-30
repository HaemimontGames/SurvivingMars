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
		PlaceObj('XTemplateAction', {
			'ActionId', "SpawnPlanetaryAnomalies",
			'ActionTranslate', false,
			'ActionName', "Spawn Planetary Anomalies",
			'OnAction', function (self, host, source)
				host:Op("GedOpTriggerCheat", "root", "CheatSpawnPlanetaryAnomalies")
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
			'ActionId', "RainWater",
			'ActionTranslate', false,
			'ActionName', "Water Rain",
			'OnAction', function (self, host, source)
				host:Op("GedOpTriggerCheat", "root", "CheatRainsDisaster", "Normal_Low")
			end,
			'__condition', function (parent, context) return context.dlcs["armstrong"] end,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "RainToxic",
			'ActionTranslate', false,
			'ActionName', "Toxic Rain",
			'OnAction', function (self, host, source)
				host:Op("GedOpTriggerCheat", "root", "CheatRainsDisaster", "Toxic_Low")
			end,
			'__condition', function (parent, context) return context.dlcs["armstrong"] end,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "Marsquake",
			'ActionTranslate', false,
			'ActionName', "Marsquake",
			'OnAction', function (self, host, source)
				host:Op("GedOpTriggerCheat", "root", "CheatTriggerMarsquake", "Marsquake_Low")
			end,
			'__condition', function (parent, context) return context.dlcs["armstrong"] end,
		}),
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
		'ActionId', "Terraforming",
		'ActionTranslate', false,
		'ActionName', "Terraforming",
		'OnActionEffect', "popup",
		'__condition', function (parent, context) return context.dlcs["armstrong"] end,
	}, {
		PlaceObj('XTemplateAction', {
			'ActionId', "TP_Atmosphere",
			'ActionSortKey', "10",
			'ActionTranslate', false,
			'ActionName', "Atmosphere +10%",
			'ActionIcon', "CommonAssets/UI/Menu/default.tga",
			'OnAction', function (self, host, source)
				host:Op("GedOpTriggerCheat", "root", "CheatChangeTerraformingParamPct", "Atmosphere", 10)
			end,
			'replace_matching_id', true,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "TP_Water",
			'ActionSortKey', "20",
			'ActionTranslate', false,
			'ActionName', "Water +10%",
			'ActionIcon', "CommonAssets/UI/Menu/default.tga",
			'OnAction', function (self, host, source)
				host:Op("GedOpTriggerCheat", "root", "CheatChangeTerraformingParamPct", "Water", 10)
			end,
			'replace_matching_id', true,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "TP_Temperature",
			'ActionSortKey', "30",
			'ActionTranslate', false,
			'ActionName', "Temperature +10%",
			'ActionIcon', "CommonAssets/UI/Menu/default.tga",
			'OnAction', function (self, host, source)
				host:Op("GedOpTriggerCheat", "root", "CheatChangeTerraformingParamPct", "Temperature", 10)
			end,
			'replace_matching_id', true,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "TP_Vegetation",
			'ActionSortKey', "40",
			'ActionTranslate', false,
			'ActionName', "Vegetation +10%",
			'ActionIcon', "CommonAssets/UI/Menu/default.tga",
			'OnAction', function (self, host, source)
				host:Op("GedOpTriggerCheat", "root", "CheatChangeTerraformingParamPct", "Vegetation", 10)
			end,
			'replace_matching_id', true,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "TP_IncreaseAll",
			'ActionSortKey', "50",
			'ActionTranslate', false,
			'ActionName', "Increase all Terraforming Parameters by 10%",
			'ActionIcon', "CommonAssets/UI/Menu/default.tga",
			'OnAction', function (self, host, source)
				host:Op("GedOpTriggerCheat", "root", "CheatChangeTerraformingParamPct", "Atmosphere", 10)
				host:Op("GedOpTriggerCheat", "root", "CheatChangeTerraformingParamPct", "Water", 10)
				host:Op("GedOpTriggerCheat", "root", "CheatChangeTerraformingParamPct", "Temperature", 10)
				host:Op("GedOpTriggerCheat", "root", "CheatChangeTerraformingParamPct", "Vegetation", 10)
			end,
			'replace_matching_id', true,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "TP_DecreaseAll",
			'ActionSortKey', "60",
			'ActionTranslate', false,
			'ActionName', "Decrease all Terraforming Parameters by 10%",
			'ActionIcon', "CommonAssets/UI/Menu/default.tga",
			'OnAction', function (self, host, source)
				host:Op("GedOpTriggerCheat", "root", "CheatChangeTerraformingParamPct", "Atmosphere", -10)
				host:Op("GedOpTriggerCheat", "root", "CheatChangeTerraformingParamPct", "Water", -10)
				host:Op("GedOpTriggerCheat", "root", "CheatChangeTerraformingParamPct", "Temperature", -10)
				host:Op("GedOpTriggerCheat", "root", "CheatChangeTerraformingParamPct", "Vegetation", -10)
			end,
			'replace_matching_id', true,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "TP_MaxAll",
			'ActionSortKey', "61",
			'ActionTranslate', false,
			'ActionName', "Max All Terraforming Parameters",
			'ActionIcon', "CommonAssets/UI/Menu/default.tga",
			'OnAction', function (self, host, source)
				host:Op("GedOpTriggerCheat", "root", "CheatSetTerraformingParamPct", "Atmosphere", 100)
				host:Op("GedOpTriggerCheat", "root", "CheatSetTerraformingParamPct", "Water", 100)
				host:Op("GedOpTriggerCheat", "root", "CheatSetTerraformingParamPct", "Temperature", 100)
				host:Op("GedOpTriggerCheat", "root", "CheatSetTerraformingParamPct", "Vegetation", 100)
			end,
			'replace_matching_id', true,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "TP_ResetAll",
			'ActionSortKey', "62",
			'ActionTranslate', false,
			'ActionName', "Reset All Terraforming Parameters",
			'ActionIcon', "CommonAssets/UI/Menu/default.tga",
			'OnAction', function (self, host, source)
				host:Op("GedOpTriggerCheat", "root", "CheatSetTerraformingParamPct", "Atmosphere", 0)
				host:Op("GedOpTriggerCheat", "root", "CheatSetTerraformingParamPct", "Water", 0)
				host:Op("GedOpTriggerCheat", "root", "CheatSetTerraformingParamPct", "Temperature", 0)
				host:Op("GedOpTriggerCheat", "root", "CheatSetTerraformingParamPct", "Vegetation", 0)
			end,
			'replace_matching_id', true,
		}),
		}),
	PlaceObj('XTemplateAction', {
		'ActionId', "Cheats.Vegetation",
		'ActionTranslate', false,
		'ActionName', "Vegetation",
		'ActionIcon', "CommonAssets/UI/Menu/folder.tga",
		'OnActionEffect', "popup",
		'__condition', function (parent, context) return context.dlcs["armstrong"] end,
		'replace_matching_id', true,
	}, {
		PlaceObj('XTemplateAction', {
			'ActionId', "VG_SpeedDefault",
			'ActionSortKey', "10",
			'ActionTranslate', false,
			'ActionName', "Default Growth Speed",
			'ActionIcon', "CommonAssets/UI/Menu/default.tga",
			'OnAction', function (self, host, source)
				host:Op("GedOpTriggerCheat", "root", "CheatSetVegGrowthModifier", 100)
			end,
			'replace_matching_id', true,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "VG_SpeedFast",
			'ActionSortKey', "20",
			'ActionTranslate', false,
			'ActionName', "Fast Growth Speed",
			'ActionIcon', "CommonAssets/UI/Menu/default.tga",
			'OnAction', function (self, host, source)
				host:Op("GedOpTriggerCheat", "root", "CheatSetVegGrowthModifier", 500)
			end,
			'replace_matching_id', true,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "VG_SpeedVeryFast",
			'ActionSortKey', "30",
			'ActionTranslate', false,
			'ActionName', "Very Fast Growth Speed",
			'ActionIcon', "CommonAssets/UI/Menu/default.tga",
			'OnAction', function (self, host, source)
				host:Op("GedOpTriggerCheat", "root", "CheatSetVegGrowthModifier", 1000)
			end,
			'replace_matching_id', true,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "VG_NoWither",
			'ActionSortKey', "40",
			'ActionTranslate', false,
			'ActionName', "Toggle Ignore Requirements",
			'ActionIcon', "CommonAssets/UI/Menu/default.tga",
			'OnAction', function (self, host, source)
				host:Op("GedOpTriggerCheat", "root", "CheatToggleNoWither")
			end,
			'replace_matching_id', true,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "VG_ForceWither",
			'ActionSortKey', "50",
			'ActionTranslate', false,
			'ActionName', "Toggle Force Wither",
			'ActionIcon', "CommonAssets/UI/Menu/default.tga",
			'OnAction', function (self, host, source)
				host:Op("GedOpTriggerCheat", "root", "CheatToggleForceWither")
			end,
			'replace_matching_id', true,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "VG_Unlock",
			'ActionSortKey', "60",
			'ActionTranslate', false,
			'ActionName', "Unlock All Vegetation Plants",
			'ActionIcon', "CommonAssets/UI/Menu/default.tga",
			'OnAction', function (self, host, source)
				host:Op("GedOpTriggerCheat", "root", "CheatUnlockAllVegetationPlants")
			end,
			'replace_matching_id', true,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "Soil_TargetIncrease",
			'ActionSortKey', "70",
			'ActionTranslate', false,
			'ActionName', "Increase Soil Quality by 25%",
			'ActionIcon', "CommonAssets/UI/Menu/default.tga",
			'OnAction', function (self, host, source)
				host:Op("GedOpTriggerCheat", "root", "CheatChangeSoilQuality", 25)
			end,
			'replace_matching_id', true,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "Soil_TargetDecrease",
			'ActionSortKey', "80",
			'ActionTranslate', false,
			'ActionName', "Decrease Soil Quality by 25%",
			'ActionIcon', "CommonAssets/UI/Menu/default.tga",
			'OnAction', function (self, host, source)
				host:Op("GedOpTriggerCheat", "root", "CheatChangeSoilQuality", -25)
			end,
			'replace_matching_id', true,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "Soil_ToggleOverlay",
			'ActionSortKey', "90",
			'ActionTranslate', false,
			'ActionName', "Toggle Soil Overlay",
			'ActionIcon', "CommonAssets/UI/Menu/default.tga",
			'OnAction', function (self, host, source)
				host:Op("GedOpTriggerCheat", "root", "CheatToggleSoilTransparentOverlay")
			end,
			'replace_matching_id', true,
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

