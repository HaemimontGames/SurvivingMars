-- public interface

-- Controls whethere to show notifications on this map from now on
-- please check if this is true in your code, around any calls to hint functions
if FirstLoad then
	HintsEnabled = false
end

-- call this when the initial condition occurs; the system will wait for hint.realtime(/gametime)_delay seconds and 
-- add a OnScreenNotification
-- the id must match a BaseHint child class and a data instance in the OnScreenNotification property preset table
-- safe to call multiple times, but 
function HintTrigger(id)
	assert(#Cities == 1)
	assert(HintsEnabled) -- please check for this outside
	assert(g_Classes[id])
	
	if g_ActiveHints[id] then return end
	local hint_class = g_Classes[id]
	
	if GetUIStyleGamepad() then
		if hint_class.ui_style == "mouse" then
			--ui_style == "mouse", but player is using the gamepad
			return
		end
	elseif hint_class.ui_style == "gamepad" then
		--ui_style == "gamepad" but player is not using a gamepad
		return
	end

	local hint = hint_class:new()
	g_ActiveHints[id] = hint
	
	hint_print("trigger", id)
	
	local delay, threadfn
	if hint.realtime_delay > 0 then
		delay = hint.realtime_delay
		threadfn = CreateMapRealTimeThread
	elseif hint.gametime_delay > 0 then
		delay = hint.gametime_delay
		threadfn = CreateGameTimeThread
	else
		delay = 0
		threadfn = CreateGameTimeThread
	end
	
	threadfn(function(hint, delay)
		Sleep(delay * 1000)
		if hint:IsValid() then
			AddOnScreenHint(hint)
			while HintsEnabled and hint:IsValid() do
				Sleep(1000)
			end
			RemoveOnScreenHint(hint)
		end
	end, hint, delay)
	
	if hint.auto_disable > 0 then
		CreateMapRealTimeThread(function(hint, delay)
			Sleep(delay*1000)
			HintDisable(hint.class)
		end, hint, hint.auto_disable)
	end
	
	return hint
end

--Used to dynamically show & hide hints from the on-screen hint dialog (mantis:0130507)
--Showing a hint automatically triggers it, if it's not triggered already
--Hiding a hint does not disable it - hints are disabled only using HintDisable() (also see the X button in hints dlg)
function ContextAwareHintShow(id, visible)
	local hint = g_ActiveHints[id]
	
	if visible then
		local hint = g_ActiveHints[id]
		if not hint then
			--this will show the hint internally
			return HintTrigger(id)
		end
		
		if hint.disabled then
			return hint
		end
		
		assert(hint.context_aware)
		AddOnScreenHint(hint)
	else
		if hint then
			RemoveOnScreenHint(hint)
		end
	end

	return hint
end

--Hides all context aware hints
function ContextAwareHintHideAll()
	local context_aware_hints_set = {}
	for i,hint_id in ipairs(g_ShownOnScreenHints) do
		local hint = g_ActiveHints[hint_id]
		if hint.context_aware then
			context_aware_hints_set[hint_id] = true
		end
	end
	
	RemoveMultipleOnScreenHints(context_aware_hints_set)
end

-- call this when the hint should no longer be displayed
function HintDisable(id)
	local hint = g_ActiveHints[id] or BaseHint:new{}
	g_ActiveHints[id] = hint
	
	if hint.disabled then
		return
	end

	hint.disabled = true
	RemoveOnScreenHint(hint)	
	
	hint_print("disable", id)
end

function HintsGetHighlightedID(dialog)
	local hints_dlg = GetDialog("OnScreenHintDlg")
	if not hints_dlg or not hints_dlg.idHintPad:GetVisible() then return end
	
	local current_hint_id = hints_dlg:CurrentHintId()
	if not current_hint_id then return end
	
	local hint = g_ActiveHints[current_hint_id]
	if not hint then return end

	local highlights_this_dialog
	if type(hint.highlight_dialog) == "table" then
		highlights_this_dialog = table.find(hint.highlight_dialog, dialog)
	else
		highlights_this_dialog = hint.highlight_dialog == dialog
	end
	
	if highlights_this_dialog then
		return hint.highlight_element
	end
end

-- end of public interface

function PeriodicHintChecks()
	while HintsEnabled do
		--HintLifeSupport disable condition check
		local lifesupport = g_ActiveHints["HintLifeSupport"]
		if lifesupport and lifesupport:IsValid() then
			local dome = lifesupport.problematic_dome
			if not dome or (dome:HasAir() and dome:HasWater()) then
				HintDisable("HintLifeSupport")
			end
		end
		
		--HintPower disable condition check
		local power = g_ActiveHints["HintPower"]
		if power and power:IsValid() then
			local all_supplied = true
			local e_grids = UICity.electricity
			for i=1,#e_grids do
				if not e_grids[i].all_consumers_supplied then
					all_supplied = false
					break
				end
			end
			if all_supplied then
				HintDisable("HintPower")
			end
		end
		
		--SuggestConcreteExtractor trigger condition
		local concrete_extractor = g_ActiveHints["HintSuggestConcreteExtractor"]
		if not concrete_extractor and UICity.day >= 3 then
			local terrain_deposits = UICity.labels.TerrainDeposit or empty_table
			local has_deposit
			for i=1,#terrain_deposits do
				if IsKindOf(terrain_deposits[i], "TerrainDepositConcrete") then
					HintTrigger("HintSuggestConcreteExtractor")
					break
				end
			end
		end
		
		Sleep(5000)
	end
end

function SetHintNotificationsEnabled(enabled)
	enabled = enabled or false
	if GetMap() ~= "" and HintsEnabled ~= enabled then
		if enabled then
			CreateGameTimeThread(PeriodicHintChecks)
		end
		HintsEnabled = enabled
		AccountStorage.Options.HintsEnabled = enabled
		SaveAccountStorage()
	end
end

hint_print = CreatePrint{
	-- "HINT",
}

-- start of map setup
function OnMsg.NewMapLoaded()
	if CurrentMap == "PreGame" then return end
	
	CreateGameTimeThread( function()
		Sleep(1)
		if not mapdata.GameLogic or 
			mapdata.DisableHints or
			editor.Active == 1 
		then
			SetHintNotificationsEnabled(false)
			return
		end
		
		HintsEnabled = (CurrentMap ~= "Mod") and (not not AccountStorage.Options.HintsEnabled)
		if HintsEnabled then
			Sleep(1000)
			HintTrigger("HintGameStart")
			CreateGameTimeThread(PeriodicHintChecks)
		end
	end)
end

-- hint base class

DefineClass.BaseHint = {
	__parents = { "InitDone" },
	realtime_delay = 0, -- in seconds; wait this long after triggering before adding an onscreen notification
	gametime_delay = 0, -- game time delay in seconds
	auto_disable = 0,   -- real time in seconds to wait before auto-disabling itself
	ui_style = "both",
	context_aware = false,
	
	disabled = false,
	highlight_dialog = false,  --set this to the dialog class
	highlight_element = false, --for HUD use UI element ID, for BuildMenu use Building template 'name'
}

function BaseHint:IsValid()
	return not self.disabled
end

GlobalVar("g_ActiveHints", {})

-- actual hint classes

DefineClass.HintGameStart = {
	__parents = { "BaseHint" },
	highlight_dialog = { "HUD", "GamepadIGMenu" },
	highlight_element = "idOverview",
}

DefineClass.HintCameraControls = {
	__parents = { "BaseHint" },
	pos = false,
	lookat = false,
	
	dismiss_delay = 5000,
	invalidate_time = -1,
}

function HintCameraControls:Init()
	CreateGameTimeThread(function(this)
		Sleep(OverviewModeDialog.camera_transition_time + 100)
		this.pos = cameraRTS.GetPos()
		this.lookat = cameraRTS.GetLookAt()
	end, self)
end

function HintCameraControls:IsValid()
	if not self.pos or not self.lookat then
		--not initialised yet
		return true
	end
	
	if self.invalidate_time == -1 then
		--This hint is removed only when zooming or rotating the camera
		local lookat_dist = self.lookat:Dist(cameraRTS.GetLookAt())
		local pos_dist = self.pos:Dist(cameraRTS.GetPos())
		--There are little fluctuations that happen when moving around
		if abs(lookat_dist - pos_dist) > guim then
			self.invalidate_time = GameTime() + self.dismiss_delay
		end
		
		return true
	end
	
	return
		self.invalidate_time == -1 or
		self.invalidate_time > GameTime()
end

function OnMsg.SelectedObjChange(obj, prev)
	if HintsEnabled then
		--hide all previous context-aware hints
		--    issues arrise when switching selection from one to another obj
		--    thus we need to clean up everything and later only show what is needed
		ContextAwareHintHideAll()
		
		if IsKindOfClasses(obj, "SurfaceDepositGroup") then
			ContextAwareHintShow("HintSurfaceDeposit", true)
		elseif IsKindOf(obj, "SubsurfaceDepositWater") then
			if obj.depth_layer == 1 then
				ContextAwareHintShow("HintUndergroundWater", true)
			end
		elseif IsKindOf(obj, "SubsurfaceDepositMetals") then
			if obj.depth_layer == 1 then
				ContextAwareHintShow("HintUndergroundMetals", true)
			end
		elseif IsKindOf(obj, "SubsurfaceDepositPreciousMetals") then
			if obj.depth_layer == 1 then
				ContextAwareHintShow("HintUndergroundPreciousMetals", true)
			end
		elseif IsKindOf(obj, "TerrainDepositConcrete") then
			if UICity.labels.SupplyRocket and table.find(UICity.labels.SupplyRocket, "landed", true) then
				HintTrigger("HintSuggestConcreteExtractor")
			end
		elseif IsKindOf(obj, "BaseRover") and obj.battery_current < (obj.battery_max/10) then
			HintTrigger("HintRoverBatteries")
		elseif IsKindOf(obj, "RCRover") then
			ContextAwareHintShow("HintRover", true)
		elseif IsKindOf(obj, "RCTransport") then
			ContextAwareHintShow("HintTransport", true)
		elseif IsKindOf(obj, "ExplorerRover") then
			ContextAwareHintShow("HintExplorer", true)
		elseif IsKindOf(obj, "Drone") then
			if obj.battery <= 0 then
				ContextAwareHintShow("HintDroneBatteries", true)
			else
				ContextAwareHintShow("HintDrones", true)
			end
		elseif IsKindOf(obj, "SubsurfaceAnomaly") then
			ContextAwareHintShow("HintAnomaly", true)
		elseif IsKindOf(obj, "Building") then
			if obj.is_malfunctioned then
				ContextAwareHintShow("HintMalfunctions", true)
			elseif IsKindOf(obj, "ElectricityConsumer") and not obj:HasPower() then
				if not (IsKindOf(obj, "ShiftsBuilding") and obj:IsClosedShift(obj.current_shift)) then
					ContextAwareHintShow("HintPower", true)
				end
			elseif IsKindOf(obj, "Dome") then
				if not obj:HasWater() and not obj:HasAir() then
					local hint = ContextAwareHintShow("HintLifeSupport", true)
					if hint then
						hint.problematic_dome = obj
					end
				end
			else
				for i = 1, 3 do
					local id = obj:GetUpgradeID(i) or ""
					if id ~= "" and UICity:IsUpgradeUnlocked(id) then
						ContextAwareHintShow("HintBuildingUpgrade", true)
						break
					end
				end
			end
		elseif IsKindOf(obj, "Colonist") then
			ContextAwareHintShow("HintNeeds", true)
		end
	end
end

DefineClass.HintRocket = {
	__parents = { "BaseHint" },
}

DefineClass.HintBuildingConstruction = {
	__parents = { "BaseHint" },
	highlight_dialog = "XBuildMenu",
	highlight_element = "SolarPanelBig",
}

DefineClass.HintProbes = {
	__parents = { "BaseHint" },
}

DefineClass.HintSurfaceDeposit = {
	__parents = { "BaseHint" },
	auto_disable = 120, --HintSurfaceDeposit auto disabled
	context_aware = true,
}

DefineClass.HintSuggestConcreteExtractor = {
	__parents = { "BaseHint" },
	highlight_dialog = "XBuildMenu",
	highlight_element = "RegolithExtractor",
}

DefineClass.HintUndergroundWater = {
	__parents = { "BaseHint" },
	highlight_dialog = "XBuildMenu",
	highlight_element = "WaterExtractor",
	context_aware = true,
}

DefineClass.HintUndergroundMetals = {
	__parents = { "BaseHint" },
	
	auto_disable = 120, --HintUndergroundMetals auto disabled
	context_aware = true,
}

DefineClass.HintUndergroundPreciousMetals = {
	__parents = { "BaseHint" },
	
	auto_disable = 120, --HintUndergroundPreciousMetals auto disabled
	context_aware = true,
}

DefineClass.HintAnomaly = {
	__parents = { "BaseHint" },
	context_aware = true,
}

DefineClass.HintRover = {
	__parents = { "BaseHint" },
	context_aware = true,
}

DefineClass.HintVehicleOrders = {
	__parents = { "BaseHint" },
}

DefineClass.HintTransport = {
	__parents = { "BaseHint" },
	context_aware = true,
}

DefineClass.HintPower = {
	__parents = { "BaseHint" },
	context_aware = true,
	highlight_dialog = "XBuildMenu",
	highlight_element = "Power",
}

DefineClass.HintStorageDepot = {
	__parents = { "BaseHint" },
	gametime_delay = 12*const.HourDuration / 1000,
	highlight_dialog = "XBuildMenu",
	highlight_element = "UniversalStorageDepot",
}

DefineClass.HintMalfunctions = {
	__parents = { "BaseHint" },
	context_aware = true,
}

DefineClass.HintDroneBatteries = {
	__parents = { "BaseHint" },
	context_aware = true,
}

DefineClass.HintSuggestSensorTower = {
	__parents = { "BaseHint" },
	gametime_delay = 36*const.HourDuration / 1000,
	highlight_dialog = "XBuildMenu",
	highlight_element = "SensorTower",
}

DefineClass.HintScanningSectors = {
	__parents = { "BaseHint" },
	highlight_dialog = { "HUD", "GamepadIGMenu" },
	highlight_element = "idOverview",
}

DefineClass.HintSuggestDroneHub = {
	__parents = { "BaseHint" },
	gametime_delay = 8*const.HourDuration / 1000,
	highlight_dialog = "XBuildMenu",
	highlight_element = "DroneHub",
}

DefineClass.HintDustStorm = {
	__parents = { "BaseHint" },
}

function OnMsg.DustStorm()
	if HintsEnabled then
		HintTrigger("HintDustStorm")
	end
end

function OnMsg.DustStormEnded()
	HintDisable("HintDustStorm")
end

DefineClass.HintColdWave = {
	__parents = { "BaseHint" },
}

function OnMsg.ColdWave()
	if HintsEnabled then
		HintTrigger("HintColdWave")
	end
end

function OnMsg.ColdWaveEnded()
	HintDisable("HintColdWave")
end

DefineClass.HintWasteRock = {
	__parents = { "BaseHint" },
	gametime_delay = 5*const.HourDuration/1000,
	highlight_dialog = "XBuildMenu",
	highlight_element = "WasteRockDumpBig",
}

DefineClass.HintResupply = {
	__parents = { "BaseHint" },
	gametime_delay = 4*const.DayDuration/1000,
	highlight_dialog = { "HUD", "GamepadIGMenu" },
	highlight_element = "idResupply",
}

DefineClass.HintResupplyUI = {
	__parents = { "BaseHint" },
	
	realtime_delay = 1, --hack to trigger this hint while the gametime is paused
	context_aware = true,
}

DefineClass.HintPriority = {
	__parents = { "BaseHint" },
	gametime_delay = 2*const.DayDuration/1000,
}

DefineClass.HintWaterProduction = {
	__parents = { "BaseHint" },
	gametime_delay = 2*const.DayDuration/1000,
	highlight_dialog = "XBuildMenu",
	highlight_element = "Life-Support",
}

DefineClass.HintAirProduction = {
	__parents = { "BaseHint" },
	gametime_delay = 12*const.HourDuration / 1000,
	highlight_dialog = "XBuildMenu",
	highlight_element = "Life-Support",
}

DefineClass.HintDomePlacedTooEarly = {
	__parents = { "BaseHint" },
}

DefineClass.HintDomes = {
	__parents = { "BaseHint" },
	gametime_delay = 12*const.HourDuration / 1000,
	highlight_dialog = "XBuildMenu",
	highlight_element = "DomeBasic",
}

DefineClass.HintLifeSupport = {
	__parents = { "BaseHint" },
	problematic_dome = false,
	context_aware = true,
	highlight_dialog = "XBuildMenu",
	highlight_element = "Pipes",
}

DefineClass.HintSuggestLivingQuarters = {
	__parents = { "BaseHint" },
	highlight_dialog = "XBuildMenu",
	highlight_element = "LivingQuarters",
}

DefineClass.HintPassengerRockets = {
	__parents = { "BaseHint" },
	gametime_delay = 6*const.HourDuration/1000,
	highlight_dialog = { "HUD", "GamepadIGMenu" },
	highlight_element = "idResupply",
}

DefineClass.HintNeeds = {
	__parents = { "BaseHint" },
	context_aware = true,
}

DefineClass.HintSuggestResearchLab = {
	__parents = { "BaseHint" },
	highlight_dialog = "XBuildMenu",
	highlight_element = "ResearchLab",
}

DefineClass.HintResearchAvailable = {
	__parents = { "BaseHint" },
	highlight_dialog = { "HUD", "GamepadIGMenu" },
	highlight_element = "idResearch",
	
	gametime_delay = 32*const.HourDuration / 1000,
}

DefineClass.HintSuggestHydroponicFarm = {
	__parents = { "BaseHint" },
	highlight_dialog = "XBuildMenu",
	highlight_element = "HydrophonicFarm",
}

DefineClass.HintGameSpeed = {
	__parents = { "BaseHint" },
	realtime_delay = 3*60, --10 minutes
	highlight_dialog = "HUD",
	highlight_element = "idFast",
}

DefineClass.HintRefuelingTheRocket = {
	__parents = { "BaseHint" },
	
	gametime_delay = 8*const.HourDuration / 1000,
	trigger_after_sol = 10,
	
	trigger_thread = false,
}

function HintRefuelingTheRocket:TriggerLater()
	if self.disabled or IsValidThread(self.trigger_thread) then
		return
	end
	
	--this function is used to satisfy the special trigger requirements for this hint (note in 0126750)
	-- 1) triggered no sooner than sol 10 (trigger_after_sol)
	-- 2) triggered at least after landing your last available rocket
	
	--minus 1 because we don't start at Sol 0, but at Sol 1
	local time_to_trigger = ((self.trigger_after_sol - 1)*const.DayDuration - GameTime()) - self.gametime_delay
	if time_to_trigger > 0 then
		self.trigger_thread = CreateGameTimeThread(
		function(delay)
			Sleep(delay)
			HintTrigger("HintRefuelingTheRocket")
		end, time_to_trigger)
	else
		HintTrigger("HintRefuelingTheRocket")
	end
end

DefineClass.HintComfortStatAndServices = {
	__parents = { "BaseHint" },
	highlight_dialog = "XBuildMenu",
	highlight_element = "Dome Services",
	
	gametime_delay = 8*const.HourDuration / 1000,
}

DefineClass.HintDecorations = {
	__parents = { "BaseHint" },
	highlight_dialog = "XBuildMenu",
	highlight_element = "Decorations",
	
	gametime_delay = 3*const.DayDuration / 1000,
}

DefineClass.HintHealthcare = {
	__parents = { "BaseHint" },
	highlight_dialog = "XBuildMenu",
	highlight_element = "Dome Services",
}

DefineClass.HintExplorer = {
	__parents = { "BaseHint" },
	
	context_aware = true,
}

function TFormat.UnitMoveControl(condition, text1, text2)
	if MoveUnitsOnRightClick() then
		return T{7366, "<right_click>"}
	else
		return T{7367, "<em>Ctrl + <left_click></em>"}
	end
end

DefineClass.HintDrones = {
	__parents = { "BaseHint" },
	
	context_aware = true,
}

DefineClass.HintRoverBatteries = {
	__parents = { "BaseHint" },
}

DefineClass.HintEarthsick = {
	__parents = { "BaseHint" },
	
	auto_disable = 120, --HintEarthsick auto disabled
}

DefineClass.HintRenegade = {
	__parents = { "BaseHint" },
	
	auto_disable = 120, --HintRenegade auto disabled
}

DefineClass.HintResearch = {
	__parents = { "BaseHint" },
	
	realtime_delay = 1, --hack to trigger this hint while the gametime is paused
	context_aware = true,
}

DefineClass.HintPassengerRocket = {
	__parents = { "BaseHint" },
	
	realtime_delay = 1, --hack to trigger this hint while the gametime is paused
	context_aware = true,
}

DefineClass.HintBuildingUpgrade = {
	__parents = { "BaseHint" },
	
	context_aware = true,
}
