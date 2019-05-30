-- basic supply pod
DefineClass.SupplyPod = {
	__parents = { "SupplyRocket" },
	
	properties = {
		{ template = true, id = "cargo_capacity", name = T(757, "Cargo Capacity (kg)"), category = "Supply Pod", editor = "number", default = 100000, min = 0, modifiable = true },
		{ template = true, id = "initial_cost", name = T(10357, "Initial Cost (M)"), category = "Supply Pod", editor = "number", default = 100, min = 0, modifiable = true },
		{ id = "allow_export",	editor = "bool", default = false, no_edit = true },
	},
	rocket_palette = { "rocket_base", "outside_dark", "rocket_accent", "rocket_base" },
	launch_after_unload = false,
	landing_site_class = "PodLandingSite",
	
	pin_rollover = T(10274, "The remains of a Supply Pod. Can be salvaged for resources."),

	-- landing/takeoff parameters
	orbital_altitude = 2500*guim,
	orbital_velocity = 200*guim,
	rocket_palette = { "rocket_base", "rocket_accent", "outside_dark", "outside_dark" },
	
	affected_by_dust_storm = false,
	accept_requester_connects = false,

	refund = 0,
	storable_resources = {},
	count_in_resource_overview = false,
	can_control_drones = false,
}

function SupplyPod:GameInit()
	self.fx_actor_class = "SupplyPod"
end

function SupplyPod:GetMaxDrones()
	return 0
end

function SupplyPod:CreateResourceRequests()
end

function SupplyPod:IsAvailable()
	return self.command == "OnEarth"
end

function SupplyPod:Done()
	if self:IsValidPos() then
		Building.RemoveFromGrids(self)
	end
	if self.refund > 0 then
		self.city:ChangeFunding(self.refund, "refund")
	end
end

function SupplyPod:GetRocketType()
	return T(824938247285, "Supply Pod")
end

function SupplyPod:Unload()
	if not IsValid(self.landing_site) then
		assert(false, "Missing landing site for Unload")
		self:SetCommand(false)
		return
	end
	self.cargo = self.cargo or {}
		
	local vehicles = {}	
	-- place cargo on spots
	local refreshBM = false
	for _, item in ipairs(self.cargo) do
		local classdef = g_Classes[item.class]
		if item.amount > 0 then
			if Resources[item.class] then
				if item.amount > 0 then
					local pos, angle = self:GetSpotLoc(self:GetSpotBeginIndex("Resource"))
					PlaceResourceStockpile_Delayed(pos, item.class, item.amount * const.ResourceScale, angle, true)
				end
			elseif IsKindOf(classdef, "BaseRover") then
				local pos, angle = self:GetSpotLoc(self:GetSpotBeginIndex("Rover"))
				local obj = PlaceObject(item.class, {city = self.city})
				obj:SetPos(pos)
				obj:SetAngle(angle)
			elseif IsKindOf(classdef, "Drone") then
				local first, last = self:GetSpotRange("Drone")
				for j = 1, item.amount do
					local idx = first + j - 1
					if idx > last then
						assert(false, "Too many drones carried or too few spots available")
						break
					end
					local pos, angle = self:GetSpotLoc(idx)
					local obj = PlaceObject(item.class, {city = self.city, is_orphan = true})
					obj:SetPos(pos)
					obj:SetAngle(angle)
				end
			elseif BuildingTemplates[item.class] then
				refreshBM = true
				self.city:AddPrefabs(item.class, item.amount, false)
			else
				printf("unexpected cargo type %s for %s, ignored", item.class, self.class)
			end
		end
	end
	if refreshBM then
		RefreshXBuildMenu()
	end
	
	local pos = self:GetSpotLoc(self:GetSpotBeginIndex("Action"))
	
	-- play anim
	self:SetAnim(1, "destroy")
	PlayFX("PodFlip", "start", self)
	self:SetPos(pos, self:TimeToAnimEnd())
	Sleep(self:TimeToAnimEnd())
	PlayFX("PodFlip", "end", self)
	
	self:SetAnim(1, "destroy2")
	Sleep(self:TimeToAnimEnd())
	
	self:SetAnim(1, "idle2")
	
	-- set commands to drones/rovers
	for _, obj in ipairs(vehicles) do
		obj:SetCommand("Idle")
	end
	self:Shutdown()
end

function SupplyPod:Shutdown()
	local template = BuildingTemplates[self.template_name]
	self.pin_rollover = template.pin_rollover

	-- stop the logic, this is only salvageable now
	self.is_demolishable_state = true
	if IsValid(self.landing_site) then
		DoneObject(self.landing_site)
		self.landing_site = nil
	end
	Building.ApplyToGrids(self) -- apply own hex surface to block construction when the landing site is no more
	ObjModified(self)
	if self == SelectedObj then
		ReopenSelectionXInfopanel()
	end
	self:SetPinned(false)
	self:SetCommand(false)
end

----

function DisablePodRefund(label)
	for _, pod in ipairs(UICity.labels[label] or empty_table) do
		if pod:IsAvailable() then
			pod.refund = 0
			break
		end
	end
end

function OnMsg.ResupplyRocketLaunched(label)
	if label == "SupplyPod" then
		DisablePodRefund("SupplyPod")
	end
end

function CreateRefundablePod(class, label)
	local price = GetMissionSponsor().pod_price
	UICity:ChangeFunding(-price)				
	local pod = PlaceBuilding(class, {city = UICity, refund = price})
	UICity:AddToLabel(label, pod) -- add manually to avoid reliance on running game time
	pod:SetCommand("OnEarth")
end

CargoCapacityLabels.pod = "SupplyPod"