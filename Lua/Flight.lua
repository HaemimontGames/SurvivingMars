GlobalVar("Flight_ObjsToMark", false)
GlobalVar("Flight_ObjToUnmark", false)
GlobalVar("Flight_MarkedObjs", false)
GlobalVar("Flight_MarkThread", false)
GlobalVar("Flight_OrigHeight", false)
GlobalVar("Flight_Height", false)
GlobalVar("Flight_Traject", false)

GlobalVar("FlyingObjs", {})
GlobalVar("FlightId", 0)

GlobalVar("Flight_MoveCost", false)
GlobalVar("Flight_CalcId", 0)
GlobalVar("Flight_CalcList", {})
GlobalVar("Flight_CalcThread", false)
GlobalVar("Flight_CalcBuffers", {})
 -- don't save this, we can rebuild it
PersistableGlobals.Flight_Height = nil
PersistableGlobals.Flight_OrigHeight = nil
PersistableGlobals.Flight_Traject = nil
PersistableGlobals.Flight_MoveCost = nil
PersistableGlobals.Flight_CalcThread = nil
PersistableGlobals.Flight_CalcBuffers = nil

local type_tile = terrain.TypeTileSize()
local work_step = 16 * type_tile
local mark_step = 16 * type_tile
local grid_scale = const.GridScale
local height_scale = const.TerrainHeightScale
local slope_penality_angle = 30*60 -- corresponds to 1 unit in the cost grid
local slope_penality_tan = MulDivRound(4096, sincos(slope_penality_angle))
local mark_falloff = 40
local max_async_calc_path = 3
local min_async_path_dist = 1000*guim
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

if developer then
	GlobalVar("FlightCObjs", {}, weak_keys_meta)
	GlobalVar("Flight_BufferLock", {0, 0})
	GlobalVar("Flight_Errors", {})
	PersistableGlobals.FlightCObjs = nil
	PersistableGlobals.Flight_BufferLock = nil
end

Flight_MaxSplineDist = 100*guim
function OnMsg.ClassesBuilt()
	local max_spline_dist = 0
	local min_hover_height = max_int
	ClassDescendants("FlyingObject", function(name, def)
		max_spline_dist = Max(max_spline_dist, def.avg_spline_dist)
		min_hover_height = Min(min_hover_height, def.min_hover_height)
	end)
	min_mark_height = Max(min_hover_height, min_obj_size)
	Flight_MaxSplineDist = max_spline_dist
end

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

local function TrajectMark(...)
	return Flight_MarkPathSpline(Flight_Traject, mark_step, ...)
end
local function TrajectUnmark(...)
	return Flight_UnmarkPathSpline(Flight_Traject, mark_step, ...)
end
local function TrajectCheck(...)
	return Flight_CheckPathSpline(Flight_Traject, mark_step, ...)
end
local function IdleMark(pos, radius)
	return Flight_Traject:AddCircle(1, pos, mark_step, radius)
end
local function IdleUnmark(pos, radius)
	return Flight_Traject:AddCircle(-1, pos, mark_step, radius)
end
local function IdleCheck(pos, radius)
	return Flight_Traject:CheckCircle(0, pos, mark_step, radius)
end

function Flight_OnHeightChanged()
	if not Flight_OrigHeight then
		return
	end
	Flight_Height:sub_i(Flight_OrigHeight)
	terrain.GetHeightGrid(Flight_OrigHeight, work_step)
	Flight_Height:add_i(Flight_OrigHeight)
	Flight_MoveCost = false
end

local function Flight_Init()
	if not Flight_OrigHeight then
		Flight_OrigHeight = Flight_NewGrid()
		terrain.GetHeightGrid(Flight_OrigHeight, work_step)
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
			Flight_ObjsToMark = {}
			MapForEach("map", "attached", false, nil, mark_flags, function(obj) Flight_ObjsToMark[obj] = true end)
		end
		Flight_ObjToUnmark = {}
		Flight_MarkedObjs = {}
		MarkThreadProc()
	end
	if not Flight_Traject then
		Flight_Traject = Flight_NewGrid(mark_step, 16)
		MapForEach("map", "FlyingObject", function(obj)
			if FlyingObjs[obj] then
				TrajectMark(obj.current_spline, obj.next_spline)
			elseif obj.idle_mark_pos then
				IdleMark(obj.idle_mark_pos, obj.collision_radius)
			end
		end)
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
				local compute_err, spline_path = Flight_FindSmoothPath(obj, start, finish, true)
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

function Flight_FindSmoothPath(obj, start, finish, sync)
	if not sync and IsGameTimeThread() and not IsCloser2D(start, finish, min_async_path_dist) then
		local queue = Flight_CalcList or {}
		if #queue < max_async_calc_path then
			Flight_StartComputeThread()
			Flight_CalcId = Flight_CalcId + 1
			local id = Flight_CalcId
			local requested = {obj, start, finish, id}
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
	end
	local cost = Flight_GetMoveCost()
	local border = Max(0, mapdata.PassBorder - work_step)
	local buffer_idx = sync and 1 or 2
	local buffer = Flight_CalcBuffers[buffer_idx]
	if not buffer then
		buffer = Flight_NewGrid()
		Flight_CalcBuffers[buffer_idx] = buffer
	end
	
	local buffer_lock
	if developer then
		buffer_lock = Flight_BufferLock
		buffer_lock[buffer_idx] = buffer_lock[buffer_idx] + 1
	end

	local excess = 1 + 90*60 / slope_penality_angle
	local compute_err, spline_path = AsyncFindSmoothPath(obj, start, finish, cost, border, buffer, excess)
	
	if developer then
		buffer_lock[buffer_idx] = buffer_lock[buffer_idx] - 1
		assert(buffer_lock[buffer_idx] == 0)
	end
	
	return compute_err, spline_path
end

function MarkThreadProc()
	local start_time = GetPreciseTicks()
	local unmarked, marked = 0, 0
	local Flight_ObjToUnmark = Flight_ObjToUnmark
	local Flight_ObjsToMark = Flight_ObjsToMark
	local Flight_MarkedObjs = Flight_MarkedObjs
	local Flight_Height = Flight_Height
	local GetHeight = terrain.GetHeight
	local ObjectHierarchyBSphere = ObjectHierarchyBSphere
	local ObjectHierarchyBBox = ObjectHierarchyBBox
	local MulDivRound = MulDivRound
	local Min, Max = Min, Max
	local unpack = table.unpack
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
			local x, y, z, r, h
			if info == nil then
				r, x, y, z = ObjectHierarchyBSphere(obj, mark_flags, true)
				if r > min_obj_size then
					local minx, miny, minz, maxx, maxy, maxz = ObjectHierarchyBBox(obj, mark_flags, true)
					maxx = Min(maxx, x + r)
					minx = Max(minx, x - r)
					maxy = Min(maxy, y + r)
					miny = Max(miny, y - r)
					maxz = Min(maxz, z + r)
					minz = Max(minz, z - r)
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

function OnMsg.DoneMap()
	Flight_Free(true)
end

function OnMsg.NewMapLoaded()
	Flight_Free()
	Flight_Init()
end

function OnMsg.LoadGame()
	Flight_Free()
	Flight_Init()
	Flight_StartComputeThread()
	for _, obj in ipairs(FlyingObjs) do
		obj:RegisterFlight(true)
	end
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
	return IsValid(obj) and IsValidPos(obj) and GetEnumFlags(obj, mark_flags) ~= 0 and IsValidEntity(obj:GetEntity())
end

function Flight_Mark(obj)
	if not Flight_IsMarkable(obj) or Flight_ObjsToMark[obj] then
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
	__parents = { "FXObject", "Object", "CommandObject", "ComponentAttach", "ComponentInterpolation" },
	flags = { cofComponentSound = true, efWalkable = false, efApplyToGrids = false, efCollision = false },
	
	flight_id = 0,
	idle_mark_pos = false,
	
	-- collision params:
	collision = false,
	avoid_max = 8,
	avoid_height = 20*guim,
	collision_radius = 20*guim,
	avoid_class = 0,
	avoid_mask = 0,
	maneuver_time = 4000,
	-- backward compat
	avoid_level = 0,
	avoid_count = 0,
	
	-- move params:
	current_path = false,
	current_spline = false,
	next_spline = false,
	accel_dist = 40*guim,
	decel_dist = 80*guim,
	move_speed = 50*guim,
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
	auto_landing = false,
	starting_angle_error = 10 * 60,
	
	-- path params:
	start_pos = false,
	start_dir = false,
	start_dir_obj = false,
	end_pos = false,
	end_dir = false,
	dist_to_target = false,
	move_cost = false,
	mass = 4 * unity,
	friction = unity / 3,
	unity = unity,
	target_ref_dist = 256*guim,
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
	DbgInit(self)
	--DbgSetText(self, self.flight_id)
end

function FlyingObject:Done()
	--[[
	assert(not self.current_spline)
	assert(not self.next_spline)
	assert(not self.idle_mark_pos)
	--]]
	self:OnCommandStart()
end

function Flight_DrawAvoidance()
	DbgClearVectors()
	for i=1,#FlyingObjs do
		local obj = FlyingObjs[i]
		local pos = obj:GetVisualPos()
		local color = RandColor(100, xxhash64(obj.flight_id))
		local to_avoid = Flight_ToAvoid(obj)
		for obj_i in pairs(to_avoid or empty_table) do
			if IsValid(obj_i) then
				DbgAddVector(pos, obj_i:GetVisualPos() - pos, color)
			end
		end
	end
end

function FlyingObject:IdleMark(mark)
	if self.avoid_class == 0 then
		return
	end
	local prev_pos = self.idle_mark_pos
	local new_pos = mark and self:GetPos() or nil
	local radius = self.collision_radius
	if prev_pos then
		if new_pos and new_pos:Equal2D(prev_pos) then
			return
		end
		if developer then
			local min, max = IdleCheck(prev_pos, self.collision_radius)
			assert(min >= 1, "Flight traject grid corruption")
		end
		IdleUnmark(prev_pos, radius)
	end
	if mark then
		IdleMark(new_pos, radius)
	end
	self.idle_mark_pos = new_pos
end

function FlyingObject:CalcPath(pt1, pt2, sync)
	assert(self:IsValidPos())
	if pt1:Equal2D(pt2) then
		return
	end
	local err, spline_path
	if not IsCloser2D(pt1, pt2, work_step) then
		err, spline_path = Flight_FindSmoothPath(self, pt1, pt2, sync)
		if err then
			if developer then
				local dir = self.start_dir_obj and self:GetVelocityVector(true)
				Flight_Errors[#Flight_Errors + 1] = {self, pt1, pt2, dir, err}
			end
			assert(false, "Failed to compute flying trajectory: " .. err)
		end
	end
	if not spline_path or #spline_path == 0 then
		local dir = (pt2 - pt1) / 2
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
	local pos = self:GetVisualPos()
	if self:IsValidPos() then
		pos = pos:SetTerrainZ()
	end
	return pos
end

function FlyingObject:IsLanded()
end

function FlyingObject:WaitFollowPath(path)
	if not path or not path[1][1] then
		return
	end
	self:SetCommand("FollowPathCmd", path)
	WaitMsg(self)
end

function FlyingObject:FollowPathDstr()
	if not FlyingObjs[self] then
		assert(not self.current_spline)
		assert(not self.next_spline)
		return
	end
	FlyingObjs[self] = nil
	table.remove_entry(FlyingObjs, self)
	TrajectUnmark(self.current_spline, self.next_spline)
	self.collision = false
	self.current_path = false
	self.current_spline = false
	self.next_spline = false
	if IsValid(self) then
		assert(not self:IsValidPos() or terrain.IsPointInBounds(self:GetPos()))
		Flight_EnableCollision(self, false)
		self:UnregisterFlight()
		self:SetAcceleration(0) -- clear acceleration
		--self:SetPos(self:GetVisualPosXYZ()) -- clear interpolation info
	end
	self:OnMoveEnd()
	Msg(self)
end

function FlyingObject:OnCommandStart()
	self:FollowPathDstr()
end

local function Land_GetHeight(x, y, gf)
	local th = terrain.GetHeight(x, y)
	local fh = Flight_GetHeight(x, y)
	return th + MulDivRound(fh - th, gf, 1000)
end

function FlyingObject:FollowPathCmd(path)
	if not IsValid(self) then
		assert(false, "Invalid flying object!")
		return
	end
	if FlyingObjs[self] then
		assert(false, "Flying object controlled from multiple threads!")
		return
	end
	local first_pos = path[1][1]
	local last_pos = path[#path][4]
	if not IsCloser2D(first_pos, last_pos, 30000 * guim) then
		assert(false, "Flying path too long!")
		self:SetPos(last_pos:SetTerrainZ(hover_height), 1000)
		Sleep(1000)
		return
	end
	FlyingObjs[#FlyingObjs + 1] = self
	FlyingObjs[self] = CurrentThread()
	self:RegisterFlight()
	self.current_path = path

	local Flight_GetHeight = Flight_GetHeight
	local hover_height = self.hover_height
	local spline = path[1]
	local spline_idx = 1
	local spline_coef = 0
	local dir = BS3_GetSplineDir2D(spline)
	local angle = atan(dir)
	if not IsValidPos(self) then
		assert(false, "Invalid flying object pos!")
		local x, y = first_pos:xy()
		local z = Flight_GetHeight(x, y) + hover_height
		self:SetPos(x, y, z)
		self:SetAngle(angle)
	else
		local my_angle = self:GetAngle()
		local da = abs(AngleDiff(angle, my_angle))
		local rotation_time = MulDivRound(1000, da, self.max_yaw_speed)
		self:SetAngle(angle, rotation_time)
		if da > self.starting_angle_error then
			self:OnRotationStart()
			rotation_time = MulDivRound(rotation_time, da - self.starting_angle_error, da)
			self:MoveSleep(rotation_time)
			self:OnRotationEnd()
		end
	end
	local thrust_max = self.thrust_max
	local thrust_modifier = self.thrust_modifier
	local thrust_frict = self.thrust_frict
	local accel_dist = self.accel_dist
	local decel_dist = self.decel_dist
	local min_speed = self.min_speed
	local max_speed = self.move_speed
	local pitch_modifier = self.pitch_modifier
	local pitch_speed_adjust = self.pitch_speed_adjust
	local pitch_height_adjust = self.pitch_height_adjust
	local roll_modifier = self.roll_modifier
	local max_roll_speed = self.max_roll_speed
	local step = self.step * (100 + #FlyingObjs / 2) / 100
	local max_sleep = self.max_sleep
	local turn_slow_down = self.turn_slow_down
	local check_collisions = self.avoid_mask ~= 0
	local auto_landing = self.auto_landing
	local len = BS3_GetSplineLengthEst(spline)
	assert(len > 0)
	local advance_max = len > 0 and Max(1, 4096 * step / len) or 1
	local min_hover_height = self.min_hover_height
	assert(hover_height >= min_hover_height)
	min_hover_height = Min(min_hover_height, hover_height)
	
	local spline_change = true
	self:OnMoveStart()
	local ground_ref = auto_landing and 0
	local dist_to_target 
	local travel_dist = 0
	local time
	assert(not self.current_spline and not self.next_spline)
	while IsValid(self) and (spline_idx ~= #path or spline_coef < 4096) do
		do
			local Min, Max = Min, Max
			local atan = atan
			local MulDivRound = MulDivRound
			local avoid_level = Flight_CheckCollisions(self)
			local advance = advance_max
			local step_reduced
			local x1, y1, x0, y0, z0, vx, vy, vz, speed_xy
			local angle_diff, roll0, pitch0, yaw0, yaw, ground_pitch
			local new_speed, accel, ground_height, step_dist
			local get_height = ground_ref and Land_GetHeight or Flight_GetHeight
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
				ground_height = get_height(x1, y1, ground_ref)
				x0, y0, z0 = self:GetVisualPosXYZ()
				local ground_denivelation = ground_height - get_height(x0, y0, ground_ref)
				step_dist = self:GetVisualDist2D(x1, y1)
				ground_pitch = -atan(ground_denivelation, step_dist)
				yaw = atan(diry, dirx)
				roll0, pitch0, yaw0 = GetRollPitchYaw(self)
				angle_diff = AngleDiff(yaw, yaw0)
				local turn_slow_down_factor = MulDivRound(turn_slow_down, abs(angle_diff), 90 * 60)
				local allowed_speed = MulDivRound(max_speed, 100 - turn_slow_down_factor, 100)
				local pitch_speed_factor = MulDivRound(pitch_speed_adjust, ground_pitch, 90*60)
				allowed_speed = allowed_speed + MulDivRound(allowed_speed, pitch_speed_factor, 100)
				if new_spline_idx >= #path - 1 and self:IsCloser2D(last_pos, decel_dist) then
					dist_to_target = self:GetVisualDist2D(last_pos)
					local decel_speed = MulDivRound(max_speed, dist_to_target, decel_dist)
					allowed_speed = Min(allowed_speed, decel_speed)
				end
				local stop
				if new_spline_idx == #path then
					local stop_speed = MulDivRound(max_speed, 4096 - new_spline_coef, 4096)
					allowed_speed = Min(allowed_speed, stop_speed)
					stop = new_spline_coef == 4096
				end
				vx, vy, vz = self:GetVelocityVector(true, true)
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
						assert(len > 0)
						advance_max = len > 0 and Max(1, 4096 * step / len) or 1
						spline_change = true
					end
					break
				end
				step_reduced = true
				local new_time = (time < 2*max_sleep) and (time/2) or max_sleep
				advance = MulDivRound(advance, new_time, time)
			end
			travel_dist = travel_dist + step_dist
			if auto_landing then
				if dist_to_target then
					ground_ref = MulDivRound(1000, dist_to_target, decel_dist)
				elseif travel_dist < accel_dist then
					ground_ref = MulDivRound(1000, travel_dist, accel_dist)
				else
					ground_ref = false
				end
			end
			if spline_change then
				spline_change = false
				local next_spline = path[spline_idx + 1]
				TrajectUnmark(self.current_spline, self.next_spline)
				if check_collisions then
					local collision = TrajectCheck(spline, next_spline) or false
					if self.collision ~= collision then
						self.collision = collision
						Flight_EnableCollision(self, collision)
					end
				end
				self.current_spline = spline
				self.next_spline = next_spline
				TrajectMark(spline, next_spline)
			end
			local ground_offset = avoid_level + hover_height + MulDivRound(pitch_height_adjust, abs(ground_pitch), 90*60)
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
			if z1 < ground_height + min_hover_height then
				z1 = Max(z1, terrain.GetHeight(x1, y1) + min_hover_height)
			end
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
		self:MoveSleep(Max(1, time))
	end
	self:FollowPathDstr()
	return true
end

function FlyingObject:RegisterFlight(forced)
	if developer then
		assert(not FlightCObjs[self] or FlightCObjs[self] == self[true])
		FlightCObjs[self] = self[true]
	end
	Flight_Register(self, forced)
end

function FlyingObject:UnregisterFlight()
	if developer then
		assert(not FlightCObjs[self] or FlightCObjs[self] == self[true])
		FlightCObjs[self] = nil
	end
	Flight_Unregister(self)
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

function FlyingObject:GetHeightAround(height, ...)
	height = height or 0
	local x, y = ...
	if not x then
		x, y = self:GetVisualPosXYZ()
	elseif not y then
		x, y = x:xy()
	end
	return Flight_GetHeightAround(Flight_Height, height, x, y, self)
end

function OnMsg.GatherFXActions(list)
	list[#list + 1] = "Move"
	list[#list + 1] = "Rotate"
end

----
-- backward compat

function FlyingObject:CheckCollisions()
	Flight_CheckCollisions(self, FlyingObjs, Flight_MaxSplineDist)
	return max_int 
end
function FlyingObject:SetSpline(current_spline, next_spline)
	current_spline = current_spline or false
	next_spline = next_spline or false
	if current_spline == self.current_spline and next_spline == self.next_spline then
		return
	end
	TrajectUnmark(self.current_spline, self.next_spline)
	
	if self.avoid_class ~= 0 then
		local collision = TrajectCheck(current_spline, next_spline) or false
		if self.avoid_mask ~= 0 and self.collision ~= collision then
			self.collision = collision
			Flight_EnableCollision(self, collision)
		end
	end
	self.current_spline = current_spline
	self.next_spline = next_spline
	TrajectMark(current_spline, next_spline)
end

function SavegameFixups.SetFlyingObjectFlag()
	for _, obj in ipairs(FlyingObjs or empty_table) do
		obj:SetGameFlags(const.gofFlyingObject)
	end
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
	Flight_RandState = Flight_RandState or RandState(xxhash64(GetMapName()))
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

local dbg_step = work_step / 4
local dbg_size = 256 * guim

function Flight_InspectGetHeight(pos)
	return Flight_Height and Flight_Height:GetBilinear(pos, work_step, 0, 1) or 0
end

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
	DbgClear()
end

function Flight_DbgShowMarks()
	Flight_DbgClear()
	DeleteThread(Flight_DbgInspectThread)
	Flight_DbgCircles = {}
	local grid = Flight_NewGrid()
	for obj, info in pairs(Flight_MarkedObjs) do
		local x, y, r, h = table.unpack(info)
		local p = point(x, y)
		local ground = terrain.GetHeight(p)
		local f = MulDivRound(r, mark_falloff, 100)
		grid:MaxCircle((h - ground) * grid_scale, p, work_step, r - f, r)
		Flight_DbgCircles[#Flight_DbgCircles + 1] = PlaceTerrainCircle(p, r)
		Flight_DbgCircles[#Flight_DbgCircles + 1] = PlaceTerrainCircle(p, r - f, blue)
	end
	Flight_DbgMesh = PlaceTerrainGrid(grid)
end

function Flight_DbgRasterLine(pos1, pos0, zoffset)
	return DbgInspectRasterLine(Flight_InspectGetHeight, pos1, pos0, dbg_step, zoffset)
end

function Flight_DbgRasterArea(pos, size)
	return DbgInspectRasterArea(Flight_InspectGetHeight, pos, size, dbg_step)
end

function Flight_DbgToggleInspect()
	return DbgInspectToggle(Flight_InspectGetHeight, dbg_size, dbg_step)
end

function Flight_DbgShowHeightGrid()
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
			local pti = {}
			for j, pt in ipairs(pts[i]) do
				pti[j] = Flight_FixHeight(pt)
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

FlyingObject.dbg_flight = false

function Flight_CheckError(idx)
	local obj, pt1, pt2, dir, err = table.unpack(Flight_Errors[idx] or empty_table)
	if not IsValid(obj) then return end
	obj.start_dir = dir
	obj.dbg_flight = true
	DbgClearVectors()
	DbgAddVector(pt1, pt2 - pt1, red)
	local err, path = Flight_FindSmoothPath(obj, pt1, pt2, true)
	Flight_DrawTraject(path, yellow)
	ViewObjectMars(obj)
	obj.start_dir = nil
	obj.dbg_flight = nil
	return err, path
end

function Flight_DbgTrajectMark(seed, class, count)
	class = class or "CargoShuttle"
	count = count or 1000
	seed = seed or count
	local buffer = Flight_NewGrid()
	local cost = Flight_GetMoveCost()
	local border = Max(0, mapdata.PassBorder - work_step)
	local obj = PlaceObject(class)
	local traject = Flight_Traject:clone()
	for i=1,count do
		local start = GetRandomPassablePoint()
		local finish = GetRandomPassablePoint()
		local compute_err, spline_path = AsyncFindSmoothPath(obj, start, finish, cost, border, buffer)
		if spline_path then
			local s0, s1
			for j=1,#spline_path do
				local s2, s3 = spline_path[j], spline_path[j + 1]
				TrajectUnmark(s0, s1)
				TrajectMark(s2, s3)
				DbgAddSpline(s2)
				s0, s1 = s2, s3
			end
			TrajectUnmark(s0, s1)
			DbgClearVectors()
		end
	end
	assert(Flight_Traject:equals(traject))
	DoneObject(obj)
	return seed
end

end -- Platform.developer

