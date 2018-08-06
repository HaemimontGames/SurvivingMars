function CheatsEnabled()
	return false
end

function CheatMapExplore(status)
	if #g_MapSectors == 0 then
		return
	end
	SuspendPassEdits("CheatMapExplore")
	local old = IsDepositObstructed
	IsDepositObstructed = empty_func
	for x = 1, const.SectorCount do
		for y = 1, const.SectorCount do
			g_MapSectors[x][y]:Scan(status)
		end
	end
	IsDepositObstructed = old
	ResumePassEdits("CheatMapExplore")
end

local function GetCameraLookAtPassable()
	local _, lookat = GetCamera()
	return terrain.IsPassable(lookat) and lookat or GetRandomPassableAround(lookat, 100 * guim)
end

function CheatDustDevil(major, setting)
	local pos = GetCameraLookAtPassable()
	if pos then
		setting = setting or mapdata.MapSettings_DustDevils
		local data = DataInstances.MapSettings_DustDevils
		local descr = setting ~= "disabled" and data[setting] or data["DustDevils_VeryLow"]
		local devil = GenerateDustDevil(pos, descr, nil, major)
		devil:Start()
	else
		print("No passable point around camera look at")
	end
end

function CheatMeteors(meteors_type, setting)
	local pos = GetCameraLookAtPassable()
	if pos then
		setting = setting or mapdata.MapSettings_Meteor
		local data = DataInstances.MapSettings_Meteor
		local descr = setting ~= "disabled" and data[setting] or data["Meteor_VeryLow"]
		CreateGameTimeThread(function()
			if meteors_type == "storm" then
				g_MeteorStorm = true
			end
			MeteorsDisaster(descr, meteors_type, pos)
			if meteors_type == "storm" then
				g_MeteorStorm = false
			end
		end)
	end
end

function CheatStopDisaster()
	if g_DustStorm then
		StopDustStorm()
	elseif g_ColdWave then
		StopColdWave()
	elseif g_MeteorStorm then
		StopMeteorStorm()
	end
end

function CheatResearchAll()
	if not UICity then return end
	for filed_id, list in sorted_pairs(UICity.tech_field) do
		if TechFields[filed_id].discoverable then
			for i=1,#list do
				UICity:SetTechResearched(list[i])
			end
		end
	end
end

function CheatResearchCurrent()
	if not UICity then return end
	UICity:SetTechResearched()
end

function CheatCompleteAllWiresAndPipes(list)
	SuspendTerrainInvalidations("cheat_wires_and_pipes")
	MapForEach("map", "ConstructionGroupLeader",
		function(obj)
			if obj.building_class ~= "LifeSupportGridElement" and
				obj.building_class ~= "ElectricityGridElement"
			then
				return
			end
			obj:Complete("quick_build")
		end)
	ResumeTerrainInvalidations("cheat_wires_and_pipes")
end

local function CompleteBuildConstructionSite(site)
	if not site.construction_group or site.construction_group[1] == site then
		site:Complete("quick_build")
	end
end
function CheatCompleteAllConstructions()
	SuspendTerrainInvalidations("cheat_all_constructions")
	CheatCompleteAllWiresAndPipes()
	--Repeat the whole procedure twice to make sure
	--buildings with second stages (domes) are completed
	for i=1,2 do
		MapForEach("map", "ConstructionSite", CompleteBuildConstructionSite)
	end
	ResumeTerrainInvalidations("cheat_all_constructions")
end

local l_add_funding = 500000000
function CheatAddFunding(funding)
	if UICity then
		UICity:ChangeFunding(funding or l_add_funding)
	end
end

function CheatChangeMap(map)
	if Platform.developer then
		CreateRealTimeThread(function()
			CloseAllDialogs()
			--wait for paradox account wizard to open the pregame menu
			Sleep(1)
			CloseMenuDialogs()
			ChangeMap(map)
			LocalStorage.last_map = map
			SaveLocalStorage()
		end)
	end
end

function CheatUnlockAllTech()
	if not UICity then return end
	for filed_id, list in sorted_pairs(UICity.tech_field) do
		if TechFields[filed_id].discoverable then
			for i=1,#list do
				UICity:SetTechDiscovered(list[i])
			end
		end
	end
end

function CheatUnlockAllBuildings()
	for _, template in pairs(BuildingTemplates) do
		local category = template.build_category
		if not BuildMenuPrerequisiteOverrides[category] then
			BuildMenuPrerequisiteOverrides[category] = true
		end
	end
end

function CheatToggleAllShifts()
	local blds = UICity.labels.ShiftsBuilding
	if #blds == 0 then return end
	local open = blds[1]:IsClosedShift(1)
	for i, bld in ipairs(blds) do
		for k = 1,bld.max_shifts do
			if open then
				bld:OpenShift(k)
			else
				bld:CloseShift(k)
			end
		end
	end
	if open then
		CheatUpdateAllWorkplaces()
	end
end

function CheatUpdateAllWorkplaces()
	UpdateWorkplaces(UICity.labels.Colonist)
end

function CheatClearForcedWorkplaces()
	for i, col in ipairs(UICity.labels.Colonist) do
		col.user_forced_workplace = nil
	end
end

function CheatUnlockBreakthroughs()
	local anomalies = 0
	local function reveal(anomaly)
		if not IsValid(anomaly) or anomaly.tech_action ~= "breakthrough" then return end
		anomaly:SetRevealed(true)
		anomaly:ScanCompleted(false)
		DoneObject(anomaly)
		anomalies = anomalies + 1
	end
	MapForEach("map", "SubsurfaceAnomalyMarker", function(marker)
			reveal(marker:PlaceDeposit())
			DoneObject(marker)
		end)
	MapForEach("map" , "SubsurfaceAnomaly", reveal)
	print(anomalies, "breakthroughs technologies have been unlocked")
end

function CheatToggleInfopanelCheats()
	config.BuildingInfopanelCheats = not config.BuildingInfopanelCheats
	ReopenSelectionXInfopanel()
end

GamepadCheatsList = {
	{ display_name = T{7790, "Research Current Tech"},      func = CheatResearchCurrent },
	{ display_name = T{7791, "Research all Techs"},         func = CheatResearchAll },
	{ display_name = T{7792, "Unlock all Techs"},           func = CheatUnlockAllTech },
	{ display_name = T{7793, "Unlock all Breakthroughs"},   func = CheatUnlockBreakthroughs },
	{ display_name = T{7794, "Construct all buildings"},    func = CheatCompleteAllConstructions },
	{ display_name = T{7795, "Add funding ($500,000,000)"}, func = CheatAddFunding },
	{ display_name = T{7796, "Spawn 1 Colonist"},           func = function() CheatSpawnNColonists(1) end },
	{ display_name = T{7797, "Spawn 10 Colonists"},         func = function() CheatSpawnNColonists(10) end },
	{ display_name = T{7798, "Spawn 100 Colonists"},        func = function() CheatSpawnNColonists(100) end },
}

function OnMsg.ChangeMap(map)
	if not Platform.developer then
		ConsoleSetEnabled(map == "Mod")
	end
end
