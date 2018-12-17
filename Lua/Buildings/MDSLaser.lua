local def_pitch_range = range(20*60, 80*60)

DefineClass.MDSLaser =
{
	__parents = { "ElectricityConsumer", "OutsideBuildingWithShifts" },	

	properties =
	{
		{ template = true, category = "MDSLaser", name = T(671, "Hit Chance"),	id = "hit_chance",	editor = "number", default = 100, min = 0, max = 100, help = "The chance to hit a meteor" },
		{ template = true, category = "MDSLaser", name = T(672, "Fire Rate"),	id = "cooldown",		editor = "number", default = 5 * 1000, scale = 1000, help = "cooldown between shots in seconds(only useful during a meteor storm)" },
		
		{ template = true, category = "MDSLaser", name = T(673, "Protect Range"),	id = "protect_range",	editor = "number", default = 20, help = "If meteors would fall within dist range it can be destroyed by the laser (in hexes)" },
		{ template = true, category = "MDSLaser", name = T(674, "Shoot Range"),	id = "shoot_range", editor = "number", default = 30, scale = guim, help = "Range at which meteors can be destroyed. Should be greater than the protection range (in hexes)" },
		{ template = true, category = "MDSLaser", name = T(675, "Pitch Range"), id = "pitch_range", editor = "range", default = def_pitch_range, scale = 60, help = "Range of the pitch angle for vertical adjustment (in Deg)" },
		
		{ template = true, category = "MDSLaser", name = T(676, "Rotate Speed"),id = "rot_speed",	editor = "number", default = 45 * 60, scale = 60, help = "Platform's rotation speed to target meteor in Deg/Sec" },
		{ template = true, category = "MDSLaser", name = T(677, "Beam Time"),	id = "beam_time",	editor = "number", default = 500, help = "For how long laser beam is visible(in ms)" },
		{ template = true, category = "MDSLaser", name = T(678, "Tilt Tolerance"),id = "tilt_tolerance",editor = "number", default = 2 * 60, scale = 60, help = "Allowed angle difference between the beam and shooting dir(in degrees)" },
		
	},
	
	platform = false,
	laser = false,
	beams = false,
	track_thread = false,
	cooldown_end = 0,
	meteor = false,
}

DefineClass.LaserBody = {
	__parents = { "Object" },
	enum_flags = { efWalkable = false, efCollision = false, efApplyToGrids = false },
	entity = "Shuttle",
}

function MDSLaser:GameInit()
	local platform = self:GetAttach("DefenceLaserPlatform")
	if not platform then
		assert(false, "Laser Platform for rotation not present")
		return
	end
	local tube = platform:GetAttach("DefenceLaserTube")
	if not tube then
		assert(false, "Laser Tube for firing not present")
		return
	end
	self.platform = platform
	self.tube = tube
	
	tube:SetAxis(axis_y)
	
	local starting_yaw = self:GetAngle()
	local starting_pitch = (self.pitch_range.to + self.pitch_range.from) / 2
	local rot_time = MulDivRound(1000, starting_pitch, self.rot_speed)
	self:SetLaserOrientation(0, starting_yaw)
	self:SetLaserOrientation(starting_pitch, starting_yaw, rot_time)

	local meteor = self:GetSoonestMeteor()
	if meteor then
		self:Track(meteor)
	end
end

function MDSLaser:SetLaserOrientation(pitch, yaw, time)
	local tube = self.tube
	if not IsValid(tube) then
		return
	end
	time = time or 0
	yaw = yaw - self:GetAngle()
	pitch = -pitch
	tube:SetAngle(pitch, time)
	self.platform:SetAngle(yaw, time)
end

function MDSLaser:GetLaserOrientation()
	local tube = self.tube
	if not IsValid(self.tube) then
		return 0, 0
	end
	return -tube:GetVisualAngleLocal(), self.platform:GetVisualAngle()
end

function MDSLaser:Done()
	DeleteThread(self.track_thread)
	if self.beams then
		for i=1,#self.beams do
			DoneObject(self.beams[i])
		end
		if IsValid(self.meteor) then
			PlayFX("Laser", "end", self, self.meteor)
		end
	end
	if self:GetCooldownLeft() > 0 then
		PlayFX("LaserCooldown", "end", self.tube)
	end
end	

function MDSLaser:GetShootDir()
	local tube = self.tube
	if not IsValid(tube) then
		return self:GetPos(), axis_x -- savegame compatibility
	end
	local vertex = tube:GetSpotPos(tube:GetSpotBeginIndex("Conusvertex"))
	local target = tube:GetSpotPos(tube:GetSpotBeginIndex("Conusdirection"))
	return vertex, target
end

function MDSLaser:IsExecuting()
	return IsValid(self.meteor)
end

function MDSLaser:CanHit(meteor)
	if not IsValid(meteor)
	or not self:CanWork()
	or self:IsExecuting()
	or self:GetCooldownLeft() > 0
	or IsValid(meteor.marked) and meteor.marked ~= self
	or HexAxialDistance(self, meteor.dest) > self.protect_range
	then
		return false
	end
	return true
 end

function MDSLaser:GetSoonestMeteor()
	local soonest_time, soonest_meteor = max_int
	for _, meteor in ipairs(g_MeteorsPredicted) do
		local time = self:CanHit(meteor) and meteor:GetTimeToImpact() or max_int
		if soonest_time > time then
			soonest_time = time
			soonest_meteor = meteor
		end
	end
	for missile in pairs(g_IncomingMissiles or empty_table) do
		local time = self:CanHit(missile) and missile:GetTimeToImpact() or max_int
		if soonest_time > time then
			soonest_time = time
			soonest_meteor = missile
		end
	end
	return soonest_meteor, soonest_time
end

function MDSLaser:GetCooldownLeft()
	return Max(0, self.cooldown_end - GameTime())
end

function MDSLaser:Track(meteor)
	meteor.marked = self
	self.meteor = meteor
	self.track_thread = CreateGameTimeThread(function(self, meteor)
		local min_picth, max_pitch = self.pitch_range.from, self.pitch_range.to
		local rot_speed = self.rot_speed
		local tilt_tolerance = self.tilt_tolerance
		local shoot_range = self.shoot_range * const.GridSpacing
		local reaction_time = 100
		while true do
			local intercepted
			local pos = meteor:GetVisualPos()
			while IsValid(meteor) do
				local origin, target = self:GetShootDir()
				if self:IsCloser(pos, shoot_range) and CalcAngleBetween(pos - origin, target - origin) <= tilt_tolerance then
					intercepted = true
					break
				end
				pos = meteor:GetVisualPos(reaction_time)
				local vector = pos - origin
				local len = vector:Len()
				if len == 0 then
					break
				end
				local pitch0, yaw0 = self:GetLaserOrientation()
				local yaw1 = atan(vector)
				local yaw_rot = AngleDiff(yaw1, yaw0)
				local yaw_time = MulDivRound(1000, abs(yaw_rot), rot_speed)
				local pitch1 = Clamp(asin(MulDivRound(vector:z(), 4096, len)), min_picth, max_pitch)
				local pitch_rot = AngleDiff(pitch1, pitch0)
				local pitch_time = MulDivRound(1000, abs(pitch_rot), rot_speed)
				local time = Max(pitch_time, yaw_time)
				self:SetLaserOrientation(pitch1, yaw1, time)
				Sleep(reaction_time)
			end
			-- stop interpolation
			self:SetLaserOrientation(self:GetLaserOrientation())
			if IsValid(meteor) and intercepted then
				-- fire
				local origin = self:GetShootDir()
				local vector = pos - origin
				local total_len = vector:Len()
				if total_len > 0 then
					PlayFX("Laser", "start", self, meteor, origin, vector)
					local beam = PlaceObject("DefenceLaserBeam")
					local beam_len = beam:GetEntityBBox():max():z()
					local beam_offset = point(0, 0, beam_len)
					local beams = {}
					self.beams = beams
					local added_len = 0
					local next_pos = origin
					local axis, angle = GetAxisAngle(axis_z, vector)
					while true do
						beams[#beams + 1] = beam
						beam:SetPos(next_pos)
						beam:SetAxisAngle(axis, angle)
						added_len = added_len + beam_len
						if added_len >= total_len then
							beam:SetZClip(beam_len - (added_len - total_len))
							break
						end
						next_pos = beam:GetRelativePoint(beam_offset)
						beam = PlaceObject("DefenceLaserBeam")
					end
					if self:Random(100) < self.hit_chance then
						Msg("MeteorIntercepted", meteor, self)
						meteor:ExplodeInAir()
					end
					Sleep(self.beam_time)
					for i=1,#beams do
						DoneObject(beams[i])
					end
					self.beams = false
					PlayFX("Laser", "end", self, meteor)
					-- cooldown
					PlayFX("LaserCooldown", "start", self.tube)
					self.cooldown_end = GameTime() + self.cooldown
					Sleep(self.cooldown)
					PlayFX("LaserCooldown", "end", self.tube)
				end
			end
			self.meteor = false
			local new_meteor = self:GetSoonestMeteor()
			meteor.marked = nil
			meteor = new_meteor
			if not meteor then
				break
			end
			self.meteor = meteor
			meteor.marked = self
		end
		self.track_thread = false
	end, self, meteor)
end

function MDSLaser:GetSelectionRadiusScale()
	return self.protect_range
end

local function SeekAndDestroy(obj)
	assert(IsKindOf(obj, "BaseMeteor"), "Invalid object to track!")
	local lasers = UICity.labels.MDSLaser or empty_table
	local soonest_laser, min_rot_time = nil, max_int
	for _, laser in ipairs(lasers) do
		if laser:CanHit(obj) then
			local origin, target = laser:GetShootDir()
			local yaw_angle = CalcAngleBetween(obj.dest - origin, target - origin)
			local rot_time = MulDivTrunc(yaw_angle, 1000, laser.rot_speed)
			if min_rot_time > rot_time then
				soonest_laser = laser
				min_rot_time = rot_time
			end
		end
	end
	
	if not soonest_laser then
		local towers = UICity.labels.DefenceTower or empty_table
		for _, tower in ipairs(towers) do
			if tower:CanHit(obj) then
				soonest_laser = tower
				break
			end
		end
	end

	if not soonest_laser then
		local rovers = UICity.labels.Rover or empty_table
		for _, rover in ipairs(rovers) do
			if IsKindOf(rover, "AttackRover") and rover.reclaimed and rover:CanHit(obj) then
				soonest_laser = rover
				break
			end
		end
	end

	if soonest_laser then
		soonest_laser:Track(obj)
	end
end

function OnMsg.Meteor(meteor)
	SeekAndDestroy(meteor)
end

function OnMsg.IncomingMissile(missile)
	SeekAndDestroy(missile)
end

function OnMsg.GatherFXActors(list)
	list[#list + 1] = "MDSLaser"
end
function OnMsg.GatherFXActions(list)
	list[#list + 1] = "Laser"
	list[#list + 1] = "LaserCooldown"
end