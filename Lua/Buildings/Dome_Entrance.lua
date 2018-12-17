DefineClass.Dome_Entrance = {
	__parents = { "BuildingEntityClass", "ComponentCustomData", "PFTunnel" },
	leadin_chain = false,
	leadout_chain = false,
}

function Dome_Entrance:AddDirectionTunnel(direction, start_spot, end_spot)
	local leadin_chain, start_pos = self:GetEntrance(nil, nil, start_spot)
	local leadout_chain, end_pos = self:GetEntrance(nil, nil, end_spot)
	local weight = start_pos:Dist2D(end_pos)* pathfind[1].terrain / terrain.RoadTileSize()
	pf.AddTunnel(self, start_pos, end_pos, weight * 6, 2, direction) -- usable by people only, high weight so they're avoided as much as possible
	pf.AddTunnel(self, start_pos, end_pos, weight, 1, direction) -- usable by drones only
	self.leadin_chain = self.leadin_chain or {}
	self.leadin_chain[direction] = leadin_chain
	self.leadout_chain = self.leadout_chain or {}
	self.leadout_chain[direction] = leadout_chain
end

function Dome_Entrance:AddPFTunnel()
	local dome = self:GetParent()
	assert(dome)
	if not IsKindOf(dome, "Dome") then return end
	self:AddDirectionTunnel(1, "Doorentrance1", "Doorexit1")
	self:AddDirectionTunnel(2, "Doorentrance2", "Doorexit2")
end

function Dome_Entrance:RemovePFTunnel()
	pf.RemoveTunnel(self)
end

local StockpileEnterExitDomeOffset = point(0, 0, -80)

function Dome_Entrance:TraverseTunnel(unit, start_point, end_point, direction)
	local dome = self:GetParent()
	if not dome or not IsValid(dome) then return end
	assert(IsKindOf(dome, "Dome"))

	local leadin_chain = self.leadin_chain[direction]
	local leadout_chain = self.leadout_chain[direction]
	assert(leadin_chain and leadout_chain)
	if not leadin_chain or not leadout_chain then return end
	
	--move carried box so it doesnt collide with dome entrance
	unit:ForEachAttach("ResourceStockpileBox", CObject.SetVisible, false)
	
	unit:PushDestructor(function(unit)
		-- restore carried box offset
		local i = 0
		unit:ForEachAttach("ResourceStockpileBox",  CObject.SetVisible, true)
		
		if unit:IsValidPos() and unit.safe_pos_on_failure then
			unit:SetPos(unit.safe_pos_on_failure)
			unit.safe_pos_on_failure = false
		end
	end)
	unit.safe_pos_on_failure = leadin_chain[#leadin_chain]
	dome:LeadIn(unit, leadin_chain)

	if not IsValid(dome) then
		unit:PopAndCallDestructor()
		return false
	end

	if direction == 1 then
		unit:OnEnterDome(dome)
	else
		unit:OnExitDome(dome)
	end
	
	unit.safe_pos_on_failure = leadout_chain[#leadout_chain]
	dome:LeadOut(unit, leadout_chain)
	unit.safe_pos_on_failure = false
	unit:PopAndCallDestructor()
	return true
end

DefineClass.DomePack_Entrance = {
	__parents = { "Dome_Entrance" },
}