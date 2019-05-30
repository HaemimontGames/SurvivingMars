DefineClass.RechargeStationBase = { --common stuff for rover and recharge station.
	__parents = { "Object" },
	
	drones_in_queue_to_charge = false,
	drone_charged = false,
	drone_enter_pos = false,
	charging_progress = 0,
	charging_time_left = false,
	
	pulse_thread = false,
	can_pulse_recharge = true,
	city = false,
}

function RechargeStationBase:Init()
	self.drones_in_queue_to_charge = {}
end

function RechargeStationBase:GameInit()
	self.city = self.city or UICity
	if self.city:IsTechResearched("WirelessPower") then
		self:StartAoePulse()
	end
end

GlobalVar("g_WirelessPower", false)

function OnMsg.TechResearched(tech_id, city)
	if tech_id == "WirelessPower" then
		g_WirelessPower = true
		city:ForEachLabelObject("RechargeStation", "StartAoePulse")
		
		local container_hubs = UICity.labels.DroneHub
		for i = 1, #(container_hubs or empty_table) do
			local hub = container_hubs[i]
			for j = 1, #(hub.charging_stations or empty_table) do
				hub.charging_stations[j]:StartAoePulse()
			end
		end
	end
end

function RechargeStationBase:Done()
	if IsValidThread(self.pulse_thread) then
		DeleteThread(self.pulse_thread)
		self.pulse_thread = false
	end
end

function RechargeStationBase:StartAoePulse()
	if not g_WirelessPower or self.pulse_thread or not self.can_pulse_recharge then
		return
	end
	
	self.pulse_thread = CreateGameTimeThread(RechargerAoePulse, self)
end

function RechargeStationBase:QueueDrone(drone)
	self.drones_in_queue_to_charge[#self.drones_in_queue_to_charge + 1] = drone
	drone.queued_at_recharger = self
end

function RechargeStationBase:DroneExitQueue(drone)
	table.remove_entry(self.drones_in_queue_to_charge, drone)
	drone.queued_at_recharger = false
end

function RechargeStationBase:IsRechargerWorking()
	return self.working
end

local recharger_pulse_tick = 1000
local recharger_started = false
local function recharger_proc(drone, recharger)
	local battery_max = drone.battery_max
	if drone.battery >= battery_max*3/4 then
		return
	end
	recharger_started = true
	--fx
	PlayFX("DroneRechargeCoilArc", "start", recharger, drone)
	--actual recharge
	drone.battery = battery_max
	local command = drone.command
	if command == "EmergencyPower" or command == "Charge" or command == "NoBattery" then
		drone:SetCommand("Idle")
	end
end

--can be in bldupdate, but then the update timer needs to be real low even when tech is not researched :/
function RechargerAoePulse(self)
	Sleep(AsyncRand(recharger_pulse_tick))
	while IsValid(self) and self.working do
		recharger_started = false
		MapForEach(self, "hex", TechDef.WirelessPower.param1, "Drone", recharger_proc, self)
		if recharger_started then
			PlayFX("DroneRechargePulse", "start", self)
		end
		Sleep(recharger_pulse_tick)
	end
	self.pulse_thread = false
end

local drone_notification_range = 60*guim
local notifying_recharger = false

function RechargeStationBase:NotifyDronesOnRechargeStationFree()
	if IsValid(self) and #self.drones_in_queue_to_charge <= 0 then 
		--only notify if there are not drones currently in queue, and if we didnt just die.
		notifying_recharger = self
		local filter = function(drone)
				return drone.command == "EmergencyPower" and 
					(IsValid(drone.queued_at_recharger) and notifying_recharger ~= drone.queued_at_recharger or 
					(IsValid(drone.going_to_recharger) and 
					drone.going_to_recharger:GetDist2D(drone) > 2 * notifying_recharger:GetDist2D(drone)))
		end
		local drone = MapFindNearest(self, self, drone_notification_range, "Drone", filter)
		notifying_recharger = false
		if drone then
			drone:ResetEmergencyPowerCommand(self)
		end
	end
end

DefineClass.RechargeStation = {
	__parents = { "RechargeStationBase", "ElectricityConsumer", "OutsideBuildingWithShifts" },
	platform = false,
	hub = false, -- points to member if charging station is part of DroneHub complex
}

function RechargeStation:GameInit()
	self.platform = self:GetAttach("RechargeStationPlatform")
	self.force_fx_work_target = self.platform
end

function RechargeStation:DroneApproach(drone, resource)
	return drone:GotoBuildingSpot(self, resource == "charge" and "Drone" or "Workdrone")
end

function RechargeStation:SetPlatformState(state)
	self.platform:SetState(state)
	self.platform:NightLightEnable()
end

function RechargeStation:LeadIn(drone)
	self.drone_charged = drone
	self.drone_enter_pos = drone:GetPos()
	RebuildInfopanel(self)
	
	PlayFX("RechargeStation", "start", self, drone)
	self:SetPlatformState( "chargingStart" )
	local angle = CalcOrientation( self:GetPos(), drone:GetPos() )
	self.platform:SetAngle( angle - self:GetAngle(), 600 )
	drone:Face(self.platform, 200)
	
	drone:StartFX("EmergencyRecharge")
	
	local enter_time = GetAnimDuration(drone:GetEntity(), "chargingStationEnter")
	drone:SetPos(self.platform:GetPos(), enter_time)
	drone:PlayState( "chargingStationEnter")
	drone:PlayState( "chargingStationAttach")
	
	if IsValid(self) and IsValid(drone) then
		PlayFX("RechargeStationPlatform", "start", self.platform, drone)
	end
end

function RechargeStation:LeadOut(drone)
	drone:StopFX()
	PlayFX("RechargeStation", "end", self, drone)
	PlayFX("RechargeStationPlatform", "end", self.platform, drone)
	if IsValid(self) then --station can be salvaged -> 0118540
		self:SetPlatformState("chargingEnd")
	end
	local exit_time = GetAnimDuration(drone:GetEntity(), "chargingStationExit")
	drone:PlayState("chargingStationDetach")
	drone:SetPos(self.drone_enter_pos, exit_time)
	drone:PlayState("chargingStationExit")
	
	self.drone_charged = false
	RebuildInfopanel(self)
	return true
end

function RechargeStation:AttachSign(...)
	if self.hub then return end
	BaseBuilding.AttachSign(self, ...)
end
---------------------UI data---------------
function RechargeStation:GetWorkMode()		
	return self.drone_charged and T{684, "Charging<right><percent(charging_progress)>", self} or T(685, "Waiting for Drones")
end

function RechargeStation:OnSetWorking(working)
	if working then
		self:StartAoePulse()
		self:NotifyDronesOnRechargeStationFree()
	end
	ElectricityConsumer.OnSetWorking(self, working)
	OutsideBuildingWithShifts.OnSetWorking(self, working)
end

--Recharge station but not building, used by drone hub
DefineClass.NotBuildingRechargeStation = {
	__parents = { "Shapeshifter", "RechargeStationBase", },
	platform = false,
	hub = false, -- points to member if charging station is part of DroneHub complex
	working = true, -- totally not building though.
	
	DroneApproach = RechargeStation.DroneApproach,
	LeadIn = RechargeStation.LeadIn,
	LeadOut = RechargeStation.LeadOut,
	AttachSign = RechargeStation.AttachSign,
	SetPlatformState = RechargeStation.SetPlatformState,
	
	fx_actor_class = "RechargeStation",
}

function NotBuildingRechargeStation:IsRechargerWorking()
	return self.hub.working
end

function NotBuildingRechargeStation:Done()
	PlayFX("Working", "end", self, self.platform)
end