DefineClass.DiggersMystery = {
	__parents = {"MysteryBase"},
	
	scenario_name = "Mystery 2",
	
	can_destroy_diggers = false,
	is_big_digger_destroyed = false,
	destroyed_diggers = 0,
	
	display_name = T(1170, "The Dredgers (Normal)"),
	rollover_text = T(1171, '"Two possibilities exist: either we are alone in the Universe or we are not. Both are equally terrifying."<newline><right>- Arthur C. Clarke'),
	challenge_mod = 40,
	order_pos = 7,
}

function DiggersMystery:Init()
	self.city:InitEmptyLabel("AlienDiggers")
end

-------------------------------------------------------------------------------
--alien diggers
-------------------------------------------------------------------------------

GlobalVar("AlienDiggerID", 0)

DefineClass.AlienDigger = {
	__parents = { "CommandObject", "TaskRequester", "GridObject", "InfopanelObj" },
	
	entity = "AlienDiggerSmall",
	--spawn
	enum_flags = { efVisible = false }, --so we are invisible if spawned on the ground
	initial_height = 700 * guim,
	--destruction
	is_being_destroyed = false,
	auto_connect = false,
	work_req = false,
	work_required_to_destroy = 25 * const.HourDuration,
	work_max_drones = 3,
	--digging
	dig_time = 75 * const.HourDuration, --the time, since the landing, it will take for the digger to leave and destroy picked resource.
	--anomally
	my_anomally = false,
	--ui
	display_name = T(1172, "Dredger"),
	description = T(1173, "A mysterious alien object which seems to excavate landmass from the Martian surface."),
	--
	pre_hit_ground_t = 1000,
	pre_hit_ground_t_2 = 500,
	
	fx_rotating_obj = false,
	encyclopedia_id = false,
	
	digger_id = 0,
	
	ip_template = "ipAlienDigger",
}

function AlienDigger:Init()
	AlienDiggerID = AlienDiggerID + 1
	self.digger_id = AlienDiggerID
end

function AlienDigger:GetDiggerId()
	return self.digger_id
end

function AlienDigger:GetDisplayName()
	return T{1174, "<display_name> <idx>", display_name = self.display_name, idx = FormatIndex(self.digger_id, self)}
end

function AlienDigger:GetDescription()
	return self.description
end

AlienDigger.GetIPDescription = AlienDigger.GetDescription

function AlienDigger:CreateResourceRequests()
	self.work_req = self:AddWorkRequest("deconstruct", self.work_required_to_destroy, 0, self.work_max_drones)
end

function AlienDigger:GameInit()
	UICity:AddToLabel("AlienDiggers", self)
	self:SetCommand("Idle")
	
	if self.pre_hit_ground_t < self.pre_hit_ground_t_2 then
		local t = self.pre_hit_ground_t
		self.pre_hit_ground_t = self.pre_hit_ground_t_2
		self.pre_hit_ground_t_2 = self.pre_hit_ground_t
	end
end

function AlienDigger:Done()
	UICity:RemoveFromLabel("AlienDiggers", self)
end

function AlienDigger:Land()
	local my_pos = self:GetPos()
	assert(my_pos ~= InvalidPos()) --will cause a game crash in GetAccelerationAndTime
	local target_z = terrain.GetHeight(my_pos)
	local initial_z = my_pos:z()
	local delta_z = abs(initial_z - target_z)

	if delta_z > 0 then
		self:PushDestructor(function(self)
			self:SetAcceleration(0)
		end)
		local dest = my_pos:SetZ(target_z)
		local a, t = self:GetAccelerationAndTime(dest, 0, 50000) --soft landing, reverse for hard
		self:SetAcceleration(a)
		self:SetPos(dest, t)
		Sleep(t - Min(self.pre_hit_ground_t, t))
		PlayFX("AlienDiggerLanding", "pre-hit-ground", self)
		t = Min(self.pre_hit_ground_t, t)
		Sleep(t - Min(self.pre_hit_ground_t_2, t))
		PlayFX("AlienDiggerLanding", "pre-hit-ground-2", self)
		Sleep(Min(self.pre_hit_ground_t_2, t))
		self:PopAndCallDestructor()
	end
end

function AlienDigger:LiftOff()
	if self.auto_connect then
		self:InterruptDrones(
			nil, function(drone)
				if drone.command == "Work" and drone.target == self then
					return drone
				end
			end, nil
		)
		
		self:DisconnectFromCommandCenters()
		self.auto_connect = false
	end

	local my_pos = self:GetVisualPos() --assumes terrain.GetHeight(my_pos) == my_pos:z(), i.e. we are landed when lifting off
	local target_z = my_pos:z() + 1000 * guim

	self:PushDestructor(function(self)
		self:SetAcceleration(0)
	end)

	local dest = my_pos:SetZ(target_z)
	local a, t = self:GetAccelerationAndTime(dest, 50000, 0)
	self:SetAcceleration(a)
	self:SetPos(dest, t)
	Sleep(t)
	
	self:PopAndCallDestructor()
end

function AlienDigger:CleanupAlienDiggerDestroyWarningFX()
	if self.fx_rotating_obj then
		PlayFX("AlienDiggerDestroyWarning", "end", self)
		DoneObject(self.fx_rotating_obj)
		self.fx_rotating_obj = false
	end
end

function AlienDigger:ToggleDestroyFromUI()
	if self.is_being_destroyed then
		self:InterruptDrones(
			nil, function(drone)
				if drone.command == "Work" and drone.target == self then
					return drone
				end
			end, nil
		)
		self:DisconnectFromCommandCenters()
		self.auto_connect = false
		
		self:CleanupAlienDiggerDestroyWarningFX()
	else
		--start to destroy
		self.work_req:ResetAmount(self.work_required_to_destroy) --reset request amount.
		
		self:ConnectToCommandCenters()
		self.auto_connect = true
		
		self.fx_rotating_obj = PlaceObject("RotatyThing")
		self:Attach(self.fx_rotating_obj, self:GetSpotBeginIndex("Top"))
		PlayFX("AlienDiggerDestroyWarning", "start", self)
	end
	
	self.is_being_destroyed = not self.is_being_destroyed
end

function AlienDigger:ClearCables()
	--destroy all cables.
	local outline, interior = GetEntityHexShapes(self:GetEntity())
	
	UICity:SetCableCascadeDeletion(false, "digger")
	local dir = HexAngleToDirection(self:GetAngle() * 60)
	local q, r = WorldToHex(self)
	for i = 1, 2 do
		local shape_data = i == 1 and outline or interior
		for _, shape_pt in ipairs(shape_data) do
			local x, y = shape_pt:xy()
			x, y = HexRotate(x, y, dir)
			local remove = HexGridGetObjects(ObjectGrid, x + q, y + r, "DoesNotObstructConstruction", nil, function(o)
				return not IsKindOfClasses(o, "LifeSupportGridElement", "DomeInterior")
			end)
			for j=1,#remove do
				DoneObject(remove[j])
			end
		end
	end
		
	UICity:SetCableCascadeDeletion(true, "digger")
end

function AlienDigger:InteractWithDeposit()
	--kill nearby deposit
	local dep = self:FindDeposit()
	if IsValid(dep) then
		local amount_to_consume = MulDivRound(20, dep.max_amount, 100)
		dep:TakeAmount(amount_to_consume) --take 20% of max, this will kill it if it hasn't got enough
	end
end

function AlienDigger:Idle()
	local spawn_pos = self:GetPos()
	if spawn_pos == InvalidPos() then
		print("Alien digger has an invalid poss, self destroying!")
		DoneObject(self)
		return
	end
	
	if not spawn_pos:z() or abs(spawn_pos:z() - terrain.GetHeight(spawn_pos)) < 10 then --epsilon is == 10
		--set the object somewhere above the ground so it can land properly
		self:SetPos(spawn_pos:SetTerrainZ(self.initial_height))
	end
	
	self:SetEnumFlags(const.efVisible)
	
	PlayFX("AlienDiggerLanding", "start", self)
	self:Land()
	PlayFX("AlienDiggerLanding", "hit-ground", self)
	if not IsValid(self) then return end
	self:SetPos(self:GetPos()) --apply block pass
	self:ClearCables()
	
	PlayFX("AlienDiggerDigging", "start", self)
	self:PushDestructor(function(self)
		PlayFX("AlienDiggerDigging", "end", self)
	end)
	self:PlayState("diggingStart")
	if not IsValid(self) then return end
	PlayFX("AlienDiggerDigging", "idle", self)
	self:SetAnim(1, "diggingIdle", const.eDontCrossfade)
	Sleep(self.dig_time)
	if not IsValid(self) then
		--we could have been deconstructed.
		return
	end
	
	self:InteractWithDeposit()
	
	if IsValid(self.my_anomally) then
		DoneObject(self.my_anomally)
	end
	--leave
	--self:GetPos should be == to spawn_pos but in case someone moved us..
	--PlaceResourceStockpile_Delayed cant handle waste rock because it has too much variation.
	local stock = PlaceObject("WasteRockStockpileUngrided",
								{init_with_amount = WasteRockStockpileUngrided:GetMax() * const.ResourceScale,
								has_demand_request = false,})
	stock:SetPos(self:GetPos():SetTerrainZ())
	
	
	self:PlayState("diggingEnd")
	self:PopAndCallDestructor()
	if not IsValid(self) then return end
	self:CleanupAlienDiggerDestroyWarningFX()
	PlayFX("AlienDiggerTakeoff", "start", self)
	self:LiftOff()
	if not IsValid(self) then return end
	PlayFX("AlienDiggerTakeoff", "end", self)
	--die
	DoneObject(self)
end

function AlienDigger:FindDeposit()
	--look for subsurface
	return MapFindNearest(self, self, const.HexHeight * 5, "SubsurfaceDeposit", function(dep)
		return not IsKindOf(dep, "SubsurfaceAnomaly")
	end)
	
end

local digger_rewards_on_dismantle = {
	{resource = "Metals", min = 10, max = 15},
	{resource = "PreciousMetals", min = 1, max = 10},
	{resource = "Polymers", min = 5, max = 10},
	{resource = "MachineParts", min = 5, max = 10},
	{resource = "Electronics", min = 5, max = 10},
	{resource = "Fuel", min = 20, max = 30},
}

function AlienDigger:SpawnResources()
	local entry = table.rand(digger_rewards_on_dismantle)
	local amount = AsyncRand(entry.max + 1 - entry.min) + entry.min
	PlaceResourceStockpile_Delayed(self:GetPos(), entry.resource, amount * const.ResourceScale, self:GetAngle(), true)
end

function AlienDigger:GetUIStatusOverrideForWorkCommand(request, drone)
	return "Dismantle"
end

function AlienDigger:DroneWork(drone, request, resource, amount)
	drone:PushDestructor(function(drone)
		local self = drone.target
		if drone.w_request:GetActualAmount() <= 0 and IsValid(self) then
			local city = drone.city
			if IsKindOf(self, "AlienDiggerBig") then
				city.mystery.is_big_digger_destroyed = true
			end
			if SelectedObj == self then
				SelectObj(false)
			end
			PlayFX("Deconstruct", "end", self, nil, self:GetPos())
			self:SpawnResources()
			DoneObject(self)
			city.mystery.destroyed_diggers = city.mystery.destroyed_diggers + 1
		else
			PlayFX("Deconstruct", "cancel", self)
		end
	end)
	
	
	self:CleanupAlienDiggerDestroyWarningFX()
	PlayFX("Deconstruct", "start", self)
	drone:ContinuousTask(request, amount, g_Consts.DroneDeconstructBatteryUse, "constructStart", "constructIdle", "constructEnd", "Deconstruct")
	drone:PopAndCallDestructor()
end

GlobalVar("AlienDiggerBigID", 0)

DefineClass.AlienDiggerBig = {
	__parents = { "AlienDigger" },
	entity = "AlienDiggerBig",
	display_name = T(1179, "Dredgenaught"),
	work_required_to_destroy = 90 * const.HourDuration,
	work_max_drones = 6,
	dig_time = 100 * const.HourDuration,
	
	digger_big_id = 0,
}

function AlienDiggerBig:GetDiggerId()
	return self.digger_big_id
end

function AlienDiggerBig:Init()
	AlienDiggerBigID = AlienDiggerBigID + 1
	self.digger_big_id = AlienDiggerBigID
end

local big_digger_rewards_on_dismantle = {
	{resource = "Electronics", min = 100, max = 110},
	{resource = "PreciousMetals", min = 100, max = 110},
}

function AlienDiggerBig:SpawnResources()
	for _,entry in ipairs(big_digger_rewards_on_dismantle) do		
		local amount = AsyncRand(entry.max + 1 - entry.min) + entry.min
		PlaceResourceStockpile_Delayed(self:GetPos(), entry.resource, amount * const.ResourceScale, self:GetAngle(), true)
	end
end

-- shows where the digger will land

DefineClass.AlienDiggerMarker = {
	__parents = { "SpawnFXObject", "GridObject" },
	enum_flags = { efVisible = false, },
	is_tall = true, --so SA_PlaceObj's buildable tests, test correctly for pipes when placing those
	entity = "AlienDiggerSmall",
}

DefineClass.AlienDiggerMarkerBig = {
	__parents = { "AlienDiggerMarker" },
	entity = "AlienDiggerBig",
}

function dbg_SpawnDredgerAtCursor()
	local o = PlaceObject("AlienDigger")
	o:SetPos(GetTerrainCursor())
end