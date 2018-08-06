DefineClass.Farm = {
	__parents = { "ResourceProducer", "ElectricityConsumer", "LifeSupportConsumer" ,"Workplace", "InteriorAmbientLife" }, --"AirProducer" },
	
	properties = {
		--{ template = true, category = "Mine", name = T{"Drone Slots"},     id = "drone_slots", editor = "number", default = 10, min = 1, max = 900, help = "Maximum number of drones that can work @ this mine.",},
		{ template = true, category = "Farm", name = T{655, "Hydroponic"}, id = "hydroponic", editor = "bool", default = false, min = 1, max = 9999999, scale = const.ResourceScale },
		{ template = true, id = "water_consumption", name = T{656, "Water consumption"},  category = "Consumption", editor = "number", default = 0, scale = const.ResourceScale, read_only = true, modifiable = true, min = 0, },
		{ template = true, id = "air_consumption",   name = T{657, "Oxygen Consumption"}, category = "Consumption", editor = "number", default = 0, scale = const.ResourceScale, read_only = true, modifiable = true, min = 0, },
		
		{ template = true, id = "soil_demand_mod", name = T{658, "Soil Demand Modifier"}, category = "Farm", editor = "number", default = 100, read_only = true, modifiable = true },
		{ template = true, id = "oxygen_production_efficiency", name = T{659, "Oxygen Production Efficiency"}, category = "Farm", editor = "number", default = 100, read_only = true, modifiable = true },
		
		--ui related
		--{ template = true, id = "ui_stored", editor = "text", name = T{""}, translate = true, no_edit = true, default = T{""}, dont_save = true},
		{ template = true,id = "persist_crops",    name = T{660, "Persisted crops"},  no_edit = true, editor = "text", default = ""},
	},
	
	last_serviced_time = 0, --(TODO: is still needed?) moment the farm was last serviced by a working drone, or turned on
	
	selected_crop = false,
	current_crop = false,
	
	building_update_time = const.HourDuration,
	harvest_planted_time = false,
	crop_first_growth = true,
	expected_output = 0,
	mod_quality = 100,	-- calculated when a new crop is planted
	soil_quality = 50 * const.SoilQualityScale, -- for non-hydroponic farms only, internal use, greater precision
	soil_regen = 10, -- per building update tick
	soil_regen_max = 90, -- maximum rating achievable by regen, scale 100
	
	interior = {"HydroponicFarmElevator"},
	spots = {"Terminal"},
	anims = {{anim = "terminal",all = true}},
	
	crops_available = false,
	crop_production = 0,
	crop_ticks = 0,
	crop_effects = false,
	
	ui_current_crop_resource_type = "Food", --for ui to know what icon to show
	ui_current_crop_resource_type_display_name = T{1022, "Food"},
	--
	farm_id = false,
	manual_resource_production = true,
	resource_produced1 = "Food",
	stockpile_spots1 = {"Resourcepile1", "Resourcepile2", "Resourcepile3", "Resourcepile4", "Resourcepile5", "Resourcepile6"}, 
	additional_stockpile_params1 = {
		has_demand_request = false, 
		has_supply_request = true,
		max_x  = 5,
		max_y  = 2,
	},
	amount_stored = 0,
}

GlobalVar("g_FarmId", 0)

function Farm:Init()
	self.selected_crop = {}
	self.current_crop = 1
	self.crops_available = {}
	
	ForEachPreset(CropPreset, function(crop, group, self)
		if self.class == crop.FarmClass then
			self.crops_available[#self.crops_available + 1] = crop.id
		end
	end, self)
	assert(#self.crops_available > 0, "can't find any crops for building " .. self.class)
	
	g_FarmId = g_FarmId + 1
	self.farm_id = "Farm" .. g_FarmId
	self.max_z = self.max_storage1/(10*const.ResourceScale)
end

function Farm:GameInit()
	self.city:AddToLabel("BaseFarm", self)
	
	local default_crop
	for i, crop_id in ipairs(self.crops_available) do
		if IsCropAvailable(crop_id) then
			default_crop = crop_id
			break
		end
	end
	assert(default_crop, "can't find an unlocked crop to assign as default for buliding " .. self.class)
	if default_crop then
		self.selected_crop[1] = default_crop
		self:PlantNextCrop()
	end

	self:InitPersistCrops()
end

function Farm:Done()
	self.city:RemoveFromLabel("BaseFarm", self)
end

function Farm:CreateLifeSupportElements()
	self.water = NewSupplyGridConsumer(self) -- do not set consumption yet, it depends on the crop selected
end

function Farm:OnSetWorking(working)
	ElectricityConsumer.OnSetWorking(self, working)
	
	if working then
		if not self.harvest_planted_time then
			-- plant the next crop in queue, if any
			self:PlantNextCrop()
		end
	end
	self:ApplyOxygenProductionMod(self.working and self.selected_crop[self.current_crop])
end

function Farm:UpdateAttachedSigns()
	self:AttachSign(not self:ShouldHideNoWorkersSign() and not self:HasWorkforce(), "SignNoWorkers")
	ElectricityConsumer.UpdateAttachedSigns(self)
	LifeSupportConsumer.UpdateAttachedSigns(self)
end

function Farm:GetGrowthTimes(crop_idx)
	local crop = self.selected_crop[self.current_crop]
	if crop_idx then
		crop = self.selected_crop[crop_idx]
	end	
	local is_current = not crop_idx 
	crop = crop and CropPresets[crop]
	if not crop or not self.harvest_planted_time then
		return 0, 0
	end
	
	local grown = is_current and self.harvest_planted_time and (GameTime() - self.harvest_planted_time) or 0
	local duration
	if is_current then
		duration = self.crop_first_growth and crop.InitialGrowthTime or crop.GrowthTime
	else
		local prev, prev_crop = self:GetPrevCrop(crop_idx or self.current_crop)	
		local crop_first_growth = not prev or prev_crop~=crop.id
		duration = crop_first_growth and crop.InitialGrowthTime or crop.GrowthTime
	end
	
	return Min(grown, duration), duration
end

--for rollovers in crop selector/ unplanted crops
function Farm:GetGrowthDuration(crop_idx, crop)
	crop = CropPresets[crop]
	if not crop then return 0 end 
	local prev, prev_crop = self:GetPrevCrop(crop_idx or self.current_crop)	
	local crop_first_growth = not prev or prev_crop~=crop.id
	return (crop_first_growth and crop.InitialGrowthTime or crop.GrowthTime)/const.DayDuration
end

function Farm:SetSoilQuality(value)
	if self.hydroponic then return end
	
	self.soil_quality = value
	value = (value / const.SoilQualityScale) - 50
	if value > 0 then
		self:SetModifier("performance", "soil", value, 0, T{661, "<green>Soil Quality +<amount></green>"})
	elseif value < 0 then
		self:SetModifier("performance", "soil", value, 0, T{8654, "<red>Soil Quality <amount></red>"})
	end
end

function Farm:GetCropEffects()
	if not self.crop_effects or not next(self.crop_effects) then
		return ""
	end
	
	local texts = {}		
	for i = 1, #self.crop_effects do
		local effect_id = self.crop_effects[i]
		local effect_text = FarmPerformanceEffects[effect_id]
		if effect_text then
			texts[#texts + 1] = effect_text 
		end
	end
	if next(texts) then
		table.insert(texts, 1, T{662, "<newline>Effects on current crop:"})
	end
	return table.concat(texts, "\n")
end

function Farm:LogCropEffects()
	local effects = self:GetPerformanceEffects()
	for i = 1, #effects do
		table.insert_unique(self.crop_effects, effects[i])
	end
	
	if not self.working then
		if not self:HasWorkersForCurrentShift() then
			table.insert_unique(self.crop_effects, "-workers")
		else
			if not self:HasPower() then
				table.insert_unique(self.crop_effects, "-power")
			end
			if not self:HasWater() then
				table.insert_unique(self.crop_effects, "-water")
			end
		end
	end
end

local function HexGetAnyButDomeInterior(q, r)
	return HexGridGetObject(ObjectGrid, q, r, nil, "DomeInterior")
end

function Farm:SwitchProducerType(resource_type)
	local producer = self.producers[1]
	
	--find dump pos
	local qq, rr = WorldToHex(self)
	local res, q, r = TryFindStockpileDumpSpot(qq, rr, self:GetAngle() + 90 * 60, GetEntityPeripheralHexShape(self:GetEntity()), HexGetAnyButDomeInterior)
	local pos = point(HexToWorld(q, r))
	if not res or not terrain.IsPassable(pos) then 
		--nowhere to dump. stocks are not in the def filters, so unpassable == too many stockpiles around.
		if Platform.developer then
			print("<yellow>No suitable stockpile location found around farm to dump current resources to, new production lost.</yellow>")
		end
		return
	end
	
	--dump @ pos
	PlaceResourceStockpile_Delayed(pos, producer.resource_produced, self.amount_stored, self:GetAngle() + 90 * 60, true)
	
	--destroy current stocks
	SuspendPassEdits("FarmChangingResourceType")
	for _, stock in ipairs(producer.stockpiles) do
		DoneObject(stock)
	end
	
	--zero the counters
	self.amount_stored = 0
	producer.total_stockpiled = 0
	
	--change resource
	self.producers[producer.resource_produced] = nil
	self.producers[resource_type] = producer
	producer.resource_produced = resource_type
	producer.stockpiled_resource = resource_type
	self.ui_current_crop_resource_type = resource_type
	self.ui_current_crop_resource_type_display_name = Resources[resource_type].display_name
	producer.next_stockpile_idx = 1
	
	--create new stocks
	producer:CreateStockpiles()

	ResumePassEdits("FarmChangingResourceType")
	return producer
end

function Farm:BuildingUpdate(dt, day, hour)
	local crop = self.selected_crop[self.current_crop]
	crop = crop and CropPresets[crop]
	
	if crop then		
		self:LogCropEffects()
		if self.working then			
			self.crop_production = self.crop_production + self.performance
		end
		self.crop_ticks = self.crop_ticks + 1
	
		local grown, duration = self:GetGrowthTimes()

		self.expected_output = self:CalcExpectedProduction()

		if self.expected_output == 0 then
			-- fail the crop immediately and start a new one
			if self.working then
				AddOnScreenNotification("CropsFailed", nil, {}, {self})
				self:PlantNextCrop()
			end
		elseif grown >= duration then
			self:SetBase("water_consumption", 0)
			self:UpdateWorking()
			if self.working then
				-- score the current harvest and start the next crop
				local producer
				if not self.producers[crop.ResourceType] then
					producer = self:SwitchProducerType(crop.ResourceType)
				else
					producer = self:GetProducerObj(crop.ResourceType)
				end

				if producer then
					producer:Produce(self.expected_output)
				end
				
				if crop.OnProduce then
					crop.OnProduce(self.parent_dome, self, self.expected_output)
				end
				
				if not self.hydroponic then
					-- update soil quality				
					local soil = Clamp(self.soil_quality + crop.SoilEffect*const.SoilQualityScale, crop.SoilQualityMin*const.SoilQualityScale, crop.SoilQualityMax*const.SoilQualityScale)
					self:SetSoilQuality(soil)
				end
				self:PlantNextCrop()
			end
		end
	else
		-- regain soil quality when growing nothing
		self:SetSoilQuality(Min(self.soil_regen_max*const.SoilQualityScale, self.soil_quality + self.soil_regen))
	end
	self:UpdateVisualsFarm(self:GetCurrentCrop())
end

function Farm:CreateCropAttaches()
	local crop = self:GetCurrentCrop()
	local ent = crop.CropEntity

	if not self.hydroponic then
		local cls = IsValidEntity(ent) and ent or "CropTomato"
		local obj = PlaceObject(cls)
		self:Attach(obj)
		PlayFX("PlantsGrowing", "idle", self, obj)
	else
		local cls = IsValidEntity(ent) and ent or "CropCucumber"
		local first, last = self:GetSpotRange("Crop")
		for i = first, last do
			local obj = PlaceObject(cls)
			self:Attach(obj, i)
			PlayFX("PlantsGrowing", "idle", self, obj)
		end
	end
end

function Farm:GetCurrentCrop()
	local crop = self.selected_crop[self.current_crop]
	crop = crop and CropPresets[crop]
	return crop
end

function Farm:UpdateVisualsFarm(prev)
	-- visuals
	local crop = self:GetCurrentCrop()

	if not crop or crop ~= prev then
		while true do
			local obj = self:GetAttach("CropEntityClass")
			if not obj then
				break
			end
			PlayFX("PlantsGrowing", "end", self, obj)
			obj:Detach()
			DoneObject(obj)
		end
	end
	if not crop then
		return
	end

	if not self:GetAttach("CropEntityClass") then
		if not self.working then
			return
		end
		self:CreateCropAttaches()
	end

	local sequences = CropGrowthSequences[crop.id] or CropGrowthSequences.__fallback
	local sequence = self.crop_first_growth and sequences.initial or sequences.repeating

	local grown, duration = self:GetGrowthTimes()
	local state = sequence[1]
	if grown == 0 and duration == 0 then
		state = sequence[1]
	else
		for i = 2, #sequence do
			local percent = MulDivRound((i-1), 100, #sequence)
			if grown * 100 / duration > percent then
				state = sequence[i]
			end
		end
	end
	local state_idx = GetStateIdx(state)

	local crop_attaches = self:GetAttaches("CropEntityClass")

	for i = 1, #crop_attaches do
		local visual = crop_attaches[i]
		if visual:GetState() ~= state_idx and HasState(visual, state) then
			visual:SetState(state)
			if state == sequence[1] then
				PlayFX("PlantsGrowing", "end", self, visual)
			end
			PlayFX("PlantsGrowing", state, self, visual)
		end
	end
end

function Farm:CalcExpectedProduction(idx)
	idx = idx or self.current_crop
	local crop = self.selected_crop[idx]
	crop = crop and CropPresets[crop]
	if not crop then
		return 0
	end
	
	local grown, duration = self:GetGrowthTimes()
	local total_ticks = duration / self.building_update_time
	local est_production = self.crop_production + Max(0, total_ticks - self.crop_ticks) * 100
	local max_production = total_ticks * 100
	
	if max_production <= 0 or est_production < MulDivRound(max_production, g_Consts.CropFailThreshold, 100) then
		return 0
	end
	
	local amount = MulDivRound(crop.FoodOutput, est_production, max_production)
	amount = self:ModifyValue(amount, "production_per_day1")
		
	return amount
end

function Farm.Produce_Food(producer, amount_produced)
	amount_produced = SingleResourceProducer.Produce(producer, amount_produced)
	local farm = producer.parent
	farm.amount_stored = Clamp(farm.amount_stored + amount_produced, 0, producer.max_storage)
	assert(farm.amount_stored >= 0 and producer.total_stockpiled == farm.amount_stored)
	if producer.resource_produced == "Food" then
		Msg("FoodProduced", farm, amount_produced)
	end
end

function Farm:DroneLoadResource(drone, request, resource, amount)
	--drone picked stuff up from any of our stockpiles, update stuffs.
	if self.destroyed then return end
	local p = self.producers[1]
	if resource == p.resource_produced then
		self.amount_stored = self.amount_stored - amount
		assert(self.amount_stored >= 0 and p.total_stockpiled == self.amount_stored)
	end
end

function Farm:CanGrow(crop)
	if self.hydroponic then
		return true
	end
	
	local cropdef = CropPresets[crop]
	if cropdef then
		local demand_qty = MulDivRound(cropdef.SoilDemand, self.soil_demand_mod, 100)
		return self.soil_quality / const.SoilQualityScale >= demand_qty
	end
end

function Farm:GetPrevCrop(crop_idx)
	local crop,prev
	local idx = crop_idx
	for i = 1, 3 do		
		idx = idx - 1
		if idx<1 then idx = 3 end
		local crop = self.selected_crop[idx]
		if crop and not self:CanGrow(crop) then
			crop = false
		end
		if crop then
			return idx, crop
		end
	end	
	return false
end	
	
function Farm:ApplyCropModifier(cropdef, op)
	local target, prop = cropdef.modify_target, cropdef.modify_property
	local amount, percent = 0, 0
	
	if op == "add" then
		amount, percent = cropdef.modify_amount, cropdef.modify_percent
	end
	
	if target == "dome" then
		self.parent_dome:SetModifier(prop, self, amount, percent)
	elseif target == "farm" then
		self:SetModifier(prop, self, amount, percent)
	elseif target == "dome buildings" then
		local mod_tbl = { id = self, prop = prop, amount = amount, percent = percent }
		self.parent_dome:SetLabelModifier("Buildings", self, (op == "add") and mod_tbl or nil)
	elseif target == "dome colonists" then
		local mod_tbl = { id = self, prop = prop, amount = amount, percent = percent }
		self.parent_dome:SetLabelModifier("Colonist", self, (op == "add") and mod_tbl or nil)
	else
		printf("invalid modifier target '%s' specified for crop %s", cropdef.modify_target, cropdef.id)
	end	
end
	
function Farm:PlantNextCrop(forced, prev)
	local crop 
	local last = self.selected_crop[self.current_crop]
	prev = prev or last
	if self.working then
		if not forced then
			for i = 1, 3 do
				if not crop then
					self.current_crop = self.current_crop + 1
					if self.current_crop > 3 then
						self.current_crop = 1
					end
					crop = self.selected_crop[self.current_crop]
					if crop and not self:CanGrow(crop) then
						crop = false
					end
				end
			end	
		else	
			crop = self:CanGrow(last) and last
		end
	end
	
	
	self.crop_production = 0
	self.crop_ticks = 0	
	self.crop_effects = {} -- list of simplified modifier texts

	local cropdef_prev = prev and CropPresets[prev]
	if cropdef_prev then
		-- disable modifier from cropdef_pref, if any
		if cropdef_prev.modify_target ~= "" and cropdef_prev.modify_property ~= "" then
			self:ApplyCropModifier(cropdef_prev, "remove")
		end
	end
	
	if not crop then
		self.expected_output = 0
		self:SetBase("water_consumption", 0)
		self.harvest_planted_time = false
	else	
		local cropdef = CropPresets[crop]
		if cropdef then
			self.harvest_planted_time = GameTime()
			self.crop_first_growth = forced or crop ~= last		
			
			self:SetBase("water_consumption", cropdef.WaterDemand)
			
			self.expected_output = self:CalcExpectedProduction()
			
			-- apply custom modifier form cropdef (if any)
			if cropdef.modify_target ~= "" and cropdef.modify_property ~= "" then
				self:ApplyCropModifier(cropdef, "add")
			end
		end
	end
	
	self:ApplyOxygenProductionMod(self.harvest_planted_time and crop)
	self:UpdateVisualsFarm(prev)
end

function Farm:ApplyOxygenProductionMod(crop)
	if not self.parent_dome then return end
	local cropdef = crop and CropPresets[crop]
	if cropdef then
		local amount = MulDivRound(cropdef.OxygenProduction, self.oxygen_production_efficiency, 100)
		self.parent_dome:SetModifier("air_consumption", self.farm_id, -amount, 0, T{663, "<amount> from <crop_name>", crop_name = cropdef.DisplayName})
	else
		self.parent_dome:SetModifier("air_consumption", self.farm_id, 0, 0)		
	end
	self.parent_dome:UpdateWorking()
end

function Farm:OnModifiableValueChanged(prop)
	if prop == "oxygen_production_efficiency" then
		self:ApplyOxygenProductionMod(self.selected_crop[self.current_crop])
	end	
end
-- overwitten functions from servic (to service colonists Food need)
function Farm:HasFreeVisitSlots() return true end
function Farm:Unassign(unit)end
function Farm:CanService(unit)
	local eat_per_visit = g_Consts.eat_food_per_visit
	if unit.traits.Glutton then
		eat_per_visit = 2 * eat_per_visit
	end
	return self.amount_stored >= eat_per_visit
end

function Farm:Service(unit, duration)
	local amount_to_eat = unit:Eat(self.amount_stored)
	self.amount_stored = self.amount_stored - amount_to_eat
	local producer = self:GetProducerObj("Food")
	if producer then
		producer:UpdateStockpileAmounts(self.amount_stored)
	end

	assert(self.amount_stored >= 0 and producer and producer.total_stockpiled == self.amount_stored)

	self.city:OnConsumptionResourceConsumed("Food", amount_to_eat)
end

function Farm:SetCrop(idx, crop, broadcast)
	if broadcast then
		BroadcastAction(self, function(farm)
			if farm.selected_crop[idx] ~= crop then -- don't replant the same crop to avoid wasting production
				farm:SetCrop(idx, crop)
			end
		end)
		return
	end
	
	local prev = self.selected_crop[idx]
	self.selected_crop[idx] = crop
	self:UpdateWorking()
	if idx == self.current_crop then
		if crop then
			self:PlantNextCrop(true, prev)
		else
			self:PlantNextCrop()
		end
	end
	RebuildInfopanel(self)
end

function Farm:GetWorkNotPossibleReason()
	local can_grow = false
	for i = 1, #(self.selected_crop or "") do
		if self.selected_crop[i] and self:CanGrow(self.selected_crop[i]) then
			can_grow = true
			break
		end
	end
	return (not can_grow and "NoCrop")
			or ElectricityConsumer.GetWorkNotPossibleReason(self)
			or LifeSupportConsumer.GetWorkNotPossibleReason(self) 
			or Workplace.GetWorkNotPossibleReason(self) 
			or ResourceProducer.GetWorkNotPossibleReason(self)
end

function Farm:GetCropName(idx)
	local crop = self.selected_crop[idx]
	return crop and CropPresets[crop] and CropPresets[crop].DisplayName or T{6761, "None"}
end

function Farm:GetCrop(idx)
	local crop = self.selected_crop[idx]
	 return crop and CropPresets[crop] or false
end

function Farm:GetNextCrop()
	local next_idx = self.current_crop + 1
	for i = 1, 3 do
		if next_idx>3 then
			next_idx = 1
		end
		local crop = self.selected_crop[next_idx] 
		if crop then
			return  CropPresets[crop] and CropPresets[crop].DisplayName
		end
	end
	return T{6762, "None"}
end

function Farm:GetGrowthProgress()-- for current crop,0 for others
	local grown, duration = self:GetGrowthTimes()	
	if duration==0 then 
		return 0 
	end
	return MulDivRound(grown, 100, duration)
end

function Farm:GetHarvestRemaining()-- for current crop,0 for others
	local grown, duration = self:GetGrowthTimes()	
	if duration==0 then 
		return 0 
	end
	return (duration - grown) / const.DayDuration
end

function Farm:GetHarvestTotal(crop_idx)
	local grown, duration = self:GetGrowthTimes(crop_idx)
	if duration==0 then
		return 0
	end
	return duration / const.DayDuration
end

function Farm:GetCropWaterDemand(crop_idx, crop)
	crop_idx = crop_idx or self.current_crop
	crop = crop or self.selected_crop[crop_idx]
	local ret = crop and CropPresets[crop] and CropPresets[crop].WaterDemand or 0
	
	return self:ModifyValue(ret, "water_consumption")
end

function Farm:InitPersistCrops()
	local crops = self.persist_crops
	if not crops then return end
	local idx = 1
	for crop in string.gmatch(crops, "([%w(%s)]*),") do
		if crop=="false" or crop=="nil" then
			self:SetCrop(idx,false)
		else
			self:SetCrop(idx,crop)
		end
		idx = idx + 1
	end
end

function Farm:GetUISoilQuality()
	return self.soil_quality / const.SoilQualityScale
end

function OnMsg.SaveMap()
	local exec = function (farm)
		local persist_crops = ""
		for j=1, 3 do
			persist_crops = persist_crops..tostring(farm.selected_crop[j])..","
		end
		farm.persist_crops = persist_crops
	end
	MapForEach("map", "Farm", exec)
end


DefineClass.FarmConventional = {
	__parents = { "Farm" },
	
	anim_thread = false,
	is_up = false,
}

function FarmConventional:GameInit()
	self:StartAnimThread()
end

function FarmConventional:Done()
	if IsValidThread(self.anim_thread) then
		DeleteThread(self.anim_thread)
	end
end

function FarmConventional:OnSetWorking(working)
	Farm.OnSetWorking(self, working)
	
	if IsValidThread(self.anim_thread) then
		Wakeup(self.anim_thread)
	end
end

function FarmConventional:StartAnimThread()
	local sprinkler = self:GetAttach("FarmSprinkler")
	if not sprinkler then
		return
	end
	
	self.anim_thread = CreateGameTimeThread(function()
		while IsValid(self) and not self.destroyed do
			local working = self.working
			if working and not self.is_up then
				sprinkler:SetAnim(1, "workingStart")
				Sleep(sprinkler:TimeToAnimEnd())
				PlayFX("FarmWater", "start", sprinkler)
				self.is_up = true
			elseif not working and self.is_up then
				PlayFX("FarmWater", "end", sprinkler)
				sprinkler:SetAnim(1, "workingEnd")
				Sleep(sprinkler:TimeToAnimEnd())
				self.is_up = false
			end
			
			-- if working state changed start over, otherwise set appropritate idle state, fire fx and wait
			if working == self.working then
				sprinkler:SetAnim(1, working and "workingIdle" or "idle")
				WaitWakeup()
			end
		end
	end)
end

function SavegameFixups.FarmSprinkerFix(metadata, lua_revision)
	local exec = function (farm)
		if IsValidThread(farm.anim_thread) then
			DeleteThread(farm.anim_thread)
		end
		
		local sprinkler = farm:GetAttach("FarmSprinkler")
		if sprinkler then
			sprinkler:DestroyAttaches()
		end
		
		farm:StartAnimThread()
	end
	MapForEach("map","FarmConventional", exec )
end

DefineClass.FarmHydroponic = {
	__parents =  { "Farm" },
	
	stockpile_spots1 = { "Resourcepile1", "Resourcepile2" }
}

--this is a base building func that controls working states automatically,
--since farm controls its anim manually it should prevent base building from touching the anim.
function FarmHydroponic:ChangeWorkingStateAnim(working)
	local fx_target = nil
	if self.force_fx_work_target then
		fx_target = self.force_fx_work_target
	end
	PlayFX("Working", working and "start" or "end", self, fx_target ~= self and fx_target or nil)
end

function FarmHydroponic:StartAnimThread()
end

DefineClass.HydroponicFarmElevator = {
	__parents = { "BuildingEntityClass", },
}

function UICropUpdate(self, farm, index)
	local crop = farm:GetCrop(index)
	local active = crop and farm.current_crop == index
	self.idActive:SetVisible(active)
	local name = crop and crop.DisplayName
	self:SetTitle(active and "" or name or T{6763, "Select new crop"})
	self:SetRolloverTitle(crop and active and T{7603, "<name>  <percent(p)>", name = name, p = farm:GetGrowthProgress()} or "")
	self:SetIcon(crop and crop.icon or "UI/Icons/Buildings/crops_empty.tga")
	self.idIcon:SetColumns(2)
	self.idProgress:SetVisible(active)
	self.idCropProduction:SetVisible(crop)
	self.OnActivate = function (self, context)
		OpenInfopanelItems(farm, self, context.crop_index)
	end
	self.GetRolloverText = function(self)
		local farm = ResolvePropObj(self.context)
		local crop = farm:GetCrop(index)
		local texts = {}
		if crop then
			texts[#texts+1] = T{248, "Water consumption<right><water(number)>", number = farm:GetCropWaterDemand(index)}
			texts[#texts+1] = T{249, "Optimal harvest<right><resource(number, res)>", res = crop.ResourceType, number = crop.FoodOutput or 0}
			if crop.OxygenProduction > 0 then
				texts[#texts+1] = T{250, "Oxygen production<right><air(number)>", number = crop.OxygenProduction}
			end
			if crop.SoilEffect > 0 then
				texts[#texts+1] = T{251, "Soil quality increase<right><green><number>%</green>", number = crop.SoilEffect}
			elseif crop.SoilEffect < 0 then
				texts[#texts+1] = T{252, "Soil quality decrease<right><red><number>%</red>", number = - crop.SoilEffect}
			end
			texts[#texts+1] = T{253, "Growth time<right><HarvestTotal> Sols", HarvestTotal = farm:GetGrowthDuration(index, crop and crop.id)}
		else
			texts[#texts+1] = T{7349, "Crops have different harvest cycles, Water consumption, and Food yield."}
		end
		local remainingSols = index == farm.current_crop and farm:GetHarvestRemaining() or 0
		if index == farm.current_crop then
			if farm.working or remainingSols > 0 then
				texts[#texts+1] = T{254, "Time until next harvest<right><number> Sols", number = remainingSols}
			end
		end
		texts[#texts+1] = T{316, "<newline>"}
		if not farm.working then
			if remainingSols > 0 then
				texts[#texts+1] = T{255, "<em>The farm is not working. The crops are decaying</em>"} 
			else
				texts[#texts+1] = T{256, "<em>The farm is not working. New crops won't be planted</em>"}
			end
		end
		if crop and index == farm.current_crop then
			table.append(texts, farm:GetCropEffects())
		end
		return table.concat(texts, "\n<left>")
	end
	if crop then
		local context = self.idCropProduction.context
		local production = active and farm:CalcExpectedProduction(index) or crop.FoodOutput
		context.prod = production / 1000
		context.frac = production / 100 % 10
		context.warn = farm.current_crop == index and (production == 0 and TLookupTag("<red>") or TLookupTag("<em>")) or ""
		context.icon = const.TagLookupTable["icon_" .. crop.ResourceType]
		ObjModified(context)
	end
end

function Farm:CheatFill()
	ResourceProducer.CheatFill(self)
	self.amount_stored = self.producers[1].max_storage
end