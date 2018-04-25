GlobalVar("g_InitialRocketCargo", false)
GlobalVar("g_InitialCargoCost", 0)
GlobalVar("g_InitialCargoWeight", 0)
GlobalVar("g_InitialSessionSeed", false)

function HasParadoxSponsor()
	if Platform.developer or AccountStorage.has_paradox_sponsor then
		return true
	else
		return false, "paradox sponsor"
	end
end

MissionParams = {
	idMissionSponsor = {
		display_name = T{3474, "Mission Sponsor"},
		display_name_caps = T{3475, "MISSION SPONSOR"},
		rollover = {id = "MISSION SPONSOR", title = T{3475, "MISSION SPONSOR"}, descr = T{3476, "The patron country or organization standing behind the Mars mission. Grants funding, research and other benefits to colony."}, gamepad_hint = T{3477, "<ButtonA> Choose Sponsor"}},
	},
	idCommanderProfile = {
		display_name = T{3478, "Commander Profile"},
		display_name_caps = T{3479, "COMMANDER PROFILE"},
		rollover = {id = "COMMANDER PROFILE", title = T{3479, "COMMANDER PROFILE"}, descr = T{3480, "The mission commander grants various benefits to the colony."}, gamepad_hint = T{3481, "<ButtonA> Choose Commander"}},
	},

	idMissionLogo = {
		display_name = T{3482, "Colony Logo"},
		display_name_caps = T{3483, "COLONY LOGO"},
		rollover = {id = "LOGO", title = T{3483, "COLONY LOGO"}, descr = T{3484, "This is an aesthetic choice that has no effect on gameplay."}, gamepad_hint = T{3485, "<ButtonA> Choose Logo"}},
	},
	
	idMystery = {
		display_name = T{3486, "Mystery"},
		display_name_caps = T{3487, "MYSTERY"},
		rollover = {id = "MYSTERY", title = T{3487, "MYSTERY"}, descr = T{3488, "Select an active storyline for this playthrough."}, gamepad_hint = T{3489, "<ButtonA> Choose Mystery"}},
		items = {
			{name = "random", display_name = T{3490, "Random"}, rollover_text = T{7904, "Chooses a random mystery, preferably one you have not played yet."}},
			{name = "none", display_name = T{6839, "None"}},
		},
	},
	
	idGameRules = {
		display_name = T{8800, "Game Rules"},
		display_name_caps = T{8801, "GAME RULES"},
	},
}

function ReloadMissionSponsors()
	local sponsors = Presets.MissionSponsorPreset and Presets.MissionSponsorPreset.Default
	if sponsors then
		table.sort(sponsors, function (a, b)
			local k1, k2 = a.SortKey, b.SortKey
			if not k1 and k2 then
				return false --items with no SortKey go last
			elseif k1 and not k2 then
				return true --items with no SortKey go last
			elseif k1 ~= k2 then
				return k1 < k2
			end
			return a.id < b.id
		end)
		MissionParams.idMissionSponsor.items = sponsors
	end
end

function ReloadCommanderProfiles()
	local commanders = Presets.CommanderProfilePreset and Presets.CommanderProfilePreset.Default
	if commanders then
		table.sort(commanders, function (a, b)
			local k1, k2 = a.SortKey, b.SortKey
			if not k1 and k2 then
				return false --items with no SortKey go last
			elseif k1 and not k2 then
				return true --items with no SortKey go last
			elseif k1 ~= k2 then
				return k1 < k2
			end
			return a.id < b.id
		end)
		MissionParams.idCommanderProfile.items = commanders
	end
end

do
	ReloadMissionSponsors()
	ReloadCommanderProfiles()
	ReloadGameRules()
	ReloadMissionLogos()
end

OnMsg.DataLoaded = ReloadMissionSponsors
OnMsg.DataLoaded = ReloadCommanderProfiles
OnMsg.ModsLoaded = ReloadMissionSponsors
OnMsg.ModsLoaded = ReloadCommanderProfiles

local modifier_list_for_sponsor
local modifier_list = {}
function GetSponsorModifiers(sponsor)
	if modifier_list_for_sponsor ~= sponsor then
		modifier_list_for_sponsor = sponsor
		sponsor = GetMissionSponsor(sponsor)
		modifier_list = {}
		for i=1,const.MissionSponsorPriceModifiers do
			local name = sponsor:GetProperty("modifier_name" .. i) or ""
			if name and name ~= "" then
				modifier_list[name] = sponsor:GetProperty("modifier_value" .. i)
			end
		end
	end
	return modifier_list
end

local lock_list_for_sponsor
local lock_list = {}
function GetSponsorLocks(sponsor)
	if lock_list_for_sponsor ~= sponsor then
		lock_list_for_sponsor = sponsor
		sponsor = GetMissionSponsor(sponsor)
		lock_list = {}
		for i=1,const.MissionSponsorLockModifiers do
			local name = sponsor:GetProperty("lock_name" .. i) or ""
			if name and name ~= "" then
				local lock = sponsor:GetProperty("lock_value" .. i)
				if lock == "locked" then
					lock_list[name] = true
				elseif lock == "unlocked" then
					lock_list[name] = false
				end
			end
		end
	end
	return lock_list
end

local nations_list_for_sponsor
local nations_list = {}
function GetSponsorNations(sponsor)
	if nations_list_for_sponsor ~= sponsor then
		nations_list_for_sponsor = sponsor
		sponsor = GetMissionSponsor(sponsor)
		nations_list = {}
		for i=1,const.MissionSponsorNations do
			local nation_name = sponsor:GetProperty("sponsor_nation_name" .. i) or ""
			if nation_name ~= "" then
				nations_list[#nations_list + 1] = {nation_name, sponsor:GetProperty("sponsor_nation_percent" .. i)}
			end
		end
	end
	return nations_list
end

function OnMsg.ClassesBuilt()
	CreateRealTimeThread(function()
		WaitInitialDlcLoad()
		-- add mysteries
		local items = MissionParams.idMystery.items
		local all_mysteries = ClassDescendantsList("MysteryBase")
		local function mystery_order(name)
			local class = g_Classes[name]
			return class.order_pos
		end
		all_mysteries = table.sortby(all_mysteries, mystery_order)
		for i = 1, #all_mysteries do
			local mystery_id = all_mysteries[i]
			local class = g_Classes[mystery_id]
			if (Platform.developer or IsDlcAvailable(class.dlc)) and not table.find(items, "name", mystery_id) then
				items[#items + 1] = {
					name = mystery_id,
					display_name = class.display_name,
					challenge_mod = class.challenge_mod,
					rollover_text = class.rollover_text
				}
			end
		end
	end)
end

function OnMsg.ChangeMap(map)
	g_CurrentMissionParams.idMissionSponsor = g_CurrentMissionParams.idMissionSponsor or "IMM"
	g_CurrentMissionParams.idCommanderProfile = g_CurrentMissionParams.idCommanderProfile or "rocketscientist"
	g_CurrentMissionParams.idGameRules = g_CurrentMissionParams.idGameRules or {}
end

function InitNewGameMissionParams()
	g_CurrentMissionParams = {}
	for k, v in pairs(MissionParams) do
		if k ~= "idMissionSponsor" and k ~= "idCommanderProfile" and k~= "idGameRules" then --empty at the beginning
			local items = v.items
			for i=1,#items do
				local item = items[i]
				if item.filter == nil or item.filter == true or (type(item.filter) == "function" and item:filter()) then
					g_CurrentMissionParams[k] = rawget(item, "name") or rawget(item, "id")
					break
				end
			end
		end
	end
	g_CurrentMapParams = {}
	g_RocketCargo = false
	g_CargoCost = 0
	g_CargoWeight = 0
	g_SessionSeed = AsyncRand()
end

function OnMsg.DataLoaded()
	InitNewGameMissionParams()
end

if FirstLoad then
	g_CurrentMissionParams = false
	g_CurrentMapParams = false
	
	g_RocketCargo = false
	g_CargoCost = 0
	g_CargoWeight = 0
	
	g_SessionSeed = false
end

function ResetCargo()
	g_RocketCargo = false
	g_CargoCost = 0
	g_CargoWeight = 0
end

function OnMsg.PersistSave(data)
	-- note: not GlobalVars, as they have to persist between PreGame and in-game, and GlobalVars would be reset
	data.g_CurrentMissionParams = g_CurrentMissionParams
	data.g_CurrentMapParams = g_CurrentMapParams
end

function OnMsg.PersistLoad(data)
	g_CurrentMissionParams = data.g_CurrentMissionParams
	g_CurrentMapParams = data.g_CurrentMapParams
end

local function accumulate_ranges(total, addend)
	if not addend then
		return
	end
	
	for key,rng in pairs(addend) do
		if not total[key] then
			--copy, just in case
			total[key] = range(rng.from, rng.to)
		else
			--increment
			local entry = total[key]
			entry.from = entry.from + rng.from
			entry.to = entry.to + rng.to
		end
	end
end

function GetDefaultMissionSponsor()
	return setmetatable({}, {__index = MissionSponsorPreset}) -- savegame compatibility
end

function GetMissionSponsor(name)
	name = name or g_CurrentMissionParams.idMissionSponsor
	local sponsor = name and Presets.MissionSponsorPreset.Default[name] or GetDefaultMissionSponsor()
	if not rawget(sponsor, "name") then
		rawset(sponsor, "name", sponsor.id) --backward compatibility for mods
	end
	return sponsor
end

function GetDefaultCommanderProfile()
	return setmetatable({}, {__index = CommanderProfilePreset}) -- savegame compatibility
end

function GetCommanderProfile(name)
	name = name or g_CurrentMissionParams.idCommanderProfile
	local commander = name and Presets.CommanderProfilePreset.Default[name] or GetDefaultCommanderProfile()
	if not rawget(commander, "name") then
		rawset(commander, "name", commander.id) --backward compatibility for mods
	end
	return commander
end

--When generating a new map anomalies are placed depending on some chance
--This function tells us what probability increase we get from our mission settings
function GetMissionAnomalyBonus()
	local sponsor = GetMissionSponsor()
	local profile = GetCommanderProfile()
	
	local sponsor_bonus = 
	{
		Breakthrough = sponsor.anomaly_bonus_breakthrough,
		Event = sponsor.anomaly_bonus_event,
		FreeTech = sponsor.anomaly_bonus_free_tech
	}
	local profile_bonus = 
	{
		Breakthrough = profile.anomaly_bonus_breakthrough,
		Event = profile.anomaly_bonus_event,
		FreeTech = profile.anomaly_bonus_free_tech
	}
	
	local total_bonuses = {}
	accumulate_ranges(total_bonuses, sponsor_bonus)
	accumulate_ranges(total_bonuses, profile_bonus)
	
	return total_bonuses
end

--In the pregame menu the mission sponsor dictates what items
--will be initially loaded on the rocket - this function gives that preset
function GetMissionInitialLoadout(pregame)
	local preset = GetMissionSponsor()
	if not preset then
		return false
	end
	local items = {}
	for _, def in ipairs(ResupplyItemDefinitions) do
		local amount = not def.locked and pregame and rawget(preset, def.id) or 0
		items[#items + 1] = { class = def.id, amount = amount }
	end
	return items
end

-------------------------------------------

function ResolveDisplayName(id)
	local res = Resources[id]
	if res then
		return res.display_name, res.description
	end
	local template = DataInstances.BuildingTemplate[id]
	if template then
		return template.display_name, template.description
	end
	local def = g_Classes[id]
	if def and def:HasMember("display_name") then
		return def.display_name, def.description
	end
	local article = table.find_value(DataInstances.EncyclopediaArticle, "title_id", id)
	if article then
		return article.title_text, article.text
	end
	return Untranslated(id), ""
end

function ResupplyItemsCombo()
	local items = {}
	for group_i, group_items in ipairs(Presets.Cargo or empty_table) do
		for _, item in ipairs(group_items) do
			items[#items + 1] = { value = item.id, text = item.name }
		end
	end
	TSort(items, "text")
	table.insert(items, 1, "")
	return items
end

function LockStatusCombo()
	return {
		{ value = false, text = "" },
		{ value = "locked",   text = T{8056, "Locked"} },
		{ value = "unlocked", text = T{8690, "Unlocked"} },
	}
end

local function ModifyResupplyDef(def, param, percent)
	local orig_def = def and CargoPreset[def.id]
	assert(orig_def)
	if not orig_def then
		return
	end
	if param == "price" then
		def.mod_price = (def.mod_price or 100) + percent
		def.price = MulDivRound(orig_def.price, def.mod_price, 100)
	elseif param == "weight" then
		def.mod_weight = (def.mod_weight or 100) + percent
		def.kg = MulDivRound(orig_def.kg, def.mod_weight, 100)
	else
		assert(false, "unexpected resupply parameter received for modification: " .. tostring(param))
	end
end

--[[@@@
Change price or weight of resupply item. If called multiple times, first sums percents.
@function void Gameplay@ModifyResupplyParam(string id, string param, int percent)	
@param string id - resupply item identifier.Can be
		"RCRover","ExplorerRover","RCTransport", "Drone", "Concrete", "Metals", "Food", "Polymers", "MachineParts", "Electronics" "DroneHub","MoistureVaporator","FuelFactory", "StirlingGenerator", "MachinePartsFactory","ElectronicsFactory",  "PolymerPlant","OrbitalProbe","ShuttleHub", "MetalsExtractor",  "RegolithExtractor", "WaterExtractor", "PreciousMetalsExtractor","Apartments", "LivingQuarters", "SmartHome", "Arcology",  "HangingGardens","WaterReclamationSystem", "CloningVats","NetworkNode", "MedicalCenter",  "Sanatorium",
@param string param  - type of change: "price", "weight" 
@param int percent - percent to change with.
--]]
function ModifyResupplyParam(id, param, percent)
	return ModifyResupplyDef(RocketPayload_GetMeta(id), param, percent)
end

--[[@@@
Change price or weight of all resupply items.
@function void Gameplay@ModifyResupplyParams(string param, int percent)	
@param string param  - type of change: "price", "weight" 
@param int percent - percent to change with.
--]]
function ModifyResupplyParams(param, percent)
	for _, def in ipairs(ResupplyItemDefinitions) do
		ModifyResupplyDef(def, param, percent)
	end
end

function RocketPayload_Init()
	local sponsor = g_CurrentMissionParams and g_CurrentMissionParams.idMissionSponsor or ""
	local mods = GetSponsorModifiers(sponsor)
	local locks = GetSponsorLocks(sponsor)
	local defs = {}
	for group_i, group_items in ipairs(Presets.Cargo or empty_table) do
		for _, item in ipairs(group_items) do
			local def = setmetatable({}, {__index = item})
			defs[#defs + 1] = def
			local mod = mods[def.id] or 0
			if mod ~= 0 then
				ModifyResupplyDef(def, "price", mod)
			end
			local lock = locks[def.id]
			if lock ~= nil then
				def.locked = lock
			end
		end
	end
	ResupplyItemDefinitions = defs
end

if FirstLoad then
	PGMenuEntries = {"idMissionSponsor", "idCommanderProfile", "idMissionLogo", "idMystery", "idGameRules" }
end

function OnMsg.NewMapLoaded()
	--when a new map is loaded, ResupplyItemDefinitions gets initialized with default values
	--so we need to apply the sponsor modifiers once again
	RocketPayload_Init()
end

GlobalVar("ResupplyItemDefinitions", {})

local sponsor_relevant_consts = {
	"SponsorResearch",
	"ExportPricePreciousMetals",
}

modifiableConsts = {
	{local_id = "additional_research_points", global_id = "SponsorResearch"},
	{local_id = "additional_colonists_per_rocket", global_id = "MaxColonistsPerRocket"},
	{local_id = "additional_initial_applicants", global_id = "ApplicantsPoolStartingSize"}
}

if FirstLoad then
	SponsorModifiedGlobalConsts = {}
end

function ReloadSponsorModifiedGlobalConsts()
	SponsorModifiedGlobalConsts = {}
	for _, sponsor in ipairs(Presets.MissionSponsorPreset.Default) do
		for i = 1,#sponsor do
			local modifier = sponsor[i]
			if ObjectClass(modifier) == "Effect_ModifyLabel" and
				modifier.Label == "Consts" then
				SponsorModifiedGlobalConsts[modifier.Prop] = true
			end
		end
	end
end

OnMsg.DataLoaded = ReloadSponsorModifiedGlobalConsts

function GetSponsorModifierConsts(sponsor)
	local t = {}
		
	for k,v in pairs(SponsorModifiedGlobalConsts) do
		t[k] = g_Consts[k]
	end
	
	for i = 1,#sponsor do
		local mod = sponsor[i]
		if ObjectClass(mod) == "Effect_ModifyLabel" and
			mod.Label == "Consts" then
			t[mod.Prop] = MulDivRound(g_Consts[mod.Prop], 100 + mod.Percent, 100) + mod.Amount
		end
	end
	
	for _, const in ipairs(modifiableConsts) do
		local value_id = const.local_id
		local global_name = const.global_id
		if sponsor[value_id] and sponsor[value_id]>0 then 
			t[global_name] = MulDivRound(g_Consts[global_name], 100, 100) + sponsor[value_id]			
		end
		t[global_name] = t[global_name] or g_Consts[global_name]
	end  
	for _, ct in ipairs(sponsor_relevant_consts) do
		t[ct] = t[ct] or g_Consts[ct]
	end
	return t
end

function GetSponsorDescr(sponsor, include_flavor)
	local descr = GetSponsorModifierConsts(sponsor)
	descr[1] = sponsor.effect or ""
	descr[2] = sponsor
	descr.challenge_rating = sponsor.challenge_mod and Untranslated(string.format("%3.2f", (sponsor.challenge_mod + 100)/100.0))
	descr.flavor = include_flavor and sponsor.flavor or ""
	setmetatable(descr, TMeta)
	return descr
end

-------------------------------------------
function GetSponsorEntryRollover(param_t)
	if not param_t.effect or param_t.effect == "" then return end
	return {
		id = param_t.display_name,
		title = param_t.display_name,
		descr = GetSponsorDescr(param_t, "include flavor"),
		gamepad_hint = T{3545, "<ButtonA> Select"},
	}
end

function GetEntryRollover(param_t)
	if (not param_t.effect or param_t.effect == "") and not rawget(param_t, "rollover_text") then return end
	local rollover = {title = param_t.display_name}
	local lines = { }
	if param_t.effect then
		lines[#lines + 1] = param_t.effect
	else
		lines[#lines + 1] = param_t.rollover_text
	end
	rollover.descr = table.concat(lines, "\n")
	rollover.id = rollover.title
	rollover.gamepad_hint = T{3545, "<ButtonA> Select"}
	return rollover
end

function GetDescrEffects()
	local lines = {}
	local rockets_added
	for i = 1, #PGMenuEntries do
		local id = PGMenuEntries[i]
		local search_table = MissionParams[id].items
		local field = "id"
		if id == "idMystery" then
			field = "name"
		end
		local entry = table.find_value(search_table, field, g_CurrentMissionParams[id])
		local effect = entry and entry.effect or ""
		if effect ~= "" then
			if not rockets_added and IsKindOfClasses(entry, "MissionSponsorPreset", "CommanderProfilePreset") then
				lines[#lines + 1] = T{3546, "Starting Rockets: <rockets>", rockets = GetStartingRockets() }
				rockets_added = true
			end
			if IsKindOf(entry, "MissionSponsorPreset") then
				lines[#lines + 1] = GetSponsorDescr(entry)
			else
				lines[#lines + 1] = T{ effect, entry }
			end
		end
	end
	return table.concat(lines, "\n")
end

function GetMapChallengeRating()
	if not g_CurrentMapParams.seed then
		return 0
	end
	local gen = GetRandomMapGenerator()
	if not gen then
		gen = {}
		FillRandomMapProps(gen)
	end
	local mapdata = MapData[gen.BlankMap]
	return mapdata and mapdata.challenge_rating or 0
end

function CalcChallengeRating(replace_param, replacement_id, map_challenge_rating)
	local sponsor_mod = 0
	local rating = 0
	local function UpdateRatingForParam(param_id, item_id)
		if not MissionParams[param_id] then
			return
		end
		local search_table = MissionParams[param_id].items
		local field = "id"
		if param_id == "idMystery" then
			field = "name"
		end
		local idx = table.find(search_table, field, item_id)
		local mod
		if param_id == "idGameRules" then
			mod = CalcGameRulesChallengeMod(item_id)
		else
			mod = idx and search_table[idx].challenge_mod or 0
		end
		if param_id == "idMissionSponsor" then
			sponsor_mod = mod
		else
			rating = rating + mod
		end
	end
	for param_id, item_id in pairs(g_CurrentMissionParams) do
		if replacement_id and param_id == replace_param then
			item_id = replacement_id
		end
		UpdateRatingForParam(param_id, item_id)
	end
	if replacement_id and not g_CurrentMissionParams[replace_param] then
		UpdateRatingForParam(replace_param, replacement_id)
	end
	if g_CurrentMissionParams.SelectedSpotChallengeMods then
		for k, v in pairs(g_CurrentMissionParams.SelectedSpotChallengeMods) do
			rating = rating + v
		end
	end
	rating = rating + (map_challenge_rating or GetMapChallengeRating())
	rating = rating + sponsor_mod
	return Max(0, rating)
end

function GenerateRandomMissionParams()
	InitNewGameMissionParams()
	for k, v in pairs(MissionParams) do
		if k ~= "idMissionSponsor" and k ~= "idCommanderProfile" and k ~= "idMystery" and k ~= "idGameRules" then
			g_CurrentMissionParams[k] = GetRandomMissionParam(k)
		end
	end
	g_CurrentMissionParams.idMissionSponsor = "IMM"
	g_CurrentMissionParams.idCommanderProfile = "rocketscientist"
	g_CurrentMissionParams.idMystery = "random"
	g_CurrentMissionParams.idGameRules = {}
	g_CurrentMissionParams.GameSessionID = srp.random_encode64(96)
	GenerateRocketCargo()
end

function GenerateRocketCargo()
	RocketPayload_Init()
	g_RocketCargo = GetMissionInitialLoadout("on_start")
	RocketPayload_CalcCargoWeightCost()
end

function GetRandomMissionParam(param)
	local filtered = {}
	local items = MissionParams[param].items
	for i=1,#items do
		local item = items[i]
		local id = rawget(item, "name") or rawget(item, "id")
		if id ~= "random" and id ~= "none" and (item.filter == nil or item.filter == true or (type(item.filter) == "function" and item:filter())) then
			filtered[#filtered + 1] = item
		end
	end
	local chosen = filtered[1 + AsyncRand(#filtered)]
	return rawget(chosen, "name") or rawget(chosen, "id")
end

function GenerateRandomMapParams()
	local lat, long
	if Presets.LandingSpot.Default then
		local items = {}
		for _, item in ipairs(Presets.LandingSpot.Default) do
			if item.quickstart then
				items[#items + 1] = item
			end
		end
		local spot = items[1 + AsyncRand(#items)]
		lat, long = spot.latitude * 60, spot.longitude * 60
	else
		lat, long = GenerateRandomLandingLocation()
	end
	GetOverlayValues(lat, long)
	g_CurrentMapParams.rocket_name, g_CurrentMapParams.rocket_name_base = GenerateRocketName(true)
end

function ShowStartGamePopup()	
	local sponsor   = GetMissionSponsor()
	local commander = GetCommanderProfile()
	WaitPopupNotification("WelcomeGameInfo",
	{ params = { sponsor_name = sponsor.display_name or "", 
					commander_name = commander.display_name , 
					}
	})		
end

------------------------------------------------------------

local M = 1000000
DefineClass.ModItemMissionSponsor = { --Kept for backwards compatibility (mods with DataInstances, instead of Presets)
	__parents = { "ModItem", "DynamicPropertiesObject" },
	properties = {
		{ category = "General", id = "display_name", name = T{1000067, "Display Name"}, editor = "text", default = "", translate = true},
		{ category = "General", id = "challenge_mod", name = T{3491, "Challenge Mod (%)"}, editor = "number", default = 0},
		{ category = "General", id = "funding", name = T{3492, "Starting Funding (M)"}, editor = "number", default = const.StartFunding},
		{ category = "General", id = "funding_per_tech", name = T{3493, "Tech Funding (M)"},              default = 0,                help = T{3494, "Funding earned for each Tech researched"}, editor = "number", modifiable = true },
		{ category = "General", id = "funding_per_breakthrough", name = T{3495, "Breakthrough Funding (M)"}, default = 0,                help = T{3496, "Funding earned for each Breakthrough Tech researched"}, editor = "number", modifiable = true },
		{ category = "General", id = "applicants_per_breakthrough", name = T{3497, "Breakthrough applicants"}, default = 0,                help = T{3498, "Applicants earned for each Breakthrough Tech researched"}, editor = "number", modifiable = true },
		{ category = "General", id = "cargo", name = T{3499, "Cargo Capacity"}, editor = "number", default = const.StartCargoCapacity},
		{ category = "General", id = "initial_rockets", name = T{3500, "Starting Rockets"}, editor = "number", default = 2},
		{ category = "General", id = "rocket_price", name = T{6840, "Rocket price (M)"}, editor = "number", default = 3000*M, scale = M, min = 0, help = T{6841, "Specify 0 to disable buying"}},
		{ category = "General", id = "applicants_price", name = T{6842, "Applicants price (M)"}, editor = "number", default = 0, scale = M, min = 0, help = T{6841, "Specify 0 to disable buying"}},
		{ category = "General", id = "initial_techs_unlocked", name = T{3503, "Starting Techs to research"}, editor = "number", default = 3, help = T{3504, "Number of initially available Techs to research"}},
		{ category = "General", id = "trait", name = T{3505, "Trait given to colonists"}, editor = "dropdownlist", default = "", items = function() return TraitsCombo() end },
		{ category = "General", id = "anomaly_bonus_breakthrough", name = T{3506, "Bonus Breakthrough Anomalies"}, editor = "range", default = range(0, 0), min = 0, max = 5, },
		{ category = "General", id = "anomaly_bonus_event", name = T{3507, "Bonus event Anomalies"}, editor = "range", default = range(0, 0), min = 0, max = 5, },
		{ category = "General", id = "anomaly_bonus_free_tech", name = T{3508, "Bonus free Tech Anomalies"}, editor = "range", default = range(0, 0), min = 0, max = 5, },
		{ category = "General", id = "additional_research_points", name = T{8754, "Additional research points per Sol"}, editor = "number", default = 0},
		{ category = "General", id = "additional_colonists_per_rocket", name = T{8755, "Increase max colonists per rocket"}, editor = "number", default = 0},
		{ category = "General", id = "additional_initial_applicants", name = T{8756, "Additional starting applicants"}, editor = "number", default = 0},
		{ category = "General", id = "effect", name = T{3509, "Effect"}, editor = "multi_line_text", default = "", translate = true},
		{ category = "General", id = "flavor", name = T{3510, "Flavor text"}, editor = "multi_line_text", default = "", translate = true},
		{ category = "General", id = "filter", name = T{1000108, "Filter"}, editor = "expression", parameters = "self", default = function() return true end,},
		{ category = "General", id = "default_skin", name = T{7968, "Default Dome Skin"}, editor = "dropdownlist", default = "", items = DomeSkinsPresetsCombo},
		{ category = "General", id = "game_apply", name = T{8022, "Game Apply"}, editor = "func", params = "self, city", default = function(self, city) end, },
		{ category = "General", id = "FreeSpaceLeft", name = T{8494, "Free Space Left"}, editor = "number", default = 0, read_only = true, dont_save = true, help = "Shows how much cargo space is left, after taking into account the initial cargo loadout" },
		
		{ category = "Parameters", id = "param1", editor = "number", default = 0},
		{ category = "Parameters", id = "param2", editor = "number", default = 0},
		{ category = "Parameters", id = "param3", editor = "number", default = 0},
		{ category = "Parameters", id = "param4", editor = "number", default = 0},
		{ category = "Parameters", id = "param5", editor = "number", default = 0},
		
		{ category = "Technologies", id = "tech1", name = T{3, "Grant Research"}, editor = "combo", default = "", items = TechCombo },
		{ category = "Technologies", id = "tech2", name = T{3, "Grant Research"}, editor = "combo", default = "", items = TechCombo },
		{ category = "Technologies", id = "tech3", name = T{3, "Grant Research"}, editor = "combo", default = "", items = TechCombo },
		{ category = "Technologies", id = "tech4", name = T{3, "Grant Research"}, editor = "combo", default = "", items = TechCombo },
		{ category = "Technologies", id = "tech5", name = T{3, "Grant Research"}, editor = "combo", default = "", items = TechCombo },
		
		{ category = "Goal", id = "goal", name = T{8076, "Goal"}, editor = "dropdownlist", default = "", items = ClassDescendantsCombo("MissionGoal") },
		{ category = "Goal", id = "goal_timeout", name = T{8077, "Timeout (Sols)"}, editor = "number", min = 1, default = 100 },
		{ category = "Goal", id = "goal_target", name = T{8078, "Target"}, editor = "number", default = 0 },
	},
	EditorName = "",
}

function ModItemMissionSponsor:GetDynamicProperties(properties)
	ForEachPreset("Cargo", function(cargo, group, self, props)
		if cargo.locked then return end
		local id = cargo.id
		rawset(self, id, rawget(self, id) or 0)
		properties[#properties + 1] = {
			category = "Rocket Cargo: " .. cargo.group, 
			id = cargo.id, name = cargo.name,
			editor = "number", default = 0, min = 0
		}
	end, self, properties)
	return properties
end

do
	for i=1,const.MissionSponsorPriceModifiers do
		table.append(ModItemMissionSponsor.properties, {
			{ category = "Price Modifiers", id = "modifier_name" .. i,  name = T{3541, "Modifier name <number>", number = i}, editor = "combo", default = "", items = ResupplyItemsCombo },
			{ category = "Price Modifiers", id = "modifier_value" .. i, name = T{3542, "Modifier value <number>", number = i}, editor = "number", default = 0},
		})
	end
	for i=1,const.MissionSponsorLockModifiers do
		table.append(ModItemMissionSponsor.properties, {
			{ category = "Lock Modifiers", id = "lock_name" .. i,  name = T{8691, "Cargo <number>", number = i}, editor = "combo",         default = "", items = ResupplyItemsCombo },
			{ category = "Lock Modifiers", id = "lock_value" .. i, name = T{8692, "Status <number>", number = i}, editor = "dropdownlist", default = false, items = LockStatusCombo},
		})
	end
	for i=1,const.MissionSponsorNations do
		table.append(ModItemMissionSponsor.properties, {
			{ category = "Sponsor Nations", id = "sponsor_nation_name" .. i,    name = T{3543, "Sponsor nation name <number>", number = i}, editor = "combo", default = "",items = Nations },
			{ category = "Sponsor Nations", id = "sponsor_nation_percent" .. i, name = T{3544, "Sponsor nation percent <number>", number = i}, editor = "number", default = 0},
		})
	end
end

function ModItemMissionSponsor:OnModLoad()
	local mod = self.mod
	local obj = {
		id = self.name,
		name = self.name,
		SortKey = 1000000, --put those after our sponsors
		display_name = self.display_name,
		challenge_mod = self.challenge_mod,
		funding = self.funding,
		funding_per_tech = self.funding_per_tech,
		funding_per_breakthrough = self.funding_per_breakthrough,
		applicants_per_breakthrough = self.applicants_per_breakthrough,
		cargo = self.cargo,
		initial_rockets = self.initial_rockets,
		rocket_price = self.rocket_price,
		applicants_price = self.applicants_price,
		initial_techs_unlocked = self.initial_techs_unlocked,
		trait = self.trait,
		anomaly_bonus_breakthrough = self.anomaly_bonus_breakthrough,
		anomaly_bonus_event = self.anomaly_bonus_event,
		anomaly_bonus_free_tech = self.anomaly_bonus_free_tech,
		additional_research_points = self.additional_research_points,
		additional_colonists_per_rocket = self.additional_colonists_per_rocket,
		additional_initial_applicants = self.additional_initial_applicants,
		effect = self.effect,
		flavor = self.flavor,
		filter = self.filter,
		default_skin = self.default_skin,
		game_apply = self.game_apply,
		param1 = self.param1,
		param2 = self.param2,
		param3 = self.param3,
		param4 = self.param4,
		param5 = self.param5,
		tech1 = self.tech1,
		tech2 = self.tech2,
		tech3 = self.tech3,
		tech4 = self.tech4,
		tech5 = self.tech5,
		goal = self.goal,
		goal_timeout = self.goal_timeout,
		goal_target = self.goal_target,
		mod = mod,
	}
	for i=1,const.MissionSponsorPriceModifiers do
		obj["modifier_name" .. i] = self["modifier_name" .. i]
		obj["modifier_value" .. i] = self["modifier_value" .. i]
	end
	for i=1,const.MissionSponsorLockModifiers do
		obj["lock_name" .. i] = self["lock_name" .. i]
		obj["lock_value" .. i] = self["lock_value" .. i]
	end
	for i=1,const.MissionSponsorNations do
		obj["sponsor_nation_name" .. i] = self["sponsor_nation_name" .. i]
		obj["sponsor_nation_percent" .. i] = self["sponsor_nation_percent" .. i]
	end
	ForEachPreset("Cargo", function(cargo, group, self, props)
		if cargo.locked then return end
		obj[cargo.id] = rawget(self, cargo.id)
	end, self)
	local new = ModItemMissionSponsorPreset:new(obj)
	local index = table.find(mod.items, self) or (#mod.items + 1)
	mod.items[index] = new
	new:OnModLoad()
end

------------------------------------------------------------

--[[ Backwards compatibility for TechEffect_ModifyLabelOverTime, which might have saved the commander profile
and calls GetIdentifier() on it]]
DefineClass.CommanderProfile = {}
function CommanderProfile:GetIdentifier()
	return self.name
end

DefineClass.ModItemCommanderProfile = { --Kept for backwards compatibility (mods with DataInstances, instead of Presets)
	__parents = { "ModItem" },
	properties = {
		{ category = "General", id = "display_name", name = T{1000067, "Display Name"}, editor = "text", default = "", translate = true},
		{ category = "General", id = "challenge_mod", name = T{3491, "Challenge Mod (%)"}, editor = "number", default = 0},
		{ category = "General", id = "effect", name = T{1000017, "Description"}, editor = "multi_line_text", default = "", translate = true},
		{ category = "General", id = "filter", name = T{1000108, "Filter"}, editor = "expression", parameters = "self", default = function() return true end,},
		{ category = "General", id = "anomaly_bonus_breakthrough", name = T{3506, "Bonus Breakthrough Anomalies"}, editor = "range", default = range(0, 0), min = 0, max = 5, },
		{ category = "General", id = "anomaly_bonus_event", name = T{3507, "Bonus event Anomalies"}, editor = "range", default = range(0, 0), min = 0, max = 5, },
		{ category = "General", id = "anomaly_bonus_free_tech", name = T{3508, "Bonus free Tech Anomalies"}, editor = "range", default = range(0, 0), min = 0, max = 5, },
		{ category = "General", id = "bonus_rockets", name = T{3511, "Bonus Rockets"}, editor = "number", default = 0, min = 0 },
		{ category = "General", id = "additional_research_points", name = T{8754, "Additional research points per Sol"}, editor = "number", default = 0},
		{ category = "General", id = "additional_colonists_per_rocket", name = T{8755, "Increase max colonists per rocket"}, editor = "number", default = 0},
		{ category = "General", id = "additional_initial_applicants", name = T{8756, "Additional starting applicants"}, editor = "number", default = 0},
		{ category = "General", id = "game_apply", name = T{8022, "Game Apply"}, editor = "func", params = "self, city", default = function(self, city) end,},
		{ category = "Parameters", id = "param1", editor = "number", default = 0},
		{ category = "Parameters", id = "param2", editor = "number", default = 0},
		{ category = "Parameters", id = "param3", editor = "number", default = 0},
		{ category = "Parameters", id = "param4", editor = "number", default = 0},
		{ category = "Parameters", id = "param5", editor = "number", default = 0},
		{ category = "Technologies", id = "tech1", name = T{3, "Grant Research"}, editor = "combo", default = "", items = TechCombo },
		{ category = "Technologies", id = "tech2", name = T{3, "Grant Research"}, editor = "combo", default = "", items = TechCombo },
		{ category = "Technologies", id = "tech3", name = T{3, "Grant Research"}, editor = "combo", default = "", items = TechCombo },
		{ category = "Technologies", id = "tech4", name = T{3, "Grant Research"}, editor = "combo", default = "", items = TechCombo },
		{ category = "Technologies", id = "tech5", name = T{3, "Grant Research"}, editor = "combo", default = "", items = TechCombo },
	},
	EditorName = "",
}

function ModItemCommanderProfile:OnModLoad()
	local mod = self.mod
	local new = ModItemCommanderProfilePreset:new{
		id = self.name,
		name = self.name,
		SortKey = 1000000, --put those after our commanders
		display_name = self.display_name,
		challenge_mod = self.challenge_mod,
		effect = self.effect,
		filter = self.filter,
		anomaly_bonus_breakthrough = self.anomaly_bonus_breakthrough,
		anomaly_bonus_event = self.anomaly_bonus_event,
		anomaly_bonus_free_tech = self.anomaly_bonus_free_tech,
		bonus_rockets = self.bonus_rockets,
		additional_research_points = self.additional_research_points,
		additional_colonists_per_rocket = self.additional_colonists_per_rocket,
		additional_initial_applicants = self.additional_initial_applicants,
		game_apply = self.game_apply,
		param1 = self.param1,
		param2 = self.param2,
		param3 = self.param3,
		param4 = self.param4,
		param5 = self.param5,
		tech1 = self.tech1,
		tech2 = self.tech2,
		tech3 = self.tech3,
		tech4 = self.tech4,
		tech5 = self.tech5,
		mod = mod,
	}
	local index = table.find(mod.items, self) or (#mod.items + 1)
	mod.items[index] = new
	new:OnModLoad()
end
