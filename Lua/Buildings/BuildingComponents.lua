function GetEntityStatesForTemplateObj(obj, add_none)
	local ret = IsValidEntity(obj.entity) and GetStates(obj.entity) or {}
	--TODO: filter invalid stuff?
	if add_none then
		table.insert(ret, 1, "none")
	end
	return ret
end

DefineClass.DepositExploiter = {
	__parents = { "Object" },
	
	properties = {
		{ template = true, category = "Deposit Requirements", name = T(211, "Required Deposit Resource"),   id = "exploitation_resource",   editor = "dropdownlist", items = ResourcesDropDownListItems, default = ResourcesDropDownListItems[1].value},
	},
}

function DepositExploiter:HasNearbyDeposits()
	return false
end

function OnMsg.TechResearched(tech_id, city)
	if tech_id == "NanoRefinement" then
		MapForEach("map", "DepositExploiter",
			function(obj)
				if IsKindOf(obj, "BaseBuilding") then
					obj:UpdateConsumption()
					if obj:HasMember("DepositChanged") then
						obj:DepositChanged()
					end
					obj:UpdateWorking()
				end
			end)	
	end
end

DefineClass.BuildingDepositExploiterComponent = {
	__parents = { "DepositExploiter" },
	
	properties = {
		{ template = true, category = "Deposit Requirements", name = T(212, "Deposit Search Radius"), id = "exploitation_radius",     editor = "number", default = 4, min = 1, max = const.RangeToCheckForExploitersOnDepositReveal, help = "This is the radius around the origin of the building from where resources will be extracted. This value is in hexes. Construction warnings will also be based on this number.", },
	},
	
	nearby_deposits = false,
}

function BuildingDepositExploiterComponent:Init()
	self.nearby_deposits = {}
end

function BuildingDepositExploiterComponent:GameInit()
	local city = self:HasMember("city") and self.city or UICity
	city:AddToLabel("ResourceExploiter", self)
	self:GatherNearbyDeposits()
end

function BuildingDepositExploiterComponent:Done()
	local city = self:HasMember("city") and self.city or UICity
	city:RemoveFromLabel("ResourceExploiter", self)
end

function BuildingDepositExploiterComponent:HasNearbyDeposits()
	return self.nearby_deposits and #self.nearby_deposits > 0
end

function BuildingDepositExploiterComponent:GetWorkNotPossibleReason()
	if self.city:IsTechResearched("NanoRefinement") then
		return
	elseif not self:HasNearbyDeposits() then
		return "NoDeposits"
	elseif self:IsTechLocked() then
		return "UnexploitableDeposit"
	elseif not self:CanExploit() then
		return "NoExploitableDeposits"
	end
end
	
--callback, called when nearby deposits have been initialized during map load.
function BuildingDepositExploiterComponent:OnDepositsLoaded()
end

function BuildingDepositExploiterComponent:SortNearbyDeposits() --override this if u want ur building to have different priorities.
	SortNearbyDeposits(self.nearby_deposits, self)
end

function SortNearbyDeposits(deposits, ref_obj)
	local max_exploitable_layer = UICity:GetMaxSubsurfaceExploitationLayer()
	ref_obj = ref_obj or self
	for i=1,#deposits do
		deposits[i].quality_mul = deposits[i]:GetQualityMultiplier(ref_obj)
	end
	table.sort(deposits,
		function(a, b)
			if a.depth_layer > max_exploitable_layer and b.depth_layer <= max_exploitable_layer then
				return false --b is better
			elseif a.depth_layer <= max_exploitable_layer and b.depth_layer > max_exploitable_layer then
				return true --a is better
			else
				local a_quality = a.quality_mul
				local b_quality = b.quality_mul
				if a_quality  ~= b_quality then
					return a_quality  > b_quality --bigger is better
				else
					return a.depth_layer < b.depth_layer --smaller is better
				end
			end
		end)
end

function BuildingDepositExploiterComponent:StartExploit(deposit)
	if not deposit:IsExploitableBy(self) then
		return
	end
	
	local deposits = self.nearby_deposits
	if deposits[deposit] then
		return
	end
	
	assert(deposit.resource == self.exploitation_resource)
	assert(HexAxialDistance(self, deposit) <= self.exploitation_radius) -- only valid for subsurface deposits
		
	local first = deposits[1]
	deposits[#deposits + 1] = deposit
	deposits[deposit] = true
	self:SortNearbyDeposits()
	if first ~= deposits[1] then
		self:OnChangeActiveDeposit()
	end
end

function BuildingDepositExploiterComponent:GatherNearbyDeposits(no_filter)
	local depo_hexaradius = self.exploitation_radius
	local depo_filter = function(o, self) return o:IsExploitableBy(self) end
	if no_filter then
		depo_filter = nil
	end
	local deposits = MapGet(self, "hex", depo_hexaradius, "SubsurfaceDeposit", depo_filter, self)
	for i=1,#deposits do
		deposits[deposits[i]] = true
	end
	self.nearby_deposits = deposits
	self:SortNearbyDeposits()
end

function BuildingDepositExploiterComponent:GatherConstructionStatuses(statuses)
	self:GatherNearbyDeposits("no_filter")
	local require_tech
	local resource_nearby
	if #self.nearby_deposits > 0 then
		for _, deposit in ipairs(self.nearby_deposits) do
			if deposit.resource == self.exploitation_resource then
				resource_nearby = true
				if self:IsTechLocked(deposit) then
					require_tech = true
				end
			end
		end
	end
	if #self.nearby_deposits > 0 and require_tech then
		statuses[#statuses + 1] = ConstructionStatus.ResourceTechnologyRequired
	elseif #self.nearby_deposits <= 0 or not resource_nearby then
		statuses[#statuses + 1] = ConstructionStatus.ResourceRequired
	end
	
	Building.GatherConstructionStatuses(self, statuses)
end

GlobalVar("g_IdleExtractors", {})
GlobalGameTimeThread("IdleExtractorsNotif", function()
	HandleNewObjsNotif(g_IdleExtractors, "NoDeposits")
end)

function BuildingDepositExploiterComponent:IsIdle()
	return not self:CanExploit() and self.ui_working
end

function BuildingDepositExploiterComponent:UpdateIdleExtractorNotification()
	if self:IsIdle() then
		table.insert_unique(g_IdleExtractors, self)
	else
		table.remove_entry(g_IdleExtractors, self)
	end
end

function BuildingDepositExploiterComponent:GetDepositGrade(deposit)
	deposit = deposit or self.nearby_deposits[1]
	return deposit and deposit.grade or "Average"
end

function BuildingDepositExploiterComponent:OnDepositDepleted(dep)
	self:AttachSign(not self:CanExploit() and not self.city:IsTechResearched("NanoRefinement"), "SignNotWorking")
	if dep and IsValid(dep) then
		dep:ClearGameFlags(const.gofPermanent)
	end
	self:UpdateIdleExtractorNotification()
	
	if IsKindOf(self, "BaseBuilding") then
		self:UpdateConsumption()
	end
end

function BuildingDepositExploiterComponent:OnChangeActiveDeposit()
	self:UpdateIdleExtractorNotification()
end

function BuildingDepositExploiterComponent:CanExploit(deposit)
	deposit = deposit or self.nearby_deposits[1]
	return IsValid(deposit) and not self:IsTechLocked(deposit)
end

function BuildingDepositExploiterComponent:IsTechLocked(deposit)
	deposit = deposit or self.nearby_deposits[1]
	return IsValid(deposit) and deposit:GetDepth() >= 2 and not IsDeepExploitable(deposit.resource)
end

function BuildingDepositExploiterComponent:ExtractResource(amount)
	local deposit = self.nearby_deposits[1]
	while not IsValid(deposit) and #self.nearby_deposits > 0 do
		table.remove(self.nearby_deposits, 1)
		self.nearby_deposits[deposit] = nil
		deposit = self.nearby_deposits[1]
		self:OnChangeActiveDeposit()
	end
	
	if not IsValid(deposit) then
		if self.city:IsTechResearched("NanoRefinement") then
			return amount
		else
			self:AttachSign(true, "SignNotWorking")
			--no deps left
			self:UpdateWorking(false)
			return 0
		end
	end
	
	amount = deposit:TakeAmount(amount)
	Msg("ResourceExtracted", deposit.resource, amount)
	
	if deposit:IsDepleted() then
		table.remove(self.nearby_deposits, 1)
		self.nearby_deposits[deposit] = nil
		self:OnDepositDepleted(deposit)
	end
	return amount
end

function BuildingDepositExploiterComponent:GetCurrentDepositQualityMultiplier()
	if next(self.nearby_deposits) then
		return self.nearby_deposits[1]:GetQualityMultiplier(self)
	end
	if self.city:IsTechResearched("NanoRefinement") then
		return GetDepositGradeToMultiplier("Depleted")
	end
	return 0
end

function BuildingDepositExploiterComponent:GetSelectionRadiusScale()
	return self.exploitation_radius
end

function AvailableDeposits(bld, items)
	if not items or not bld:IsKindOf("BuildingDepositExploiterComponent") then
		return
	end
	local deposit, resource = false
	local amount = 0
	if bld:IsKindOf("TerrainDepositExtractor") then
		if bld.found_deposit then
			deposit = bld.found_deposit
			resource = bld.exploitation_resource
			amount = bld:GetAmount()
		end
	else
		if bld.nearby_deposits[1] then
			deposit = bld.nearby_deposits[1]
			resource = deposit.resource
			for i = 1, #bld.nearby_deposits do
				if IsValid(bld.nearby_deposits[i]) then
					amount = amount + bld.nearby_deposits[i].amount
				end
			end
		end
	end
	items[#items+1] = T(297, "<newline><center><em>Deposits</em>")
	if amount > 0 then
		items[#items+1] = T{298, "Available deposits<right><resource(amount,resource)>", amount = amount, resource = resource, bld}
	else
		items[#items+1] = T(299, "Available deposits<right><red>Depleted</red>")
	end
end

function OnMsg.DepositsSpawned()
	local arr = UICity.labels.ResourceExploiter
	
	for i = 1, #(arr or "") do
		arr[i]:GatherNearbyDeposits()
		arr[i]:OnDepositsLoaded()
	end
end

DefineClass.BuildingVisualDustComponent =
{
	__parents = { "Object"},
	
	visual_dust = 0,
	visual_max_dust = 50000,
}

function BuildingVisualDustComponent:ResetDust()
	self.visual_dust = 0
	self:SetDustVisuals(self.visual_dust)
end

function BuildingVisualDustComponent:SetDustVisualsPerc(perc)
	return self:SetDustVisuals(MulDivRound(perc, self.visual_max_dust, 100))
end

function BuildingVisualDustComponent:SetDustVisuals(dust, in_dome)
	local normalized_dust = MulDivRound(dust, 255, self.visual_max_dust)
	--uncoment to prevent pipe attaches getting dusted.
	--[[
	local pipes = PipeConnectionsCache[self:GetEntity()] or {}
	local pipe_connection_classes = {}
	for i=1, #pipes do
		pipe_connection_classes[ pipes[i][4] ] = true
	end]]
	
	ApplyToObjAndAttaches(self, SetObjDust, normalized_dust, in_dome)
end

--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
--divided by 1000, ie a value of 10 means 1/100 waste rock production - for every 100 boxes, 1 wasterock is produced
DepositGradeToWasteRockMultipliers = {
	["Metals"] = {
		["Depleted"]  = 1200,
		["Very Low"]  = 1000,
		["Low"]       = 900,
		["Average"]   = 700,
		["High"]      = 600,
		["Very High"] = 400,
	},
	["Water"] = {
		["Depleted"]  = 150,
		["Very Low"]  = 150,
		["Low"]       = 125,
		["Average"]   = 100,
		["High"]      = 75,
		["Very High"] = 50,
	},
	["Concrete"] = {
		["Depleted"]  = 800,
		["Very Low"]  = 600,
		["Low"]       = 500,
		["Average"]   = 400,
		["High"]      = 300,
		["Very High"] = 200,
	},
	["PreciousMetals"] = {
		["Depleted"]  = 1200,
		["Very Low"]  = 1000,
		["Low"]       = 900,
		["Average"]   = 700,
		["High"]      = 600,
		["Very High"] = 400,
	},
}

--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
DefineClass.BlockableCanExecuteAlone = {
	__parents = { "Object" },
	
	output_blocked = false,
}

function BlockableCanExecuteAlone:GetStockpileDumpSpotTestInputPos(resource)
	return self:GetPos()
end

function BlockableCanExecuteAlone:BuildingUpdate(dt, day, hour)
	if self.output_blocked and not self.destroyed then
		local r = self.output_blocked
		local pos = self:GetStockpileDumpSpotTestInputPos(r)
		local res, q, r = FindStockpileDumpSpot(pos, r)
		
		if res then
			self:ExecuteAloneResourceOutputUnblocked(r)
		end
	end
end

function BlockableCanExecuteAlone:ExecuteAloneResourceOutputBlocked(resource, amount)
	assert(false)
	return false
end

function BlockableCanExecuteAlone:ExecuteAloneResourceOutputUnblocked(resource)
	assert(false)
end
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------

--ResourceProducers can produce multiple resource at once (see max_resources_produced).
--Resources are numbered 1..n. To produce something you need to set the approprate "Rsource Produced" property.
--See class SingleResourceProducer - anything from 'properties' and 'mandatory/optional parameters' can be assigned per resource from here.
--The methods "Produce", "OnProduce", "OnCalcProducion", "GetPredictedProduction", "GetPredictedDailyProduction" can be overriden per resource
--    by implementing "OnProduce_Metals" (for exmaple). See class SingleResourceProducer for explanation on each method.
--    When overriding these methods, the 'self' parameter will be the SingleResourceProducer object!!!
--    Use the 'self.parent' member to access the actual 'ResourceProducer' object.
--Note: Waste Rock production is implemented as an edge case of SingleResourceProducer - the 'Production Per Day' property is ignored.

DefineClass.ResourceProducer = {
	__parents = { "BlockableCanExecuteAlone" },
	properties = { },
	
	manual_resource_production = false,
	
	producers = "",
	max_storage = 0,
	production_per_day = 0,
	
	wasterock_producer = false,
	wasterock_max_storage = false,
}

function GetResourcesDropDownItems()
	local ret = table.copy(ResourcesDropDownListItems)
	table.insert(ret, 1, {text = "", value = ""})
	return ret
end

local max_resources_produced = 3
for i=1,max_resources_produced do
	table.iappend(ResourceProducer.properties, {
		{ template=true, category="ResourceProducer"..i, id="resource_produced"..i,  name=T{6727, "Resource Produced <n>", n=i},  editor="combo",   default="", items = GetResourcesDropDownItems},
		{ template=true, category="ResourceProducer"..i, id="max_storage"..i,        name=T{6728, "Max Storage <n>", n=i},        editor="number", default=20000, scale = const.ResourceScale },
		{ template=true, category="ResourceProducer"..i, id="production_per_day"..i, name=T{6729, "Daily Production <n>", n=i}, editor="number", default=1000,  scale = const.ResourceScale, modifiable = true },
		{ template=true, category="ResourceProducer"..i, id="stockpile_class"..i,    name=T{6730, "Stockpile Class <n>", n=i},    editor="text",   default="ResourceStockpile" },
	})
	
	ResourceProducer["stockpile_spots"..i] = {"Resourcepile"..i}
	ResourceProducer["additional_stockpile_params"..i] = {additional_supply_flags = const.rfPostInQueue}
end
ResourceProducer.max_resources_produced = max_resources_produced

local function SafeGetMember(obj, member, fallback_value)
	if obj:HasMember(member) then
		return obj[member]
	end
	return fallback_value
end

function ResourceProducer:TestResourceAmountConsistency()
	for i = 1, #self.producers do
		if not self.producers[i]:TestStoredAmountConsistency() then
			self:SetColorModifier(RGBA(255, 0, 0, 0))
			return
		end
	end
end

function dbg_TestStockpileControllers()
	MapForEach(true, "ResourceProducer", ResourceProducer.TestResourceAmountConsistency)
end

function ResourceProducer:AddProducer(i) --expects relevant props to be filled
	assert(i <= max_resources_produced, "To many producer objects for ResourceProducer")
	local resource_type = self["resource_produced"..i]
	if resource_type and resource_type ~= "" then
		if Resources[resource_type] then
			local Produce_method_name = string.format("Produce_%s", resource_type)
			local OnProduce_method_name = string.format("OnProduce_%s", resource_type)
			local OnCalcProduction_method_name = string.format("OnCalcProduction_%s", resource_type)
			local GetPredictedProduction_method_name = string.format("GetPredictedProduction_%s", resource_type)
			local GetPredictedDailyProduction_method_name = string.format("GetPredictedDailyProduction_%s", resource_type)
		
			local producer_def = {
				resource_produced = resource_type,
				max_storage = self["max_storage"..i],
				production_per_day = self["production_per_day"..i],
				stockpile_class = self["stockpile_class"..i],
				stockpile_spots = self["stockpile_spots"..i],
				additional_stockpile_params = self["additional_stockpile_params"..i],
				parent = self,
				
				Produce                     = SafeGetMember(self, Produce_method_name,                     nil),
				OnProduce                   = SafeGetMember(self, OnProduce_method_name,                   nil),
				OnCalcProduction            = SafeGetMember(self, OnCalcProduction_method_name,            nil),
				GetPredictedProduction      = SafeGetMember(self, GetPredictedProduction_method_name,      nil),
				GetPredictedDailyProduction = SafeGetMember(self, GetPredictedDailyProduction_method_name, nil),
			}
			
			local producer_obj = SingleResourceProducer:new(producer_def)
			
			if resource_type == "WasteRock" then
				self.wasterock_producer = producer_obj
				self.wasterock_max_storage = self["max_storage"..i]
			else
				table.insert(self.producers, producer_obj)
				self.producers[producer_obj.resource_produced] = producer_obj
				
				self.max_storage = self.max_storage + producer_obj.max_storage
				self.production_per_day = self.production_per_day + producer_obj.production_per_day
			end
			producer_obj:OnSetWorking(self.working)
			return true
		else
			printf("<red>Creating resource producer for non-existing resource '%s'</color>", resource_type)
		end
	end
	return false
end

function ResourceProducer:GameInit()
	self:AddProducers()
end

function ResourceProducer:OnDestroyed()
	self:ReleaseStockpiles()
end

function ResourceProducer:AddProducers()
	self.production_per_day = nil
	self.max_storage = nil
	self.producers = {}
	local last_res = true
	for i=1,max_resources_produced do
		local res = self:AddProducer(i)
		assert(last_res == res or not res, "Skipping resource producer indexes will lead to it not working.")
		last_res = res
	end
	
	self.city:AddToLabel("ResourceProducer", self)
end

function ResourceProducer:ReleaseStockpiles()
	if self.wasterock_producer then
		self.wasterock_producer:ReleaseStockpiles()
		self.wasterock_producer = false
	end
	for i=1,#(self.producers or "") do
		self.producers[i]:ReleaseStockpiles()
	end
	self.producers = nil
end

function ResourceProducer:Done()
	self.city:RemoveFromLabel("ResourceProducer", self)
	self:ReleaseStockpiles()
end

function ResourceProducer:OnModifiableValueChanged(prop, old_value, new_value)
	if string.starts_with(prop, "production_per_day") then
		--extract the digit at the end as an int
		--"production_per_day" is 18 characters long
		--'0' is #48 in the ASCII table
		local idx = string.byte(prop, 19) - 48
		local producer = self.producers[idx]
		if producer then
			producer:SetBase("production_per_day", new_value)
		end
	end
end

function ResourceProducer:CallForEachProducer(method, ...)
	for i,producer in ipairs(self.producers) do
		producer[method](producer, ...)
	end
end

function ResourceProducer:SumOfAllProducers(method, ...)
	local sum = 0
	for i,producer in ipairs(self.producers) do
		local getter = producer[method]
		if type(getter) == "function" then
			sum = sum + producer[method](producer, ...)
		else
			sum = sum + getter
		end
	end
	return sum
end

function ResourceProducer:BuildingDailyUpdate(day)
	self:CallForEachProducer("BuildingDailyUpdate", day)
	if self.wasterock_producer then
		self.wasterock_producer:BuildingDailyUpdate(day)
	end
end

function ResourceProducer:BuildingUpdate(dt, day, hour)
	if not self.manual_resource_production then
		self:CallForEachProducer("BuildingUpdate", dt, day, hour)
	end
end

function ResourceProducer:RunProduction()
	self:CallForEachProducer("RunProduction")
end

function ResourceProducer:OnSetWorking(working)
	self:CallForEachProducer("OnSetWorking", working)
	if self.wasterock_producer then
		self.wasterock_producer:OnSetWorking(working)
	end
end

function ResourceProducer:GetAmountStored()
	return self:SumOfAllProducers("GetAmountStored")
end

function ResourceProducer:IsStorageFull()
	--check status of each producer
	for i=1,#self.producers do
		if self.producers[i]:IsStorageFull() then
			return true
		end
	end
end

function ResourceProducer:GetWorkNotPossibleReason()
	if self.wasterock_producer and self.wasterock_producer:IsStorageFull() then
		return "WasteRock"
	end
	if self:IsStorageFull() then
		return "NoStorageSpace"
	end
	
	--check status of each producer
	for i=1,#self.producers do
		local reason = self.producers[i]:GetWorkNotPossibleReason()
		if reason then
			return reason
		end
	end
end

function ResourceProducer:CheatFill()
	self:CallForEachProducer("CheatFill")
end

function ResourceProducer:CheatEmpty()
	self:CallForEachProducer("CheatEmpty")
end

function ResourceProducer:GetResourceProduced(idx)
	local producer = self.producers[idx or 1]
	return producer and producer:GetResourceProduced()
end

function ResourceProducer:GetResourceProducedIcon(idx)
	local producer = self.producers[idx or 1]
	return producer
		and producer:GetResourceProducedIcon()
		or ("UI/Icons/Sections/" .. Resources["Metals"].name .. "_2.tga")
end

function ResourceProducer:GetProducerObj(resource)
	resource = resource or 1
	local producer = self.producers[resource]
	if producer then
		return producer
	end
	assert(false, string.format("No such producer: %s.%s", self.class, tostring(resource)))
end

function ResourceProducer:GetPredictedProduction(resource)
	if resource then
		local producer = self:GetProducerObj(resource)
		return producer and producer:GetPredictedProduction() or 0
	else
		return self:SumOfAllProducers("GetPredictedProduction")
	end
end

function ResourceProducer:GetPredictedDailyProduction(resource)
	if resource then
		local producer = self:GetProducerObj(resource)
		return producer and producer:GetPredictedDailyProduction() or 0
	else
		return self:SumOfAllProducers("GetPredictedDailyProduction")
	end
end

function ResourceProducer:GetYesterdayProduction(resource)
	if resource then
		local producer = self:GetProducerObj(resource)
		return producer and producer.yesterday_production or 0
	else
		return self:SumOfAllProducers("yesterday_production")
	end
end

function ResourceProducer:GetTodayProduction(resource)
	if resource then
		local producer = self:GetProducerObj(resource)
		return producer and producer.today_production or 0
	else
		return self:SumOfAllProducers("today_production")
	end
end

function ResourceProducer:GetLifetimeProduction(resource)
	if resource then
		local producer = self:GetProducerObj(resource)
		return producer and producer.lifetime_production or 0
	else
		return self:SumOfAllProducers("lifetime_production")
	end
end

function ResourceProducer:GetWasterockAmountStored()
	if self.wasterock_producer then
		return self.wasterock_producer:GetAmountStored()
	else
		return 0
	end
end

function CalcWasteRockAmount(amount_produced, resource, deposit_grade)
	return amount_produced * DepositGradeToWasteRockMultipliers[resource][deposit_grade] / const.ResourceScale
end

function PlaceWasteRockAround(obj, amount, pile)
	local placed = 0
	while amount > 0 do
		if not IsValid(pile) or pile:GetEmptyStorage() == 0 then
			pile = MapFindNearest(obj, obj, "hex", 4, "WasteRockStockpileBase", function(pile) return pile:GetEmptyStorage() > 0 and not pile:GetParent() end)
		end
		if not pile then
			local q, r = WorldToHex(obj)
			local p_shape = HexSurroundingsCheckShapeLarge
			local success
			success, q, r = TryFindStockpileDumpSpot(q, r, obj:GetAngle(), p_shape, HexGetAnyObj, true)
			if not success then
				break
			end
			pile = PlaceObject("WasteRockStockpileUngrided", {
				has_demand_request = true,
				apply_to_grids = true,
				has_platform = false,
				snap_to_grid = true,
				additional_demand_flags = const.rfSpecialDemandPairing,
			})
			pile:SetPos(point(HexToWorld(q, r)))
		end
		local added = Min(pile:GetEmptyStorage(), amount)
		pile:AddResourceAmount(added)
		placed = placed + added
		amount = amount - added
	end
	return placed, pile
end

function ResourceProducer:ProduceWasteRock(amount_produced, deposit_grade)
	if self.wasterock_producer then
		local wasterock_amount = CalcWasteRockAmount(amount_produced, self.exploitation_resource, deposit_grade)
		self.wasterock_producer:Produce(wasterock_amount)
		return self.wasterock_producer:IsStorageFull()
	end
	
	return false
end

function ResourceProducer:GetUISectionResourceProducerRollover()
	if not self:GetResourceProduced() then end
	local deposit_grade = self:HasMember("GetDepositGrade") and self:GetDepositGrade() or "Average"
	local t = {}
	for i,producer in ipairs(self.producers) do
		local resource = Resources[producer:GetResourceProduced()].name
		if self.consumption_resource_type and self.consumption_resource_type ~= "no_consumption" then
			local consumed_resource = Resources[self.consumption_resource_type].name
			if self.wasterock_producer then
				local wasterock_prod = DepositGradeToWasteRockMultipliers[resource][deposit_grade]
				t[#t + 1] = T{10366, "<em>Produces <resource(1000,resource)> and <resource(wasterock_prod, waste_rock)> from <resource(number,consumed_resource)></em>",
					resource = resource, consumed_resource = consumed_resource, number = self.consumption_amount, wasterock_prod = wasterock_prod, waste_rock = "WasteRock", self}
			else
				t[#t + 1] = T{10367, "<em>Produces <resource(1000,resource)> from <resource(number,consumed_resource)></em>",
					resource = resource, consumed_resource = consumed_resource, number = self.consumption_amount, self}
			end
		end
		t[#t + 1] = T{7619, "Daily production (predicted)<right><resource(PredictedDailyProduction,resource)>",
			resource = resource, PredictedDailyProduction = producer:GetPredictedDailyProduction(), producer}
		t[#t + 1] = T{476, "Lifetime production<right><resource(LifetimeProduction,resource)>",
			resource = resource, LifetimeProduction = producer.lifetime_production, producer}
	end
	
	t[#t + 1] = T(469, "<newline><center><em>Storage</em>")
	for i,producer in ipairs(self.producers) do
		local resource = Resources[producer:GetResourceProduced()].name
		t[#t + 1] = T{7620, "<resource(resource)><right><resource(GetAmountStored,max_storage,resource)>",
			resource = resource, GetAmountStored = producer:GetAmountStored(), max_storage = producer.max_storage, producer}
	end
	
	if self.wasterock_producer then
		local producer = self.wasterock_producer
		local resource = Resources[producer:GetResourceProduced()].name
		t[#t + 1] = T{7621, "<resource(resource)><right><resource(GetAmountStored,max_storage,resource)>",
			resource = resource, GetAmountStored = producer:GetAmountStored(), max_storage = producer.max_storage, producer}
	end
	
	return table.concat(t, "<newline><left>")
end

function ResourceProducer:GetStockpileDumpSpotTestInputPos(resource)
	assert(resource == "WasteRock")
	if self.wasterock_producer then
		local s = self.wasterock_producer.stockpiles[1]
		return s:GetPos()
	else
		return self:GetPos()
	end
end

function ResourceProducer:ExecuteAloneResourceOutputBlocked(resource, amount)
	assert(resource == "WasteRock") --diff resources will need diff logic, only this is impl.
	assert(IsKindOf(self, "TaskRequester"))
	local ret = false
	if resource == "WasteRock" then
		local producer = self.wasterock_producer
		assert(producer)
		local stocks = producer.stockpiles
		for i = 1, #stocks do
			local s = stocks[i]
			s.supply_request:ClearFlags(const.rfCanExecuteAlone)
		end
		local free_space = producer:GetFreeStockpileSpace()
		if free_space >= amount then
			producer:AddToStockpile(amount)
			ret = true
		end
		self.output_blocked = "WasteRock"
		self:InterruptDrones(nil, function(d)
			return d.s_request and d.s_request:GetResource() == resource
					and table.find(stocks, d.s_request:GetBuilding())
					and d
		end)
		return ret
	end
end

function ResourceProducer:ExecuteAloneResourceOutputUnblocked(resource)
	if resource == "WasteRock" then
		local producer = self.wasterock_producer
		assert(producer)
		local stocks = producer.stockpiles
		for i = 1, #stocks do
			local s = stocks[i]
			s.supply_request:AddFlags(const.rfCanExecuteAlone)
		end
		self.output_blocked = nil
	end
end
----

--Produces a single resource (inheriting ResourceProducer is recommended)
DefineClass.SingleResourceProducer = {
	__parents = { "Object", "StockpileController", "Modifiable" },
	
	properties = {
		{ template = true, category = "SingleResourceProducer", name = T(6731, "Maximum Storage"),    id = "max_storage",        editor = "number", default = 20000, min = 1, max = 9999999, scale = const.ResourceScale, help = "The amount of resource the building can store.",},
		{ template = true, category = "SingleResourceProducer", name = T(6732, "Production per Sol"), id = "production_per_day", editor = "number", default = 1000,  min = 1, max = 9999999, scale = const.ResourceScale, help = "Amount produced per Sol.", modifiable = true },
	},
	
	--mandatory parameters
	resource_produced = false, --the resource being produced here.
	stockpile_spots = false, --passed to the stockpile controller
	
	--optional parameters
	stockpile_class = "ResourceStockpile",
	additional_stockpile_params = {additional_supply_flags = const.rfPostInQueue,},
	
	--internals
	parent = false, --use this to access the actual game object that produces resources (see class ResourceProducer)
	
	lifetime_production = 0,
	today_production = 0, --as in from day reset till today, 
	yesterday_production = 0, --as in today_prd for yesterday.
	
	last_production_calc_t_delta = 0,
	last_production_start_ts = false,
}

function SingleResourceProducer:Init()
	self.stockpiled_resource = self.resource_produced or self.stockpiled_resource
	self.parent = self.parent or self
end

function SingleResourceProducer:Done()
	self:ReleaseStockpiles()
end

function SingleResourceProducer:UpdateTotalStockpile(amount, resource)
	local old_full = self.parent:IsStorageFull()
	if resource == "WasteRock" then
		old_full = self.total_stockpiled >= self.max_storage or old_full
	end
	StockpileController.UpdateTotalStockpile(self, amount, resource)
	local full = self.parent:IsStorageFull()
	if resource == "WasteRock" then
		full = self.total_stockpiled >= self.max_storage or full
	end
	if old_full ~= full then
		self.parent:AttachSign(full, "SignFullStorage")
	end
end

function SingleResourceProducer:ReleaseStockpiles()
	if self.parent.working and self.last_production_start_ts and not self.parent.manual_resource_production then --run last production run before we detach the stockpiles, this happens when deleted from editor.
		if self.last_production_start_ts ~= GameTime() then
			self:RunProduction()
		end
		self.last_production_start_ts = false
	end
	StockpileController.ReleaseStockpiles(self)
end

function SingleResourceProducer:GetResourceProduced()
	return self.resource_produced
end

function SingleResourceProducer:GetResourceProducedIcon()
	return "UI/Icons/Sections/" .. Resources[self.resource_produced or "Metals"].name .. "_2.tga"
end

function SingleResourceProducer:BuildingDailyUpdate(day)
	self.yesterday_production = self.today_production
	self.today_production = 0
end

function SingleResourceProducer:BuildingUpdate(dt, day, hour)
	if self.parent.working then
		local amount_produced = self:RunProduction()
		local deposit_grade = self.parent:HasMember("GetDepositGrade") and self.parent:GetDepositGrade() or "Average"
		self.parent:ProduceWasteRock(amount_produced, deposit_grade)
	end
end

function SingleResourceProducer:DroneUnloadResource(drone, request, resource, amount)
	if resource == self.resource_produced then
		if self.parent and self.parent ~= self then
			self.parent:DroneUnloadResource(drone, request, resource, amount)
		end
	end
end

function SingleResourceProducer:DroneLoadResource(drone, request, resource, amount)
	if resource == self.resource_produced then
		if self.parent and self.parent ~= self then
			self.parent:DroneLoadResource(drone, request, resource, amount)
			ObjModified(self)
		end
	end
end

function SingleResourceProducer:RunProduction()
	local res = self:Produce(self:CalcProduction())	
	if res>0 then ObjModified(self) end
	return res
end

function SingleResourceProducer:OnProduce(amount_to_produce) --use this to mod amount_to_produce during produce
	return amount_to_produce
end

GlobalVar("g_ResourceProducedTotal", {})

function SingleResourceProducer:AddToStockpile(amount)
	self:UpdateStockpileAmounts(self:GetAmountStored() + amount)
	assert(self:GetAmountStored() <= self.max_storage)
end

function SingleResourceProducer:GetFreeStockpileSpace()
	return self.max_storage - self:GetAmountStored()
end

function SingleResourceProducer:Produce(amount_to_produce) --produces amount_to_produce
	local stored = self:GetAmountStored()
	if stored + amount_to_produce > self.max_storage then
		amount_to_produce = self.max_storage - stored
	end
	
	if self.parent:DoesHaveConsumption() and self.resource_produced ~= "WasteRock" and self.parent.consumption_type == g_ConsumptionType.Production then
		amount_to_produce = self.parent:Consume_Production(amount_to_produce)
	end
	
	if self.parent:DoesHaveUpgradeConsumption() and self.resource_produced ~= "WasteRock" then
		local perc = self.last_production_calc_t_delta * 100 / const.DayDuration
		amount_to_produce = self.parent:Consume_Upgrades_Production(amount_to_produce, perc)
	end
	
	amount_to_produce = self:OnProduce(amount_to_produce)
	
	local res = self.stockpiled_resource
	g_ResourceProducedTotal[res] = (g_ResourceProducedTotal[res] or 0) + amount_to_produce
	
	self:UpdateStockpileAmounts(stored + amount_to_produce)
	self.lifetime_production = self.lifetime_production + amount_to_produce
	self.today_production = self.today_production + amount_to_produce
	
	if stored + amount_to_produce >= self.max_storage then
		self.parent:UpdateWorking(false)
		self.parent:AttachSign(true, "SignFullStorage")
	end
	
	assert(self:GetAmountStored() <= self.max_storage)
	
	return amount_to_produce
end

--Modifies the production amount during calculation in CalcProduction()
--Use this ot introduce Workplace 'performance' and things like that
function SingleResourceProducer:OnCalcProduction(amount_to_produce)
	return amount_to_produce
end

--Calculates how much resource we need to produce - see RunProduction()
--This depends on the time since the last production was triggered
function SingleResourceProducer:CalcProduction()
	if self.last_production_start_ts then
		local t = GameTime() - self.last_production_start_ts
		self.last_production_calc_t_delta = t
		local amount_to_produce = self:CalcProductionAmount(t)
		amount_to_produce = self:OnCalcProduction(amount_to_produce)
		
		self.last_production_start_ts = GameTime()
		
		return amount_to_produce
	end
	
	return 0 --not producing currently
end

function SingleResourceProducer:CalcProductionAmount(t)
	return MulDivRound(self.production_per_day, t, const.DayDuration)
end

function SingleResourceProducer:OnSetWorking(working) --call me
	if working then
		self.last_production_start_ts = GameTime()
	else
		if self.last_production_start_ts then
			if self.last_production_start_ts ~= GameTime() then
				self:RunProduction()
			end
			self.last_production_start_ts = false
		end
	end
end

function SingleResourceProducer:GetAmountStored() return self:GetStoredAmount() end
function SingleResourceProducer:IsStorageFull() return self.max_storage > 0 and self:GetAmountStored() >= self.max_storage end
function SingleResourceProducer:GetWorkNotPossibleReason()
	if self:IsStorageFull() then
		return "storage"
	end
end

function SingleResourceProducer:CheatFill()
	local amount_to_fill = self.max_storage - self:GetAmountStored()
	self.today_production = self.today_production + amount_to_fill
	self.lifetime_production = self.lifetime_production + amount_to_fill
	self:UpdateStockpileAmounts(self.max_storage) 
end
function SingleResourceProducer:CheatEmpty() self:UpdateStockpileAmounts(0) end

--Predicts the amount of resource that would be produced in an hour
function SingleResourceProducer:GetPredictedProduction()
	if self.parent.working then
		local amount_produced = self.production_per_day/const.HoursPerDay
		if self.parent:HasMember("performance") then
			amount_produced = MulDivRound(amount_produced, self.parent.performance, 100)
		end
		return amount_produced
	end
	
	return 0
end

--Predicts the amount of resource that would be produced in a day
function SingleResourceProducer:GetPredictedDailyProduction()
	if IsKindOf(self.parent, "Workplace") then
		local total = 0
		local durations = const.DefaultWorkshiftDurations
		for i = 1, #durations do
			total = total + self.parent:ModifyValue(self.parent:GetWorkshiftPerformance(i), "performance") * durations[i] * self.production_per_day
		end
		
		return total / (100 * const.HoursPerDay)
	elseif IsKindOf(self.parent, "ShiftsBuilding") then
		local total_production = 0
		local closed_shifts = self.parent.closed_shifts or empty_table
		for i = 1, self.parent.max_shifts do
			if not closed_shifts[i] then
				local hours_per_shift = const.DefaultWorkshiftDurations[i]
				total_production = total_production + MulDivRound(self.production_per_day, hours_per_shift, const.HoursPerDay)
			end
		end
		
		return total_production
	end
	
	return self.production_per_day
end

----

local function GatherSpotsFromStockpiles(stockpiles, resource)
	local stockpile_spots = { }
	for i,stockpile in ipairs(stockpiles) do
		if stockpile.resource == resource then
			local spot_idx = stockpile:GetAttachSpot()
			local parent = stockpile:GetParent()
			if parent then
				table.insert_unique(stockpile_spots, parent:GetSpotName(spot_idx))
			end
		end
	end
	return stockpile_spots
end
