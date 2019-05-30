DefineClass.BaseRoverBuilding = {
	__parents = { "Building" },
	
	rover_class = false,
	unlock_tech = false,
	hide = true,
	check_supply = false,
	shape_entity = false,
}

function BaseRoverBuilding:GameInit()
	if self.rover_class then
		CreateGameTimeThread(function()
			local rover = PlaceObject(self.rover_class)
			local spot = self:GetSpotBeginIndex("Rover")
			local pos, angle = self:GetSpotLoc(spot)
			rover:SetPos(pos)
			rover:SetAngle(angle)
			DoneObject(self)
		end)
	end
end

DefineClass.RCRoverBuilding = { __parents = { "BaseRoverBuilding" }, rover_class = "RCRover" }
DefineClass.RCTransportBuilding = { __parents = { "BaseRoverBuilding" }, rover_class = "RCTransport" }
DefineClass.RCExplorerBuilding = { __parents = { "BaseRoverBuilding" }, rover_class = "ExplorerRover" }
DefineClass.SupplyRocketBuilding = { 
	__parents = { "BaseRoverBuilding", "RocketLandingSite" }, 
	rover_class = false,
}

function DeleteRocketConstruction(pos)
	local q, r = WorldToHex(pos)
	local blds = HexGridGetObjects(ObjectGrid, q, r, nil, nil, function(o)
		return IsKindOf(o, "LandingPad") or IsKindOf(o, "TradePad")
	end)
	for _, bld in ipairs(blds) do
		bld.rocket_construction = nil
	end
end

function SupplyRocketBuilding:GameInit()
	CreateGameTimeThread(function()
		g_UITotalRockets = g_UITotalRockets + 1
		local rocket = PlaceBuilding(GetRocketClass(), {city = UICity, name = GenerateRocketName()})
		UICity:AddToLabel("SupplyRocket", rocket)
		rocket:SetPos(self:GetSpotPos(self:GetSpotBeginIndex("Rocket")))
		rocket:SetAngle(self:GetAngle())
		rocket:SetCommand("Unload")
		rocket.landing_site = PlaceBuilding("RocketLandingSite")
		local pos = self:GetPos()
		rocket.landing_site:SetPos(pos)
		rocket.landing_site:SetAngle(self:GetAngle())
		DeleteRocketConstruction(pos)
		DoneObject(self)
	end)
end

function OnMsg.ConstructionSiteRemoved(construction_site)
	if construction_site and construction_site.building_class=="SupplyRocketBuilding" then
		local pos = construction_site:GetPos()
		DeleteRocketConstruction(pos)
	end
end

function OnMsg.DataLoaded()
	ClassDescendants("BaseRoverBuilding", function(classname, class)
		if class.unlock_tech then
			local requirements = BuildingTechRequirements[classname] or {}
			BuildingTechRequirements[classname] = requirements
			requirements[#requirements + 1] = { tech = class.unlock_tech, hide = class.hide, check_supply = class.check_supply }
		end
	end)
end
