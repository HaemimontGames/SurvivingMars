
-----------------------------------------------------------
--RCRovers will be spawned on the map for each such marker
-----------------------------------------------------------
DefineClass.RCRoverMarker = {
	__parents = { "EditorMarker" },
}

function OnMsg.ChangeMapDone(map)
	MapForEach("map",
		"RCRoverMarker",
		function(marker)
			local p = GetPassablePointNearby(marker:GetPos(), RCRover.pfclass)
			if p then
				local r = PlaceObject("RCRover")
				r:SetPos(p)
			end
		end)
end
