DefineClass.MapSettings =
{
	__parents = { "DataInstance" },
	properties =
	{
		{ id = "name",				name = "Name",					editor = "text",    default = "", category = "Common" },
		{ id = "strength",			name = "Strength",					editor = "number",  default = 1, min = 1, max = 4, slider = true, category = "Common", help = "Used to identify the trait level" },
		{ id = "forbidden",			name = "Forbidden",				editor = "bool",    default = false, category = "Common" },
		{ id = "spawntime",			name = "Spawn Time (h)",			editor = "number",  default = 500 * const.HourDuration, scale = const.HourDuration, category = "Common" },
		{ id = "spawntime_random",	name = "Spawn Time Random (h)",	editor = "number",  default = 750 * const.HourDuration, scale = const.HourDuration, category = "Common" },
		{ id = "warning_time",		name = "Warning Time (h)",			editor = "number",	default = 6 * const.HourDuration, scale = const.HourDuration, category = "Common" },
		{ id = "birth_hour",		name = "Birth Hour (h)",			editor = "number",	default = 125 * const.HourDuration, scale = const.HourDuration, category = "Common", help = "This many hours without disaster" },
		{ id = "use_in_gen",		name = "Use in random selection",	editor = "bool",    default = true, category = "Common" },
		-- Disaster Lightmodel
		{ id = "noon",				name = "Noon",		category = "Lightmodel", editor = "dropdownlist", default = "", items = PresetsCombo("LightmodelPreset") },
		{ id = "evening",			name = "Evening",	category = "Lightmodel", editor = "dropdownlist", default = "", items = PresetsCombo("LightmodelPreset") },
		{ id = "dusk",				name = "Dusk",		category = "Lightmodel", editor = "dropdownlist", default = "", items = PresetsCombo("LightmodelPreset") },
		{ id = "night",				name = "Night",		category = "Lightmodel", editor = "dropdownlist", default = "", items = PresetsCombo("LightmodelPreset") },
		{ id = "dawn",				name = "Dawn",		category = "Lightmodel", editor = "dropdownlist", default = "", items = PresetsCombo("LightmodelPreset") },
		{ id = "morning",			name = "Morning",	category = "Lightmodel", editor = "dropdownlist", default = "", items = PresetsCombo("LightmodelPreset") },
	},
}

DefineClass.MapSettingsEditor =
{
	__parents = { "PropEditor", "InitDone" },
	
	PropEditorPaste = { "MapSettings" },
	PropEditorViews = {
		{
			name = "Default",
			height = 780,
			caption = "Map Settings Editor",
			{ title = "Groups",  type = "list",  width = 300, items = function(obj, idx) return obj[idx].name end },
			{ title = "List",    type = "list",  width = 300, items = function(obj, idx) return obj[idx].name end, obj = 1 },
			{ title = "Props",   type = "props", width = 300, obj = 2},
		},
	},

	PropEditorActions = {
		{ "New",       "ActionNew",    "Ctrl-N",    "new",     {"MapSettings"}},
		{ "Delete",    "ActionDelete", "Delete",    "delete!", {"MapSettings"}},
		{ "Save",      "ActionSave",   "Ctrl-S",    "save!"},
		{ "Move Up",   "ActionUp",     "Ctrl-Up",   "up",      {"MapSettings"}},
		{ "Move Down", "ActionDown",   "Ctrl-Down", "down!",   {"MapSettings"}},
	},
}

function MapSettingsEditor:ActionNew(obj, selected_index, selection, view_index)
	local main_idx = selection[1] or 1
	local class = self[main_idx].name
	local data = DataInstances[class]
	local new_obj = g_Classes[class]:new{}
	table.insert(self[main_idx], new_obj)
	PropEditorObjChanged(self)
end

function MapSettingsEditor:ActionDelete(obj, selected_index, selection, view_index)
	local idx = selection[2]
	if not idx then
		return
	end
	local main_idx = selection[1] or 1
	local class = self[main_idx].name
	local data = DataInstances[class]
	data[idx]:delete()
	table.remove(self[main_idx], idx)
	PropEditorObjChanged(self)
end

function MapSettingsEditor:MoveEntry(down, obj, selected_index, selection)
	local idx = selection[2]
	if not idx then
		return
	end
	
	local main_idx = selection[1] or 1
	local class = self[main_idx].name
	local data = DataInstances[class]
	local target = data[idx]
	if down then
		idx = table.remove_entry(data, target)
		idx = Min(#data + 1, idx + 1)
		table.insert(data, idx, target)
		idx = table.remove_entry(self[main_idx], target)
		idx = Min(#self[main_idx] + 1, idx + 1)
		table.insert(self[main_idx], idx, target)
	else
		idx = table.remove_entry(data, target)
		idx = Max(1, idx - 1)
		table.insert(data, idx, target)
		idx = table.remove_entry(self[main_idx], target)
		idx = Max(1, idx - 1)
		table.insert(self[main_idx], idx, target)
	end
	PropEditorObjChanged(self)
	selection[2] = idx
	
	return selection
end

function MapSettingsEditor:ActionUp(obj, selected_index, selection, view_index, column_index)
	return self:MoveEntry(false, obj, selected_index, selection)
end

function MapSettingsEditor:ActionDown(obj, selected_index, selection, view_index, column_index)
	return self:MoveEntry(true, obj, selected_index, selection)
end

function MapSettingsEditor:ActionSave()
	for i = 1, #self do
		local list = DataInstances[self[i].name]
		local data = { exported_files_header_warning }
		if #list > 0 then
			table.insert(data, string.format("local %s =", self[i].name))
			table.insert(data, ArrayToLuaCode(list))
		end
		local filename = string.format("Data/%s.lua", self[i].name)
		local err = AsyncStringToFile(filename, data)
		if err then
			printf("Error '%s' saving %s", tostring(err), filename)
		end
	end
end

g_DisastersSettings = false

function OverrideDisasterDescriptor(original)
	return original
end

function StartGame(map, map_settings)
	g_DisastersSettings = map_settings
	ChangeMap(map)
end

function OnMsg.GameTimeStart()
	if g_DisastersSettings then
		for disaster, preset in pairs(g_DisastersSettings) do
			mapdata[disaster] = g_DisastersSettings[disaster]
		end
	end
	g_DisastersSettings = false
end

function GetDisasterWarningTime(disaster)
	local towers = GetNumberOfSensorTowers()
	local warning_time = disaster and disaster.warning_time or MapSettings.warning_time
	return Min(warning_time + const.SensorTowerPredictionAddTime * towers, const.SensorTowerPredictionMaxTime)
end

function GetNumberOfSensorTowers()
	local towers = 0
	local prediction_add_time_ago = Max(GameTime() - const.SensorTowerPredictionAddTime, 0)
	for _, tower in ipairs(UICity.labels.SensorTower or empty_table) do
		if tower.working or (tower.turn_off_time and tower.turn_off_time - prediction_add_time_ago > 0) then
			towers = towers + 1
		end
	end
	return towers
end

function GetEarlyWarningText(warn_time)
	local sols = warn_time / const.DayDuration
	local hours =(warn_time % const.DayDuration) / const.HourDuration
	local text = sols ~= 0 and ( sols == 1 and T(10975, "1 Sol ") or T{10976, "<sol> Sols ", sol = sols}) or ""
	text = text .. T{10977, "<h> h", h = hours}
	return text
end

function GetTowerCountText()
	local towers = GetNumberOfSensorTowers()
	towers = towers == 1 and T(10978, "1 Sensor Tower") or T{10979, "<tower_number> Sensor Towers", tower_number = towers} 
	return towers
end

GlobalVar("g_RainDisaster", false)

function IsDisasterActive()
	return not not (g_ColdWave or g_DustStorm or g_MysteryDream or g_RainDisaster)
end

GlobalVar("g_DisastersPredicted", {})
GlobalVar("g_DisasterDscrShown", {})

function ShowDisasterDescription(disaster_type)
	if g_DisasterDscrShown[disaster_type] then
		return
	end
	local preset_name = "Disaster_" .. disaster_type
	if PopupNotificationPresets[preset_name] then
		ShowPopupNotification(preset_name)
	end
	g_DisasterDscrShown[disaster_type] = true
end

function AddDisasterNotification(id, params, extended)
	assert(not IsDisasterPredicted() or extended)
	g_DisastersPredicted[id] = true
	AddOnScreenNotification(id, nil, params)
end

function RemoveDisasterNotifications()
	for id in pairs(g_DisastersPredicted) do
		RemoveOnScreenNotification(id)
	end
	g_DisastersPredicted = {}
end

function IsDisasterPredicted()
	for id in pairs(g_DisastersPredicted) do
		if IsOnScreenNotificationShown(id) then
			return true
		end
	end
end

function WaitCurrentDisaster()
	while IsDisasterPredicted() or IsDisasterActive() do
		Sleep(const.HourDuration)
	end
end

function GetDisasterLightmodelList()
	if g_MysteryDream then
		return "Dreamers"
	end
	if g_ColdWave then
		return "ColdWave"
	end
	if g_DustStorm then
		return (g_DustStorm and g_DustStorm.type == "great") and "GreatDustStorm" or "DustStorm"
	end
	if g_RainDisaster == "toxic" then
		return "ToxicRain"
	elseif g_RainDisaster == "normal" then
		return "WaterRain"
	end
	return false
end

function StrengthCombo()
	return {
		{ value = 1, text = "Very Low" },
		{ value = 2, text = "Low" },
		{ value = 3, text = "High" },
		{ value = 4, text = "Very High" },
	}
end

DefineClass.SA_StartDisaster =
{
	__parents = { "SequenceAction" },
	
	properties =
	{
		{category = "General", id = "disaster",	name = "Disaster",  default = "", editor = "dropdownlist", items = { "Dust Storm", "Cold Wave", "Dust Devils", "Meteors" }, },
		{category = "General", id = "storm",		name = "Storm Type",  default = "normal", editor = "dropdownlist", items = { "normal", "great", "electrostatic" }, no_edit = function(self) return self.disaster ~= "Dust Storm" end,},
		{category = "General", id = "strength",		name = "Strength",  default = 2, editor = "dropdownlist", items = StrengthCombo,},
		{category = "General", id = "meteors",	name = "Meteors Type",default = "single", editor = "dropdownlist", items = { "single", "multispawn", "storm" }, no_edit = function(self) return self.disaster ~= "Meteors" end,},
		{category = "General", id = "endless", name = "Endless", default = false, editor = "bool", no_edit = function(self) return self.disaster ~= "Cold Wave" end,},
		{category = "General", id = "wait", name = "Wait to Finish", default = false, editor = "bool", no_edit = function(self) return self.disaster == "Dust Devils" end, },
	},

	Menu = "Gameplay",
	MenuName = "Start Disaster",
	RestrictToList = "Scenario",
	PropertyTranslation = false,
	MenuSection = "Disasters",
}

function SA_StartDisaster:Exec(sequence_player, ip, seq, registers)
	local disaster_to_data = {
		["Dust Storm"] = DataInstances.MapSettings_DustStorm,
		["Cold Wave"] = DataInstances.MapSettings_ColdWave,
		["Meteors"] = DataInstances.MapSettings_Meteor,
		["Dust Devils"] = DataInstances.MapSettings_DustDevils,
	}
	local list = table.ifilter(disaster_to_data[self.disaster], function(_, data)
		return data.strength == self.strength
	end)
	local data = UICity:TableRand(list)
	if not data then
		sequence_player:Error(self, "No such disaster preset!")
		return
	end
	if self.disaster == "Dust Storm" then
		if self.wait then
			StartDustStorm(self.storm, data)
		else
			CreateGameTimeThread(function()
				StartDustStorm(self.storm, data)
			end)
		end
	elseif self.disaster == "Cold Wave" then
		if self.wait then
			StartColdWave(data, self.endless)
		else
			CreateGameTimeThread(function()
				StartColdWave(data, self.endless)
			end)
		end
	elseif self.disaster == "Meteors" then
		if self.wait then
			MeteorsDisaster(data, self.meteors)
		else
			CreateGameTimeThread(function()
				MeteorsDisaster(data, self.meteors)
			end)
		end
	elseif self.disaster == "Dust Devils" then
		local pos = GetRandomPassable()
		if not pos then
			sequence_player:Error(self, "No passable pos found!")
			return
		end
		local devil = GenerateDustDevil(pos, data)
		devil:Start()
	end
end

function SA_StartDisaster:ShortDescription()
	if self.disaster == "Dust Storm" then
		return string.format("Start %s %s disaster", self.storm, self.disaster)
	elseif self.disaster == "Meteors" then
		if self.meteors == "single" then
			return string.format("Start single Meteor disaster")
		elseif self.meteors == "multispawn" then
			return string.format("Start multi spawn Meteors disaster")
		elseif self.meteors == "storm" then
			return string.format("Start Meteor storm disaster")
		end
	elseif self.disaster == "Cold Wave" then
		if self.endless then
			return string.format("Start Endless Cold Wave disaster")
		end
	end
	
	return string.format("Start %s disaster", self.disaster)
end

----

DefineClass.SA_StopDisaster =
{
	__parents = { "SequenceAction" },
	
	properties =
	{
		{category = "General", id = "disaster",	name = "Disaster",  default = "", editor = "dropdownlist", items = { "Dust Storm", "Cold Wave" }, },
	},

	Menu = "Gameplay",
	MenuName = "Stop Disaster",
	RestrictToList = "Scenario",
	PropertyTranslation = false,
	MenuSection = "Disasters",
}

function SA_StopDisaster:Exec(sequence_player, ip, seq, registers)
	if self.disaster == "Dust Storm" then
		if not g_DustStorm then
			sequence_player:Error(self, "No active dust storm disaster to stop!")
		end
		StopDustStorm()
	elseif self.disaster == "Cold Wave" then
		if not g_ColdWave then
			sequence_player:Error(self, "No active cold wave disaster to stop!")
		end
		StopColdWave()
	end
end

function SA_StopDisaster:ShortDescription()
	return string.format("Stop %s disaster", self.disaster)
end

----

function GetRandomPassable(city)
	local pfClass = 0
	city = city or UICity
	local seed = city:Random()
	return GetRandomPassablePoint(seed)
end

function GetRandomPassableAwayFromBuilding(city)
	local pfClass = 0
	city = type(city) ~= "number" and city or UICity --backward compat, first arg used to be a number
	local seed = city:Random()
	return GetRandomPassablePoint(seed, pfClass, function(x, y)
		return IsBuildableZone(x, y) and not IsPointNearBuilding(x, y)
	end)
end

GetRandomPassableAwayFromLargeBuilding = GetRandomPassableAwayFromBuilding -- compatibility

function GetRandomPassableAround(center, max_radius, min_radius, city, filter, ...)
	local pfClass = 0
	min_radius = min_radius or 0
	city = city or UICity
	local seed = city:Random()
	return GetRandomPassablePoint(center, max_radius, min_radius, seed, pfClass, filter, ...)
end