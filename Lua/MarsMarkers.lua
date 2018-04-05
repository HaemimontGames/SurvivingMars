
-----------------------------------------------------------
--RCRovers will be spawned on the map for each such marker
-----------------------------------------------------------
DefineClass.RCRoverMarker = {
	__parents = { "EditorMarker" },
}

function OnMsg.ChangeMapDone(map)
	ForEach{
		class = "RCRoverMarker",
		exec = function(marker)
			local p = GetPassablePointNearby(marker:GetPos(), RCRover.pfclass)
			local r = PlaceObject("RCRover")
			r:SetPos(p)
		end,
	}
end
