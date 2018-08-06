DefineClass.BaseRoverBuilding = {
	__parents = { "Building" },
	
	rover_class = false,
	unlock_tech = false,
	hide = true,
	check_supply = false,
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

function OnMsg.DataLoaded()
	ClassDescendants("BaseRoverBuilding", function(classname, class)
		if class.unlock_tech then
			local requirements = BuildingTechRequirements[classname] or {}
			BuildingTechRequirements[classname] = requirements
			requirements[#requirements + 1] = { tech = class.unlock_tech, hide = class.hide, check_supply = class.check_supply }
		end
	end)
end
