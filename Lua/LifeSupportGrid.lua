--used so pipes find their proper entities
TubeSkins = {
	Default = {
		dlc = false,
		Tube = "Tube",
		TubePillar = "TubePillar",
		TubeHub = "TubeHub",
		TubeHubPlug = "TubeHubPlug",
		TubeJoint = "TubeJoint",
		TubeJointSeam = "TubeJointSeam",
		TubeSwitch = "TubeSwitch",
	},
	
	Chrome = {
		dlc = "dde",
		Tube = "TubeChrome",
		TubePillar = "TubeChromePillar",
		TubeHub = "TubeChromeHub",
		TubeHubPlug = "TubeChromeHubPlug",
		TubeJoint = "TubeChromeJoint",
		TubeJointSeam = "TubeChromeJointSeam",
		TubeSwitch = "TubeChromeSwitch",
	},
}
--[template_name] = {[tube_skin] = "template_param_name", ...}
--used for blds that flip their skin with the grid
BuildingGridSkins = {
	FuelFactory = { Default = "entity", Chrome = "entity2" },
	OxygenTank  = { Default = "entity", Chrome = "entity2" },
	WaterTank   = { Default = "entity", Chrome = "entity2" },
	WindTurbine = { Default = "entity", Chrome = "entity2" },
}

KnownPipeEntities = {} --for shader log
PlugsAndSeams = {} --for destroy attaches
for _, map in pairs(TubeSkins) do
	for part, e in pairs(map) do
		if part ~= "dlc" then
			table.insert(KnownPipeEntities, e)
			if part == "TubeHubPlug" or part == "TubeJointSeam" then
				table.insert(PlugsAndSeams, e)
			end
		end
	end
end

DefineClass.WaterGrid = {
	__parents = { "SupplyGridFragment" },
	supply_resource = "water",
	air_grid = false,
}

DefineClass.AirGridFragment = {
	__parents = { "SupplyGridFragment" },
	supply_resource = "air",
}

-- every water grid fragment has a corresponding air grid with the same elements (because water and air run in the same pipes)
-- adding or removing elements in the water grid does the same in the air grid
function WaterGrid:Init()
	self.air_grid = AirGridFragment:new{ city = self.city }
end

function WaterGrid:Done()
	self.air_grid:delete()
end

function WaterGrid:AddElement(element, update)
	local air_element = element.building.air
	if air_element then
		self.air_grid:AddElement(air_element, update)
	end
	SupplyGridFragment.AddElement(self, element, update)
end

function WaterGrid:RemoveElement(element, update)
	local air_element = element.building.air
	if air_element then
		self.air_grid:RemoveElement(air_element, update)
	end
	SupplyGridFragment.RemoveElement(self, element, update)
end

function WaterGrid:CreateConnection(pt1, pt2, building1, building2)
	assert(building1 and building2)
	--local is_constr = IsKindOf(building1, "ConstructionSite") or IsKindOf(building2, "ConstructionSite")
	SupplyGridAddConnection(SupplyGridConnections["water"], pt1, pt2)
	local is_pipe1 = building1:IsKindOf("LifeSupportGridElement")
	local is_pipe2 = building2:IsKindOf("LifeSupportGridElement")
	local b1_cs = IsKindOf(building1, "ConstructionSite")
	local b2_cs = IsKindOf(building2, "ConstructionSite")
	
	if is_pipe1 then
		if not is_pipe2 or building1:GetNumberOfConnections() > 2 then --promote only when there is 1 non pipe, or we get pillars everywhere.
			assert(building1:CanMakePillar()) --pipe was erroneously marked as able to connect here!
			building1:MakePillar()
		end
		building1:UpdateVisuals()
	else
		building1:ConnectPipe(pt1, pt2, b2_cs)
	end
	if is_pipe2 then
		if not is_pipe1 or building2:GetNumberOfConnections() > 2 then --1 connection is meaningless.
			assert(building2:CanMakePillar())
			building2:MakePillar()
		end
		building2:UpdateVisuals()
	else
		building2:ConnectPipe(pt2, pt1, b1_cs)
	end
end

local function connection_destroyed(building, pt1, pt2, the_other_building, test)
	if IsBeingDestructed(building) then return end
	
	local DoneFunctor = test and function(bld) table.insert_unique(test, bld) end or DoneObject
	if building:IsKindOf("LifeSupportGridElement") then
		-- pipe
		local b1_cs = IsKindOf(building, "ConstructionSite")
		local b2_cs = IsKindOf(the_other_building, "ConstructionSite")
		local is_any_constr_site = b1_cs or b2_cs
		local are_both_pipes = IsKindOf(the_other_building, "LifeSupportGridElement")
		
		if not building.is_switch and not is_any_constr_site and
			(not building.pillar and are_both_pipes) then
			DoneFunctor(building)
			return
		else
			local c = building:GetNumberOfConnections()
			if c ~= 2 then
				if building:CanMakePillar() then
					if not test then building:MakePillar() end
				else
					DoneFunctor(building)
					return
				end
			end
		end
		
		if not building.is_switch and not is_any_constr_site and band(building.conn, 63) == 0 then
			DoneFunctor(building)
			return
		end
		
		if not test then building:UpdateVisuals() end
	elseif not test then
		building:DisconnectPipe(pt1, pt2)
	end
end

function WaterGrid:DestroyConnection(pt1, pt2, building1, building2, test)
	assert(building1 and building2)
	connection_destroyed(building1, pt1, pt2, building2, test)
	connection_destroyed(building2, pt2, pt1, building1, test)
end

function WaterGrid:GetUISectionWaterGridRollover()
	local ret = 
	{
		T(537, "Life support grid parameters. Water and Oxygen are consumed only when demanded.<newline>"),
		T{330, "Max production<right><water(production)>", self},
		T{331, "Water consumption<right><water(current_consumption)>", current_consumption = self.current_consumption},
	}

	if self.production > self.consumption then
		table.insert(ret, 
		T{543, "Unused production<right><water(number)>", number = function (obj) local el = ResolvePropObj(obj) return el.grid.production - el.grid.consumption end, self})
	elseif self.production < self.consumption then
		table.insert(ret, 
		T{544, "Insufficient production<right><water(number)>", number = function (obj) local el = ResolvePropObj(obj) return el.grid.consumption - el.grid.production end, self})
	end

	return table.concat(ret, "<newline><left>")
end

function AirGridFragment:GetUISectionAirGridRollover()
	local ret = 
	{
		T(537, "Life support grid parameters. Water and Oxygen are consumed only when demanded.<newline>"),
		T{325, "Max production<right><air(production)>", self},
		T{538, "Oxygen consumption<right><air(current_consumption)>", current_consumption = self.current_consumption},
	}

	if self.production > self.consumption then
		table.insert(ret, 
		T{539, "Unused production<right><air(number)>", number = 
			function (obj) 
				local el = ResolvePropObj(obj) 
				local grid = el.grid
				grid = grid:IsKindOf("WaterGrid") and grid.air_grid or grid
				return grid.production - grid.consumption 
			end, self})
	elseif self.production < self.consumption then
		table.insert(ret, 
		T{540, "Insufficient production<right><air(number)>", number = 
			function (obj) 
				local el = ResolvePropObj(obj) 
				local grid = el.grid
				grid = grid:IsKindOf("WaterGrid") and grid.air_grid or grid
				return el.grid.consumption - el.grid.production 
			end, self})
	end

	return table.concat(ret, "<newline><left>")
end


----- LifeSupportGridObject

DefineClass.LifeSupportGridObject = {
	__parents = { "SupplyGridObject" },
	water = false,
	air = false,
	connections = false,
	connections_skin_name = false,
	
	is_tall = true,
}

function LifeSupportGridObject:GameInit()
	self:CreateLifeSupportElements()
	if self.air then
		-- if there is an air element we need to have a dummy water one because the water grid carries the air as well
		self.water = self.water or SupplyGridElement:new{ building = self }
	end
	self:SupplyGridConnectElement(self.water, WaterGrid)
end

function LifeSupportGridObject:DeleteLifeSupport()
	if not self.water then
		return
	end
	self:SupplyGridDisconnectElement(self.water, WaterGrid)
	self.water = false
	self.air = false
end

function LifeSupportGridObject:Done()
	self:DeleteLifeSupport()
end

function LifeSupportGridObject:OnDestroyed()
	self:DeleteLifeSupport()
end

function LifeSupportGridObject:GetUISectionAirGridRollover()
	local grid = self.air and self.air.grid or self.water and self.water.grid and self.water.grid.air_grid
	if grid then
		return grid:GetUISectionAirGridRollover()
	end
end

-- override this function to create water/air elements - it is called before ancestors' GameInit
function LifeSupportGridObject:CreateLifeSupportElements()
end

function LifeSupportGridObject:MoveInside(dome)
	Building.MoveInside(self, dome)
	
	local grid = self.water.grid
	grid:RemoveElement(self.water)
	
	local ls_connection_grid = SupplyGridConnections["water"]
	local shape = self:GetSupplyGridConnectionShapePoints("water")
	ApplyIDToOverlayGrid(OverlaySupplyGrid, self, shape, 15, "band")
	local connections = SupplyGridRemoveBuilding(ls_connection_grid, self, shape)
	-- destroy connections
	for i = 1, #(connections or ""), 2 do
		local pt, other_pt = connections[i], connections[i + 1]
		local adjascents = HexGridGetObjects(ObjectGrid, other_pt, nil, nil, function(o)
			return GetGrid(o) == grid
		end)
		for i = 1, #adjascents do
			WaterGrid:DestroyConnection(pt, other_pt, dome, adjascents[i])
		end
	end
	
	if #grid.elements <= 0 then
		grid:delete()
	end
	assert(IsKindOf(dome, "Dome"))
	self.water.parent_dome = dome
	dome:AddToLabel("SupplyGridBuildings", self)
	local my_ls_grid = dome.water.grid
	my_ls_grid:AddElement(self.water)
end

function LifeSupportGridObject:GetPipeConnLookup()
	local ret = {}
	for _, t in pairs(self.connections or empty_table) do
		for __, o in ipairs(t) do
			ret[o] = true
		end
	end
	
	return ret
end

function LifeSupportGridObject:PlacePipeConnection(pipe, i)
	local cm1, cm2, cm3, cm4 = GetPipesPalette()
	self.connections = self.connections or {}

	local obj = PlaceObject(pipe[4])
	self:Attach(obj, pipe[3])
	SetObjectPaletteRecursive(obj, cm1, cm2, cm3, cm4)
	self.connections[i] = {obj}
	
	if pipe[5] then
		--decor spot defined
		local dec_data = pipe[5]
		local dec_obj = PlaceObject(dec_data[1])
		
		local idx = 2
		local dec_s_e = dec_data[idx]
		local my_attach = self
		while dec_data[idx] do
			local d = dec_data[idx]
			idx = idx + 1
			if not dec_data[idx] then
				my_attach:Attach(dec_obj, d[1])
			else
				local att = my_attach:GetAttaches()
				for j = 1, #att do
					if att[j]:GetAttachSpot() == d[1] then
						my_attach = att[j]
						break
					end
				end
			end
		end
		
		dec_obj:SetAttachAngle(obj:GetAttachAngle())
		SetObjectPaletteRecursive(dec_obj, cm1, cm2, cm3, cm4)
		table.insert(self.connections[i], dec_obj)
	end
end

function LifeSupportGridObject:ConnectPipe(src_pt, pt)
	local self_dir = HexAngleToDirection(self)
	local q, r = WorldToHex(self)
	local src = point(HexRotate(src_pt:x() - q, src_pt:y() - r, - self_dir)) -- remove the object rotation
	local dir = (6 + HexGetDirection(src_pt, pt) - self_dir) % 6

	for i, pipe in ipairs(self:GetPipeConnections()) do
		if pipe[1] == src and pipe[2] == dir then
			self.connections = self.connections or {}
			if self.connections[i] and self.connections[i][1] then
				break
			end
			
			self:PlacePipeConnection(pipe, i)
			break
		end
	end
	
	self.connections_skin_name = self:GetGridSkinName()
end

function LifeSupportGridObject:DisconnectPipe(src_pt, pt)
	local self_dir = HexAngleToDirection(self)
	local q, r = WorldToHex(self)
	local src = point(HexRotate(src_pt:x() - q, src_pt:y() - r, 6 - self_dir)) -- remove the object rotation
	local dir = (6 + HexGetDirection(src_pt, pt) - self_dir) % 6
	
	for i, pipe in ipairs(self:GetPipeConnections()) do
		if pipe[1] == src and pipe[2] == dir then
			for j = #(self.connections[i] or ""), 1, -1 do
				DoneObject(self.connections[i][j])
				self.connections[i][j] = nil
			end
			self.connections[i] = nil
			break
		end
	end
end

function LifeSupportGridObject:HasPipes()
	local has_pipes = false
	if self.connections and next(self.connections) then
		has_pipes = true
	end
	return has_pipes
end

function LifeSupportGridObject:RecreatePipeConnections()
	local conns = self.connections or empty_table
	local pcs = self:GetPipeConnections()
	
	for i, t in pairs(conns) do
		for j = #t, 1, -1 do
			t[j]:Detach()
			DoneObject(t[j])
			t[j] = nil
		end
		assert(pcs[i], "Skin " .. self:GetGridSkinName() .. " does not have all pipe connections defined for building " .. self.template_name .. "!")
		if pcs[i] then
			self:PlacePipeConnection(pcs[i], i)
		end
	end
	
	if self:HasMember("DeduceAndReapplyDustVisualsFromState") then
		self:DeduceAndReapplyDustVisualsFromState()
	end
end

function LifeSupportGridObject:UpdateVisuals(supply_resource, change_building_ents)
	local t_n = self.template_name or self.class
	local data = BuildingGridSkins[t_n]
	local gsn = self:GetGridSkinName()
	if change_building_ents then
		if data then
			local member_name = data[gsn]
			if member_name then
				local e = self:GetEntity()
				local template = BuildingTemplates[t_n] or g_Classes[t_n]
				local new_skin = template[member_name] or ""
				
				if new_skin ~= "" then
					if e ~= new_skin then
						self:ChangeSkin(new_skin)
					end
				end
			end
		end
	end
	
	if self.connections_skin_name ~= gsn then
		self:RecreatePipeConnections()
		self.connections_skin_name = gsn
	end
end

function LifeSupportGridObject:GetGridSkinName()
	return self.water and self.water.grid and self.water.grid.element_skin or "Default"
end

function LifeSupportGridObject:GetEntityNameForPipeConnections(grid_skin_name)
	--default skin, all is well
	if not grid_skin_name then
		return self.entity
	end
	
	local t_n = self.template_name or self.class
	local data = BuildingGridSkins[t_n]
	local template = BuildingTemplates[t_n] or g_Classes[t_n]
	--we have special entity for this skin so we are already cached in a diff key
	if data and data[grid_skin_name] then 
		return template[data[grid_skin_name]]
	end
	
	--we use our regular entity for this grid skin but we needed it cached elsewhere (it has diff data)
	return grid_skin_name ~= "Default" and self.entity .. grid_skin_name or self.entity
end
----- LifeSupportGridElement
DefineClass.LifeSupportGridElement = {
	__parents = { "LifeSupportGridObject", "Shapeshifter", "Constructable", "DustGridElement", "SupplyGridSwitch", "BreakableSupplyGridElement", "SkinChangeable" },
	game_flags = { gofPermanent = true },
	is_tall = true,
	properties = {
		{name = "Pillar", id = "pillar", editor = "number"},
		{name = "Connections", id = "conn", editor = "number"},
	},
	pillar = false,
	last_visual_pillar = false, --cached pillar val on last updatevisuals, so we can early exit the func and not cause flickering with large grids under construction
	chain = false,
	conn = -1,
	force_hub = false,
	--construction
	construction_cost_Metals = 1 * const.ResourceScale,
	build_points = 1000,
	--construction ui
	description = T(3972, "Transport Water and Oxygen."),
	display_name = T(1064, "Life Support Pipe"),
	display_name_pl = T(11674, "Life Support Pipes"),
	display_icon = "UI/Icons/Buildings/pipes.tga", --pin dialog icon during construction
	
	enum_flags = { efApplyToGrids = false },
	construction_connections = -1,
	
	supply_element = "water",
	
	--switch visuals
	on_state = "idle",
	off_state = "off",
	switch_anim = "switch",
	
	--
	connections_skin_name = false,
	--
	skin_before_switch = false, --switch specific, here for inheritence reasons
	construction_grid_skin = false,
	rename_allowed = false,
}

function LifeSupportGridElement:GetGridSkinName()
	return self.water and self.water.grid and self.water.grid.element_skin or self.skin_before_switch or "Default"
end

function LifeSupportGridElement:GetSkinFromGrid(str)
	return TubeSkins[str or self:GetGridSkinName()]
end

function LifeSupportGridElement:GetSkins()
	local skins, palettes = {}, {}
	local palette = {GetPipesPalette()}
	for k, v in pairs(TubeSkins) do
		if IsDlcAvailable(v.dlc) then
			table.insert(skins, k)
			table.insert(palettes, palette)
		end
	end
	
	return skins, palettes
end

function LifeSupportGridElement:GetNextSkinIdx(skins)
	local sn = self:GetGridSkinName()
	local skin_idx = (table.find(skins, sn) or 0) + 1
	if skin_idx > #skins then
		skin_idx = 1
	end
	return skin_idx
end

function LifeSupportGridElement:ChangeSkin(skin_name)
	local g = self.water and self.water.grid
	if g then
		g:ChangeElementSkin(skin_name, true)
	end
end

function LifeSupportGridElement:GameInit()
	if self.entity == false then
		self:UpdateVisuals()
	end
	self:SetPillar(self.pillar)
end

function LifeSupportGridElement:CreateLifeSupportElements()
	self.water = SupplyGridElement:new{ building = self, is_cable_or_pipe = true }
end

function LifeSupportGridElement:GetInfopanelTemplate()
	if self:IsKindOf("ConstructionSite") then return "ipBuilding" end
	if self.is_switch then return "ipSwitch" end
	if self.auto_connect then return "ipLeak" end
	if self.pillar then return "ipPillaredPipe" end
end

function LifeSupportGridElement:GetDisplayName()
	if self.repair_resource_request then
		return T(3891, "Pipe Leak")
	else
		return SupplyGridSwitch.GetDisplayName(self)
	end
end

local full_connections = { 63 * 256 + 128 }
local full_connections_switched = { 63 * 256 + 128 + 16384}
local pipe_connections = { (1 + 8) * 256 + 128 }
local pipe_connections_switched = { (1 + 8) * 256 + 128 + 16384}

function LifeSupportGridElement:GetShapeConnections()
	local q, r = WorldToHex(self)
	local bld = HexGetBuilding(q, r)
	return (bld == nil or bld == self) and not self.chain and (self.switched_state and full_connections_switched or full_connections) or (self.switched_state and pipe_connections_switched or pipe_connections)
end

function LifeSupportGridElement:MakePipe(dir, dont_demote, skin)
	if self.pillar then
		self:SetPillar(nil)
		self.conn = nil
	end
	self:DestroyAttaches(PlugsAndSeams)
	skin = skin or self:GetSkinFromGrid()
	self:ChangeEntity(skin.Tube)
	self:SetAngle(dir * 60 * 60)
	
	--deselect
	if SelectedObj == self then
		SelectObj()
	end
	if self:IsPinned() then
		self:TogglePin()
	end
	
	if not dont_demote and self.water and self.water.grid then -- we're already connected
		self:DemoteConnectionMask(dir)
	end
end
--makes connection mask represent 2 side possible connection
function LifeSupportGridElement:DemoteConnectionMask(dir)
	if self.pillar then return end --cant demote pillars
	dir = dir or self:GetAngle() / (60 * 60)
	local conn = HexGridGet(SupplyGridConnections["water"], self)
	if conn == 0 then return end --we aint initialized yet, we'll figure out our potential later.
	local pipe_conn = bor(shift(1, dir), dir < 3 and shift(1, dir + 3) or shift(1, dir - 3))
	--63, skip 7th bit (is constr bit), skip 8th bit (ConnectorMask)
	assert(band(conn, bnot(pipe_conn), 63) == 0, "Potential connection terminated, while real connection exists!") -- make sure we're not removing actual connections
	conn = maskset(conn, 63 * 256, shift(pipe_conn, 8)) -- replace pipe potential connections
	HexGridSet(SupplyGridConnections["water"], self, conn)
end
--makes connection mask represent 6 side possible connection
function LifeSupportGridElement:PromoteConnectionMask()
	local conn = HexGridGet(SupplyGridConnections["water"], self)
	if conn == 0 then return end --we aint initialized yet, we'll figure out our potential later.
	conn = bor(conn, 63 * 256) -- mark all directions as potential connections
	HexGridSet(SupplyGridConnections["water"], self, conn)
end

function LifeSupportGridElement:CanMakePillar(excluded_obj)
	local q, r = WorldToHex(self)
	local bld = HexGetBuilding(q, r)
	local is_buildable = IsBuildableZoneQR(q, r)
	return self.pillar or self.force_hub or (is_buildable and (bld == nil or excluded_obj and bld == excluded_obj))
end

function LifeSupportGridElement:MakePillar(pipe_counter, excluded_obj)
	assert(self:CanMakePillar(excluded_obj), "Pipe pillar is about to corrupt the connection grids!")
	if not self.pillar then
		local grid = self.water and self.water.grid
		if grid then -- we're already connected
			self:PromoteConnectionMask()
			
			grid.update_visuals = true
			grid:UpdateGrid() --TODO: when is this pointless?
		end
	end
	local pillar = self.pillar == max_int and self.pillar or pipe_counter or self.pillar or true
	self:SetPillar(pillar)
end

function LifeSupportGridElement:SetPillar(pillar)
	self.pillar = pillar or nil
	if pillar then
		Flight_Mark(self)
	else
		Flight_Unmark(self)
	end
end

function LifeSupportGridElement:MakeSwitch(constr_site)
	self:MakePillar(0, constr_site) --pipe counter is number so we cannot demote, ever, (although that cased is shielded)
	SupplyGridSwitch.MakeSwitch(self, constr_site)
end

function LifeSupportGridElement:GetNumberOfConnections()
	local conn = HexGridGet(SupplyGridConnections["water"], self)
	
	local count, first, second = 0
	for dir = 0, 5 do
		if testbit(conn, dir) then
			second = second or first and dir
			first = first or dir
			count = count + 1
		end
	end
	
	return count, first, second
end

GlobalVar("QueuedEnableBlockPasObjects", {})

local function ProcessQueuedBlockPassObjects()
	SuspendPassEdits("QueuedBlockPassObjects")
	for i = 1, #QueuedEnableBlockPasObjects do
		if IsValid(QueuedEnableBlockPasObjects[i]) then --cascade deletion can cause this
			QueuedEnableBlockPasObjects[i]:SetEnumFlags(const.efApplyToGrids)
		end
	end
	QueuedEnableBlockPasObjects = {}
	ResumePassEdits("QueuedBlockPassObjects")
end

function QueueForEnableBlockPass(obj)
	table.insert(QueuedEnableBlockPasObjects, obj)
	DelayedCall(0, ProcessQueuedBlockPassObjects)
end

function LifeSupportGridElement:CanMakeSwitch(constr_site)
	return SupplyGridSwitch.CanMakeSwitch(self) and self:CanMakePillar(constr_site)
end

function LifeSupportGridElement:UpdateVisuals(supply_resource)
	local conn = HexGridGet(SupplyGridConnections["water"], self)
	local sn = self:GetGridSkinName()
	if self.conn == conn and self.pillar == self.last_visual_pillar and sn == self.connections_skin_name then return false end
	self.conn = conn
	self.last_visual_pillar = self.pillar
	self.connections_skin_name = sn
	local skin = self:GetSkinFromGrid(sn)
	
	if not self.is_switch and not self.pillar and not self.force_hub then
		if self:GetEntity() ~= skin.Tube then --happens when loading gofPermanent tubes.
			self:ChangeEntity(skin.Tube)
		end
		if self.chain then
			self:SetPos(self:GetPos():SetZ(self.chain.base))
			self:SetChainParams(self.chain.delta, self.chain.index, self.chain.length)
		end
		
		local cm1, cm2, cm3, cm4 = GetPipesPalette()
		SetObjectPaletteRecursive(self, cm1, cm2, cm3, cm4)
		return false
	end
	
	local count, first, second = self:GetNumberOfConnections()
	self:DestroyAttaches(PlugsAndSeams)
	local is_ubuildable_chunk_pillar = type(self.pillar) == "number" and self.pillar == max_int
	if not self.force_hub and not is_ubuildable_chunk_pillar and not self.is_switch and count == 2 and (second - first) == 3 then -- tube pillar
		if type(self.pillar) == "number" then --should be pillar no matter what
			self:ChangeEntity(skin.TubePillar)
			self:SetAngle(first * 60 * 60)
		else
			--revert to regular pipe, keep full conn mask so others may attach to us in the future.
			self:MakePipe(first, true)
			self.conn = conn
		end
	else
		self:ChangeEntity(self.is_switch and skin.TubeSwitch or skin.TubeHub)
		if self:GetAngle() ~= 0 then
			self:SetAngle(0)
		end
		
		local my_q, my_r = WorldToHex(self)
		for dir = 0, 5 do
			if testbit(conn, dir) then
				local dq, dr = HexNeighbours[dir + 1]:xy()
				local pipe = HexGetPipe(my_q + dq, my_r + dr)
				local plug = PlaceObject(pipe and pipe.chain and pipe.chain.delta ~= 0 and skin.TubeJointSeam or skin.TubeHubPlug, nil, const.cfComponentAttach)
				if self:GetGameFlags(const.gofUnderConstruction) ~= 0 then
					plug:SetGameFlags(const.gofUnderConstruction)
				end
				plug:SetEnumFlags(const.efSelectable)
				self:Attach(plug)
				plug:SetAttachAngle(180 * 60 + dir * 60 * 60)
				
				if pipe and pipe.chain and pipe.chain.delta ~= 0 then
					local tube_joint = PlaceObject(skin.TubeJoint, nil, const.cfComponentAttach)
					plug:Attach(tube_joint, plug:GetSpotBeginIndex("Joint"))
					tube_joint:SetAttachAxis(axis_y)
					local dist = const.GridSpacing * pipe.chain.length
					local angle = acos(MulDivRound(4096, dist, sqrt(pipe.chain.delta ^ 2 + dist ^ 2)))

					if (pipe.chain.delta < 0) == (dir >= 3) then
						tube_joint:SetAttachAngle(angle)
					else
						tube_joint:SetAttachAngle(-angle)
					end
					
					if plug:GetGameFlags(const.gofUnderConstruction) ~= 0 then
						tube_joint:SetGameFlags(const.gofUnderConstruction)
					end
					tube_joint:SetEnumFlags(const.efSelectable)
				end
			end
		end
	end
	
	--during init we are always a pillar due to being alone, so skip block pass first time around.
	if self.pillar and self:GetEnumFlags(const.efApplyToGrids) == 0 then
		QueueForEnableBlockPass(self)
	end
	
	local cm1, cm2, cm3, cm4 = GetPipesPalette()
	SetObjectPaletteRecursive(self, cm1, cm2, cm3, cm4)
	self:AddDust(0) --refresh dust visuals

	return true
end
--mostly copy paste from ElectricityGridElement
function LifeSupportGridElement:TryConnectInDir(dir)
	local conn = self.conn
	if not testbit(conn, dir) and testbit(shift(conn, -8), dir) then --not connected yet and has potential
		local dq, dr = HexNeighbours[dir + 1]:xy()
		local my_q, my_r = WorldToHex(self)
		local obj = HexGetPipe(my_q + dq, my_r + dr)
		if obj and obj.water then
			local his_conn = HexGridGet(SupplyGridConnections["water"], obj)
			if testbit(shift(his_conn, -8), dir) then --he has ptoential
				WaterGrid:CreateConnection(point(my_q, my_r), point(my_q + dq, my_r + dr), self, obj)
					
				if self.class == obj.class and self.water.grid ~= obj.water.grid then --both constr or both finished but diff grids, merge
					local my_grid_count = #self.water.grid.elements
					local his_grid_count = #obj.water.grid.elements
					local my_grid_has_more_elements = my_grid_count > his_grid_count
					MergeGrids(my_grid_has_more_elements and self.water.grid or obj.water.grid,
									my_grid_has_more_elements and obj.water.grid or self.water.grid)
				elseif self.class ~= obj.class then --constr grid vs real grid, acknowledge conn
					ConnectGrids(self.water, obj.water)
				end
			end
		end
	end
end

function LifeSupportGridElement:GetFlattenShape()
	return FallbackOutline
end

function LifeSupportGridElement:CanBreak()
	if UICity:IsTechResearched("SuperiorPipes") then
		return false
	end
	return BreakableSupplyGridElement.CanBreak(self)
end

const.SupplyGridElementsAllowUnbuildableChunksPipes = true

function PlacePipeLine(city, start_q, start_r, dir, steps, test, elements_require_construction, input_constr_grp, input_data, skin_name)
	local pillar_spacing = g_Consts.PipesPillarSpacing
	local last_pillar = 0
	local dq, dr = HexNeighbours[dir + 1]:xy()
	local z = const.InvalidZ
	local connect_dir = dir < 3 and dir or dir - 3
	local angle = connect_dir * 60 * 60
	-- try to connect with previous pipe strip
	local pipe = HexGetPipe(start_q, start_r)
	local next_pipe = HexGetPipe(start_q + dq, start_r + dr) --if there is a next pipe we shouldnt demote to tube since connections are already set.
	if pipe and type(pipe.pillar) == "number" and pipe.pillar ~= 0 and not next_pipe then -- there is a last pilar in a pipe line
		local conn = HexGridGet(SupplyGridConnections["water"], start_q, start_r)
		if band(conn, 63) == shift(1, dir > 2 and dir - 3 or dir + 3) then -- in our direction
			if pipe.pillar ~= max_int then
				last_pillar = pipe.pillar
				if not test then
					pipe:MakePipe(dir) -- convert that pillar to a pipe - we will continue the pipe line
				end
			end
		end
	end
	
	local construction_group = false
	local cs_grp_counter_for_cost = 1
	local cs_grp_elements_in_this_group = 0
	local cs_chunk_grp_counter_for_cost = 0
	if not test and elements_require_construction or input_constr_grp then
		if input_constr_grp then
			construction_group = input_constr_grp
			cs_grp_counter_for_cost = cs_grp_counter_for_cost - 1
			cs_grp_elements_in_this_group = #input_constr_grp - 1
		else
			construction_group = CreateConstructionGroup("LifeSupportGridElement", point(HexToWorld(start_q, start_r)), 3, not elements_require_construction)
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
	local has_group_with_no_hub = false
	local current_group_has_hub = false
	local last_element_found_hub = false
	local current_chunk_group_has_hub = false
	local last_non_chunk_element = false
	local total_chunk_cost = 0
	
	if input_data and #input_data > 0 then
		last_placed_data_cell = input_data[#input_data]
		last_pass_idx = last_placed_data_cell.idx
		last_status = last_placed_data_cell.status
		cs_grp_counter_for_cost = input_data.cs_grp_counter_for_cost or cs_grp_counter_for_cost
		cs_chunk_grp_counter_for_cost = input_data.cs_chunk_grp_counter_for_cost or cs_chunk_grp_counter_for_cost
		cs_grp_elements_in_this_group = Max((input_data.cs_grp_elements_in_this_group or cs_grp_elements_in_this_group) - 1, 0)
		has_group_with_no_hub = input_data.has_group_with_no_hub
		current_group_has_hub = input_data.current_group_has_hub
		local input_lnce = input_data.last_non_chunk_element
		last_non_chunk_element = input_lnce and input_lnce == #input_data and 0 or not not input_lnce
		if input_data.last_group_had_no_hub then
			has_group_with_no_hub = false
		end
	end
	
	--preprocess
	local data = {} --step = { q, r, status }, 
	local unbuildable_chunks = {} --unbuildable_chunks = {chunk_start, chunk_end, status}
	local obstructors = {}
	local all_rocks = {}
	local chunk_idx = 0
	local can_build_anything = false
	local chunk_has_blocked_members = false
	
	for i = 0, steps do
		local q = start_q + i * dq
		local r = start_r + i * dr
		local bld = HexGetBuilding(q, r)
		local cable = HexGetCable(q, r)
		local pipe = HexGetPipe(q, r)
		local is_buildable = IsBuildableZoneQR(q, r)
		local world_pos = point(HexToWorld(q, r))
		local surf_deps = is_buildable and HexGetUnits(nil, nil, world_pos, 0, nil, function(o) return not obstructors or not table.find(obstructors, o) end, "SurfaceDeposit") or empty_table
		local rocks = is_buildable and HexGetUnits(nil, nil, world_pos, 0, false, nil, "WasteRockObstructor") or empty_table
		local stockpiles = is_buildable and HexGetUnits(nil, nil, world_pos, 0, false, function(obj) return obj:GetParent() == nil and IsKindOf(obj, "DoesNotObstructConstruction") and not IsKindOf(obj, "Unit") end, "ResourceStockpileBase") or empty_table
		local pillar = is_buildable and (i + last_pillar) % pillar_spacing or nil
		pillar = pillar == 0 and pillar or is_buildable and i == steps and pillar or nil
		
		data[i] = i == 0 and last_placed_data_cell ~= nil and last_placed_data_cell or {q = q, r = r, can_make_pillar = true, status = SupplyGridElementHexStatus.clear, cable = cable, rocks = rocks, stockpiles = stockpiles, pipe = pipe, pillar = pillar, idx = last_pass_idx + i, bld = bld}
		data[i].place_construction_site = elements_require_construction or construction_group or #rocks > 0 or #stockpiles > 0
		data[i].chunk = data[i].chunk or unbuildable_chunks[chunk_idx] and (not unbuildable_chunks[chunk_idx].chunk_end or unbuildable_chunks[chunk_idx].chunk_end < 0) and unbuildable_chunks[chunk_idx] or nil
		data[i].pillar = not data[i].chunk and pillar or nil
		
		if pillar then
			table.append(all_rocks, rocks)
		end
		
		--test hex
		if bld then
			if data[i].pillar or bld.is_tall then
				table.insert(obstructors, bld)
				data[i].status = SupplyGridElementHexStatus.blocked
			end
			data[i].can_make_pillar = false
		end
		
		if pipe and not pipe:CanMakePillar() then
			if bld then
				table.insert_unique(obstructors, bld)
			end
			table.insert(obstructors, pipe)
			data[i].status = SupplyGridElementHexStatus.blocked
			data[i].can_make_pillar = false
		end
		
		if data[i] ~= last_placed_data_cell and pipe and construction_group and table.find(construction_group, pipe) then
			cs_grp_elements_in_this_group = cs_grp_elements_in_this_group - 1
		end
		
		if surf_deps and #surf_deps > 0 then
			if data[i].pillar then
				table.append(obstructors, surf_deps)
				data[i].status = SupplyGridElementHexStatus.blocked
			else
				data[i].can_make_pillar = false
			end
		end
		
		if cable and cable.pillar then
			table.insert(obstructors, cable)
			data[i].status = SupplyGridElementHexStatus.blocked
		end
		
		if not is_buildable then
			data[i].status = const.SupplyGridElementsAllowUnbuildableChunksPipes and SupplyGridElementHexStatus.unbuildable or SupplyGridElementHexStatus.unbuildable_blocked
			data[i].can_make_pillar = false
		end
		
		if not const.SupplyGridElementsAllowUnbuildableChunksPipes and last_status == SupplyGridElementHexStatus.unbuildable_blocked then
			data[i].status = SupplyGridElementHexStatus.unbuildable_blocked
		end
		
		--analyze status and build unbuildable chunks
		if last_status then
			if (last_status == SupplyGridElementHexStatus.clear
				and data[i].status == SupplyGridElementHexStatus.unbuildable) --normal behavior				
				or (last_placed_data_cell and i == 1 and 
					(data[i].status == SupplyGridElementHexStatus.unbuildable) and
					(last_status == SupplyGridElementHexStatus.blocked or last_status == SupplyGridElementHexStatus.unbuildable))--sepcifically for placement tool visuals, catch turn
				or (data[i].chunk == nil 
					and ((last_status == SupplyGridElementHexStatus.unbuildable and data[i].status == SupplyGridElementHexStatus.clear)
						or (last_status == SupplyGridElementHexStatus.blocked and data[i].status == SupplyGridElementHexStatus.unbuildable)))then --sepcifically for placement tool visuals, catch full unbuildable chunks so we can visualise them
				--it's a new unbuildable chunk
				chunk_idx = chunk_idx + 1
				
				local chunk = { chunk_start = i + last_pass_idx - 1, chunk_end = -(i + last_pass_idx), status = SupplyGridElementHexStatus.blocked, connect_dir = connect_dir }
				chunk.place_construction_site = data[i].place_construction_site
				
				local start_node = data[i - 1]
				if start_node.chunk then
					start_node.chunk_end = start_node.chunk
					start_node.chunk_end.chunk_end = i + last_pass_idx - 1
				end
				start_node.chunk_start = chunk
				start_node.chunk = chunk
				data[i].chunk = chunk
				chunk.z1 = IsBuildableZoneQR(start_node.q, start_node.r) and GetBuildableZ(start_node.q, start_node.r) or terrain.GetHeight(HexToWorld(start_node.q, start_node.r))
				chunk_has_blocked_members = false
				
				unbuildable_chunks[chunk_idx] = chunk
				
				if start_node.cable and start_node.cable.pillar or
					start_node.pipe and not start_node.pipe:CanMakePillar() or
					not start_node.can_make_pillar then
					--this chunk is blocked
					chunk_has_blocked_members = true
					if start_node.bld then --since we didn't know we are gona be a pillar, we got to append this obstructor
						table.insert(obstructors, start_node.bld)
					end
				elseif not start_node.pillar then
					table.append(all_rocks, start_node.rocks)
				end
				
				cs_grp_elements_in_this_group = cs_grp_elements_in_this_group - 1
				if cs_grp_elements_in_this_group <= 0 then
					cs_grp_elements_in_this_group = 0
					cs_grp_counter_for_cost = Max(cs_grp_counter_for_cost - 1, 0)
					if last_element_found_hub then
						current_group_has_hub = false
						current_chunk_group_has_hub = true
					end
				end
				if last_non_chunk_element == i - 1 then
					last_non_chunk_element = false
				end
				if not start_node.pipe then
					total_chunk_cost = total_chunk_cost + 200 --mark prev
				end
			elseif last_status == SupplyGridElementHexStatus.unbuildable and data[i].status == SupplyGridElementHexStatus.blocked 
				and unbuildable_chunks[chunk_idx] then
				--blocked chunk
				unbuildable_chunks[chunk_idx].status = SupplyGridElementHexStatus.blocked
				chunk_has_blocked_members = true
			end
			if last_status == SupplyGridElementHexStatus.unbuildable and data[i].status == SupplyGridElementHexStatus.clear 
				and unbuildable_chunks[chunk_idx] and unbuildable_chunks[chunk_idx].chunk_end < 0 then
				--possible buildable unbuildable chunk
				unbuildable_chunks[chunk_idx].chunk_end = i + last_pass_idx
				data[i].chunk_end = unbuildable_chunks[chunk_idx]
				unbuildable_chunks[chunk_idx].place_construction_site = unbuildable_chunks[chunk_idx].place_construction_site or data[i].place_construction_site
				unbuildable_chunks[chunk_idx].status = not chunk_has_blocked_members and SupplyGridElementHexStatus.clear or unbuildable_chunks[chunk_idx].status
				
				--ui counters
				cs_chunk_grp_counter_for_cost = cs_chunk_grp_counter_for_cost + 1
				if not current_chunk_group_has_hub then
					has_group_with_no_hub = true
				else
					current_chunk_group_has_hub = false
				end
				
				--build z data
				local cell_data = data[unbuildable_chunks[chunk_idx].chunk_start - last_pass_idx]
				local x1, y1 = HexToWorld(cell_data.q, cell_data.r)
				local z1 = unbuildable_chunks[chunk_idx].z1
				local x2, y2 = HexToWorld(q, r)
				local z2 = GetBuildableZ(q, r)
				unbuildable_chunks[chunk_idx].z2 = z2
				unbuildable_chunks[chunk_idx].zd = z2 - z1
				--test for pipe/cable block
				if data[i].cable and data[i].cable.pillar or
					data[i].pipe and not data[i].pipe:CanMakePillar() or 
					not data[i].can_make_pillar then
					unbuildable_chunks[chunk_idx].status = SupplyGridElementHexStatus.blocked
					if bld then
						table.insert(obstructors, bld)
					end
				else
					--test los
					local has_los = CheckLineOfSight(point(x1, y1, z1 + const.GroundOffsetForLosTest), point(x2, y2, z2 + const.GroundOffsetForLosTest))
					if not has_los then
						unbuildable_chunks[chunk_idx].status = SupplyGridElementHexStatus.blocked
					else
						last_pillar = pillar_spacing - (i % pillar_spacing)
					end
				end
				
				if not pillar then
					table.append(all_rocks, rocks)
				end
			end
			if data[i].chunk and data[i].chunk.chunk_end < 0 then
				data[i].chunk.chunk_end = -(i + last_pass_idx)
				local x, y = HexToWorld(q, r)
				data[i].chunk.z2 = IsBuildableZoneQR(q, r) and GetBuildableZ(q, r) or terrain.GetHeight(x, y)
				data[i].chunk.zd = data[i].chunk.z2 - data[i].chunk.z1
			end
		end
		
		if data[i].status == SupplyGridElementHexStatus.unbuildable and not data[i].chunk then
			data[i].status = SupplyGridElementHexStatus.blocked
		end
		
		if not can_build_anything and data[i].status == SupplyGridElementHexStatus.clear then
			if (not last_placed_data_cell or not can_build_anything) and not data[i].pillar and not data[i].can_make_pillar then
				--first buildable should be pillar, hacky tets wether we are the first line override_first_pillar ~= nil
				 data[i].status = SupplyGridElementHexStatus.blocked
			else
				if not last_placed_data_cell and not data[i].pillar and last_pillar == 0 then
					last_pillar = i
					data[i].pillar = 0
				end
				can_build_anything = true
			end
		end
		
		last_element_found_hub = false
		if not data[i].chunk then
			if cs_grp_elements_in_this_group >= const.ConstructiongGridElementsGroupSize then
				cs_grp_counter_for_cost = cs_grp_counter_for_cost + 1
				cs_grp_elements_in_this_group = 1
				
				if not current_group_has_hub then
					has_group_with_no_hub = true
				else
					current_group_has_hub = false
				end
			else
				if cs_grp_elements_in_this_group <= 0 and cs_grp_counter_for_cost <= 0 then
					cs_grp_counter_for_cost = 1
				end
				cs_grp_elements_in_this_group = cs_grp_elements_in_this_group + 1
			end
			
			if not current_group_has_hub and not has_group_with_no_hub then
				if DoesAnyDroneControlServiceAtPoint(world_pos) then
					current_group_has_hub = true
					last_element_found_hub = true
				end
			end
		else
			if not data[i].pipe then
				total_chunk_cost = total_chunk_cost + 200
			end
			if not current_chunk_group_has_hub and not has_group_with_no_hub then
				if DoesAnyDroneControlServiceAtPoint(world_pos) then
					current_chunk_group_has_hub = true
				end
			end
		end
		
		if not last_non_chunk_element and not data[i].chunk then
			last_non_chunk_element = i
		end
		
		last_status = data[i].status
	end
	
	data.cs_grp_counter_for_cost = cs_grp_counter_for_cost
	data.cs_grp_elements_in_this_group = cs_grp_elements_in_this_group
	data.cs_chunk_grp_counter_for_cost = cs_chunk_grp_counter_for_cost
	local total_cost = GetGridElementConstructionCost("LifeSupportGridElement")
	for k, v in pairs(total_cost or empty_table) do
		total_cost[k] = v * cs_grp_counter_for_cost + total_chunk_cost
	end
	
	if not has_group_with_no_hub and 
			((data[steps].chunk and (not data[steps].chunk_end and not current_chunk_group_has_hub or 
				(last_non_chunk_element and not current_group_has_hub))) or
			 not data[steps].chunk and not current_group_has_hub) then
		has_group_with_no_hub = true
		data.last_group_had_no_hub = true
	end
	data.has_group_with_no_hub = has_group_with_no_hub
	data.current_group_has_hub = current_group_has_hub
	
	--find last pillar
	local data_count = #data
	local data_counter = data_count
	while data_counter > 0 
		and ((data[data_counter].status == SupplyGridElementHexStatus.blocked 
			or data[data_counter].status == SupplyGridElementHexStatus.unbuildable_blocked)
		or (not data[data_counter].pillar and not data[data_counter].can_make_pillar)) do
		if data[data_counter].status ~= SupplyGridElementHexStatus.blocked or 
			data[data_counter].status ~= SupplyGridElementHexStatus.unbuildable_blocked then
			data[data_counter].status = const.SupplyGridElementsAllowUnbuildableChunksPipes and SupplyGridElementHexStatus.blocked or SupplyGridElementHexStatus.unbuildable_blocked
		end
		data_counter = data_counter - 1
	end
	if data_counter ~= data_count and data[data_counter] then
		data[data_counter].pillar = (data_counter + last_pillar) % pillar_spacing
		data[data_counter].ignore_this_pillar_in_visuals = true
	end
	
	--fix up chunk end
	if chunk_idx > 0 then
		local last_chunk = unbuildable_chunks[#unbuildable_chunks]
		if last_chunk.chunk_end < 0 then
			last_chunk.chunk_end = abs(last_chunk.chunk_end)
			local node = data[last_chunk.chunk_end - last_pass_idx]
			node.chunk_end = last_chunk
			if not node.pillar then
				table.append(all_rocks, node.rocks)
			end
		end
	end
	
	if test or not can_build_anything then
		--ret
		construction_group = clean_group(construction_group)
		return can_build_anything, construction_group, obstructors, data, unbuildable_chunks, all_rocks, total_cost
	end
	
	--postprocess and place
	local proc_placed_pipe = function(data_idx, cell_data, pillar, chain, cg)
		if cell_data.pipe then
			if pillar then
				local is_chunk_pillar = cell_data.pipe.pillar == max_int
				cell_data.pipe:MakePillar(pillar == max_int and pillar or cell_data.pipe.pillar or true)
				if not is_chunk_pillar and cg and cell_data.pipe:GetGameFlags(const.gofUnderConstruction) ~= 0 and pillar == max_int then
					cell_data.pipe:ChangeConstructionGroup(cg)
				end
			end
			if not chain and data_idx ~= steps then
				cell_data.pipe:TryConnectInDir(dir)
			end
			
			return cell_data.pipe
		end
		
		return false
	end
	
	local place_pipe_cs = function(data_idx, cg, pillar, chain)
		local params = {}
		local cell_data = data[data_idx]
		local c = proc_placed_pipe(data_idx, cell_data, pillar, chain, cg)
		if c then return c end
		local q = cell_data.q
		local r = cell_data.r
		
		params.construction_group = cg
		cg[#cg + 1] = params
		params.connect_dir = connect_dir
		params.pillar = pillar
		params.chain = chain
		params.construction_grid_skin = skin_name
		
		local cs = PlaceConstructionSite(city, "LifeSupportGridElement", point(HexToWorld(q, r)), angle, params, nil, chain)
		if not chain and cell_data.status == SupplyGridElementHexStatus.clear then
			cs:AppendWasteRockObstructors(cell_data.rocks)
			cs:AppendStockpilesUnderneath(cell_data.stockpiles)
		end
		
		cell_data.pipe = cs
		return cs
	end

	local cm1, cm2, cm3, cm4 = GetPipesPalette()
	local place_pipe = function(data_idx, pillar, chain)
		local cell_data = data[data_idx]
		local c = proc_placed_pipe(data_idx, cell_data, pillar, chain)
		if c then return c end
		local q = cell_data.q
		local r = cell_data.r
		local el = LifeSupportGridElement:new{ city = city, connect_dir = connect_dir, pillar = pillar, chain = chain, construction_grid_skin = skin_name }
		local x, y = HexToWorld(q, r)
		el:SetPos(x, y, z)
		el:SetAngle(angle)
		el:SetGameFlags(const.gofPermanent)
		if not chain then
			FlattenTerrainInBuildShape(nil, el)
		end
		SetObjectPaletteRecursive(el, cm1, cm2, cm3, cm4)
		
		cell_data.pipe = el
		return el
	end
	
	chunk_idx = 1
	local i = 0
	local last_placed_obj
	
	while i <= steps do
		local cell_data = data[i]
		local q = cell_data.q
		local r = cell_data.r
		local is_chunk_start = unbuildable_chunks[chunk_idx] and unbuildable_chunks[chunk_idx].chunk_start == (i + last_pass_idx)
		
		if is_chunk_start and unbuildable_chunks[chunk_idx].status == SupplyGridElementHexStatus.clear then
			--place buildable unbuildable chunk
			local chunk_data = unbuildable_chunks[chunk_idx]
			local length = chunk_data.chunk_end - chunk_data.chunk_start - 1
			if chunk_data.place_construction_site then
				--place constr grp, chunks are their own groups
				local chunk_construction_group = CreateConstructionGroup("LifeSupportGridElement", point(HexToWorld(q, r)), 3, not elements_require_construction)
				local chunk_group_leader = chunk_construction_group[1]
				--add pillar 1
				local p1 = place_pipe_cs(i, chunk_construction_group, max_int) --pillar == number means it cant auto demote
				--place the lines
				for j = i + 1, chunk_data.chunk_end - 1 - last_pass_idx do
					local chain = GetChainParams(j + last_pass_idx - chunk_data.chunk_start - 1, length, dir, chunk_data) 
					local pipe = place_pipe_cs(j, chunk_construction_group, nil, chain)
					pipe:SetChainParams(chain.delta, chain.index, chain.length)
				end
				local p2 = place_pipe_cs(chunk_data.chunk_end - last_pass_idx, chunk_construction_group, max_int)
				if chunk_group_leader:CanDelete() then
					--line was already placed
					DoneObject(chunk_group_leader)
				else
					chunk_group_leader.drop_offs = {p1, p2}
					chunk_group_leader.construction_cost_multiplier = (20 * (#chunk_construction_group - 1)) --0.2 per pipe
					last_placed_obj = p2
				end
			else
				--place instant
				local p1 = place_pipe(i, max_int)
				for j = i + 1, chunk_data.chunk_end - 1 - last_pass_idx do
					local chain = GetChainParams(j + last_pass_idx - chunk_data.chunk_start - 1, length, dir, chunk_data) 
					local pipe = place_pipe(j, nil, chain)
					pipe:SetChainParams(chain.delta, chain.index, chain.length)
				end
				local p2 = place_pipe(chunk_data.chunk_end - last_pass_idx, max_int)
				last_placed_obj = p2
			end
			
			i = chunk_data.chunk_end - last_pass_idx
		else
			--place regular cable
			if cell_data.status == SupplyGridElementHexStatus.clear then
				local placed = false
				if cell_data.place_construction_site then
					--make new grp if needed
					if not construction_group or #construction_group > const.ConstructiongGridElementsGroupSize then
						if construction_group and construction_group[1]:CanDelete() then
							DoneObject(construction_group[1])
						end
						
						construction_group = false
						
						--new group
						if elements_require_construction or #data[i].rocks > 0 or #data[i].stockpiles > 0 then
							construction_group = CreateConstructionGroup("LifeSupportGridElement", point(HexToWorld(q, r)), 3, not elements_require_construction)
						end
					end
					
					if construction_group then
						last_placed_obj = place_pipe_cs(i, construction_group, cell_data.pillar)
						placed = last_placed_obj
					end
				end
				if not placed then
					last_placed_obj = place_pipe(i, cell_data.pillar)
				end
			end
		end
		
		--increment counters
		if is_chunk_start then
			if unbuildable_chunks[chunk_idx].status ~= SupplyGridElementHexStatus.clear then
				if unbuildable_chunks[chunk_idx].chunk_end then
					i = unbuildable_chunks[chunk_idx].chunk_end - 1 - last_pass_idx
				else
					i = steps + 1
				end
			end
			
			chunk_idx = chunk_idx + 1
			
			if unbuildable_chunks[chunk_idx] and unbuildable_chunks[chunk_idx].status == SupplyGridElementHexStatus.clear 
				and unbuildable_chunks[chunk_idx].chunk_start == (i + last_pass_idx) then
				--next chunk starts @ this chunk's end
				i = i - 1 
			end
		end
		
		i = i + 1
	end

	construction_group = clean_group(construction_group)
	
	return true, construction_group, obstructors, data, unbuildable_chunks, last_placed_obj, total_cost
end

----- WaterProducer
--[[@@@
@class WaterProducer
Building derived [building template](ModItemBuildingTemplate.md.html) class. Handles water production for a building. All buildings that produce water for the water grid are either of this class or a derived class.
--]]
DefineClass.WaterProducer = {
	__parents = { "Building", "LifeSupportGridObject" },
	properties = {
		{ template = true, id = "water_production", name = T(1065, "Water production"), category = "Water Production", editor = "number", default = 10000, help = Untranslated("This is the amount produced per hour."), scale = const.ResourceScale, modifiable = true },
	},
	
	is_tall = true,
}

function WaterProducer:GameInit()
	if HintsEnabled then
		HintTrigger("HintAirProduction")
	end
	
	if not (g_ActiveHints["HintDomePlacedTooEarly"] or empty_table).disabled then
		local has_one_air_producer
		local a_grids = (self.city or UICity).air
		for i = 1, #a_grids do
			if #a_grids[i].producers > 0 then
				has_one_air_producer = true
				break
			end
		end
		if has_one_air_producer then
			HintDisable("HintDomePlacedTooEarly")
			if HintsEnabled then
				HintTrigger("HintDomes")
			end
		end
	end
end

function WaterProducer:CreateLifeSupportElements()
	self.water = NewSupplyGridProducer(self)
	self.water:SetProduction(self.working and self.water_production or 0)
end

function WaterProducer:OnSetWorking(working)
	Building.OnSetWorking(self, working)
	if self.water then
		self.water:SetProduction(working and self.water_production or 0)
	end
end

function WaterProducer:MoveInside(dome)
	return LifeSupportGridObject.MoveInside(self, dome)
end

function WaterProducer:OnModifiableValueChanged(prop)
	if prop == "water_production" and self.water then
		self.water:SetProduction(self.working and self.water_production or 0)
	end
end

function WaterProducer:ShouldShowNotConnectedToGridSign()
	return self:ShouldShowNotConnectedToLifeSupportGridSign()
end

function WaterProducer:ShouldShowNotConnectedToLifeSupportGridSign()
	local not_under_dome = not self.parent_dome
	if not_under_dome then
		if not self:HasPipes() then
			return true
		end
		if #self.water.grid.consumers <= 0 and #self.water.grid.storages <= 0 then
			return true
		end
	end
	return false
end

function WaterProducer:UpdateAttachedSigns()
	self:AttachSign(self:ShouldShowNotConnectedToLifeSupportGridSign(), "SignNoPipeConnection")
end

function WaterProducer:GetWaterProductionText(short)
	local real_production = self.water.production > 0 and Max(self.water.production - self.water.current_throttled_production, 0) or 0
	local max_production = self.water.production
	return real_production < max_production
		and (short and T{9712, "<water(number1,number2)>", number1 = real_production, number2 = max_production} or T{482, "Water production<right><water(number1,number2)>", number1 = real_production, number2 = max_production})
		or (short and T{9713, "<water(number)>", number = real_production} or T{483, "Water production<right><water(number)>", number = real_production})
end

function WaterProducer:GetUISectionWaterProductionRollover()
	local lines = {
		T{479, "Production capacity<right><water(production)>", self.water},
		T{480, "Production per Sol<right><water(ProductionEstimate)>", self.water},
		T{481, "Lifetime production<right><water(production_lifetime)>", self.water},					
	}	
	AvailableDeposits(self, lines)
	if self:HasMember("wasterock_producer") and self.wasterock_producer then
		lines[#lines +1] = T(469, "<newline><center><em>Storage</em>")
		lines[#lines +1] = T{471, "Waste Rock<right><wasterock(GetWasterockAmountStored,wasterock_max_storage)>", self}
	end
	return table.concat(lines, "<newline><left>")
end



----- AirProducer
--[[@@@
@class AirProducer
Building derived [building template](ModItemBuildingTemplate.md.html) class. Handles air production for a building. All buildings that provide air to the air grid are either of this class or a derived class.
--]]
DefineClass.AirProducer = {
	__parents = { "Building", "LifeSupportGridObject" },
	properties = {
		{ template = true, id = "air_production", name = T(1066, "Oxygen production"), category = "Oxygen production", editor = "number", default = 10000, scale = const.ResourceScale, modifiable = true  },
	},
	
	is_tall = true,
}

function AirProducer:GameInit()
	if not (g_ActiveHints["HintDomePlacedTooEarly"] or empty_table).disabled then
		local has_one_water_producer
		local w_grids = (self.city or UICity).water
		for i = 1, #w_grids do
			if #w_grids[i].producers > 0 then
				has_one_water_producer = true
				break
			end
		end
		if has_one_water_producer then
			HintDisable("HintDomePlacedTooEarly")
			if HintsEnabled then
				HintTrigger("HintDomes")
			end
		end
	end
end

function AirProducer:CreateLifeSupportElements()
	self.air = NewSupplyGridProducer(self)
	self.air:SetProduction(self.working and self.air_production or 0)
end

function AirProducer:OnSetWorking(working)
	Building.OnSetWorking(self, working)
	if self.air then
		self.air:SetProduction(working and self.air_production or 0)
	end
end

function AirProducer:MoveInside(dome)
	return LifeSupportGridObject.MoveInside(self, dome)
end

function AirProducer:OnModifiableValueChanged(prop)
	if prop == "air_production" and self.air then
		self.air:SetProduction(self.working and self.air_production or 0)
	end
end

function AirProducer:ShouldShowNotConnectedToGridSign()
	return self:ShouldShowNotConnectedToLifeSupportGridSign()
end

function AirProducer:ShouldShowNotConnectedToLifeSupportGridSign()
	local not_under_dome = not self.parent_dome
	if not_under_dome then
		if not self:HasPipes() then
			return true
		end
		if #self.air.grid.consumers <= 0 and #self.air.grid.storages <= 0 then
			return true
		end
	end
	return false
end

function AirProducer:UpdateAttachedSigns()
	self:AttachSign(self:ShouldShowNotConnectedToLifeSupportGridSign(), "SignNoPipeConnection")
end

function AirProducer:GetAirProduction()
	return self.air.production
end

function AirProducer:GetUISectionAirProductionRollover()
	return T{484, "Production per Sol<right><air(ProductionEstimate)>", self.air} .. "<newline><left>" ..
	T{485, "Lifetime production<right><air(production_lifetime)>", self.air}
end


----- LifeSupportConsumer
--[[@@@
@class LifeSupportConsumer
Building derived [building template](ModItemBuildingTemplate.md.html) class. Handles air and water consumption. An object of this class may consume only water or only air or both. All buildings that consume air or water in whatever fassion are of this class or a derived class.
--]]
DefineClass.LifeSupportConsumer = {
	__parents = { "Building", "LifeSupportGridObject"},

	properties = {
		{ template = true, id = "water_consumption", name = T(656, "Water consumption"),  category = "Consumption", editor = "number", default = 10000, scale = const.ResourceScale, modifiable = true, min = 0, },
		{ template = true, id = "air_consumption",   name = T(1067, "Oxygen consumption"), category = "Consumption", editor = "number", default = 10000, scale = const.ResourceScale, modifiable = true, min = 0, },
	},
	
	is_tall = true,
	is_lifesupport_consumer = true,
}

function LifeSupportConsumer:CreateLifeSupportElements()
	if self.water_consumption > 0 then
		self.water = NewSupplyGridConsumer(self)
		self.water:SetConsumption(self.water_consumption)
	end
	if self.air_consumption > 0 then
		self.air = NewSupplyGridConsumer(self) or nil
		self.air:SetConsumption(self.air_consumption)
	end
end

function LifeSupportConsumer:SetSupply(resource, amount)
	if resource == "air" and self.air or resource == "water" and self.water then
		self:Gossip("SetSupply", resource, amount)
		self:UpdateWorking()
	end
end

function LifeSupportConsumer:SetPriority(priority)
	Building.SetPriority(self, priority)
	if self.water then self.water:SetPriority(priority) end
	if self.air then self.air:SetPriority(priority) end
end

function LifeSupportConsumer:HasAir()
	local air = self.air
	return self.air_consumption == 0 or (air and air.current_consumption >= air.consumption and self.air_consumption <= air.consumption)
end

function LifeSupportConsumer:HasWater()
	local water = self.water
	return self.water_consumption == 0 or (water and water.current_consumption >= water.consumption and self.water_consumption <= water.consumption)
end

function LifeSupportConsumer:GetWorkNotPossibleReason()
	if not self:HasAir() then
		return "NoOxygen"
	end
	if not self:HasWater() then
		return "NoWater"
	end
	return Building.GetWorkNotPossibleReason(self)
end

function LifeSupportConsumer:MoveInside(dome)
	return LifeSupportGridObject.MoveInside(self, dome)
end

function LifeSupportConsumer:OnModifiableValueChanged(prop)
	if prop == "water_consumption" or prop == "air_consumption" then
		self:UpdateConsumption()
	end
end

function LifeSupportConsumer:NeedsAir()
	local needs_air = false
	if self.air and self.air.consumption > 0 then
		needs_air = true
	end
	return needs_air
end

function LifeSupportConsumer:NeedsWater()
	local needs_water = false
	if self.water and self.water.consumption and self.water.consumption > 0 then
		needs_water = true
	end
	return needs_water
end

function LifeSupportConsumer:ShouldShowNoWaterSign()
	return self:NeedsWater() and self:IsWorkPermitted() and not self:HasWater()
end

function LifeSupportConsumer:ShouldShowNoAirSign()
	return self:NeedsAir() and self:IsWorkPermitted() and not self:HasAir()
end

function LifeSupportConsumer:ShouldShowNotConnectedToGridSign()
	return self:ShouldShowNotConnectedToLifeSupportGridSign()
end

function LifeSupportConsumer:ShouldShowNotConnectedToLifeSupportGridSign()
	local not_under_dome = not self.parent_dome
	if not_under_dome then
		local needs_water, needs_air = self:NeedsWater(), self:NeedsAir()
		if (needs_water or needs_air) and not self:HasPipes() then
			return true
		end
		if needs_water and #self.water.grid.producers <= 0 then
			return true
		end
		if needs_air and #self.air.grid.producers <= 0 then
			return true
		end
	end
	return false
end

function LifeSupportConsumer:UpdateAttachedSigns()
	self:AttachSign(self:ShouldShowNotConnectedToLifeSupportGridSign(), "SignNoPipeConnection")
	if self.water then
		self:AttachSign(self:ShouldShowNoWaterSign(), "SignNoWater")
	end
	if self.air then
		self:AttachSign(self:ShouldShowNoAirSign(), "SignNoOxygen")
	end
end

----- WaterStorage
--[[@@@
@class WaterStorage
Building derived [building template](ModItemBuildingTemplate.md.html) class. Handles water storage.
--]]
DefineClass.WaterStorage = {
	__parents = {"Building", "LifeSupportGridObject"},
	properties = {
		{ template = true, id = "max_water_charge", name = T(29, "Max water consumption while charging"), category = "Storage", editor = "number", default = 1000, help = "This is the amount of water the battery can charge per hour.", scale = const.ResourceScale  },
		{ template = true, id = "max_water_discharge", name = T(1068, "Max water output while discharging"), category = "Storage", editor = "number", default = 1000, help = "This is the amount of air the battery can discharge per hour.", scale = const.ResourceScale  },
		{ template = true, id = "water_conversion_efficiency", name = T(1069, "Conversion efficiency % of water (charging)"), category = "Storage", editor = "number", default = 100, help = "(100 - this number)% will go to waste when charging." },
		{ template = true, id = "water_capacity", name = T(30, "Water Capacity"), editor = "number", category = "Storage", default = 10000, scale = const.ResourceScale, modifiable = true  },
		{ id = "StoredWater", name = T(33, "Stored Water"), editor = "number", default = 0, scale = const.ResourceScale, no_edit = true },
	},
	
	is_tall = true,
}

function WaterStorage:CreateLifeSupportElements()
	self.water = NewSupplyGridStorage(self, self.water_capacity, self.max_water_charge, self.max_water_discharge, self.water_conversion_efficiency, 20)
	self.water:SetStoredAmount(self.StoredWater, "water")
end

function WaterStorage:OnModifiableValueChanged(prop)
	if self.water
		and (prop == "max_water_charge"
		or prop == "max_water_discharge"
		or prop == "water_conversion_efficiency"
		or prop == "water_capacity") then
		
		self.water.charge_efficiency = self.water_conversion_efficiency
		self.water.storage_capacity = self.water_capacity
		if self.water.grid and self.water.current_storage > self.water_capacity then
			local delta = self.water.current_storage - self.water_capacity
			self.water.current_storage = self.water_capacity
			self.water.grid.current_storage = self.water.grid.current_storage - delta
		end
		
		self.water:UpdateStorage()
	end
end

function WaterStorage:MoveInside(dome)
	return LifeSupportGridObject.MoveInside(self, dome)
end

function WaterStorage:OnSetWorking(working)
	Building.OnSetWorking(self, working)

	local water = self.water
	if working then
		water:UpdateStorage()
	else
		water:SetStorage(0, 0)
	end
end

function WaterStorage:ShouldShowNotConnectedToGridSign()
	return self:ShouldShowNotConnectedToLifeSupportGridSign()
end

function WaterStorage:ShouldShowNotConnectedToLifeSupportGridSign()
	local not_under_dome = not self.parent_dome
	if not_under_dome then
		if not self:HasPipes() then
			return true
		end
		if #self.water.grid.producers <= 0 then
			return true
		end
	end
	return false
end

function WaterStorage:UpdateAttachedSigns()
	self:AttachSign(self:ShouldShowNotConnectedToLifeSupportGridSign(), "SignNoPipeConnection")
end

function WaterStorage:CheatFill()
	self.water:SetStoredAmount(self.water_capacity, "water")
end

function WaterStorage:CheatEmpty()
	self.water:SetStoredAmount(0, "water")
end

function WaterStorage:GetStoredWater()
	return self.water.current_storage
end

function WaterStorage:NeedsWater()
	return true
end

function WaterStorage:NeedsAir()
	return false
end

----- AirStorage
--[[@@@
@class AirStorage
Building derived [building template](ModItemBuildingTemplate.md.html) class. Handles air storage.
--]]
DefineClass.AirStorage = {
	__parents = {"Building", "LifeSupportGridObject"},
	properties = {
		{ template = true, id = "max_air_charge", name = T(1070, "Max Oxygen consumption while charging"), category = "Storage", editor = "number", default = 1000, help = "This is the amount of Oxygen the battery can charge per hour.", scale = const.ResourceScale  },
		{ template = true, id = "max_air_discharge", name = T(1071, "Max Oxygen output while discharging"), category = "Storage", editor = "number", default = 1000, help = "This is the amount of Oxygen the battery can discharge per hour.", scale = const.ResourceScale  },
		{ template = true, id = "air_conversion_efficiency", name = T(1072, "Conversion Oxygen efficiency % (charging)"), category = "Storage", editor = "number", default = 100, help = "(100 - this number)% will go to waste when charging." },
		{ template = true, id = "air_capacity", name = T(1073, "Oxygen Capacity"), editor = "number", category = "Storage", default = 10000, scale = const.ResourceScale, modifiable = true  },
		{ id = "StoredAir", name = T(1074, "Stored Air"), editor = "number", default = 0, scale = const.ResourceScale, no_edit = true },
	},
	
	is_tall = true,
}

function AirStorage:CreateLifeSupportElements()
	self.air = NewSupplyGridStorage(self, self.air_capacity, self.max_air_charge, self.max_air_discharge, self.air_conversion_efficiency, 20)
	self.air:SetStoredAmount(self.StoredAir, "air")
end

function AirStorage:OnModifiableValueChanged(prop)
	if self.air
		and (prop == "max_air_charge"
		or prop == "max_air_discharge"
		or prop == "air_conversion_efficiency"
		or prop == "air_capacity") then
		
		self.air.charge_efficiency = self.air_conversion_efficiency
		self.air.storage_capacity = self.air_capacity
		if self.air.grid and self.air.current_storage > self.air_capacity then
			local delta = self.air.current_storage - self.air_capacity
			self.air.current_storage = self.air_capacity
			self.air.grid.current_storage = self.air.grid.current_storage - delta
		end
		
		self.air:UpdateStorage()
	end
end

function AirStorage:OnSetWorking(working)
	Building.OnSetWorking(self, working)

	local air = self.air
	if working then
		air:UpdateStorage()
	else
		air:SetStorage(0, 0)
	end
end

function AirStorage:MoveInside(dome)
	return LifeSupportGridObject.MoveInside(self, dome)
end

function AirStorage:ShouldShowNotConnectedToGridSign()
	return self:ShouldShowNotConnectedToLifeSupportGridSign()
end

function AirStorage:ShouldShowNotConnectedToLifeSupportGridSign()
	local not_under_dome = not self.parent_dome
	if not_under_dome then
		if not self:HasPipes() then
			return true
		end
		if #self.air.grid.producers <= 0 then
			return true
		end
	end
	return false
end

function AirStorage:UpdateAttachedSigns()
	self:AttachSign(self:ShouldShowNotConnectedToLifeSupportGridSign(), "SignNoPipeConnection")
end

function AirStorage:CheatFill()
	self.air:SetStoredAmount(self.air_capacity, "air")
end

function AirStorage:CheatEmpty()
	self.air:SetStoredAmount(0, "air")
end

function AirStorage:GetStoredAir()
	return self.air.current_storage
end

function AirStorage:NeedsWater()
	return false
end

function AirStorage:NeedsAir()
	return true
end

----- StorageWithIndicator
--[[@@@
@class StorageWithIndicator
Building derived [building template](ModItemBuildingTemplate.md.html) class. Helper class that manages storage building animated attachement according to stored amount. For example the WaterTank class inherits both this class and the [WaterStorage](LuaFunctionDoc_WaterStorage.md.html) class.
--]]
local StorageIndicatorAnimDuration = 3333 --100 frames at 30fps

DefineClass.StorageWithIndicators = {
	__parents = { "Building" },
	indicated_resource = false,
	indicator_class = false,
}

function StorageWithIndicators:GameInit()
	self:ResetIndicatorAnimations()
end

function StorageWithIndicators:ResetIndicatorAnimations(indicator_class)
	indicator_class = indicator_class or self.indicator_class
	for _,attach in ipairs(self:GetAttaches(indicator_class) or empty_table) do
		attach:SetAnimSpeed(1, 0)
		attach:SetAnimPhase(1, 0)
	end
end

function StorageWithIndicators:BuildingUpdate(dt)
	--Happens once every 30 seconds (see Building.building_update_time)
	self:UpdateIndicators()
end

function StorageWithIndicators:OnSkinChanged()
	Building.OnSkinChanged(self)
	self:ResetIndicatorAnimations()
	self:UpdateIndicators()
end

function StorageWithIndicators:UpdateIndicators()
	local res = self.indicated_resource
	res = res and self[res]
	if not res then return end
	for _,attach in ipairs(self:GetAttaches(self.indicator_class) or empty_table) do
		local phase = MulDivRound(res.current_storage, StorageIndicatorAnimDuration, res.storage_capacity)
		attach:SetAnimPhase(1, phase)
	end
end

function OnMsg.DataLoaded()
	local descendants = ClassDescendantsList("StorageWithIndicators")
	local idle_state_idx = GetStateIdx("idle")
	
	--tracks problems with descendants that do not have an entity assigned
	local unassigned_problems = {}
	--tracks problems with indicator entities with incorrect anim. duration
	local duration_problems = {}
	
	for _,class in ipairs(descendants) do
		local classdef = g_Classes[class]
		--doesn't have an indicator class
		if classdef.indicator_class == false then
			unassigned_problems[class] = true
		else
			local indicator_class = g_Classes[classdef.indicator_class]
			local indicator_entity = indicator_class:GetEntity()
			local dur = GetAnimDuration(indicator_entity, idle_state_idx)
			--has incorrect animation duration
			if dur ~= StorageIndicatorAnimDuration then
				duration_problems[indicator_entity] = true
			end
		end
	end
	
	if next(unassigned_problems) then
		print(string.format("WARNING: The following resource storage buildings should have indicators, but do not have an assigned indicator class:\n%s",
			table.concat(table.keys(unassigned_problems), ", ")))
	end
	if next(duration_problems) then
		print(string.format("WARNING:The following entites are used for resource storage building indicators, but have incorrect animation durations:\n%s",
			table.concat(table.keys(duration_problems), ", ")))
		print(string.format("Their animation duration must be %s", StorageIndicatorAnimDuration))
	end
end

----- WaterTank

DefineClass.WaterTank = {
	__parents = { "WaterStorage", "StorageWithIndicators", "ColdSensitive" },
	indicated_resource = "water",
	indicator_class = "WaterTankFloat",
	building_update_time = 10000,
}

----- WaterTankLarge

DefineClass.WaterTankLarge = {
	__parents = { "WaterStorage", "StorageWithIndicators", "ColdSensitive" },
	indicated_resource = "water",
	indicator_class = "WaterTankLargeFloat",
	building_update_time = 10000,
}

----- OxygenTank

DefineClass.OxygenTank = {
	__parents = { "AirStorage", "StorageWithIndicators" },
	indicated_resource = "air",
	indicator_class = "AirTankArrow",
}

DefineClass.OxygenTankLarge = {
	__parents = { "OxygenTank" },
}

function OxygenTankLarge:GetEntityNameForPipeConnections(grid_skin_name)
	return grid_skin_name ~= "Default" and "Moxie" .. grid_skin_name or "Moxie"
end
