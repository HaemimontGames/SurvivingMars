DefineClass.MapSettings_DustDevils =
{
	__parents = { "MapSettings" },
	properties =
	{
		{ id = "name",					name = "Name",						editor = "text",		default = "dust devil" },
		{ id = "birth_hour",			no_edit = true },
		{ id = "spawn_chance",			name = "Spawn Chance",				editor = "number",	default = 30, min = 1, max = 100, slider = true },
		{ id = "count_min",				name = "Count Min",					editor = "number",	default = 2, help = "Lo Range - how many Dust Devils to spawn" },
		{ id = "count_max",				name = "Count Max",					editor = "number",	default = 4, help = "Hi Range - how many Dust Devils to spawn" },
		{ id = "spawn_delay_min",		name = "Spawn Delay Min",			editor = "number",	default = 500, help = "In ms" },
		{ id = "spawn_delay_max",		name = "Spawn Delay Max",			editor = "number",	default = 1500, help = "In ms" },
		{ id = "duration",				name = "Duration",					editor = "number",	default = 8 * const.HourDuration, scale = const.HourDuration, help = "In Hours" },
		{ id = "duration_random",		name = "Duration Random",			editor = "number",	default = 8 * const.HourDuration, scale = const.HourDuration, help = "In Hours" },
		{ id = "speed",					name = "Speed",						editor = "number",	default = 3*guim, scale = guim },
		{ id = "speed_random",			name = "Speed Random",				editor = "number",	default = 3*guim, scale = guim },
		{ id = "major_chance",			name = "Major Chance (%)",			editor = "number",	default = 3, min = 1, max = 100, slider = true },
		{ id = "devil_radius",			name = "Radius",						editor = "number",	default = 80 * guim, scale = guim, category = "Devil Properties" },
		{ id = "devil_malfunction_radius",	name = "Malfunction Radius",				editor = "number",	default = 20 * guim, scale = guim, category = "Devil Properties" },
		{ id = "devil_dust",			name = "Dust Per Second",			editor = "number",	default = 2500, category = "Devil Properties" },
		{ id = "major_devil_radius",	name = "Major Radius",				editor = "number",	default = 120 * guim, scale = guim, category = "Devil Properties" },
		{ id = "major_devil_malfunction_radius",	name = "Major Malfunction Radius",				editor = "number",	default = 30 * guim, scale = guim, category = "Devil Properties" },
		{ id = "major_devil_dust",		name = "Major Dust Per Second",	editor = "number",	default = 3500, category = "Devil Properties" },
		{ id = "major_minions_min",	name = "Major Minions Min",		editor = "number",	default = 2, category = "Devil Properties" },
		{ id = "major_minions_max",	name = "Major Minions Max",		editor = "number",	default = 3, category = "Devil Properties" },
		{ id = "major_minions_radius",name = "Major Minions Radius",	editor = "number",	default = 100 * guim, scale = guim, category = "Devil Properties" },
		{ id = "minion_delay_min",		name = "Minion Delay Min",			editor = "number",	default = 3000, category = "Devil Properties", help = "Desync min delay spawn for minions, in ms" },
		{ id = "minion_delay_max",		name = "Minion Delay Max",			editor = "number",	default = 9000, category = "Devil Properties", help = "Desync max delay spawn for minions, in ms" },
		{ id = "electro_chance",		name = "Electrostatic Chance",	editor = "number",	default = 5, min = 0, max = 100, category = "Devil Properties", slider = true },
		{ id = "electro_battery",		name = "Electrostatic Battery",	editor = "number",	default = 50 * 100, category = "Devil Properties" },
		{ id = "colonist_health",		name = "Colonist Health Loss",	editor = "number",	default = 100, category = "Devil Properties" },
		{ id = "drone_speed_down",		name = "Drone Speed Down",			editor = "number",	default = 60, category = "Devil Properties" },
		
		{ id = "movement_range",          name = "Movement Range (m)",    editor = "number", default = 0, scale = guim, category = "Devil Properties", help = "Used only if positive to limit the movement range" },
		
		{ id = "marker_spawntime",        name = "Spawn Time (h)",        editor = "number", default = 20 * const.HourDuration, scale = const.HourDuration, category = "Dust Devil Markers" },
		{ id = "marker_spawntime_random", name = "Spawn Time Random (h)", editor = "number", default = 10 * const.HourDuration, scale = const.HourDuration, category = "Dust Devil Markers" },
		{ id = "marker_spawn_chance",     name = "Spawn Chance (%)",      editor = "number", default = 30, min = 1, max = 100, category = "Dust Devil Markers", slider = true },
	},
}

ListDustDevilMajor = empty_table
ListDustDevil = empty_table
function OnMsg.ClassesBuilt()
	ListDustDevilMajor = ClassLeafDescendantsList("DustDevilMajor")
	ListDustDevil = ClassLeafDescendantsList("DustDevil")
end

function GenerateDustDevilClass(major)
	local list = major and ListDustDevilMajor or ListDustDevil
	local class = UICity:TableRand(list)
	local classdef = class and g_Classes[class]
	assert(class and classdef)
	return classdef or DustDevil1
end

function GetDustDevilsDescr()
	if mapdata.MapSettings_DustDevils == "disabled" then
		return
	end
	
	local data = DataInstances.MapSettings_DustDevils
	local orig_data = data[mapdata.MapSettings_DustDevils] or data["DustDevils_VeryLow"]
	return OverrideDisasterDescriptor(orig_data)
end

function GenerateDustDevilTrajectory(pos, duration, speed, range)
	range = range or 0
	local curve_step = 10 * guim
	local check_step = guim / 2
	local length = MulDivRound(speed, duration, 1000)
	local count = Max(3, length / curve_step)
	local last = GetRandomPassableAround(pos, curve_step) or (pos + point(guim, 0))
	local points = { pos, last }
	local dir = last - pos
	for i = 3, count do
		local new_dir = Rotate(SetLen(dir, curve_step), UICity:Random(-30 * 60, 30 * 60))
		if range > 0 and pos:Dist(last + new_dir) > range then
			-- keep in range
			for i = 1, 10 do
				new_dir = Rotate(SetLen(dir, curve_step), UICity:Random(-30 * 60, 30 * 60))
				if pos:Dist(last + new_dir) <= range then
					break
				end
			end
			if pos:Dist(last + new_dir) > range then
				-- go around
				local tangent_dir = Rotate(dir, 90 * 60 * (2 * UICity:Random(0, 1) - 1))
				new_dir = Rotate(SetLen(tangent_dir, curve_step), UICity:Random(-15 * 60, 15 * 60))
			end
		end
		local height = terrain.GetHeight(last)
		local reachable = last
		for t = check_step, curve_step, check_step do
			local pt = last + MulDivTrunc(new_dir, t, curve_step)
			if terrain.GetHeight(pt) - height < 3 * guim then
				reachable = pt
			end
		end
		if last:Dist(reachable) < guim then
			-- we hit an obstacle
			break
		end
		points[i] = reachable
		dir = reachable - last
		last = reachable
	end
	
	return points
end

function GenerateDustDevil(pos, descr, range, major)
	range = range or descr.movement_range or 0
	local duration = UICity:Random(descr.duration, descr.duration + descr.duration_random)
	local speed = UICity:Random(descr.speed, descr.speed + descr.speed_random)
	local major = pos and (major or (UICity:Random(100) < descr.major_chance))
	local trajectory = pos and GenerateDustDevilTrajectory(pos, duration, speed, range)
	local electro = UICity:Random(100) < descr.electro_chance
	local devil = GenerateDustDevilClass(major):new
	{
		trajectory = trajectory,
		speed = speed,
		dust_radius = major and descr.major_devil_radius or descr.devil_radius,
		dust_amount = major and descr.major_devil_dust or descr.devil_dust,
		malfunction_radius = major and descr.major_devil_malfunction_radius or descr.devil_malfunction_radius,
		minions_radius = major and descr.major_minions_radius,
		colonist_health = descr.colonist_health,
		drone_speed_down = descr.drone_speed_down,
		drone_battery = electro and descr.electro_battery,
	}
	if electro then
		devil.fx_actor_class = major and "DustDevilMajorElectro" or "DustDevilElectro"
	end
	if major then
		local minions = UICity:Random(descr.major_minions_min, descr.major_minions_max)
		devil:SpawnMinions(minions, descr)
	end

	return devil
end

function CreateDustDevilMarkerThread(descr, marker)
	return CreateGameTimeThread(function(self, descr)
		local start_pos = self:GetPos()
		local radius = self.FeatureRadius
		local warning_time = descr.warning_time
		while true do
			local spawn_time = UICity:Random(descr.marker_spawntime, descr.marker_spawntime + descr.marker_spawntime_random)
			Sleep(Max(spawn_time - warning_time, 1000))
			if not g_DustStorm and UICity:Random(100) < descr.marker_spawn_chance then
				local pos = GetRandomPassableAround(start_pos, radius) or start_pos
				local hit_time = Min(spawn_time, warning_time)
				local devil = GenerateDustDevil(pos, descr, radius)
				Sleep(hit_time)
				if IsValid(devil) then		-- e.g. if not destroyed by a Dust Storm
					devil:Start()
				end
			end
		end
		self.thread = false
	end, marker, descr)
end

GlobalGameTimeThread("DustDevils", function()
	local descr = GetDustDevilsDescr()
	if not descr or descr.forbidden then	
		return
	end
	
	MapForEach(true,
		"PrefabFeatureMarker",
		function(marker)
			if marker.FeatureType == "Dust Devils" then
				marker.thread = CreateDustDevilMarkerThread(descr, marker)
			end
		end)
	
	while true do
		while g_DustStorm or DustStormsDisabled do
			Sleep(5000)
		end
		local spawn_time = UICity:Random(descr.spawntime, descr.spawntime + descr.spawntime_random)
		local warning_time = descr.warning_time
		Sleep(Max(spawn_time - warning_time, 1000))
		
		local count = UICity:Random(descr.count_min, descr.count_max) * descr.spawn_chance / 100
		for i = 1,count do
			local hit_time = Min(spawn_time, warning_time)
			Sleep(hit_time)
			if g_DustStorm or DustStormsDisabled then
				break
			end
			local pos = GetRandomPassableAwayFromBuilding()
			if not pos then
				break
			end
			local devil = GenerateDustDevil(pos, descr)
			devil:Start()
			Sleep(UICity:Random(descr.spawn_delay_min, descr.spawn_delay_max))
		end
		
		local new_descr = GetDustDevilsDescr()
		while not new_descr do
			Sleep(const.DayDuration)
			new_descr = GetDustDevilsDescr()
		end
		descr = new_descr
	end
end)

GlobalVar("g_DustDevils", {})

DefineClass.BaseDustDevil =
{
	__parents = { "Object" },
	entity = "Tornado",
	
	trajectory = false,
	speed = false,
	dust_radius = false,
	dust_amount = false,
	colonist_health = false,
	drone_speed_down = false,
	drone_battery = false,
	drones = false,
	dust_thread = false,
	watchdog_thread = false,
	follow = false,
	delay = 0,
	trajectory_idx = false,
	line = false,
}

function BaseDustDevil:Init()
	--[[ Debug functionality for drawing trajectory
	if not self.follow and self.trajectory then
		self.line = Polyline:new{max_vertices = #self.trajectory}
		local mesh = {}
		for i = 1, #self.trajectory do
			mesh[i] = self.trajectory[i]:SetZ(terrain.GetHeight(self.trajectory[i]))
		end
		self.line:SetMesh(mesh, RGB(AsyncRand(256), AsyncRand(256), AsyncRand(256)))
		self.line:SetPos(mesh[1])
	end
	--]]
end

function BaseDustDevil:GameInit()
	self.drones = {}
	g_DustDevils[#g_DustDevils+1] = self
end

function BaseDustDevil:StartFX()
	PlayFX("Spawn", "start", self)
end

function BaseDustDevil:Start()
	self.trajectory_idx = 1
	self:SetPos(self.trajectory[1])
	self:StartFX()
	self.dust_thread = CreateGameTimeThread(function()
		for i = 2, #self.trajectory do
			self.trajectory_idx = i
			local dest = self.trajectory[i]
			local t = MulDivTrunc(self:GetDist2D(dest), 1000, self.speed)
			self:SetPos(dest, t)
			if i >= 3 and self:ApplyDust(t) == "kill" then
				PlayFX("Kill", "start", self)
				break
			end
			Sleep(t)
		end
		self.dust_thread = false
		self:delete()
	end)
	self:StartWatchdog()
end

function BaseDustDevil:StartWatchdog()
	if IsValidThread(self.watchdog_thread) then
		return
	end
	self.watchdog_thread = CreateGameTimeThread(function()
		Sleep(9999)
		while IsValidThread(self.dust_thread) do
			Sleep(3337)
		end
		self.watchdog_thread = false
		self:delete()
	end)
end

function BaseDustDevil:Follow()
	Sleep(self.delay)
	local follow = self.follow
	if not IsValid(follow) then
		return
	end
	
	local pos = GetRandomPassableAround(follow:GetPos(), follow.minions_radius) or follow:GetPos()
	self:SetPos(pos)
	self:StartFX()
	while IsValid(follow) do
		local t = UICity:Random(2000, 5000)
		if follow.trajectory_idx then
			local dist = self:GetDist2D(follow)
			local speed = self.speed
			if dist < follow.minions_radius then
				speed = MulDivRound(speed, dist, follow.minions_radius)
			end
			local pos = self:GetPos()
			local dest = follow.trajectory[follow.trajectory_idx]
			local step = MulDivRound(speed, t, 1000)
			local dir = SetLen(dest - pos, step)
			dir = Rotate(dir, UICity:Random(-30 * 60, 30 * 60))
			dest = pos + dir
			self:SetPos(dest, t)
		end
		if self:ApplyDust(t) == "kill" then
			PlayFX("Kill", "start", self)
			break
		end
		Sleep(t)
	end
end

function BaseDustDevil:ApplyDust(delta)
	local dust = MulDivRound(delta, self.dust_amount, 1000)
	local battery = self.drone_battery and MulDivRound(delta, self.drone_battery, 1000)
	local dust_radius = self.dust_radius + GetEntityMaxSurfacesRadius()
	local objs = MapGet(self, dust_radius, "Building", "DroneBase", "Colonist", "DustGridElement", IsObjInOpenAir )
	local new_drones = {}
	
	local function process_drones(self, new_drones)
		if self.drones then
			for drone in pairs(self.drones) do
				if not new_drones[drone] then
					drone:UnregisterDustDevil(self)
				end
			end
		end
		self.drones = new_drones
	end
	
	--DbgAddCircle(self:GetVisualPos(), self.malfunction_radius)

	local affected_dges, already_broken_dge = false, false
	for _,obj in ipairs(objs) do
		local dist, radius = obj:GetDist2D(self), obj:GetRadius()
		local malfunction_radius = self.malfunction_radius
		if dist < radius + self.dust_radius then
			local dome = IsObjInDome(obj)
			if obj:IsKindOf("Building") then
				if dist < radius + malfunction_radius*2 and (obj:IsKindOf("Dome") or obj:IsLarge()) and not obj:IsKindOf("ConstructionSite") then
					process_drones(self, new_drones)
					return "kill"
				end
				obj:AddDust(dust)
				if dist < radius + self.malfunction_radius then
					obj:SetMalfunction()
				end
			elseif not already_broken_dge and obj:IsKindOf("DustGridElement") then
				if dist < radius + malfunction_radius*2 and obj.auto_connect then
					already_broken_dge = true
				elseif dist < radius + malfunction_radius then
					affected_dges = affected_dges or {}
					affected_dges[#affected_dges+1] = obj
				end
			elseif obj:IsKindOf("DroneBase") then
				if not obj:IsDead() then
					new_drones[obj] = true
					obj:AddDust(dust)
					if battery then
						obj:UseBattery(battery)
					end
					if obj:IsKindOf("BaseRover") then
						if UICity:Random(100) < obj.dust_devil_malfunction_chance then
							obj:SetCommand("Malfunction")
						end
					end
					obj:RegisterDustDevil(self)
				end
			elseif obj:IsKindOf("Colonist") then	
				-- colonist
				obj:ChangeHealth(-self.colonist_health, "dust_devil")
			end
		end
	end
	if not already_broken_dge and affected_dges then
		table.rand(affected_dges):Break()
	end
	process_drones(self, new_drones)
	if GetDomeAtHex(WorldToHex(self)) then
		return "kill"
	end
end

function BaseDustDevil:Unregister()
	for drone in pairs(self.drones or empty_table) do
		drone:UnregisterDustDevil(self)
	end
end

function BaseDustDevil:Done()
	DeleteThread(self.dust_thread)
	DeleteThread(self.watchdog_thread)
	self:Unregister()
	table.remove_entry(g_DustDevils, self)
	if self.line then
		DoneObject(self.line)
		self.line = false
	end
	PlayFX("Spawn", "end", self)
end

DefineClass.DustDevil =
{
	__parents = { "BaseDustDevil" },
}

DefineClass.DustDevilMajor =
{
	__parents = { "BaseDustDevil" },
	
	minions = false,
	minions_radius = false,
}

function DustDevilMajor:SpawnMinions(count, descr)
	self.minions = {}
	local total_delay = 0
	for i = 1, count do
		local minion = GenerateDustDevil(nil, descr)
		minion.follow = self
		local delay = UICity:Random(descr.minion_delay_min, descr.minion_delay_max)
		total_delay = total_delay + delay
		minion.delay = total_delay
		self.minions[i] = minion
	end
end

function DustDevilMajor:Start()
	BaseDustDevil.Start(self)
	for _, minion in ipairs(self.minions) do
		minion.dust_thread = CreateGameTimeThread(function()
			minion:Follow()
			minion.dust_thread = false
			minion:delete()
		end)
	end
end

DefineClass("DustDevil1", "DustDevil")
DefineClass("DustDevil2", "DustDevil")
DefineClass("DustDevilMajor1", "DustDevilMajor")
DefineClass("DustDevilMajor2", "DustDevilMajor")

function OnMsg.DustStorm()
	for i = #g_DustDevils, 1, -1 do
		g_DustDevils[i]:delete()
	end
end

function OnMsg.ConstructionComplete(bld)
	if not (bld:IsKindOf("Dome") or bld:IsLarge()) then return end
	local radius = bld:GetRadius()
	for i = #g_DustDevils, 1, -1 do
		local dust_devil = g_DustDevils[i]
		local dist = bld:GetDist2D(dust_devil)
		if dist < radius + Min(dust_devil.dust_radius, 2 * dust_devil.malfunction_radius) then
			dust_devil:delete()
		end
	end
end