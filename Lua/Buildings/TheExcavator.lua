
DefineClass.TheExcavator = {
	__parents = {"Building", "ElectricityConsumer", "OutsideBuildingWithShifts", "ResourceProducer"},
	
	exploitation_resource = "Concrete",
	wasterock_stockpile_spots = {"Resourcepile2"},
	
	additional_stockpile_params2 = {
		apply_to_grids = false,
		has_platform = true,
		snap_to_grid = false,
		priority = 2,
		additional_supply_flags = const.rfSpecialDemandPairing
	},
	
	dig_anim_thread = false,
	dig_fx_thread = false,
	terrain_type = "Dig",
	terrain_type_idx = false,
	
	--digging animation is divided into "swipes" - the arm going left/right
	swipe_hangle = 140*60, --maximum horizontal angle the arm will reach
	swipe_vangle = 30, --how much the arm tilts down after each swipe
	swipe_speed = 2, --the speed at which swipe_progress is changed
	swipe_progress = 0, --progress for the current swipe (form -1000 to 1000)
	swipe_counter = 0, --number of swipes already finished
	swipe_max = 60, --number of swipes before the machine stops digging any deeper (but continues digging animation)
	
	tower = false,
	arm = false,
	arm_offset = 0, --length from the buildings origin to the arm's origin
	arm_length = 0, --length from the arms origin to the arm's end
	adjusted_arm_length = false, --as above, but adjusted to smooth out the outer edge of the hole
	arm_rope_dist = 0, --length from the arms origin to the end of the rope
	rope = false,
	belt = false,	
	use_shape_selection = false,
}

GlobalVar("OldExcavatorMineLocations", {})

function TheExcavator:GameInit()
	self.terrain_type_idx = table.find(TerrainTextures, "name", self.terrain_type)
	
	self.tower = self:GetAttach("ExcavatorTower")
	self.arm = self.tower:GetAttach("ExcavatorShovel")
	self.belt = self:GetAttach("ExcavatorBelt")
	self.belt:SetFrameAnimationSpeed(0)
	
	self.rope = PlaceObj("ExcavatorRope")
	self.tower:Attach(self.rope, self.tower:GetSpotBeginIndex("Rope2"))
	self.rope:SetAxis(axis_y)
	
	self.tower:SetAnim(1, "working")
	self.tower:SetAnimSpeed(1, 0)
	
	self.arm:SetAnim(1, "working")
	self.arm:SetAnimSpeed(1, 0)
	self.arm:SetAxis(axis_y)
	
	local build_origin = self:GetSpotPos(self:GetSpotBeginIndex("Origin"))
	local arm_origin = self.arm:GetSpotLoc(self.arm:GetSpotBeginIndex("Origin"))
	local arm_end = self.arm:GetSpotLoc(self.arm:GetSpotBeginIndex("End"))
	local arm_rope = self.arm:GetSpotLoc(self.arm:GetSpotBeginIndex("Rope"))
	self.arm_offset = build_origin:Dist2D(arm_origin)
	self.arm_length = arm_origin:Dist2D(arm_end)
	self.adjusted_arm_length = self.arm_length
	self.arm_rope_dist = arm_origin:Dist2D(arm_rope)
	
	self:UpdateRopeVisuals()
	
	--try to reuse old excavator mine
	local pos = self:GetPos()
	local angle = self:GetAngle()
	for i = 1, #OldExcavatorMineLocations do
		local old_mine = OldExcavatorMineLocations[i]
		if pos:Equal2D(old_mine.pos) and angle == old_mine.angle then
			self.swipe_counter = old_mine.swipe
			table.remove(OldExcavatorMineLocations, i)
			break
		end
	end
end

function TheExcavator:Done()
	table.insert(OldExcavatorMineLocations, {
		pos = self:GetPos(),
		angle = self:GetAngle(),
		swipe = self.swipe_counter,
	})
	
	DeleteThread(self.dig_anim_thread)
	DeleteThread(self.dig_fx_thread)
	if IsValid(self.arm) then
		DoneObject(self.arm)
	end
	if IsValid(self.tower) then 
		DoneObject(self.tower)
	end
	if IsValid(self.rope) then
		DoneObject(self.rope)
	end
	if IsValid(self.belt) then
		DoneObject(self.belt)
	end
	self.arm = nil
	self.tower = nil
	self.rope = nil
	self.belt = nil
end

function TheExcavator:OnSetWorking(working)
	ElectricityConsumer.OnSetWorking(self, working)
	OutsideBuildingWithShifts.OnSetWorking(self, working)
	ResourceProducer.OnSetWorking(self, working)
	Building.OnSetWorking(self, working)
	
	if working then
		if not IsValidThread(self.dig_anim_thread) then
			self.arm:SetAnimSpeed(1, 1000)
			self.tower:SetAnimSpeed(1, 1000)
			self.belt:SetFrameAnimationSpeed(1000)
			self.dig_fx_thread = TrackAllMoments(self.arm, "ExcavatorDigging", self.arm)
			self.dig_anim_thread = CreateGameTimeThread(function(self)
				repeat
					local done = self:DigAnimTick(1000)
					Sleep(1000)
				until done or not self.working
			end, self)
		end
	else
		if IsValidThread(self.dig_anim_thread) then
			self.arm:SetAnimSpeed(1, 0)
			self.tower:SetAnimSpeed(1, 0)
			self.tower:SetAngle(self.tower:GetVisualAngleLocal())
			self.belt:SetFrameAnimationSpeed(0)
			DeleteThread(self.dig_anim_thread)
			DeleteThread(self.dig_fx_thread)
			PlayFX("ExcavatorDigging", "end", self.arm)
		end
	end
end

function TheExcavator:GetDepositGrade()
	return "Average"
end

function TheExcavator:GetFlattenShape()
	return GetEntityOutlineShape("QuarryExcavator")
end

function TheExcavator:GetSupplyGridConnectionShapePoints(supply_resource)
	if supply_resource == "electricity" then
		return GetEntityCombinedShape("QuarryExcavator")
	end
	
	return self:GetShapePoints(supply_resource)
end

function TheExcavator:ForEachDigPoint(fn, ...)
	--arm dimensions
	local arm_width = 4 * guim --horizontal width
	local arm_radius = 4 * guim --digging depth of shovels
	local arm_length = self.adjusted_arm_length or self.arm_length --length
	
	--spots/points on the arm
	local arm_origin = self.arm:GetSpotLoc(self.arm:GetSpotBeginIndex("Origin")) --origin/pivot
	local arm_end = self.arm:GetSpotLoc(self.arm:GetSpotBeginIndex("End")) --end point
	local arm_diff = arm_end - arm_origin
	arm_end = arm_origin + MulDivRound(arm_diff, arm_length, self.arm_length) --adjusted end point
	
	--digging endpoints (used to calculate digging positions)
	local dig_start = arm_origin:AddZ(-arm_radius) --first digging point
	local dig_end = arm_end:AddZ(-arm_radius) --last digging point
	local len_pts = arm_length / guim --number of digging points
	local lerp = ValueLerp(dig_start, dig_end, len_pts)
	
	--normal/sideways vector of the arm (used to calculate digging positions)
	local arm_sin, arm_cos = sincos(self.tower:GetAngle())
	local arm_normal = point(arm_sin, -arm_cos)
	local arm_normal_x, arm_normal_y = arm_normal:xy()
	
	--normal distance (sideways offset)
	--depends on swipe direction (speed's sign) to optimize the number of terrain.SetHeight() calls
	local ndist = self.swipe_speed > 0 and -arm_width/2 or arm_width/2
	local noffset_x = MulDivRound(arm_normal_x, ndist, 4096) --component-wise offsets
	local noffset_y = MulDivRound(arm_normal_y, ndist, 4096) --component-wise offsets
	
	--do the actual digging
	for i=1,len_pts do
		local dig_pt = lerp(i)
		local dpx, dpy, dpz = dig_pt:xyz()
		local final_pt = point(dpx + noffset_x, dpy + noffset_y, dpz)
		fn(self, final_pt, ...)
	end
end

function TheExcavator:DoDigAndPaint(dig_point)
	terrain.SetHeightCircle(dig_point, guim, guim, dig_point:z(), const.hsMin)
	terrain.SetTypeCircle(dig_point, guim, self.terrain_type_idx)
end

function TheExcavator:DoDigOnly(dig_point)
	terrain.SetHeightCircle(dig_point, guim, guim, dig_point:z(), const.hsMin)
end

function TheExcavator:UpdateRopeVisuals()
	--stretch the rope in the new direction
	local rope_origin = self.rope:GetSpotLoc(self.rope:GetSpotBeginIndex("Origin"))
	local rope_end = self.arm:GetSpotLoc(self.arm:GetSpotBeginIndex("Rope"))
	
	local angle = atan(rope_end:z() - rope_origin:z(), rope_origin:Dist2D(rope_end))
	self.rope:SetAngle(angle + 180*60) -- +180 degrees because of the model/spot setup
	self.rope:SetZClip(rope_origin:Dist(rope_end))
end

function TheExcavator:DigAnimTick(dt)
	local arm_angle = self.swipe_counter * self.swipe_vangle
	
	self.swipe_progress = self.swipe_progress + self.swipe_speed
	if abs(self.swipe_progress) > 1000 then
		PlayFX("ChangeDirection", "start", self)
		self.swipe_speed = self.swipe_speed * -1
		if self.swipe_counter < self.swipe_max then
			self.swipe_counter = self.swipe_counter + 1
			--printf("swipe %d/%d", self.swipe_counter, self.swipe_max)
			
			--update arm_angle and the visualization
			arm_angle = self.swipe_counter * self.swipe_vangle
			self.arm:SetAngle(arm_angle, dt)
			
			--update adjusted arm length
			if self.adjusted_arm_length then --default=false, thus old saves will continue using non-adjusted length				
				local clamped_angle = Min(arm_angle, 5*60) --clamp up to 5 degrees
				local adjusted_angle = MulDivRound(clamped_angle, 90*60, 5*60) --map from 5 degrees to 90 degrees
				local length_decrease = MulDivRound(sin(adjusted_angle), 5*guim, 4096) --sin() will define the edges' shape
				self.adjusted_arm_length = self.arm_length - length_decrease
			end
		end
	end
	
	--this is used to create nice slopes at the ends of the swipes
	--for every 30 degrees the arm goes down, there is a 10 degrees decrease in swipe hangle
	local tower_angle_decrease = MulDivRound(arm_angle, 10*60, 30*60)
	local tower_angle = MulDivRound(self.swipe_progress, self.swipe_hangle - tower_angle_decrease, 1000)
	
	self.tower:SetAngle(tower_angle, dt)
	self:UpdateRopeVisuals()
	
	--after the final swipe there is no need to dig again, as the shovel arm will not go any lower
	if self.swipe_counter < self.swipe_max then
		if self.swipe_counter > 1 then
			--after the second swipe there's no need to repaint the floor. It should be fully repainted already.
			self:ForEachDigPoint(self.DoDigOnly)
		else
			self:ForEachDigPoint(self.DoDigAndPaint)
		end
	end
end

function OnMsg.GatherFXActors(list)
	list[#list + 1] = "ExcavatorShovel"
	list[#list + 1] = "TheExcavator"
end

function OnMsg.GatherFXTargets(list)
	list[#list + 1] = "ExcavatorShovel"
end

function OnMsg.GatherFXActions(list)
	list[#list + 1] = "ExcavatorDigging"
	list[#list + 1] = "ChangeDirection"
end

function OnMsg.GatherFXMoments(list)
	for i=1,12 do
		list[#list + 1] = "Hit"..i
		list[#list + 1] = "Out"..i
	end
end
