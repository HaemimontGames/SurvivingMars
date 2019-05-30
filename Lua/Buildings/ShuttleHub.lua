local developer = Platform.developer
local reassign_dist = 200*guim

DefineClass.ShuttleLanding = {
	__parents = { "Object" },
	
	landing_spot_name = "Workrover",
	
	free_landing_slots = 0,
	has_free_landing_slots = false,
	landing_slots = false,
	queued_shuttles = false,
	landing_reservation = false,
}

function ShuttleLanding:InitLandingSpots()
	--define the landing spots
	local slots = {}
	local spot_name = self.landing_spot_name or ""
	if spot_name ~= "" then
		local first, last = -1, -2
		if self:HasSpot(spot_name) then
			first, last = self:GetSpotRange(spot_name)
		end	
		if last - first + 1 > 256 then
			StoreErrorSource(self, "Too many spots detected for", name)
		else
			for i = first, last do
				slots[#slots + 1] = {
					reserved_by = false,
					pos = self:GetSpotPos(i),
				}
			end
		end
	end
	self.landing_slots = slots
	self.free_landing_slots = #slots
	self.has_free_landing_slots = #slots > 0
	return slots
end

function ShuttleLanding:GameInit()
	self:InitLandingSpots()
	self.queued_shuttles = {}
end

function ShuttleLanding:Done()
	self:WakeupWaitingShuttles()
end

function ShuttleLanding:WakeupWaitingShuttles()
	local queue = self.queued_shuttles or empty_table
	for i=1,#queue do
		Wakeup(queue[i].command_thread)
	end
end

function ShuttleLanding:GetNearestLandingSlot(pt)
	local slots = self.landing_slots or ""
	if #slots == 0 then
		return
	end
	local nearest_pos = slots[1].pos
	local landing_idx = 1
	for i=2,#slots do
		local pos = slots[i].pos
		if IsCloser2D(pt, pos, nearest_pos) then
			landing_idx = i
			nearest_pos = pos
		end
	end
	return slots[landing_idx], landing_idx
end

function ShuttleLanding:IsLandingSpotFree(idx)
	local slot = self.landing_slots[idx]
	return slot and not IsValid(slot.reserved_by)
end

function ShuttleLanding:GetLandingSpot(shuttle, reassign)
	local slots = self.landing_slots
	local slot, idx = table.find_value(slots, "reserved_by", shuttle)
	if not slot and reassign then
		if not self.landing_reservation then
			return self:GetNearestLandingSlot(shuttle)
		end
		for i, s in ipairs(slots) do
			local shuttle_i = s.reserved_by
			if not IsValid(shuttle_i) or not self:IsCloser2D(shuttle_i, reassign_dist) then
				idx, slot = i, s
				break
			end
		end
		if not slot then
			return
		end
		for i, shuttle_i in ipairs(self.queued_shuttles) do
			if shuttle_i ~= shuttle and self:IsCloser2D(shuttle_i, shuttle) then
				return
			end
		end
	end
	return slot, idx
end

function ShuttleLanding:ReserveLandingSpot(shuttle, idx)
	if not IsValid(shuttle) then
		assert(false, "Invalid shuttle trying to reserve a landing spot!")
		return
	end
	local prev_slot, prev_idx = self:GetLandingSpot(shuttle)
	if prev_slot then
		assert(not idx or idx == prev_idx, "Shuttle trying to reserve a second landing spot!")
		return prev_slot
	end
	local queue = self.queued_shuttles
	local slots = self.landing_slots
	local free_landing_slots = self.free_landing_slots
	if developer then
		local free_slots = 0
		for i=1,#slots do
			if not IsValid(slots[i].reserved_by) then
				free_slots = free_slots + 1
			end
		end
		assert(free_slots == self.free_landing_slots, "Wrong free landing slots count!")
	end
	local slot
	if not idx then
		for i=1,#slots do
			if not IsValid(slots[i].reserved_by) then
				slot = slots[i]
				break
			end
		end
	elseif not IsValid(slots[idx].reserved_by) then
		slot = slots[idx]
	end
	if slot then
		slot.reserved_by = shuttle
		if free_landing_slots > 1 then
			self.free_landing_slots = free_landing_slots - 1
		else
			self.free_landing_slots = 0
			if self.landing_reservation then
				self.has_free_landing_slots = false
			end
		end
		if queue[shuttle] then
			queue[shuttle] = nil
			table.remove_value(queue, shuttle)
			Wakeup(shuttle.command_thread)
		end
		return slot
	end
	if not self.landing_reservation then
		return self:GetNearestLandingSlot(shuttle)
	end
	if not queue[shuttle] then
		table.insert(queue, shuttle)
	end
	queue[shuttle] = idx or queue[shuttle] or -1
end

function ShuttleLanding:FreeLandingSpot(shuttle)
	local queue = self.queued_shuttles
	local slot, idx = self:GetLandingSpot(shuttle)
	if not slot then
		if queue[shuttle] then
			queue[shuttle] = nil
			table.remove_value(queue, shuttle)
		end
		return
	end
	slot.reserved_by = false
	local free_landing_slots = self.free_landing_slots
	if free_landing_slots > 0 then
		self.free_landing_slots = free_landing_slots + 1
	else
		self.free_landing_slots = 1
		self.has_free_landing_slots = true
	end
	while #queue > 0 do
		local next_shuttle = queue[1]
		assert(IsValid(next_shuttle), "Invalid shuttle waiting for a landing spot")
		local next_idx = queue[next_shuttle]
		if self:ReserveLandingSpot(next_shuttle, next_idx ~= -1 and next_idx or idx) then
			break
		end
		table.remove(queue, 1)
		queue[next_shuttle] = nil
	end
end

function ShuttleLanding:GetWaitPos(shuttle)
	local center = self:GetPos()
	local min_radius = self:GetRadius()
	local max_radius = min_radius * 6
	local mw, mh = terrain.GetMapSize()
	local x, y = RotateRadius(min_radius + self:Random(max_radius - min_radius), self:Random(360 * 60), center, true)
	x = Clamp(x, guim, mw - guim)
	y = Clamp(y, guim, mh - guim)
	return point(x, y)
end

function ShuttleLanding:ShuttleLeadIn(shuttle)
	local his_pos = shuttle:GetVisualPos()
	local los = CheckLineOfSight(his_pos, his_pos:SetZ(terrain.GetHeight(his_pos)))
	local z
	if not los then
		z = Flight_GetHeight(his_pos:xy()) + shuttle.landed_height
	else
		z = terrain.GetHeight(his_pos) + shuttle.landed_height
	end
	local dz = abs(his_pos:z() - z)
	
	shuttle:LandingStart()
	shuttle:SetState("fly")
	shuttle:PushDestructor(function(shuttle)
		if IsValid(shuttle) then
			shuttle:SetState("idle")
		end
	end)
	shuttle:SetAcceleration(1500)
	shuttle:SetPos(his_pos:SetZ(z + dz / 2), 1000)
	
	--face away from landing site for easier take off
	shuttle:FlyingFace(his_pos + (his_pos - self:GetPos()), 2000)
	
	shuttle:PlayFX("Land", "start")
	Sleep(990)
	if not IsValid(shuttle) then return end
	shuttle:PlayFX("Land", "mid")
	shuttle:SetAcceleration(-1500)
	shuttle:SetPos(his_pos:SetZ(z), 1000)
	Sleep(1010)
	shuttle:PlayFX("Land", "end")
	shuttle:PopDestructor()
end

function ShuttleLanding:ShuttleLeadOut(shuttle)
	shuttle:PushDestructor(function(shuttle)
		if IsValid(shuttle) and GetStateName(shuttle:GetState()) == "fly" then
			shuttle:SetState("idle")
		end
	end)
	shuttle:LandingEnd()
	local his_pos = shuttle:GetPos()
	local z = Flight_GetHeight(his_pos:xy()) + shuttle.hover_height
	local dz = abs(his_pos:z() - z)
	shuttle:SetAcceleration(1500)
	shuttle:SetPos(his_pos:SetZ(z - dz / 2), 1000)
	shuttle:PlayFX("TakeOff", "start")
	Sleep(990)
	if not IsValid(shuttle) then return end
	shuttle:PlayFX("TakeOff", "mid")
	shuttle:SetAcceleration(-1500)
	shuttle:SetPos(his_pos:SetZ(z), 1000)
	Sleep(1010)
	shuttle:PlayFX("TakeOff", "end")
	shuttle:PopAndCallDestructor()
end

if Platform.developer then
	local fx_shuttle = false
	local fx_shuttle_thread = false
	function TestShuttleLandingTakeOffFX(t) --t == "land", t == "takeoff"
		if IsValidThread(fx_shuttle_thread) then
			DeleteThread(fx_shuttle_thread)
		end
		
		local pos = GetTerrainCursor()
		
		if not IsValid(fx_shuttle) then
			fx_shuttle = PlaceObject("CargoShuttle")
			fx_shuttle:SetEnumFlags(const.efVisible)
		end
		
		local z
		
		if t == "land" then
			z = Flight_GetHeight(pos:xy()) + fx_shuttle.hover_height
		else
			z = Flight_GetHeight(pos:xy()) + fx_shuttle.landed_height
		end
		
		pos = pos:SetZ(z)
		
		fx_shuttle_thread = CreateGameTimeThread(function()
			while IsValid(fx_shuttle) do
				fx_shuttle:SetPos(pos)
				if t == "land" then
					ShuttleLanding.ShuttleLeadIn(fx_shuttle, fx_shuttle)
				else
					ShuttleLanding.ShuttleLeadOut(fx_shuttle, fx_shuttle)
				end
				if t == "land" then
					PlayFX("ShuttleLoad", "start", fx_shuttle, fx_shuttle)
				end
				Sleep(1000)
				if t == "land" then
					PlayFX("ShuttleLoad", "end", fx_shuttle, fx_shuttle)
				end
			end
		end)
	end
	function DbgShowColonistDropPositions(bld)
		bld = bld or SelectedObj
		DbgClearVectors()
		if not IsKindOf(bld, "ShuttleLanding") then
			return
		end
		local hex_rad = const.GridSpacing / 2
		for _, slot in ipairs(bld.landing_slots or empty_table) do
			local x, y = FindDropPos(slot.pos:xy())
			if x then
				local pos = point(x, y)
				local close = IsCloser2D(pos, slot.pos, hex_rad)
				local color = close and green or red
				DbgAddVector(pos, 100*guim)
				DbgAddCircle(slot.pos, hex_rad, color)
				if not close then
					DbgAddVector(pos, slot.pos - pos, color)
				end
			end
		end
	end
	function ShowDropPosition(pos)
		pos = pos or GetTerrainCursor()
		DbgClearVectors()
		local x, y = FindDropPos(pos:xy())
		if x then
			DbgAddVector(point(x, y), 100*guim)
		end
	end
end

function IsLRTransportAvailable(city)
	for _, hub in ipairs((city or UICity).labels.ShuttleHub or empty_table) do
		if #(hub.shuttle_infos or "") > 0
		and (hub.working or hub:GetWorkNotPermittedReason() and not hub:GetWorkNotPossibleReason()) then
			return true
		end
	end
	return false
end

DefineClass.ShuttleInfo = {
	__parents = { "InitDone" },
	
	max_fuel = const.DayDuration / 2, --1 fuel = 1ms flight
	current_fuel = const.DayDuration / 2,
	
	hub = false,
	shuttle_obj = false,
	shuttle_class = "CargoShuttle"
}
function ShuttleInfo:Refuel(amount)
	self.current_fuel = Min(self.current_fuel + amount, self.max_fuel)
end

function ShuttleInfo:CanLaunch()
	return self.current_fuel >= self.max_fuel and self.shuttle_obj == false
end

function ShuttleInfo:CreateShuttle(task)
	assert(not self.shuttle_obj)
	assert(task)
	local shuttle = PlaceObject(self.shuttle_class, { hub = self.hub, info_obj = self })
	self.shuttle_obj = shuttle
	local city = self.hub and self.hub.city or UICity
	city:AddToLabel("CargoShuttle", shuttle)
	shuttle:SetTransportTask(task)
	shuttle:SetCommand("Transport")
	return shuttle
end

function ShuttleInfo:Land(shuttle)
	assert(self.shuttle_obj == shuttle)
	DoneObject(shuttle)
	if self.hub then
		self.hub:RefuelShuttle(self)
	end
end
-----------------------------------------------------------------------------------------
DefineClass.Shuttle = {
	__parents = { "FlyingObject", "InfopanelObj", "CameraFollowObject" },
	entity = "Shuttle",
	fx_actor_base_class = "Shuttle",
	thrust_modifier = 200,
	roll_modifier = 500,
	accel_dist = 20*guim,
	decel_dist = 50*guim,
	collision_radius = 10*guim,
	ip_template = "ipShuttle",
}

DefineClass.CargoShuttle = {
	__parents = { "Shuttle", "SharedStorageBaseVisualOnly", "Modifiable" },
	flags = { gofPermanent = false, efVisible = false, efUnit = true, },
	properties = {
		{ id = "max_shared_storage", default = 3 * const.ResourceScale, scale = const.ResourceScale, name = T(743, "Max Shuttle resource capacity"), modifiable = true, editor = "number" , no_edit = true},
		{ id = "move_speed", default = 30*guim, name = T(6765, "Max Shuttle speed"), modifiable = true, editor = "number" , no_edit = true},
	},
	
	storable_resources = {"Concrete", "Metals", "Polymers", "Food", "Electronics", "MachineParts", "PreciousMetals", "Fuel", "Colonist", "MysteryResource", "BlackCube", "WasteRock", "Seeds"},
	max_x = 2,
	max_y = 2,
	max_z = 5,
	carried_resource_type = false,
	transport_task = false,
	is_colonist_transport_task = false,
	hub = false,
	info_obj = false,
	work_spot_task = "Workdrone",
	assigned_to_d_req = false,
	assigned_to_s_req = false,
	avoid_class = 1,
	avoid_mask = 1 + 4, -- avoid other shuttles and mirror spheres
	max_yaw_speed = 180 * 60, --faster turn rate 2 face path
	landed_height = 10 * guim, --when shuttle is "landing" this is the offset of the height grid it will go to.
	landing = false,
	waiting = false,
	dest_dome = false,
	
	--resolve inheritance
	entity = Shuttle.entity,
	
	--ui
	display_name = T(7675, "Shuttle"),
	description = T(746, "Facilitates long-range resource transportation between Depots and colonist resettlement between Domes."),
	display_icon = "UI/Icons/Buildings/res_shuttle.tga",
	
	--fx
	fx_actor_class = "Shuttle",
	encyclopedia_id = "Shuttle",
	
	palette = { "outside_accent_1", "outside_base", "outside_dark", "outside_base" },
	max_land_dist = 8 * guim,
	
	history_entry = false,
}

function CargoShuttle:Init()
	SetPaletteFromClassMember(self)
	self:SetHeat(255)
end

function CargoShuttle:GameInit()
	self.placement_offset = point(0, 0, 5 * guim)
end

function CargoShuttle:Done()
	local hub = self.hub or empty_table
	local city = hub.city or UICity
	city:RemoveFromLabel("CargoShuttle", self)
	self:ClearRequests()
	self:SetTransportTask(false)
	self:LandingEnd()
	self:WaitingEnd()
	if IsValid(hub) and hub.launched == self then
		hub.launched = false
	end
	local info_obj = self.info_obj or empty_table
	if info_obj.shuttle_obj == self then
		info_obj.shuttle_obj = false
	end
end

function CargoShuttle:Destroy()
	DoneObject(self)
end

function OnMsg.GatherLabels(labels)
	labels.CargoShuttle = true
end

function CargoShuttle:MoveSleep(t)
	Sleep(t)
	local info_obj = self.info_obj
	if info_obj then
		info_obj.current_fuel = Max(info_obj.current_fuel - t, 0)
	end
end

function CargoShuttle:LaunchDstr()
	local hub = self.hub
	self:SetPos(hub.landing_slots[1].pos)
	hub:ShuttleLeadOut(self)
	if IsValid(hub) and hub.launched == self then
		hub.launched = false
		if hub.working then 
			hub:SendOutShuttles()
		end
	end
end

function CargoShuttle:Launch()
	if self.hub.launched ~= self then
		assert(self:IsValidPos())
		return
	end
	self:PushDestructor(self.LaunchDstr)	
	self:PopAndCallDestructor()
end

function CargoShuttle:LandingStart()
	if not self.landing then
		self.landing = true
		self:PlayFX("Dust", "start")
	end
end
function CargoShuttle:LandingEnd()
	if self.landing then
		self.landing = false
		self:PlayFX("Dust", "end")
	end
end

function CargoShuttle:WaitingStart()
	if self.waiting then
		return
	end
	self.waiting = true
	self:PlayFX("Waiting", "start")
	if self:GetState() ~= GetStateIdx("fly") then
		self:SetState("fly")
	end
end
function CargoShuttle:WaitingEnd()
	if not IsValid(self) or not self.waiting then
		return
	end
	self.waiting = false
	self:PlayFX("Waiting", "end")
	if self:GetState() ~= GetStateIdx("idle") then
		self:SetState("idle")
	end
end

function FindDropPos(x, y, pfclass, err_dist)
	pfclass = pfclass or 0
	if terrain.IsPassable(x, y, pfclass) and IsBuildableZone(x, y) then
		return x, y
	end
	local HexGridGetObject = BreathableAtmosphere and empty_func or HexGridGetObject
	local GetPassablePointNearby = GetPassablePointNearby
	local hex_radius = const.GridSpacing / 2
	local grid = ObjectGrid
	local px, py = GetPassablePointNearby(x, y, pfclass, hex_radius)
	if px then
		local q, r = WorldToHex(px, py)
		if IsBuildableZoneQR(q, r)
		and not HexGridGetObject(grid, q, r, "Dome")
		and not HexGridGetObject(grid, q, r, "DomeInterior") then
			return px, py
		end
	end
	local max_depth = err_dist and (err_dist / const.GridSpacing) or -1
	local found = FindBuildableAround(x, y, function(qi, ri)
		if HexGridGetObject(grid, qi, ri, "Dome")
		or HexGridGetObject(grid, qi, ri, "DomeInterior") then
			return true
		end
		local xi, yi = HexToWorld(qi, ri)
		px, py = GetPassablePointNearby(xi, yi, pfclass, hex_radius)
		if not px then
			return true
		end
	end, max_depth)
	if not found then
		assert(false, "No landing pos found!")
		return
	end
	assert(not err_dist or IsCloser2D(x, y, px, py, err_dist))
	return px, py
end

function CargoShuttle:LeaveColonist(colonist)
	if not IsValid(colonist) or colonist:GetParent() ~= self then
		return
	end
	local x0, y0
	if self:IsValidPos() then
		x0, y0 = self:GetVisualPosXYZ()
	else
		assert(false, "Invalid shuttle pos!")
		local task = self.transport_task
		if task and task.dest_pos then
			x0, y0 = task.dest_pos:xy()
		elseif IsValid(self.hub) then
			x0, y0 = self.hub:GetVisualPosXYZ()
		else
			assert(false, "Failed to resolve a valid pos to leave colonist!")
			return
		end
	end
	local x, y = FindDropPos(x0, y0, colonist.pfclass, 64*guim)
	colonist:Detach()
	colonist:SetPos(x, y, const.InvalidZ)
	colonist:UpdateOutside()
	colonist:SetVisible(true)
	Wakeup(colonist.command_thread)
end

function CargoShuttle:Goto(dest)
	local path = self:CalcPath(self:GetPos(), dest)
	if not path then
		return
	end
	return self:FollowPathCmd(path)
end

function CargoShuttle:TransportColonist()
	assert(self.is_colonist_transport_task)
	assert(IsValid(self.transport_task.source_dome))
	assert(IsValid(self.transport_task.dest_dome))
	
	local source_dome = self.transport_task.source_dome
	local dest_dome = self.transport_task.dest_dome
	local colonist = self.transport_task.colonist
	local source_landing_spot_id = self.transport_task.source_landing_site[2]
	self:PushDestructor(function(self)
		self.dest_dome = false
		--free landing slots.
		dest_dome:FreeLandingSpot(self)
		source_dome:FreeLandingSpot(self)
		
		if self.transport_task.state == "transporting" then
			--colo has been picked up... 
			self:AddResource(-const.ResourceScale, "Colonist")
			self:LeaveColonist(colonist)
		end
		
		self:RegisterHistoryEntryWithHub(self.transport_task.state == "done")
		self.transport_task.shuttle = false
		self.transport_task = false
		
		self:LandingEnd()
		self:WaitingEnd()
	end)
	
	if not colonist:CanChangeCommand() then
		self:PopAndCallDestructor()
		Sleep(1000)
		return
	end
	
	self.dest_dome = dest_dome
	if colonist.command ~= "Transport" then
		colonist:InterruptCommand() --make colo go to the pick up pos
	end
	
	--assign both landing spots while we can so we can smoothly deliver the colo
	if not source_dome:IsLandingSpotFree(source_landing_spot_id) or not dest_dome.has_free_landing_slots then
		self:PopAndCallDestructor()
		Sleep(1000)
		return
	end
	
	local dest_landing_slot = dest_dome:ReserveLandingSpot(self)
	local source_landing_slot = source_dome:ReserveLandingSpot(self, source_landing_spot_id)

	self:Launch()
	
	--goto source
	local dest = source_landing_slot.pos
	if not self:IsCloser2D(dest, self.max_land_dist) then
		if not self:Goto(dest) or not IsValid(colonist) then
			self:PopAndCallDestructor()
			Sleep(1000)
			return
		end
	end
	
	source_dome:ShuttleLeadIn(self) --land or sumthing
	local waiting
	while self.transport_task.state == "almost_ready_for_pickup" do
		--we arrived before colonist, wait for it to reach us.
		if not IsValid(colonist)
		or colonist.command ~= "Transport"
		or self.transport_task ~= colonist.transport_task
		then
			self:PopAndCallDestructor()
			Sleep(1000)
			return
		end
		self:WaitingStart()
		WaitWakeup(999)
	end
	self:WaitingEnd()
	
	--we should be right above the colonist
	self:PlayFX("ShuttleLoad", "start", source_dome)
	Sleep(1000) --as if loading n such
	if not IsValid(colonist) or not IsValid(self) or not colonist:IsWaitingTransport() then
		self:PopAndCallDestructor()
		Sleep(1000)
		return
	end
	
	assert(self.transport_task.shuttle == self)
	assert(self.transport_task.colonist == colonist)
	
	self.transport_task.state = "transporting"
	self:SetCarriedResource("Colonist", 1)
	colonist:SetVisible(false)
	colonist:SetOutside(false)
	self:Attach(colonist)
	
	if IsValid(source_dome) then
		self:PlayFX("ShuttleLoad", "end", source_dome)
		source_dome:ShuttleLeadOut(self)
		source_dome:FreeLandingSpot(self)
	end
	self:LandingEnd()
	--goto dest
	dest = dest_landing_slot.pos
	self.transport_task.dest_pos = dest
	if not self:IsCloser2D(dest, self.max_land_dist) then
		if not self:Goto(dest) or not IsValid(colonist) then
			self:PopAndCallDestructor()
			Sleep(1000)
			return
		end
	end
	
	--we should be @ dest
	dest_dome:ShuttleLeadIn(self) --land or sumthing
	--we should be right above the colonist
	self:PlayFX("ShuttleUnload", "start", dest_dome)
	Sleep(1000) --as if loading n such
	if not IsValid(colonist) or not IsValid(self) then
		self:PopAndCallDestructor()
		Sleep(1000)
		return
	end

	self:SetCarriedResource("Colonist", -1)
	self:LeaveColonist(colonist)
	self.transport_task.state = "done"
	
	if IsValid(dest_dome) then
		self:PlayFX("ShuttleUnload", "end", dest_dome)
		dest_dome:ShuttleLeadOut(self)
		dest_dome:FreeLandingSpot(self)
	end
	
	self:PopAndCallDestructor()
end

function CargoShuttle:ClearRequests()
	if self.assigned_to_d_req then
		self.assigned_to_d_req[1]:UnassignUnit(self.assigned_to_d_req[2], false)
		self.assigned_to_d_req[1]:GetBuilding():ChangeDeficit(self.assigned_to_d_req[1]:GetResource(), -self.assigned_to_d_req[2])
		self.assigned_to_d_req = false
	end
	
	if self.assigned_to_s_req then
		self.assigned_to_s_req[1]:UnassignUnit(self.assigned_to_s_req[2], false)
		self.assigned_to_s_req = false
	end
end

local function ReqToStr(req)
	local building = req and req:GetBuilding()
	if not building then	
		return "none"
	end
	return req:GetTargetAmount() .. " from " .. building.class
end

function CargoShuttle:Transport()
	if self.is_colonist_transport_task then
		self:SetCommand("TransportColonist")
	end
	local start_time = GameTime()
	self:PushDestructor(self.ClearRequests)
	if self:GetEmptyStorage() > 0 and self.transport_task and self.transport_task[2] then
		self:PickUp()
	end
	self:Deliver()
	self:PopDestructor()
	if GameTime() == start_time then
		print("Invalid transport task:\n\tDemand " .. ReqToStr(self.transport_task[3]) .. "\n\tSupply " .. ReqToStr(self.transport_task[2]))
		assert(false, "Invalid transport task!")
		if not self:IsValidPos() then
			DoneObject(self)
			return
		end
		self:PushDestructor(self.WaitingEnd)
		self:WaitingStart()
		Sleep(999)
		self:PopAndCallDestructor()
	end
end

function CargoShuttle:WaitForFreeLandingSpot(bld)
	if not IsValid(bld) then
		return
	end
	if not bld:ReserveLandingSpot(self) then
		self:PushDestructor(function(self)
			bld:FreeLandingSpot(self)
			self:WaitingEnd()
		end)
		local dest = bld:GetWaitPos(self)
		if not self:IsCloser2D(dest, self.max_land_dist) then
			if not self:Goto(dest) or not IsValid(bld) then
				self:PopAndCallDestructor()
				Sleep(1000)
				return
			end
		end
		while IsValid(bld) and not bld:GetLandingSpot(self, true) do
			self:WaitingStart()
			WaitWakeup(999)
		end
		if not IsValid(bld) then
			self:PopAndCallDestructor()
			return
		end
		self:WaitingEnd()
		self:PopDestructor()
	end
	return bld:GetLandingSpot(self, true)
end

function CargoShuttle:PickUp()
	if not self.transport_task then
		return 
	end
	local supply_request = self.transport_task[2]
	local demand_request = self.transport_task[3]
	local resource = self.transport_task[4]
	local amount = self.assigned_to_s_req and self.assigned_to_s_req[2] or Min(self.max_shared_storage, supply_request:GetTargetAmount(), demand_request:GetTargetAmount())
	
	if amount <= 0 then
		return false
	end
	
	if not self.assigned_to_s_req and not supply_request:AssignUnit(amount) then
		return false
	end
	
	if not self.assigned_to_d_req and not demand_request:AssignUnit(amount) then
		supply_request:UnassignUnit(amount, false)
		self.assigned_to_s_req = false
		return false
	end
	
	self:Launch()
		
	self.assigned_to_s_req = self.assigned_to_s_req or {supply_request, amount}
	self.assigned_to_d_req = self.assigned_to_d_req or {demand_request, amount}
	
	local state = "approach_supply"
	local s_building = supply_request:GetBuilding()
	--load destro
	self:PushDestructor(function(self)
		if state == "approach_supply" or state == "load" then
			--we have failed to properly load resources
			self:RegisterHistoryEntryWithHub(false)
			self.transport_task = false
			supply_request:UnassignUnit(amount, state == "load")
			demand_request:UnassignUnit(amount, false)
			demand_request:GetBuilding():ChangeDeficit(resource, -amount)
			self.assigned_to_d_req = false
			self.assigned_to_s_req = false
			if state == "load" then
				--we fullfilled the req, but we havn't picked up the stuff..
				supply_request:AddAmount(amount)
			end
		end
		if IsValid(s_building) then
			s_building:FreeLandingSpot(self)
		end
	end)
	
	local slot = self:WaitForFreeLandingSpot(s_building)
	if not slot then
		self:PopAndCallDestructor()
		return
	end
	local dest = slot.pos
	if not self:IsCloser2D(dest, self.max_land_dist) then
		if not self:Goto(dest) or not IsValid(s_building) then
			self:PopAndCallDestructor()
			return
		end
	end
	s_building:ShuttleLeadIn(self) --land or sumthing
	--we should be @ the supply bld
	if not IsValid(s_building) or not supply_request:Fulfill(amount) then --there isn't enough resource...
		self:PopAndCallDestructor()
		return
	end
	
	state = "load"
	--atm there is no drone specific stuff in the storagedepot:DroneLoadResource, what it doest is update reciprocal requests in the bld.
	s_building:DroneLoadResource(self, supply_request, resource, amount, true)
	self:SetCarriedResource(resource, amount)
	self:PopDestructor() --clean load, nothing to revert.
	state = "done"
	supply_request:UnassignUnit(amount, true)
	self.assigned_to_s_req = false
	self.transport_task[2] = nil
	self:PlayFX("ShuttleLoad", "start", s_building)
	Sleep(1000) --as if loading n such
	if IsValid(s_building) then
		--this is not a showstopper
		self:PlayFX("ShuttleLoad", "end", s_building)
		s_building:ShuttleLeadOut(self)
		s_building:FreeLandingSpot(self)
	end
	return true
end

function CargoShuttle:Deliver()
	if not self.transport_task then 
		return 
	end
	local demand_request = self.transport_task[3]
	local resource = self.transport_task[4]
	local amount = self.assigned_to_d_req and self.assigned_to_d_req[2] or self:GetStoredAmount()
	
	if self:GetStoredAmount() <= 0 then --we did not pickup anything?
		if self.assigned_to_d_req then
			demand_request:UnassignUnit(amount, false)
			demand_request:GetBuilding():ChangeDeficit(resource, -amount)
			self.assigned_to_d_req = false
		end
		return 
	elseif not self.assigned_to_d_req then
		if not demand_request:AssignUnit(amount) then
			return
		end
		
		self.assigned_to_d_req = {demand_request, amount}
	end
	
	self:Launch()
	
	local state = "approach_demand"
	
	local d_building = demand_request:GetBuilding()
	--unload destro
	self:PushDestructor(function(self)
		if state == "approach_demand" or state == "unload" then
			self:RegisterHistoryEntryWithHub(false)
			self.transport_task = false
			if self.assigned_to_d_req then
				local did_finish = state == "unload"
				demand_request:UnassignUnit(amount, did_finish)
				if not did_finish then
					local building = demand_request:GetBuilding()
					if building then
						building:ChangeDeficit(resource, -amount)
					end
				end
				self.assigned_to_d_req = false
			end
			if state == "unload" then
				--we fullfilled the req, but we havn't dropped the stuff.. happens when there is a delay in the load func
				demand_request:AddAmount(amount)
			end
		end
		if IsValid(d_building) then
			d_building:FreeLandingSpot(self)
		end
	end)
	
	local slot = self:WaitForFreeLandingSpot(d_building)
	if not slot then
		self:PopAndCallDestructor()
		return
	end
	local dest = slot.pos
	if not self:IsCloser2D(dest, self.max_land_dist) then
		if not self:Goto(dest) or not IsValid(d_building) then
			self:PopAndCallDestructor()
			return
		end
	end
	d_building:ShuttleLeadIn(self) --land or sumthing
	--we should be @ the supply bld
	if not IsValid(d_building) or not demand_request:Fulfill(amount) then --there isn't enough resource...
		self:PopAndCallDestructor()
		return
	end
	
	state = "unload"
	d_building:DroneUnloadResource(self, demand_request, resource, amount) --c droneload above
	self:SetCarriedResource(resource, -amount)
	self:PopDestructor() --clean load, nothing to revert.
	state = "done"
	self:RegisterHistoryEntryWithHub(true)
	demand_request:UnassignUnit(amount, true)
	self.assigned_to_d_req = false
	self.transport_task = false
	
	self:PlayFX("ShuttleUnload", "start", d_building)
	Sleep(1000) --as if unloading n such
	if IsValid(d_building) then
		--this is not a showstopper
		self:PlayFX("ShuttleUnload", "end", d_building)
		d_building:ShuttleLeadOut(self)
		d_building:FreeLandingSpot(self)
	end
	return true
end

function CargoShuttle:SetCarriedResource(r, a)
	self:AddResource(a, r)
	if a > 0 then
		self.carried_resource_type = r
	else
		self.carried_resource_type = false
	end
end

function CargoShuttle:SetCount(new_count)
	self.count = new_count/const.ResourceScale --this is a hack. It assumes that the shuttle will always carry one type of resource, and is here so that getstoredamount funcs that use count work correctly.
end

function CargoShuttle:RegisterHistoryEntryWithHub(success)
	local he = self.history_entry
	self.history_entry = false
	local hub = self.hub
	if not IsValid(hub) or not he then return end
	he[1] = GameTime()
	he[2] = success
	table.insert(#he <= 5 and hub.people_flights or hub.cargo_flights, he)
end

function CargoShuttle:HistoryEntryFromTask(task)
	if not task then
		return
	end
	if IsKindOf(task, "ColonistTransportTask") then
		return { GameTime(), false, task.source_dome, task.dest_dome, task.colonist }
	else
		local amount = Min(self.max_shared_storage, task[2] and task[2]:GetTargetAmount() or max_int, task[3]:GetTargetAmount())
		return { GameTime(), false, task[2] and task[2]:GetBuilding(), task[3]:GetBuilding(), task[4], amount }
	end
end
--task maintenance
function CargoShuttle:SetTransportTask(task)
	task = task or false
	local prev_task = self.transport_task
	if prev_task == task then
		return
	end
	
	assert(not self.assigned_to_s_req and not self.assigned_to_d_req)
	self:ClearRequests()
	
	if prev_task then
		if self.is_colonist_transport_task then
			if prev_task.state == "transporting" and prev_task.colonist then
				--colo has been picked up... 
				self:AddResource(-const.ResourceScale, "Colonist")
				self:LeaveColonist(prev_task.colonist)
			end
			assert((prev_task.shuttle or self) == self)
			prev_task.shuttle = false
		end
	end
	self.transport_task = task
	self.history_entry = self:HistoryEntryFromTask(task)
	
	if IsKindOf(task, "ColonistTransportTask") then
		self.is_colonist_transport_task = true
		task.shuttle = self
		return true
	end
	
	self.is_colonist_transport_task = false
	
	if not task then
		return
	end
	local supply_request = task[2]
	local demand_request = task[3]
	local resource = task[4]
	local amount = Min(self.max_shared_storage, supply_request and supply_request:GetTargetAmount() or max_int, demand_request:GetTargetAmount())
	
	local building = demand_request:GetBuilding()
	--assign early so cc's updating their deficit will see us
	if not building or amount <= 0 or (supply_request and not supply_request:AssignUnit(amount)) then
		return false
	end
	
	if not demand_request:AssignUnit(amount) then
		if supply_request then
			supply_request:UnassignUnit(amount, false)
		end
		return false
	end
	
	self.assigned_to_s_req = supply_request and {supply_request, amount} or false
	self.assigned_to_d_req = {demand_request, amount}
	building:ChangeDeficit(resource, amount)
	
	return true
end

function CargoShuttle:GetCurrentFuel()
	return self.info_obj and self.info_obj.current_fuel or 0
end

local function dummy_true()
	return true
end

local found = false
function CargoShuttle:TryRebase()
	local cls = self.class
	found = false
	local filter = function(o)
		if found then
			return "break"
		end
		found = (cls or "CargoShuttle") == o.shuttle_class and o:CanHaveMoreShuttles()
		return found
	end
	local objs = MapGet(true, "ShuttleHub", filter)
	if #objs > 0 then
		local nh = objs[1]
		local my_i = self.info_obj
		local new_i = ShuttleInfo:new{hub = nh, shuttle_class = cls, 
											shuttle_obj = self, 
											current_fuel = my_i.current_fuel,}
		nh.shuttle_infos[#nh.shuttle_infos + 1] = new_i
		self.info_obj = new_i
		self.hub = nh
		return true
	end
	
	return false
end

function CargoShuttle:Idle()
	local hub = self.hub
	if not IsValid(hub) then
		--shuttle hub is gone?
		if not self:TryRebase() then
			print("killing shuttle due to dead shuttle hub.")
			DoneObject(self)
		end
		return
	end
	
	local has_storage = self:GetStoredAmount() > 0
	local has_fuel = self:GetCurrentFuel() > 0
	local working = hub.working
	if not working and has_fuel then
		-- if we have fuel, ignore not working hub if no fuel is the reason for not working
		local can_consume = hub.CanConsume
		hub.CanConsume = dummy_true
		working = not hub:GetNotWorkingReason()
		hub.CanConsume = can_consume
	end
	if working and has_fuel or has_storage then
		--we got fuel we can do stuffs, or we got stuffs to deliver and we cant go home yet.
		local capacity = self.max_shared_storage
		if has_storage then	--we are already carrying sumthing, get dest only
			assert(not self.is_colonist_transport_task)
			
			if not self.is_colonist_transport_task then --if colo, should disembark in destros
				local task = LRManagerInstance:FindTransportTask(self, true, self.carried_resource_type, capacity)
				if task then
					self:SetTransportTask(task)
					self:SetCommand("Transport")
					return
				else
					--noone wants this..dump it and go home? thats what i'd do.
					local a = self:GetStoredAmount(self.carried_resource_type)
					PlaceResourceStockpile_Instant(self:GetPos():SetTerrainZ(), self.carried_resource_type, a, self:GetAngle(), true)
					self:SetCarriedResource(self.carried_resource_type, -a)
				end
			end
		else
			--check for full transport tasks.
			local task = LRManagerInstance:FindTransportTask(self, nil, nil, capacity, self.hub.transport_mode)
			if task then
				self:SetTransportTask(task)
				self:SetCommand("Transport")
				return
			end
		end
	end
	self:SetCommand("GoHome")
end

function CargoShuttle:GoHome()
	self:SetTransportTask(false)
	if not IsValid(self.hub) then
		Sleep(1000)
		return
	end
	
	if not self:IsValidPos() then
		DoneObject(self)
		return
	end

	self:PushDestructor(function(self)
		if IsValid(self.hub) then
			self.hub:FreeLandingSpot(self)
		end
		self:WaitingEnd()
	end)
	
	if not self.hub:ReserveLandingSpot(self) then
		--go somewhere nearby and wait for a free spot
		local my_pos = self:GetPos()
		local to_home = self.hub:GetPos() - my_pos
		local len = to_home:Len2D()
		if len > 50 * guim then
			to_home = SetLen(to_home, len - 50 * guim) + RotateRadius(AsyncRand(15 * guim), AsyncRand(360*60))
			if not self:Goto(my_pos + to_home) then
				print("shuttle cant find the way home!", my_pos, my_pos + to_home)
				self:PopAndCallDestructor()
				Sleep(1000) --if we cant find a way home and we cant find a task, and there is no sleep here the game would hang.
				return
			end
		end
		if IsValid(self.hub) and not self.hub:GetLandingSpot(self, true) then
			self:WaitingStart()
			self:PushDestructor(self.WaitingEnd)
			while IsValid(self.hub) and not self.hub:GetLandingSpot(self, true) do
				WaitWakeup(999)
			end
			self:PopAndCallDestructor()
		end
	end
	
	local slot = IsValid(self.hub) and self.hub:GetLandingSpot(self, true)
	if not slot then
		self:PopAndCallDestructor()
		Sleep(1000)
		return
	end
	local dest = slot.pos
	if not self:IsCloser2D(dest, self.max_land_dist) then
		if not self:Goto(dest) then
			print("shuttle cant find the way home!", self:GetPos(), dest)
			self:PopAndCallDestructor()
			Sleep(1000) --if we cant find a way home and we cant find a task, and there is no sleep here the game would hang.
			return
		end
	end
	self.hub:ShuttleLeadIn(self) --land or sumthing
	self:PopAndCallDestructor()
	if not IsValid(self.hub) then
		Sleep(1000)
		return
	end
	
	self.info_obj:Land(self)
end

function CargoShuttle:FlyingFace(pos, t)
	local my_pos = self:GetVisualPos()
	local ox, oy, oz = self:GetVisualAxisXYZ()
	if oz < 0 then --flying objs may have their axis flipped, correct the angle in this case
		self:InvertAxis()
	end

	local a = CalcOrientation(pos - my_pos)
	self:SetAxisAngle(axis_z, a, t)
end

--ui
function CargoShuttle:GetCarriedResourceStr()
	if self:GetStoredAmount() <= 0 then
		return T(747, "Payload<right>nothing")
	elseif self.carried_resource_type == "Colonist" then
		return T{748, "Payload<right><colonist(StoredAmount)>", self}
	else
		return T{749, "Payload<right><resource(StoredAmount,max_amount,resource)>",
			resource = Resources[self.carried_resource_type].name, self}
	end
end

function CargoShuttle:GetPinIcon()
	return self.pin_icon or PinnableObject.GetPinIcon(self)
end

function ShuttleStatusComboItems()
	return {
		{ value = "all", 	text = "All" },
		{ value = "in flight",	text = "In flight" },
		{ value = "refueling", 	text = "Refueling" },
		{ value = "idle", 	text = "Idle" },
	}
end

local shuttle_construction_time = 120000
local shuttle_construction_cost = {
	Polymers = 5000,
	Electronics = 3000,
}

DefineClass.ShuttleHub = {
	__parents = { "ElectricityConsumer", "TaskRequester", "ShuttleLanding", },
	
	properties = {
		{ template = true, category = "Consumption", name = T(750, "Water Consumption"),  id = "water_consumption",       editor = "number", default = 1000,   scale = const.ResourceScale, read_only = false, modifiable = true, min = 0, },
		{ template = true, category = "Consumption", name = T(657, "Oxygen Consumption"), id = "air_consumption",         editor = "number", default = 0,      scale = const.ResourceScale, read_only = true , modifiable = true, min = 0, },
		{ template = true, category = "Consumption", name = T(683, "Power Consumption"),  id = "electricity_consumption", editor = "number", default = 1000,   modifiable = true, min = 0, },

		{ template = true, category = "Shuttle Hub", name = T(751, "Starting Shuttles"),  id = "starting_shuttles", editor = "number", default = 3,   modifiable = true },
		{ template = true, category = "Shuttle Hub", name = T(752, "Max Shuttles"),       id = "max_shuttles", editor = "number", default = 10,       modifiable = true },
	},
	
	
	shuttle_infos = false,	
	
	building_update_time = const.HourDuration / 2,
	
	--shuttle construction
	queued_shuttles_for_construction = 0,
	shuttle_construction_time_start_ts = false,
	shuttle_construction_resource_requests = false,
	shuttle_construction_stockpiled_resources = false, --TODO: should probably return those on building demolish
	shuttle_construction_resource_requests_supply = false,
	
	landing_spot_name = "In",
	launched = false,
	shuttle_class = "CargoShuttle",
	--flight history
	people_flights = false, --entry = {ts, state, source bld, dest bld, colonist}
	cargo_flights = false, --entry = {ts, state, source bld, dest bld, resource type, amount}
	
	transport_mode = "all", --all, cargo, people
}

local all_transport_modes = {
	"all",
	"cargo",
	"people",
}

function ShuttleHub:ToggleTransportMode()
	local i = table.find(all_transport_modes, self.transport_mode)
	i = i % 3 + 1
	self.transport_mode = all_transport_modes[i]
	RebuildInfopanel(self)
end

local mode_to_img = "UI/Icons/IPButtons/shuttle_transport_%s.tga"
function ShuttleHub:ToggleTransportMode_Update(button)
	local img = string.gsub(mode_to_img, "%%s", self.transport_mode)
	if button:GetIcon() ~= img then
		button:SetIcon(img)
	end
end

function ShuttleHub:GetUITransportModeCurrentStatus()
	return self.transport_mode == "all" and T(11507, "Transport everything") or self.transport_mode == "people" and T(11508, "Transport Colonists") or T(11509, "Transport resources")
end

local skin_to_landing_info = {
	CargoShuttle = {
		ShuttleHub = {
			land_spot = "In",
			land_anim = "landing",
			take_off_spot = "Out",
			take_off_anim = "takeOff",
		},
		ShuttleHubCP3 = {
			land_spot = "In",
			land_anim = "landing2",
			take_off_spot = "Out",
			take_off_anim = "takeOff2",
		},
	},
	JumperShuttle = {
		JumperShuttleHub = {
			land_spot = "In",
			land_anim = "landing",
			take_off_spot = "Out",
			take_off_anim = "takeOff",
		},
		ShuttleHubCP3 = {
			land_spot = "In2",
			land_anim = "landing",
			take_off_spot = "Out2",
			take_off_anim = "takeOff",
		},
	},
}

function ShuttleHub:ShuttleLeadIn(shuttle)
	local data = skin_to_landing_info[self.shuttle_class][self:GetEntity()] or skin_to_landing_info.ShuttleHub
	local spot_idx = self:GetSpotBeginIndex(data.land_spot)
	local spot_pos = self:GetSpotPos(spot_idx)
	local middle_pos = (shuttle:GetVisualPos() + spot_pos) / 2
	local t = 1000
	local a, speed = shuttle:GetAccelerationAndFinalSpeed(middle_pos, 0, t)
	shuttle:OnMoveStart()
	shuttle:FlyingFace(spot_pos, t)
	shuttle:SetAcceleration(a)
	shuttle:SetPos(middle_pos, t)
	Sleep(t)
	if not IsValid(self) or not IsValid(shuttle) then return end
	local a, t = shuttle:GetAccelerationAndTime(spot_pos, 0, speed)
	shuttle:SetAcceleration(a)
	shuttle:SetPos(spot_pos, t)
	Sleep(t)
	if not IsValid(self) or not IsValid(shuttle) then return end
	shuttle:OnMoveEnd()
	self:Attach(shuttle, spot_idx)
	shuttle:PlayFX("ShuttleHubEnter", "start", self)
	shuttle:SetAnim(1, data.land_anim,  const.eDontCrossfade)
	TrackAllMoments(shuttle, "ShuttleHubEnter", shuttle, self)
	Sleep(shuttle:TimeToAnimEnd())
	shuttle:PlayFX("ShuttleHubEnter", "end", self)
end

function ShuttleHub:ShuttleLeadOut(shuttle)
	local data = skin_to_landing_info[self.shuttle_class][self:GetEntity()] or skin_to_landing_info[self.shuttle_class].ShuttleHub
	local spot_idx = self:GetSpotBeginIndex(data.take_off_spot)
	self:Attach(shuttle, spot_idx)
	shuttle:SetAnim(1, data.take_off_anim)
	shuttle:SetEnumFlags(const.efVisible)
	shuttle:PlayFX("ShuttleHubExit", "start", self)
	TrackAllMoments(shuttle, "ShuttleHubExit", shuttle, self)
	Sleep(shuttle:TimeToAnimEnd())
	shuttle:PlayFX("ShuttleHubExit", "end", self)
	shuttle:SetAnim(1, "idle")
	shuttle:Detach()
	shuttle:SetPos(self:GetSpotPos(spot_idx))
end

function ShuttleHub:CleanHistoryEntriesOlderThan(list, duration)
	if #list <= 0 then return end
	local idx = 0
	local now = GameTime()
	for i = 1, #list do
		local ts = list[i][1]
		if now - ts < duration then
			idx = i
			break
		end
	end
	
	if idx ~= 1 then
		idx = idx ~= 0 and idx - 1 or idx
		for j = idx + 1, #list do
			list[j - idx] = list[j]
			list[j] = nil
		end
	end
	
	
	return list
end

function ShuttleHub:CleanHistory()
	self:CleanHistoryEntriesOlderThan(self.people_flights, const.DayDuration)
	self:CleanHistoryEntriesOlderThan(self.cargo_flights, const.DayDuration)
end

function ShuttleHub:InitFlightHistoryTables()
	if self.people_flights then return end
	self.people_flights = {}
	self.cargo_flights = {}
end

function SavegameFixups.InitShuttleHubHistoryTables()
	MapForEach("map", "ShuttleHub", ShuttleHub.InitFlightHistoryTables)
end

function ShuttleHub:GameInit()
	self:InitFlightHistoryTables()
	self.shuttle_infos = {}
	
	assert(self.starting_shuttles <= self.max_shuttles)
	for i = 1, self.starting_shuttles do
		self:SpawnShuttle()
	end
	
	--hack, move landing pos a bit away, so that shuttles don't fly vry high when returning due to shuttle hub's imprint on the height grid
	local to_spot = self.landing_slots[1].pos - self:GetPos()
	self.landing_slots[1].pos = self.landing_slots[1].pos + to_spot
end

function ShuttleHub:SpawnShuttle()
	self.shuttle_infos[#self.shuttle_infos + 1] = ShuttleInfo:new{hub = self, shuttle_class = self.shuttle_class}
end

function ShuttleHub:Done()
	for i = 1, #self.shuttle_infos do
		DoneObject(self.shuttle_infos[i])
	end
end

function ShuttleHub:CreateResourceRequests()
	Building.CreateResourceRequests(self)
	self.shuttle_construction_resource_requests = {}
	self.shuttle_construction_resource_requests_supply = {}
	self.shuttle_construction_stockpiled_resources = {}
	for resource_name, value in pairs(shuttle_construction_cost) do
		self.shuttle_construction_resource_requests[resource_name] = self:AddDemandRequest(resource_name, 0)
		self.shuttle_construction_resource_requests_supply [resource_name] = self:AddSupplyRequest(resource_name, 0)
		self.shuttle_construction_stockpiled_resources[resource_name] = 0
	end
end

--savegamecompatibility
function ShuttleHub:CreateResourceRequestsSupply()
	if not self.shuttle_construction_resource_requests_supply then
		self:DisconnectFromCommandCenters()
		self.shuttle_construction_resource_requests_supply = {}
		for resource_name, value in pairs(shuttle_construction_cost) do
			self.shuttle_construction_resource_requests_supply [resource_name] = self:AddSupplyRequest(resource_name, 0)
		end
		self:ConnectToCommandCenters()
	end
end

function ShuttleHub:DroneUnloadResource(drone, request, resource, amount)
	Building.DroneUnloadResource(self, drone, request, resource, amount)
	if self.shuttle_construction_resource_requests[resource] == request then
		self.shuttle_construction_stockpiled_resources[resource] = self.shuttle_construction_stockpiled_resources[resource] + amount
		
		if not self.shuttle_construction_time_start_ts 
			and self.queued_shuttles_for_construction > 0
			and self:HasResourcesToStartShuttleConstruction() then
			self:StartConstructShuttle()
		end
	end
end

function ShuttleHub:DroneLoadResource(drone, request, resource, amount)
	if request and self.shuttle_construction_resource_requests_supply[resource] == request then
		self.shuttle_construction_stockpiled_resources[resource] = self.shuttle_construction_stockpiled_resources[resource] - amount
	end
	Building.DroneLoadResource(self, drone, request, resource, amount)
end

function ShuttleHub:HasResourcesToStartShuttleConstruction()
	for r_n, amount in pairs(self.shuttle_construction_stockpiled_resources) do
		if amount < shuttle_construction_cost[r_n] then
			return false
		end
	end
	
	return true
end

function ShuttleHub:TakeShuttleConstructionCost(m)
	m = m or 1
	for r_n, amount in pairs(self.shuttle_construction_stockpiled_resources) do
		local c = shuttle_construction_cost[r_n] * m
		self.shuttle_construction_stockpiled_resources[r_n] = self.shuttle_construction_stockpiled_resources[r_n] - c
		assert(self.shuttle_construction_stockpiled_resources[r_n] >= 0)
	end
end

function ShuttleHub:StartConstructShuttle()
	self:TakeShuttleConstructionCost()
	self.shuttle_construction_time_start_ts = GameTime()
end

function ShuttleHub:CanHaveMoreShuttles()
	return #self.shuttle_infos + self.queued_shuttles_for_construction < self.max_shuttles
end

function ShuttleHub:QueueConstructShuttle(amount)
	amount = Clamp(amount, 
		-self.queued_shuttles_for_construction, 
		self.max_shuttles - (#self.shuttle_infos + self.queued_shuttles_for_construction)
	)
	
	if amount == 0 then return end
	
	self.queued_shuttles_for_construction = self.queued_shuttles_for_construction + amount
	assert(self.queued_shuttles_for_construction >= 0) --queued negative shuttles
	
	
	if amount < 0 and self.queued_shuttles_for_construction == 0 and self.shuttle_construction_time_start_ts then
		--canceled a construction under way, return resources to stock
		self:TakeShuttleConstructionCost(-1)
		self.shuttle_construction_time_start_ts = false
	end
	local stockpiled = self.shuttle_construction_stockpiled_resources
	if amount > 0 and not self.shuttle_construction_time_start_ts and self:HasResourcesToStartShuttleConstruction() then
		--added constr, nothing is being built and we have resources to start building
		self:StartConstructShuttle()
	end
	for resource, cost in pairs(shuttle_construction_cost) do
		local totalcost = cost * self.queued_shuttles_for_construction 
		local has = self.shuttle_construction_stockpiled_resources[resource]
		local demand = self.shuttle_construction_resource_requests[resource]
		local supply = self.shuttle_construction_resource_requests_supply[resource]
		demand:SetAmount(Max(0, totalcost-has))
		supply:SetAmount(Max(0, has - totalcost))
	end
	RebuildInfopanel(self)
end

function ShuttleHub:OnSetWorking(working)
	ElectricityConsumer.OnSetWorking(self, working)
	
	if working then
		--reset shuttle constr. time stamp
		self.shuttle_construction_time_start_ts = self.shuttle_construction_time_start_ts and GameTime() or false
	end
end

function ShuttleHub:BuildingUpdate(dt, day, hour)
	if self.working then
		self:RefuelShuttles()
		self:BuildShuttles(dt)
		self:SendOutShuttles(dt)
	end
	self:UpdateNoFuelNotification()
	self:UpdateHeavyLoadNotification()
	self:CleanHistory()
end

function ShuttleHub:RefuelShuttle(sinfo)
	local refuel_amount = not sinfo.shuttle_obj and (sinfo.max_fuel - sinfo.current_fuel) or 0
	if refuel_amount <= 0 then
		return
	end
	local consumed_fuel = 0
	if self:DoesHaveConsumption() and self.consumption_type == g_ConsumptionType.Shuttle then
		refuel_amount, consumed_fuel = self:Consume_Production(refuel_amount, sinfo.max_fuel)
	end
	sinfo:Refuel(refuel_amount)
	--print("refuel_amount", refuel_amount, "consumed_fuel", consumed_fuel)
end

function ShuttleHub:GetRefuelingShuttles()
	local c = 0
	for _, sinfo in ipairs(self.shuttle_infos) do
		if not sinfo.shuttle_obj and sinfo.max_fuel - sinfo.current_fuel > 0 then
			c = c + 1
		end
	end
	return c
end

function ShuttleHub:GetUIRolloverText(exclude_description)
	local FlyingShuttles, RefuelingShuttles, IdleShuttles = 0, 0, 0
	for _, hub in ipairs(self.city.labels.ShuttleHub or empty_table) do
		for _, sinfo in ipairs(hub.shuttle_infos) do
			if sinfo.shuttle_obj then
				FlyingShuttles = FlyingShuttles + 1
			elseif sinfo.max_fuel - sinfo.current_fuel > 0 then
				RefuelingShuttles = RefuelingShuttles + 1
			else
				IdleShuttles = IdleShuttles + 1
			end
		end
	end
	local items = {}
	if not exclude_description then
		items[#items+1] = T(236268272624, "Shuttles facilitate long range transportation of resources between Storages and people between Domes.")
	end
	items[#items+1] = T(8699, "<newline><center><em>Global Statistics<left></em>")
	items[#items+1] = T{398, "In flight<right><FlyingShuttles>", FlyingShuttles = FlyingShuttles}
	items[#items+1] = T{8700, "Refueling<right><RefuelingShuttles>", RefuelingShuttles = RefuelingShuttles}
	items[#items+1] = T{717110331584, "Idle<right><IdleShuttles>", IdleShuttles = IdleShuttles}
	items[#items+1] = T{8701, "Global load <right><GlobalLoadText>", GlobalLoadText = self:GetGlobalLoadText()}
	return table.concat(items, Untranslated("<newline><left>"))
end

function ShuttleHub:RefuelShuttles()
	for i = 1, #self.shuttle_infos do
		self:RefuelShuttle(self.shuttle_infos[i])
	end
end

function GetMaxCargoShuttleCapacity()
	local cap = CargoShuttle.max_shared_storage
	local modifiers = UICity.label_modifiers.CargoShuttle
	local modification = { amount = 0, percent = 100 }
	if modifiers then
		for id, mod in pairs(modifiers) do
			local prop = mod.prop
			if prop == "max_shared_storage" then
				modification.amount = (modification.amount or 0) + mod.amount
				modification.percent = (modification.percent or 100) + mod.percent
			end
		end
	end
	
	return Modifiable.ModifyValue(nil, cap, "max_shared_storage", modification)
end

function ShuttleHub:SendOutShuttles()
	--check if we have available shuttles
	if not LRManagerInstance or IsValid(self.launched) then
		return
	end
	for _, s_i in pairs(self.shuttle_infos) do
		if s_i:CanLaunch() then
			local task = LRManagerInstance:FindTransportTask(self, nil, nil, GetMaxCargoShuttleCapacity(), self.transport_mode)
			if task then
				--we got shuttles and tasks!
				self.launched = s_i:CreateShuttle(task)
			end
			return
		end
	end
end

function ShuttleHub:BuildShuttles(dt)
	local time_start = self.shuttle_construction_time_start_ts
	if not time_start then
		return
	end
	--we are constructing a shuttle.
	if GameTime() - time_start < shuttle_construction_time then
		return
	end
	assert(self.queued_shuttles_for_construction > 0) --built more shuttles then there were queued.
	--construction done
	self.queued_shuttles_for_construction = Max(0, self.queued_shuttles_for_construction - 1)
	
	if self.queued_shuttles_for_construction < 0 then
		self.queued_shuttles_for_construction = 0
		return
	end
	self:SpawnShuttle()
	if self.queued_shuttles_for_construction > 0 and self:HasResourcesToStartShuttleConstruction() then
		self:StartConstructShuttle()
	else
		self.shuttle_construction_time_start_ts = false
	end
	RebuildInfopanel(self)
end

--ui
function ShuttleHub:GetShuttleConstructionProgress()
	if not self.working or not self.shuttle_construction_time_start_ts then
		return 0
	end	
	return MulDivRound((GameTime() - self.shuttle_construction_time_start_ts), 100, shuttle_construction_time)
end

local cost_t = T(754, "<left>Required <resource_display_name><right><resource(received_amount, total_amount, icon)>")
function ShuttleHub:GetShuttleConstructionCostsStr()
	local ret = {}
	
	for r_n, amount in pairs(self.shuttle_construction_stockpiled_resources) do
		ret[#ret + 1] = T{cost_t, resource_display_name = Resources[r_n].display_name,
								received_amount = amount, 
								total_amount = self.queued_shuttles_for_construction * shuttle_construction_cost[r_n],
								icon = r_n}
	end
	
	return table.concat(ret, "<newline>")
end

function ShuttleHub:GetSingleShuttleCostStr()
	local items = {}
	for res, amount in sorted_pairs(shuttle_construction_cost) do
		items[#items + 1] = T{7355, "<resource(res)><right><resource(amount, res)>", res = res, amount = amount, empty_table}
	end
	
	return table.concat(items, "<newline><left>")
end

function ShuttleHub:GetFlyingShuttles()
	local c = 0
	local infos = self.shuttle_infos
	for i = 1, #infos do
		if infos[i].shuttle_obj then
			c = c + 1
		end
	end
	return c
end

function ShuttleHub:GetIdleShuttles()
	local c = 0
	for _, sinfo in ipairs(self.shuttle_infos) do
		if not sinfo.shuttle_obj and sinfo.max_fuel == sinfo.current_fuel then
			c = c + 1
		end
	end
	return c
end

function ShuttleHub:GetDisplayName()
	return Building.GetDisplayName(self)
end

function ShuttleHub:GetGlobalLoad()
	local shuttles = 0
	local tasks = LRManagerInstance and LRManagerInstance:EstimateTaskCount()
	if tasks then
		for _, hub in ipairs(self.city.labels.ShuttleHub or empty_table) do
			if hub.working or hub.suspended then
				shuttles = shuttles + #hub.shuttle_infos
			end
		end
	end
	local shuttle_load
	if not tasks or shuttles == 0 then
		shuttle_load = 0
	elseif tasks < shuttles then -- the available tasks don't exceed the shuttle count
		shuttle_load = 1
	elseif tasks < 3 * shuttles then -- the available tasks are less than a few times the shuttles count
		shuttle_load = 2
	else
		shuttle_load = 3
	end
	return shuttle_load, tasks, shuttles
end

local ShuttleLoadTexts = {
	T(8702, "<green>Low</green>"),
	T(8703, "<yellow>Medium</yellow>"),
	T(8704, "<red>Heavy</red>"),
}

function ShuttleHub:GetGlobalLoadText()
	local shuttle_load = self:GetGlobalLoad()
	return ShuttleLoadTexts[shuttle_load] or T(130, "N/A")
end

GlobalVar("g_HeavyLoadShuttleHubs", {})
GlobalGameTimeThread("HeavyLoadShuttleHubsNotif", function()
	Sleep(100)
	if not g_Tutorial or g_Tutorial.EnableTransportProblemNotif then
		HandleNewObjsNotif(g_HeavyLoadShuttleHubs, "TransportationShuttleOverload")
	end
end)

function ShuttleHub:UpdateHeavyLoadNotification()
	local shuttle_load = self:GetGlobalLoad()
	if shuttle_load > 2 then
		table.insert_unique(g_HeavyLoadShuttleHubs, self)
	else
		table.remove_entry(g_HeavyLoadShuttleHubs, self)
	end
end

local ShowFlightsToggle = false
function ShuttleHub:CheatShowFlights()
	DbgClearVectors()
	if ShowFlightsToggle == self.handle then
		ShowFlightsToggle = false
		return
	end
	ShowFlightsToggle = self.handle
	local infos = self.shuttle_infos
	for i = 1, #infos do
		local obj = infos[i].shuttle_obj
		if obj and obj.current_path then
			Flight_DrawTraject(obj.current_path)
		end
	end
end

GlobalVar("g_NoFuelShuttleHubs", {})
GlobalGameTimeThread("NoFuelShuttleHubsNotif", function()
	Sleep(100)
	if not g_Tutorial or g_Tutorial.EnableTransportProblemNotif then
		HandleNewObjsNotif(g_NoFuelShuttleHubs, "TransportationShuttleNoFuel")
	end
end)

function ShuttleHub:UpdateNoFuelNotification()
	if self.consumption_stored_resources == 0 and self.ui_working then
		table.insert_unique(g_NoFuelShuttleHubs, self)
	else
		table.remove_entry(g_NoFuelShuttleHubs, self)
	end
end

function OnMsg.GatherFXActions(list)
	list[#list + 1] = "Dust"
	list[#list + 1] = "Land"
	list[#list + 1] = "Waiting"
	list[#list + 1] = "ShuttleHubExit"
	list[#list + 1] = "ShuttleHubEnter"
	list[#list + 1] = "ShuttleLoad"
	list[#list + 1] = "ShuttleUnload"
end

if Platform.developer then
	function DbgShowWaitingShuttles(landing_site)
		landing_site = landing_site or SelectedObj
		local pos0 = landing_site:GetVisualPos()
		local offset = point(0, 0, 3*guim)
		DbgClear()
		for i, slot in ipairs(landing_site.landing_slots or empty_table) do
			local shuttle = slot.reserved_by
			if IsValid(shuttle) and shuttle:IsValidPos() then
				local pos = slot.reserved_by:GetVisualPos()
				DbgAddVector(pos0, pos - pos0, green)
				DbgAddText(tostring(i), pos + offset, green)
			end
		end
		for i, shuttle in ipairs(landing_site.queued_shuttles or empty_table) do
			if IsValid(shuttle) and shuttle:IsValidPos() then
				local pos = shuttle:GetVisualPos()
				DbgAddVector(pos0, pos - pos0, red)
				DbgAddText(tostring(i), pos + offset, red)
			end
		end
	end
end