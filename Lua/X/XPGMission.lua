if FirstLoad then
	g_DiffBonusObj = false
	g_RenameRocketObj = false
	g_UIAvailableRockets = 0
	g_UITotalRockets = 0
end

DefineClass.PGDifficultyObject = {
	__parents = { "PropertyObject" },
	
	replace_param = false,
	replace_value = false,
	map_challenge_rating = false,
	
}

function PGDifficultyObject:GetDifficultyBonus()
	return CalcChallengeRating(self.replace_param, self.replace_value, self.map_challenge_rating)
end

function PGDifficultyObjectCreate()
	g_DiffBonusObj = g_DiffBonusObj or PGDifficultyObject:new()
	return g_DiffBonusObj
end

local function MissionParamCombo(id)
	local items = {}
	for k,v in ipairs(MissionParams[id].items) do
		if v.filter == nil or v.filter == true or (type(v.filter) == "function" and v:filter()) then
			local rollover
			if id == "idMissionSponsor" then
				rollover = GetSponsorEntryRollover(v)
				if rollover then
					rollover.descr = T{3546, "Starting Rockets: <rockets>", rockets = GetStartingRockets(v, nil, true) } .. "<newline>" .. rollover.descr
				end
			else
				rollover = GetEntryRollover(v)
			end
			items[#items + 1] = {
				value = v.name,
				text = v.display_name,
				rollover = rollover,
				image = id == "idMissionLogo" and v.image,
			}
		end
	end
	return items
end

DefineClass.PGMissionObject = {
	__parents = { "PropertyObject" },
	properties = {
		{id = "idMissionSponsor", name = T{3474, "Mission Sponsor"}, title = T{3475, "MISSION SPONSOR"}, descr = T{3476, "The patron country or organization standing behind the Mars mission. Grants funding, research and other benefits to colony."}, gamepad_hint = T{3477, "<ButtonA> Choose Sponsor"}, editor = "dropdown", default = "", items = function() return MissionParamCombo("idMissionSponsor") end, submenu = true, },
		{id = "idCommanderProfile", name = T{3478, "Commander Profile"}, title = T{3479, "COMMANDER PROFILE"}, descr = T{3480, "The mission commander grants various benefits to the colony."}, gamepad_hint = T{3481, "<ButtonA> Choose Commander"}, editor = "dropdown", default = "", items = function() return MissionParamCombo("idCommanderProfile") end, submenu = true, },
		{id = "idMissionLogo", name = T{3482, "Colony Logo"}, title = T{3483, "COLONY LOGO"}, descr = T{3484, "This is an aesthetic choice that has no effect on gameplay."}, gamepad_hint = T{3485, "<ButtonA> Choose Logo"}, editor = "dropdown", default = "", items = function() return MissionParamCombo("idMissionLogo") end, submenu = true, },
		{id = "idMystery", name = T{3486, "Mystery"}, title = T{3487, "MYSTERY"}, descr = T{3488, "Select an active storyline for this playthrough."}, gamepad_hint = T{3489, "<ButtonA> Choose Mystery"}, editor = "dropdown", default = "", items = function() return MissionParamCombo("idMystery") end, submenu = true, },
	},
}

function PGMissionObject:GetRollover(item)
	local id = item.id
	if id == "idMissionSponsor" or id == "idCommanderProfile" then
		local entry = table.find_value(MissionParams[id].items, "name", self[id])
		local descr = item.descr
		local effect = entry and entry.effect or ""
		if effect ~= "" then
			if id == "idMissionSponsor" then
				descr = descr .. "<newline><newline>" .. T{3546, "Starting Rockets: <rockets>", rockets = GetStartingRockets() }
				descr = descr .. "<newline>" .. GetSponsorDescr(entry)
			else
				descr = descr .. "<newline><newline>" .. T{ effect, entry }
			end
		end
		return {
			title = item.title,
			descr = descr,
			gamepad_hint = item.gamepad_hint,
		}
	end
	return item
end

function PGMissionObject:GetEffects()
	return GetDescrEffects()
end

function PGMissionObjectCreateAndLoad()
	local obj = PGMissionObject:new()
	for k, v in pairs(g_CurrentMissionParams) do
		obj[k] = v
	end
	return obj
end

function GetCargoSumTitle(name)
	return T{4065, "<color 203 120 30><font PGLandingPosName><name></font></color><newline>", name = name}
end

------ RocketRenameObject
DefineClass.RocketRenameObject = {
	__parents = {"PropertyObject"},
	pregame = false,
	rocket_name = false,
	rocket_name_base = false,
	rolover_image = "UI/Common/pm_rename_rollover.tga",
	normal_image = "UI/Common/pm_rename.tga",
	rename_image = "UI/Common/pm_rename.tga",
}

function RocketRenameObject:InitRocketName(pregame)
	self.pregame = pregame
	if self.pregame then
		if not g_CurrentMapParams.rocket_name then
			g_CurrentMapParams.rocket_name, g_CurrentMapParams.rocket_name_base = GenerateRocketName(true)
		end
		self.rocket_name = g_CurrentMapParams.rocket_name
		self.rocket_name_base = g_CurrentMapParams.rocket_name_base
	else
		local rockets = UICity.labels.SupplyRocket or empty_table
		local has_rocket = false
		for _, rocket in ipairs(rockets) do
			if rocket:IsAvailable() and rocket.name~="" then
				self.rocket_name = rocket.name
				break
			end
		end
		if not self.rocket_name then
			self.rocket_name, self.rocket_name_base = GenerateRocketName(true)
		end
	end
end

function RocketRenameObject:GetRocketName()
	if UICity and UICity.launch_elevator_mode then
		return DataInstances.BuildingTemplate.SpaceElevator.display_name
	end
	return self.rocket_name
end

function RocketRenameObject:SetRocketName(rocket_name)
	self.rocket_name = rocket_name
	if self.pregame then
		g_CurrentMapParams.rocket_name = self.rocket_name
	end
end

function RocketRenameObject:RenameRocket(host, func)
	CreateMarsRenameControl(host, T{4069, "Rename Rocket"}, self:GetRocketName(), 
		function(name) 
			local prev = self:GetRocketName()			
			self:SetRocketName(name) 
			if func then func() end 
			if prev~=name then
				self.rocket_name_base = false
			end
		end, 
		nil, self, {max_len = 23})
end

function RocketRenameObject:GetRocketHyperlink()
	local base
	if UICity and UICity.launch_elevator_mode then
		return DataInstances.BuildingTemplate.SpaceElevator.display_name
	end
	if GetUIStyleGamepad() then
		base = T{7560, "<h RenameRocket Rename>",}
	else
		base = T{6898, "<h RenameRocket Rename>< image <img> 2000 > ", img = Untranslated(self.rename_image)}
	end
	return base .. T{self.rocket_name} .. T{4162, "</h>"}
end

function InitRocketRenameObject(pregame, new_instance)
	if not g_RenameRocketObj or new_instance then
		g_RenameRocketObj = RocketRenameObject:new()
		g_RenameRocketObj:InitRocketName(pregame)
	end
	return g_RenameRocketObj
end



function ResupplyDialogOpen(host, ...)
	local rockets = UICity and UICity.labels.SupplyRocket or ""
	local available = 0
	local total = #rockets
	for i = 1, total do
		if rockets[i]:IsAvailable() then
			available = available + 1
		end
	end
	g_UIAvailableRockets = available
	g_UITotalRockets = total
	
	if g_ActiveHints["HintResupply"] then
		HintDisable("HintResupply")
	end
	if HintsEnabled then
		ContextAwareHintShow("HintResupplyUI", true)
		local hintdlg = GetOnScreenHintDlg()
		if hintdlg then
			hintdlg:SetParent(terminal.desktop)
			hintdlg:SetHiddenMinimized(true)
		end
	end
end

function ResupplyDialogClose(host, ...)
	g_RenameRocketObj = false
	ResetCargo()
	g_UIAvailableRockets = 0
	g_UITotalRockets = 0
	
	if g_ActiveHints["HintResupplyUI"] then
		ContextAwareHintShow("HintResupplyUI", false)
	end
	if HintsEnabled then
		local hintdlg = GetOnScreenHintDlg()
		if hintdlg then
			hintdlg:SetParent(GetInGameInterface())
			hintdlg:SetHiddenMinimized(false)
		end
	end
end

function BuyRocket(host)
	CreateRealTimeThread(function()
		local price = GetMissionSponsor().rocket_price
		if UICity and (UICity:GetFunding() - g_CargoCost) >= price then
			if WaitMarsQuestion(host, T{6880, "Warning"}, T{6881, "Are you sure you want to buy a new Rocket for <funding(price)>?", price = price}, T{1138, "Yes"}, T{1139, "No"}, "UI/Messages/rocket.tga") == "ok" then
				g_UIAvailableRockets = g_UIAvailableRockets + 1
				g_UITotalRockets = g_UITotalRockets + 1
				UICity:ChangeFunding(-price)
				local rocket = PlaceBuilding("SupplyRocket", {city = UICity})
				UICity:AddToLabel("SupplyRocket", rocket) -- add manually to avoid reliance on running game time
				local obj = host.context
				ObjModified(obj)
			end
		else
			CreateMarsMessageBox(T{6902, "Warning"}, T{7546, "Insufficient funding! You need <funding(price)> to purchase a Rocket!", price = price}, T{1000136, "OK"}, host)
		end
	end)
end

function LaunchCargoRocket(obj, func_on_launch)
	local elevator = UICity and UICity.launch_elevator_mode
	CreateRealTimeThread(function(cargo, cost, obj)
		if elevator then
			assert(UICity.labels.SpaceElevator and #UICity.labels.SpaceElevator > 0)
			UICity.labels.SpaceElevator[1]:OrderResupply(cargo, cost)
		else
			cargo.rocket_name = g_RenameRocketObj.rocket_name
			MarkNameAsUsed("Rocket", g_RenameRocketObj.rocket_name_base)
			UICity:OrderLanding(cargo, cost)
		end
		if func_on_launch then
			func_on_launch()
		end
	end, g_RocketCargo, g_CargoCost, obj)
	
	if HintsEnabled then
		HintDisable("HintResupplyUI")
	end
end

------ PayloadObject

DefineClass.RocketPayloadObject = {
	__parents = { "PropertyObject" },
	properties = {
		{ id = "idPrefabs", category = "Payload", name = T{1109, "Prefab Buildings"}, editor = "payload", default = 0, submenu = true, }
	},
}

function RocketPayload_GetMeta(id)
	assert(#(ResupplyItemDefinitions or "") > 0)
	assert(type(id) == "string")
	return table.find_value(ResupplyItemDefinitions, "id", id)
end

function RocketPayload_GetCargo(id)
	return table.find_value(g_RocketCargo, "class", id)
end

function RocketPayload_GetAmount(id)
	local cargo = RocketPayload_GetCargo(id)
	return cargo and cargo.amount or 0
end

function RocketPayloadObject:GetProperties()
	local props = table.icopy(self.properties)
	table.append(props, ResupplyItemDefinitions)
	return props
end

function RocketPayloadObject:IsLocked(item_id)
	local def = RocketPayload_GetMeta(item_id)
	return def and def.locked
end

GlobalVar("g_ImportLocks", {})

--[[@@@
	Locks an item from the list of available imports. Once locked an item will no longer be visible in the resupply interface until unlocked.

	@function void Gameplay@LockImport(string item, string lock_id)
	@param string item - The name of the item to be locked.
	@param string lock_id - Lock id of the lock. For an item to be unlocked all unique locks must be removed.
	@result void
]]

function LockImport(item, lock_id)
	local locks = g_ImportLocks[item] or {}
	g_ImportLocks[item] = locks
	locks[lock_id] = true
end

--[[@@@
	Removes a lock or all locks from an import item. Unlocked item will appear normally in the resupply interface.

	@function void Gameplay@UnlockImport(string item[, string lock_id])
	@param string crop_name - The name of the item to be unlocked.
	@param string lock_id - Optional. Lock id of the lock. For an item to be unlocked all unique locks must be removed. If omitted all locks for the given item will be removed.
	@result void
]]
function UnlockImport(item, lock_id)
	if not lock_id then
		g_ImportLocks[item or false] = nil
	else
		local locks = g_ImportLocks[item or false]
		if locks then
			locks[lock_id] = nil
			if next(locks) == nil then
				g_ImportLocks[item or false] = nil
			end
		end
	end
end

function RocketPayloadObject:IsBlacklisted(prop_meta)
	if prop_meta.id == "OrbitalProbe" and GameState.gameplay then
		local _, fully_scanned = UnexploredSectorsExist()
		return fully_scanned
	end
	
	if g_ImportLocks[prop_meta.id] and next(g_ImportLocks[prop_meta.id]) ~= nil then
		return true
	end

	local blacklist_classes = UICity and UICity.launch_elevator_mode and {"Vehicle"}
	return blacklist_classes and IsKindOfClasses(g_Classes[prop_meta.id], blacklist_classes)
end

function RocketPayload_CalcCargoWeightCost()
	g_CargoCost = 0
	g_CargoWeight = 0
	for k, item in ipairs(ResupplyItemDefinitions) do
		g_CargoCost = g_CargoCost + RocketPayload_GetTotalItemPrice(item)
		g_CargoWeight = g_CargoWeight + RocketPayload_GetTotalItemWeight(item)
	end
end

function RocketPayloadObject:AddItem(item_id)
	local item = RocketPayload_GetMeta(item_id)
	if self:CanLoad(item) then
		local cargo = RocketPayload_GetCargo(item_id)
		if cargo then
			cargo.amount = cargo.amount + item.pack
			ObjModified(self)
		end
	end
end

function RocketPayloadObject:RemoveItem(item_id)
	local item = RocketPayload_GetMeta(item_id)
	if self:CanUnload(item) then
		local cargo = RocketPayload_GetCargo(item_id)
		if cargo then
			cargo.amount = Max(0, cargo.amount - item.pack)
			ObjModified(self)
		end
	end
end

function RocketPayloadObject:CanLoad(item)
	return item and self:GetFunding() >= RocketPayload_GetItemPrice(item) and self:GetCapacity() >= item.kg
end

function RocketPayloadObject:CanUnload(item)
	return item and RocketPayload_GetAmount(item.id) - item.pack >= 0
end

function RocketPayloadObject:GetCapacity()
	assert(g_RocketCargo)
	local cargo = UICity and UICity:GetCargoCapacity() or GetMissionSponsor().cargo
	return cargo - g_CargoWeight
end

function RocketPayloadObject:GetFunding()
	assert(g_RocketCargo)
	local funding = UICity and UICity:GetFunding() or GetMissionSponsor().funding*1000000
	return funding - g_CargoCost
end

function RocketPayloadObject:GetAvailableRockets()
	return g_UIAvailableRockets
end

function RocketPayloadObject:GetTotalRockets()
	return g_UITotalRockets
end

function RocketPayloadObject:GetRocketName()
	local name = g_RenameRocketObj:GetRocketHyperlink()
	return GetCargoSumTitle(name)
end

function RocketPayloadObject:RenameRocket(host)
	g_RenameRocketObj:RenameRocket(host, function() ObjModified(self) end)
end

function RocketPayloadObject:PassengerRocketDisabledRolloverTitle()
	if not AreNewColonistsAccepted() then
		return T{8536, "Colonization Temporarily Suspended"}
	else
		return ""
	end
end

function RocketPayloadObject:PassengerRocketDisabledRolloverText()
	if not AreNewColonistsAccepted() then
		return T{8537, "<SponsorDisplayName> has to make sure the Colony is sustainable before allowing more Colonists to come to Mars. Make sure the Founders are supplied with Water, Oxygen, and Food for 10 Sols after they arrive on Mars.", SponsorDisplayName = GetMissionSponsor().display_name}
	else
		return T{8538, "Rockets unavailable."}
	end
end

function RocketPayloadObject:GetPrefabsTitle()
	local name = T{4068, "PREFABS"}
	return GetCargoSumTitle(name)
end

function RocketPayloadObject:GetRocketTypeTitle()
	local name = T{4067, "SELECT ROCKET"}
	return GetCargoSumTitle(name)
end

function RocketPayloadObject:SetProperty(id, value)
	local cargo = RocketPayload_GetCargo(id)
	if cargo then
		cargo.amount = value
		return
	end
	return PropertyObject.SetProperty(self, id, value)
end

function RocketPayloadObject:GetProperty(id)
	local cargo = RocketPayload_GetCargo(id)
	if cargo then
		return cargo.amount
	end
	return PropertyObject.GetProperty(self, id)
end

function RocketPayloadObject:GetAmount(item)
	local amount = 0
	if not item then
		amount = RocketPayload_GetPrefabsCount()
	else
		amount = RocketPayload_GetAmount(item.id)
	end
	return amount
end

function RocketPayload_GetPrefabsCount()
	local templates = DataInstances.BuildingTemplate
	local prefab_count = 0
	for k, item in ipairs(ResupplyItemDefinitions) do
		if not item.locked and templates[item.id] then
			prefab_count = prefab_count + RocketPayload_GetAmount(item.id)
		end
	end
	return prefab_count
end

function RocketPayloadObject:GetPrice(item)
	local money
	if not item then
		money = RocketPayload_GetPrefabsPrice()
	else
		money = RocketPayload_GetTotalItemPrice(item)
	end
	return T{4075, "<funding(money)>", money = money}
end

function RocketPayload_GetTotalItemPrice(item)
	return (RocketPayload_GetAmount(item.id) / item.pack) * RocketPayload_GetItemPrice(item)
end

function RocketPayload_GetItemPrice(item)
	local price = item.price
	if UICity and UICity.launch_elevator_mode and #(UICity.labels.SpaceElevator or empty_table) > 0 then
		local price_mod = UICity.labels.SpaceElevator[1].price_mod
		price = MulDivRound(item.price, price_mod, 100)
	end
	return price
end

function RocketPayload_GetTotalItemWeight(item)
	return (RocketPayload_GetAmount(item.id) / item.pack) * item.kg
end

function RocketPayload_GetPrefabsPrice()
	local money = 0
	local templates = DataInstances.BuildingTemplate
	for k, item in ipairs(ResupplyItemDefinitions) do
		local template = templates[item.id]
		if template then
			money = money + RocketPayload_GetTotalItemPrice(item)
		end
	end
	return money
end

function RocketPayloadObject:GetRollover(id)
	if id == "idPrefabs" then
		return {
			title = T{1110, "Prefab Buildings"},
			descr = T{1111, "Prefabricated parts needed for the construction of certain buildings on Mars."},
			hint =  T{1112, "<left_click> Browse Prefab Buildings"},
			gamepad_hint = T{1113, "<ButtonA> Browse Prefab Buildings"},
		}
	end
	local item = RocketPayload_GetMeta(id)
	if not item then
		assert(false, "No such cargo item!")
		return
	end
	local display_name, description = item.name, item.description
	if not display_name or display_name == "" then
		display_name, description = ResolveDisplayName(id)
	end
	description = (description and description ~= "" and description .. "<newline><newline>") or ""
	local icon = item.icon and Untranslated("<image "..item.icon.." 2000><newline><newline>") or ""
	description = icon..description .. T{1114, "Weight: <value> kg<newline>Cost: <funding(cost)>", value = item.kg, cost = RocketPayload_GetItemPrice(item)}
	if GameState.gameplay and Resources[item.id] and ResourceOverviewObj.data then
		description = description .. T{8722, "<newline><newline>Available in the colony: <number>", number = FormatResource(ResourceOverviewObj:GetAvailable(item.id), item.id)}
	end
	return {
		title = display_name,
		descr = description,
		gamepad_hint = T{7580, "<DPadLeft> Change value <DPadRight>"},
	}
end

function RocketPayloadObjectCreateAndLoad(pregame)
	InitRocketRenameObject(pregame, true)
	if pregame then
		RocketPayload_Init()
	else
		g_RocketCargo = false
	end
	if not g_RocketCargo then
		g_RocketCargo = GetMissionInitialLoadout(pregame)
		RocketPayload_CalcCargoWeightCost()
	end
	return RocketPayloadObject:new()
end