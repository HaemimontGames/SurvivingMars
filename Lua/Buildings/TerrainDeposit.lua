	TerrainDeposits = { "Concrete" }
for i=1,#TerrainDeposits do
	TerrainDeposits[TerrainDeposits[i]] = true
end

local rscale = const.ResourceScale
local type_tile = terrain.TypeTileSize()
local noise_size = 128
local noise_center = point(noise_size / 2, noise_size / 2)

GlobalVar("TerrainDepositGrid", function()
	if HexMapWidth == 0 or HexMapHeight == 0 then return false end
	return NewHierarchicalGrid(HexMapWidth, HexMapHeight, const.DepositGridTile, const.DepositGridBits)
end)

GlobalVar("MaxTerrainDepositRadius", 0)

TerrainDepositsInfo = {
	Concrete = {
		deposit_class = "TerrainDepositConcrete",
		
		gtype = 1, -- mark the deposit type in the deposit grid
		granularity = 1, -- make possible storring larger amounts in a grid with fewer bits per element
		
		terrain = "Regolith",
		density = 60, -- resources per terrain tile (terrain)
		
		terrain2 = "Regolith_02",
		density2 = 110, -- resources per terrain tile (terrain2)
		
		-- used for procedural generation only:
		volume_to_dist2 = { -- volume to distance into the cloud
			1500*1000,-- dist 1 (maximum terrain2)
			1200*1000,-- dist 2
			 900*1000,-- dist 3
			 600*1000,-- dist 4
			 300*1000,-- dist 5 (minimum terrain2)
		}, 
		form =  "ConcreteForm",
		noise = "ConcreteNoise",
		
		-- used for debug visualization:
		color_min = RGBA(255, 255, 255, 196),
		color_max = RGBA(0, 0, 255, 196),
	},
}

for dname, params in pairs(TerrainDepositsInfo) do
	params.terrain_idx = params.terrain and GetTerrainTextureIndex(params.terrain)
	params.terrain2_idx = params.terrain2 and GetTerrainTextureIndex(params.terrain2)
	TerrainDepositsInfo[params.gtype] = params
end

local function PrefabDepositMarkers(self)
	local items = {}
	local res_tag = string.lower(self.resource)
	for i=1,#PrefabMarkers do
		local marker = PrefabMarkers[i]
		if marker.max_radius > 0 then
			local tags = marker.filter_tags or empty_table
			if tags.deposit and tags[res_tag] then
				items[#items + 1] = PrefabMarkers[marker]
			end
		end
	end
	table.sort(items)
	table.insert(items, 1, "")
	return items
end

DefineClass.TerrainDepositMarker = {
	__parents = { "DepositMarker" },
	properties = {
		{ category = "Deposit", name = T{817, "Resource "}, id = "resource",    editor = "combo",        default = TerrainDeposits[1] or "", items = TerrainDeposits, buttons = {{"Reapply", "ActionDepositReapply"}} },	
		{ category = "Deposit", name = T{1000100, "Amount"},    id = "max_amount",  editor = "number",       default = 1000*rscale, min = 0, scale = rscale, help = "Used for the procedural generation only" },
		{ category = "Deposit", name = T{16, "Grade"},     id = "grade",       editor = "dropdownlist", default = "Average", items = DepositGradesTable, object_update = true },
		{ category = "Deposit", name = T{637, "Prefab"},    id = "prefab",      editor = "combo",        default = "", items = PrefabDepositMarkers },
		{ category = "Deposit", name = T{818, "Density 1"}, id = "density",     editor = "number",       default = -1 },
		{ category = "Deposit", name = T{819, "Density 2"}, id = "density2",    editor = "number",       default = -1 },
	},
	deposit = false,
	new_pos_if_obstruct = false,
}

function TerrainDepositMarker:GetEstimatedAmount()
	return self.max_amount
end

function TerrainDepositMarker:PostLoad()
	local rinfo = Resources[self.resource]
	self:SetColorModifier(rinfo and rinfo.color or const.clrNoModifier)
end

function TerrainDepositMarker:OnPropertyChanged(prop_id, old_value)
	if prop_id == "resource" then
		local deposit = self:PlaceDeposit()
		if deposit then
			deposit:EditorShowRange(IsEditorActive())
		end
		self:PostLoad()
	end
end

function TerrainDepositMarker:ActionDepositReapply(obj)
	obj = obj or self
	local deposit = obj:PlaceDeposit()
	if deposit then
		deposit:EditorShowRange(IsEditorActive())
	end
end

function TerrainDepositMarker:GetObstructionRadius()
	local marker = PrefabMarkers[self.prefab]
	return marker and marker.max_radius * type_tile or const.DepositObstructMaxRadius
end

function TerrainDepositMarker:SpawnDeposit(rand)
	local start_time = GetPreciseTicks()
	if IsValid(self.deposit) then
		DoneObject(self.deposit)
	end
	local info = TerrainDepositsInfo[self.resource]
	if not info then
		return
	end
	local deposit_def = g_Classes[info.deposit_class]
	if not deposit_def then
		StoreErrorSource(self, "No such deposit class")
		return
	end
	if self.density >= 0 or self.density2 >= 0 then
		info = setmetatable({
			density = self.density >= 0 and self.density,
			density2 = self.density2 >= 0 and self.density2
		}, {
			__index = info
		})
	end
	local pos = self:GetPos()
	rand = rand or RandState(xxhash(GetMap(), pos))
	local radius_max, new_bbox, err
	local marker = PrefabMarkers[self.prefab]
	if marker then
		radius_max = marker.max_radius * type_tile
		err, new_bbox = PlacePrefab(self.prefab, pos, rand:Get(360 * 60))
		if err then
			StoreErrorSource(self, "Failed to place prefab", self.prefab, err)
		end
	end
	if not new_bbox then
		-- generate terrain patch
		local terrain_idx = info.terrain_idx
		if not terrain_idx then
			StoreErrorSource(self, "Invalid terrain name")
			return
		end
		local form_obj = DataInstances.NoisePreset[info.form or ""]
		if not form_obj then
			StoreErrorSource(self, "Missing cloud form preset")
			return
		end
		local noise_obj = DataInstances.NoisePreset[info.noise or ""]
		if not noise_obj then
			StoreErrorSource(self, "Missing noise form preset")
			return
		end
		local pattern = form_obj:GetNoise(noise_size, rand)
		if pattern:get(0, 0) ~= 0 then
			pattern:lnot_i()
		end
		local minx, miny, maxx, maxy = pattern:minmaxdist(noise_center)
		radius_max = noise_center:Dist2D(maxx, maxy)
		local noise = noise_obj:GetNoise(noise_size, rand)
		pattern:land_i(noise)
		noise:free()
		local grade2_tiles = 0
		local tiles = pattern:count(0, 1, 1)
		if tiles == 0 then
			StoreErrorSource(self, "Invalid noise params")
			return
		end
		local grade2_mask
		local dist2 = 0
		local volumes = info.volume_to_dist2
		local amount = self.max_amount
		for i=1,#volumes do
			if amount >= volumes[i] then
				dist2 = i
				break
			end
		end
		local terrain2_idx = info.terrain2_idx
		if terrain2_idx and dist2 > 0 then
			grade2_mask = pattern:lnot()
			grade2_mask:distance_i(1, 1)
			grade2_mask:mask_i(dist2, max_int, 1)
		end
		pattern:mul_i(terrain_idx + 1, 1)
		if grade2_mask then
			pattern:paint_i(grade2_mask, terrain2_idx + 1, 1)
			grade2_tiles = pattern:count(terrain2_idx, terrain2_idx + 1, 1)
			tiles = tiles - grade2_tiles
			grade2_mask:free()
		end
		pattern:sub_i(1, 1)
		pattern = GridOpFree(pattern, "repack", 8)
		local unscaled_amount = MulDivRound(tiles * info.density + grade2_tiles * info.density2, type_tile, guim)
		local scale = sqrt(MulDivRound(10000, amount, unscaled_amount))
		radius_max = MulDivRound(radius_max * type_tile, scale, 100)
		err, new_bbox = terrain.SetTypeGrid{
			type_grid = pattern, 
			pos = pos,
			scale = scale, 
			centered = true,
			invalid_type = -1,
		}
		if err then
			StoreErrorSource(self, "Failed to place terrain deposit:", err)
			return
		end
	end
	local amount_added = TerrainDeposit_SyncAmount(TerrainDepositGrid, radius_max, pos, info)
	local deposit = deposit_def:new()
	self.deposit = deposit
	deposit.grade = self.grade
	deposit.bbox = new_bbox
	deposit.radius_max = radius_max
	deposit:SetPos(pos)
	local max_amount = TerrainDeposit_GetAmount(deposit, radius_max, TerrainDepositGrid, info)
	deposit.max_amount = (max_amount / const.ResourceScale) * const.ResourceScale

	MaxTerrainDepositRadius = Max(MaxTerrainDepositRadius, deposit.radius_max)
	
	local elapsed_time = GetPreciseTicks() - start_time
	--assert(elapsed_time < 10, "Terrain deposit noise computing too slow")
	
	return deposit
end

GlobalVar("TerrainDepositCircles", {})

function ToggleTerrainDepositGrid()
	if IsValid(TerrainDepositCircles[1]) then
		for i=1,#TerrainDepositCircles do
			DoneObject(TerrainDepositCircles[i])
		end
		return
	end
	local gpts = HexGridWorldValues(TerrainDepositGrid, true)
	if #gpts == 0 then
		return
	end
	local mx, my, data = gpts[1]:xyz()
	local gtype, gvol = TerrainDeposit_Decode(data)
	local gmin, gmax = gvol, gvol
	for i=2,#gpts do
		mx, my, data = gpts[i]:xyz()
		gtype, gvol = TerrainDeposit_Decode(data)
		if gvol < gmin then gmin = gvol
		elseif gvol > gmax then gmax = gvol
		end
	end
	if gmax <= gmin then
		return
	end
	local delta = gmax - gmin
	local circles = {}
	for i=1,#gpts do
		mx, my, data = gpts[i]:xyz()
		gtype, gvol = TerrainDeposit_Decode(data)
		local info = TerrainDepositsInfo[gtype]
		local dv = gvol - gmin
		if dv > 0 and info then
			local color_max = info.color_max
			local color_min = info.color_min
			local color = InterpolateRGB(color_min, color_max, dv, delta)
			local mz = terrain.GetHeight(mx, my) + guim
			local center = point(mx, my, mz)
			local circle = Circle:new()
			circle:SetColor(color)
			circle:SetRadius(const.GridSpacing/2)
			circle:SetDepthTest(true)
			circle:SetPos(center)
			circle:SetVisible(true)
			circles[#circles + 1] = circle
		end
	end
	TerrainDepositCircles = circles
end

----

DefineClass.EditorRangeObject = {
	__parents = { "EditorObject", "Object" },
	dbg_line = false,
	dbg_step = 4*guim,
	dbg_range_color = white,
}


function EditorRangeObject:EditorGetRange()
	return 0
end

function EditorRangeObject:EditorShowRange(show)
	if IsValid(self.dbg_line) then
		DoneObject(self.dbg_line)
	end
	local range = self:EditorGetRange()
	if show and range > 0 then
		self.dbg_line = PlaceTerrainCircle(self:GetPos(), range, self.dbg_range_color, self.dbg_step)
	end
end

function EditorRangeObject:EditorEnter()
	self:EditorShowRange(true)
end

function EditorRangeObject:EditorExit()
	self:EditorShowRange(false)
end

----

DefineClass.TerrainDeposit = {
	__parents = { "Deposit", "EditorRangeObject" },
	enum_flags = { efWalkable = false, efCollision = false, efApplyToGrids = false },
	properties = {
		{ category = "Deposit", name = T{782, "Max amount"}, id = "max_amount", editor = "number", default = 50000, scale = const.ResourceScale, read_only = true},	 --quantity
		{ category = "Deposit", name = T{16, "Grade"},      id = "grade",      editor = "text", default = "Average", read_only = true },
	},
	
	entity = "WayPoint",
	
	depth_layer = 1,
	revealed = true,
	
	--ui
	display_name = T{783, "Deep <resource(resource)>"},
	display_icon = "UI/Icons/Buildings/drone.tga",
	
	-- pin section
	pin_rollover = T{820, "<Description><newline><newline><ResourceName><right><resource(Amount,max_amount,resource)><newline><left>Grade<right><grade_name>"},
	pin_progress_value = "Amount",
	pin_progress_max = "max_amount",
	
	dbg_range_color = yellow,
	
	city_label = "TerrainDeposit",
	ip_template = "ipTerrainDeposit",
}

function TerrainDeposit:GameInit()
	self:SetScale(g_CurrentDepositScale)
	if self:IsValidZ() then
		self:SetPos(self:GetPos():SetInvalidZ())
	end
end

function TerrainDeposit:EditorGetRange()
	return self.radius_max
end

function TerrainDeposit:GetAmount()
	if not IsValid(self) then
		return 0
	end
	local info = TerrainDepositsInfo[self.resource]
	if not info then
		return 0
	end
	local amount = TerrainDeposit_GetAmount(self, self.radius_max, TerrainDepositGrid, info)
	return Min(amount, self.max_amount)
end

local function deposit_weight(a)
	return a:z()
end

function TerrainDeposit:GetRandDepositPos(seed)
	if not IsValid(self) then
		return
	end
	local info = TerrainDepositsInfo[self.resource]
	if not info then
		return
	end
	local amount, hexes = TerrainDeposit_GetAmount(self, self.radius_max, TerrainDepositGrid, info, true)
	return table.weighted_rand(hexes, deposit_weight, seed)
end

function TerrainDeposit:Done()
	self:EditorShowRange(false)
end

function TerrainDeposit:GetQualityMultiplier()
	return DepositGradeToMultiplier[self.grade]
end

function TerrainDeposit:EditorEnter()
	self:SetVisible(false)
	EditorRangeObject.EditorEnter(self)
end

function TerrainDeposit:EditorExit()
	self:SetVisible(true)
	EditorRangeObject.EditorExit(self)
end

function TerrainDeposit:Setmax_amount(val)
	self.max_amount = val
end

function TerrainDeposit:Getgrade_name() return DepositGradeToDisplayName[self.grade] end

----

DefineClass.TerrainDepositExtractor = 
{
	__parents = {"DepositExploiter"},
	
	found_deposit = false,
	depleted = false,
}

function TerrainDepositExtractor:Init()
	self.found_deposit = false
end

function TerrainDepositExtractor:HasNearbyDeposits()
	return self:GetAmount() > 0
end

function TerrainDepositExtractor:GetExtractionShape()
end

function TerrainDepositExtractor:GetRessourceInfo()
	return TerrainDepositsInfo[self.exploitation_resource]
end

function TerrainDepositExtractor:FindClosestDeposit(center)
	local info = self:GetRessourceInfo()
	local shape = self:GetExtractionShape() or ""
	if not info or #shape == 0 then
		return
	end
	local radius, xc, yc = HexBoundingCircle(shape, self)
	center = center or point(xc, yc)
	local deposit = MapFindNearest(center, center, MaxTerrainDepositRadius + radius, info.deposit_class)
	if not deposit or not deposit:IsCloser2D(center, radius + deposit.radius_max) then
		return
	end
	return deposit
end

function TerrainDepositExtractor:GetDeposit()
	self.found_deposit = self.found_deposit or self:FindClosestDeposit() or true
	return self.found_deposit
end

function TerrainDepositExtractor:GetDepositGrade(deposit)
	local refinement_researched = self.city:IsTechResearched("NanoRefinement")
	if self.depleted and refinement_researched then
		return "Depleted"
	end
	
	local info = self:GetRessourceInfo()
	local shape = self:GetExtractionShape() or ""
	if not info or #shape == 0 then
		return "Very Low"
	end
	deposit = deposit or self:GetDeposit()
	if IsValid(deposit) then 
		return deposit.grade
	end

	return "Very Low"
end

function TerrainDepositExtractor:GetCurrentDepositQualityMultiplier(...)
	return GetDepositGradeToMultiplier(self:GetDepositGrade(...))
end

function TerrainDepositExtractor:CheckDeposit()
	local info = self:GetRessourceInfo()
	local shape = self:GetExtractionShape()
	return info and shape and TerrainDeposit_Check(shape, self, TerrainDepositGrid, info)
end

function TerrainDepositExtractor:OnDepositDepleted()
	self.depleted = true -- mark deposit as depleted even thare is left amount, that is unreachable from extractor
end

function TerrainDepositExtractor:ExtractResource(amount)
	local info = self:GetRessourceInfo()
	local shape = self:GetExtractionShape()
	if not info or not shape then
		return 0
	end
	
	local extracted, remaining = TerrainDeposit_Extract(shape, self, TerrainDepositGrid, info, amount)
	Msg("ResourceExtracted", self.exploitation_resource, extracted)
	
	if remaining == 0 then
		assert(not self:CheckDeposit())
		self:OnDepositDepleted()
		local deposit = self:GetDeposit()
		if IsValid(deposit) and deposit:GetAmount() < 10 * const.ResourceScale then
			DoneObject(deposit)
		end
	end
	
	if extracted == 0 and self.city:IsTechResearched("NanoRefinement") then
		return amount
	end

	return extracted
end

-- ui

function TerrainDepositExtractor:GetAmount()
	if not IsValid(self) then
		return 0
	end
	local info = self:GetRessourceInfo()
	local shape = self:GetExtractionShape()
	if not info or not shape then
		return 0
	end
	return TerrainDeposit_GetAmount(shape, self, TerrainDepositGrid, info)
end

function TerrainDepositExtractor:Getgrade_name(...) 
	return DepositGradeToDisplayName[self:GetDepositGrade(...)] 
end

----

DefineClass("TerrainDepositConcrete",
{
	__parents = {"TerrainDeposit"},
	resource = "Concrete",
	display_icon = "UI/Icons/Buildings/deposit_concrete.tga",
	entity = "SignConcreteDeposit",
	display_name = T{821, "Concrete Deposit"},
	description = T{822, "A Regolith-rich terrain that can be processed into Concrete. Can be exploited by a <em>Concrete Extractor</em>."},
})

----