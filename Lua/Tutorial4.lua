g_TutorialScenarios.Tutorial4 = function()
	-- 0. Initialization
	g_Tutorial.BuildMenuWhitelist = {}
	g_Tutorial.EnableCargoRockets = false
	
	local old = IsDepositObstructed
	IsDepositObstructed = empty_func	
	GetSector("C1"):Scan("scanned")
	GetSector("D1"):Scan("scanned")
	IsDepositObstructed = old	
	UICity:SetTechResearched("DecommissionProtocol")
	
	-- 1. Intro Popup
	
	WaitTutorialPopup("Tutorial4_Popup1_Intro")
	ViewObjectMars(UICity.labels.Dome[1])
	Sleep(5000)
	
	-- 2. Build Housing
	WaitTutorialPopup("Tutorial4_Popup2_Housing")
	TutorialNextHint("Tutorial_4_Housing")
	
	g_Tutorial.BuildMenuWhitelist.LivingQuarters = true
	local ghost = PlaceGhost("LivingQuarters_01", g_Tutorial.MapMarkers.LivingQuarters:GetPos(), false, "align")
	ViewObjectMars(ghost)
	g_Tutorial.ConstructionTarget = { class = "LivingQuarters", loc = g_Tutorial.MapMarkers.LivingQuarters, radius = 5 }
	WaitBuildMenuItemSelected("Habitats", "LivingQuarters", "place")
	g_Tutorial.ConstructionTarget =  nil	
	DoneObject(ghost)
	g_Tutorial.BuildMenuWhitelist.LivingQuarters = false
	WaitConstruction("LivingQuarters")
	
	-- 3. Founders
	WaitTutorialPopup("Tutorial4_Popup3_Founders")
	TutorialNextHint("Tutorial_4_Founders")
	g_Tutorial.EnableResupply = true
	g_Tutorial.EnablePassengerRockets = true
	
	PlaceBuilding("SupplyRocket", {city = UICity, custom_travel_time_earth = 6*const.HourDuration, custom_travel_time_mars = 6*const.HourDuration})
	WaitOneMsGameTime()
	
	WaitUIButtonPressed("HUD", "idResupply")
	
	local resource_arrow = TutorialUIArrow:new({	
		AnchorType = "left-center", 
		FindTarget = function() 
			if Dialogs.Resupply and Dialogs.Resupply.Mode == "categories" then
				return Dialogs.Resupply.idTemplate.idCategories.idList.idPassenger
			end
		end
	}, terminal.desktop)
	
	-- 4. Filter
	
	local filterUI_popped = false
	local reviewUI_popped = false
	local rocket = UICity.labels.AllRockets[1]
	local launch_arrow
	while rocket.command ~= "FlyToMars" do
		if Dialogs.Resupply and Dialogs.Resupply.Mode == "passengers" and not filterUI_popped then
			WaitTutorialPopupImmediate("Tutorial4_PopUp4_FilterUI", {}, nil, Dialogs.Resupply)
			if g_Tutorial.LastHint ~= "Tutorial_4_PassengerRocket" then
				TutorialNextHint("Tutorial_4_PassengerRocket")
			end
			if not launch_arrow then
				launch_arrow = TutorialUIArrow:new({	
					AnchorType = "center-top", 
					FindTarget = function()
						if not Dialogs.Resupply or Dialogs.Resupply.Mode ~= "passengers" or Dialogs.Resupply.idTemplate.idPassengers.Mode == "traitCategories" then 
							return false
						end
						return Dialogs.Resupply.idTemplate.idPassengers.idToolBar.idlaunch
					end,
				}, terminal.desktop)
			end
			filterUI_popped = true
		end
		if Dialogs.Resupply and Dialogs.Resupply.Mode == "passengers" and Dialogs.Resupply.idTemplate.idPassengers.Mode == "review" and not reviewUI_popped then
			WaitTutorialPopupImmediate("Tutorial4_PopUp5_ReviewUI", {}, nil, Dialogs.Resupply)
			reviewUI_popped = true
		end
		Sleep(50)
	end
	launch_arrow:delete()
	--rocket:SetCommand("OnEarth")
	
	resource_arrow:delete()
	g_Tutorial.EnableResupply = false

	-- 5. Food
	Sleep(5000)
	WaitTutorialPopup("Tutorial4_PopUp6_Food")
	TutorialNextHint("Tutorial_4_HydroponicFarmAndStore")
	
	g_Tutorial.BuildMenuWhitelist.HydroponicFarm = true
	WaitBuildMenuItemSelected("Life-Support", "HydroponicFarm", "place")
	g_Tutorial.BuildMenuWhitelist.HydroponicFarm = false
	
	g_Tutorial.BuildMenuWhitelist.ShopsFood = true
	WaitBuildMenuItemSelected("Dome Services", "ShopsFood", "place")
	g_Tutorial.BuildMenuWhitelist.ShopsFood = false
	WaitConstruction("ShopsFood")

	-- 6. Services
	WaitTutorialPopup("Tutorial4_PopUp7_Services")
	TutorialNextHint("Tutorial_4_Spacebar")
	
	g_Tutorial.BuildMenuWhitelist.Spacebar = true
	WaitBuildMenuItemSelected("Dome Services", "Spacebar", "place")
	g_Tutorial.BuildMenuWhitelist.Spacebar = false
	WaitConstruction("Spacebar")
	
	-- 6,5. Land Rocket
	--rocket:SetCommand("WaitInOrbit")
	if rocket.command == "WaitInOrbit" or rocket.command == "FlyToMars" then
		TutorialNextHint("Tutorial_4_LandRocket")
		local rocket_arrow = TutorialUIArrow:new({
			AnchorType = "center-top",
			FindTarget = function() 
				if Dialogs.PinsDlg then 
					for _, win in ipairs(Dialogs.PinsDlg) do
						if IsKindOf(win, "XBlinkingButton") and IsKindOf(win.context, "SupplyRocket") and UICity.labels.AllRockets[1].command == "WaitInOrbit" then
							return win
						end
					end
				end
			end,
		}, terminal.desktop)
		
		while rocket.command ~= "Refuel" do
			Sleep(100)
		end
		
		rocket_arrow:delete()
		Sleep(5000)
	end
	
	
	-- 7. Managing Jobs
	WaitTutorialPopup("Tutorial4_PopUp8_ManagingJobs")
	TutorialNextHint("Tutorial_4_ManagingJobs")
	Sleep(100)
	
	local spacebar = UICity.labels["Spacebar"] and UICity.labels["Spacebar"][1]
	ViewObjectMars(spacebar)
	ShowTutorialArrow(spacebar, "ArrowTutorialBase")
	local arrow
	for i = 1, 2 do
		arrow = TutorialUIArrow:new({
			AnchorType = "center-top",
			FindTarget = function() 
				local infopanel = Dialogs.Infopanel
				if not infopanel or infopanel.context ~= spacebar or spacebar.closed_workplaces[i]==1 then 
					return false 
				end
				if spacebar:IsClosedShift(i) then	
					return infopanel["idWorkshift"..i].idIcon 
				end
				return infopanel["idWorkshift"..i] 
					and infopanel["idWorkshift"..i].idWorkers[2] 
			end,
		}, terminal.desktop)
		                               
		while IsValid(spacebar) and  spacebar.closed_workplaces[i]~=1 do
			Sleep(100)
		end
		arrow:delete()
	end
	RemoveAllTutorialArrows()
	
	-- 8. Research
	Sleep(5000)
	WaitTutorialPopup("Tutorial4_PopUp9_Research")
	TutorialNextHint("Tutorial_4_ResearchLab")
	
	g_Tutorial.BuildMenuWhitelist.ResearchLab = true
	WaitBuildMenuItemSelected("Habitats", "ResearchLab", "place")
	g_Tutorial.BuildMenuWhitelist.ResearchLab = false
	WaitConstruction("ResearchLab")
	Sleep(100)
		
	-- 9. Shifts
	WaitTutorialPopup("Tutorial4_PopUp10_Shifts")
	TutorialNextHint("Tutorial_4_Shifts")
	
	local lab = UICity.labels["ResearchLab"] and UICity.labels["ResearchLab"][1]
	ViewObjectMars(lab)
	local obj_arrow = ShowTutorialArrow(lab, "ArrowTutorialBase")
	
	arrow = TutorialUIArrow:new({
		AnchorType = "left-center",
		FindTarget = function() return Dialogs.Infopanel and Dialogs.Infopanel.context == lab and Dialogs.Infopanel.idWorkshift2 end,
	}, terminal.desktop)

	while IsValid(lab) and lab:IsClosedShift(2) do
		if SelectedObj ~= lab then
			obj_arrow:SetEnumFlags(const.efVisible)
		else
			obj_arrow:ClearEnumFlags(const.efVisible)
		end
		Sleep(100)
	end
	arrow:delete()
	DoneObject(obj_arrow)
		
	-- 10. High Priority
	Sleep(2000)
	WaitTutorialPopup("Tutorial4_PopUp11_HightPriority")
	TutorialNextHint("Tutorial_4_HighPriority")
	
	arrow = TutorialUIArrow:new({
		AnchorType = "center-top",
		FindTarget = function() return Dialogs.Infopanel and Dialogs.Infopanel.context == lab and Dialogs.Infopanel.idPriority end,
	}, terminal.desktop)	

	obj_arrow = PlaceObject("ArrowTutorial")
	obj_arrow:SetPos(lab:GetPos() + point(0, 0,lab:GetEntityBBox():sizez()))						
	while IsValid(lab) and lab.priority < const.MaxBuildingPriority do
		if SelectedObj ~= lab then
			obj_arrow:SetEnumFlags(const.efVisible)
		else
			obj_arrow:ClearEnumFlags(const.efVisible)
		end
		Sleep(100)
	end
	arrow:delete()
	DoneObject(obj_arrow)
	
	-- 11. Research (again)
	Sleep(5000)
	WaitTutorialPopup("Tutorial4_PopUp12_Research_2")
	TutorialNextHint("Tutorial_4_OpenResearch")
	
	g_Tutorial.EnableResearch = true
	WaitUIButtonPressed("HUD", "idResearch")
	TutorialNextHint("Tutorial_4_Research_2")
	
	Sleep(100)
	
	while #UICity.research_queue < 3 do
		Sleep(50)
		if not Dialogs.ResearchDlg then
			WaitUIButtonPressed("HUD", "idResearch")
		end
	end
		
	-- 12. Pass Founder Stage
	Sleep(5000)
	WaitTutorialPopup("Tutorial4_PopUp13_FounderStage")
	
	-- 13. Epilogue
	Sleep(3000)
	local choice = WaitTutorialPopup("Tutorial4_PopUp14_Epilogue")
	WinTutorial(choice == 1 and "Tutorial5")
end

DefineClass.Tutorial_4_Housing = { __parents = { "BaseHint" }, }
DefineClass.Tutorial_4_Founders = { __parents = { "BaseHint" }, }
DefineClass.Tutorial_4_PassengerRocket = { __parents = { "BaseHint" }, realtime_delay = 1}
DefineClass.Tutorial_4_HydroponicFarmAndStore = { __parents = { "BaseHint" }, }
DefineClass.Tutorial_4_Spacebar = { __parents = { "BaseHint" }, }
DefineClass.Tutorial_4_LandRocket = { __parents = { "BaseHint" }, }
DefineClass.Tutorial_4_ManagingJobs = { __parents = { "BaseHint" }, }
DefineClass.Tutorial_4_ResearchLab = { __parents = { "BaseHint" }, }
DefineClass.Tutorial_4_Shifts = { __parents = { "BaseHint" }, }
DefineClass.Tutorial_4_HighPriority = { __parents = { "BaseHint" }, }
DefineClass.Tutorial_4_Research_2 = { __parents = { "BaseHint" }, realtime_delay = 1}
DefineClass.Tutorial_4_OpenResearch = { __parents = { "BaseHint" }, }
