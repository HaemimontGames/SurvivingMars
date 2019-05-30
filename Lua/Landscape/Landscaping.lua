GlobalVar("LandscapeGrid", false)
GlobalVar("LandscapeLastMark", 0)
GlobalVar("LandscapeMark", 0)
GlobalVar("Landscapes", {})

function ResetLandscapeGrid()
	hr.RenderLandscape = 0
	if HexMapWidth == 0 or HexMapHeight == 0 then
		return
	end
	if not Landscape_IsLandscapeGrid(LandscapeGrid) then
		local grid = NewGrid(HexMapWidth, HexMapHeight, 32, 0)
		if LandscapeGrid then
			grid:copy(LandscapeGrid)
		end
		LandscapeGrid = grid
	end
	Landscape_SetGrid(LandscapeGrid)
	hr.RenderLandscape = next(Landscapes) and 1 or 0
end

function OnMsg.DoneMap()
	hr.RenderLandscape = 0
	Landscape_SetGrid(false)
end

function OnMsg.NewMap()
	ResetLandscapeGrid()
end

SavegameFixups.ResetLandscapeGrid = ResetLandscapeGrid

function LandscapeFixProblems()
	for mark, landscape in pairs(Landscapes) do
		if not landscape.site then
			LandscapeDelete(landscape)
		end
	end
end

function OnMsg.LoadGame()
	LandscapeFixProblems()
	ResetLandscapeGrid()
end

function OnMsg.OnPassabilityChanged(rbox)
	if Landscapes and LandscapeGrid then
		Landscape_BlockPass(Landscapes, LandscapeGrid, rbox)
	end
end

function IsInMapPlayableArea(x, y)
	if not x then
		return
	elseif not y then
		x, y = x:xy()
	end
	local width, height = terrain.GetMapSize()
	local border = mapdata.PassBorder or 0
	return x >= border and x < width - border and y >= border and y < height - border
end

local UnbuildableZ = buildUnbuildableZ()
local origGetBuildableZ = GetBuildableZ
function GetBuildableZ(q, r)
	if Landscape_Check(LandscapeGrid, q, r, true) then
		return UnbuildableZ
	end
	return origGetBuildableZ(q, r)
end

function LandscapeMarkBuildable(pt)
	return origGetBuildableZ(WorldToHex(pt)) ~= UnbuildableZ
end

function LandscapeMarkStart(pt)
	local landscape = Landscapes[LandscapeMark]
	if not landscape then
		local mark0 = LandscapeLastMark
		local mark = mark0 + 1
		while Landscapes[mark] do
			mark = mark + 1
			if mark == const.LandscapeMaxId then
				mark = 1
			end
			assert(mark ~= mark0)
			if mark == mark0 then
				return
			end
		end
		LandscapeMark = mark
		LandscapeLastMark = mark
		landscape =  {
			hexes = 0,
			primes = 0,
			mark = mark,
			accum = 0,
			bbox = box(),
			pass_bbox = false,
			apply_block_pass = false,
			volume = 0,
			material = 0,
			hex_radius = 0,
			volume_delta = 0,
			changed = false,
			collision_objs = setmetatable({}, weak_keys_meta),
			offset_objs = setmetatable({}, weak_keys_meta),
			site = false,
			texture_type = "DomeDemolish",
			texture_cover = 75,
		}
		Landscapes[mark] = landscape
		hr.LandscapeCurrentMark = mark
		hr.RenderLandscape = 1
	end
	landscape.height = terrain.GetHeight(pt)
	landscape.start = pt
	return landscape
end

function LandscapeMarkCancel()
	local landscape = Landscapes[LandscapeMark]
	if not landscape then
		return
	end
	local count, primes, bbox = Landscape_MarkErase(LandscapeMark, landscape.bbox, LandscapeGrid, true)
	landscape.bbox = bbox
	landscape.primes = primes
	return count
end

function LandscapeMarkSmooth(test, obstruct_handles, obstruct_marks, handle_filter, ...)
	local landscape = Landscapes[LandscapeMark]
	if not landscape or landscape.primes == 0 then
		return 0
	end
	test = test or false
	local success, hexes, bbox = Landscape_MarkSmooth(landscape, LandscapeGrid, ObjectGrid, test, obstruct_handles, obstruct_marks, handle_filter, ...)
	landscape.bbox = Extend(landscape.bbox, bbox)
	landscape.hexes = hexes
	
	local volume, material = Landscape_GetVolume(landscape, LandscapeGrid, const.Terraforming.WasteRockPerHexCube)
	landscape.volume = volume
	landscape.material = material
	
	return success
end

function LandscapeMarkEnd()
	LandscapeMark = 0
	hr.LandscapeCurrentMark = 0
end

local ClearCachedZ = CObject.ClearCachedZ
local GetVisualPosXYZ = CObject.GetVisualPosXYZ
local GetHeight = terrain.GetHeight
local IsValidZ = CObject.IsValidZ
local SetPos = CObject.SetPos
local SetPosAndNormalOrientation = CObject.SetPosAndNormalOrientation
local efVisible = const.efVisible
local efCollision = const.efCollision
local ClearEnumFlags = CObject.ClearEnumFlags
local SetEnumFlags = CObject.SetEnumFlags
local GetEnumFlags = CObject.GetEnumFlags
local IsKindOf = IsKindOf
local IsValid = IsValid

local function AdjustObjZ(obj, offsets)
	local collision = GetEnumFlags(obj, efCollision) ~= 0
	assert(not collision or GetEnumFlags(obj, efVisible) == 0)
	if IsValidZ(obj) then
		local dz = offsets[obj] or 0
		local x, y = GetVisualPosXYZ(obj)
		SetPos(obj, x, y, GetHeight(x, y) + dz)
	else
		ClearCachedZ(obj)
	end
	if collision then
		SetPosAndNormalOrientation(obj)
	end
end
local function CollectOffsets(obj, offsets)
	if not IsValidZ(obj) then
		return
	end
	if IsKindOf(obj, "Deposit") then
		offsets[obj] = 10
		return
	end
	local x, y, z = GetVisualPosXYZ(obj)
	local dz = z - GetHeight(x, y)
	if dz ~= 0 then
		offsets[obj] = dz
	end
end
local foreach_params_default = {
	reject = "FlyingObject",
}
local foreach_params_collision = {
	collections = true,
	enum_flags = const.efCollision + const.efVisible,
	reject = "Unit",
}
local function CollectObjs(obj, objs)
	objs[obj] = true
end

function LandscapeProgressInit(landscape)
	 -- first call of Landscape_Progress will init skip hexes
	local bbox = Landscape_Progress(landscape, LandscapeGrid)
	landscape.pass_bbox = bbox:grow(const.GridSpacing)
	return landscape.pass_bbox
end

function LandscapeProgressStep(landscape, forced)
	local remaining = landscape.volume - landscape.accum
	local volume_delta = Min(landscape.volume_delta, remaining)
	if volume_delta == 0 then
		return
	end
	local min_delta = Min(remaining, landscape.volume / 100)
	--print(volume_delta, "/", min_delta, "|",  landscape.accum, "/", landscape.volume)
	if not forced and volume_delta < min_delta then
		-- skip progress for small volume deltas and wait to accum
		return
	end
	if not landscape.changed then
		Landscape_ForEachObject(landscape, LandscapeGrid, foreach_params_default, CollectOffsets, landscape.offset_objs)
	end
	local changed = Landscape_Progress(landscape, LandscapeGrid, volume_delta)
	if not changed or changed:IsEmpty() then
		return
	end
	local collected = Landscape_ForEachObject(landscape, LandscapeGrid, foreach_params_collision, CollectObjs, landscape.collision_objs)
	if collected > 0 or not landscape.changed then
		landscape.changed = landscape.changed or changed
		SuspendPassEdits(landscape)
		for obj in pairs(landscape.collision_objs) do
			if IsValid(obj) then
				ClearEnumFlags(obj, efVisible)
			end
		end
		if not landscape.pass_bbox then
			landscape.pass_bbox = changed:grow(const.GridSpacing)
			if landscape.apply_block_pass then
				terrain.RebuildPassability(landscape.pass_bbox)
			end
		end
		ResumePassEdits(landscape)
	end
	landscape.volume_delta = 0
	landscape.accum = Min(landscape.accum + volume_delta, landscape.volume)
	Landscape_ForEachObject(landscape, LandscapeGrid, foreach_params_default, AdjustObjZ, landscape.offset_objs)
	Flight_OnHeightChanged()
	return true
end

function LandscapeDamageSoil(mark)
end

function LandscapeFixBuildable(landscape)
	Landscape_FixBuildable(landscape, LandscapeGrid, g_BuildableZ, UnbuildableZ, guim/3)
	UICity:UpdateBuildableRatio(HexStoreToWorld(landscape.bbox, const.GridSpacing))
	BumpDroneUnreachablesVersion()
end

function LandscapeDelete(landscape)
	local mark = landscape.mark
	
	if landscape.changed or landscape.pass_bbox then
		SuspendPassEdits(landscape)
	end
	
	if landscape.changed then
		for obj in pairs(landscape.collision_objs) do
			if IsValid(obj) then
				SetEnumFlags(obj, efVisible)
			end
		end
		LandscapeDamageSoil(mark)
		LandscapeFixBuildable(landscape)
		
		local invalidate = hr.TerrainDebugDraw == 1 and DbgLastBuildableColors
		DbgLastBuildableGrid = false
		if invalidate then
			DbgToggleBuildableGrid()
		end
	end
	
	Landscapes[mark] = nil
	hr.RenderLandscape = next(Landscapes) and 1 or 0
	Landscape_MarkErase(mark, landscape.bbox, LandscapeGrid)
	
	if landscape.pass_bbox then
		terrain.RebuildPassability(landscape.pass_bbox)
	end

	if landscape.changed or landscape.pass_bbox then
		ResumePassEdits(landscape)
	end
end

function LandscapeProgress(mark, volume_delta, volume_max)
	local landscape = Landscapes[mark]
	if not landscape then
		return
	end
	if volume_delta then
		if volume_max then
			volume_delta = MulDivRound(landscape.volume, volume_delta, volume_max)
		end
		landscape.volume_delta = landscape.volume_delta + volume_delta
	end
	LandscapeProgressStep(landscape)
end

function LandscapeCheck(...)
	return Landscape_Check(LandscapeGrid, ...)
end

function LandscapeFinish(mark)
	local landscape = Landscapes[mark]
	if not landscape then
		return
	end
	LandscapeProgressStep(landscape, true)
	LandscapeChangeTerrain(mark)
	LandscapeDelete(landscape)
end

----

local foreach_params_decals = {
	enum_flags = const.efBakedTerrainDecal,
	reject = "ToxicPoolDecal, GeyserObject",
}
local remove_classes = "WasteRockObstructor, Deposition"
local except_classes = "BaseBuilding, Unit, GridObject, Destlock, FlyingObject"
local foreach_params_no_surf = {
	accept = remove_classes,
	reject = except_classes,
}
local foreach_params_surf = {
	collections = true,
	enum_flags = const.efCollision,
	surfaces = EntitySurfaces.Collision,
	reject = except_classes,
}
function LandscapeForEachObstructor(mark, callback, ...)
	local landscape = Landscapes[mark]
	if not landscape then
		return
	end
	SuspendPassEdits("LandscapeForEachObstructor")
	Landscape_ForEachObject(landscape, LandscapeGrid, foreach_params_decals, callback, ...)
	Landscape_ForEachObject(landscape, LandscapeGrid, foreach_params_no_surf, callback, ...)
	Landscape_ForEachObject(landscape, LandscapeGrid, foreach_params_surf, callback, ...)
	ResumePassEdits("LandscapeForEachObstructor")
end

local foreach_params_stock = {
	accept = "ResourceStockpileBase",
	reject = "Unit",
}

function LandscapeForEachStockpile(mark, callback, ...)
	local landscape = Landscapes[mark]
	if not landscape then
		return
	end
	
	local passed = {}
	local function filter_parent(o, ...)
		if IsValid(o) and not passed[o] and o:GetParent() == nil and IsKindOf(o, "DoesNotObstructConstruction") then
			passed[o] = true
			callback(o, ...)
		end
	end
	Landscape_ForEachObject(landscape, LandscapeGrid, foreach_params_stock, filter_parent, ...)
end

local foreach_params_unit = {
	accept = "Unit",
}
function LandscapeForEachUnit(mark, callback, ...)
	local landscape = Landscapes[mark]
	if not landscape then
		return
	end
	
	local passed = {}
	local function filter_embark(o, ...)
		if IsValid(o) and not passed[o] and o.command ~= "Embark" then
			passed[o] = true
			callback(o, ...)
		end
	end
	Landscape_ForEachObject(landscape, LandscapeGrid, foreach_params_unit, callback, ...)
end

local exclude_terrains = { "Regolith", "Regolith_02", "Spider" }

function LandscapeChangeTerrain(mark, perc)
	local landscape = Landscapes[mark]
	if not landscape or (not perc and landscape.accum == 0 and not landscape.completed) or not landscape.texture_type then
		return
	end
	perc = perc or nil
	local noise_max, noise_grid
	local noise_obj = landscape.texture_pattern and DataInstances.NoisePreset[landscape.texture_pattern]
	if noise_obj then
		noise_max = noise_obj.Max
		noise_grid = noise_obj:GetNoise(256, xxhash(landscape.bbox))
	end
	local inv = Landscape_SetTerrainType(landscape, LandscapeGrid, exclude_terrains, noise_max, noise_grid, perc)
	if noise_grid then
		noise_grid:free()
	end
	terrain.InvalidateType(inv)
	return inv
end

----

function LandscapeForEachHex(param, callback, ...)
	local mark, bbox
	if IsBox(param) then
		-- enum any landscape in a specific region
		bbox = HexWorldToStore(param)
		mark = -1 
	else
		local landscape = Landscapes[param] or param
		if not landscape then
			return
		end
		-- enum a specific landscape in its region
		mark = landscape.mark
		bbox = landscape.bbox
	end
	return Landscape_ForEachHex(mark, bbox, LandscapeGrid, callback, ...)
end