DefineClass.MapSettings_Meteor =
{
	__parents = { "MapSettings" },
	properties =
	{
		{ id = "name",             		name = "Name",                	editor = "text",    default = "meteor" },
		{ id = "multispawn_chance",		name = "Multi Spawn Chance",		editor = "number",	default = 30, min = 1, max = 100 },
		{ id = "multispawn_count_min",	name = "Multi Spawn Count Min",	editor = "number",	default = 3, help = "Minimum count of meteors in multi spawn", category = "Multi Spawn" },
		{ id = "multispawn_count_max",	name = "Multi Spawn Count Max",	editor = "number",	default = 5, help = "Maximum count of meteors in multi spawn", category = "Multi Spawn"  },
		{ id = "multispawn_delay_min",	name = "Multi Spawn Delay Min",	editor = "number",	default = 5 * 1000, scale = 1000, help = "Minimum delay between meteors in multi spawn(in seconds)", category = "Multi Spawn"  },
		{ id = "multispawn_delay_max",	name = "Multi Spawn Delay Max",	editor = "number",	default = 10 * 1000, scale = 1000, help = "Maximum delay between meteors in multi spawn(in seconds)", category = "Multi Spawn"  },
		{ id = "birth_hour",				name = "Birth Hour",				editor = "number",	default = 125 * const.HourDuration, scale = const.HourDuration, category = "Meteor Storm", help = "This many hours without disaster" },
		{ id = "storm_forbidden",			name = "Forbidden",					editor = "bool",    default = false, category = "Meteor Storm", help = "Forbids only the Meteor Storm not meteors as a whole" },
		{ id = "storm_spawntime",			name = "Spawn Time",				editor = "number",  default = 500 * const.HourDuration, scale = const.HourDuration, category = "Meteor Storm", help = "In Hours" },
		{ id = "storm_spawntime_random",	name = "Spawn Time Random",		editor = "number",  default = 750 * const.HourDuration, scale = const.HourDuration, category = "Meteor Storm", help = "In Hours" },
		{ id = "storm_radius",				name = "Radius",						editor = "number",	default = 500 * guim, category = "Meteor Storm" },
		{ id = "storm_delay_min",			name = "Meteor Delay Min",			editor = "number",	default = 5 * 1000, scale = 1000, help = "Minimum delay between meteors in the storm(in seconds)", category = "Meteor Storm" },
		{ id = "storm_delay_max",			name = "Meteor Delay Max",			editor = "number",	default = 20 * 1000, scale = 1000, help = "Maximum delay between meteors in the storm(in seconds)", category = "Meteor Storm" },
		{ id = "storm_duration_min",		name = "Duration Min",				editor = "number",	default = 1 * const.DayDuration, scale = const.DayDuration, help = "Minimum storm duration(in sols)", category = "Meteor Storm" },
		{ id = "storm_duration_max",		name = "Duration Max",				editor = "number",	default = 3 * const.DayDuration, scale = const.DayDuration, help = "Maximum storm duration(in sols)", category = "Meteor Storm" },
		{ id = "storm_move_speed_min",	name = "Move Speed Min (m/s)",	editor = "number", default = 50, category = "Meteor Storm" },
		{ id = "storm_move_speed_max",	name = "Move Speed Max (m/s)",	editor = "number", default = 150, category = "Meteor Storm" },
		{ id = "large_chance",				name = "Large Meteor Chance",		editor = "number",	default = 10, min = 0, max = 100, category = "Meteor Specs" },
		{ id = "small_radius",				name = "Small Meteor Radius",		editor = "number",	default = 20*guim, scale = guim, category = "Meteor Specs"  },
		{ id = "large_radius",				name = "Large Meteor Radius",		editor = "number",	default = 35*guim, scale = guim, category = "Meteor Specs"  },
		{ id = "travel_dist",				name = "Travel Dist",				editor = "number",	default = 1000*guim, scale = guim, help = "Travel distance(in meters) before hitting the ground", category = "Meteor Specs"  },
		{ id = "speed_min",					name = "Speed Min",					editor = "number",	default = 150*guim, scale = guim, help = "Min travel speed(m/s) of a meteor", category = "Meteor Specs"  },
		{ id = "speed_max",					name = "Speed Max",					editor = "number",	default = 180*guim, scale = guim, help = "Max travel speed(m/s) of a meteor", category = "Meteor Specs"  },
		{ id = "prediction_time",			name = "Prediction Time",			editor = "number",	default = 30*1000, scale = 1000, help = "In seconds, time before appearance to be able to register a mark on the ground FX", category = "Meteor Specs"  },
		{ id = "deposit_rock_chance",		name = "Just Rock Chance",			editor = "number",	default = 78, category = "Deposits" },
		{ id = "deposit_metals_chance",	name = "Metal Deposit Chance",	editor = "number",	default = 15, category = "Deposits" },
		{ id = "deposit_anomaly_chance",	name = "Anomaly Chance",			editor = "number",	default = 2, category = "Deposits" },
		{ id = "deposit_polymers_chance",	name = "Polymer Chance",			editor = "number",	default = 5, category = "Deposits" },
	},
}

GlobalVar("g_MeteorStorm", false)
GlobalVar("g_MeteorStormStop", false)

local function GenerateDir(dir, angle)
	local min, max = 10 * 60, 90 * 60
	dir = dir or point(UICity:Random(-4096, 4096), UICity:Random(-4096, 4096))
	angle = angle and Clamp(angle + UICity:Random(-15 * 60, 15 * 60), min, max) or UICity:Random(min, max)
	local s, c = sin(angle), cos(angle)
	if c == 0 then
		dir = point(0, 0, 4096)
	else
		dir = dir:SetZ(MulDivRound(dir:Len2D(), s, c))
	end
	
	return dir, angle
end

local meteor_classes = {}
function GenerateMeteor(descr, dest)
	local large = UICity:Random(100) < descr.large_chance
	local base_class = large and "BaseMeteorLarge" or "BaseMeteorSmall"
	local list = meteor_classes[base_class]
	if not list then
		list = ClassLeafDescendantsList(base_class)
		meteor_classes[base_class] = list
	end
	local class = UICity:TableRand(list)
	
	local meteor = g_Classes[class]:new{
		range = large and descr.large_radius or descr.small_radius,
		speed = UICity:Random(descr.speed_min, descr.speed_max),
		health_damage = large and 0 or g_Consts.MeteorHealthDamage,
		dest = dest,
	}
	assert(descr.deposit_rock_chance + descr.deposit_metals_chance + descr.deposit_anomaly_chance + descr.deposit_polymers_chance == 100, "Deposit chances must sum up to 100%")
	local chance = UICity:Random(100)
	if chance < descr.deposit_rock_chance then
		meteor.deposit_type = "Rocks"
	elseif chance < descr.deposit_rock_chance + descr.deposit_metals_chance then
		meteor.deposit_type = "Metals"
	elseif chance < descr.deposit_rock_chance + descr.deposit_metals_chance + descr.deposit_polymers_chance then
		meteor.deposit_type = "Polymers"
	else
		meteor.deposit_type = "Anomaly"
	end
	
	return meteor
end

local largest_prefab = 100 * guim

function SpawnMeteor(meteors, dir, angle, pos)
	--DbgAddVector(pos, point(0, 0, 100*guim), const.clrGreen)
	--DbgAddCircle(pos + point(0, 0, 100*guim), meteors.storm_radius, const.clrWhite)
	
	local new_pos = pos and GetRandomPassableAround(pos, meteors.storm_radius) or GetRandomPassable()
	if not new_pos or (pos and new_pos:Dist2D(pos) > meteors.storm_radius) then
		return
	end
	pos = new_pos
	
	pos = pos:SetZ(terrain.GetHeight(pos))
	
	--DbgAddVector(pos, point(0, 0, 100*guim), const.clrRed)

	dir = GenerateDir(dir, angle)
	local start = pos + SetLen(dir, meteors.travel_dist)
	
	return { meteor = GenerateMeteor(meteors, pos), start = start, pause = 0 }
end

function MeteorsDisaster(meteors, meteors_type, pos)
	local spawned = {}
	if meteors_type == "multispawn" then
		local dir, angle = GenerateDir()
		local count = UICity:Random(meteors.multispawn_count_min, meteors.multispawn_count_max)
		for i = 1, count do
			local meteor = SpawnMeteor(meteors, dir, angle, pos)	-- share same direction, deviate angle, random pos
			if not meteor then
				break
			end
			spawned[i] = meteor
			meteor.pause = UICity:Random(meteors.multispawn_delay_min, meteors.multispawn_delay_max)
		end
	elseif meteors_type == "storm" then
		g_MeteorStorm = true
		Msg("MeteorStorm")
		--DbgClearVectors()
		local dir, angle = GenerateDir()
		pos = pos or GetRandomPassable()
		local speed = UICity:Random(meteors.storm_move_speed_min, meteors.storm_move_speed_max)
		--speed = 2*guim
		local duration = UICity:Random(meteors.storm_duration_min, meteors.storm_duration_max)
		local move_dir = Rotate(point(-guim, 0, 0), mapdata.OverviewOrientation)
		
		if speed > 0 then
			-- make sure at least 75% of the duration will be on playable area
			local dist = MulDivRound(speed, duration, 1000)
			local steplen = 100*guim
			local step = SetLen(move_dir, steplen)
			for d = 0, dist, steplen do
				local pt = pos + SetLen(move_dir, d)
				if not pt:InBox2D(g_MapArea) then
					if d >= MulDivRound(dist, 75, 100) then
						break
					end
					local bpt = pos - step
					if bpt:InBox2D(g_MapArea) then
						pos = bpt
					end
				end
			end
		end
		
		assert(pos, "Failed to find meteor storm pos!")
		--pos = point(283405, 244259, 8006)
		AddOnScreenNotification("MeteorStormDuration", nil, {start_time = GameTime(), expiration = duration})
		ShowDisasterDescription("MeteorStorm")
		local pos_orig = pos
		local time = 0
		while time <= duration do
			local meteor = SpawnMeteor(meteors, dir, angle, pos)	-- share same direction and pos, deviate angle
			if not meteor then
				break
			end
			meteor.pause = UICity:Random(meteors.storm_delay_min, meteors.storm_delay_max)
			table.insert(spawned, meteor)
			time = time + meteor.pause
			if speed > 0 then
				pos = pos + MulDivRound(move_dir, speed * meteor.pause, 1000*guim)
			end
		end
	elseif meteors_type == "single" then
		local meteor = SpawnMeteor(meteors, nil, nil, pos)		-- random direction, angle and pos
		if meteor then
			spawned[1] = meteor
		end
	end
	if #spawned == 0 then
		return
	end
	local time = 0
	for _, descr in ipairs(spawned) do
		descr.time = time
		time = time + descr.pause
	end
	
	if meteors_type == "storm" then
		PlayFX("MeteorStorm", "start")
	end
	local current_idx, predict_idx = 1, 0
	local descr = spawned[current_idx]
	local current_time, delta = 0, 3000
	while current_idx <= #spawned do
		while predict_idx < #spawned and spawned[predict_idx + 1].time < current_time + meteors.prediction_time and not g_MeteorStormStop do
			predict_idx = predict_idx + 1
			spawned[predict_idx].meteor:Predict()
		end
		if g_MeteorStormStop and not table.find(g_MeteorsPredicted, descr.meteor) then
			RemoveOnScreenNotification("MeteorStormDuration")
			g_MeteorStormStop = false
			break
		end
		if current_time >= descr.time then
			descr.meteor:Fall(descr.start)
			current_idx = current_idx + 1
			descr = spawned[current_idx]
		end
		Sleep(delta)
		current_time = current_time + delta
	end
	if meteors_type == "storm" then
		PlayFX("MeteorStorm", "end")
		Msg("MeteorStormEnded")
		g_MeteorStorm = false
	end
end

local function GetMeteorsDescr()
	if mapdata.MapSettings_Meteor == "disabled" then
		return
	end
	
	local data = DataInstances.MapSettings_Meteor
	
	local orig_data = data[mapdata.MapSettings_Meteor] or data["Meteor_VeryLow"]
	return OverrideDisasterDescriptor(orig_data)
end

-- Single Meteor or Multi Spawn meteors
GlobalGameTimeThread("Meteors", function()
	local meteors = GetMeteorsDescr()
	if not meteors or meteors.forbidden then
		return
	end
	
	while true do
		local spawn_time = UICity:Random(meteors.spawntime, meteors.spawntime + meteors.spawntime_random)
		local warning_time = GetDisasterWarningTime(meteors)
		local start_time = GameTime()
		if GameTime() - start_time > spawn_time - warning_time then
			Sleep(5000)
		end
		local chance = UICity:Random(100)
		local meteors_type
		if chance < meteors.multispawn_chance then
			meteors_type = "multispawn"
		else
			meteors_type = "single"
		end
		local hit_time = Min(spawn_time, warning_time)
		Sleep(hit_time)
		MeteorsDisaster(meteors, meteors_type)
		
		local new_meteors = GetMeteorsDescr()
		while not new_meteors do
			Sleep(const.DayDuration)
			new_meteors = GetMeteorsDescr()
		end
		meteors = new_meteors
	end
end)

-- Meteor Storm
GlobalGameTimeThread("MeteorStorm", function()
	local meteors = GetMeteorsDescr()
	if not meteors or meteors.storm_forbidden then
		return
	end

	local wait_time = meteors.birth_hour + UICity:Random(meteors.spawntime_random)
	while true do
		-- wait and show the notification
		local start_time = GameTime()
		local last_check_time = GameTime()
		while MeteorStormsDisabled or GameTime() - start_time < wait_time do
			if MeteorStormsDisabled then
				start_time = GameTime()
			else
				local warning_time = GetDisasterWarningTime(meteors)
				if GameTime() - start_time > wait_time - warning_time then
					AddOnScreenNotification("MeteorStorm2", nil, {start_time = GameTime(), expiration = warning_time, early_warning = GetEarlyWarningText(warning_time) , num_of_sensors = GetTowerCountText()})
					ShowDisasterDescription("MeteorStorm")
					break
				end
			end
			Sleep(5000)
		end
		Sleep(Max(wait_time - (GameTime() - start_time), 0))
		
		RemoveOnScreenNotification("MeteorStorm2")
		if not MeteorStormsDisabled then
			MeteorsDisaster(meteors, "storm")
		end
		
		local new_meteors = GetMeteorsDescr()
		while not new_meteors do
			Sleep(const.DayDuration)
			new_meteors = GetMeteorsDescr()
		end
		meteors = new_meteors
		wait_time = UICity:Random(meteors.storm_spawntime, meteors.storm_spawntime + meteors.storm_spawntime_random)
	end
end)

local meteor_pos = false
local meteor_range = 0
local function filter(obj)
	return obj:IsCloser(meteor_pos, meteor_range + obj:GetRadius())
	and not IsObjInDome(obj)
	and (IsKindOf(obj, "ResourceStockpileBase") or not obj:GetParent())
end

GlobalVar("g_MeteorsPredicted", {})
GlobalVar("g_MeteorImpactIdx", 0)		-- currently shown meteor impact through the On-Screen Notification

function CycleMeteorImpacts()
	for i=1,#g_MeteorsPredicted do
		if g_MeteorImpactIdx >= #g_MeteorsPredicted then
			g_MeteorImpactIdx = 0
		end
		g_MeteorImpactIdx = g_MeteorImpactIdx + 1
		if g_MeteorsPredicted[g_MeteorImpactIdx].notification then
			ViewObjectMars(g_MeteorsPredicted[g_MeteorImpactIdx].dest)
			break
		end
	end
end

DefineClass.BaseMeteor =
{
	__parents = { "Object" },
	entity = "RocksLight_01",
	flags = { efShadow = false, efSunShadow = false, efSelectable = false, efWalkable = false, efCollision = false, efApplyToGrids = false },
	crack_type = "Small",
	
	range = false,
	speed = false,
	start = false,
	dest = false,
	delay = false,
	fall_thread = false,
	deposit_type = false,
	prefabs = false,
	marked = false,
	notification = false,
}

function BaseMeteor:Done()
	PlayFX("SensorTowerMeteorPos", "end", self, nil, self.dest)
	DeleteThread(self.fall_thread)
	table.remove_entry(g_MeteorsPredicted, self)
	local notification_left
	for i = 1, #g_MeteorsPredicted do
		if g_MeteorsPredicted[i].notification then
			notification_left = true
			break
		end
	end
	if not notification_left then
		RemoveOnScreenNotification("MeteorImpact")
	end
end

function BaseMeteor:GetQuery()
	meteor_pos = self.dest or self:GetVisualPos()
	meteor_range = self.range
	return meteor_pos, meteor_range + GetEntityMaxSurfacesRadius() , "Drone", "Colonist", "Building", "BaseRover", "ResourceStockpileBase", "ElectricityGridElement", "LifeSupportGridElement", "PassageGridElement" , filter
end

OnSoilGridChanged = empty_func
KillVegetationInCircle = empty_func
SoilAdd = empty_func
local meteors_sq_degrade_val = -40 * const.SoilGridScale
function BaseMeteor:KillVegetation()
	KillVegetationInCircle(self.dest or self:GetVisualPos(), self.range)
	local shape
	if self.range <= 10*guim then
		shape = HexSurroundingsCheckShape
	elseif self.range <= 20*guim then
		shape = HexSurroundingsCheckShapeMedium
	else
		shape = HexSurroundingsCheckShapeLarge
	end
	local q, r = WorldToHex(self)
	SoilAdd(q, r, meteors_sq_degrade_val, shape)
	OnSoilGridChanged()
end

function BaseMeteor:Predict()
	if table.find(g_MeteorsPredicted, self) then
		assert(false, "Already predicted!!!")
		return
	end
	g_MeteorsPredicted[#g_MeteorsPredicted + 1] = self
	PlayFX("SensorTowerMeteorPos", "start", self, nil, self.dest)
	if MapCount(self:GetQuery()) > 0 then
		self.notification = true
		if not IsOnScreenNotificationShown("MeteorImpact") then
			AddOnScreenNotification("MeteorImpact", CycleMeteorImpacts)
		end
	end
end

function BaseMeteor:GetTimeToImpact(dest)
	dest = dest or self.dest
	return dest and MulDivTrunc(dest:Dist(self:GetVisualPos()), 1000, self.speed) or 0
end

function BaseMeteor:HitsDome(dest)
	local domes = UICity.labels.Dome
	if not domes then
		return
	end
	dest = dest or self.dest
	local start = self.start or self:GetVisualPos()
	local esCollision = EntitySurfaces.Collision
	local closest_hit, closest_dome, closest_dist, closest_normal
	for _, dome in ipairs(domes) do
		local glass = dome:GetAttach(dome.entity .. "_Glass")
		if IsValid(glass) then
			local hit, normal = IntersectRayWithObject(start, dest, glass, esCollision)
			if hit then
				local hit_dist = hit:Dist(start)
				if not closest_hit or closest_dist > hit_dist then
					closest_hit = hit
					closest_dist = hit_dist
					closest_dome = dome
					closest_normal = normal
				end
			end
		end
	end
	
	return closest_dome, closest_hit, closest_normal
end

function BaseMeteor:Fall(start)
	self.fall_thread = CreateGameTimeThread(function()
		self.start = start
		self:SetPos(start)
		PlayFX("Meteor", "start", self, nil, nil, self.dest - start)
		local dome, dome_pt, dome_normal = self:HitsDome()
		local dest = dome_pt or self.dest
		local time = self:GetTimeToImpact(dest)
		Msg("Meteor", self)
		self:SetPos(dest, time)
		Sleep(time)
		PlayFX("Meteor", "end", self, nil, nil, dest - start)
		if dome_pt then
			PlayFX("MeteorDomeExplosion", "start", self, nil, self:GetPos(), dest - start)
			self:CrackDome(dome, dome_pt, dome_normal)
		else
			PlayFX("MeteorExplosion", "start", self, nil, self:GetPos(), dest - start)
			self:Explode()
		end
		self.fall_thread = false
		self:SetAngle(self:GetAngle())
		DoneObject(self)
	end)
end

function BaseMeteor:Explode()
end

function BaseMeteor:CrackDome(dome, dome_pt, dome_normal)
	PlayFX("MeteorHitDome", "start", dome, self, dome_pt, dome_normal)
	dome:AddFracture(self.crack_type, dome_pt)
	dome:HitByMeteor(self)
end

function BaseMeteor:ExplodeInAir(time)
	DeleteThread(self.fall_thread)
	if not IsValid(self) then return end
	local pos = self:GetVisualPos()
	local dir = self.dest - pos
	PlayFX("MeteorExplosionAir", "start", self, nil, pos, dir)
	DoneObject(self)
end

function BaseMeteor:SpawnPrefab()
	local list = self.prefabs and self.prefabs[self.deposit_type] or ""
	if #list == 0 then
		return
	end
	local name = table.rand(list)
	local err, bbox, objs = PlacePrefab(name, self:GetPos(), UICity:Random(360 * 60), "+")
	if err or MapCount(bbox, "Building") > 0 then
		return
	end

	CalcBuildableGrid()
	local UnbuildableZ = buildUnbuildableZ()
	SuspendPassEdits("SpawnPrefab")
	g_MeteorDecals = g_MeteorDecals or {}

	for _, obj in ipairs(objs) do
		if obj:IsKindOfClasses("SurfaceDepositMarker", "SubsurfaceAnomalyMarker") then
			-- check for buildable
			local q, r = WorldToHex(obj)	
			if GetBuildableZ(q, r) ~= UnbuildableZ then		
				if IsKindOf(obj, "SubsurfaceAnomalyMarker") then
					obj.revealed = true
				end
				obj:PlaceDeposit("dont_move_if_obstruct")
			end
		elseif IsKindOf(obj, "DecCrater") then
			obj.creation_time = GameTime()
			table.insert(g_MeteorDecals, obj)
		end
	end
	ResumePassEdits("SpawnPrefab")
	terrain.InvalidateType(bbox)
end

function BaseMeteor:SpawnDeposit(building)
	if self.deposit_type == "Anomaly" or self.deposit_type == "Rocks" then
		return
	end
	local pos = GetRandomPassableAround(building.pos, building.radius)
	if not pos or MapCount(pos, 10 * guim, "Building") ~= 0 then
		return
	end
	
	local marker = PlaceObject("SurfaceDepositMarker")
	marker:SetPos(pos:SetInvalidZ())
	marker:SetAngle(self:Random(360*60))
	marker.resource = self.deposit_type
	marker:PlaceDeposit("dont_move_if_obstruct")
	DoneObject(marker)
end

DefineClass.BaseMeteorSmall =
{
	__parents = {"BaseMeteor"},
	prefabs =
	{
		["Rocks"] = { "Any.Gameplay.MeteorImpactAutoRemoveS_01", "Any.Gameplay.MeteorImpactAutoRemoveS_03" },
		["Metals"] = { "Any.Gameplay.MeteorImpMetalS_01", "Any.Gameplay.MeteorImpMetalS_03" },
		["Polymers"] = { "Any.Gameplay.MeteorImpPolyS_01", "Any.Gameplay.MeteorImpPolyS_03" },
		["Anomaly"] = { "Any.Gameplay.MeteorImpAnomalyS_01", "Any.Gameplay.MeteorImpAnomalyS_03" },
	},
}

function BaseMeteorSmall:Explode()
	SuspendPassEdits("MeteorSmallExplode")
	local objects = MapGet(self:GetQuery())
	local passages_fractured = {}
	local buildings_hit = {}
	local chain_id_counter = 1
	local destroyed_pipes = {}
	local destroyed_cables = {}
	local cablesnpipes_to_kill = {}
	local cablesnpipes = {}
	for i=1,#objects do
		local obj = objects[i]
		if IsValid(obj) then --deleting objs from objects may cause other objs to also get deleted!
			if IsKindOf(obj, "Drone") then
				if not obj:IsDead() then
					PlayFX("MeteorMalfunction", "start", obj)
					obj:SetCommand("Dead", false, true)
				end
			elseif IsKindOf(obj, "Colonist") then
				PlayFX("MeteorDestruction", "start", obj)
				obj:ChangeHealth( -self.health_damage, "meteor_colonist")
			elseif IsKindOf(obj, "BaseRover") then
				if not obj:IsDead() then
					PlayFX("MeteorMalfunction", "start", obj)
					obj:SetCommand("Malfunction")
				end
			elseif IsKindOf(obj, "UniversalStorageDepot") then
				if not IsKindOf(obj, "SupplyRocket") and obj:GetStoredAmount("Fuel") > 0 then
					PlayFX("FuelExplosion", "start", obj)
					obj:CheatEmpty()
					AddOnScreenNotification("FuelDestroyed", nil, {}, {obj})
				end
				if IsKindOf(obj, "MechanizedDepot") then
					obj:SetMalfunction()
				end
			elseif IsKindOf(obj, "ResourceStockpileBase") then
				local amount = obj:GetStoredAmount()
				if obj.resource == "Fuel" and amount > 0 then
					PlayFX("FuelExplosion", "start", obj)
					obj:AddResourceAmount(-amount, true)
					AddOnScreenNotification("FuelDestroyed", nil, {}, {obj})
				end
			elseif IsKindOf(obj, "PassageGridElement") then
				if not passages_fractured[obj.passage_obj] then
					obj:AddFracture(self:GetPos())
					passages_fractured[obj.passage_obj] = true
				end
			elseif obj:IsKindOf("Building") then
				if not IsKindOfClasses(obj, "Dome", "StorageDepot", "ConstructionSite") then
					PlayFX("MeteorMalfunction", "start", obj)
					table.insert(buildings_hit, { pos = obj:GetPos(), radius = obj:GetRadius() * 150 / 100 })
					obj:SetMalfunction()
				end
			elseif IsKindOfClasses(obj, "ElectricityGridElement", "LifeSupportGridElement") then
				cablesnpipes[#cablesnpipes + 1] = obj
			end
		end
	end
	
	--should be a separate pass from blds gettting killed to get accurate topology
	for i = 1, #cablesnpipes do
		local obj = cablesnpipes[i]
		--destroy if origin in range, break if otherwise
		if self:IsCloser2D(obj, self.range) then
			local is_pipe = IsKindOf(obj, "LifeSupportGridElement")
			if is_pipe and g_Consts.InstantPipes == 0 or
				not is_pipe and g_Consts.InstantCables == 0 then --don't destroy if we are just gona place them instantly again
				if not IsKindOf(obj, "ConstructionSite") then
					if not is_pipe and not table.find(destroyed_cables, 4, obj) then
						local t = GatherSupplyGridObjectsToBeDestroyed(obj, destroyed_cables)
						table.iappend(destroyed_cables, t)
					elseif is_pipe and not table.find(destroyed_pipes, 4, obj) then
						local t
						t, chain_id_counter = GatherSupplyGridObjectsToBeDestroyed(obj, destroyed_pipes, chain_id_counter)
						table.iappend(destroyed_pipes, t)
					end
				end
				
				table.insert(cablesnpipes_to_kill, obj)
			else
				obj:Break()
			end
		else
			obj:Break()
		end
	end
	
	if #buildings_hit == 0 then
		local has_neighbour_obj = false
		local q, r = WorldToHex(self)
		for j = 1, #HexSurroundingsCheckShape do
			local dq, dr = HexSurroundingsCheckShape[j]:xy()
			if HexGetAnyObj(q + dq, r + dr) then
				has_neighbour_obj = true
				break
			end
		end
		if not has_neighbour_obj then
			self:SpawnPrefab()
		end	
	else
		self:SpawnDeposit(buildings_hit[1 + self:Random(#buildings_hit)])
	end
	
	KillCablesAndPipesAndRebuildThem(cablesnpipes_to_kill, destroyed_cables, destroyed_pipes)
	self:KillVegetation()
	ResumePassEdits("MeteorSmallExplode")
end

DefineClass.BaseMeteorLarge =
{
	__parents = {"BaseMeteor"},
	prefabs =
	{
		["Rocks"] = { "Any.Gameplay.MeteorImpactAutoRemoveB_01", "Any.Gameplay.MeteorImpactAutoRemoveB_03" },
		["Metals"] = { "Any.Gameplay.MeteorImpMetalB_01", "Any.Gameplay.MeteorImpMetalB_03" },
		["Polymers"] = { "Any.Gameplay.MeteorImpPolyB_01", "Any.Gameplay.MeteorImpPolyB_03" },
		["Anomaly"] = { "Any.Gameplay.MeteorImpAnomalyB_01", "Any.Gameplay.MeteorImpAnomalyB_03" },
	},
	crack_type = "Large",
}

function BaseMeteorLarge:Init()
	self:SetScale(UICity:Random(150, 180))
end

function BaseMeteorLarge:Explode()
	SuspendPassEdits("MeteorLargeExplode")
	local objects = MapGet(self:GetQuery())
	local chain_id_counter = 1
	local passages_fractured = {}
	local destroyed_pipes = {}
	local destroyed_cables = {}
	local cablesnpipes_to_kill = {}
	local buildings_hit = {}
	local cablesnpipes = {}
	for i=1,#objects do
		local obj = objects[i]
		if IsValid(obj) then --deleting objs from objects may cause other objs to also get deleted!
			if IsKindOfClasses(obj, "Drone", "BaseRover") then
				if not obj:IsDead() then
					PlayFX("MeteorDestruction", "start", obj)
					obj:SetCommand("Dead", false, true)
				end
			elseif IsKindOf(obj, "Colonist") then
				PlayFX("MeteorDestruction", "start", obj)
				obj:SetCommand("Die", "meteor")
			elseif IsKindOf(obj, "UniversalStorageDepot") then
				if not IsKindOf(obj, "SupplyRocket") and obj:GetStoredAmount("Fuel") > 0 then
					PlayFX("FuelExplosion", "start", obj)
					obj:CheatEmpty()
					AddOnScreenNotification("FuelDestroyed", nil, {}, {obj})
				end
			elseif IsKindOf(obj, "ResourceStockpileBase") then
				local amount = obj:GetStoredAmount()
				if obj.resource == "Fuel" and amount > 0 then
					PlayFX("FuelExplosion", "start", obj)
					obj:AddResourceAmount(-amount, true)
				end
			elseif IsKindOf(obj, "PassageGridElement") then
				if not passages_fractured[obj.passage_obj] then
					obj:AddFracture(self:GetPos())
					passages_fractured[obj.passage_obj] = true
				end
			elseif IsKindOf(obj, "Building") then
				if not IsKindOfClasses(obj, "Dome", "ConstructionSite") then
					local pos, radius = obj:GetPos(), obj:GetRadius() * 150 / 100
					if DestroyBuildingImmediate(obj) then
						PlayFX("MeteorDestruction", "start", obj, nil, pos)
						table.insert(buildings_hit, { pos = pos, radius = radius})
					end
				end
			elseif IsKindOfClasses(obj, "ElectricityGridElement", "LifeSupportGridElement") then
				cablesnpipes[#cablesnpipes + 1] = obj			
			end
		end
	end
	
	--should be a separate pass from blds gettting killed to get accurate topology
	for i = 1, #cablesnpipes do
		--destroy if origin in range, break if otherwise
		local obj = cablesnpipes[i]
		if self:IsCloser2D(obj, self.range) then
			local is_pipe = IsKindOf(obj, "LifeSupportGridElement")
			if is_pipe and g_Consts.InstantPipes == 0 or
				not is_pipe and g_Consts.InstantCables == 0 then --don't destroy if we are just gona place them instantly again
				if not IsKindOf(obj, "ConstructionSite") then
					if not is_pipe and not table.find(destroyed_cables, 4, obj) then
						local t = GatherSupplyGridObjectsToBeDestroyed(obj, destroyed_cables)
						table.iappend(destroyed_cables, t)
					elseif is_pipe and not table.find(destroyed_pipes, 4, obj) then
						local t
						t, chain_id_counter = GatherSupplyGridObjectsToBeDestroyed(obj, destroyed_pipes, chain_id_counter)
						table.iappend(destroyed_pipes, t)
					end
				end
				
				table.insert(cablesnpipes_to_kill, obj)
			else
				obj:Break()
			end
		else
			obj:Break()
		end
	end
	
	if #buildings_hit == 0 then
		local has_neighbour_obj = false
		local q, r = WorldToHex(self)
		for j = 1, #HexSurroundingsCheckShape do
			local dq, dr = HexSurroundingsCheckShape[j]:xy()
			if HexGetAnyObj(q + dq, r + dr) then
				has_neighbour_obj = true
				break
			end
		end
		if not has_neighbour_obj then
			self:SpawnPrefab()
		end	
	else
		self:SpawnDeposit(buildings_hit[1 + self:Random(#buildings_hit)])
	end
	
	KillCablesAndPipesAndRebuildThem(cablesnpipes_to_kill, destroyed_cables, destroyed_pipes)
	self:KillVegetation()
	ResumePassEdits("MeteorLargeExplode")
end

DefineClass("MeteorSmall1", { __parents = {"BaseMeteorSmall"}, entity = "Asteroid" })
DefineClass("MeteorLarge1", { __parents = {"BaseMeteorLarge"}, entity = "Asteroid" })

GlobalVar("g_MeteorDecals", {})

GlobalGameTimeThread("MeteorDecalFade", function()
	local fade_time = 15*const.DayDuration
	
	while true do		
		local gt = GameTime()
		local list = g_MeteorDecals or ""
		for i = #list, 1, -1 do
			local obj = list[i]
			local opacity = 100 - MulDivRound(100, gt - obj.creation_time, fade_time)
			
			if IsValid(obj) then
				if opacity <= 0 then
					DoneObject(obj)
				else
					obj:SetOpacity(opacity)
				end
			end
			
			if not IsValid(obj) then
				table.remove(list, i)
			end
		end
		Sleep(fade_time/20)
	end
end)

function GatherSupplyGridObjectsToBeDestroyed(first_obj, collected, chain_id_counter)
	local is_pipe = IsKindOf(first_obj, "LifeSupportGridElement")
	local supply_resource = is_pipe and "water" or "electricity"
	local conn_grid = SupplyGridConnections[supply_resource]
	local objs = {first_obj}
	
	if is_pipe then --calbes are killed 1 by 1 when cascade is disabled.
		local o_grid = ObjectGrid
		local grid_class = is_pipe and WaterGrid or ElectricityGrid
		local process_idx = 1
		
		while objs[process_idx] do
			local o = objs[process_idx]
			process_idx = process_idx + 1
			if not table.find(collected or empty_table, 4, o) then
				if o.chain then
					if not o.chain.id then
						o.chain.id = chain_id_counter
						chain_id_counter = chain_id_counter + 1
					end
				end
				
				local connections = SupplyGridRemoveBuilding(conn_grid, o, o:GetSupplyGridConnectionShapePoints(supply_resource), true)
				
				for i = 1, #(connections or ""), 2 do
					local pt, other_pt = connections[i], connections[i + 1]
					local adjascents = HexGridGetObjects(o_grid, other_pt, nil, nil, function(o)
						return GetGrid(o, supply_resource)
					end)
					for i = 1, #adjascents do
						if not table.find(objs, adjascents[i]) then
							if IsKindOf(adjascents[i], "LifeSupportGridElement") and adjascents[i].chain and not adjascents[i].chain.id then
								if o.chain and o.chain.id then 
									adjascents[i].chain.id = o.chain.id
								else
									adjascents[i].chain.id = chain_id_counter
									chain_id_counter = chain_id_counter + 1
								end
							end
							grid_class:DestroyConnection(pt, other_pt, o, adjascents[i], objs)
						end
					end
				end
			end
		end
	end
	
	local ret = {} --[i] = {q, r, conn}
	local idx = 1
	for i = 1, #objs do
		local obj = objs[i]
		if not table.find(collected or empty_table, 4, obj) then
			local q, r = WorldToHex(obj)
			ret[idx] = {q, r, HexGridGet(conn_grid, q, r), obj, obj.chain, obj.pillar, obj:GetAngle(), nil --[[free]], obj.is_switch, obj.switched_state}
			idx = idx + 1
		end
	end
	
	return ret, chain_id_counter
end

function RebuildSupplyGridObjects(arr, class)
	local chain_groups = {}
	local construction_group = false
	local city = UICity
	local is_pipe = class == "LifeSupportGridElement"
	
	for i = 1, #arr do
		local o = arr[i]
		local q, r = o[1], o[2]
		local pos = point(HexToWorld(q, r))
		local conn = o[3]
		local chain = o[5]
		local pillar = o[6]
		local angle = o[7]
		local is_switch = o[9]
		local switch_state = o[10] and "on" or "off"
		local cg
		if not construction_group or #construction_group > const.ConstructiongGridElementsGroupSize then
			if construction_group and construction_group[1]:CanDelete() then
				DoneObject(construction_group[1])
			end
			
			--new group
			construction_group = CreateConstructionGroup(class, pos, 3)
		end
		
		if chain then
			if not chain_groups[chain.id] then
				local chunk_construction_group = CreateConstructionGroup(class, pos, 3)
				chunk_construction_group[1].construction_cost_multiplier = 500
				chain_groups[chain.id] = chunk_construction_group
				chunk_construction_group[1].drop_offs = {false, false}
			end
			cg = chain_groups[chain.id]
		else
			cg = construction_group
		end
		
		local params = {}
		params.construction_group = cg
		cg[#cg + 1] = params
		params.construction_connections = conn
		params.pillar = pillar
		params.chain = chain
		params.is_switch = is_switch
		params.switch_state = switch_state
		
		local cs = PlaceConstructionSite(city, class, pos, angle, params, nil, true)
		if not is_pipe or pillar then
			local rocks = HexGetUnits(nil, nil, pos, 0, false, nil, "WasteRockObstructor", 10*guim) or empty_table
			cs:AppendWasteRockObstructors(rocks)
		end
		
		if chain then
			cs:SetChainParams(chain.delta, chain.index, chain.length)
			
			if chain.index == 0 then
				cg[1].drop_offs[1] = cs
			elseif chain.index > (cg[1].drop_offs[2] and cg[1].drop_offs[2].chain.index or 0) then
				cg[1].drop_offs[2] = cs
			end
		end
	end
	
	if construction_group and construction_group[1]:CanDelete() then
		DoneObject(construction_group[1])
	end
	
	for i = 1, #chain_groups do
		local grp = chain_groups[i]
		if grp and grp[1]:CanDelete() then
			DoneObject(grp[1])
		else
			local function translate_to_next_pillar(cs)
				local q, r = WorldToHex(cs)
				for _, pt in ipairs(HexNeighbours) do
					local qq, rr = pt:xy()
					qq = qq + q
					rr = rr + r
					local a_p = HexGetPipe(qq, rr)
					if a_p and a_p.pillar and not a_p.chain then
						return a_p
					end
				end
			end
			
			grp[1].drop_offs[1] = translate_to_next_pillar(grp[1].drop_offs[1]) or grp[1].drop_offs[1]
			grp[1].drop_offs[2] = translate_to_next_pillar(grp[1].drop_offs[2]) or grp[1].drop_offs[2]
		end
	end
end

function StopMeteorStorm()
	g_MeteorStormStop = true
end

function OnMsg.CheatStopDisaster()
	if not g_MeteorStorm then return end
	StopMeteorStorm()
end

if Platform.developer then
	function TestMeteor()
		CreateGameTimeThread(function()
			local def = MapSettings_Meteor:new{storm_radius = 1000}
			MeteorsDisaster(def, "single", IsValid(SelectedObj) and SelectedObj:GetVisualPos() or GetTerrainCursor())
		end)
	end
end

local kill_thread = false
all_objs_to_kill = false
all_cbls_to_rebuild = false
all_pipes_to_rebuild = false

function KillCablesAndPipesAndRebuildThemExec()
	UICity:SetCableCascadeDeletion(false, "killingandrebuildingsupplygrid")
	SuspendPassEdits("killingandrebuildingsupplygrid")
	for i = 1, #all_objs_to_kill do
		if IsValid(all_objs_to_kill[i]) then
			DoneObject(all_objs_to_kill[i])
		end
	end
	
	if #all_pipes_to_rebuild > 0 then
		RebuildSupplyGridObjects(all_pipes_to_rebuild, "LifeSupportGridElement")
	end
	
	if #all_cbls_to_rebuild > 0 then
		RebuildSupplyGridObjects(all_cbls_to_rebuild, "ElectricityGridElement")
	end
	
	ResumePassEdits("killingandrebuildingsupplygrid")
	UICity:SetCableCascadeDeletion(true, "killingandrebuildingsupplygrid")
	all_objs_to_kill = false
	all_pipes_to_rebuild = false
	all_cbls_to_rebuild = false
	kill_thread = false
end

local function append_data(t1, d)
	for i = 1, #d do
		if not table.find(t1, 4, d[i][4]) then
			t1[#t1 + 1] = d[i]
		end
	end
end

local function helper_pick_table(t1, tnew)
	if not t1 or #t1 <= 0 then
		t1 = tnew
	else
		if IsValid(t1[1]) then
			table.iappend_unique(t1, tnew)
		else
			append_data(t1, tnew)
		end
	end
	
	return t1
end

function KillCablesAndPipesAndRebuildThem(objs_to_kill, cbls_to_rebuild, pipes_to_rebuild)
	all_objs_to_kill = helper_pick_table(all_objs_to_kill, objs_to_kill)
	all_cbls_to_rebuild = helper_pick_table(all_cbls_to_rebuild, cbls_to_rebuild)
	all_pipes_to_rebuild = helper_pick_table(all_pipes_to_rebuild, pipes_to_rebuild)
	if not kill_thread then
		kill_thread = CreateGameTimeThread(KillCablesAndPipesAndRebuildThemExec)
	end
end