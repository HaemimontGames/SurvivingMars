DefineClass.BaseRoverBuilding = {
	__parents = { "Building" },
	
	rover_class = false,
}

function BaseRoverBuilding:GameInit()
	CreateGameTimeThread(function()
		if self.rover_class then
			local rover = PlaceObject(self.rover_class)
			local spot = self:GetSpotBeginIndex("Rover")
			local pos, angle = self:GetSpotLoc(spot)
			rover:SetPos(pos)
			rover:SetAngle(angle)
			DoneObject(self)
		end
	end)
end

DefineClass.RCRoverBuilding = { __parents = { "BaseRoverBuilding" }, rover_class = "RCRover" }
DefineClass.RCTransportBuilding = { __parents = { "BaseRoverBuilding" }, rover_class = "RCTransport" }
DefineClass.RCExplorerBuilding = { __parents = { "BaseRoverBuilding" }, rover_class = "ExplorerRover" }
