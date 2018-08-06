--larger numbers for better precision in frac calculations (i.e. consumption for less then an hour)
const.BaseRoverMaxBattery = 500000
const.BaseRoverBatteryHourlyDrainRate = 8000 --125 hours of operation with max 1k
const.BaseRoverBatteryHourlyRechargeRate = 100000 --5 hrs for full charge
const.BaseRoverBatteryEqualizationRate = 100000 --2 hrs tops, this var is used for rover 2 rover power transfer
const.RoverToGridElectricityScale = 20 --rovers will draw 1/const.RoverToGridElectricityScale to charge 1 from el grids
--container for common stuffs between RC Commander and workshop rover.
DefineClass.BaseRover = {
	__parents = { "DroneBase", "Demolishable", "TaskRequester", "SkinChangeable", "PinnableObject" },

	move_speed = 1000,
	scale = 100,

	pfclass = 1,
	radius = 6*guim,
	collision_radius = 6*guim,
	orient_mode = "terrain_large",

	--malfunction presentation
	malfunction_start_state = false,
	malfunction_idle_state = false,
	malfunction_end_state = false,


	fx_actor_base_class = "Rover",
	direction_arrow_scale = 260,
	
	-- pin section
	pin_summary1 = T{9613, "<percent(BatteryPerc)> <icon_Power_small>"},
	pin_on_start = true,
	
	--battery
	battery_max = const.BaseRoverMaxBattery,
	battery_current = const.BaseRoverMaxBattery,
	battery_hourly_drain_rate = const.BaseRoverBatteryHourlyDrainRate,
	battery_hourly_recharge_rate = const.BaseRoverBatteryHourlyRechargeRate,
	battery_hourly_equalization_rate = const.BaseRoverBatteryEqualizationRate,
	battery_thread = false,
	battery_thread_data = false,
	battery_ui_str = false,
	battery_cable_used_for_recharge = false,
	battery_auto_recharge_pct = 90,
	electricity = false,
	battery_thread_tick_time = 1000,
	priority = 3, --we are an important electricity consumer
	waiting_wakeup_recharge = false, --so SetSupply knows whether it should wake the command thread
	force_exit_recharge_loop = false,
	dust_devil_malfunction_chance = 15,
	cable_death_notifier = false,

	override_ui_status = false,
	
	auto_connect = false,
	repair_work_request = false,
	repair_work_amount_on_malfunction = 5000 * 45, --about 45 seconds of work for 1 drone
	
	--inheritance, wrapper functions because of load order
	Gossip = function(self, ...) Unit.Gossip(self, ...) end,
	GossipName = function(self, ...) Unit.GossipName(self, ...) end,
	ip_template = "ipRover",
	
	palettes = false,
	affected_by_no_battery_tech = true,
	
	work_spot_task = "Workrover",
	recharging_other_rover = false,
	
	on_demolish_resource_refund = { Metals = 5 * const.ResourceScale, Polymers = 5 * const.ResourceScale },
	operation_interrupted_reason = false,
}

GlobalGameTimeThread("VehiclesLowBatteryNotif", function()
	HandleNewObjsNotif(g_RoversWithLowBattery, "VehiclesLowBattery")
end)

function BaseRover:CreateResourceRequests()
	self.repair_work_request = self:AddWorkRequest("repair", 0, 0, 3)
end

function BaseRover.RepairDroneCallback(drone)
	if drone.w_request:GetActualAmount() <= 0 then
		--maintenance finished cleanly.
		drone.target:Repair()
	end
end

function BaseRover:IsStorageFull()
end

function BaseRover:GetPinSummary()
	if g_RoverCommandResearched then
		return self.pin_summary2 ~= "" and self.pin_summary2 or ""
	else
		return PinnableObject.GetPinSummary(self)
	end
end

function BaseRover:DroneWork(drone, request, resource, amount)
	if request == self.repair_work_request then
		amount = DroneResourceUnits.repair

		drone:PushDestructor(self.RepairDroneCallback)

		drone:ContinuousTask(request, amount, g_Consts.DroneBuildingRepairBatteryUse, "repairBuildingStart", "repairBuildingIdle", "repairBuildingEnd", "Repair")
		drone:PopAndCallDestructor()
	end
end

function BaseRover:ContinuousTask(request, amount, anim_start, anim_idle, anim_end, fx, fx_work_moment, work_time, add_res, reciprocal_request, total_amount)
end

function BaseRover:GameInit()
	SetPaletteFromClassMember(self)
	self.city:AddToLabel("Unit", self)
	self.city:AddToLabel("Rover", self)
	self.city:AddToLabel(self.class, self)
	self:SetState("idle")
	self:SetMoveSpeed(self.move_speed)
	self:SetMoveAnim("moveWalk")
	self:SetScale(self.scale)
	self:SetRotationTime(500)
		-- choose name
	if self.name == "" then
		self.name = GenerateMachineName(self.class)
	end
	
	if self:NeedBattery() then --noone to init this after research
		self.battery_ui_str = T{37, "Battery is <em>on standby</em>"}
	end
end

function BaseRover:Done()
	self.city:RemoveFromLabel("Unit", self)
	self.city:RemoveFromLabel("Rover", self)
	self.city:RemoveFromLabel(self.class, self)
	
	if self:IsLowBattery() then
		table.remove_entry(g_RoversWithLowBattery, self)
	end
end

function BaseRover:OnDemolish()
	local refund_resources = self.on_demolish_resource_refund or empty_table
	local pos = self:GetVisualPos()
	local angle = self:GetAngle()
	
	for resource, amount in pairs(refund_resources) do
		if amount > 0 then
			PlaceResourceStockpile_Delayed(pos, resource, amount, angle, true)
		end
	end
end

function BaseRover:ShowUISectionElectricityProduction()
end

function BaseRover:ShowUISectionElectricityGrid()
end

function BaseRover:GetRefundResources()
	local data = self.on_demolish_resource_refund or empty_table
	local t = {}
	for res, amount in sorted_pairs(data) do
		t[#t+1] = {resource = res, amount = amount}
	end
	return t
end

function BaseRover:AddDust(dust)
	self.dust = Max(Min(self.dust_max, self.dust + dust), 0)
	local dust_max = self.dust_max * (100 + g_Consts.DroneMaxDustBonus) / 100
	local normalized_dust = MulDivRound(self.dust, 255, dust_max)
	self:SetDust(normalized_dust, const.DustMaterialExterior)
end

function OnMsg.SelectedObjChange(obj, prev)
	if IsKindOf(prev, "BaseRover") then
		SetSubsurfaceDepositsVisible(false)
	end
	if IsKindOf(obj, "BaseRover") then
		SetSubsurfaceDepositsVisible(true)
	end
end

function BaseRover:CancelUnitDirectionMode()
	ResetUnitControlInteractionMode(false, self)
end

function BaseRover:Malfunction(suppress_repair_request)
	self:StartFX("Breakdown")
	
	self:CancelUnitDirectionMode()
	self:SetPos(self:GetVisualPos())
	
	if not suppress_repair_request then
		self.repair_work_request:AddAmount(self.repair_work_amount_on_malfunction)
		if not self.auto_connect then
			self.auto_connect = true
			self:ConnectToCommandCenters()
		end
	end
	
	RebuildInfopanel(self)
	
	if self.malfunction_start_state then
		self:PlayState(self.malfunction_start_state, 1)
		if not IsValid(self) then return end
	end
	
	self:SetEnumFlags(const.efCollision + const.efApplyToGrids)
	self:PushDestructor(function(self)
		if IsValid(self) then
			self:ClearEnumFlags(const.efCollision + const.efApplyToGrids)
		end
	end)
	
	if self.malfunction_idle_state then
		self:SetState(self.malfunction_idle_state)
	else
		self:SetState("idle")
	end
	
	ObjModified(self)
	Halt()
end

function BaseRover:IsMalfunctioned()
	return self.command == "Malfunction"
end

function BaseRover:CheatMalfunction()
	self.dust = self.dust_max + 10 
	self:SetCommand("Malfunction")
end

function BaseRover:CheatFillBattery()
	self:ApplyBatteryChange(self.battery_max)
end

function BaseRover:Repair()
	if not self:IsMalfunctioned() or not IsValid(self) then return end
	
	self.auto_connect = false
	self:DisconnectFromCommandCenters()
	
	if self.malfunction_end_state then
		self:PlayState(self.malfunction_end_state, 1)
		if not IsValid(self) then return end
	end
	
	self:SetState("idle")
	self:AddDust(-self.dust_max)
	
	--hacky command exit
	self.command = "" --so we get around BaseRover:SetCommand's "Malfunction" early out.
	self:SetCommand(self.battery_current > 0 and "Idle" or "NoBattery")
	
	RebuildInfopanel(self)
end

function BaseRover:DroneApproach(drone, reason)
	drone:ExitHolder(self)
	
	if not IsValid(self) then return false end
	
	if not self:HasSpot(self:GetState(), drone.work_spot_task) then
		local c, r = self:GetBSphere()
		local d_r = drone:GetRadius()
		local v = self:GetPos() - drone:GetPos()
		v = SetLen(Rotate(v, InteractionRand(360*60, "drone goto pos")), r + d_r) --better randomize it then closest to avoid drone collisions
		v = v + self:GetPos()
		return drone:Goto(v)
	else
		return drone:GotoBuildingSpot(self, drone.work_spot_task)
	end
end

function BaseRover:GetMalfunctionRepairProgress()
	return self.command == "Malfunction" and 100 - MulDivRound(self.repair_work_request:GetActualAmount(), 100, self.repair_work_amount_on_malfunction) or 0
end

local grid_recharge_tolerance = 1
function BaseRover:SetCommand(command, ...)
	if command == "Malfunction" and self.command == "Malfunction" then
		return
	elseif command and self.command == "Malfunction" then --don't interrupt "Malfunction", wait for it to end on its own
		return
	elseif command and command ~= "EqualizePowerWithOtherRover" and command ~= "Malfunction" and command ~= "Dead" and self.command == "NoBattery" and self.battery_current <= 0 then --don't interrupt "NoBattery" either
		if command == "RechargeFromGrid" then
			local c = ... --first argument should be cable
			if IsValid(c) and HexAxialDistance(c, self) <= grid_recharge_tolerance then
				--we are close enought to the cable, carry on
				DroneBase.SetCommand(self, command, c, true)
				return
			end
		end
		return
	end
	
	if command == "EqualizePowerWithOtherRover" then
		--grab recharge object early so destructors can see it.
		self.recharging_other_rover = ...
	end
	
	DroneBase.SetCommand(self, command, ...)
end

BaseRover.OnDead = empty_func

function BaseRover:Dead()
	self.dont_interrupt_current_command = true
	
	for i, entry in ipairs(RCRoverResources) do
		local res = entry.resource
		local amount = self.resource_storage[res]
		PlaceResourceStockpile_Delayed(self:GetVisualPos(), res, amount, self:GetAngle(), true)
	end

	self:OnDead()
	if self:IsLowBattery() then
		table.remove_entry(g_RoversWithLowBattery, self)
	end

	RebuildInfopanel(self)
	self:Gossip("Dead")
	self:StartFX("Dead")
	--stop
	self:ClearPath()
	self:SetPos(self:GetVisualPos())
	--play animations
	self:PlayState("destroyed", 1)
	self:SetState("destroyedIdle")
	self:SetIsNightLightPossible(false)
	self:SetEnumFlags(const.efCollision + const.efApplyToGrids)
	
	Halt()
end

function BaseRover:MoveSleep(time)
	Sleep(time)
	PlayFX("Moving", "move", self)
end

function BaseRover:GetDisplayName()
	return Untranslated(self.name)
end
	
function OnMsg.GatherLabels(labels)
	labels.Unit = true
	labels.Rover = true
	labels.RCRover = true
	labels.ExplorerRover = true
	labels.RCTransport = true
end

--battery
GlobalVar("g_RoversWithLowBattery", {})
GlobalVar("g_RoverCommandResearched", false)
function OnMsg.TechResearched(tech_id, city, first_time)
	if tech_id == "RoverCommandAI" then
		g_RoverCommandResearched = false --so setters can pass
		local container = UICity.labels.Rover or empty_table
		for _, rover in ipairs(container) do
			if rover.affected_by_no_battery_tech then
				if rover.command == "RechargeFromGrid" or rover.command == "EqualizePowerWithOtherRover" then
					rover:SetCommand("Idle") --clear recharge commands
				end
				rover:ApplyBatteryChange(99999999999) --fill them up
				rover.battery_ui_str = T{37, "Battery is <em>on standby</em>"}
			end
		end
		g_RoverCommandResearched = true
	end
end

function BaseRover:AddToRoversWithLowBattery()
	table.insert(g_RoversWithLowBattery, self)
end

function BaseRover:ApplyBatteryChange(chng)
	if not self:NeedBattery() then return end
	
	local was_lb = self:IsLowBattery()
	local was_alb = self:ShouldAutoRecharge()
	self.battery_current = Clamp(self.battery_current + chng, 0, self.battery_max)
	local is_lb = self:IsLowBattery()
	local is_alb = self:ShouldAutoRecharge()
	
	if self.battery_current <= 0 then
		--no battery.
		if self.command ~= "NoBattery" then
			self:SetCommand("NoBattery")
		end
	elseif self.battery_current >= self.battery_max and (self.command == "RechargeFromGrid" or self.command == "NoBattery") then
		HintDisable("HintRoverBatteries")
		self:SetCommand("Idle")
	end
	
	if was_lb ~= is_lb then
		if was_lb then
			table.remove_entry(g_RoversWithLowBattery, self)
		else
			self:AddToRoversWithLowBattery()
		end
	end
	
	if not was_alb and was_alb ~= is_alb then
		self:OnAutoRechargeThresholdReached()
	end
	
	if CurrentThread() == self.battery_thread then --i.e. never from StopBattery
		self:OnBatteryChanged(chng)
	end
end

function BaseRover:OnBatteryChanged(chng)
	--callback
end

function BaseRover:NeedBattery()
	return not self.affected_by_no_battery_tech or not g_RoverCommandResearched
end

function BaseRover:StartBatteryThread(hourly_delta, target_val, on_target_val_reached)
	if not self:NeedBattery() then return end
	self:StopBatteryThread()
	
	self.battery_thread_data = {start_ts = GameTime(), hourly_delta = hourly_delta, accumulate_on_stop = true, tick_time = self.battery_thread_tick_time}
	self.battery_thread = CreateGameTimeThread(function(self, hourly_delta, target_val)
		if hourly_delta < 0 then
			self.battery_ui_str = T{35, "Battery is being drained by <em><percent(value,battery_max)> per hour</em>", value = abs(hourly_delta)}
		else
			self.battery_ui_str = T{36, "Battery is being charged by <em><percent(value,battery_max)> per hour</em>", value = abs(hourly_delta)}
		end
		local no_penalty_str = self.battery_ui_str
		
		local tick_time = self.battery_thread_tick_time
		local tick_time_delta_orig = MulDivRound(hourly_delta, tick_time, const.HourDuration)
		local tick_time_delta = tick_time_delta_orig
		local cold_penalty
		
		while true do
			if target_val then --fringe case below, equalizing to target
				local delta_to_target = target_val - self.battery_current
				while abs(delta_to_target) < abs(tick_time_delta) and self.battery_current ~= target_val do
					--we don't want to overshoot it
					local sleep_time = MulDivRound(abs(delta_to_target), tick_time, abs(tick_time_delta))
					Sleep(sleep_time)
					if IsValid(self) then
						self:ApplyBatteryChange(delta_to_target)
						delta_to_target = target_val - self.battery_current
						
						if delta_to_target ~= 0 and delta_to_target/delta_to_target ~= tick_time_delta/tick_time_delta then
							--we overshot
							self.battery_thread_data.accumulate_on_stop = false
							if on_target_val_reached then
								on_target_val_reached()
							end
							return
						end
					else
						return
					end
				end
				if self.battery_current == target_val then
					self.battery_thread_data.accumulate_on_stop = false
					if on_target_val_reached then
						on_target_val_reached()
					end
					return
				end
			elseif hourly_delta < 0 then
				local new_penalty = self:GetColdPenalty()
				if cold_penalty ~= new_penalty then
					cold_penalty = new_penalty
					tick_time_delta = MulDivRound(tick_time_delta_orig, 100 + cold_penalty, 100)
					if cold_penalty == 0 then
						self.battery_ui_str = no_penalty_str
					else
						local cold_hourly_delta = MulDivRound(hourly_delta, 100 + cold_penalty, 100)
						self.battery_ui_str = T{35, "Battery is being drained by <em><percent(value,battery_max)> per hour</em>", value = abs(cold_hourly_delta)}
					end
				end
			end
			Sleep(tick_time)
			if IsValid(self) then
				self:ApplyBatteryChange(tick_time_delta)
			else
				return
			end
		end
	end, self, hourly_delta, target_val)
end

function BaseRover:StopBatteryThread()
	if IsValidThread(self.battery_thread) then
		DeleteThread(self.battery_thread)
	end
	
	self.battery_thread = false
	self.battery_ui_str = T{37, "Battery is <em>on standby</em>"}
	if not self:NeedBattery() then return end
	--handle fraction change
	if self.battery_thread_data then
		if self.battery_thread_data.accumulate_on_stop then
			local total_delta = GameTime() - self.battery_thread_data.start_ts
			local tick_time = self.battery_thread_data.tick_time or const.HourDuration
			local rem_delta = total_delta % tick_time
			if rem_delta ~= 0 then
				local delta_to_apply = MulDivRound(self.battery_thread_data.hourly_delta, rem_delta, const.HourDuration)
				self:ApplyBatteryChange(delta_to_apply)
			end
		end
		self.battery_thread_data = false
	end
end

local BatteryNonDrainingCommands = {
	Idle = true,
	Siege = true,
	Malfunction = true,
	Dead = true,
	LoadingComplete = true,
	OperationInterrupted = true,
}

function BaseRover:OnCommandStart()
	Unit.OnCommandStart(self)
	if not self:NeedBattery() then return end
	--battery
	local is_non_draining = BatteryNonDrainingCommands[self.command]
	if is_non_draining and IsValidThread(self.battery_thread) then
		self:StopBatteryThread()
	elseif not is_non_draining and not IsValidThread(self.battery_thread) then --all commands other then idle drain battery.
		self:StartBatteryThread(-self.battery_hourly_drain_rate)
	end
end

function BaseRover:OnBatteryDrained()
	--callback to do rover specific stuff.
end

function BaseRover:NoBattery()
	assert(self:NeedBattery())
	self.battery_ui_str = T{8456, "Depleted Battery!"}
	self:CancelUnitDirectionMode()
	
	self:SetPos(self:GetVisualPos())
	self:SetState("idle")
	
	self:PushDestructor(function(self)
		if IsValid(self) then
			self:SetIsNightLightPossible(true)
		end
	end)
	
	self:SetIsNightLightPossible(false)
	self:OnBatteryDrained()

	RebuildInfopanel(self)
	Halt()
end

function BaseRover:CreateElectricityElement()
	self.electricity = NewSupplyGridConsumer(self)
	self.electricity:SetConsumption(self.battery_hourly_recharge_rate / const.RoverToGridElectricityScale) --rover to grid scale
	self.electricity.parent_dome = self.battery_cable_used_for_recharge --parent dome is the obj whos pos will be used for visited tests and grid expansion
end

local dest_tolerance = 4
function BaseRover:RechargeFromGrid(target_cable, dont_move, forever)
	assert(IsKindOf(target_cable, "ElectricityGridElement"))
	if not IsValid(target_cable) then return end
	local pnt = target_cable:GetPos()
	local target_grid = target_cable.electricity.grid
	
	if not dont_move then
		if not self.override_ui_status then
			self.override_ui_status = "Goto_RechargeFromGrid"
		end
		self:PushDestructor(function(self)
			if self.override_ui_status == "Goto_RechargeFromGrid" then
				self.override_ui_status = nil
			end
		end)
		if (not self:Goto(pnt) and (not IsValid(target_cable) or HexAxialDistance(target_cable, self) > dest_tolerance)) or not IsValid(self) then --get there
			self:PopAndCallDestructor()
			return
		end
		self:PopAndCallDestructor()
		if not IsValid(target_cable) then return end
	end
	
	if self.battery_current <= 0 then
		--we already don't have battery, don't drain on stop battery thread because it will send us right back into nobat state
		self.battery_thread_data.accumulate_on_stop = false
	end
	self:StopBatteryThread()
	if self:HasMember("Siege") and self.sieged_state then
		if not self.siege_destro_pushed then
			self:Siege(true)
		end
	else
		self:SetState("idle")
	end
	
	self.battery_cable_used_for_recharge = target_cable
	self.cable_death_notifier = PlaceObject("NotifyMeOnCableDeath", {parent_rover = self})
	target_cable:Attach(self.cable_death_notifier)
	local old_status = self.override_ui_status
	self:PushDestructor(function(self)
		self.cable_death_notifier:Dispose()
		self.cable_death_notifier = nil
		self.battery_cable_used_for_recharge = false
		
		if self.electricity then
			self.electricity.grid:RemoveElement(self.electricity)
			self.electricity = false
		end
		
		if self.battery_thread_data and self.battery_thread_data.hourly_delta > 0 then --we are charging
			self:StopBatteryThread()
		end
		
		self.override_ui_status = old_status
	end)
	
	self:CreateElectricityElement()
	target_grid:AddElement(self.electricity)
	self.override_ui_status = "RechargeFromGridNoPower"
	
	if forever then
		Halt()
	else
		self.waiting_wakeup_recharge = true
		self:PushDestructor(function(self)
			self.waiting_wakeup_recharge = false
			self.force_exit_recharge_loop = false
		end)
		
		while IsValid(target_cable) and not self.force_exit_recharge_loop and self.battery_current < self.battery_max do
			WaitWakeup(const.HourDuration)
		end
		
		self:PopAndCallDestructor()
	end
	
	self:PopAndCallDestructor()
	
	if self.command == "RechargeFromGrid" and self:HasMember("Siege") and self.sieged_state and self.siege_destro_pushed then
		self:PopAndCallDestructor()
	end
end

function BaseRover:ShouldAutoRecharge()
	if not self:NeedBattery() then return false end
	return MulDivRound(self.battery_current, 100, self.battery_max) < self.battery_auto_recharge_pct
end

function BaseRover:TryRechargeFromIdle()
	if self:ShouldAutoRecharge() then
		local c = self:GetCableNearby()
		if c then
			self:RechargeFromGrid(c, true, false)
		end
	end
end

local auto_recharge_commands = {
	Idle = true,
	Siege = true,
}

function BaseRover:OnAutoRechargeThresholdReached()
	if auto_recharge_commands[self.command] then
		self:SetCommand("Idle")
	end
end

local charge_range = 2
function BaseRover:GetCableNearby(rad) --within charge range
	rad = (rad or charge_range)
	
	local lst = MapGet(self, "hex", rad + 1, "ElectricityGridElement", function(o) return o:GetGameFlags(const.gofUnderConstruction) == 0 end  )
	local c = FindNearestObject(lst, self)
	return c and HexAxialDistance(c, self) <= rad and c or false
end

function BaseRover:EqualizePowerWithOtherRover(other_rover, target_val)
	assert(other_rover ~= self)
	if not IsValid(other_rover) then return end
	self.recharging_other_rover = other_rover
	local spacing = const.GridSpacing
	
	while 
		IsValid(other_rover) 
		and HexAxialDistance(other_rover, self) > dest_tolerance 
		and self:Goto(other_rover, spacing * 3, spacing * 2) do
	end
	if not IsValid(other_rover) then return end
	self:SetPos(self:GetVisualPos())
	self:SetState("idle")
	self:Face(other_rover:GetPos(), 100)
	
	if self.battery_current <= 0 then
		--we already don't have battery, don't drain when battery thread stops because it will send us right back into "NoBattery" command
		self.battery_thread_data.accumulate_on_stop = false
	end
	self:StopBatteryThread()
	local target_battery = target_val or (self.battery_current + other_rover.battery_current) / 2
	
	if other_rover.command ~= "EqualizePowerWithOtherRover" or other_rover.recharging_other_rover ~= self then
		other_rover:SetCommand("EqualizePowerWithOtherRover", self, target_battery)
	end
	
	local delta = target_battery > self.battery_current and self.battery_hourly_equalization_rate or -self.battery_hourly_equalization_rate
	target_battery = delta > 0 and not other_rover:NeedBattery() and self.battery_max or target_battery
	
	if delta > 0 and self:HasMember("Siege") and self.sieged_state then
		self:Siege(true)
	end
	
	self:StartBatteryThread(delta, target_battery, function()
												self:SetCommand("Idle") 
											end)

	self:StartFX(delta > 0 and "Charging" or "Discharging", other_rover) --auto stop

	self:PushDestructor(function(self)
		if self.battery_thread_data and self.battery_thread_data.hourly_delta == delta then
			self:StopBatteryThread()
		end
		
		if self.battery_current <= 0 then
			self:SetCommand("NoBattery")
		end
		if (self.command ~= "EqualizePowerWithOtherRover" or self.recharging_other_rover ~= other_rover) and --not reentering command or reentering with different target
			IsValid(other_rover) and other_rover.command == "EqualizePowerWithOtherRover" and other_rover.recharging_other_rover == self then
			--avoid changing command if we are reentering the same command with the same target, because that causes infinite recursion
			other_rover:SetCommand("Idle")
		end
		self.recharging_other_rover = false
	end)

	Halt()
end

DefineClass.NotifyMeOnCableDeath = {
	__parents = {"Object"},
	entity = "InvisibleObject",
	parent_rover = false,
}

function NotifyMeOnCableDeath:Dispose()
	if IsValid(self) then
		self.parent_rover = nil
		DoneObject(self)
	end
end

function NotifyMeOnCableDeath:Done()
	if self.parent_rover then
		self.parent_rover:OnChargingCableDestroyed()
		self.parent_rover = nil
	end
end

function BaseRover:OnChargingCableDestroyed()
	self.electricity.parent_dome = false
	Wakeup(self.command_thread)
end

function BaseRover:GetShapeOffsetedAndRotatedGridPos()
	return WorldToHex(self)
end

--called by electricty grid on change of supply amount
function BaseRover:SetSupply(resource, amount)
	if resource == "electricity" and 
		self.electricity and self.electricity.current_consumption >= self.electricity.consumption and 
		self.electricity.consumption >= (self.battery_hourly_recharge_rate / const.RoverToGridElectricityScale) then
		--we got supplied with electricity
		self:StartBatteryThread(self.battery_hourly_recharge_rate)
		self.override_ui_status = self.command ~= "RechargeFromGrid" and "RechargeFromGrid" or false
		self:StartFX("Charging", self.battery_cable_used_for_recharge)
	elseif resource == "electricity" and self.battery_thread_data and self.battery_thread_data.hourly_delta > 0 then --we are currently charging
		self:StopBatteryThread()
		self.override_ui_status = "RechargeFromGridNoPower"
		self:StopFX()
		if self.waiting_wakeup_recharge then
			Wakeup(self.command_thread)
		end
	end
end

function BaseRover:CanInteractWithObject(obj, interaction_mode)
	if not IsValid(obj) then return false end
	if self.command == "Dead" then return false end
	if interaction_mode == false or interaction_mode == "recharge" then
		if IsKindOf(obj, "ElectricityGridElement") and not IsKindOf(obj, "ConstructionSite") and self:NeedBattery() then
			return true, T{9614, "<UnitMoveControl('ButtonB',interaction_mode)>: Recharge", self}  --RechargeFromGrid
		elseif obj ~= self and IsKindOf(obj, "BaseRover") and obj.command ~= "Dead" and obj.command ~= "Malfunction" and not IsKindOf(obj,"AttackRover") then
			return true, T{9615, "<UnitMoveControl('ButtonA',interaction_mode)>: Transfer Power", self} --EqualizePowerWithOtherRover
		end
	end
	
	if self.interaction_mode == false or self.interaction_mode == "default" or self.interaction_mode == "move" then --the 3 move modes..
		if IsKindOf(obj, "Tunnel") and obj.working then
			return true, T{9616, "<UnitMoveControl('ButtonA',interaction_mode)>: Use Tunnel",self} --UseTunnel
		end
	end
	
	return false
end

function BaseRover:InteractWithObject(obj, interaction_mode)
	if not IsValid(obj) then return false end
	if self.command=="Dead" then return false end
	
	if interaction_mode == false or interaction_mode == "recharge" then
		if IsKindOf(obj, "ElectricityGridElement") and not IsKindOf(obj, "ConstructionSite") and self:NeedBattery() then
			self:SetCommand("RechargeFromGrid", obj)
			SetUnitControlInteractionMode(self, false) --toggle button
		elseif obj ~= self and IsKindOf(obj, "BaseRover") and obj.command ~= "Dead"  then
			self:SetCommand("EqualizePowerWithOtherRover", obj)
			SetUnitControlInteractionMode(self, false) --toggle button
		end
	end
	
	if self.interaction_mode == false or self.interaction_mode == "default" or self.interaction_mode == "move" then --the 3 move modes..
		if IsKindOf(obj, "Tunnel") and obj.working then
			self:SetCommand("UseTunnel", obj)
			SetUnitControlInteractionMode(self, false) --toggle button
		end
	end
end

function BaseRover:CanBeControlled()
	if self.command=="Dead" or self.command == "Malfunction" or self.command == "NoBattery" then return false end
	return DroneBase.CanBeControlled(self)
end

function BaseRover:ToggleRechargeMode()
	if self.interaction_mode == "recharge" then
		SetUnitControlInteractionMode(self, false)
	else
		SetUnitControlInteractionMode(self, "recharge")
		SetUnitControlFocus(true, self)
	end
end

function BaseRover:ToggleRechargeMode_Update(button)
	local to_mode = self.interaction_mode ~= "recharge"
	button:SetIcon(to_mode and 
		"UI/Icons/IPButtons/recharge.tga" 
		or "UI/Icons/IPButtons/cancel.tga")
	button:SetRolloverTitle(T{40, "Recharge"})
	button:SetRolloverText(T{41, "Select a power cable or another vehicle to recharge the battery."})
	button:SetRolloverHint(to_mode and T{7509, "<left_click> Select target mode"} or T{7510, "<left_click> on target to select it  <right_click> Cancel"})
	button:SetRolloverHintGamepad(to_mode and T{7511, "<ButtonA> Select target mode"} or T{7512, "<ButtonA> Cancel"})
	button:SetEnabled(self:CanBeControlled())
end

function BaseRover:IsLowBattery()
	return self.battery_current < self.battery_max / 4
end

function BaseRover:GetBatteryPerc()
	return (self.battery_current * 100) / self.battery_max
end

--while we are part of the electricity grid we need to implement these
function BaseRover:GetSupplyGridConnectionShapePoints(supply_resource) 
	return self:GetShapePoints()
end

--define SupplyGrid object callbacks, so we don't assert.
function BaseRover:SetStorageState(supply_resource, state)
end

function BaseRover:ProduceSupply(resource, amount)
end

function BaseRover:ConsumeSupply(resource, amount)
	if self.waiting_wakeup_recharge and self.battery_current >= self.battery_max then
		Wakeup(self.command_thread)
	end
end

function BaseRover:UpdateVisuals(resource)
end

function BaseRover:UpdateAttachedSigns()
end

function BaseRover:GetUIWarning()
	if self.demolishing then
		return T{7322, "The Rover will be salvaged in <em><countdown></em> sec.",
			countdown = self.demolishing_countdown / 1000,
		}
	elseif self.command == "Malfunction" then
		return T{65, "Malfunctioned"}
	elseif self:IsKindOf("RCRover") and not self:HasEnoughBatteryToChargeDrone() and self.battery_current > 0 then -- for RCRovers
		return T{7323, "Low battery - Drones will not be recharged."}
	elseif self:IsLowBattery() then -- for all Rovers
		if self.battery_current > 0 then
			return T{7324, "Low battery"}
		else
			return T{7325, "Empty battery"}
		end
	end
	return self.operation_interrupted_reason
end

function BaseRover:OperationInterrupted(reason)
	self:SetState("idle")
	self.operation_interrupted_reason = reason
	RebuildInfopanel(self)
	self:PushDestructor(function(self)
		self.operation_interrupted_reason = false
		RebuildInfopanel(self)
	end)
	Halt()
end

function RoverStatus()
	return 
	{
		section = {name = T{49, "Status"}, icon = "UI/Icons/Sections/sensor.tga", rollover_t = {
			content = {title = T{49, "Status"}, descr = T{50, "Status and current task of this vehicle."}}
		}},
		T{51, "<ui_command>"},
		
		function(obj)
			if obj.command == "Siege" or obj.command == "Unsiege" then
				return false
			end	
			if obj.command=="Analyze" then
				return {
					{
						id = "ScanAnomalyProgress",
						ui = "simple_progress_bar",
						rollover_t = {content = {title = T{25, "Anomaly Scanning"}, descr = T{52, "Progress<right><percent(ScanAnomalyProgress)>"}}},
					},
					{id = false, ui = "space"},
				}
			elseif obj.command == "Malfunction" then
				return {
				{
					id = "MalfunctionRepairProgress",
					ui = "simple_progress_bar",
					rollover_t = {content = {title = T{53, "Malfunction"}, descr = T{54, "This vehicle has malfunctioned. It has to be repaired by Drones."}}},
				},
				{id = false, ui = "space"},
				}
			end
		end,
		
	}
end

RoverCommands = {
	Analyze = T{55, "Analyzing an Anomaly"},
	AutoTransportRoute = T{56, "On a transport route"},
	Construct = T{57, "Constructing"},
	Dead = T{58, "<red>This unit has been destroyed. Salvage for materials.<red>"},
	Disembarking = T{59, "Disembarking"},
	DumpCargo = T{60, "Unloading cargo at target coordinates"},
	EqualizePowerWithOtherRover = T{61, "Transfering power between vehicles"},
	ExitImpassable = T{62, "Moving to avoid obstruction"},
	Goto = T{63, "Travelling"},
	GotoFromUser = T{63, "Travelling"},
	Idle = T{6722, "Idle"},
	Load = T{64, "Loading resources at target coordinates"},	
	LoadWithNoTarget = T{64, "Loading resources at target coordinates"},	
	Malfunction = T{7610, "Waiting for repairs"},
	BeingRepaired = T{8028, "Undergoing repairs"},
	NoBattery = T{66, "Out of power"},
	PickupResource = T{67, "Loading resources"},
	RechargeFromGrid = T{68, "<green>Charging battery from Power grid</green>"},
	Goto_RechargeFromGrid = T{9804, "Going to recharge at target coordinates"},
	RechargeFromGridNoPower = T{69, "Trying to recharge battery, insufficient Power"},
	RepairDrone = T{70, "Repairing Drones"},
	Siege = T{71, "Commanding Drones"},
	TransferAllResources = T{72, "Transferring resources"},
	TransferResources = T{72, "Transferring resources"},
	Unload = T{73, "Unloading resources at target coordinates"},
	Unsiege = T{74, "Recalling remote Drones"},
	WaitingResources = T{7683, "Waiting for resources at construction site"},
	Work = T{76, "Performing maintenance"},
	UseTunnel = T{6723, "Going through a tunnel"},
	LoadingComplete = T{8490, "Loading complete"},
	OperationInterrupted = T{9827, "Command interrupted"},
	-- attack rover commands
	Roam = T{6724, "Roaming"},
	Attack = T{6725, "Attacking"},
	Reload = T{6726, "Reloading"},
}

function BaseRover:Getui_command()
	local ui_command = self.override_ui_status and RoverCommands[self.override_ui_status] and self.override_ui_status or self.command
	
	if ui_command == "Malfunction" and self:GetMalfunctionRepairProgress() > 0 then
		ui_command = "BeingRepaired"		
	end
	
	return RoverCommands[ui_command] or T{77, "Unknown"}
end

local function SelectRover(dir)
	local igi = GetInGameInterface()
	if igi and igi:GetVisible() then
		local rovers = UICity.labels.Rover or {}
		local idx = table.find(rovers, SelectedObj)
		local rover = idx and rovers[idx + dir] or rovers[dir == 1 and 1 or #rovers]
		ViewAndSelectObject(rover)
	end
end

function CycleRovers()
	NextRover()
end

function NextRover()
	SelectRover(1)
end

function PreviousRover()
	SelectRover(-1)
end

function PlaceRover()
	local o = PlaceObject("RCRover")
	o:SetPos(GetTerrainCursor())
end

function SetPaletteFromClassMember(obj)
	if obj.palettes then
		local palette_name = obj.palettes[1]
		if palette_name then
			local palette = EntityPalettes[palette_name]
			if palette then
				SetObjectPalette(obj, palette)
			end
		end
	end
end

function ReapplyAllVehiclePalettes()
	DelayedCall(100, function()
		MapForEach("map", "BaseRover", "CargoShuttle" , SetPaletteFromClassMember)
	end)
end

function GedOpReapplyAllColorization(socket, preset)
	ReapplyAllVehiclePalettes()
	ReapplyAllBuildingPalettes()
end

function BaseRover:GetSkins()
	local trailblazer_entity = g_TrailblazerSkins[self.class]
	local entity = g_Classes[self.class].entity
	if entity and trailblazer_entity then
		return { entity, trailblazer_entity }
	end
	return empty_table
end

--ui hyper links use this
function BaseRover:Select()
	SelectObj(self)
	ViewObjectMars(self:GetLogicalPos())
end

function BaseRover:CanDemolish()
	return not g_Tutorial and Demolishable.CanDemolish(self)
end

----

if Platform.editor then

function OnMsg.GatherFXActors(list)
	list[#list + 1] = "Rover"
end

end