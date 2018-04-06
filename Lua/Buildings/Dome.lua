const.DomeCap = Platform.desktop and max_int or 20
local max_visible_fractures = 4
local max_visible_leaks = 4

function AreDomesCapped()
	return #(UICity.labels.Domes or "") >= const.DomeCap
end

--fx control objs
DefineClass.ScrollableUV = { --todo: move me
	__parents = { "Object", "ComponentCustomData" },
	entity = "Dome_WaterFlow",
	scroll_speed = 1000,
}

function ScrollableUV:Init()
	self:SetCustomData(0, self.scroll_speed)
end

function ScrollableUV:SetScrollSpeed(v)
	self.scroll_speed = v
	self:SetCustomData(0, self.scroll_speed)
end

local stat_scale = const.Scale.Stat
local max_stat = const.Scale.Stat * 100

DefineClass.DomeInterior = {
	__parents = { "Object", "DoesNotObstructConstruction" },
	dome = false,
	is_tall = false, --fixes asserts when dragging pipes around.
}

DefineClass.BlockingDomeInterior = {
	__parents = { "Object" },
	dome = false,
	is_tall = false, --fixes asserts when dragging pipes around.
}
GlobalVar("g_DomeVersion", 0)
GlobalVar("g_DomeToDomeDist", {}, weak_keys_meta)
local dome_walk_dist = const.ColonistMaxDomeWalkDist

local function ResolveDome(bld)
	if IsPoint(bld) then return GetDomeAtPoint(bld)
	elseif IsKindOf(bld, "Dome") then return bld
	elseif IsKindOf(bld, "Unit") then return bld.current_dome
	elseif IsKindOf(bld, "Building") then return bld.parent_dome
	else return GetDomeAtPoint(bld:GetPos())
	end
end

local function ResolvePos(bld1, bld2)
	local pos
	if IsPoint(bld1) then
		pos = bld1
	else
		if IsKindOf(bld1, "Unit") then
			bld1 = bld1.current_dome or bld1.holder or bld1
		end
		if IsValid(bld1) then
			if IsKindOf(bld1, "Building") then
				bld1 = bld1.parent_dome or bld1
				local entrance
				entrance, pos = bld1:GetEntrance(bld2)
				pos = pos or bld1:GetSpotPos(bld1:GetNearestSpot("idle", "Workdrone", bld2))
			end
			pos = pos or bld1:GetPos()
		end
	end
	return pos and pos ~= InvalidPos() and GetPassablePointNearby(pos)
end

local function CheckDist(bld1, bld2, min_dist, force_no_passages)
	local p1, p2 = ResolvePos(bld1, bld2), ResolvePos(bld2, bld1)
	if not p1 or not p2 then
		return false, max_int
	end
	if p1 == p2 then
		return true, 0
	end
	local dist = p1:Dist2D(p2)
	local passage = not force_no_passages and AreDomesConnectedWithPassageDeep(ResolveDome(bld1), ResolveDome(bld2)) or false
	if dist > min_dist then
		return passage, dist, true
	end
	local has_path, len, pt_pf = PathLenCached(p1, Colonist.pfclass, p2)
	return has_path and len <= min_dist or passage, len
end

function UpdateDistToDomes(cur_dome, action)
	local map = g_DomeToDomeDist
	if action == "remove" then
		for _, dome in ipairs(cur_dome.city.labels.Dome or empty_table) do		
			if dome ~= cur_dome then
				map[dome][cur_dome] = nil
			end
		end
		map[cur_dome] = nil
		return
	end
	map[cur_dome] = map[cur_dome] or setmetatable({}, weak_keys_meta)
	for _, dome in ipairs(cur_dome.city.labels.Dome or empty_table) do
		if dome ~= cur_dome then
			local data = map[cur_dome][dome]
			local too_far = data and data[3]
			if not too_far then
				data = {CheckDist(cur_dome, dome, dome_walk_dist)}
				map[cur_dome][dome] = data
				map[dome] = map[dome] or setmetatable({}, weak_keys_meta)
				map[dome][cur_dome] = data
			end
		end	
	end
end

function IsInWalkingDist(bld1, bld2, min_dist)
	bld1 = ResolveDome(bld1) or bld1
	bld2 = ResolveDome(bld2) or bld2
	if bld1 == bld2 then
		return true, 0
	end
	local dist_map = g_DomeToDomeDist[bld1]
	local dist = dist_map and dist_map[bld2]
	if dist then
		--only when bld1 and bld2 are domes can there be cache, hence
		return dist[1] or AreDomesConnectedWithPassageDeep(bld1, bld2), dist[2]
	end
	return CheckDist(bld1, bld2, min_dist or dome_walk_dist)
end

DefineClass.Dome = {
	__parents = { "ElectricityConsumer", "LifeSupportConsumer", "LabelContainer", "ShuttleLanding", "Renamable" },
	
	enum_flags = { efWalkable = true },
	
	properties = {
		{ id = "name", name = T{638, "Dome name"}, editor = "text", category = "Dome", default = ""},
		{ id = "ColonistCount", editor = "number", default = 0, no_edit = true },
		
		{ id = "ColonistExtraComfort", name = T{639, "Colonist Extra Comfort"}, editor = "number", default = 0, scale = "Stat", modifiable = true },
		{ id = "ColonistExtraMorale", name = T{640, "Colonist Extra Morale"}, editor = "number", default = 0, scale = "Stat", modifiable = true },
		{ template = true, id = "DailySanityRecoverDome", name = T{641, "Colonist Sanity Recover per Sol"}, editor = "number", default = 0, scale = "Stat", modifiable = true },
	},
	
	building_update_time = const.HourDuration,
	
	
	cupola_attach = false,
	tube_attaches = false,
	fractures = false,
	fractures_oxygen_modifier = false,
	visualizing_oxygen_leak = false,
	supply_resource_to_consider_max_flow = 30000, --presentation related, when grid supplies this much air/water it will play fx at 100%. this is about 3 moxies/water extractors.
	
	configurable_attaches = {
		{"DomeBasic_Glass", "Origin"},
		{"Dome_Entrance", "Entrance"},
		{"Dome_EntranceTube", "Entrancetube"},
	},
	landing_spot_name = "Landing",
	
	accept_colonists = true,
	allow_birth = true,
	
	birth_progress = 0,
	daily_birth_progress = 0,
	birth_thread = false,
	
	fertile_male = 0,
	fertile_female = 0,
	born_children = 0,
	clones_created = false, --this must be false to be detected when loading a game
	
	renegade_progress = 0,
	next_crime_events_check = 0,
	
	my_interior = false,
	walkable_points = false,
	
	stock_max = 0,

	dome_entrances = false,
	traits_filter = false,
	
	fx_actor_base_class = "Dome",
	
	next_birth_check_time = 0,
	
	panic_markers = false,
	init_with_skin = false,
	
	free_space_child = false,
	free_space_adult = false,
	
	dust_lerp_thread = false,
	
	connected_domes = false,   --{connected_dome = numberofconnections, ...}
	passage_entrances = false, --{connected_dome = {pt,pt,pt...}}
	passage_exits = false,     --{connected_dome = {pt,pt,pt...}}
}

local dome_lerp_dust_total_time = 1000
local dome_lerp_dust_delta = 25
function Dome:SetDustVisualsPerc(perc)
	if IsValidThread(self.dust_lerp_thread) then
		DeleteThread(self.dust_lerp_thread)
		self.dust_lerp_thread = false
	end
	
	local current_dust_perc = MulDivRound(self:GetDust(), 100, 255)
	if perc == current_dust_perc then return end --nothing to do
	
	self.dust_lerp_thread = CreateGameTimeThread(function(self, current_dust_perc, perc, dome_lerp_dust_total_time, dome_lerp_dust_delta)
		local start_t = GameTime()
		local total_t = MulDivRound(dome_lerp_dust_total_time, abs(perc - current_dust_perc), 100)
		local lerp_f = ValueLerp(current_dust_perc, perc, total_t, true)
		local lerped = current_dust_perc
		Sleep(dome_lerp_dust_delta)
		while IsValid(self) and lerped ~= perc do
			lerped = lerp_f(GameTime() - start_t)
			RequiresMaintenance.SetDustVisualsPerc(self, lerped)
			
			Sleep(dome_lerp_dust_delta)
		end
	end, self, current_dust_perc, perc, dome_lerp_dust_total_time, dome_lerp_dust_delta)
end

function Dome:GetDustPerc()
	return self.working and 0 or RequiresMaintenance.GetDustPerc(self)
end

function OnMsg.GatherLabels(labels)
	labels.Dome = true
	labels.Buildings = true
	labels.Workplaces = true
	labels.Residence = true
	labels.Colonist = true
	labels.SupplyGridBuildings = true
	labels.FactoryBuildings = true
	labels.ResearchBuildings = true
	labels.EntertainmentBuildings  = true
	labels.EducationBuildings = true
end

function Dome:InitPassageTables()
	self.connected_domes = self.connected_domes or {}
	self.passage_entrances = self.passage_entrances or {}
	self.passage_exits = self.passage_exits or {}
end

function Dome:Init()
	self:InitEmptyLabel("Buildings")
	self:InitEmptyLabel("Workplaces")
	self:InitEmptyLabel("Residence")
	self:InitEmptyLabel("Colonist")
	self:InitEmptyLabel("Unemployed")
	self:InitEmptyLabel("Homeless")
	self:InitEmptyLabel("SupplyGridBuildings") --either el or ls grid buildings, used to be supply_objects_inside
	self.traits_filter = {}
	self.fractures_oxygen_modifier = ObjectModifier:new{target = self, prop = "air_consumption"}
	self.clones_created = 0
	self.panic_markers = {}
	self.birth_progress = g_Consts.BirthThreshold / 2
	self:InitPassageTables()
	
	if self.init_with_skin then
		self.configurable_attaches = self.init_with_skin[2]
		self.init_with_skin = nil
	end
end

function Dome:Rebuild()
	local skin
	local skins = self:GetSkins("ignore_destroyed_state")
	if skins then
		skin = skins[table.find(skins, 1, self:GetEntity()) or 1]
	end
	Building.Rebuild(self, {dome_skin = skin})
end

function Dome:InitResourceSpots()
	Building.InitResourceSpots(self)
	for i = 1, #self.resource_spots do
		self.resource_spots[i][2] = self.resource_spots[i][2] + 90*60
	end
end

function OnMsg.LoadGame()
	g_TotalChildrenBornWithMating = 0
	for i,dome in ipairs(UICity.labels.Dome or empty_table) do
		--regenerate walkable points
		dome:GenerateWalkablePoints()
	
		--count children and clones in domes
		if not dome.clones_created then
			local clones = 0
			for j,colonist in ipairs(dome.labels.Colonist) do
				if colonist.traits.Clone then
					clones = clones + 1
				end
			end
			dome.clones_created = clones
		end
		g_TotalChildrenBornWithMating = g_TotalChildrenBornWithMating + dome.born_children
	end
end

function Dome:UpdateNotWorkingBuildingsNotification()
end

function Dome:UpdateSignOffset()
	--check for spires inside and set sign_offset accordingly
	local offset = false
	if self:HasSpire() then
		local spire = self.labels.Spire[1]
		local first, last = self:GetSpotRange("Spire")
		if first ~= last then return end --oval dome with two spire spots
		local top_idx = spire:GetSpotBeginIndex("Top")
		local spire_top_pos = spire:GetSpotPos(top_idx)
		
		top_idx = self:GetSpotBeginIndex("Top")
		local dome_top_pos = self:GetSpotPos(top_idx)
		local z_offset = Max(spire_top_pos:z() - dome_top_pos:z(), 0)
		if z_offset > 0 then
			--dome sign should be above the spire sign
			z_offset = z_offset + 20 * guim
		end
		offset = point(0,0,z_offset)
	end
	self.sign_offset = offset
	self:UpdateSignsVisibility()
end

GlobalVar("g_DomesWithNoOxygen", {})
GlobalVar("g_DomesWithNoWater", {})
GlobalVar("g_DomesWithNoPower", {})
GlobalVar("g_DomesWithFractures", {})

GlobalGameTimeThread("DomesWithNoOxygenNotif", function()
	HandleNewObjsNotif(g_DomesWithNoOxygen, "NoOxygen")
end)

GlobalGameTimeThread("DomesWithNoWaterNotif", function()
	HandleNewObjsNotif(g_DomesWithNoWater, "NoWater")
end)

GlobalGameTimeThread("DomesWithNoPowerNotif", function()
	HandleNewObjsNotif(g_DomesWithNoPower, "DomesWithNoPower")
end)

GlobalGameTimeThread("DomesWithFracturesNotif", function()
	HandleNewObjsNotif(g_DomesWithFractures, "FracturedDome")
end)

function Dome:UpdateNoOxygenSuppliedDomesNotification()
	if self:HasAir() or not self.ui_working then
		table.remove_entry(g_DomesWithNoOxygen, self)
	else
		table.insert_unique(g_DomesWithNoOxygen, self)
	end
end

function Dome:UpdateNoWaterSuppliedDomesNotification()
	if self:HasWater() or not self.ui_working  then
		table.remove_entry(g_DomesWithNoWater, self)
	else
		table.insert_unique(g_DomesWithNoWater, self)
	end
end

function Dome:UpdateNoPowerSuppliedDomesNotification()
	if self:HasPower() or not self.ui_working then
		table.remove_entry(g_DomesWithNoPower, self)
	else
		table.insert_unique(g_DomesWithNoPower, self)
	end
end

function Dome:GetBuildShape()
	return GetEntityCombinedShape(self:GetEntity())
end

function Dome:GetAverageStat(stat)
	local list = self.labels.Colonist
	local sum = 0
	for _, colonist in ipairs(list) do
		sum = sum + colonist:GetStat(stat)
	end
	return #list > 0 and (sum / #list) or 0
end

function Dome:GameInit()
	if HintsEnabled then
		HintTrigger("HintSuggestLivingQuarters")
	end

	self:InitAttaches()
	self.city:AddToLabel("Dome", self)
	-- choose name
	if self.name == "" then
		self.name = GenerateMachineName("Dome")
	end
	if GameTime() == 0 then --loading
		CreateGameTimeThread(self.OnLoad, self) -- wait all GameInit-s to complete
	end

	self:UpdateNoOxygenSuppliedDomesNotification()
	self:UpdateNoWaterSuppliedDomesNotification()
	self:UpdateNoPowerSuppliedDomesNotification()
	self.next_crime_events_check = GameTime() + (125 + self:Random(125))*const.HourDuration
	self:UpdateConsumption() --due to special consumption (ie consumes everything always, call this)
	
	self:AddOutskirtBuildings()
	
	self:GenerateWalkablePoints()
	UpdateDistToDomes(self,"add")
	
	g_DomeVersion = g_DomeVersion + 1
end

function Dome:AddOutskirtBuildings()
	ForEach({ 
		class = "DomeOutskirtBld", 
		area = self, 
		hexradius = self:GetOutsideWorkplacesDist(),
		exec = function(bld, dome)
			if not IsObjInDome(bld) then
				bld:AddToDomeLabels(dome)
			end
		end
	}, self)
end

function Dome:Done()
	g_DomeVersion = g_DomeVersion + 1
	self.city:RemoveFromLabel("Dome", self)
	DeleteThread(self.birth_thread)
	
	local objs_inside = self.labels.SupplyGridBuildings
	local blds_inside = self.labels.Buildings
	--disconnect
	for i = 1, #objs_inside do
		local obj = objs_inside[i]
		if IsKindOf(obj, "ElectricityGridObject") then
			obj.electricity.grid:RemoveElement(obj.electricity)
			obj.electricity = false
		end
		if IsKindOf(obj, "LifeSupportGridObject") then
			obj.water.grid:RemoveElement(obj.water)
			obj.water = false
			obj.air = false
		end
	end
	
	CreateGameTimeThread(function()
		--reconnect
		for i = 1, #objs_inside do
			local obj = objs_inside[i]
			if IsKindOf(obj, "LifeSupportGridObject") then
				LifeSupportGridObject.GameInit(obj)
			end
			if IsKindOf(obj, "ElectricityGridObject") then
				ElectricityGridObject.GameInit(obj)
			end
		end
		
		for i = 1, #blds_inside do
			blds_inside[i]:ConnectToCommandCenters()
		end
	end)
	
	--deselect
	if self == SelectedObj then
		SelectObj(false) --should provoke selchange so city can cleanup
	end
	--reset drones inside
	local drones = HexGetUnits(self, self:GetEntity(), self:GetPos(), self:GetAngle(), false, function(drone)
																														return drone.current_dome == self
																													end,
																													"Drone")
	for i = 1, #drones do
		local drone = drones[i]
		drone:OnExitDome(self)
		drone:SetCommand("Reset")
	end
	
	--manage colonists, there should be no colonists,
	local colonists = self.labels.Colonist
	for i = #colonists, 1, -1 do
		local colonist = colonists[i]
		colonist:OnExitDome(self)
		if colonist.dome == self then
			colonist:SetDome(false)
		end
		colonist:SetCommand("Abandoned") --seek new dome by foot.
	end
	UpdateDistToDomes(self,"remove")
end

function Dome:OnLoad()
	--check all buildings within the interior and reconnect any buildings that are not connected to our own grid.
	for _, building in ipairs(HexGridShapeGetObjectList(ObjectGrid, self, GetEntityInteriorShape(self:GetEntity()), "Building")) do
		if building.parent_dome ~= self then
			building:MoveInside(self)
		end
	end
end

function Dome:BuildingDailyUpdate(day)
	local comfort = self:GetDomeComfort()
	for _, residence in ipairs(self.labels.Residence) do
		residence:SetBase("service_comfort", getmetatable(residence).service_comfort + comfort)
	end
	UpdateDistToDomes(self,"update")
end

local daily_birth_checks = 6
function Dome:BuildingUpdate()
	local now = GameTime()
	if now >= self.next_crime_events_check then
		self:CheckCrimeEvents()
		self.next_crime_events_check = now + (125 + self:Random(125))*const.HourDuration
	end
	
	if now > self.next_birth_check_time then
		self:CalcBirth()
		self.next_birth_check_time = self.next_birth_check_time + const.DayDuration / daily_birth_checks
	end
	
	for i = #(self.panic_markers or empty_table), 1, -1 do
		if now >= self.panic_markers[i].expiration_time then
			table.remove(self.panic_markers, i)
		end
	end
end

function Dome:AddCommandCenter(center)
	TaskRequester.AddCommandCenter(self, center)
	self.labels.Buildings = self.labels.Buildings or {} 
	for i = 1, #self.labels.Buildings do
		local bld = self.labels.Buildings[i]
		if bld.auto_connect then
			bld:AddCommandCenter(center)
		end
	end
end

function Dome:RemoveCommandCenter(center)
	TaskRequester.RemoveCommandCenter(self, center)
	for i = 1, #self.labels.Buildings do
		self.labels.Buildings[i]:RemoveCommandCenter(center)
	end
end

function Dome:GenerateWalkablePoints()
	if self.walkable_points then return end
	
	self.walkable_points = { }
	local street_hexes = GetEntityInverseBuildShape(self:GetEntity())
	assert(#street_hexes > 0, "Dome with no 'steet' hexes")
	
	local size = point(0, const.HexSize / 2)
	local axis, angle = self:GetAxis(), self:GetAngle()
	local dome_hex = { WorldToHex(self:GetPos()) }
	for i,street_hex in ipairs(street_hexes) do
		local q = dome_hex[1] + street_hex:x()
		local r = dome_hex[2] + street_hex:y()
		local center = point(HexToWorld(q, r))
		for j=1,6 do
			local pt = center + RotateAxis(size, axis, j * 60 * 60)
			if terrain.IsPassable(pt) then
				self.walkable_points[#self.walkable_points + 1] = pt
			end
		end
	end
	
	assert(#self.walkable_points > 0, "Dome with no walkable points")
end

function Dome:ApplyToGrids()
	Building.ApplyToGrids(self)
	--abuse the pipe grid and mark the dome interior on it.
	local interior = GetEntityInteriorShape(self:GetEntity())
	if not self.my_interior then
		self.my_interior = PlaceObject("DomeInterior", {dome = self})
		self.my_interior:SetPos(self:GetPos())
		self.my_interior:SetAngle(self:GetAngle()) --hex grid setters deduce rot and q, r from these so set them.
	end
	HexGridShapeAddObject(ObjectGrid, self.my_interior, interior)
end

function Dome:RemoveFromGrids()
	Building.RemoveFromGrids(self)
	local interior = GetEntityInteriorShape(self:GetEntity())
	HexGridShapeRemoveObject(ObjectGrid, self.my_interior, interior)
	DoneObject(self.my_interior)
	self.my_interior = false
end

function Dome:AddToLabel(label, obj)
	if not LabelContainer.AddToLabel(self, label, obj) then
		return
	end
	if label == "Colonist" then
		if self:GetColonistCount() <= 0 then
			for _, bld in ipairs(self.labels.Workplaces) do
				bld:UpdateAttachedSigns()
			end
		end
	end
	self:ApplyCompoundEffects(label)
	return true
end

function Dome:RemoveFromLabel(label, obj)
	if not LabelContainer.RemoveFromLabel(self, label, obj) then
		return
	end
	if label == "Colonist" then
		if self:GetColonistCount() <= 0 then
			for _, bld in ipairs(self.labels.Workplaces) do
				bld:UpdateAttachedSigns()
			end
		end
	end
	self:ApplyCompoundEffects(label)
	return true
end

function Dome:ApplyCompoundEffects(label, tech_id)
	local effects = self.city.compound_effects[label] or empty_table
	
	if not tech_id then
		for id, _ in sorted_pairs(effects) do
			self:ApplyCompoundEffects(label, id)
		end
		return
	end

	local count = #(self.labels[label] or empty_table)
	local effect = effects[tech_id]
	local mod
	if count >= effect.threshold then
		mod = LabelModifier:new{
			container = self,
			label = label,
			id = tech_id,
			prop = effect.prop,
			amount = effect.amount,
			percent = effect.percent,
		}
	end
	self:SetLabelModifier(label, tech_id, mod)	
end

function Dome:InitAttaches()
	if not self.cupola_attach then
		local glass = self:GetAttach(self.configurable_attaches[1][1])
		self.cupola_attach = { glass }
		glass:SetEnumFlags(const.efSelectable)
		glass:SetSIModulation(100)
		glass.SetSIModulation = __empty_function__

		if self.configurable_attaches[4] then
			local top = self:GetAttach(self.configurable_attaches[4][1])
			table.insert(self.cupola_attach, top)
		end

		self.dome_entrances = self:GetEntrances()
		if SelectedObj == self then
			self:Open()
		end
	end
end

function Dome:GetCollisionGlassObj()
	return self.cupola_attach[1]
end

function Dome:OnDestroyed()
	ElectricityConsumer.OnDestroyed(self)
	LifeSupportConsumer.OnDestroyed(self)
	
	--replace non blocking interior with a blocking one
	local interior = GetEntityInteriorShape(self:GetEntity())
	HexGridShapeRemoveObject(ObjectGrid, self.my_interior, interior)
	DoneObject(self.my_interior)
	self.my_interior = PlaceObject("BlockingDomeInterior", { dome = self })
	self.my_interior:SetPos(self:GetPos())
	self.my_interior:SetAngle(self:GetAngle()) --hex grid setters deduce rot and q, r from these so set them.
	HexGridShapeAddObject(ObjectGrid, self.my_interior, interior)
	
	
	local glass = self.cupola_attach[1]
	if not IsValid(glass) then
		return
	end
	for i=self:GetFracturesCount(),max_visible_fractures do
		self:PlaceFracture("Large")
	end
	self:VisualizeOxygenLeak(false)
	self:VisualizeFractures()
	
	self:DestroyAttaches{"BakedDomeDecal", "DomeTerrain"}
end

function Dome:GetEntrances()
	return self:GetAttaches(self.configurable_attaches[2][1])
end

function Dome:GetLandingObjects()
	return self:GetEntrances()
end

function Dome:IsOpen()
	if not IsValid(self) then return false end
	return self.cupola_attach and self.cupola_attach[1]:GetGameFlags(const.gofMarkOnly) ~= 0
end

function Dome:Open()
	if not self:IsOpen() and self.cupola_attach then
		self.cupola_attach[1]:SetGameFlags(const.gofMarkOnly)
		if self.cupola_attach[2] then
			self.cupola_attach[2]:SetVisible(false)
		else
		end
		if self.fractures then
			for _, fracture in ipairs(self.fractures) do
				fracture:ClearEnumFlags(const.efVisible)
			end
		end
	end
end

function Dome:Close()
	if self:IsOpen() then
		self.cupola_attach[1]:ClearGameFlags(const.gofMarkOnly)
		if self.cupola_attach[2] then
			self.cupola_attach[2]:SetVisible(true)
		end
		if self.fractures then
			for _, fracture in ipairs(self.fractures) do
				fracture:SetEnumFlags(const.efVisible)
			end
		end
	end
end

function Dome:CanDemolish()
	return #self.labels.Buildings<=0 and #self.labels.Colonist<=0 and not next(self.connected_domes) and Building.CanDemolish(self)
end

function Dome:CreateLifeSupportElements()
	self.water = NewSupplyGridConsumer(self)
	self.air = NewSupplyGridConsumer(self)
end	

function Dome:DroneApproach(drone, resource)
	if drone.current_dome == self then
		--we are in the dome we are to approach,
		--pass a pt to gotosameobjasdome so it exits the dome
		local idx = self:GetNearestSpot("idle", drone.work_spot_task, drone)
		local pt = self:GetSpotPos(idx)
		drone:GotoSameDomeAsObj(pt)
	end
	return drone:GotoBuildingSpot(self, drone.work_spot_task)
end

function Dome:GetEntrance(target, entrance_type, spot_name)
	target = target or self
	local dome_entrance = FindNearestObject(self.dome_entrances, target)
	if not dome_entrance then
		assert(false, "Dome has no entrances")
		return
	end
	if not spot_name and ResolveDome(target) ~= self then
		-- units outside should consider the outside spots of the entrances
		spot_name = "Doorentrance1"
	end
	return dome_entrance:GetEntrance(target, entrance_type, spot_name)
end

function Dome:OnEnterUnit(unit)
end

function Dome:OnExitUnit(unit)
end

function Dome:OnEnterHolder(unit)
	assert(false)
end

--domes ls consumption logic ignores electricity supply, hence this override.
function Dome:UpdateConsumption()
	--basically user can work
	local demand_stopped_by_user = not self:IsWorkPermitted()
	
	if demand_stopped_by_user then
		--turn everything off, shielded for vry early calls.
		if self.electricity then 
			self.electricity:SetConsumption(0)
		end
		if self.water then	self.water:SetConsumption(0)	end
		if self.air then self.air:SetConsumption(0) end
	else
		--turn everything on!
		if self.electricity then 
			self.electricity:SetConsumption(self.electricity_consumption) 
		end
		if self.water then	self.water:SetConsumption(self.water_consumption) end
		if self.air then self.air:SetConsumption(self.air_consumption) end
	end
end

function Dome:IsSupplyGridDemandStoppedByGame()
	return false --since dome demand is only stopped by user, game cannot stop it.
end

function Dome:HasAir()
	return not self.air or self.air.current_consumption >= self.air_consumption
end

function Dome:HasWater()
	return not self.water or self.water.current_consumption >= self.water_consumption
end

function Dome:SetUIWorking(work)
	Building.SetUIWorking(self, work)
	self:UpdateNoPowerSuppliedDomesNotification()	
	self:UpdateNoOxygenSuppliedDomesNotification()
	self:UpdateNoWaterSuppliedDomesNotification()
end

function Dome:SetIsNightLightPossible(val, all_lights)
	Building.SetIsNightLightPossible(self, val, all_lights)
	for _, v in ipairs(self.labels.Decorations or empty_table) do
		v:SetIsNightLightPossible(val, all_lights)
	end
end

function Dome:VisualizeOxygenLeak(visualized)
	if visualized == nil then
		visualized = self.visualizing_oxygen_leak
	else
		self.visualizing_oxygen_leak = visualized
	end
	local count = 0
	local fractures = self.fractures or ""
	for i=#fractures,1,-1 do
		fractures[i]:Visualize(visualized)
		if visualized then
			count = count + 1
			if count == max_visible_leaks then
				visualized = false
			end
		end
	end
end

function Dome:VisualizeFractures()
	local glass = self.cupola_attach[1]
	if not IsValid(glass) then
		return
	end
	local count = 0
	local fractures = self.fractures or ""
	for i=#fractures,1,-1 do
		if count == max_visible_fractures then
			break
		end
		local fracture = fractures[i]
		count = count + 1
		glass:SetTransparentDecal(count, fracture.normal, fracture.size)
	end
	for i=count+1,max_visible_fractures do
		glass:SetTransparentDecal(i, false)
	end
end

function Dome:SetSupply(resource, amount)
	ElectricityConsumer.SetSupply(self, resource, amount)
	LifeSupportConsumer.SetSupply(self, resource, amount)
	self:UpdateNoPowerSuppliedDomesNotification()

	self:Notify("CheckConditionsAll")

	if resource == "electricity" then 
		return --tube attaches don't care bout electricity.
	end
	
	self:Notify("UpdateNoOxygenSuppliedDomesNotification")
	self:Notify("UpdateNoWaterSuppliedDomesNotification")
	
	if resource == "air" then
		self:VisualizeOxygenLeak(amount > 0)
	end
end

function Dome:CheckConditionsAll()	
	local t = GameTime()
	for _, colonist in ipairs(self.labels.Colonist or empty_table) do
		if not colonist.outside_start then
			self:CheckConditions(colonist, t)
		end
	end
end

function Dome:CheckConditions(colonist, t)	
	colonist:Affect("StatusEffect_Suffocating", not self:HasAir(), t)
	colonist:Affect("StatusEffect_Dehydrated", not self:HasWater(), t)
	colonist:Affect("StatusEffect_Freezing", not self:HasPower(), t)
end

function Dome:OnSetWorking(working)
	if working then
		self.cupola_attach[1]:SetGameFlags(const.gofMarkVolume)
	else
		self.cupola_attach[1]:ClearGameFlags(const.gofMarkVolume)
	end
	ElectricityConsumer.OnSetWorking(self, working)
	LifeSupportConsumer.OnSetWorking(self, working)
	self:Notify("CheckConditionsAll")
	self:SetDustVisualsPerc(self:GetDustPerc())
end

function Dome:GetInnerBuildingConsumption()
	local buildings = self.labels.SupplyGridBuildings
	local power, water, air = 0,0,0
	for _,bld in ipairs(buildings) do
		if IsKindOf(bld, "ElectricityConsumer") and bld:IsWorkPermitted() then
			power = power + bld.electricity_consumption
		end
		if IsKindOf(bld, "LifeSupportConsumer") and bld:IsWorkPermitted() then
			air = air + bld.air_consumption
			water = water + bld.water_consumption
		end
	end
	return power, water, air
end

function Dome:UpdateUISectionConsumption(win)
	local intentionally_not_consuming = self:IsSupplyGridDemandStoppedByGame()
	local permited = self:IsWorkPermitted()

	win.idPower:SetText("")
	win.idAir:SetText("")
	win.idWater:SetText("")
	win.idResource:SetText("")
	local power, water, air = self:GetInnerBuildingConsumption()
	local not_permited = (not permited or intentionally_not_consuming)
	local not_enough = self:ShouldShowNoElectricitySign() and not (intentionally_not_consuming or self.suspended)
	local dome_electricity, dome_water, dome_air = self.electricity_consumption, self.water_consumption, self.air_consumption
	power = power + dome_electricity
	water = water + dome_water
	air = air + dome_air
	if power ~= dome_electricity then
		win.idPower:SetText(
			not_enough and T{7939, "Insufficient Power<right><red><resource(total)>(<resource(dome)>)<icon_Power></red>",total = power, dome =  dome_electricity}
			or not_permited and T{7940, "Required Power<right><resource(total)>(<resource(dome)>)<icon_Power>",total = power, dome =  dome_electricity}
			or T{7941, "Power<right><green><resource(total)>(<resource(dome)>)<icon_Power></green>",total = power, dome = dome_electricity})			
	else
		win.idPower:SetText(
			not_enough and ConsumptionStatuses["PowerNotEnough"]
			or not_permited and ConsumptionStatuses["PowerRequired"]
			or ConsumptionStatuses["Power"])
	end
	local no_air = not (self:HasAir() or intentionally_not_consuming) and permited
	if air ~= dome_air then
		win.idAir:SetText(
			no_air and T{7942, "Insufficient Oxygen<right><red><resource(total)>(<resource(dome)>)<icon_Air></red>",total = air, dome = dome_air}
			or not_permited and T{7943, "Required Oxygen<right><resource(total)>(<resource(dome)>)<icon_Air>",total = air, dome = dome_air}
			or  T{7944, "Oxygen<right><green><resource(total)>(<resource(dome)>)<icon_Air></green>",total = air, dome = dome_air})
	else
		win.idAir:SetText(
			no_air and ConsumptionStatuses["OxygenNotEnough"]
			or not_permited and ConsumptionStatuses["OxygenRequired"]
			or ConsumptionStatuses["Oxygen"])
	end
	local no_water = not (self:HasWater() or intentionally_not_consuming) and permited 
	if water ~= dome_water then
		win.idWater:SetText(
			no_water and T{7945, "Insufficient Water<right><red><resource(total)>(<resource(dome)>)<icon_Water></red>",total = water, dome = dome_water}
			or not_permited and T{7946, "Required Water<right><resource(total)>(<resource(dome)>)<icon_Water>",total = water, dome = dome_water}
			or  T{7947, "Water<right><green><resource(total)>(<resource(dome)>)<icon_Water></green>",total = water, dome = dome_water})
	else
		win.idWater:SetText(
			no_water and ConsumptionStatuses["WaterNotEnough"]
			or not_permited  and ConsumptionStatuses["WaterRequired"]
			or ConsumptionStatuses["Water"])
	end
	local count = (#(self.labels.Colonist or empty_table) + #(self.labels.Glutton or empty_table)) * g_Consts.eat_food_per_visit
	win.idResource:SetText(T{7526, "Food<right><food(count)>", count = count})
end

local birth_comfort_cap = 150*stat_scale
local function CheckFertility(c, min_comfort_birth) 
	local traits = c.traits
	if
		c.stat_comfort > min_comfort_birth
		and not c:IsDying() 
		and not traits.Child
		and not traits.Android
		and (not traits.Senior or g_SeniorsCanWork)
		and not traits.OtherGender
	then
		return true
	end
end

local function CalcFertility(c) 
	local comfort = c.stat_comfort
	return comfort + Min(birth_comfort_cap, c.birth_comfort_modifier), comfort
end

function Dome:SpawnChild(dreamer_chance)
	local colonist = GenerateColonistData(self.city, "Child")
	colonist.dome = self
	colonist.current_dome = self
	if IsDreamMystery() then
		assert(self.labels.Colonist)
		local rand = self:Random(100)	
		if rand < dreamer_chance then
			if self.city.mystery.state == "ended" then
				colonist.traits["DreamerPosMystery"] = true
			else
				colonist.traits["Dreamer"] = true
			end
		end
	end
	Colonist:new(colonist)
	self:RandPlaceColonist(colonist)
	self.born_children = self.born_children + 1
	g_TotalChildrenBornWithMating = g_TotalChildrenBornWithMating + 1
	Msg("ColonistBorn", colonist, "born")
	self:UpdateUI()
	return colonist
end

function Dome:GetMinComfortBirth()
	local medicals = self.labels.MedicalBuilding or empty_table
	for _, medical in ipairs(medicals) do
		if medical.working then
			return g_Consts.MinComfortBirth - g_Consts.MedicalBuildingMinComfortBirthDecrease
		end
	end
	return g_Consts.MinComfortBirth
end

function Dome:GetHomelessBirthRatePenalty()
	local homeless = #(self.labels.Homeless or empty_table)
	local all = #self.labels.Colonist
	return all<=0 and 0 or homeless <= 0 and 0 or Clamp(50 + 4*(homeless*50/all),0, 100)
end

function Dome:CalcBirth()
	if not self.allow_birth then
		return
	end
	local min_comfort_birth = self:GetMinComfortBirth()

	local males = self.labels.Male or empty_table
	local females = self.labels.Female or empty_table

	-- find couples	
	local num_male_fertile = 0
	local fertile_male = {}
	for _, colonist in ipairs(males) do
		if CheckFertility(colonist, min_comfort_birth) then
			fertile_male[#fertile_male + 1] = colonist
		end
	end
	
	local num_female_fertile = 0
	local fertile_female = {}
	for _, colonist in ipairs(females) do
		if CheckFertility(colonist, min_comfort_birth) then
			fertile_female[#fertile_female + 1] = colonist
		end
	end
	
	self.fertile_male = #fertile_male
	self.fertile_female = #fertile_female
	
	local couples_count = Min(#fertile_male, #fertile_female)
	
	if couples_count == 0 then 
		self.daily_birth_progress = 0
		RebuildInfopanel(self)
		return false 
	end
	
	if #fertile_male < #fertile_female then
		table.sortby_field_descending(fertile_female, "stat_comfort")
	else
		table.sortby_field_descending(fertile_male, "stat_comfort")
	end
	
	local total_fertility, total_comfort, dreamers = 0, 0, 0
	local function add_group(group)
		for i = 1, couples_count do
			local colonist = group[i]
			local fertility, comfort = CalcFertility(colonist)
			total_fertility = total_fertility + fertility
			total_comfort = total_comfort + comfort
			local traits = colonist.traits
			if traits.Dreamer or traits.DreamerPostMystery then
				dreamers = dreamers + 1
			end
		end
	end
	add_group(fertile_male)
	add_group(fertile_female)
	
	local avg_comfort = total_comfort / (2*couples_count)
	local avg_fertility = total_fertility / (2*couples_count)
	local birth_progress = Max(0, couples_count * (avg_fertility - 30*stat_scale)) -- daily
	birth_progress = MulDivRound(birth_progress, 100 - self:GetHomelessBirthRatePenalty(), 100)
	
	self.daily_birth_progress = birth_progress
	self.birth_progress = self.birth_progress + birth_progress / daily_birth_checks
	
	while self.birth_progress >= g_Consts.BirthThreshold do
		self.birth_progress = self.birth_progress - g_Consts.BirthThreshold 
		CreateGameTimeThread(function(self)
			Sleep(1000+self:Random(self.building_update_time-1000))
			if not IsValid(self) then
				return
			end
			self:SpawnChild(dreamers * 100 / (2*couples_count))
		end, self)
	end
	RebuildInfopanel(self)
end

function Dome:CalcRenegades()
	if not self.labels.Colonist then return end
	local sum_morale = 0
	local count = 0
	local min_morale = max_int
	local min_morale_colonist = false
	
	for i, colonist in ipairs(self.labels.Colonist) do
		local traits = colonist.traits
		if not traits.Child and not traits.Renegade then
			count = count + 1
			local morale = Clamp(colonist.stat_morale, 0, max_stat)
			sum_morale = sum_morale + morale
			if morale < min_morale then
				min_morale = morale
				min_morale_colonist = colonist
			end
		end
	end
	
	if count<=0 then return end
	
	local average = sum_morale/count
	self.renegade_progress = Max(0, self.renegade_progress + (65*stat_scale - average))
	local constRenegadeCreation =  g_Consts.RenegadeCreation
	if self.renegade_progress >= constRenegadeCreation then
		if HintsEnabled then
			HintTrigger("HintRenegade")
		end
		min_morale_colonist:AddTrait("Renegade")
		self.renegade_progress = Min(self.renegade_progress - constRenegadeCreation, constRenegadeCreation )
	end
end

function Dome:CheckCrimeEvents()
	local count = self:GetAdjustedRenegades()
	if count <= 2 then
		return
	end
	if self:CanPreventCrimeEvents() then
		AddOnScreenNotification("PreventCrime", false, {dome_name = self:GetDisplayName()}, self)
		return 
	end
	if count < 15 or not self:CrimeEvents_SabotageBuilding() then	
		self:CrimeEvents_StoleResource()
	end
end

function Dome:CanPreventCrimeEvents()
	local stations = self.labels.SecurityStation or empty_table
	local officers = 0
	for i=1, #stations do
		officers =  officers + stations[i]:GetNegatedRenegades()
	end
	local renegades = #(self.labels.Renegade or empty_table)
	if renegades>=officers then return false end
	if officers>renegades*3 then return true end
	local chance = MulDivRound(officers, 100, 6*renegades)
	return Random(0,100)<=chance
end

local resources_query = {
	class = "ResourceStockpileBase",
	area = false,
	filter = function(o, dome)
		if IsKindOfClasses(o, "SharedStorageBaseVisualOnly", "CargoShuttle") then
			return false 
		end
		if "BlackCube" == o.resource or "WasteRock" == o.resource then 
			return false 
		end
		
		local stored_amount = 0
		if IsKindOf(o, "ResourcePile") then
			return o.transport_request:GetTargetAmount() >= const.ResourceScale
		else --resource stockpile/storage dep/sharedstorage
			return o:GetStoredAmount()>=const.ResourceScale
		end
	end	
}

function Dome:GetOutsideWorkplacesDist()
	local r 
	if IsValid(self) then
		r = self:GetRadius()
	else
		local b = GetEntityBoundingBox(self:GetEntity())
		r = Max(b:sizex(), b:sizey()) / 2
	end
	return (r + const.GridSpacing/2) / const.GridSpacing + g_Consts.DefaultOutsideWorkplacesRadius
end

function Dome:GetSelectionRadiusScale()
	return self:GetOutsideWorkplacesDist()
end

function Dome:CrimeEvents_StoleResource()
	resources_query.area = self
	resources_query.arearadius = self:GetOutsideWorkplacesDist() * const.HexHeight
	local resources_stockpile = GetObjects(resources_query, self)
	resources_query.area = false
	local count = #resources_stockpile
	if count<=0 then return false end
	local rand_stockpile = 1 + self:Random(count)
	local stockpile = resources_stockpile[rand_stockpile]
	if IsKindOf(stockpile, "ResourcePile") then
		local stored_amount = stockpile.transport_request:GetTargetAmount()
		local rand_res_amount = (1 + self:Random(Min(stored_amount/const.ResourceScale, 5)))*const.ResourceScale
		stockpile:AddResource(-rand_res_amount, stockpile.resource)
		AddOnScreenNotification("RenegadesStoleResources",false,
			{dome_name = self:GetDisplayName(), resource = FormatResource(rand_res_amount,stockpile.resource, self)},
			 {IsValid(stockpile) and stockpile})
		return true
	elseif IsKindOf(stockpile, "ResourceStockpile") then	
		local storable_resource = stockpile.resource
		local stored_amount = stockpile:GetStoredAmount()
		local rand_res_amount = (1 + self:Random(Min(stored_amount/const.ResourceScale, 5)))*const.ResourceScale
		stockpile:AddResource(-rand_res_amount, storable_resource)
		AddOnScreenNotification("RenegadesStoleResources",false,
			{dome_name = self:GetDisplayName(), resource = FormatResource(rand_res_amount,storable_resource, self)},
			 {IsValid(stockpile) and stockpile})
		return true	
	else --storage dep/sharedstorage
		local storable_resources = stockpile.storable_resources
		local resource_count = #storable_resources
		local stored_amount = {}
		for i = 1, resource_count do
			local resource = storable_resources[i]
			local amount = stockpile:GetStoredAmount(resource)
			if amount >= const.ResourceScale then
				stored_amount[#stored_amount + 1] = {resource, amount}
			end
		end
		local rand_type = 1 + self:Random(#stored_amount)
		local resorce_type = stored_amount[rand_type]
		local rand_res_amount = (1 + self:Random(Min(resorce_type[2]/const.ResourceScale, 5)))*const.ResourceScale
		stockpile:AddResource(-rand_res_amount, resorce_type[1])
		AddOnScreenNotification("RenegadesStoleResources",false,
			{dome_name = self:GetDisplayName(), resource = FormatResource(rand_res_amount,resorce_type[1], self)},
			 {IsValid(stockpile) and stockpile})
		return true
	end
end

function Dome:CrimeEvents_SabotageBuilding()
	local count = 0
	local buildings = table.ifilter(self.labels.Buildings or empty_table, function(i,b) return IsValid(b) and b:CanDemolish() and not b:IsKindOf("ConstructionSite") and b.use_demolished_state end)
	if #buildings==0 then return end
	for i=1, g_Consts.CrimeEventDestroyedBuildingsCount do
		local building, idx = self.city:TableRand(buildings)
		if not building then
			return
		end
		table.remove(buildings, idx)
		if DestroyBuildingImmediate(building, false) then
			AddOnScreenNotification("RenegadesSabotageBuilding", false, {dome_name = self:GetDisplayName(), building = building:GetDisplayName()}, {building:GetPos()})
			count = count + 1
		end
	end
	return count > 0
end

function Dome:GetAdjustedRenegades()
	local stations = self.labels.SecurityStation or empty_table
	local sum = 0
	for i=1, #stations do
		sum =  sum + stations[i]:GetNegatedRenegades()
	end
	local count_renegades = #(self.labels.Renegade or empty_table)
	return Max(0, count_renegades - sum)
end

function Dome:PickColonistSpawnPt()
	local max_radius = self:GetRadius()
	local center = self:GetPos()
	local pt = GetRandomPassableAround(center, max_radius, 100, function(x, y, dome)
		local objs = HexGridGetObjects(ObjectGrid, WorldToHex(x, y))
		return #objs == 1 and IsKindOf(objs[1], "DomeInterior") and objs[1].dome == dome
	end, self)
	pt = pt or GetPassablePointNearby(center)
	return pt
end

function Dome:LabelRand(label)
	return self.city:TableRand(self.labels[label] or empty_table)
end

function Dome:RandPlaceColonist(colonist)
	local holder = colonist.holder or colonist.residence or colonist.last_residence
	if not holder or holder.parent_dome ~= self then
		holder = self:LabelRand("Residence")
	end
	colonist:OnEnterDome(self)
	colonist.dome_version = nil
	if holder then
		colonist:DetachFromMap()
		holder:OnEnterUnit(colonist)
		return
	end
	colonist:SetOpacity(0)
	colonist:SetOpacity(100, 200)
	local dome_entrance = self.city:TableRand(self.dome_entrances)
	local entrance = dome_entrance and dome_entrance:GetEntrance()
	if entrance then
		colonist:SetPos(entrance[#entrance])
		return
	end
	colonist:SetPos(self:PickColonistSpawnPt())
end

function Dome:CalcIntersetsFails()
	local iterests_fails = {}
	for _, colonist in ipairs(self.labels.Colonist) do
		local fail = colonist.daily_interest_fail
		if fail>0 then
			--fail  -- 0 - not tried, 1 - not found, 2 - closed, 3 - full, 4 - CanService failed
			if fail~=3 then fail = 1 end
			local interest = colonist.daily_interest
			if interest and interest~="" then
				local fail_table = iterests_fails[fail] or {}
				local element = table.find_value(fail_table, "interest", interest)
				if element then
					element.count = element.count + 1
				else
					fail_table[#fail_table +1] = {interest = interest, count = 1}
				end
				iterests_fails[fail] = fail_table
			end	
		end
	end
	for fail, data in pairs(iterests_fails) do
		table.sortby_field_descending(data, "count")
	end
	return iterests_fails
end

function Dome:GetComfortRollover()
	local iterests_fails = self:CalcIntersetsFails()
	local texts = {}
	texts[#texts+1] = T{7893, --[[XTemplate sectionDome RolloverText]] "The average <em>Comfort</em> of all Colonists living in this Dome."}
	if next(iterests_fails) then
		--fail  -- 0 - not tried, 1 - not found, 2 - closed, 3 - full, 4 - CanService failed
		local not_found = iterests_fails[1] or empty_table
		if next(not_found) then
			texts[#texts+1] = T{316, "<newline>"}
			for i = 1, Min(3,#not_found)  do
				local data = not_found[i]
				texts[#texts + 1] = T{7894, "<red><number> colonists couldn't satisfy their Interest (<interest_name>) - no available service building.</red>" , 
										number = data.count,interest_name = Interests[data.interest].display_name }
			end
		end
		local full = iterests_fails[3] or empty_table
		if next(full) then
			for i = 1, Min(3,#full)  do
				local data = full[i]
				texts[#texts + 1] = T{7895, "<red><number> colonists couldn't satisfy their Interest (<interest_name>) - service buildings are full.</red>" , 
										number = data.count,interest_name = Interests[data.interest].display_name }
			end
		end
	end
	return table.concat(texts, "<newline><left>")
end

function Dome:SpawnColonist(refresh)
	local colonist = GenerateColonistData(self.city)
	colonist.dome = self
	colonist.current_dome = self
	Colonist:new(colonist)
	Msg("ColonistBorn", colonist)
	local pt = self:PickColonistSpawnPt()
	colonist:SetPos(pt)
	if refresh==nil or refresh then
		self:UpdateUI()
	end
	return colonist
end

function Dome:CheatSpawnColonist()
	self:SpawnColonist()
end

function Dome:ToggleAcceptColonists(broadcast)
	local state = not self.accept_colonists
	if broadcast then
		local list = self.city.labels.Dome or empty_table
		for _, dome in ipairs(list) do
			if dome.accept_colonists ~= state then
				PlayFX("DomeAcceptColonistsChanged", "start", dome)
				dome.accept_colonists = state
			end
		end
	else
		PlayFX("DomeAcceptColonistsChanged", "start", self)
		self.accept_colonists = state
	end
	ObjModified(self)
end

function Dome:ToggleAcceptBirth(broadcast)
	local state = not self.allow_birth
	if broadcast then
		local list = self.city.labels.Dome or empty_table
		for _, dome in ipairs(list) do
			if dome.allow_birth ~= state then
				PlayFX("DomeAcceptColonistsChanged", "start", dome)
				dome.allow_birth = state
			end
		end
	else
		PlayFX("DomeAcceptColonistsChanged", "start", self)
		self.allow_birth = state
	end
	ObjModified(self)
end

GlobalVar("DomeTraitsCameraParams", false)

function Dome:OpenFilterTraits(category)
	local camera = DomeTraitsCameraParams or {GetCamera()}
	DomeTraitsCameraParams = false
	CloseDialog("DomeTraits")
	local dlg = OpenDialog("DomeTraits", {category = category, dome = self, filter = self.traits_filter, colonists = self.labels.Colonist})
	if category and type(category) == "string" then
		local prop_meta = table.find_value(dlg.context:GetProperties(), "id", category)
		if prop_meta then
			SetDialogMode(dlg, "items", prop_meta)
		end
	end
	self.accept_colonists = true
	DomeTraitsCameraParams = camera
end

function Dome:TestColonistLRTransport()
	local colonists = self.labels.Colonist
	local domes = self.city.labels.Dome
	if colonists and #colonists > 0 and domes and #domes > 1 then
		local colonist = self.city:TableRand(colonists)
		local dome_idx = AsyncRand(#domes) + 1
		if domes[dome_idx] == self then
			dome_idx = dome_idx + 1
			dome_idx = dome_idx > #domes and dome_idx % #domes or dome_idx
		end
		local dome = domes[dome_idx]
		
		if CreateColonistTransportTask(colonist, colonist.dome, dome) then
			colonist:SetCommand("Transport", dome)
		end
	end
end

function Dome:GetColonistCount() return #(self.labels.Colonist or empty_table )end
function Dome:GetLivingSpace()
	local capacity = 0
	for _, obj in ipairs(self.labels.Residence or empty_table) do
		if not obj.destroyed then
			capacity = capacity + obj.capacity
		end
	end
	return capacity
end

function Dome:GetUnemployed()
	return self.labels.Unemployed and #self.labels.Unemployed or 0
end

function Dome:GetEmploymentMessage()
	local unemployed = self.labels.Unemployed and #self.labels.Unemployed or 0
	local vacant_on, vacant_off = GetFreeWorkplacesAround(self)
	if unemployed > 0 then
		return T{566, "Unemployed<right><colonist(number)>", number = unemployed}
	elseif vacant_on > 0 then
		return T{567, "Vacant work slots<right><colonist(number)>", number = vacant_on}
	elseif vacant_off > 0 then
		return T{568, "Disabled work slots<right><colonist(number)>", number = vacant_off}
	elseif self.labels.Colonist and #self.labels.Colonist > 0 then
		return T{569, "No unemployment, no vacant workplaces"}
	else
		return T{570, "This Dome is not operational due to lack of Colonists"}
	end
end

function Dome:GetResidenceMessage()
	local homeless = self.labels.Homeless and #self.labels.Homeless or 0
	if homeless > 0 then
		return T{551, "Homeless<right><colonist(number)>", number = homeless}
	end
	local free = self:GetFreeLivingSpace()
	if free > 0 then
		return T{552, "Vacant residential slots<right><colonist(number)>", number = free}
	end
	return ""
end

function Dome:GetAverageHealth() return self:GetAverageStat("Health") end
function Dome:GetAverageSanity() return self:GetAverageStat("Sanity") end
function Dome:GetAverageComfort() return self:GetAverageStat("Comfort") end
function Dome:GetAverageMorale() return self:GetAverageStat("Morale") end

function Dome:GetDomeComfort() 
	local comfort = self.dome_comfort or 0
	for _, building in ipairs(self.labels.Buildings) do
		if (building.working and not building.destroyed) or building.dome_comfort < 0 then
			comfort = comfort + building.dome_comfort
		end
	end
	return comfort
end

function Dome:SetColonistCount(n)
	CreateGameTimeThread( function()
	CreateGameTimeThread( function()
		for i=1,n do
			self:SpawnColonist()
		end
	end)
	end)
end

function Dome:GetFracturesCount()
	return #(self.fractures or "")
end

function Dome:PlaceFracture(crack_type, fracture_pos, fracture_radius)
	local glass = self.cupola_attach[1]
	crack_type = crack_type or AsyncRand(100) < 50 and "Large" or "Small"
	local fracture = PlaceObject("DomeMeteorFracture" .. crack_type, {size = fracture_radius}, const.cfComponentAttach)
	local origin_idx = glass:GetSpotBeginIndex("Origin")
	local origin_spot = glass:GetSpotPos(origin_idx)
	local axis, angle = self:GetAxis(), self:GetAngle()
	glass:Attach(fracture, origin_idx)
	if not fracture_pos then
		fracture_pos = RotateRadius(AsyncRand(glass:GetRadius()), AsyncRand(360*60), origin_spot)
		fracture_pos = fracture_pos:SetZ(origin_spot:z() + glass:GetRadius() + guim)
		fracture_pos = IntersectRayWithObject(origin_spot, fracture_pos, glass, EntitySurfaces.Collision)
		assert(fracture_pos)
		if not fracture_pos then
			return
		end
	end
	local fracture_normal = fracture_pos - origin_spot
	local dir = RotateAxis(fracture_normal, axis, -angle)
	fracture:SetAttachOffset(dir)
	fracture.dir = dir
	fracture.normal = SetLen(fracture_normal, 1024)
	if self:IsOpen() then
		fracture:ClearEnumFlags(const.efVisible)
	end
	self.fractures = self.fractures or {}
	table.insert(self.fractures, fracture)
	return fracture
end

function Dome:AddFracture(crack_type, fracture_pos, fracture_radius)
	local fracture = self:PlaceFracture(crack_type, fracture_pos, fracture_radius)
	self.fractures_oxygen_modifier:Change(self:GetFracturesCount() * 1 * const.ResourceScale, 0)
	table.insert_unique(g_DomesWithFractures, self)
	self.fracture_demand_request:AddAmount(const.DronePolymersPerFraction)
	self:AddPanicMarker(fracture_pos, 20*guim, 3*const.HourDuration)
	self:VisualizeOxygenLeak()
	self:VisualizeFractures()
end

function Dome:RemoveFixedFracture()
	local fractures = self.fractures or ""
	for i=1,#fractures do
		local fracture = fractures[i]
		if fracture.fixing then
			table.remove(self.fractures, i)
			local count = self:GetFracturesCount()
			if count == 0 then
				table.remove_entry(g_DomesWithFractures, self)
			end
			self.fractures_oxygen_modifier:Change(count * 1 * const.ResourceScale, 0)
			DoneObject(fracture)
			return true
		end
	end	
end

function Dome:RemoveAllFixingFractures()
	local count = 0
	while self:RemoveFixedFracture() do
		count = count + 1
	end
	if count == 0 then
		return
	end
	self:VisualizeOxygenLeak()
	self:VisualizeFractures()
end

function Dome:AddPanicMarker(pos, radius, time)
	table.insert(self.panic_markers, { pos = pos, radius = radius, expiration_time = GameTime() + time })
	
	local list = self.labels.Colonist or empty_table	
	for _, colonist in ipairs(list) do
		if (not colonist.holder or colonist.holder == self) and colonist:GetDist2D(pos) < radius then
			colonist:InterruptCommand()
		end
	end
end

function Dome:InitMaintenanceRequests() --init is 2 early, gameinit is 2 late, settemplatename is just right.
	RequiresMaintenance.InitMaintenanceRequests(self)
	self.fracture_work_request = self:AddWorkRequest("repair", 0, 0, 1)
	self.fracture_demand_request = self:AddDemandRequest("Polymers", 0, 0)
end

function Dome:GetFractureToFix()
	local fractures = self.fractures or ""
	for i=1,#fractures do	
		local fracture = fractures[i]
		if not fracture.fixing then
			return fracture
		end
	end
end

function Dome:FracturesInNeedOfResourcesCount()
	local fractures = self.fractures or ""
	local c = 0
	for i = 1, #fractures do
		c = c + (not fractures[i].fixing and 1 or 0)
	end
	
	return c
end

function Dome:DroneUnloadResource(drone, request, resource, amount)
	Building.DroneUnloadResource(self, drone, request, resource, amount)
	if request == self.fracture_demand_request then
		local amount_needed_for_one = const.DronePolymersPerFraction
		local fracture = self:GetFractureToFix()
		local fractures_that_need_fixing = self:FracturesInNeedOfResourcesCount() --total fractures that need resources
		local amount_to_fix_all_fracs = fractures_that_need_fixing * amount_needed_for_one
		local fractures_to_fix = (amount_to_fix_all_fracs - request:GetActualAmount()) / amount_needed_for_one
		
		if not drone or not fracture or fractures_to_fix <= 0 then
			return
		end
		while fractures_to_fix > 0 and fracture do
			fracture.fixing = true
			fracture = self:GetFractureToFix()
			fractures_to_fix = fractures_to_fix - 1
		end
		local req_repair = self.fracture_work_request
		req_repair:AddAmount(const.DroneFractionRepairTime)
		if not req_repair:CanAssignUnit() then
			return
		end
		local repair_amount = Min(g_Consts.DroneBuildingRepairAmount, req_repair:GetActualAmount())
		drone:SetCommand("Work", req_repair, "repair", repair_amount)
	end
end

function Dome:DroneWork(drone, request, resource, amount)
	if request == self.fracture_work_request then
		-- fixing fractures - NOTE: taken from Building:DroneWork()
		--amount keeps getting minned, so the drone can correctly assign, meanwhile however the req may have received more work.
		--cont task also mins to protect from negatives, so we should use max possible val
		amount = DroneResourceUnits.repair
		drone:PushDestructor(function(drone)
			if drone.w_request:GetActualAmount() <= 0 then
				drone.target:RemoveAllFixingFractures()
			end
		end)
		drone:ContinuousTask(
			request, amount, g_Consts.DroneBuildingRepairBatteryUse,
			"repairBuildingStart", "repairBuildingIdle", "repairBuildingEnd", "Repair", 
			function(drone, request)
				if request:GetActualAmount() % const.DroneFractionRepairTime == 0 then
					local dome = drone.target
					if dome:RemoveFixedFracture() then
						dome:VisualizeOxygenLeak()
						dome:VisualizeFractures()
					end
				end
			end)
		drone:PopAndCallDestructor()
	else
		Building.DroneWork(self, drone, request, resource, amount)
	end
end

function Dome:IsFreezing()
	return false
end

function Dome:HasPipes()
	return next(self.connected_domes) or LifeSupportGridObject.HasPipes(self)
end

function IsObjInDome(obj)
	if not IsValid(obj) then return false end
	if IsKindOfClasses(obj, "Building", "ResourcePile") then
		return obj.parent_dome
	end
	if IsKindOf(obj, "Unit") then
		return obj:CalcCurrentDome()
	end
	if IsKindOfClasses(obj, "Dome", "LifeSupportGridElement", "ElectricityGridElement") then --domes, cables and pipes are never in a dome.
		return false
	end
	if IsKindOf(obj, "Object") then
		local parent = obj:GetParent()
		if IsKindOf(parent, "Dome") then
			return parent
		end
	end
	return GetDomeAtPoint(obj)
end

function GetDomeAtPoint(...)
	local obj = ...
	local q, r = WorldToHex(...)
	local res = HexGridGetObject(ObjectGrid, q, r, "DomeInterior")
	if res then
		res = res.dome
	else
		res = HexGridGetObject(ObjectGrid, q, r, "Dome")
		res = res and not res.destroyed and res or false
		if res and IsPoint(obj) then
			local glass = res:GetCollisionGlassObj()
			local ray_start = obj:SetTerrainZ(guic)
			local ray_end = ray_start:SetZ(glass:GetObjectBBox():maxz() + guim)
			if not IntersectRayWithObject(ray_start, ray_end, glass, EntitySurfaces.Collision) then
				res = false
			end
		end
	end
	return res ~= obj and res or false
end

function GetDomeAtHex(q, r)
	if IsPoint(q) then
		q, r = WorldToHex(q)
	end
	local res = HexGridGetObject(ObjectGrid, q, r, "DomeInterior")
	if res then
		res = res.dome
	else
		res = HexGridGetObject(ObjectGrid, q, r, "Dome")
	end
	
	return res
end

function GetPointOutsideDomes(...)
	return not GetDomeAtPoint(...)
end

local large_building_query = {
	classes = "Building",
	filter = function(bld, test_pos, min_dist)
		return bld:IsLarge() and bld:IsCloser2D(test_pos, bld:GetRadius() + min_dist)
	end,
}

function IsPointNearLargeBuilding(pt, min_dist)
	large_building_query.arearadius = min_dist + GetEntityMaxSurfacesRadius()
	large_building_query.area = pt
	return CountObjects(large_building_query, pt, min_dist) ~= 0
end

DefineClass("DomePolymer_Glass", "DomeOval_Glass")
DomePolymer_Glass.entity = "DomeOval_Glass"

DefineClass.DomeBasic = {
	__parents = { "Dome" },
	configurable_attaches = {
		{"DomeBasic_Glass", "Origin"},
		{"Dome_Entrance", "Entrance"},
		{"Dome_EntranceTube", "Entrancetube"},
	},
}

DefineClass.DomeMega = {
	__parents = { "Dome" },
	configurable_attaches = {
		{"DomeMega_Glass", "Origin"},
		{"Dome_Entrance", "Entrance"},
		{"Dome_EntranceTube", "Entrancetube"},
	},
}

DefineClass.DomeMedium = {
	__parents = { "Dome" },
	configurable_attaches = {
		{"DomeMedium_Glass", "Origin"},
		{"Dome_Entrance", "Entrance"},
		{"Dome_EntranceTube", "Entrancetube"},
	},
}

DefineClass.DomeOval = {
	__parents = { "Dome" },
	configurable_attaches = {
		{"DomeOval_Glass", "Origin"},
		{"Dome_Entrance", "Entrance"},
		{"Dome_EntranceTube", "Entrancetube"},
	},
}

DefineClass.DomeStar = {
	__parents = { "Dome" },
	configurable_attaches = {
		{"DomeStar_Glass", "Origin"},
		{"Dome_Entrance", "Entrance"},
		{"Dome_EntranceTube", "Entrancetube"},
		{"DomeStar_Top", "Origin"},
	},
}

DefineClass.GeoscapeDome = {
	__parents = { "Dome" },
	configurable_attaches = {
		{"DomeGeoscape_Glass", "Origin"},
		{"DomeGeoscape_Entrance", "Entrance"},
		{"DomeGeoscape_EntranceTube", "Entrancetube"},
	},	
	air_consumption = 0,
}

function GeoscapeDome:GetEntrances()
	return self:GetAttaches("DomeGeoscape_Entrance")
end

function GeoscapeDome:OnDestroyed()
	Dome.OnDestroyed(self)
	self:DestroyAttaches("DomeGeoscapeWater")
end

DefineClass.DomeRoadConnection =
{
	__parents = { "BakedDomeDecal" },
	variant = false,
}

DefineClass.DomeGrass =
{
	__parents = { "BakedDomeDecal" },
	buildings_on_top = false,
}

DefineClass.DomeTerrain =
{
	__parents = { "CObject", "ComponentAttach" },
	enum_flags = { efSelectable = true },
}

function OnMsg.ClassesPostprocess()
	ClassDescendants("DomeRoadConnection", function(classname, class)
		local variant_str = string.match(classname, "_(%d+)$")
		local variant = variant_str and tonumber(variant_str)
		if variant then
			class.variant = variant
		end
	end)
end

if FirstLoad then
	HexRoadShapes = {}
end

function Dome:GetRoadHexes()
	local entity = self:GetEntity()
	local road_hexes = HexRoadShapes[entity]
	if not road_hexes then
		local inverse = GetEntityInverseBuildShape(entity)
		local outline = GetEntityOutlineShape(entity)
		road_hexes = {}
		for i=1,#inverse do
			local pt = inverse[i]
			local border
			local qi, ri = pt:xy()
			for j=1,#outline do
				local qj, rj = outline[j]:xy()
				if HexAxialDistance(qi, ri, qj, rj) == 1 then
					border = true
					break
				end
			end
			if not border then
				table.insert(road_hexes, pt)
			end
		end
		HexRoadShapes[entity] = road_hexes
	end
	return road_hexes
end

local function ReadRoadIdx(bld, road)
	local idx = road:GetAttachSpot()
	local name = bld:GetSpotName(idx)
	local note = GetSpotAnnotation(bld:GetEntity(), idx)
	if not note:find("road", 1, "plain") then
		return
	end
	local idx_str = note:match("road(%d+)")
	local idx = idx_str and tonumber(idx_str)
	return idx
end

function DeleteUnattachedRoads(bld, dome)
	dome = dome or bld.parent_dome
	if not dome then
		return
	end
	--DbgClear()
	local min_dist = const.GridSpacing / 2 - guim
	local dome_road_hexes = dome:GetRoadHexes()
	local to_remove, to_remain = {}, {}
	for i = bld:GetNumAttaches(), 1, -1 do
		local attach = bld:GetAttach(i)
		if IsKindOf(attach, "DomeRoadConnection") then
			local dist, x, y = HexShapeLinearDist(dome_road_hexes, dome, attach, min_dist)
			if dist then
				--DbgAddCircle(point(x, y), min_dist)
				local remain
				if dist < min_dist then
					remain = true
				elseif dist < min_dist + attach:GetRadius() + guim then
					local pos = attach:GetPos():SetInvalidZ()
					local angle = attach:GetAngle()
					local bbox = attach:GetEntityBBox()
					local edges = { bbox:ToPoints2D() }
					for k=1,4 do
						edges[k] = pos + Rotate(edges[k], angle)
					end
					local center = point(x, y)
					local pt1 = edges[4]
					for k=1,4 do
						local pt2 = edges[k]
						--DbgAddVector(pt1, pt2 - pt1, red)
						if IntersectSegmentWithCircle2D(pt1, pt2, center, min_dist) then
							remain = true
							break
						end
						pt1 = pt2
					end
				end
				(remain and to_remain or to_remove)[attach] = ReadRoadIdx(bld, attach) or false
			end
		end
	end
	
	repeat
		local changed
		for attach1, road1 in pairs(to_remove) do
			if road1 then
				for attach2, road2 in pairs(to_remain) do
					if road1 == road2 then
						to_remove[attach1] = nil
						to_remain[attach1] = road1
						changed = true
						break
					end
				end
			end
		end
	until not changed
	for attach in pairs(to_remove) do
		DoneObject(attach)
	end
	dome:UpdateRoadConnections(bld)
end

local function GetHexes(obj)
	local outline, interior = GetEntityHexShapes(obj:GetEntity())
	local hexes = table.copy(outline)
	table.append(hexes, interior)
	
	return hexes
end

function UpdateCoveredGrass(bld, dome, op)
	local bld_hexes = GetHexes(bld)
	local bld_rotation = HexAngleToDirection(bld:GetAngle())
	local bld_pos = bld:GetPos()
	local build = op == "build"
	dome:ForEachAttach("DomeGrass", function(decal)
		local offset = point(WorldToHex(decal:GetPos() - bld_pos))
		local decal_rotation = HexAngleToDirection(decal:GetAngle())
		local hexes = GetHexes(decal)
		if CheckHexSurfaces(hexes, bld_hexes, "touch", offset, decal_rotation, (bld_rotation - 1) % 6) then
			if build then
				decal.buildings_on_top = decal.buildings_on_top or {}
				table.insert(decal.buildings_on_top, bld)
				decal:ClearEnumFlags(const.efBakedTerrainDecal)
			elseif decal.buildings_on_top then
				table.remove_value(decal.buildings_on_top, bld)
				if not next(decal.buildings_on_top) then
					decal.buildings_on_top = false
					decal:SetEnumFlags(const.efBakedTerrainDecal)
				end
			end
		end
	end)
end

function Dome:GetFreeLivingSpace(count_children)
	if count_children and self.free_space_child then
		return self.free_space_child
	elseif not count_children and self.free_space_adult then
		return self.free_space_adult
	end
	local used = 0
	local capacity = 0
	for _, home in ipairs(self.labels.Residence or empty_table) do
		if not home.destroyed and (count_children or not home.children_only) then
			local home_capacity = home.capacity - home.closed
			local home_used = #home.colonists + #home.reserved
			assert(home_capacity >= home_used)
			capacity = capacity + home_capacity
			used = used + home_used
		end
	end
	local free_space = capacity - used
	if count_children then
		self.free_space_child = free_space
	else
		self.free_space_adult = free_space
	end
	return free_space
end

function Dome:HasFreeLivingSpace(count_children)
	-- GetFreeLivingSpace uses caching
	return self:GetFreeLivingSpace(count_children) > 0
end

function Dome:RecalcFreeSpace()
	self.free_space_child = nil
	self.free_space_adult = nil
end

function Dome:ReserveResidence(unit)
	if IsValid(unit.reserved_residence) and unit.reserved_residence.parent_dome==self then
		return
	end
	unit:CancelResidenceReservation()
	local estate = self.labels.Residence
	local new_home = false
	local is_child = unit.traits.Child
	for j = 1, #estate do
		local home = estate[j]
		if home:CanReserveResidence(unit) then
			if not new_home or is_child and not new_home.children_only and home.children_only then
				new_home = home
			end
		end
	end
	if new_home then
		new_home:ReserveResidence(unit)
	end
end

DefineClass.DomeMeteorFracture =
{
	__parents = {"Object"},
	--entity = "WayPoint",
	visualized = false,
	size = 250,
	dir = axis_z,
	normal = axis_z,
	fixing = false,
}

function DomeMeteorFracture:Visualize(visualized)
	if self.visualized == (visualized or false) then
		return
	end
	self.visualized = visualized
	PlayFX("OxygenLeak", visualized and "start" or "end", self, nil, nil, self.dir)
end

function DomeMeteorFracture:Done()
	self:Visualize(false)
end

DefineClass("DomeMeteorFractureSmall", "DomeMeteorFracture")
DefineClass("DomeMeteorFractureLarge", "DomeMeteorFracture")

function DomeMeteorFractureSmall:Init()
	self.size = 100 + AsyncRand(100)
end

function Dome:ApplyTraitsFilter()
	local traits_filter = self.traits_filter
	for _, colonist in ipairs(self.labels.Colonist) do
		if TraitFilterColonist(traits_filter, colonist.traits) <= 0 then
			colonist:InterruptCommand()
		end
	end
end

local function GetServiceInDome(dome, need, colonist)
	local services = dome.labels[need] or empty_table
	local fail = 1
	local rnd = GameTime()
	local max_comfort_service, max_comfort = false, 0
	local IsKindOf = IsKindOf
	for i = 1, #services do
		local service = services[1 + (i + rnd) % #services]
		if not service.working then
			fail = Max(fail, 2)
		elseif not service:HasFreeVisitSlots() then
			fail = Max(fail, 3)
		elseif not service:CanService(colonist) then
			fail = Max(fail, 4)
		else
			local service_comfort = IsKindOf(service, "Service") and service.service_comfort or 0
			if service_comfort > max_comfort then
				max_comfort, max_comfort_service = service_comfort, service
			end
		end
	end
	
	return max_comfort_service, fail
end

function Dome:GetService(need, colonist, starving)
	local max_comfort_service, fail = GetServiceInDome(self, need, colonist)
	
	if not max_comfort_service then
		--try domes connected with passages.
		for dome, conns in pairs(self.connected_domes) do
			max_comfort_service, fail = GetServiceInDome(dome, need, colonist)
			if max_comfort_service then
				break 
			end
		end
	end
	
	if max_comfort_service then
		return max_comfort_service
	end
	
	if need ~= "needFood" or not starving then
		return false, fail
	end
	
	local piles = self.labels.ResourceStockpile or empty_table
	local minpile
	for _, pile in ipairs(piles) do
		if IsValid(pile) and self:IsCloser2D(pile, minpile) and pile:CanService(colonist) then
			minpile = pile
		end
	end
	if minpile then
		return minpile
	end
	
	return false, fail
end

function Dome:GetSecurityStationDamageDecrease()
	local ss = self.labels.SecurityStation
	if not ss or #ss==0 then return 0 end
	local best_ss = table.max(self.labels.SecurityStation, function(ss) return ss.working and ss.performance or 0 end)
	return Clamp(best_ss.performance/2, 0, 80)
end

function Dome:GetNextSkinIdx(skins)
	local skin_idx = (table.find(skins, 1, self:GetEntity()) or 0) + 1
	if skin_idx > #skins then
		skin_idx = 1
	end
	return skin_idx
end

function Dome:OnSkinChanged(skin)
	Building.OnSkinChanged(self, skin)
	self.cupola_attach = false --so it passes if check
	self:InitAttaches()
end

function Dome:UpdateRoadConnections(bld, conn_type)
	if not conn_type then
		local class = self.class
		local entity = self:GetEntity()
		ForEachPreset("DomeSkins", function(preset)
			if preset.dome_type == class and preset.entity == entity and IsDlcAvailable(preset.dlc) then
				assert(not conn_type)
				conn_type = preset.road_connection
			end
		end)
		conn_type = conn_type or "DomeRoadConnection"
	end
	if not bld then
		for _, bld in ipairs(self.labels.Buildings or empty_table) do
			self:UpdateRoadConnections(bld, conn_type)
		end
	else
		for i = 1,bld:GetNumAttaches() do
			local attach = bld:GetAttach(i)
			if IsKindOf(attach, "DomeRoadConnection") and attach.variant then
				local new_entity = string.format("%s_%02d", conn_type, attach.variant)
				if attach:GetEntity() == new_entity or not IsValidEntity(new_entity) then
					return
				end
				attach:ChangeEntity(new_entity)
			end
		end
	end
end

function Dome:ChangeSkin(skin)
	--detach all fractures
	for _, fracture in ipairs(self.fractures or empty_table) do
		fracture:Detach()
	end
	
	SuspendPassEdits("Dome.ChangeSkin")
	SuspendTerrainInvalidations("Dome.ChangeSkin")
	
	self:ChangeEntity(skin[1])
	self.configurable_attaches = skin[2]
	self:OnSkinChanged(skin)
	if self.working then
		self.cupola_attach[1]:SetGameFlags(const.gofMarkVolume)
	end
	self:UpdateRoadConnections()
	
	ResumeTerrainInvalidations("Dome.ChangeSkin")
	ResumePassEdits("Dome.ChangeSkin")
	
	--reattach all fractures
	local glass = self.cupola_attach[1]
	for _, fracture in ipairs(self.fractures or empty_table) do
		glass:Attach(fracture)
		fracture:SetAttachOffset(fracture.dir)
	end
	self:VisualizeFractures()
end

function Dome:OnDomeDisconnected(other_dome)
	local container = self.labels.Workplaces
	for i = 1, #container do
		local wp = container[i]
		local workers = wp.workers
		for j = 1, #workers do
			for k = #workers[j], 1, -1 do
				local worker = workers[j][k]
				if worker.dome == other_dome then
					worker:SetWorkplace(false)
				end
			end
		end
	end
end

function Dome:HitByMeteor(meteor)
	local colonists = self.labels.Colonist or empty_table
	local martianborn_strength = g_MartianbornStrength
	for _, colonist in ipairs(colonists) do
		local traits = colonist.traits
		if not (martianborn_strength and traits.Martianborn) then
			local coward_factor = traits.Coward and 2 or 1
			local damage = g_Consts.MeteorSanityDamage * coward_factor 
			local decrease_percent = self:GetSecurityStationDamageDecrease()
			damage = damage - MulDivRound(damage, decrease_percent, 100)
			colonist:ChangeSanity(-damage, decrease_percent>0 and "meteor with securitystation" or "meteor")
		end
	end

	Msg("DomeHitByMeteor", self, meteor)
end

local function SelectDome(dir)
	local igi = GetInGameInterface()
	if igi and igi:GetVisible() then
		local domes = UICity.labels.Dome or {}
		local idx = table.find(domes, SelectedObj)
		local dome = idx and domes[idx + dir] or domes[dir == 1 and 1 or #domes]
		ViewAndSelectObject(dome)
	end
end

function CycleDomes()
	NextDome()
end

function NextDome()
	SelectDome(1)
end

function PreviousDome()
	SelectDome(-1)
end

function Dome:HasSpire()
	for _, spire in ipairs(self.labels.Spire or empty_table) do
		if not spire.bulldozed and not spire.destroyed then
			return true
		end
	end
end

function Dome:UpdateColonists()
	for _, colonist in ipairs(self.labels.Colonist or empty_table) do
		Notify(colonist, "UpdateMorale")
	end
end

function Dome:GetUISectionCitizensRollover()
	local ui_on_vacant, ui_off_vacant = GetFreeWorkplacesAround(self)
	local free_all = self:GetFreeLivingSpace(true)
	local free_adult = self:GetFreeLivingSpace()
	local texts = {
		T{7622, "<center><em>Jobs</em>"},
		T{548, "Unemployed and looking for work<right><colonist(number)>", number = self.labels.Unemployed and #self.labels.Unemployed or 0, empty_table},
		T{549, "Vacant work slots<right><colonist(number)>",  number = ui_on_vacant},
		T{550, "Disabled work slots<right><colonist(number)>",  number = ui_off_vacant},
		T{7346, "Renegades<right><colonist(number)>", number = self.labels.Renegade and #self.labels.Renegade or 0},
		T{7623, "<newline><center><em>Living space</em>"},
		T{552, "Vacant residential slots<right><colonist(number)>", number = free_adult},
		T{7624, "Vacant nursery slots<right><colonist(number)>", number = free_all - free_adult},
		T{551, "Homeless<right><colonist(number)>",   number = self.labels.Homeless and #self.labels.Homeless or 0},
		T{553, "<newline><center><em>Age Groups</em>"},
		T{554, "Children<right><colonist(number)>",   number = self.labels.Child and #self.labels.Child or 0},
		T{555, "Youth<right><colonist(number)>",      number = self.labels.Youth and #self.labels.Youth or 0},
		T{556, "Adults<right><colonist(number)>",     number = self.labels.Adult and #self.labels.Adult or 0},
		T{557, "Middle Aged<right><colonist(number)>",number = self.labels["Middle Aged"] and #self.labels["Middle Aged"] or 0},
		T{558, "Senior<right><colonist(number)>",     number = self.labels.Senior and #self.labels.Senior or 0},
		T{559, "<newline><center><em>Births</em>"},
		T {7701, "Birth Threshold<right><resource(MinComfortBirth, Comfort)> Comfort", self},
		T{560, "Males who want children<right><colonist(fertile_male)>", self},
		T{561, "Females who want children<right><colonist(fertile_female)>", self},
		T{562, "Children born<right><colonist(born_children)>", self},
		T{7769, "Homeless penalty<right><HomelessBirthRatePenalty>%", self}, 
	}
	
	if self.clones_created > 0 or #(self.labels.CloningVats or empty_table) > 0 then
		texts[#texts + 1] = T{7347, "Clones created<right><colonist(clones_created)>", self}
	end
	local alert = ""
	if self:GetHomelessBirthRatePenalty()==100 then
		texts[#texts + 1] = T{8571, "<red>Too many homeless Colonists. No more children will be born</red>"}
	elseif self.daily_birth_progress <= 0 then
		texts[#texts + 1] = T{563, "<red>No children will be born. The average Comfort of all fertile couples is too low.</red>"}
	elseif self.allow_birth then
		texts[#texts + 1] = T{564, "<green>Children will be born. The Dome is comfortable enough.</green>"}
	else
		texts[#texts + 1] = T{8738, "<green>Children will be born if births are allowed.</green>"}	
	end
	
	return table.concat(texts, "<newline><left>")
end

function Dome:GetUIWarning()
	local fractures = self:GetFracturesCount()
	if fractures > 0 then
		return T{276, "This Dome is fractured and is losing oxygen.<newline><left>Number of fractures<right><fractures><newline><left>Cost of repairs<right><polymers(number)>", number = const.DronePolymersPerFraction * fractures, fractures = fractures}
	end
	return Building.GetUIWarning(self)
end

function OpenAllDomes(city)
	city = city or UICity
	local domes = city.labels.Dome
	for _, dome in ipairs(domes) do
		dome:Open()
	end
end

function CloseAllDomes(city)
	city = city or UICity
	local domes = city.labels.Dome
	for _, dome in ipairs(domes) do
		if city.selected_dome~=dome then
			dome:Close()
		end	
	end
end

--dome skin -> {ent, {configurable_attaches}}
DefineClass.DomeSkins = {
	__parents = { "Preset" },
	
	properties = {
		{ id = "preset", name = T{3567, "Preset"}, editor = "combo", default = "Basic", items = DomeSkinsPresetsCombo },
		{ id = "dome_type", name = T{6751, "Dome type"}, editor = "combo", items = function() return ClassDescendantsList("Dome") end, default = "DomeBasic", },
		{ id = "entity", name = T{155, "Entity"}, editor = "combo", default = invalid_entity, items = function() return GetBuildingEntities(invalid_entity) end, },
		
		{ id = "road_connection", name = T{8050, "Road Connection Type"}, editor = "text", default = "DomeRoadConnection", },
		
		{ id = "cupola_entity", name = T{6752, "Cupola entity"}, editor = "combo", default = invalid_entity, items = function() return GetBuildingEntities(invalid_entity) end, },
		{ id = "cupola_attach_spot", name = T{6753, "Cupola attach spot"}, editor = "text", default = "Origin", },
		
		{ id = "entrance_entity", name = T{6754, "Entrance entity"}, editor = "combo", default = invalid_entity, items = function() return GetBuildingEntities(invalid_entity) end, },
		{ id = "entrance_attach_spot", name = T{6755, "Entrance attach spot"}, editor = "text", default = "Entrance", },
		
		{ id = "tube_entrance_entity", name = T{6756, "Tube entrance entity"}, editor = "combo", default = invalid_entity, items = function() return GetBuildingEntities(invalid_entity) end, },
		{ id = "tube_entrance_attach_spot", name = T{6757, "Tube entrance attach spot"}, editor = "text", default = "Entrancetube", },
		
		{ id = "cupola_entity_opt", name = T{6758, "Second cupola (optional)"}, editor = "combo", default = invalid_entity, items = function() return GetBuildingEntities(invalid_entity) end, },
		{ id = "cupola_attach_spot_opt", name = T{6759, "Second cupola attach spot"}, editor = "text", default = "Origin", },
		
		{ id = "construction_entity", name = T{8647, "Dome entity during construction"}, editor = "text", default = "", help = "Should have full block pass, all configurable attaches should be auto attaches for this entity"},
		
		{ id = "dlc", name = T{6760, "DLC"}, editor = "text", default = "", },
	},
}


GlobalVar("DomeSkinsCache", {})
function GetConfigAttachTableFromPreset(preset)
	local t = DomeSkinsCache[preset]
	if not t then
		t = {
			{preset.cupola_entity, preset.cupola_attach_spot},
			{preset.entrance_entity, preset.entrance_attach_spot},
			{preset.tube_entrance_entity, preset.tube_entrance_attach_spot},
		}
		
		if preset.cupola_entity_opt ~= invalid_entity then
			table.insert(t, {preset.cupola_entity_opt, preset.cupola_attach_spot_opt})
		end
		DomeSkinsCache[preset] = t
	end
	
	return t
end


function DomeSkins:SetProperty(...)
	PropertyObject.SetProperty(self, ...)
	DomeSkinsCache[self] = nil
end

DefineClass.DomeDoorWithFX = {
	__parents = { "DoorWithFX" },
}

function OnMsg.GatherFXActors(list)
	list[#list + 1] = "DomeDoorWithFX"
end

function CheatSpawnNColonists(n)
	if IsKindOf(SelectedObj,"Dome") then
		for i=1, n do
			SelectedObj:SpawnColonist(false)
		end
		SelectedObj:UpdateUI()
	else
		local domes = UICity.labels.Dome		
		if #domes>0 then
			while n>0 do
				for _, dome in ipairs(domes) do
					if n>0 then
						dome:SpawnColonist(false)
						n = n - 1
					else 
						break
					end
				end
			end
		else--no domes
			local w,h  = terrain.GetMapSize()
			local center = GetPassablePointNearby(point(w/2, h/2))
			for i=1, n do	
				local colonist_table = GenerateColonistData()
				local colonist = Colonist:new(colonist_table)
				local pos = colonist:GetRandomPos(30*guim, 2*guim, center)
				colonist:SetPos(pos or center)
				colonist.arriving = true
				colonist:SetOutside(true)
				Msg("ColonistBorn", colonist)	
			end
		end
	end
end
