DefineClass.SpaceElevator = {
	__parents = { "Building", "UniversalStorageDepot", "ElectricityConsumer" },
	class_flags = { cfConstructible = true },
	
	properties = {
		{ template = true, id = "price_mod", name = T(756, "Resupply Price Modifier"), category = "Space Elevator", editor = "number", default = 50, min = 0, modifiable = true },
		{ template = true, id = "cargo_capacity", name = T(757, "Cargo Capacity (kg)"), category = "Space Elevator", editor = "number", default = 100000, min = 0, modifiable = true },
		{ template = true, id = "max_export_storage", name = T(758, "Max Export Storage"), category = "Space Elevator", editor = "number", scale = const.ResourceScale, default = 100*const.ResourceScale, min = 0, modifiable = true },
		{ template = true, id = "travel_time", name = T(759, "Travel Time"), category = "Space Elevator", editor = "number", scale = const.HourDuration, default = 1*const.HourDuration, min = 0, modifiable = true },

		{ id = "allow_export",	editor = "bool", default = true, no_edit = true },
	},
	storable_resources = {"Concrete", "Metals", "Polymers", "Food", "Electronics", "MachineParts",},
	max_storage_per_resource = 100000 * const.ResourceScale,
	
	on_off_button = true,
	prio_button = true,
	
	pod = false,
	ropes = false,
	accumulate_maintenance_points = true,
	
	rope_height = 5000*guim,
	rope_tile_len = 100*guim,
	
	pod_thread = false,
	last_export_time = false,
	export_request = false,
	unload_request = false,
	import_queue = false,
	current_export = false,
	current_imports = false,
	export_resource = "PreciousMetals",
	move_dir = 0, -- for the purpose of GetStatus
	
	pin_on_start = true,
	pin_rollover = T(704, "Carries supplies from Earth."),	
	accumulate_dust = true,
}

function SpaceElevator:GameInit()
	self.pod = PlaceObject("SpaceElevatorCabin")
	self.pod:SetPos(self:GetPos())
	self.pod:SetGameFlags(const.gofAlwaysRenderable)
	
	self.ropes = {}
	local len = 0
	while len < self.rope_height do
		local rope = PlaceObject("SpaceElevatorRope")
		rope:SetPos(self:GetPos() + point(0, 0, len))
		rope:SetGameFlags(const.gofAlwaysRenderable)
		len = len + self.rope_tile_len
		self.ropes[#self.ropes + 1] = rope
	end
	
	self.last_export_time = GameTime()
	self.import_queue = {}
end

function SpaceElevator:InitResourceSpots()
	Building.InitResourceSpots(self)
	for i = 1, #self.resource_spots do
		self.resource_spots[i][2] = self.resource_spots[i][2] + 90*60
	end
end

function SpaceElevator:ReturnStockpiledResources()
	for resource_flag, request in pairs(self.supply) do
		local amount = request:GetActualAmount()
		if amount > 0 then
			self:PlaceReturnStockpile(resource_flag, amount)
		end
	end
	
	self:ClearAllResources()
end

function SpaceElevator:ReturnResources()
	Building.ReturnResources(self)
	self:ReturnStockpiledResources()
end

function SpaceElevator:RemoveObjects()
	if IsValid(self.pod) then
		DoneObject(self.pod)
	end
	
	for i = 1, #(self.ropes or empty_table) do
		if IsValid(self.ropes[i]) then
			DoneObject(self.ropes[i])
		end
	end
end

function SpaceElevator:Done()
	self:RemoveObjects()
end

function SpaceElevator:OnDestroyed()
	self:RemoveObjects()
	ElectricityConsumer.OnDestroyed(self)
end

function SpaceElevator:OrderResupply(cargo, cost)
	if not cargo or #cargo == 0 then return end
	
	-- charge the cost immediately, queue the cargo
	self.city:ChangeFunding(-cost, "Import")
	self.import_queue[#self.import_queue + 1] = cargo
	ResetCargo()
	
	self:BuildingUpdate()
end

function SpaceElevator:OnSetWorking(working)
	Building.OnSetWorking(self, working)
	
	if working then
		self:BuildingUpdate()
	end
end

function SpaceElevator:BuildingUpdate()
	if not self.working or IsValidThread(self.pod_thread) or g_Consts.SupplyMissionsEnabled ~= 1 then
		return
	end
	
	local export_amount = self.allow_export and self:GetStoredExportResourceAmount() or 0
	local should_export = (GameTime() > self.last_export_time + const.DayDuration) and (export_amount > 0)
	local should_import = #self.import_queue > 0
	
	if should_export or should_import then
		self.pod_thread = CreateGameTimeThread(function()
			self:ExportGoods()
			self.pod_thread = nil
		end)
	end
end

function SpaceElevator:ExportGoods()
	repeat 
		-- empty the export request, store the amount, update the last export time
		self.current_export = self.allow_export and self:GetStoredExportResourceAmount() or 0
		self:ResetDemandRequests()
		self.last_export_time = GameTime()
		
		-- launch the pod
		local base_pos = self:GetPos()
		self.pin_status_img = "UI/Icons/pin_rocket_outgoing.tga"
		local tick, t = 1000, 0
		self.move_dir = 1
		
		PlayFX("ElevatorMoving", "start", self)
		PlayFX("ElevatorMoving", "start", self.pod)
		while t < self.travel_time do
			if self.working then
				t = Min(self.travel_time, t + tick)
				local h = MulDivRound(self.rope_height, t, self.travel_time)
				self.pod:SetPos(base_pos + point(0, 0, h), tick)
			end
			Sleep(tick)
			if not IsValid(self) or self.destroyed then return end						
		end
		PlayFX("ElevatorMoving", "end", self)
		PlayFX("ElevatorMoving", "end", self.pod)
		
		-- grant extra funding
		self.city:MarkPreciousMetalsExport(self.current_export)
		local export_funding = self.city:CalcBaseExportFunding(self.current_export)
		if export_funding > 0 then
			export_funding = self.city:ChangeFunding(export_funding, "Export")
			AddOnScreenNotification("RareMetalsExport", nil, { funding = export_funding })
		end
		self.current_export = nil
						
		-- check for imports & store them locally
		if #self.import_queue > 0 then
			self.current_imports = table.remove(self.import_queue, 1)
		end
		
		-- launch back
		self.pin_status_img = "UI/Icons/pin_rocket_incoming.tga"
		self.move_dir = -1
		t = 0
		PlayFX("ElevatorMoving", "start", self)
		PlayFX("ElevatorMoving", "start", self.pod)
		while t < self.travel_time do
			if self.working then
				t = Min(self.travel_time, t + tick)
				local h = self.rope_height - MulDivRound(self.rope_height, t, self.travel_time)
				self.pod:SetPos(base_pos + point(0, 0, h), tick)
			end
			Sleep(tick)
			if not IsValid(self) or self.destroyed then return end						
		end				
		PlayFX("ElevatorMoving", "end", self)
		PlayFX("ElevatorMoving", "end", self.pod)
		
		 self.pin_status_img = nil
		self.move_dir = 0
		if self.current_imports then
			self:UnloadCargo(self.current_imports)
			self.current_imports = nil
		end	
	until #self.import_queue == 0 or g_Consts.SupplyMissionsEnabled ~= 1 -- repeat immediately if there are queued import items
end

function SpaceElevator:UnloadCargo(items)
	-- add stored imports to the storage & fire notification
	local unloaded
	local refreshBM = false
	for i = 1, #items do
		local item = items[i]
		local classdef = g_Classes[item.class]
		if item.amount > 0 then
			if Resources[item.class] then
				self:AddResource(item.amount*const.ResourceScale, item.class)
				unloaded = true
			elseif BuildingTemplates[item.class] then
				refreshBM = true
				self.city:AddPrefabs(item.class, item.amount, false)
				unloaded = true
			elseif IsKindOf(classdef, "OrbitalProbe") then
				for j = 1, item.amount do
					PlaceObject(item.class, {city = self.city})
				end
				unloaded = true
			else
				printf("[SpaceElevator] unexpected cargo type %s, ignored", item.class)
			end
		end
	end
	if refreshBM then
		RefreshXBuildMenu()
	end

	if unloaded then
		AddOnScreenNotification("SpaceElevatorDelivery", nil, {}, {self})
	end
end

function SpaceElevator:CreateResourceRequests()
	UniversalStorageDepot.CreateResourceRequests(self)
	
	--remove demand reqs (keep actual reqs so that everything works in unistorage)
	for k, v in pairs(self.demand) do
		table.remove_entry(self.task_requests, v)
	end
	--remove storage flags
	for k, v in pairs(self.supply) do
		v:ClearFlags(const.rfStorageDepot)
	end
	
	local unit_count = 1 + (self.max_export_storage / (const.ResourceScale * 10)) --1 per 10
	self.export_request = self:AddDemandRequest("PreciousMetals", self.max_export_storage, 0, unit_count)
	
	local unit_count = 1 + (self.max_export_storage / (const.ResourceScale * 10)) --1 per 10
	self.unload_request = self:AddSupplyRequest("PreciousMetals", 0, 0, unit_count)
	table.remove_entry(self.task_requests, self.unload_request)
end

function SpaceElevator:OnModifiableValueChanged(prop, old_val, new_val)
	if prop == "max_export_storage" and self.export_request then
		self:InterruptDrones(nil, function(drone)
											if drone.d_request == self.export_request then 
												return drone 
											end
										end)
		local delta = new_val - old_val
		self.export_request:AddAmount(delta)
	end
end

function SpaceElevator:ResetDemandRequests()
	self:InterruptDrones(nil, function(drone)
											if drone.d_request == self.export_request then
												return drone 
											end
										end)
	self.export_request:SetAmount(self.max_export_storage)
end

function SpaceElevator:GetStoredExportResourceAmount()
	if not self.allow_export then
		return self.unload_request:GetActualAmount()
	end
	return self.max_export_storage - self.export_request:GetActualAmount()
end

function SpaceElevator:DisconnectFromCommandCenters()
	Building.DisconnectFromCommandCenters(self)
	if LRManagerInstance then
		LRManagerInstance:RemoveBuilding(self)
	end
end

function SpaceElevator:ConnectToCommandCenters()
	Building.ConnectToCommandCenters(self)
	if LRManagerInstance then
		LRManagerInstance:AddBuilding(self)
	end
end

function SpaceElevator:ToggleAllowExport()
	self.allow_export = not self.allow_export
		
	if self.allow_export then
		-- cancel any remaining supply requests, interrupt drones, carry remaining supply to the new demand request
		self:InterruptDrones(nil, function(drone)
											if (drone.target == self) or 
												(drone.d_request and drone.d_request:GetBuilding() == self) or
												(drone.s_request and drone.s_request:GetBuilding() == self) then
												return drone
											end
										end)
		self:DisconnectFromCommandCenters()		
		
		-- create export request, transfer the remaining unload amount, close the unload request
		local stored = self.unload_request and self.unload_request:GetActualAmount() or 0

		self.export_request:SetAmount(self.max_export_storage - stored)
		assert(table.find(self.task_requests, self.unload_request) and not table.find(self.task_requests, self.export_request))
		table.insert(self.task_requests, self.export_request)
		table.remove_entry(self.task_requests, self.unload_request)
		
		self:ConnectToCommandCenters()
	else
		-- cancel demand request, interrupt drones, create supply request for the already stocked amount
		if self.export_request then
			self:InterruptDrones(nil, function(drone)
												if (drone.target == self) or 
													(drone.d_request and drone.d_request:GetBuilding() == self) or
													(drone.s_request and drone.s_request:GetBuilding() == self) then
													return drone
												end
											end)
			
			self:DisconnectFromCommandCenters()
			local amount = self.max_export_storage - self.export_request:GetActualAmount()
			self.unload_request:SetAmount(amount)
			assert(not table.find(self.task_requests, self.unload_request) and table.find(self.task_requests, self.export_request))
			table.insert(self.task_requests, self.unload_request)
			table.remove_entry(self.task_requests, self.export_request)
						
			self:ConnectToCommandCenters()
		end
	end
	
	ObjModified(self)
end

function SpaceElevator:GetCargoManifest()
	if not self.current_imports then
		return T(720, "Nothing")
	end
	
	local texts, resources = {}, {}
	
	local cargo = self.current_imports
	for i = 1, #cargo do
		local item = cargo[i]
		if item.amount > 0 then
			local classdef = g_Classes[item.class]
			if Resources[item.class] then
				resources[#resources + 1] = T{722, "<resource(amount,res)>", amount = item.amount*const.ResourceScale, res = item.class}
			elseif BuildingTemplates[item.class] then
				local def = BuildingTemplates[item.class]
				local name = item.amount > 1 and def.display_name_pl or def.display_name
				texts[#texts + 1] = T{723, "<number> <name>", number = item.amount, name = name}
			elseif IsKindOf(classdef, "OrbitalProbe") then
				texts[#texts + 1] = T{723, "<number> <name>", number = item.amount, name = classdef.display_name}
			end
		end
	end
	
	if #resources > 0 then
		texts[#texts + 1] = table.concat(resources, " ")
	end
	return table.concat(texts, "<newline>")	
end

function SpaceElevator:GetStorageManifest()
	local resources = {}
	for i = 1, #self.storable_resources do
		local resource = self.storable_resources[i]
		local amount = self:GetStoredAmount(resource)
		if amount > 0 then
			resources[#resources + 1] = T{722, "<resource(amount,res)>", amount = amount, res = resource}
		end
	end

	if #resources == 0 then
		return T(720, "Nothing")
	end
	
	return table.concat(resources, " ")
end

function SpaceElevator:GetExportManifest()
	local texts = {}
	if self.current_export then 
		texts[#texts + 1] = T{760, "<left>Exporting <right><preciousmetals(amount)>", amount = self.current_export}
	end
	local amount = self:GetStoredExportResourceAmount()
	local rt = FormatResourceValueMaxResource(self, amount, self.max_export_storage, "PreciousMetals")
	texts[#texts + 1] = T{761, "<left>Waiting to export <right><res>", res = rt}
	
	return table.concat(texts, "<newline>")
end

function SpaceElevator:GetStatus()
	if self.move_dir > 0 then
		return T(762, "Going up")
	end
	if self.move_dir < 0 then
		return T(763, "Going down")
	end
	return T(6766, "Idle")
end

function SpaceElevator:SetCount() -- disable UniversalStorageDepot visuals code
end

function SpaceElevator:MoveInside()
end

function SpaceElevator:DroneUnloadResource(drone, request, resource, amount)
	drone:PushDestructor(function(drone)
		drone:ExitBuilding(self)
	end)
	drone:SetCarriedResource(false)
	UniversalStorageDepot.DroneUnloadResource(self, drone, request, resource, amount)
	RebuildInfopanel(self)
	drone:PopAndCallDestructor()
end

function SpaceElevator:DroneLoadResource(drone, request, resource, amount)
	UniversalStorageDepot.DroneLoadResource(self, drone, request, resource, amount, true) --no sleep with skip presentation == true
	if drone then
		drone:PushDestructor(function(drone)
			drone:ExitBuilding(self)
		end)
		drone:SetCarriedResource(resource, amount)
		RebuildInfopanel(self)
		drone:PopAndCallDestructor()
	else
		RebuildInfopanel(self)
	end
end

local drone_enter_cmd = {
	PickUp = true,
	Deliver = true,
	TransferResources = true,
	TransferAllResources = true,
}

function SpaceElevator:DroneApproach(drone, r)
	drone:ExitHolder(self)
	if not IsValid(self) then return end
	if drone_enter_cmd[drone.command] and IsKindOf(drone, "Drone") then
		return drone:EnterBuilding(self)
	else
		return drone:GotoBuildingSpot(self, drone.work_spot_task)
	end
end

function OnMsg.GatherFXActors(list)
	list[#list + 1] = "SpaceElevator"
	list[#list + 1] = "SpaceElevatorCabin"
end

function OnMsg.GatherFXActions(list)
	list[#list + 1] = "ElevatorMoving"
end

CargoCapacityLabels.elevator = "SpaceElevator"
