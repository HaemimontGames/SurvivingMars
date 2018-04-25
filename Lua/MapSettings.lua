DefineClass.MapSettings =
{
	__parents = { "DataInstance" },
	properties =
	{
		{ id = "name",				name = "Name",					editor = "text",    default = "", category = "Common" },
		{ id = "strength",				name = "Strength",					editor = "number",  default = 1, min = 1, max = 4, slider = true, category = "Common", help = "Used to identify the trait level" },
		{ id = "forbidden",			name = "Forbidden",				editor = "bool",    default = false, category = "Common" },
		{ id = "spawntime",			name = "Spawn Time (h)",			editor = "number",  default = 500 * const.HourDuration, scale = const.HourDuration, category = "Common" },
		{ id = "spawntime_random",	name = "Spawn Time Random (h)",	editor = "number",  default = 750 * const.HourDuration, scale = const.HourDuration, category = "Common" },
		{ id = "warning_time",		name = "Warning Time (h)",			editor = "number",	default = 6 * const.HourDuration, scale = const.HourDuration, category = "Common" },
		{ id = "birth_hour",		name = "Birth Hour (h)",			editor = "number",	default = 125 * const.HourDuration, scale = const.HourDuration, category = "Common", help = "This many hours without disaster" },
		{ id = "use_in_gen",		name = "Use in random selection",	editor = "bool",    default = true, category = "Common" },
		-- Disaster Lightmodel
		{ id = "noon",				name = "Noon",		category = "Lightmodel", editor = "dropdownlist", default = "", items = LightmodelsCombo },
		{ id = "evening",			name = "Evening",	category = "Lightmodel", editor = "dropdownlist", default = "", items = LightmodelsCombo },
		{ id = "dusk",				name = "Dusk",		category = "Lightmodel", editor = "dropdownlist", default = "", items = LightmodelsCombo },
		{ id = "night",				name = "Night",		category = "Lightmodel", editor = "dropdownlist", default = "", items = LightmodelsCombo },
		{ id = "dawn",				name = "Dawn",		category = "Lightmodel", editor = "dropdownlist", default = "", items = LightmodelsCombo },
		{ id = "morning",			name = "Morning",	category = "Lightmodel", editor = "dropdownlist", default = "", items = LightmodelsCombo },
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

if Platform.developer then
UserActions.AddActions {
	["MapSettingsEditor"] = {
		menu = "[203]Editors/[01]Mars/Map Settings Editor",
		key = "Ctrl-Alt-M",
		action = function() 
			local _, window_id = PropEditor_GetFirstWindow("MapSettingsEditor")
			if not window_id then
				local class_names = ClassDescendantsList("MapSettings")
				local classes = {}
				for i = 1, #class_names do
					local class = g_Classes[class_names[i]]
					local data = DataInstances[class.class]
					local obj = table.icopy(data)
					obj.name = class.class
					classes[i] = obj
				end
				PropEditorOpen(MapSettingsEditor:new(classes)) 
			else
				PropEditorActivateWindow(window_id)
			end
		end,
	}
}
end

DefineClass.MapSettingsDialog =
{
	__parents = { "FrameWindow", "PauseGameDialog" },
	
	map_settings = false,
}

function MapSettingsDialog:Init()
	DataInstances.UIDesignerData.MapSettingsDialog:InitDialogFromView(self, "default")
	self.idOK.OnButtonPressed = function(this)
		local idx = self.idList:GetSelectionIdx()[1]
		self:delete(idx)
	end
	self.idList.OnDoubleClick = self.idOK.OnButtonPressed
	self:Center()
	self.map_settings = {}
end

function MapSettingsDialog:OnKbdKeyDown(char, virtual_key)
	if virtual_key == const.vkEsc then
		self.idCancel:Press()
		return "break"
	elseif virtual_key == const.vkEnter then
		self.idOK:Press()
		return "break"
	end
	return "continue"
end

function CreateMapSettingsDialog(items, caption, parent, map_settings)
	local dlg = OpenDialog("MapSettingsDialog", nil, parent or terminal.desktop, _InternalTranslate(caption))
	dlg.idCaption:SetText(caption)
	dlg.idList:SetContent(items)
	dlg.idList:SetFocus()
	dlg.idList:SetSelection(1, true)
	
	local function SetMapSettings(combo_id, class)
		local data = DataInstances[class]
		local items = { { text = Untranslated("disabled"), value = "disabled" } }
		for i = 1, #data do
			table.insert(items, { text = Untranslated(data[i].name), value = data[i].name })
		end
		local combo = dlg[combo_id].combo
		combo:SetContent(items)
		combo.OnValueChanged = function(this, value, selected_idx)
			dlg.map_settings[class] = value
		end
		if map_settings then
			combo:SetSelectedValue(map_settings[class])
		end
		dlg.map_settings[class] = combo:GetValue()
	end
	
	local class_names = ClassDescendantsList("MapSettings")
	for i = 1, #class_names do
		local class = class_names[i]
		local combo_id = "id" .. string.match(class, "MapSettings_(%w+)$")
		SetMapSettings(combo_id, class)
	end
	
	return dlg
end

function WaitMapSettingsDialog(items, caption, parent, start_selection, map_settings) 
	local dlg = CreateMapSettingsDialog(items, caption, parent, map_settings)
	if start_selection then
		dlg.idList:SetSelection(start_selection, true)
	end
	local idx = dlg:Wait()
	
	return idx, dlg.map_settings
end

if Platform.developer and not config.UseDevChangeMapDialog then
local s_OldChangeMapAction = DeveloperUA_Global["DE_ChangeMap"].action

local DeveloperUA_Custom =
{
["DE_ChangeMap"] =
{
	key = "F5",
	description = "Change Map",
	toolbar = "01_File/01_ChangeMap",
	icon = "load_city.tga",
	menu = "[103]Map/[01]Change Map",
	action = function()
		local ineditor = Platform.editor and IsEditorActive()
		if ineditor then
			s_OldChangeMapAction()
		else
			CreateRealTimeThread(function()
				local caption = Untranslated("Choose map with settings presets:")
				local maps = ListMaps()
				local items = {}
				for i = 1, #maps do
					if not (string.find(string.lower(maps[i]), "^prefab") or string.find(maps[i], "^__")) then
						table.insert(items, {text = Untranslated(maps[i]), map = maps[i]})
					end
				end
				local default_selection = table.find(maps, GetMapName())
				local map_settings = {}
				local class_names = ClassDescendantsList("MapSettings")
				for i = 1, #class_names do
					local class = class_names[i]
					map_settings[class] = mapdata[class]
				end
				local sel_idx, map_settings = WaitMapSettingsDialog(items, caption, nil, default_selection, map_settings)
				if sel_idx ~= "idCancel" then
					local map = sel_idx and items[sel_idx].map
					if not map or map == "" then
						return
					end
					CloseMenuDialogs()
					StartGame(map, map_settings)
					LocalStorage.last_map = map
					SaveLocalStorage()
				end
			end)
		end
	end,
}
}

UserActions.AddActions ( DeveloperUA_Custom )
end  -- Platform.developer

g_DisastersSettings = false

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
	local towers = 0
	local a_sol_ago = GameTime() - const.SensorTowerPredictionAddTime
	for _, tower in ipairs(UICity.labels.SensorTower or empty_table) do
		if tower.working or (tower.turn_off_time - a_sol_ago) > 0 then
			towers = towers + 1
		end
	end
	local warning_time = disaster and disaster.warning_time or MapSettings.warning_time
	return Min(warning_time + const.SensorTowerPredictionAddTime * towers, const.SensorTowerPredictionMaxTime)
end

function IsDisasterActive()
	return not not (g_ColdWave or g_DustStorm or g_MysteryDream)
end

GlobalVar("g_DisastersPredicted", {})

function AddDisasterNotification(id, params)
	assert(not IsDisasterPredicted())
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
	return false
end

local function StrengthCombo()
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
		{category = "General", id = "strength",		name = "Strength",  default = 3, editor = "dropdownlist", items = StrengthCombo,},
		{category = "General", id = "meteors",	name = "Meteors Type",default = "single", editor = "dropdownlist", items = { "single", "multispawn", "storm" }, no_edit = function(self) return self.disaster ~= "Meteors" end,},
		{category = "General", id = "endless", name = "Endless", default = false, editor = "bool", no_edit = function(self) return self.disaster ~= "Cold Wave" end,},
		{category = "General", id = "wait", name = "Wait to Finish", default = false, editor = "bool", no_edit = function(self) return self.disaster ~= "Cold Wave" and self.disaster ~= "Dust Storm" end, },
	},

	Menu = "Gameplay",
	MenuName = "Start Disaster",
	RestrictToList = "Scenario",
	PropertyTranslation = false,
	MenuSection = "Disasters",
}

function SA_StartDisaster:Exec(sequence_player, ip, seq, registers)
	if self.disaster == "Dust Storm" then
		local list = table.ifilter(DataInstances.MapSettings_DustStorm, function(_, data)
			return data.strength == self.strength
		end)
		local data = UICity:TableRand(list)
		if self.wait then
			StartDustStorm(self.storm, data)
		else
			CreateGameTimeThread(function()
				StartDustStorm(self.storm, data)
			end)
		end
	elseif self.disaster == "Cold Wave" then
		local list = table.ifilter(DataInstances.MapSettings_ColdWave, function(_, data)
			return data.strength == self.strength
		end)
		local data = UICity:TableRand(list)
		if self.wait then
			StartColdWave(data, self.endless)
		else
			CreateGameTimeThread(function()
				StartColdWave(data, self.endless)
			end)
		end
	elseif self.disaster == "Meteors" then
		TriggerMeteors(self.meteors)
	elseif self.disaster == "Dust Devils" then
		local pos = GetRandomPassable()
		if pos then
			local descr = GetDustDevilsDescr()
			if descr then
				local devil = GenerateDustDevil(pos, descr)
				devil:Start()
			end
		end
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

function GetRandomPassableAwayFromLargeBuilding(min_dist, city)
	local pfClass = 0
	local city =  city or UICity
	local seed = city:Random()
	return GetRandomPassablePoint(seed, pfClass, function(x, y, min_dist)
		return IsPointNearLargeBuildingAndBuildable(x, y, min_dist)
	end, min_dist)
end

function GetRandomPassableAround(center, max_radius, min_radius, city, filter, ...)
	local pfClass = 0
	min_radius = min_radius or 0
	city = city or UICity
	local seed = city:Random()
	return GetRandomPassablePoint(center, max_radius, min_radius, seed, pfClass, filter, ...)
end