-- ui indicator/target


--[[
	g_Tutorial is a global var which is either false if we're not running a tutorial, or a table 
	holding various parameters/state related to the tutorial
	
	List of members:
		EnableRockets - if not set to true, the city will not create starting rockets for you.
		EnableResupply - if not set to true the Resupply button in HUD will be disabled
		EnableResearchWarning - if not set to true, the city won't show the notification for research
		EnableResearch - if not set to true the Research button in HUD will be disabled
		EnableExplorationWarning - if not set to true, the city won't show the notification for exploration
		EnableRebuild - if not set to true, Rebuild button will be disabled during tutorial
		SuppressResupplyLaunch - if set to true will keep the Launch button in Resupply dialog disabled
		Map - tutorial scenario/map name
		Thread - the real time thread running the scenario-specific tutorial code
		UIArrows - created objects of class TutorialUIArrow
		MapMarkers - available objects of class TutorialMarker
		ConstructionTarget - table specifying the next construction class and location to enforce:
			* class
			* loc (point or object)
			* radius (in hexes)
		BuildMenuWhitelist - if specified, only listed items will be visible in build menu
		EnableExploration - if not set to true, exploration will be unavailable
		EnableOrbitalProbes - if not set to true, orbital probes will not be usable
		LastHint - id of the last displayed hint, internally used by TutorialNextHint
		EnableTransportProblemNotif - if not set to true, said notifications will be suppressed (value checked at start)
		RoverGatherResourceWorkTime - if set will override the default work time for rovers gathering resources from
			surface deposits
--]]

if FirstLoad then
	g_Tutorial = false
	g_TutorialArrows = {}
	g_TutorialScenarios = {}
end

function StartTutorial(id)
	local def = Presets.TutorialPreset.Default
	
	if not def[id] then
		return
	end
	
	def = def[id]
	
	if not CurrentThread() then
		return CreateRealTimeThread(StartTutorial, id)
	end
	if g_Tutorial and g_Tutorial.Map == def.map then
		TutorialCleanup()
	end

	-- change map	
	LoadingScreenOpen("idLoadingScreen", "Tutorial")
	
	AccountStorage.CompletedTutorials = AccountStorage.CompletedTutorials or {}
	SaveAccountStorage()
	
	CloseMenuDialogs()
	g_Tutorial = {
		Id = id,
		Map = def.map,
		MapMarkers = {},
	}
	ChangeMap(def.map)
	
	ForEach{
		class = "TutorialMarker",
		exec = function(o)
			if o.MarkerName ~= "" then
				assert(not g_Tutorial.MapMarkers[o.MarkerName], "Duplicate TutorialMarker name")
				g_Tutorial.MapMarkers[o.MarkerName] = o		
			end
			o:ClearEnumFlags(const.efVisible)
		end,
	}
	g_Tutorial.Loaded = true
	
	local idx = table.find(Presets.TutorialPreset.Default, "id", id)
	
	TelemetryTutorialAction("started", "step" .. (idx or ""), def.name)
	
	LoadingScreenClose("idLoadingScreen", "Tutorial")
		
	-- run tutorial-specific code
	g_Tutorial.Thread = CurrentThread()
	if g_TutorialScenarios[id] then
		g_TutorialScenarios[id]()
	end
	TutorialCleanup()
end

function WinTutorial(next_id)
	if not g_Tutorial or not AccountStorage then
		return
	end
	
	g_Tutorial.Won = true
	local def = Presets.TutorialPreset.Default[g_Tutorial.Id]
	local idx = table.find(Presets.TutorialPreset.Default, "id", g_Tutorial.Id)	
	TelemetryTutorialAction("completed", "step" .. (idx or ""), def.name)

	AccountStorage.CompletedTutorials = AccountStorage.CompletedTutorials or {}
	AccountStorage.CompletedTutorials[g_Tutorial.Id] = true
	SaveAccountStorage()
	
	if next_id then
		CreateRealTimeThread(StartTutorial, next_id)
	else
		CreateRealTimeThread(OpenPreGameMainMenu)
	end
end

function OnMsg.DoneMap()
	local map = GetMapName()
	
	if g_Tutorial and g_Tutorial.Map == map and g_Tutorial.Loaded then
		TutorialCleanup()
		g_Tutorial = false
		g_CurrentMissionParams.idMissionSponsor = "IMM"
		g_CurrentMissionParams.idCommanderProfile = "rocketscientist"
	end
end

function TutorialCleanup()
	if not g_Tutorial then return end
	
	RemoveAllTutorialArrows()
	
	local arrows = g_Tutorial.UIArrows or empty_table
	for i = #arrows, 1, -1 do
		arrows[i]:delete()
	end

	if IsValidThread(g_Tutorial.Thread) and g_Tutorial.Thread ~= CurrentThread() then
		DeleteThread(g_Tutorial.Thread)
	end
	
	if not g_Tutorial.Won then
		local def = Presets.TutorialPreset.Default[g_Tutorial.Id]
		local idx = table.find(Presets.TutorialPreset.Default, "id", g_Tutorial.Id)	
		TelemetryTutorialAction("failed", "step" .. (idx or ""), def.name)
	end
end

DefineClass.TutorialUIArrow = {
	__parents = { "XPopup" },
	Background = RGBA(0, 0, 0, 0),
	FocusedBackground = RGBA(0, 0, 0, 0),
	BorderWidth = 0,
	BorderColor = RGBA(0, 0, 0, 0),
	FocusedBorderColor = RGBA(0, 0, 0, 0),
	HandleMouse = false,
	ChildrenHandleMouse = false,
	ZOrder = 1000,
	last_target = false,
	enabled = false, -- prevent getting focus
}

function TutorialUIArrow:Init()
	local image = XImage:new({
		Image = "UI/Common/tutorial_arrow_right.tga",
		ImageScale = point(800, 800),
		--Columns = 6,
		FPS = 6,
	}, self)
	
	--image:SetAnimate(true)
	local anim_offset = point(30, 0)
	
	if self.AnchorType == "right" or self.AnchorType == "right-center" then
		image:SetImage("UI/Common/tutorial_arrow_left.tga")
		anim_offset = point(30, 0)
		--image.Angle = 270*60
	elseif self.AnchorType == "center-top" or self.AnchorType == "top" then
		anim_offset = point(0, -30)
		--image.Angle = 180*60
		image:SetImage("UI/Common/tutorial_arrow_down.tga")
	elseif self.AnchorType == "left" or self.AnchorType == "left-center" then
		--image.Angle = 90*60
		anim_offset = point(-30, 0)
		image:SetImage("UI/Common/tutorial_arrow_right.tga")
	elseif self.AnchorType == "center-bottom" or self.AnchorType == "bottom" then
		anim_offset = point(0, 30)
		image:SetImage("UI/Common/tutorial_arrow_up.tga")
	end
	
	self:CreateThread("Update", function() 
		while true do
			-- update anchor
			local target
			if not GetXDialog("IGMainMenu") then
				target = self:FindTarget()
			end
			if target and target:IsVisible() then
				if not self.Anchor or self.Anchor ~= target.box or self.last_target ~= target then
					self.last_target = target
					self.Anchor = target.box
					self:SetVisible(true, true)
					image:SetVisible(true, true)
					self:UpdateLayout()
					self:OnAttachToTarget(target)
					
					self:AddInterpolation{
						id = "bounce",
						type = const.intRect,
						startRect = self.box,
						startRectAutoZoom = 1000,
						endRect = self.box + anim_offset,
						endRectAutoZoom = 1000,
						duration = 600,
						--start = 0,
						flags = const.intfPingPong + const.intfLooping,
					}
				end				
			else
				self.last_target = false
				self:SetVisible(false, true)
				image:SetVisible(false, true)
			end
			Sleep(40)
		end
	end)
	if g_Tutorial then
		g_Tutorial.UIArrows = g_Tutorial.UIArrows or {}
		g_Tutorial.UIArrows[#g_Tutorial.UIArrows + 1] = self
	end
end

function TutorialUIArrow:Done()
	if g_Tutorial and g_Tutorial.UIArrows then
		table.remove_entry(g_Tutorial.UIArrows, self)
	end
end

function TutorialUIArrow:FindTarget()
	assert(false, "add a function in your arrow to locate the target control")
	return false
end

function TutorialUIArrow:OnAttachToTarget(target)
	--called only once each time attaching to the target
end

DefineClass.TutorialMarker = {
	__parents = { "MapMarkerObj" },
	entity = "WayPoint",
}

DefineClass.ArrowTutorialBase = {
	__parents = { "AnimatedTextureObject" },
	enum_flags = { efSelectable = false, efShadow = false, efSunShadow = false },
	game_flags = { gofSpecialOrientMode = true, gofRealTimeAnim = true },
	orient_mode = "facing_vertical",
	entity = "ArrowTutorial",
}

function ArrowTutorialBase:Init()
	self:SetScale(g_CurrentDepositScale)
end

DefineClass.ArrowTutorial = {
	__parents = { "ArrowTutorialBase", "AutoAttachObject" },
}

function ShowTutorialArrow(where, class, entity)
	--uses:
	--ShowTutorialArrow(point)
	--ShowTutorialArrow(object)
	--ShowTutorialArrow("tutorial marker name")
	
	local position
	if type(where) == "string" then
		local marker = g_Tutorial.MapMarkers[where]
		position = marker and marker:GetPos()
	elseif IsValid(where) then
		if IsKindOf(where, "CObject") then
			local top_spot_idx = where:GetSpotBeginIndex("Top")
			position = where:GetSpotLoc(top_spot_idx)
		end
	elseif IsPoint(where) then
		position = where
	end
	assert(IsPoint(position), "No position for tutorial arrow")
	
	local arrow = PlaceObject(class or "ArrowTutorial")
	arrow:SetPos(position)
	if entity then
		arrow:ChangeEntity(entity)
	end
	return arrow
end

function RemoveAllTutorialArrows()
	ForEach{
		class = "ArrowTutorialBase",
		action = "delete",
	}
end

DefineClass.TutorialGhostObj = {
	__parents = { "SpawnFXObject", "AutoAttachObject" },
	class_flags = { cfConstructible = true, cfComponentCustomData = true },
}

function TutorialGhostObj:ChangeEntity(...)
	SpawnFXObject.ChangeEntity(self, ...)
	AutoAttachObjectsToShapeshifter(self)
	local function AddCustomData(obj)
		obj:AddCustomData()
		obj:ForEachAttach(AddCustomData)
	end
	AddCustomData(self)
	self:SetConstruction(0, 2, self:GetBBox())
end

function TutorialGhostObj:GetBBox()
	local bbox = self:GetEntityBBox()
	local attaches = self:GetAttaches()
	local i = 1
	while i <= #(attaches or "") do
		local attach = attaches[i]
		if attach:GetClassFlags(const.cfConstructible) ~= 0 and attach:GetEnumFlags(const.efVisible) ~= 0 then
			bbox = Extend(bbox, attach:GetEntityBBox())			
			table.append(attaches, attach:GetAttaches())
		end
		i = i + 1
	end
	return bbox + self:GetVisualPos()
end
	
function TutorialNextHint(id)
	if not g_Tutorial then return end
	if g_Tutorial.LastHint then
		HintDisable(g_Tutorial.LastHint)
	end
	g_Tutorial.LastHint = id
	return HintTrigger(id, true)
end

function WaitTutorialPopup(...)
	if g_Tutorial and g_Tutorial.LastHint then
		HintDisable(g_Tutorial.LastHint)
	end
	
	while true do
		local igi = GetInGameInterface()
		if igi and igi:GetVisible() then
			break
		end
		Sleep(100)
	end
	
	return WaitPopupNotification(...)	
end

function WaitTutorialPopupImmediate(...)
	if g_Tutorial and g_Tutorial.LastHint then
		HintDisable(g_Tutorial.LastHint)
	end
		
	return WaitPopupNotification(...)	
end

function PlaceGhost(entity, pos, angle, hex_align)
	assert(IsValidEntity(entity))
	angle = angle or 0
	local obj = PlaceObject("TutorialGhostObj")
	
	if hex_align then
		local q, r = WorldToHex(pos)
		pos = point(HexToWorld(q, r))
	end
	
	obj:SetPos(pos)
	obj:SetAngle(angle)
	obj:ChangeEntity(entity)	
	return obj
end

-- the following two waits will mostly work, assuming you dont receive multiple Msg in the same millisecond (e.g. alt+b)
function WaitConstruction(...)
	local waited = {...}
	while #waited > 0 do
		local ok, bld = WaitMsg("ConstructionComplete")
		for i = #waited, 1, -1 do
			if bld.template_name == waited[i] then
				table.remove(waited, i)
			end
		end
	end
end

function WaitConstructionSite(...)
	local waited = {...}
	while #waited > 0 do
		local ok, site = WaitMsg("ConstructionSitePlaced")
		for i = #waited, 1, -1 do
			if site.building_class == waited[i] then
				table.remove(waited, i)
			end
		end
	end
end

function WaitAnyConstructionSite(...)
	local waited = {...}
	while #waited > 0 do
		local ok, site = WaitMsg("ConstructionSitePlaced")
		for i = #waited, 1, -1 do
			if site.building_class == waited[i] then
				return 
			end
		end
	end
end

function WaitBuildMenuItemSelected(category, item, mode, view_pos)
	local gamepad = GetUIStyleGamepad()
	local arrow = TutorialUIArrow:new({
		AnchorType = "center-top",
		FindTarget = function() 
			if (mode=="place" or mode == "place-instant") and GetInGameInterfaceMode() == "construction" then
				if view_pos then 
					ViewObjectMars(view_pos)
				end	
				return false
			end	
			if not XDialogs.XBuildMenu then 
				if gamepad then 
					local dlg = GetXDialog("GamepadIGMenu")					
					return dlg and dlg.items and table.find_value(dlg.items, "name", "idBuild") or false
				end
				
				local dlg = GetHUD()
				return dlg and dlg.idBuild or false
			end
			local items = XDialogs.XBuildMenu.items
			local ctrl = table.find_value(items, "name", item)
			if ctrl then
				return ctrl
			end
			return XDialogs.XBuildMenu.idCategoryList[category]
		end,
	}, terminal.desktop)
	
	mode = mode or "construction"

	if mode=="place" then
		WaitConstructionSite(item)
	elseif mode == "place-instant" then
		WaitConstruction(item)
	elseif mode == "construction" then 
		while GetInGameInterfaceMode() ~= mode or CityConstruction[UICity].template ~= item do
			Sleep(50)
		end
	else
		while GetInGameInterfaceMode() ~= mode do
			Sleep(50)
		end
	end	
	if arrow and arrow.window_state ~= "destroying" then
		arrow:delete()
	end
end

function FindBuildMenuItem(item, category, subcategory)
	if not XDialogs.XBuildMenu then 
		if GetUIStyleGamepad() then 
			local dlg = GetXDialog("GamepadIGMenu")					
			return dlg and dlg.items and table.find_value(dlg.items, "name", "idBuild") or false
		end
		
		local dlg = GetHUD()
		return dlg and dlg.idBuild or false
	end
	if XDialogs.XBuildMenu:HasMember(item) then
		return XDialogs.XBuildMenu[item]
	end
	if subcategory and XDialogs.XBuildMenu:HasMember(subcategory) then
		return XDialogs.XBuildMenu[subcategory]
	end
	return XDialogs.XBuildMenu.idCategoryList[category]
end

function WaitBuildMenuStorageSelected(item, anchor_type)
	local gamepad = GetUIStyleGamepad()
	local arrow = TutorialUIArrow:new({
		AnchorType = anchor_type or "center-top",
		FindTarget = function() 
			if not XDialogs.XBuildMenu then 
				if gamepad then 
					local dlg = GetXDialog("GamepadIGMenu")					
					return dlg and dlg.items and table.find_value(dlg.items, "name", "idBuild") or false
				end
				
				local dlg = GetHUD()
				return dlg and dlg.idBuild or false
			end
			if XDialogs.XBuildMenu:HasMember(item) then
				return XDialogs.XBuildMenu[item]
			end
			if XDialogs.XBuildMenu:HasMember("Depots") then
				return XDialogs.XBuildMenu.Depots
			end
			return XDialogs.XBuildMenu.idCategoryList.Storages
		end,
	}, terminal.desktop)
	while GetInGameInterfaceMode() ~= "construction" or CityConstruction[UICity].template ~= item do
		Sleep(50)
	end
	if arrow and arrow.window_state ~= "destroying" then
		arrow:delete()
	end
end

function WaitInfopanelAction(class, action, condition_func)
	local find_target = function(self)
		if not IsKindOf(SelectedObj, class) then return false end
		if not XDialogs.Infopanel then return false end
		for i,button in ipairs(XDialogs.Infopanel.idMainButtons) do
			if button.OnPressParam == action then
				return button
			end
		end
		return false
	end
	WaitCustomUIButtonPressed(find_target, condition_func, "left-center")
end

function WaitResourceItemsChoice(name, condition_func, anchor_type)
	local find_target = function(self)
		if not XDialogs.ResourceItems then return false end
		for i,item in ipairs(XDialogs.ResourceItems.items) do
			if item.name == name then
				return item
			end
		end
		return false
	end
	WaitCustomUIButtonPressed(find_target, condition_func, anchor_type)
end

function WaitResearchQueued(tech_id, close, wait_any_tech)
	local tech_def = TechDef[tech_id]
	local tech_field = tech_def.group
	local field_order = UICity:UITechField(tech_field)
	local x = table.find(field_order, tech_id)
	local y = table.find(Presets.TechFieldPreset.Default, "id", tech_field)
	local focus_order = point(x, y)
	local arrow = TutorialUIArrow:new({
		AnchorType = "center-top",
		FindTarget = function(self)
			local dlg = XDialogs.ResearchDlg	
			if not dlg then
				self.AnchorType = "center-top"
				if GetUIStyleGamepad() then
					local gamepadmenu = XDialogs.GamepadIGMenu
					if not gamepadmenu then return false end
					if not gamepadmenu.items then return false end
					return table.find_value(gamepadmenu.items, "name", "idResearch") or false
				else
					return XDialogs.HUD and XDialogs.HUD.idResearch or false
				end
			end
			if table.find(UICity.research_queue, tech_id) and close then
				return dlg and dlg.idOverlayDlg.idToolbar.idclose or false
			end
			
			--TODO: should the arrow change it's anchor type at this point?
			local research_dlg = XDialogs.ResearchDlg
			--local tech = research_dlg:GetRelativeFocus(focus_order, "exact")
			local tech
			local fields = research_dlg.idArea.children
			for _, field in ipairs(fields) do
				if not tech and field:HasMember("idFieldTech") then
					for _, ctrl in ipairs(field.idFieldTech.children) do
						if ctrl.context.id == tech_id then
							tech = ctrl
							break
						end
					end
				end
			end
			
			self.ZOrder = research_dlg.ZOrder + 1
			return tech or false
		end,
	}, terminal.desktop)
	if wait_any_tech then
		local initial_cnt = #UICity.research_queue
		while true do
			WaitMsg("ResearchQueueChange")
			if initial_cnt ~= #UICity.research_queue then
				break
			end
		end
	else
		while true do
			WaitMsg("ResearchQueueChange")
			if table.find(UICity.research_queue, tech_id) then
				break
			end
		end
	end
	if close then
		while XDialogs.ResearchDlg do
			Sleep(200)
		end
	end
	if arrow and arrow.window_state ~= "destroying" then
		arrow:delete()
	end
end

function WaitHUDButtonPressed(button, condition_func)
	local find_target = function(self)
		if GetUIStyleGamepad() then
			local gamepadmenu = XDialogs.GamepadIGMenu
			if not gamepadmenu then return false end
			if not gamepadmenu.items then return false end
			return table.find_value(gamepadmenu.items, "name", button) or false
		else
			return XDialogs.HUD and XDialogs.HUD[button] or false
		end
	end
	WaitCustomUIButtonPressed(find_target, condition_func, "center-top")
end

function WaitUIButtonPressed(dialog, button, condition_func, anchor_type)
	local find_target = function(self)
		local dlg = XDialogs[dialog]
		local gamepad = GetUIStyleGamepad()
		if gamepad then 
			local dlg = GetXDialog("GamepadIGMenu")					
			return dlg and dlg.items and table.find_value(dlg.items, "name", button) or false
		end
		if not dlg then return false end
		return dlg[button] or false
	end
	WaitCustomUIButtonPressed(find_target, condition_func, anchor_type)
end

local function DefaultWaitCondition(arrow)
	return arrow.button_pressed
end

function WaitCustomUIButtonPressed(find_target_func, condition_func, anchor_type)
	condition_func = condition_func or DefaultWaitCondition
	local arrow = TutorialUIArrow:new({
		AnchorType = anchor_type or "center-top",
		FindTarget = find_target_func,
		OnAttachToTarget = function(self, target)
			if target:HasMember("idButton") then
				target = target.idButton
			end
			local old_OnPress = target.OnPress
			target.OnPress = function(...)
				self.button_pressed = true
				return old_OnPress(...)
			end
		end,
		button_pressed = false,
	}, terminal.desktop)
	while not condition_func(arrow) do
		Sleep(50)
	end
	if arrow and arrow.window_state ~= "destroying" then
		arrow:delete()
	end
end

function WaitObjectSelected(obj, no_ingame_arrow, no_pin_arrow)
	if SelectedObj == obj then
		return
	end
	
	local ingame_arrow, ui_arrow
	--ingame arrow
	if not no_ingame_arrow then
		local top_spot_idx = obj:GetSpotBeginIndex("Top")
		ingame_arrow = PlaceObject("ArrowTutorialBase")
		obj:Attach(ingame_arrow, top_spot_idx)
	end
	--ui arrow
	if not no_pin_arrow then
		ui_arrow = TutorialUIArrow:new({
			AnchorType = "center-top",
			FindTarget = function(self)
				local pins_dlg = XDialogs.PinsDlg
				if not pins_dlg then return false end
				for _,win in ipairs(pins_dlg) do
					if not win.Dock and win.context == obj then
						return win
					end
				end
				return false
			end,
		}, terminal.desktop)
	end

	--wait until selected
	while true do
		WaitMsg("SelectedObjChange")
		if SelectedObj == obj then
			break
		end
	end
	
	--clean up arrows
	if ingame_arrow then
		DoneObject(ingame_arrow)
	end
	if ui_arrow and ui_arrow.window_state ~= "destroying" then
		ui_arrow:delete()
	end
end

function WaitResourcesNearPoint(point, resource, amount, radius, ignore_classes)
	--set resource to something specific or set it to false for all resources

	radius = radius or 100*guim
	local total = 0
	local query_stockpiles, query_drones
	
	if resource then --specific resource given
		query_stockpiles = {
			class = "ResourceStockpileBase",
			area = point,
			arearadius = radius,
			exec = function(pile, resource, getter_name, ignore_classes)
				if IsKindOfClasses(pile, ignore_classes) then return end
				if resource == "Fuel" and IsKindOf(pile, "SupplyRocket") then
					local extra = pile.unload_fuel_request and pile.unload_fuel_request:GetActualAmount() or 0	
					local current = (pile.launch_fuel - pile.refuel_request:GetActualAmount() + extra)
					total = total + current
				elseif pile:HasMember(getter_name) then
					total = total + pile[getter_name](pile)
				elseif type(pile.stockpiled_amount) == "table" then
					total = total + (pile.stockpiled_amount[resource] or 0)
				else
					total = total + (pile.stockpiled_amount or 0)
				end
			end,
		}
		query_drones = {
			class = "Drone",
			area = point,
			arearadius = radius,
			exec = function(drone, resource, getter_name, ignore_classes)
				if IsKindOfClasses(drone, ignore_classes) then return end
				if drone.resource == resource then
					total = total + drone.amount
				end
			end,
		}
	else --no specific resource - gather all resources
		query_stockpiles = {
			class = "ResourceStockpileBase",
			area = point,
			arearadius = radius,
			exec = function(pile, resource, getter_name, ignore_classes)
				if IsKindOfClasses(pile, ignore_classes) then return end
				if IsKindOf(pile, "SupplyRocket") then
					local extra = pile.unload_fuel_request and pile.unload_fuel_request:GetActualAmount() or 0	
					local current = (pile.launch_fuel - pile.refuel_request:GetActualAmount() + extra)
					total = total + current
				elseif type(pile.stockpiled_amount) == "table" then
					for res, amount in pairs(stockpiled_amount) do
						total = total + amount
					end
				else
					total = total + (pile.stockpiled_amount or 0)
				end
			end,
		}
		query_drones = {
			class = "Drone",
			area = point,
			arearadius = radius,
			exec = function(drone, resource, getter_name, ignore_classes)
				if IsKindOfClasses(drone, ignore_classes) then return end
				total = total + drone.amount
			end,
		}
	end
	
	ignore_classes = ignore_classes or { }
	local getter_name = "GetStored_" .. (resource or "")
	while true do
		total = 0
		ForEach(query_stockpiles, resource, getter_name, ignore_classes)
		ForEach(query_drones, resource, getter_name, ignore_classes)
		--print("currently", total, resource, "; expecting", amount)
		if total >= amount then
			break
		end
		Sleep(1000)
	end
end

function HasPoweredBuilding(label)
	for _, bld in ipairs(UICity.labels[label] or empty_table) do
		if bld:HasPower() then
			return true
		end
	end
end

function IsBuildingInRange(bld, obj, range)
	local shape = GetEntityCombinedShape(bld:GetEntity())
	local pos = bld:GetPos()
	local angle = bld:GetAngle()
	local target = obj
	if IsValid(obj) then
		target = obj:GetPos()
	end
	
	target = point(HexToWorld(WorldToHex(target)))
	
	for i = 1, #shape do
		local q, r = shape[i]:xy()
		local x, y = HexToWorld(q, r)
		local pt = pos + Rotate(point(x, y), angle)
		if HexAxialDistance(pt, target) <= range then
			return true
		end
	end
end

function GetSector(id)
	for i = 1, const.SectorCount do
		local row = g_MapSectors[i]
		for j = 1, const.SectorCount do
			local sector = row[j]
			if sector.id == id then
				return sector
			end
		end
	end
end