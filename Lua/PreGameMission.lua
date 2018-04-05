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
}

local M = 1000000
DefineDataInstance("MissionSponsor",
	{
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
		{ category = "General", id = "filter", name = T{1000108, "Filter"}, editor = "expression", parameters = "self"},
		{ category = "General", id = "default_skin", name = T{7968, "Default Dome Skin"}, editor = "dropdownlist", default = "", items = DomeSkinsPresetsCombo},
		{ category = "General", id = "game_apply", name = T{8022, "Game Apply"}, editor = "func", params = "self, city"},
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
	"[203]Editors/[01]Mars/Mission Sponsor Editor"
)

MissionSponsor.__parents = { "DataInstance", "DynamicPropertiesObject" }

function MissionSponsor:GetFreeSpaceLeft()
	local loadout_weight = 0
	for _, effect in ipairs(self) do
		if IsKindOf(effect, "MissionSponsorCargoItem") and effect.cargo ~= "" and effect.count ~= 0 then
			local item = CargoPreset[effect.cargo]
			local weight = effect.count / item.pack * item.kg
			loadout_weight = loadout_weight + weight
		end
	end
	return self.cargo - loadout_weight
end

function MissionSponsor:game_apply(city)
end

function MissionSponsor:filter()
	return true
end

function MissionSponsor:GetDefaultRocketSkin()
	--if it returns a valid entity, new game menu should spawn a rocket with this entity when the sponsor is selected.
	return nil
end

function MissionSponsor:GetDynamicProperties(properties)
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

function MissionSponsorEditor:Save(...)
	ReloadSponsorModifiedGlobalConsts()
	DataInstanceEditor.Save(self, ...)
end

DefineModItemDataInstance("MissionSponsor")

DefineDataInstance("CommanderProfile",
	{
		{ category = "General", id = "display_name", name = T{1000067, "Display Name"}, editor = "text", default = "", translate = true},
		{ category = "General", id = "challenge_mod", name = T{3491, "Challenge Mod (%)"}, editor = "number", default = 0},
		{ category = "General", id = "effect", name = T{1000017, "Description"}, editor = "multi_line_text", default = "", translate = true},
		{ category = "General", id = "filter", name = T{1000108, "Filter"}, editor = "expression", parameters = "self"},
		{ category = "General", id = "anomaly_bonus_breakthrough", name = T{3506, "Bonus Breakthrough Anomalies"}, editor = "range", default = range(0, 0), min = 0, max = 5, },
		{ category = "General", id = "anomaly_bonus_event", name = T{3507, "Bonus event Anomalies"}, editor = "range", default = range(0, 0), min = 0, max = 5, },
		{ category = "General", id = "anomaly_bonus_free_tech", name = T{3508, "Bonus free Tech Anomalies"}, editor = "range", default = range(0, 0), min = 0, max = 5, },
		{ category = "General", id = "bonus_rockets", name = T{3511, "Bonus Rockets"}, editor = "number", default = 0, min = 0 },
		{ category = "General", id = "additional_research_points", name = T{8754, "Additional research points per Sol"}, editor = "number", default = 0},
		{ category = "General", id = "additional_colonists_per_rocket", name = T{8755, "Increase max colonists per rocket"}, editor = "number", default = 0},
		{ category = "General", id = "additional_initial_applicants", name = T{8756, "Additional starting applicants"}, editor = "number", default = 0},
		{ category = "General", id = "game_apply", name = T{8022, "Game Apply"}, editor = "func", params = "self, city"},
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
	"[203]Editors/[01]Mars/Commander Profile Editor"
)

DefineModItemDataInstance("CommanderProfile", {})

function CommanderProfile:game_apply(city)
end

function CommanderProfile:filter()
	return true
end

do
	local function ToMissionParam(class)
		local id = "id" .. class
		local def = _G[class]
		def.enabled = true
		function def:GetIdentifier()
			return self.name
		end
		local function link_items()
			MissionParams[id].items = DataInstances[class]
		end
		OnMsg.DataLoaded = link_items
		link_items()
		if Platform.editor then
			local editor_def = _G[class .. "Editor"]
			table.append(editor_def.PropEditorActions, {
				{ "New Effect", "NewEffect", "", "new", class},
				{ "Remove Effect", "RemEffect", "", "delete", class},
			})
			table.append(editor_def.PropEditorViews[1], {
				{ title = "Effects", type = "list", width = 300, items = '{GetDescription}', navigation = false, obj = 1 },
				{ title = "Effect Props", type = "props", width = 300, obj = 3},
			})
			function editor_def:OnObjectModified(object, prop_id)
				if prop_id == "Type" and IsKindOf(object, "TechEffect") then 
					PropEditorObjChanged(self)
				end
			end
			function editor_def:Refresh()
				DataInstanceEditor.Refresh(self)
				local params = {}
				for i=1,#self do
					local profile = self[i]
					for j=1,#profile do
						profile[j]:WarningsCheck(profile, params)
					end
				end
			end
			function editor_def:NewEffect(obj,selected_index,selection,view_index)
				obj = obj or self
				local new_obj = TechEffect:new()
				local idx = (selected_index or #obj) + 1
				local redo_func = function()
					table.insert(obj, idx, new_obj)
					PropEditorObjChanged(self)
					return idx
				end
				local undo_func = function()
					local idx = table.remove_entry(obj, new_obj)
					PropEditorObjChanged(self)
					return idx and Max(1, idx - 1) or 1
				end
				redo_func()
				return idx, undo_func, redo_func
			end
			function editor_def:RemEffect(obj,selected_index,selection,view_index)
				obj = obj or self
				local del_obj = obj[selected_index]
				local redo_func = function()
					local idx = table.remove_entry(obj, del_obj)
					PropEditorObjChanged(self)
					return idx and Max(1, idx - 1) or 1
				end
				local undo_func = function()
					local idx = table.insert(obj, selected_index, del_obj)
					PropEditorObjChanged(self)
					return idx
				end
				local idx = redo_func()
				return idx, undo_func, redo_func
			end
		end
	end
	ToMissionParam("MissionSponsor")
	ToMissionParam("CommanderProfile")
	ReloadMissionLogos()
end

local modifier_list_for_sponsor
local modifier_list = {}
function GetSponsorModifiers(sponsor)
	if modifier_list_for_sponsor ~= sponsor then
		modifier_list_for_sponsor = sponsor
		sponsor = DataInstances.MissionSponsor[sponsor] or {}
		modifier_list = {}
		for i=1,const.MissionSponsorPriceModifiers do
			local name = sponsor["modifier_name" .. i] or ""
			if name and name ~= "" then
				modifier_list[name] = sponsor["modifier_value" .. i]
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
		sponsor = DataInstances.MissionSponsor[sponsor] or {}
		lock_list = {}
		for i=1,const.MissionSponsorLockModifiers do
			local name = sponsor["lock_name" .. i] or ""
			if name and name ~= "" then
				local lock = sponsor["lock_value" .. i]
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
		sponsor = DataInstances.MissionSponsor[sponsor] or {}
		nations_list = {}
		for i=1,const.MissionSponsorNations do
			local nation_name = sponsor["sponsor_nation_name" .. i] or ""
			if nation_name ~= "" then
				nations_list[#nations_list + 1] = {nation_name, sponsor["sponsor_nation_percent" .. i]}
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
end

function InitNewGameMissionParams()
	g_CurrentMissionParams = {}
	for k, v in pairs(MissionParams) do
		if k ~= "idMissionSponsor" and k ~= "idCommanderProfile" then --empty at the beginning
			local items = v.items
			for i=1,#items do
				local item = items[i]
				if item.filter == nil or item.filter == true or (type(item.filter) == "function" and item:filter()) then
					g_CurrentMissionParams[k] = item.name
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
	return setmetatable({}, {__index = MissionSponsor}) -- savegame compatibility
end

function GetMissionSponsor(name)
	name = name or g_CurrentMissionParams.idMissionSponsor
	return name and DataInstances.MissionSponsor[name] or GetDefaultMissionSponsor()
end

function GetDefaultCommanderProfile()
	return setmetatable({}, {__index = CommanderProfile}) -- savegame compatibility
end

function GetCommanderProfile(name)
	name = name or g_CurrentMissionParams.idCommanderProfile
	return name and DataInstances.CommanderProfile[name] or GetDefaultCommanderProfile()
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

----

do
	for i=1,const.MissionSponsorPriceModifiers do
		table.append(MissionSponsor.properties, {
			{ category = "Price Modifiers", id = "modifier_name" .. i,  name = T{3541, "Modifier name <number>", number = i}, editor = "combo", default = "", items = ResupplyItemsCombo },
			{ category = "Price Modifiers", id = "modifier_value" .. i, name = T{3542, "Modifier value <number>", number = i}, editor = "number", default = 0},
		})
	end
	for i=1,const.MissionSponsorLockModifiers do
		table.append(MissionSponsor.properties, {
			{ category = "Lock Modifiers", id = "lock_name" .. i,  name = T{8691, "Cargo <number>", number = i}, editor = "combo",         default = "", items = ResupplyItemsCombo },
			{ category = "Lock Modifiers", id = "lock_value" .. i, name = T{8692, "Status <number>", number = i}, editor = "dropdownlist", default = false, items = LockStatusCombo},
		})
	end
	for i=1,const.MissionSponsorNations do
		table.append(MissionSponsor.properties, {
			{ category = "Sponsor Nations", id = "sponsor_nation_name" .. i,    name = T{3543, "Sponsor nation name <number>", number = i}, editor = "combo", default = "",items = Nations },
			{ category = "Sponsor Nations", id = "sponsor_nation_percent" .. i, name = T{3544, "Sponsor nation percent <number>", number = i}, editor = "number", default = 0},
		})
	end
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
	PGMenuEntries = {"idMissionSponsor", "idCommanderProfile", "idMissionLogo", "idMystery" }
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
	for _, sponsor in ipairs(DataInstances.MissionSponsor) do
		for i = 1,#sponsor do
			local modifier = sponsor[i]
			if ObjectClass(modifier) == "TechEffect_ModifyLabel" and
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
		if ObjectClass(mod) == "TechEffect_ModifyLabel" and
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
	descr[1] = sponsor.effect
	descr[2] = sponsor
	descr.challenge_rating = sponsor.challenge_mod and Untranslated(string.format("%3.2f", (sponsor.challenge_mod + 100)/100.0))
	descr.flavor = include_flavor and sponsor.flavor or ""
	setmetatable(descr, TMeta)
	return descr
end

-------------------------------------------
function GetSponsorEntryRollover(param_t)
	if param_t.effect == "" then return end
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
		local entry = table.find_value(MissionParams[id].items, "name", g_CurrentMissionParams[id])
		local effect = entry and entry.effect or ""
		if effect ~= "" then
			if not rockets_added and IsKindOfClasses(entry, "MissionSponsor", "CommanderProfile") then
				lines[#lines + 1] = T{3546, "Starting Rockets: <rockets>", rockets = GetStartingRockets() }
				rockets_added = true
			end
			if IsKindOf(entry, "MissionSponsor") then
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
		local idx = table.find(search_table, "name", item_id)
		local mod = idx and search_table[idx].challenge_mod or 0
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
		if k ~= "idMissionSponsor" and k ~= "idCommanderProfile" and k ~= "idMystery" then
			g_CurrentMissionParams[k] = GetRandomMissionParam(k)
		end
	end
	g_CurrentMissionParams.idMissionSponsor = "IMM"
	g_CurrentMissionParams.idCommanderProfile = "rocketscientist"
	g_CurrentMissionParams.idMystery = "random"
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
		if item.name ~= "random" and item.name ~= "none" and (item.filter == nil or item.filter == true or (type(item.filter) == "function" and item:filter())) then
			filtered[#filtered + 1] = item
		end
	end
	return filtered[1 + AsyncRand(#filtered)].name
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
	{ params = { sponsor_name = sponsor.display_name, 
					commander_name = commander.display_name , 
					}
	})		
end