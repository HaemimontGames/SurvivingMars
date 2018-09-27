DefineClass.Mine = {
	__parents = { "ResourceProducer", "Building", "BuildingDepositExploiterComponent", "ElectricityConsumer" },

	last_serviced_time = 0, --(TODO: is still needed?) moment the mine was last serviced by a working drone, or turned on	
	building_update_time = const.HourDuration,
	exploitation_resource = false,
}

function Mine:IsIdle()
	return self.ui_working and not self:CanExploit() and not self.city:IsTechResearched("NanoRefinement")
end

function Mine:SetUIWorking(working)
	Building.SetUIWorking(self, working)
	BuildingDepositExploiterComponent.UpdateIdleExtractorNotification(self)
end

function Mine:DroneLoadResource(drone, request, resource, amount) --propagated from stockpile.
	if not self.working then --if we have stopped due to being full
		self:UpdateWorking()
	end
end

function Mine:OnChangeActiveDeposit()
	BuildingDepositExploiterComponent.OnChangeActiveDeposit(self)
	self:UpdateWorking()
end


function Mine:OnDepositDepleted(deposit)
	BuildingDepositExploiterComponent.OnDepositDepleted(self, deposit)
	if not self:CanExploit() and not self.city:IsTechResearched("NanoRefinement") then
		self:UpdateWorking(false)
	end
end

function Mine:GetHourPredictedProduction() -- per one hour
	if self.working then
		local deposit_multiplier = self:GetCurrentDepositQualityMultiplier()
		local amount_produced = MulDivRound(self.production_per_day1, deposit_multiplier, const.HoursPerDay*100)
		if self:HasMember("performance") then
			amount_produced = MulDivRound(amount_produced, self.performance, 100)
		end
		return amount_produced
	end
	
	return 0
end

function Mine:OnDepositsLoaded()
	self:UpdateConsumption()
	self:UpdateWorking()
end

function Mine:GatherConstructionStatuses(statuses)
	BuildingDepositExploiterComponent.GatherConstructionStatuses(self, statuses)
	if #self.nearby_deposits > 0 then
		local status = table.copy(ConstructionStatus.DepositInfo)
		local amount, grade
		for i = 1, #self.nearby_deposits do
			if self.nearby_deposits[i].resource == self.exploitation_resource then
				amount = (amount or 0) + self.nearby_deposits[i].amount
				grade = Max(grade or 1, table.find(DepositGradesTable, self.nearby_deposits[i].grade) or 1)
			end
		end
		grade = DepositGradesTable[grade] -- index to name
		grade = DepositGradeToDisplayName[grade] -- name to display name
		status.text = T{status.text, {resource = FormatResource(empty_table, amount, self.exploitation_resource), grade = grade, col = ConstructionStatusColors.info.color_tag}}
		statuses[#statuses + 1] = status
	end
end

function Mine:GetResourceProducedIcon(idx)
	return "UI/Icons/Sections/" .. Resources[self.exploitation_resource].name .. "_2.tga"
end

function Mine:GetUISectionMineRollover()
	local lines = {
		T{466, "Production per Sol (predicted)<right><resource(PredictedDailyProduction, GetResourceProduced)>", self},
		T{468, "Lifetime production<right><resource(LifetimeProduction,exploitation_resource)>", self},
	}
	AvailableDeposits(self, lines)
	lines[#lines + 1] = T{469, "<newline><center><em>Storage</em>"}
	lines[#lines + 1] = T{470, "<resource(exploitation_resource)><right><resource(GetAmountStored,max_storage,exploitation_resource)>", self}
	lines[#lines + 1] = T{471, "Waste Rock<right><wasterock(GetWasterockAmountStored,wasterock_max_storage)>", self}

	return table.concat(lines, "<newline><left>")
end

function Mine:CheatFill()
	ResourceProducer.CheatFill(self)
end

function Mine:CheatEmpty()
	ResourceProducer.CheatEmpty(self)
end

function OnMsg.GatherFXActors(list)
	list[#list + 1] = "Mine"
end

local reModeOrient = 0
local reModeExit = 1
local reModeMove = 2
local reModeReturn = 3
local reModeUnload = 4
local reModeDone = 5

GlobalVar("OldMineLocations", {})

DefineClass.RegolithExtractor = 
{
	__parents = {"Mine", "OutsideBuildingWithShifts", "DustGenerator", "TerrainDepositExtractor"},

	exploitation_resource = "Concrete",
	additional_stockpile_params2 = {
		apply_to_grids = false,
		has_platform = true,
		snap_to_grid = false,
		priority = 2,
		additional_supply_flags = const.rfSpecialDemandPairing
	},
	
	--construction
	force_extend_bb_during_placement_checks = 120 * guim,
	
	-- visualization
	anim_obj = false,
}

function RegolithExtractor:GameInit()
	local origin = self:GetPos()
	local angle = self:GetAngle()

	self.anim_obj = PlaceObject("RegolithMineVisual", {mine = self})
	self.anim_obj:SetPos(origin)
	self.anim_obj:SetAngle(angle)
	self.anim_obj:InitMineVisuals()
	
	for i = 1, #OldMineLocations do
		if origin:Equal2D(OldMineLocations[i].pos) and angle == OldMineLocations[i].angle then
			self.anim_obj.current_depth = OldMineLocations[i].depth
			table.remove(OldMineLocations, i)
			break
		end
	end
	
	if HintsEnabled then
		HintTrigger("HintSuggestDroneHub")
		HintTrigger("HintWaterProduction")
	end
end

function RegolithExtractor:SetPalette(palette)
	Building.SetPalette(self, palette)
	if self.anim_obj and self.anim_obj.ring then
		Building.SetPalette(self.anim_obj.ring, palette)
	end
end

function RegolithExtractor:Done()
	self:DeleteAnimObj()
end

function RegolithExtractor:OnDestroyed()
	Mine.OnDestroyed(self)
	local angle = IsValid(self.anim_obj) and (self.anim_obj.ring:GetVisualAngle() - self:GetAngle()) or 0
	self:DeleteAnimObj()
	-- attach a ring to fill the hole:
	local ring = PlaceObject("RegolithExtractorRing", nil, const.cfComponentAttach)
	ring:SetAttachAngle(angle)
	self:Attach(ring, self:GetSpotBeginIndex("Origin"))
end

function RegolithExtractor:SetUIWorking(work)
	OutsideBuildingWithShifts.SetUIWorking(self,work)
	Mine.SetUIWorking(self, work)
end

function RegolithExtractor:DeleteAnimObj()
	if self.anim_obj then
		table.insert(OldMineLocations, {
			pos = self:GetPos(),
			angle = self:GetAngle(),
			depth = self.anim_obj.current_depth,
		})
		DoneObject(self.anim_obj)
		self.anim_obj = false
	end
end

function RegolithExtractor.OnCalcProduction_Concrete(producer, amount_to_produce)
	if amount_to_produce > 0 then
		local deposit_multipler = producer.parent:GetCurrentDepositQualityMultiplier()
		amount_to_produce = MulDivRound(amount_to_produce, deposit_multipler, 100)
		if producer.parent:HasMember("performance") then
			amount_to_produce = MulDivRound(amount_to_produce, producer.parent.performance, 100)
		end
		return amount_to_produce
	end
	
	return 0
end

function RegolithExtractor.OnProduce_Concrete(producer, amount_to_produce)
	amount_to_produce = producer.parent:ExtractResource(amount_to_produce)
	return amount_to_produce
end

function RegolithExtractor.GetPredictedProduction_Concrete(producer)
	return producer.parent:GetHourPredictedProduction()
end

function RegolithExtractor.GetPredictedDailyProduction_Concrete(producer)
	local deposit_multiplier = producer.parent:GetCurrentDepositQualityMultiplier()
	return MulDivRound(SingleResourceProducer.GetPredictedDailyProduction(producer), deposit_multiplier, 100)
end

function RegolithExtractor:HasNearbyDeposits()
	return TerrainDepositExtractor.HasNearbyDeposits(self)
end 

function RegolithExtractor:GetExtractionShape()
	return GetEntityCombinedShape("QuarryClosedShape")
end

GlobalVar("RegolithExtractorExtendedExtractionShape", nil)

function RegolithExtractor:GetExtractionShapeExtended()
	if not RegolithExtractorExtendedExtractionShape then
		local extraction_shape = table.copy(self:GetExtractionShape())
		local peripheral_shape = GetPeripheralHexShape(extraction_shape)
		local one_hex_extended_shape = table.append(extraction_shape, peripheral_shape)
		peripheral_shape = GetPeripheralHexShape(one_hex_extended_shape)
		RegolithExtractorExtendedExtractionShape = table.append(one_hex_extended_shape, peripheral_shape)
	end
	return RegolithExtractorExtendedExtractionShape
end

function RegolithExtractor:GetFlattenShape()
	local flatten_shape = table.copy(self:GetShapePoints())
	local extractor_shape = self:GetExtractionShape()
	for i=1,#extractor_shape do
		table.remove_value(flatten_shape, extractor_shape[i])
	end
	return flatten_shape
end

local cache = false --holds a modified build grid shape -> shape - dig shape, which is passed as electricity conn shape.
function RegolithExtractor:GetSupplyGridConnectionShapePoints(supply_resource)
	if supply_resource == "electricity" then
		if not cache then
			cache = table.copy(self:GetShapePoints()) --copy or we are working with the building's actual build grid shape.
			local extr_shape = self:GetExtractionShape() --this is the interior part of the digging area
			for i = 1, #extr_shape do
				table.remove_entry(cache, extr_shape[i])
			end
			
			extr_shape = GetEntityOutlineShape("QuarryClosedShape") --this is the exterior part of the digging area, i did not c any difference between "Quarry" and "QuarryClosedShape" entities.
			for i = 1, #extr_shape do
				table.remove_entry(cache, extr_shape[i])
			end
		end
		
		return cache
	end
	
	return self:GetShapePoints(supply_resource)
end

function RegolithExtractor:GatherNearbyDeposits()
end

function RegolithExtractor:IsTechLocked()
end

function RegolithExtractor:CanExploit()
	return self:CheckDeposit()
end

function RegolithExtractor:OnDepositDepleted(deposit)
	Mine.OnDepositDepleted(self, deposit)
	TerrainDepositExtractor.OnDepositDepleted(self,deposit)
end

function RegolithExtractor:GetCurrentDepositQualityMultiplier(...)
	return TerrainDepositExtractor.GetCurrentDepositQualityMultiplier(self, ...)
end

function RegolithExtractor:ExtractResource(...)
	return TerrainDepositExtractor.ExtractResource(self, ...)
end

function RegolithExtractor:GatherConstructionStatuses(statuses)
	local construction_shape = self:GetExtractionShapeExtended()
	local concrete_markers = HexGetUnits(self, nil, nil, nil, nil, nil, "TerrainDepositConcrete", 4*const.GridSpacing, construction_shape)
	if #concrete_markers == 0 then
		statuses[#statuses + 1] = ConstructionStatus.ResourceRequired
	else
		local amount = self:GetAmount()
		local closest_deposit = self:FindClosestDeposit()
		local status = table.copy(ConstructionStatus.DepositInfo)
		status.text = T{status.text, {resource = FormatResource(empty_table, amount, self.exploitation_resource), grade = self:Getgrade_name(closest_deposit), col = ConstructionStatusColors.info.color_tag}}
		statuses[#statuses + 1] = status
	end
	ElectricityConsumer.GatherConstructionStatuses(self, statuses)
end

function RegolithExtractor:GetDepositGrade(...)
	return TerrainDepositExtractor.GetDepositGrade(self, ...)
end

function RegolithExtractor:SetDust(...)
	local ring = self.anim_obj and self.anim_obj.ring
	local digger = self.anim_obj and self.anim_obj.digger
	if IsValid(ring) then
		ring:SetDust(...)
	end
	if IsValid(digger) then
		digger:SetDust(...)
	end
	Mine.SetDust(self, ...)
end

function RegolithExtractor:OnSetWorking(working)
	Mine.OnSetWorking(self, working)	
	if IsValid(self.anim_obj) then
		self.anim_obj:SetCommand(working and "Work" or "Idle")
	end
	
	if HintsEnabled and working then
		HintTrigger("HintWasteRock")
	end
end

function RegolithExtractor:GetSelectionRadiusScale()
	return false
end

GlobalVar("RegolithExtractorHintPopupThread", false)

local function StartRegolithExtractorHintPopupThread(delay)
	if not g_Tutorial then
		RegolithExtractorHintPopupThread = CreateGameTimeThread(function(delay)
			Sleep(delay or const.DayDuration*(7 - 1))
			ShowPopupNotification("SuggestedBuildingConcreteExtractor")
		end, delay)
	end
end

function OnMsg.LoadGame()
	if not RegolithExtractorHintPopupThread then
		local delay = const.DayDuration*(7 - 1) - GameTime() --the trigger is sol 7 (mantis:0130205), but we begin counting from sol 1
		if delay > 0 then
			StartRegolithExtractorHintPopupThread(delay)
		end
	end
end

function OnMsg.CityStart()
	StartRegolithExtractorHintPopupThread()
end

function OnMsg.ConstructionSitePlaced(site)
	if not IsValidThread(RegolithExtractorHintPopupThread) then
		return
	end
	
	local building_class = site.building_class_proto
	if IsKindOfClasses(building_class, "RegolithExtractor", "TheExcavator") then
		DeleteThread(RegolithExtractorHintPopupThread)
	end
end

DefineClass.RegolithMineVisual = {
	__parents = { "CommandObject", "Object" },
	
	-- terrain modification state
	current_mode = reModeOrient,
	strips = false,
	base_height = false,
	target_depth = false,
	current_depth = false,	
	current_strip = false,
	current_dist = false,
	current_angle = false,	
	
	-- dig params
	start_offset = 1676*guic,
	steplen = 50*guic,	-- per dig tick
	dig_tick = 100,		-- ms
	dig_pts = { -3*guim, -guim, guim, 3*guim },
	dig_size_in = 230*guic,     -- for terrain height modification (inner circle)
	dig_size_out = 270*guic,    -- for terrain height modification (outer circle)
	dig_type_size = 350*guic,	-- for terrain type modification
	terrain_type = "Dig",		-- applied terrain type
	terrain_type_idx = false,
	dig_height = 10*guic,
	delta_height = 15*guic, -- depth per 1m distance from the start
	dig_reverse_delay = 2000,
	
	quarry_bounds = false,
	dig_extend_len = 800*guic, -- extend toward a nearby quarry
	rope_origin_height = 200*guic,
	
	-- visual params
	orient_speed = 10*60, -- angular speed
	dig_speed = 20*guic,	-- /sec, movement speed when digging
	
	-- visuals
	ring = false,
	digger = false,	
	rope1 = false,
	rope2 = false,
	digger_axis = false,
	digger_angle = false,
	
	-- parent
	mine = false,
}

if Platform.developer then
	assert(const.MaxPassableTerrainSlope * 60 > atan(RegolithMineVisual.delta_height, guim))
end

function RegolithMineVisual:InitMineVisuals()
	local ring = PlaceObject("RegolithExtractorRing")
	ring:SetEnumFlags(const.efSelectable)
	ring:SetPos(self:GetPos())
	ring:SetAngle(self:GetAngle())
	self.ring = ring
	rawset(ring, "SelectionPropagate", function() return self.mine end)
	
	local digger = PlaceObject("RegolithExtractorDigger", nil, const.cfComponentAttach)
	digger:SetEnumFlags(const.efSelectable)
	ring:Attach(digger, ring:GetSpotBeginIndex("Digger"))
	self.digger = digger

	local rope = PlaceObject("RegolithExtractorRope", nil, const.cfComponentAttach)
	rope:SetZClip(3*guim)
	digger:Attach(rope, digger:GetSpotBeginIndex("Rope1"))
	self.rope1 = rope
	
	rope = PlaceObject("RegolithExtractorRope", nil, const.cfComponentAttach)
	rope:SetZClip(3*guim)
	digger:Attach(rope, digger:GetSpotBeginIndex("Rope2"))
	self.rope2 = rope

	local shape = GetEntityOutlineShape("Quarry")
	local origin = self:GetPos()
	local angle = self:GetAngle()

	self.strips = {}
	self.quarry_bounds = {}
	
	local base_height = terrain.GetHeight(origin)
	
	self.terrain_type_idx = table.find(TerrainTextures, "name", self.terrain_type)
	
	for i = 1, #shape do
		local q, r = shape[i]:xy()
		local x, y = HexToWorld(q, r)
		local dir = Rotate(point(x, y), angle)
		local pt = origin + dir						
		local dist = dir:Len2D()
		local full_dist = dist
		local step = SetLen(dir, self.steplen)
		local normal = point(step:y(), -step:x())
		local orient = CalcOrientation(origin, pt)
		local depth = base_height - MulDivRound(self.delta_height, dist - self.start_offset, guim)			
		local depth_full_dist

		local qbq, qbr = WorldToHex(pt)
		self.quarry_bounds[qbq] = self.quarry_bounds[qbq] or {}
		self.quarry_bounds[qbq][qbr] = depth

		for j = 1, #HexSurroundingsCheckShape do
			local dq, dr = HexSurroundingsCheckShape[j]:xy()
			local tq, tr = qbq + dq, qbr + dr
			local obj = HexGetLowBuilding(tq, tr)
			
			local center = point(HexToWorld(tq, tr)):SetStepZ(5*guic)
						
			if IsKindOf(obj, "RegolithExtractor") and obj.anim_obj and obj.anim_obj ~= self then
				local quarry_bounds = obj.anim_obj.quarry_bounds
				if quarry_bounds and quarry_bounds[tq] and quarry_bounds[tq][tr] then
					-- todo: extend digging
					full_dist = full_dist + self.dig_extend_len
					depth_full_dist = quarry_bounds[tq][tr] -- approximation
				end
			end
		end

		table.insert(self.strips, { 
			pt = pt, 
			dir = dir, 
			dist = dist, 
			full_dist = full_dist, 
			depth = depth,
			depth_full_dist = depth_full_dist,
			angle = orient, 
			rel_angle = AngleDiff(orient, angle), 
			step = step, 
			normal = normal,
		})
		if not self.target_depth or depth < self.target_depth then
			self.target_depth = depth
		end
	end
	
	table.sort(self.strips, function(a, b) return a.rel_angle < b.rel_angle end)

	self.current_depth = base_height - self.dig_height
	self.current_strip = 1
	self.base_height = base_height
	
	if self.mine and self.mine.palette then
		Building.SetPalette(ring, self.mine.palette)
	end
end

function RegolithMineVisual:Done()
	if IsValid(self.ring) then
		DoneObject(self.ring)
	end
	if IsValid(self.digger) then
		DoneObject(self.digger)
	end
	self.ring = nil
	self.digger = nil
end

function RegolithMineVisual:Work()
	self:PushDestructor(function(self)
		if not IsValid(self) then return end
		PlayFX("RegolithExtractorDigging", "digEnd", self.digger)		
		if self.current_mode == reModeMove or self.current_mode == reModeReturn then
			self.digger:SetAnim(1, "digEnd", const.eDontCrossfade)
			Sleep(self.digger:TimeToAnimEnd())
			self.digger:SetAnim(1, "idle2")
		elseif self.current_mode == reModeExit then
			Sleep(self.digger:TimeToAnimEnd())
			self.digger:SetAnim(1, "enter", const.eDontCrossfade)
			PlayFX("RegolithExtractorDigging", "enter", self.digger)
			Sleep(self.digger:TimeToAnimEnd())
		end
	end)
	
	if self.current_mode == reModeMove or self.current_mode == reModeReturn then
		self.digger:SetAnim(1, "digStart", const.eDontCrossfade)
		Sleep(self.digger:TimeToAnimEnd())
		self.digger:SetAnim(1, "dig")
		PlayFX("RegolithExtractorDigging", self.current_mode == reModeReturn and "dig-reverse" or "dig", self.digger)
	end
	
	repeat
		local done = self:DigAnimTick()
	until done
	self:PopAndCallDestructor()
end

function RegolithMineVisual:StripDone()
	local first = self.current_strip + 1	
	self.current_strip = false
	
	-- try to find a strip for the current depth
	for i = first, #self.strips do
		local strip = self.strips[i]
		if self.current_depth >= strip.depth then
			self.current_strip = i
			return
		end
	end
	
	-- move to next level
	self.current_depth = Max(self.current_depth - self.dig_height, self.target_depth)
	
	for i = 1, first - 1 do -- remaining are already checked at a higher depth level
		local strip = self.strips[i]
		if self.current_depth >= strip.depth then
			self.current_strip = i
			return
		end
	end
end

function RegolithMineVisual:DigAnimTick()
	if not IsValid(self) then
		return true
	end
	
	local strip = self.strips[self.current_strip]
	if not strip then
		return true
	end

	if self.current_mode == reModeOrient then
		self:DigAnimOrientTick(strip)
	elseif self.current_mode == reModeExit then
		-- play the relevant animation, sleep for its duration
		self.digger:Detach()
		self.digger:SetAnim(1, "exit")
		PlayFX("RegolithExtractorDigging", "exit", self.digger)
		Sleep(self.digger:TimeToAnimEnd())
		if not IsValid(self) then return true end
		self.digger:SetAnim(1, "dig", const.eDontCrossfade)
		PlayFX("RegolithExtractorDigging", "dig", self.digger)
		self.current_mode = reModeMove
		--self.start_offset = self.digger:GetDist2D(self)
		self.current_dist = self.start_offset
		--Sleep(1000)
	elseif self.current_mode == reModeMove then
		self:DigAnimMoveTick(strip)
	elseif self.current_mode == reModeReturn then
		-- move backwards
		self:DigAnimMoveTick(strip, true)
	elseif self.current_mode == reModeUnload then
		self.digger:SetAnim(1, "digEnd", const.eDontCrossfade)
		PlayFX("RegolithExtractorDigging", "digEnd", self.digger)
		Sleep(self.digger:TimeToAnimEnd())

		-- play the relevant animation, sleep for its duration
		self.ring:Attach(self.digger, self.ring:GetSpotBeginIndex("Digger"))
		self.digger:SetAnim(1, "enter", const.eDontCrossfade)
		PlayFX("RegolithExtractorDigging", "enter", self.digger)
		Sleep(self.digger:TimeToAnimEnd())
		if not IsValid(self) then return true end
		self.digger:SetAnim(1, "idle", const.eDontCrossfade)
		PlayFX("RegolithExtractorDigging", "idle", self.digger)
		
		-- move to next strip/depth
		self:StripDone()
		
		if self.current_strip then
			self.current_mode = reModeOrient
		else
			self.current_mode = reModeDone
			return true
		end
	else
		assert(self.current_mode == reModeDone, "wrong operation mode")
		return true
	end
end

function RegolithMineVisual:DigAnimOrientTick(strip)
	local t = 100
	local base_angle = self:GetAngle()
	local rel_angle = AngleDiff(self.ring:GetAngle(), base_angle)
	
	local rel_target = AngleDiff(strip.angle, base_angle)
	
	local step = MulDivRound(self.orient_speed, t, 1000)
	
	if rel_angle > rel_target then
		if rel_angle - step <= rel_target then
			t = MulDivRound(t, rel_angle - rel_target, step)
			rel_angle = rel_target
		else
			rel_angle = rel_angle - step
		end
	elseif rel_angle < rel_target then
		if rel_angle + step >= rel_target then
			t = MulDivRound(t, rel_target - rel_angle, step)
			rel_angle = rel_target
		else
			rel_angle = rel_angle + step
		end
	end
		
	local angle = base_angle + rel_angle
	self.ring:SetAngle(angle, t)
	Sleep(t)
	if not IsValid(self) then return end
	
	if rel_angle == rel_target then
		self.current_mode = reModeExit
		
		self.digger_axis = self.digger:GetAxis()
		self.digger_angle = self.digger:GetAngle()
				
		--self.digger:SetAxis(SetLen(strip.normal, 4096):SetZ(0))
	end					
end

function RegolithMineVisual:DigAnimMoveTick(strip, reverse)
	-- move towards the current target, modifying terrain in the process
	local t = self.dig_tick
	local excavated = self.base_height - self.dig_height - self.current_depth
	local steplen = self.steplen
	local dist = strip.full_dist - excavated
	local start_offset = self.start_offset
	local current_dist = self.current_dist
	local done = false
	
	if reverse then
		-- self.current_dist -> self.start_offset
		if current_dist - steplen <= self.start_offset then
			t = MulDivRound(t, current_dist - self.start_offset, steplen)
			current_dist = self.start_offset
			done = true
		else
			current_dist = current_dist - steplen
		end
	else
		-- self.current_dist -> strip.dist		
		if current_dist + steplen >= dist then
			t = MulDivRound(t, dist - current_dist, steplen)
			current_dist = dist
			done = true
		else
			current_dist = current_dist + steplen
		end
	end
		
	self.current_dist = current_dist
	
	local dig_origin = self:GetPos() + SetLen(strip.dir, current_dist)
	self.digger:SetPos(dig_origin, t)

	-- rope visuals
	self.rope1:SetZClip(current_dist - 5*guim) -- reduce some length to account for origin to attach spot distance
	self.rope2:SetZClip(current_dist - 5*guim)

	local dh = self.base_height - terrain.GetHeight(dig_origin) + self.rope_origin_height
	local orient = atan(dh, current_dist)
	
	local axis, angle = ComposeRotation(axis_x, -orient, self.digger_axis, self.digger_angle)
	self.digger:SetAxis(axis)
	self.digger:SetAngle(angle, t)
	
	local ht = t/2
	Sleep(ht)	
	if not IsValid(self) then return end
	
	-- calculate desired depth at target and compare against the current level of digging
	local own_dist = Min(current_dist, strip.dist)
	local target_h = self.base_height - MulDivRound(self.delta_height, own_dist - self.start_offset, guim)
	
	if current_dist > own_dist then -- extended toward another quarry
		-- target_h @ own_dist, strip.depth_full_dist @ dist
		local d = current_dist - own_dist
		local dh = strip.depth_full_dist - target_h
		target_h = target_h + MulDivRound(d, dh, dist - own_dist)
	end
		
	if self.current_depth >= target_h then				
		-- modify the terrain (as defined by self.dig_pts)
		for i = 1, #self.dig_pts do
			local dig_pt = dig_origin + SetLen(strip.normal, self.dig_pts[i])							
			terrain.SetHeightCircle(dig_pt, self.dig_size_in, self.dig_size_out, self.current_depth, const.hsMin)
			if not reverse and excavated == 0 and self.terrain_type_idx then
				terrain.SetTypeCircle(dig_pt, self.dig_type_size, self.terrain_type_idx)
			end
		end					
	end
	
	-- sleep for the remaining time
	Sleep(t - ht)	
	if not IsValid(self) then return end
	
	if done then
		if reverse then
			self.current_mode = reModeUnload
		else
			Sleep(self.dig_reverse_delay)
			self.current_mode = reModeReturn
			PlayFX("RegolithExtractorDigging", "dig-reverse", self.digger)
		end
	end
end