if FirstLoad then
	g_TitleObj = false
	g_RenameRocketObj = false
	g_UIAvailableRockets = 0
	g_UITotalRockets = 0
end

DefineClass.PGTitleObject = {
	__parents = { "PropertyObject" },
	replace_param = false,
	replace_value = false,
	map_challenge_rating = false,
}

function PGTitleObject:GetTitleText()
	local dlg = GetDialog("PGMainMenu")	
	if dlg and dlg.Mode == "Challenge" then
		local mode = dlg.idContent.PGChallenge.Mode
		if mode == "landing" then
			return T(10880, "CHALLENGES") .. Untranslated("<newline>") .. T{10881, "<white>Completed <CompletedChallenges>/<TotalChallenges></white>", self}
		elseif mode == "payload" then
			return T(4159, "PAYLOAD")
		else
			return ""
		end
	end
	if dlg and dlg.Mode == "Mission" then
		local mode = dlg.idContent.PGMission and dlg.idContent.PGMission.Mode or false
		if mode == "sponsor" then
			return T(10892, "MISSION PARAMETERS") .. Untranslated("<newline>") .. T{10893, "<white>Difficulty Challenge <percent(DifficultyBonus)></white>", self}
		elseif mode == "payload" then
			return T(4159, "PAYLOAD") .. Untranslated("<newline>") .. T{10893, "<white>Difficulty Challenge <percent(DifficultyBonus)></white>", self}
		elseif mode == "landing" then
			return T(10894, "COLONY SITE") .. Untranslated("<newline>") .. T{10893, "<white>Difficulty Challenge <percent(DifficultyBonus)></white>", self}
		else
			return ""
		end
	end
	
	local dlg = GetDialog("Resupply")
	if dlg then
		return T(4159, "PAYLOAD") .. Untranslated("<newline>") .. T{10893, "<white>Difficulty Challenge <percent(DifficultyBonus)></white>", self}
	end
	return ""
end

function PGTitleObject:GetDifficultyBonus()
	return 100 + CalcChallengeRating(self.replace_param, self.replace_value, self.map_challenge_rating)
end

function PGTitleObject:GetCompletedChallenges()
	return GetCompletedChallenges()
end

function PGTitleObject:GetTotalChallenges()
	return GetTotalChallenges()
end

function PGTitleObject:RecalcMapChallengeRating()
	self.map_challenge_rating = GetMapChallengeRating()
end

function PGTitleObjectCreate()
	g_TitleObj = PGTitleObject:new()
	return g_TitleObj
end

function GetCompletedChallenges()
	local n = 0
	ForEachPreset("Challenge", function(preset) 
		if preset.id ~= "" and AccountStorage.CompletedChallenges and AccountStorage.CompletedChallenges[preset.id] then
			n = n + 1
		end
	end)
	return n
end

function GetTotalChallenges()
	local n = 0
	ForEachPreset("Challenge", function(preset) 
		if preset.id ~= "" then
			n = n + 1
		end
	end)
	return n
end

local function MissionParamCombo(id)
	local items = {}
	for k,v in ipairs(MissionParams[id].items) do
		if v.filter == nil or v.filter == true or (type(v.filter) == "function" and v:filter()) then
			local rollover
			if id == "idMissionSponsor" then
				rollover = GetSponsorEntryRollover(v)
				if rollover and rollover.descr and rollover.descr.flavor~="" then
					rollover.descr = table.concat({rollover.descr, rollover.descr.flavor},"\n")
				end
			else
				rollover = GetEntryRollover(v)
			end
			items[#items + 1] = {
				value = v.id,
				text = T{11438, "<new_in(new_in)>", new_in = v.new_in} .. v.display_name,
				rollover = rollover,
				image = id == "idMissionLogo" and v.image,
				item_type = id,
			}
		end
	end
	return items
end

function GetMissionParamUICategories()
	local keys = GetSortedMissionParamsKeys()
	local items = {}
	for _, category in ipairs(keys) do
		local value = MissionParams[category]
		items[#items + 1] = {
			id = category,
			name = value.display_name,
			title = value.display_name_caps,
			descr = value.descr,
			gamepad_hint = value.gamepad_hint,
			editor = "dropdown",
			submenu = true,
			items = function()
				return MissionParamCombo(category)
			end,
		}
	end
	return items
end

function GetMissionParamRollover(item, value)
	local id = item.id
	if id == "idMissionSponsor" or id == "idCommanderProfile" then
		local entry = table.find_value(MissionParams[id].items, "id", value)
		local descr = item.descr
		local effect = entry and entry.effect or ""
		if effect ~= "" then
			if id == "idMissionSponsor" then
				descr = descr .. "<newline><newline>" .. GetSponsorDescr(entry, false, "include rockets")
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
	if id == "idGameRules" then
		local descr = item.descr
		local names = GetGameRulesNames()
		if names and names ~= "" then
			descr = table.concat({descr, names}, "\n\n")
		end
		return {
			title = item.title,
			descr = descr,
			gamepad_hint = item.gamepad_hint,
		}
	end
	return item
end

DefineClass.PGMissionObject = {
	__parents = { "PropertyObject" },
	params = false,
}

function PGMissionObject:GetEffects()
	return GetDescrEffects()
end

function PGMissionObject:GetProperty(prop_id)
	if self.params[prop_id] then
		return self.params[prop_id]
	end
	return PropertyObject.GetProperty(self, prop_id)
end

function PGMissionObject:SetProperty(prop_id, prop_val)
	self.params[prop_id] = prop_val
end

function PGMissionObject:GetDifficultyBonus()
	if g_TitleObj then
		return g_TitleObj:GetDifficultyBonus()
	end
	return ""
end

function PGMissionObjectCreateAndLoad(obj)
	local obj = PGMissionObject:new(obj)
	obj.params = {}
	for k, v in pairs(g_CurrentMissionParams) do
		obj.params[k] = v
	end
	return obj
end

function GetCargoSumTitle(name)
	return T{4065, "<style LandingPosName><name></style><newline>", name = name}
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
	--if UICity and UICity.launch_elevator_mode then
	if UICity and UICity.launch_mode == "elevator" then
		return BuildingTemplates.SpaceElevator.display_name
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
	CreateMarsRenameControl(host, T(4069, "Rename"), self:GetRocketName(), 
		function(name) 
			local prev = self:GetRocketName()			
			self:SetRocketName(name) 
			if func then func() end 
			if prev~=name then
				self.rocket_name_base = false
			end
		end, 
		nil, self, {max_len = 23, console_show = Platform.steam and GetUIStyleGamepad()})
end

function RocketRenameObject:GetRocketHyperlink()
	if UICity and UICity.launch_mode == "elevator" then
		return BuildingTemplates.SpaceElevator.display_name
	end
	local base = T{6898, "<h RenameRocket Rename>< image <img> 2000 > ", img = Untranslated(self.rename_image)}
	return T{11250, "<base><name><end_link>", base = base, name = Untranslated(self.rocket_name), end_link = T(4162, "</h>")}
end

function InitRocketRenameObject(pregame, new_instance)
	if not g_RenameRocketObj or new_instance then
		g_RenameRocketObj = RocketRenameObject:new()
		g_RenameRocketObj:InitRocketName(pregame)
	end
	return g_RenameRocketObj
end



function ResupplyDialogOpen(host, ...)
	local rockets = UICity and UICity.labels.AllRockets or ""
	local owned, available = 0, 0
	local total = #rockets
	for i = 1, total do
		local supply_pod = rockets[i]:IsKindOf("SupplyPod")
		if rockets[i].owned then
			if not supply_pod then
				owned = owned + 1
			end
			if rockets[i]:IsAvailable() and not supply_pod then
				available = available + 1
			end
		end
	end
	g_UIAvailableRockets = available
	g_UITotalRockets = owned
		
	if g_ActiveHints["HintResupply"] then
		HintDisable("HintResupply")
	end
	if HintsEnabled or g_Tutorial then
		if HintsEnabled then
			ContextAwareHintShow("HintResupplyUI", true)
		end
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
	if HintsEnabled or g_Tutorial then
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
			if WaitMarsQuestion(host, T(6880, "Warning"), T{6881, "Are you sure you want to buy a new Rocket for <funding(price)>?", price = price}, T(1138, "Yes"), T(1139, "No"), "UI/Messages/rocket.tga") == "ok" then
				g_UIAvailableRockets = g_UIAvailableRockets + 1
				g_UITotalRockets = g_UITotalRockets + 1
				UICity:ChangeFunding(-price, "Rocket")
				local rocket = PlaceBuilding(GetRocketClass(), {city = UICity})
				UICity:AddToLabel("SupplyRocket", rocket) -- add manually to avoid reliance on running game time
				rocket:SetCommand("OnEarth")
				local obj = host.context
				ObjModified(obj)
			end
		else
			CreateMarsMessageBox(T(6902, "Warning"), T{7546, "Insufficient funding! You need <funding(price)> to purchase a Rocket!", price = price}, T(1000136, "OK"), host)
		end
	end)
end

function SetupLaunchLabel(mode)
	local label = "SupplyRocket"
	if mode == "pod" then
		label = "SupplyPod"
	end
	return label
end

function LaunchCargoRocket(obj, func_on_launch)
	--local elevator = UICity and UICity.launch_elevator_mode
	--local elevator = UICity and UICity.launch_mode == "elevator"
	local mode = UICity and UICity.launch_mode or "rocket"
	local label = SetupLaunchLabel(mode)
	
	Msg("ResupplyRocketLaunched", label, g_CargoCost)
	
	CreateRealTimeThread(function(cargo, cost, obj, mode, label)
		if mode == "elevator" then
			assert(UICity.labels.SpaceElevator and #UICity.labels.SpaceElevator > 0)
			UICity.labels.SpaceElevator[1]:OrderResupply(cargo, cost)
		else
			cargo.rocket_name = g_RenameRocketObj.rocket_name
			MarkNameAsUsed("Rocket", g_RenameRocketObj.rocket_name_base)
			UICity:OrderLanding(cargo, cost, false, label)
		end
		if func_on_launch then
			func_on_launch()
		end
	end, g_RocketCargo, g_CargoCost, obj, mode, label)
	
	if HintsEnabled then
		HintDisable("HintResupplyUI")
	end
end

------ PayloadObject

DefineClass.RocketPayloadObject = {
	__parents = { "PropertyObject" },
	properties = {
		{ id = "idPrefabs", category = "Payload", name = T(1109, "Prefab Buildings"), editor = "payload", default = 0, submenu = true, }
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
	
	if prop_meta.id == "Food" and IsGameRuleActive("Hunger") then
		return true
	end
	
	if g_ImportLocks[prop_meta.id] and next(g_ImportLocks[prop_meta.id]) ~= nil then
		return true
	end

	--local blacklist_classes = UICity and UICity.launch_elevator_mode and {"Vehicle"}
	local blacklist_classes = UICity and UICity.launch_mode == "elevator" and {"Vehicle"}
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

function LaunchModeCargoExceeded(item)
end

function RocketPayloadObject:CanLoad(item)
	if LaunchModeCargoExceeded(item) then
		return false
	end
	local cargo = item and RocketPayload_GetCargo(item.id)
	local loaded_amount = cargo and cargo.amount or 0
	return item and loaded_amount < item.max and self:GetFunding() >= RocketPayload_GetItemPrice(item) and self:GetCapacity() >= RocketPayload_GetItemWeight(item)
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
	local funding = UICity and UICity:GetFunding() or GetSponsorModifiedFunding()*1000000
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
	if IsGameRuleActive("TheLastArk") then
		return T(972855831022, "The Last Ark")
	elseif not AreNewColonistsAccepted() then
		return T(10446, "Colonization Temporarily Suspended")
	else
		return T(1116, "Passenger Rocket")
	end
end

function RocketPayloadObject:PassengerRocketDisabledRolloverText()
	if IsGameRuleActive("TheLastArk") then
		return T(10447, "Can call a Passenger Rocket only once.")
	elseif not AreNewColonistsAccepted() then
		return T{8537, "<SponsorDisplayName> has to make sure the Colony is sustainable before allowing more Colonists to come to Mars. Make sure the Founders are supplied with Water, Oxygen, and Food for 10 Sols after they arrive on Mars.", SponsorDisplayName = GetMissionSponsor().display_name or ""}
	else
		return T(8538, "Rockets unavailable.")
	end
end

function RocketPayloadObject:GetPrefabsTitle()
	local name = T(4068, "PREFABS")
	return GetCargoSumTitle(name)
end

function RocketPayloadObject:GetRocketTypeTitle()
	local name = T(4067, "SELECT ROCKET")
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

function RocketPayloadObject:GetDifficultyBonus()
	if g_TitleObj then
		return g_TitleObj:GetDifficultyBonus()
	end
	return ""
end

function RocketPayload_GetPrefabsCount()
	local prefab_count = 0
	for k, item in ipairs(ResupplyItemDefinitions) do
		if not item.locked and BuildingTemplates[item.id] then
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

function RocketPayloadObject:GetNumAvailablePods(label)
	local n = 0
	for _, pod in ipairs(UICity.labels[label] or empty_table) do
		if pod:IsAvailable() then
			n = n + 1
		end
	end
	return n
end

function RocketPayloadObject:GetAvailableSupplyPods()
	return self:GetNumAvailablePods("SupplyPod")
end

function RocketPayloadObject:GetTotalSupplyPods()
	return table.count(UICity.labels.SupplyPod or {})
end

function RocketPayloadObject:GetAvailablePassengerPods()
	return self:GetNumAvailablePods("PassengerPod")
end

function RefundPods(label)
	local list = UICity.labels[label] or empty_table
	for i = #list, 1, -1 do
		if list[i].refund > 0 then
			DoneObject(list[i])
		end
	end
end

function RefundPassenger()
end

function RefundSupply()
	RefundPods("SupplyPod")
end

function RocketPayload_GetTotalItemPrice(item)
	return (RocketPayload_GetAmount(item.id) / item.pack) * RocketPayload_GetItemPrice(item)
end

function RocketPayload_GetItemPrice(item)
	local price = item.price
	--if UICity and UICity.launch_elevator_mode and #(UICity.labels.SpaceElevator or empty_table) > 0 then
	if UICity and UICity.launch_mode == "elevator" and #(UICity.labels.SpaceElevator or empty_table) > 0 then
		local price_mod = UICity.labels.SpaceElevator[1].price_mod
		price = MulDivRound(item.price, price_mod, 100)
	end
	
	local sponsor = GetMissionSponsor()
	if sponsor.WeightCostModifierGroup == item.group then
		price = MulDivRound(price, sponsor.CostModifierPercent, 100)
	end
	
	return price
end

function RocketPayload_GetTotalItemWeight(item)
	return (RocketPayload_GetAmount(item.id) / item.pack) * RocketPayload_GetItemWeight(item)
end

function RocketPayload_GetItemWeight(item)
	local weight = item.kg
	
	local sponsor = GetMissionSponsor()
	if sponsor.WeightCostModifierGroup == item.group then
		weight = MulDivRound(weight, sponsor.WeightModifierPercent, 100)
	end
	
	return weight
end

function RocketPayload_GetPrefabsPrice()
	local money = 0
	for k, item in ipairs(ResupplyItemDefinitions) do
		if BuildingTemplates[item.id] then
			money = money + RocketPayload_GetTotalItemPrice(item)
		end
	end
	return money
end

function RocketPayloadObject:GetRollover(id)
	if id == "idPrefabs" then
		return {
			title = T(1110, "Prefab Buildings"),
			descr = T(1111, "Prefabricated parts needed for the construction of certain buildings on Mars."),
			hint =  T(1112, "<left_click> Browse Prefab Buildings"),
			gamepad_hint = T(1113, "<ButtonA> Browse Prefab Buildings"),
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
	description = icon..description .. T{1114, "Weight: <value> kg<newline>Cost: <funding(cost)>", value = RocketPayload_GetItemWeight(item), cost = RocketPayload_GetItemPrice(item)}
	return {
		title = display_name,
		descr = description,
		gamepad_hint = T(7580, "<DPadLeft> Change value <DPadRight>"),
	}
end

function RocketPayloadObject:GetPodItemText()
	local pod_class = GetMissionSponsor().pod_class
	local template = pod_class and BuildingTemplates[pod_class]
	local name = template and template.display_name or T(824938247285, "Supply Pod")
	
	if self:GetNumAvailablePods("SupplyPod") > 0 then
		return T(11439, "<new_in('gagarin')>") .. name
	end
	return T(11439, "<new_in('gagarin')>") .. T{10860, "<name> ($<cost> M)", name = name, cost = GetMissionSponsor().pod_price / (1000*1000)}
end

function RocketPayloadObjectCreateAndLoad(pregame)
	InitRocketRenameObject(pregame, true)
	if pregame then
		RocketPayload_Init()
	else
		g_RocketCargo = false
		g_CargoMode = false
	end
	if not g_RocketCargo then
		g_RocketCargo = GetMissionInitialLoadout(pregame)
		RocketPayload_CalcCargoWeightCost()
	end
	return RocketPayloadObject:new()
end

function ClearRocketCargo()
	g_RocketCargo = GetMissionInitialLoadout()
	RocketPayload_CalcCargoWeightCost()	
end