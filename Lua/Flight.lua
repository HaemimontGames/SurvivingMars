GlobalVar("Flight_ObjsToMark", false)
GlobalVar("Flight_ObjToUnmark", false)
GlobalVar("Flight_MarkedObjs", false)
GlobalVar("Flight_MarkThread", {})
GlobalVar("Flight_OrigHeight", false)
GlobalVar("Flight_Height", false)
GlobalVar("Flight_Traject", false)

GlobalVar("FlyingObjs", {})
GlobalVar("FlightId", 0)

GlobalVar("Flight_MoveCost", false)
GlobalVar("Flight_CalcId", 0)
GlobalVar("Flight_CalcList", {})
GlobalVar("Flight_CalcThread", false)
 -- don't save this, we can rebuild it
PersistableGlobals.Flight_Height = nil
PersistableGlobals.Flight_OrigHeight = nil
PersistableGlobals.Flight_Traject = nil
PersistableGlobals.Flight_MoveCost = nil
PersistableGlobals.Flight_CalcThread = nil

local unpack = table.unpack
local type_tile = terrain.TypeTileSize()
local work_step = 16 * type_tile
local mark_step = 16 * type_tile
local grid_scale = const.GridScale
local height_scale = const.TerrainHeightScale
local slope_penality_angle = 25*60
local slope_penality_tan = MulDivRound(4096, sincos(slope_penality_angle))
local mark_falloff = 40
local unity = 1024
local gravity = 3711
local mark_flags = const.efWalkable + const.efApplyToGrids + const.efCollision
local min_mark_height = 10*guim
local max_mark_height = 100*guim
local InvalidZ = const.InvalidZ
local min_obj_size = 4*guim
local IsValid = IsValid
local IsValidPos = CObject.IsValidPos
local GetEnumFlags = CObject.GetEnumFlags
local IsValidEntity = IsValidEntity
local developer = Platform.developer

function OnMsg.PersistGatherPermanents(permanents)
	-- avoid trying to save a C function
	permanents["CObject.GetEnumFlags"] = CObject.GetEnumFlags
	permanents["CObject.IsValidPos"] = CObject.IsValidPos
	permanents["IsValidEntity"] = IsValidEntity
	permanents["IsValid"] = IsValid
end

local function Flight_NewGrid(step, packing)
	local mw, mh = terrain.GetMapSize()
	local work_size = mw / (step or work_step)
	return grid(work_size, packing or 32)
end

local function TrajectMark(spline)
	return spline and Flight_MarkPathSpline(Flight_Traject, spline, mark_step)
end
local function TrajectUnmark(spline)
	return spline and Flight_UnmarkPathSpline(Flight_Traject, spline, mark_step)
end
local function TrajectCheck(spline)
	return spline and Flight_CheckPathSpline(Flight_Traject, spline, mark_step)
end

local function Flight_Init()
	if not Flight_OrigHeight then
		Flight_OrigHeight = Flight_NewGrid()
		terrain.GetHeightGrid(Flight_OrigHeight, work_step, terrain.IsHeightChanged())
	end
	if not Flight_Height then
		Flight_Height = Flight_OrigHeight:clone()
		if Flight_MarkedObjs then
			for obj in pairs(Flight_MarkedObjs) do
				if not Flight_ObjToUnmark[obj] then
					Flight_ObjsToMark[obj] = true
				end
			end
		else
			Flight_ObjsToMark = setmetatable({}, weak_keys_meta)
			ForEach{
				enum_flags_any = mark_flags,
				attached = false,
				exec = function(obj) Flight_ObjsToMark[obj] = true end
			}
		end
		Flight_ObjToUnmark = {}
		Flight_MarkedObjs = setmetatable({}, weak_keys_meta)
		MarkThreadProc()
	end
	if not Flight_Traject then
		Flight_Traject = Flight_NewGrid(mark_step, 16)
		ForEach{class = "FlyingObject", exec = function(obj)
			if obj.idle_mark_pos then
				Flight_Traject:AddCircle(1, obj.idle_mark_pos, mark_step, obj.collision_radius)
			end
			TrajectMark(obj.current_spline)
			TrajectMark(obj.next_spline)
		end}
	end
end

local function Flight_StartComputeThread()
	if IsValidThread(Flight_CalcThread) then
		return
	end
	Flight_CalcThread = CreateMapRealTimeThread(function()
		while true do
			local calc = Flight_CalcList[1]
			if calc then
				local obj, start, finish, id = table.unpack(calc)
				--print("Flight_FindSmoothPath CALC START", id)
				local compute_err, spline_path = Flight_FindSmoothPath(obj, start, finish)
				--print("Flight_FindSmoothPath CALC END", id)
				Msg(calc, compute_err, spline_path)
				table.remove(Flight_CalcList, 1)
			else
				WaitWakeup()
			end
		end
	end)
end

function Flight_GetMoveCost()
	local cost = Flight_MoveCost
	if not cost then
		Flight_Init()
		cost = Flight_Height:slope(4096 * height_scale, work_step)
		cost:max_i(0, 1)
		cost:div_i(slope_penality_tan, 1)
		cost:add_i(1, 1)
		Flight_MoveCost = cost
	end
	return cost
end

function Flight_FindSmoothPath(obj, start, finish)
	if IsGameTimeThread() then
		Flight_StartComputeThread()
		Flight_CalcId = Flight_CalcId + 1
		local id = Flight_CalcId
		local requested = {obj, start, finish, id}
		local queue = Flight_CalcList or {}
		if #queue == 0 then
			-- wakeup the async op thread only if no computation is in process (otherwise it would break the async op logic)
			Wakeup(Flight_CalcThread)
			Flight_CalcList = queue
		end
		queue[#queue + 1] = requested
		--print("Flight_FindSmoothPath REQUEST", id)
		local wait_success, compute_err, spline_path = WaitMsg(requested)
		--print("Flight_FindSmoothPath FINISH", id)
		if not wait_success then
			return "failed"
		end
		return compute_err, spline_path
	end
	local cost = Flight_GetMoveCost()
	local border = Max(0, mapdata.PassBorder - work_step)
	return AsyncFindSmoothPath(obj, start, finish, cost, border)
end

function MarkThreadProc()
	local start_time = GetPreciseTicks()
	local unmarked, marked = 0, 0
	local Flight_ObjToUnmark = Flight_ObjToUnmark
	local Flight_ObjsToMark = Flight_ObjsToMark
	local Flight_MarkedObjs = Flight_MarkedObjs
	local Flight_Height = Flight_Height
	local GetHeight = terrain.GetHeight
	local mask
	for obj in pairs(Flight_ObjToUnmark) do
		local info = Flight_MarkedObjs[obj]
		assert(info)
		if info then
			local x, y, r = unpack(info)
			for obji, infoi in pairs(Flight_MarkedObjs) do
				if obji ~= obj and IsValid(obji) and not Flight_ObjsToMark[obji] then
					local xi, yi, ri = unpack(infoi)
					if IsCloser2D(x, y, xi, yi, r + ri) then
						Flight_ObjsToMark[obji] = true
					end
				end
			end
			mask = mask or Flight_NewGrid()
			mask:SetCircle(grid_scale, x, y, work_step, r)
			unmarked = unmarked + 1
		end
		Flight_ObjToUnmark[obj] = nil
		Flight_MarkedObjs[obj] = nil
	end
	if mask and not mask:empty() then
		Flight_Height:mulinv_i(mask)
		mask:mul_i(Flight_OrigHeight)
		Flight_Height:add_i(mask)
		mask:free()
	end

	for obj in pairs(Flight_ObjsToMark) do
		if IsValid(obj) and IsValidPos(obj) then
			local info = Flight_MarkedObjs[obj]
			local x, y, r, h
			if info == nil then
				local minx, miny, minz, maxx, maxy, maxz = ObjectHierarchyBBox(obj, mark_flags, true)
				h = maxz or InvalidZ
				if h ~= InvalidZ and (maxx - minx > min_obj_size or maxy - miny > min_obj_size or maxz - minz > min_obj_size) then
					x = (minx + maxx) / 2
					y = (miny + maxy) / 2
					local ground = GetHeight(x, y)
					if maxz > ground + min_mark_height and minz < ground + max_mark_height then
						h = maxz
						r = Max(maxx - minx, maxy - miny) / 2 + (work_step - 1) / 2
						info = {x, y, r, h}
					end
				end
			elseif info then
				x, y, r, h = unpack(info)
			end
			if info then
				local f = MulDivRound(r, mark_falloff, 100)
				Flight_Height:MaxCircle(h * grid_scale, x, y, work_step, r - f, r)
				Flight_MarkedObjs[obj] = info
				marked = marked + 1
			end
		end
		Flight_ObjsToMark[obj] = nil
	end
	
	if marked > 0 or unmarked > 0 then
		Flight_MoveCost = false
	end
	
	--print("work_time", GetPreciseTicks() - start_time, "marked", marked, "unmarked", unmarked)
end

function OnMsg.NewMapLoaded()
	Flight_Init()
end

local function MarkThreadStart()
	if IsValidThread(Flight_MarkThread) then
		Wakeup(Flight_MarkThread)
		return
	end
	Flight_MarkThread = CreateGameTimeThread(function()
		Flight_Init()
		while true do
			MarkThreadProc()
			WaitWakeup()
		end
	end)
end

local function Flight_IsMarkable(obj)
	return IsValid(obj) and GetEnumFlags(obj, mark_flags) ~= 0 and IsValidEntity(obj:GetEntity())
end

function Flight_Mark(obj)
	if not Flight_IsMarkable(obj) or Flight_ObjsToMark[obj] or not IsValidPos(obj) then
		return
	end
	if Flight_ObjToUnmark[obj] then
		Flight_ObjToUnmark[obj] = nil
	end
	if Flight_MarkedObjs[obj] then
		return
	end
	Flight_ObjsToMark[obj] = true
	MarkThreadStart()
end

function Flight_Unmark(obj)
	if Flight_ObjToUnmark[obj] then
		return
	end
	Flight_ObjsToMark[obj] = nil
	if not Flight_MarkedObjs[obj] then
		return
	end
	Flight_ObjToUnmark[obj] = true
	MarkThreadStart()
end

function Flight_Remark(obj)
	if not Flight_IsMarkable(obj) then
		return
	end
	if Flight_MarkedObjs[obj] then
		Flight_ObjToUnmark[obj] = true
	end
	Flight_ObjsToMark[obj] = true
	MarkThreadStart()
end

function Flight_GetHeight(mx, my)
	return Flight_Height:GetBilinear(mx, my, work_step, 0, 1)
end

DefineClass.FlyingObject = {
	__parents = { "FXObject", "Object", "CommandObject", "ComponentAttach", "ComponentEx" },
	enum_flags = { efWalkable = false, efApplyToGrids = false, efCollision = false },
	
	flight_id = 0,
	idle_mark_pos = false,
	
	-- collision params:
	collision = false,
	to_avoid = false,
	avoid_id = 0,
	avoid_count = 0,
	avoid_level = 0,
	avoid_height = 20*guim,
	collision_radius = 20*guim,
	can_avoid = true,
	maneuver_time = 4000,
	
	-- move params:
	current_spline = false,
	next_spline = false,
	accel_dist = 40*guim,
	decel_dist = 80*guim,
	max_speed = 50*guim,
	min_speed = 4*guim,
	max_yaw_speed = 50*60,
	max_roll_speed = 30*60,
	roll_modifier = 100,
	turn_slow_down = 30,
	pitch_height_adjust = 20*guim,
	pitch_speed_adjust = 50,
	pitch_modifier = 100,
	thrust_max = 40*guim,
	thrust_modifier = 100,
	thrust_frict = 100,
	hover_height = 30*guim,
	min_hover_height = 10*guim,
	step = 8*guim,
	max_sleep = 333,
	starting_angle_error = 10 * 60,
	
	-- path params:
	start_pos = false,
	start_dir = false,
	end_pos = false,
	end_dir = false,
	dist_to_target = false,
	move_cost = false,
	mass = 4 * unity,
	friction = unity / 3,
	unity = unity,
	target_ref_dist = 320*guim,
	target_min_dist = 32*guim,
	avg_spline_dist = 80*guim,
	tangent = 6,
	max_points = 512,
	complete = true,
	fix_loops = true,
	reach_target = true,
	dont_splinify = false,
}

local DbgSetText = empty_func
local DbgInit = empty_func

function FlyingObject:Init()
	FlightId = FlightId + 1
	self.flight_id = FlightId
	self.to_avoid = setmetatable({}, weak_keys_meta)
	DbgInit(self)
	--DbgSetText(self, self.flight_id)
end

function FlyingObject:Done()
	self:SetSpline(false)
	self:IdleMark(false)
end

function Flight_DrawAvoidance()
	DbgClearVectors()
	for i=1,#FlyingObjs do
		local obj = FlyingObjs[i]
		local pos = obj:GetVisualPos()
		for obj_i in pairs(obj.to_avoid or empty_table) do
			if IsValid(obj_i) then
				DbgAddVector(pos, obj_i:GetVisualPos() - pos, red)
			end
		end
	end
end

function FlyingObject:IdleMark(mark)
	local prev_pos = self.idle_mark_pos
	local new_pos = mark and self:GetPos() or nil
	if prev_pos then
		if new_pos and new_pos:Equal2D(prev_pos) then
			return
		end
		if developer then
			local min, max = Flight_Traject:CheckCircle(0, prev_pos, mark_step, self.collision_radius)
			assert(min >= 1, "Flight traject grid corruption")
		end
		Flight_Traject:AddCircle(-1, prev_pos, mark_step, self.collision_radius, 0, 0)
	end
	if mark then
		Flight_Traject:AddCircle(1, new_pos, mark_step, self.collision_radius)
	end
	self.idle_mark_pos = new_pos
end

function FlyingObject:CheckCollisions()
	Flight_CheckCollisions(self, FlyingObjs)
	return max_int -- backward compat
end

--[[
local function Flight_CheckCollisions_Lua(self)
	if not self.collision then
		return
	end
	assert(self.can_avoid)
	local avoid_id = self.avoid_id
	avoid_id = avoid_id + 1
	self.avoid_id = avoid_id 
	local collision_radius = self.collision_radius
	local avg_spline_dist = self.avg_spline_dist
	local maneuver_time = self.maneuver_time
	local FlyingObjs = FlyingObjs
	local Flight_IsAvoiding = Flight_IsAvoiding
	local Max = Max
	local IsValid = IsValid
	
	for i=1,#FlyingObjs do
		local obj = FlyingObjs[i]
		local coll_time, coll_x, coll_y, coll_priority = Flight_GetCollisionTime(
			self, obj,
			collision_radius + obj.collision_radius,
			avg_spline_dist + obj.avg_spline_dist,
			maneuver_time)
		if coll_time then
			local to_avoid = self.to_avoid
			if to_avoid and to_avoid[obj] then
				to_avoid[obj] = avoid_id
			elseif not Flight_IsAvoiding(obj, self) then
				local obj1, obj2, to_avoid1, avoid_id1  = self, obj, to_avoid, avoid_id
				if not coll_priority and obj.can_avoid then
					obj1, obj2, to_avoid1, avoid_id1 = obj, self, obj.to_avoid, obj.avoid_id
				end
				to_avoid1[obj2] = avoid_id1
				--print(obj1.flight_id, "starts avoiding", obj2.flight_id)
			end
		end
	end
	local avoid_count, avoid_level = 0, 0
	for obj, id in pairs(self.to_avoid or empty_table) do
		if IsValid(obj) and id == avoid_id then
			avoid_count = Max(avoid_count, 1 + obj.avoid_count)
			avoid_level = Max(avoid_level, obj.avoid_height + obj.avoid_level)
		else
			to_avoid[obj] = nil
			--print(self.flight_id, "stops avoiding", obj.flight_id)
		end
	end
	self.avoid_count = avoid_count
	self.avoid_level = avoid_level
	return avoid_count, avoid_level
end

function FlyingObject:CheckCollisions()
	local avoid_count, avoid_level = Flight_CheckCollisions(self, FlyingObjs)
	local avoid_count1, avoid_level1 = Flight_CheckCollisions_Lua(self)
	assert(avoid_count1 == avoid_count and avoid_level1 == avoid_level)
	return max_int -- backward compat
end
--]]

function FlyingObject:ClearAvoidInfo()
	table.clear(self.to_avoid)
	self.avoid_id = 0
	self.avoid_count = 0
	self.avoid_level = 0
end

function FlyingObject:SetSpline(current_spline, next_spline)
	current_spline = current_spline or false
	next_spline = next_spline or false
	if current_spline == self.current_spline and next_spline == self.next_spline then
		return
	end
	
	TrajectUnmark(self.current_spline)
	TrajectUnmark(self.next_spline)
	
	if self.can_avoid then
		local collision = TrajectCheck(current_spline) or TrajectCheck(next_spline) or false
		if self.collision ~= collision then
			self.collision = collision
			self:ClearAvoidInfo()
		end
	end
	
	self.current_spline = current_spline
	self.next_spline = next_spline
	
	TrajectMark(current_spline)
	TrajectMark(next_spline)
end

function FlyingObject:CalcPath(pt1, pt2)
	local err, spline_path = Flight_FindSmoothPath(self, pt1, pt2)
	if err then
		assert(false, "Failed to compute flying trajectory: " .. err)
	end
	if not spline_path or #spline_path == 0 then
		local dir = pt2 - pt1
		spline_path = {{BS3_CreateSmoothSpline2D(pt1, dir, pt2, -dir)}}
	elseif not pt2:Equal2D(spline_path[#spline_path][4]) then
		local pos = spline_path[#spline_path][4]
		local dir = -spline_path[#spline_path][3]
		spline_path[#spline_path + 1] = {BS3_CreateSmoothSpline2D(pos, dir, pt2, pos - pt2)}
	end
	--Flight_DrawTraject(spline_path)
	return spline_path
end

function FlyingObject:ReversePath(path)
	for i=1,#path do
		table.reverse(path[i])
	end
	table.reverse(path)
end

function FlyingObject:GetLogicalPos()
	local pos = self:GetPos()
	if self:IsValidPos() then
		pos = pos:SetTerrainZ()
	end
	return pos
end

function FlyingObject:WaitFollowPath(path)
	if not path or not path[1][1] then
		return
	end
	self:SetCommand("FollowPathCmd", path)
	WaitMsg(self)
end

function FlyingObject:FollowPathDstr()
	self:SetSpline(false)
	if IsValid(self) then
		self:SetAcceleration(0) -- clear acceleration
		self:SetPos(self:GetVisualPosXYZ()) -- clear interpolation info
	end
	if FlyingObjs[self] then
		FlyingObjs[self] = nil
		table.remove_entry(FlyingObjs, self)
	end
	self:OnMoveEnd()
	self:OnMoveEnd()
	Msg(self)
end

function FlyingObject:FollowPathCmd(path)
	if not IsValid(self) or not IsValidPos(self) then
		assert(false, "Invalid flying object")
		return
	end
	self:PushDestructor(self.FollowPathDstr)
	local curr_thread = CurrentThread()
	local prev_thread = FlyingObjs[self]
	if not prev_thread then
		FlyingObjs[#FlyingObjs + 1] = self
	elseif prev_thread ~= curr_thread then
		assert(false, "Command error")
		DeleteThread(prev_thread)
	end
	FlyingObjs[self] = curr_thread
	local hover_height = self.hover_height
	local last_pos = path[#path][4]
	local first_pos = path[1][1]
	local dir = BS3_GetSplineDir2D(path[1])
	local angle = atan(dir)
	local my_pos = self:GetPos()
	local my_angle = self:GetAngle()
	local spline = path[1]
	local spline_idx = 1
	local spline_coef = 0
	if my_pos == InvalidPos() then
		local x, y = first_pos:xy()
		local z = Flight_GetHeight(x, y) + hover_height
		self:SetPos(x, y, z)
		self:SetAngle(angle)
	elseif first_pos:Equal2D(my_pos) then
		local da = abs(AngleDiff(angle, my_angle))
		local rotation_time = MulDivRound(1000, da, self.max_yaw_speed)
		self:SetAngle(angle, rotation_time)
		if da > self.starting_angle_error then
			self:OnRotationStart()
			rotation_time = MulDivRound(rotation_time, da - self.starting_angle_error, da)
			Sleep(rotation_time)
			self:OnRotationEnd()
		end
	else
		local dist = my_pos:Dist2D(first_pos)
		local start_dir = RotateRadius(dist, my_angle)
		spline = {BS3_CreateSmoothSpline2D(my_pos, start_dir, first_pos, -dir)}
		spline_idx = 0
	end
	local thrust_max = self.thrust_max
	local thrust_modifier = self.thrust_modifier
	local thrust_frict = self.thrust_frict
	local accel_dist = self.accel_dist
	local decel_dist = self.decel_dist
	local min_speed = self.min_speed
	local max_speed = self.max_speed
	local pitch_modifier = self.pitch_modifier
	local pitch_speed_adjust = self.pitch_speed_adjust
	local pitch_height_adjust = self.pitch_height_adjust
	local roll_modifier = self.roll_modifier
	local max_roll_speed = self.max_roll_speed
	local step = self.step
	local max_sleep = self.max_sleep
	local turn_slow_down = self.turn_slow_down
	local len = BS3_GetSplineLengthEst(spline)
	assert(len > 0)
	local advance_max = len > 0 and Max(1, 4096 * step / len) or 1
	local min_hover_height = self.min_hover_height
	assert(hover_height >= min_hover_height)
	min_hover_height = Min(min_hover_height, hover_height)
	
	self:SetSpline(spline, path[spline_idx + 1])
	self:OnMoveStart()
	
	local time
	while IsValid(self) and (spline_idx ~= #path or spline_coef < 4096) do
		do
			local Min, Max = Min, Max
			local atan = atan
			local MulDivRound = MulDivRound
			local time_now = now()
			local allowed_speed_max = self:CheckCollisions()
			local advance = advance_max
			local step_reduced
			local x1, y1, x0, y0, z0, vx, vy, vz, speed_xy
			local angle_diff, roll0, pitch0, yaw0, yaw, ground_pitch
			local new_speed, accel, ground_height, step_dist
			while true do
				local new_spline_idx = spline_idx
				local new_spline_coef = spline_coef + advance
				while new_spline_coef > 4096 do
					new_spline_coef = new_spline_coef - 4096
					new_spline_idx = new_spline_idx + 1
				end
				if new_spline_idx > #path or new_spline_idx == #path and new_spline_coef > (4096 - advance /2) then
					new_spline_idx = #path
					new_spline_coef = 4096
				end
				local new_spline = new_spline_idx ~= spline_idx and path[new_spline_idx] or spline
				local dirx, diry
				x1, y1, dirx, diry = BS3_GetSplinePosDir2D(new_spline, new_spline_coef)
				ground_height = Flight_GetHeight(x1, y1)
				x0, y0, z0 = self:GetVisualPosXYZ()
				local ground_denivelation = ground_height - Flight_GetHeight(x0, y0)
				step_dist = self:GetVisualDist2D(x1, y1)
				ground_pitch = -atan(ground_denivelation, step_dist)
				yaw = atan(diry, dirx)
				roll0, pitch0, yaw0 = GetRollPitchYaw(self)
				angle_diff = AngleDiff(yaw, yaw0)
				local turn_slow_down_factor = MulDivRound(turn_slow_down, abs(angle_diff), 90 * 60)
				local allowed_speed = Min(allowed_speed_max, MulDivRound(max_speed, 100 - turn_slow_down_factor, 100))
				local pitch_speed_factor = MulDivRound(pitch_speed_adjust, ground_pitch, 90*60)
				allowed_speed = allowed_speed + MulDivRound(allowed_speed, pitch_speed_factor, 100)
				if new_spline_idx >= #path - 1 and self:IsCloser2D(last_pos, decel_dist) then
					local dist_to_target = self:GetVisualDist2D(last_pos)
					local decel_speed = MulDivRound(max_speed, dist_to_target, decel_dist)
					allowed_speed = Min(allowed_speed, decel_speed)
				end
				local stop
				if new_spline_idx == #path then
					local stop_speed = MulDivRound(max_speed, 4096 - new_spline_coef, 4096)
					allowed_speed = Min(allowed_speed, stop_speed)
					stop = new_spline_coef == 4096
				end
				vx, vy, vz = self:GetVelocityVector(time_now, true, true)
				speed_xy = sqrt(vx * vx + vy * vy)
				local delta_speed = MulDivRound(max_speed - speed_xy, step_dist, accel_dist)
				new_speed = stop and 0 or Max(min_speed, Min(speed_xy + delta_speed, allowed_speed))
				accel, time = self:GetAccelerationAndTime(x1, y1, z0, new_speed, speed_xy)
				if time < max_sleep or step_reduced then
					assert(time < 30000, "Movement too slow!")
					spline_coef = new_spline_coef
					if new_spline_idx ~= spline_idx then
						spline_idx = new_spline_idx
						spline = new_spline
						len = BS3_GetSplineLengthEst(spline)
						advance_max = Max(1, 4096 * step / len)
						self:SetSpline(spline, path[spline_idx + 1])
					end
					break
				end
				step_reduced = true
				local new_time = (time < 2*max_sleep) and (time/2) or max_sleep
				advance = MulDivRound(advance, new_time, time)
			end
			local ground_offset = self.avoid_level + hover_height + MulDivRound(pitch_height_adjust, abs(ground_pitch), 90*60)
			local z1 = ground_height + ground_offset
			self:SetAcceleration(accel)
			local time_adjust = 100
			local thrust = z1 - z0
			if thrust > 0 then
				thrust = Min(MulDivRound(thrust, thrust_modifier, 100), thrust_max)
				if vz < 0 then
					local dist_to_ground = z0 - ground_height
					if dist_to_ground > min_hover_height then
						thrust = thrust + MulDivRound(thrust_max - thrust, ground_offset - dist_to_ground, ground_offset - min_hover_height)
					else
						thrust = thrust_max
					end
				end
				thrust = MulDivRound(thrust, speed_xy, max_speed)
				time_adjust = 100 - MulDivRound(50, thrust, thrust_max)
			else
				thrust = Max(thrust, -gravity)
			end
			thrust = thrust - MulDivRound(vz, thrust_frict, 100)
			z1 = z0 + MulDivRound(vz, time, 1000) + MulDivRound(thrust, time * time, 2000000)
			z1 = Max(z1, ground_height + min_hover_height)
			local roll = MulDivRound(-angle_diff, roll_modifier * new_speed, 100 * max_speed)
			roll = Clamp(roll, -90*60, 90*60)
			roll = (roll + roll0) / 2
			local droll = abs(AngleDiff(roll, roll0))
			local required_time = MulDivRound(1000, droll, max_roll_speed)
			if required_time > time then
				roll = MulDivRound(roll, time, required_time)
			end
			local pitch = atan(z0 - z1, step_dist)
			pitch = MulDivRound(pitch, new_speed * pitch_modifier, max_speed * 100)
			pitch = Clamp(pitch, -90*60, 90*60)
			pitch = (pitch + pitch0) / 2
			SetRollPitchYaw(self, roll, pitch, yaw, time)
			self:SetPos(x1, y1, z1, time)
			if new_speed ~= 0 then
				time = MulDivRound(time - 30, time_adjust, 100)
			end
		end
		self:MoveSleep(time)
	end
	self:PopAndCallDestructor()
end

function FlyingObject:OnMoveStart()
	self:PlayFX("Move", "start")
end

function FlyingObject:OnMoveEnd()
	self:PlayFX("Move", "end")
end

function FlyingObject:MoveSleep(t) --override me
	Sleep(t)
end

function FlyingObject:OnRotationStart()
	self:PlayFX("Rotate", "start")
end

function FlyingObject:OnRotationEnd()
	self:PlayFX("Rotate", "end")
end

function FlyingObject:PlayFX(action, moment, target)
	--DbgSetText(self, action, moment)
	PlayFX(action, moment, self, target)
end

function OnMsg.GatherFXActions(list)
	list[#list + 1] = "Move"
	list[#list + 1] = "Rotate"
end

function OnMsg.LoadGame()
	Flight_Init()
	Flight_StartComputeThread()
end

----

if developer then

GlobalVar("Flight_LastPt1", point(340070, 225104, 8457) )
GlobalVar("Flight_LastPt2", point(443178, 489249, 21120) )
GlobalVar("Flight_RandState", false)

function Flight_ClearPts()
	Flight_LastPt1, Flight_LastPt2 = false, false
end

function Flight_SavePt1()
	Flight_LastPt1 = GetTerrainCursor()
end

function Flight_SavePt2()
	Flight_LastPt2 = GetTerrainCursor()
end

function Flight_RandPos()
	Flight_RandState = Flight_RandState or RandState(xxhash(GetMapName()))
	local mw, mh = terrain.GetMapSize()
	local x, y = Flight_RandState:Get(mw), Flight_RandState:Get(mh)
	return point(x, y)
end

FlyingObject.dbg_color = const.clrNoModifier
FlyingObject.dbg_text = false

DbgInit = function(self)
	self:SetColorModifier(self.dbg_color)
end

DbgSetText = function(self, ...)
	local text = self.dbg_text
	if not IsValid(text) then
		text = Text:new()
		text:SetAttachOffset(point(0, 0, 10*guim))
		text:SetDepthTest(true)
		self:Attach(text, self:GetSpotBeginIndex("Origin"))
		self.dbg_text = text
	end
	text:SetText(print_format(...))
end

function Flight_Test(class)
	CreateGameTimeThread(function()
		Flight_DbgClear()
		local pt1, pt2 = Flight_LastPt1, Flight_LastPt2
		if not pt1 then
			pt1 = GetTerrainCursor()
		end
		if not pt2 then
			pt2 = Flight_RandPos()
		end
		local shuttle = PlaceObject(class or "Shuttle")
		local path = shuttle and shuttle:CalcPath(pt1, pt2) or ""
		if #path < 2 then
			return
		end
		shuttle:SetVisible(true)
		shuttle:SetState("idle")
		local start_time = GameTime()
		print("Flight", shuttle.flight_id, "started")
		Flight_DrawTraject(path, yellow)
		shuttle:WaitFollowPath(path)
		print("Flight", shuttle.flight_id, "arrived in", GameTime() - start_time)
		if not IsValid(shuttle) then
			return
		end
		local path2 = shuttle:CalcPath(pt2, pt1) or ""
		if not path2 or #path2 < 2 then
			shuttle:ReversePath(path)
			path2 = path
		else
			Flight_DrawTraject(path2, red)
		end
		shuttle:WaitFollowPath(path2)
		Sleep(1000)
		if IsValid(shuttle) then
			DoneObject(shuttle)
		end
	end)
end

GlobalVar("Flight_DbgMesh", false)
GlobalVar("Flight_DbgCircles", false)
GlobalVar("Flight_DbgLines", false)
GlobalVar("Flight_DbgLastPos", false)
GlobalVar("Flight_DbgInspectThread", false)
local dbg_step = work_step / 4
function Flight_DbgClear()
	if IsValid(Flight_DbgMesh) then
		DoneObject(Flight_DbgMesh)
	end
	if Flight_DbgCircles then
		for i=1,#Flight_DbgCircles do
			DoneObject(Flight_DbgCircles[i])
		end
		Flight_DbgCircles = false
	end
	if Flight_DbgLines then
		for i=1,#Flight_DbgLines do
			DoneObject(Flight_DbgLines[i])
		end
		Flight_DbgLines = false
	end
	Flight_DbgLastPos = false
	DbgClearVectors()
end
function Flight_DbgShowMarks()
	Flight_DbgClear()
	DeleteThread(Flight_DbgInspectThread)
	Flight_DbgCircles = {}
	local grid = Flight_NewGrid()
	for obj, info in pairs(Flight_MarkedObjs) do
		local p, r, h = table.unpack(info)
		local ground = terrain.GetHeight(p)
		local f = MulDivRound(r, mark_falloff, 100)
		grid:MaxCircle((h - ground) * grid_scale, p, work_step, r - f, r)
		Flight_DbgCircles[#Flight_DbgCircles + 1] = PlaceTerrainCircle(p, r)
		Flight_DbgCircles[#Flight_DbgCircles + 1] = PlaceTerrainCircle(p, r - f, blue)
	end
	Flight_DbgMesh = PlaceTerrainGrid(grid)
end
function Flight_DbgRasterLine(pos1, pos0, zoffset)
	pos1 = pos1 or GetTerrainCursor()
	pos0 = pos0 or Flight_DbgLastPos
	zoffset = zoffset or 0
	if not pos0 or not Flight_Height then
		return
	end
	local diff = pos1 - pos0
	local dist = diff:Len2D()
	local steps = 1 + (dist + dbg_step - 1) / dbg_step
	local points, colors = {}, {}
	local mincol = SetA(yellow, 200)
	local maxcol = SetA(white, 200)
	local max_diff = 10*guim
	for i=1,steps do
		local pos = pos0 + MulDivRound(pos1 - pos0, i - 1, steps - 1)
		local height = Flight_Height:GetBilinear(pos, work_step, 0, 1) + zoffset
		points[#points + 1] = pos:SetZ(height)
		colors[#colors + 1] = InterpolateRGB(mincol, maxcol, Clamp(height - zoffset - terrain.GetHeight(pos), 0, max_diff), max_diff)
	end
	local line = PlacePolyline(points, colors)
	line:SetDepthTest(false)
	line:SetPos(AveragePoint2D(points))
	Flight_DbgLines = Flight_DbgLines or {}
	Flight_DbgLines[#Flight_DbgLines + 1] = line
end
function Flight_DbgRasterArea(pos, size)
	pos = pos or GetTerrainCursor()
	size = size or 256*guim
	local steps = 1 + (size + dbg_step - 1) / dbg_step
	size = steps * dbg_step
	pos = pos - point(size, size) /2
	for y = 0,steps do
		Flight_DbgRasterLine(pos + point(0, y*dbg_step), pos + point(size, y*dbg_step))
	end
	for x = 0,steps do
		Flight_DbgRasterLine(pos + point(x*dbg_step, 0), pos + point(x*dbg_step, size))
	end
end
function Flight_DbgToggleInspect()
	Flight_DbgClear()
	if IsValidThread(Flight_DbgInspectThread) then
		DeleteThread(Flight_DbgInspectThread)
		return
	end
	if GetMap() == "" or not Flight_Height then
		return
	end
	Flight_DbgInspectThread = CreateMapRealTimeThread(function()
		while true do
			local pos = GetTerrainCursor()
			local last_pos = Flight_DbgLastPos
			if not last_pos or not IsCloser2D(last_pos, pos, dbg_step) then
				Flight_DbgClear()
				Flight_DbgRasterArea(pos)
				Flight_DbgLastPos = pos
			end
			Sleep(100)
		end
	end)
end
function Flight_ShowHeightGrid()
	local grid = Flight_Height - Flight_OrigHeight
	grid:normalize_i(0, 255, 1)
	DbgToggleTerrainGrid(grid)
end

function Flight_DrawTraject(pts, color)
	color = color or yellow
	local hover_height = 20*guim
	local function Flight_FixHeight(pt)
		return pt:SetZ(Flight_GetHeight(pt:xy()) + hover_height)
	end	
	local pt = pts[1]
	if type(pt) == "table" then
		for i=1,#pts do
			local pti = pts[i]
			for j=1,#pti do
				pti[j] = Flight_FixHeight(pti[j])
			end
			DbgAddSpline(pti, color)
			DbgAddVector(pti[1])
		end
		DbgAddVector(pts[#pts][4])
	else
		local pt = Flight_FixHeight(pts[1])
		DbgAddVector(pt)
		for i=2,#pts do
			local pti = Flight_FixHeight(pts[i])
			DbgAddVector(pti)
			DbgAddVector(pt, pti - pt, color)
			pt = pti
		end
	end
end

end -- Platform.developer

