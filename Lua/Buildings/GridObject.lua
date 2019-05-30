---------------------------------------------------------------------------------------------------
--[[
ObjectGrid methods

Adds obj's handle in each node defined by (obj.pos -> to hex -> to storage) + shape offset. 
If handle is present a new GridObjectList obj is created or the existing one whos handle it is is used,
and each handle is put in it's integer arr part. Duplicates are ignored.
Grid -> HSL::Grid compliant grid, should have enough bits to store handles.
obj -> obj with handle
shape -> array of offset points in hex axial coords

	void HexGridShapeAddObject(grid, obj, shape)

Opposite op of the one above, removed from GridObjectList's array, array is reordered to maintain integrity, 
if 1 element remains the GridObjectList obj is destroyed and that element's handle is placed in the grid instead.
If the element who's handle it is is not a GridObjectList then the grid is cleared (to 0)
Grid -> HSL::Grid compliant grid, should have enough bits to store handles.
obj -> obj with handle
shape -> array of offset points in hex axial coords

	void HexGridShapeRemoveObject(grid, obj, shape)

Provided a grid kept consistent with the methods above, the following methods will return a lua array with all objects 
in the shape or node that match the criteria of class and ignore class (optional).
Grid -> HSL::Grid compliant grid, should have enough bits to store handles.
obj -> obj with handle
shape -> array of offset points in hex axial coords
pos/q,r -> hex axial coords of a grid node
class -> only objects of this class or a class who has __ancestors of this class will be returned
ignore-class -> only objects who are not of this class and do not have __ancestors of this class will be returned
filter -> f(obj) return true/false/"break" end

	lua_array   HexGridShapeGetObjectList(ObjectGrid, obj, shape[, class, ignore-class, filter])
	lua_array   HexGridGetObjects(ObjectGrid, pos[, class, ignore-class, filter])
	lua_array   HexGridGetObjects(ObjectGrid, q, r[, class, ignore-class, filter])
	lua_obj/nil HexGridGetObject(ObjectGrid, q, r[, class, ignore-class, filter])
]]
---------------------------------------------------------------------------------------------------
GlobalVar("HexMapWidth", function()
	local sizex, sizey = terrain.GetMapSize()
	return ((sizex or 0) + const.GridSpacing - 1) / const.GridSpacing
end)

GlobalVar("HexMapHeight", function()
	local sizex, sizey = terrain.GetMapSize()
	return ((sizey or 0)+ const.GridVerticalSpacing - 1) / const.GridVerticalSpacing
end)

GlobalVar("ObjectGrid", function()
	if HexMapWidth == 0 or HexMapHeight == 0 then return false end
	return NewHierarchicalGrid(HexMapWidth, HexMapHeight, 16, 32)
end)

DefineClass.GridObjectList = {
	__parents = { "Object" },
	flags = { efVisible = false, efCollision = false, efApplyToGrids = false, efWalkable = false, efBakedTerrainDecal = false },
}

GlobalVar("SupplyGridConnections", function()
	if HexMapWidth == 0 or HexMapHeight == 0 then return false end
	return {
		electricity = NewHierarchicalGrid(HexMapWidth, HexMapHeight, 16, 32),
		water = NewHierarchicalGrid(HexMapWidth, HexMapHeight, 16, 32),
	}
end)

GlobalVar("OverlaySupplyGrid", function()
	if HexMapWidth == 0 or HexMapHeight == 0 then return false end
	return NewGrid(HexMapWidth, HexMapHeight, 8, 0)
end)

--[[@@@
@class GridObject
class overview...
--]]
DefineClass.GridObject = {
	__parents = { "SyncObject" },
	shape = 0,
	is_tall = false,
	snap_to_grid = false,
}

function GridObject:GameInit()
	assert(#self:GetShapePoints() > 0, "GridObject with no hex shape!")
	self:ApplyToGrids()
end

function GridObject:Done()
	self:RemoveFromGrids()
end

function GridObject:ApplyToGrids()
	if self.snap_to_grid then
		self:SetPos(point(HexToWorld(WorldToHex(self))))
	end
	--apply
	local shape = self:GetShapePoints() or empty_table
	HexGridShapeAddObject(ObjectGrid, self, shape)
	if not self.is_tall and not IsKindOfClasses(self, "ElectricityGridElement", "GridSwitchConstructionSite") then -- we are a not tall bld, if there is a pipe above, demote its connection
		HexGridShapeGetObjectList(ObjectGrid, self, shape, "LifeSupportGridElement", nil, 
			LifeSupportGridElement.DemoteConnectionMask) --pipe no longer marks potential in directions that require it to become pillar.
	end
end

function GridObject:RemoveFromGrids()
	HexGridShapeRemoveObject(ObjectGrid, self, self:GetShapePoints() or empty_table)
	if not self.is_tall and not IsKindOf(self, "ElectricityGridElement") then
		HexGridShapeGetObjectList(ObjectGrid, self, self:GetShapePoints() or empty_table, "LifeSupportGridElement", nil,
			LifeSupportGridElement.PromoteConnectionMask)
	end
end

-- returns an array of hex-grid offsets that define the building shape, not rotated
-- can be called without having an instance
function GridObject:GetShapePoints()
	return GetEntityOutlineShape(self:GetEntity())
end

--the part of the shape connectable to the supply grid.
function GridObject:GetSupplyGridConnectionShapePoints(supply_resource) 
	return self:GetShapePoints()
end

function GridObject:GetShapeOffsetedAndRotatedGridPos(supply_resource)
	local my_shape = self:GetSupplyGridConnectionShapePoints(supply_resource)
	local q, r = WorldToHex(self)
	local r_q, r_r = HexRotate(my_shape[1]:x(), my_shape[1]:y(), HexAngleToDirection(self))
	return q + r_q, r + r_r
end

--func containter
DefineClass.UngridedObstacle = {
	__parents = { "CObject" },
}

function UngridedObstacle:GetModifiedBSphereRadius(r)
	return r
end

HexSurroundingsCheckShapeMedium = {	point(0, 0),
											point(0, -1), point(1, -1), point(-1, 0), point(1, 0), point(-1, 1), point(0, 1),
											point(0, -2), point(1, -2), point(2, -2), point(2, -1), point(2, 0), point(1, 1), point(0, 2), 
											point(-1, 2), point(-2, 2), point(-2, 1), point(-2, 0), point(-1, -1),}
HexSurroundingsCheckShapeLarge = {	point(0, 0),
											point(0, -1), point(1, -1), point(-1, 0), point(1, 0), point(-1, 1), point(0, 1),
											point(0, -2), point(1, -2), point(2, -2), point(2, -1), point(2, 0), point(1, 1), point(0, 2), 
											point(-1, 2), point(-2, 2), point(-2, 1), point(-2, 0), point(-1, -1), 
											point(0, 3), point(1, -3), point(2, -3), point(3, -3), point(3, -2), point(3, -1), point(3, 0),
											point(2, 1), point(1, 2), point(0, -3), point(-1, 3), point(-2, 3), point(-3, 3), point(-3, 2),
											point(-3, 1), point(-3, 0), point(-2, -1), point(-1, -2)}
--brute force test where we obstruct according to our bb sphere, up to 1 tile away
function UngridedObstacle:GetRotatedShapePoints()
	local ret
	local x0, y0, z0, rad = self:GetBSphere("idle", true) --fix for giant radii of move anims.
	local q0, r0 = WorldToHex(self)

	--extend or reduce to make constr obstruction more/less picky.
	rad = self:GetModifiedBSphereRadius(rad) + const.GridSpacing / 2
	local hex_rad = rad / const.GridSpacing
	local shape = FallbackOutline
	if hex_rad > 2 then
		shape = HexSurroundingsCheckShapeLarge
	elseif hex_rad > 1 then
		shape = HexSurroundingsCheckShapeMedium
	elseif hex_rad > 0 then
		shape = HexSurroundingsCheckShape
	end
	for i, p in ipairs(shape) do
		local q, r = p:xy()
		local x, y = HexToWorld(q + q0, r + r0)
		local z = terrain.GetHeight(x, y)
		if IsCloser(x, y, z, x0, y0, z0, rad + 1) then
			ret = ret or {}
			ret[#ret + 1] = p
		end
	end
	return ret or FallbackOutline
end

CableConnectionsCache = {}
PipeShapeConnectionsCache = {}

HexNeighbours = {
	point(1, 0),
	point(0, 1),
	point(-1, 1),
	point(-1, 0),
	point(0, -1),
	point(1, -1),
}

function SavegameFixups.ElectricityGridObjectsAsConnectors()
	CableConnectionsCache = {}
end

function GridObject:GetShapeConnections(supply_resource)
	local cache = supply_resource == "electricity" and CableConnectionsCache or PipeShapeConnectionsCache
	local connections = cache[self.template_name]
	if not connections then
		connections = self:GenerateShapeConnections(supply_resource)
		cache[self.template_name] = connections
	end
	
	return connections
end

-- returns an array with connection masks (not rotated):
-- 	each entry is a mask corresponding to the point with the same index in the building shape array
-- 	a mask has 6 bits and defines a relation with the 6 neghbouring hex cells
-- 	lower 8 bits of an entry are a mask that define which of the surrounding cells are also part of the building (connections)
-- 	higher 8 bits of an entry are a mask that define which of the surrounding cells can be connected for the specified resource
-- can be called without having an instance
local connector_flag = 128
function GridObject:GenerateShapeConnections(supply_resource)
	local additional_flags = 0
	if IsKindOf(self, "ElectricityGridObject") then
		additional_flags = bor(additional_flags, connector_flag)
	end
	local connections = {}
	local shape = self:GetSupplyGridConnectionShapePoints(supply_resource)
	local find = table.find
	if supply_resource == "electricity" then
		local first, last = GetSpotRange(self.entity, EntityStates["idle"], "Electricitygrid")
		local spots
		if first >= 0 then
			spots = {}
			for i = first, last do
				local pt = GetEntitySpotPos(self.entity, i)
				spots[#spots + 1] = point(WorldToHex(pt))
			end
		end
		for i, hex in ipairs(shape) do
			local v = 0
			for dir, neighbour in ipairs(HexNeighbours) do
				neighbour = hex + neighbour
				if find(shape, neighbour) then -- internal connection
					v = bor(v, shift(1, dir - 1))
				elseif not spots or find(spots, neighbour) then -- potential connection
					v = bor(v, shift(1, dir + 8 - 1))
				end
			end
			connections[i] = bor(v, additional_flags)
		end
	else
		local pipes_list = self:GetPipeConnections()
		for i, hex in ipairs(shape) do
			local v = 0
			for dir, neighbour in ipairs(HexNeighbours) do
				neighbour = hex + neighbour
				if find(shape, neighbour) then -- internal connection
					v = bor(v, shift(1, dir - 1))
				end
			end
			for _, conn in ipairs(pipes_list) do
				if conn[1] == hex then -- potential connection from this point
					assert(band(v, shift(1, conn[2])) == 0)
					if band(v, shift(1, conn[2])) == 0 then -- a mistaken pipe might point towards the building
						v = bor(v, shift(1, conn[2] + 8))
					end
				end
			end
			connections[i] = v
		end
	end
	return connections
end

function GetEntityNearestSpotIdx(entity, spot_id, pt, state) --pt should be relative to entity center
	state = state or "idle"
	
	if HasSpot(entity, state, spot_id) then
		local first, last = GetSpotRange(entity, state, spot_id)
		local idx, dist
		for i = first, last do
			local p = GetEntitySpotPos(entity, i)
			local dist_temp = pt:Dist2D2(p)
			if not idx or dist_temp < dist then
				dist = dist_temp
				idx = i
			end
		end
		
		return idx
	end
	
	return -1
end

PipeConnectionsCache = {}
local spots = {"Tube", "Tubeleft", "Tuberight", "Tubestraight", }
local spot_attach = {"Tube", "TubeLeft", "TubeRight", "TubeStraight" }
local decor_spot = "Tubedecor"

TubeSkinsBuildingConnections = {
	Default = {
		default_tube = "TubeBuildingConnection",
		decor_entity = "TubeBuildingConnectionDecor",
	},
	
	Chrome = {
		default_tube = "TubeChromeBuildingConnection",
		decor_entity = "TubeChromeBuildingConnectionDecor",
	},
}

function SavegameFixups.SkinnedPipesFallbackToDefault()
	PipeConnectionsCache = {}
end

function SavegameFixups.SkinnedPipesCacheKeyChanged()
	PipeConnectionsCache = {}
end

function SavegameFixups.SkinnedPipesCacheKeyChangedAgain()
	PipeConnectionsCache = {}
end
-- returns a list of items { hex_point, direction (0..5), spot-index, entity-to-attach, decor_table or nil }
-- decor table = { entity name,
--						{spot, e},
--						{spot, e} or nil }, where if el3 is present, then decor is attached to an attach, if no el3 attach directly.
--figure out if there is a "decor" spot.
function GridObject:GetEntityNameForPipeConnections(grid_skin_name)
	return self.entity
end

function GridObject:GetGridSkinName()
	return "Default"
end

function GridObject:GetPipeConnections(force)
	if not IsKindOf(self, "LifeSupportGridObject") then
		return
	end
	
	local gsn = force or self:GetGridSkinName()
	local entity = self.entity
	local grid_skin_entity = self:GetEntityNameForPipeConnections(gsn)
	local cache_key = xxhash64(entity, grid_skin_entity)
	local list = PipeConnectionsCache[cache_key]
	if not list then
		local skin = TubeSkinsBuildingConnections[gsn]
		
		list = {}
		PipeConnectionsCache[cache_key] = list
		
		--figure out if there is a "decor" spot.
		local decor_spot_info_t = HasSpot(entity, "idle", decor_spot) and {entity, false} or false		
		if not decor_spot_info_t and self.configurable_attaches then
			for i = #self.configurable_attaches, 1, -1 do
				local attach = self.configurable_attaches[i]
				local attach_entity, attach_spot = _G[attach[1]]:GetEntity(), attach[2]
				if HasSpot(attach_entity, "idle", decor_spot) then
					decor_spot_info_t = {attach_entity, attach_spot}
					break
				end
			end
		end
		
		for s, spot in ipairs(spots) do
			local first, last = GetSpotRange(entity, "idle", spot)
			local pipe_entity, pt_end, angle_end
			for i = first, last do
				self:ProcessPipeSpot(list, entity, i, spot_attach[s], skin, grid_skin_entity, decor_spot_info_t)
			end
		end
		
		if gsn ~= "Default" then
			local default_list = self:GetPipeConnections("Default")
			local consistent = #list == #default_list
			if consistent then
				for i = 1, #list do
					local pos1, dir1 = list[i][1], list[i][2]
					local pos2, dir2 = default_list[i][1], default_list[i][2]
					if pos1 ~= pos2 or dir1 ~= dir2 then
						consistent = false
						break
					end
				end
			end
			if not consistent then
				printf("Inconsistent pipe skin %s for entity %s, using defaults!", gsn, entity)
				list = default_list
				PipeConnectionsCache[cache_key] = list
			end
		end
	end
	
	return list
end

function GridObject:ProcessPipeSpot(result, entity, spot_idx, spot_name, skin, grid_skin_entity, decor_spot_info_t)
	local pipe_entity = grid_skin_entity .. spot_name
	if not IsValidEntity(pipe_entity) then 
		--default connection tube.
		pipe_entity = skin.default_tube
	end
	
	local pt_end = GetEntitySpotPos(pipe_entity, GetSpotBeginIndex(pipe_entity, "idle", "End"))
	local angle_end = CalcOrientation(pt_end)
	if pt_end:x() ~= 0 or pt_end:y() ~= 0 then
		local spot_pos_pt = GetEntitySpotPos(entity, spot_idx)
		local dir = HexAngleToDirection(angle_end + GetEntitySpotAngle(entity, spot_idx))
		local pt = point(WorldToHex(spot_pos_pt + Rotate(point(guim, 0), angle_end + GetEntitySpotAngle(entity, spot_idx))))
		for _, entry in ipairs(result) do
			if entry[1] == pt and entry[2] == dir then
				printf("Duplicate pipe connection: entity %s, spot %s, pipe entity %s", entity, spot, pipe_entity)
				pt = nil
			end
		end
		if pt then
			local decor_t = nil
			if decor_spot_info_t then
				decor_t = {skin.decor_entity}
				if not decor_spot_info_t[2] then
					--decor spot on main entity
					decor_t[2] = {GetEntityNearestSpotIdx(entity, decor_spot, spot_pos_pt), entity}
				else
					--decor spot on auto attach
					decor_t[2] = {GetEntityNearestSpotIdx(entity, decor_spot_info_t[2], spot_pos_pt), entity}
					decor_t[3] = {GetEntityNearestSpotIdx(decor_spot_info_t[1], decor_spot, Rotate(spot_pos_pt - GetEntitySpotPos(entity, decor_t[2][1]), -GetEntitySpotAngle(entity, decor_t[2][1])) ), decor_spot_info_t[1]}
				end
			end
			
			result[#result + 1] = { pt, dir, spot_idx, pipe_entity, decor_t }
		end
	else
		printf("Pipe entity %s does not have a valid 'End' spot", pipe_entity)
	end
end

GlobalVar("LastGridHandle", 65535)
function GridObject:GenerateHandle()
	local h = LastGridHandle
	for i = 1, 50000 do
		h = h + 1
		if h > 65535 then
			h = 10000
		end
		if not HandleToObject[h] then
			LastGridHandle = h
			return h
		end
	end
	assert(false) -- handle generation failed
	return Object.GenerateHandle(self)
end

function HexGetBuilding(q, r)
	if r then
		return HexGridGetObject(ObjectGrid, q, r, nil, "LifeSupportGridElement", function (obj) return not IsKindOf(obj, "ElectricityGridElement") end)
	else
		return HexGridGetObject(ObjectGrid, q, nil, "LifeSupportGridElement", function (obj) return not IsKindOf(obj, "ElectricityGridElement") end)
	end
end

function HexGetDomeExterior(q, r)
	if r then
		return HexGridGetObject(ObjectGrid, q, r, "Dome")
	else
		return HexGridGetObject(ObjectGrid, q, "Dome")
	end
end

function HexGetBuildingNoDome(q, r)
	if r then
		return HexGridGetObject(ObjectGrid, q, r, nil, "LifeSupportGridElement", function (obj) return not IsKindOfClasses(obj, "ElectricityGridElement", "Dome", "DomeInterior") end)
	else
		return HexGridGetObject(ObjectGrid, q, nil, "LifeSupportGridElement", function (obj) return not IsKindOfClasses(obj, "ElectricityGridElement", "Dome", "DomeInterior") end)
	end
end

function HexGetBuildingOrCable(q, r)
	if r then
		return HexGridGetObject(ObjectGrid, q, r, nil, "LifeSupportGridElement")
	else
		return HexGridGetObject(ObjectGrid, q, nil, "LifeSupportGridElement")
	end
end

function HexGetPipe(q, r)
	return HexGridGetObject(ObjectGrid, q, r, "LifeSupportGridElement")
end

function HexGetPillaredPipe(q, r)
	return HexGridGetObject(ObjectGrid, q, r, "LifeSupportGridElement", nil, function(o) return o.pillar end)
end

function HexGetCable(q, r)
	return HexGridGetObject(ObjectGrid, q, r, "ElectricityGridElement")
end

function HexGetLowBuilding(q, r) -- building or cable or pipe with a pillar - everything without overhead pipes
	return HexGridGetObject(ObjectGrid, q, r, nil, nil, function(obj)
		return not IsKindOf(obj, "ToxicPool") and (not IsKindOf(obj, "LifeSupportGridElement") or obj.pillar)
	end)
end

function HexGetLandscapeOrLowBuilding(q, r)
	return LandscapeCheck(q, r, true) or HexGetLowBuilding(q, r)
end

function GetGrid(o, supply_resource)
	return rawget(rawget(o, supply_resource) or empty_table, "grid")
end

function HexGetDomeInterior(q, r)
	local obj = HexGridGetObject(ObjectGrid, q, r, "DomeInterior")
	return obj and obj.dome or nil
end

function RebuildBuildingConnections()
	PipeConnectionsCache = {}
	for id, template in pairs(BuildingTemplates) do
		local building = ClassTemplates["Building"][id]
		if building then
			building:GetShapePoints()
			building:GetPipeConnections()
		end
	end
end

OnMsg.EntitiesLoaded = RebuildBuildingConnections

local LookupGrid = false

--when constructing both template_obj and cursor_obj are used to gather the data
function HexGetUnits(obj, entity, pos, angle, test, filter, classes, force_extend_bb_by, shape)
	local outline, interior
	if shape then
		outline = shape
		interior = empty_table
	else
		outline, interior = GetEntityHexShapes(entity)
	end
	local dir = HexAngleToDirection(angle or obj:GetAngle())
	local initial_q, initial_r = WorldToHex(pos or obj)
	
	--grab limits, can cache.
	local minq, maxq, minr, maxr = 0, 0, 0, 0
	local HexRotate = HexRotate
	for _, shape_pt in ipairs(outline) do
		local q, r = HexRotate(shape_pt, dir)
		if q < minq then minq = q elseif q > maxq then maxq = q end
		if r < minr then minr = r elseif r > maxr then maxr = r end
	end
	
	local total_x, total_y = abs(minq) + abs(maxq) + 1, abs(minr) + abs(maxr) + 1
	total_x = total_x + total_y / 2
	local lookup_q, lookup_r = abs(minq), abs(minr)
	
	if LookupGrid then
		local c_x, c_y = LookupGrid:size()
		if c_x ~= total_x or c_y ~= total_y then
			LookupGrid:resize(total_x, total_y)
		else
			LookupGrid:clear(0)
		end
	else
		LookupGrid = NewGrid(total_x, total_y, 1)
	end
	
	if obj then
		HexGridShapeSetValue(LookupGrid, obj, outline, 1, lookup_q, lookup_r)
		if interior then HexGridShapeSetValue(LookupGrid, obj, interior, 1, lookup_q, lookup_r) end
	else
		if shape then
			HexGridShapeSetValue(LookupGrid, pos, angle, shape, 1, lookup_q, lookup_r)
		else
			HexGridSet(LookupGrid, lookup_q, lookup_r, 1)
		end
	end
	
	local grid_val = 0
	local bbb = obj and GetObjectsBBox({obj}) or box(pos, pos)
	
	--extend, this fixes bb's that don't quite cover the entire shape + repair bay tiny bb.
	local unit_area = bbb:grow(5 * HexGetSize() + (force_extend_bb_by or 0))
	local unit_filter = function(o)
		local ret
		if filter then
			ret = filter(o)
			if not ret then return end
		end
		
		ret = test and "break" or ret or true
		
		local q, r = WorldToHex(o)
		q = q - initial_q + lookup_q
		r = r - initial_r + lookup_r
		
		if IsKindOf(o, "UngridedObstacle") then
			local my_shape = o:GetRotatedShapePoints()
			grid_val = 0
			
			for i = 1, #my_shape do
				local dq, dr = my_shape[i]:xy()
				grid_val = HexGridGet(LookupGrid, q + dq, r + dr)
				if grid_val ~= 0 then
					break
				end
			end
		else
			grid_val = HexGridGet(LookupGrid, q, r)
		end
		
		return grid_val ~= 0 and ret
	end
	
	local unit_classes = classes or "Unit"
	return (test and MapGet(unit_area, unit_classes, unit_filter) and grid_val ~= 0) or (not test and MapGet(unit_area, unit_classes, unit_filter))
end
