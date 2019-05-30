local min_building_dist = const.MirrorSphere_MinBuildingDist
local max_spheres = const.MirrorSphere_MaxSpheres
local effect_range = const.MirrorSphere_EffectRange
local effect_fallout = const.MirrorSphere_EffectFallout
local min_move_delay = const.MirrorSphere_MinMoveDelay
local max_move_delay = const.MirrorSphere_MaxMoveDelay
local recharge_rate_h = const.MirrorSphere_RechargeRateH
local power_capacity = const.MirrorSphere_PowerCapacity
local power_drain_interval = const.MirrorSphere_PowerDrainInterval
local split_time = const.MirrorSphere_SplitTime
local split_dist = const.MirrorSphere_SplitDist
local power_hum_states = const.MirrorSphere_PowerHumStates
local drained_per_bld = MulDivRound(power_drain_interval, recharge_rate_h, const.HourDuration)
local ice_strength = const.MirrorSphere_IceStrength
local target_building_chance = const.MirrorSphere_TargetBuildingChance
local max_progress = 2^22
local hatch_progress_per_day = MulDivRound(max_progress, const.MirrorSphere_HatchPctDay, 100)
local split_progress_per_day = MulDivRound(max_progress, const.MirrorSphere_SplitPctDay, 100)
local excavation_radius = const.MirrorSphere_ExcavationRadius
local excavation_depth = const.MirrorSphere_ExcavationDepth
local prefab_name = const.MirrorSphere_PrefabName

GlobalVar("MirrorSphereEvents", {})
GlobalVar("l_mirror_sphere_targets", {}, weak_keys_meta)
GlobalVar("CapturedMirrorSpheres", 0)
GlobalVar("DestroyedMirrorSpheres", 0)
GlobalVar("MirrorSphereResonanceProgress", 0)
GlobalVar("MirrorSphereResonanceThread", false)
GlobalVar("MirrorSphereForcedTarget", false)

local function MirrorSphereEvent(event)
	if not MirrorSphereEvents[event] then
		MirrorSphereEvents[event] = true
		local preset_name = "Mystery3_" .. event
		if PopupNotificationPresets[preset_name] then
			ShowPopupNotification(preset_name)
		end
	end
end

----

DefineClass.MirrorSphere = {
	__parents = { "FlyingObject", "BaseHeater", "AnimatedTextureObject", "InfopanelObj", "PinnableObject" },
	flags = { efSelectable = true, cofComponentInterpolation = true },
	entity = "Mystery_MirrorSphere",
	
	avoid_height = 60*guim,
	collision_radius = 40*guim,
	avoid_mask = 0,
	avoid_class = 4,
	thrust_max = 20*guim,
	pitch_height_adjust = 60*guim,
	pitch_speed_adjust = 20,
	turn_slow_down = 0,
	roll_modifier = 0,
	pitch_modifier = 0,
	hover_height = 40*guim,
	accel_dist = 40*guim,
	decel_dist = 80*guim,
	move_speed = 20*guim,
	min_speed = 3*guim,
	max_sleep = 666,
	decoy = false,
	sphere_charge = 0,
	cold_wave = false,
	heat = -2*const.MaxHeat,
	max_neighbors = 4,
	starting_angle_error = 360 * 60,
	max_progress = max_progress,
	
	target = false,
	irradiated = false,
	
	--ui
	display_icon = "UI/Icons/Buildings/mirror_sphere.tga",
	DisplayName = T(1182, "Mirror Sphere"),
	description = T(1183, "An unknown alien object."),
	ip_template = "ipMirrorSphere",
	rename_allowed = false,
}

function MirrorSphere:GetDisplayName()
	return self.DisplayName
end

function MirrorSphere:GameInit()
	if UICity then
		UICity:AddToLabel("MirrorSpheres", self)
	end
end

function MirrorSphere:Done()
	if UICity then
		UICity:RemoveFromLabel("MirrorSpheres", self)
	end
	self:ColdWaveDstr()
end

function MirrorSphere:GetHeatRange()
	return effect_range
end

function MirrorSphere:GetHeatBorder()
	return effect_fallout
end

function MirrorSphere:GetSelectionRadiusScale()
	return effect_range / const.HexSize
end

function MirrorSphere:GetProgressPct()
	return MulDivRound(100, self.sphere_charge, max_progress)
end

function MirrorSphere:SetDecoy(decoy)
	local prev_decoy = self.decoy
	if IsValid(prev_decoy) and prev_decoy.sphere == self then
		prev_decoy:SetSphere(false)
	end
	self.decoy = decoy
	if IsValid(decoy) then
		decoy:SetSphere(self)
	end
end

function MirrorSphere:CheckDecoy()
	local decoy = self.decoy
	return IsValid(decoy) and decoy.working and decoy.sphere == self
end

function MirrorSphere:Escavate()
	self:SetState("shrink", const.eReverse + const.eDontCrossfade)
	self:SetAnimSpeedModifier(1000)
	self:SetFrameAnimationSpeed(1000)
	local time = self:TimeToAnimEnd()
	local target = self:GetVisualPos() + point(0, 0, self.hover_height)
	local accel = self:GetAccelerationAndStartSpeed(target, 0, time)
	self:SetAcceleration(accel)
	self:SetPos(target, time)
	PlayFX("TakeOff", "start", self)
	Sleep(time)
	PlayFX("TakeOff", "end", self)
	if not IsValid(self) then
		return
	end
	self:SetAcceleration(0)
end

function MirrorSphere:EscavateCmd()
	self:PushDestructor(self.Escavate)
	self:PopAndCallDestructor()
end

function MirrorSphere:CaptureCmd(decoy)
	if not IsValid(self) then
		return
	end
	self:PushDestructor(function(self)
		PlayFX("Capture", "end", self)
		PlayFX("Release", "end", self)
		PlayFX("Captured", "end", self, decoy)
		self:SetDecoy(false)
		self:IdleMark(false)
		self.collision_radius = nil
		if IsValid(self) then
			self:SetAcceleration(0)
			self:SetState("idle")
		end
	end)
	self:SetDecoy(decoy)
	self.collision_radius = 15*guim
	self:IdleMark(true)
	PlayFX("Capture", "start", self, decoy)
	Sleep(1000)
	if not IsValid(self) or not self:CheckDecoy() then
		self:PopAndCallDestructor()
		return
	end
	self:SetAnimSpeedModifier(1000)
	self:SetState("shrink")
	local x0, y0, z0 = self:GetVisualPosXYZ()
	local x1, y1, z1 = decoy:GetVisualPosXYZ()
	local target = point(x1, y1, z1 + 3*guim)
	local time = self:TimeToAnimEnd()
	local accel = self:GetAccelerationAndStartSpeed(target, 0, time)
	self:SetAcceleration(accel)
	self:SetPos(target, time)
	decoy:SetSphere(self, true)
	WaitWakeup(time)
	PlayFX("Capture", "end", self, decoy)
	if IsValid(self) and self:CheckDecoy() then
		PlayFX("Captured", "start", self, decoy)
		while IsValid(self) and self:CheckDecoy() do
			WaitWakeup(power_drain_interval)
		end
		PlayFX("Captured", "end", self, decoy)
	end
	if IsValid(self) then
		PlayFX("Release", "start", self)
		self:SetDecoy(false)
		self:SetState("shrink", const.eReverse)
		time = self:TimeToAnimEnd()
		target = point(x1, y1, Max(z0, z1 + self.hover_height))
		accel = self:GetAccelerationAndStartSpeed(target, 0, time)
		self:SetAcceleration(accel)
		self:SetPos(target, time)
		Sleep(time)
	end
	self:PopAndCallDestructor()
end

local function is_valid_el_storage(bld)
	return bld.electricity and bld.electricity.current_storage > 0 and not bld.destroyed
end

function OnMsg.ClassesPreprocess()
	Colonist.spheres = false
end

function MirrorSphere:IrradiateRemoveBegin()
	local irradiated = self.irradiated or empty_table
	for colonist in pairs(irradiated) do
		local spheres = colonist.spheres or empty_table
		if next(spheres) then
			spheres[self] = nil
		end
	end
end
function MirrorSphere:IrradiateRemoveEnd()
	local irradiated = self.irradiated or empty_table
	for colonist in pairs(irradiated) do
		local spheres = colonist.spheres or empty_table
		if not spheres[self] then
			irradiated[colonist] = nil
			if IsValid(colonist) and not next(spheres) then
				colonist:Affect("StatusEffect_Irradiated", false)
			end
		end
	end
end
function MirrorSphere:IrradiateRemove()
	self:IrradiateRemoveBegin()
	self:IrradiateRemoveEnd()
	assert(not self.irradiated or not next(self.irradiated))
end
function MirrorSphere:IrradiateAdd(colonist)
	self.irradiated[colonist]  = true
	colonist.spheres = colonist.spheres or setmetatable({}, weak_keys_meta)
	colonist.spheres[self] = true
	if not colonist.status_effects.StatusEffect_Irradiated then
		colonist:Affect("StatusEffect_Irradiated", "start", false, "force")
	end
end

local total_drained = 0
local function drain_func(obj, self)
	if IsKindOf(obj, "Colonist") then
		if obj.city:IsTechResearched("Anti-Sphere Shield") then
			return
		end
		self:IrradiateAdd(obj)
	elseif is_valid_el_storage(obj) then
		local storage = obj.electricity
		local drained = Min(drained_per_bld, storage.current_storage)
		total_drained = total_drained + MulDivRound(max_progress, drained, power_capacity)
		storage.current_storage = storage.current_storage - drained
		storage.grid.current_storage = storage.grid.current_storage - drained
		storage:UpdateStorage()
		local storage_mode = storage.current_storage > 0 and "discharging" or "empty"
		if storage.storage_mode ~= storage_mode then
			storage.storage_mode = storage_mode
			storage.building:SetStorageState(storage.grid.supply_resource, storage_mode)
		end
	end
end

function MirrorSphere:ColdWaveDstr()
	self.cold_wave = false
	self:ShowRadius(false)
	self:IdleMark(false)
	self:ApplyHeat(false)
	SetIceStrength(0, self)
	PlayFX("Freeze", "end", self)
	self:IrradiateRemove()
end

function MirrorSphere:ColdWaveCmd()
	self:PushDestructor(self.ColdWaveDstr)
	PlayFX("Freeze", "start", self)
	self.cold_wave = true
	self:ShowRadius()
	
	self.city = UICity
	self:ApplyHeat(true)
	self:IdleMark(true)
	
	SetIceStrength(ice_strength, self)
	self.irradiated = self.irradiated or setmetatable({}, weak_keys_meta)

	local move_delay = min_move_delay + UICity:Random(max_move_delay - min_move_delay + 1)
	local auto_charge = MulDivRound(split_progress_per_day, power_drain_interval, const.DayDuration)
	while IsValid(self) and move_delay > 0 do
		total_drained = 0
		self:IrradiateRemoveBegin()
		MapForEach(self, effect_range, "ElectricityStorage", "Colonist", drain_func, self )
		self:IrradiateRemoveEnd()
		if total_drained > 0 then
			MirrorSphereEvent("FirstCharge")
		end
		if next(self.irradiated) then
			MirrorSphereEvent("FirstDamage")
		end
		self:SetCharge(self.sphere_charge + auto_charge + total_drained)
		move_delay = move_delay - power_drain_interval
		Sleep(power_drain_interval)
	end
		
	self:PopAndCallDestructor()
end

local function GetHumState(progress)
	local ratio = MulDivRound(100, progress, max_progress)
	local state = power_hum_states[#power_hum_states].name
	for i=2,#power_hum_states do
		if power_hum_states[i].ratio > ratio then
			state = power_hum_states[i - 1].name
			break
		end
	end
	return state
end

function OnMsg.GatherFXActions(list)
	for i=1,#power_hum_states do
		list[#list + 1] = power_hum_states[i].name
	end
	list[#list + 1] = "Dig"
	list[#list + 1] = "TakeOff"
	list[#list + 1] = "Capture"
	list[#list + 1] = "Captured"
	list[#list + 1] = "Release"
	list[#list + 1] = "Freeze"
	list[#list + 1] = "TurnToPolymer"
	list[#list + 1] = "TurnToMetal"
	list[#list + 1] = "TurnToPreciousMetal"
	list[#list + 1] = "TurnToDepositComplete"
end

function OnMsg.GatherFXActors(list)
	list[#list + 1] = "MirrorSphereBuilding"
end
function OnMsg.GatherFXTargets(list)
	list[#list + 1] = "PowerDecoy"
end

function MirrorSphere:SetCharge(new_charge, forced)
	new_charge = Clamp(new_charge, 0, max_progress)
	if new_charge == max_progress and #(UICity and UICity.labels.MirrorSpheres or "") >= max_spheres then
		new_charge = max_progress - 1
	end
	local old_charge = self.sphere_charge
	if old_charge == new_charge and not forced then
		return
	end
	local old_state = GetHumState(old_charge)
	local new_state = GetHumState(new_charge)
	if new_state ~= old_state or forced then
		PlayFX(old_state, "end", self)
		PlayFX(new_state, "start", self)
	end
	self.sphere_charge = new_charge
	--self:SetDbgText("charge", MulDivRound(100, new_charge, max_progress))
	if new_charge == max_progress then
		self:SetCommand("SplitCmd")
	end
end

function MirrorSphere:Split()
	self:SetAnimSpeedModifier(1000)
	self:SetState("idle2")
	
	local x, y, z, r = self:GetBSphere(true)
	local sphere = PlaceObject("MirrorSphere")
	sphere:SetAnimSpeedModifier(100)
	sphere:SetState("shrink", const.eReverse + const.eDontCrossfade)
	sphere:SetPos(x, y, z - r / 2)
	sphere:SetCharge(0, true)
	sphere:SetCommand("Idle")
	Sleep(split_time)
	
	local spheres = UICity.labels.MirrorSpheres or empty_table
	if not IsValidThread(MirrorSphereResonanceThread) and #spheres >= const.MirrorSphere_ResonanceAccumSpheresStart then
		MirrorSphereResonanceThread = CreateGameTimeThread(function()
			local resonance_per_day = MulDivRound(max_progress, const.MirrorSphere_ResonancePtsPerDay, const.MirrorSphere_ResonancePtsMax)
			local sustain_count = const.MirrorSphere_ResonanceAccumSpheresSustain
			--AddOnScreenNotification(id, nil, params)
			local dt = 9753
			while true do
				Sleep(dt)
				if #spheres >= sustain_count then
					MirrorSphereResonanceProgress = MirrorSphereResonanceProgress + MulDivRound(#spheres * resonance_per_day, dt, const.DayDuration)
					if MirrorSphereResonanceProgress >= max_progress then
						MirrorSphereEvent("Resonance")
						return
					end
				end
			end
		end)
	end
	
	MirrorSphereEvent("FirstSplit")
	self:SetCharge(0, true)
	self:SetState("idle")
end

function GetMirrorSphereResonancePct()
	return MulDivRound(MirrorSphereResonanceProgress, 100, max_progress)
end

function MirrorSphere:SplitCmd()
	self:PushDestructor(self.Split)
	self:PopAndCallDestructor()
end

function MirrorSphere:SetTarget(target)
	local prev_target = self.target
	if l_mirror_sphere_targets[prev_target] == self then
		l_mirror_sphere_targets[prev_target] = nil
	end
	if IsValid(target) then
		l_mirror_sphere_targets[target] = self
		self.target = target
	else
		self.target = false
	end
end

function MirrorSphere:GetTarget()
	return l_mirror_sphere_targets[self]
end

function MirrorSphere:Idle()
	if not UICity then
		Sleep(10000)
		return
	end
	local target = IsValid(self.target) and self.target
	self:SetTarget(false)
	if target and self:IsCloser2D(target, min_building_dist) then
		if IsKindOf(target, "PowerDecoy") and target.working and not target.sphere then
			self:SetCommand("CaptureCmd", target)
		else
			-- apply cold wave
			self:SetCommand("ColdWaveCmd")
		end
		return
	end
	
	if IsValid(MirrorSphereForcedTarget) then
		target = MirrorSphereForcedTarget
		MirrorSphereForcedTarget = false
	else
		local decoys
		local buildings = UICity.labels.PowerDecoy or empty_table
		for i=1,#buildings do
			local decoy = buildings[i]
			if IsValid(decoy) and not IsValid(decoy.sphere) and decoy.working
			and (not target or self:IsCloser2D(decoy, target)) then
				target = decoy
			end
		end
	end
	if not target and UICity:Random(100) < target_building_chance then
		local buildings = MapGet("map","ElectricityStorage", "ElectricityProducer", "ElectricityConsumer", nil, const.efVisible ) 
		if #buildings > 0 then
			local last_building
			for i=1,10 do
				local building = UICity:TableRand(buildings)
				assert(not IsKindOf(building, "MirrorSphereBuilding"))
				if IsValid(building) and building ~= last_building and not IsValid(l_mirror_sphere_targets[building]) then
					target = building
					break
				end
				last_building = building
			end
		end
	end
	for i=1,10 do
		local pos = IsValid(target) and target:GetPos() or GetRandomPassable()
		local far_from_to_target = not self:IsCloser2D(pos, min_building_dist)
		if far_from_to_target or IsKindOf(target, "PowerDecoy") then
			local too_close_to_another
			if not self.decoy then
				for building, sphere in pairs(l_mirror_sphere_targets) do
					if IsValid(sphere) and not sphere.decoy and IsValid(building) and building:IsCloser2D(pos, effect_range) then
						too_close_to_another = true
						break
					end
				end
			end
			if not too_close_to_another then
				self:SetTarget(target)
				if far_from_to_target then
					local path = self:CalcPath(self:GetPos(), pos)
					self:SetCommand("FollowPathCmd", path)
				end
				break
			end
		end
		target = false
	end
	Sleep(1000)
end

function MirrorSphere:ShowRadius(show)
	if show == nil then
		show = self == SelectedObj
	end
	if show and not self.cold_wave then
		show = false
	end
	PlayFX("ShowWorkRadius", show and "start" or "end", self)
end

function OnMsg.SelectionAdded(obj)
	if IsKindOf(obj, "MirrorSphere") then
		obj:ShowRadius(true)
	end
end

function OnMsg.SelectionRemoved(obj)
	if IsKindOf(obj, "MirrorSphere") then
		obj:ShowRadius(false)
	end
end

function CheckRadiation(colonist)
	-- compatibility
end

DefineClass.MirrorSphereMystery = {
	__parents = {"MysteryBase"},
	scenario_name = "Mystery 3",
	
	display_name = T(1184, "Spheres (Normal)"),
	rollover_text = T(1185, '"Never fire a laser at a mirror."<newline><right>- Larry Niven'),
	challenge_mod = 40,
	order_pos = 6,
}

function MirrorSphereMystery:Init()
	self.city:InitEmptyLabel("MirrorSpheres")
end

----

DefineClass.MirrorSphereAnomaly = {
	__parents = { "SubsurfaceAnomaly" },
	sphere = false,
	revealed = false,
}

function MirrorSphereAnomaly:ScanCompleted()
	if IsValid(self.sphere) then
		self.sphere:OnAnomalyScanned()
	end
end

----

DefineClass.MirrorSphereBuilding = {
	__parents = { "Building" },
	action = false,
	action_thread = false,
	completed = false,
	progress = 0,
	scanned = false,
	anomaly = false,
	entity = "MirrorSphereExcavation",
	DisplayNameBurried = T(1186, "Strange pile of rocks"),
	DisplayNameExcavated = T(1187, "Mirror Sphere excavation site"),
	
	dbg_enable_all = false,
	max_workers = 6,
	work_req = false,
	auto_connect = false,
	sphere = false,
	decal = false,
	show_pin_toggle = false,
	reveal_thread = false,
	
	GetWorkNotPermittedReason = empty_func,
	GetWorkNotPossibleReason = empty_func,
	rename_allowed = false,
}

function MirrorSphereBuilding:Init()
	self.completed = {}
	local sphere = MirrorSphere:new()
	sphere:SetState("static")
	sphere:SetAnimSpeedModifier(0)
	sphere:SetFrameAnimationSpeed(0)
	self:Attach(sphere, self:GetSpotBeginIndex("Origin"))
	self.sphere = sphere
end

function MirrorSphereBuilding:GameInit()
	local angle = self:GetAngle()
	local pos = self:GetVisualPos()
	self:SetPos(pos) -- avoid being lifted off by the prefab
	local offset_fix = Rotate(point(-50, 429, -9), angle)
	local err, bbox, objs = PlacePrefab(prefab_name, pos + offset_fix, angle, "+", {[self] = true})
	if err then
		StoreErrorSource(self, err, prefab_name)
		return
	end
	local dummy
	for i=1,#(objs or "") do
		local obj = objs[i]
		local class = obj.class
		if class == "DummyMirrorSphere" then
			dummy = obj
		elseif class == "DecMirrorSphere" then
			self.decal = obj
		end
	end
	if IsValid(dummy) then
		if not self:IsCloser2D(dummy, 10) then
			local offset = self:GetVisualPos() - dummy:GetVisualPos()
			print("Mirror sphere prefab offset", offset)
		end
		DoneObject(dummy)
	end
end

function MirrorSphereBuilding:PlaceAnomaly(revealed)
	local anomaly = self.anomaly
	if not IsValid(anomaly) then
		local idx = self:HasSpot("Anomaly") and self:GetSpotBeginIndex("Anomaly") or -1
		local pos = self:GetSpotPos(idx)
		anomaly = MirrorSphereAnomaly:new{sphere = self}
		anomaly:SetPos(pos)
		self.anomaly = anomaly		
	end
	DeleteThread(self.reveal_thread)
	if anomaly.revealed then
		--
	elseif revealed then
		anomaly:SetRevealed(true)
	else
		local sector = GetMapSector(anomaly)
		assert(sector, "Mirror sphere anomaly at invalid position!")
		if not sector or sector.status ~= "unexplored" then
			anomaly:SetRevealed(true)
		else
			self.reveal_thread = CreateGameTimeThread(function()
				while IsValid(anomaly) and not anomaly.revealed do
					WaitMsg("SectorScanned", 33333)
					if sector.status ~= "unexplored" then
						anomaly:SetRevealed(true)
						return
					end
				end
			end)
		end
	end
	return anomaly
end

function MirrorSphereBuilding:CreateResourceRequests()
	self.work_req = self:AddWorkRequest("pierce_the_shell", 0, 0, self.max_workers)
end

function MirrorSphereBuilding:DroneWork(drone, request)
	if request ~= self.work_req then
		return
	end
	MirrorSphereEvent("FirstInteraction")
	drone:PushDestructor(function(drone)
		if drone.w_request:GetActualAmount() <= 0 then
			local self = drone.target
			Wakeup(self.action_thread)
		end
	end)
	drone:ContinuousTask(request, 1000, g_Consts.DroneBuildingRepairBatteryUse, "repairBuildingStart", "repairBuildingIdle", "repairBuildingEnd", "Repair")
	drone:PopAndCallDestructor()
end

function MirrorSphereBuilding:Done()
	if IsValid(self.anomaly) then
		DoneObject(self.anomaly)
	end
	DeleteThread(self.reveal_thread)
end

function MirrorSphereBuilding:OnAnomalyScanned()
	assert(not self.scanned)
	if self.scanned then
		return
	end
	self.scanned = true
	if IsValid(self.decal) then
		self.decal:SetOpacity(0, 3000)
	end
	--self.show_pin_toggle = true
	RebuildInfopanel(self)
	MirrorSphereEvent("OnAnomalyScanned")
end

function MirrorSphereBuilding:GetProgressPct()
	return MulDivRound(100, self.progress, max_progress)
end

function MirrorSphereBuilding:SetProgressPct(pct)
	local progress = pct >= 100 and max_progress or MulDivRound(max_progress, pct, 100)
	self:SetProgress(progress)
end

function MirrorSphereBuilding:SetProgress(new_progress)
	new_progress = Clamp(new_progress, 0, max_progress)
	if new_progress == self.progress then
		return
	end
	
	local prev_depth = MulDivRound(excavation_depth, self.progress, max_progress)
	local new_depth = MulDivRound(excavation_depth, new_progress, max_progress)
	SmoothChangeHeightCircle(self:GetPos(), excavation_radius, -new_depth, -prev_depth)
	
	self.building_update_time = 5000
	self.progress = new_progress
	if new_progress ~= max_progress then
		return
	end
	self:StopAction()
	local sphere = self.sphere
	if IsValid(sphere) then
		sphere:SetPos(sphere:GetVisualPos())
		sphere:Detach()
		sphere:SetCommand("EscavateCmd")
		if not sphere:IsPinned() then
			sphere:TogglePin()
		end
		MirrorSphereEvent("SphereLaunch")
		self.sphere = false
	end
	self.building_update_time = max_int
end
		
function MirrorSphereBuilding:BuildingUpdate(dt)
	if self.scanned and self.progress > 0 and self.progress < max_progress then
		local delta_progress = MulDivRound(hatch_progress_per_day, dt, const.DayDuration)
		self:SetProgress(self.progress + delta_progress)
	end
end

function MirrorSphereBuilding:IsActionEnabled(action)
	if self.action then
		return false, self.action == action and T(6780, "Cancel.") or T(1188, "Action in progress.")
	elseif self.completed[action] then
		return false, T(1189, "Already completed.")
	elseif self.dbg_enable_all then
		return true
	elseif action == "PierceTheShell" then
		if MapCount(self,"hex",const.CommandCenterMaxRadius,"DroneControl", function (center, sphere) return #center.drones > 0 and HexAxialDistance(sphere, center) <= center.work_radius end , self) > 0 then
			return true
		end
		return false, T(1190, "Too far from any Drone commander.")
	elseif action == "Communicate" then
		local towers = self.city.labels.SensorTower or ""
		for i=1,#towers do
			local tower = towers[i]
			if tower.working and self:IsCloser2D(tower, const.SensorTowerScanBoostMaxRange) then
				return true
			end
		end
		return false, T(1191, "No Sensor Tower in range.")
	elseif action == "FeedPower" then
		if MapCount(self, effect_range, "ElectricityStorage", is_valid_el_storage, self) > 0 then
			return true
		end
		return false, T(1192, "No Accumulator with stored Power in range.")
	end
end

function MirrorSphereBuilding:StopAction()
	local action = self.action
	if not action then
		return
	end
	self.action = false
	Wakeup(self.action_thread, true)
	self.action_thread = false
	RebuildInfopanel(self)
end

function MirrorSphereBuilding:StartAction(action)
	if self.action == action then
		self:StopAction()
		return
	end
	local min_time = const.MirrorSphere_ActionMinTime
	local max_time = const.MirrorSphere_ActionMaxTime
	local min_progress_pct = const.MirrorSphere_ActionMinProgress
	local max_progress_pct = const.MirrorSphere_ActionMaxProgress
	
	if not self:IsActionEnabled(action) or self.progress == 100 then
		return
	end
	
	local action_time = self:Random(min_time, max_time)
	local action_end_time = GameTime() + action_time
	
	if action == "PierceTheShell" then
		self.work_req:ResetAmount(action_time)
		self:ConnectToCommandCenters()
		self.auto_connect = true
	end
			
	local action_thread = CreateGameTimeThread(function()
		local success, aborted
		if action == "PierceTheShell" then
			success, aborted = WaitWakeup()
			self.work_req:ResetAmount()
			self:DisconnectFromCommandCenters()
			self.auto_connect = false
			self:InterruptDrones(nil, function(drone)
				if drone.command == "Work" and drone.target == self and drone.resource and drone.resource == "pierce_the_shell" then
					return drone --doing our work req
				end
			end)
		else
			MirrorSphereEvent("FirstInteraction")
			success, aborted = WaitWakeup(action_time)
		end
		if aborted or self.action ~= action or self.completed[action] then
			return
		end
		self.completed[self.action] = true
		self.action = false
		self.action_thread = false
		MirrorSphereEvent(action)
		local moment = string.format("hit-moment%d", table.count(self.completed))
		PlayFX("Dig", moment, self)
		local progress_pct = self:Random(min_progress_pct, max_progress_pct)
		local delta_progress = MulDivRound(max_progress, progress_pct, 100)
		self:SetProgress(self.progress + delta_progress)
	end)
	self.action = action
	self.action_time = action_time
	self.action_end_time = action_end_time
	self.action_thread = action_thread
	RebuildInfopanel(self)
end

----

DefineClass.PowerDecoy = {
	__parents = { "ElectricityConsumer" },
	sphere = false,
	occupied = false,
	
	action = false,
	action_time = false,
	action_end_time = false,
	action_thread = false,
}

function PowerDecoy:OnSetWorking(work)
	if not work then
		if self:IsOccupied() then
			Wakeup(self.sphere.command_thread)
		end
	elseif not l_mirror_sphere_targets[self] then
		for _, sphere in ipairs(self.city.labels.MirrorSpheres or empty_table) do
			if self:IsCloser2D(sphere, min_building_dist) and not sphere:CheckDecoy() then
				sphere:SetTarget(self)
				sphere:SetCommand("Idle")
				break
			end
		end
	end
	return ElectricityConsumer.OnSetWorking(self, work)
end

function PowerDecoy:Done()
	if IsValid(self.sphere) and self.sphere.decoy == self then
		self.sphere:SetDecoy(false)
	end
	PlayFX(self.action, "end", self.sphere, self)
	PlayFX("Captured", "end", self.sphere, self)
	self.sphere = nil
	self.occupied = nil
end
							
function PowerDecoy:IsActionEnabled()
	if not self.city:IsTechResearched("Xeno-Terraforming") then
		return false, T(1193, "The necessary technology hasn't been researched.")
	elseif not self:IsOccupied() then
		return false, T(1194, "There's no trapped Sphere.")
	elseif not self.working then
		return false, T(1195, "Not operational.")
	end
	return true
end

function PowerDecoy:IsOccupied()
	return IsValid(self.sphere) and self.occupied and self.sphere.decoy == self
end

function PowerDecoy:SetSphere(sphere, occupied)
	if not IsValid(sphere) then
		sphere = false
		occupied = false
	end
	if not occupied and self.occupied then
		CapturedMirrorSpheres = CapturedMirrorSpheres - 1
	elseif not self.occupied and occupied then
		MirrorSphereEvent("FirstCatch")
		CapturedMirrorSpheres = CapturedMirrorSpheres + 1
	end
	self:StopAction()
	assert(not self.sphere or not sphere or self.sphere == sphere, "Already captured a sphere!")
	self.sphere = sphere
	self.occupied = occupied
	RebuildInfopanel(self)
end

function PowerDecoy:StopAction()
	if not self.action then
		return
	end
	Wakeup(self.action_thread)
	PlayFX(self.action, "end", self.sphere, self)
	self.action = nil
	self.action_time = nil
	self.action_end_time = nil
	self.action_thread = nil
end

function PowerDecoy:StartAction(action)
	if not self:IsActionEnabled() or self.action == action then
		return
	end
	self:StopAction()
	self.action = action
	local sphere = self.sphere
	PlayFX("Captured", "end", sphere, self)
	local action_time = const.MirrorSphere_TurnToDepositTime
	local action_end_time = GameTime() + action_time
	local action_thread = CreateGameTimeThread(function()
		PlayFX(action, "start", sphere, self)
		local cencelled = WaitWakeup(action_time)
		PlayFX(action, "end", sphere, self)
		if cencelled or sphere ~= self.sphere or action ~= self.action then
			return
		end
		MirrorSphereEvent("FirstDeposit")
		local resource_type = false
		local resource_amount = 0
		if action == "TurnToMetal" then
			resource_type = "Metals"
			resource_amount = 100 * const.ResourceScale
		elseif action == "TurnToPreciousMetal" then
			resource_type = "PreciousMetals"
			resource_amount = 50 * const.ResourceScale
		elseif action == "TurnToPolymer" then
			resource_type = "Polymers"
			resource_amount = 50 * const.ResourceScale
		end
		PlayFX("TurnToDepositComplete", "start", sphere, self)
		if resource_type then
			PlaceResourceStockpile_Delayed(self:GetPos(), resource_type, resource_amount, 0, true)
		end
		DoneObject(sphere)
		DoneObject(self)
	end)
	self.action_time = action_time
	self.action_end_time = action_end_time
	self.action_thread = action_thread
	RebuildInfopanel(self)
end

----


if Platform.developer then
	function StartAllMirrorSpheres()
		MapForEach("map", "MirrorSphere", function(obj) obj:SetCommand("Idle") end)
	end
end

----

DefineClass.DummyMirrorSphere = {
	__parents = { "EditorVisibleObject" },
	flags = { cofComponentInterpolation = true, efSelectable = false, efWalkable = false, efApplyToGrids = false, efCollision = false },
	entity = "Mystery_MirrorSphere",
}