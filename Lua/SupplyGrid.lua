const.BreakIntervalHours = 2
const.BreakDrainModifierPct = 200
const.BreakDrainPowerMin = 10000
const.BreakDrainPowerMax = 15000
const.BreakDrainOxygenMin = 3000
const.BreakDrainOxygenMax = 6000
const.BreakDrainWaterMin = 4000
const.BreakDrainWaterMax = 8000
const.BreakChanceCable = 1000
const.BreakChancePipe = 1000
local random_break_chances = { --chances of pipes/cables breaking each workshift, AsyncRand(1000000000) > ((1000000-break_chance)/1000000.0)^number_of_elements*1000000000 
	electricity = const.BreakChanceCable,
	water = const.BreakChancePipe,
}

DefineClass.SupplyGridElement = {
	__parents = { "PropertyObject" },
	grid = false,
	building = false,
	parent_dome = false, -- helper, tracks if element is in dome for faster checks when splitting grids.
	-- producer
	production = false,
	throttled_production = false,
	production_today = 0,
	production_yesterday = 0,
	production_lifetime = 0,
	current_throttled_production = 0,
	-- consumer
	consumption = false,
	variable_consumption = false,
	current_consumption = 0,
	sort_index = 0,
	consumption_today = 0,
	consumption_yesterday = 0,
	consumption_lifetime = 0,
	-- storage
	charge = false,
	discharge = false,
	storage_capacity = false,
	current_storage = false,
	max_charge = false,
	max_discharge = false,
	charge_efficiency = false,
	storage_mode = "",
	discharge_factor = 10, --needs at least 1/10th stored amount before it can discharge
	--cable/pipe
	is_cable_or_pipe = false,
	
	grid_to_grid_connections = false,
}

local remove_entry = table.remove_entry
local table_insert = table.insert

function NewSupplyGridProducer(building)
	return SupplyGridElement:new{
		building = building,
		production = 0,
		throttled_production = 0,
	}
end

function NewSupplyGridConsumer(building, variable_consumption)
	return SupplyGridElement:new{
		building = building,
		consumption = 0,
		variable_consumption = variable_consumption,
	}
end

function NewSupplyGridStorage(building, storage_capacity, max_charge, max_discharge, charge_efficiency, discharge_factor)
	return SupplyGridElement:new{
		building = building,
		charge = max_charge,
		discharge = 0,
		current_storage = 0,
		storage_capacity = storage_capacity,
		max_charge = max_charge,
		max_discharge = max_discharge,
		charge_efficiency = charge_efficiency or 100,
		storage_mode = "empty",
		discharge_factor = discharge_factor or SupplyGridElement.discharge_factor,
	}
end

function SupplyGridElement:SetProduction(new_production, new_throttled_production, update)
	new_throttled_production = new_throttled_production or 0
	if self.production == new_production and self.throttled_production == new_throttled_production then return end
	local grid = self.grid
	if grid then
		grid.production = grid.production - self.production + new_production
		grid.throttled_production = grid.throttled_production - self.throttled_production + new_throttled_production
	end
	local diff = self.production - new_production
	self.production = new_production
	self.throttled_production = new_throttled_production
	if grid then
		grid:UpdateGrid(update, diff > 0 or not grid.all_consumers_supplied)
	end
end

function SupplyGridElement:SetConsumption(new_consumption, update)
	if not self.consumption or self.consumption == new_consumption then return end --self.consumption == false when dummy water
	local grid = self.grid
	if grid then
		grid.consumption = grid.consumption - Max(self.consumption, 0) + Max(new_consumption, 0)
	end
	self.consumption = new_consumption
	
	if new_consumption == 0 and grid and grid.all_consumers_supplied then
		grid.all_consumers_supplied = false
	end
	
	if grid then
		if CurrentThread() == grid.update_thread then
			DelayedGridUpdate(grid, update, true)
		else
			grid:UpdateGrid(update, true)
		end
	end
end

function SupplyGridElement:SetStorage(new_charge, new_discharge, update)
	if self.charge == new_charge and self.discharge == new_discharge then return end
	local grid = self.grid
	if grid then
		grid.charge = grid.charge - self.charge + new_charge
		grid.discharge = grid.discharge - self.discharge + new_discharge
	end
	self.charge = new_charge
	self.discharge = new_discharge
	if grid then
		grid:UpdateGrid(update)
	end
end

function SupplyGridElement:SetStoredAmount(amount, resource, update)
	if not self.current_storage then return end
	amount = Clamp(amount, 0, self.storage_capacity)
	local grid = self.grid
	if grid then
		grid.current_storage = grid.current_storage + amount - self.current_storage
	end
	self.current_storage = amount
	self:UpdateStorage()
	if amount >= self.storage_capacity then
		if self.storage_mode ~= "full" then
			self.storage_mode = "full"
			self.building:SetStorageState(resource, "full")
		end
	elseif amount == 0 then
		if self.storage_mode ~= "empty" then
			self.storage_mode = "empty"
			self.building:SetStorageState(resource, "empty")
		end
	end
	if grid then
		grid:UpdateGrid(update)
	end
end

function SupplyGridElement:UpdateStorage()
	local current_storage = self.current_storage
	local bld = self.building
	local charge = bld.working and Min(self.max_charge, self.storage_capacity - current_storage) or 0
	local discharge = bld.working and self:CanDischarge() and Min(self.max_discharge, current_storage) or 0
	self:SetStorage(charge, discharge)
end

function SupplyGridElement:CanDischarge()
	return self.current_storage >= self.storage_capacity / self.discharge_factor
end

function SupplyGridElement:SetPriority(priority, update)
	local grid = self.grid
	if grid and self.consumption then
		grid.sort_consumers = true
		grid:UpdateGrid(update)
	end
end

function SupplyGridElement:GetElectricityUIMode()
	local grid = self.grid
	local change = grid.current_storage_change
	if change < 0 then
		change = grid.discharge ~= 0 and MulDivRound(change, self.discharge, grid.discharge) or 0
	elseif change > 0 then
		change = grid.charge ~= 0 and MulDivRound(change, self.charge, grid.charge) or 0
	end
	if change == 0 then return self.storage_mode == "full" and T(3880, "Status<right>Full") or self.storage_mode == "empty" and T(3881, "Status<right>Empty") or T(3882, "Status<right>Idle") end
	if change > 0 then return T{3883, "Charging<right><power(amount)>", amount = change} end
	return T{3884, "Discharging<right><power(amount)>", amount = change} 
end

function SupplyGridElement:GetUIMode()
	local grid = self.grid
	local resource_type = grid.supply_resource == "water" and "Water" or grid.supply_resource == "air" and "Air" or ""
	local change = grid.current_storage_change
	if change < 0 then
		change = grid.discharge ~= 0 and MulDivRound(change, self.discharge, grid.discharge) or 0
	elseif change > 0 then
		change = grid.charge ~= 0 and MulDivRound(change, self.charge, grid.charge) or 0
	end
	if change == 0 then return self.storage_mode == "full" and T(3880, "Status<right>Full") or self.storage_mode == "empty" and T(3881, "Status<right>Empty") or T(3882, "Status<right>Idle") end
	if change > 0 then return T{3885, "Increasing<right><resource(change,resource_type)>", change = change, resource_type = resource_type} end
	return T{3886, "Decreasing<right><resource(change,resource_type)>", change = change, resource_type = resource_type} 
end

function SupplyGridElement:UIShouldShowDischargeStr()
	return self.storage_mode == "charging" and not self:CanDischarge()
end

function SupplyGridElement:GetUIDischargeStr()
	if self:UIShouldShowDischargeStr() then
		local grid = self.grid
		local number = self.storage_capacity / self.discharge_factor
		if grid.supply_resource == "water" then
			return T{3887, "Collecting minimum Water flow. Will start supplying the grid at <em><water(number)></em>", number = number}
		elseif grid.supply_resource == "air" then
			return T{3888, "Collecting minimum Oxygen flow. Will start supplying the grid at <em><air(number)></em>", number = number}
		elseif grid.supply_resource == "electricity" then
			return T{3889, "Charging. Requires minimum <em><power(number)></em> to start supplying the grid", number = number} 
		end
	end
end

function SupplyGridElement:UIShouldShowDemandAttention()
	return self.production>0 and self.current_throttled_production>0 and
		not self.building:IsMalfunctioned() and not self.building.last_maintenance_points_full_ts
end

-- for interface purposes
function SupplyGridElement:GetProductionEstimate() if self.building.working then return Max(self.production_yesterday, self.production_today) else return 0 end end
function SupplyGridElement:GetStoragePercent() return 100 * self.current_storage / self.storage_capacity end
function SupplyGridElement:GetUISectionPowerGridRollover()
	return self.grid and self.grid:GetUISectionPowerGridRollover()
end
function SupplyGridElement:GetUISectionWaterGridRollover()
	return self.grid and self.grid:GetUISectionWaterGridRollover()
end

function SupplyGridElement:GetUISectionAirGridRollover()
	local grid = self.grid
	grid = grid:IsKindOf("WaterGrid") and grid.air_grid or grid
	return grid and grid:GetUISectionAirGridRollover()
end

local dust_class_flags = const.cfConstructible + const.cfDecal
local decal_enum_flags = const.efBakedTerrainDecal + const.efBakedTerrainDecalLarge
function SetObjDust(obj, normalized_dust, in_dome)
	if obj and obj:GetClassFlags(dust_class_flags) ~= 0 and obj:GetEnumFlags(decal_enum_flags) == 0 then
		obj:SetDust(normalized_dust, in_dome and const.DustMaterialInterior or const.DustMaterialExterior)
	end
end

DefineClass.DustGridElement =
{
	__parents = { "Object" },
	
	dust_current = 0,
	dust_max = const.MaxMaintenance,
	dust_last_time = false,
	dust_max_percents = 30,
}

function DustGridElement:AddDust(dust)
	self.dust_current = Clamp(self.dust_current + dust, 0, self.dust_max)
	local normalized_dust = MulDivRound(self.dust_current, 255, self.dust_max)
	ApplyToObjAndAttaches(self, SetObjDust, normalized_dust, false)
end

----- SupplyGridFragment

DefineClass.SupplyGridFragment = {
	__parents = { "InitDone" },
	supply_resource = "electricity",
	city = false,
	-- arrays
	elements = false, -- all elements
	producers = false,
	consumers = false,
	storages = false,
	connectors = false, --pipes/cables
	-- grid aggregates
	production = 0,
	throttled_production = 0,
	consumption = 0,
	charge = 0,
	discharge = 0,
	consumption_for_overview = 0,
	-- current
	current_storage_change = 0,
	current_production = 0,
	current_throttled_production = 0,
	current_consumption = 0,
	current_waste = 0,
	current_reserve = 0,
	current_storage = 0,
	-- support
	dust_thread = false,
	update_thread = false,
	update_consumer_state = false,
	all_consumers_supplied = false,
	sort_consumers = false,
	update_visuals = false,
	update_visuals_args = false,
	--construction grids
	grid_subtype = false,
	--pipe skins
	element_skin = "Default",
	overlay_id = false,
}

GlobalVar("OverlayGridIdCounters", function()
				return {water = 1, electricity = 1}
			end)
			
GlobalVar("DelayedGridUpdateGrids", {})
GlobalVar("DelayedGridUpdateThread", false)
function RunDelayedGridUpdate()
	for grid, params in pairs(DelayedGridUpdateGrids) do
		grid:UpdateGrid(unpack_params(params))
	end
	
	DelayedGridUpdateGrids = {}
	DelayedGridUpdateThread = false
end

function DelayedGridUpdate(grid, ...)
	DelayedGridUpdateGrids[grid] = pack_params(...) --last caller will override params!
	if not DelayedGridUpdateThread then
		DelayedGridUpdateThread = CreateGameTimeThread(RunDelayedGridUpdate)
	end
end

function SupplyGridFragment:Init()
	InitGridId(self)
	
	self.elements = {}
	self.producers = {}
	self.consumers = {}
	self.storages = {}
	self.connectors = {}
	self.update_thread = CreateGameTimeThread(function(self)
		while true do
			procall(SupplyGridFragment.UpdateGrid, self, "immediate", self.update_consumer_state)
			self.update_consumer_state = false
			WaitWakeup()
		end
	end, self)
	self.dust_thread = CreateGameTimeThread(function(self)
		while true do
			self:UpdateDust()
			Sleep(5000)
		end
	end, self)
	local grid_list = self.city[self.supply_resource]
	grid_list[#grid_list + 1] = self
	self:AssignOverlayID()
end

function SupplyGridFragment:AssignOverlayID()
	if not self.overlay_id and OverlayGridIdCounters[self.supply_resource] then
		self.overlay_id = OverlayGridIdCounters[self.supply_resource]
		OverlayGridIdCounters[self.supply_resource] = OverlayGridIdCounters[self.supply_resource] % 8 + 1
	end
end

function SupplyGridFragment:Done()
	self.UpdateGrid = function () end
	local supply_resource = self.supply_resource
	for _, consumer in ipairs(self.consumers) do
		if consumer.current_consumption > 0 and consumer.grid == self then
			consumer.current_consumption = 0
			consumer.building:SetSupply(supply_resource, consumer.current_consumption)
		end
	end
	for _, element in ipairs(self.elements) do
		if element.grid == self then
			element.grid = false
		end
	end
	DeleteThread(self.update_thread)
	self.update_thread = false
	DeleteThread(self.dust_thread)
	self.dust_thread = false
	remove_entry(self.city[supply_resource], self)
	OnGridDestroyed(self)
end

function SupplyGridFragment:RemoveElement(element, update)
	if element.grid ~= self then return end
	if element.current_consumption > 0 then
		element.current_consumption = 0
		element.building:SetSupply(self.supply_resource, element.current_consumption)
	end
	element.grid = false
	remove_entry(self.elements, element)
	if element.production then
		self.production = self.production - element.production
		self.throttled_production = self.throttled_production - element.throttled_production
		remove_entry(self.producers, element)
	end
	if element.consumption then
		self.consumption = self.consumption - Max(element.consumption, 0)
		remove_entry(self.consumers, element)
	end
	if element.charge then
		self.charge = self.charge - element.charge
		self.discharge = self.discharge - element.discharge
		self.current_storage = self.current_storage - element.current_storage
		remove_entry(self.storages, element)
	end
	if element.is_cable_or_pipe then
		remove_entry(self.connectors, element)
	end

	self:UpdateGrid(update, true)
end

function SupplyGridFragment:AddElement(element, update)
	assert(not IsKindOf(element.building), "ConstructionSite")
	element.grid = self
	self.elements[#self.elements + 1] = element
	if element.production then
		self.production = self.production + element.production
		self.throttled_production = self.throttled_production + element.throttled_production
		self.producers[#self.producers + 1] = element
	end
	if element.consumption then
		self.consumption = self.consumption + Max(element.consumption, 0)
		self.sort_consumers = true
		self.consumers[#self.consumers + 1] = element
	end
	if element.charge then
		self.charge = self.charge + element.charge
		self.discharge = self.discharge + element.discharge
		self.current_storage = self.current_storage + element.current_storage
		self.storages[#self.storages + 1] = element
	end
	if element.is_cable_or_pipe then
		self.connectors[#self.connectors + 1] = element
	end
	self.update_visuals = true
	DelayedGridUpdate(self, update, true)
end

function SupplyGridFragment:UpdateGrid(update, update_consumer_state)
	if update == false then return end
	if update ~= "immediate" then
		self.update_consumer_state = self.update_consumer_state or update_consumer_state
		Wakeup(self.update_thread)
		return
	end
	local supply_resource = self.supply_resource
	if self.update_visuals then
		self.update_visuals = false
		local args = self.update_visuals_args
		self.update_visuals_args = false
		SuspendPassEdits("SupplyGridFragment.UpdateGrid")
		for _, element in ipairs(self.elements) do
			element.building:UpdateVisuals(supply_resource, args and table.unpack(args) or nil)
		end
		ResumePassEdits("SupplyGridFragment.UpdateGrid")
	end
	if self.sort_consumers then
		self.sort_consumers = false
		for i, consumer in ipairs(self.consumers) do
			consumer.sort_index = consumer.building.priority * 100000 + i
		end
		table.sortby_field_descending(self.consumers, "sort_index")
	end
	local production = self.production
	local change = production - self.consumption
	local storage_change = Clamp(change, - self.discharge, self.charge)
	local current_consumption
	local consumption_for_overview = self.consumption
	if not update_consumer_state and self.all_consumers_supplied and change > 0 then
		current_consumption = self.consumption
		self.current_throttled_production = Min(change - storage_change, self.throttled_production)
	else
		local supply = production - storage_change
		for _, consumer in ipairs(self.consumers) do
			local consumption = consumer.consumption
			if consumption >= 0 then
				local current_consumption = consumer.variable_consumption and Min(supply, consumption) or consumption <= supply and consumption or 0
				supply = supply - current_consumption
				if consumer.current_consumption ~= current_consumption then
					consumer.current_consumption = current_consumption
					consumer.building:SetSupply(supply_resource, current_consumption)
				end
				if consumer.is_cable_or_pipe and current_consumption ~= consumption then
					consumption_for_overview = consumption_for_overview - (consumption - current_consumption)
				end
			else
				storage_change = storage_change + abs(consumption) --negative consumption goes to storages
			end
		end
		storage_change = Clamp(storage_change, - self.discharge, self.charge)
		current_consumption = production - storage_change - supply
		change = storage_change + supply
		storage_change = Min(change, self.charge)
		self.current_throttled_production = Min(change - storage_change, self.throttled_production)
		self.all_consumers_supplied = current_consumption == self.consumption
	end
	self.consumption_for_overview = consumption_for_overview
	self.current_storage_change = storage_change
	self.current_consumption = current_consumption
	self.current_production = self.production - self.current_throttled_production
	self.current_waste = self.current_production - current_consumption - storage_change
	self.current_reserve = self.production + self.discharge - current_consumption
	for _, producer in ipairs(self.producers) do
		local building = producer.building
		building:UpdateAttachedSigns()		
	end
	for _, consumer in ipairs(self.consumers) do
		local building = consumer.building
		building:UpdateAttachedSigns()
		if supply_resource == "electricity" then
			building:RefreshNightLightsState()
		end
	end
	for _, storage in ipairs(self.storages) do
		local building = storage.building
		building:UpdateAttachedSigns()
	end
end

local hour_duration = const.HourDuration
local sol_duration = const.DayDuration

function SupplyGridFragment:UpdateDust()
	local building_daily_dust_max_percents = g_Consts.BuildingDailyDustMaxPercents
	local building_daily_dust_accumulation = g_Consts.BuildingDailyDustAccumulation
	local building_daily_dust_min = g_Consts.BuildingDailyDustMin
	local cur_time = GameTime()
	local connectors = self.connectors
	for i=1,#connectors do
		local obj = connectors[i].building
		local max_percents = obj.dust_max_percents or building_daily_dust_max_percents
		local elapsed_time = cur_time - (obj.dust_last_time or cur_time)
		if elapsed_time > hour_duration then
			local dust_percents = Min(100 * obj.dust_current / obj.dust_max, max_percents)
			local day_dust = Max(building_daily_dust_accumulation * (max_percents - dust_percents) / max_percents, building_daily_dust_min)
			obj:AddDust(MulDivTrunc(day_dust, elapsed_time, sol_duration))
			obj.dust_last_time = cur_time
		end
	end
end

function SupplyGridFragment:RandomBreakConnection()
	if not self:IsBreakable() then return end
	local break_chance = random_break_chances[self.supply_resource]
	assert(break_chance)
	break_chance = ((1000000 - break_chance) / 1000000.0) ^ #self.elements * 1000000000
	local roll = AsyncRand(1000000000)
	
	if roll > break_chance then --we got a break
		local element = table.rand(self.connectors)
		local bld = element.building
		bld:Break()
	end
end

function SupplyGridFragment:BreakConnection()
	local element = table.rand(self.connectors)
	local bld = element.building
	bld:Break()
end

function SupplyGridFragment:IsBreakable()
	if #self.consumers <= 0 or #self.producers <= 0 then return false end --at least one producer and one consumer in order for something to break
	if #self.connectors <= 10 then return false end --nothing to break.	
	return true
end

function SupplyGridFragment:TestElementValidity()
	for i = 1, #self.elements do
		if not IsValid(self.elements[i].building) then
			print("Invalid elements found!")
			assert(false)
			return
		end
	end
end

--grid to grid connections, handles construction->supply grid relations
GlobalVar("g_GridToGridConnections", {}) --[g1][g2] or [g2][g1] = { {el1, el2}, {el3, el4} }

function ConnectGrids(el1, el2)
	local g1, g2 = el1.grid, el2.grid
	assert(IsKindOf(el1, "SupplyGridElement" ) and IsKindOf(el2, "SupplyGridElement"))
	assert(g1 ~= g2 and g1.grid_subtype ~= g2.grid_subtype)
	--init table
	g_GridToGridConnections[g1] = g_GridToGridConnections[g1] or {}
	g_GridToGridConnections[g1][g2] = g_GridToGridConnections[g1][g2] or {}
	g_GridToGridConnections[g2] = g_GridToGridConnections[g2] or {}
	g_GridToGridConnections[g2][g1] = g_GridToGridConnections[g2][g1] or g_GridToGridConnections[g1][g2]
	--push link
	local link = {el1, el2}
	table.insert(g_GridToGridConnections[g1][g2], link)
	el1.grid_to_grid_connections = el1.grid_to_grid_connections or {}
	el2.grid_to_grid_connections = el2.grid_to_grid_connections or {}
	assert(not table.find(el1.grid_to_grid_connections, 1, el2) and not table.find(el1.grid_to_grid_connections, 2, el2))
	table.insert(el1.grid_to_grid_connections, link)
	table.insert(el2.grid_to_grid_connections, link)
end

function DisconnectGrids(el1, el2)
	local g1, g2 = el1.grid, el2.grid
	assert(IsKindOf(el1, "SupplyGridElement" ) and IsKindOf(el2, "SupplyGridElement"))
	assert(g_GridToGridConnections[g1][g2])
	
	local t = g_GridToGridConnections[g1][g2]
	for i = #(t or ""), 1, -1 do
		if (t[i][1] == el1 or t[i][2] == el1) and 
			(t[i][1] == el2 or t[i][2] == el2) then
			remove_entry(el1.grid_to_grid_connections, t[i])
			remove_entry(el2.grid_to_grid_connections, t[i])
			table.remove(t, i)
		end
	end
	
	if #(t or "") <= 0 then
		g_GridToGridConnections[g1][g2] = nil
		g_GridToGridConnections[g2][g1] = nil
	end
end

function GetAllConnectedGrids(g, passed)
	passed = passed or {[g] = true}
	if not g_GridToGridConnections[g] then return passed end
	
	for other_grid, connections in pairs(g_GridToGridConnections[g]) do
		if not passed[other_grid] then
			passed[other_grid] = true
			passed = GetAllConnectedGrids(other_grid, passed)
		end
	end
	
	return passed
end

function AreGridsConnected(g1, g2, passed)
	if g1 == g2 then return true end
	
	passed = passed or {}
	passed[g1] = true
	
	if not g_GridToGridConnections[g1] then return false end
	if (g_GridToGridConnections[g1][g2] and g_GridToGridConnections[g1][g2][1] ~= nil) then return true end
	
	for other_grid, connections in pairs(g_GridToGridConnections[g1]) do
		if not passed[other_grid] then
			if AreGridsConnected(other_grid, g2, passed) then
				return true
			end
		end
	end
	
	return false
end

function CopyGridConnections(g1, g2)
	g_GridToGridConnections[g2] = g_GridToGridConnections[g2] or {}
	for other_grid, connections in pairs(g_GridToGridConnections[g1] or empty_table) do
		g_GridToGridConnections[other_grid][g2] = g_GridToGridConnections[other_grid][g2] or {}
		g_GridToGridConnections[g2][other_grid] = g_GridToGridConnections[other_grid][g2]
		
		table.iappend(g_GridToGridConnections[other_grid][g2], g_GridToGridConnections[other_grid][g1])
	end
end

function GetElementConnections(el)
	return el.grid_to_grid_connections
end

function DestroyAllConnectionsFromElement(el)
	local t = el.grid_to_grid_connections
	for i = #(t or ""), 1, -1 do
		if t[i] then --duplicate connection shield
			DisconnectGrids(t[i][1], t[i][2])
		else
			print("There were duplicate connections registered!")
		end
	end
	
	el.grid_to_grid_connections = false
end

function OnGridDestroyed(g)
	if not g_GridToGridConnections[g] then return end
	for other_grid, connections in pairs(g_GridToGridConnections[g]) do
		g_GridToGridConnections[other_grid][g] = nil
	end
	
	g_GridToGridConnections[g] = nil
end

if Platform.developer then
	local markers = false
	function ClearGridToGridDebugMarkers()
		if markers then
			for i = 1, #markers do
				if IsValid(markers[i]) then
					DoneObject(markers[i])
				end
			end
		end
		markers = {}
	end
	function DebugGridToGridConnections()
		ClearGridToGridDebugMarkers()
		
		local passed_links = {}
		for g1, t_of_gs in pairs(g_GridToGridConnections) do
			for g2, links in pairs(t_of_gs) do
				if links and not passed_links[links] then
					passed_links[links] = true
					for i = 1, #links do
						for j = 1, #links[i] do
							local s = Sphere:new()
							s:SetPos(links[i][j].building:GetPos())
							s:SetRadius(50*guic)
							s:SetColor(RGB(0, 255, 0))
							markers[#markers + 1] = s
						end
					end
				end
			end
		end
	end
end

function SupplyGridFragment:GetCurrentProduction() return self.current_production end
function SupplyGridFragment:GetCurrentConsumption() return self.current_consumption end
function SupplyGridFragment:GetCurrentReserve() return self.current_reserve end
function SupplyGridFragment:GetCurrentStorage() return self.current_storage end

function SupplyGridFragment:Production(new_day)
	local supply_resource = self.supply_resource
	-- producers
	local current_throttled_production = self.current_throttled_production
	local throttled_production = self.throttled_production
	for _, producer in ipairs(self.producers) do
		if new_day then
			producer.production_yesterday = producer.production_today
			producer.production_today = 0
		end
		producer.current_throttled_production = ((throttled_production > 0) and MulDivRound(producer.throttled_production, current_throttled_production, throttled_production) or 0)
		local production = producer.production - producer.current_throttled_production
		if production > 0 then
			producer.building:ProduceSupply(supply_resource, production)
			producer.production_today = producer.production_today + production
			producer.production_lifetime = producer.production_lifetime + production
		end
	end
	-- consumers
	for _, consumer in ipairs(self.consumers) do
		if new_day then
			consumer.consumption_yesterday = consumer.consumption_today
			consumer.consumption_today = 0
		end
		local current_consumption = consumer.current_consumption
		if current_consumption > 0 then
			consumer.consumption_today = consumer.consumption_today + current_consumption
			consumer.consumption_lifetime = consumer.consumption_lifetime + current_consumption
			consumer.building:ConsumeSupply(supply_resource, current_consumption)
		end
	end
	-- storages
	local charge = self.charge
	local discharge = self.discharge
	local storage_change = self.current_storage_change
	local fragment_current_storage = 0
	if storage_change > 0 then
		for _, storage in ipairs(self.storages) do
			local stored = storage.current_storage
			stored = stored + MulDivRound(storage_change, storage.charge_efficiency * storage.charge, 100 * charge)
			if stored ~= storage.current_storage then
				local capacity = storage.storage_capacity
				if stored >= capacity then
					storage.current_storage = capacity
					storage:SetStorage(0, storage.max_discharge)
					if storage.storage_mode ~= "full" then
						storage.storage_mode = "full"
						storage.building:SetStorageState(supply_resource, "full")
					end
				else
					storage.current_storage = stored
					local max_discharge = storage.max_discharge
					storage:SetStorage(storage.max_charge, storage:CanDischarge() and Min(max_discharge, stored) or 0)
					if storage.storage_mode ~= "charging" then
						storage.storage_mode = "charging"
						storage.building:SetStorageState(supply_resource, "charging")
					end
				end
			end
			fragment_current_storage = fragment_current_storage + storage.current_storage
		end
	elseif storage_change < 0 then
		for _, storage in ipairs(self.storages) do
			local stored = storage.current_storage
			stored = stored + (discharge > 0 and MulDivRound(storage_change, storage.discharge, discharge) or 0)
			if stored ~= storage.current_storage then
				if stored <= 0 then
					storage.current_storage = 0
					storage:SetStorage(storage.max_charge, 0)
					if storage.storage_mode ~= "empty" then
						storage.storage_mode = "empty"
						storage.building:SetStorageState(supply_resource, "empty")
					end
				else
					storage.current_storage = stored
					storage:SetStorage(storage.max_charge, Min(storage.max_discharge, stored))
					if storage.storage_mode ~= "discharging" then
						storage.storage_mode = "discharging"
						storage.building:SetStorageState(supply_resource, "discharging")
					end
				end
			end
			fragment_current_storage = fragment_current_storage + storage.current_storage
		end
	else -- not change
		for _, storage in ipairs(self.storages) do
			fragment_current_storage = fragment_current_storage + storage.current_storage
		end
	end
	self.current_storage = fragment_current_storage
end

function SupplyGridFragment:CreateConnection(pt1, pt2, building1, building2)
	assert(building1 and building2)
end

function SupplyGridFragment:DestroyConnection(pt1, pt2, building1, building2)
	assert(building1 and building2)
end

function SupplyGridFragment:ChangeElementSkin(new_skin, change_building_ents, propagate)
	if self.element_skin == new_skin and not propagate then return end
	
	local grids = GetAllConnectedGrids(self)
	if self.element_skin == new_skin and propagate then
		grids[self] = nil
	end
	for g, _ in pairs(grids) do
		g.element_skin = new_skin
		g.update_visuals = true
		if change_building_ents then
			g.update_visuals_args = {change_building_ents}
		end
		g:UpdateGrid()
	end
end

----- SupplyGrid

DefineClass.SupplyGrid = {
	__parents = { "InitDone" },
	city = false,
	production_thread = false,
}

function SupplyGrid:Init()
	self.production_thread = CreateGameTimeThread(function(self)
		local day
		while true do
			Sleep(const.HourDuration)
			local new_day = day ~= self.city.day
			day = self.city.day
			for i = 1, #self do
				procall(SupplyGridFragment.Production, self[i], new_day)
			end
		end
	end, self)
end

function SupplyGrid:Done()
	DeleteThread(self.production_thread)
end

function SupplyGrid:RandomBreakElements()
	for i = 1, #self do
		self[i]:RandomBreakConnection()
	end
end

----- SupplyGridObject

DefineClass.SupplyGridObject = {
	__parents = { "GridObject" },
	connect_dir = false,
}

-- callback when a resource supply is modified
function SupplyGridObject:SetSupply(resource, amount)
end

-- callback on storage state change - "empty", "full", "charging", "discharging"
function SupplyGridObject:SetStorageState(supply_resource, state)
end

-- callback called each hour with the actual amount used by the grid
function SupplyGridObject:ProduceSupply(resource, amount)
end

-- callback called each hour with the actual amount consumed by the grid
function SupplyGridObject:ConsumeSupply(resource, amount)
end

-- callback called after connectivity updates
function SupplyGridObject:UpdateVisuals(resource)
end

function SupplyGridObject:Demolish()
	PlayFX("Demolish", "end", self)
	if self.is_switch then
		self:MakeNotSwitch()
	else
		self:delete()
	end
end
---------------------------------------------------------------------------------------------------------
--construction grid, used to keep track which elements under construction are connected
--so that we get pretty connections, it should be little more then an array wrapper.
---------------------------------------------------------------------------------------------------------
DefineClass.PlaceholderSupplyGrid = {
	__parents = { "SyncObject" },
	elements = false,
	supply_resource = "electricity",
	grid_subtype = "construction_grid",
	update_visuals = false,
	update_visuals_args = false, 
	
	air_grid = false, --so pipe constructions don't assert the infopanel
	current_reserve = 0, --fixes some asserts during building placement near electrical cable under construtction.
	element_skin = "Default",
	
	ChangeElementSkin = SupplyGridFragment.ChangeElementSkin,
}

function PlaceholderSupplyGrid:Init()
	InitGridId(self)
end

function PlaceholderSupplyGrid:AddElement(element, update)
	assert(self.grid_subtype == "construction_grid" and IsKindOf(element.building, "ConstructionSite")
			or self.grid_subtype == "switch_grid" and IsSwitchedSwitch(element))
	self.elements = self.elements or {}
	element.grid = self
	table.insert(self.elements, element)
end

function PlaceholderSupplyGrid:RemoveElement(element, update)
	if element.grid ~= self then return end
	remove_entry(self.elements or {}, element)
	element.grid = false
end

function PlaceholderSupplyGrid:UpdateGrid(...)
	DelayedCall(0, PlaceholderSupplyGrid.UpdateVisuals, self)
end

function PlaceholderSupplyGrid:Done()
	OnGridDestroyed(self)
end

function PlaceholderSupplyGrid:UpdateVisuals()
	if not IsValid(self) then return end
	local args = self.update_visuals_args
	self.update_visuals_args = false
	local supply_resource = self.supply_resource
	for i = 1, #self.elements do
		self.elements[i].building:UpdateVisuals(supply_resource, args and table.unpack(args) or nil)
	end
end

function SupplyGridFragment:CreateNewConstructionGrid(params)
	params.supply_resource = self.supply_resource
	return PlaceholderSupplyGrid:new(params)
end

function SupplyGridFragment:CreateNewSwitchGrid(params)
	params.supply_resource = self.supply_resource
	params.grid_subtype = "switch_grid"
	return PlaceholderSupplyGrid:new(params)
end

function IsSwitch(element)
	return IsKindOfClasses(element.building, "ElectricityGridElement", "LifeSupportGridElement") and element.building.is_switch
end

function IsSwitchedSwitch(element)
	return IsKindOfClasses(element.building, "ElectricityGridElement", "LifeSupportGridElement") and element.building.switched_state
end

function SupplyGridObject:SupplyGridConnectElement(element, grid_class, new_grid_skin)
	if not element then return end
	if not IsValid(self) then return end
	local supply_resource = grid_class.supply_resource
	assert(element.grid == false)
	
	local dome = IsObjInDome(self)
	if dome then
		local grid = (dome[supply_resource] or empty_table).grid
		assert(grid and not grid.grid_subtype)
		if grid then
			grid:AddElement(element)
			dome:AddToLabel("SupplyGridBuildings", self)
			assert(IsKindOf(dome, "Dome"))
			element.parent_dome = dome
		end
		return
	end
	
	new_grid_skin = new_grid_skin or self:HasMember("construction_grid_skin") and self.construction_grid_skin
	local is_switched_switch = IsSwitchedSwitch(element)
	local is_construction = IsKindOf(self, "ConstructionSite")
	local grid_type = is_construction and "construction_grid" or is_switched_switch and "switch_grid" or false
	
	local shape = self:GetSupplyGridConnectionShapePoints(supply_resource)
	local potential_neighbours = SupplyGridApplyBuilding(
		SupplyGridConnections[supply_resource], 
		self,
		shape, 
		self:GetShapeConnections(supply_resource), nil, is_construction)

	local grids_merged = false
	local grid
	local built_connections = {}
	local create_connection_call_data = {}
	local is_loading = GameTime() == 0
	local construction_connections = self:HasMember("construction_connections") and self.construction_connections ~= -1 and self.construction_connections or 0
	construction_connections = is_loading and self:HasMember("conn") and construction_connections == 0 and self.conn > 0 and self.conn or construction_connections
	
	if is_loading and self:HasMember("conn") and construction_connections > 0 then
		self.conn = 0 --so cable/pipe's update visuals doesn't early terminate
	end
	
	-- preferred connection direction
	if self.connect_dir or construction_connections ~= 0 then
		local connect_dir = self.connect_dir
		self.connect_dir = nil
		assert(not connect_dir or connect_dir < 3)
		assert(#self:GetSupplyGridConnectionShapePoints(supply_resource) == 1) -- this works for one hex bulidings only
		for i = 1, #(potential_neighbours or ""), 2 do
			local pt, other_pt = potential_neighbours[i], potential_neighbours[i + 1]
			local dir = HexGetDirection(pt, other_pt)
			--don't acknowledge conn_dir at all if we got construction connections
			if (construction_connections > 0 and testbit(construction_connections, dir)) or construction_connections <= 0 and dir % 3 == connect_dir then
				local adjascent = HexGridGetObject(ObjectGrid, other_pt, nil, nil, function(o) return rawget(o, supply_resource) end)
				local adjascent_element = adjascent[supply_resource]
				--fringe preplaced cable glitch, building loads before us and is already connected, but we have a saved connection towards it and end up with 2 connections per building
				local skip = is_loading and testbit(construction_connections, dir) and adjascent_element.grid == grid and supply_resource == "electricity" and IsKindOf(adjascent, "Building")
				if not skip then
					grid_class:CreateConnection(pt, other_pt, self, adjascent)
					built_connections[#built_connections + 1] = {adjascent_element.grid, adjascent_element}
				end

				if not grid then
					if adjascent_element.grid.grid_subtype == grid_type then
						grid = adjascent_element.grid
						grid:AddElement(element)
					end
				else
					-- join all elements from the other grid
					local other_grid = adjascent_element.grid
					if other_grid ~= grid and other_grid.grid_subtype == grid.grid_subtype then
						assert(other_grid.class == grid.class)
						grids_merged = grid
						for _, element in ipairs(other_grid.elements) do
							grid:AddElement(element)
						end
						CopyGridConnections(other_grid, grid)
						other_grid:delete()
					end
				end
			end
		end
	end
	
	local function should_skip(other_grid) --skip neighbours if grids are "connected" to simulate behavior of 1 grid.
		local ignore_g_to_g = not is_construction and not other_grid.grid_subtype and IsKindOf(self, "Building")
		
		for i = 1, #built_connections do
			local g = built_connections[i][1]
			if ignore_g_to_g and g == other_grid or 
				not ignore_g_to_g and AreGridsConnected(g, other_grid) then
				return true
			end
		end
		
		return false
	end
	
	if construction_connections == 0 then --don't connect any more elements than the ones defined by the construction site.
		for i = 1, #(potential_neighbours or ""), 2 do -- pairs of points for a potential connection
			local pt, other_pt = potential_neighbours[i], potential_neighbours[i + 1]
			local adjascent = HexGridGetObject(ObjectGrid, other_pt, nil, nil, function(o) return not not (rawget(o, supply_resource)) end)
									
			local adjascent_element = adjascent[supply_resource]
			local force_connect = ((IsKindOf(self, "Building") and not IsKindOf(self, "LifeSupportGridElement"))and IsKindOf(adjascent, "LifeSupportGridElement"))
												or (IsKindOf(self, "LifeSupportGridElement") and (IsKindOf(adjascent, "Building") and not IsKindOf(adjascent, "LifeSupportGridElement")))
			if not grid then -- first grid we find
				if not should_skip(adjascent_element.grid) or (force_connect and not table.find(built_connections, 2, adjascent_element)) or not table.find(built_connections, 1, adjascent_element.grid) then --in order to remain pretty, don't connect more then once to the same grid
					create_connection_call_data[#built_connections + 1] = {pt, other_pt, self, adjascent}
					built_connections[#built_connections + 1] = {adjascent_element.grid, adjascent_element}
				end
				if adjascent_element.grid.grid_subtype == grid_type then
					grid = adjascent_element.grid
					grid:AddElement(element)
				end
			else
				-- join all elements from the other grid
				local other_grid = adjascent_element.grid
				if other_grid ~= grid and other_grid.grid_subtype == grid.grid_subtype then
					if not should_skip(other_grid) then
						if not table.find(built_connections, 1, adjascent_element.grid) then
							create_connection_call_data[#built_connections + 1] = {pt, other_pt, self, adjascent}
							built_connections[#built_connections + 1] = {adjascent_element.grid, adjascent_element}
						end
						grids_merged = grid
						for _, element in ipairs(other_grid.elements) do
							grid:AddElement(element)
						end
						CopyGridConnections(other_grid, grid)
						other_grid:delete()
					end
				else
					--2 different grid types, if they see eachother for the first time connect them
					if (force_connect and not table.find(built_connections, 2, adjascent_element)) or (not AreGridsConnected(grid, other_grid) and not should_skip(other_grid)) then
						create_connection_call_data[#built_connections + 1] = {pt, other_pt, self, adjascent}
						built_connections[#built_connections + 1] = {adjascent_element.grid, adjascent_element}
					end
				end
			end
		end
	end
	
	if not grid then
		local params = { city = self:HasMember("city") and self.city or UICity, element_skin = new_grid_skin }
		if is_construction then
			grid = grid_class:CreateNewConstructionGrid(params)
		elseif is_switched_switch then
			grid = grid_class:CreateNewSwitchGrid(params)
		else
			grid = grid_class:new(params)
		end
		grid:AddElement(element)
	elseif new_grid_skin and grids_merged then
		grids_merged:ChangeElementSkin(new_grid_skin, nil, true) --propagate through other grids, use second argument to change buildings
	end
	
	for i = 1, #built_connections do
		local other_grid, adjascent_element = table.unpack(built_connections[i])
		if create_connection_call_data[i] then
			grid_class:CreateConnection(table.unpack(create_connection_call_data[i])) 
		end
		if other_grid ~= grid and other_grid.grid_subtype ~= grid.grid_subtype then
			ConnectGrids(element, adjascent_element)
		end
	end
	
	if construction_connections ~= 0 then
		--we need these only once, when we get constructed.
		 self.construction_connections = -1
	end
	
	if not grid.grid_subtype then
		if grids_merged then
			CreateGameTimeThread(function(OverlaySupplyGrid, ConnGrid, grids_merged)
				--supply tunnels may not be up yet
				if #grids_merged.elements > 0 then
					CopySupplyFragmentToOverlayGrid(OverlaySupplyGrid, ConnGrid, grids_merged)
				end
			end, OverlaySupplyGrid, SupplyGridConnections[supply_resource], grids_merged)
		else
			local id = GetGridOverlayIndex(grid)
			if supply_resource == "water" then
				id = shift(id, 4)
			end
			ApplyIDToOverlayGrid(OverlaySupplyGrid, self, shape, id)
		end
	end
end

local KillSupplySplitNotifThread = {electricity = false, water = false}

local function ManageKillNotifThread(thread, container, notif_name, delay)
	if IsValidThread(thread) then
		DeleteThread(thread)
		thread = false
	end
	
	delay = delay or 120000
	
	return CreateGameTimeThread(function(container, notif_name, delay)
		Sleep(delay)
		while #container > 0 do
			table.remove(container)
		end
		RemoveOnScreenNotification(notif_name)
	end, container, notif_name, delay)
end

local ConstructionMask = 64
local SwitchMask = 16384
local OverlayRemWaterMask = 15
local OverlayRemElectricityMask = shift(15, 4)

local function ExecLater_SupplyGridDisconnectElementProxy(grid, grid_class)
	local e = grid.elements[1]
	if e then
		local b = e.building
		b:SupplyGridDisconnectElement(e, grid_class, false, true)
	end
end

function SupplyGridObject:SupplyGridDisconnectElement(element, grid_class, force_no_new_connections, rebuild_only)
	if not element then return end
	local supply_resource = grid_class.supply_resource
	local supply_grid = SupplyGridConnections[supply_resource]
	local grid = element.grid
	assert(grid)
	if not grid then
		return
	end
	assert(self[supply_resource] == element)
	local grid_elements = grid.elements
	if not rebuild_only then
		DestroyAllConnectionsFromElement(element)
		grid:RemoveElement(element)
	end
	local is_switched_switch = IsSwitchedSwitch(element)
	local is_construction = IsKindOf(self, "ConstructionSite")
	local grid_type = is_construction and "construction_grid" or is_switched_switch and "switch_grid" or false
	
	local dome = IsObjInDome(self)
	if dome then
		assert(#grid_elements > 0)
		dome:RemoveFromLabel("SupplyGridBuildings", self)
		element.parent_dome = false
		return
	end
	local shape = self:GetSupplyGridConnectionShapePoints(supply_resource)
	local connections = SupplyGridRemoveBuilding(supply_grid, self, shape, rebuild_only)
	local grid_subtype = grid.grid_subtype
	
	if not rebuild_only and not grid_subtype then
		local mask = supply_resource == "water" and OverlayRemWaterMask or OverlayRemElectricityMask
		ApplyIDToOverlayGrid(OverlaySupplyGrid, self, shape, mask, "band")
	end
	
	if #grid_elements == 0 then
		grid:delete()
		grid = false
	end
	if not connections then
		return
	end

	-- destroy connections
	local build_new_connections = not force_no_new_connections and (not is_construction or not self.is_construction_complete)
	local required_flags = is_construction and ConstructionMask or is_switched_switch and SwitchMask or 0
	local required_not_flags = (is_construction or is_switched_switch) and 0 or (SwitchMask + ConstructionMask)
	local marked_grids = {} --marked for rebuild
	
	if not rebuild_only and build_new_connections then
		for i = 1, #connections, 2 do
			local pt, other_pt = connections[i], connections[i + 1]
			local adjascents = HexGridGetObjects(ObjectGrid, other_pt, nil, nil, function(o)
				return GetGrid(o, supply_resource)
			end)
			for i = 1, #adjascents do
				local adj = adjascents[i]
				local adj_grid = GetGrid(adj, supply_resource)
				if adj_grid and adj_grid ~= grid and adj_grid.grid_subtype ~= grid_subtype and not marked_grids[adj_grid] then
					marked_grids[adj_grid] = true
					local e = adj_grid.elements[1]
					if e then
						assert(adj_grid.supply_resource == grid_class.supply_resource)
						ExecLaterPushObject(adj_grid, ExecLater_SupplyGridDisconnectElementProxy, elf_gt + elf_nov + elf_vpo, 0, grid_class) --gametimer, no validity check, vararg are per obj
					end
				end
				grid_class:DestroyConnection(pt, other_pt, self, adj)
			end
		end
	end

	local visited = NewGrid(HexMapWidth, HexMapHeight, 1)
	local visited_elements
	local remaining = grid_elements[1]
	local new_grid = grid
	local connections_to_build = {}
	local touched_grids = {}
	local function tg(g)
		if g ~= grid and g.grid_subtype ~= grid_subtype and not marked_grids[g] then
			table.insert(touched_grids, g)
			marked_grids[g] = true
		end
	end
	
	while remaining do
		-- expand the new grid as much as possible
		local remaining_b = remaining.parent_dome or remaining.building
		local new_connections = SupplyGridExpand(supply_grid, visited, remaining_b, remaining_b:GetSupplyGridConnectionShapePoints(supply_resource), required_flags, required_not_flags, build_new_connections)
		if build_new_connections then
			table.iappend(connections_to_build, new_connections)
		end
		-- create a new grid and assign it to the elements reached
		if visited_elements then
			local params = { city = self:HasMember("city") and self.city or UICity, element_skin = grid.element_skin }
			if is_construction then
				new_grid = grid_class:CreateNewConstructionGrid(params)
			elseif is_switched_switch then
				new_grid = grid_class:CreateNewSwitchGrid(params)
			else
				new_grid = grid_class:new(params)
			end
			assert(not grid or grid.grid_subtype == new_grid.grid_subtype)
		else -- first run early out
			visited_elements = {}
			if build_new_connections then
				local all_reached = true
				for i = 1, #connections, 2 do
					all_reached = all_reached and HexGridGet(visited, connections[i + 1]) ~= 0
				end
				if all_reached then
					break
				end
			end
		end
		remaining = nil
		for i = #grid_elements, 1, -1 do
			local element = grid_elements[i]
			if not visited_elements[element] then
				if HexGridGet(visited, (element.parent_dome or element.building):GetShapeOffsetedAndRotatedGridPos(supply_resource)) ~= 0 then --will not work for split shapes, whos points are not connected to each other.
					local el_connections = GetElementConnections(element)
					if new_grid ~= grid then
						el_connections = el_connections and table.copy(el_connections) or false
						DestroyAllConnectionsFromElement(element)
						assert(grid.grid_subtype == new_grid.grid_subtype)
						grid:RemoveElement(element)
						new_grid:AddElement(element)
						for i = 1, #(el_connections or "") do
							local e1, e2 = el_connections[i][1], el_connections[i][2]
							ConnectGrids(e1, e2)
							if not rebuild_only and build_new_connections then
								tg(e1.grid)
								tg(e2.grid)
							end
						end
					elseif not rebuild_only and build_new_connections then
						for i = 1, #(el_connections or "") do
							local e1, e2 = el_connections[i][1], el_connections[i][2]
							tg(e1.grid)
							tg(e2.grid)
						end
					end
					visited_elements[element] = true
				else
					remaining = remaining or element
				end
			end
		end
		
		if not grid_subtype and new_grid ~= grid then
			local grid_to_mark = new_grid
			CreateGameTimeThread(function(OverlaySupplyGrid, supply_grid, grid_to_mark)
				CopySupplyFragmentToOverlayGrid(OverlaySupplyGrid, supply_grid, grid_to_mark)
			end, OverlaySupplyGrid, supply_grid, grid_to_mark)
		end
	end
	
	for i = 1, #touched_grids do
		local g = touched_grids[i]
		local e = g.elements[1]
		if e then
			ExecLaterPushObject(g, ExecLater_SupplyGridDisconnectElementProxy, elf_gt + elf_nov + elf_vpo, 0, grid_class) --gametimer, no validity check, vararg are per obj
		end
	end
	
	--postprocess new connections so we know which grid has been disconnected from which
	for i = 1, #(connections_to_build or ""), 2 do
		local pt, other_pt = connections_to_build[i], connections_to_build[i + 1]
		local obj = HexGridGetObject(ObjectGrid, pt, nil, nil, function(o) return rawget(o, supply_resource) end)
		local adjascent = HexGridGetObject(ObjectGrid, other_pt, nil, nil, function(o) return rawget(o, supply_resource) end)
		
		local g1 = obj[supply_resource].grid
		local g2 = adjascent[supply_resource].grid
		if g1 == g2 or not AreGridsConnected(g1, g2) then
			--g1 == g2 => we are reconnecting the same grid at different potential
			--not AreGridsConnected(g1, g2) - we have potential to connect two different grid subtypes
			grid_class:CreateConnection(pt, other_pt, obj, adjascent)
			if g1 ~= g2 and g1.grid_subtype ~= g2.grid_subtype then
				ConnectGrids(obj[supply_resource], adjascent[supply_resource])
			elseif g1 ~= g2 and g1.grid_subtype == g2.grid_subtype then
				MergeGrids(g1, g2)
			end
		end
	end
	
	visited:free()
	
	if not IsSwitch(element) and not is_construction and grid ~= new_grid then
		local sr = supply_resource == "air" and "water" or supply_resource
		local container = g_SplitSupplyGridPositions[sr]
		table.insert_unique(container, self:GetPos())
		KillSupplySplitNotifThread[sr] = ManageKillNotifThread(KillSupplySplitNotifThread[sr], container, 
							sr == "water" and "SplitLifeSupportGrid" or "SplitPowerGrid")
	end
end

function MergeGrids(new_grid, grid) --merges grid into new_grid
	if grid ~= new_grid then
		local elements = grid.elements
		for i = #elements, 1, -1 do
			local element = elements[i]
			local el_connections = GetElementConnections(element)
			el_connections = el_connections and table.copy(el_connections) or false
			DestroyAllConnectionsFromElement(element)
			grid:RemoveElement(element)
			new_grid:AddElement(element)
			for i = 1, #(el_connections or "") do
				ConnectGrids(el_connections[i][1], el_connections[i][2])
			end
		end
	end
	
	assert(#grid.elements == 0)
	grid:delete()
	
	if not new_grid.grid_subtype then
		CreateGameTimeThread(function(OverlaySupplyGrid, ConnGrid, new_grid)
					CopySupplyFragmentToOverlayGrid(OverlaySupplyGrid, ConnGrid, new_grid)
			end, OverlaySupplyGrid, SupplyGridConnections[new_grid.supply_resource], new_grid)
	end
end

function GetChainParams(pos, length, dir, chunk_data, is_catenary)
	local chain = { index = pos, length = length }
	if (dir < 3) == (chunk_data.zd < 0) then
		chain.delta = -abs(chunk_data.zd)
		chain.base = Max(chunk_data.z1, chunk_data.z2)
	else
		chain.delta = abs(chunk_data.zd)
		chain.base = Min(chunk_data.z1, chunk_data.z2)
	end
	if dir >= 3 then
		chain.index = chain.length - chain.index - (is_catenary and 0 or 1)
	end
	return chain
end

if Platform.developer then
	--debug functionality
	GlobalVar("g_GridIdCounter", 0)
	SupplyGridFragment.id = false
	PlaceholderSupplyGrid.id = false
	function InitGridId(self)
		g_GridIdCounter = g_GridIdCounter or 0
		self.id = g_GridIdCounter
		g_GridIdCounter = g_GridIdCounter + 1
	end
else
	InitGridId = empty_func
end

local supply_element_name_to_grid_name = {
	electricity = "ElectricityGrid",
	water = "WaterGrid",
}

DefineClass.SupplyGridSwitch = {
	__parents = { "SyncObject", "PinnableObject", "InfopanelObj" ,"Renamable"},
	
	switched_state = false, -- current switch state
	switch_state = false, -- state to be switched (used when rebuilding)
	is_switch = false,
	construction_connections = -1,
	conn = -1,
	supply_element = "electricity",
	
	display_name = false,
	description = false,
	
	on_state = false,
	off_state = false,
	switch_anim = false,
	open_close_thread = false,
	encyclopedia_id = false,
	
	pin_rollover = T(7383, "<description>"),
	skin_before_switch = false,
	
	switch_cs = false,
	rename_allowed = true,
	name = "",
}

function SupplyGridSwitch:GameInit()
	if self.is_switch then
		if not IsKindOf(self, "ConstructionSite") then --i.e. built.
			self.is_switch = false
			self:MakeSwitch() --init properly
			
			if self.switch_state == "on" and not self.switched_state or self.switch_state == "off" and self.switched_state then
				self:Switch()
			end
		end		
	end
end

function SupplyGridSwitch:Done()
	if IsValid(self.switch_cs) then
		DoneObject(self.switch_cs)
	end
end

function SupplyGridSwitch:CanMakeSwitch()
	return not self.is_switch and self.auto_connect == false and not self.chain
end

function SupplyGridSwitch:MakeNotSwitch(constr_site)
	if self.switched_state then
		self:Switch()
	end
	
	self.is_switch = false
	self.conn = 0
	self.rename_allowed = false
	self.name=""
	self:UpdateVisuals()
	
	if SelectedObj == self then
		SelectObj(false)
	end	
	if self:IsPinned() then
		self:TogglePin()
	end

	self.display_name = nil
	self.description = nil
	self.encyclopedia_id = nil
end


function SupplyGridSwitch:MakeSwitch(constr_site)
	if self.is_switch then return end
	if not self:CanMakeSwitch(constr_site) then return end
	local is_cable = IsKindOf(self, "ElectricityGridElement")
	self.is_switch = true
	self.conn = 0
	self.rename_allowed = true
	self.fx_actor_class = is_cable and "CableSwitch" or "PipeValve"
	self:UpdateVisuals()
	if self.on_state and self:HasState(self.on_state) then
		self:SetState(self.on_state)
	end
	self:SetEnumFlags(const.efSelectable)
	if self.switch_cs then
		self.switch_cs = false
	end
	
	local bld_template = BuildingTemplates[is_cable and "ElectricitySwitch" or "LifesupportSwitch"]
	self.display_name = bld_template.display_name
	self.description = bld_template.description
	self.encyclopedia_id = bld_template.encyclopedia_id
end

function SupplyGridSwitch:GetDisplayName()
	return self.is_switch and self.name~="" and Untranslated(self.name) or self.display_name
end

local BroadcastSwitchesFilter = function(obj, current_state) 
	return obj.is_switch and obj.switched_state == current_state
end

function SupplyGridSwitch:Switch(broadcast)
	if not self.is_switch then return end
	local switches = {}
	local current_state = self.switched_state
	if broadcast then
		switches = MapGet( "map", self.class, BroadcastSwitchesFilter, current_state )
	else
		switches[1] = self
	end
	for i = 1, #switches do		
		local grid_class_def = g_Classes[supply_element_name_to_grid_name[switches[i].supply_element]]
		local skin_name = switches[i]:GetGridSkinName()
		switches[i].skin_before_switch = skin_name
		switches[i].construction_connections = HexGridGet(SupplyGridConnections[switches[i].supply_element], switches[i]) --force same conns on reconnect
		switches[i]:SupplyGridDisconnectElement(switches[i][switches[i].supply_element], grid_class_def, true)
		switches[i].switched_state = not switches[i].switched_state
		switches[i]:SupplyGridConnectElement(switches[i][switches[i].supply_element], grid_class_def, skin_name)
		switches[i].skin_before_switch = nil
		
		if switches[i].supply_element == "electricity" then
			PlayFX("CableSwitched", switches[i].switched_state and "off" or "on", switches[i])
		elseif switches[i].supply_element == "water" then
			PlayFX("PipeSwitched", switches[i].switched_state and "off" or "on", switches[i])
		end
		
		switches[i]:UpdateAnim()
	end
end

function SupplyGridSwitch:UpdateAnim()
	if not self.switch_anim or not self:HasState(self.switch_anim) then
		--there is no anim, don't make threads
		local new_state = self.switched_state and self.off_state or self.on_state
		if new_state and self:HasState(new_state) then
			self:SetState(new_state)
		end
	else
		DeleteThread(self.open_close_thread)
		self.open_close_thread = CreateGameTimeThread(function()
			local anim = self:GetStateText()
			if anim == self.switch_anim then
				Sleep(self:TimeToAnimEnd())
				if not IsValid(self) then return end
			end
			local state = self.switched_state --false we are going to on state, true we are going to off state
			local final_anim = state and self.off_state or self.on_state
			local transition_anim_flags = state and 0 or const.eReverse
			local skip_anim = anim == self.switch_anim and 
								band(self:GetAnimFlags(1), const.eReverse) == transition_anim_flags or false
			
			if not skip_anim then
				self:SetAnim(1, self.switch_anim, transition_anim_flags)
				Sleep(self:TimeToAnimEnd())
				if not IsValid(self) then return end
			end
			
			if final_anim and self:HasState(final_anim) then
				self:SetState(final_anim)
			end
		end)
	end
end

DefineClass.SupplyGridSwitchBuilding = { --placeholder for build menu
	__parents = {"Building"},
	rename_allowed = true,
}

DefineClass.BreakableSupplyGridElement = {
	__parents = { "TaskRequester", },
	
	auto_connect = false,
	priority = 5, --very high consumption priority, so that leaks are serviced first by the grid
	
	supply_resource = false,
	air = false, --we are going to create/destroy this element when we break/repair, if we are pipe
	
	repair_resource_request = false,
	repair_work_request = false,
	fx_params = false,
	
	UpdateAttachedSigns = empty_func,
}

GlobalVar("g_NewLeak", false)

function SavegameFixups.RestartHandleLeakDetectedNotifThread()
	RestartGlobalGameTimeThread("LeakDetectedNotif")
end

function HandleLeakDetectedNotif()	
	local pipe_leaks = g_BrokenSupplyGridElements.water
	local cable_faults = g_BrokenSupplyGridElements.electricity
	if #pipe_leaks + #cable_faults == 0 then
		RemoveOnScreenNotification("LeakDetected")
	elseif g_NewLeak or IsOnScreenNotificationShown("LeakDetected") then
		g_NewLeak = false
		local air_lost = 0
		local water_lost = 0
		for i = 1, #pipe_leaks do
			if pipe_leaks[i].air and pipe_leaks[i].air.current_consumption then
				air_lost = air_lost + pipe_leaks[i].air.current_consumption
			end
			if pipe_leaks[i].water and pipe_leaks[i].water.current_consumption then
				water_lost = water_lost + pipe_leaks[i].water.current_consumption
			end
		end
		local power_lost = 0
		for i = 1, #cable_faults do
			if cable_faults[i].electricity and cable_faults[i].electricity.current_consumption then
				power_lost = power_lost + cable_faults[i].electricity.current_consumption
			end
		end
		local displayed_in_notif = table.iappend(table.copy(pipe_leaks), cable_faults)
		local text
		if #cable_faults > 0 then
			if #pipe_leaks > 0 then
				text = T{10981, "<power(power)> <air(air)> <water(water)>", power = power_lost, air = air_lost, water = water_lost}
			else
				text = T{10982, "<power(power)>", power = power_lost}
			end
		elseif #pipe_leaks > 0 then
			text = T{10983, "<air(air)> <water(water)>", air = air_lost, water = water_lost}
		end
		local rollover = T{10984, "Cable faults: <cables><newline>Pipe leaks: <pipes>", cables = #cable_faults, pipes = #pipe_leaks}
		AddOnScreenNotification("LeakDetected", nil, { leaks = text, rollover_title = T(522588249261, "Leak Detected"), rollover_text = rollover }, displayed_in_notif)
	end
end

GlobalGameTimeThread("LeakDetectedNotif", function()
	while true do
		Sleep(3000)
		HandleLeakDetectedNotif()
	end
end)

function BreakableSupplyGridElement:Init()
	if IsKindOf(self, "ElectricityGridElement") then
		self.supply_resource = "electricity"
	else
		self.supply_resource = "water"
	end
end

function BreakableSupplyGridElement:InternalCreateResourceRequests()
	self.repair_resource_request = self:AddDemandRequest("Metals", 0, 0, 1)
	self.repair_work_request = self:AddWorkRequest("repair", 0, 0, 1)
end

function SavegameFixups.ClearSupplyGridElementRequests()
	MapForEach("map", "BreakableSupplyGridElement", function(o)
			if not o.auto_connect then
				o.task_requests = {}
			else
				o:DisconnectFromCommandCenters()
				for i = #o.task_requests, 1, -1 do
					local r = o.task_requests[i]
					if r ~= o.repair_resource_request
						and r ~= o.repair_work_request then
						table.remove(o.task_requests, i)
					end
				end
				o:ConnectToCommandCenters()
			end
		end)
end

function BreakableSupplyGridElement:InternalDestroyResourceRequests()
	assert(#self.command_centers == 0)
	table.remove_entry(self.task_requests, self.repair_resource_request)
	self.repair_resource_request = nil --lua tables, just kill reference
	table.remove_entry(self.task_requests, self.repair_work_request)
	self.repair_work_request = nil
end

function BreakableSupplyGridElement:GetPriorityForRequest(req)
	if req == self.repair_resource_request or req == self.repair_work_request then
		return 3 --Drones automatically repair cables with the priority of cable construction.
	else
		--we use our priority to force our consumer element to be serviced first, 
		--however asserts will happen if we go above or below known priorities in DroneHub.lua code
		return Clamp(TaskRequester.GetPriorityForRequest(self, req), -1, const.MaxBuildingPriority)
	end
end

GlobalVar("g_BrokenSupplyGridElements", function() return { electricity = {}, water = {} } end)

function BreakableSupplyGridElement:IsBroken()
	return self.auto_connect == true
end

function BreakableSupplyGridElement:CanBreak()
	if self.auto_connect == true then return false end --broken
	if self.is_switch then return false end --switch
	if self.chain then return false end --in unbuildable
	
	return true
end

function BreakableSupplyGridElement:Break()
	assert(IsValid(self))
	if not self:CanBreak() then return end
	--remove our supply element, upgrade it to a consumption element, add it again
	local element = self[self.supply_resource]
	local grid = element.grid
	grid:RemoveElement(element)
	
	element.variable_consumption = true --consume as much as available
	if self.supply_resource == "electricity" then
		local consumption = self:Random(const.BreakDrainPowerMax - const.BreakDrainPowerMin) + const.BreakDrainPowerMin
		consumption = MulDivRound(consumption, const.BreakDrainModifierPct, 100)
		element.consumption = consumption
	else
		local consumption = self:Random(const.BreakDrainWaterMax - const.BreakDrainWaterMin) + const.BreakDrainWaterMin
		consumption = MulDivRound(consumption, const.BreakDrainModifierPct, 100)
		element.consumption = consumption
		
		self.air = NewSupplyGridConsumer(self, true)
		self.air.is_cable_or_pipe = true
		local air_consumption = self:Random(const.BreakDrainOxygenMax - const.BreakDrainOxygenMin) + const.BreakDrainOxygenMin
		air_consumption = MulDivRound(air_consumption, const.BreakDrainModifierPct, 100)
		self.air:SetConsumption(air_consumption)
	end
	
	grid:AddElement(element)
	
	--create reqs
	self:InternalCreateResourceRequests()
	--post repair request
	self.repair_resource_request:AddAmount(1 * const.ResourceScale)
	self.auto_connect = true
	self:ConnectToCommandCenters()
	
	--presentation
	self:Presentation(true)
end

function BreakableSupplyGridElement:GetLeakParticleScale()
	return 25
end

function BreakableSupplyGridElement:Presentation(start)
	if start then
		assert(IsValid(self), "Trying to break dead cable/pipe!")
		table.insert(g_BrokenSupplyGridElements[self.supply_resource], self)
		g_NewLeak = true
		local leak_spot_id
		if self.supply_resource == "electricity" then
			leak_spot_id = self:GetSpotBeginIndex("Sparks")
		else
			-- NOTE: pfff, emulate obj:GetSpotRange("Leak") !!!
			local leak_spots = 0
			while self:HasSpot("Leak" .. (leak_spots + 1)) do
				leak_spots = leak_spots + 1
			end
			leak_spot_id = self:GetSpotBeginIndex("Leak" .. (1 + self:Random(leak_spots)))
		end
		
		if leak_spot_id == -1 then
			leak_spot_id = self:GetSpotBeginIndex("Origin")
		end
		
		local pos = self:GetSpotPos(leak_spot_id)
		local angle, axis = self:GetSpotRotation(leak_spot_id)
		local particle_axis = RotateAxis(axis_z, axis, angle) --get the z axis of the spot
		PlayFX("OxygenLeak", "start", self, nil, pos, particle_axis)
		self.fx_params = table.pack("OxygenLeak", "end", self, nil, pos, particle_axis)
	elseif self.fx_params then
		table.remove_entry(g_BrokenSupplyGridElements[self.supply_resource], self)
		PlayFX(table.unpack(self.fx_params))
		self.fx_params = false
	end
	--
end

function BreakableSupplyGridElement:Done()
	if self.fx_params then
		self:Presentation()
	end
end

function BreakableSupplyGridElement:DroneUnloadResource(drone, request, resource, amount)
	if request == self.repair_resource_request then
		if self.repair_resource_request:GetActualAmount() <= 0 then
			self:StartSupplyGridElementWorkPhase(drone)
		end
	end
end

function BreakableSupplyGridElement:DroneWork(drone, request, resource, amount)
	if request == self.repair_work_request then
		amount = DroneResourceUnits.repair
		drone:PushDestructor(function(drone)
			local self = drone.target
			if IsValid(self) and drone.w_request:GetActualAmount() <= 0 then
				self:Repair()
			end
		end)
		drone:ContinuousTask(request, amount, g_Consts.DroneBuildingRepairBatteryUse, "repairBuildingStart", "repairBuildingIdle", "repairBuildingEnd", "Repair")
		drone:PopAndCallDestructor()
	end
end

function BreakableSupplyGridElement:StartSupplyGridElementWorkPhase(drone)
	self.repair_work_request:AddAmount(g_Consts.DroneRepairSupplyLeak * g_Consts.DroneBuildingRepairAmount)
	if drone then
		drone:SetCommand("Work", self.repair_work_request, "repair", Min(g_Consts.DroneBuildingRepairAmount, self.repair_work_request:GetActualAmount()))
	end
end

function BreakableSupplyGridElement:Repair()
	if not IsValid(self) or self.auto_connect == false then return end
	--remove our element, restore to non-functional element, re-add
	local element = self[self.supply_resource]
	local grid = element.grid
	grid:RemoveElement(element)
	
	element.variable_consumption = false
	element.consumption = false
	self.air = false
	
	grid:AddElement(element)
	
	--disconnect from command centers
	self.auto_connect = false
	self:DisconnectFromCommandCenters()
	--destroy requests
	self:InternalDestroyResourceRequests()
	
	--presentation
	self:Presentation()
	
	Msg("Repaired", self)
	
	if SelectedObj == self then
		SelectObj(false)
	end
	
	if self:IsPinned() then
		self:TogglePin()
	end
end

function BreakableSupplyGridElement:GetDisplayName()
	if self.repair_resource_request then
		return self.supply_resource == "electricity" and T(3890, "Cable Fault") or T(3891, "Pipe Leak")
	elseif IsKindOf(self, "SupplyGridSwitch") then
		return SupplyGridSwitch.GetDisplayName(self)
	else
		return self.display_name
	end
end

function BreakableSupplyGridElement:Getdescription()
	if self.auto_connect then
		return T{3892, "This section of the grid has malfunctioned and it's now leaking. It can be repaired by Drones for <metals(number)>.\n\nLarger networks will malfunction more often.", number = 1000}
	else
		return self.description
	end
end

function TestSupplyGridUpdateThreads()
	local total = 0
	local dead = 0
	local function do_work(c)
		for i = 1, #(c or "") do
			total = total + 1
			if not IsValidThread(c[i].update_thread) then
				dead = dead + 1
			end
		end
	end
	do_work(UICity.electricity)
	do_work(UICity.water)
	print("<green>total grids", total, "</green>")
	print("<red>dead update threads", dead, "</red>")
	print("<em>ele production thread", IsValidThread(UICity.electricity.production_thread) and "alive" or "dead", "water p thread",  IsValidThread(UICity.water.production_thread) and "alive" or "dead", "air p thread", IsValidThread(UICity.air.production_thread)and "alive" or "dead", "</blue>")
end

GlobalVar("g_SplitSupplyGridPositions", function() return { electricity = {}, water = {} } end)

GlobalGameTimeThread("SplitPowerGridNotif", function()
	HandleNewObjsNotif(g_SplitSupplyGridPositions.electricity, "SplitPowerGrid", nil, nil, false)
end)

GlobalGameTimeThread("SplitLifeSupportGridNotif", function()
	HandleNewObjsNotif(g_SplitSupplyGridPositions.water, "SplitLifeSupportGrid", nil, nil, false)
end)

-----------------------------------------
--save fixups below
-----------------------------------------

function ShouldElementBeInGrid(g, e)
	if g.grid_subtype == false then
		if IsKindOf(e.building, "ConstructionSite") then
			return false
		end
	elseif g.grid_subtype == "construction_grid" then
		if not IsKindOf(e.building, "ConstructionSite") then
			return false
		end
	elseif g.grid_subtype == "switch_grid" then
		return e.building.is_switch
	end
	
	return true
end

local function fixup_reconnect_dome_bld_proxy(building, e, grid_class)
	if IsKindOf(building, "Passage") then
		local o_q, o_r = WorldToHex(building)
		for i = 1, #building.shape_points do
			local p = building.shape_points[i]
			HexGridSet(SupplyGridConnections[grid_class.supply_resource], p:x() + o_q, p:y() + o_r, 0)
		end
		
		building:BuildShapeData()
		local d = building.parent_dome
		building.parent_dome = false
		SupplyGridObject.SupplyGridConnectElement(building, e, grid_class)
		building.parent_dome = d
		building.supply_tunnel_set = false
		building:AddSupplyTunnel()
	else
		building:SupplyGridConnectElement(e, grid_class)
	end
end

local function DirtyRemAndReAddElement(e, g, supply_grid, grid_class, supply_resource)
	DestroyAllConnectionsFromElement(e)
	local building = e.building
	local shape = building:GetSupplyGridConnectionShapePoints(supply_resource)
	local connections = SupplyGridRemoveBuilding(supply_grid, building, shape, false)
	g:RemoveElement(e)
	if #g.elements <= 0 then
		g:delete()
	end
	
	if rawget(building, "parent_dome") then
		ExecLaterPushObject(building, fixup_reconnect_dome_bld_proxy, elf_vpo + elf_dup, 10, e, grid_class)
	else
		ExecLaterPushObject(building, building.SupplyGridConnectElement, elf_vpo + elf_dup, 0, e, grid_class)
	end
end

local function re_merge_tunnel_grids(b)
	b:MergeGrids("electricity")
	b:MergeGrids("water")
end

function SavegameFixups.FixObjectsBeingInImproperGrids()
	local sgs = SupplyGridConnections
	MapForEach("map", "SupplyGridObject", function(o)
		local supply_resource = "electricity"
		local ee = rawget(o, supply_resource)
		if ee then
			local g = ee.grid
			if not ShouldElementBeInGrid(g, ee) then
				DirtyRemAndReAddElement(ee, g, sgs[supply_resource], ElectricityGrid, supply_resource)
			end
		end
		
		supply_resource = "water"
		local we = rawget(o, supply_resource)
		if we then
			local g = we.grid
			if not ShouldElementBeInGrid(g, we) then
				DirtyRemAndReAddElement(we, g, sgs[supply_resource], WaterGrid, supply_resource)
				if IsKindOf(we.building, "Tunnel") then
					ExecLaterPushObject(we.building, re_merge_tunnel_grids, 0, 5)
				end
			end
		end
	end)
end