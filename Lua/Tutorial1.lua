g_TutorialScenarios.Tutorial1 = function()
	-- 0. Initialization
	g_Tutorial.BuildMenuWhitelist = {} -- disable all
	
	local old = IsDepositObstructed
	IsDepositObstructed = empty_func	
	GetSector("F3"):Scan("scanned")
	IsDepositObstructed = old	

	-- 1. Opening Message
	WaitTutorialPopup("Tutorial1_Popup1_Intro")
	
	-- 2. Hint Introduction
	TutorialNextHint("Tutorial_1_HintIntro")
	
	-- add arrow pointing toward hint's close btn
	local arrow = TutorialUIArrow:new({
		AnchorType = "right-center",
		FindTarget = function() return Dialogs.OnScreenHintDlg and Dialogs.OnScreenHintDlg.idClose end,
	}, terminal.desktop)
	--[[local xarrow = TutorialUIArrow:new({
		AnchorType = "center-bottom",
		FindTarget = function() return GetUIStyleGamepad() and Dialogs.OnScreenHintDlg end,
	}, terminal.desktop)--]]
		
	-- wait for the hint to get closed
	while g_ActiveHints and g_ActiveHints.Tutorial_1_HintIntro and not g_ActiveHints.Tutorial_1_HintIntro.disabled do
		Sleep(20)
	end
	arrow:delete()
	--xarrow:delete()
	
	-- 3. Zoom In / Camera Controls
	WaitTutorialPopup("Tutorial1_Popup2_ZoomAndCamera")
	
	-- wait player to zoom down
	if GetInGameInterfaceMode() == "overview" then
		TutorialNextHint("Tutorial_1_ZoomIn")
		while GetInGameInterfaceMode() == "overview" do
			Sleep(100)
		end
	end
	
	TutorialNextHint("Tutorial_1_HintCameraControls")
	
	-- give the user some time to scroll (Boyan: tweak duration)
	Sleep(12000)

	-- 4. Land Rocket
	-- create initial rocket with cargo
	PlaceBuilding("SupplyRocket", {city = UICity})
	WaitOneMsGameTime()
	local cargo = {
			{class = "Polymers",       		amount = 5},
			{class = "Electronics",     		amount = 5},
			{class = "MachineParts",   		amount = 10},
			{class = "DroneHub",				amount = 1,},
			{class = "MoistureVaporator",  	amount = 1,},
			{class = "StirlingGenerator",	amount = 1,},
			{class = "FuelFactory",			amount = 1,},
			{class = "Drone",					amount = 8,},
	}

	UICity.labels.AllRockets[1].launch_fuel = 5*const.ResourceScale
	UICity.labels.AllRockets[1].can_demolish = false -- just in case
	UICity.labels.AllRockets[1]:SetCommand("FlyToMars", cargo, 0, nil, true)

	-- show hint
	WaitTutorialPopup("Tutorial1_Popup3_LandRocket")
	TutorialNextHint("Tutorial_1_LandRocket_1")

	-- point the user toward the rocket pin and wait them to click it
	arrow = TutorialUIArrow:new({
		AnchorType = "center-top",
		FindTarget = function() 
			if Dialogs.PinsDlg then 
				for _, win in ipairs(Dialogs.PinsDlg) do
					if IsKindOf(win, "XBlinkingButton") and IsKindOf(win.context, "SupplyRocket") then
						return win
					end
				end
			end
		end,
	}, terminal.desktop)
	g_Tutorial.ConstructionTarget = { 
		class = "RocketLandingSite", 
		loc = g_Tutorial.MapMarkers.RocketLanding, 
		spot = "Rocket",
		strict = true,
		radius = 2, 
	}
	
	local targeted = false
	while GetInGameInterfaceMode() ~= "construction" do
		local dlg = GetInGameInterfaceModeDlg()
		targeted = false
		if dlg and dlg.mode_name == "overview" then
			dlg.exit_to = g_Tutorial.MapMarkers.RocketLanding:GetPos()
			targeted = true
		end
		Sleep(50)
	end
	arrow:delete()
	
	local ghost = PlaceGhost("Rocket", g_Tutorial.MapMarkers.RocketLanding:GetPos(), false, "align")
	
	if not targeted then
		ViewObjectMars(ghost)
	end
	
	if GetUIStyleGamepad() then
		CityConstruction[UICity]:UpdateCursor(g_Tutorial.MapMarkers.RocketLanding:GetPos())
	end

	TutorialNextHint("Tutorial_1_LandRocket_2")

	-- wait the rocket to begin landing
	local rocket = UICity.labels.AllRockets[1]
	while rocket.command == "WaitInOrbit" or rocket.command == "FlyToMars" do
		Sleep(100)
	end
	-- kill the ghost
	DoneObject(ghost)
	-- cleanup construction target
	g_Tutorial.ConstructionTarget = nil
	
	-- wait the landing/unload process to finish
	while UICity.labels.AllRockets[1].command ~= "Refuel" do
		Sleep(100)
	end
	
	Sleep(8000) -- waiting for drones to get out
	
	
	-- 5. Drones & Resources
	WaitTutorialPopup("Tutorial1_Popup4_DronesAndResources")
	TutorialNextHint("Tutorial_1_DronesNResources_1")	
	g_Tutorial.BuildMenuWhitelist.StorageMetals = true
	arrow = TutorialUIArrow:new({
		AnchorType = "center-top",
		FindTarget = function(self) 
			if GetInGameInterfaceMode() ~= "construction" or CityConstruction[UICity].template ~= "StorageMetals" then
				return FindBuildMenuItem("StorageMetals", "Storages", "Depots")
			end
		end,
	}, terminal.desktop)
	while GetInGameInterfaceMode() ~= "construction" or CityConstruction[UICity].template ~= "StorageMetals" do
		Sleep(50)
	end	
	TutorialNextHint("Tutorial_1_DronesNResources_2")
	WaitConstruction("StorageMetals")
	arrow:delete()
	
	-- 6. Speed Control Hint
	TutorialNextHint("Tutorial_1_SpeedControl")
	-- arrow on speed control
	arrow = TutorialUIArrow:new({
		AnchorType = "center-top",
		FindTarget = function(self) 
			return Dialogs.HUD and Dialogs.HUD.idMedium
		end,
	}, terminal.desktop)
	
	-- wait the depot to have a few metals (cycle through the whole label in case the user built more depots)
	local stored = 0
	while stored < 5*const.ResourceScale do
		local stores = UICity.labels.StorageMetals or empty_table
		stored = 0
		for _, depot in ipairs(stores) do
			stored = stored + depot:GetStoredAmount()
		end
		if arrow and GetTimeFactor() > const.DefaultTimeFactor then
			arrow:delete()
			arrow = false
		end
		Sleep(100)
	end
	if arrow then 
		arrow:delete()
	end
	
	
	-- 7. Unload Rocket
	WaitTutorialPopup("Tutorial1_Popup5_UnloadRocket")
	TutorialNextHint("Tutorial_1_UniversalStorage")
	
	g_Tutorial.BuildMenuWhitelist.UniversalStorageDepot = true
	WaitBuildMenuItemSelected("Storages", "UniversalStorageDepot", "place-instant")
	
	Sleep(1500) --a bit of a delay for smoother transition to the next message
	
	-- 8. Concrete Extractor
	WaitTutorialPopup("Tutorial1_Popup6_ConcreteExtractor")
	TutorialNextHint("Tutorial_1_ConcreteExtractor_1")
	
	g_Tutorial.BuildMenuWhitelist.RegolithExtractor = true
	WaitBuildMenuItemSelected("Production", "RegolithExtractor")
	TutorialNextHint("Tutorial_1_ConcreteExtractor_2")
	arrow = TutorialUIArrow:new({
		AnchorType = "left-center",
		FindTarget = function(self) 
			return Dialogs.Infopanel and IsKindOf(Dialogs.Infopanel.context, "ConstructionController") and Dialogs.Infopanel.idControlHints
		end,
	}, terminal.desktop)	
	ghost = PlaceGhost("RegolithExtractor", g_Tutorial.MapMarkers.ConcreteExtractor:GetPos(), g_Tutorial.MapMarkers.ConcreteExtractor:GetAngle(), "align")
	
		-- attach tiles
	local shape = GetEntityOutlineShape("RegolithExtractor")
	for i = 1, #shape do
		local q, r = shape[i]:xy()
		local x, y = HexToWorld(q, r)
		local offset = point(x, y, 30)
		local tile = PlaceObject("GridTile", nil, const.cfComponentAttach)
		ghost:Attach(tile)
		tile:SetAttachOffset(offset)
		tile:SetColorModifier(ShadingConst.ConstructionStage2Color)
		tile:SetOpacity(20)
	end
	
	g_Tutorial.ConstructionTarget = { class = "RegolithExtractor", loc = g_Tutorial.MapMarkers.ConcreteExtractor, radius = 5 }
	ViewObjectMars(g_Tutorial.MapMarkers.ConcreteExtractor)
	WaitConstructionSite("RegolithExtractor")
	arrow:delete()
	DoneObject(ghost)
	g_Tutorial.ConstructionTarget =  nil	
	TutorialNextHint("Tutorial_1_ConcreteExtractor_3")
	WaitConstruction("RegolithExtractor")
	
	Sleep(1500) -- Boyan said so
	
	-- 9. Deleted (was not needed)
		
	-- 10. Power
	WaitTutorialPopup("Tutorial1_Popup8_Power")
	TutorialNextHint("Tutorial_1_Power_1")
	
	g_Tutorial.BuildMenuWhitelist.StirlingGenerator = true
	WaitBuildMenuItemSelected("Power", "StirlingGenerator", "place")
	WaitConstruction("StirlingGenerator")
	g_Tutorial.BuildMenuWhitelist.PowerCables = true

	local mines = UICity.labels.RegolithExtractor or empty_table
	local gens = UICity.labels.StirlingGenerator or empty_table
	if not (#mines > 0 and #gens > 0 and mines[1].electricity.grid == gens[1].electricity.grid) then
		TutorialNextHint("Tutorial_1_Power_2")
		WaitBuildMenuItemSelected("Power", "PowerCables", "electricity_grid")
	
		while true do
			local mines = UICity.labels.RegolithExtractor or empty_table
			local gens = UICity.labels.StirlingGenerator or empty_table
			if #mines > 0 and #gens > 0 and mines[1].electricity.grid == gens[1].electricity.grid then
				break
			end
			Sleep(100)
		end
	end
	-- Boyan: test
	
	Sleep(2000) -- Boyan
	
	-- 11. Waste Rock & Concrete Depot
	WaitTutorialPopup("Tutorial1_Popup9_WasteRockConcreteDepot")
	TutorialNextHint("Tutorial_1_WasteRockConcrete")
	g_Tutorial.BuildMenuWhitelist.StorageConcrete = true
	WaitBuildMenuStorageSelected("StorageConcrete")
	WaitConstruction("StorageConcrete")
	
	g_Tutorial.BuildMenuWhitelist.WasteRockDumpBig = true	
	WaitBuildMenuItemSelected("Storages", "WasteRockDumpBig", "place-instant")
	
	Sleep(1500) --transition
	
	-- 12. Drones & Drone Hubs
	WaitTutorialPopup("Tutorial1_Popup10_DronesAndDroneHubs")  -- Boyan: explain range
	TutorialNextHint("Tutorial_1_DroneHub")
	g_Tutorial.BuildMenuWhitelist.DroneHub = true
	WaitBuildMenuItemSelected("Infrastructure", "DroneHub", "place")
	WaitConstruction("DroneHub")
	-- wait to be powered
	while not HasPoweredBuilding("DroneHub") do
		Sleep(50)
	end
	
	Sleep(1500) --transition
	
	-- 13. Drone Batteries
	WaitTutorialPopup("Tutorial1_Popup11_DroneBatteries")
	TutorialNextHint("Tutorial_1_RechargeStation")
	g_Tutorial.BuildMenuWhitelist.RechargeStation = true
	WaitBuildMenuItemSelected("Infrastructure", "RechargeStation", "place")
	WaitConstruction("RechargeStation")
	while not HasPoweredBuilding("RechargeStation") do
		Sleep(50)
	end
	
	Sleep(1500) --transition
	
	-- 14. Refueling the Rocket
	WaitTutorialPopup("Tutorial1_Popup12_RefuelingRocket")
	TutorialNextHint("Tutorial_1_RefuelingRocket") -- Boyan: out of power, mine more power
	
	-- 15. Fuel Refinery
	g_Tutorial.BuildMenuWhitelist.MoistureVaporator = true
	WaitBuildMenuItemSelected("Life-Support", "MoistureVaporator", "place")
	g_Tutorial.BuildMenuWhitelist.FuelFactory = true
	WaitBuildMenuItemSelected("Production", "FuelFactory", "place")
	-- Boyan: extra popup because out of power
	
	-- wait these to be built and connected so the colony runs out of power
	while true do
		local gen = UICity.labels.StirlingGenerator or empty_table
		local vap = UICity.labels.MoistureVaporator or empty_table
		local ref = UICity.labels.FuelFactory or empty_table
		if #gen > 0 and #vap > 0 and #ref > 0 and 
			gen[1].electricity.grid == vap[1].electricity.grid and
			gen[1].electricity.grid == ref[1].electricity.grid
		then
			break
		end
		Sleep(100)
	end
	
	UICity:AddPrefabs("StirlingGenerator", 1)
	WaitTutorialPopup("Tutorial1_Popup12_RefuelingRocket_1")
	TutorialNextHint("Tutorial_1_RefuelingRocket_1")
	
	-- wait until ALL buildings are powered (some won't be working at this point)
	while true do
		local powered = true
		for _, bld in ipairs(UICity.labels.Building) do
			if IsKindOf(bld, "ElectricityConsumer") then
				powered = powered and bld:HasPower()
			end
		end
		if powered then break end
		Sleep(100)
	end
	
	--while not HasPoweredBuilding("MoistureVaporator") or not HasPoweredBuilding("FuelFactory") do
--		Sleep(50)
	--end
		
	-- 16. Pipes
	WaitTutorialPopup("Tutorial1_Popup13_Pipes")
	TutorialNextHint("Tutorial_1_Pipes")
	g_Tutorial.BuildMenuWhitelist.Pipes = true
	WaitBuildMenuItemSelected("Life-Support", "Pipes", "life_support_grid")
	
	while true do
		local prod = UICity.labels.MoistureVaporator or empty_table
		local cons = UICity.labels.FuelFactory or empty_table
		if #prod > 0 and #cons > 0 and prod[1].water.grid == cons[1].water.grid then
			break
		end
		Sleep(100)
	end
	
	-- 17. Fuel
	WaitTutorialPopup("Tutorial1_Popup14_Fuel")
	TutorialNextHint("Tutorial_1_Fuel")
	
	-- 18. Epilogue
	-- wait the rocket to launch
	while UICity.labels.AllRockets[1].command ~= "WaitLaunchOrder" do
		Sleep(100)
	end
	
	TutorialNextHint("Tutorial_1_FireRocket")
	
	-- arrow to Launch button
	arrow = TutorialUIArrow:new({
		AnchorType = "left-center",
		FindTarget = function() 
			if Dialogs.Infopanel and Dialogs.Infopanel:HasMember("idLaunch") then
				return Dialogs.Infopanel.idLaunch
			end
		end,
	}, terminal.desktop)
	while UICity.labels.AllRockets[1].command == "WaitLaunchOrder" do
		Sleep(100)
	end
	arrow:delete()
	HintDisable("Tutorial_1_FireRocket")
	
	while UICity.labels.AllRockets[1].command ~= "Takeoff" do
		Sleep(100)
	end
	
	Sleep(12000) -- Boyan: tweak duration
		
	local choice = WaitTutorialPopup("Tutorial1_Popup15_Epilogue")
	WinTutorial(choice == 1 and "Tutorial2")
end

DefineClass.Tutorial_1_HintIntro = { __parents = { "BaseHint" }, }
DefineClass.Tutorial_1_ZoomIn = { __parents = { "BaseHint" }, }
DefineClass.Tutorial_1_HintCameraControls = { __parents = { "BaseHint" }, }
DefineClass.Tutorial_1_LandRocket_1 = { __parents = { "BaseHint" }, }
DefineClass.Tutorial_1_LandRocket_2 = { __parents = { "BaseHint" }, }
DefineClass.Tutorial_1_DronesNResources_1 = { __parents = { "BaseHint" }, }
DefineClass.Tutorial_1_DronesNResources_2 = { __parents = { "BaseHint" }, }
DefineClass.Tutorial_1_SpeedControl = { __parents = { "BaseHint" }, }
DefineClass.Tutorial_1_ConcreteExtractor_1 = { __parents = { "BaseHint" }, }
DefineClass.Tutorial_1_ConcreteExtractor_2 = { __parents = { "BaseHint" }, }
DefineClass.Tutorial_1_ConcreteExtractor_3 = { __parents = { "BaseHint" }, }
DefineClass.Tutorial_1_Power_1 = { __parents = { "BaseHint" }, }
DefineClass.Tutorial_1_Power_2 = { __parents = { "BaseHint" }, }
DefineClass.Tutorial_1_WasteRockConcrete = { __parents = { "BaseHint" }, }
DefineClass.Tutorial_1_DroneHub = { __parents = { "BaseHint" }, }
DefineClass.Tutorial_1_RechargeStation = { __parents = { "BaseHint" }, }
DefineClass.Tutorial_1_RefuelingRocket = { __parents = { "BaseHint" }, }
DefineClass.Tutorial_1_Pipes = { __parents = { "BaseHint" }, }
DefineClass.Tutorial_1_Fuel = { __parents = { "BaseHint" }, }
DefineClass.Tutorial_1_FireRocket = { __parents = { "BaseHint" }, }
DefineClass.Tutorial_1_UniversalStorage = { __parents = { "BaseHint" }, }
DefineClass.Tutorial_1_RefuelingRocket_1 = { __parents = { "BaseHint" }, }

function TFormat.OpenBuildMenuTutorialHint1(context_obj)
	if g_RightClickOpensBuildMenu then
		return T{11007, --[[Open build menu tutorial hint (right click)]] "Open the <em>Build Menu</em> using <right_click>"}
	else
		return T{11008, --[[Open build menu tutorial hint (no right click)]] "Open the <em>Build Menu</em> using <left_click> on the HUD button"}
	end
end

function TFormat.OpenBuildMenuTutorialHint2(context_obj)
	if g_RightClickOpensBuildMenu then
		return T{11009, --[[Universal storage tutorial hint (right click)]] "Open the Build Menu using <right_click> and select the <em>Universal Depot</em> by following the arrows"}
	else
		return T{11010, --[[Universal storage tutorial hint (no right click)]] "Open the Build Menu using <left_click> on the HUD button and select the <em>Universal Depot</em> by following the arrows"}
	end
end

function TFormat.OpenBuildMenuTutorialHint3(context_obj)
	if g_RightClickOpensBuildMenu then
		return T{11011, --[[Concrete extractor tutorial hint (right click)]] "Open the Build Menu using <right_click> and select a <em>Concrete Extractor</em> from the Production category."}
	else
		return T{11012, --[[Concrete extractor tutorial hint (no right click)]] "Open the Build Menu using <left_click> on the HUD button and select a <em>Concrete Extractor</em> from the Production category."}
	end
end
