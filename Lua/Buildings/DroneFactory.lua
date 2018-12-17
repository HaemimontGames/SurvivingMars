local drone_construction_progress_delim = 100000
DefineClass.DroneFactory = {
	__parents = { "Building", "ElectricityConsumer", "Workplace"},
	
	building_update_time = 5000,
	construction_queue = false,
	drones_in_construction = false,
	androids_in_construction = false,
	construct_drone_start = false,
	drone_construction_request = false,
	transport_request  = false,
	drone_construction_resource = 0,
	
	drone_construction_progress = 0, -- 0 -> 100000 (drone_construction_progress_delim)
	
	drone_requests = false, -- {[requestor] = count
}

function DroneFactory:Init()
	self.drones_in_construction = 0	
	self.androids_in_construction = 0
	self.construction_queue = {}
end

function DroneFactory:CreateResourceRequests()
	local resource = self.city:IsTechResearched("PrintedElectronics") and "Metals" or "Electronics"
	self.drone_construction_request = self:AddDemandRequest(resource, 0)
	self.transport_request = self:AddSupplyRequest(resource, 0)
end

--savegame compatibility
function DroneFactory:CreateResourceRequestsSupply()
	if not self.transport_request then
		local resource = self.city:IsTechResearched("PrintedElectronics") and "Metals" or "Electronics"
		self:DisconnectFromCommandCenters()
		self.transport_request = self:AddSupplyRequest(resource, 0)
		self:ConnectToCommandCenters()
	end
end

function DroneFactory:BuildingUpdate(delta, day, hour)
	self:UpdateDroneConstruction(delta)
end

function DroneFactory:OnSetWorking(working)
	if working then
		self:StartDroneConstruction()
	else
		self:StopDroneConstruction(true)
	end
	
	Building.OnSetWorking(self, working)
end

function DroneFactory:StartDroneConstruction() --resources gathered, start progress bar and anims
	self.construction_queue = self.construction_queue or {}
	local queued_type_is_drone = self.construction_queue[1]=="Drone"
	if self.working 
		and #self.construction_queue>0 
		and self.drone_construction_resource >= (queued_type_is_drone and g_Consts.DroneElectronicsCost or g_Consts.AndroidElectronicsCost) 
		and not self.construct_drone_start 
	then
		self.construct_drone_start = GameTime()
		PlayFX("ConstructingDrones", "start", self)
	end
end

function DroneFactory:StopDroneConstruction(save_progress)
	if self.construct_drone_start then
		self.construct_drone_start = false
		if not save_progress then
			self.drone_construction_progress = 0
		end
		
		PlayFX("ConstructingDrones", "end", self)
	end
end

function DroneFactory:UpdateDroneConstruction(delta)
	if not self.working or not self.construct_drone_start or self.drones_in_construction + self.androids_in_construction <= 0 then
		return 
	end
	
	local queued_type_is_drone = self.construction_queue[1]=="Drone"
	local perf_penalty = 100 - Min(self.performance, 100)
	local perf_bonus = Max(self.performance - 100, 0)
	--perf_penalty increases time by 1 full dur per 25%, while perf_bonus decreases time at a perf/2 rate
	local time = queued_type_is_drone and g_Consts.DroneConstructionTime or g_Consts.AndroidConstructionTime
	local total_t =  time + MulDivRound(time, perf_penalty, 25) - MulDivRound(time, perf_bonus, 200)
	total_t = Max(total_t, 1) --avoid zero/negative times
	local progress_pts = MulDivRound(delta, drone_construction_progress_delim, total_t)
	self.drone_construction_progress = self.drone_construction_progress + progress_pts
	if self.drone_construction_progress >= drone_construction_progress_delim then
		self:ConstructDroneInternal(queued_type_is_drone)
	end
	
	RebuildInfopanel(self)
end

function DroneFactory:GetRequestedDronesCount(requestor)
	return self.drone_requests and self.drone_requests[requestor] or 0
end

function DroneFactory:DecrementRequestedDrones()
	if self.drone_requests then
		local r, c = next(self.drone_requests)
		if r then
			c = c - 1
			if c <= 0 then
				c = nil
			end
			self.drone_requests[r] = c
			r:OnDroneRemovedFromQueue()
		else
			self.drone_requests = false
		end
	end
end

function DroneFactory:ConstructDroneInternal(queued_type_is_drone)
	table.remove(self.construction_queue,1)
	if queued_type_is_drone then
		self.drones_in_construction = self.drones_in_construction - 1
		self.drone_construction_resource = self.drone_construction_resource - g_Consts.DroneElectronicsCost --take cost
		self:SpawnDrone()
		if self.city:IsTechResearched("EvolutionaryAlgorithms") then
			self:SpawnDrone(1500)
		end
		
		self:DecrementRequestedDrones()
	else
		self.androids_in_construction = self.androids_in_construction - 1	
		self.drone_construction_resource = self.drone_construction_resource - g_Consts.AndroidElectronicsCost --take cost
		self:SpawnAndroid()
		--if self.city:IsTechResearched("EvolutionaryAlgorithms") then
		--	self:SpawnAndroid(1500)
		--end
	end
	
	self:StopDroneConstruction()
	self:StartDroneConstruction()

end

function DroneFactory:DroneUnloadResource(drone, request, resource, amount)
	if self.drone_construction_request == request then
		self.drone_construction_resource = self.drone_construction_resource + amount
		self:StartDroneConstruction()
	else
		Building.DroneUnloadResource(self, drone, request, resource, amount)
	end
end

function DroneFactory:DroneLoadResource(drone, request, resource, amount)
	if self.transport_request == request then
		self.drone_construction_resource = self.drone_construction_resource - amount
	end
	Building.DroneLoadResource(self, drone, request, resource, amount)
end

function DroneFactory:ConstructDrone(change, requestor)
	if change>0 then
		self.drones_in_construction = self.drones_in_construction + change
		while change > 0 do
			self.construction_queue[#self.construction_queue+1] = "Drone"
				
			if requestor then
				self.drone_requests = self.drone_requests or {}
				self.drone_requests[requestor] = (self.drone_requests[requestor] or 0) + 1
			end
			
			change = change - 1
		end
	else
		while change < 0 and self.drones_in_construction > 0 do
			for i=#self.construction_queue, 1, -1 do
				if self.construction_queue[i] == "Drone" then
					table.remove(self.construction_queue, i)
					if i == 1 then
						self:StopDroneConstruction()  --reset progress
					end
									
					self:DecrementRequestedDrones()
					break
				end
			end
			change = change + 1
			self.drones_in_construction = self.drones_in_construction - 1
		end
	end
	
	self:StartDroneConstruction() --if we already have the resource - git goin
	self.drone_construction_request:SetAmount(self:GetConstructResourceTotal() - self.drone_construction_resource)	
	self.transport_request:SetAmount(Max(0,self.drone_construction_resource - self:GetConstructResourceTotal()))
end

function DroneFactory:ConstructAndroid(change)
	if change>0 then
		self.androids_in_construction = self.androids_in_construction + change
		while change > 0 do
			self.construction_queue[#self.construction_queue + 1] = "Android"
			change = change - 1
		end
	else
		while change < 0 and self.androids_in_construction > 0 do
			for i=#self.construction_queue, 1, -1 do
				if self.construction_queue[i] == "Android" then
					table.remove(self.construction_queue, i)
					if i == 1 then
						self:StopDroneConstruction() --reset progress
					end
					break
				end
			end
			change = change + 1
			self.androids_in_construction = self.androids_in_construction - 1
		end
	end
	
	self:StartDroneConstruction() --if we already have the resource - git goin
	self.drone_construction_request:SetAmount(self:GetConstructResourceTotal() - self.drone_construction_resource)	
	self.transport_request:SetAmount(Max(0,self.drone_construction_resource - self:GetConstructResourceTotal()))
end

function DroneFactory:SpawnDrone(delay)
	--PlaceObject("Drone", { init_with_command = {"ExitFactory", self, delay} })
	self.city.drone_prefabs = self.city.drone_prefabs + 1
end

function DroneFactory:SpawnAndroid()
	local colonist_table = GenerateColonistData(self.city, "Adult", "Martianborn", {no_specialization = true})
	if IsValid(self.parent_dome) then
		colonist_table.dome = self.parent_dome
	else
		local domes, safety_dome = GetDomesInWalkableDistance(self.city, self:GetPos())
		local dome = ChooseDome(colonist_table.traits, domes, safety_dome)
		colonist_table.dome = dome
	end
	colonist_table.traits["Android"] = true
	colonist_table.specialist = "none"
	local colonist = Colonist:new(colonist_table)
	self:OnEnterUnit(colonist)
	Msg("ColonistBorn", colonist, "android")
end 

function DroneFactory:ChangeDroneConstructionResource(res)
	if not self.drone_construction_request or self.drone_construction_request:GetResource() == res then return end
	self:InterruptDrones(nil, function(drone)
										if (drone.target == self) or 
											(drone.d_request and drone.d_request:GetBuilding() == self) or
											(drone.s_request and drone.s_request:GetBuilding() == self) then
											return drone
										end
									end)
	self:DisconnectFromCommandCenters()
	self.drone_construction_request:ChangeResource(res)
	self:ConnectToCommandCenters()
end

function DroneFactory:GetDroneConstructionProgress()
	if not self.ui_working or self.drone_construction_progress<=0 then
		return 0
	end
	return MulDivRound(self.drone_construction_progress, 100, drone_construction_progress_delim)
end

function DroneFactory:GetConstructDroneCost()
	return g_Consts.DroneElectronicsCost
end

function DroneFactory:GetConstructAndroidCost()
	return g_Consts.AndroidElectronicsCost
end

function DroneFactory:GetConstructResource()
	return UICity:IsTechResearched("PrintedElectronics") and "Metals" or "Electronics"
end

function DroneFactory:GetConstructResourceAmount()
	return self.drone_construction_resource
end

function DroneFactory:GetConstructResourceTotal()
	return self.drones_in_construction * g_Consts.DroneElectronicsCost + 
	  self.androids_in_construction * g_Consts.AndroidElectronicsCost
end

local ConstructionStatus = {
	["Drone"] = T(8521, "Constructing a Drone"),
	["Android"] = T(8522, "Constructing a Biorobot"),
}

function DroneFactory:GetUIConstructionStatus()
	if UICity:IsTechResearched("ThePositronicBrain") and self.ui_working and #self.construction_queue>0 then
		return ConstructionStatus[self.construction_queue[1]]
	end
	return ""
end

function OnMsg.TechResearched(tech_id, city)
	if tech_id == "PrintedElectronics" then
		city:ForEachLabelObject("DroneFactory", "ChangeDroneConstructionResource", "Metals")
	end
end
