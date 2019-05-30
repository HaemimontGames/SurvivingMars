GlobalVar("CityLandscapeTerrace", {})

function GetLandscapeTerraceController()
	local obj = CityLandscapeTerrace[UICity]
	if not obj then
		obj = LandscapeTerraceController:new()
		CityLandscapeTerrace[UICity] = obj
	end
	return obj
end

DefineClass.LandscapeTerraceBuilding = {
	__parents = { "LandscapeBuilding" },
	construction_mode = "landscape_terrace",
	max_boundary = 80,
}

DefineClass.LandscapeTerraceDialog = {
	__parents = { "LandscapeConstructionDialog" },
	mode_name = "landscape_terrace",
}

DefineClass.LandscapeTerraceController = {
	__parents = { "LandscapeConstructionController" },
}

function LandscapeTerraceController:Mark(test)
	LandscapeMarkCancel()
	LandscapeMarkTerrace(self.last_pos, self.last_undo_pos, self.brush_radius, test)
	local success = self:ValidateMark(true)
	local ready = success and self.last_undo_pos and not IsPlacingMultipleConstructions()
	return success, ready
end

function LandscapeMarkTerrace(pt1, pt0, radius, test)
	local landscape = Landscapes[LandscapeMark]
	if not landscape then
		return
	end
	if not pt0 then
		test = true
		pt0 = pt1
	end
	local h0 = landscape.height
	local primes, bbox = Landscape_MarkLine(LandscapeMark, h0, pt0, h0, pt1, radius, LandscapeGrid, ObjectGrid, test)
	if not primes then
		return
	end
	landscape.bbox = Extend(landscape.bbox, bbox)
	landscape.primes = landscape.primes + primes
	return true
end
