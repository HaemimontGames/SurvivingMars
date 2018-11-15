DefineClass.BaseElevator = {
	__parents = { "Object", "SyncObject" },
	passenger = false,
	passenger_spot = "Passenger",
	up_state = "up",

	up_pos = false,

	wp_door_name = "Floordoor",
	wp_door1 = false,
	wp_door2 = false,

	wp_queue_name = "Queue",
	wp_queue1 = false,
	wp_queue2 = false,
	
	queue1 = false,
	queue2 = false,
}

function BaseElevator:GameInit()
	local parent = self:GetParent()
	if IsKindOf(parent, "WaypointsObj") then
		local spot_proximity_dist = 50
		local passenger_spot = GetSpotBeginIndex(self:GetEntity(), self.up_state, self.passenger_spot)
		local down_pos = self:GetRelativePoint(GetEntitySpotPos(self:GetEntity(), self.up_state, 0, passenger_spot))
		local up_pos   = self:GetRelativePoint(GetEntitySpotPos(self:GetEntity(), self.up_state, GetAnimDuration(self:GetEntity(), self.up_state) - 1, passenger_spot))
		self.wp_door1 = parent:FindWaypointsInRange(self.wp_door_name, spot_proximity_dist, down_pos)
		self.wp_door2 = parent:FindWaypointsInRange(self.wp_door_name, spot_proximity_dist, up_pos)
		self.wp_queue1 = self.wp_door1 and parent:FindWaypointsInRange(self.wp_queue_name, spot_proximity_dist, self.wp_door1[#self.wp_door1])
		self.wp_queue2 = self.wp_door2 and parent:FindWaypointsInRange(self.wp_queue_name, spot_proximity_dist, self.wp_door2[#self.wp_door2])
	end
end

-- run in the unit command thread
function BaseElevator:Use(unit, floor)
	local queue_id, queue_wp
	if not floor then
		local z = unit:GetVisualPos():z()
		local z1 = self.wp_door1 and self.wp_door1[1]:z() or z
		local z2 = self.wp_door2 and self.wp_door2[1]:z() or z
		floor = abs(z1 - z) <= abs(z2 - z) and 1 or 2
	end
	if floor == 1 then
		queue_id, queue_wp = "queue1", self.wp_queue1
	else
		queue_id, queue_wp = "queue2", self.wp_queue2
	end
	local queue = self[queue_id]
	if not queue then
		queue = {}
		self[queue_id] = queue
	end
	unit:PushDestructor(function(unit)
		local idx = table.find(queue, unit)
		if idx then
			if table.maxn(queue) == idx then
				queue[idx] = nil
			else
				queue[idx] = false
				if queue[idx + 1] then
					Wakeup(queue[idx + 1].command_thread)
				end
			end
		end
		if self.passenger == unit then
			unit:Detach()
			self.passenger = false
			if IsValid(self) then
				self:Notify("UpdatePassenger")
			end
		end
	end)
	local unit_idle_anim = unit:GetWaitAnim()
	if unit_idle_anim < 0 then
		unit_idle_anim = "idle"
	end
	local idx = table.maxn(queue) + 1
	queue[idx] = unit
	if queue_wp then
		self:FollowQueue(unit, queue, queue_wp, idx, unit_idle_anim)
		if unit.visit_restart then unit:PopAndCallDestructor() return end
	end
	if self.passenger or floor ~= self:GetFloor() then
		unit:SetState(unit_idle_anim)
		if self.wp_door1 and unit:IsValidPos() then
			unit:Face(self.wp_door1[1], 100)
		end
	end
	while self.passenger ~= unit do
		if not self.passenger then
			self:UpdatePassenger()
			if self.passenger == unit then
				break
			end
		end
		WaitWakeup(5000)
		if unit.visit_restart then unit:PopAndCallDestructor() return end
	end
	if not queue_wp then
		while queue[1] == false do
			table.remove(queue, 1)
		end
		assert(queue[1] == unit)
	end
	self.passenger = unit
	if floor ~= self:GetFloor() then
		self:Move(floor)
		if unit.visit_restart then unit:PopAndCallDestructor() return end
	end
	assert(queue[1] == unit)
	if table.maxn(queue) <= 1 then
		queue[1] = nil
	else
		queue[1] = false
		if queue[2] then
			Wakeup(queue[2].command_thread)
		end
	end
	local next_floor = floor == 1 and 2 or 1
	local wp1 = floor == 1 and self.wp_door1 or self.wp_door2
	local wp2 = floor ~= 1 and self.wp_door1 or self.wp_door2
	local attach_angle = floor == 1 and 0 or 180 * 60
	if wp1 then
		FollowWaypointPath(unit, wp1, #wp1, 1)
		if unit.visit_restart then unit:PopAndCallDestructor() return end
	end
	unit:SetState(unit_idle_anim)
	self:Attach(unit, self:GetSpotBeginIndex(self.passenger_spot))
	unit:SetAttachAngle(attach_angle)
	self:Move(next_floor)
	if unit.visit_restart then unit:PopAndCallDestructor() return end
	local pos = unit:GetSpotLocPos(-1)
	unit:Detach()
	unit:SetPos(pos)
	if wp2 then
		FollowWaypointPath(unit, wp2, 1, #wp2, true)
	end
	unit:PopAndCallDestructor()
end

-- run in the unit command thread
function BaseElevator:FollowQueue(unit, queue, waypoints, idx, unit_idle_anim)
	while self.passenger ~= unit do
		unit:Goto(waypoints[idx] or waypoints[#waypoints], "sl")
		if unit.visit_restart then return end
		if idx == 1 then
			unit:SetAngle(CalcOrientation(waypoints[2], waypoints[1]), 200)
			break
		end
		if queue[idx - 1] then
			unit:Face(waypoints[idx - 1] or waypoints[#waypoints - 1], 200)
			unit:SetState(unit_idle_anim or "idle")
			while queue[idx - 1] do
				WaitWakeup(5000)
				if unit.visit_restart then return end
			end
			if self.passenger ~= unit then
				Sleep(1000 + GetTopmostParent(self):Random(1000))
				if unit.visit_restart then return end
			end
		end
		if queue[idx + 1] then
			Wakeup(queue[idx + 1].command_thread)
		end
		local count = table.maxn(queue)
		local empty_value
		if idx < count then
			empty_value = false
		end
		repeat
			queue[idx] = empty_value
			idx = idx - 1
		until idx == 1 or queue[idx - 1]
		queue[idx] = unit
	end
	assert(queue[1] == unit)
end

function BaseElevator:UpdatePassenger()
	if self.passenger then
		return
	end
	local floor = self:GetFloor()
	local queue1, queue2
	if floor == 1 then
		queue1, queue2 = self.queue1, self.queue2
	else
		queue1, queue2 = self.queue2, self.queue1
	end
	local next_passenger
	if queue1 then
		for i = 1, table.maxn(queue1) do
			next_passenger = queue1[i]
			if next_passenger then
				break
			end
		end
	end
	if not next_passenger and queue2 then
		for i = 1, table.maxn(queue2) do
			next_passenger = queue2[i]
			if next_passenger then
				break
			end
		end
	end
	if next_passenger then
		self.passenger = next_passenger
		Wakeup(next_passenger.command_thread)
	end
end

function BaseElevator:GetFloor()
	return self:GetStateText() == "idle" and 1 or 2
end

function BaseElevator:Move(floor)
	if floor ~= self:GetFloor() then
		if floor == 1 then
			self:SetStateText(self.up_state, const.eDontCrossfade + const.eReverse)
			Sleep(self:TimeToAnimEnd())
			if IsValid(self) then
				self:SetStateText("idle", const.eDontCrossfade)
			end
		else
			self:SetStateText(self.up_state, const.eDontCrossfade)
			Sleep(self:TimeToAnimEnd())
		end
	end
end
