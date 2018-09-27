DefineClass.Unit =
{
	__parents = { "Movable", "CommandObject", "UngridedObstacle", "DoesNotObstructConstruction", "SyncObject", "Renamable", "CameraFollowObject" },
	encyclopedia_id = false,
	enum_flags = { efUnit = true, efWalkable = false, efCollision = false, efApplyToGrids = false, efSelectable = true, },
	class_flags = { cfComponentSound = true },
	ShadowBias = "Units",

	fx = false,
	fx_actor = false,
	fx_target = false,
	goto_target = false,
	last_spot_tried = false,
	holder = false,
	always_renderable = false,
	current_dome = false, -- the dome the unit is physically inside, not "home dome"
	dome_version = 0,
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
end

function Unit:OnCommandDestructors()
	self:StopFX()
	if IsValid(self) then
		self:StopMoving()
		self.goto_target = false
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
	self.goto_target = ...
	self:StartMoving()
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
	self:StopMoving()
	self.goto_target = false
	self.last_spot_tried = false
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
	self:MoveSleep(status)
	local dome2 = developer and GetDomeAtPoint(self:GetPos())
	assert(dome1 == dome2)
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
	assert(not self.current_dome or self.current_dome == dome)
	self.current_dome = dome
	self:SetOutside(false)
end

function Unit:OnExitDome(dome)
	assert(not self.current_dome or self.current_dome == dome)
	self.current_dome = false
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
	local entrance, pos, spot_type = building:GetEntrance(nil, entrance_type)
	pos = spot_type and building:GetSpotPos(building:GetRandomSpot(spot_type)) or pos or building:GetPos()
	self:Detach()
	self:SetPos(pos)
	self:SetHolder(false)
	building:OnExitUnit(self)
	self:SetCommand("Idle")
end

function Unit:ShowAttachedSigns(shown)
end

function Unit:FixCurrentDome(dome)
	if self.current_dome == dome then return end
	if self.current_dome then
		self:OnExitDome(self.current_dome)
	end
	if dome then
		self:OnEnterDome(dome)
	end
end

function Unit:EnterBuilding(building, entrance_type, spot_name) -- works only if unit/building are both outside or inside the same dome
	if not IsValid(building) or not building:IsValidPos() then
		return false
	elseif self.holder == building then
		return true
	elseif not self:ExitHolder(building) then
		return false
	elseif not IsValid(building) or not building:IsValidPos() then
		--retest after goto.
		return false
	elseif IsKindOf(building, "Dome") then
		if self.current_dome == building then
			assert(GetDomeAtPoint(self:GetPos()) == self.current_dome)
			return true
		end
		local entrance_points = building:GetEntrancePoints() -- inner exit points
		self:Goto_NoDestlock(entrance_points or building:GetPos())
		if self.current_dome ~= building then
			self:OnEnterDomeFail(building)
			return false
		end
		return true
	elseif not IsKindOf(building, "WaypointsObj") then
		return false
	end
	-- approach one of the building entrances
	local entrance_points = building:GetEntrancePoints(entrance_type or self.entrance_type, spot_name)
	if entrance_points then
		if self:IsValidPos() then
			self:Goto_NoDestlock(entrance_points)
			if not IsValid(building) then return false end
		else
			self:FixCurrentDome(building.parent_dome)
			self:SetPos(type(entrance_points) == "table" and entrance_points[self:Random(1, #entrance_points)] or entrance_points)
		end
	end
	-- enter closest entrance
	local entrance, pos, entrance_spot = building:GetEntrance(self, entrance_type or self.entrance_type, spot_name)
	if entrance_spot then
		local force_place = not self:IsValidPos() or not self:Goto(building, entrance_spot)
		if not IsValid(building) then return false end
		if force_place then
			self:FixCurrentDome(building.parent_dome)
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
			self:FixCurrentDome(building.parent_dome)
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
	local entrance, pos, entrance_spot = building:GetEntrance(target or self, entrance_type or self.entrance_type, spot_name)
	if entrance_spot then
		if not self:IsValidPos() then
			if IsValid(target) then
				self:SetPos(building:GetSpotPos(building:GetNearestSpot(entrance_spot, target)))
			else
				self:SetPos(building:GetSpotPos(building:GetRandomSpot(entrance_spot)))
			end
		end
		building:OnExitUnit(self)
		return true
	end
	assert(entrance, "Building without entrance: " .. tostring(ObjectClass(building)))
	if not entrance then
		return
	end
	building:LeadOut(self, entrance)
	return true
end

-- recalc current dome when exit from outside buildings. We need to recalc current dome when the building's exit is too close to any dome.
function Unit:ValidateCurrentDomeOnExit(building)
	if not IsObjInDome(building) then
		self.dome_version = 0
	end
end

function Unit:UpdateCurrentDome()
	if self.dome_version == g_DomeVersion then
		return self.current_dome
	end
	self.dome_version = g_DomeVersion
	local dome, pos
	if self.holder then
		dome = IsObjInDome(self.holder)
	elseif self:IsValidPos() then
		pos = GetPassablePointNearby(GetTopmostParent(self):GetPos(), self.pfclass)
	end
	dome = dome or pos and GetDomeAtPoint(pos) or false
	if self.current_dome ~= dome then
		if self.current_dome then
			self:OnExitDome(self.current_dome)
		end
		if dome then
			self:OnEnterDome(dome)
		end
	end
	return dome
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
	local result = self:Goto(buildings, spot)
	if result then
		local building = FindNearestObject(buildings, self:GetPos())
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

function Unit:GotoBuildingSpot(building, spot, force_teleport, dest_tolerance)
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
	
	local result = goto_a2 and self:Goto(goto_a1, goto_a2) or not goto_a2 and self:Goto(goto_a1)
	
	if not result and IsValid(building) then
		-- if can't reach a free spot then allow colliding with other units
		result = goto_a2 and self:Goto_NoDestlock(goto_a1, goto_a2) or not goto_a2 and self:Goto_NoDestlock(goto_a1)
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
	assert(dome)
	if not dome then
		return
	end
	self:ExitHolder()
	local pts = dome.walkable_points
	local idx = self:Random(1, #pts)
	if not self:IsValidPos() then
		self:SetPos(pts[idx])
		return
	end
	self:Goto(pts[idx])
end

function Unit:GoToRandomPos(max_radius, min_radius, center, filter, ...)
	self:ExitHolder()
	center = center or self:GetVisualPos()
	min_radius = min_radius or 0
	local mw, mh = terrain.GetMapSize()
	if center == InvalidPos() then
		center = point(mw / 2, mh / 2)
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

function Unit:ExitImpassable()
	local pt = GetPassablePointNearby(self:GetVisualPos(), self.pfclass)
	self:Goto(pt)
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

function OnMsg.SelectedObjChange(obj, prev)
	if obj and obj:IsKindOf("Unit") then
		obj:CreateSelectionArrow()
	end
	if prev and prev:IsKindOf("Unit") then
		prev:RemoveSelectionArrow()
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
	
	CreateRealTimeThread(function(obj, arrow)
		while SelectedObj == self and IsValid(self.selection_dir_arrow) do
			self:UpdateSelectionArrow()
			Sleep(50)
		end
	end, self)
end

----- Vehicle

DefineClass.Vehicle = {
	__parents = { "Unit" },
	game_flags = { gofSpecialOrientMode = true },
	orient_mode = "terrain",
}

function dbg_ShowMeAllSpots(obj, ss)
	local s_idx = obj:GetSpotBeginIndex(ss)
	local e_idx = obj:GetSpotEndIndex(ss)
	
	for i = s_idx, e_idx do
		ShowMe(obj:GetSpotPos(i))
	end
end
