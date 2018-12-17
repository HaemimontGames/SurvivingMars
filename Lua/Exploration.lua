GlobalVar("g_MapSectors", {})
GlobalVar("g_ExplorationQueue", {})
GlobalVar("g_ExplorationNotificationShown", false)
GlobalVar("g_InitialSector", false)
GlobalVar("g_MapArea", false)

SectorStatusToDisplay = {
	["unexplored"] = T(976, "Unexplored"),
	["scanned"] = T(977, "Scanned"),
	["deep scanned"] = T(978, "Deep Scanned"),
	["deep available"] = T(979, "<em>Scanned, scan again for deep deposits and Anomalies</em>"),
}

DefineClass.RevealedMapSector = {
	__parents = { "Object" },
	
	game_flags = { gofPermanent = true },
	
	properties = {
		{ id = "status", editor = "text", default = "unexplored", no_edit = true },
		{ id = "sector_x", editor = "number", default = 0, no_edit = true },
		{ id = "sector_y", editor = "number", default = 0, no_edit = true },
	},
}

function RevealedMapSector:GameInit()
	if self.sector_x > 0 and self.sector_y > 0 and #g_MapSectors > 0 and self.status ~= "unexplored" then
		--printf("loaded map sector %s: %s", g_MapSectors[self.sector_x][self.sector_y].id, self.status)
		local sector = g_MapSectors[self.sector_x][self.sector_y]
		if sector.status == "unexplored" or sector.status == "scanned" and self.status == "deep scanned" then
		sector.revealed_obj = self
		sector:Scan(self.status)
	end
end
end
--[[
function MergeRevealed()
	local objs = GetObjects{class = "RevealedMapSector", area = "realm"}
	for i = 1, #objs do
		local obj = objs[i]
		local sector = g_MapSectors[obj.sector_x][obj.sector_y]
		sector.revealed_obj = sector.revealed_obj or obj
		if sector.revealed_obj.status == "unexplored" and obj.status ~= "unexplored" then
			sector.revealed_obj.status = obj.status
		end
		if sector.revealed_obj.status == "scanned" and obj.status ~= "deep scanned" then
			sector.revealed_obj.status = obj.status
		end
		if obj ~= sector.revealed_obj then
			DoneObject(obj)
		end
	end
end--]]

local function GoToOverview()
	local dlg = GetInGameInterface()
	if dlg and dlg.mode ~= "overview" then
		dlg:SetMode("overview")
	end
end
local function GoToSector(obj, params)
	local sector = g_MapSectors[params.x][params.y]
	ViewObjectMars(sector.area:Center())
end
function UnexploredSectorsExist()
	local can_scan
	local fully_scanned = true

	local sectors = g_MapSectors
	for x = 1, const.SectorCount do
		local sectors = sectors[x]
		for y = 1, const.SectorCount do
			local sector = sectors[y]
			if sector:CanBeScanned() then
				can_scan = true
			end
			if sector.status ~= "deep scanned" then
				fully_scanned = false
			end
		end
	end
	return can_scan, fully_scanned
end
local function SetSectorSubsurfaceDepositsVisibleExpiration(sector, expiration)
	local function show_markers(markers)
		if not markers then
			return
		end
		
		for _, marker in ipairs(markers) do
			if IsValid(marker.placed_obj) then
				marker.placed_obj:SetVisibilityExpiration(expiration)
			end
		end
	end
	
	show_markers(sector.markers.subsurface)
	show_markers(sector.markers.deep)
end

DefineClass.MapSector = {
	__parents = { "Object" },
	
	id = false, -- A0 - J9
	display_name = false,
	area = false, -- aabb
	status = "unexplored", -- "unexplored", "scanned", "deep scanned"
	blocked_status = false,
	blocked_scanner = false,
	exp_resources = false, -- list of expected resources, based on terrain features (not an actual list of available resources)	
	markers = false, -- list of markers to spawn deposits when scanned, per category (terrain/surface, subsurface, deep)
	deposits = false, -- actual resources available in placed deposits per category per type
	notify_thread = false,
	
	row = false,
	col = false,
	
	scan_time = 0,
	scan_progress = 0,
	
	decal = false,
	queue_text = false,
	play_ratio = 0,
	revealed_obj = false,
	scan_obj = false,
	
	revealed_surf = false,
	revealed_deep = false,	
}

function MapSector:GetDisplayName()
	return Untranslated(self.display_name)
end

function MapSector:CanBeScanned()
	if self:HasBlockers() then
		return false
	end
	if self.status == "deep scanned" then
		return false
	end
	if self.status == "unexplored" then
		return true
	end
	
	return g_Consts.DeepScanAvailable ~= 0
end

GlobalVar("MapSectorNotifyThread", false)

local function CheckScanAvailability()
	-- scan availability notification
	local can_scan, fully_scanned = UnexploredSectorsExist()
	if not can_scan then
		RemoveOnScreenNotification("SectorScanAvailable")
	end
	if fully_scanned then
		MapDelete(true, "OrbitalProbe")
	end
	RefreshSectorInfopanel(g_ExplorationQueue[1])
end

local function OnDepositsSpawned()
	if GetInGameInterfaceMode() == "overview" then
		GetInGameInterfaceModeDlg():ScaleSmallObjects(0, "up")
	end
	Msg("DepositsSpawned")
end

function MapSector:HasBlockers()
	for _, marker in ipairs(self.markers.block or empty_table) do
		local deposit = marker.is_placed and marker:PlaceDeposit()
		if deposit and deposit:IsExplorationBlocked() then
			return true
		end
	end
end

function MapSector:HasMarkersOfType(class, list)
	if not list then
		for t, markers in pairs(self.markers) do
			if self:HasMarkersOfType(class, markers) then
				return true
			end
		end
		return false
	end
	for _, marker in ipairs(list) do
		if IsKindOf(marker, class) then
			return true
		end
	end
end

GlobalVar("DeepSectorsScanned", 0)

function MapSector:Scan(status, scanner)
	if status == "unexplored" or status == self.status then
		return
	end
	self.scan_progress = 0
	
	-- exploration queue
	self:RemoveFromQueue()
	DelayedCall(0, CheckScanAvailability)
	
	if self:RevealDeposits(self.markers.block, self.deposits.block) > 0 then
		Msg("ExplorationBlockerSpawned")
	end
	if self:HasBlockers() then
		self.blocked_status = status
		self.blocked_scanner = scanner
		self:UpdateDecal()
		RefreshSectorInfopanel(self)
		return
	end
	self.blocked_status = nil
	self.blocked_scanner = nil
	
	-- save map compatibility	
	self.revealed_obj = self.revealed_obj or RevealedMapSector:new{sector_x = self.col, sector_y = self.row}
	self.revealed_obj.status = status
	self.revealed_surf = {}
	self.revealed_deep = {}
	
	-- spawn deposits
	local placed = 0
	if self.status == "unexplored" then
		placed = placed + self:RevealDeposits(self.markers.surface, self.deposits.surface, nil, self.revealed_surf)
		placed = placed + self:RevealDeposits(self.markers.subsurface, self.deposits.subsurface, nil, self.revealed_deep)
	end
	if status == "deep scanned" then	
		placed = placed + self:RevealDeposits(self.markers.deep, self.deposits.deep, nil, self.revealed_deep)
	elseif status == "scanned" and scanner == "probe" and GetMissionSponsor().id == "BlueSun" then
		placed = placed + self:RevealDeposits(self.markers.deep, self.deposits.deep, "PreciousMetals", self.revealed_deep)
	end	
	if placed > 0 then
		DelayedCall(0, OnDepositsSpawned) --@ end of current tick
	end

	-- update status
	local old_status = self.status
	self.status = status

	-- visuals
	self:UpdateDecal()
	
	-- scan notification & results
	DeleteThread(self.notify_thread)
	self.notify_thread = CreateGameTimeThread(function(self, status, old_status)
		Sleep(10) -- allow newly placed deposits to GameInit properly
		
		local texts = {}
		self:GatherResourceTexts(texts, old_status, "short", "new")
		
		local results
		if #texts == 0 then
			results = T(980, "No resources")
		else		
			results = table.concat(texts, " ")
		end
		
		DeepSectorsScanned = DeepSectorsScanned + (status == "deep scanned" and 1 or 0)
		
		AddOnScreenNotification("SectorScanned", GoToSector, {name = self.display_name, results = results, x = self.col, y = self.row})
		Msg("SectorScanned", status, self.col, self.row)
		local research_points = GetMissionSponsor().research_points_per_explored_sector or 0
		if research_points > 0 and GameTime() > 100 then
			GrantResearchPoints(research_points)
		end
		local expiration = OnScreenNotificationPresets["SectorScanned"].expiration
		SetSectorSubsurfaceDepositsVisibleExpiration(self, expiration)
		
		self.revealed_surf = nil
		self.revealed_deep = nil
	end, self, status, old_status)

	-- infopanels
	RefreshSectorInfopanel(self)
end

function MapSector:GetTowerBoost(city)
	if not IsValid(self) then
		assert(false, "Invalid sector")
		return 0
	end
	local best
	local max_range = const.SensorTowerScanBoostMaxRange
	local min_range = const.SensorTowerScanBoostMinRange
	local boost = 0
	for _, tower in ipairs(city.labels.SensorTower or empty_table) do
		if tower.working then
			boost = boost + 1
			best = IsCloser2D(self, tower, best or max_range) and tower or best
		end
	end
	boost = Min(boost * const.SensorTowerCumulativeScanBoost, const.SensorTowerCumulativeScanBoostMax)
	if best then
		boost = boost + MulDivRound(const.SensorTowerScanBoostMax, 
			Min(max_range - min_range, max_range - self:GetDist2D(best)), 
			max_range - min_range)
	end
	return boost
end

function MapSector:RemoveFromQueue()
	if self.queue_text then
		DoneObject(self.queue_text)
		self.queue_text = nil
	end
	
	local idx = table.find(g_ExplorationQueue, self)
	if idx then
		table.remove(g_ExplorationQueue, idx)		
		if idx == 1 then
			self:SetScanFx(false)
			if #g_ExplorationQueue > 0 and GetInGameInterfaceMode() == "overview" then
				g_ExplorationQueue[1]:SetScanFx(true)
			end			
		end
		DisplayExplorationQueue()
	end
end

function MapSector:SetScanFx(enable, initial)
	if enable and not IsValid(self.scan_obj) then
		self.scan_obj = PlaceParticles("SensorTower_Sector_Scan")
		self.scan_obj:SetPos(self:GetPos())
		if not initial then
			PlayFX("SectorScan", "start") -- for sound
		end
	elseif not enable then
		if IsValid(self.scan_obj) then
			DoneObject(self.scan_obj)
			self.scan_obj = nil
		end
	end		
end

function MapSector:UpdateDecal()
	if IsValid(self.decal) then
		DoneObject(self.decal)
		self.decal = nil		
	end
	if self:HasBlockers() then
		self.decal = PlaceObject("SectorUnexplored")
		self.decal:SetColorModifier(red)
	elseif self.status == "unexplored" then
		self.decal = PlaceObject("SectorUnexplored")
	elseif self.status == "scanned" and UICity and g_Consts.DeepScanAvailable ~= 0 then
		self.decal = PlaceObject("SectorScanned")
	end	

	if IsValid(self.decal) then
		if GetInGameInterfaceMode() ~= "overview" then
			self.decal:ClearEnumFlags(const.efVisible)
		end
		
		self.decal:SetPos(self:GetPos())
		self.decal:SetScale(MulDivRound(self.area:sizex(), 100, 100*guim)+1) -- +1 to compensate rounding error
	end
end

--[[
function IsDepositObstructed_Lua(x, y, radius)
	local q, r = WorldToHex(x, y)
	if HexGetBuildingOrCable(q, r) then
		return true
	end
	
	-- check surronding hexes if the area overlaps them
	local pos = point(x, y)
	local center = point(HexToWorld(q, r))
	for i = 1, #HexSurroundingsCheckShape do
		local dq, dr = HexSurroundingsCheckShape[i]:xy()
		
		if dq ~= 0 or dr ~= 0 then
			local adj_center = point(HexToWorld(q+dq, r+dr))
			local v = adj_center - center

			local edge_center = center + v/2		
			local edge_vector = SetLen(point(v:y(), -v:x()), const.HexSize)
			
			if IntersectLineWithCircle2D(edge_center - edge_vector/2, edge_center + edge_vector/2, pos, radius) then
				if HexGetBuildingOrCable(q+dq, r+dr) then
					return true
				end
			end
		end
	end
	
	return false
end

local IsDepositObstructed_C = IsDepositObstructed
function IsDepositObstructed(...)
	local res1 = IsDepositObstructed_Lua(...) or false
	local res2 = IsDepositObstructed_C(...) or false
	assert(res1 == res2)
	return res2
end
--]]

--[[
function dbgHexObstructors(radius)
	DbgClearVectors()
	
	local pt = GetTerrainCursor()
	radius = radius or 3*guim
	
	local q, r = WorldToHex(pt)
	
	local center = point(HexToWorld(q, r)):SetTerrainZ()
	
	DbgAddVector(center, point(0, 0, 10*guim), RGB(0, 255, 0))
	DbgAddCircle(center, const.HexSize, RGB(0, 255, 0))
	
	DbgAddCircle(pt, radius, RGB(255, 0, 255))
	
	for i = 1, #HexSurroundingsCheckShape do
		local dq, dr = HexSurroundingsCheckShape[i]:xy()
		
		if dq ~= 0 or dr ~= 0 then
			local adj = point(HexToWorld(q+dq, r+dr)):SetTerrainZ()
			local v = adj - center
			local edge_center = center + v/2
			DbgAddVector(center, v, RGB(255, 255, 0))
			
			local edge_vector = SetLen(point(v:y(), -v:x()), const.HexSize)
			
			if IntersectLineWithCircle2D(edge_center - edge_vector/2, edge_center + edge_vector/2, pt, radius) then
				DbgAddVector(edge_center - edge_vector/2, edge_vector, RGB(255, 0, 0))
			else
				DbgAddVector(edge_center - edge_vector/2, edge_vector, RGB(0, 255, 255))
			end
		end
	end
end--]]

function MapSector:GetDepositList(marker)
	local depth_class = marker:GetDepthClass()
	local list = self.markers[depth_class]
	assert(list, "unexpected deposit marker class")
	return list
end

function MapSector:RegisterDeposit(marker)
	local list = self:GetDepositList(marker)
	if list and not list[marker] then
		list[#list + 1] = marker
		list[marker] = true
	end
end

function MapSector:UnregisterDeposit(marker)
	local list = self:GetDepositList(marker)
	if list and list[marker] then
		table.remove_entry(list, marker)
		list[marker] = nil
	end
end

function GetMapSectorTile()
	local border = mapdata.PassBorder or 0
	local width = terrain.GetMapWidth()
	local height = terrain.GetMapHeight()
	assert(width == height) -- the selection art assumes square shape
	return (width - 2 * border) / 10
end

local function PosToSectorXY(x, y)
	assert(hr.CameraRTSBorderAtMinZoom == hr.CameraRTSBorderAtMaxZoom)
	local border = mapdata.PassBorder or 0
	x, y = x - border, y - border	
	local tile = GetMapSectorTile()
	return Clamp(1 + x / tile, 1, 10), Clamp(1 + y / tile, 1, 10)
end

function MapSector:RevealDeposits(list, amounts, resource, revealed_list)
	local city = UICity
	local placed = 0
	for i = 1, #(list or "") do
		local marker = list[i]
		if IsValid(marker) and not marker.is_placed and (not resource or marker.resource == resource) then
			local deposit = marker:PlaceDeposit()
			if deposit then
				if amounts and deposit.resource then
					amounts[deposit.resource] = (amounts[deposit.resource] or 0) + deposit.max_amount
				end
				placed = placed + 1
				if revealed_list then
					revealed_list[placed] = marker
				end
				if IsKindOf(deposit, "ExplorableObject") then
					deposit:SetRevealed(true)
				end
			end
		end
	end
	return placed
end

local function ProcessDepositMarkers(markers, amounts)
	for i = 1, #markers do
		local marker = markers[i]
		local deposit = marker.placed_obj
		if marker.is_placed and IsValid(deposit) and IsKindOf(deposit, "Deposit") then
			local resource = deposit.resource
			local amount = 0
			
			if IsKindOf(deposit, "SurfaceDeposit") then
				amount = deposit.transport_request and deposit.transport_request:GetActualAmount() or deposit.max_amount
			elseif IsKindOf(deposit, "SubsurfaceDeposit") and not TerrainDeposits[resource] then
				amount = deposit.amount
			elseif IsKindOf(deposit, "TerrainDeposit") then
				amount = deposit:GetAmount()
			end
			
			if amount > 0 then
				amounts[resource] = (amounts[resource] or 0) + amount
			end
		end
	end
end

function MapSector:GatherResourceTexts(texts, prev_status, short, new_only)
	if self.status == "unexplored" then
		return
	end

	local amounts = { {}, {} } -- [1] is surface amounts, [2] is subsurface amounts
	
	if new_only then
		ProcessDepositMarkers(self.revealed_surf, amounts[1])
		ProcessDepositMarkers(self.revealed_deep, amounts[2])
	else	
		ProcessDepositMarkers(self.markers.surface, amounts[1])
		ProcessDepositMarkers(self.markers.subsurface, amounts[2])
		ProcessDepositMarkers(self.markers.deep, amounts[2])
	end
	
	local count = #texts
	for _, resource_desc in ipairs(ResourceDescription) do
		local res = resource_desc.name
		for i = 1, 2 do 
			local amount = amounts[i][res]
			local show_subsurface_icon = i == 2 and res == "Metals"
			if amount and amount > 0 then
				if short then
					texts[#texts + 1] = T{722, "<resource(amount,res)>", 
							amount = amount, 
							res = show_subsurface_icon and res.."Deep" or res}
				elseif show_subsurface_icon then
					texts[#texts + 1] = T{981, "Underground <display_name><right><resource(amount,res)>", 
							amount = amount, 
							res = show_subsurface_icon and res.."Deep" or res,
							resource_desc}
				else
					texts[#texts + 1] = T{982, "<display_name><right><resource(amount,res)>", 
							amount = amount, 
							res = res, 
							resource_desc}
					end
			end
		end
	end
--[[	if #texts > count then
		table.insert(texts, count+1, T{"Deposit Resources:"})
	end]]--
end

function MapSector:QueueForExploration(add_first)
	if g_Tutorial and not g_Tutorial.EnableExploration then
		return
	end

	PlayFX("SectorClick", "start")
	local max = const.ExplorationQueueMaxSize
	local queued = #g_ExplorationQueue 
	if self:CanBeScanned() and queued <= max then
		local idx = table.find(g_ExplorationQueue, self)
		if idx and idx>1 and add_first then
			self:RemoveFromExplorationQueue(idx)
			self:QueueForExploration(add_first)
		elseif not idx and queued < max then
			if add_first then
				table.insert(g_ExplorationQueue,1,self)
			else
				g_ExplorationQueue[#g_ExplorationQueue + 1] = self
			end	
			DisplayExplorationQueue()
			if #g_ExplorationQueue == 1 or add_first then
				if add_first and g_ExplorationQueue[2] then
					g_ExplorationQueue[2]:SetScanFx(false)
				end
				self:SetScanFx(true)
			end
			HintDisable("HintScanningSectors")
			return true
		else
			return false
		end
	end
	PlayFX("SectorScanInvalid", "start", nil, nil, self.area:Center():SetTerrainZ())
	return false
end

function MapSector:RemoveFromExplorationQueue(idx)
	local idx = idx or table.find(g_ExplorationQueue, self)
	if idx then
		PlayFX("SectorCancel", "start")
		table.remove(g_ExplorationQueue, idx)
		if self.queue_text then
			DoneObject(self.queue_text)
			self.queue_text = nil
		end
		if idx == 1 then
			self:SetScanFx(false)
			if #g_ExplorationQueue > 0 then
				g_ExplorationQueue[1]:SetScanFx(true)			
			end
		end
		DisplayExplorationQueue()
		return true
	end
end

function GetMapSector(x, y)
	if IsPoint(x) then
		x, y = x:xy()
	elseif IsValid(x) then
		x, y = x:GetVisualPosXYZ()
	elseif not x then
		return
	end
	return GetMapSectorXY(x, y)
end

function GetMapSectorXY(mx, my)
	local x, y = PosToSectorXY(mx, my)
	local row = x and g_MapSectors[x]
	return row and row[y]
end

function DisplayExplorationQueue(initial) -- create/update visuals
	if GetInGameInterfaceMode() ~= "overview" then
		return
	end
	
	for i = 1, #g_ExplorationQueue do
		local sector = g_ExplorationQueue[i]
		if i == 1 then
			if sector.queue_text then
				DoneObject(sector.queue_text)
				sector.queue_text = nil
			end
			if initial then
				sector:SetScanFx(true, initial)
			end
		else
			if not sector.queue_text then
				sector.queue_text = PlaceObject("Text",{text_style = "ExplorationSector"})
			end
			sector.queue_text:SetText("" .. (i-1))
			sector.queue_text:SetPos(sector.area:Center())
		end
	end
end

function HideExplorationQueue()
	for i = 1, #g_ExplorationQueue do
		local sector = g_ExplorationQueue[i]
		if sector.queue_text then
			DoneObject(sector.queue_text)
			sector.queue_text = nil
		end
	end
	if #g_ExplorationQueue > 0 then
		g_ExplorationQueue[1]:SetScanFx(false)
	end
end

function ShowExploration(time)
	local sectors = g_MapSectors
	if #sectors > 0 then
		for x = 1, const.SectorCount do
			local sectors = sectors[x]
			for y = 1, const.SectorCount do
				local decal = sectors[y].decal
				if IsValid(decal) then
					decal:SetEnumFlags(const.efVisible)
				end
			end
		end
	end
	DisplayExplorationQueue(true)
end

function HideExploration(time)
	local sectors = g_MapSectors
	if #sectors > 0 then
		for x = 1, const.SectorCount do
			local sectors = sectors[x]
			for y = 1, const.SectorCount do
				local decal = sectors[y].decal
				if IsValid(decal) then
					decal:ClearEnumFlags(const.efVisible)
				end
			end
		end
	end
	HideExplorationQueue()
end

function UpdateScannedSectorVisuals(status)
	local sectors = g_MapSectors
	if #sectors > 0 then
		for x = 1, const.SectorCount do
			local sectors = sectors[x]
			for y = 1, const.SectorCount do
				local sector = sectors[y]
				if not status or sector.status == status then
					sector:UpdateDecal()
				end
			end
		end
	end
end

function City:ExplorationTick()
	local deep = g_Consts.DeepScanAvailable ~= 0

	if #g_ExplorationQueue > 0 then
		RemoveOnScreenNotification("SectorScanAvailable")
		local sector = g_ExplorationQueue[1]
		
		-- tower boost
		local boost = sector:GetTowerBoost(self)
		
		-- calc scan progress
		local scan_rate = MulDivRound(g_Tutorial and g_Tutorial.SectorScanBase or const.SectorScanBase, 100 + boost, 100)
		local scan_time = sector.scan_time
		local scan_last = MulDivRound(scan_time, scan_rate, const.HourDuration)		
		scan_time = scan_time + const.ScanTick
		sector.scan_time = scan_time
		local scan_now = MulDivRound(scan_time, scan_rate, const.HourDuration)
		
		sector.scan_progress = sector.scan_progress + scan_now - scan_last
		
		local target = deep and const.SectorDeepScanPoints or const.SectorScanPoints
		if IsGameRuleActive("FastScan") then
			target = target / 10
		end
		
		if sector.scan_progress >= target then			
			sector:Scan(deep and "deep scanned" or "scanned")
			g_ExplorationNotificationShown = false
		end
	else
		local unexplored = UnexploredSectorsExist()
				
		if unexplored and not g_ExplorationNotificationShown and (not g_Tutorial or g_Tutorial.EnableExplorationWarning) then
			AddOnScreenNotification("SectorScanAvailable", GoToOverview)
			g_ExplorationNotificationShown = true
		end
	end
end

function InitSector(sector, eligible)
	sector.exp_resources = {}
	sector.markers = {
		surface = {},
		subsurface = {},
		deep = {},
		block = {},
	}
	sector.deposits = {
		surface = {},
		subsurface = {},
		deep = {},
		block = {},
	}

	sector:SetPos(sector.area:Center())
	sector:UpdateDecal()

	-- enum & process markers
	local exec = function(marker)
		if IsKindOf(marker, "PrefabFeatureMarker") then -- data to display as expected findings prior to exploration
			local ft = marker.FeatureType
			local feature = rawget(PrefabFeatures, ft) or ""
			for j = 1, #feature do
				local char = feature[j]
				if char.class == "PrefabFeatureChar_Deposit" then
					local resource = char.DepositResource
					if resource and not sector.exp_resources[resource] then
						sector.exp_resources[#sector.exp_resources + 1] = resource
						sector.exp_resources[resource] = true
					end
				elseif char.class == "PrefabFeatureChar_Effect" then
					local deposit_class = char.EffectType
					local classdef = g_Classes[deposit_class]
					if not sector.exp_resources[deposit_class] and classdef.list_as_sector_expected then
						sector.exp_resources[#sector.exp_resources + 1] = deposit_class
						sector.exp_resources[deposit_class] = true
					end
				end
			end
		else -- deposit markers
			sector:RegisterDeposit(marker)
			local list
			if IsKindOfClasses(marker, "TerrainDepositMarker", "SurfaceDepositMarker") then
				if not eligible[sector] and sector.row > 1 and sector.row < const.SectorCount and sector.col > 1 and sector.col < const.SectorCount then
					eligible[#eligible + 1] = sector
					eligible[sector] = true
				end
			end
		end
	end
	MapForEach(sector.area, "PrefabFeatureMarker", "DepositMarker", exec)
end

function OnMsg.LoadGame()
	MapForEach(true, 
		"MapSector", 
		function(sector)
			sector:SetPos(sector.area:Center())
		end)
end

function InitialReveal(eligible, trand)
	local filtered, best = {}, {}
	local has_metals, has_concrete = {}, {}
	
	local qty_per_sector = {}
		
	for i = 1, #eligible do
		-- calculate the max amounts of surface resources from deposit markers
		local qtys = {}
		local sector = eligible[i]
		for j = 1, #sector.markers.surface do
			local marker = sector.markers.surface[j]
			if DepositResources[marker.resource] then
				local amount
				if IsKindOf(marker, "SurfaceDepositMarker") then
					amount = marker:GetEstimatedAmount()
				else
					amount = marker.max_amount
				end
				qtys[marker.resource] = (qtys[marker.resource] or 0) + amount
			end
		end
		--[[
		local text = "sector " .. sector.id .. ": "
		for k, v in pairs(qtys) do
			text = text .. v .. " " .. k .. " "
		end
		
		print(text)--]]
		if (qtys.Metals or 0) >= 50 then
			if qtys.Concrete then
				best[#best + 1] = sector
			else
				filtered[#filtered + 1] = sector
			end
		end
		if qtys.Metals then
			has_metals[#has_metals + 1] = sector
		end
		if qtys.Concrete then
			has_concrete[#has_concrete + 1] = sector
		end
		qty_per_sector[sector.id] = qtys
	end
	
	local function weight_func(sector)
		return MulDivRound(sector.play_ratio, sector.avg_heat, const.MaxHeat)
	end
	
	if #best > 0 then
		-- start in a single sector featuring both resources
		local sector = trand(best, weight_func)
		return { sector }
	end
		
	local sector
	-- no single sectors matching the selection criteria, fallback to sectors with enough metals
	if #filtered > 0 then
		sector = trand(filtered, weight_func)
	else
		print("no sectors found with enough average expected metals")
		if #has_metals > 0 then
			-- pick the one with most metals, add other sector for concrete later
			table.sort(has_metals, function(a, b) return qty_per_sector[a.id].Metals > qty_per_sector[b.id].Metals end)
			sector = has_metals[1]
		elseif #has_concrete > 0 then
			print("no sectors metals expected at all")
			sector = trand(has_concrete)
			return {sector}
		else
			print("no resources expected at all on the map")
			sector = trand(eligible)
			return {sector}
		end
	end
		
	-- sector selected, but only has metals, pick the nearest one having concrete
	local revealed = { sector }
	if #has_concrete > 0 then
		local pt = sector.area:Center()
		table.sort(has_concrete, function(a, b) return a.area:Dist2D(pt) < b.area:Dist2D(pt) end)			
		revealed[2] = has_concrete[1]
	end
	
	return revealed
end

--[[
function RenameSectors()
	local orient = mapdata.OverviewOrientation
	for j = 1, const.SectorCount do
		local row = g_MapSectors[j]
		for i = 1, const.SectorCount do
			local sector = row[i]
			local name
			if orient == 0 then
				name = string.char(string.byte("A") + 10 - j) .. (i - 1)
			elseif orient == 90 then
				name = string.char(string.byte("A") + 10 - i) .. (10 - j)
			elseif orient == 180 then
				name = string.char(string.byte("A") + j - 1) .. (10 - i)
			elseif orient == 270 then
				name = string.char(string.byte("A") + i - 1) .. (j - 1)
			end
			sector.id = name
			sector.display_name = name
		end
	end
end--]]

function City:InitExploration()
	if not mapdata.GameLogic then return end

	MapForEach("map", "Deposit", DoneObject)

	assert(hr.CameraRTSBorderAtMinZoom == hr.CameraRTSBorderAtMaxZoom)
	
	local border = mapdata.PassBorder or 0
	local tile = GetMapSectorTile()
	local eligible = {} -- list of sectors containing surface deposits
	
	local orient = mapdata.OverviewOrientation
	local UnbuildableZ = buildUnbuildableZ()
	
	local rand, trand = self:CreateMapRand("Exploration")

	if not g_BuildableZ then
		WaitMsg("BuildableGridReady")
	end
	
	for j = 1, const.SectorCount do
		local row = {}
		g_MapSectors[j] = row
		local x = border + (j - 1) * tile
		for i = 1, const.SectorCount do
			local name
			if orient == 0 then
				name = string.char(string.byte("A") + 10 - j) .. (i - 1)
			elseif orient == 90 then
				name = string.char(string.byte("A") + 10 - i) .. (10 - j)
			elseif orient == 180 then
				name = string.char(string.byte("A") + j - 1) .. (10 - i)
			elseif orient == 270 then
				name = string.char(string.byte("A") + i - 1) .. (j - 1)
			end
			local y = border + (i - 1) * tile
			local bbox = box(x, y, x + tile, y + tile)
			local sector = MapSector:new{
				id = name, 
				display_name = name,
				area = bbox,
				play_ratio = BuildableGridRatio(g_BuildableZ, UnbuildableZ, 100, bbox),
				avg_heat = GetAverageHeatIn(bbox),
				row = i,
				col = j,
			}
			InitSector(sector, eligible)			
			row[i] = sector
			g_MapSectors[sector] = true
		end
	end

	g_MapArea = box(g_MapSectors[1][1].area:min(), g_MapSectors[const.SectorCount][const.SectorCount].area:max())

	if MapCount(true, "RevealedMapSector") == 0 then
		SuspendPassEdits("InitialExplore")
		
		-- find sector(s) to initially reveal	
		local revealed = InitialReveal(eligible, trand) or ""
		
		local igi = GetInGameInterface()
		
		for i = 1, #revealed do
			if not g_InitialSector then
				g_InitialSector = revealed[i]
				if igi and igi.mode == "overview" then
					igi.mode_dialog.exit_to = g_InitialSector.area:Center()
				end
			end
			revealed[i]:Scan("scanned")
			print("starting sector selected: " .. revealed[i].id)
		end
		
		if g_InitialSector then
			local deposit, resource
			local profile = GetCommanderProfile().id
			
			if profile == "hydroengineer" then
				deposit, resource = "SubsurfaceDepositWater", "Water"
			elseif profile == "astrogeologist" then
				deposit, resource = "SubsurfaceDepositPreciousMetals", "PreciousMetals"
			end
			
			if deposit and MapCount("map", deposit) == 0 then
				local marker = MapFindNearest(g_InitialSector.area:Center(), "map", "SubsurfaceDepositMarker", function(o)
						return not o.is_placed and o.resource == resource and o.depth_layer <= 1
					end)
				if marker then
					marker.revealed = true
					marker:PlaceDeposit()
					if GetInGameInterfaceMode() == "overview" then
						GetInGameInterfaceModeDlg():ScaleSmallObjects(0, "up")
					end
				end
			end
		end
		
		if #revealed > 0 then			
			if GetInGameInterfaceMode() == "overview" then
				local overview_dialog = GetInGameInterfaceModeDlg()
				local last_revealed = revealed[#revealed]
				overview_dialog:SelectSector(last_revealed, nil, "forced")
			end
		end
		
		ResumePassEdits("InitialExplore")
	end
			
	-- exploration thread
	CreateGameTimeThread(function(self)
		while true do
			self:ExplorationTick()
			Sleep(const.ScanTick)
		end
	end, self)
	
	Msg("MapSectorsReady")
end


function OnMsg.TechResearched(tech_id, city)
	local def = TechDef[tech_id]
	local resource, anomaly
	
	if tech_id == "CoreMetals" then
		resource = "Metals"
	elseif tech_id == "CoreWater" then
		resource = "Water"
	elseif tech_id == "CoreRareMetals" then
		resource = "PreciousMetals"
	elseif tech_id == "AlienImprints" then
		anomaly = true
	end
	
	if not resource and not anomaly then return end
	
	CalcBuildableGrid()
	local UnbuildableZ = buildUnbuildableZ()
	
	local num = city:Random(def.param1, def.param2)
	for i = 1, num do
		local marker
		if resource then
			marker = PlaceObject("SubsurfaceDepositMarker")
			marker.resource = resource
			marker.grade = "Very High"
			marker.max_amount = def.param3 * const.ResourceScale
			marker.depth_layer = 2
		else
			-- anomaly
			marker = PlaceObject("SubsurfaceAnomalyMarker")
			marker.sequence = "Alien Artifacts"
			marker.sequence_list = "BreakthroughAlienArtifacts"
			marker.tech_action = "aliens"
		end

		-- pick position		
		for i = 1, 50 do
			local sector_x = city:Random(1, 10)
			local sector_y = city:Random(1, 10)
			local sector = g_MapSectors[sector_x][sector_y]
			
			--local maxx, maxy = sector.area:
			local minx, miny = sector.area:minxyz()		
			local maxx, maxy = sector.area:maxxyz()
			
			local x = city:Random(minx, maxx)
			local y = city:Random(miny, maxy)
			
			local q, r = WorldToHex(x, y)
			local pt = point(x, y)
			if GetBuildableZ(q, r) ~= UnbuildableZ and terrain.IsPassable(pt) then
				marker:SetPos(pt)
				break
			end
		end
		
		if marker:IsValidPos() then
			marker.revealed = true
			marker:PlaceDeposit()
		else
			printf("couldn't find position to place %s deposit", resource)
			DoneObject(marker)
		end
	end
end
