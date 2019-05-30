GlobalVar("WorkRadiusShownForRover", {}) --list of rovers whos work radiuses are currently shown
GlobalVar("WorkRadiusShownForRoverReasons", {})

RCRoverResources = {
--[[
	{resource = "Concrete", capacity = 20, initial = 20},
	{resource = "Metals",   capacity = 20, initial = 20},
	{resource = "Polymers", capacity = 20, initial = 0},
]]
}

local RCRoverColorModifiers = {
	clear = RGBA(100, 100, 100, 0),
	low_power = RGBA(255, 216, 0, 0),
	no_power = RGBA(255, 0, 0, 0)
}

DefineClass.RCRover =
{
	__parents = { "RechargeStationBase", "BaseRover", "ComponentAttach", "DroneControl" },
	SelectionClass = "RCRover",
	entity = "DroneTruck",
	work_spot_task = "Workrover",
	work_spot_deposit = "Workrover",
	work_spot_drone_recharge = "Workrover",
	work_spot_drone_repair = "Workrover",
	
	properties = {
		{id = "UIWorkRadius", name = T(643, "Range"), editor = "number", default = const.RCRoverDefaultRadius, min = const.RCRoverMinRadius, max = const.RCRoverMaxRadius, no_edit = true, dont_save = true,},
	},
	
	work_radius = const.RCRoverDefaultRadius,
	
	--
	resource_capacity = {},
	resource_storage = {},
	scanning_start = false,
	scan_time = false,
	
	display_name = T(7678, "RC Commander"),
	display_name_pl = T(12091, "RC Commanders"),
	description = T(4477, "Remote-controlled vehicle that transports, commands and repairs Drones."),
	display_icon = "UI/Icons/Buildings/rcrover.tga",
	
	-- pin section
	pin_rollover = T(10417, "<description><newline><newline>Current status: <ui_command><newline><DronesStatusText><newline><left>Drones<right><drone(DronesCount)>"),
	pin_summary2 = T(4479, "<DronesCount><icon_Drone_small>"),
		
	work_speed_modifier = 100, --0->100, used for "body damage"
	rough_terrain_modifier = false,
		
	attached_drones = false,
	drone_attach_spot = "Drone",
	drone_entry_spot = "Droneentrance", --where the drone should be to start the embark visuals.
	guided_drone = false, --currently visually guided drone.
	working = false,
	waiting_on_drones = 0,
	accumulate_dust = false,
	siege_mode_update_delta = 10000,
	
	dont_interrupt_current_command = false,
	drones_waiting_to_embark = false,
	
	starting_drones = 4,
	
	embarking_drones = false,
	cc_update_thread = false,
	
	sieged_state = true, --whether the rover will try to auto siege or not
	siege_state_name = false, --instead of .commad == "Siege/Unsiege", so the commands may be used within other commands
	last_guided_drone = false, --for beautification purposes
	--
	malfunction_start_state = "malfunction",
	malfunction_idle_state = "malfunctionIdle",
	malfunction_end_state = "malfunctionEnd",
	
	rover_enter_state = "roverEnter",
	rover_exit_state = "roverExit",
	
	approaching_emergency_power_drones = false, --drones approaching us as a recharger.
	encyclopedia_id = "RCRover",
	can_pulse_recharge = false,
	siege_destro_pushed = false,

	palette = {"rover_accent","rover_base","rover_dark","none"},
	
	Getavailable_drone_prefabs = Building.Getavailable_drone_prefabs,
	exit_drones_thread = false,
}

function RCRover:Init()
	self.drones_waiting_to_embark = {}
	self.attached_drones = {}
	self.embarking_drones = {}
	self.approaching_emergency_power_drones = {}
	self.rough_terrain_modifier = ObjectModifier:new{target = self, prop = "move_speed"}
end

function RCRover:GameInit()
	self.resource_storage = table.copy(self.resource_storage)
	self.resource_capacity = table.copy(self.resource_capacity)

	--health and faults init
	self.current_faults = {}
		
	self:StartControlCenterUpdateThread()
end

function RCRover:StartControlCenterUpdateThread()
	assert(self.cc_update_thread == false)
	self.cc_update_thread = CreateGameTimeThread(function(self)
		local first_pass = true
		while true do
			--siege mode update thread.
			if self.working then
				local city = self.city or UICity
				RecursiveCall(self, "BuildingUpdate", first_pass and 0 or self.siege_mode_update_delta, city.day, city.hour)
				first_pass = false
			end
			
			first_pass = WaitWakeup(self.working and self.siege_mode_update_delta or nil)
		end
	end, self)
end

function RCRover:WakeControlCenterUpdateThread()
	Wakeup(self.cc_update_thread)
end

function RCRover:SpawnDrone()
	if #self.drones >= self:GetMaxDrones() then
		return
	end
	local drone = self.city:CreateDrone()
	drone.init_with_command = false
	drone:SetCommandCenter(self)
	self:DroneEnter(drone, true)
	
	if self.siege_state_name == "Siege" then
		self:ExitDronesOutOfCommand()
	end
	
	return true
end

--recharge station funcs
function RCRover:LeadIn(drone)
	self.drone_charged = drone
	
	drone:GotoUnitSpot(self, "Charge", true) --get in pos to charge
	local pos, angle = self:GetSpotLoc(self:GetSpotBeginIndex("Charge"))
	drone:SetAngle(angle, 200)
	
	drone:StartFX("EmergencyRecharge")
	drone:PlayState( "rechargeDroneStart" )
end

function RCRover:LeadOut(drone)
	drone:StopFX()
	PlayFX("RechargeStation", "end", self, drone)
	drone:PlayState("rechargeDroneEnd")
	if drone == self.drone_charged then
		self.drone_charged = false
	end
	drone.force_go_home = true --make drone move away if there is nothing else to do
end

function RCRover:DroneApproach(drone, reason)
	if reason == "charge" then
		drone:ExitHolder(self)
		
		local go_to_pos = self:GetSpotLoc(self:GetSpotBeginIndex("Charge"))
		local drone_rad = drone:GetRadius()
		
		self.approaching_emergency_power_drones = self.approaching_emergency_power_drones or {}
		table.insert(self.approaching_emergency_power_drones, drone) --can be filtered, but they should all be in cmd == "EmergencyPower"
		drone:PushDestructor(function(drone)
			table.remove_entry(self.approaching_emergency_power_drones, drone)
		end)
		local ret = drone:Goto(go_to_pos, drone_rad * 3, drone_rad * 1) --get near
		drone:PopAndCallDestructor()
		return ret
	else
		return BaseRover.DroneApproach(self, drone, reason)
	end
end
--embark funcs, drone shoul be @ droneentrance spot for visuals to make sense.
function RCRover:DroneEnter(drone, skip_visuals)
	assert(#self.attached_drones <= self:GetMaxDrones())
	assert(drone.command == "DespawnAtHub" or table.find(self.drones, drone) ~= nil)
	assert(skip_visuals or (self.guided_drone == false or self.guided_drone == drone))
	assert(IsValid(self) and IsValid(drone))
	assert(not table.find(self.attached_drones, drone))
	
	self.guided_drone = not skip_visuals and drone or self.guided_drone
	
	if drone.demolishing then
		drone:ToggleDemolish()
	end
	
	local attach_spot_idx = self:GetSpotBeginIndex(self.drone_attach_spot)
	
	drone:NightLightDisable()
	if not skip_visuals then
		local p = self:GetSpotLoc(attach_spot_idx)
		drone:Face(p, 100)
		drone:SetPos(p:SetZ(drone:GetVisualPos():z()), GetAnimDuration(drone:GetEntity(), self.rover_enter_state) - 1)
		table.insert(self.embarking_drones, drone)
		local is_in_drone_command_thread = CurrentThread() == drone.command_thread
		if is_in_drone_command_thread then
			drone:PushDestructor(function(drone)
				if self.guided_drone == drone then self.guided_drone = false end
				table.remove_entry(self.embarking_drones, drone)
				self:WakeFromWaitingOnDroneToEnterOrExit()
				self:WakeFromUnsiegeMode()
			end)
		end
		
		if self.guided_drone == drone then --clean drone early for faster drone embarkment.
			self.guided_drone = false
			if self.siege_state_name == "Unsiege" and #self.drones_waiting_to_embark > 0 then --if diff command we have been interrupted, don't queue up so the interrupt can pass.
				Wakeup(self.drones_waiting_to_embark[#self.drones_waiting_to_embark].command_thread)
			end
		end
		
		if self == SelectedObj then
			SelectionArrowRemove(drone)
		end
		
		drone:PlayState(self.rover_enter_state, 1, const.eDontCrossfade)
		if not is_in_drone_command_thread and not IsValid(drone) then
			if self.guided_drone == drone then self.guided_drone = false end
			table.remove_entry(self.embarking_drones, drone)
			self:WakeFromWaitingOnDroneToEnterOrExit()
			self:WakeFromUnsiegeMode()
			return
		elseif is_in_drone_command_thread then
			drone:PopDestructor()
		end
		drone:SetState("idle", const.eDontCrossfade)
	end

	if self:HasSpot(self.drone_attach_spot) then
		attach_spot_idx = self:GetSpotBeginIndex(self.drone_attach_spot)	-- can change through skins
		self:Attach(drone, attach_spot_idx)
	else
		self:Attach(drone)
	end

	table.insert(self.attached_drones, drone)

	if skip_visuals and self.guided_drone == drone then
		self.guided_drone = false
	end

	if not skip_visuals then
		table.remove_entry(self.embarking_drones, drone)
		self:WakeFromWaitingOnDroneToEnterOrExit()
	end

	self:WakeFromUnsiegeMode()

	drone:SetCommand("Embark")
end

function RCRover:InterruptAllDrones()
	local drones = self.drones
	for i = 1, #drones do
		local drone = drones[i]
		if not drone:IsDisabled() and not self:IsDroneEmbarked(drone) and not table.find(self.embarking_drones, drone) and drone.command ~= "Idle" and drone.command ~= "DroneExit" then
			drone:SetCommand("Reset")
		end
	end
end

function RCRover:DroneExit(drone, skip_visuals)
	assert(table.find(self.attached_drones, drone))
	assert(self.command_thread ~= CurrentThread())
	assert(skip_visuals or (self.guided_drone == false or self.guided_drone == drone))
	
	self.guided_drone = not skip_visuals and drone or self.guided_drone
	table.remove_entry(self.attached_drones, drone)
	assert(not table.find(self.attached_drones, drone))
	drone:Detach()
	drone:PushDestructor(function(drone)
		assert(self.guided_drone == drone)
		self.guided_drone = false
		self:WakeFromWaitingOnDroneToEnterOrExit()
	end)
	
	drone:NightLightEnable()
	if not skip_visuals then
		local entry_spot_idx = self:GetSpotBeginIndex(self.drone_entry_spot)
		local p = self:GetSpotLoc(entry_spot_idx)
		drone:Face(p, 0)
		drone:SetPos(p, GetAnimDuration(drone:GetEntity(), self.rover_exit_state) - 1)
		drone:PlayState(self.rover_exit_state, 1, const.eDontCrossfade + const.eDontCrossfadeNext) --since the anims are reversed, don't crossfade ever.
		if not IsValid(drone) then
			drone:PopAndCallDestructor()
			return
		end
		drone:SetPos(p)
	end
	drone:PopAndCallDestructor()

	if self == SelectedObj then
		SelectionArrowAdd(drone)
	end

	if skip_visuals then
		drone:SetPos(GetRandomPassableAround(self:GetPos(), 25*guim, 15*guim))
		drone:SetCommand("Idle")
	else
		if self.siege_state_name == "Siege" then --if we changed the command, don't make the drone go away
			local home_pos = drone:GetPos() + 2*(drone:GetPos() - self:GetPos()) --offset home pos a bit for better visual results
			drone:SetCommand("GoHome", 1*guim, 15*guim, home_pos)
		else
			drone:SetCommand("Idle")
		end
	end
end

function RCRover:OnSkinChanged(skin, palette)
	local drone = self.guided_drone
	if not drone then return end
	
	local spot_idx = self:GetSpotBeginIndex(self.command == "Siege" and self.drone_entry_spot or self.drone_attach_spot)
	local pos = self:GetSpotLoc(spot_idx)
	local time = drone:TimeToAnimEnd()
	drone:SetPos(pos, time)
end

function RCRover:IsMalfunctioned()
	return self.command == "Malfunction"
end

function RCRover:RotateAwayFromDomes()
	--rotate so that exit point is not inside a dome
	local entry_spot_idx = self:GetSpotBeginIndex(self.drone_entry_spot)
	local p = self:GetSpotLoc(entry_spot_idx)
	local q, r = WorldToHex(p)
	
	
	local blds = HexGridGetObjects(ObjectGrid, q, r)
	
	local function IsDomeOrDomeConstr(blds)
		for i = 1, #blds do
			local obj = blds[i]
			if obj and (IsKindOf(obj, "Dome") or (IsKindOf(obj, "ConstructionSite") and IsKindOf(obj.building_class_proto, "Dome") and not terrain.IsPassable(p)))
				or IsKindOf(obj, "DomeInterior") then
				return true
			end
		end
		return false
	end
	local c = 0
	while c < 3 and IsDomeOrDomeConstr(blds) do
		--there is a dome @ the exit point
		self:SetAngle(self:GetAngle() + 90 * 60, 400)
		Sleep(400)
		p = self:GetSpotLoc(entry_spot_idx)
		q, r = WorldToHex(p)
		blds = HexGridGetObjects(ObjectGrid, q, r)
		c = c + 1
	end
	
	return c < 3 or not (IsDomeOrDomeConstr(blds))
end

function RCRover:HasIncomingRechargeDrones()
	return #(self.approaching_emergency_power_drones or empty_table) > 0 or  #self.drones_in_queue_to_charge > 0
end

function RCRover:InterupIncomingDronesForRecharge()
	--notify approaching drones
	for i = #(self.approaching_emergency_power_drones or empty_table), 1, -1 do --reseting the cmd should pop them out of the table, although not immidiately..
		self.approaching_emergency_power_drones[i]:ResetEmergencyPowerCommand()
	end
	
	--notify queued drones
	for i = #self.drones_in_queue_to_charge, 1, -1 do
		self.drones_in_queue_to_charge[i]:ResetEmergencyPowerCommand()
	end
end

function RCRover:IsRechargerWorking()
	return self.working
end

function RCRover:SetWorking(...)
	--ignore this, it comes from base bld and tries to fiddle with our working state
end

function RCRover:OnSiege(siege)
end

function RCRover:Siege(do_not_halt) --wip name
	self.siege_state_name = "Siege"
	self:ClearPath()
	self:SetPos(self:GetVisualPos())

	if not self:RotateAwayFromDomes() then --we failed to find a good siege spot
		self.sieged_state = false
		self:SetCommand("Unsiege")
		return
	end
	
	--vis
	if self:GetState() ~= GetStateIdx("deployIdle") then
		PlayFX("RoverDeploy", "start", self)
		self:PlayState("deployStart")
		self:SetState("deployIdle", const.eDontCrossfade)
	end
	
	self.working = true --as in command center working
	self.under_construction = {} --init early or we get asserts in finddemandrequest till the update constructions thread boots up
	self.accept_requester_connects = true
	self:ConnectTaskRequesters()
	self:GatherOrphanedDrones()
	self:NotifyDronesOnRechargeStationFree()
	-------------SIEGE DESTRO---------------------
	if SelectedObj == self then
		self:ShowWorkRadius(true, "selected_and_sieged")
	end
	self.siege_destro_pushed = true
	self.override_ui_status = "Siege"
	self:PushDestructor(function(self)
		--if a move cmd is passed or something,
		--stop acting as a cc.
		self.override_ui_status = false
		self.siege_destro_pushed = false
		self:DisconnectTaskRequesters()
		self:InterruptAllDrones()
		self.under_construction = false
		self.working = false
		self.accept_requester_connects = false
		self:OnSiege(false)
		self:RestrictAllDrones(false)
		
		self:InterupIncomingDronesForRecharge()
		
		--notify charged drone, needs to be done when drone is in charge's lead in
		if self.drone_charged then
			if IsValid(self.drone_charged) then
				local battery = self.drone_charged.battery
				local cmd = "Idle"
				if battery <= g_Consts.DroneEmergencyPower then
					cmd = battery <= 0 and "NoBattery" or "EmergencyPower"
				end

				if not self.drone_charged:IsDisabled() then
					if cmd == "NoBattery" then
						self.drone_charged:UseBattery(0) --so setnobattery command is in 1 place
					else
						self.drone_charged:SetCommand(cmd)
					end
				end
			end
			self.drone_charged = false
		end
		
		if not IsValid(self) then
			return
		end
		
		if self.command ~= self.siege_state_name then
			self.siege_state_name = (self.command == "Siege" or self.command == "Unsiege" and self.command) or false
		end
		
		if self.drone_charged then
			Sleep(2000) --charging drone should dehook when our .working == false
		end
		
		--if a drone is currently exiting, wait up
		while self.guided_drone or #self.embarking_drones > 0 do --wait for exiting drone to exit
			WaitWakeup(2000)
		end
		
		if not self.siege_state_name and self:GetState() == GetStateIdx("deployIdle") then
			--self:PlayState("deployEnd")
			self:SetState("idle")
		end
		
		if SelectedObj == self then
			self:ShowWorkRadius(self.working, "selected_and_sieged")
		end
	end)
	
	self:OnSiege(true)
	self:ExitAllDrones()
	self:RestrictAllDrones(true)
	self:WakeControlCenterUpdateThread()
	
	if not do_not_halt and self.command_thread == CurrentThread() then
		Halt()
	end
end

function RCRover:ExitDronesOutOfCommand()
	if not self.exit_drones_thread then
		self.exit_drones_thread = CreateGameTimeThread(RCRover.ExitAllDrones, self)
	end
end

function RCRover:RestrictAllDrones(restrict)
	local v1, v2 = restrict and self:GetPos() or point30, restrict and const.DroneRestrictRadius or 0
	for i = 1, #self.drones do
		local d = self.drones[i]
		d:RestrictArea(v1, v2)
	end
end

function RCRover:ExitAllDrones()
	if self.exit_drones_thread and self.exit_drones_thread ~= CurrentThread() then
		DeleteThread(self.exit_drones_thread)
		self.exit_drones_thread = CurrentThread()
	end
	
	self:CleanupGuidedDrones()
	
	while #self.attached_drones > 0 and self.siege_state_name == "Siege" do
		local drone = self.attached_drones[#self.attached_drones]
		if IsValid(drone) then
			if drone.command_center ~= self then
				--damage control, this should never happen
				assert(false, "Rover has foreign drones attached")
				drone:Detach()
				table.remove(self.attached_drones)
			else
				while self.guided_drone or #self.embarking_drones > 0 do
					Sleep(1000)
				end
				if IsValid(drone) then
					assert(self.guided_drone == false)
					self.guided_drone = drone
					drone:SetCommand("ExitRover", self)
					if not WaitWakeup(10000) then
						self:CleanupGuidedDrones()
					end
				end
			end
		else
			print("dead drone removed from rover attached drones")
			table.remove_entry(self.drones, drone)
			self.attached_drones[#self.attached_drones] = nil
		end
	end
	
	if self.exit_drones_thread and self.exit_drones_thread == CurrentThread() then
		self.exit_drones_thread = false
	end
end

function RCRover:GetSelectionRadiusScale()
	if WorkRadiusShownForRover[self] then
		return self.work_radius
	else
		return 0
	end
end

function SavegameFixups.CleanStuckGuidedDrones()
	MapForEach("map", "RCRover", RCRover.CleanupGuidedDrones)
end

function RCRover:CleanupGuidedDrones()
	if self.guided_drone and self.guided_drone.command ~= "DespawnAtHub" and not table.find(self.drones, self.guided_drone) then
		print("RCRover: Guided drone has failed to clear")
		self.guided_drone = false
	end
	
	for i = #self.embarking_drones, 1, -1 do
		local d = self.embarking_drones[i]
		if d.command ~= "DespawnAtHub" and not table.find(self.drones, d) then
			print("RCRover: embarking_drones drone has failed to clear")
			table.remove(self.embarking_drones, i)
		end
	end	
end

function RCRover:Unsiege()
	self.siege_state_name = "Unsiege"
	PlayFX("RoverUnsiege", "start", self)
	--vis
	if self:GetState() ~= GetStateIdx("deployIdle") and self:GetState() ~= GetStateIdx("deployStart") then
		PlayFX("RoverDeploy", "start", self)
		self:PlayState("deployStart")
		self:SetState("deployIdle", const.eDontCrossfade)
	end
	
	self.last_guided_drone = IsValid(self.last_guided_drone) and table.find(self.drones, self.last_guided_drone) and self.last_guided_drone or false
	self.guided_drone = self.guided_drone or self.last_guided_drone or false
	self.last_guided_drone = false
	self.waiting_on_drones = 0
	self:CleanupGuidedDrones()
	
	for i = #self.drones, 1, -1 do
		local drone = self.drones[i]
		if not drone:IsDisabled() then
			if drone.command ~= "Embark" and drone.command ~= "RecallToRover" then --drone already inside.
				drone:SetCommand("RecallToRover", self)
			end
			
			self.waiting_on_drones = self.waiting_on_drones + 1
		else
			if self == SelectedObj then
				SelectionArrowRemove(drone)
			end
			drone:SetCommandCenter(drone:TryFindNewCommandCenter())
		end
	end
	-------------UNSIEGE DESTRO---------------------
	self:PushDestructor(function(self)
		while #self.embarking_drones > 0 do --wait for embarking drones do finish embarking
			WaitWakeup(10000)
		end
		
		if self.command ~= self.siege_state_name then
			self.siege_state_name = (self.command == "Siege" or self.command == "Unsiege" and self.command) or false
			
			if not self.siege_state_name then
				--there is another possibility, we are in goto command and we'll provoke unsiege
				if self.command == "Goto" and self:ShouldUnsiegeDueToGotoDist(self.goto_target) then
					self.siege_state_name = "Unsiege"
				end
			end
		end
		PlayFX("RoverUnsiege", "end", self)
		if self.siege_state_name == "Unsiege" then return end --don't provoke drone destros if we are entering the same command
		
		local embark_entry_pos = self:GetSpotLoc(self:GetSpotBeginIndex(self.drone_entry_spot))
		local home_pos = (embark_entry_pos - self:GetPos()) * 2 + embark_entry_pos
		for i = 1, #self.drones do
			local d = self.drones[i]
			if not self:IsDroneEmbarked(d) and not d:IsDisabled() and
				not table.find(self.embarking_drones, d) then
				if IsCloser2D(d:GetVisualPos(), embark_entry_pos, d:GetRadius() * 3) then
					--drone is invading our personal space, send it away.
					d:SetCommand("GoHome", 1*guim, 15*guim, home_pos)
				else
					d:SetCommand("Reset")
				end
			end
		end
		
		if SelectedObj == self then
			self:ShowWorkRadius(self.working, "selected_and_sieged")
		end
		
		if self.siege_state_name == false and self:GetState() == GetStateIdx("deployIdle") then
			PlayFX("RoverDeploy", "end", self)
			--self:PlayState("deployEnd")
			self:SetState("idle")
		end
	end)
	
	while self.waiting_on_drones > #self.attached_drones do
		WaitWakeup(10000)
	end
	
	while self.guided_drone or #self.embarking_drones > 0 do
		Sleep(1000)
	end
	
	self:PopDestructor()
	PlayFX("RoverUnsiege", "end", self)
	
	if self:GetState() == GetStateIdx("deployIdle") then
		PlayFX("RoverDeploy", "end", self)
		--self:PlayState("deployEnd")
		self:SetState("idle")
	end
	
	if SelectedObj == self then
		self:ShowWorkRadius(false, "selected_and_sieged")
	end
end

function RCRover:GetMaxDrones()
	return g_Consts.RCRoverMaxDrones
end

function RCRover:IsDroneEmbarked(drone)
	return drone.command == "Embark" --can also check .attached_drones
end

local MaxBuildingPriority = const.MaxBuildingPriority
function RCRover:OnRemoveBuilding(building)
	if not self.sieged_state or self.siege_state_name == "Unsiege" then --for this line
		for _, drone in ipairs(self.drones) do
			if BuildingFromGotoTarget(drone.goto_target) == building then
				drone:SetCommand("Idle")
			end
		end
	end
end

--for debug (0119569) purposes, tests if queues have emptied correctly.
function RCRover:DebugCheckIfAllQueuesAreEmpty()
	for priority = -1, MaxBuildingPriority do
		local s_requests = self.supply_queues[priority]
		local d_requests = self.demand_queues[priority]
		local priority_queue = self.priority_queue[priority]
		assert(#priority_queue <= 0)
		for k, v in pairs(s_requests) do
			for i = 1, #v do
				assert(#v[i] <= 0)
			end
		end
		for k, v in pairs(d_requests) do
			for i = 1, #v do
				assert(#v[i] <= 0)
			end
		end
	end
end
--[[
function RCRover:ConnectTaskRequesters()
	self:DebugCheckIfAllQueuesAreEmpty()
	DroneControl.ConnectTaskRequesters(self)
end

function RCRover:DisconnectTaskRequesters()
	DroneControl.DisconnectTaskRequesters(self)
	self:DebugCheckIfAllQueuesAreEmpty()
end
]]

function SavegameFixups.WakeStuckRovers()
	MapForEach("map", "RCRover", RCRover.WakeFromWaitingOnDroneToEnterOrExit)
	MapForEach("map", "Drone", function(o)
		if o.command == "Embark" then
			o:SetCommand("Embark")
		end
	end)
end

function RCRover:WakeFromWaitingOnDroneToEnterOrExit()
	local t_to_wake = IsValidThread(self.exit_drones_thread) and self.exit_drones_thread or IsValidThread(self.thread_running_destructors) and self.thread_running_destructors or self.command_thread --always wake the destructor thread first
	Wakeup(t_to_wake)
end

function RCRover:WakeFromUnsiegeMode()
	if self.siege_state_name == "Unsiege" then
		if self.waiting_on_drones <= #self.attached_drones then
			local t_to_wake = IsValidThread(self.thread_running_destructors) and self.thread_running_destructors or self.command_thread --always wake the destructor thread first
			Wakeup(t_to_wake)
		end
	end
end

function RCRover:DroneFailedToRecall(drone)
	if self.guided_drone == drone then
		self.guided_drone = false
	end
		
	if self.siege_state_name ~= "Unsiege" or drone.command == "RecallToRover" then 
		--unsiege was intentionally interrupted, so don't orphan drones.
		--or, through a bunch of resets and recalls, the next command is the same as the one who's destructor is being called.
		return
	else
		if self == SelectedObj then
			SelectionArrowRemove(drone)
		end
		
		table.remove_entry(self.drones, drone)
		
		self.waiting_on_drones = self.waiting_on_drones - 1
		if IsValid(drone) and (drone.command_center == self or drone.command_center == false) then --don't look for new command center if we already got one
			drone:SetCommandCenter(drone:TryFindNewCommandCenter())
		end
		
		self:WakeFromUnsiegeMode()
	end
end

function RCRover:CanInteractWithObject(obj, interaction_mode)
	if interaction_mode ~= "recharge" and IsKindOf(obj, "Drone") then
		if obj:IsDead() then
			return false
		elseif obj:IsLowBattery() then
			return true, T{9615, "<UnitMoveControl('ButtonA',interaction_mode)>: Transfer Power", self}
		elseif obj:IsBroken() then
			return true, T{9720, "<UnitMoveControl('ButtonA',interaction_mode)>: Repair", self}
		end	
		return false
	end
	return BaseRover.CanInteractWithObject(self, obj, interaction_mode)
end

function RCRover:InteractWithObject(obj, interaction_mode)
	if self.command=="Dead" then return false end
	if interaction_mode ~= "recharge" and obj:IsKindOf("Drone") then
		if not obj:IsBroken() then 
			return 
		end
		if obj.repair_drone then --only do this if we are gona exec the cmd immidiately.
			local drone = obj.repair_drone
			if drone:IsKindOf("RCRover") then
				return
			end
			obj.repair_drone = self		-- assign it earlier to prevent a Drone to mark it in the meanwhile
			drone:SetCommand("Idle")
		end
		GetCommandFunc(self)(self, "RepairDrone", obj, obj.battery_max)
	end
	
	return BaseRover.InteractWithObject(self, obj, interaction_mode)
end

function RCRover:GoToPos(pos)
	local func = GetCommandFunc(self)
	if self.QueueCommand == func and self.command == "Siege" and not self:HasMoreCommandsAfterThis() then
		func = self.SetCommand
	end
	func(self, "Goto", pos)
end

function RCRover:ShouldUnsiegeDueToGotoDist(...) --<-- .. are goto params
	if self:AreThereDronesOutside() then
		local args = {...}
		local dest_pt
		if IsPoint(args[1]) then
			dest_pt = args[1]
		else
			if type(args[2]) == "string" and args[1]:HasSpot(args[2]) then --spot name?
				local idx = args[1]:GetNearestSpot("idle", args[2], self)
				dest_pt = args[1]:GetSpotPos(idx)
			elseif args[1] then
				dest_pt = args[1]:GetPos()
			end
		end
		
		if dest_pt and not IsCloser2D(self, dest_pt, g_Consts.RCRoverDistanceToProvokeAutomaticUnsiege) then
			return true
		end
	end
	
	return false
end

--if goto dist is too great and we are not sieged, or have drones outside, siege first then goto
function RCRover:Goto(...)
	if self:ShouldUnsiegeDueToGotoDist(...) then
		--we should provoke unsiege, don't change cmd because we cant restore it properly
		self:Unsiege()
		--self.sieged_state = false --toggle this if you don't want it to auto siege when it reaches dest.
	end
	
	return BaseRover.Goto(self, ...)
end

function RCRover:AddResource(amount, resource)
	if amount < 0 then
		self:GetResource(resource, -amount)
	else
		self.resource_storage[resource] = Min(self.resource_storage[resource] + amount, self.resource_capacity[resource])
	end
end

function RCRover:GetResource(resource, amount)
	amount = Min(amount, self.resource_storage[resource])
	self.resource_storage[resource] = self.resource_storage[resource] - amount
		
	return amount
end

function RCRover:GetEmptyStorage(resource)
	return self.resource_capacity[resource] - self.resource_storage[resource]
end

function RCRover:SetCommand(command, ...)
	if command == "Malfunction" and self.command == "Malfunction" then
		self.dont_clear_queue = nil
		return
	end
	
	if self.dont_interrupt_current_command then
		self.dont_clear_queue = nil
		return 
	end
	--exec:
	if (command == "Unsiege" or command == "Goto") and self.guided_drone then --if a drone is currently exiting store it so it can enter first
		self.last_guided_drone = self.guided_drone
	else
		self.last_guided_drone = false
	end
	
	if command == "Siege" or command == "Unsiege" then
		self.siege_state_name = command
	else
		self.siege_state_name = false
	end
	
	if command == "Goto" then
		self.goto_target = ... --store these early on, so we can deduce in destros whether we will begin unsieging or not in the begining of the goto.
	end
	
	BaseRover.SetCommand(self, command, ...)
end
------------------------------------------------------------------------------------------------------------
--health and faults
------------------------------------------------------------------------------------------------------------
local rover_damage_types = {
	"RoughTerrain",
	"DustDisaster",
	"MeteorsExplosives",
	"Other",
}

function RCRover:ApplyDamageFaultFromDamageType(damage_type)
	if damage_type == "RoughTerrain" then
		--tire damage, -20% move speed
		self.rough_terrain_modifier:Change(0, -20)
	elseif damage_type == "DustDisaster" then
		--nothing (used to be el production dmg)
	elseif damage_type == "MeteorsExplosives" then
		--body damage, -33% work speed
		self.work_speed_modifier = Max(self.work_speed_modifier - 33, 0)
	elseif damage_type == "Other" then
		--nothing (used to be battery dmg)
		RebuildInfopanel(self)
	else
		assert(false, "Unrecognised damage type!")
	end
	
	self.current_faults[#self.current_faults + 1] = damage_type
end

----- commands
function RCRover:AreThereDronesOutside()
	return #self.drones > #self.attached_drones
end

function RCRover:OnAutoRechargeThresholdReached()
	if self.sieged_state and self.command == "Idle" then
		Wakeup(self.command_thread)
	elseif self.command == "Idle" or self.command == "Siege" then
		self:SetCommand("Idle")
	end
end

function RCRover:CanHaveMoreDrones()
	return self.command ~= "Dead" and DroneControl.CanHaveMoreDrones(self)
end

function RCRover:Idle()
	self.dont_interrupt_current_command = false
	
	if self:GetParent() then
		-- attached in the rocket, disable the command system and wait for the rocket to lead us out and re-enable it
		self.sieged_state = false --so it doesn't auto siege during disembarkation (drones get in the way), rocket should re-enable.
		self:SetCommand(false)
		return
	end
	
	self:Gossip("Idle")
	self:SetState("idle")
	
	if self.sieged_state then
		if not self.siege_destro_pushed then
			self:Siege(true)
		end
		Halt()
	else
		if self:AreThereDronesOutside() then
			self:SetCommand("Unsiege")
		else
			Halt()
		end
	end
end

function RCRover:RepairDrone(drone, power)
	if drone.repair_drone and drone.repair_drone ~= self then
		local other_drone = drone.repair_drone
		if IsKindOf(other_drone, "RCRover") then
			return
		end
		other_drone:SetCommand("Reset") --interrupt
	end

	--hack, give drones sum power so they don't go into emergency power while we are loading them in the rover.
	if drone.command ~= "NoBattery" and drone.battery <= g_Consts.DroneEmergencyPower * 2 then
		drone.battery = g_Consts.DroneEmergencyPower * 2 + 1
	end
	
	local drone_initial_battery = drone.battery
	BaseRover.RepairDrone(self, drone, power, false)
	
	if IsValid(drone) and not drone:IsBroken() then --we repaired the guy
		if #self.drones < self:GetMaxDrones() and drone.is_orphan then --we have room for another drone
			self.dont_interrupt_current_command = true
			drone:SetCommandCenter(self)
			local v = self:GetPos() - drone:GetPos()
			v = self:GetPos() + v
			self:Face(v, 400) --face away
			
			PlayFX("RoverDeploy", "start", self)
			self:PlayState("deployStart")
			self:SetState("deployIdle", const.eDontCrossfade)
			
			self.dont_interrupt_current_command = false
			self:SetCommand("Unsiege")
		end
	end
end


function RCRover:AbandonAllDrones()
	for i = 1, #self.attached_drones do
		self.attached_drones[i]:Detach()
	end
	self.attached_drones = {}
	DroneControl.AbandonAllDrones(self)
end

RCRover.OnDead = RCRover.AbandonAllDrones
function RCRover:OnPreDisappear()
	--abandon only drones that are currently outside
	for i = #self.drones, 1, -1 do
		local drone = self.drones[i]
		if drone:GetParent() == nil then
			drone:SetCommandCenter(false)
			if not drone:IsDisabled() then
				drone:SetCommand("WaitingCommand")
			end
			SelectionArrowRemove(drone)
		end
	end
end

function RCRover:GotoAndEmbark(rocket)
	self:Unsiege()
	BaseRover.GotoAndEmbark(self, rocket)
end

----------------------------------------------------------------------------
--                        Info panel
----------------------------------------------------------------------------
local resource_items = {}
for i, entry in ipairs(RCRoverResources) do
	local resource = entry.resource
	
	RCRover.resource_storage[resource] = entry.initial * const.ResourceScale
	RCRover.resource_capacity[resource] = entry.capacity * const.ResourceScale
	
	table.insert(RCRover.properties, {id = resource, editor = "number", min = 0, max = 100000, name = Resources[resource].display_name, default = 0, scale = const.ResourceScale, category = "Resources"})
	
	local field = string.format("<name><right><%s>/%d", resource, entry.capacity)
	table.insert(resource_items, T{field, name = Resources[resource].display_name})
	
	RCRover["Get" .. resource] = function(self)
		return self.resource_storage[resource] / const.ResourceScale
	end
	RCRover["Set" .. resource] = function(self, val)
		self.resource_storage[resource] = val * const.ResourceScale
	end
end

function RCRover:GetScanAnomalyProgress()
	return self.scanning_start and MulDivRound(GameTime() - self.scanning_start, 100, self.scan_time) or 0
end

function RCRover:BuildWithRover()
	OpenXBuildMenu(nil)
	BuildingWithRCRover = self
end

--ui only!
function RCRover:ToggleSiegeMode(broadcast)
	local command, state
		
	if self.sieged_state then
		command, state = "Unsiege", false --no longer automatically sieging
	else
		command, state = "Siege", true
	end
	if broadcast then
		local list = self.city.labels.RCRover or empty_table
		for _, obj in ipairs(list) do
			if obj.siege_state_name ~= command then
				if not obj:IsCurrentCommandPartOfQueue() then
					obj:SetCommand(command)
				end
				obj.sieged_state = state
			end
		end
	else
		if not self:IsCurrentCommandPartOfQueue() then --if table, we are part of a queue, dont interrupt
			self:SetCommand(command)
		end
		self.sieged_state = state
	end
	
	RebuildInfopanel(self)
end

function RCRover:ToggleSiegeMode_Update(button)
	button:SetEnabled(self:CanBeControlled())
	if self.sieged_state then
		button:SetIcon("UI/Icons/IPButtons/open.tga")
		button:SetRolloverTitle(T(4485, "Recall Drones"))
		button:SetRolloverText(T(4487, "Recall all Drones commanded by this Rover."))
		button:SetRolloverHint(T{8023, "<left_click> Recall <newline>Ctrl + <left_click>Recall for all Commanders",self})
		button:SetRolloverHintGamepad(T(8024, "<ButtonA> Recall <newline><ButtonX> Recall for all Commanders"))
	else
		button:SetIcon("UI/Icons/IPButtons/close.tga")
		button:SetRolloverTitle(T(4484, "Deploy Drones"))
		button:SetRolloverText(T(4486, "Deploy Drones and remain on standby at this location."))
		button:SetRolloverHint(T{8025, "<left_click> Deploy <newline>Ctrl + <left_click>Deploy for all Commanders",self})
		button:SetRolloverHintGamepad(T(8026, "<ButtonA> Deploy <newline><ButtonX> Deploy for all Commanders"))
	end
end

function RCRover:ShowWorkRadius(show, reason)
	local reasons = WorkRadiusShownForRoverReasons[self] or { }
	
	if show then
		if next(reasons) == nil then
			WorkRadiusShownForRover[self] = true
			PlayFX("ShowWorkRadius", "start", self)
		end
		
		reasons[reason] = true
	else
		if WorkRadiusShownForRover[self] then
			reasons[reason] = nil
			if next(reasons) == nil then
				PlayFX("ShowWorkRadius", "end", self)
				WorkRadiusShownForRover[self] = nil
			end
		end
	end
	
	if next(reasons) then
		WorkRadiusShownForRoverReasons[self] = reasons
	else
		WorkRadiusShownForRoverReasons[self] = nil
	end
end

function SavegameFixups.MultiselectionRoverWorkRadius()
	if not WorkRadiusShownForRover then
		WorkRadiusShownForRover = { }
	else
		WorkRadiusShownForRoverReasons = {
			[WorkRadiusShownForRover] = WorkRadiusShownForRoverReasons,
		}
		
		WorkRadiusShownForRover = {
			[WorkRadiusShownForRover] = true,
		}
	end
end

function RCRover:SetWorkRadius(radius)
	local change = radius ~= self.work_radius
	if change and self.working then self:DisconnectTaskRequesters() end
	self.work_radius = radius
	if self == SelectedObj and change then
		PlayFX("ShowWorkRadius", "end", self) --reset radius particle
		PlayFX("ShowWorkRadius", "start", self)
		--play sound
		PlayFX("RangeChange", "end", self)
		DelayedCall(100, PlayFX, "RangeChange", "start", self)
	end
	if change and self.working then self:ConnectTaskRequesters() end
end

function RCRover:GetDronesStatusText()
	if self.command == "Malfunction" then
		return T(4480, "RC Commander has malfunctioned and is awaiting repairs.")
	elseif not self.sieged_state then
		return T(10091, "Drones have been recalled in the RC Commander")
	elseif not self.working then
		return T(4482, "RC Commander is moving and won’t give new orders to controlled Drones.")
	end
	
	return DroneControl.GetDronesStatusText(self)
end

function OnMsg.SelectionAdded(obj)
	if IsKindOf(obj, "RCRover") then
		if obj.siege_state_name == "Siege" then
			obj:ShowWorkRadius(true, "selected_and_sieged")
		end
	end
end

function OnMsg.SelectionRemoved(obj)
	if IsKindOf(obj, "RCRover") then
		WorkRadiusShownForRoverReasons = {} -- when rover loses selection clean all other reasons, needed for when button corresponding handler doesn't fire.
		obj:ShowWorkRadius(false, "selected_and_sieged")
	end
end

function DebugRoverConnectedTaskRequests(rover)
	local query_filter = function(o)
		if table.find(o.command_centers, rover) and HexAxialDistance(o, rover) > rover.work_radius then
			return true
		end
		return false
	end
	return MapGet(true, "TaskRequester", query_filter)
end

function RCRover:GetCommand()
	return Untranslated(self.command or "")
end

function RCRover:UseTunnel(tunnel)
	self:Unsiege()
	BaseRover.UseTunnel(self, tunnel)
end

function OnMsg.GatherFXActions(list)
	list[#list + 1] = "Gather"
end

function OnMsg.GatherFXMoments(list)
	list[#list + 1] = "step"
end
