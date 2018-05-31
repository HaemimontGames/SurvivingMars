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

function CheatDustDevil(major)
	local pos = GetCameraLookAtPassable()
	if pos then
		local data = DataInstances.MapSettings_DustDevils
		local descr = mapdata.MapSettings_DustDevils ~= "disabled" and data[mapdata.MapSettings_DustDevils] or data["DustDevils_VeryLow"]
		local devil = GenerateDustDevil(pos, descr, nil, major)
		devil:Start()
	else
		print("No passable point around camera look at")
	end
end

function CheatMeteors(meteors_type)
	local pos = GetCameraLookAtPassable()
	if pos then
		local data = DataInstances.MapSettings_Meteor
		local descr = mapdata.MapSettings_Meteor ~= "disabled" and data[mapdata.MapSettings_Meteor] or data["Meteor_VeryLow"]
		CreateGameTimeThread(function()
			MeteorsDisaster(descr, meteors_type, pos)
		end)
	end
end

function CheatStopDisaster()
	if g_DustStorm then
		StopDustStorm()
	elseif g_ColdWave then
		StopColdWave()
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
	ForEach{
		class = "ConstructionGroupLeader",
		exec = function(obj)
			if obj.building_class ~= "LifeSupportGridElement" and
				obj.building_class ~= "ElectricityGridElement"
			then
				return
			end
			obj:Complete("quick_build")
		end
	}
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
		ForEach{
			class="ConstructionSite",
			exec = CompleteBuildConstructionSite
		}
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
	local templates = DataInstances.BuildingTemplate
	for i = 1, #templates do
		local category = templates[i].build_category
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
	ForEach {
		class = "SubsurfaceAnomalyMarker",
		exec = function(marker)
			reveal(marker:PlaceDeposit())
			DoneObject(marker)
		end,
	}
	ForEach {
		class = "SubsurfaceAnomaly",
		exec = reveal,
	}
	print(anomalies, "breakthroughs technologies have been unlocked")
end

function ToggleInfopanelCheats()
	config.BuildingInfopanelCheats = not config.BuildingInfopanelCheats
	ReopenSelectionXInfopanel()
end

function AddCheatsUA()
	local CheatsUA = {
		["MapExplorationScan"] = {
			mode = "Game",
			menu = "Cheats/[01]Map Exploration/[01]Scan",
			description = "Reveal all Deposits (all)",
			action = function() 
				if not CheatsEnabled() then return end
				CheatMapExplore("scanned")
			end,
		},
		["MapExplorationDeepScan"] = {
			mode = "Game",
			menu = "Cheats/[01]Map Exploration/[02]Deep Scan",
			description = "Reveal all deposits level 1 and above",
			action = function() 
				if not CheatsEnabled() then return end
				CheatMapExplore("deep scanned")
			end,
		},
		--map cheats
		["ChangeMapEmpty"] = {
			mode = "Game",
			menu = "Cheats/[02]Change Map/[1]Empty Map",
			action = function()
				CheatChangeMap("POCMap_Alt_00")
			end,
		},
		["ChangeMapPocMapAlt1"] = {
			mode = "Game",
			menu = "Cheats/[02]Change Map/[2]Phase 1",
			action = function()
				CheatChangeMap("POCMap_Alt_01")
			end,
		},
		["ChangeMapPocMapAlt2"] = {
			mode = "Game",
			menu = "Cheats/[02]Change Map/[3]Phase 2 (Early)",
			action = function()
				CheatChangeMap("POCMap_Alt_02")
			end,
		},
		["ChangeMapPocMapAlt3"] = {
			mode = "Game",
			menu = "Cheats/[02]Change Map/[4]Phase 2 (Late)",
			action = function()
				CheatChangeMap("POCMap_Alt_03")
			end,
		},
		["ChangeMapPocMapAlt4"] = {
			mode = "Game",
			menu = "Cheats/[02]Change Map/[5]Phase 3",
			action = function()
				CheatChangeMap("POCMap_Alt_04")
			end,
		},
		--List available disasters as submenu; Trigger the selected disaster
		["TriggerDisasterDustDevil"] = {
			mode = "Game",
			menu = "Cheats/[03]Trigger Disaster/[1]Dust Devil",
			description = "Dust Devil",
			action = function()
				if not CheatsEnabled() then return end
				CheatDustDevil()
			end,
		},
		["TriggerDisasterDustDevilMajor"] = {
			mode = "Game",
			menu = "Cheats/[03]Trigger Disaster/[1m]Major Dust Devil",
			description = "Major Dust Devil",
			action = function()
				if not CheatsEnabled() then return end
				CheatDustDevil("major")
			end,
		},
		["TriggerDisasterDustStormNormal"] = {
			mode = "Game",
			menu = "Cheats/[03]Trigger Disaster/[2]Dust Storm",
			description = "Dust Storm",
			action = function()
				if not CheatsEnabled() then return end
				CheatDustStorm("normal")
			end,
		},
		["TriggerDisasterDustStormGreat"] = {
			mode = "Game",
			menu = "Cheats/[03]Trigger Disaster/[3]Great Dust Storm",
			description = "Dust Storm",
			action = function()
				if not CheatsEnabled() then return end
				CheatDustStorm("great")
			end,
		},
		["TriggerDisasterDustStormElectrostatic"] = {
			mode = "Game",
			menu = "Cheats/[03]Trigger Disaster/[4]Electrostatic Dust Storm",
			description = "Dust Storm",
			action = function()
				if not CheatsEnabled() then return end
				CheatDustStorm("electrostatic")
			end,
		},
		["TriggerDisasterColdWave"] = {
			mode = "Game",
			menu = "Cheats/[03]Trigger Disaster/[5]Cold Wave",
			description = "Cold Wave",
			action = function()
				if not CheatsEnabled() then return end
				CheatColdWave()
			end,
		},
		["TriggerDisasterMeteorsSingle"] = {
			mode = "Game",
			menu = "Cheats/[03]Trigger Disaster/[6]Meteors Single",
			description = "Meteors",
			action = function()
				if not CheatsEnabled() then return end
				CheatMeteors("single")
			end,
		},
		["TriggerDisasterMeteorsMultiSpawn"] = {
			mode = "Game",
			menu = "Cheats/[03]Trigger Disaster/[7]Meteors Multi Spawn",
			description = "Meteors",
			action = function()
				if not CheatsEnabled() then return end
				CheatMeteors("multispawn")
			end,
		},
		["TriggerDisasterMeteorsStorm"] = {
			mode = "Game",
			menu = "Cheats/[03]Trigger Disaster/[8]Meteors Storm",
			description = "Meteors",
			action = function()
				if not CheatsEnabled() then return end
				CheatMeteors("storm")
			end,
		},
		["TriggerDisasterStop"] = {
			mode = "Game",
			menu = "Cheats/[03]Trigger Disaster/[9]Stop Disaster",
			description = "Stop Disaster",
			action = function()
				if not CheatsEnabled() then return end
				CheatStopDisaster()
			end,
		},

		["G_OpenPregameMenu"] = {			
			mode = "Game",
			menu = "Cheats/[06]New Game",
			description = "Open Pregame Menu",
			action = function()
				CreateRealTimeThread(OpenPreGameMainMenu)
			end
		},
		["G_UnlockАllТech"] = {
			mode = "Game",
			menu = "Cheats/[04]Research/[10]Unlock all Tech",
			description = "Unlock all techs instantly",
			action = function()
				if not CheatsEnabled() then return end
				CheatUnlockAllTech()
			end,
		},
		["G_ResearchCurrent"] = {
			mode = "Game",
			menu = "Cheats/[04]Research/[08]Research current tech",
			description = "Finish current research instantly",
			action = function()
				if not CheatsEnabled() then return end
				CheatResearchCurrent()
			end,
		},		
		["G_ResearchAll"] = {
			mode = "Game",
			menu = "Cheats/[04]Research/[09]Research all",
			description = "Research all techs instantly",
			action = function()
				if not CheatsEnabled() then return end
				CheatResearchAll()
			end,
		},
		["G_UnlockAllBuildings"] = {
			mode = "Game",
			menu = "Cheats/[10]Unlock all buildings",
			description = "Unlock all buildings for construction",
			action = function()
				if not CheatsEnabled() then return end
				CheatUnlockAllBuildings()
			end,
		},
		["G_ToggleAllShifts"] = {
			mode = "Game",
			menu = "Cheats/[05]Workplaces/Toggle All Shifts",
			description = "Toggle All Shifts",
			action = function()
				if not CheatsEnabled() then return end
				CheatToggleAllShifts()
			end,
		},
		["G_CheatUpdateAllWorkplaces"] = {
			mode = "Game",
			menu = "Cheats/[05]Workplaces/Update All Workplaces",
			description = "Update All Workplaces",
			action = function()
				if not CheatsEnabled() then return end
				CheatUpdateAllWorkplaces()
			end,
		},
		["G_CheatClearForcedWorkplaces"] = {
			mode = "Game",
			menu = "Cheats/[05]Workplaces/Clear Forced Workplaces",
			description = "Clear Forced Workplaces",
			action = function()
				if not CheatsEnabled() then return end
				CheatClearForcedWorkplaces()
			end,
		},
		["G_UnpinAll"] = {
			mode = "Game",
			menu = "Cheats/[10]Unpin All Pinned Objects",
			description = "Unpin All Pinned Objects",
			action = function()
				if not CheatsEnabled() then return end
				UnpinAll()
			end,
		},
		["UnlockAllBreakthroughs"] = {
			mode = "Game",
			menu = "Cheats/[04]Research/[11]Unlock all Breakthroughs",
			description = "Unlock all breakthroughs on this map",
			action = function()
				if not CheatsEnabled() then return end
				CheatUnlockBreakthroughs()
			end,
		},


		["SpawnColonist1"] = {
			mode = "Game",
			menu = "Cheats/[05]Spawn Colonist/[1]Spawn 1 Colonist",
			description = "Spawn 1 Colonist",
			action = function()
				if not CheatsEnabled() then return end
				CheatSpawnNColonists(1)
			end,
		},
		
		["SpawnColonist10"] = {
			mode = "Game",
			menu = "Cheats/[05]Spawn Colonist/[2]Spawn 10 Colonist",
			description = "Spawn 10 Colonist",
			action = function()
				if not CheatsEnabled() then return end
				CheatSpawnNColonists(10)
			end,
		},
		
		["SpawnColonist100"] = {
			mode = "Game",
			menu = "Cheats/[05]Spawn Colonist/[3]Spawn 100 Colonist",
			description = "Spawn 100 Colonist",
			action = function()
				if not CheatsEnabled() then return end
				CheatSpawnNColonists(100)
			end,
		},
				
		["G_CompleteWiresPipes"] = {
			mode = "Game",
			menu = "Cheats/[12]Complete wires\\pipes",
			description = "Complete all wires and pipes instantly",
			action = function()
				if not CheatsEnabled() then return end
				CheatCompleteAllWiresAndPipes()
			end,
		},
		
		["G_CompleteConstructions"] = {
			mode = "Game",
			menu = "Cheats/[13]Complete constructions",
			key = "Alt-B",
			description = "Complete all constructions instantly",
			action = function()
				if not CheatsEnabled() then return end
				CheatCompleteAllConstructions()
			end,
		},
		["G_ModsEditor"] = {
			mode = "Game",
			menu = "Cheats/[14]Mod editor",
			action = function()
				if not CheatsEnabled() then return end
				ModEditorOpen()
			end,
		},
		["G_AddFunding"] = {
			mode = "Game",
			menu = "Cheats/[15]Add funding $" .. l_add_funding,
			action = function()
				if not CheatsEnabled() then return end
				CheatAddFunding()
			end,
		},
		["G_ToggleOnScreenHints"] = {
			mode = "Game",
			menu = "Cheats/[16]Toggle on-screen hints",
			action = function()
				if not CheatsEnabled() then return end
				SetHintNotificationsEnabled(not HintsEnabled)
				UpdateOnScreenHintDlg()
			end,
		},
		["G_ResetOnScreenHints"] = {
			mode = "Game",
			menu = "Cheats/[17]Reset on-screen hints",
			action = function()
				if not CheatsEnabled() then return end
				g_ShownOnScreenHints = {}
				UpdateOnScreenHintDlg()
			end,
		},
		["G_ToggleSigns"] = {
			key = "Ctrl-U",
			mode = "Game",
			menu = "Cheats/[18]Toggle Signs",
			action = function()
				if not CheatsEnabled() then return end
				ToggleSigns()
			end,
		},
		["G_ToggleInGameInterface"] = {
			key = "Ctrl-I",
			mode = "Game",
			menu = "Cheats/[19]Toggle InGame Interface",
			action = function()
				hr.RenderUIL = hr.RenderUIL == 0 and 1 or 0
			end,
		},
		["G_ToggleInfopanelCheats"] = {
			menu = "Cheats/[07]Toggle Infopanel Cheats",
			description = function()
				local action = config.BuildingInfopanelCheats and "Disable" or "Enable"
				return action .. " the cheats in the infopanels"
			end,
			action = function()
				ToggleInfopanelCheats()
			end,
		},
	}
	CheatsUA["FreeCamera"] = {
		key = "Shift-C",
		mode = "Game",
		menu = "Cheats/[20]Toggle Free Camera",
		action = function()
			if not mapdata.GameLogic then return end
			if cameraFly.IsActive() then
				SetMouseDeltaMode(false)
				cameraRTS.Activate(1)
			else
				print("Camera Fly")
				cameraFly.Activate(1)
				SetMouseDeltaMode(true)
			end
		end,
	}
	if Platform.editor then
		UserActions.AddActions(CheatsUA)
	end
end

function OnMsg.DataLoaded()
	AddCheatsUA()
end

if not FirstLoad then
	AddCheatsUA()
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
