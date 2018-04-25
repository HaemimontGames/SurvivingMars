DefineClass.MapSettings_DustStorm =
{
	__parents = { "MapSettings" },
	properties =
	{
		{ id = "name",				name = "Name",                		editor = "text",    default = "dust" },
		{ id = "seasonal",			name = "Seasonal",           			editor = "bool",    default = false, object_update = true },
		{ id = "seasonal_sols",		name = "Seasonal Sols",					editor = "number",	default = 10, no_edit = function(self) return not self.seasonal end },
		{ id = "target_dust",		name = "Dust on Targets(per sec)",	editor = "number",	default = 50 },
		{ id = "solar_penalty",		name = "Solar Penalty(percents)",		editor = "number",	default = 60, min = 0, max = 100 },
		{ id = "min_duration",		name = "Min Duration",					editor = "number",	default = 25 * const.HourDuration, scale = const.HourDuration, help = "In Hours" },
		{ id = "max_duration",		name = "Max Duration",					editor = "number",	default = 75 * const.HourDuration, scale = const.HourDuration, help = "In Hours" },
		{ id = "electrostatic",		name = "Electrostatic Storm Chance",	editor = "number",	default = 3, min = 0, max = 100 },
		{ id = "great",				name = "Great Storm Chance",			editor = "number",	default = 3, min = 0, max = 100 },
		{ id = "strike_interval",	name = "Strikes Interval"		,		editor = "number",	default = 3 * 1000, scale = 1000, category = "Electrostatic Storm", help = "In Seconds"},
		{ id = "strike_random",		name = "Strikes Randomize",			editor = "number",	default = 5 * 1000, scale = 1000, category = "Electrostatic Storm", help = "In Seconds" },
		{ id = "strike_radius",		name = "Strikes Radius",				editor = "number",	default = 20 * guim, scale = guim, category = "Electrostatic Storm", help = "In Meters" },
		{ id = "strike_discharge",	name = "Strikes Discharge",			editor = "number",	default = 100, category = "Electrostatic Storm" },
		{ id = "strike_suspend",	name = "Strikes Suspend",				editor = "number",	default = 240 * 1000, scale = 1000, category = "Electrostatic Storm", help = "In Seconds" },
	},

	noon = "DustStormNoon",
	dusk = "DustStormDusk",
	evening = "DustStormEvening",
	night = "DustStorNight",
	dawn = "DustStormDawn",
	morning = "DustStormMorning",
}

GlobalVar("g_DustStorm", false)
GlobalVar("g_DustStormType", false)
GlobalVar("g_DustStormStopped", false)

local hour_duration = const.HourDuration
local day_duration = const.DayDuration

local function GetDustStormDescr()
	if mapdata.MapSettings_DustStorm == "disabled" then
		return
	end
	
	local data = DataInstances.MapSettings_DustStorm
	local dust_storm = data[mapdata.MapSettings_DustStorm] or data["DustStorm_VeryLow"]
	
	return dust_storm and not dust_storm.forbidden and dust_storm
end

local function apply_dust(label, dust)
	if not label then
		return
	end
	for i = 1, #label do
		local obj = label[i]
		if not IsObjInDome(obj) then
			obj:AddDust(dust)
		end
	end
end

local function apply_dust_elements(grids, dust)
	for i = 1, #grids do
		local grid = grids[i]
		for _, element in ipairs(grid.elements) do
			local obj = element.building
			if obj:IsKindOf("DustGridElement") then
				obj:AddDust(dust)
			end
		end
	end
end

local suspend_reason = "SuspendedDustStorm"
local suspend_labels = const.DustStormSuspendBuildings
if FirstLoad then
	g_SuspendLabels = false
end
function OnMsg.DataLoaded()
	g_SuspendLabels = {}
	for _, bld in ipairs(DataInstances.BuildingTemplate) do
		if bld.suspend_on_dust_storm then
			g_SuspendLabels[#g_SuspendLabels + 1] = bld.name
		end
	end
end

local IsKindOf = IsKindOf

function FuelExplosion(obj)
	PlayFX("FuelExplosion", "start", obj)
	AddOnScreenNotification("FuelDestroyed", nil, {}, {obj})
	local in_dome = IsObjInDome(obj)
	ForEach{
		classes = "Colonist",
		area = obj,
		arearadius = 30*guim,
		exec = function(colonist)
			if not colonist:IsDying() and in_dome == IsObjInDome(colonist) then
				colonist:SetCommand("Die", "fuel explosion")
			end
		end,
	}
end

function StartDustStorm(storm_type, dust_storm)
	g_DustStorm = { type = storm_type, descr = dust_storm }
	local duration = UICity:Random(dust_storm.min_duration, dust_storm.max_duration)
	Msg("DustStorm", duration)
	RemoveDisasterNotifications()
	local preset = storm_type .. "DustStormDuration"
	AddDisasterNotification(preset, {start_time = GameTime(), expiration = duration})
	local target_dust = g_DustStorm.type == "great" and 2 * dust_storm.target_dust or dust_storm.target_dust
	local time = 0
	local next_strike = GameTime() + dust_storm.strike_interval + UICity:Random(dust_storm.strike_random)
	if g_DustStorm.type == "electrostatic" then
		PlayFX("ElectrostaticStorm", "start")
	elseif g_DustStorm.type == "great" then
		PlayFX("GreatStorm", "start")
	else
		PlayFX("DustStorm", "start")
	end
	g_DustStormStopped = false
	while not g_DustStormStopped and duration > 0 do
		local buildings = UICity.labels.Building or {}
		apply_dust(buildings, target_dust)
		apply_dust(UICity.labels.Drone, target_dust)
		apply_dust(UICity.labels.Rover, target_dust)
		apply_dust(UICity.labels.Dome, target_dust)
		if UICity.water then
			apply_dust_elements(UICity.water, target_dust)
		end
		if UICity.electricity then
			apply_dust_elements(UICity.electricity, target_dust)
		end
		if g_DustStorm.type == "electrostatic" and GameTime() > next_strike then
			next_strike = GameTime() + dust_storm.strike_interval + UICity:Random(dust_storm.strike_random)
			local strike_pos = GetRandomPassable()
			local strike_radius = dust_storm.strike_radius
			PlayFX("ElectrostaticStormArea", "start", nil, nil, strike_pos)
			PlayFX("ElectrostaticStorm", "hit-moment" .. tostring(1 + UICity:Random(4)), nil, nil, strike_pos)
			local fuel_explosions
			ForEach{
				classes = "Colonist,Building,Drone,RCRover,ResourceStockpileBase",
				area = strike_pos,
				arearadius = strike_radius + GetEntityMaxSurfacesRadius(),
				exec = function(obj)
					if not obj:IsCloser2D(strike_pos, strike_radius) or IsObjInDome(obj) then
						return
					end
					PlayFX("ElectrostaticStormObject", "start", nil, obj, strike_pos)
					if IsKindOf(obj, "Drone") then
						obj:UseBattery(obj.battery)
					elseif IsKindOf(obj, "RCRover") then
						obj:SetCommand("Malfunction")
					elseif IsKindOf(obj, "UniversalStorageDepot") then
						if not IsKindOf(obj, "SupplyRocket") and obj:GetStoredAmount("Fuel") > 0 then
							obj:CheatEmpty()
							fuel_explosions = fuel_explosions or {}
							fuel_explosions[#fuel_explosions + 1] = obj
						end
					elseif IsKindOf(obj, "ResourceStockpileBase") then
						local amount = obj:GetStoredAmount()
						if obj.resource == "Fuel" and amount > 0 then
							obj:AddResourceAmount(-amount, true)
							fuel_explosions = fuel_explosions or {}
							fuel_explosions[#fuel_explosions + 1] = obj
						end
					elseif IsKindOf(obj, "Dome") then
						for i = 1, #obj.labels.Buildings do
							local bld = obj.labels.Buildings[i]
							if IsKindOf(bld, "ElectricityStorage") then
								bld.electricity.current_storage = Max(0, bld.electricity.current_storage - dust_storm.strike_discharge)
							end
						end
					elseif IsKindOf(obj, "Building") then
						obj:SetSuspended(true, "Suspended", dust_storm.strike_suspend)
					elseif IsKindOf(obj, "Citizen") then
						if not self:IsDying() then
							obj:SetCommand("Die", "lighting strike")
						end
					end
				end,
			}
			for i=1,#(fuel_explosions or "") do
				FuelExplosion(fuel_explosions[i])
			end
		end
		if time > hour_duration then
			for _, label in ipairs(g_SuspendLabels or suspend_labels) do
				for _, bld in ipairs(UICity.labels[label] or empty_table) do
					if not bld.suspended then
						bld:SetSuspended(true, suspend_reason)
					end
				end
			end
		end
		local delta = Min(duration, 1000)
		Sleep(delta)
		time = time + delta
		duration = duration - delta
	end
	if g_DustStorm.type == "electrostatic" then
		PlayFX("ElectrostaticStorm", "end")
	elseif g_DustStorm.type == "great" then
		PlayFX("GreatStorm", "end")
	else
		PlayFX("DustStorm", "end")
	end
	g_DustStorm = false
	RemoveOnScreenNotification(preset)
	Msg("DustStormEnded")
end

function OnMsg.DustStormEnded()
	local buildings = UICity.labels.Suspended or ""
	for i = #buildings, 1, -1 do
		buildings[i]:SetSuspended(false, suspend_reason)
	end
end

GlobalGameTimeThread("DustStorm", function()
	local dust_storm = GetDustStormDescr()
	if not dust_storm then
		return
	end
	
	-- wait a few sols
	local wait_time = 0
	if not dust_storm.seasonal then
		wait_time = dust_storm.birth_hour + UICity:Random(dust_storm.spawntime_random)
	end
	
	local first = true
	while true do
		-- find wait time and next storm type
		if dust_storm.seasonal then
			wait_time = wait_time + dust_storm.seasonal_sols * day_duration
		else
			if not first then
				wait_time = wait_time + UICity:Random(dust_storm.spawntime, dust_storm.spawntime_random)
			end
		end
		if not g_DustStormType then
			local rand = UICity:Random(101)
			if rand < dust_storm.electrostatic then
				g_DustStormType = "electrostatic"
			elseif rand < dust_storm.electrostatic + dust_storm.great then
				g_DustStormType = "great"
			else	
				g_DustStormType = "normal"
			end
		end
		
		-- wait and show the notification
		local start_time = GameTime()
		local last_check_time = GameTime()
		while IsDisasterPredicted() or IsDisasterActive() or (GameTime() - start_time < wait_time) do
			local dt = GameTime() - last_check_time
			last_check_time = GameTime()
			if IsDisasterPredicted() or IsDisasterActive() then
				wait_time = wait_time + dt
			else
				local warn_time = GetDisasterWarningTime(dust_storm)
				if GameTime() - start_time > wait_time - warn_time then
					AddDisasterNotification(g_DustStormType .. "DustStorm", {start_time = GameTime(), expiration = warn_time})
					WaitMsg("TriggerDustStorm", wait_time - (GameTime() - start_time))
					while IsDisasterActive() do
						WaitMsg("TriggerDustStorm", 5000)
					end
					break
				end
			end
			local forced = WaitMsg("TriggerDustStorm", 5000)
			if forced then
				break
			end
		end
		first = false
		wait_time = 0
		local next_storm = g_DustStormType
		g_DustStormType = false
		StartDustStorm(next_storm, dust_storm)
	end
end)

function CheatDustStorm(storm_type)
	if IsDisasterActive() then
		return
	end
	if GetDustStormDescr() then
		g_DustStormType = storm_type
		Msg("TriggerDustStorm")
	else
		CreateGameTimeThread(function()
			local data = DataInstances.MapSettings_DustStorm
			StartDustStorm(storm_type, data[mapdata.MapSettings_DustStorm] or data["DustStorm_VeryLow"])
		end)
	end
end

function StopDustStorm()
	g_DustStormStopped = true
end