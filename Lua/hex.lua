--[[

Storage coordinates: i, j (coords in the square grid used for storing hex info corresponding to a single hex.)
hex grid axial coordinates: q, r
descartes coordinates: x, y

from cpp
int GetHexgridSpacingDefine() //returns the grid spacing as defined by TCFG_HEXGRID_SPACING
x,y HexToWorld(int q, int r) //returns the center pos in world xy coords of the hex defined by q,r
q,r WorldToHex(int x, int y) //returns the hex axial coords (q,r) @ a given world position x,y;
Point HexGetNearestCenter(Point p) //returns the center point in world coords of the hex in whom p belongs.
int HexGetVerticalSpacing() //returns the vertical hex grid spacing in game units
]]


hex_jump_thread = false
print_hex_jump = false

function hex_jump()
	hex_jump_thread = CreateMapRealTimeThread(function()
		local s = Sphere:new()
		s:SetColor(const.clrWhite)
		s:SetRadius(guim)
		
			local l = Polyline:new()
			l:SetLocalSpace(false)
			l:SetPos(GetTerrainCursor())
			l:SetColors({RGB(255,255,255)})
			l:SetDepthTest("smart")

		while true do
			WaitNextFrame()
			
			local pts = {}
			for i=1,5 do
				for j=1,5 do
					local pt = GetTerrainCursor() + point(i*guim-3*guim, j*guim-3*guim, guim)
					local hpt = HexGetNearestCenter(pt)
					pts[1+#pts] = pt:SetZ(guim)--GetTerrainCursor():SetZ(guim)
					pts[1+#pts] = hpt:SetZ(guim)
					pts[1+#pts] = GetTerrainCursor():SetZ(guim)
				end
			end
			l:SetPoints(pts)
			s:SetPos( clamp_to_axis(Selection[1]:GetPos(), GetTerrainCursor()) )
		end
	end)
end

if FirstLoad then
	HexOutlineShapes, HexInteriorShapes, HexOutlineByHash  = {}, {}, {}
	HexBuildShapes, HexBuildShapesInversed = {}, {}
	HexPeripheralShapes = {}
	HexCombinedShapes = {}
end

FallbackOutline = { point(0, 0) }
local FallbackInterior = { }
local FallbackBuild = { }

HexSurroundingsCheckShape = { point(0, -1), point(1, -1), point(-1, 0), point(0, 0), point(1, 0), point(-1, 1), point(0, 1) }

function GetEntityOutlineShape(entity)
	return HexOutlineShapes[entity] or FallbackOutline
end

function GetEntityInteriorShape(entity)
	return HexInteriorShapes[entity] or FallbackInterior
end

function GetEntityBuildShape(entity)
	return HexBuildShapes[entity] or FallbackBuild
end

function GetEntityInverseBuildShape(entity)
	return HexBuildShapesInversed[entity] or FallbackBuild
end

function GetEntityCombinedShape(entity)
	return HexCombinedShapes[entity] or FallbackOutline	
end

--Get the hex shape and its interior for a specific entity
function GetEntityHexShapes(entity)
	return GetEntityOutlineShape(entity), GetEntityInteriorShape(entity), GetEntityBuildShape(entity)
end

function GetEntityPeripheralHexShape(entity)
	return HexPeripheralShapes[entity] or HexSurroundingsCheckShape
end

--Reload the hex shapes (and their interiors) for all entitees
function RebuildHexShapes()
	local function ProcessHexSurfaces(surface_name, proc)
		local surface_mask = EntitySurfaces[surface_name]
		local all_entities = GetAllEntities()
		for entity,_ in pairs(all_entities) do
			if HasAnySurfaces(entity, surface_mask) then
				local all_states = GetStates(entity)
				for _,state in ipairs(all_states) do
					local state_idx = GetStateIdx(state)
					local outline, interior, hash = GetSurfaceHexShapes(entity, state_idx, surface_mask)
					local action = proc(entity, state_idx, outline, interior, hash)
					if action == "break" then break end
				end
			end
		end
	end

	ProcessHexSurfaces("HexShape", function(entity, state_idx, outline, interior, hash)
		if not outline then return "continue" end
		local referenced_entity = HexOutlineByHash[hash]
		if referenced_entity ~= nil then
			HexOutlineShapes[entity] = HexOutlineShapes[referenced_entity]
			HexInteriorShapes[entity] = HexInteriorShapes[referenced_entity]
			HexPeripheralShapes[entity] = HexPeripheralShapes[referenced_entity]
			HexCombinedShapes[entity] = HexCombinedShapes[referenced_entity]
		else
			HexOutlineShapes[entity] = outline
			HexInteriorShapes[entity] = interior
			HexCombinedShapes[entity] = table.append(table.copy(outline), interior)
			table.sort(HexCombinedShapes[entity])
			HexOutlineByHash[hash] = entity
			HexPeripheralShapes[entity] = GetPeripheralHexShape(outline, interior)
			
			-- check for duplicate entires in the combined shape
			local shape = HexCombinedShapes[entity]
			for i = #shape, 2, -1 do
				if shape[i] == shape[i-1] then
					table.remove(shape, i)
				end
			end
		end
		return "break"
	end)
	
	ProcessHexSurfaces("Build", function(entity, state_idx, outline, interior, hash)
		if not outline then return "continue" end
		local referenced_entity = HexOutlineByHash[hash]
		if referenced_entity then
			HexBuildShapesInversed[entity] = HexBuildShapesInversed[referenced_entity]
			HexBuildShapes[entity] = HexBuildShapes[referenced_entity]
		else
			HexBuildShapes[entity] = outline
			local interior = HexInteriorShapes[entity]
			if interior and next(interior) then
				local inverse = {}
				local build = HexBuildShapes[entity]
				HexBuildShapesInversed[entity] = inverse
				for i=1,#interior do
					local pt = interior[i]
					if not table.find(build, pt) then
						table.insert(inverse, pt)
					end
				end
			end
		end
		return "break"
	end)
	
	Msg("HexShapesRebuilt")
end

DefineClass.DecRange_01 = { __parents = { "TerrainDecal" }, entity = "DecRange_01", }
DefineClass.DecRange_02 = { __parents = { "TerrainDecal" }, entity = "DecRange_02", }
DefineClass.DecRange_03 = { __parents = { "TerrainDecal" }, entity = "DecRange_03", }
DefineClass.DecRange_04 = { __parents = { "TerrainDecal" }, entity = "DecRange_04", }
DefineClass.DecRange_05 = { __parents = { "TerrainDecal" }, entity = "DecRange_05", }

-- object to use as a parent for the decals when the target object can move and therefore 
-- we don't want to attach decals directly to keep them aligned to the grid.
-- Note that for non-movable objects it is better to attach decals to the proxy object directly
-- to avoid lag in position update (for instance, when moving around a construction cursor).
 DefineClass.RangeHexRadiusContainer = {
	__parents = { "Object" },
	entity = "InvisibleObject",
}

-- proxy object for the ActionFX to attach
-- it manages a collection of decals and overrides SetScale to interface properly with the ActionFX
DefineClass.RangeHexRadius = {
	__parents = { "Object", "UIAttach" },
	
	entity = "InvisibleObject",
	container = false,
	decals = false,
	size = false,
	update_thread = false,
	parent_always_renderable = false,
}

function RangeHexRadius:GameInit()
	self.update_thread = CreateGameTimeThread(function()
		while IsValid(self) and IsValid(self.container) do
			self:AlignContainer()
			Sleep(100)
		end
	end)
	local parent = self:GetParent()
	if IsValid(parent) then
		self.parent_always_renderable = parent:GetGameFlags(const.gofAlwaysRenderable) ~= 0
		parent:SetGameFlags(const.gofAlwaysRenderable)
		
		local size = self.size
		self.size = -1
		self:SetScale(size)
	end
end

function RangeHexRadius:Done()
	local parent = self:GetParent()
	if IsValid(parent) and not self.parent_always_renderable then
		parent:ClearGameFlags(const.gofAlwaysRenderable)
	end
	DoneObject(self.container)
end

function RangeHexRadius:SetVisible(visible)
	local list = self.decals or empty_table
	for i = 1, #list do
		if visible then
			list[i]:SetEnumFlags(const.efVisible)
		else
			list[i]:ClearEnumFlags(const.efVisible)
		end
	end
end

function RangeHexRadius:AlignContainer()
	if not self.container then return end
	local q, r = WorldToHex(self:GetPos())
	local x, y = HexToWorld(q, r)
	self.container:SetPos(point(x, y):SetStepZ())
end

function RangeHexRadius:PlaceDecal(class, suffix, container, q, r, angle)
	local decal = PlaceObject(class..suffix)
	container:Attach(decal)
	local x, y = HexToWorld(q, r)
	decal:SetAttachOffset(point(x, y, 100))
	decal:SetAttachAngle(angle)
	return decal
end

function RangeHexRadius:GetDecalClassBase()
	return "Range"
end

function RangeHexRadius:PlaceDecals(range)	
	local q, r = 0, 0 -- position will be used as attach offset so assume placement around (0, 0)

	local dq, dr = HexNeighbours[1]:xy()
	q = q + range * dq
	r = r + range * dr

	local container = self.container or self -- movable vs non-movable

	local class_base = self:GetDecalClassBase()

	local objs = {}
	for i = 1, 6 do
		local idx = 1 + ((1 + i) % 6)
		dq, dr = HexNeighbours[idx]:xy()
		for j = 1, range do
			local x, y = HexToWorld(q, r)
			
			local suffix = (j == 1) and "_01" or "_02"
			local angle = (i-1) * 60 * 60
			if j == 1 then
				angle = angle + 180*60
			end
			objs[#objs + 1] = self:PlaceDecal(class_base, suffix, container, q, r, angle)
			
			if j == 1 and range >= 17 then
				-- place additional decals around the corner
				local q1, r1 = HexNeighbours[i]:xy()
				local q2, r2 = HexNeighbours[1 + (1 + idx)%6]:xy()
				
				local bq, br = q - q1, r - r1
				objs[#objs + 1] = self:PlaceDecal(class_base, "_03", container, bq - q1, br - r1, 180*60 + (i-1) * 60 * 60)
				objs[#objs + 1] = self:PlaceDecal(class_base, "_06", container, bq + 3*dq, br + 3*dr, (i-3) * 60 * 60)
				objs[#objs + 1] = self:PlaceDecal(class_base, "_07", container, bq + 6*dq + q2, br + 6*dr + r2, (i-3) * 60 * 60)
				objs[#objs + 1] = self:PlaceDecal(class_base, "_04", container, bq + 3*q2, br + 3*r2, (i-2) * 60 * 60)
				objs[#objs + 1] = self:PlaceDecal(class_base, "_05", container, bq + 6*q2 + dq, br + 6*r2 + dr, (i-2) * 60 * 60)
			end
						
			q = q + dq
			r = r + dr
		end
	end
	return objs
end
	
-- Scale is interpreted as size in hexes here. Scale in the normal sense is kind of meaningless as we want
-- the object to form a hex-grid-aligned shape.
function RangeHexRadius:SetScale(scale)
	if scale == self.size then
		return
	end
	if scale ~= self.size then
		local list = self.decals or empty_table
		for i = 1, #list do
			DoneObject(list[i])
		end
		self.decals = nil
	end
	
	if scale then
		self:AlignContainer()
		self.decals = self:PlaceDecals(scale)
	end
	self.size = scale
end

-- Proxy object to use with movable targets.
DefineClass.RangeHexMovableRadius = {
	__parents = { "RangeHexRadius" },
}

function RangeHexMovableRadius:Init()
	self.container = PlaceObject("RangeHexRadiusContainer")
	self.container:SetGameFlags(const.gofAlwaysRenderable)
end

-- Proxy object to use with "show-all" buildings
DefineClass.RangeHexMultiSelectRadius = {
	__parents = { "RangeHexRadius" },
}

function RangeHexMultiSelectRadius:GetDecalClassBase()
	local parent = self:GetParent()
	return (IsValid(parent) and parent == SelectedObj) and "Range" or "RangeNonActive"
end

OnMsg.EntitiesLoaded = RebuildHexShapes

if Platform.developer then
	local build_grid_debug_range = 10
	GlobalVar("build_grid_debug_objs", false)
	GlobalVar("build_grid_debug_thread", false)

	function debug_build_grid()
		if build_grid_debug_thread then
			DeleteThread(build_grid_debug_thread)
			build_grid_debug_thread = false
			if build_grid_debug_objs then
				for i = 1, #build_grid_debug_objs do
					DoneObject(build_grid_debug_objs[i])
				end
				build_grid_debug_objs = false
			end
		else
			build_grid_debug_objs = {}
			build_grid_debug_thread = CreateRealTimeThread(function()
				local last_q, last_r
				while build_grid_debug_objs do
					local q, r = WorldToHex(GetTerrainCursor())
					if last_q ~= q or last_r ~= r then
						local z = -q - r
						local idx = 1
						for q_i = q - build_grid_debug_range, q + build_grid_debug_range do
							for r_i = r - build_grid_debug_range, r + build_grid_debug_range do
								for z_i = z - build_grid_debug_range, z + build_grid_debug_range do
									if q_i + r_i + z_i == 0 then
										local c = build_grid_debug_objs[idx] or Circle:new()
										c:SetRadius(const.GridSpacing/2)
										c:SetPos(point(HexToWorld(q_i, r_i)))
										if HexGridGetObject(ObjectGrid, q_i, r_i) then
											c:SetColor(RGBA(255, 0, 0, 0))
										else
											c:SetColor(RGBA(0, 255, 0, 0))
										end
										build_grid_debug_objs[idx] = c
										idx = idx + 1
									end
								end
							end
						end

						last_q = q
						last_r = r
					end
					Sleep(50)
				end
			end)
		end
	end
	
	function HexRing(q, r, a, b, idx, ret_arr)
		local idx = idx or 1
		ret_arr = ret_arr or {}
		local rad = a or 6 --a
		b = b or rad*2 + 4
		local initial_direction = 2 --HexAngleToDirection(a) + 2,
		
		local pt_hex = point(q, r)
		pt_hex = pt_hex + HexNeighbours[initial_direction]*(rad) -- x+ direction
		local secondary_dir = ((initial_direction-1)-1)%6 + 1
		pt_hex = pt_hex + HexNeighbours[secondary_dir]*MulDivRound(MulDivRound(rad, 100, 200), b - rad, rad)
		
		
		initial_direction = (initial_direction + 1)%6 + 1
		
		for i = 1, 6 do
			local max = (i == 1 or i == 4) and b or rad
			for j = 1, max do
				ret_arr[idx] = pt_hex
				
				local neighbour_dir = initial_direction + (i-1)
				neighbour_dir = (neighbour_dir - 1)%6 + 1
				
				idx = idx + 1
				pt_hex = pt_hex + HexNeighbours[neighbour_dir]
			end
		end
		
		return ret_arr, idx
	end
	
	
	
	function FillHexRing(q, r, a, b)
		local idx = 1
		local ret
		for i = 1, a do
			ret, idx = HexRing(q, r, i, i, idx, ret)
		end
		
		for i = a + 1, b, 1 do
			ret, idx = HexRing(q, r, a, i, idx, ret)
		end
		
		return table.get_truly_unique(ret), idx
	end
	
	GlobalVar("painted_hexes", false)
	GlobalVar("painted_hexes_thread", false)
	function PaintHexArray(arr, mid_hex_pt) --paints zero based hex shapes (such as from GetEntityHexShapes)
		if IsValidThread(painted_hexes_thread) then
			DeleteThread(painted_hexes_thread)
		end
		
		if painted_hexes then
			for i = 1, #painted_hexes do
				DoneObject(painted_hexes[i])
			end
			painted_hexes = false
		end
		if arr then
			painted_hexes_thread = CreateRealTimeThread(function()
				local last_q, last_r
				painted_hexes = {}
				
				while true do
					local q, r
					if mid_hex_pt then
						q, r = mid_hex_pt:x(), mid_hex_pt:y()
					else
						q, r = WorldToHex(GetTerrainCursor())
					end
					if last_q ~= q or last_r ~= r then
						local idx = 1
						for idx = 1, #arr do
							local q_i, r_i = q + arr[idx]:x(), r + arr[idx]:y()
							local c = painted_hexes[idx] or Circle:new()
							c:SetRadius(const.GridSpacing/2)
							c:SetPos(point(HexToWorld(q_i, r_i)))				
							c:SetColor(RGBA(0, 0, 255, 0))
							painted_hexes[idx] = c
						end
						last_q = q
						last_r = r
					end
					Sleep(50)
				end
			end)
		end
	end
	
	function CreateInternalHexShape(hex_shape)
		local visited = {}
		local new_shape = {}
		
		--[[
		--overflows.
		local function visit(hex_pt)
			table.insert(visited, hex_pt)
			if not table.find(hex_shape, hex_pt) then
				if not table.find(new_shape, hex_pt) then
					table.insert(new_shape, hex_pt)
					for i = 1, #HexNeighbours do
						local pt = hex_pt + HexNeighbours[i]
						if not table.find(visited, pt) then
							visit(pt)
						end
					end
				end
			end
		end
		
		visit(point(0, 0))
		]]
		
		
		local pts = {point(0, 0)}
		while #pts > 0 do
			local pt = pts[#pts]
			pts[#pts] = nil
			
			table.insert(visited, pt)
			if not table.find(hex_shape, pt) then
				if not table.find(new_shape, pt) then
					table.insert(new_shape, pt)
					for i = 1, #HexNeighbours do
						local new_pt = pt + HexNeighbours[i]
						if not table.find(visited, new_pt) then
							table.insert(pts, new_pt)
						end
					end
				end
			end
		end
		
		return new_shape
	end
	
	function HexPainter(b, arr)
		if b then
			GetInGameInterface():SetMode("hex_painter", {res_arr = arr, hex_mid_pt = point(WorldToHex(GetTerrainCursor()))})
		else
			GetInGameInterface():SetMode("selection")
		end
	end
	
	GlobalVar("HexPainterResultArr", false)
	
	DefineClass.HexPainterModeDialog = {
		__parents = { "InterfaceModeDialog" },
		mode_name = "hex_painter",
			
		hex_mid_pt = false,
		hex_mid_circle = false,
		res_arr = false,
	}

	function HexPainterModeDialog:Init()
		self:SetFocus()
		self.res_arr = self.context.res_arr or {}
		self.hex_mid_pt = self.context.hex_mid_pt
	end

	function HexPainterModeDialog:Open(...)
		InterfaceModeDialog.Open(self, ...)
		self:PaintMid()
		PaintHexArray(self.res_arr, self.hex_mid_pt)
	end

	function HexPainterModeDialog:Close(...)
		InterfaceModeDialog.Close(self, ...)
		HexPainterResultArr = self.res_arr
		PaintHexArray()
		if self.hex_mid_circle then
			DoneObject(self.hex_mid_circle)
		end
	end

	function HexPainterModeDialog:OnMouseButtonDown(pt, button)
		if button == "L" then
			local p = point(WorldToHex(GetTerrainCursor()))
			if self.hex_mid_pt then
				p = p - self.hex_mid_pt
			end
			
			local idx = table.find(self.res_arr, p)
			if idx then
				table.remove(self.res_arr, idx)
			else
				table.insert(self.res_arr, p)
			end
			
			PaintHexArray(self.res_arr, self.hex_mid_pt)
			
			return "break"
		elseif button == "R" then
			if self.hex_mid_pt then
				for i = 1, #self.res_arr do
					self.res_arr[i] = self.res_arr[i] + self.hex_mid_pt
				end
				
				
			end
			self.hex_mid_pt = point(WorldToHex(GetTerrainCursor()))
			
			if self.hex_mid_pt then
				for i = 1, #self.res_arr do
					self.res_arr[i] = self.res_arr[i] - self.hex_mid_pt
				end
				self:PaintMid()
			end
			
			
			PaintHexArray(self.res_arr, self.hex_mid_pt)
			return "break"
		end
	end
	
	function HexPainterModeDialog:PaintMid()
		if self.hex_mid_circle then
			DoneObject(self.hex_mid_circle)
		end
		if self.hex_mid_pt then
			self.hex_mid_circle = Circle:new()
			self.hex_mid_circle:SetPos(point(HexToWorld(self.hex_mid_pt:x(), self.hex_mid_pt:y())))
			self.hex_mid_circle:SetColor(RGBA(255, 100, 100, 0))
			self.hex_mid_circle:SetRadius(const.GridSpacing/2)
		end
	end
	
	function ForEachHexInShape(shape, pos, angle, callback)
		if IsValid(pos) then
			callback = angle
			angle = pos:GetAngle()
			pos = pos:GetPos()
		end
		local q, r = WorldToHex(pos)
		local dir = HexAngleToDirection(angle)
		for i, shape_pt in ipairs(shape) do
			local qi, ri = HexRotate(shape_pt, dir)
			qi = qi + q
			ri = ri + r
			local x, y = HexToWorld(qi, ri)
			callback(x, y, qi, ri, i)
		end
	end
	
	function DbgShowShape(shape, obj, color, dz)
		color = color or RGB(255, 255, 255)
		dz = dz or guim
		local objs = {}
		ForEachHexInShape(shape, obj, function(x, y)
			local obj = Circle:new()
			obj:SetRadius(const.GridSpacing/2)
			obj:SetPos(x, y, terrain.GetHeight(x, y) + dz)				
			obj:SetColor(color)
			objs[#objs + 1] = obj
		end)
		CreateRealTimeThread(function()
			Sleep(3000)
			for i=1,#objs do
				DoneObject(objs[i])
			end
		end)
	end
	
end--Platform.developer