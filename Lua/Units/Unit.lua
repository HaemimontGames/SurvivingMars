DefineClass.Unit =
{
	__parents = { "Movable", "CommandObject", "UngridedObstacle", "DoesNotObstructConstruction", "SyncObject", "Renamable", "CameraFollowObject" },
	encyclopedia_id = false,
	flags = { cofComponentSound = true, efUnit = true, efWalkable = false, efCollision = false, efApplyToGrids = false, efSelectable = true, },
	ShadowBias = "Units",

	fx = false,
	fx_actor = false,
	fx_target = false,
	prg_class = false,
	goto_target = false,
	last_spot_tried = false,
	holder = false,
	always_renderable = false,
	entrance_type = false, -- means any
	lead_in_out = false,      -- current lead in/out object
	lead_interrupted = false, -- used to gracefully interrupt visit
	
	visit_door_opened = false,
	visit_end_time = false,
	visit_spot_end_time = false,
	visit_restart = false,
	visit_thread = false,

	direction_arrow_scale = 100,
	init_with_command = "Start",
	
	use_passages = false,
	camera_follow_disabled = false,
	selection_dir_arrow = false,
	selection_scale_uniform = 110, -- use this to control how close/far is the arrow without having to adjust all unit classes
	move_speed = false,
}

function Unit:GameInit()
	if self.init_with_command then
		if type(self.init_with_command) == "table" then
			self:SetCommand(table.unpack(self.init_with_command))
		else
			self:SetCommand(self.init_with_command)
		end
	end
	self:SetHeat(255)
	PlayFX("Spawn", "start", self)
end

function Unit:Done()
	self:StopFX()
	PlayFX("Spawn", "end", self)
	self:SetHolder(false)
end

function Unit:CanBeControlled()
	return false
end

local invalid_obj_pos = point(-1, -1)
function Unit:Gossip(gossip, ...)
	if not netAllowGossip then return end
	NetGossip(self.class, self.handle, IsValid(self) and self:GetPos() or invalid_obj_pos, gossip, GameTime(), ...)
end

function Unit:GossipName()
	return self.class
end

function Unit:Start()
	Sleep(AsyncRand(1000))
end

local Sleep = Sleep
function Unit:MoveSleep(time)
	return Sleep(time)
end

function Unit:StartFX(fx, target, actor)
	actor = actor or self
	PlayFX(fx, "start", actor, target)
	self.fx = fx
	self.fx_actor = actor
	self.fx_target = target
end

function Unit:PlayFXMoment(moment)
	if self.fx then
		PlayFX(self.fx, moment, self.fx_actor, self.fx_target)
	end
end

function Unit:StopFX()
	if self.fx then
		PlayFX(self.fx, "end", self.fx_actor, self.fx_target)
		self.fx = false
		self.fx_actor = false
		self.fx_target = false
	end
end

function Unit:OnCommandStart()
	self:StopFX()
	self.goto_target = false
	if IsValid(self) then
		self:StopMoving()
		self:ClearPath()
	end
	local door = self.visit_door_opened
	if IsValid(door) then
		door:Close()
		self.visit_door_opened = false
	end
end

function Unit:StartMoving()
end

function Unit:StopMoving()
end

Unit.Step = pf.Step

local pfFinished = const.pfFinished
local pfFailed = const.pfFailed
local pfDestLocked = const.pfDestLocked
local pfTunnel = const.pfTunnel
local pfStranded = const.pfStranded
function Unit:Goto(...)
	local pfStep = self.Step
	local status = pfStep(self, ...)
	if status < 0 and status ~= pfTunnel then
		return status == pfFinished
	end
	local start_moving
	if not self.goto_target then
		start_moving = true
		self.goto_target = ...
		self:StartMoving()
	end
	local pfSleep = self.MoveSleep
	while true do
		if status > 0 then
			pfSleep(self, status)
		elseif status == pfTunnel then
			if not self:TraverseTunnel() then
				status = pfFailed
				break
			end
		elseif status == pfStranded then
			if not self:OnStrandedFallback(...) then
				break
			end
		else
			break
		end
		status = pfStep(self, ...)
	end
	if start_moving then
		self:StopMoving()
		self.goto_target = false
		self.last_spot_tried = false
	end
	return status == pfFinished
end

local developer = Platform.developer

function Unit:OnStrandedFallback(dest, ...)
	dest = dest or self.goto_target
	dest = self:ResolveGotoDest(dest, ...)
	if not dest then
		return
	end
	self:ClearPath()
	local status = self:Step(dest, "sl")
	if status < 0 then
		return
	end
	local dome1 = developer and GetDomeAtPoint(self:GetPos())
	Sleep(status)
	local dome2 = developer and GetDomeAtPoint(self:GetPos())
	assert(dome1 == dome2 or OpenAirBuildings)
	return true
end

function Unit:ResolveGotoDest(dest, ...)
	local param = ...
	while type(dest) == "table" do
		if IsValid(dest) then
			if not param or param == "sl" or type(param) ~= "string" or not dest:HasSpot(param) then
				dest = dest:GetPos()
			else
				local idx = dest:GetNearestSpot(param, self)
				dest = dest:GetSpotPos(idx)
			end
		elseif dest[1] then
			local j = 1
			for i=2,#dest do
				if IsCloser2D(self, dest[i], dest[j]) then
					j = i
				end
			end
			dest = dest[j]
		else
			return
		end
	end
	if not IsPoint(dest) then
		return
	end
	return dest:IsValidZ() and dest:SetInvalidZ() or dest
end

function Unit:TraverseTunnel()
	local end_point = pf.GetPathPoint(self, pf.GetPathPointCount(self))
	local tunnel, param = pf.GetTunnel(self:GetPos(), end_point)
	if not tunnel then
		self:ClearPath()
	elseif not tunnel:TraverseTunnel(self, self:GetPos(), end_point, param) then
		self:ClearPath()
		return false
	end
	return true
end

function Unit:SetOutside(outside)
	self:SetOutsideVisuals(outside)
	self:SetOutsideEffects(outside)
end

function Unit:SetOutsideVisuals(outside)
end

function Unit:SetOutsideEffects(outside)
end

function Unit:OnEnterDome(dome)
	-- savegame compatibility
	self:SetOutside(false)
end

function Unit:OnExitDome(dome)
	-- savegame compatibility
	self:SetOutside(true)
end

function Unit:WaitDoorOpening(door)
	local time_to_open = door:TimeToOpen()
	if time_to_open > 0 then
		local wait_anim = self:GetWaitAnim()
		self:SetState(wait_anim >= 0 and wait_anim or "idle")
		Sleep(time_to_open)
	end
end

function Unit:KickFromBuilding(building, entrance_type)
	local target = RotateRadius(100*guim, AsyncRand(360*60), building:GetPos())
	local entrance, pos, spot_type = building:GetEntrance(target, entrance_type, nil, self)
	pos = spot_type and building:GetSpotPos(building:GetRandomSpot(spot_type)) or pos or building:GetPos()
	self:Detach()
	self:ClearPath()
	self:SetPos(pos)
	self:SetHolder(false)
	building:OnExitUnit(self)
	self:SetCommand("Idle")
end

function Unit:ShowAttachedSigns(shown)
end

function Unit:EnterBuilding(building, entrance_type, spot_name) -- works only if unit/building are both outside or inside the same dome
	if not IsValid(building) or not building:IsValidPos() then
		return false
	elseif self.holder == building then
		return true
	elseif not self:ExitHolder(building) then
		return false
	end
	if not IsValid(building) or not building:IsValidPos() then
		--retest after goto.
		return false
	elseif IsKindOf(building, "Dome") then
		if IsUnitInDome(self) == building then
			return true
		end
		local entrance_points = building:GetEntrancePoints() -- inner exit points
		local dest_pt = entrance_points or building:GetPos()
		if not self:Goto_NoDestlock(dest_pt) and IsUnitInDome(self) ~= building then
			self:OnEnterDomeFail(building)
			return false
		end
		return true
	elseif not IsKindOf(building, "WaypointsObj") then
		return false
	end
	-- approach one of the building entrances
	entrance_type = entrance_type or self.entrance_type or "entrance"
	local entrance_points = building:GetEntrancePoints(entrance_type, spot_name)
	if entrance_points then
		if self:IsValidPos() then
			self:Goto_NoDestlock(entrance_points)
			if not IsValid(building) then return false end
		else
			self:SetPos(type(entrance_points) == "table" and entrance_points[self:Random(1, #entrance_points)] or entrance_points)
		end
	end
	-- enter closest entrance
	local entrance, pos, entrance_spot = building:GetEntrance(self, entrance_type, spot_name, self)
	if entrance_spot then
		local force_place = not self:IsValidPos() or not self:Goto(building, entrance_spot)
		if not IsValid(building) then return false end
		if force_place then
			if self:IsValidPos() then
				self:SetPos(building:GetSpotPos(building:GetNearestSpot(entrance_spot, self)))
			else
				self:SetPos(building:GetSpotPos(building:GetRandomSpot(entrance_spot)))
			end
		end
		building:OnEnterUnit(self)
		return true
	end
	if pos then
		if not self:IsValidPos() or not IsCloser2D(self, pos, guim/2) and not self:Goto_NoDestlock(pos) then
			self:SetPos(pos)
		end
	end
	assert(entrance, "Building without entrance: " .. tostring(ObjectClass(building)))
	if entrance and IsValid(building) then
		building:LeadIn(self, entrance)
		return true
	end
end

function Unit:ExitBuilding(building, target, entrance_type, spot_name)
	building = building or self.holder
	if not IsValid(building) or not IsKindOf(building, "WaypointsObj") then return end
	assert(building:IsValidPos())
	if not building:IsValidPos() then
		return
	end
	entrance_type = entrance_type or self.entrance_type or "entrance"
	if not target then
		target = self:IsValidPos() and self or RotateRadius(100*guim, AsyncRand(360*60), building:GetPos())
	end
	local entrance, pos, entrance_spot = building:GetEntrance(target, entrance_type, spot_name, self)
	if entrance_spot then
		if not self:IsValidPos() then
			local spot
			if IsValid(target) and target:IsValidPos() or IsPoint(target) then
				spot = building:GetNearestSpot(entrance_spot, target)
			else
				spot = building:GetRandomSpot(entrance_spot)
			end
			self:SetPos(building:GetSpotPos(spot))
		end
		building:OnExitUnit(self)
		return true
	end
	assert(entrance, "Building without entrance: " .. tostring(ObjectClass(building)))
	if not entrance then
		return
	end
	if self:IsValidPos() and terrain.IsPassable(entrance[1], self.pfclass) then
		self:Goto_NoDestlock(entrance[1])
	end
	building:LeadOut(self, entrance)
	self:ExitImpassable(building.parent_dome)
	return true
end

function Unit:UpdateOutside()
	local is_outside = not self.holder and not IsUnitInDome(self)
	self:SetOutside(is_outside)
end

function Unit:ExitHolder(target)
	if self.holder then
		return self:ExitBuilding(self.holder, target)
	end
	return true
end

function Unit:GotoSameDomeAsObj(obj) -- savegame compatibility
	return self:ExitHolder(obj)
end

function Unit:OnEnterDomeFail(dome)
end

function Unit:GotoUnitSpot(unit, spot)
	-- pathfinding failure shields
	if IsValid(unit) and self:ExitHolder(unit) and IsValid(unit) and self:Goto(unit, spot) then 
		return true
	end
	if not IsValid(unit) then
		return false
	end
	if unit:GetDist2D(self) - unit:GetRadius() - self:GetRadius() < 5*guim then return true end
	local pt = GetPassablePointNearby(unit:GetPos(), self.pfclass)
	if self:Goto(pt) and IsValid(unit) then return true end
	Sleep(1000)
end

function Unit:GotoBuildingsSpot(buildings, spot)
	local result = self:ExitHolder(AveragePoint2D(buildings)) and self:Goto(buildings, spot)
	if result then
		local building = FindNearestObject(buildings, self)
		local idx = spot and building:GetNearestSpot("idle", spot, self)
		if idx then
			local angle = building:GetSpotRotation(idx)
			self:SetAngle(angle, 100)
		else
			self:Face(building, 100)
		end
	end
	return result
end

function Unit:GotoBuildingSpot(building, spot, force_teleport, dest_tolerance, min_z, max_z)
	if not self:ExitHolder(building) or not IsValid(building) then
		return false
	end
	
	local begin_idx = spot and building:GetSpotBeginIndex("idle", spot) or -1
	local goto_a1, goto_a2
	if building:HasMember("destroyed") and building.destroyed and building.orig_state and spot and building.orig_state[spot] then
		goto_a1 = building.orig_state[spot]
	else
		goto_a1, goto_a2 = building, spot
	end
	local result
	if goto_a2 then
		if min_z and max_z then
			result = self:Goto(goto_a1, goto_a2, min_z, max_z)
		else
			result = self:Goto(goto_a1, goto_a2)
		end
	else
		result = self:Goto(goto_a1)
	end
	if not result and IsValid(building) then
		-- if can't reach a free spot then allow colliding with other units
		if goto_a2 then
			if min_z and max_z then
				result = self:Goto_NoDestlock(goto_a1, goto_a2, min_z, max_z)
			else
				result = self:Goto_NoDestlock(goto_a1, goto_a2)
			end
		else
			result = self:Goto_NoDestlock(goto_a1)
		end
	end
	if not IsValid(building) then
		return false
	end
	local idx = spot and building:GetNearestSpot("idle", spot, self)
	if not result then
		local spot_pos = (goto_a2 or not idx) and building:GetSpotPos(idx or -1) or goto_a1[idx - begin_idx + 1]
		if self:GetDist(spot_pos) > (dest_tolerance or 2*guim) then
			return false
		end
	end
	if idx then
		local angle = building:GetSpotRotation(idx)
		self:SetAngle(angle, 100)
	else
		self:Face(building, 100)
	end
	return true
end

function Unit:GoToRandomPosInDome(dome)
	dome = dome or IsUnitInDome(self)
	assert(dome)
	if not dome then
		return
	end
	self:ExitHolder()
	local pt
	local pts = dome.walkable_points
	if #pts == 0 then
		pt = dome:PickColonistSpawnPt()
	else
		local idx = self:Random(1, #pts)
		pt = pts[idx]
	end
	if not self:IsValidPos() then
		self:SetPos(pt)
		return
	end
	return self:Goto(pt)
end

function Unit:GoToRandomPos(max_radius, min_radius, center, filter, ...)
	self:ExitHolder()
	min_radius = min_radius or 0
	if not center or not center:IsValid() then
		if self:IsValidPos() then
			center = self:GetVisualPos2D()
		else
			local mw, mh = terrain.GetMapSize()
			center = point(mw / 2, mh / 2)
		end
	end
	local pt
	if type(filter) ~= "function" then
		-- savegame compat
		pt = GetRandomPassableAround(center, max_radius, min_radius, self.city, ...)
	else
		pt = GetRandomPassableAround(center, max_radius, min_radius, self.city, filter, ...)
	end
	if pt then
		return self:Goto(pt)
	end
end

local HexGridGetObject = HexGridGetObject
local WorldToHex = WorldToHex
function FilterDontExitDome(x, y, dome)
	local q, r = WorldToHex(x, y)
	local domei = HexGridGetObject(ObjectGrid, q, r, "DomeInterior")
	return dome == (domei and domei.dome)
end
function FilterDontEnterDome(x, y)
	local q, r = WorldToHex(x, y)
	return not HexGridGetObject(ObjectGrid, q, r, "DomeInterior") and not HexGridGetObject(ObjectGrid, q, r, "Dome")
end

function Unit:ExitImpassable(dome)
	local open_domes = OpenAirBuildings
	if terrain.IsPassable(self) then
		if open_domes or dome == nil then
			return
		end
	end
	local pt
	if not open_domes then
		if dome == nil then
			dome = IsUnitInDome(self)
		end
		local filter = dome and FilterDontExitDome or FilterDontEnterDome
		pt = GetPassablePointNearby(self, -1, -1, filter, dome)
	else
		pt = GetPassablePointNearby(self)
	end
	if not pt then
		return
	end
	return self:Goto(pt, "sl")
end

--[[if config.TraceEnabled then
	function Unit:Trace(...)
		print(...)
	end
else
	function Unit:Trace(...)
	end
end]]

function Unit:IsInDome()
	return IsObjInDome(self)
end

function Unit:SetHolder(building)
	local holder = self.holder
	building = building or false
	if holder == building or building and not building:IsKindOf("Holder") then
		return
	end
	if holder then
		holder:OnExitHolder(self)
	end
	self.holder = building
	if building then
		building:OnEnterHolder(self)
	end
	assert(IsBeingDestructed(self) or self.holder or self:IsValidPos())
end

function Unit:UpdateEntity()
end

--represents the shape a unit is currently obstucting, for large units.
function Unit:GetRotatedShapePoints()
	if pathfind[self.pfclass + 1].large then
		return UngridedObstacle.GetRotatedShapePoints(self)
	end
	
	return FallbackOutline
end

function Unit:StartAlwaysRender(reason)
	if not self.always_renderable then
		if self:GetGameFlags(const.gofAlwaysRenderable) ~= 0 then
			return
		end
		self.always_renderable = {}
	end
	if next(self.always_renderable) == nil then
		self:SetGameFlags(const.gofAlwaysRenderable)
	end
	self.always_renderable[reason] = true	
end

function Unit:StopAlwaysRender(reason)
	if not self.always_renderable then
		return
	end
	self.always_renderable[reason] = nil
	if next(self.always_renderable) == nil then
		self:ClearGameFlags(const.gofAlwaysRenderable)
		self.always_renderable = nil
	end
end

function Unit:InterruptCommand()
	if self:InterruptVisit() then
		return
	end
	self:SetCommand("Idle")
end

function Unit:IsVisitingBuilding()
	if self.lead_in_out or self.visit_end_time then
		return true
	end
	return false
end

function Unit:InterruptVisit()
	if self.lead_in_out then
		self.lead_interrupted = true
		return
	elseif self.visit_end_time then
		self.visit_end_time = GameTime() -- mark the visit as finished
		Wakeup(self.visit_thread)
		return true
	end
end

function Unit:VisitTimeLeft()
	local time = 0
	if self.visit_end_time then
		time = self.visit_end_time - GameTime()
	end
	if time > 0 and self.visit_spot_end_time then
		time = Clamp(GameTime() - self.visit_spot_end_time, 0, time)
	end
	return time > 0 and time or 0
end

function Unit:WaitVisitEnd()
	repeat
		local wait = self:VisitTimeLeft()
	until self.visit_restart or wait <= 0 or not WaitWakeup(wait)
end

function Unit:PlayPrg(prg, duration, ...)
	self.visit_end_time = GameTime() + duration
	self.visit_spot_end_time = false
	self.visit_thread = CurrentThread()
	self.visit_interrupted = false
	-- execute prg in the destructor to make it uninterruptible
	self:PushDestructor(function(self)
		self.visit_end_time = false
		self.visit_spot_end_time = false
		self.visit_restart = false
		self.visit_thread = false
	end)
	if not prg then
		self:DetachFromMap()
		self:SetOutside(false)
	end
	while self:VisitTimeLeft() > 0 do
		self.visit_restart = false
		if prg then
			local prg_start_time = GameTime()
			prg(self, ...)
			if GameTime() - prg_start_time == 0 then
				WaitWakeup(Min(5000, self:VisitTimeLeft()))
			end
		else
			self:WaitVisitEnd() -- interrupted from visit_restart
		end	
	end
	self:PopAndCallDestructor()
end

function Unit:GotoFromUser(...) --goto and dome handling in one
	self:ExitHolder(...)
	self:Goto(...)
end

function Unit:IsDead()
	return not IsValid(self)
end

function Unit:ResolveObjAt(pos, interaction_mode)
end

function Unit:AddToLabels()
end

function Unit:RemoveFromLabels()
end

function SavegameFixups.DeleteStuckArrows()
	MapForEach("map", "Unit", function(unit)
		local arrows = unit:GetAttaches("Selection_Direction_Rover")
		if arrows then
			for i = 1, #arrows do
				DoneObject(arrows[i])
			end
		end
	end)
end

function OnMsg.SelectionAdded(obj)
	if IsKindOf(obj, "Unit") then
		obj:CreateSelectionArrow()
	end
end

function OnMsg.SelectionRemoved(obj)
	if IsKindOf(obj, "Unit") then
		obj:RemoveSelectionArrow()
	end
end

function Unit:RemoveSelectionArrow()
	if IsValid(self.selection_dir_arrow) then
		DoneObject(self.selection_dir_arrow)
		self.selection_dir_arrow = nil
	end
end

function Unit:UpdateSelectionArrow()
	local pt
	if IsPoint(self.goto_target) then
		pt = self.goto_target
	elseif IsValid(self.goto_target) then
		pt = self.goto_target:GetPos()
	end	
	if pt then
		self.selection_dir_arrow:SetEnumFlags(const.efVisible)
		self.selection_dir_arrow:Face(pt, 0)
	else
		self.selection_dir_arrow:ClearEnumFlags(const.efVisible)
	end
end

function Unit:CreateSelectionArrow()
	if not IsValid(self) or not IsKindOf(self, "Unit") then
		return
	end

	self.selection_dir_arrow = PlaceParticles("Selection_Direction_Rover")
	self.selection_dir_arrow:SetGameFlags(const.gofLockedOrientation)
	self:Attach(self.selection_dir_arrow)
	self.selection_dir_arrow:SetScale(MulDivRound(self.direction_arrow_scale, self.selection_scale_uniform, 100))
	
	self:UpdateSelectionArrow()
	
	CreateRealTimeThread(function(obj)
		local is_selected = SelectedObj == obj or (IsKindOf(SelectedObj, "MultiSelectionWrapper") and SelectedObj.objects_set[obj])
		while is_selected and IsValid(obj.selection_dir_arrow) do
			obj:UpdateSelectionArrow()
			Sleep(50)
		end
	end, self)
end

----- Vehicle

DefineClass.Vehicle = {
	__parents = { "Unit" },
	flags = { gofSpecialOrientMode = true },
	orient_mode = "terrain",
}

function dbg_ShowMeAllSpots(obj, ss)
	local s_idx = obj:GetSpotBeginIndex(ss)
	local e_idx = obj:GetSpotEndIndex(ss)
	
	for i = s_idx, e_idx do
		ShowMe(obj:GetSpotPos(i))
	end
end

function Vehicle:Dead()
end

function Vehicle:Destroy()
	if self.disappeared then
		self:Appear("Destroy")
	else
		self:SetCommand("Dead")
	end
end

----

AppearLocationPresets = {
	[false] = {
		text = "Same Pos",
		resolve = empty_func,
	},
	RandomPass = {
		text = "Random Passable",
		resolve = function(unit)
			local pos = GetRandomPassable()
			if pos then
				local x, y = pos:xy()
				x, y = FindDropPos(x, y, unit and unit.pfclass)
				if x then
					return point(x, y)
				end
			end
		end
	},
	MapBorder = {
		text = "Map Border",
		resolve = function(unit)
			local sectors = {}
			for x=1,10 do
				for y=1,10 do
					if x == 1 or x == 10 or y == 1 or y == 10 then
						sectors[#sectors + 1] = g_MapSectors[x][y]
					end
				end
			end
			while true do
				local sector, idx = table.rand(sectors)
				if not sector then
					assert(false, "Failed to find a passable point at the border!")
					return AppearLocationPresets.RandomPass(unit)
				end
				table.remove(sectors, idx)
				local center, radius = sector.area:GetBSphere()
				local pos = GetRandomPassableAround(center, radius)
				if pos then
					local x, y = pos:xy()
					x, y = FindDropPos(x, y, unit and unit.pfclass, radius)
					if x then
						return point(x, y)
					end
				end
			end
		end
	},
	Destroy = {
		text = "Destroy",
		resolve = function(self)
			if IsValid(self) then
				DoneObject(self)
			end
		end,
	},
}

function AppearLocationCombo()
	local items = {}
	for value, info in pairs(AppearLocationPresets) do
		items[#items + 1] = {value = value, text = info.text}
	end
	table.sort(items, function(a, b) return a.text < b.text end)
	return items
end

Unit.disappeared = false
Unit.appear_location = false

function Unit:OnDisappear()
end

function Unit:OnPreDisappear()
end

function Unit:OnAppear()
end

function Unit:ExitHolderImmediately() --unit appears directly on the exit spot
	local holder = self.holder
	if holder then
		local exit_pos
		if IsKindOf(holder, "Building") then
			local entrance, pos, spot_type = holder:GetEntrance()
			exit_pos = spot_type and holder:GetSpotPos(holder:GetRandomSpot(spot_type)) or pos
		end
		exit_pos = exit_pos or holder:GetVisualPos()
		self:ClearPath()
		self:SetPos(exit_pos)
		self:SetAngle(AsyncRand(360*60))
		self:SetHolder(false)
		holder:OnExitUnit(self)
	end
end

function Unit:Disappear(keep_in_holder)
	self:OnPreDisappear()
	SelectionRemove(self)
	local pinned
	if self:IsPinned() then
		pinned = true
		self:TogglePin()
	end
	
	local holder = self.holder
	if not keep_in_holder then
		self:ExitHolderImmediately()
	end
	
	if self == CameraFollowObj then
		UnfollowObjAndCloseModeDialog()
	end
	
	if IsKindOf(self, "Demolishable") and self:IsDemolishing() then
		self:ToggleDemolish()
	end
	
	local pos = self:GetPos()
	local dome = IsUnitInDome(self)
	self:DetachFromMap()
	self.disappeared = true
	self.appear_location = nil
	self:OnDisappear()
	self:RemoveFromLabels()
	self.city:AddToLabel("Disappeared", self)
	
	self:SetCommand("WaitToAppear", holder, pos, dome, pinned)
end

function Unit:WaitToAppear(holder, pos, dome, pinned)
	self:PushDestructor(function(self)
		if self.command and self.disappeared then
			assert(false, "Disappeared unit's command changed: " .. self.command)
		end
	end)
	self:PushDestructor(function(self)
		while self.disappeared do
			WaitWakeup()
			if not IsValid(self) or IsBeingDestructed(self) then
				return
			end
		end
		
		self.city:RemoveFromLabel("Disappeared", self)
		if self.holder then
			self:AddToLabels()
			self:OnAppear()
			self.disappeared = nil
			self.appear_location = nil
			if pinned then
				self:TogglePin()
			end
		else
			local preset = AppearLocationPresets[self.appear_location]
			local location = preset and preset.resolve(self) or holder or pos
			if not IsValid(self) or IsBeingDestructed(self) then
				return
			end
			
			self:AddToLabels()
			self:OnAppear()
			self.disappeared = nil
			self.appear_location = nil
			if pinned then
				self:TogglePin()
			end

			if IsValid(location) then
				self:SetHolder(location)
			elseif IsPoint(location) and location ~= InvalidPos() then
				self:SetPos(location)
			elseif IsValid(dome) then
				self:SetOutside(false)
				self:GoToRandomPosInDome(dome)
			else
				self:SetPos(GetRandomPassable())
			end
		end
		self:UpdateOutside()
	end)
	self:PopAndCallDestructor()
	self:PopDestructor()
end

function Unit:Appear(location)
	if not self.disappeared then
		return
	end
	self.disappeared = nil
	self.appear_location = location
	Wakeup(self.thread_running_destructors or self.command_thread)
end

function SavegameFixups.UndisappearStuckDrones()
	MapForEach("map", "Drone", function(o)
		if o:IsValidPos() and o.thread_running_destructors and o.command_thread ~= o.thread_running_destructors 
			and table.find(UICity.labels.Disappeared, o) then
			if o.disappeared then
				o:Appear()
			else
				Wakeup(o.thread_running_destructors)
			end
		end
	end)
end

Unit.FixCurrentDome = empty_func -- compatibility
Unit.UpdateCurrentDome = empty_func -- compatibility