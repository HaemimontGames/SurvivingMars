DefineClass.FakeAttackRover = {
	__parents = { "Object" },
	enum_flags = { efWalkable = false, efCollision = false, efApplyToGrids = false },
	entity = "CombatRover",
	fx_actor_class = "AttackRover",
}

DefineClass.AttackRover = {
	__parents = { "BaseRover" },
	entity = "CombatRover",

	properties = {
		{ id = "can_repair",	editor = "bool", default = true, no_edit = true }, -- to forbid repair individually when it is globally allowed
		{ template = true, category = "Attack Rover", name = T{673, "Protect Range"},	id = "protect_range",	editor = "number", default = 20, help = "If meteors would fall within dist range it can be destroyed by the rocket (in hexes)" },
	},
	
	display_name = T{6921, "Experimental Vehicle"},
	description = T{6922, "A remote-controlled vehicle, property of EsoCorp."},
	reclaimed_description = T{6923, "A remote-controlled combat vehicle, reclaimed by the Colony. Protects against meteor strikes and EsoCorp vehicles."},
	display_icon = "UI/Icons/Buildings/rover_combat.tga",

	-- override battery numbers if needed
	battery_max = 200000,
	battery_hourly_drain_rate = 1000,	
	accumulate_dust = false,
	dust_devil_malfunction_chance = 0,
	
	collision_radius = 540,
	direction_arrow_scale = 260,
	
	roam_target_radius = 750*guim,
	attack_range = 750*guim,
	attack_target_labels = { "OutsideBuildingsTargets", "Rover" },
	reload_time = const.HourDuration / 10,
	reload_expiration_time = false,
	reclaimed = false,
	
	max_health = 100,
	rocket_damage = 5,
	current_health = false,
	attacks_remaining = false,
	last_attacker = false,
	meteor = false,
	track_thread = false,
	intercept_distance_percent = 80, -- blow up after the meteor travelled this portion of its whole trajectory; low numbers may cause it to hit domes before getting blown up
	intercept_reload_percent = 10, -- percentage of reload_time to sleep after firing a rocket at a meteor
	is_repair_request_initialized = false,
	
	spawn_min_angle = 30*60,
	spawn_max_angle = 70*60,
	spawn_flight_dist = 1500*guim,
	spawn_land_dist = 300*guim,
	spawn_flight_speed = 150*guim, -- /s
	spawn_pos = false,
	ip_template = "ipAttackRover",
	
	attack_look_for_target = false,
	affected_by_no_battery_tech = false,

	palettes = { "AttackRoverBlue" },
	land_decal_name = "DecRocketSplatter",
}

function AttackRover:Init()
	self.current_health = self.max_health
end

function AttackRover:GameInit()
	local city = self.city or UICity
	city:RemoveFromLabel("Rover", self)
	city:AddToLabel("HostileAttackRovers", self)
	
	self.name = self.display_name
	
	self:SetCommand("Spawn")
end

function AttackRover:Done()
	if IsValidThread(self.track_thread) then
		DeleteThread(self.track_thread)
	end
end

local UnbuildableZ = buildUnbuildableZ()
local function IsPlayablePoint(pt)
	local x, y = pt:xy()
	local q, r = WorldToHex(x, y)
	return pt:InBox2D(g_MapArea) and GetBuildableZ(q, r) ~= UnbuildableZ and terrain.IsPassable(pt)
end

function AttackRover:IsReloading()
	return self.reload_expiration_time and GameTime() < self.reload_expiration_time
end

function AttackRover:Idle()
	if self:IsReloading() then
		Sleep(1000)
		return
	end
	if self.reclaimed then
		-- auto-fire at enemies in range
		if self:PickTarget() then
			self:SetCommand("Attack", -1)
		else
			self:SetState("idle")
			Sleep(1000)
		end
	else
		-- attack or roam
		if self.attacks_remaining or IsValid(self.last_attacker) then
			self:SetCommand("Attack", self.attacks_remaining, self.last_attacker)
		else
			self:SetCommand("Roam")
		end
	end
end

function AttackRover:Spawn()
	-- pick a random buildable spot within the playable area
	local city = self.city or UICity

	local spawn_pos = self.spawn_pos

	self:PushDestructor(function()
		local dir = point(city:Random(-4096, 4096), city:Random(-4096, 4096))
		local angle = city:Random(self.spawn_min_angle, self.spawn_max_angle)
		local s, c = sin(angle), cos(angle)
		local flight_dist = self.spawn_flight_dist
		if c == 0 then
			dir = point(0, 0, flight_dist)
		else
			dir = SetLen(dir:SetZ(MulDivRound(dir:Len2D(), s, c)), flight_dist)
		end
		
		-- pick position		
		while not spawn_pos do
			local sector_x = city:Random(1, 10)
			local sector_y = city:Random(1, 10)
			local sector = g_MapSectors[sector_x][sector_y]
			
			--local maxx, maxy = sector.area:
			local minx, miny = sector.area:minxyz()		
			local maxx, maxy = sector.area:maxxyz()
			
			local x = city:Random(minx, maxx)
			local y = city:Random(miny, maxy)
			local pt = point(x, y)
					
			if IsPlayablePoint(pt) and not GetDomeAtPoint(pt) then
				pt = pt:SetStepZ()
				if not DomeCollisionCheck(pt, pt + dir) then
					spawn_pos = pt
					break
				end
			end
		end
		
		-- launch a meteor 
		local pos = spawn_pos + dir
		local rover = PlaceObject("FakeAttackRover")
		local palette = self.palettes and EntityPalettes[self.palettes[1]]
		if palette then
			SetObjectPalette(rover, palette)
		end
		rover:SetPos(pos)
		PlayFX("Meteor", "start", rover, nil, nil, dir)
		spawn_pos = terrain.GetIntersection(pos, spawn_pos)
		
		flight_dist = spawn_pos:Dist(pos)
		local flight_speed = self.spawn_flight_speed
		local total_time = MulDivRound(1000, flight_dist, flight_speed)
		local land_time = MulDivRound(1000, self.spawn_land_dist, flight_speed)
		local pitch = -atan(dir:Len2D(), dir:z())
		local yaw = 180*60 + atan(dir:y(), dir:x())
		SetRollPitchYaw(rover, 0, pitch, yaw, 0)
		rover:SetPos(spawn_pos, total_time)
		Sleep(total_time - land_time)
		
		PlayFX("Land", "start", rover)
		local final_speed = 10*guim
		local accel, land_time = rover:GetAccelerationAndTime(spawn_pos, final_speed, flight_speed)
		rover:SetAcceleration(accel)
		rover:SetPos(spawn_pos, land_time)
		SetRollPitchYaw(rover, 0, 0, yaw, land_time)
		Sleep(land_time)
		PlayFX("Land", "end", rover)
		
		PlayFX("Meteor", "end", rover, nil, nil, dir)
		
		local land_decal = PlaceObject(self.land_decal_name)
		land_decal:SetPos(spawn_pos)
		land_decal:SetAngle(AsyncRand(360*60))
		land_decal:SetScale(15)
		CreateGameTimeThread(function()
			local delta = const.DayDuration / 20
			for opacity = 100, 0, -5 do
				Sleep(delta)
				if not IsValid(land_decal) then return end
				land_decal:SetOpacity(opacity, delta)
			end
			DoneObject(land_decal)
		end)

		rover:SetAnimSpeedModifier(1000 + MulDivRound(500, final_speed, 5*guim))
		rover:PlayState("attackStart")
		rover:SetAnimSpeedModifier(1000)
		rover:PlayState("attackEnd")
		
		if IsValid(self) then
			self:SetPos(spawn_pos)
			self:SetAngle(rover:GetAngle())
			self:SetAxis(rover:GetAxis())
		end
		DoneObject(rover)
		Sleep(1000)
	end)
	
	self:PopAndCallDestructor()		
	self:SetCommand("Roam")
end

function AttackRover:RoamTick()
	-- pick a random playable pos within roam_target_radius, but outside of a dome
	local city = self.city or UICity
	local pos = self:GetPos()
	local roam_target
	
	for i = 1, 50 do
		local dist = city:Random(self.roam_target_radius)
		local angle = city:Random(360*60)
		
		local pt = RotateRadius(dist, angle, pos)
		if IsPlayablePoint(pt) and not GetDomeAtPoint(pt) then
			roam_target = pt
			break
		end
	end
	
	if roam_target then
		self:Goto(roam_target)
	end
	Sleep(1000 + self:Random(1000))
end

function AttackRover:Roam()
	while true do
		self:RoamTick()
	end	
end

function AttackRover:Reload()
	-- todo: animation?
	self:SetState("idle")
	self.reload_expiration_time = GameTime() + self.reload_time
	Sleep(self.reload_time)
	self:SetCommand("Idle")
end

function AttackRover:PickTarget()
	local city = self.city or UICity
	local target, target_dist
	
	if self.reclaimed then
		local hostile = self.city.labels.HostileAttackRovers or empty_table
		if IsValid(self.last_attacker) and table.find(hostile, self.last_attacker) and not self.last_attacker:IsDead() then
			return self.last_attacker
		end
		for _, obj in ipairs(hostile) do
			if IsValid(obj) and self:GetVisualDist2D(obj) <= self.attack_range then
				return obj
			end
		end		
	else
		if IsValid(self.last_attacker) then
			if IsKindOf(self.last_attacker, "Building") and not self.last_attacker.destroyed and not self.last_attacker:IsMalfunctioned() then
				return self.last_attacker
			end
			local hostile = self.city.labels.HostileAttackRovers or empty_table
			if IsKindOf(self.last_attacker, "AttackRover") and not table.find(hostile, self.last_attacker) and not self.last_attacker:IsDead() then
				return self.last_attacker
			end
		end
		local pos = self:GetPos()
		for _, label in ipairs(self.attack_target_labels) do
			local list = city.labels[label] or empty_table
			local count = #list
			local offset = self:Random(count)
			for i = 1,#list do
				local obj = list[(offset + i)% count + 1]
				local is_building = obj:IsKindOf("Building")
				if (is_building and not obj.destroyed and not obj.parent_dome) or (not is_building and not obj:IsDead()) then
					target = obj
					break
				end
			end
		end
	end
	
	return target
end

function AttackRover:MoveInRange(target)
	if self:GetVisualDist2D(target) <= self.attack_range then
		return
	end
	local is_building = IsKindOf(target, "Building")
	if is_building and target.destroyed or not is_building and target:IsDead() then
		return
	end
	self:Goto(target, self.attack_range, 0)
end

function AttackRover:Attack(num_attacks, attacker)
	local target 

	if not attacker then
		if num_attacks and num_attacks ~= 0 then
			self.attacks_remaining = Max(0, num_attacks) - 1 -- make negative value fire forever
		else
			self.attacks_remaining = nil
			self:SetCommand("Roam")
		end
	end
	
	self.attack_look_for_target = true
		
	while true do
		target = self:PickTarget()
		if not target then
			if not self.reclaimed then
				self:RoamTick()
			else
				Sleep(1000)
				self:SetCommand("Idle")
			end
		else
			break
		end
	end
	
	self.attack_look_for_target = nil
	
	self:MoveInRange(target)

	-- check if target is still alive
	local is_building = IsKindOf(target, "Building")
	if not IsValid(target) or (is_building and target.destroyed) or (not is_building and target:IsDead()) then
		Sleep(1000)
		return -- pick a new target
	end
	
	-- check if reached
	if self:GetVisualDist2D(target) > self.attack_range then
		return self:Roam() -- failed, roam about
	end
	
	-- fire
	self:FireRocket({target = target})
	self:SetCommand("Reload")
end

function AttackRover:RocketDamage(shooter)
	if self:IsDead() or self:IsMalfunctioned() then
		self.city:RemoveFromLabel("HostileAttackRovers", self)
	end
	if self:IsDead() then
		return
	end
	self.current_health = Max(0, self.current_health - self.rocket_damage)
	if self.current_health == 0 then
		self:SetCommand("Dead")
	end
	if not IsValid(self.last_attacker) then
		self.last_attacker = nil
	elseif IsKindOf(self.last_attacker, "Building") and self.last_attacker.destroyed then
		self.last_attacker = nil
	elseif IsKindOf(self.last_attacker, "AttackRover") and self.last_attacker:IsDead() then
		self.last_attacker = nil
	end
	
	self.last_attacker = self.last_attacker or shooter
	ObjModified(self)
	if self.command == "Roam" then
		self:SetCommand("Idle")
	end
end

function AttackRover:Repair()
	self.battery_current = self.battery_max
	local city = self.city or UICity
	self:DisconnectFromCommandCenters()
	self.current_health = self.max_health
	self.malfunction_idle_state = nil
	self:SetState("idle")
	self.is_repair_request_initialized = false
	if city.mystery.reclaim_repaired_rovers then
		self.reclaimed = true
		self.affected_by_no_battery_tech = true
		self.palettes = { "AttackRoverRed" }
		SetPaletteFromClassMember(self)
		city:AddToLabel("Rover", self)
		CommandObject.SetCommand(self, "Idle")
	else
		city:AddToLabel("HostileAttackRovers", self)
		--hacky cmd exit
		self.command = "" --so we get around setcmd malf block
		self:SetCommand("Roam")
	end
	Msg("AttackRoverRepaired", self)
	ObjModified(self)
end

function AttackRover:Malfunction()
	local city = self.city or UICity
	city:RemoveFromLabel("HostileAttackRovers", self)
	self.malfunction_idle_state = self.current_health == 0 and "destroyed" or "idle"
	Msg("AttackRoverMalfunctioned", self)
	BaseRover.Malfunction(self, "suppress")
end

function AttackRover:Dead()
	if not self.reclaimed then
		Msg("AttackRoverDead", self)
		self:SetCommand("Malfunction")
	end
	local city = self.city or UICity
	city:RemoveFromLabel("HostileAttackRovers", self)
	BaseRover.Dead(self)
	ObjModified(self)
end

function AttackRover:NoBattery()
	-- can't revert to malfunction, rovers are too smart for their own good
	local city = self.city or UICity
	city:RemoveFromLabel("HostileAttackRovers", self)
	Msg("AttackRoverMalfunctioned", self)
	BaseRover.NoBattery(self)
end

function AttackRover:CanBeRepaired()
	return IsValid(self) and (self.command == "Malfunction" or self.command == "NoBattery") and not self.demolishing
end

function AttackRover:CanDemolish()
	return IsValid(self) and (self.reclaimed or ((self.command == "Malfunction" or self.command == "NoBattery") and self.current_health <= 0))
end

function AttackRover:CanBeControlled()
	return self.reclaimed and self.current_health > 0 and BaseRover.CanBeControlled(self)
end

function AttackRover:CanInteractWithObject(obj, interaction_mode)
	if self.command=="Dead" then return false end
	if not self.reclaimed then
		return false, false, true
	end

	if self.interaction_mode == false or self.interaction_mode == "default" or self.interaction_mode == "move" then --the 3 move modes..
		if IsKindOf(obj, "Tunnel") and obj.working then
			return true,  T{9627, "<UnitMoveControl('ButtonA',interaction_mode)>: Use Tunnel",self}--UseTunnel
		end
	end
	
	return false
end

function AttackRover:GetRefundResources()
	return {
		{ resource = "Metals", amount = 20 * const.ResourceScale },
		{ resource = "Electronics", amount = 10 * const.ResourceScale },
	}
end

function AttackRover:OnDemolish()
	PlaceResourceStockpile_Delayed(self:GetVisualPos(), "Metals", 20*const.ResourceScale, self:GetAngle(), true)
	PlaceResourceStockpile_Delayed(self:GetVisualPos(), "Electronics", 10*const.ResourceScale, self:GetAngle(), true)
end

function AttackRover:GetDescription()
	return self.reclaimed and self.reclaimed_description or self.description
end

function AttackRover:GetMalfunctionRepairProgress()	
	return (self.command == "Malfunction" or self.command == "NoBattery") and self.is_repair_request_initialized and 100 - MulDivRound(self.repair_work_request:GetActualAmount(), 100, self.repair_work_amount_on_malfunction) or 0
end

function AttackRover:Getui_command()
	if self.command == "Idle" and self:IsReloading() then
		return RoverCommands.Reload
	elseif self:CanBeRepaired() then
		return (self:GetMalfunctionRepairProgress() > 0) and RoverCommands.BeingRepaired or RoverCommands.Malfunction
	elseif self.command == "Attack" and self.attack_look_for_target then
		return RoverCommands.Roam
	end
	
	return BaseRover.Getui_command(self)
end

function AttackRover:GetHpProgress()
	return MulDivRound(self.current_health, 100, self.max_health)
end

AttackRover.AddToRoversWithLowBattery = empty_func

function AttackRover:ToggleDemolish()
	BaseRover.ToggleDemolish(self)
	
	if self.demolishing and self.is_repair_request_initialized then
		self:ToggleRepair()
	end
	ObjModified(self)
end

function AttackRover.RepairDroneCallback(drone)
	if drone.target.is_repair_request_initialized and drone.w_request:GetActualAmount() <= 0 then
		--maintenance finished cleanly.
		drone.target:Repair()
	end
end

function AttackRover:ToggleRepair()
	if not self.is_repair_request_initialized then
		if self:CanBeRepaired() then
			if not next(self.command_centers) then
				self:ConnectToCommandCenters()
			end
			self.repair_work_request:AddAmount(self.repair_work_amount_on_malfunction)
			self.is_repair_request_initialized = true
		end		
	else
		self:InterruptDrones(
			nil, function(drone)
				if drone.command == "Work" and drone.target == self then
					return drone
				end
			end, nil
		)
		self:DisconnectFromCommandCenters()
		self.repair_work_request:SetAmount(0)
		self.is_repair_request_initialized = false
	end
	ObjModified(self)
end

function AttackRover:ToggleRepair_Update(button)
	local count = CountObjects{
		class = "DroneControl", 
		area = self, 
		hexradius = const.CommandCenterMaxRadius,
		filter = function(obj)
			return obj.accept_requester_connects and obj.work_radius >= HexAxialDistance(self, obj) and #(obj.drones or empty_table) > 0
		end
	}

	
	if count > 0 then
		local repair = not self.is_repair_request_initialized
		button:SetIcon(repair and "UI/Icons/IPButtons/recharge.tga" or "UI/Icons/IPButtons/cancel.tga")
		button:SetRolloverTitle(repair and T{6924, "Repair"} or T{6720, "Cancel"})
		button:SetRolloverText(repair and T{6925, "Send Drones to this vehicle."} or T{6926, "Cancel repairs."})
	else
		button:SetIcon("UI/Icons/IPButtons/recharge.tga")
		button:SetRolloverTitle(T{6924, "Repair"})
		button:SetRolloverText(T{632, "Outside Drone commander range."})
	end
	button:SetEnabled(count > 0)
end

function AttackRover:GetSelectionRadiusScale()	
	if self == WorkRadiusShownForRover then
		return self.protect_range
	else
		return 0
	end
end

function AttackRover:ShowWorkRadius(show, reason)
	if show then
		if next(WorkRadiusShownForRoverReasons) == nil then
			WorkRadiusShownForRover = self
			PlayFX("ShowWorkRadius", "start", self)
		end
		
		WorkRadiusShownForRoverReasons[reason] = true
	else
		if WorkRadiusShownForRover == self then
			WorkRadiusShownForRoverReasons[reason] = nil
			if next(WorkRadiusShownForRoverReasons) == nil then
				PlayFX("ShowWorkRadius", "end", self)
				WorkRadiusShownForRover = false
			end
		end
	end
end

function AttackRover:IsExecuting()
	return IsValid(self.meteor)
end

function AttackRover:CanHit(meteor)
	if not self.reclaimed or self.command ~= "Idle" then
		return false
	end
	
	-- check for threats first
	local hostile = self.city.labels.HostileAttackRovers or empty_table

	for _, obj in ipairs(hostile) do
		if self:GetVisualDist2D(obj) <= self.attack_range then
			return false -- busy dealing with rovers
		end
	end
	
	if not IsValid(meteor) or
		self:IsExecuting() or
		IsValid(meteor.marked) and meteor.marked ~= self or
		IsValidThread(self.track_thread) or
		HexAxialDistance(self, meteor.dest) > self.protect_range
	then
		return false
	end
	return true
end

function AttackRover:FireRocket(luaobj, rocket_class)
	rocket_class = rocket_class or "RocketProjectile"
	
	self:SetAnim(1, "attackStart")
	Sleep(self:TimeToAnimEnd())
	self:SetAnim(1, "attackIdle")
	Sleep(500)
	local rocket = PlaceObject(rocket_class, luaobj)
	local spot = self:GetSpotBeginIndex("Rocket")
	local pos = self:GetSpotLoc(spot)
	rocket.shooter = self
	rocket:SetPos(pos)
	rocket.move_dir = axis_z
	rocket:StartMoving()
	
	PlayFX("MissileFired", "start", self, nil, pos, axis_z)
	
	self:SetAnim(1, "attackEnd")
	Sleep(self:TimeToAnimEnd())
end

function AttackRover:Track(meteor)
	local pos = meteor:GetVisualPos()
	local dir = meteor.dest - pos
		
	local target_pt = pos + MulDivRound(dir, self.intercept_distance_percent, 100)
	local t_impact = GameTime() + meteor:GetTimeToImpact(target_pt)

	meteor.marked = self
	self.meteor = meteor
		
	self.track_thread = CreateGameTimeThread(function(self, meteor, target_pt, t_impact)	
		self:FireRocket({target = meteor, target_pt = target_pt, t_impact = t_impact}, "MeteorInterceptParabolicRocket")
		
		Sleep(MulDivRound(self.reload_time, self.intercept_reload_percent, 100))
		self.track_thread = nil
	end, self, meteor, target_pt, t_impact)
end

function OnMsg.SelectedObjChange(obj, prev)
	if IsKindOf(prev, "AttackRover") then
		WorkRadiusShownForRoverReasons = {} --when rover loses selection clean all other reasons, needed for when button corresponding handler doesn't fire.
		prev:ShowWorkRadius(false, "protect")
	end
	
	if IsKindOf(obj, "AttackRover") then
		if obj.reclaimed then
			obj:ShowWorkRadius(true, "protect")
		end
	end
end

function OnMsg.GatherFXActors(list)
	list[#list + 1] = "AttackRover"
end

if Platform.developer then

function TestAttackRover()
	ForEach{classes = "AttackRover", action = "delete"}
	PlaceObject("AttackRover", {spawn_pos = GetTerrainCursor()}) 
end

end