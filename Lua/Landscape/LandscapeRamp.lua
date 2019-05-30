GlobalVar("CityLandscapeRamp", {})

function GetLandscapeRampController()
	local obj = CityLandscapeRamp[UICity]
	if not obj then
		obj = LandscapeRampController:new()
		CityLandscapeRamp[UICity] = obj
	end
	return obj
end

DefineClass.LandscapeRampBuilding = {
	__parents = { "LandscapeBuilding" },
	construction_mode = "landscape_ramp",
}

DefineClass.LandscapeRampDialog = {
	__parents = { "LandscapeConstructionDialog" },
	mode_name = "landscape_ramp",
}

DefineClass.LandscapeRampController = {
	__parents = { "LandscapeConstructionController" },
	unlinked = false,
	brush_radius_min = 40*guim,
}

function LandscapeRampController:Mark(test)
	LandscapeMarkCancel()
	local marked, ready, clamped = LandscapeMarkRamp(self.last_pos, self.last_undo_pos, self.brush_radius, test)
	self.unlinked = clamped or not self:IsMarkSuitable()
	local success = self:ValidateMark(true)
	return success, ready
end

function LandscapeMarkRamp(pt1, pt0, radius, test)
	local landscape = Landscapes[LandscapeMark]
	if not landscape then
		return
	end
	if not pt0 then
		test = true
		pt0 = pt1
	end
	local h0 = landscape.height
	local h1 = terrain.GetHeight(pt1)
	local dist = pt1:Dist2D(pt0)
	local s, c = sincos(const.MaxPassableTerrainSlope * 60 - 90)
	local dh = MulDivRound(dist, s, c)
	local ready, clamped
	if h0 - h1 > dh then
		h1 = h0 - dh
		clamped = true
	elseif h1 - h0 > dh then
		h1 = h0 + dh
		clamped = true
	else
		ready = pt1 ~= pt0
	end
	local primes, bbox = Landscape_MarkLine(LandscapeMark, h0, pt0, h1, pt1, radius, LandscapeGrid, ObjectGrid, test)
	if not primes then
		return
	end
	landscape.bbox = Extend(landscape.bbox, bbox)
	landscape.primes = landscape.primes + primes
	return true, ready, clamped
end

ConstructionStatus.LandscapeRampUnlinked = { type = "error", priority = 91, text = T(12035, "The ramp must connect two terraces."), short = T(12036, "Invalid placement")}
	
function LandscapeRampController:AddConstructionStatuses(statuses)
	LandscapeConstructionController.AddConstructionStatuses(self, statuses)
	if self.unlinked then
		statuses[#statuses + 1] = ConstructionStatus.LandscapeRampUnlinked
	end
end