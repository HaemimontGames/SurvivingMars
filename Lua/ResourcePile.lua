DefineClass.ResourcePile = {
	__parents = { "TaskRequester", "Shapeshifter", "InfopanelObj" },
	enum_flags = { efRemoveUnderConstruction = true },
	game_flags = { gofPermanent = true, gofTemporalConstructionBlock = true },
	properties = {
		{ id = "resource", editor = "text", default = "WasteRock", no_edit = true },
	},
	entity = "Resource",
	amount = 0,
	transport_request = false,
	display_name = T{692, "Resources"},
	description = T{693, "A pile of processed resources, available for your Drones."},
	ip_template = "ipResourcePile",
	
	parent_dome = false,
}

function ResourcePile:GameInit()
	self:SetResource(self.resource)
end

function ResourcePile:DoesHaveSupplyRequestForResource(resource)
	return self.resource == resource and self.transport_request
end

function ResourcePile:CreateResourceRequests()
	self.transport_request = self:AddSupplyRequest(self.resource, self.amount, const.rfSpecialDemandPairing)
end

function ResourcePile:SetResource(resource)
	SetPileResource(self, resource)
end

function ResourcePile:DroneLoadResource(drone, request, resource, amount)
	if self.transport_request:GetActualAmount() <= 0 then
		DoneObject(self)
	end
end

function ResourcePile:RoverWork(rover, request, resource, amount)
	if self.transport_request:GetActualAmount() <= 0 then
		DoneObject(self)
	end
end

function ResourcePile:GetDisplayName()
	if self.resource == "WasteRock" then
		return T{694, "Waste Rock Pile"}
	else 
		return self.display_name
	end
end

function ResourcePile:GetDescription()
	if self.resource == "WasteRock" then
		return T{3673, "A pile of Waste Rock"}
	else 
		return self.description
	end
end

function ResourcePile:GetStoredAmount()
	return self.amount
end

function ResourcePile:GetShapePoints()
	return GetEntityOutlineShape(nil)
end

function PlaceResourcePile(pos, resource, amount)
	local dome_at_pt = GetDomeAtPoint(pos)
	local pile = PlaceObject("ResourcePile", {resource = resource, amount = amount, parent_dome = dome_at_pt})
	pile:SetPos(pos)
	return pile
end

function SpawnResourcePile(piles, res, amount, pos)
	if amount<=0 then return end
	local pt
	for i = 1, 200 do
		pt = GetRandomPassableAround(pos, 10*guim)
		local bover = false
		for j=1, #piles do
			if piles[j]:GetDist2D(pt) < 1*guim then
				bover = true
				break
			end
		end
		if not bover then
			break
		end
	end
	piles[#piles + 1] = PlaceResourcePile(pt, res, amount)
end
