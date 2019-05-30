-- Tutorial 5 Hint classes definitions
DefineClass.Tutorial_5_ShuttleHub =            { __parents = { "BaseHint" }, }
DefineClass.Tutorial_5_RareMetalsExtractor =   { __parents = { "BaseHint" }, }
DefineClass.Tutorial_5_Housing =               { __parents = { "BaseHint" }, }
DefineClass.Tutorial_5_Services =              { __parents = { "BaseHint" }, }
DefineClass.Tutorial_5_FilterUI =              { __parents = { "BaseHint" }, }
DefineClass.Tutorial_5_FilterUI_2_Scientists = { __parents = { "BaseHint" }, realtime_delay = 1,}
DefineClass.Tutorial_5_FilterUI_3_Geologists = { __parents = { "BaseHint" }, realtime_delay = 1,}
DefineClass.Tutorial_5_NewDome =               { __parents = { "BaseHint" }, }
DefineClass.Tutorial_5_NewDomeFarms =          { __parents = { "BaseHint" }, }
DefineClass.Tutorial_5_Passages =              { __parents = { "BaseHint" }, }
DefineClass.Tutorial_5_ResearchUpgrade =       { __parents = { "BaseHint" }, }
DefineClass.Tutorial_5_ResearchUpgrade_1 =       { __parents = { "BaseHint" }, }
DefineClass.Tutorial_5_UpgradeExtractor =      { __parents = { "BaseHint" }, }
DefineClass.Tutorial_5_UpgradeExtractor_2=     { __parents = { "BaseHint" }, }
DefineClass.Tutorial_5_CommandCenterUI =       { __parents = { "BaseHint" }, }
-- Tutorial 5 thread function
g_TutorialScenarios.Tutorial5 = function()
	local domes = UICity.labels.Dome
	local mining_dome
	local research_dome
	for _, dome in ipairs(domes) do
		if not dome.labels.Building or #dome.labels.Building==0 then
			mining_dome = dome
		else
			research_dome = dome
		end
	end	

	g_Tutorial.BuildMenuWhitelist = g_Tutorial.BuildMenuWhitelist or {} 
	g_Tutorial.BuildMenuWhitelist.PowerCables = true
	g_Tutorial.BuildMenuWhitelist.Pipes = true
	
	local old = IsDepositObstructed
	IsDepositObstructed = empty_func	
	GetSector("F3"):Scan("scanned")
	GetSector("G3"):Scan("scanned")
	GetSector("C1"):Scan("scanned")
	GetSector("D1"):Scan("scanned")
	GetSector("D2"):Scan("scanned")
	UICity:SetTechResearched("DecommissionProtocol")
	IsDepositObstructed = old
	ViewObjectMars(research_dome)
	
	-- 1. Intro
	WaitTutorialPopup("Tutorial5_Popup1_Intro")
	Sleep(5000)
	
	-- 2. Shuttles	
	WaitTutorialPopup("Tutorial5_Popup2_Shuttles")
	TutorialNextHint("Tutorial_5_ShuttleHub")

	g_Tutorial.BuildMenuWhitelist.ShuttleHub = true
	local marker =  g_Tutorial.MapMarkers.ShuttleHub
	local ghost = PlaceGhost("ShuttleHub", marker:GetPos(),false, "align")
	g_Tutorial.ConstructionTarget = { class = "ShuttleHub", loc = marker, radius = 5 }
	ViewObjectMars(ghost)
	WaitBuildMenuItemSelected("Infrastructure", "ShuttleHub", "place")
	g_Tutorial.ConstructionTarget = nil
	DoneObject(ghost)
	if #(UICity.labels.ShuttleHub or empty_table)==0 then
		WaitConstruction("ShuttleHub")
	end	
	Sleep(100)
	local shuttlehubs  = UICity.labels.ShuttleHub
	local working = false
	while not working do
		for _, hub in ipairs(shuttlehubs) do
			if not hub.destroyed and hub:HasPower() then
				working = true
				break
			end
		end
		if not working then Sleep(1000) end
	end

	-- 3. Out-dome Worker Buildings 
	WaitTutorialPopup("Tutorial5_Popup3_Mining")
	TutorialNextHint("Tutorial_5_RareMetalsExtractor")

	g_Tutorial.BuildMenuWhitelist.PreciousMetalsExtractor = true
	local marker =  g_Tutorial.MapMarkers.RareMetalExtractor
	local pos = marker:GetPos()
	local ghost = PlaceGhost("UniversalExtractor", pos, false, "align")
	g_Tutorial.ConstructionTarget = { class = "PreciousMetalsExtractor", loc = marker, radius = 5 }
	ViewObjectMars(ghost)
	WaitBuildMenuItemSelected("Production", "PreciousMetalsExtractor","place", pos)
	g_Tutorial.ConstructionTarget = nil
	DoneObject(ghost)
	if #(UICity.labels.PreciousMetalsExtractor or empty_table)==0 then
		WaitConstruction("PreciousMetalsExtractor")
	end	
	Sleep(100)
	local extractors  = UICity.labels.PreciousMetalsExtractor 
	local supplyed = false
	while not supplyed do
		for _, extractor in ipairs(extractors) do
			if not extractor.destroyed and extractor.electricity.grid.current_production>0 then
				supplyed = true
				break
			end
		end
		if not supplyed then Sleep(1000) end
	end

	-- 4. Housing 
	WaitTutorialPopup("Tutorial5_Popup4_Housing")
	TutorialNextHint("Tutorial_5_Housing")
		
	-- Show arrow on empty Dome
	local top_spot_idx = mining_dome:GetSpotBeginIndex("Top")
	local ingame_arrow = PlaceObject("ArrowTutorialBase")
	mining_dome:Attach(ingame_arrow, top_spot_idx)
	
	g_Tutorial.BuildMenuWhitelist.LivingQuarters = true
	g_Tutorial.BuildMenuWhitelist.Apartments = true
	--"SmartHome"
	--"SmartComplex"
	-- select any house from Habittats menu and place construction
	local marker =  g_Tutorial.MapMarkers.LivingQuarters
	local ghost = PlaceGhost("LivingQuarters_01", marker:GetPos(),false, "align")
	g_Tutorial.ConstructionTarget = { class = "LivingQuarters", loc = marker, radius = 5 }
	ViewObjectMars(ghost)
	local housing = {"LivingQuarters","Apartments"}
	local arrows = {}
	for _,item in ipairs(housing) do
		arrows[#arrows + 1 ] = TutorialUIArrow:new({
			AnchorType = "center-top",
			FindTarget = function()  
				if GetInGameInterfaceMode() == "construction" then
					return false
				end	
				if not Dialogs.XBuildMenu then
					if not g_RightClickOpensBuildMenu then
						local dlg = GetDialog("HUD")
						return dlg and dlg.idBuild or false
					else
						return false
					end
				end			
				if Dialogs.XBuildMenu:HasMember(item) then
					return Dialogs.XBuildMenu[item].enabled and Dialogs.XBuildMenu[item] or false
				end
				return Dialogs.XBuildMenu.idCategoryList["Habitats"]
			end,
		}, terminal.desktop)
		
	end
	WaitAnyConstructionSite(table.unpack(housing))
	
	for _,arrow in ipairs(arrows) do
		arrow:delete()	
	end
	DoneObject(ghost)
	g_Tutorial.ConstructionTarget = nil
	
	-- service
	TutorialNextHint("Tutorial_5_Services")
	g_Tutorial.BuildMenuWhitelist.Spacebar = true
	marker = g_Tutorial.MapMarkers.SpaceBar
	local ghost = PlaceGhost("Spacebar", marker:GetPos(), marker:GetAngle()+60*60, "align")
	g_Tutorial.ConstructionTarget = { class = "Spacebar", loc = marker, radius = 5 }
	ViewObjectMars(ghost)
	WaitBuildMenuItemSelected("Dome Services", "Spacebar", "place")
	DoneObject(ghost)
	g_Tutorial.ConstructionTarget = nil

	--grocery
	g_Tutorial.BuildMenuWhitelist.ShopsFood = true
	local marker = g_Tutorial.MapMarkers.Grocery
	local ghost = PlaceGhost("ShopsFood", marker:GetPos(), false, "align")
	g_Tutorial.ConstructionTarget = { class = "ShopsFood", loc = marker, radius = 50 }
	ViewObjectMars(ghost)
	WaitBuildMenuItemSelected("Dome Services", "ShopsFood", "place")
	DoneObject(ghost)
	g_Tutorial.ConstructionTarget = nil
	ingame_arrow:delete()

	-- complete the construction of places house and spacebar and ShopsFood
	local labels = mining_dome.labels
	while #(labels.Residence or empty_table)==0 or 
			#(labels.Spacebar or empty_table)==0 or 
			#(labels.ShopsFood or empty_table)==0 do
		Sleep(1000)
	end
		
	--5. Filter UI 
	WaitTutorialPopup("Tutorial5_Popup5_FilterUI")
	TutorialNextHint("Tutorial_5_FilterUI")

	-- Show arrow on both Domes if not selected
	local domes = UICity.labels.Dome
	if not IsKindOf(SelectedObj, "Dome") then
		for _,dome in ipairs(domes) do 
			local top_spot_idx = dome:GetSpotBeginIndex("Top")
			local ingame_arrow = PlaceObject("ArrowTutorialBase")
			dome:Attach(ingame_arrow, top_spot_idx)
		end
	end
	while true do
		if not GetDialog("DomeTraits") and research_dome.traits_filter["scientist"] and research_dome.traits_filter["geologist"]==false 
		   and mining_dome.traits_filter["geologist"] and mining_dome.traits_filter["scientist"]==false
		   then
		  -- end of filter tutorial
			break 			
		end
		-- select dome
		while not IsKindOf(SelectedObj, "Dome") do
			WaitMsg("SelectedObjChange")
		end

		--Then show arrow on Filters Button
		if not GetDialog("DomeTraits") then
			WaitInfopanelAction("Dome", "OpenFilterTraits", function(arrow)
				return arrow.button_pressed or GetDialog("DomeTraits")
			end)
			Sleep(200)
		end
	 
		-- 6. Filter UI 2 
		local add, remove
		local function SelectColonistFilter()
			if SelectedObj == research_dome then
				add = "scientist"
				remove = "geologist"
			elseif SelectedObj == mining_dome then
				remove = "scientist"
				add = "geologist"
			end
		end	
		SelectColonistFilter()	
		--if filter is set skip filter tutorial
		if IsKindOf(SelectedObj, "Dome") then
			if SelectedObj == research_dome then
				WaitTutorialPopupImmediate("Tutorial5_Popup6_FilterUI_2_Research", false, false, terminal.desktop)
				TutorialNextHint("Tutorial_5_FilterUI_2_Scientists")
			elseif SelectedObj == mining_dome then
				WaitTutorialPopupImmediate("Tutorial5_Popup7_FilterUI_3_Mining", false, false, terminal.desktop)
				TutorialNextHint("Tutorial_5_FilterUI_3_Geologists")
			end
			Sleep(200)
			
			local filterui_arrow = TutorialUIArrow:new({
				AnchorType = "left-center",
				FindTarget = function()
					local dlg = GetDialog("DomeTraits")
					if not dlg then return false end
					local specialization = table.find_value(dlg.idList, "Id", "Specialization")
					if dlg.Mode == "traitCategories" then
						return specialization
					else
						local prop_meta = GetDialogModeParam(dlg)
						local category = prop_meta and prop_meta.id 
						if category == "Specialization" then
							return false
						end	
						return dlg.idActionBar[2].idback
					end
				end,
				}, terminal.desktop)
				
			while true do 
				local dlg = GetDialog("DomeTraits")
				if not dlg then break end
				
				if dlg.Mode ~= "traitCategories" then
					local prop_meta = GetDialogModeParam(dlg)
					local category = prop_meta and prop_meta.id 
					if category == "Specialization" then
						break
					end	
				end
				Sleep(50)
			end
			filterui_arrow:delete()

			local function SpecializationArrowFindTarget(spec)
				local dlg = GetDialog("DomeTraits")
				if not dlg then return false end
				local prop_meta = GetDialogModeParam(dlg)
				local category = prop_meta and prop_meta.id
				if dlg.Mode ~= "items" or category ~= "Specialization" then return false end
				SelectColonistFilter()
				local ctrl = table.find_value(dlg.idList, "Id", spec=="add" and add or remove)
				return ctrl and (spec=="add" and ctrl.idPositive) or (spec=="remove" and ctrl.idNegative) or false
			end
			
			local dlg = GetDialog("DomeTraits")
			if dlg then
				local prop_meta = GetDialogModeParam(dlg)
				local category = prop_meta and prop_meta.id 
				if dlg.Mode == "items" and category == "Specialization" then 
					local down_arrow = TutorialUIArrow:new({
						AnchorType = "right-center",
						FindTarget = function() return SpecializationArrowFindTarget("remove") end,
					}, terminal.desktop)
					
					local up_arrow = TutorialUIArrow:new({
						AnchorType = "left-center",
						FindTarget = function() return SpecializationArrowFindTarget("add") end,
					}, terminal.desktop)
					
					local clicked = false
					while true do
						local dlg = GetDialog("DomeTraits")
						if not dlg then break end
						if dlg.Mode ~= "items" or category ~= "Specialization" then break end
						SelectColonistFilter()
						if (dlg.context.filter[add] and dlg.context.filter[remove]==false) then
							clicked = true
							break
						end	
						Sleep(70)
					end
					up_arrow:delete()
					down_arrow:delete()
					
					if clicked then
						local filterui_arrow = TutorialUIArrow:new({
							AnchorType = "center-top",
							FindTarget = function()
								local dlg = GetDialog("DomeTraits")
								if not dlg then return false end
								local bFiltersSet = research_dome.traits_filter["scientist"] and research_dome.traits_filter["geologist"]==false 
										   and mining_dome.traits_filter["geologist"] and mining_dome.traits_filter["scientist"]==false
								if dlg.context.filter[add] and dlg.context.filter[remove]==false then
									if IsKindOf(SelectedObj,"Dome") and not (SelectedObj.traits_filter[add] and SelectedObj.traits_filter[remove]==false) then
										return dlg and dlg.idActionBar[2].idapply	or false
									elseif dlg.Mode=="items" then									
										if bFiltersSet then	
											return dlg and dlg.idActionBar[2].idback	or false
										else
											return dlg and dlg.idActionBar[2].idnext	or false
										end										
									else	
										if bFiltersSet then	
											return dlg and dlg.idActionBar[2].idclose	or false
										else
											return dlg and dlg.idActionBar[2].idnextdome	or false
										end										
									end
								end
								return false
							end,							
							}, terminal.desktop)
						
						while true do
							dlg = GetDialog("DomeTraits")
							if not dlg then 
								break
							end	
							SelectColonistFilter()								
							if not(dlg.context.filter[add] and dlg.context.filter[remove]==false) then
								break
							end
							Sleep(50)
						end
						filterui_arrow:delete()
					end	
				end
			end			
		end	
   end
	RemoveAllTutorialArrows()  	
--7. Third Dome 
	WaitTutorialPopup("Tutorial5_Popup8_NewDome")
	TutorialNextHint("Tutorial_5_NewDome")
	-- Dome 3
	g_Tutorial.BuildMenuWhitelist.DomeBasic = true
	local marker = g_Tutorial.MapMarkers.Dome3
	local ghost = PlaceGhost("DomeBasicConstruction", marker:GetPos(), false, "align")
	ViewObjectMars(ghost)
	g_Tutorial.ConstructionTarget = { class = "DomeBasic", hex = marker}
	WaitBuildMenuItemSelected("Domes", "DomeBasic", "place")
	DoneObject(ghost)
	g_Tutorial.ConstructionTarget = nil
	WaitConstruction("DomeBasic")

	TutorialNextHint("Tutorial_5_NewDomeFarms")
	-- 2 Farms
 	g_Tutorial.BuildMenuWhitelist.HydroponicFarm = true
	marker = g_Tutorial.MapMarkers.Farm1
	local ghost = PlaceGhost("HydroponicFarm", marker:GetPos(), false, "align")
	g_Tutorial.ConstructionTarget = { class = "HydroponicFarm", loc = marker, radius = 5 }
	ViewObjectMars(ghost)
	WaitBuildMenuItemSelected ("Life-Support", "HydroponicFarm", "place")
	DoneObject(ghost)
	g_Tutorial.ConstructionTarget = nil
	
	-- Farm2
	marker = g_Tutorial.MapMarkers.Farm2
	local ghost = PlaceGhost("HydroponicFarm", marker:GetPos(), false, "align")
	g_Tutorial.ConstructionTarget = { class = "HydroponicFarm", loc = marker, radius = 5 }
	ViewObjectMars(ghost)
	WaitBuildMenuItemSelected("Life-Support", "HydroponicFarm", "place")
	DoneObject(ghost)
	g_Tutorial.ConstructionTarget = nil
	local dome3
	while true do
		local domes = UICity.labels.Dome
		local build = false
		for _, dome in ipairs(domes) do
			if dome~=mining_dome and dome~= research_dome and #(dome.labels.HydroponicFarm or empty_table)>=2 then
				build = true
				dome3 = dome
				break
			end	
		end
		if build then
			break
		end	
		WaitMsg("ConstructionComplete")
	end
	
	--8. Passages 
	WaitTutorialPopup("Tutorial5_Popup9_Passages")
	TutorialNextHint("Tutorial_5_Passages")
	
	g_Tutorial.BuildMenuWhitelist.Passage = true
	local marker = g_Tutorial.MapMarkers.PassageEntrance
	local marker2 = g_Tutorial.MapMarkers.PassageExit
	local pos1, pos2 = marker:GetPos(), marker2:GetPos()
	
	local ghost1 = PlaceGhost("PassageCovered", pos1, marker:GetAngle(), "align")
	local ghost2 = PlaceGhost("PassageCovered", pos2, marker:GetAngle()+60*60, "align")

	local arrow1 = PlaceObject("ArrowTutorialBase")
	local arrow2 = PlaceObject("ArrowTutorialBase")
	arrow1:SetPos(pos1)
	arrow2:SetPos(pos2)
	ViewObjectMars( pos1)
	WaitBuildMenuItemSelected("Domes", "Passage","passage_grid")
	DoneObject(ghost1)
	DoneObject(ghost2)
	while true do 
		if IsValid(research_dome) and next(research_dome.connected_domes or empty_table) then
			break
		end
		local ok, dome1, dome2 = WaitMsg("PassageConstructionPlaced")
		if dome1==research_dome or dome2==research_dome then 
			break
		end
		
	end
	RemoveAllTutorialArrows()
	while true do
		if IsValid(research_dome) and next(research_dome.connected_domes or empty_table) then
			break
		end
		Sleep(1000)
	end

	WaitTutorialPopup("Tutorial5_Popup10_Passages_2")

 --9.	Upgrades 1
	Sleep(10000)
	WaitTutorialPopup("Tutorial5_Popup11_Upgrades")
	TutorialNextHint("Tutorial_5_ResearchUpgrade")
	
	g_Tutorial.EnableResearch = true
	g_Tutorial.EnableResearchWarning = true
	g_Tutorial.ExtractorAmplification = 200
	
	WaitHUDButtonPressed("idResearch", function(arrow)
		return arrow.button_pressed or Dialogs.ResearchDlg
	end)
	WaitResearchQueued("ExtractorAmplification", "close")
	TutorialNextHint("Tutorial_5_ResearchUpgrade_1")
	while not UICity:IsTechResearched("ExtractorAmplification") do
		WaitMsg("TechResearched")
	end
	g_Tutorial.ExtractorAmplification = nil
	
	--10.Upgrades 2
 	WaitTutorialPopup("Tutorial5_Popup12_Upgrades_2")
	TutorialNextHint("Tutorial_5_UpgradeExtractor")
	local extractor = UICity.labels.WaterExtractor and UICity.labels.WaterExtractor[1]
	ViewObjectMars(extractor)
	if extractor then
		WaitObjectSelected(extractor)
	end
	local up_arrow = TutorialUIArrow:new({
		AnchorType = "left",
		FindTarget = function(self)
			if self.button_pressed then return false end
			local dlg = GetDialog("Infopanel")
			return dlg and dlg.idContent[1] or false
		end,
		OnAttachToTarget = function(self, target)
			local old_OnPress = target.OnActivate
			local old_altPress = target.OnAltActivate
			target.OnAltActivate = function(...)
				self.button_pressed = not self.button_pressed
				TutorialNextHint("Tutorial_5_UpgradeExtractor_2")
				return old_altPress(...)
			end
			target.OnActivate = function(...)
				self.button_pressed = not self.button_pressed
				TutorialNextHint("Tutorial_5_UpgradeExtractor_2")
				return old_OnPress(...)
			end
		end,
		button_pressed = false
	}, terminal.desktop)	
	
	while true do
		local ok, bld, id = WaitMsg("BuildingUpgraded")
		if IsKindOf(bld, "WaterExtractor") and id=="WaterExtractor_Amplify" then
			break
		end
	end	
	up_arrow:delete()
	RemoveAllTutorialArrows()
	WaitTutorialPopup("Tutorial5_Popup13_Upgrades_3")

 --11.	Command Center UI 
	Sleep(10000)
	WaitTutorialPopup("Tutorial5_Popup14_CommandCenterUI")
	TutorialNextHint("Tutorial_5_CommandCenterUI")

	--Show arrow on Command UI and wait to open  take some time and close
	WaitHUDButtonPressed("idColonyControlCenter", function(arrow)
		return arrow.button_pressed or Dialogs.ColonyControlCenter
	end)
	Sleep(2000)
	while GetCommandCenterDialog() do
		Sleep(2000)	
	end
	HintDisable("Tutorial_5_CommandCenterUI")
	
 --12.	Epilogue
	Sleep(5000)
	local choice = WaitTutorialPopup("Tutorial5_Popup15_Epilogue")
	WinTutorial()
end
