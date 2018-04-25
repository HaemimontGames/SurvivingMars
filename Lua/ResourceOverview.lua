GlobalVar("ShowResourceOverview", false)
GlobalObj("ResourceOverviewObj", "ResourceOverview")
GlobalRealTimeThread("ResourceOverviewThread", function()
	while true do
		if UICity and ResourceOverviewObj.data then
			ResourceOverviewObj.estimated_maintenance_time = RealTime() -- avoid performing estimation on a regular basis
			pcall(GatherResourceOverviewData, ResourceOverviewObj.data)
			ResourceOverviewObj:GatherPerDomeInfo()
			ResourceOverviewObj:CalcColonistsTraits()
			Msg("UIPropertyChanged", ResourceOverviewObj)
			ObjModified(ResourceOverviewObj)
		end
		Sleep(1000)
	end
end)

DefineClass.ResourceOverview =
{
	__parents = { "Object", "InfopanelObj" },
	DisplayName = T{235513581267, "Resource Overview"},
	description = T{3610, "Aggregated information for all resources in the Colony."},
	
	data = false,
	city = false,
	encyclopedia_id = false,
	ip_template = "ipResourceOverview",
	overview = "ResourceOverview",
	
	estimated_maintenance_res = empty_table,
	estimated_maintenance_time = 0,
}

local function RoundResourceAmount(r)
	r = (r + const.ResourceScale / 2) / const.ResourceScale
	r = r * const.ResourceScale
	return r
end

function ResourceOverview:GameInit()
	self.city = self.city or UICity
	self.data = {}
end

function ResourceOverview:GetDisplayName()
	if self.overview == "ResourceOverview" then
		return T{235513581267, --[[Post-Cert]] "Resource Overview"}
	elseif self.overview == "ColonistOverview" then 
		return T{7853, --[[Post-Cert]] "Colonists Overview"}
	elseif self.overview == "TraitsOverview" then	
		return T{235, --[[Post-Cert]] "Traits"}
	end
end

function ResourceOverview:GetIPTab()
	if self.overview == "ResourceOverview" then
		return 'ipResourceOverview'
	elseif self.overview == "ColonistOverview" then 
		return 'ipColonistOverview'
	elseif self.overview == "TraitsOverview" then	
		return 'ipTraitsOverview'
	end
end

function ResourceOverview:Getdescription()
	if self.overview == "ResourceOverview" then
		return T{7852, --[[Post-Cert]] "View information about the resources in your Colony."}
	elseif self.overview == "ColonistOverview" then
		return T{7854, --[[Post-Cert]] "View information about your Colonists."}
	elseif self.overview == "TraitsOverview" then	
		return T{7855, --[[Post-Cert]] "View information about the traits of your Colonists."}
	end
end

function ResourceOverview:GetTotalProducedPower()
	return self.data.total_power_production
end

function ResourceOverview:GetTotalStoredPower()
	return self.data.total_power_storage
end

function ResourceOverview:GetTotalRequiredPower()
	return self.data.total_power_demand
end

function ResourceOverview:GetTotalProducedAir()
	return self.data.total_air_production
end

function ResourceOverview:GetTotalStoredAir()
	return self.data.total_air_storage
end

function ResourceOverview:GetTotalRequiredAir()
	return self.data.total_air_demand
end

function ResourceOverview:GetTotalProducedWater()
	return self.data.total_water_production
end

function ResourceOverview:GetTotalStoredWater()
	return self.data.total_water_storage
end

function ResourceOverview:GetTotalRequiredWater()
	return self.data.total_water_demand
end

function ResourceOverview:GetAvailable(resource_type) --stuff stored in stockpiles + carried by drones + carried by rovers + carried by shuttles
	return RoundResourceAmount(self.data[resource_type])
end

function ResourceOverview:GetProducedYesterday(resource_type) --includes both gathered and produced resources
	return RoundResourceAmount(self.city.gathered_resources_yesterday[resource_type] + self.data.produced_resources_yesterday[resource_type])
end

function ResourceOverview:GetGatheredYesterday(resource_type) --only gathered resources (includes only surf deps atm)
	return RoundResourceAmount(self.city.gathered_resources_yesterday[resource_type])
end

function ResourceOverview:GetConsumedByConsumptionYesterday(resource_type)
	return RoundResourceAmount(self.city.consumption_resources_consumed_yesterday[resource_type])
end

function ResourceOverview:GetConsumedByMaintenanceYesterday(resource_type)
	return RoundResourceAmount(self.city.maintenance_resources_consumed_yesterday[resource_type])
end

local EstimatedDailyMaintenanceQuery = {
	classes = "RequiresMaintenance",
	exec = function(bld, resources)
		bld:GetDailyMaintenance(resources)
	end,
}

function ResourceOverview:GetEstimatedDailyMaintenance(resource_type)
	if RealTime() - self.estimated_maintenance_time > 500 then
		self.estimated_maintenance_time = RealTime()
		self.estimated_maintenance_res = {}
		ForEach(EstimatedDailyMaintenanceQuery, self.estimated_maintenance_res)
	end
	return self.estimated_maintenance_res[resource_type] or 0
end

function ResourceOverview:GetLastExportFunding()
	return UICity.last_export and MulDivRound(UICity.last_export.amount, g_Consts.ExportPricePreciousMetals*1000000, const.ResourceScale) or 0
end

function ResourceOverview:GetIncomePerSol()
	local sponsor_funding = g_Consts.SponsorFundingPerInterval*1000000
	local sols_count = g_Consts.SponsorFundingInterval / const.DayDuration
	local sponsor_funding_per_sol = sols_count>0 and sponsor_funding / sols_count or sponsor_funding
	local celebrity_count = rawget(self.data,"celebrity_count") 
	if not celebrity_count then
		celebrity_count = 0
		local domes = UICity.labels.Dome or {}
		for _, dome in ipairs(domes) do
			celebrity_count = celebrity_count + (dome.labels.Celebrity and #dome.labels.Celebrity or 0)
		end
	end
	local celeb_funding_per_sol = DataInstances.Trait.Celebrity.param
	local celebrity_funding = celebrity_count * celeb_funding_per_sol
	return sponsor_funding_per_sol + celebrity_funding
end

function ResourceOverview:GatherPerDomeInfo()
	if not self.city then return end
	local domes = self.city.labels.Dome or {}
	local celebrity_count, renegades, martianborn, earthborn = 0, 0, 0, 0
	local children, adults, youths, middleageds, seniors = 0,0,0,0,0
	for _, dome in ipairs(domes) do
		local labels = dome.labels
		celebrity_count = celebrity_count + (dome.labels.Celebrity and #dome.labels.Celebrity or 0)
		renegades = renegades + (labels.Renegade and #labels.Renegade or 0)
		children    = children    + (labels.Child and #labels.Child or 0)
		youths      = youths      + (labels.Youth and #labels.Youth or 0)
		adults      = adults      + (labels.Adult and #labels.Adult or 0)
		middleageds = middleageds + (labels["Middle Aged"] and #labels["Middle Aged"] or 0)
		seniors     = seniors     + (labels.Senior and #labels.Senior or 0)
		martianborn = martianborn + (labels.Martianborn and #labels.Martianborn or 0)
	end	
	self.data.celebrity_count = celebrity_count
	self.data.renegades       = renegades
	self.data.children        = children
	self.data.adults          = adults
	self.data.youths          = youths
	self.data.middleageds     = middleageds
	self.data.seniors         = seniors
	self.data.martianborn     = martianborn
	self.data.earthborn       = #(self.city.labels.Colonist or empty_table) - martianborn
end

function ResourceOverview:GetLastExportStr()
	if self.city.last_export then
		local t = self.city.last_export
		return T{3611, "Last export<right>Sol <day>, Hour <hour><newline><left>Rare Metals exported<right><preciousmetals(amount)>", day = t.day, hour = t.hour, amount = t.amount}
	else
		return T{3612, "Last export<right>N/A"}
	end
end

function ResourceOverview:GetRocketRefuelFuelYesterday()
	return self.city.fuel_for_rocket_refuel_yesterday
end

function ResourceOverview:GetFundingRollover()
	local ret = {
		T{3614, "Rare Metals price<right><white><funding(price)></white>", price = g_Consts.ExportPricePreciousMetals*1000000},
		T{3615, "Last Export<right><white><funding(LastExportFunding)></white>", self},
		T{7812, "Total Export<right><funding(number)>", number = self.city.total_export_funding },
		T{3616, "Other Income<right><green><funding(IncomePerSol)></green>", self},
	}
	return table.concat(ret, "<newline><left>")
end

function ResourceOverview:GetFunding()
	return self.city:GetFunding()
end

function ResourceOverview:GetEstimatedRP()
	return self.city:GetEstimatedRP()
end

function ResourceOverview:GetResearchRollover()
	local ret = {
			T{4533, "Sponsor<right><ResearchPoints(EstimatedRP_Sponsor)>", self.city},
			T{4534, "Outsourcing<right><ResearchPoints(EstimatedRP_Outsource)>", self.city},
			T{4535, "Research Labs<right><ResearchPoints(EstimatedRP_ResearchLab)>", self.city},
			T{4536, "Hawking Institutes<right><ResearchPoints(EstimatedRP_ScienceInstitute)>", self.city},
			T{4537, "Genius Colonists<right><ResearchPoints(EstimatedRP_Genius)>", self.city},
		}
		if self.city:IsTechResearched("ExplorerAI") then
			ret[#ret+1] = T{4538, "Explorers<right><ResearchPoints(EstimatedRP_Explorer)>", self.city}
		end
		if g_Consts.ElectricityForResearchPoint ~= 0 then
			ret[#ret+1] = T{4539, "Excess Power<right><ResearchPoints(EstimatedRP_SuperconductingComputing)>", self.city}
		end
	return table.concat(ret, "<newline><left>")
end

function ResourceOverview:GetGridRollover()
	local ret = {
		T{3619, "Power, Water and Oxygen are distributed via Power and Life Support grids.<newline>"} ,
		T{3620, "Power production<right><power(TotalProducedPower)>", self}, 
		T{3621, "Power demand<right><power(TotalRequiredPower)>", self}, 
		T{3622, "Stored Power<right><power(TotalStoredPower)>", self}, 
		T{316, "<newline>"},
		T{3623, "Oxygen production<right><air(TotalProducedAir)>", self}, 
		T{3624, "Oxygen demand<right><air(TotalRequiredAir)>", self}, 
		T{3625, "Stored Oxygen<right><air(TotalStoredAir)>", self}, 
		T{316, "<newline>"},
		T{3626, "Water production<right><water(TotalProducedWater)>", self}, 
		T{3627, "Water demand<right><water(TotalRequiredWater)>", self}, 
		T{3628, "Stored Water<right><water(TotalStoredWater)>", self}, 
	}
	return table.concat(ret, "<newline><left>")
end

function ResourceOverview:GetPowerLine()
	local difference = self:GetTotalProducedPower() - self:GetTotalRequiredPower()
	if difference >= 0 then
		return T{3629, "Power surplus<right><green><power(number)></green>", number = difference}
	else
		return T{3630, "Power shortage<right><red><power(number)></red>", number = difference}
	end
end

function ResourceOverview:GetAirLine()
	local difference = self:GetTotalProducedAir() - self:GetTotalRequiredAir()
	if difference >= 0 then
		return T{3631, "Oxygen surplus<right><green><air(number)></green>", number = difference}
	else
		return T{3632, "Oxygen shortage<right><red><air(number)></red>", number = difference}
	end
end

function ResourceOverview:GetWaterLine()
	local difference = self:GetTotalProducedWater() - self:GetTotalRequiredWater()
	if difference >= 0 then
		return T{3633, "Water surplus<right><green><water(number)></green>", number = difference}
	else
		return T{3634, "Water shortage<right><red><water(number)></red>", number = difference}
	end
end

function ResourceOverview:GetBasicResourcesRollover()
	local ret = {
			T{3635, "Basic resource production, consumption and other stats from the <em>last Sol</em>, unless otherwise stated. Resources in consumption buildings are not counted towards the total available amount. Resource maintenance is estimated per Sol."},
			T{316, "<newline>"},
			T{3636, "Metals production<right><metals(MetalsProducedYesterday)>", self},
			T{3637, "From surface deposits<right><metals(MetalsGatheredYesterday)>", self},
			T{3638, "Metals consumption<right><metals(MetalsConsumedByConsumptionYesterday)>", self},
			T{3639, "Metals maintenance<right><metals(MetalsConsumedByMaintenanceYesterday)>", self},
			T{316, "<newline>"},
			T{3640, "Concrete production<right><concrete(ConcreteProducedYesterday)>", self},
			T{3641, "Concrete consumption<right><concrete(ConcreteConsumedByConsumptionYesterday)>", self},
			T{3642, "Concrete maintenance<right><concrete(ConcreteConsumedByMaintenanceYesterday)>", self},
			T{316, "<newline>"},
			T{3643, "Food production<right><food(FoodProducedYesterday)>", self},
			T{3644, "Food consumption<right><food(FoodConsumedByConsumptionYesterday)>", self},
			T{316, "<newline>"},
			T{3646, "Rare Metals production<right><preciousmetals(PreciousMetalsProducedYesterday)>", self},
			T{3647, "Rare Metals consumption<right><preciousmetals(PreciousMetalsConsumedByConsumptionYesterday)>", self},
			T{3648, "Rare Metals maintenance<right><preciousmetals(PreciousMetalsConsumedByMaintenanceYesterday)>", self},
			T{3649, "<LastExportStr>", self},
		}
	return table.concat(ret, "<newline><left>")
end

function ResourceOverview:GetAdvancedResourcesRollover()
	local ret = {
			T{3654, "Advanced resource production, consumption and other stats from the <em>last Sol</em>, unless otherwise stated. Resources in consumption buildings are not counted towards the total available amount. Resource maintenance is estimated per Sol."},
			T{316, "<newline>"},
			T{3655, "Polymers production<right><polymers(PolymersProducedYesterday)>", self},
			T{3656, "From surface deposits<right><polymers(PolymersGatheredYesterday)>", self},
			T{3657, "Polymers consumption<right><polymers(PolymersConsumedByConsumptionYesterday)>", self},
			T{3658, "Polymers maintenance<right><polymers(PolymersConsumedByMaintenanceYesterday)>", self},
			T{316, "<newline>"},
			T{3659, "Electronics production<right><electronics(ElectronicsProducedYesterday)>", self},
			T{3660, "Electronics consumption<right><electronics(ElectronicsConsumedByConsumptionYesterday)>", self},
			T{3661, "Electronics maintenance<right><electronics(ElectronicsConsumedByMaintenanceYesterday)>", self},
			T{316, "<newline>"},
			T{3662, "Machine Parts production<right><machineparts(MachinePartsProducedYesterday)>", self},
			T{3663, "Machine Parts consumption<right><machineparts(MachinePartsConsumedByConsumptionYesterday)>", self},
			T{3664, "Machine Parts maintenance<right><machineparts(MachinePartsConsumedByMaintenanceYesterday)>", self},
			T{316, "<newline>"},
			T{3665, "Fuel production<right><fuel(FuelProducedYesterday)>", self},
			T{3666, "Fuel consumption<right><fuel(FuelConsumedByConsumptionYesterday)>", self},
			T{3667, "Fuel maintenance<right><fuel(FuelConsumedByMaintenanceYesterday)>", self},
			T{3668, "Refueling of Rockets<right><fuel(RocketRefuelFuelYesterday)>", self},
		}
	return table.concat(ret, "<newline><left>")
end

function ResourceOverview:GetCheatsRollover()
	local ret = {}
	for source, mod in pairs(UICity.label_modifiers.Consts or empty_table) do
		ret[#ret + 1] = string.format("<left>%s<right>%d, %d%%, %s", mod.prop, mod.amount, mod.percent, mod.id or "")
	end
	return Untranslated(table.concat(ret, '\n'))
end

function ResourceOverview:CreateCheatActions(win)
	return InfopanelObj.CreateCheatActions(self, win) or true
end

for i = 1, #AllResourcesList do
	local r_n = AllResourcesList[i]
	
	ResourceOverview["Get" .. r_n .. "ProducedYesterday"] = function(self)
		return self:GetProducedYesterday(r_n)
	end
	
	ResourceOverview["Get" .. r_n .. "GatheredYesterday"] = function(self)
		return self:GetGatheredYesterday(r_n)
	end
	
	ResourceOverview["Get" .. r_n .. "ConsumedByConsumptionYesterday"] = function(self)
		return self:GetConsumedByConsumptionYesterday(r_n)
	end
	
	-- TODO: change the strings "ConsumedByMaintenanceYesterday" with "EstimatedDailyMaintenance"
	ResourceOverview["Get" .. r_n .. "ConsumedByMaintenanceYesterday"] = function(self)
		return self:GetEstimatedDailyMaintenance(r_n)
	end
	
	ResourceOverview["GetAvailable" .. r_n] = function(self)
		return self:GetAvailable(r_n)
	end
end

--------- colonists--------------
function ResourceOverview:GetColonistCount()
	return #(self.city.labels.Colonist or empty_table)
end

function ResourceOverview:GetEmploymentMessage()
	local city_labels = self.city.labels
	local unemployed = city_labels.Unemployed and #city_labels.Unemployed or 0
	local vacant_on, vacant_off = GetFreeWorkplaces(self.city)
	if unemployed > 0 then
		return T{566, "Unemployed<right><colonist(number)>", number = unemployed}
	elseif vacant_on > 0 then
		return T{567, "Vacant work slots<right><colonist(number)>", number = vacant_on}
	elseif vacant_off > 0 then
		return T{568, "Disabled work slots<right><colonist(number)>", number = vacant_off}
	elseif city_labels.Colonist and #city_labels.Colonist > 0 then
		return T{569, "No unemployment, no vacant workplaces"}
	end
	return ""
end

function ResourceOverview:GetUnemployedBtnEnabled()
	local city_labels = self.city.labels
	return city_labels.Unemployed and #city_labels.Unemployed>0 or false
end

function ResourceOverview:GetResidenceMessage()
	local city_labels = self.city.labels
	local homeless = city_labels.Homeless and #city_labels.Homeless or 0
	if homeless > 0 then
		return T{551, "Homeless<right><colonist(number)>", number = homeless}
	end
	local free = GetFreeLivingSpace(self.city)
	if free > 0 then
		return T{552, "Vacant residential slots<right><colonist(number)>", number = free}
	end
	return ""
end

function ResourceOverview:GetHomelessBtnEnabled()
	local city_labels = self.city.labels
	return city_labels.Homeless and #city_labels.Homeless>0 or false
end

function ResourceOverview:GetAverageStat(stat)
	local list = self.city.labels.Colonist or empty_table
	local sum = 0
	for _, colonist in ipairs(list) do
		sum = sum + colonist:GetStat(stat)
	end
	return #list > 0 and (sum / #list) or 0
end

function ResourceOverview:GetAverageHealth() return self:GetAverageStat("Health") end
function ResourceOverview:GetAverageSanity() return self:GetAverageStat("Sanity") end
function ResourceOverview:GetAverageComfort() return self:GetAverageStat("Comfort") end
function ResourceOverview:GetAverageMorale() return self:GetAverageStat("Morale") end

function ResourceOverview:GetJobsText()
	local city_labels = self.city.labels
	local ui_on_vacant, ui_off_vacant = GetFreeWorkplaces(self.city)
	local renegades = rawget(self.data,"renegades")
	if not renegades then
		renegades = 0
		for _, dome in ipairs(self.city.labels.Dome) do
			renegades = renegades + (dome.labels.Renegade and #dome.labels.Renegade or 0)
		end
	end
	local texts = {
		T{548, "Unemployed and looking for work<right><colonist(number)>", number = city_labels.Unemployed and #city_labels.Unemployed or 0, empty_table},
		T{549, "Vacant work slots<right><colonist(number)>",  number = ui_on_vacant},
		T{550, "Disabled work slots<right><colonist(number)>",  number = ui_off_vacant},
		T{7346, "Renegades<right><colonist(number)>", number = renegades},
	}	
	if city_labels.Workshop and next(city_labels.Workshop) then
		texts[#texts +1] = T{8802, "Workers in Workshops<right><percent(WorkshopWorkersPercent)>", self.city}		
	end
	return table.concat(texts, "<newline><left>")
end

function ResourceOverview:GetLivingSpaceText()
	local city_labels = self.city.labels
	local free = GetFreeLivingSpace(self.city)
	local texts = {
		T{552, "Vacant residential slots<right><colonist(number)>", number = free},
		T{7624, "Vacant nursery slots<right><colonist(number)>", number = GetFreeLivingSpace(self.city,true) - free},
		T{551, "Homeless<right><colonist(number)>",   number = city_labels.Homeless and #city_labels.Homeless or 0},
	}
	return table.concat(texts, "<newline><left>")
end

function ResourceOverview:GetAgeGroupsText()
	if not rawget(self.data, "children") then
		self:GatherPerDomeInfo()
	end
	local data = self.data
	local texts = {
		T{554, "Children<right><colonist(number)>",   number = data.children},
		T{555, "Youth<right><colonist(number)>",      number = data.youths},
		T{556, "Adults<right><colonist(number)>",     number = data.adults},
		T{557, "Middle Aged<right><colonist(number)>",number = data.middleageds},
		T{558, "Senior<right><colonist(number)>",     number = data.seniors},
		T{316, "<newline>"},
		T{8035, "Martianborn<right><colonist(number)>", number = data.martianborn},
		T{8036, "Earthborn<right><colonist(number)>",   number = data.earthborn},
	}
	return table.concat(texts, "<newline><left>")
end

-----------------------traits--------------
function ResourceOverview:GetSpecializationsText()
	local texts = {}
	texts[#texts+1] = T{7858, "<specialization><right><colonist(number)>", specialization = const.ColonistSpecialization["none"].display_name_plural, number = #(self.city.labels["none"] or empty_table)}
	for  id, spec in sorted_pairs(const.ColonistSpecialization) do
		if id~="none" then
			texts[#texts+1] = T{7858, "<specialization><right><colonist(number)>", specialization = spec.display_name_plural, number = #(self.city.labels[id] or empty_table)}
		end
	end
	return #texts>0 and table.concat(texts, "<newline><left>") or T{6761, "None"}
end

function ResourceOverview:CalcColonistsTraits()
	if not self.city then return end
	local traits_count = {["Positive"] = {}, ["Negative"] = {}, ["rare"] = {}}
	--local max = {["Positive"] = {}, ["Negative"] = {}, ["rare"] = {}}
	local traits = DataInstances.Trait	
	for _,trait_def in ipairs(traits) do
		local category = trait_def.category
		local in_category = category=="Positive" or category=="Negative" 
		if in_category or trait_def.rare then
			for _, dome in ipairs(self.city.labels.Dome) do
				local name = trait_def.name
				local count = #(dome.labels[name] or empty_table)
				if count>0 then
					if in_category then
						traits_count[category][name] = (traits_count[category][name] or 0) + count
					--	local max_incategory = max[category]
					--	if #max_incategory<4 then
					--		max_incategory[#max_incategory + 1] = {name, count}
					--	elseif count>max_incategory[#max_incategory] then
							
					--	end
					end	
					if trait_def.rare then
						traits_count.rare[name] = (traits_count.rare[name] or 0) + count
					end	
				end	
			end
		end
	end
	ResourceOverviewObj.data.traits_count = traits_count
	return traits_count
end

function ResourceOverview:GetPerksText()
	local traits_count = rawget(self.data, "traits_count") or self:CalcColonistsTraits()
	local t = GetComboItems(traits_count.Positive)
	table.sort(t, function(a,b) return a.text>b.text end )
	local texts = {}
	for i=1, Min(4,#t) do
		texts[#texts + 1] = T{7859, "<trait><right><colonist(number)>", trait =  DataInstances.Trait	[t[i].value].display_name, number = t[i].text}
	end
	return #t>0 and table.concat(texts, "<newline><left>") or T{6761, "None"}
end

function ResourceOverview:GetPerksRolloverText()
	local traits_count = rawget(self.data, "traits_count") or self:CalcColonistsTraits()
	local t = GetComboItems(traits_count.Positive)
	table.sort(t, function(a,b) return a.text>b.text end )
	local texts = { T{7861, --[[XTemplate ipTraitsOverview RolloverText]] "Perks are beneficial traits, representing various talents and abilities of your Colonists."},}
	for i=1, #t do
		texts[#texts + 1] = T{7859, "<trait><right><colonist(number)>", trait =  DataInstances.Trait	[t[i].value].display_name, number = t[i].text}
	end
	return table.concat(texts, "<newline><left>")
end

function ResourceOverview:GetFlawsText()
	local traits_count = rawget(self.data, "traits_count") or self:CalcColonistsTraits()
	local t = GetComboItems(traits_count.Negative)
	table.sort(t, function(a,b) return a.text>b.text end )
	local texts = {}
	for i=1, Min(4,#t) do
		texts[#texts + 1] = T{7859, "<trait><right><colonist(number)>", trait = DataInstances.Trait	[t[i].value].display_name, number = t[i].text}
	end
	return #t>0 and table.concat(texts, "<newline><left>") or T{6761, "None"}
end

function ResourceOverview:GetFlawsRolloverText()
	local traits_count = rawget(self.data, "traits_count") or self:CalcColonistsTraits()
	local t = GetComboItems(traits_count.Negative)
	table.sort(t, function(a,b) return a.text>b.text end )
	local texts = {T{7862, --[[XTemplate ipTraitsOverview RolloverText]] "Flaws are Detrimental traits, representing various flaws and disabilities of your Colonists."}}
	for i=1, #t do
		texts[#texts + 1] = T{7859, "<trait><right><colonist(number)>", trait = DataInstances.Trait	[t[i].value].display_name, number = t[i].text}
	end
	return table.concat(texts, "<newline><left>")
end

function ResourceOverview:GetRareTraits()
	local traits_count = rawget(self.data, "traits_count") or self:CalcColonistsTraits()
	local t = GetComboItems(traits_count.rare)
	table.sort(t, function(a,b) return a.text>b.text end )
	local texts = {}
	for i=1, Min(4,#t) do
		texts[#texts + 1] = T{7859, "<trait><right><colonist(number)>", trait = DataInstances.Trait	[t[i].value].display_name, number = t[i].text}
	end
	return #t>0 and table.concat(texts, "<newline><left>") or T{6761, "None"}
end

function ResourceOverview:GetRareTraitsRollover()
	local traits_count = rawget(self.data, "traits_count") or self:CalcColonistsTraits()
	local t = GetComboItems(traits_count.rare)
	table.sort(t, function(a,b) return a.text>b.text end )
	local texts = {T{7863, --[[XTemplate ipTraitsOverview RolloverText]] "Rare traits denote exceptional citizens that have significant impact on your Colony."}}
	for i=1, #t do
		texts[#texts + 1] = T{7859, "<trait><right><colonist(number)>", trait = DataInstances.Trait	[t[i].value].display_name, number = t[i].text}
	end
	return table.concat(texts, "<newline><left>")
end

------------------------------------------------------------------
function ResourceOverview:GetFirstWithDetrimentalStatusEffect()
local city = self.city
	local detrimental_status_effects = GetDetrimentalStatusEffects()
	local array = city.labels.Colonist or empty_table
	for _, colonist in ipairs(array) do
		for i, effect in ipairs(detrimental_status_effects) do
			if colonist.status_effects[effect] then				
				return colonist
			end	
		end
	end	
	return false
end

function ResourceOverview:GetHomelessRolloverTitle()
	return T{7864, --[[Post-Cert]] "Homeless colonists: <colonist(number)>", number = #(self.city.labels.Homeless or empty_table)}
end

function ResourceOverview:GetHomelessRolloverText()
	if #(self.city.labels.Homeless or empty_table)>0 then
		return T{7865, --[[Post-Cert]] "Select a homeless colonist."}
	else	
		return T{7866, --[[Post-Cert]] "There are no homeless colonists."}
	end	
end

function ResourceOverview:GetUnemployedRolloverTitle()
	return T{7867, --[[Post-Cert]] "Unemployed colonists: <colonist(number)>", number = #(self.city.labels.Unemployed or empty_table)}
end

function ResourceOverview:GetUnemployedRolloverText()
	if #(self.city.labels.Unemployed or empty_table)>0 then
		return T{7868, --[[Post-Cert]] "Select an unemployed colonist."}
	else	
		return T{7869, --[[Post-Cert]] "There are no unemployed colonists."}
	end	
end

function ResourceOverview:GetProblematicRolloverTitle()
	return T{7870, --[[Post-Cert]] "Problematic colonists: <colonist(number)>", number = #(GetDetrimentalStatusColonists(self.city))}
end

function ResourceOverview:GetProblematicRolloverText()
	if self:GetFirstWithDetrimentalStatusEffect() then
		return T{7871, --[[Post-Cert]] "Select a colonist suffering from a status effect."}
	else	
		return T{7971, --[[Post-Cert]] "There are no colonists suffering from status effects."}
	end	
end

function ResourceOverview:OnShortcut(shortcut, source)
	if shortcut == "RightTrigger-ButtonA" then
		InfopanelSlideIn = false
		ResourceOverviewObj.overview = "ResourceOverview"
		OpenXInfopanel(nil, ResourceOverviewObj, 'ipResourceOverview')
		return "break"
	elseif shortcut == "RightTrigger-ButtonX" then
		InfopanelSlideIn = false
		ResourceOverviewObj.overview = "ColonistOverview"
		OpenXInfopanel(nil, ResourceOverviewObj, 'ipColonistOverview')
		return "break"
	elseif shortcut == "RightTrigger-ButtonY" then
		InfopanelSlideIn = false
		ResourceOverviewObj.overview = "TraitsOverview"
		OpenXInfopanel(nil, ResourceOverviewObj, 'ipTraitsOverview')
		return "break"		
	end		
end	
--------------------------------
function IsColonyOverviewOpened()
	local infopanel = GetXDialog("Infopanel")
	return infopanel and IsKindOf(infopanel.context, "ResourceOverview")
end

function OpenResourceOverviewInfopanel(parent)
	if not IsColonyOverviewOpened() then
	OpenXInfopanel(parent, ResourceOverviewObj, ResourceOverviewObj:GetIPTab() or 'ipResourceOverview')
	end
end

function CloseResourceOverviewInfopanel()
	if IsColonyOverviewOpened() then
		CloseXInfopanel()
		if SelectedObj and GetInGameInterfaceMode() ~= "overview" then
			ReopenSelectionXInfopanel()
		end
	end
end

