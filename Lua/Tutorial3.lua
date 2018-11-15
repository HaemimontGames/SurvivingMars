g_TutorialScenarios.Tutorial3 = function()
	-- 0. Initialization
	g_Tutorial.BuildMenuWhitelist = {}
	g_Tutorial.RoverGatherResourceWorkTime = g_Consts.RCTransportGatherResourceWorkTime / 2
	UICity:ChangeFunding(5000*1000*1000)
	local markers = g_Tutorial.MapMarkers
	
	local old = IsDepositObstructed
	IsDepositObstructed = empty_func	
	GetSector("C1"):Scan("scanned")
	GetSector("D1"):Scan("scanned")
	IsDepositObstructed = old	
	
	local hub = UICity.labels.DroneHub and UICity.labels.DroneHub[1]
	local mine = UICity.labels.RegolithExtractor and UICity.labels.RegolithExtractor[1]
	local arrow, obj_arrow
	
	for _, panel in ipairs(UICity.labels.SolarPanel or empty_table) do
		DestroyBuildingImmediate(panel, false, "dont_notify")
	end
	
	-- store cables to be deleted in a far away step
	local cables_to_delete = MapGet("map","ElectricityGridElement", function(o) return o.electricity.grid == mine.electricity.grid end )
	-- 1. Intro Popup
	WaitTutorialPopup("Tutorial3_Popup1_Intro")
	ViewObjectMars(UICity.labels.DroneHub[1])
	Sleep(4000)
	
	-- 2. Salvage Concrete Extractor
	ViewObjectMars(UICity.labels.RegolithExtractor[1])
	WaitTutorialPopup("Tutorial3_Popup2_SalvageBuilding")
	TutorialNextHint("Tutorial_3_SalvageBuildings")
	
	ViewObjectMars(mine)
	arrow = TutorialUIArrow:new({
		AnchorType = "center-top",
		FindTarget = function() return not mine.demolishing and not mine.destroyed and Dialogs.Infopanel and Dialogs.Infopanel.context == mine and Dialogs.Infopanel.idSalvage end,
	}, terminal.desktop)
	obj_arrow = ShowTutorialArrow(mine, "ArrowTutorialBase")
	while IsValid(mine) and not mine.destroyed do
		if SelectedObj ~= mine and not mine.demolishing then
			obj_arrow:SetEnumFlags(const.efVisible)
		elseif SelectedObj == mine then
			obj_arrow:ClearEnumFlags(const.efVisible)
		end
		Sleep(100)
	end
	DoneObject(obj_arrow)
	arrow:delete()
	
	Sleep(1500)
	
	-- 3. Power Drone Hub
	WaitTutorialPopup("Tutorial3_Popup3_PowerDroneHub")
	TutorialNextHint("Tutorial_3_PowerDroneHub")
	g_Tutorial.BuildMenuWhitelist.SolarPanelBig = true
	local ghost = PlaceGhost("SolarPanelBig", markers.SolarPanel:GetPos() + point(500, -916))
	g_Tutorial.ConstructionTarget = { class = "SolarPanelBig", loc = markers.SolarPanel, radius = 2 }
	ViewObjectMars(ghost)
	WaitBuildMenuItemSelected("Power", "SolarPanelBig", "place")
	g_Tutorial.ConstructionTarget = nil
	DoneObject(ghost)
	WaitConstruction("SolarPanelBig")
	
	Sleep(1500)
		
	-- 4. Priority
	WaitTutorialPopup("Tutorial3_Popup4_Priority")
	TutorialNextHint("Tutorial_3_HighPriority")
	arrow = TutorialUIArrow:new({
		AnchorType = "center-top",
		FindTarget = function() return Dialogs.Infopanel and IsKindOf(Dialogs.Infopanel.context, "DroneHub") and Dialogs.Infopanel.idPriority end,
	}, terminal.desktop)	

	obj_arrow = ShowTutorialArrow(hub, "ArrowTutorialBase")
	while IsValid(hub) and hub.priority < const.MaxBuildingPriority do
		if SelectedObj ~= hub then
			obj_arrow:SetEnumFlags(const.efVisible)
		else
			obj_arrow:ClearEnumFlags(const.efVisible)
		end
		Sleep(100)
	end
	arrow:delete()
	DoneObject(obj_arrow)
	
	Sleep(1500)
	
	-- 5. Wind Turbine
	WaitTutorialPopup("Tutorial3_Popup5_WindTurbine")
	TutorialNextHint("Tutorial_3_WindTurbine")
	g_Tutorial.BuildMenuWhitelist.WindTurbine = true
	local ghost = PlaceGhost("WindTurbine", markers.WindTurbine:GetPos())-- + point(500, -916))
	g_Tutorial.ConstructionTarget = { class = "WindTurbine", loc = markers.WindTurbine, radius = 0 }
	ViewObjectMars(ghost)
	WaitBuildMenuItemSelected("Power", "WindTurbine", "place")
	g_Tutorial.ConstructionTarget = nil
	DoneObject(ghost)
	WaitConstruction("WindTurbine")
	
	Sleep(1500)
	
	-- 6. Night / Shifts
	WaitTutorialPopup("Tutorial3_Popup6_NightShifts")
	TutorialNextHint("Tutorial_3_NightShifts")
	local blds = { "MoistureVaporator", "FuelFactory" }
	for _, bld_class in ipairs(blds) do
		local bld = UICity.labels[bld_class] and UICity.labels[bld_class][1]
		ViewObjectMars(bld)
		obj_arrow = ShowTutorialArrow(bld, "ArrowTutorialBase")

		arrow = TutorialUIArrow:new({
			AnchorType = "left-center",
			FindTarget = function() return Dialogs.Infopanel and Dialogs.Infopanel.context == bld and Dialogs.Infopanel.idWorkshift3 end,
		}, terminal.desktop)
		
		while IsValid(bld) and not bld:IsClosedShift(3) do
			if SelectedObj ~= bld then
				obj_arrow:SetEnumFlags(const.efVisible)
			else
				obj_arrow:ClearEnumFlags(const.efVisible)
			end
			Sleep(100)
		end
		arrow:delete()
		DoneObject(obj_arrow)
	end
	
	-- 7. Maintenace / Not Enough Resources
	WaitTutorialPopup("Tutorial3_Popup7_Maintenance")
	TutorialNextHint("Tutorial_3_Maintenance")
	
	local panels = UICity.labels.SolarPanelBig
	local panel
	for _, obj in ipairs(panels) do
		if obj.working then
			panel = obj
			break
		end
	end
	
	-- add maintenance
	ViewObjectMars(panel)

	obj_arrow = ShowTutorialArrow(panel, "ArrowTutorialBase")
	while SelectedObj ~= panel do
		Sleep(100)
	end
	DoneObject(obj_arrow)
	arrow = TutorialUIArrow:new({
		AnchorType = "left-center",
		FindTarget = function() return Dialogs.Infopanel and SelectedObj == panel and Dialogs.Infopanel.idSectionMaintenance end,
	}, terminal.desktop)		
	
	panel:CheatAddMaintenancePnts()
	Sleep(12000)
	arrow:delete()
	
	-- 8. Get More Metal
	WaitTutorialPopup("Tutorial3_Popup8_MoreMetals")
	TutorialNextHint("Tutorial_3_MoreMetals")
	local selected_once = false
	
	arrow = TutorialUIArrow:new({
		AnchorType = "center-top",
		FindTarget = function() 
			if Dialogs.PinsDlg then 
				for _, win in ipairs(Dialogs.PinsDlg) do
					if not selected_once and IsKindOf(win, "XBlinkingButton") and IsKindOf(win.context, "RCTransport") then
						return win
					end
				end
			end
		end,
	}, terminal.desktop)
	
	local a1 = ShowTutorialArrow("MetalDeposit")
	a1:ChangeEntity("ArrowTutorial_02")
	local a2 
	if #UICity.labels.StorageMetals > 0 then
		a2 = ShowTutorialArrow(UICity.labels.StorageMetals[1])
		a2:ChangeEntity("ArrowTutorial_03")
	end
	
	while true do
		local depots = UICity.labels.StorageMetals or empty_table
		local amount = 0
		for _, depot in ipairs(depots) do
			if IsBuildingInRange(depot, hub, hub.work_radius) then
				amount = amount + depot:GetStoredAmount()
			end
		end
		if amount >= 10*const.ResourceScale then
			break
		end
		if not selected_once and IsKindOf(SelectedObj, "RCTransport") then
			selected_once = true
			ViewObjectMars(markers.MetalDeposit)
		end
		Sleep(100)
	end
	arrow:delete()
	DoneObject(a1)
	if IsValid(a2) then
		DoneObject(a2)
	end
	
	-- 9. Advanced Resources	
	WaitTutorialPopup("Tutorial3_Popup9_AdvancedResources")
	TutorialNextHint("Tutorial_3_OpenResupplyUI")
	g_Tutorial.EnableResupply = true
	g_Tutorial.EnableCargoRockets = true
	
	PlaceBuilding("SupplyRocket", {city = UICity, custom_travel_time_earth = 6*const.HourDuration, custom_travel_time_mars = 6*const.HourDuration})
	WaitOneMsGameTime()
	
	local resup_arrow = TutorialUIArrow:new({	
		AnchorType = "center-top", 
		FindTarget = function() 
			if Dialogs.Resupply then return end
			if GetUIStyleGamepad() then
				local dlg = GetDialog("GamepadIGMenu")					
				return dlg and dlg.items and table.find_value(dlg.items, "name", "idResupply") or false
			end
			return Dialogs.HUD and Dialogs.HUD.idResupply 
		end,
	}, terminal.desktop)

	local resources = { "Polymers", "MachineParts", "Electronics" }
	
	local function cargo_loaded(res)
		local idx = table.find(g_RocketCargo, "class", res)
		return idx and g_RocketCargo[idx].amount >= 20
	end
	
	local resource_arrow = TutorialUIArrow:new({	
		AnchorType = "left-center", 
		FindTarget = function() 
			if not Dialogs.Resupply then 
				return false 
			end
			if UICity.funding < 2000*1000*1000 then
				UICity:ChangeFunding(2000*1000*1000)
				ObjModified(Dialogs.Resupply.context)
			end
			if Dialogs.Resupply.Mode == "categories" then
				return Dialogs.Resupply.idTemplate.idCategories.idList.idCargo
			elseif Dialogs.Resupply.Mode == "cargo" then
				for i, res in ipairs(resources) do
					if not cargo_loaded(res) then 
						for _, win in ipairs(Dialogs.Resupply.idTemplate.idPayload.idList) do
							if win.prop_meta.id == res then
								return win
							end
						end
					end
				end
			end
		end,
	}, terminal.desktop)

	g_Tutorial.SuppressResupplyLaunch = true
	local launch_arrow = TutorialUIArrow:new({	
		AnchorType = "center-top", 
		FindTarget = function()
			if not Dialogs.Resupply or Dialogs.Resupply.Mode ~= "cargo" or g_Tutorial.SuppressResupplyLaunch then 
				return false
			end
			return Dialogs.Resupply.idTemplate.idPayload.idToolBar.idlaunch
		end,
	}, terminal.desktop)	

	while UICity.labels.AllRockets[1].command ~= "FlyToMars" do
		local loaded = true
		for _, res in ipairs(resources) do
			loaded = loaded and cargo_loaded(res)
		end
		local suppress = not loaded
		local dlg = GetDialog("Resupply")
		if dlg and suppress ~= g_Tutorial.SuppressResupplyLaunch then
			g_Tutorial.SuppressResupplyLaunch = suppress
			ObjModified(dlg.context)
		end
		
		if dlg and g_Tutorial.LastHint ~= "Tutorial_3_OrderAdvancedResources" then
			TutorialNextHint("Tutorial_3_OrderAdvancedResources")
		end
		
		Sleep(100)
	end
	resup_arrow:delete()
	launch_arrow:delete()
	resource_arrow:delete()
	
	Sleep(2500)
	
	-- 10. Clearing Concrete Extractor
	WaitTutorialPopup("Tutorial3_Popup10_ClearingBuildings")
	TutorialNextHint("Tutorial_3_ClearingBuildings")
	ViewObjectMars(mine)
	UICity:SetTechResearched("DecommissionProtocol")
	
	-- guide player to select building & use clear action
	arrow = TutorialUIArrow:new({
		AnchorType = "center-top",
		FindTarget = function() return IsValid(mine) and Dialogs.Infopanel and Dialogs.Infopanel.context == mine and Dialogs.Infopanel.idDecommission end,
	}, terminal.desktop)
	obj_arrow = ShowTutorialArrow(mine, "ArrowTutorialBase")
	while IsValid(mine) do
		if SelectedObj ~= mine and not mine.bulldozed then
			obj_arrow:SetEnumFlags(const.efVisible)
		else 
			obj_arrow:ClearEnumFlags(const.efVisible)
		end
		Sleep(100)
	end
	DoneObject(obj_arrow)
	arrow:delete()
	
	Sleep(1500)
	
	-- 11. Delete cables
	WaitTutorialPopup("Tutorial3_Popup11_DeletingCables")
	TutorialNextHint("Tutorial_3_DeletingCables")

	obj_arrow = PlaceObject("ArrowTutorial")
	obj_arrow:SetPos(markers.PowerCable:GetPos())

	g_Tutorial.BuildMenuWhitelist.Salvage = true
	WaitBuildMenuItemSelected("Infrastructure", "Salvage", "demolish")
	while #cables_to_delete > 0 do
		Sleep(100)
		for i = #cables_to_delete, 1, -1 do
			if not IsValid(cables_to_delete[i]) then
				table.remove(cables_to_delete, i)
			end
		end
	end
	DoneObject(obj_arrow)
	
	Sleep(1500)
	if UICity.labels.AllRockets[1].command ~= "Refuel" then
		TutorialNextHint("Tutorial_3_WaitRocket")
		while UICity.labels.AllRockets[1].command == "FlyToMars" do
			Sleep(100)
		end
		-- create an arrow to the rocket's pin
		arrow = TutorialUIArrow:new({
			AnchorType = "center-top",
			FindTarget = function() 
				if Dialogs.PinsDlg then 
					for _, win in ipairs(Dialogs.PinsDlg) do
						if IsKindOf(win, "XBlinkingButton") and IsKindOf(win.context, "SupplyRocket") and win.context.command == "WaitInOrbit" then
							return win
						end
					end
				end
			end,
		}, terminal.desktop)
		-- wait until the landing has started
		while UICity.labels.AllRockets[1].command == "WaitInOrbit" do
			Sleep(100)
		end
		arrow:delete()
		
		while UICity.labels.AllRockets[1].command ~= "Refuel" do
			Sleep(200)
		end
	end
	
	-- 12. Battery
	WaitTutorialPopup("Tutorial3_Popup12_Battery")
	TutorialNextHint("Tutorial_3_Battery")
	g_Tutorial.BuildMenuWhitelist.Battery_WaterFuelCell = true
	g_Tutorial.BuildMenuWhitelist.PowerCables = true
	WaitBuildMenuItemSelected("Power", "Battery_WaterFuelCell", "place")
	WaitConstruction("Battery_WaterFuelCell")
	-- wait the battery to be connected
	while true do
		local connected = false
		for _, obj in ipairs(UICity.labels.Battery_WaterFuelCell or empty_table) do
			if not obj:ShouldShowNotConnectedToPowerGridSign() then
				connected = true			
			end
		end
		if connected then
			break
		end
	end
	Sleep(1500)
	
	-- 13. Water Extractor
	WaitTutorialPopup("Tutorial3_Popup13_WaterExtractor")
	TutorialNextHint("Tutorial_3_WaterExtractor")
	
	g_Tutorial.BuildMenuWhitelist.WaterExtractor = true
	g_Tutorial.BuildMenuWhitelist.Pipes = true
	
	ghost = PlaceGhost("WaterExtractor", markers.WaterExtractor:GetPos() + point(-485, 119))
	g_Tutorial.ConstructionTarget = { class = "WaterExtractor", loc = markers.WaterExtractor, radius = 3 }
	ViewObjectMars(ghost)
	WaitBuildMenuItemSelected("Life-Support", "WaterExtractor", "place")
	g_Tutorial.ConstructionTarget = nil
	DoneObject(ghost)
	-- wait to be ready & powered
	while not HasPoweredBuilding("WaterExtractor") do
		Sleep(50)
	end
	
	-- add wait to be connected as well?
	
	Sleep(1500)
	
	-- 14. Water Tower
	WaitTutorialPopup("Tutorial3_Popup14_WaterTower")
	TutorialNextHint("Tutorial_3_WaterTank")
	
	g_Tutorial.BuildMenuWhitelist.WaterTank = true

	g_Tutorial.ConstructionTarget = { class = "WaterTank" }
	WaitBuildMenuItemSelected("Life-Support", "WaterTank", "place")
	g_Tutorial.ConstructionTarget = nil
	WaitConstruction("WaterTank")
	
	-- wait the tower to be connected to an extractor
	while true do
		local connected = false
		for _, tank in ipairs(UICity.labels.WaterTank or empty_table) do
			for _, bld in ipairs(UICity.labels.WaterExtractor or empty_table) do
				if tank.water.grid == bld.water.grid then
					connected = true
					break
				end
			end
			if connected then break end
		end
		if connected then
			break
		end
		Sleep(100)
	end
	Sleep(1500)

	-- 15. Build a dome
	WaitTutorialPopup("Tutorial3_Popup15_Dome")
	TutorialNextHint("Tutorial_3_Dome")
	
	PlaceBuilding("SupplyRocket", {city = UICity, custom_travel_time_earth = 6*const.HourDuration, custom_travel_time_mars = 6*const.HourDuration})
	
	g_Tutorial.BuildMenuWhitelist.DomeBasic = true
	
	ghost = PlaceGhost("DomeBasicConstruction", markers.DomeLocation:GetPos() + point(145, 378))
	g_Tutorial.ConstructionTarget = { class = "DomeBasic", loc = markers.DomeLocation, radius = 10 }
	ViewObjectMars(ghost)
	WaitBuildMenuItemSelected("Domes", "DomeBasic", "place")
	g_Tutorial.ConstructionTarget = nil
	DoneObject(ghost)
	WaitConstruction("DomeBasic")	
	Sleep(1500)
	
	-- 16. Dome Water, Power & Air
	WaitTutorialPopup("Tutorial3_Popup16_DomeSupply")
	TutorialNextHint("Tutorial_3_DomeSupply")
	
	g_Tutorial.BuildMenuWhitelist.MOXIE = true
	g_Tutorial.ConstructionTarget = { class = "MOXIE" }
	WaitBuildMenuItemSelected("Life-Support", "MOXIE", "place")
	g_Tutorial.ConstructionTarget = nil
	
	while true do
		local working = false
		for _, dome in ipairs(UICity.labels.Dome or empty_table) do
			working = working or dome.working
		end
		if working then break end
		Sleep(100)
	end
	Sleep(1500)
	
	-- 17. Epilogue
	local choice = WaitTutorialPopup("Tutorial3_Popup17_Epilogue")
	WinTutorial(choice == 1 and "Tutorial4")
end

DefineClass.Tutorial_3_SalvageBuildings = { __parents = { "BaseHint" }, }
DefineClass.Tutorial_3_PowerDroneHub = { __parents = { "BaseHint" }, }
DefineClass.Tutorial_3_HighPriority = { __parents = { "BaseHint" }, }
DefineClass.Tutorial_3_WindTurbine = { __parents = { "BaseHint" }, }
DefineClass.Tutorial_3_NightShifts = { __parents = { "BaseHint" }, }
DefineClass.Tutorial_3_Maintenance = { __parents = { "BaseHint" }, }
DefineClass.Tutorial_3_MoreMetals = { __parents = { "BaseHint" }, }
DefineClass.Tutorial_3_OpenResupplyUI = { __parents = { "BaseHint" }, }
DefineClass.Tutorial_3_OrderAdvancedResources = { __parents = { "BaseHint" }, realtime_delay = 1,}
DefineClass.Tutorial_3_ClearingBuildings = { __parents = { "BaseHint" }, }
DefineClass.Tutorial_3_DeletingCables = { __parents = { "BaseHint" }, }
DefineClass.Tutorial_3_WaitRocket = { __parents = { "BaseHint" }, }
DefineClass.Tutorial_3_Battery = { __parents = { "BaseHint" }, }
DefineClass.Tutorial_3_WaterExtractor = { __parents = { "BaseHint" }, }
DefineClass.Tutorial_3_WaterTank = { __parents = { "BaseHint" }, }
DefineClass.Tutorial_3_Dome = { __parents = { "BaseHint" }, }
DefineClass.Tutorial_3_DomeSupply = { __parents = { "BaseHint" }, }