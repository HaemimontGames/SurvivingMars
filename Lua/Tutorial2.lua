local function AreAllDronesAssigned()
	local drones_label = UICity.labels.Drone
	local drone_hub = UICity.labels.DroneHub[1]
	for i,drone in ipairs(drones_label) do
		if not drone.command_center then
			return false
		end
	end
	return true
end

local function GetMarkerPosition(name)
	local marker = g_Tutorial.MapMarkers[name]
	return marker and marker:GetPos()
end

local function DisableMaintenance(obj)
	if IsKindOf(obj, "RequiresMaintenance") then
		obj:SetBase("disable_maintenance", 1)
		obj.accumulate_dust = false
	elseif IsKindOf(obj, "DroneBase") then
		obj.accumulate_dust = false
	end
end

local position_tolerance = 15*guim
position_tolerance = position_tolerance*position_tolerance

g_TutorialScenarios.Tutorial2 = function()
	--0. Setup
	g_Tutorial.BuildMenuWhitelist = {} --block all buildings
	--find objects
	local refueling_rocket
	for i,rocket in ipairs(UICity.labels.SupplyRocket or "") do
		if rocket:GetPos() ~= InvalidPos then
			refueling_rocket = rocket
			break
		end
	end
	for i,drone in ipairs(refueling_rocket.drones) do
		DisableMaintenance(drone)
	end
	local transport = UICity.labels.RCTransport[1]
	DisableMaintenance(transport)
	local drone_hub = UICity.labels.DroneHub[1]
	DisableMaintenance(drone_hub)
	--initial sectors
	local old = IsDepositObstructed
	IsDepositObstructed = empty_func	
	GetSector("F3"):Scan("scanned")
	GetSector("F4"):Scan("scanned")
	GetSector("G3"):Scan("scanned")
	IsDepositObstructed = old	
	--setup metal deposit in sector G3 (used in step 5) - they need to be exactly 5

	local deposits = GetSector("G3").markers.surface
	for i=2,#deposits do
		deposits[i].placed_obj:delete()
	end
	local deposit1 = deposits[1].placed_obj --leave only the first rock, hide it and its set amount
	deposit1:SetVisible(false)
	deposit1.max_amount = 5*const.ResourceScale
	--scanning speed modifications:
	CreateLabelModifier("Tutorial2ExplorerScanning", "Consts", "RCRoverScanAnomalyTime", 0, -50) --fast anomaly scanning (x2)
	g_Tutorial.SectorScanBase = const.SectorScanBase * 3 --fast sector scanning (x3)
	
	
	--1. Intro
	--show messages
	WaitTutorialPopup("Tutorial2_Popup1_Intro")
	TutorialNextHint("Tutorial_2_SelectRover")
	--show transport
	ViewObjectMars(transport)
	--wait for the player to select the RC Transport
	WaitObjectSelected(transport)
	TutorialNextHint("Tutorial_2_MoveRover")
	--wait for the player to move the RC Transport
	ShowTutorialArrow("MoveRover")
	local arrow_pos = GetMarkerPosition("MoveRover")
	while transport:GetPos():Dist2D2(arrow_pos) > position_tolerance do
		Sleep(1000)
	end
	RemoveAllTutorialArrows()
	
	--3. Transport Rover
	--show transport
	ViewObjectMars(transport)
	--show messages
	WaitTutorialPopup("Tutorial2_Popup3_RCTransport")
	TutorialNextHint("Tutorial_2_LoadFuel")
	--wait until 30 fuel is loaded
	local fuel_depot = UICity.labels.StorageFuel[1]
	ShowTutorialArrow(fuel_depot, "ArrowTutorialBase")
	--WaitInfopanelAction("RCTransport", "LoadResource", function(arrow)
	--	return transport.command == "TransferResources" or
	--		transport.command == "LoadWithNoTarget" or
	--		transport:GetStored_Fuel() >= 30*const.ResourceScale
	--end)
	WaitResourceItemsChoice("Fuel", nil, "center-bottom")
	RemoveAllTutorialArrows()
	while transport:GetStored_Fuel() < 30*const.ResourceScale do
		Sleep(1000)
	end
	TutorialNextHint("Tutorial_2_UnloadFuel")
	ViewObjectMars(transport)
	WaitObjectSelected(transport)
	ViewObjectMars(GetMarkerPosition("UnloadFuel"))
	--setup rocket
	refueling_rocket.launch_fuel = 30*const.ResourceScale
	refueling_rocket.refuel_request:SetAmount(30*const.ResourceScale)
	local refueling_rocket_org_pos = refueling_rocket:GetPos()
	--wait until fuel is unloaded
	ShowTutorialArrow("UnloadFuel")
	local arrow = TutorialUIArrow:new({
		AnchorType = "left-center",
		FindTarget = function(self)
			if not IsKindOf(SelectedObj, "RCTransport") then return false end
			if not Dialogs.Infopanel then return false end
			for i,button in ipairs(Dialogs.Infopanel.idMainButtons) do
				if button.OnPressParam == "UnloadResource" then
					return button
				end
			end
			return false
		end,
	}, terminal.desktop)
	WaitResourcesNearPoint(refueling_rocket:GetPos(), "Fuel", 30*const.ResourceScale, 100*guim, {"RCTransport"})
	arrow:delete()
	RemoveAllTutorialArrows()
	TutorialNextHint("Tutorial_2_LaunchRocket")
	--wait until rocket is fully refuelled
	while refueling_rocket.command == "Refuel" do
		Sleep(50)
	end
	local arrow = TutorialUIArrow:new({
		AnchorType = "center-top",
		FindTarget = function(self)
			local pins_dlg = Dialogs.PinsDlg
			if not pins_dlg then return false end
			for _,win in ipairs(pins_dlg) do
				if not win.Dock and win.context == refueling_rocket and SelectedObj ~= refueling_rocket then
					return win
				end
			end
			return false
		end,
	}, terminal.desktop)
	WaitInfopanelAction("SupplyRocket", "UILaunch", function(arrow) return refueling_rocket.command == "Countdown" end)
	arrow:delete()
	--wait until rocket has been launched
	WaitMsg("RocketLaunched")
	--wait for the player to look at the launch
	Sleep(9500)
	
	
	--4. Reassign Drones
	--show orphaned drones
	ViewObjectMars(refueling_rocket_org_pos)
	--show messages
	WaitTutorialPopup("Tutorial2_Popup4_OrphanedDrones")
	TutorialNextHint("Tutorial_2_OrphanedDrones")
	--wait until all drones are assigned
	if not AreAllDronesAssigned() then
		--get all drones
		local drones_label = UICity.labels.Drone
		--place an arrow at one of the orphaned drones
		for i,drone in ipairs(drones_label) do
			if not drone.command_center then
				ShowTutorialArrow(drone, "ArrowTutorialBase", "ArrowTutorial_02")
				break
			end
		end
		ShowTutorialArrow(drone_hub, "ArrowTutorialBase", "ArrowTutorial_03")
		WaitInfopanelAction("Drone", "ToggleReassignAllInteractionMode", function(arrow) return arrow.button_pressed or AreAllDronesAssigned() end)
		ViewObjectMars(drone_hub)
		while true do
			if AreAllDronesAssigned() then
				break
			end
			Sleep(1000)
		end
		RemoveAllTutorialArrows()
	end
	Sleep(2500)
	
	
	--5. Gathering Metals
	--show messages
	WaitTutorialPopup("Tutorial2_Popup4_1_Gathering Metals")
	TutorialNextHint("Tutorial_2_GatheringMetals")
	--wait for transport to be selected
	WaitObjectSelected(transport)
	--show the deposit to the player
	deposit1:SetVisible(true)
	ViewObjectMars(deposit1)
	ShowTutorialArrow(deposit1, "ArrowTutorialBase")
	--wait for the deposit to disappear
	while IsValid(deposit1) do
		Sleep(1000)
	end
	RemoveAllTutorialArrows()
	Sleep(1500)
	
	
	--6. Transport Routes
	--show messages
	WaitTutorialPopup("Tutorial2_Popup5_TransporRoute")
	TutorialNextHint("Tutorial_2_TranportRoutes")
	--wait for player to select the transport
	WaitObjectSelected(transport)
	--find the universal depot
	local universal_depot = table.find_value(UICity.labels.UniversalStorageDepot, "template_name", "UniversalStorageDepot")
	--show start/end positions for transport route
	local arrow
	arrow = ShowTutorialArrow(universal_depot, "ArrowTutorialBase", "ArrowTutorial_02")
	arrow = ShowTutorialArrow("TransportRoute", nil, "ArrowTutorial_03")
	--show the player how to setup the transport route
	WaitInfopanelAction("RCTransport", "ToggleCreateRouteMode")
	WaitResourceItemsChoice("all")
	local arrow_pos = GetMarkerPosition("TransportRoute")
	local route_tolerance = 100*guim
	local route_tolerance_sq = route_tolerance*route_tolerance
	while true do
		local route_dest = transport.transport_route and transport.transport_route.to
		if route_dest and route_dest:Dist2D2(arrow_pos) <= route_tolerance_sq then
			break
		end
		Sleep(50)
	end
	TutorialNextHint("Tutorial_2_TransportRouteDone")
	--wait for any 30 resources to be delivered
	WaitResourcesNearPoint(GetMarkerPosition("TransportRoute"), false, 30*const.ResourceScale, 100*guim, {"RCTransport"})
	RemoveAllTutorialArrows()
	
	
	--7. RC Commander
	--show messages
	WaitTutorialPopup("Tutorial2_Popup6_RCRover")
	TutorialNextHint("Tutorial_2_MoveRCRover")
	--wait for the rover to move to the marker
	local rc_rover = UICity.labels.RCRover[1]
	DisableMaintenance(rc_rover)
	WaitObjectSelected(rc_rover)
	local expand_pos = GetMarkerPosition("TransportRoute"):AddX(20*guim)
	ShowTutorialArrow(expand_pos)
	while rc_rover:GetPos():Dist2D2(expand_pos) > 4*position_tolerance do
		Sleep(1000)
	end
	RemoveAllTutorialArrows()
	
	
	--8. New Expand
	--show messages
	WaitTutorialPopup("Tutorial2_Popup7_SensorTower")
	TutorialNextHint("Tutorial_2_SensorTower")
	--unlock sensor tower & wait for the player to place it
	UnlockBuilding("SensorTower")
	g_Tutorial.BuildMenuWhitelist.SensorTower = true
	WaitBuildMenuItemSelected("Infrastructure", "SensorTower")
	--set construction constraints
	local sensor_tower_target = GetMarkerPosition("TransportRoute"):AddY(55*guim)
	sensor_tower_target = HexGetNearestCenter(sensor_tower_target)
	g_Tutorial.ConstructionTarget = { class = "SensorTower", loc = sensor_tower_target, radius = 5 }
	local ghost = PlaceGhost("SensorTower", sensor_tower_target)
	ViewObjectMars(ghost)
	--wait for sensor tower construction to be placed
	WaitConstructionSite("SensorTower")
	--cleanup construction target
	DoneObject(ghost)
	g_Tutorial.ConstructionTarget = nil
	g_Tutorial.BuildMenuWhitelist.SensorTower = nil
	--unlock stirling generator and wait for the player to place it
	UnlockBuilding("StirlingGenerator")
	g_Tutorial.BuildMenuWhitelist.StirlingGenerator = true
	WaitConstructionSite("StirlingGenerator")
	g_Tutorial.BuildMenuWhitelist.StirlingGenerator = nil
	--unlock power cables
	UnlockBuilding("PowerCables")
	g_Tutorial.BuildMenuWhitelist.PowerCables = true
	--wait for the sensor tower to be built & working
	TutorialNextHint("Tutorial_2_SensorTowerPlaced")
	local new_sensor_tower
	while true do
		local label = UICity.labels.SensorTower
		new_sensor_tower = label and label[1]
		if new_sensor_tower then
			break
		end
		Sleep(1000)
	end
	while not new_sensor_tower.working do
		Sleep(1000)
	end
	g_Tutorial.BuildMenuWhitelist.PowerCables = nil
	
	
	--9. Exploration
	--show messages
	WaitTutorialPopup("Tutorial2_Popup8_GoToOverview")
	TutorialNextHint("Tutorial_2_GoToOverview")
	WaitHUDButtonPressed("idOverview", function(arrow)
		return GetInGameInterfaceMode() == "overview"
	end)
	
	
	--10. Exploration 2
	--show messages
	WaitTutorialPopup("Tutorial2_Popup9_Exploration")
	TutorialNextHint("Tutorial_2_UseProbe")
	--gather some usefull sectors
	local sector_E4 = GetSector("E4")
	local sector_E3 = GetSector("E3")
	--add probe & wait for sector scanned
	g_Tutorial.EnableOrbitalProbes = true
	ShowTutorialArrow(sector_E3.area:Center())
	PlaceObject("OrbitalProbe", { city = UICity })
	local probes_pin_arrow = TutorialUIArrow:new({
		AnchorType = "center-top",
		FindTarget = function(self)
			if GetUIStyleGamepad() then return false end
			local pins_dlg = Dialogs.PinsDlg
			if not pins_dlg then return false end
			for _,win in ipairs(pins_dlg) do
				if not win.Dock and IsKindOf(win.context, "OrbitalProbe") then
					return win
				end
			end
			return false
		end,
	}, terminal.desktop)
	WaitMsg("SectorScanned")
	probes_pin_arrow:delete()
	RemoveAllTutorialArrows()
	--choose the unscanned sector from the two (E4 or E3)
	g_Tutorial.EnableExploration = true
	local target_sector = sector_E3.status == "unexplored" and sector_E3 or sector_E4
	local sector_center = target_sector.area:Center()
	sector_center = sector_center:SetZ(terrain.GetHeight(sector_center))
	g_Tutorial.sector_name = Untranslated(target_sector.display_name)
	--show next hint
	TutorialNextHint("Tutorial_2_QueueScanning")
	--place arrow and anomaly in the middle of the target sector
	ShowTutorialArrow(sector_center)
	local anomaly_marker = PlaceObject("SubsurfaceAnomalyMarker")
	anomaly_marker:SetPos(sector_center:AddY(-45*guim))
	table.insert(target_sector.markers.subsurface, anomaly_marker)
	--wait for sector to be scanned
	while true do
		WaitMsg("SectorScanned")
		if target_sector.status ~= "unexplored" then
			break
		end
	end
	local anomaly = anomaly_marker.placed_obj
	RemoveAllTutorialArrows()
	
	
	--12. Explorer
	--show messages
	WaitTutorialPopup("Tutorial2_Popup11_AnalyzeAnomaly")
	TutorialNextHint("Tutorial_2_AnalyzeAnomaly")
	--wait for anomly to get analyzed
	local explorer = UICity.labels.ExplorerRover[1]
	WaitObjectSelected(explorer)
	--recharge it to 100% instantly
	ShowTutorialArrow(anomaly, "ArrowTutorialBase")
	while explorer.command ~= "Analyze" do
		Sleep(50)
	end
	TutorialNextHint("Tutorial_2_ExplorerOnTheWay")
	while true do
		local _, analyzed_anomaly = WaitMsg("AnomalyAnalyzed")
		if anomaly == analyzed_anomaly then
			break
		end
	end
	RemoveAllTutorialArrows()
	
	
	--13. Anomaly
	--show messages
	WaitTutorialPopup("Tutorial2_Popup12_OpenResearch")
	TutorialNextHint("Tutorial_2_OpenResearch")
	--unlock only techs in the first column (setup for step 13)
	for id,status in pairs(UICity.tech_status) do
		status.discovered = nil
	end
	UICity.discover_idx = 0
	local first_techs = { }
	for i,field in ipairs(Presets.TechFieldPreset.Default) do
		if field.discoverable then
			local tech = UICity:DiscoverTechInField(field.id)
			table.insert(first_techs, tech)
		end
	end
	--unlock research UI & wait for click
	g_Tutorial.EnableResearch = true
	g_Tutorial.EnableResearchWarning = true
	WaitHUDButtonPressed("idResearch", function(arrow)
		return arrow.button_pressed or Dialogs.ResearchDlg
	end)
	
	
	--14. Research
	--show messages
	WaitTutorialPopupImmediate("Tutorial2_Popup13_Research", nil, nil, Dialogs.ResearchDlg)
	TutorialNextHint("Tutorial_2_ResearchScreen")
	--wait for any tech to be queued
	local target_tech = first_techs[3]
	WaitResearchQueued(target_tech, false, "wait_any_tech")
	--show popup and wait for the player to exit research screen
	WaitTutorialPopupImmediate("Tutorial2_Popup13_1_Research2", nil, nil, Dialogs.ResearchDlg)
	local arrow = TutorialUIArrow:new({
		AnchorType = "center-top",
		FindTarget = function(self)
			local dlg = Dialogs.ResearchDlg
			return dlg and dlg.idOverlayDlg.idToolbar.idclose or false
		end,
	}, terminal.desktop)
	while Dialogs.ResearchDlg do
		Sleep(1000)
	end
	
	
	--15. Epilogue
	local choice = WaitTutorialPopup("Tutorial2_Popup14_Epilogue")
	WinTutorial((choice == 1) and "Tutorial3")
end

DefineClass.Tutorial_2_SelectRover = { __parents = { "BaseHint" } }
DefineClass.Tutorial_2_MoveRover = { __parents = { "BaseHint" } }
DefineClass.Tutorial_2_RechargeRover = { __parents = { "BaseHint" } }
DefineClass.Tutorial_2_LoadFuel = { __parents = { "BaseHint" } }
DefineClass.Tutorial_2_UnloadFuel = { __parents = { "BaseHint" } }
DefineClass.Tutorial_2_LaunchRocket = { __parents = { "BaseHint" } }
DefineClass.Tutorial_2_OrphanedDrones = { __parents = { "BaseHint" } }
DefineClass.Tutorial_2_GatheringMetals = { __parents = { "BaseHint" } }
DefineClass.Tutorial_2_TranportRoutes = { __parents = { "BaseHint" } }
DefineClass.Tutorial_2_TransportRouteDone = { __parents = { "BaseHint" } }
DefineClass.Tutorial_2_MoveRCRover = { __parents = { "BaseHint" } }
DefineClass.Tutorial_2_SensorTower = { __parents = { "BaseHint" } }
DefineClass.Tutorial_2_SensorTowerPlaced = { __parents = { "BaseHint" } }
DefineClass.Tutorial_2_GoToOverview = { __parents = { "BaseHint" } }
DefineClass.Tutorial_2_UseProbe = { __parents = { "BaseHint" } }
DefineClass.Tutorial_2_QueueScanning = { __parents = { "BaseHint" } }
function Tutorial_2_QueueScanning:GetSectorName()
	return g_Tutorial and g_Tutorial.sector_name or Untranslated("E3")
end
DefineClass.Tutorial_2_AnalyzeAnomaly = { __parents = { "BaseHint" } }
DefineClass.Tutorial_2_ExplorerOnTheWay = { __parents = { "BaseHint" } }
DefineClass.Tutorial_2_OpenResearch = { __parents = { "BaseHint" } }
DefineClass.Tutorial_2_ResearchScreen = { __parents = { "BaseHint" }, realtime_delay = 1 }
