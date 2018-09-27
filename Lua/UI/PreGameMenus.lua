local limit_values = {60, 95, 140, 256}
function CalcValueInQuarters(value)
	for i = 1, 4 do
		if value <= limit_values[i] then
			return i
		end
	end
end

local border_texture = "Prefab_Violet"
local max_prefab_styles = 2

local altitude_dark_threshold = 120
local altitude_slate_threshold = 40
local altitude_decor_threshold = 150

local decor_above_threshold = 10
local decor_bellow_threshold = 25
local preset_suffix = {"_VeryLow", "_Low", "_High", "_VeryHigh"}

function FillRandomMapProps(gen, params)
	params = params or g_CurrentMapParams
	local location = params.Locales
	local altitude = OverlayAltitudeValue(params.Altitude) -- [0, 255]
	local maps = {}
	for map, data in pairs(MapData) do
		if data.IsRandomMap then
			local locations = data.map_location or empty_table
			if #locations == 0 or table.find(locations, location) then
				if altitude >= data.map_altitude.from and altitude <= data.map_altitude.to then
					maps[#maps + 1] = map
				end
			end
		end
	end
	if #maps == 0 then
		print("No matching blank map found for altitude", altitude, "and location", location)
		for map, data in pairs(MapData) do
			if data.IsRandomMap then
				maps[#maps + 1] = map
			end
		end
	end
	table.sort(maps)
	local seed, idx, value = params.seed
	local function trand(tbl, weight)
		if weight then
			value, idx, seed = table.weighted_rand(tbl, weight, seed)
		else
			value, idx, seed = table.rand(tbl, seed)
		end
		return value
	end
	local map = trand(maps, function(map) return MapData[map].weight end)
	
	if not gen then
		return map
	end
	gen.BlankMap = map
	gen.DecorationRatio = altitude > altitude_decor_threshold and decor_above_threshold or decor_bellow_threshold
	
	if const.PrefabVersionOverride then
		gen.PrefabVersion = const.PrefabVersionOverride
	end
	
	-- select texture_setup styles
	local prefab_styles = table.icopy(PrefabStyles)
	local map_type_info = table.copy(MapData[map].type_info)
	map_type_info[border_texture] = nil
	local texture_setup = {MapPrefabEntry:new({Texture = border_texture, Border = true})}
	local choosen_styles = {}
	local function add_style(texture, style)
		texture_setup[#texture_setup + 1] = MapPrefabEntry:new({Texture = texture, Style = style})
		if choosen_styles[style] then
			return
		end
		choosen_styles[style] = true
		choosen_styles[#choosen_styles + 1] = style
		if prefab_styles == PrefabStyles then
			return
		end
		table.remove_value(prefab_styles, style)
		if #prefab_styles == 0 then
			prefab_styles = PrefabStyles
		end
	end
	local max_perc_style
	if altitude > altitude_dark_threshold then
		max_perc_style = "Dark"
	elseif altitude < altitude_slate_threshold then
		max_perc_style = "Slate"
	end
	if max_perc_style then
		local max_perc_texture
		for texture, perc in sorted_pairs(map_type_info) do
			max_perc_texture = max_perc_texture or texture
			if map_type_info[max_perc_texture] < perc then
				max_perc_texture = texture
			end
		end
		if max_perc_texture then
			map_type_info[max_perc_texture] = nil
			add_style(max_perc_texture, max_perc_style)
		end
	end
	for texture, perc in sorted_pairs(map_type_info) do
		if perc == 0 then
			print("once", "Texture", texture, "hole detected on", map)
		else
			local styles = #choosen_styles < max_prefab_styles and prefab_styles or choosen_styles
			add_style(texture, trand(styles))
		end
	end
	gen.texture_setup = texture_setup
	
	local anomaly_bonus = GetMissionAnomalyBonus()
	for anom_type, bonus in pairs(anomaly_bonus) do
		gen["BonusCount" .. anom_type] = bonus
	end
	gen.Seed = seed
	
	local ResourceThreatOverlays = LandingSiteObject:GetProperties()
	for k, t in ipairs(ResourceThreatOverlays) do
		if t.resource then
			gen["ResPreset_" .. t.id] = t.id .. preset_suffix[CalcValueInQuarters(params[t.id])]
		end
		if t.threat then
			local strength = CalcValueInQuarters(params[t.id])
			local name = "MapSettings_" .. t.id
			if NoThreats(t.id) then 
				gen[name] = "disabled" 
			else	
				local data
				if MaxThreat(t.id) then 
					data = DataInstances[name][t.id.."_GameRule"]
				else
					local items = table.ifilter(DataInstances[name], function(_, data)
						return data.strength == strength and data.use_in_gen
					end)
					data = trand(items)
				end
				gen[name] = data and data.name
			end
		end
	end
	
	local cold_degree = CalcValueInQuarters(params.ColdWave)
	local cold_area_chances = {10, 40, 70, 100}
	local cold_area_sizes = {range(256*guim, 512*guim), range(256*guim, 512*guim), range(512*guim, 768*guim), range(768*guim, 1024*guim)}
	gen.ColdAreaChance = cold_area_chances[cold_degree]
	gen.ColdAreaSize = cold_area_sizes[cold_degree]
	return map
end

function MaxThreat(id)
	return (IsGameRuleActive("WinterIsComing") and id == "ColdWave")
			or (IsGameRuleActive("Armageddon") and id == "Meteor")
			or (IsGameRuleActive("DustInTheWind") and id == "DustStorm")
			or (IsGameRuleActive("Twister") and id == "DustDevils")
end

function NoThreats(id)
	return IsGameRuleActive("NoDisasters") and (id == "ColdWave" or id == "Meteor" or id == "DustStorm" or id == "DustDevils")
end

function GenerateCurrentRandomMap()
	-- in order to avoid creating another RandomMapPreset data instance
	local props = GetModifiedProperties(DataInstances.RandomMapPreset["MAIN"])
	local gen = RandomMapGenerator:new()
	gen:SetProperties(props)
	FillRandomMapProps(gen)
	gen:Generate()
end

function QuitGame(parent)
	CreateRealTimeThread(function(parent)
		if WaitMarsQuestion(parent, T{4167, "Return to Earth?"}, T{8718, "Please don't go. The drones need you. They look up to you.<newline><newline>Are you sure you want to exit the game?"}, T{1138, "Yes"}, T{1139, "No"}, "UI/Messages/space.tga") == "ok" then
			quit()
		end
	end, parent)
end

if FirstLoad then
	g_signin_thread = false
end

DefineClass.DurangoTitleScreen = {
	__parents = {"XDialog"},
}

function DurangoTitleScreen:Init()
	XImage:new({
		Image = "UI/Menu Background 01.tga",
		ImageFit = "stretch",
	}, self)
	local label = XLabel:new({
		Id = "idStartText",
		HAlign = "center",
		VAlign = "center",
		TextStyle = "TitleScreen",
		TextFont = "PGModWarning",
		TextColor = RGBA(255, 255, 255, 255),
		Translate = true,
	}, self)
	label:SetText(T{4263, "Press any button"})
	self:SetFocus()
	self.idStartText:AddInterpolation{
		type = const.intAlpha,
		easing = const.Easing.SinInOut,
		duration = 1500,
		startValue = 255,
		endValue = 50,
		flags = const.intfPingPong + const.intfLooping,
	}
	SetAccountStorage("invalid")
	XPlayersReset()
end

function DurangoTitleScreen:OnXButtonDown(button, controller_id)
	if IsValidThread(g_signin_thread) then return end
	d_print("Button: ", button, "Controller: ", controller_id)
			
	g_signin_thread = CreateRealTimeThread(function()
		LoadingScreenOpen("idLoadingScreen", "DurangoSignIn")
		local result = DurangoWaitSigninOrCancel(controller_id)
		if result == "retry" then
			LoadingScreenClose("idLoadingScreen", "DurangoSignIn")
			return
		elseif result == "signed" then
			WaitLoadAccountStorage()
			LoadDlcs()
			ModsLoadLocTables()
			if not Durango.IsPlayerSigned(XPlayerActive) then 
				LoadingScreenClose("idLoadingScreen", "DurangoSignIn")
				return 
			end
		else
			InitDefaultAccountStorage()
			LoadDlcs()
		end
		self:Close()
		OpenPreGameMainMenu()
		local signed = Durango.IsPlayerSigned(XPlayerActive)
		local guest = Durango.IsPlayerGuest(XPlayerActive)
		if signed and not guest then
			StartPops()
		else
			--disable telemetry when not logged in or guest
			TelemetrySetEnabled(false)
		end
		ClearParadoxParams()
		LoadingScreenClose("idLoadingScreen", "DurangoSignIn")
		if not signed then
			CreateMarsMessageBox(T{""}, T{1000623, "You are not signed into a profile. You will be unable to save any game content until you sign in."}, T{1000136, "OK"}, terminal.desktop)
		elseif guest then
			CreateMarsMessageBox(T{""}, DurangoGuestMessage, T{1000136, "OK"}, terminal.desktop)
		end
	end)
	return "break"
end
