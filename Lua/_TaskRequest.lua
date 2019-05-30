--[[@@@
@class TaskRequest
TaskRequests are Lua userdata objects that represent drone tasks. For example all resources that a drone can take are represented as supply task requests, while all buildings that require resources represent this need through demand task requests. A third type of a task request is the work request, where a drone is needed to perform a certain amount of work. The amount of work is specified in the request itself. While drones work with task requests, finding and assigning requests is done by DroneControl objects (Drone Hub, RCRover, etc.). The [TaskRequester](LuaFunctionDoc_TaskRequester.md.html) class provides facilities for task request management. All [Buildings](LuaFunctionDoc_Building.md.html) are task requesters. Resource amounts represented in requests are integers, generally scaled by const.ResourceScale (1000 at the time of writing).
--]]

--[[@@@
@class TaskRequester
Tha TaskRequester class helps manage drone [TaskRequests](LuaFunctionDoc_TaskRequest.md.html).
--]]

TaskRequester.__parents = {"BaseBuilding"}

--[[@@@
TaskRequester callback called in the object's game init thread. Useful for initializing the object's [TaskRequests](LuaFunctionDoc_TaskRequest.md.html).

@function void TaskRequester@CreateResourceRequests()
@result void
--]]

function TaskRequester:CreateResourceRequests()
end

--[[@@@
Creates a [TaskRequest](LuaFunctionDoc_TaskRequest.md.html) with the given properties, and adds it to the task_requests table so it is visible to DroneControl objects. The building needs to re-connect to DroneControl objects if the state of the task_requests table changes. Alternatively, requests may be created before connecting, in the CreateTaskRequests callback for example. This function creates a work request and automatically adds the flags designating it as such.

@function TaskRequest TaskRequester@AddWorkRequest(string resource, int amount[, int flags, int max_units])
@param string resource - Resource id for this request. For a work request this can be any string, such as "clean", "repair", etc.
@param int amount - The amount of work the drone has to do to finish this request. Drones do about 5000 work per second, defined by DroneResourceUnits.repair.
@param int flags - Optional. The flags of the request. The flags rfPostInQueue and rfWork are automatically added to work requests created with this function.
@param int max_units - Optional. The max number of drones that can do this request simultaneously.
@result TaskRequest result - The created request.
--]]
function TaskRequester:AddWorkRequest(resource, amount, flags, max_units)
	flags = bor(flags or 0, const.rfWork, const.rfPostInQueue)
	return self:AddRequest(resource, amount, flags, max_units)
end

--[[@@@
Creates a [TaskRequest](LuaFunctionDoc_TaskRequest.md.html) with the given properties, and adds it to the task_requests table so it is visible to DroneControl objects. The building needs to re-connect to DroneControl objects if the state of the task_requests table changes. Alternatively, requests may be created before connecting, in the CreateTaskRequests callback for example. This function creates a demand request and automatically adds the flags designating it as such.

@function bool TaskRequester@AddDemandRequest(string resource, int amount[, int flags, int max_units])
@param string resource - Resource id for this request. For resource request this is the string id of any resource defined in the Resources Lua table.
@param int amount - The amount of resource this request represents.
@param int flags - Optional. The flags of the request. The flags rfPostInQueue and rfDemand are automatically added to demand requests created with this function.
@param int max_units - Optional. The max number of drones that can do this request simultaneously.
@result TaskRequest result - The created request.
--]]
function TaskRequester:AddDemandRequest(resource, amount, flags, max_units, desired_amount)
	flags = bor(flags or 0, const.rfDemand, const.rfPostInQueue)
	return self:AddRequest(resource, amount, flags, max_units, desired_amount)
end

--[[@@@
Creates a [TaskRequest](LuaFunctionDoc_TaskRequest.md.html) with the given properties, and adds it to the task_requests table so it is visible to DroneControl objects. The building needs to re-connect to DroneControl objects if the state of the task_requests table changes. Alternatively, requests may be created before connecting, in the CreateTaskRequests callback for example. This function creates a supply request and automatically adds the flags designating it as such.

@function bool TaskRequester@AddSupplyRequest(string resource, int amount[, int flags, int max_units])
@param string resource - Resource id for this request. For resource request this is the string id of any resource defined in the Resources Lua table.
@param int amount - The amount of resource this request represents.
@param int flags - Optional. The flags of the request. The flags rfPostInQueue and rfSupply are automatically added to demand requests created with this function.
@param int max_units - Optional. The max number of drones that can do this request simultaneously.
@result TaskRequest result - The created request.
--]]
function TaskRequester:AddSupplyRequest(resource, amount, flags, max_units, desired_amount)
	flags = bor(flags or 0, const.rfSupply)
	return self:AddRequest(resource, amount, flags, max_units, desired_amount)
end

function TaskRequester:SetPriority(priority)
	if self.priority == priority then return end
	self:Gossip("Priority", priority)
	if priority ~= 2 then
		HintDisable("HintPriority")
	end
	for _, center in ipairs(self.command_centers) do
		center:RemoveBuilding(self, self.priority, priority)
	end
	self.priority = priority
	for _, center in ipairs(self.command_centers) do
		center:AddBuilding(self)
	end
	
	if not IsKindOf(self, "ResourceStockpileBase") then
		local stockpiles = self:GetAttaches("ResourceStockpileBase")
		for i = 1, #(stockpiles or "") do
			if stockpiles[i].has_demand_request or stockpiles[i].has_supply_request then
				stockpiles[i]:SetPriority(priority)
			end
		end
	end
	
	self:UpdateNotWorkingBuildingsNotification()
end

function TaskRequester:ShouldShowNotWorkingNotification()
	return self.priority > 1 and BaseBuilding.ShouldShowNotWorkingNotification(self)
end

function dbg_TestAttachedStockPriorities(class)
	class = class or "Building"
	MapForEach(true, class,
		function(o)
			local stockpiles = o:GetAttaches("ResourceStockpileBase")
			for i = 1, #(stockpiles or "") do
				if stockpiles[i].has_demand_request or stockpiles[i].has_supply_request then
					assert(stockpiles[i].priority == o.priority, "Building/stockpile priority mismatch.")
				end
			end
		end)
end

----- UI

function TaskRequester:TogglePriority(change)
	local next_priority = self.priority + change
	if next_priority > const.MaxBuildingPriority then
		next_priority = 1
	elseif next_priority < 1 then
		next_priority = const.MaxBuildingPriority
	end
	self:SetPriority(next_priority)
	RebuildInfopanel(self)
end

local PriorityNames = {
	T(4862, "Low"),
	T(646, "Medium"),
	T(4863, "High"),
}
function TaskRequester:GetUIPriority()
	return PriorityNames[self.priority] or PriorityNames[1]
end

function TaskRequester:GetUIStatusOverrideForWorkCommand(request, drone)
	return nil
end
----- Drone and Rover functions

function TaskRequester:DroneApproach(drone, resource)
	return drone:GotoBuildingSpot(self, drone.work_spot_task)
end

function TaskRequester:DroneWork(drone, request, resource, amount)
	Sleep(1000)
end

function TaskRequester:DroneLoadResource(drone, request, resource, amount)
end

function TaskRequester:DroneUnloadResource(drone, request, resource, amount)
end

function TaskRequester:RoverWork(rover, request, resource, amount)
end

local command_center_search = function (center, building, dist_obj)
	if center.accept_requester_connects and center.work_radius >= HexAxialDistance((dist_obj or building), center) then
		building:AddCommandCenter(center)
	end
end

function TaskRequester:ConnectToCommandCenters()
	local dome = IsObjInDome(self)
	if dome then
		for i = 1, #(dome.command_centers or "") do
			local cc = dome.command_centers[i]
			self:AddCommandCenter(cc)
		end
	else
		MapForEach(self, "hex", const.CommandCenterMaxRadius, "DroneControl", command_center_search, self)
	end
end

function TaskRequester:ConnectToOtherBuildingCommandCenters(other_building)
	local dome = IsObjInDome(other_building) --if other bld is in dome connect to dome's cc's instead.
	
	if dome then
		for i = 1, #(dome.command_centers or "") do
			local cc = dome.command_centers[i]
			self:AddCommandCenter(cc)
		end
	else
		MapForEach(other_building, "hex", const.CommandCenterMaxRadius, "DroneControl", command_center_search, self, other_building)
	end
end

function TaskRequester:DisconnectFromCommandCenters()
	local command_centers = self.command_centers or ""
	while #command_centers > 0 do
		self:RemoveCommandCenter(command_centers[#command_centers])
	end
end

local function fallback_functor(o)
	return o
end

function TaskRequester:InterruptDrones(command_center_filter, drone_filter, on_drone_interrupted_callback)
	--iterates through all command centers of the TaskRequestor and all drones of each command center that passes the command_center_filter filter function
	--each drone that passes drone_filter filter function will have the "Reset" command set, and on_drone_interrupted_callback will be called
	--with the drone in question
	command_center_filter = command_center_filter or fallback_functor
	drone_filter = drone_filter or fallback_functor
	on_drone_interrupted_callback = on_drone_interrupted_callback or fallback_functor
	
	for i = 1, #self.command_centers do
		local cc = command_center_filter(self.command_centers[i])
		if cc then
			cc.no_requests_time = nil
			for j = 1, #cc.drones do
				local drone = drone_filter(cc.drones[j])
				if drone then
					assert(drone.command ~= "Embark")
					drone:SetCommand("Reset")
					if on_drone_interrupted_callback(drone) == "break" then
						break
					end
				end
			end
		end
	end
end

function TaskRequester:OnAddedByControl(control)
end

function TaskRequester:OnRemovedByControl(control)
end

function TaskRequester:ChangeDeficit(resource, amount)
	local container = self.command_centers
	for i = 1, #(container or "") do
		local cc = container[i]
		local t = cc.deficit_table
		t[resource] = t[resource] - amount
	end
end
