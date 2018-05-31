function City:GetColonyStatsButtons()
	local resource_overview_obj = ResourceOverviewObj
	local t = {
		{
			button_caption = T{547, "Colonists"},
			button_text = T{9640, "Show historical data for Colonists, unemployed and homeless."},
			on_icon = "UI/Icons/ColonyControlCenter/colonist_on.tga",
			off_icon = "UI/Icons/ColonyControlCenter/colonist_off.tga",
			{
				caption = T{547, "Colonists"},
				legend = T{8959, "<graph_right>Colonists</graph_right> <colonists>", colonists = #(self.labels.Colonist or "")},
				data = { self.ts_colonists, }
			},
			{
				caption = T{8960, "Unemployed and Homeless"},
				legend = T{8961, "<graph_left>Unemployed</graph_left> <unemployed>      <graph_right>Homeless</graph_right> <homeless>", unemployed = #(self.labels.Unemployed or ""), homeless = #(self.labels.Homeless or "")},
				data = { self.ts_colonists_unemployed, self.ts_colonists_homeless, },
			},
			id = "colonists",
		},
		{
			button_caption = T{716941050141, "Transportation"},
			button_text = T{9641, "Show historical data for Drones and Shuttles."},
			on_icon = "UI/Icons/ColonyControlCenter/drones_on.tga",
			off_icon = "UI/Icons/ColonyControlCenter/drones_off.tga",
			{
				caption = T{517, "Drones"},
				legend = T{8962, "<graph_right>Drones</graph_right> <drones>", drones = #(self.labels.Drone or "")},
				data = { self.ts_drones, }
			},
			{
				caption = T{745, "Shuttles"},
				legend = T{8963, "<graph_right>Shuttles</graph_right> <shuttles>", shuttles = self:CountShuttles() },
				data = { self.ts_shuttles, },
			},
			id = "transportation",
		},
		{
			button_caption = T{3980, "Buildings"},
			button_text = T{9642, "Show historical data for colony Buildings and completed constructions per Sol."},
			on_icon = "UI/Icons/ColonyControlCenter/buildings_on.tga",
			off_icon = "UI/Icons/ColonyControlCenter/buildings_off.tga",
			{
				caption = T{3980, "Buildings"},
				legend = T{8964, "<graph_right>Buildings</graph_right> <buildings>", buildings = self:CountBuildings()},
				data = { self.ts_buildings, }
			},
			{
				caption = T{8965, "Completed Constructions per Sol"},
				legend = T{8966, "<graph_right>Completed Constructions Today</graph_right> <constructions>", constructions = (self.constructions_completed_today or 0)},
				data = { self.ts_constructions_completed, },
			},
			margin_right = 40,
			id = "buildings",
		},
		{
			button_caption = T{79, "Power"},
			button_text = T{9643, "Show historical data for Power - stored Power, average production and demand per hour."},
			on_icon = "UI/Icons/ColonyControlCenter/power_on.tga",
			off_icon = "UI/Icons/ColonyControlCenter/power_off.tga",
			{
				caption = T{945, "Stored Power"},
				legend = T{8967, "<graph_right>Power</graph_right> <power>", power = FormatResourceValueMaxResource(resource_overview_obj:GetTotalStoredPower())},
				data = { self.ts_resources_grid.electricity.stored, scale = const.ResourceScale, }
			},
			{
				caption = T{8968, "Produced and Demanded Power (average per hour)"},
				legend = T{8969, "<graph_left>Production</graph_left> <produced>      <graph_right>Demand</graph_right> <demand>", produced = FormatResourceValueMaxResource(resource_overview_obj:GetTotalProducedPower()), demand = FormatResourceValueMaxResource(resource_overview_obj:GetTotalRequiredPower())},
				data = { self.ts_resources_grid.electricity.production, self.ts_resources_grid.electricity.consumption, scale = const.ResourceScale}
			},
			id = "power",
		},
		{
			button_caption = T{682, "Oxygen"},
			button_text = T{9645, "Show historical data for Oxygen - stored Oxygen, average production and demand per hour."},
			on_icon = "UI/Icons/ColonyControlCenter/oxygen_on.tga",
			off_icon = "UI/Icons/ColonyControlCenter/oxygen_off.tga",
			{
				caption = T{8970, "Stored Oxygen"},
				legend = T{8971, "<graph_right>Oxygen</graph_right> <air>", air = FormatResourceValueMaxResource(resource_overview_obj:GetTotalStoredAir())},
				data = { self.ts_resources_grid.air.stored, scale = const.ResourceScale, }
			},
			{
				caption = T{8972, "Produced and Demanded Oxygen (average per hour)"},
				legend = T{8969, "<graph_left>Production</graph_left> <produced>      <graph_right>Demand</graph_right> <demand>", produced = FormatResourceValueMaxResource(resource_overview_obj:GetTotalProducedAir()), demand = FormatResourceValueMaxResource(resource_overview_obj:GetTotalRequiredAir())},
				data = { self.ts_resources_grid.air.production, self.ts_resources_grid.air.consumption, scale = const.ResourceScale}
			},
			id = "oxygen",
		},
		{
			button_caption = T{681, "Water"},
			button_text = T{9646, "Show historical data for Water - stored Water, average production and demand per hour."},
			on_icon = "UI/Icons/ColonyControlCenter/water_on.tga",
			off_icon = "UI/Icons/ColonyControlCenter/water_off.tga",
			{
				caption = T{33, "Stored Water"},
				legend = T{8973, "<graph_right>Water</graph_right> <water>", water = FormatResourceValueMaxResource(resource_overview_obj:GetTotalStoredWater())},
				data = { self.ts_resources_grid.water.stored, scale = const.ResourceScale, }
			},
			{
				caption = T{8974, "Produced and Demanded Water (average per hour)"},
				legend = T{8969, "<graph_left>Production</graph_left> <produced>      <graph_right>Demand</graph_right> <demand>", produced = FormatResourceValueMaxResource(resource_overview_obj:GetTotalProducedWater()), demand = FormatResourceValueMaxResource(resource_overview_obj:GetTotalRequiredWater())},
				data = { self.ts_resources_grid.water.production, self.ts_resources_grid.water.consumption, scale = const.ResourceScale}
			},
			margin_right = 40,
			id = "water",
		},
	}
	for i, id in ipairs(StockpileResourceList) do
		local resource_name = FormatResourceName(id)
		t[#t + 1] = {
			button_caption = T{9647, "<resource>", resource = resource_name},
			button_text = T{9648, "Show historical data for <resource> - stockpiled <resource>, production and consumption per Sol.", resource = resource_name},
			on_icon = "UI/Icons/ColonyControlCenter/" .. id:lower() .. "_on.tga",
			off_icon = "UI/Icons/ColonyControlCenter/" .. id:lower() .. "_off.tga",
			{
				caption = T{8976, "Stockpiled <resource>", resource = resource_name},
				legend = T{8977, "<graph_right><resource></graph_right> <amount>", resource = resource_name, amount = resource_overview_obj["GetAvailable" .. id](resource_overview_obj) / const.ResourceScale},
				data = { self.ts_resources[id].stockpile, scale = const.ResourceScale}
			},
			{
				caption = T{8978, "Produced and Consumed (per Sol)", resource = resource_name},
				legend = T{8979, "<graph_left>Production</graph_left> <produced>      <graph_right>Consumption</graph_right> <consumed>", produced = resource_overview_obj["Get" .. id .. "ProducedYesterday"](resource_overview_obj) / const.ResourceScale, consumed = resource_overview_obj["Get" .. id .. "ConsumedByConsumptionYesterday"](resource_overview_obj) / const.ResourceScale},
				data = { self.ts_resources[id].produced, self.ts_resources[id].consumed, scale = const.ResourceScale}
			},
			margin_right = (i % 4 == 0 and i ~= #StockpileResourceList ) and 40 or nil,
			id = id,
		}
	end
	return t
end

function GetCommandCenterColonists(context)
	local colonists
	local container
	local effects_filter
	if context then
		container = context.dome and context.dome or UICity
		if context.problematic_colonists then
			colonists = GetDetrimentalStatusColonists(container)
		end
		effects_filter = {}
		if context.homeless then
			effects_filter["StatusEffect_Homeless"] = true
		end
		if context.unemployed then
			effects_filter["StatusEffect_Unemployed"] = true
		end
	end
	colonists = colonists or table.icopy(container.labels.Colonist) or empty_table
	local able = context.able_to_work
	local unable = context.unable_to_work
	local remove_unable_colonists = able ~= false and not unable
	local remove_able_colonists = unable and able == false
	for i = #colonists, 1, -1 do
		local colonist = colonists[i]
		local removed
		local trait = context.trait and context.trait.name
		if trait and not colonist.traits[trait] then
			table.remove(colonists, i)
			removed = true
		end
		if not removed and (remove_able_colonists or remove_unable_colonists) then
			local can_work = colonist:CanWork()
			if (can_work and remove_able_colonists) or
				(not can_work and remove_unable_colonists) then
				table.remove(colonists, i)
				removed = true
			end
		end
		if not removed then
			for effect, _ in pairs(effects_filter or empty_table) do
				if not colonist.status_effects[effect] then
					table.remove(colonists, i)
					break
				end
			end
		end
	end
	local age_groups = table.invert(const.ColonistAges)
	local specializations = table.invert(table.keys(const.ColonistSpecialization))
	table.stable_sort(colonists, function(a,b)
		if a.age_trait ~= b.age_trait then
			return age_groups[a.age_trait] < age_groups[b.age_trait]
		elseif a.specialist ~= b.specialist then
			return specializations[a.specialist] < specializations[b.specialist]
		else
			return a.age < b.age
		end
	end)
	return colonists
end

function Colonist:UICommandCenterStatUpdate(win, stat)
	local low = g_Consts.LowStatLevel / const.Scale.Stat
	local high = g_Consts.HighStatLevel / const.Scale.Stat
	local id = 3
	local v = self:GetProperty(stat)
	if v < low then
		id = 1
	elseif v < high then
		id = 2
	end
	win.idImage:SetImage("UI/Icons/ColonyControlCenter/conditions_" .. stat:lower() .. id .. ".tga")
	win.idLabel:SetText(tostring(v))
end

function Colonist:GetOverviewInfo()
	local rows = {}
	rows[#rows + 1] = T{4358, "Age Group<right><Age>"}
	rows[#rows + 1] = T{4359, "Specialization<right><Specialization>"}
	rows[#rows + 1] = T{4360, "Residence<right><h SelectResidence InfopanelSelect><ResidenceDisplayName></h>"}
	rows[#rows + 1] = T{213479829949, "<UIWorkplaceLine>"}
	rows[#rows + 1] = self:GetUIInfo(true)
	rows[#rows + 1] = T{9722, "<center><em>Traits</em>"}
	rows[#rows + 1] = self:GetUITraitsRollover()
	rows[#rows + 1] = T{9723, "<center><em>Interests</em>"}
	rows[#rows + 1] = self:GetUIInterestsLine()
	local warning = self:GetUIWarning()
	if warning then
		rows[#rows + 1] = "<center>" .. T{47, "<red>Warning</red>"}
		rows[#rows + 1] = warning
	end
	return table.concat(rows, "<newline><left>")
end

local function IsBuildingOther(building)
	return building.build_category ~= "Decorations" and
		not IsKindOfClasses(building, "ElectricityProducer", "ResourceProducer", "WaterProducer", "AirProducer", "Service", "Residence", "Workshop", "DroneFactory")
end

function GetCommandCenterBuildings(context)
	local buildings
	local dome = context.dome
	if dome then
		--get nearby buildings
		local objs = GetObjects({
			class = "DomeOutskirtBld", 
			area = dome, 
			hexradius = dome:GetOutsideWorkplacesDist() + 7, --a little wider radius to catch borderline buildings
			filter = function(obj, self)
				if not obj:IsKindOf("Building") then return false end
				local dome = IsObjInDome(obj)
				return (not dome or dome == self) and self:IsBuildingInDomeRange(obj) and obj.dome_label and true or false
			end
		}, dome)
		buildings = table.icopy(dome.labels.Buildings)
		for _, obj in ipairs(objs) do
			table.insert_unique(buildings, obj)
		end
	else
		buildings = table.icopy(UICity.labels.Building) or empty_table
	end
	for i = #buildings, 1, -1 do
		local building = buildings[i]
		if (not building.count_as_building and not IsKindOfClasses(building, "UniversalStorageDepot", "WasteRockDumpSite")) or
			IsKindOfClasses(building, "PassageRamp", "PassageGridElement", "Passage", "ConstructionSite") or
			context.inside_buildings == false and building.dome_required or
			context.outside_buildings == false and not building.dome_required or
			not context.decorations and building.build_category == "Decorations" or
			context.power_producers == false and IsKindOf(building, "ElectricityProducer") or
			context.production_buildings == false and IsKindOfClasses(building, "ResourceProducer", "WaterProducer", "AirProducer", "DroneFactory") or
			context.services == false and (IsKindOf(building, "Service") or IsKindOf(building, "Workshop")) and (building.build_category ~= "Decorations" or not context.decorations) or
			not context.residential and IsKindOf(building, "Residence") or
			not context.other and IsBuildingOther(building) or
			building.destroyed or building.bulldozed then
				table.remove(buildings, i)
		end
	end
	local build_categories = table.invert(table.map(BuildCategories, "id"))
	table.stable_sort(buildings, function(a, b)
		if a.build_category ~= b.build_category then
			local cat_a = (a.build_category == "Depots" or a.build_category == "MechanizedDepots") and build_categories["Storages"] or build_categories[a.build_category]
			local cat_b = (b.build_category == "Depots" or b.build_category == "MechanizedDepots") and build_categories["Storages"] or build_categories[b.build_category]
			if cat_a == cat_b then
				--depot, mechanized depot or storage
				if a.build_category == "Storages" then
					return true
				elseif b.build_category == "Storages" then
					return false
				elseif a.build_category == "Depots" then
					return true
				elseif b.build_category == "Depots" then
					return false
				end
			end
			return cat_a < cat_b
		elseif a.build_pos ~= b.build_pos then
			return a.build_pos < b.build_pos
		else
			return a.name < b.name
		end
	end)
	return buildings
end

function Building:GetUIProductionTexts(items, short)
	items = items or {}
	if self:IsKindOf("AirProducer") or self:IsKindOf("WaterProducer") or IsKindOf(self, "ElectricityProducer") or IsKindOf(self, "Mine") or self:IsKindOf("ResourceProducer") and self:GetResourceProduced() and not self:IsKindOf("Farm") then
		if not short then items[#items + 1] = T{9649, "<center><em>Production</em>"} end
		if self:IsKindOf("AirProducer") then
			if not short then
				items[#items + 1] = self:GetUISectionAirProductionRollover()
			else
				items[#items + 1] = T{9769, "<air(ProductionEstimate)>", self.air}
			end
		elseif self:IsKindOf("WaterProducer") then
			items[#items + 1] = self:GetWaterProductionText(short)
			if not short and self:IsKindOf("ResourceProducer") and self.wasterock_producer then
				items[#items + 1] = T{474, "Stored Waste Rock<right><wasterock(GetWasterockAmountStored,wasterock_max_storage)>"}
			end
		elseif IsKindOf(self, "Mine") then
			items[#items + 1] = short and T{9724, "<resource(PredictedDailyProduction, GetResourceProduced)>"} or T{472, "Production per Sol<right><resource(PredictedDailyProduction, GetResourceProduced)>"}
			if not short then
				items[#items + 1] = T{473, "Stored <resource(exploitation_resource)><right><resource(GetAmountStored,max_storage,exploitation_resource)>"}
				items[#items + 1] = T{474, "Stored Waste Rock<right><wasterock(GetWasterockAmountStored,wasterock_max_storage)>"}
			end
		elseif self:IsKindOf("ResourceProducer") then
			for _, producer in ipairs(self.producers) do
				local resource_produced = producer:GetResourceProduced()
				local resource_name = Resources[resource_produced].name
				if short then
					items[#items + 1] = T{9724, "<resource(PredictedDailyProduction, GetResourceProduced)>", 
					resource = resource_name, PredictedDailyProduction = producer:GetPredictedDailyProduction(), GetResourceProduced = resource_produced, producer}
				else
					items[#items + 1] = T{466, "Production per Sol (predicted)<right><resource(PredictedDailyProduction, GetResourceProduced)>", 
					resource = resource_name, PredictedDailyProduction = producer:GetPredictedDailyProduction(), GetResourceProduced = resource_produced, producer}
					items[#items + 1] = T{478, "Stored <resource(GetResourceProduced)><right><resource(GetAmountStored,max_storage,GetResourceProduced)>", 
						resource = resource_name, GetResourceProduced = resource_produced, GetAmountStored = producer:GetAmountStored(), max_storage = producer.max_storage, producer}
				end
			end
			if not short and self.wasterock_producer then
				items[#items + 1] = T{474, "Stored Waste Rock<right><wasterock(GetWasterockAmountStored,wasterock_max_storage)>"}
			end
		elseif self:IsKindOf("ElectricityProducer") then
			items[#items + 1] = short and T{9725, "<power(UIPowerProduction)>"} or T{437, "Power production<right><power(UIPowerProduction)>"}
			if not short and self:IsKindOf("WindTurbine") then
				items[#items + 1] = T{438, "Elevation boost<right><ElevationBonus>%"}
			end
		end
	elseif self:IsKindOf("Farm") and short then
		local index = self.current_crop
		local crop = self:GetCrop(index)
		if crop then
			local production = (self:CalcExpectedProduction(index) or crop.FoodOutput) / (crop.GrowthTime / const.DayDuration)
			local prod = production / 1000
			local frac = production / 100 % 10
			local warn = (production == 0 and TLookupTag("<red>") or TLookupTag("<em>")) or ""
			local icon = const.TagLookupTable["icon_" .. crop.ResourceType]
			items[#items + 1] = T{7414, "<warn><prod>.<frac><icon>", warn = warn, prod = prod, frac = frac, icon = icon}
		end
	end
	return items
end

function Building:GetOverviewInfo()
	local rows = {self.description .. T{316, "<newline>"}}
	rows = self:GetUIProductionTexts(rows)
	local res = self:GetUIConsumptionTexts()
	if next(res) then
		rows[#rows + 1] = T{9650, "<center><em>Consumption</em>"}
		if res.power then rows[#rows + 1] = res.power end
		if res.air then rows[#rows + 1] = res.air end
		if res.water then rows[#rows + 1] = res.water end
		if res.stored_water then rows[#rows + 1] = res.stored_water end
		if res.resource then rows[#rows + 1] = res.resource end
		if res.food then rows[#rows + 1] = res.food end
		if res.upgrade then rows[#rows + 1] = res.upgrade end
	end
	if self:IsKindOf("Service") then
		rows[#rows + 1] = T{9651, "<center><em>Visitors</em>"}
		rows[#rows + 1] = T{708009583391, "Inside<right><count(visitors)>/<colonist(max_visitors)>"}
		rows[#rows + 1] = T{529, "Today<right><colonist(visitors_per_day)>"}
		rows[#rows + 1] = T{530, "Lifetime<right><colonist(visitors_lifetime)>"}
		rows[#rows + 1] = T{531, "Service Comfort<right><Stat(EffectiveServiceComfort)>"}
	end
	if self:IsKindOf("ElectricityStorage") then
		rows[#rows + 1] = T{9652, "<center><em>Power Storage</em>"}
		rows[#rows + 1] = self.electricity:GetElectricityUIMode()
		rows[#rows + 1] = T{464, "Stored Power<right><power(StoredPower)>"}
		rows[#rows + 1] = T{465, "Capacity<right><power(capacity)>"}
		rows[#rows + 1] = T{7784, "Max output<right><power(max_electricity_discharge)>"}
	end
	if self:IsKindOf("AirStorage") then
		rows[#rows + 1] = T{9653, "<center><em>Oxygen Storage</em>"}
		rows[#rows + 1] = self.air:GetUIMode()
		rows[#rows + 1] = T{521, "Stored Oxygen<right><air(StoredAir)>"}
		rows[#rows + 1] = T{522, "Capacity<right><air(air_capacity)>"}
		rows[#rows + 1] = T{7783, "Max output<right><air(max_air_discharge)>"}
	end
	if self:IsKindOf("WaterStorage") then
		rows[#rows + 1] = T{9654, "<center><em>Water Storage</em>"}
		rows[#rows + 1] = self.water:GetUIMode()
		rows[#rows + 1] = T{523, "Stored Water<right><water(StoredWater)>"}
		rows[#rows + 1] = T{111319356806, "Capacity<right><water(water_capacity)>"}
		rows[#rows + 1] = T{7785, "Max output<right><water(max_water_discharge)>"}
	end
	local power_grid = self:IsKindOfClasses("ElectricityProducer", "ElectricityStorage") and self.electricity and self.electricity.grid
	if power_grid then
		rows[#rows + 1] = T{9655, "<center><em>Power Grid</em>"}
		rows[#rows + 1] = T{576, "Power production<right><power(current_production)>", current_production = power_grid.current_production, power_grid}
		rows[#rows + 1] = T{321, "Total demand<right><power(consumption)>", consumption = power_grid.consumption, power_grid}
		rows[#rows + 1] = T{322, "Stored Power<right><power(current_storage)>", current_storage = power_grid.current_storage, power_grid}
	end
	local water_grid = self:IsKindOfClasses("WaterProducer", "WaterStorage") and self.water and self.water.grid
		or self:IsKindOf("LifeSupportGridElement") and self.pillar and self.water and self.water.grid
	if water_grid then
		rows[#rows + 1] = T{9656, "<center><em>Water Grid</em>"}
		rows[#rows + 1] = T{545, "Water production<right><water(current_production)>", current_production = water_grid.current_production, water_grid}
		rows[#rows + 1] = T{332, "Total demand<right><water(consumption)>", consumption = water_grid.consumption, water_grid}
		rows[#rows + 1] = T{333, "Stored Water<right><water(current_storage)>", current_storage = water_grid.current_storage, water_grid}
	end
	local air_grid = self:IsKindOfClasses("AirProducer", "AirStorage") and self.air and self.air.grid 
		or self:IsKindOf("LifeSupportGridElement") and self.pillar and self.water and self.water.grid and self.water.grid.air_grid
	if air_grid then
		rows[#rows + 1] = T{9657, "<center><em>Oxygen Grid</em>"}
		rows[#rows + 1] = T{541, "Oxygen production<right><air(current_production)>", current_production = air_grid.current_production, air_grid}
		rows[#rows + 1] = T{327, "Total demand<right><air(consumption)>", consumption = air_grid.consumption, air_grid}
		rows[#rows + 1] = T{328, "Stored Oxygen<right><air(current_storage)>", current_storage = air_grid.current_storage, air_grid}
	end
	if self:IsKindOf("ShuttleHub") then
		rows[#rows + 1] = T{9658, "<center><em>Shuttles</em>"}
		rows[#rows + 1] = T{766548374853, "Shuttles<right><count(shuttle_infos)>/<max_shuttles>"}
		rows[#rows + 1] = T{398, "In flight<right><FlyingShuttles>"}
		rows[#rows + 1] = T{8700, "Refueling<right><RefuelingShuttles>"}
		rows[#rows + 1] = T{717110331584, "Idle<right><IdleShuttles>"}
		rows[#rows + 1] = T{8701, "Global load <right><GlobalLoadText>"}
	end
	if self:IsKindOf("DroneHub") then
		rows[#rows + 1] = T{9659, "<center><em>Drones</em>"}
		rows[#rows + 1] = T{732959546527, "Drones<right><drone(DronesCount,MaxDronesCount)>"}
		rows[#rows + 1] = T{935141416350, "<DronesStatusText>"}
		if self.total_requested_drones > 0 then
			rows[#rows + 1] = T{8463, "<OrderedDronesCount>"}
		end
	end
	if (IsKindOf(self, "UniversalStorageDepot") or IsKindOf(self, "MechanizedDepot")) and not self:IsKindOf("SupplyRocket") and not IsKindOf(self, "SpaceElevator") then
		if (self:DoesAcceptResource("Metals") or self:DoesAcceptResource("Concrete") or self:DoesAcceptResource("Food") or self:DoesAcceptResource("PreciousMetals")) then
			rows[#rows + 1] = T{9726, "<center><em>Basic Resources</em>"}
			if self:DoesAcceptResource("Concrete") then
				rows[#rows + 1] = T{497, "<resource('Concrete' )><right><concrete(Stored_Concrete, MaxAmount_Concrete)>"}
			end
			if self:DoesAcceptResource("Food") then
				rows[#rows + 1] = T{498, "<resource('Food' )><right><food(Stored_Food, MaxAmount_Food)>"}
			end
			if self:DoesAcceptResource("PreciousMetals") then
				rows[#rows + 1] = T{499, "<resource('PreciousMetals' )><right><preciousmetals(Stored_PreciousMetals, MaxAmount_PreciousMetals)>"}
			end
			if self:DoesAcceptResource("Metals") then
				rows[#rows + 1] = T{496, "<resource('Metals' )><right><metals(Stored_Metals, MaxAmount_Metals)>"}
			end
		end
		if (self:DoesAcceptResource("Polymers") or self:DoesAcceptResource("Electronics") or self:DoesAcceptResource("MachineParts") or self:DoesAcceptResource("Fuel") or self:DoesAcceptResource("MysteryResource")) then
			rows[#rows + 1] = T{9727, "<center><em>Advanced Resources</em>"}
			if self:DoesAcceptResource("Polymers") then
				rows[#rows + 1] = T{502, "<resource('Polymers' )><right><polymers(Stored_Polymers, MaxAmount_Polymers)>"}
			end
			if self:DoesAcceptResource("Electronics") then
				rows[#rows + 1] = T{503, "<resource('Electronics' )><right><electronics(Stored_Electronics, MaxAmount_Electronics)>"}
			end
			if self:DoesAcceptResource("MachineParts") then
				rows[#rows + 1] = T{504, "<resource('MachineParts' )><right><machineparts(Stored_MachineParts, MaxAmount_MachineParts)>"}
			end
			if self:DoesAcceptResource("Fuel") then
				rows[#rows + 1] = T{505, "<resource('Fuel' )><right><fuel(Stored_Fuel, MaxAmount_Fuel)>"}
			end
			if self:DoesAcceptResource("MysteryResource") then
				rows[#rows + 1] = T{8671, "<resource('MysteryResource' )><right><mysteryresource(Stored_MysteryResource, MaxAmount_MysteryResource)>"}
			end
		end
	end
	local warning = self:GetUIWarning()
	if warning then
		rows[#rows + 1] = "<center>" .. T{47, "<red>Warning</red>"}
		rows[#rows + 1] = warning
	end
	return #rows > 0 and table.concat(rows, "<newline><left>") or ""
end

function Building:GetUIConsumptionRow()
	local res = self:GetUIConsumptionTexts("short")
	local t = {}
	if res.power then t[#t + 1] = res.power end
	if res.air then t[#t + 1] = res.air end
	if res.water then t[#t + 1] = res.water end
	if res.stored_water then t[#t + 1] = res.stored_water end
	if res.resource then t[#t + 1] = res.resource end
	if res.upgrade then t[#t + 1] = res.upgrade end
	return table.concat(t, " ")
end

function Building:GetUIProductionRow()
	local res = self:GetUIProductionTexts(nil, "short")
	return table.concat(res, " ")
end

function Building:GetUIEffectsRow()
	if self:IsKindOf("Service") then
		return T{9728, "<count(visitors)>/<colonist(max_visitors)>"}
	elseif self:IsKindOf("Residence") then
		return T{9729, "<UIResidentsCount>/<colonist(UICapacity)>"}
	elseif self:IsKindOf("DroneControl") then
		return T{9730, "<drone(DronesCount,MaxDronesCount)>"}
	elseif self:IsKindOf("ShuttleHub") then
		return T{9770, "<count(shuttle_infos)>/<max_shuttles>"}
	elseif self:IsKindOf("Dome") then
		return T{9771, "<colonist(ColonistCount, LivingSpace)>"}
	elseif (IsKindOf(self, "UniversalStorageDepot") or IsKindOf(self, "MechanizedDepot")) and not self:IsKindOf("SupplyRocket") and not IsKindOf(self, "SpaceElevator") then
		local sum = type(self.resource) == "table" and #self.resource > 1
		local stored, max = 0,0
		if (self:DoesAcceptResource("Metals") or self:DoesAcceptResource("Concrete") or self:DoesAcceptResource("Food") or self:DoesAcceptResource("PreciousMetals")) then
			if self:DoesAcceptResource("Concrete") then
				if sum then
					stored = stored + self:GetStored_Concrete()
					max = max + self:GetMaxAmount_Concrete()
				else
					return T{9731, "<concrete(Stored_Concrete, MaxAmount_Concrete)>"}
				end
			end
			if self:DoesAcceptResource("Food") then
				if sum then
					stored = stored + self:GetStored_Food()
					max = max + self:GetMaxAmount_Food()
				else
					return T{9732, "<food(Stored_Food, MaxAmount_Food)>"}
				end
			end
			if self:DoesAcceptResource("PreciousMetals") then
				if sum then
					stored = stored + self:GetStored_PreciousMetals()
					max = max + self:GetMaxAmount_PreciousMetals()
				else
					return T{9733, "<preciousmetals(Stored_PreciousMetals, MaxAmount_PreciousMetals)>"}
				end
			end
			if self:DoesAcceptResource("Metals") then
				if sum then
					stored = stored + self:GetStored_Metals()
					max = max + self:GetMaxAmount_Metals()
				else
					return T{9734, "<metals(Stored_Metals, MaxAmount_Metals)>"}
				end
			end
		end
		if (self:DoesAcceptResource("Polymers") or self:DoesAcceptResource("Electronics") or self:DoesAcceptResource("MachineParts") or self:DoesAcceptResource("Fuel") or self:DoesAcceptResource("MysteryResource")) then
			if self:DoesAcceptResource("Polymers") then
				if sum then
					stored = stored + self:GetStored_Polymers()
					max = max + self:GetMaxAmount_Polymers()
				else
					return T{9735, "<polymers(Stored_Polymers, MaxAmount_Polymers)>"}
				end
			end
			if self:DoesAcceptResource("Electronics") then
				if sum then
					stored = stored + self:GetStored_Electronics()
					max = max + self:GetMaxAmount_Electronics()
				else
					return T{9736, "<electronics(Stored_Electronics, MaxAmount_Electronics)>"}
				end
			end
			if self:DoesAcceptResource("MachineParts") then
				if sum then
					stored = stored + self:GetStored_MachineParts()
					max = max + self:GetMaxAmount_MachineParts()
				else
					return T{9737, "<machineparts(Stored_MachineParts, MaxAmount_MachineParts)>"}
				end
			end
			if self:DoesAcceptResource("Fuel") then
				if sum then
					stored = stored + self:GetStored_Fuel()
					max = max + self:GetMaxAmount_Fuel()
				else
					return T{9738, "<fuel(Stored_Fuel, MaxAmount_Fuel)>"}
				end
			end
			if self:DoesAcceptResource("MysteryResource") then
				if sum then
					stored = stored + self:GetStored_MysteryResource()
					max = max + self:GetMaxAmount_MysteryResource()
				else
					return T{9739, "<mysteryresource(Stored_MysteryResource, MaxAmount_MysteryResource)>"}
				end
			end
		end
		return T{9740, "<stored>/<max>", stored = FormatResourceValueMaxResource(stored), max = FormatResourceValueMaxResource(max), empty_table}
	elseif self:IsKindOf("ElectricityStorage") then
		return  T{9741, "<power(StoredPower, capacity)>"}
	elseif self:IsKindOf("AirStorage") then
		return  T{9742, "<air(StoredAir, air_capacity)>"}
	elseif self:IsKindOf("WaterStorage") then
		return  T{9743, "<water(StoredWater, water_capacity)>"}
	elseif self:IsKindOf("WasteRockDumpSite") then
		return T{9744, "<wasterock(Stored_WasteRock, MaxAmount_WasteRock)>"}
	elseif self:IsKindOf("Workplace") then
		local count, max = 0, 0
		if self.active_shift > 0 then --single shift building
			count = #self.workers[self.active_shift]
			max = self.max_workers
		else
			for i = 1, self.max_shifts do
				count = count + #self.workers[i]
			end
			max = self.max_shifts * self.max_workers
		end
		return T{9772, "<colonist(count, max)>", count = count, max = max, self}
	elseif self:IsKindOf("TrainingBuilding") then
		local count, max = 0, 0
		if self.active_shift > 0 then --single shift building
			count = #self.visitors[self.active_shift]
			max = self.max_visitors
		else
			for i = 1, self.max_shifts do
				count = count + #self.visitors[i]
			end
			max = self.max_shifts * self.max_visitors
		end
		return T{9772, "<colonist(count, max)>", count = count, max = max, self}
	end
	
	return ""
end

function GetCommandCenterDomesList()
	local domes = UICity.labels.Dome or empty_table
	table.sort(domes, function(a,b)
		if a.build_category ~= "Domes" then --geoscape dome comes last
			return false
		elseif b.build_category ~= "Domes" then --geoscape dome comes last
			return true
		elseif a.build_pos ~= b.build_pos then
			return a.build_pos < b.build_pos
		else
			return a.name < b.name
		end
	end)
	return domes
end

function GetCommandCenterNextDome(cur_dome, dir)
	local domes = GetCommandCenterDomesList()
	local idx = cur_dome and table.find(domes, cur_dome)
	local next_dome = idx and domes[idx + dir] or domes[dir == 1 and 1 or #domes]
	if next_dome then
		return next_dome
	end
end

function SelectCommandCenterNextDome(host, dir)
	local context = host.context or {}
	local dome = context.dome
	dome = GetCommandCenterNextDome(dome, dir)
	context.dome = dome
	host.context = context
	local list = host.idList
	local is_focused = list:IsFocused(true)
	if is_focused then
		list:SetFocus(false, true)
	end
	list:OnContextUpdate()
	list:ScrollTo(0,0)
	host.idButtons:OnContextUpdate(context)
	if is_focused then
		list:SetFocus()
		list:SetSelection(1)
	end
end

function GetDomeFilterRolloverText(win)
	local mode = GetDialogMode(win)
	if mode == "colonists" then
		return GetColonistsFilterRollover(win.context, T{9660, "Filter by Dome."})
	elseif mode == "buildings" then
		return GetBuildingsFilterRollover(win.context, T{9660, "Filter by Dome."})
	end
end

local function add_separator(text, ...)
	local t = {...}
	if not text then return text end
	local count = 0
	for _, val in ipairs(t) do
		if val then
			count = count + 1
		end
	end
	if count > 1 then
		text = text .. ", "
	elseif count == 1 then
		text = text .. T{9661, " or "}
	end
	return text
end

function GetColonistsFilterRollover(context, description)
	local rows = {}
	local dome_name = context.dome and (T{9773, "Dome: "} .. context.dome:GetDisplayName()) or T{596159635934, "Entire Colony"}
	rows[#rows + 1] = context.trait and context.trait.display_name or T{652319561018, "All Traits"}
	local able_to_work = context.able_to_work ~= false and T{9673, "Able to Work"}
	local unable_to_work = context.unable_to_work and T{731124482973, "Unable to Work"}
	able_to_work = add_separator(able_to_work, unable_to_work)
	if able_to_work or unable_to_work then
		rows[#rows + 1] = T{9664, "<able_to_work><unable_to_work>", able_to_work = able_to_work or "", unable_to_work = unable_to_work or ""}
	end
	if context.homeless then
		rows[#rows + 1] = T{9665, "Homeless colonists"}
	end
	if context.unemployed then
		rows[#rows + 1] = T{9666, "Unemployed colonists"}
	end
	if context.problematic_colonists then
		rows[#rows + 1] = T{7934, "Problematic colonists"}
	end
	local res = T{9667, "<center><em>Active Filters</em>"} .. "<newline><left>- " .. dome_name .. "<newline>- " .. table.concat(rows, "<newline>- ")
	if description then
		return table.concat({description, res}, "<newline><newline>")
	else
		return res
	end
end

function GetBuildingsFilterRollover(context, description)
	local rows = {}
	local dome_name = context.dome and (T{9773, "Dome: "} .. context.dome:GetDisplayName()) or T{9774, "In the entire Colony"}
	local inside_buildings = context.inside_buildings ~= false and T{367336674138, "Inside Buildings"}
	local outside_buildings = context.outside_buildings ~= false and T{885971788025, "Outside Buildings"}
	if inside_buildings then
		if outside_buildings then
			inside_buildings = inside_buildings .. T{9661, " or "}
		end
	end
	if inside_buildings or outside_buildings then
		rows[#rows + 1] = T{9668, "<inside_buildings><outside_buildings>", 
			inside_buildings = inside_buildings or "", outside_buildings = outside_buildings or ""}
	end
	local decorations = context.decorations and T{435618535856, "Decorations"}
	local power_producers = context.power_producers ~= false and T{416682488997, "Power Producers"}
	local production_buildings = context.production_buildings ~= false and T{932771917833, "Production Buildings"}
	local services = context.services ~= false and T{133797343482, "Services"}
	local residential = context.residential and T{316855249043, "Residential Buildings"}
	local other = context.other and T{814424953825, "Other Buildings"}
	decorations = add_separator(decorations, power_producers, production_buildings, services, residential, other)
	power_producers = add_separator(power_producers, production_buildings, services, residential, other)
	production_buildings = add_separator(production_buildings, services, residential, other)
	services = add_separator(services, residential, other)
	residential = add_separator(residential, other)
	if decorations or power_producers or production_buildings or services or residential or other then
		rows[#rows + 1] = T{9669, "<decorations><power_producers><production_buildings><services><residential><other>", 
			decorations = decorations or "", power_producers = power_producers or "",
			production_buildings = production_buildings or "", services = services or "",
			residential = residential or "", other = other or "",}
	end
	local res = T{9667, "<center><em>Active Filters</em>"} .. "<newline><left>- " .. dome_name .. "<newline>- " .. table.concat(rows, "<newline>- ")
	if description then
		return table.concat({description, res}, "<newline><newline>")
	else
		return res
	end
end

function Dome:GetOverviewInfo()
	local rows = {self.description .. "<newline>"}
	rows[#rows + 1] = self:GetUISectionCitizensRollover()
	local connected_domes = self.connected_domes
	if next(connected_domes) then
		rows[#rows + 1] = T{9670, "<center><em>Connected Domes</em>"}
		for dome, val in pairs(connected_domes) do
			rows[#rows + 1] = dome:GetDisplayName()
		end
	end
	local warning = self:GetUIWarning()
	if warning then
		rows[#rows + 1] = "<center>" .. T{47, "<red>Warning</red>"}
		rows[#rows + 1] = warning
	end
	return #rows > 0 and table.concat(rows, "<newline><left>") or ""
end

function Dome:UICommandCenterStatUpdate(win, stat)
	local stat_scale = const.Scale.Stat
	local low = g_Consts.LowStatLevel / stat_scale
	local high = g_Consts.HighStatLevel / stat_scale
	local id = 3
	local v = self:GetAverageStat(stat) / stat_scale
	if v < low then
		id = 1
	elseif v < high then
		id = 2
	end
	win.idImage:SetImage("UI/Icons/ColonyControlCenter/conditions_" .. stat:lower() .. id .. ".tga")
	win.idLabel:SetText(tostring(v))
end

function Dome:UICommandCenterGetJobsHomes()
	local jobs = GetFreeWorkplacesAround(self)
	if jobs <= 0 then
		jobs = self.labels.Unemployed and #self.labels.Unemployed or 0
		jobs = jobs > 0 and -jobs or jobs
	end
	local homes = self:GetFreeLivingSpace()
	if homes <= 0 then
		homes = self.labels.Homeless and #self.labels.Homeless or 0
		homes = homes > 0 and -homes or homes
	end
	return jobs, homes
end

function ToggleColonistsTraitsInterests(dialog)
	local context = dialog.context
	local interests = context.interests
	local traits = not interests
	dialog.idTraitsTitle:SetVisible(not traits)
	dialog.idInterestsTitle:SetVisible(traits)
	local list = dialog.idList
	for _, item in ipairs(list) do
		if #item > 0 then
			local child = item[1] -- item is an XVirtualContent control so we get its child
			child.idTraits:SetVisible(not traits)
			child.idInterests:SetVisible(traits)
		end
	end
	context.interests = traits
end

function ToggleBuildingsShiftsEffects(dialog)
	local context = dialog.context
	local shifts = context.shifts
	local effects = not shifts
	dialog.idEffectsTitles:SetVisible(not effects)
	dialog.idShiftsTitles:SetVisible(effects)
	local list = dialog.idList
	for _, item in ipairs(list) do
		if #item > 0 then
			local child = item[1] -- item is an XVirtualContent control so we get its child
			child.idEffects:SetVisible(not effects)
			child.idShifts:SetVisible(effects)
		end
	end
	context.shifts = effects
end

function ToggleCommandCenterFilter(button, name, valid_nil)
	local dlg = GetXDialog(button)
	local context = dlg.context
	local value = valid_nil and context[name] ~= false or context[name]
	--colonists group
	if name == "unable_to_work" and value and context.able_to_work == false or
		name == "able_to_work" and value and not context.unable_to_work then
		return
	end
	--buildings groups
	if name == "inside_buildings" and value and context.outside_buildings == false or
		name == "outside_buildings" and value and context.inside_buildings == false or
		name == "decorations" and value and context.power_producers == false and context.production_buildings == false and context.services == false and not context.residential and not context.other or
		name == "power_producers" and value and not context.decorations and context.production_buildings == false and context.services == false and not context.residential and not context.other or
		name == "production_buildings" and value and not context.decorations and context.power_producers == false and context.services == false and not context.residential and not context.other or
		name == "services" and value and not context.decorations and context.production_buildings == false and context.power_producers == false and not context.residential and not context.other or
		name == "residential" and value and not context.decorations and context.production_buildings == false and context.services == false and context.power_producers == false and not context.other or
		name == "other" and value and not context.decorations and context.production_buildings == false and context.services == false and not context.residential and context.power_producers == false then
		return
	end
	context[name] = not value
	local list = button:ResolveId("idList")
	list:OnContextUpdate()
	list:ScrollTo(0,0) -- reset page scroll when changing filters
	button:ResolveId("idButtons"):OnContextUpdate(context)
	XUpdateRolloverWindow(button)
end

function GetCommandCenterTransportsList()
	local labels = UICity.labels
	local list = {}
	local rc_rovers = labels.RCRover
	local rockets = labels.AllRockets
	local drone_hubs = labels.DroneHub
	local shuttle_hubs = labels.ShuttleHub
	local assemblers = labels.DroneFactory
	local rc_transports = labels.RCTransport
	
	local sort_func = function(a,b) return a.name < b.name end
	if #(drone_hubs or "") > 0 then
		local h = {}
		for _, hub in ipairs(drone_hubs) do
			if not hub.destroyed and not hub.bulldozed then
				h[#h + 1] = hub
			end
		end
		table.stable_sort(h, sort_func)
		table.append(list, h)
	end
	if #(rc_rovers or "") > 0 then
		local r = {}
		for _, rover in ipairs(rc_rovers) do
			if not rover.destroyed then
				r[#r + 1] = rover
			end
		end
		table.stable_sort(r, sort_func)
		table.append(list, r)
	end
	if #(rc_transports or "") > 0 then
		local t = {}
		for _, transport in ipairs(rc_transports) do
			if not transport.destroyed then
				t[#t + 1] = transport
			end
		end
		table.stable_sort(t, sort_func)
		table.append(list, t)
	end
	if #(rockets or "") > 0 then
		local r = {}
		for _, rocket in ipairs(rockets) do
			if rocket.landed then
				r[#r + 1] = rocket
			end
		end
		table.stable_sort(r, sort_func)
		table.append(list, r)
	end
	if #(shuttle_hubs or "") > 0 then
		local s = {}
		for _, shuttle_hub in ipairs(shuttle_hubs) do
			if not shuttle_hub.destroyed and not shuttle_hub.bulldozed then
				s[#s + 1] = shuttle_hub
			end
		end
		table.stable_sort(s, sort_func)
		table.append(list, s)
	end
	if #(assemblers or "") > 0 then
		local a = {}
		for _, assembler in ipairs(assemblers) do
			if not assembler.destroyed and not assembler.bulldozed then
				a[#a + 1] = assembler
			end
		end
		table.stable_sort(a, sort_func)
		table.append(list, a)
	end
	return list
end

function GetCommandCenterTransportInfo(self)
	local rows = {self.description}
	if IsKindOf(self, "ShuttleHub") then
		rows[#rows + 1] = self:GetUIRolloverText(true)
	end
	if IsKindOf(self, "DroneControl") then
		rows[#rows + 1] = T{316, "<newline>"}
		rows[#rows + 1] = T{9659, "<center><em>Drones</em>"}
		if IsKindOf(self, "SupplyRocket") then
			rows[#rows + 1] = T{963695586350, "Drones<right><drone(DronesCount)>"}
		elseif IsKindOf(self, "RCRover") then
			rows[#rows + 1] = T{4491, "Drones<right><count(drones)>/<MaxDrones>"}
		else
			rows[#rows + 1] = T{732959546527, "Drones<right><drone(DronesCount,MaxDronesCount)>"}
		end
		rows[#rows + 1] = self:GetDronesStatusText()
	end
	if IsKindOf(self, "RCTransport") then
		rows[#rows + 1] = T{9805, "<newline><center><em>Resources carried</em>"}
		if self:HasMember("GetStored_Concrete") then
			rows[#rows + 1] = T{343032565187, "Concrete<right><concrete(Stored_Concrete)>"}
		end
		if self:HasMember("GetStored_Metals") then
			rows[#rows + 1] = T{455677282700, "Metals<right><metals(Stored_Metals)>"}
		end
		if self:HasMember("GetStored_Food") then
			rows[#rows + 1] = T{788345915802, "Food<right><food(Stored_Food)>"}
		end
		if self:HasMember("GetStored_PreciousMetals") then
			rows[#rows + 1] = T{925417865592, "Rare Metals<right><preciousmetals(Stored_PreciousMetals)>"}
		end
		if self:HasMember("GetStored_Polymers") then
			rows[#rows + 1] = T{157677153453, "Polymers<right><polymers(Stored_Polymers)>"}
		end
		if self:HasMember("GetStored_Electronics") then
			rows[#rows + 1] = T{624861249564, "Electronics<right><electronics(Stored_Electronics)>"}
		end
		if self:HasMember("GetStored_MachineParts") then
			rows[#rows + 1] = T{407728864620, "Machine Parts<right><machineparts(Stored_MachineParts)>"}
		end
		if self:HasMember("GetStored_Fuel") then
			rows[#rows + 1] = T{317815331128, "Fuel<right><fuel(Stored_Fuel)>"}
		end
	end
	if IsKindOf(self, "DroneFactory") then
		rows[#rows + 1] = T{9806, "<newline><center><em>Construction</em>"}
		rows[#rows + 1] = T{410, "<UIConstructionStatus>"}
		rows[#rows + 1] = T{8646, "Available Drone Prefabs<right><drone(available_drone_prefabs)>"}
		rows[#rows + 1] = T{8539, "Scheduled Drone Prefabs<right><drone(drones_in_construction)>"}
		if UICity:IsTechResearched("ThePositronicBrain") then
			rows[#rows + 1] = T{6742, "Scheduled Biorobots<right><colonist(androids_in_construction)>"}
		end
		rows[#rows + 1] = T{693516738839, "Required <resource(ConstructResource)><right><resource(ConstructResourceAmount, ConstructResourceTotal, ConstructResource)>"}
	end
	local warning = self:GetUIWarning()
	if warning then
		rows[#rows + 1] = "<center>" .. T{47, "<red>Warning</red>"}
		rows[#rows + 1] = warning
	end
	return #rows > 0 and table.concat(rows, "<newline><left>") or ""
end

GlobalVar("g_CommandCenterSavedContext", false)
GlobalVar("g_CommandCenterSavedMode", false)

if FirstLoad then
	g_CommandCenterOpen = false
end

function OnMsg.ChangeMap()
	g_CommandCenterOpen = false
end

function GetCommandCenterDialog()
	return GetXDialog("ColonyControlCenter")
end

function OpenCommandCenter(context, mode)
	g_CommandCenterOpen = true
	GetInGameInterface():SetMode("selection") --make sure there is no other dialog mode open
	local dlg = OpenXDialog("ColonyControlCenter", nil, context or g_CommandCenterSavedContext or {})
	mode = mode or g_CommandCenterSavedMode
	if mode and mode ~= "" then
		dlg:SetMode(mode)
	end
	local mode_dlg = GetInGameInterfaceModeDlg()
	mode_dlg:SetParent(dlg)
end

function CloseCommandCenter()
	CloseXDialog("ColonyControlCenter")
end

function OnMsg.SelectedObjChange()
	CloseCommandCenter()
end

function UpdateUICommandCenterWarning(win)
	CreateRealTimeThread(function(win)
		Sleep(50)
		if win.window_state == "destroying" then return end
		local context = win.context
		local warning = not not context:GetUIWarning()
		win.idRollover:SetImage(warning and "UI/Common/Hex_2_shine_2.tga" or "UI/Common/Hex_2_shine.tga")
		win.idWarningShine:SetVisible(warning)
		win.idWarning:SetVisible(warning)
	end, win)
end

function UpdateUICommandCenterRow(self, context, row_type)
	if row_type == "building" then
		local shifts = GetXDialog(self).context.shifts
		self.idEffects:SetVisible(not shifts)
		self.idShifts:SetVisible(shifts)
		local consumption = context:GetUIConsumptionRow()
		local has_consumption = consumption ~= ""
		self.idConsumption:SetText(consumption)
		self.idConsumption:SetVisible(has_consumption)
		self.idNoConsumption:SetVisible(not has_consumption)
		local production = context:GetUIProductionRow()
		local has_production = production ~= ""
		self.idProduction:SetText(production)
		self.idProduction:SetVisible(has_production)
		self.idNoProduction:SetVisible(not has_production)
		local effects = context:GetUIEffectsRow()
		local has_effects = effects ~= ""
		self.idBuildingEffects:SetText(effects)
		self.idBuildingEffects:SetVisible(has_effects)
		self.idNoBuildingEffects:SetVisible(not has_effects)
	elseif row_type == "colonist" then
		self.idSpecialization:SetImage(context.pin_specialization_icon)
		local interests = GetXDialog(self).context.interests
		self.idTraits:SetVisible(not interests)
		self.idInterests:SetVisible(interests)
	elseif row_type == "dome" then
		self.idLinked:SetText(tostring(#table.keys(context.connected_domes)))
		local jobs, homes = context:UICommandCenterGetJobsHomes()
		self.idJobs:SetText(tostring(jobs))
		self.idHomes:SetText(tostring(homes))
	elseif row_type == "transportation" then
		self:SetRolloverText(GetCommandCenterTransportInfo(context))
		if IsKindOf(context, "DroneControl") then
			local lap_time = context:CalcLapTime()
			local image
			if lap_time >= const.DroneLoadLowThreshold then
				image = "UI/Icons/ColonyControlCenter/warning_low.tga"
				if lap_time >= const.DroneLoadMediumThreshold then
					image = "UI/Icons/ColonyControlCenter/warning_high.tga"
				end
				self.idLoad:SetImage(image)
			end
			self.idLoad:SetVisible(not not image)
			self.idDroneCount:SetText(tostring(#context.drones) .. "/" .. tostring(context:GetMaxDrones()) .. " <image UI/Icons/ColonyControlCenter/drone.tga 1400>")
		elseif IsKindOf(context, "DroneFactory") then
			local drone_count = (context.drones_in_construction or 0)
			local text = tostring(drone_count) .. " <image UI/Icons/ColonyControlCenter/drone.tga 1400>"
			if UICity:IsTechResearched("ThePositronicBrain") then
				local android_count = (context.androids_in_construction or 0)
				text = text .. " " .. tostring(android_count) .. " <image UI/Icons/ColonyControlCenter/android.tga 1400>"
			end
			self.idQueuedPrefabs:SetText(text)
		elseif IsKindOf(context, "ShuttleHub") then
			local shuttles_load = context:GetGlobalLoad()
			local image
			if shuttles_load > 1 then
				image = "UI/Icons/ColonyControlCenter/warning_low.tga"
				if shuttles_load > 2 then
					image = "UI/Icons/ColonyControlCenter/warning_high.tga"
				end
				self.idLoad:SetImage(image)
			end
			self.idLoad:SetVisible(not not image)
			self.idShuttleCount:SetText(tostring(#context.shuttle_infos) .. "/" .. tostring(context.max_shuttles) .. " <image UI/Icons/ColonyControlCenter/shuttle.tga 1400>")
		end
	end
	self.idButtonIcon:SetImage(context:GetPinIcon())
	UpdateUICommandCenterWarning(self)
end