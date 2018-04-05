DefineClass.MapSettings_ColdWave =
{
	__parents = { "MapSettings" },
	properties =
	{
		{ id = "name",            name = "Name",                 editor = "text",    default = "cold wave" },
		{ id = "temp_drop",                                      editor = "number",  default = -55, no_edit = true, dont_save = true, help = "Unused"},
		{ id = "min_temp_drop",   name = "Min Temperature Drop", editor = "number",  default = -100, min = -100, max = -30, help = "Unused"},
		{ id = "max_temp_drop",   name = "Max Temperature Drop", editor = "number",  default = -30, min = -100, max = -30, help = "Unused"},
		{ id = "seasonal",        name = "Seasonal",             editor = "bool",    default = false, object_update = true},
		{ id = "seasonal_sols",   name = "Seasonal Sols",        editor = "number",  default = 13, no_edit = function(self) return not self.seasonal end },
		{ id = "min_duration",    name = "Min Duration",         editor = "number",  default = 25 * const.HourDuration, scale = const.HourDuration, help = "In Hours" },
		{ id = "max_duration",    name = "Max Duration",         editor = "number",  default = 75 * const.HourDuration, scale = const.HourDuration, help = "In Hours" },
	},
	
	noon = "ColdWaveNoon",
	dusk = "ColdWaveDusk",
	evening = "ColdWaveEvening",
	night = "ColdWaveNight",
	dawn = "ColdWaveDawn",
	morning = "ColdWaveMorning",
}

GlobalVar("g_ColdWave", false)

local hour_duration = const.HourDuration
local day_duration = const.DayDuration
local day_hours = const.HoursPerDay

local function GetColdWaveDescr()
	if mapdata.MapSettings_ColdWave == "disabled" then
		return
	end
	
	local data = DataInstances.MapSettings_ColdWave
	local cold_wave = data[mapdata.MapSettings_ColdWave] or data["ColdWave_VeryLow"]
	
	return cold_wave and not cold_wave.forbidden and cold_wave
end

function StartColdWave(settings, endless)
	local cold_wave = ColdWaveInstance:new{
		settings = settings,
		temp_drop = UICity:Random(settings.min_temp_drop, settings.max_temp_drop),
	}
	local duration = not endless and UICity:Random(settings.min_duration, settings.max_duration)
	if g_ColdWave then
		g_ColdWave:ApplyHeat(false)
	else
		PlayFX("ColdWave", "start")
	end
	g_ColdWave = cold_wave
	Msg("ColdWave")
	RemoveDisasterNotifications()
	local preset = duration and "ColdWaveDuration" or "ColdWaveEndless"
	AddDisasterNotification(preset, {start_time = GameTime(), expiration = duration})
	for i = #g_DustDevils, 1, -1 do
		g_DustDevils[i]:delete()
	end
	cold_wave:ApplyHeat(true)
	WaitMsg("ColdWaveCancel", duration)
	cold_wave:ApplyHeat(false)
	RemoveOnScreenNotification(preset)
	if g_ColdWave == cold_wave then
		PlayFX("ColdWave", "end")
		g_ColdWave = false
		Msg("ColdWaveEnded")
	end
end

GlobalGameTimeThread("ColdWave", function()
	local cold_wave = GetColdWaveDescr()
	if not cold_wave then
		return
	end

	-- wait a few sols
	local wait_time = 0
	if not cold_wave.seasonal then
		wait_time = cold_wave.birth_hour + UICity:Random(cold_wave.spawntime_random)
	end
	
	local first = true
	while true do
		-- find wait time
		if cold_wave.seasonal then
			wait_time = wait_time + cold_wave.seasonal_sols * day_duration
		else
			if not first then
				wait_time = wait_time + UICity:Random(cold_wave.spawntime, cold_wave.spawntime_random)
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
				local warn_time = GetDisasterWarningTime(cold_wave)
				if GameTime() - start_time > wait_time - warn_time then
					AddDisasterNotification("ColdWave", {start_time = GameTime(), expiration = warn_time})
					WaitMsg("TriggerColdWave", wait_time - (GameTime() - start_time))
					while IsDisasterActive() do
						WaitMsg("TriggerColdWave", 5000)
					end
					break
				end
			end
			local forced = WaitMsg("TriggerColdWave", 5000)
			if forced then
				break
			end
		end
		first = false
		wait_time = 0		
		StartColdWave(cold_wave)
	end
end)

----

DefineClass.ColdWaveInstance =
{
	__parents = { "BaseHeater" },
	settings = false,
	temp_drop = 0,
	heat = -const.MaxHeat,
	GetHeatRange = empty_func,
	GetHeatBorder = empty_func,
	GetHeatCenter = empty_func,
}

function ColdWaveInstance:ApplyForm(grid, heat)
	Heat_AddAmbient(grid, heat)
end

----

DefineClass.ColdArea =
{
	__parents = { "EditorMarker", "BaseHeater", "EditorRangeObject" },
	properties =
	{
		{ category = "Cold", name = T{643, "Range"},        id = "Range",       editor = "number", default = 512*guim, scale = guim, min = 0, max = 2048 * guim, slider = true, buttons = {{"Apply", "Reapply"}}},
		{ category = "Cold", name = T{841, "Ice Strength"}, id = "IceStrength", editor = "number", default = 100, min = 0, max = 100, slider = true},
	},
	Scale = 1000,
	heat = -const.MaxHeat,
	is_static = true,
	noise = "ColdArea",
	dbg_range_color = cyan,
}

function ColdArea:Init()
	self:SetScale(self.Scale)
end

function ColdArea:Done()
	SetIceStrength(0, self)
end

function ColdArea:GameInit()
	self:ApplyHeat(true)
end

function ColdArea:Reapply(self)
	self:ApplyHeat(true)
end

function ColdArea:GetHeatRange()
	return self.Range
end

function ColdArea:EditorGetRange()
	return self.Range
end

function ColdArea:ApplyForm(grid, heat, center_x, center_y, radius, border, map_border, grid_tile)
	if radius == 0 then
		return
	end
	local max_size = self.Range / (2 * guim)
	local noise_size = 64
	while noise_size < max_size do
		noise_size = 2 * noise_size
	end
	noise_size = Max(32, Min(256, noise_size / 2))
	local noise_center = point(noise_size / 2, noise_size / 2)
	local form_obj = DataInstances.NoisePreset[self.noise]
	if not form_obj then
		StoreErrorSource(self, "Missing cloud form preset")
		return
	end
	local seed = xxhash(GetMap(), center_x, center_y)
	local pattern = form_obj:GetNoise(noise_size, seed)
	if pattern:get(0, 0) ~= 0 then
		pattern:lnot_i()
	end
	local minx, miny, maxx, maxy = pattern:minmaxdist(noise_center)
	local radius_max = noise_center:Dist2D(maxx, maxy)
	if radius_max == 0 then
		StoreErrorSource(self, "Cloud form error")
		return
	end
	SetIceStrength(self.IceStrength, self)
	Heat_AddColdArea(grid, pattern, radius_max, center_x, center_y, radius, heat, map_border, grid_tile)
	pattern:free()
end

function ColdArea:EditorEnter()
	EditorRangeObject.EditorEnter(self)
	EditorMarker.EditorEnter(self)
end

function ColdArea:EditorExit()
	EditorRangeObject.EditorExit(self)
	EditorMarker.EditorExit(self)
end

function CheatColdWave()
	if IsDisasterActive() then
		return
	end
	if GetColdWaveDescr() then
		Msg("TriggerColdWave")
	else
		CreateGameTimeThread(function()
			local data = DataInstances.MapSettings_ColdWave
			StartColdWave(data[mapdata.MapSettings_ColdWave] or data["ColdWave_VeryLow"])
		end)
	end
end

function StopColdWave()
	Msg("ColdWaveCancel")
end