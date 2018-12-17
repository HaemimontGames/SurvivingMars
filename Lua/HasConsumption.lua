function GetConsumptionResourcesDropDownItems()
	local ret = table.copy(ResourcesDropDownListItems)
	--rem stuff that cannot be maintenance
	table.remove_entry(ret, "value", nil)
	table.remove_entry(ret, "value", "Water")
	table.remove_entry(ret, "value", "BlackCube")
	table.remove_entry(ret, "value", "Colonist")
	
	--add maintenance specific stuff
	table.insert(ret, 1, {text = T(89, "No consumption"), value = "no_consumption"})
	
	return ret
end

function GetConsumptionTypeDropdownItems()
	return {
		{ text = T(80, "Production"), value = 1 }, --used by production blds (ResourceProducer) 1 unit production = 1 unit consumption * consumption_amount/1000
		{ text = T(90, "Visit"), value = 2 }, --used by food suppliers, consumption_amount is consumed per commie visit, if totall is less, commie regains less needs proportionally
		{ text = T(91, "Shuttle"), value = 3 }, --used for shuttle refuel. 1 * consumption_amount / const.ResourceScale units consumption = 1 full shuttle refuel
		{ text = T(4819, "Workshop"), value = 4 }, --used for workshop consumption
	}
end

g_ConsumptionType = {
	"Production", "Visit", "Shuttle", "Workshop",
	["Production"] = 1,
	["Visit"] = 2,
	["Shuttle"] = 3,
	["Workshop"] = 4
}

--consumption (aka upkeep, but different)
--basically does the same thing as resourcestockpilebase, but slightly different, also probably good idea to keep buildings ~= stockpiles
--[[@@@
@class HasConsumption
class overview...
--]]
DefineClass.HasConsumption = {
	__parents = { "TaskRequester" },
	properties = {
		{template = true, category = "Resource Consumption", name = T(117, "Consumption Resource Type"),id = "consumption_resource_type", editor = "dropdownlist", items = GetConsumptionResourcesDropDownItems(), default = GetConsumptionResourcesDropDownItems()[1].value, help = "The type of resource associated with consumption demands.",},
		{template = true, category = "Resource Consumption", name = T(118, "Consumption Max Storage"),  id = "consumption_max_storage", editor = "number", scale = const.ResourceScale, default = 5 * const.ResourceScale, help = "The max amount of storage for consumption resource.",},
		{template = true, category = "Resource Consumption", name = T(119, "Consumption Amount"),       id = "consumption_amount", editor = "number", scale = const.ResourceScale, default = 1 * const.ResourceScale,modifiable = true, help = "Amount of stored consumption resources needed for consumption op. In other words, the convertion rate of consumption resources to other stuff.",},
		{template = true, category = "Resource Consumption", name = T(120, "Consumption Type"),         id = "consumption_type", editor = "dropdownlist", items = GetConsumptionTypeDropdownItems(), default = GetConsumptionTypeDropdownItems()[1].value, help = "Determines the purpose of the consumption resource.",},
		{template = true, category = "Resource Consumption", name = T(121, "Input Pile Spot Name"),     id = "consumption_resource_stockpile_spot_name", editor = "text", default = "Resourcepile2", help = "If there is any consumption, will try to attacha purely visual stockpile at this spot.",},
	},
	
	
	consumption_resource_request = false,
	consumption_stored_resources = false,
	consumption_unaccaounted_for_production = false, --keeps frac production, for which we used no consumption because it was below 0.001 resource units of consumption resource.
	consumption_resource_stockpile = false, --if spot name is defined and exists, add a visual only stockpile that represents currently stored.
	
	is_upgrade = false, --id
	upgrade_consumption_objects = false,
}

function HasConsumption:InitConsumptionRequest() --needs to be after init and before gameinit
	if self:DoesHaveConsumption() then
		assert(self.consumption_max_storage >= const.ResourceScale) --less would bug out by design
		--check if we are gona be using a visualisation stockpile
		
		self:CreateVisualStockpile()
		self.consumption_stored_resources = 0
		self.consumption_unaccaounted_for_production = 0
		local resource_unit_count = 5 + (self.consumption_max_storage / (const.ResourceScale * 10)) --5 + 1 per 10
		local d_req = self:AddDemandRequest(self.consumption_resource_type, self.consumption_max_storage, const.rfWaitToFill, resource_unit_count)
		self.consumption_resource_request = d_req
	end
end

function HasConsumption:GameInit()
	self:DelayedConsumptionSignCheck()
end

function HasConsumption:DelayedConsumptionSignCheck()
	if not self:IsKindOf("Building") then return end
	CreateGameTimeThread(function()
		Sleep(const.HourDuration*2)
		if not IsValid(self) then return end
		if not self:CanConsume() then
			self:AttachSign(true, "SignNoConsumptionResource")
		end
	end, self)
end

function HasConsumption:Done()
	if IsValid(self.consumption_resource_stockpile) then --kill this stock, it's visual only, return resources should return consumption resources.
		DoneObject(self.consumption_resource_stockpile)
		self.consumption_resource_stockpile = false
	end
end

function GetEatPerVisit(unit)
	return unit:GetEatPerVisit()
end

DefineClass.ConsumptionResourceStockpile = {
	__parents = { "ResourceStockpile" },
	
	consumption_reserved_by_colonists = 0
}

function ConsumptionResourceStockpile:Assign(unit)
	local eat_amount = unit.assigned_to_service_with_amount
	if not eat_amount then return end
	self.consumption_reserved_by_colonists = self.consumption_reserved_by_colonists + eat_amount
end

function ConsumptionResourceStockpile:Unassign(unit, fulfilled)
	local eat_amount = unit.assigned_to_service_with_amount
	unit.assigned_to_service_with_amount = nil
	if not eat_amount then return end
	self.consumption_reserved_by_colonists = Max(self.consumption_reserved_by_colonists - eat_amount, 0)
end

function ConsumptionResourceStockpile:CanService(unit)
	local bld = self:GetParent()
	if bld.consumption_resource_type ~= "Food" then return false end
	local eat_per_visit = unit:GetEatPerVisit()
	local ret = bld.consumption_stored_resources - self.consumption_reserved_by_colonists >= eat_per_visit
	if ret then
		unit.assigned_to_service_with_amount = eat_per_visit
	end
	return ret
end

function ConsumptionResourceStockpile:Service(unit)
	local bld = self:GetParent()
	local amount = bld:Consume_Visit(unit)
	local success = amount == unit.assigned_to_service_with_amount
	if success and not unit.traits.Rugged then
		unit:ChangeComfort(-g_Consts.OutsideFoodConsumptionComfort, "raw food")
	end
	unit:AssignToService(nil, nil, success)
end

function HasConsumption:CreateVisualStockpile()
	if not self.consumption_resource_stockpile_spot_name 
		or self.consumption_resource_stockpile_spot_name == "" 
		or (not self.is_upgrade and not self:HasSpot(self.consumption_resource_stockpile_spot_name))
		or (self.is_upgrade and not self.building:HasSpot(self.consumption_resource_stockpile_spot_name)) then
		return
	end
	local stock =  {	resource = self.consumption_resource_type, 
							parent = self,
							destroy_when_empty = false, 
							has_demand_request = false,
							has_supply_request = false,
							count_in_resource_overview = false,}
	
	local stockpile_type = "ConsumptionResourceStockpile"
	if self.consumption_resource_type == "WasteRock" then
		stockpile_type = "WasteRockStockpile"
		stock.has_platform = true
	end
	stock = PlaceObject(stockpile_type, stock)
	
	local attach_to = (self.is_upgrade and self.building or self)
	local idx = attach_to:GetSpotBeginIndex(self.consumption_resource_stockpile_spot_name)
	attach_to:Attach(stock, idx)
	self.consumption_resource_stockpile = stock
end

function SavegameFixups.ConsumptionStockpileAddAssignAndUnassignFuncs()
	MapForEach(true, "HasConsumption", function(o)
					local stock = o.consumption_resource_stockpile
					if stock then
						DoneObject(stock)
						o:CreateVisualStockpile()
						o:UpdateVisualStockpile()
					end
				end)
end

function HasConsumption:ConsumptionOnDestroyed()
	if self:DoesHaveConsumption() then
		if self.consumption_resource_stockpile then
			local p = self.consumption_resource_stockpile:GetPos()
			local a = self.consumption_resource_stockpile:GetAngle()
			
			DoneObject(self.consumption_resource_stockpile)
			self.consumption_resource_stockpile = false
			
			if self.consumption_stored_resources > 0 then
				PlaceResourceStockpile_Delayed(p, self.consumption_resource_type, self.consumption_stored_resources, a - 90 * 60, true)
			end
			
			self.consumption_resource_request:AddAmount(self.consumption_stored_resources)
			self.consumption_stored_resources = 0
		end
		
		local r = self.consumption_resource_request
		self:InterruptDrones(nil, function(d) return d.d_request == r and d or nil end)
	end
end

function HasConsumption:ConsumptionDroneUnload(drone, req, resource, amount)
	if self.consumption_resource_request == req then	
		local was_work_possible = self:CanConsume()
		
		self.consumption_stored_resources = self.consumption_stored_resources + amount
		assert(self.consumption_stored_resources >= 0 and self.consumption_stored_resources <= self.consumption_max_storage)
		self:UpdateVisualStockpile()
		self:UpdateRequestConnectivity()
		
		if not was_work_possible then --only try to turn on if we were the reason to be off.
			if self:IsKindOf("Building") then
				self:AttachSign(false, "SignNoConsumptionResource")
			end
			if not self.working then
				self:UpdateWorking()
			end
		end
	end
end

function HasConsumption:DoesHaveConsumption()
	return self.consumption_resource_type ~= "no_consumption"
end

function HasConsumption:DoesHaveUpgradeConsumption()
	assert(self.is_upgrade == false)
	return self.upgrade_consumption_objects ~= false
end

function HasConsumption:Consume_Upgrades_Production(amount_to_consume_for, perc)
	assert(self.is_upgrade == false)
	local total_missing_production = 0
	for i = 1, #(self.upgrade_consumption_objects or empty_table) do
		local obj = self.upgrade_consumption_objects[i]
		local produced = obj:Consume_Production(amount_to_consume_for, nil, perc)
		total_missing_production = total_missing_production + (amount_to_consume_for - produced)
	end
	
	return amount_to_consume_for - total_missing_production
end

function HasConsumption:IsConsumptionResourceRequestConnected()
	return table.find(self.task_requests, self.consumption_resource_request)
end

function HasConsumption:UpdateVisualStockpile()
	if self.consumption_resource_stockpile then
		self.consumption_resource_stockpile.stockpiled_amount = self.consumption_stored_resources
		self.consumption_resource_stockpile:SetCount(self.consumption_stored_resources)
	end
end

function HasConsumption:AccumulateFracProduction(frac)
	self.consumption_unaccaounted_for_production = self.consumption_unaccaounted_for_production + frac
	self:TryConsumeFracs()
end

function HasConsumption:TryConsumeFracs() --tries to consume accumulated resources for unnacounted production
	local amount = MulDivTrunc(self.consumption_unaccaounted_for_production, self.consumption_amount, const.ResourceScale)
	if amount > 0 then
		--ye, we can consume sumthing.
		amount = self:Consume_Internal(amount)
		local consumed_for = MulDivTrunc(amount, const.ResourceScale, self.consumption_amount)
		self.consumption_unaccaounted_for_production = self.consumption_unaccaounted_for_production - consumed_for
	end
end

--Production - the amount is consumed for 1 unit of the produced resource. If not enough, production is lowered accordingly
function HasConsumption:Consume_Production(for_amount_to_produce, delim) --pass the amount you are gona produce, func returns max possible production, ==for_amount_to_produce if enough consumption resources or less if not.
	if for_amount_to_produce <= 0 then return 0, 0 end
	delim = delim or const.ResourceScale
	local amount_to_consume = MulDivTrunc(for_amount_to_produce, self.consumption_amount, delim)
	local deduced_amount = MulDivTrunc(amount_to_consume, delim, self.consumption_amount)
	local frac = for_amount_to_produce - deduced_amount
	
	amount_to_consume = self:Consume_Internal(amount_to_consume)
	local ret_amount = MulDivTrunc(amount_to_consume, delim, self.consumption_amount)
	if frac > 0 and self.consumption_stored_resources > 0 then
		self:AccumulateFracProduction(frac)
		ret_amount = ret_amount + frac
	end
	if self.consumption_resource_type == "WasteRock" then
		Msg("WasteRockConversion", amount_to_consume, self.producers)
	end
	return ret_amount, amount_to_consume
end

--Visit - the amount is consumed each visit.
function HasConsumption:Consume_Visit(unit)
	if self.consumption_resource_type == "Food" then
		if (GameTime() - unit.last_meal) >= const.DayDuration then
			local max = self.consumption_stored_resources
			if unit.assigned_to_service_with_amount then
				max = Min(max, unit.assigned_to_service_with_amount)
			end
			local use = unit:Eat(max)
			return self:Consume_Internal(use)
		end
	else
		return self:Consume_Internal(self.consumption_amount)
	end
end

function HasConsumption:Consume_Internal(input_amount_to_consume)
	if input_amount_to_consume <= 0 then return 0 end
	local amount_to_consume = Min(input_amount_to_consume, self.consumption_stored_resources)
	self.consumption_stored_resources = self.consumption_stored_resources - amount_to_consume
	assert(self.consumption_stored_resources >= 0 and self.consumption_stored_resources <= self.consumption_max_storage)
	self.consumption_resource_request:AddAmount(amount_to_consume)
	self.city:OnConsumptionResourceConsumed(self.consumption_resource_type, amount_to_consume)
	self:UpdateVisualStockpile()
	self:UpdateRequestConnectivity()
	
	if amount_to_consume ~= input_amount_to_consume then
		if self:IsKindOf("Building") then
			self:AttachSign(true, "SignNoConsumptionResource")
		end
		self:UpdateWorking(false) --we ran out of resources.
	end
	if SelectedObj == self then
		RebuildInfopanel(self)
	end
	return amount_to_consume
end

--The input pile will request resources only more than 1 below maximum capacity.
function HasConsumption:UpdateRequestConnectivity()
	local threshold = self.consumption_max_storage - const.ResourceScale * 1
	local is_connected = self:IsConsumptionResourceRequestConnected()
	local working = self.ui_working and not self.destroyed
	if is_connected and not working then
		--disconnect the req
		self:DisconnectFromCommandCenters()
		table.remove_entry(self.task_requests, self.consumption_resource_request)
		self:ConnectToCommandCenters()
	elseif not is_connected and working then
		--connect the req
		self:DisconnectFromCommandCenters()
		self.task_requests[#self.task_requests + 1] = self.consumption_resource_request
		self:ConnectToCommandCenters()
	end
end

function HasConsumption:UpdateUpgradeRequestsConnectivity()
	for i = 1, #(self.upgrade_consumption_objects or empty_table) do
		local obj = self.upgrade_consumption_objects[i]
		obj:UpdateRequestConnectivity()
	end
end

function HasConsumption:CanConsume()
	return not self.consumption_stored_resources or self.consumption_stored_resources > 0
end

--upgrade consumption, this wasn't supposed to exist.
----------------------------------------
DefineClass.UpgradeConsumption = {
	__parents = { "HasConsumption" },
	entity = "InvisibleObject",
	--not autofill
	building = false,
	upgrade_id = false,
	upgrade_tier = false,
	city = false,
	
	--autofill
	working = false,
	upgrade_modifiers = false,
	is_upgrade = true, --id
	auto_connect = false,
	
	my_props = false,
}

local porps_that_affect_production = { "performance", "water_production" }
function OnMsg.ClassesBuilt()
	porps_that_affect_production = { "performance", "water_production" }
	for i=1,ResourceProducer.max_resources_produced do
		table.insert(porps_that_affect_production, "production_per_day"..i)
	end
end

function UpgradeConsumption:GameInit()	
	self.building:StopUpgradeModifiersForUpgrade(self.upgrade_id) --we assume we start in a not working state
	self.upgrade_modifiers = self.building.upgrade_modifiers[self.upgrade_id] --grab mods for ez of access
	
	local t = self.building.upgrade_consumption_objects or {} --plug into parent
	table.insert(t, self)
	t[self.upgrade_id] = self
	self.building.upgrade_consumption_objects = t
	
	self.building:Attach(self) --now, we are one.
	self:InitConsumptionRequest()
	self.auto_connect = true
	self:ConnectToCommandCenters()
	
	self.my_props = {}
	for i = 1, #self.upgrade_modifiers do
		--my_props
		if table.find(porps_that_affect_production, self.upgrade_modifiers[i].prop) then
			table.insert_unique(self.my_props, self.upgrade_modifiers[i].prop)
		end
	end
	
	CreateGameTimeThread(function(self) -- delay until GameInit is completed
		if not IsValid(self) then return end
		self:UpdateWorking()
	end, self)
end

function UpgradeConsumption:Done()
	self.building.upgrade_consumption_objects[self.upgrade_id] = nil
	table.remove_entry(self.building.upgrade_consumption_objects, self)
end

function UpgradeConsumption:UpdateRequestConnectivity()
	--should not request when remaining amount is less then one resource unit, rfWaitToFill should take care of that
	local is_connected = self:IsConsumptionResourceRequestConnected()
	local working = self.building.ui_working and not self.building.destroyed and self.building.upgrade_on_off_state[self.upgrade_id]
	local req = self.consumption_resource_request
	if is_connected and not working then
		--disconnect the req
		self:DisconnectFromCommandCenters()
		table.remove_entry(self.task_requests, req)
		self:ConnectToCommandCenters()
	elseif not is_connected and working then
		--connect the req
		self:DisconnectFromCommandCenters()
		self.task_requests[#self.task_requests + 1] = req
		self:ConnectToCommandCenters()
	end
end

function UpgradeConsumption:CalcMyAmount(total_amount, percent_of_flat, prop)
	prop = prop or "production_per_day1"
	local base_val = self.building["base_" .. prop]
	local total_mods = self.building.modifications[prop]
	
	local my_perc = 0
	local my_amount = 0
	
	for i = 1, #self.upgrade_modifiers do
		local mod = self.upgrade_modifiers[i]
		if mod.prop == prop then
			my_perc = my_perc + (mod.percent or 0)
			my_amount = my_amount + (mod.amount or 0)
		end
	end
	
	local percent_from_total = (my_perc * 1000000000) / total_mods.percent
	my_amount = my_amount * percent_of_flat / 100
	
	return MulDivRound(total_amount, percent_from_total, 1000000000) + my_amount
end

function UpgradeConsumption:Consume_Production(for_amount_to_produce, delim, perc_of_day)
	if not self.working then return for_amount_to_produce, 0 end
	if for_amount_to_produce <= 0 then return 0, 0 end
	local my_production = 0
	for i = 1, #self.my_props do
		my_production = my_production + self:CalcMyAmount(for_amount_to_produce, perc_of_day, self.my_props[i])
	end
	local allowed_my_production, consumed_production = HasConsumption.Consume_Production(self, my_production, delim)
	return (for_amount_to_produce - my_production) + allowed_my_production, consumed_production
end

function UpgradeConsumption:SetWorking(val)
	if self.working == val then return end
	self.working = val
	if val and self.building.upgrade_on_off_state[self.upgrade_id] then
		self.building:ApplyUpgradeModifiersForUpgrade(self.upgrade_id) --there is currently no other reason for mod to not work, so this works.
	else
		self.building:StopUpgradeModifiersForUpgrade(self.upgrade_id)
	end
end

function UpgradeConsumption:GetWorkNotPossibleReason()
	if not HasConsumption.CanConsume(self) then
		return "Consumption"
	end
end

function UpgradeConsumption:DroneUnloadResource(drone, req, resource, amount)
	HasConsumption.ConsumptionDroneUnload(self, drone, req, resource, amount)
end

function UpgradeConsumption:DroneApproach(...)
	return self.building:DroneApproach(...)
end

function UpgradeConsumption:GetDisplayName()
	return self.building:GetDisplayName()
end