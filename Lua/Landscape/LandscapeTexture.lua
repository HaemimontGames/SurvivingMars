GlobalVar("CityLandscapeTexture", {})

function GetLandscapeTextureController()
	local obj = CityLandscapeTexture[UICity]
	if not obj then
		obj = LandscapeTextureController:new()
		CityLandscapeTexture[UICity] = obj
	end
	return obj
end

DefineClass.LandscapeTextureBuilding = {
	__parents = { "LandscapeBuilding" },
	properties = {
		{ template = true, name = T(12333, "Texture Main"),          id = "texture_type",          category = "General", editor = "choice", default = "", items = function() return AddEmpty(table.keys(TerrainNameToIdx, true)) end },
		{ template = true, name = T(12334, "Texture Alt"),           id = "texture_alt",      category = "General", editor = "choice", default = "", items = function() return AddEmpty(table.keys(TerrainNameToIdx, true)) end },
		{ template = true, name = T(12335, "Texture Alt Ratio (%)"), id = "texture_ratio",    category = "General", editor = "number", default = 50, min = 0, max = 100, slider = true },
		{ template = true, name = T(12336, "Texture Alt Pattern"),   id = "texture_pattern",  category = "General", editor = "choice", default = "", items = function() return NoisePresetsCombo() end  },
		{ template = true, name = T(12337, "Texture Coverage (%)"),  id = "texture_cover",    category = "General", editor = "number", default = 100, min = 0, max = 100, slider = true },
	},
	construction_mode = "landscape_texture",
	max_boundary = 60,
	max_hexes = 3000,
}

DefineClass.LandscapeTextureDialog = {
	__parents = { "LandscapeConstructionDialog" },
	mode_name = "landscape_texture",
}

DefineClass.LandscapeTextureController = {
	__parents = { "LandscapeConstructionController" },
	
	brush_radius = 20*guim,
	brush_radius_step = 5*guim,
	brush_radius_min = 5*guim,
	brush_radius_max = 50*guim,
}

function LandscapeTextureController:Mark(test)
	LandscapeMarkCancel()
	local marked = LandscapeMarkTexture(self.last_pos, self.last_undo_pos, self.brush_radius, test)
	local success = self:ValidateMark(true)
	local ready = success and self.last_undo_pos and not IsPlacingMultipleConstructions()
	return success, ready
end

local function HandleFilter(handle)
	local obj = HandleToObject[handle]
	if IsValid(obj) then
		if obj.class == "GridObjectList" then
			for _, handlei in ipairs(obj) do
				if not HandleFilter(handlei) then
					return false
				end
			end
		elseif not IsKindOfClasses(obj, "LifeSupportGridElement", "ElectricityGridElement") then
			return false
		end
	end
	return true
end

function LandscapeTextureController:ValidateMark(test)
	local landscape = Landscapes[LandscapeMark]
	if not landscape then
		return
	end
	local success = LandscapeMarkSmooth(test, self.obstruct_handles, self.obstruct_marks, HandleFilter)
	landscape.volume = 0
	landscape.material = 0
	if not test then
		local bld = self.template_obj
		landscape.texture_type = bld.texture_type
		landscape.texture_alt = bld.texture_alt
		landscape.texture_pattern = bld.texture_pattern
		landscape.texture_ratio = bld.texture_ratio
		landscape.texture_cover = bld.texture_cover
	end
	return success
end

function LandscapeTextureController:IsMarkSuitable(pt)
	pt = pt or self.last_pos
	return IsInMapPlayableArea(pt)
end

function LandscapeMarkTexture(pt1, pt0, radius, test)
	local landscape = Landscapes[LandscapeMark]
	if not landscape then
		return
	end
	if not pt0 then
		test = true
		pt0 = pt1
	end
	local primes, bbox = Landscape_MarkLine{
		mark = LandscapeMark, 
		pos0 = pt0, 
		pos1 = pt1, 
		radius = radius, 
		landscape_grid = LandscapeGrid,
		object_grid = ObjectGrid,
		test = test,
	}
	if not primes then
		return
	end
	landscape.bbox = Extend(landscape.bbox, bbox)
	landscape.primes = landscape.primes + primes
	return true
end