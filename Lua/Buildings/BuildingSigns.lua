DefineClass.BuildingSign = {
	__parents = { "EntityClass", "UIAttach" },
	flags = { gofSpecialOrientMode = true, gofRealTimeAnim = true, cfConstructible = false, efSelectable = true, efShadow = false, efSunShadow = false },
	orient_mode = "facing_vertical",
	entity = false,
	priority = 0,
}

DefineClass.SignNoCommandCenter = {
	__parents = { "BuildingSign" },
	entity = "SignOutOfRange", --temp
	priority = 0,
}

DefineClass.SignStopped = {
	__parents = { "BuildingSign" },
	entity = "SignNotWorking", --temp
	priority = 12,
}

DefineClass.SignSalvaged = {
	__parents = { "BuildingSign" },
	entity = "SignSalvaged",
	priority = 11,
}

DefineClass.SignBreakdown = {
	__parents = { "BuildingSign" },
	entity = "SignBreakdown",
	priority = 10,
}

DefineClass.SignMalfunction = {
	__parents = { "BuildingSign" },
	entity = "SignMalfunction",
	priority = 9,
}

DefineClass.SignNotWorking = {
	__parents = { "BuildingSign" },
	entity = "SignNotWorking",
	priority = 8,
}

DefineClass.SignFullStorage = {
	__parents = { "BuildingSign" },
	entity = "SignFullStorage",
	priority = 7,
}

DefineClass.SignNoWorkers = {
	__parents = { "BuildingSign" },
	entity = "SignNoWorkers",
	priority = 6,
}

DefineClass.SignNoPowerProducer = {
	__parents = { "BuildingSign" },
	entity = "SignNoPowerProducer",
	priority = 5,
}

DefineClass.SignNoPower = {
	__parents = { "BuildingSign" },
	entity = "SignNoPower",
	priority = 4,
}

DefineClass.SignNoPipeConnection = {
	__parents = { "BuildingSign" },
	entity = "SignNoPipeConnection",
	priority = 3,
}

DefineClass.SignNoOxygen = {
	__parents = { "BuildingSign" },
	entity = "SignNoOxygen",
	priority = 2,
}

DefineClass.SignNoConsumptionResource = {
	__parents = { "BuildingSign" },
	entity = "SignFullStorage",
	priority = 1,
}

DefineClass.SignNoWater = {
	__parents = { "BuildingSign" },
	entity = "SignNoWater",
	priority = 1,
}

DefineClass.SignOutOfRange = {
	__parents = { "BuildingSign" },
	entity = "SignOutOfRange",
	priority = 1,
}

DefineClass.SignExpeditionRocket = {
	__parents = { "BuildingSign" },
	entity = "SignExpeditionRocket",
	priority = 50,
}

DefineClass.SignTradeRocket = {
	__parents = { "BuildingSign" },
	entity = "SignAutomatedTrade",
	priority = 50,
}

DefineClass.UnitSign = {
	__parents = { "EntityClass", "UIAttach" },
	flags = { efSelectable = true, gofSpecialOrientMode = true, gofRealTimeAnim = true },
	orient_mode = "facing_vertical",
	entity = false,
}

DefineClass.UnitSignThirsty = {
	__parents = { "UnitSign" },
	entity = "SignThirsty",
}

DefineClass.UnitSignSuffocating = {
	__parents = { "UnitSign" },
	entity = "SignSuffocating",
}

DefineClass.UnitSignStarving = {
	__parents = { "UnitSign" },
	entity = "SignHungry",
}

DefineClass.UnitSignInsane = {
	__parents = { "UnitSign" },
	entity = "SignInsane",
}

DefineClass.UnitSignHomeless = {
	__parents = { "UnitSign" },
	entity = "SignHomeless",
}

DefineClass.UnitSignUnemployed = {
	__parents = { "UnitSign" },
	entity = "SignUnemployed",
}

DefineClass.UnitSignIrradiated = {
	__parents = { "UnitSign" },
	entity = "SignIrradiated",
}

DefineClass.UnitSignFreezing = {
	__parents = { "UnitSign" },
	entity = "SignFreezing",
}

DefineClass.UnitSignEarthsick = {
	__parents = { "UnitSign" },
	entity = "SignEarthsick",
}

DefineClass.UnitSignUnableToWork = {
	__parents = { "UnitSign" },
	entity = "SignUnableToWork",
}

DefineClass.UnitSignRogue = {
	__parents = { "UnitSign" },
	entity = "SignRogue",
}

DefineClass.UnitArrowHomeless = {
	__parents = { "UnitSign" },
	entity = "ArrowHomeless",
}

DefineClass.UnitArrowUnemployed = {
	__parents = { "UnitSign" },
	entity = "ArrowUnemployed",
}

DefineClass.UnitArrowIrradiated = {
	__parents = { "UnitSign" },
	entity = "ArrowIrradiated",
}
DefineClass.UnitArrowSuffocating = {
	__parents = { "UnitSign" },
	entity = "ArrowSuffocating",
}
DefineClass.UnitArrowThirsty = {
	__parents = { "UnitSign" },
	entity = "ArrowThirsty",
}
DefineClass.UnitArrowFreezing = {
	__parents = { "UnitSign" },
	entity = "ArrowFreezing",
}
DefineClass.UnitArrowHungry = {
	__parents = { "UnitSign" },
	entity = "ArrowHungry",
}
DefineClass.UnitArrowInsane = {
	__parents = { "UnitSign" },
	entity = "ArrowInsane",
}
DefineClass.UnitArrowEarthsick = {
	__parents = { "UnitSign" },
	entity = "ArrowEarthsick",
}

DefineClass.UnitArrowUnableToWork = {
	__parents = { "UnitSign" },
	entity = "ArrowUnableToWork",
}

DefineClass.SignHalted = {
	__parents = { "BuildingSign" },
	entity = "SignNotWorking",
	priority = 12,
}

----

GlobalVar("g_SignsVisible", true)

function ToggleSigns()
	if not g_SignsVisible then
		SetSignsVisible(true)
	else
		SetSignsVisible(false)
	end
	--g_SubsurfaceDepositsVisible = not g_SignsVisible
end

function SetSignsVisible(visible)
	if visible and not g_SignsVisible then
		MapSetEnumFlags( const.efVisible,"map","BuildingSign", "UnitSign", "ArrowTutorialBase", "SelectionArrow")
		if not g_ResourceIconsTurnedOff then
			MapSetEnumFlags( const.efVisible,"map","TerrainDeposit","SubsurfaceDeposit")
			g_ResourceIconsVisible = true
		end
		g_SignsVisible = true
	end
	if not visible and g_SignsVisible then
		MapClearEnumFlags( const.efVisible,"map","BuildingSign", "UnitSign", "ArrowTutorialBase","TerrainDeposit","SubsurfaceDeposit", "SelectionArrow")
		g_ResourceIconsVisible = false
		g_SignsVisible = false
	end
end