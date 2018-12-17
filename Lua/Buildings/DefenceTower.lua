local def_pitch_range = range(20*60, 80*60)

DefineClass.RocketProjectile = {
	__parents = { "FXRocket" },
	entity = "DefenceTurretRocket",
	move_thread = false,
	warm_up = 500,
	
	move_dir = false,
	start_speed = 40*guim, -- /s
	max_speed = 50*guim, -- /s
	pull = 5*guim, -- /ss
	target = false,
	shooter = false,
}

function RocketProjectile:Done()
	DeleteThread(self.move_thread)
end

function RocketProjectile:Place(pos, axis, angle)
	self.move_dir = RotateAxis(point(self.start_speed, 0, 0), axis, angle)
	
	self:SetPos(pos)
	
	axis, angle = ComposeRotation(axis_y, 90*60, axis, angle)	
	self:SetAxis(axis)
	self:SetAngle(angle)	
end

function RocketProjectile:StartMoving()
	if IsValidThread(self.move_thread) then
		return
	end
	self.move_thread = CreateGameTimeThread(function(self)
		self:Move()
		self.move_thread = nil
		DoneObject(self)
	end, self)
end

function DomeCollisionCheck(p1, p2)
	local domes = UICity.labels.Dome or empty_table
	local esCollision = EntitySurfaces.Collision
	for _, dome in ipairs(domes) do
		local glass = dome:GetAttach(dome.entity .. "_Glass")
		if IsValid(glass) then
			local hit, normal = IntersectRayWithObject(p1, p2, glass, esCollision)
			if hit then
				return dome, hit, normal
			end
		end
	end
end

function ProjectileDomeCollision(obj, p1, p2)
	local dome, hit, normal = DomeCollisionCheck(p1, p2)
	if not dome then
		return
	end
	PlayFX("MeteorDomeExplosion", "start", obj, nil, p2, p2 - p1)				
	PlayFX("MeteorHitDome", "start", dome, obj, hit, normal)
	dome:AddFracture("Small", hit)
	dome:HitByMeteor(obj)
	return true, dome
end

function RocketProjectile:Move()
	local tick = 50
	local pt = self:GetPos()
	if not pt:IsValidZ() then
		pt = pt:SetStepZ()
	end
	local dir = SetLen(self.move_dir, self.start_speed)
	local target = self.target
	
	-- todo: proper targeting spread
	-- for now just fly straight for a while then home into target
	local tStart = GameTime()
	local max_travel = MulDivRound(self.max_speed, tick, 1000)
	
	local fly_up_time = UICity:Random(4000, 6000)
	
	while IsValid(self) do
		local t = GameTime() - tStart + tick
		if t < fly_up_time then
			local next_pos = pt + MulDivRound(dir, t, 1000)		
			self:SetPos(next_pos, tick)
			Sleep(tick)
		elseif IsValid(target) and target:IsValidPos() then
			local target_pos = target:GetVisualPos():SetStepZ()
			local pos = self:GetVisualPos()
			
			if pos:z() <= terrain.GetHeight(pos) then
				-- somehow hit terrain, miss
				break
			end
						
			local v = target_pos - pos
			local dist = v:Len()
												
			local pull = SetLen(v, MulDivRound(self.pull, tick, 1000))
			
			dir = dir + pull
			local travel = dir:Len()
			if travel > max_travel then
				dir = SetLen(dir, max_travel)
			end
			
			local next_pos = pos + dir
						
			local dx, dy, dz = dir:xyz()
			local axis, angle

			if dx == 0 and dy == 0 then			
				-- dz should be negative, so just flip it over
				axis = axis_y
				angle = 180*60
			else
				axis = Cross(point(dx, dy, 0), axis_z)
				angle = asin(MulDivRound(dz, 4096, dir:Len())) - 90*60

			end						
									
			if travel >= dist then
				next_pos = pos
				tick = MulDivRound(tick, dist, travel)
				self:SetPos(pos, tick)
				self:SetAxis(axis, tick)
				self:SetAngle(angle, tick)
				Sleep(tick)
				self:HitTarget(target)
				break
			else				
				self:SetPos(next_pos, tick)
				self:SetAxis(axis, tick)
				self:SetAngle(angle, tick)
				Sleep(tick)
			end
			
			if ProjectileDomeCollision(self, pos, next_pos) then
				break
			end
		else
			break
		end
	end
	if IsValid(target) and target:IsValidPos() and self:GetVisualDist(target) <= HexGetHeight() / 2 then
		self:HitTarget(target)
	end
	PlayFX("MissileExplode", "start", self.shooter, nil, self:GetPos():SetStepZ())
end

function RocketProjectile:HitTarget(target)
	if IsKindOf(target, "Dome") then
		-- todo: use AddFracture similar to meteors, hook when having proper trajectory code so we can get impact pos/normal
	elseif IsKindOf(target, "Building") then
		local pos = target:GetPos()
		if DestroyBuildingImmediate(target) then
			PlayFX("MeteorDestruction", "start", target, nil, pos)
		end
	elseif IsKindOf(target, "AttackRover") then
		PlayFX("MeteorDestruction", "start", target)
		target:RocketDamage(self.shooter)
	elseif IsKindOf(target, "DroneBase") then
		PlayFX("MeteorDestruction", "start", target)
		if not target:IsDead() then
			target:SetCommand("Dead")
		end
	end
end

DefineClass.MeteorInterceptRocket = {
	__parents = { "RocketProjectile" },
	
	fx_actor_class = "RocketProjectile",
}

function MeteorInterceptRocket:Move()
	local meteor = self.target
	assert(IsKindOf(meteor, "BaseMeteor"))
	
	-- fly toward self.target_pt
	local time = Max(0, self.t_impact - GameTime())
	self:SetPos(self.target_pt, time)
	Sleep(time)
	
	Msg("MeteorIntercepted", meteor, self.shooter)
	meteor:ExplodeInAir()
end

DefineClass.MeteorInterceptParabolicRocket = {
	__parents = { "RocketProjectile" },
	
	fx_actor_class = "RocketProjectile",
}

function MeteorInterceptParabolicRocket:Move()
	local meteor = self.target
	assert(IsKindOf(meteor, "BaseMeteor"))
	
	local time = Max(0, self.t_impact - GameTime())
	local t = 0
	local tick = 20
	
	local pt = self:GetPos()
	local target_h = self.target_pt:z() - pt:z()
	
	local v = (self.target_pt - pt):SetZ(0)
	local v_norm = SetLen(v, 4096)
	local axis = SetLen(Cross(v_norm, axis_z), 4096)
	local len = v:Len2D()
	
	self:SetAxis(axis)
	self:SetAngle(0)
	
	local last_pt = pt
	
	while t < time do
		local next_pt, tSleep
		
		if t + tick < time then
			local hNext = MulDivRound(target_h, t, time)
			local distNext = MulDivRound(hNext*hNext, len, target_h*target_h)
			tSleep = tick
			next_pt = pt + MulDivRound(v, distNext, len):SetZ(hNext)
		else
			next_pt = self.target_pt
			tSleep = time - t
		end
		
		if next_pt ~= last_pt then
			local angle = asin(MulDivRound(4096, next_pt:z() - last_pt:z(), next_pt:Dist(last_pt)))
			self:SetAngle(angle-90*60, tSleep)
		end
		
		self:SetPos(next_pt, tSleep)
		Sleep(tSleep)
				
		last_pt = next_pt		
		t = t + tSleep
	end
	
	
	self:SetPos(self.target_pt, time)
	Sleep(time)
	
	Msg("MeteorIntercepted", meteor, self.shooter)
	meteor:ExplodeInAir()
end

-- todo: move the common facing/orientation code to a base class, this is copied from the laser

DefineClass.DefenceTower = {
	__parents = { "Building", "ElectricityConsumer" },
	properties =
	{
		{ template = true, category = "DefenceTower", name = T(671, "Hit Chance"),	id = "hit_chance",	editor = "number", default = 100, min = 0, max = 100, help = "The chance to hit a meteor" },
		{ template = true, category = "DefenceTower", name = T(672, "Fire Rate"),	id = "cooldown",		editor = "number", default = 5 * 1000, scale = 1000, help = "cooldown between shots in seconds(only useful during a meteor storm)" },
		
		{ template = true, category = "DefenceTower", name = T(673, "Protect Range"),	id = "protect_range",	editor = "number", default = 20, help = "If meteors would fall within dist range it can be destroyed by the laser (in hexes)" },
		{ template = true, category = "DefenceTower", name = T(674, "Shoot Range"),	id = "shoot_range", editor = "number", default = 500*guim, scale = guim, help = "Range at which meteors can be destroyed. Should be greater than the protection range (in hexes)" },
		{ template = true, category = "DefenceTower", name = T(675, "Pitch Range"), id = "pitch_range", editor = "range", default = def_pitch_range, scale = 60, help = "Range of the pitch angle for vertical adjustment (in Deg)" },
		
		{ template = true, category = "DefenceTower", name = T(676, "Rotate Speed"),id = "rot_speed",	editor = "number", default = 120 * 60, scale = 60, help = "Platform's rotation speed to target meteor in Deg/Sec" },
		{ template = true, category = "DefenceTower", name = T(677, "Beam Time"),	id = "beam_time",	editor = "number", default = 500, help = "For how long laser beam is visible(in ms)" },
		{ template = true, category = "DefenceTower", name = T(678, "Tilt Tolerance"),id = "tilt_tolerance",editor = "number", default = 2 * 60, scale = 60, help = "Allowed angle difference between the beam and shooting dir(in degrees)" },
		{ template = true, category = "DefenceTower", name = T(6750, "Reload Time"),id = "reload_time",editor = "number", default = const.HourDuration, scale = const.HourDuration },		
	},
	
	intercept_distance_percent = 80, -- blow up after the meteor travelled this portion of its whole trajectory; low numbers may cause it to hit domes before getting blown up
	intercept_reload_percent = 10, -- percentage of reload_time to sleep after firing a rocket at a meteor

	platform = false,
	tube = false,
	defence_thread = false,
	meteor = false,
	track_thread = false,
}

function DefenceTower:GameInit()
	local function prop()
		return self
	end
	
	local platform = self:GetAttach("DefenceTurretPlatform")
	if not platform then
		assert(false, "Laser Platform for rotation not present")
		return
	end
	rawset(platform, "SelectionPropagate", prop)
	local tube = platform:GetAttach("DefenceTurretTube")
	if not tube then
		assert(false, "Laser Tube for firing not present")
		return
	end
	rawset(tube, "SelectionPropagate", prop)
	
	self.platform = platform
	self.tube = tube
	
	platform:Detach()
	
	tube:SetAxis(axis_y)
		
	self.defence_thread = CreateGameTimeThread(function()
		while IsValid(self) and not self.destroyed do
			if self.working then				
				if not self:DefenceTick() then -- did nothing				
					Sleep(1000)
				end
			else
				Sleep(1000)
			end
		end
	end)
end

function DefenceTower:Done()
	if IsValidThread(self.track_thread) then
		DeleteThread(self.track_thread)
	end
	DoneObject(self.platform)
end

function DefenceTower:Destroy()
	if IsValid(self.platform) then
		local offset = self.platform:GetVisualPos() - self:GetPos()
		self:Attach(self.platform)
		self.platform:SetAttachOffset(offset)
	end
	if IsValid(self.tube) then
		local offset = self.tube:GetVisualPos() - self:GetPos()
		self:Attach(self.tube)
		self.tube:SetAttachOffset(offset)
	end
	Building.Destroy(self)
end

function DefenceTower:RebuildStart()
	self:ClearEnumFlags(const.efVisible)
	self.platform:ClearEnumFlags(const.efVisible)
end

function DefenceTower:RebuildCancel()
	self:SetEnumFlags(const.efVisible)
	self.platform:SetEnumFlags(const.efVisible)
end

function DefenceTower:SetDustVisualsPerc(perc)
	if not self.show_dust_visuals then return end
	BuildingVisualDustComponent.SetDustVisualsPerc(self, perc)
	
	local normalized_dust = MulDivRound(perc, 255, 100)

	if IsValid(self.platform) then
		ApplyToObjAndAttaches(self.platform, SetObjDust, normalized_dust)
	end
	if IsValid(self.tube) then
		ApplyToObjAndAttaches(self.tube, SetObjDust, normalized_dust)
	end
end

function DefenceTower:DefenceTick()
	local mystery = self.city.mystery
	if not mystery or mystery.class ~= "MarsgateMystery" or not mystery.can_shoot_rovers then
		return
	end
	local hostile = self.city.labels.HostileAttackRovers or empty_table
		
	-- if a track thread is running wait for it to finish
	if IsValidThread(self.track_thread) then
		return
	end
		
	for i = 1, #hostile do
		local obj = hostile[i]
		if IsValid(obj) and self:GetVisualDist2D(obj) <= self.shoot_range then
			self:OrientPlatform(obj:GetVisualPos(), 120*60)
			-- todo: proper orientation
			-- orient to target (mockup)
			--self.platform:Face(obj:GetVisualPos(), 1000)
			--self.tube:SetAngle(120*60, 1000)
			--Sleep(1000)
			
			if not IsValid(self) or not self.working or self.destroyed then return end
			
			-- fire
			self:FireRocket(nil, obj)
			
			-- recharge
			-- todo: anim?
			Sleep(self.reload_time)
			
			self.is_firing = false
			return true
		end
	end
end

function DefenceTower:FireRocket(spot, target, rocket_class, luaobj)
	local tube = self.tube
	
	if not spot then
		local first, last = tube:GetSpotRange("Projectile")
		spot = self:Random(first, last)
	end
	
	--local pos, angle, axis = tube:GetSpotLoc(spot)
	local pos = tube:GetSpotPos(spot)
	local angle, axis = tube:GetSpotRotation(spot)
		
	rocket_class = rocket_class or "RocketProjectile"
	luaobj = luaobj or {}
	luaobj.shooter = luaobj.shooter or self
	luaobj.target = luaobj.target or target
	local rocket = PlaceObject(rocket_class, luaobj)
	rocket:Place(pos, axis, angle)
	rocket:StartMoving()
	
	PlayFX("MissileFired", "start", self, nil, pos, rocket.move_dir)
	return rocket
end

function DefenceTower:Barrage(fire_delay)
	fire_delay = fire_delay or 200
	local tube = self.tube
	local first, last = tube:GetSpotRange("Projectile")
	local n = last - first + 1
	local order = {}
	for i = 1, n do
		order[i] = first + i - 1
	end
	table.shuffle(order)
	
	CreateGameTimeThread(function()
		for i = 1, n do
			self:FireRocket(order[i])
			Sleep(fire_delay)
		end
	end)
end

function DefenceTower:OrientPlatform(target, pitch)
	local pos = self:GetPos()
	local target_angle = CalcOrientation(pos, target)
	local da = AngleDiff(self.platform:GetAngle(), target_angle)
	local t = MulDivRound(1000, abs(da), self.rot_speed)
	
	if not pitch then
		local v = target - self.tube:GetVisualPos()
		pitch = -asin(MulDivRound(v:z(), 4096, v:Len()))
	end
	
	self.platform:Face(target, t)
	self.tube:SetAngle(pitch, t)
	Sleep(t)
end

function DefenceTower:IsExecuting()
	return IsValid(self.meteor)
end

function DefenceTower:CanHit(meteor)
	-- check rovers first
	local hostile = self.city.labels.HostileAttackRovers or empty_table

	for _, obj in ipairs(hostile) do
		if self:GetVisualDist2D(obj) <= self.shoot_range then
			return false -- busy dealing with rovers
		end
	end
	
	if not IsValid(meteor) or
		not self:CanWork() or
		self:IsExecuting() or
		IsValid(meteor.marked) and meteor.marked ~= self or
		IsValidThread(self.track_thread) or
		HexAxialDistance(self, meteor.dest) > self.protect_range
	then
		return false
	end
	return true
end

function DefenceTower:Track(meteor)
	local pos = meteor:GetVisualPos()
	local dir = meteor.dest - pos
		
	local target_pt = pos + MulDivRound(dir, self.intercept_distance_percent, 100)
	local t_impact = GameTime() + meteor:GetTimeToImpact(target_pt)

	meteor.marked = self
	self.meteor = meteor
		
	self.track_thread = CreateGameTimeThread(function(self, meteor, target_pt, t_impact)
		self:OrientPlatform(target_pt)
		self:FireRocket(false, meteor, "MeteorInterceptRocket", {target_pt = target_pt, t_impact = t_impact})
		Sleep(MulDivRound(self.reload_time, self.intercept_reload_percent, 100))

		self.track_thread = nil
	end, self, meteor, target_pt, t_impact)
end

function DefenceTower:GetSelectionRadiusScale()
	return self.protect_range
end