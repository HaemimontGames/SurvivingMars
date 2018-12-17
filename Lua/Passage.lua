local TunnelMask = 32768

function HexGetPassageGridElement(q, r)
	return HexGridGetObject(ObjectGrid, q, r, "PassageGridElement")
end

function HexGetPassageRamp(q, r)
	return HexGridGetObject(ObjectGrid, q, r, "PassageRamp") or HexGridGetObject(ObjectGrid, q, r, "ConstructionSite", nil, function(o) return IsKindOf(o.building_class_proto, "PassageRamp") end)
end

local passage_entites = {
	Facet = {
		inside_dome = {
			entrance = "PassageEntranceFacet",
			straight = "PassageCoveredFacet",
			turn = "PassageCoveredTurnFacet",
		},
		
		outside_dome = {
			entrance = "PassageEntranceFacet",
			straight = "PassageTransparentFacet",
			turn = "PassageTransparentTurnFacet",
		}
	},
	
	Star = {
		dlc = "preorder",
		inside_dome = {
			entrance = "PassageEntranceStar",
			straight = "PassageCoveredStar",
			turn = "PassageCoveredTurnStar",
		},
		
		outside_dome = {
			entrance = "PassageEntranceStar",
			straight = "PassageTransparentStar",
			turn = "PassageTransparentTurnStar",
		}
	},
	
	Geoscape = {
		inside_dome = {
			entrance = "PassageEntranceGeoscape",
			straight = "PassageCoveredGeoscape",
			turn = "PassageCoveredTurnGeoscape",
		},
		
		outside_dome = {
			entrance = "PassageEntranceGeoscape",
			straight = "PassageTransparentGeoscape",
			turn = "PassageTransparentTurnGeoscape",
		}
	},
	
	GenericPassageSkinName1 = {
		inside_dome = {
			entrance = "PassageEntrancePack",
			straight = "PassageCoveredPack",
			turn = "PassageCoveredTurnPack",
		},
		
		outside_dome = {
			entrance = "PassageEntrancePack",
			straight = "PassageTransparentPack",
			turn = "PassageTransparentTurnPack",
		},
		
		palette = { "dome_base", "pipes_metal", "pipes_metal", "pipes_metal" },-- "PassagesPack",
	},
	
	Angular = {
		inside_dome = {
			entrance = "PassageEntrancePack",
			straight = "PassageCoveredPack",
			turn = "PassageCoveredTurnPack",
		},
		
		outside_dome = {
			entrance = "PassageEntrancePack",
			straight = "PassageTransparentPack",
			turn = "PassageTransparentTurnPack",
		},
		
		palette = { "dome_base", "pipes_metal", "pipes_metal", "pipes_metal" }, -- "PassagePack_01",
	},
}

local passage_skin_aliasing = {
	default = "GenericPassageSkinName1",
}

function GatherPassageTransparentEntities(classes)
	for _, skin in pairs(passage_entites) do
		classes[skin.outside_dome.straight] = true
		classes[skin.outside_dome.turn] = true
	end
end

function IsPassageElementATurn(element)
	local connections = element.connections
	if #connections >= 2 then
		local c1 = connections[1]
		local c2 = connections[2]
		local q = abs(c1.q - c2.q)
		local r = abs(c1.r - c2.r)
		return (q == 2 or q == 0) and (r == 2 or r == 0)
	end
	
	return false
end

function IsSolidPassageElement(self)
	return self.dome or self.adjacent_dome or HexGetPassageRamp(self.q, self.r)
end

function GetPassageEntityAndPalette(self, skin)
	--should be safe to call with cell data rather then obj
	skin = skin or "default"
	skin = passage_entites[skin] and skin or 
			passage_skin_aliasing[skin] and passage_entites[passage_skin_aliasing[skin]] and passage_skin_aliasing[skin] or
			"GenericPassageSkinName1"
	local k1 = IsSolidPassageElement(self) and "inside_dome" or "outside_dome"
	local k2 = "entrance"
	if #self.connections >= 2 then
		local is_str = IsPassageElementATurn(self)
		k2 = is_str and "straight" or "turn"
	end
	
	return passage_entites[skin][k1][k2], DecodePalette(passage_entites[skin].palette)
end

function GetPassageAngle(self)
	local c1 = self.connections[1]
	if not c1 then
		return 0
	end
	
	if #self.connections >= 2 then
		local c2 = self.connections[2]
		local q = abs(c1.q - c2.q)
		local r = abs(c1.r - c2.r)
		local is_str = (q == 2 or q == 0) and (r == 2 or r == 0)
		if not is_str then
			local my_pos = point(HexToWorld(self.q, self.r))
			local p1 = point(HexToWorld(c1.q, c1.r))
			local p2 = point(HexToWorld(c2.q, c2.r))
			local a1 = CalcOrientation(p1, my_pos)
			local a2 = CalcOrientation(p2, my_pos)
			
			if abs(a1 - a2) < 180 * 60 then
				return Min(a1, a2) + 180*60
			else
				return Max(a1, a2) + 180*60
			end
		end
	end
		
	local p = point(HexToWorld(c1.q, c1.r))
	return CalcOrientation(p, point(HexToWorld(self.q, self.r)))
end

function TestDomeBuildabilityForPassage(q, r, check_edge, check_road)
	--check if on the edge
	local dome = HexGridGetObject(ObjectGrid, q, r, "Dome")
	if check_edge then
		if dome then
			return false, "dome"
		end
	end
	
	if not dome then
		dome = HexGridGetObject(ObjectGrid, q, r, "DomeInterior")
		if dome then
			dome = dome.dome
			assert(dome) --dome interior with no dome.
		end
	end
	--check entrance spots and dome state
	if dome then
		if dome.destroyed then
			return false, "destroyed"
		end
		local pos = point(HexToWorld(q, r))
		local function test_dome_spot_dist(dome, pos, spot_name, dist)
			local idx = dome:GetNearestSpot("idle", spot_name, pos)
			local spot_pos = dome:GetSpotPos(idx)
			return IsCloser2D(pos, spot_pos, dist)
		end

		if test_dome_spot_dist(dome, pos, "Entrance", const.GridSpacing * 2 / 3) then
			return false, "block_entrance"
		end
		
		if test_dome_spot_dist(dome, pos, "Entrancetube", const.GridSpacing * 2 / 3) then
			return false, "block_life_support"
		end
	end
	
	--this part checks for roads
	if check_road and dome then
		local dome_shape_no_roads = GetEntityBuildShape(dome:GetEntity())
		local dq, dr = WorldToHex(dome)
		local offset = point(WorldToHex(point(HexToWorld(q, r)) - dome:GetPos()))
		local dome_rotation = HexAngleToDirection(dome:GetAngle())
		if not CheckHexSurfaces(FallbackOutline, dome_shape_no_roads, "subset", offset, 0, (dome_rotation-1)%6) then
			return false, "roads"
		end
	end
	
	return true
end

DefineClass.PassageFracture = {
	__parents = { "DomeMeteorFracture" },
	fx_actor_class = "DomeMeteorFractureSmall",
	size = 100,
	element = false,
}

DefineClass.PassageGridElement = {
	__parents = { "Building", "Shapeshifter", "AutoAttachObject", "WaypointsObj", "TaskRequester" },
	enum_flags = { efApplyToGrids = false },
	entity = "InvisibleObject",
	display_name = T(8798, "Passage piece"),
	display_name_pl = T(11676, "Passage pieces"),
	connections = false,
	is_tall = false,
	dome = false,
	adjacent_dome = false,
	q = false,
	r = false,
	
	passage_obj = false,
	use_demolished_state = false,
	on_off_button = false,
	prio_button = false,
	sign_spot = "Origin",
	
	is_construction_site = false,
	is_pf_tunnel = false,
	rename_allowed = false,
	use_shape_selection = false,
	auto_connect = false,
	fracture_work_request = false,
	fracture_demand_request = false,
	fracture_received_resources = false,
	fracture_fixing_count = 0,
	priority = 5,
	
	is_construction_complete = false,
	DisconnectPipe = __empty_function__,
	SetSuspended = __empty_function__,
	
	node_idx = false,
	count_as_building = false,
}

function PassageGridElement:CanFracture()
	return not IsSolidPassageElement(self)
end

function PassageGridElement:RequestFractureRepairResources()
	if not self.auto_connect then
		if #self.command_centers > 0 then
			self:DisconnectFromCommandCenters()
		end
		if not self.fracture_work_request then
			self.fracture_work_request = self:AddWorkRequest("repair", 0, 0, 1)
		end
		if not self.fracture_demand_request then
			self.fracture_demand_request = self:AddDemandRequest("Polymers", 0, 0)
			self.fracture_received_resources = 0
		end
	end
	
	self.fracture_demand_request:AddAmount(g_Consts.PolymersPerFracture)
	
	if not self.auto_connect then
		self.auto_connect = true
		self:ConnectToCommandCenters()
	end
end

function PassageGridElement:GetPriorityForRequest(req)
	if req == self.fracture_demand_request or req == self.fracture_work_request then
		return 3
	else
		return Clamp(TaskRequester.GetPriorityForRequest(self, req), -1, const.MaxBuildingPriority)
	end
end

function OnMsg.ConstValueChanged(prop, old_value, new_value)
	if prop == "PolymersPerFracture" then
		local delta = new_value - old_value
		MapForEach("map", "PassageGridElement", function(pge)
			if not IsKindOf(pge, "ConstructionSite") and pge.auto_connect then
				local fractures_waiting_resources = pge:CountAttaches("PassageFracture") - pge.fracture_fixing_count
				local req = pge.fracture_demand_request
				req:AddAmount(delta * fractures_waiting_resources)
				if delta < 0 then
					if req:GetTargetAmount() < 0 then
						pge:InterruptDrones(nil, function(drone)
							if drone.d_request == req then 
								return drone 
							end
						end, function(drone)
							if req:GetTargetAmount() >= 0 then
								return "break"
							end
						end)
					end
				end
				pge:OnFractureResourceReceived(nil, req, req:GetResource(), 0)
			end
			if pge.fracture_demand_request then
				assert(pge.fracture_demand_request:GetActualAmount() + pge.fracture_received_resources
					== (pge:CountAttaches("PassageFracture") - pge.fracture_fixing_count) * g_Consts.PolymersPerFracture)
			end
		end)
	end	
end

function PassageGridElement:OnFractureResourceReceived(drone, request, resource, amount)
	self.fracture_received_resources = self.fracture_received_resources + amount
		
	if self.fracture_received_resources < g_Consts.PolymersPerFracture then
		return
	end
	
	local num_to_fix = g_Consts.PolymersPerFracture <= 0 and self:CountAttaches("PassageFracture") or self.fracture_received_resources / g_Consts.PolymersPerFracture
	self.fracture_received_resources = self.fracture_received_resources - num_to_fix * g_Consts.PolymersPerFracture
	local req_repair = self.fracture_work_request
	self.fracture_fixing_count = self.fracture_fixing_count + num_to_fix
	req_repair:AddAmount(const.DroneFractionRepairTime * num_to_fix)
	if not drone or not req_repair:CanAssignUnit() then
		return
	end
	
	local repair_amount = Min(g_Consts.DroneBuildingRepairAmount, req_repair:GetActualAmount())
	drone:SetCommand("Work", req_repair, "repair", repair_amount)	
end

function PassageGridElement:DroneUnloadResource(drone, request, resource, amount)
	Building.DroneUnloadResource(self, drone, request, resource, amount)
	if request == self.fracture_demand_request then
		self:OnFractureResourceReceived(drone, request, resource, amount)
	end
end

function PassageGridElement:RepairFracture(count)
	self.fracture_fixing_count = self.fracture_fixing_count - count
	
	for i = 1, count do
		self.passage_obj:RepairFracture(self)
	end
	
	if self.fracture_fixing_count <= 0 and self.fracture_demand_request:GetActualAmount() <= 0 then
		self:DisconnectFromCommandCenters()
		self.auto_connect = false
	end
end

function PassageGridElement:DroneWork(drone, request, resource, amount)
	if request == self.fracture_work_request then
		amount = DroneResourceUnits.repair
		local function try_repair_fracture()
			local total_r_a = self.fracture_fixing_count * const.DroneFractionRepairTime
			local actual_r_a = request:GetActualAmount()
			local r_a_d = total_r_a - actual_r_a
			local num_to_fix = r_a_d / const.DroneFractionRepairTime
			if num_to_fix > 0 then
				self:RepairFracture(num_to_fix)
			end
		end
		
		drone:PushDestructor(function(drone)
			try_repair_fracture()
		end)
		
		drone:ContinuousTask(
			request, amount, g_Consts.DroneBuildingRepairBatteryUse,
			"repairBuildingStart", "repairBuildingIdle", "repairBuildingEnd", "Repair", 
			try_repair_fracture)

		drone:PopAndCallDestructor()
	else
		Building.DroneWork(self, drone, request, resource, amount)
	end
end

function PassageGridElement:GetFracturePos(ref_pos)
	local pos = self:GetPos()
	pos = pos:SetZ(pos:z() + 2*guim)
	local ref_z = Max(ref_pos:z(), pos:z())
	ref_z = self:Random(Max(self:GetHeight()*2, 0)) + ref_z
	ref_pos = ref_pos:SetZ(ref_z)
	local ret = IntersectRayWithObject(pos, ref_pos, self, EntitySurfaces.Collision)
	local norm, dir, dir2
	if ret then
		norm = ret - self:GetPos()
		local axis, angle = self:GetAxis(), self:GetAngle()
		dir = RotateAxis(norm, axis, -angle)
		dir2 = dir
		norm = SetLen(norm, 1024)
		dir = SetLen(dir, 1024)
	end
	return ret, dir, norm, dir2
end

function PassageGridElement:TestFracturePosAndAxis(rp)
	rp = rp or GetTerrainCursor()
	local p, a = self:GetFracturePos(rp)
	self:SetTransparentDecal(1, SetLen(p - self:GetPos(), 1024), 250)
	PlayFX("OxygenLeak", "start", self, nil, p, a)
end

function PassageGridElement:AddFracture(meteor_pos)
	if not self:CanFracture() then return end
	self.passage_obj:AddFracture(self, meteor_pos)
end

function PassageGridElement:Init()
	local t = self.is_construction_site and self.passage_obj.elements_under_construction or self.passage_obj.elements
	table.insert_unique(t, self)
end


function PassageGridElement:Done()
	local t = self.is_construction_site and self.passage_obj.elements_under_construction or self.passage_obj.elements
	table.remove_entry(t, self)
	if self.passage_obj:CanDelete() then
		DoneObject(self.passage_obj)
	end
	
	if not self.is_construction_site or not self.is_construction_complete then
		local ramp = HexGetPassageRamp(self.q, self.r)
		if ramp then
			ramp:ReturnResources()
			DoneObject(ramp)
		end
	end
	
	self:RemovePFTunnel()
end

function PassageGridElement:RemovePFTunnel()
	if self.is_pf_tunnel then
		pf.RemoveTunnel(self)
		--clean .passage_entrances
		local pt = self.waypoint_chains.passage_entrance[1][2]
		local t = self.dome.passage_entrances[self.is_pf_tunnel]
		table.remove_entry(t, pt)
		if #t <= 0 then self.dome.passage_entrances[self.is_pf_tunnel] = nil end
		
		pt = self.waypoint_chains.passage_entrance[2][1]
		t = self.dome.passage_exits[self.is_pf_tunnel]
		table.remove_entry(t, pt)
		if #t <= 0 then self.dome.passage_exits[self.is_pf_tunnel] = nil end
		
		self.is_pf_tunnel = nil
	end
end

function SavegameFixups.RemoveSupplyGridElementsFromPassageGridElements()
	MapForEach(true, "PassageGridElement", function(o)
					rawset(o, "electricity", nil)
					rawset(o, "water", nil)
				end)
end

function PassageGridElement:GameInit()
	self:UpdateVisuals()
	self:SetIsNightLightPossible(false, false)
	if not self.is_construction_site then
		self.passage_obj:Notify("TryConnectDomes")
	end
end

function PassageGridElement:UpdateVisuals()
	local e, cm1, cm2, cm3, cm4 = GetPassageEntityAndPalette(self, self.passage_obj.skin_id)
	if e and e ~= self:GetEntity() then
		self:DestroyAttaches()
		self:ChangeEntity(e)
		AutoAttachObjects(self)
		
		--non transparent pieces under ramps should not have curtain auto att
		if e == "PassageCovered" and HexGetPassageRamp(self.q, self.r) then
			self:DestroyAttaches("PassageCurtain")
		end
	end
	
	if p then
		SetObjectPaletteRecursive(self, cm1, cm2, cm3, cm4)
	end
	
	local a = GetPassageAngle(self)
	if a and a ~= self:GetAngle() then
		self:SetAngle(a)
	end
	
	self:BuildWaypointChains()
	
	if self:GetEnumFlags(const.efApplyToGrids) == 0 then
		QueueForEnableBlockPass(self)
	end
end

function PassageGridElement:ToggleDemolish()
	self.passage_obj:ToggleDemolish()
end

function PassageGridElement:TraverseTunnel(unit, start_point, end_point, param)
	return self.passage_obj:TraverseTunnel(unit, start_point, end_point, param, self)
end

function PassageGridElement:AreNightLightsAllowed()
	return self.passage_obj:AreNightLightsAllowed()
end

function PassageGridElement:GetWorkNotPermittedReason()
end

PassageGridElement.ConnectPipe = empty_func
PassageGridElement.OnEnterUnit = empty_func
--hacks below
local function CopyCostsFromTemplateToClassDef()
	if DataLoaded then
		--transfer template costs to class def
		local t = BuildingTemplates.Passage
		if not t then return end
		for _, resource in ipairs(ConstructionResourceList) do
			local key = "construction_cost_" .. resource
			local a = t[key] or 0
			rawset(PassageGridElement, key, a)
		end
	end
end

function PassageGridElement:OnSelected()
	SelectObj(self.passage_obj)
end

function OnMsg.ObjModified(obj)
	if IsKindOf(obj, "Passage") and #obj.elements_under_construction>0 then
		XObjUpdate(obj.elements_under_construction[1], "modified")
	end
end

OnMsg.DataLoaded = CopyCostsFromTemplateToClassDef
OnMsg.ReloadLua = CopyCostsFromTemplateToClassDef
OnMsg.ChangeMap = CopyCostsFromTemplateToClassDef

DefineClass.Passage = {
	__parents = { "Building", "ElectricityGridObject", "LifeSupportGridObject", "SkinChangeable", "PFTunnel" },
	entity = "InvisibleObject",
	display_name = T(8799, "Passage"),
	on_off_button = false,
	prio_button = false,
	elements_under_construction = false,
	elements = false,
	domes_connected = false,
	display_icon = "UI/Icons/Buildings/passage.tga",
	
	traversing_colonists = false,
	supply_tunnel_nodes = false,
	shape_points = false,
	shape_connections = false,
	is_tall = false,
	
	SupplyGridConnectElement = empty_func, --we don't want to conn on gameinit
	supply_tunnel_set = false,
	hacked_potentials = false, --data needed to restore dome hacked water potentials (should be fine even without restoring them)
	
	
	use_demolished_state = false,
	rename_allowed = false,
	
	fractures = false,
	skin_id = "default",
	ip_template = "ipPassage",
	
	pf_tunnel_thread = false,
	start_el = false,
	end_el = false,
	last_node_idx = 0,
	
	count_as_building = false,
}

function PassageGridElement:DroneApproach(drone, resource)
	return self.passage_obj:DroneApproach(drone, resource)
end

function Passage:DroneApproach(drone, resource)
	return drone:GotoBuildingsSpot(#self.elements_under_construction > 0 and self.elements_under_construction or self.elements, drone.work_spot_task)
end

function Passage:AreNightLightsAllowed()
	return self.domes_connected and (self.domes_connected[1]:HasPower() or self.domes_connected[2]:HasPower())
end

function Passage:UpdateElectricityAvailability()
	self:RefreshNightLightsState()
end

function Passage:CanWork()
	return #self.elements_under_construction <= 0
end

function Passage:RefreshNightLightsState()
	for i = 1, #self.elements do
		local e = self.elements[i]
		Building.RefreshNightLightsState(e)
	end
end

function Passage:AddFracture(element, meteor_pos)
	self.fractures = self.fractures or {}
	
	local p, dir, norm, attach_offset = element:GetFracturePos(meteor_pos)
	local f = PlaceObject("PassageFracture", {element = element, dir = dir, normal = norm}, const.cfComponentAttach)
	element:RequestFractureRepairResources()
	element:Attach(f)
	f:SetAttachOffset(attach_offset)
	table.insert(self.fractures, f)
	self.air:SetConsumption(#self.fractures * const.ResourceScale, true)
	
	if self.air.current_consumption > 0 then
		self:VisualizeOxygenLeak(true)
	end
	
	table.insert_unique(g_DomesWithFractures, self)
end

function Passage:SetSupply(resource, amount)
	if resource == "air" then
		self:VisualizeOxygenLeak(amount > 0)
	end
end

function Passage:VisualizeOxygenLeak(val)
	for i = 1, #self.fractures do
		self.fractures[i]:Visualize(val)
	end
end

function Passage:RepairFracture(element)
	local f, j
	for i = 1, #self.fractures do
		if self.fractures[i].element == element then
			f = self.fractures[i]
			j = i
			break
		end
	end
	
	assert(f and j)
	
	table.remove(self.fractures, j)
	DoneObject(f)
	local f_c = #self.fractures
	self.air:SetConsumption(f_c * const.ResourceScale, true)
	if f_c <= 0 then
		table.remove_entry(g_DomesWithFractures, self)
	end
end

function Passage:ToggleDemolish()
	if #self.elements_under_construction > 0 then
		local e = self.elements_under_construction[1]
		e:Cancel() --canceling one will cancel the others because of group
	else
		Building.ToggleDemolish(self)
	end
end

function Passage:CreateElectricityElement()
	self.electricity = SupplyGridElement:new{building = self}
end

function Passage:CreateLifeSupportElements()
	self.water = SupplyGridElement:new{building = self}
	self.air = NewSupplyGridConsumer(self, true)
end

function Passage:FindSupplyTunnelNodes()
	if self.supply_tunnel_nodes ~= false then return false end
	local find_dome_edge = function(self, is, ie, s)
		for i = is, ie, s do
			local e = self.elements[i]
			if HexGetDomeExterior(e.q, e.r) then
				return i - s
			end
		end
	end
	
	local e1, e2 = find_dome_edge(self, 1, #self.elements, 1), find_dome_edge(self, #self.elements, 1, -1)
	assert(e1, e2, e1 ~= e2)
	self.supply_tunnel_nodes = {e1, e2}
end

function Passage:GetSupplyGridConnectionShapePoints(supply_resource)
	if not self.shape_points then
		self:FindSupplyTunnelNodes()
		self:BuildShapeData()
	end
	return self.shape_points
end

function Passage:GetShapeConnections(sr)
	if not self.shape_connections then
		self:FindSupplyTunnelNodes()
		self:BuildShapeData()
	end
	return self.shape_connections
end

function Passage:BuildShapeData()
	local sp = {}
	local sc = {}
	self.shape_points = sp
	self.shape_connections = sc
	
	
	local o_q, o_r = WorldToHex(self)
	local first = true
	
	for i = 1, #self.supply_tunnel_nodes do
		local e = self.elements[self.supply_tunnel_nodes[i]]
		local q, r = e.q, e.r
		table.insert(sp, point(q - o_q, r - o_r))
		
		local other = first and self.elements[self.supply_tunnel_nodes[i]+1] or self.elements[self.supply_tunnel_nodes[i]-1] --other should be on dome edge, we want potential toward that
		first = false
		local dir = HexGetDirection(q, r, other.q, other.r)
		table.insert(sc, shift(1, dir + 8) + 128) --potential (+8), connector (+128)
		
		--hack dome tile, introduce water potential towards us
		local conn = HexGridGet(SupplyGridConnections.water, other)
		dir = HexGetDirection(other.q, other.r, q, r)
		local mask = shift(1, dir + 8)
		HexGridSet(SupplyGridConnections.water, other, bor(conn, mask))
		self.hacked_potentials = self.hacked_potentials or {}
		table.insert(self.hacked_potentials, {other.q, other.r, mask})
	end
end


local function ApplyRemoveSupppyTunnelMaskHelper(pos, op)
	local conn = HexGridGet(SupplyGridConnections.electricity, pos)
	HexGridSet(SupplyGridConnections.electricity, pos, op(conn, TunnelMask))
	conn = HexGridGet(SupplyGridConnections.water, pos)
	HexGridSet(SupplyGridConnections.water, pos, op(conn, TunnelMask))
end

function Passage:AddSupplyTunnel()
	if self.supply_tunnel_set then return end
	--mark tunnel mask, should go after connection
	--we need a tunnel because our shape is not connected, however we don't need to merge grids manually because our shape hits both grids
	local e1, e2 = self.elements[self.supply_tunnel_nodes[1]], self.elements[self.supply_tunnel_nodes[2]]
	local p1, p2 = point(e1.q, e1.r), point(e2.q, e2.r)
	
	--so supplygridconnect/disconnect can see these nodes
	rawset(e1, "electricity", self.electricity)
	rawset(e1, "water", self.water)
	rawset(e2, "electricity", self.electricity)
	rawset(e2, "water", self.water)
	
	ApplyRemoveSupppyTunnelMaskHelper(p1, bor)
	ApplyRemoveSupppyTunnelMaskHelper(p2, bor)
	
	g_TunnelsAdjacency[xxhash(p1:x(), p1:y())] = p2
	g_TunnelsAdjacency[xxhash(p2:x(), p2:y())] = p1
	
	self.supply_tunnel_set = true
end

function Passage:RemoveSupplyTunnel()
	if not self.supply_tunnel_set then return end
	--rem tunnel, should go before disconnect, safe to call multiple times
	local f = function(conn, mask) return band(conn, bnot(mask)) end
	local q, r = WorldToHex(self:GetPos())
	local p1 = point(q + self.shape_points[1]:x(), r + self.shape_points[1]:y())
	ApplyRemoveSupppyTunnelMaskHelper(p1, f)
	local p2 = point(q + self.shape_points[2]:x(), r + self.shape_points[2]:y())
	ApplyRemoveSupppyTunnelMaskHelper(p2, f)
	
	g_TunnelsAdjacency[xxhash(p1:x(), p1:y())] = nil
	g_TunnelsAdjacency[xxhash(p2:x(), p2:y())] = nil
	
	local e1, e2 = self.elements[self.supply_tunnel_nodes[1]], self.elements[self.supply_tunnel_nodes[2]]
	if e1 then
		rawset(e1, "electricity", nil)
		rawset(e1, "water", nil)
	end
	if e2 then
		rawset(e2, "electricity", nil)
		rawset(e2, "water", nil)
	end
	
	self.supply_tunnel_set = false
end

function Passage:OnSetDemolishing(val)
	if self.demolishing then
		local att_rot_thing = function(o)
			local lamp = PlaceObject("RotatyThing")
			o:Attach(lamp)
			lamp:SetAttachOffset(MulDivRound(axis_z, 10 * guim, 4096))
		end
		
		att_rot_thing(self)
		att_rot_thing(self:GetEndElement())
	else
		self:TryConnectDomes()
		self:DestroyAttaches("RotatyThing")
		self:GetEndElement():DestroyAttaches("RotatyThing")
	end
end

function Passage:WakupDemolishThread()
	Wakeup(self.demolishing_thread)
end

local function ret_false() return false end

function Passage:OnDemolish()
	self.CanDelete = ret_false --so elements don't double delete us
	assert(not self.use_demolished_state, "Not implemented")
	self.demolishing = true
	self:DisconnectDomes()
	if #self.traversing_colonists > 0 then
		WaitWakeup(9999999999)
	end
	
	SuspendPassEdits("Passage:OnDemolish")
	for i = #self.elements, 1, -1 do
		local e = self.elements[i]
		if e.construction_cost_at_completion then
			e:ReturnResources()
		end
		DoneObject(self.elements[i])
	end
	ResumePassEdits("Passage:OnDemolish")
end

function Passage:GetUIWarning()
	if (self.demolishing_countdown or 1) <= 0 then
		return NotWorkingWarning.PassageWaitingForColonistsToExit
	end
	local fractures = self.fractures and #self.fractures or 0
	if fractures > 0 then
		return T{8898, "This Passage is fractured and is losing oxygen.<newline><left>Number of fractures<right><fractures><newline><left>Cost of repairs<right><polymers(number)>", number = g_Consts.PolymersPerFracture * fractures, fractures = fractures}
	end
	return Building.GetUIWarning(self)
end

function Passage:GetWorkNotPermittedReason()
end

function Passage:TraverseTunnel(unit, start_point, end_point, param, element)
	if not IsValid(self) then
		return false
	end	
	table.insert(self.traversing_colonists, unit)
	unit:PushDestructor(function(unit)
		local element_idx = element == self.elements[1] and 1 or #self.elements
		local step = element_idx == 1 and 1 or -1
		local el
		unit:SetMoveSpeed(unit.move_speed * 2)
		unit:SetState(unit:GetMoveAnim()) --fix for colos sometimes traversing in weird anims
		while IsValid(self) and element_idx >= 1 and element_idx <= #self.elements do
			el = self.elements[element_idx]
			element_idx = element_idx + step
			local entrance = el:GetEntrance(unit, "passage_entrance")
			unit.current_dome = el.dome
			el:LeadIn(unit, entrance)
		end
		unit.holder = nil --last el would be holder, no need to exit we are already out
		unit:SetMoveSpeed(unit.move_speed)
		table.remove_entry(self.traversing_colonists, unit)
		
		if self.demolishing and #self.traversing_colonists <= 0 then
			self:WakupDemolishThread()
		end
	end)

	unit:PopAndCallDestructor()
	return true
end

function Passage:Init()
	self.elements = {}
	self.elements_under_construction = {}
	self.traversing_colonists = {}
end

function Passage:GameInit()
	self:Notify("TryConnectDomes") --insta build passage
end

function Passage:GetConstructionGroupLeader()
	if self.elements_under_construction and #self.elements_under_construction > 0 then
		return self.elements_under_construction[1].construction_group[1]
	end
	return nil
end

function SavegameFixups.ResetDomeConnectionCache()
	UICity.dome_networks = false
end

function ConnectDomesWithPassage(d1, d2)
	local t1 = d1.connected_domes
	local t2 = d2.connected_domes
	
	t1[d2] = (t1[d2] or 0) + 1
	t2[d1] = (t2[d1] or 0) + 1
	
	if t1[d2] == 1 then
		--connection created
		local networks = d2.city.dome_networks or empty_table
		local network1 = networks[d1]
		if not network1 or network1 ~= networks[d2] then
			d2.city.dome_networks = false
		end
	end
	Msg("DomesConnected", d1, d2)
end

function DisconnectDomesConnectedWithPassage(d1, d2)
	local t1 = d1.connected_domes
	local t2 = d2.connected_domes
	
	t1[d2] = (t1[d2] or 0) - 1
	t2[d1] = (t2[d1] or 0) - 1
	
	if t1[d2] <= 0 then
		--connection killed
		t1[d2] = nil
		t2[d1] = nil
		d2.city.dome_networks = false
		d1:OnDomeDisconnected(d2)
		d2:OnDomeDisconnected(d1)
	end
end

local function SetNetwork(networks, network_id, dome)
	networks[dome] = network_id
	for connected_dome in pairs(dome.connected_domes or empty_table) do
		if not networks[connected_dome] then
			SetNetwork(networks, network_id, connected_dome)
		end
	end
end

function CreateDomeNetworks(city)
	local networks = setmetatable({}, weak_keys_meta)
	local network_id = 0
	for _, dome in ipairs(city.labels.Dome or empty_table) do
		if not networks[dome] then
			network_id = network_id + 1
			SetNetwork(networks, network_id, dome)
		end
	end
	city.dome_networks = networks
	return networks
end

function AreDomesConnectedWithPassage(d1, d2)
	if not d1 or not d2 then
		return false
	elseif d1 == d2 then
		return true
	end
	local city = d1.city
	local networks = city.dome_networks or CreateDomeNetworks(city)
	local network1 = networks[d1]
	return network1 and network1 == networks[d2]
end

function Passage:Done()
	if self.domes_connected then
		DisconnectDomesConnectedWithPassage(self.domes_connected[1], self.domes_connected[2])
		self.domes_connected = false
	end
	
	self:Notify("CleanHackedPotentials") --clean after disconnect so grid doesn't cry we disconnect with no potential
end

function Passage:CleanHackedPotentials()
	for i = 1, #(self.hacked_potentials or "") do
		local t = self.hacked_potentials[i]
		local q, r, m = t[1], t[2], t[3]
		local conn = HexGridGet(SupplyGridConnections.water, q, r)
		HexGridSet(SupplyGridConnections.water, q, r, band(conn, bnot(m)))
	end
	self.hacked_potentials = false
end

function Passage:DisconnectDomes()
	if not self.domes_connected or #self.elements_under_construction > 0 then return end
	local d1 = self.domes_connected[1]
	local d2 = self.domes_connected[2]
	assert(d1 and d2)
	self.domes_connected = false
	DisconnectDomesConnectedWithPassage(d1, d2)
	self:RemovePFTunnel()
end

function Passage:SupplyGridDisconnectElement(element, ...)
	if not element.grid then return end --never got connected in the first place
	local d_c = self.parent_dome
	self.parent_dome = false --conn wise we are not in dome, so that we provoke grid traverse
	self:RemoveSupplyTunnel() --rem tunnels before provoking explode
	SupplyGridObject.SupplyGridDisconnectElement(self, element,...)
	self.parent_dome = d_c
end

function Passage:RebuildIndexes()
	local first = nil
	for i = 1, #self.elements do
		local el = self.elements[i]
		if #el.connections == 1 then
			first = el
			break
		end
	end
	
	if not first then return end
	
	local function fill_sn(self, sn, current)
		for i = 1, #sn do
			if self.elements[sn[i]] == current then
				sn[i] = current.node_idx
				return
			end
		end
	end
	
	local sn = self.supply_tunnel_nodes
	local new_elements = {first}
	local current = first
	local last = nil
	local counter = 1
	first.node_idx = counter
	fill_sn(self, sn, current)
	
	while true do
		local t = current.connections[1]
		local idx = HexGetPassageGridElement(t.q, t.r) == last and 2 or 1
		last = current
		current = current.connections[idx]
		current = HexGetPassageGridElement(current.q, current.r)
		table.insert(new_elements, current)
		counter = counter + 1
		current.node_idx = counter
		fill_sn(self, sn, current)
		if #current.connections <= 1 then
			break
		end
	end
	
	self.elements = new_elements
	return true
end

function Passage:TryConnectDomes()
	--check if passage is constructed
	if self.domes_connected or #self.elements_under_construction > 0 then return end
	if not self.shape_points then
		--first time we pass here..
		if not self.elements[1].node_idx then
			--bad state, savegame most likely
			self:RebuildIndexes()
		end
		table.sortby_field(self.elements, "node_idx")
		self:UpdateWorking()
		--supply grid conns seem to work regardless of other conns or so it seems from spec.
		--so connect on constructed, disconnect on done
		local d_c = self.parent_dome
		self.parent_dome = false --let the hacks comence
		SupplyGridObject.SupplyGridConnectElement(self, self.electricity, ElectricityGrid)
		SupplyGridObject.SupplyGridConnectElement(self, self.water, WaterGrid)
		self.parent_dome = d_c
		
		self:AddSupplyTunnel()
		if IsGameRuleActive("FreeConstruction") then
			local lead_element = self.elements[1]
			lead_element.construction_cost_at_completion = {}
			lead_element.construction_cost_at_completion["Concrete"] = #self.elements * self.city:GetConstructionCost(lead_element, "Concrete")
		end
	end	
	
	--first and last element should have the domes we need to connect
	local d1 = self.elements[1] and self.elements[1].dome
	local d2 = self.elements[#self.elements] and self.elements[#self.elements].dome
	assert(d1 and d2)
	ConnectDomesWithPassage(d1, d2)
	self.domes_connected = {d1, d2}
	self:AddPFTunnel()
	self:UpdateElectricityAvailability()
end

local function FixPt(pt)
	return not terrain.IsPassable(pt) and GetPassablePointNearby(pt) or pt
end

function Passage:AddPFTunnel()
	if not self.domes_connected then return end
	--both splines are named the same, till art changes the second one is the entrance, the first one is the exit
	local count = #self.elements
	local e1_wpc = self.elements[1].waypoint_chains.passage_entrance
	local e1_d = self.elements[1].dome
	local elast_wpc = self.elements[count].waypoint_chains.passage_entrance
	local elast_d = self.elements[count].dome
	
	local e1 = self.elements[1]
	if e1:GetEnumFlags(const.efApplyToGrids) == 0 then
		CreateRealTimeThread(function(self, e1)
			local m_timeout = 20
			local c_timeout = 0
			while c_timeout < m_timeout and e1:GetEnumFlags(const.efApplyToGrids) == 0 do
				Sleep(100)
				c_timeout = c_timeout + 1
			end
			assert(c_timeout < m_timeout)
			self:AddPFTunnel()
		end, self, e1)
		return
	end
	
	local t1_start = FixPt(e1_wpc[1][2])
	local t2_start = FixPt(elast_wpc[1][2])
	local t1_exit = FixPt(elast_wpc[2][1])
	local t2_exit = FixPt(e1_wpc[2][1])
	assert(terrain.IsPassable(t1_start)
			and terrain.IsPassable(t2_start)
			and terrain.IsPassable(t1_exit)
			and terrain.IsPassable(t2_exit))
	--register passage exits and entrances
	local pe2 = elast_d.passage_entrances[e1_d] or {}
	elast_d.passage_entrances[e1_d] = pe2
	table.insert_unique(pe2, t2_start)
	pe2 = elast_d.passage_exits[e1_d] or {}
	elast_d.passage_exits[e1_d] = pe2
	table.insert_unique(pe2, t1_exit)
	
	local pe1 = e1_d.passage_entrances[elast_d] or {}
	e1_d.passage_entrances[elast_d] = pe1
	table.insert_unique(pe1, t1_start)
	pe1 = e1_d.passage_exits[elast_d] or {}
	e1_d.passage_exits[elast_d] = pe1
	table.insert_unique(pe1, t2_exit)
	
	local distance = 1 * guim -- passages are considered very short
	local weight = distance * pathfind[1].terrain / terrain.RoadTileSize()
	
	pf.AddTunnel(self.elements[1], t1_start, t1_exit, weight, 2, 0)
	self.elements[1].is_pf_tunnel = elast_d
	pf.AddTunnel(self.elements[count], t2_start, t2_exit, weight, 2, 0)
	self.elements[count].is_pf_tunnel = e1_d
end

function Passage:RemovePFTunnel()
	if IsValidThread(self.pf_tunnel_thread) then
		DeleteThread(self.pf_tunnel_thread)
		self.pf_tunnel_thread = nil
	end
	if self.elements[1] then
		self.elements[1]:RemovePFTunnel()
		self.elements[#self.elements]:RemovePFTunnel()
	end
end

function Passage:CanDelete()
	return #self.elements <= 0 and #self.elements_under_construction <= 0
end

function Passage:GetEndElement()
	if self.end_el then
		return self.end_el
	elseif #self.elements_under_construction > 0 then
		return self.elements_under_construction[#self.elements_under_construction]
	else
		return self.elements[#self.elements]
	end
end

function Passage:GetStartElement()
	if self.start_el then
		return self.start_el
	elseif #self.elements_under_construction > 0 then
		return self.elements_under_construction[1]
	else
		return self.elements[1]
	end
end

function Passage:UpdateVisualsForAllElements()
	SuspendPassEdits("Passage:UpdateVisualsForAllElements")
	local cont = #self.elements_under_construction > 0 and self.elements_under_construction or self.elements
	for i = 1, #cont do
		local e = cont[i]
		e:UpdateVisuals()
	end
	ResumePassEdits("Passage:UpdateVisualsForAllElements")
end

local default_passage_palette = { "none", "none", "none", "none" }

function Passage:GetSkins()
	local skins, palettes = {}, {}
	
	if #self.elements_under_construction <= 0 then
		for skin, skin_data in pairs(passage_entites) do
			if IsDlcAvailable(skin_data.dlc) then
				table.insert(skins, skin)
				table.insert(palettes, skin.palette or default_passage_palette)
			end
		end
	end
	
	return skins, palettes
end

function Passage:GetNextSkinIdx(skins)
	local skin_id = passage_skin_aliasing[self.skin_id] or self.skin_id
	local skin_idx = (table.find(skins, skin_id) or 0) + 1
	if skin_idx > #skins then
		skin_idx = 1
	end
	return skin_idx
end

function Passage:ChangeSkin(skin, palette)
	self.skin_id = skin
	self:Notify("UpdateVisualsForAllElements")
end

function Passage:ApplyToGrids()
	--elements apply the shape
end

function Passage:RemoveFromGrids()
	--elements apply the shape
end

function Passage:GetIPDescription()
	if self:IsKindOf("Building") and #self.elements_under_construction>0 then
		return ConstructionSite:GetIPDescription()
	else
		return ClassTemplates.Building.Passage.description
	end	
end

--[[function Passage:CalcRefundAmount(amount)
	if IsGameRuleActive("FreeConstruction") then
		return #self.elements * self.city.GetConstructionCost("PassageGridElement", "Concrete")
	end
	return Building.CalcRefundAmount(amount)
end

function Passage:GetRefundResources()
	if IsGameRuleActive("FreeConstruction") then
		return #self.elements * self.city.GetConstructionCost("PassageGridElement", "Concrete")
	end
	return Building.GetRefundResources(amount)
end]]

Passage.Getdescription = Passage.GetIPDescription

--so selection does not assert
Passage.ShouldShowNotConnectedToPowerGridSign = ret_false
Passage.ShouldShowNotConnectedToLifeSupportGridSign = ret_false

--open/close secondary dome on sel
GlobalVar("g_SecondOpenDome", false)
function OnMsg.SelectionChange()
	if g_SecondOpenDome then
		g_SecondOpenDome:Close()
		g_SecondOpenDome = false
	end
	
	if IsKindOf(SelectedObj, "Passage") then
		--first dome will auto open, open another
		local el = SelectedObj:GetEndElement()
		g_SecondOpenDome = el.dome
		g_SecondOpenDome:Open()
	end
end
---------------------------------------------------------------------------------------------------------------------------
DefineClass.PassageRamp = {
	__parents = { "Building" },
	entity = "PassageRamp",
	is_tall = true,
	on_off_button = false,
	prio_button = false,
	use_demolished_state = false,
	SetSuspended = __empty_function__,
}

function PassageRamp:GetPassageGridElement()
	local p = HexGetPassageGridElement(WorldToHex(self))
	assert(p) --something went wrong during construction and ramp is not on top of passage
	return p
end

function PassageRamp:GameInit()
	local p = self:GetPassageGridElement()
	p:Notify("UpdateVisuals")
end

function PassageRamp:Done()
	local p = self:GetPassageGridElement()
	p:Notify("UpdateVisuals")
end

const.PassageConstructionGroupMaxSize = 20 --construction group grouping, i.e. the chunks that would be constructed together.
function PlacePassageLine(city, start_q, start_r, dir, steps, test, elements_require_construction, input_constr_grp, input_data, skin_name, entrance_hexes)
	local dq, dr = HexNeighbours[dir + 1]:xy()
	local z = const.InvalidZ
	local connect_dir = dir < 3 and dir or dir - 3
	local angle = dir * 60 * 60
	local construction_group = false
	if not test and elements_require_construction or input_constr_grp then
		if input_constr_grp then
			construction_group = input_constr_grp
		else
			construction_group = CreateConstructionGroup("PassageGridElement", point(HexToWorld(start_q, start_r)), 3, not elements_require_construction)
		end
	end
	
	local function clean_group(construction_group)
		if construction_group and construction_group[1]:CanDelete() then --it only has a leader.
			DoneObject(construction_group[1])
			construction_group = false
		end
		return construction_group
	end
	
	local last_status = false
	local last_placed_data_cell = nil
	local last_pass_idx = 0
	local total_data_count = 0
	local has_group_with_no_hub = true
	
	if input_data and (#input_data > 0 or input_data[0]) then
		last_placed_data_cell = input_data[#input_data]
		last_pass_idx = last_placed_data_cell.idx
		last_status = last_placed_data_cell.status
		
		local decrement = input_data[0] and 1 or 0
		total_data_count = #input_data + decrement
		steps = Min(const.PassageConstructionGroupMaxSize - total_data_count, steps)
		total_data_count = total_data_count - 1
		
		has_group_with_no_hub = input_data.has_group_with_no_hub
	end
	
	--preprocess
	local data = {} --step = { q, r, status }, 
	local obstructors = {}
	local all_rocks = {}
	local can_build_anything = true
	local surf_deps_filter = function(obj) return not table.find(obstructors, obj) end
	local stockpile_filter = function(obj) return obj:GetParent() == nil and IsKindOf(obj, "DoesNotObstructConstruction") and not IsKindOf(obj, "Unit") end
	
	local build_connections = function(data_idx, ret)
		ret = ret or {}
		local function build_connection(idx, ret)
			if data[idx]	then
				local cell = data[idx]
				table.insert(ret, {q = cell.q, r = cell.r})
				return true
			end
			return false
		end
		
		--prev el
		local prev_idx = data_idx - 1
		if build_connection(prev_idx, ret) then
			--update prev element connections
			build_connection(data_idx, data[prev_idx].connections)
		end
		
		return ret
	end
	for i = 0, steps do
		local q = start_q + i * dq
		local r = start_r + i * dr
		local bld = HexGetBuildingNoDome(q, r)
		local entrance = GetEntranceHex(entrance_hexes, q, r)
		local cable = HexGetCable(q, r)
		local pipe = HexGetPipe(q, r)
		local dome = GetDomeAtHex(q, r)
		local world_pos = point(HexToWorld(q, r))
		local is_buildable = IsBuildableZone(world_pos)
		local surf_deps = is_buildable and HexGetUnits(nil, nil, world_pos, 0, nil, surf_deps_filter, "SurfaceDeposit") or empty_table
		local anomalies = is_buildable and 
			HexGetUnits(nil, nil, world_pos, 0, nil, surf_deps_filter, "SubsurfaceAnomaly") or empty_table
		local rocks = is_buildable and HexGetUnits(nil, nil, world_pos, 0, false, nil, "WasteRockObstructor") or empty_table
		table.append(all_rocks, rocks)
		local stockpiles = is_buildable and HexGetUnits(nil, nil, world_pos, 0, false, stockpile_filter, "ResourceStockpileBase") or empty_table
		
		if i == 0 and last_placed_data_cell ~= nil then
			data[i] = last_placed_data_cell
			bld = data[i].bld --may have placed constr site here.
		else
			data[i] = {q = q, r = r, status = SupplyGridElementHexStatus.clear, cable = cable, rocks = rocks, stockpiles = stockpiles, pipe = pipe, idx = last_pass_idx + i, bld = bld, dome = dome}
		end
		
		if has_group_with_no_hub then
			if DoesAnyDroneControlServiceAtPoint(world_pos) then
				has_group_with_no_hub = false
			end
		end
		
		data[i].place_construction_site = elements_require_construction or #rocks > 0 or #stockpiles > 0
		data[i].connections = build_connections(i, data[i].connections)
		
		--dome adjacency
		if not dome and data[i-1] and data[i-1].dome then
			data[i].adjacent_dome = data[i-1].dome
		elseif dome and data[i-1] and not data[i-1].dome then
			data[i-1].adjacent_dome = dome
		end
		
		--special geoscape dome hack test
		if dome and IsKindOf(dome, "GeoscapeDome") then
			local pos = point(HexToWorld(q, r))
			local th = terrain.GetHeight(pos)
			local dz = dome:GetPos():z()
			if th > dz and (th - dz) >= 10 then
				data[i].status = SupplyGridElementHexStatus.blocked
				data[i].block_reason = "unbuildable"
			end
		end
		
		--test current hex
		if bld then
			table.insert(obstructors, bld)
			data[i].status = SupplyGridElementHexStatus.blocked
		end
		if entrance then
			table.insert(obstructors, entrance)
			data[i].status = SupplyGridElementHexStatus.blocked
			data[i].block_reason = "block_entrance"
		end
		if cable then
			table.insert(obstructors, cable)
			data[i].status = SupplyGridElementHexStatus.blocked
		end
		
		if pipe and pipe.pillar then
			table.insert(obstructors, pipe)
			data[i].status = SupplyGridElementHexStatus.blocked
		end
		
		if surf_deps and #surf_deps > 0 then
			table.append(obstructors, surf_deps)
			data[i].status = SupplyGridElementHexStatus.blocked
		end
		
		if anomalies and #anomalies > 0 then
			table.append(obstructors, anomalies)
			data[i].status = SupplyGridElementHexStatus.blocked
		end
		
		if not is_buildable then
			data[i].status = SupplyGridElementHexStatus.unbuildable
			data[i].block_reason = "unbuildable"
		end
		
		if not data[i].block_reason and dome then
			local result, reason = TestDomeBuildabilityForPassage(q, r)
			if not result then
				--cant build here
				data[i].status = SupplyGridElementHexStatus.blocked
				data[i].block_reason = reason
				table.insert(obstructors, dome)
			end
		end
		
		if can_build_anything and data[i].status ~= SupplyGridElementHexStatus.clear then
			can_build_anything = false
		end
		
		total_data_count = total_data_count + 1
		last_status = data[i].status
	end
	
	local total_cost = GetGridElementConstructionCost("Passage", true, total_data_count * 100)
	data.has_group_with_no_hub = has_group_with_no_hub
	
	if test or not can_build_anything then
		--ret
		construction_group = clean_group(construction_group)
		return can_build_anything, construction_group, obstructors, data, all_rocks, nil, total_cost
	end
	
	--postprocess
	local first_obj_z = input_data and input_data.first_obj_z or false
	local first_obj_dome = input_data and input_data.first_obj_dome or false
	local skin_id = nil
	if not input_data then
		skin_id = data[0].dome:GetCurrentSkinStrIdForPassage()
	end
	local passage_obj = input_data and input_data.passage_obj or PlaceObject("Passage", {skin_id = skin_id})
	
	local proc_placed_element = function(data_idx, cell_data, cg)
		local el = cell_data.element
		if el then
			--new pass may have found a dome
			if cell_data.adjacent_dome ~= el.adjacent_dome then
				el.adjacent_dome = cell_data.adjacent_dome
			end
			
			return el
		end
		return false
	end
	
	
	local place_passage_cs = function(data_idx, cg, pillar, chain)
		local params = {}
		local cell_data = data[data_idx]
		
		local p = proc_placed_element(data_idx, cell_data, cg)
		if p then return p end
		
		local q = cell_data.q
		local r = cell_data.r
		
		params.construction_group = cg
		cg[#cg + 1] = params
		
		params.q = q
		params.r = r
		params.dome = cell_data.dome
		params.adjacent_dome = cell_data.adjacent_dome
		params.connections = cell_data.connections
		params.passage_obj = passage_obj
		
		passage_obj.last_node_idx = passage_obj.last_node_idx + 1
		params.node_idx = passage_obj.last_node_idx

		local pos = point(HexToWorld(q, r))
		if not first_obj_z then
			pos = FixConstructPos(pos)
			first_obj_z = pos:z()
		else
			pos = pos:SetZ(first_obj_z)
		end
		
		local cs = PlaceConstructionSite(city, "PassageGridElement", pos, angle, params)
		cs:AppendWasteRockObstructors(cell_data.rocks)
		cs:AppendStockpilesUnderneath(cell_data.stockpiles)
		cell_data.element = cs
		return cs
	end
	
	local InvalidZ = const.InvalidZ
	local place_passage = function(data_idx)
		local cell_data = data[data_idx]
		
		local p = proc_placed_element(data_idx, cell_data)
		if p then return p end
		
		local q = cell_data.q
		local r = cell_data.r
		passage_obj.last_node_idx = passage_obj.last_node_idx + 1
		local el = PassageGridElement:new{ city = city, q = q, r = r, dome = cell_data.dome, adjacent_dome = cell_data.adjacent_dome, connections = cell_data.connections, passage_obj = passage_obj, node_idx = passage_obj.last_node_idx }
		local x, y = HexToWorld(q, r)
		local z = first_obj_z or terrain.GetHeight(x, y)
		first_obj_z = first_obj_z or z 
		el:SetPos(x, y, z)
		el:SetAngle(angle)
		el:SetGameFlags(const.gofPermanent)
		if not cell_data.dome then --don't flatten in dome.
			FlattenTerrainInBuildShape(nil, el)
		end
		cell_data.element = el
		return el
	end
	
	local i = 0
	local last_placed_obj
	
	while i <= steps do
		local cell_data = data[i]
		local q = cell_data.q
		local r = cell_data.r
		
		--place
		if data[i].status == SupplyGridElementHexStatus.clear then
			local placed = false
			if cell_data.place_construction_site then
				--make new group if needed
				if not construction_group or #construction_group > const.PassageConstructionGroupMaxSize then
					if construction_group and construction_group[1]:CanDelete() then
						DoneObject(construction_group[1])
					end
					
					construction_group = false
					
					--new group
					if elements_require_construction or #data[i].rocks > 0 or #data[i].stockpiles > 0 then
						construction_group = CreateConstructionGroup("PassageGridElement", point(HexToWorld(q, r)), 3, not elements_require_construction)
					end
				end
				
				if construction_group then
					last_placed_obj = place_passage_cs(i, construction_group)
					placed = last_placed_obj
				end
			end
			
			if not placed then
				last_placed_obj = place_passage(i)
			end
		end
		
		if last_placed_obj and (#passage_obj.elements + #passage_obj.elements_under_construction) == 1 then
			passage_obj.start_el = last_placed_obj
		end
		
		i = i + 1
	end
	
	construction_group = clean_group(construction_group)
	
	if passage_obj:CanDelete() then
		DoneObject(passage_obj)
	else
		data.passage_obj = passage_obj
		data.first_obj_z = first_obj_z
		passage_obj.end_el = last_placed_obj
		if not passage_obj:IsValidPos() then
			passage_obj:SetPos(data[0].element:GetPos()) --cannot not place element (unlike pipes and cables)
		end
		
		if construction_group then
			construction_group[1].construction_cost_multiplier = not elements_require_construction and 0 or (#construction_group - 1) * 100
		end
	end
	
	return true, construction_group, obstructors, data, last_placed_obj, nil, total_cost
end
----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------

DefineClass.PassageConstructionSite = {
	__parents = {"ConstructionSite", "PassageGridElement"},
	place_stockpile = false,
	is_construction_site = true,
	display_name = PassageGridElement.display_name,
	display_name_pl = PassageGridElement.display_name_pl,
	rename_allowed = false,
	priority = 2,
	
	temp_stock_container = false,
}

function PassageConstructionSite:GameInit()
	self:DestroyAttaches("PassageCurtain")
end

function PassageConstructionSite:DroneApproach()
	return ConstructionSite.DroneApproach(self)
end

function PassageConstructionSite:ToggleDemolish()
	ConstructionSite.ToggleDemolish(self)
end

function PassageConstructionSite:ReturnResources()
	ConstructionSite.ReturnResources(self)
end

function PassageConstructionSite:DroneUnloadResource(...)
	ConstructionSite.DroneUnloadResource(self, ...)
end

function PassageConstructionSite:DroneWork(...)
	ConstructionSite.DroneWork(self, ...)
end

function PassageConstructionSite:UpdateVisuals()
	PassageGridElement.UpdateVisuals(self)
	if self.construction_group then
		self.construction_group[1]:QueueConstructionVisualizationRecalc()
	else
		self:QueueConstructionVisualizationRecalc()
	end
end

function PassageConstructionSite:IsBlockerClearenceComplete(ignore_group)
	if ignore_group and self.temp_stock_container and #self.temp_stock_container > 0 then
		return false
	end
	
	return ConstructionSite.IsBlockerClearenceComplete(self, ignore_group)
end

function PassageConstructionSite:AppendStockpilesUnderneath(arr)
	self.temp_stock_container = table.append(self.temp_stock_container or {}, arr)
	self.temp_stock_container = #self.temp_stock_container > 0 and self.temp_stock_container or nil
	self:Notify("ProcessAppendedStocks")
end

function PassageConstructionSite:ProcessAppendedStocks()
	if self.temp_stock_container then
		ConstructionSite.AppendStockpilesUnderneath(self, self.temp_stock_container)
		self.temp_stock_container = nil
		self.construction_group[1]:TestBlockerClearenceProgress()
	end
end

function PassageConstructionSite:Cancel()
	if #self.passage_obj.elements > 0 then
		self.passage_obj:OnDemolish()
		DoneObject(self.passage_obj)
	end
	ConstructionSite.Cancel(self)
end

function PassageConstructionSite:Complete(quick_build)
	if not IsValid(self) then return end
	
	if quick_build then
		self:OnQuickBuild()
	end
	
	local po = self.passage_obj
	local bld = PassageGridElement:new{
		dome = self.dome,
		adjacent_dome = self.adjacent_dome,
		connections = self.connections,
		q = self.q,
		r = self.r,
		passage_obj = po,
		node_idx = self.node_idx,
	}
	
	bld:SetPos(self:GetPos())
	bld:SetAngle(self:GetAngle())
	local reselect = SelectedObj == po
	
	if po.end_el == self then po.end_el = bld
	elseif po.start_el == self then po.start_el = bld end
	
	self.is_construction_complete = true
	DoneObject(self)
	bld:ApplyToGrids()
	if reselect then
		CreateGameTimeThread(function()
			SelectObj(false)
			SelectObj(self.passage_obj)
		end)
	end
	
	return bld
end

function GetNumConnectedDomes(dome)
	local n = 0
	
	local queue = { dome }
	local counted = {}
	
	while #queue > 0 do
		local d = table.remove(queue)
		if not counted[d] then
			counted[d] = true
			n = n + 1
			for cd, _ in pairs(d.connected_domes) do
				queue[#queue + 1] = cd
			end
		end
	end
	
	return n
end

function GetNumDomesConnectedToDome(dome)
	local num = 0
	for v, k in pairs(dome.connected_domes) do
		num = num + 1
	end
	return num
end

----

if Platform.developer then

function DbgShowDomeNetworks(city)
	city = city or UICity
	DbgClearVectors()
	local offset = 50*guim
	local networks = city.dome_networks or CreateDomeNetworks(city)
	for _, dome in ipairs(city.labels.Dome or empty_table) do
		local pos = dome:GetVisualPos() + point(0, 0, offset + dome:GetRadius())
		local color = RandColor(100, networks[dome])
		for domei in pairs(dome.connected_domes or empty_table) do
			local posi = domei:GetVisualPos() + point(0, 0, offset + domei:GetRadius())
			if dome.handle < domei.handle then
				DbgAddVector(pos, posi - pos, color)
			end
		end
	end
end

end