GlobalVar("MapLowestZ", max_int)
GlobalVar("MapHighestZ", 0)

function OnMsg.NewMapLoaded()
	if MapLowestZ == max_int and not mapdata.IsPrefabMap then
		local tavg, tmin, tmax = terrain.GetAreaHeight()
		MapLowestZ = tmin
		MapHighestZ = tmax
	end
end

----- MinimumElevationMarker is used to determine lowest point on map

GlobalVar("there_can_be_only_one_height_marker", false)

DefineClass.MinimumElevationMarker = {
	__parents = { "EditorMarker" },
}

function MinimumElevationMarker:Init()
	if there_can_be_only_one_height_marker then
		print("warning!, this map already has an elevation marker!")
	end
	if editor.Active == 1 then
		self:EditorTextUpdate(true)
	end
end

function MinimumElevationMarker:Done()
	if there_can_be_only_one_height_marker == self then
		there_can_be_only_one_height_marker = nil
	end
end

function MinimumElevationMarker:GameInit()
	if there_can_be_only_one_height_marker then
		print("Killing extra MinimumElevationMarkers!")
		DoneObject(self)
	end
	if MapLowestZ == max_int then
		MapLowestZ = self:GetVisualPos():z()
	end
	there_can_be_only_one_height_marker = self
end

function GetElevation(pos)
	return pos:z() and (Max(pos:z() - MapLowestZ, 0) / guim) or 0
end
