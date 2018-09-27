GlobalVar("g_TunnelsAdjacency", {})
GlobalVar("g_LastPlacedTunnel", false) --tunnels link through this variable, it's assumed they are placed together through a construction group, and that they always come in pairs
local TunnelMask = 32768

DefineClass.Tunnel = {
	__parents = {"ElectricityGridObject", "LifeSupportGridObject", "Building", "Holder" },

	linked_obj = false,
	on_off_button = false,
	prio_button = false,
	accumulate_dust = false,
	construction_mode = "tunnel_construction",

	travel_time_per_hex = 100, --ms

	registered_point = false,
	--diamond inheritance
	is_tall = false,
	MoveInside = __empty_function__, --this needs to be impl if tunnels can be in domes.
}

function Tunnel:Init()
	if not g_LastPlacedTunnel then
		g_LastPlacedTunnel = self
	else
		self.linked_obj = g_LastPlacedTunnel
		g_LastPlacedTunnel.linked_obj = self
		g_LastPlacedTunnel = false
	end
end

function Tunnel:Destroy()
	Building.Destroy(self)
	if self.linked_obj then
		Building.Destroy(self.linked_obj)
	end
end

function Tunnel:RegPoints(pt1, pt2, unreg)
	local h1 = xxhash(pt1:x(), pt1:y())
	local h2 = xxhash(pt2:x(), pt2:y())
	g_TunnelsAdjacency[h1] = not unreg and pt2 or nil
	g_TunnelsAdjacency[h2] = not unreg and pt1 or nil
end

function GetTunnelAdjacency(q, r)
	--c calls this
	local ret = g_TunnelsAdjacency[xxhash(q, r)]
	if not ret then return nil end
	return ret:x(), ret:y()
end

function Tunnel:GetPointToReg(obj)
	local dir = HexAngleToDirection(obj:GetAngle())
	local s_p = obj:GetShapePoints()[1]
	local x, y = HexRotate(s_p:x(), s_p:y(), dir)
	local q, r = WorldToHex(obj)
	
	return point(q + x, r + y)
end

function Tunnel:GameInit()
	assert(self.linked_obj)
	--reg conn teleprt
	if not self.registered_point then
		self.registered_point = self:GetPointToReg(self)
		self.linked_obj.registered_point = self:GetPointToReg(self.linked_obj)
		self:RegPoints(self.registered_point, self.linked_obj.registered_point)
	end
	Notify(self, "AddPFTunnel")
	--merge grids
	self:MergeGrids("electricity")
	self:MergeGrids("water")
	--mark tunnel mask
	local conn = HexGridGet(SupplyGridConnections.electricity, self.registered_point)
	HexGridSet(SupplyGridConnections.electricity, self.registered_point, bor(conn, TunnelMask))
	conn = HexGridGet(SupplyGridConnections.water, self.registered_point)
	HexGridSet(SupplyGridConnections.water, self.registered_point, bor(conn, TunnelMask))
end

function Tunnel:Done()
	--clean conn grid if not cleared
	local conn = HexGridGet(SupplyGridConnections.electricity, self.registered_point)
	if band(conn, TunnelMask) ~= 0 then
		HexGridSet(SupplyGridConnections.electricity, self.registered_point, band(conn, bnot(TunnelMask)))
		conn = HexGridGet(SupplyGridConnections.water, self.registered_point)
		HexGridSet(SupplyGridConnections.water, self.registered_point, band(conn, bnot(TunnelMask)))
	end
	self:KickUnitsFromHolder()
	self:RemovePFTunnel()
	--kill friend
	if IsValid(self.linked_obj) then
		self:RegPoints(self.registered_point, self.linked_obj.registered_point, true)
		self.linked_obj.linked_obj = false
		DoneObject(self.linked_obj)
		self.linked_obj = false
	end
end

function Tunnel:CleanTunnelMask()
	local conn = HexGridGet(SupplyGridConnections.electricity, self.registered_point)
	HexGridSet(SupplyGridConnections.electricity, self.registered_point, band(conn, bnot(TunnelMask)))
	conn = HexGridGet(SupplyGridConnections.water, self.registered_point)
	HexGridSet(SupplyGridConnections.water, self.registered_point, band(conn, bnot(TunnelMask)))
end

function Tunnel:OnSetDemolishing(...)
	if self.linked_obj and self.linked_obj.demolishing ~= self.demolishing then
		self.linked_obj:ToggleDemolish()
	end
	return Building.OnSetDemolishing(self, ...)
end

function Tunnel:RebuildCancel(dont_propagate)
	if not dont_propagate and self.linked_obj then
		self.linked_obj:RebuildCancel(true)
	end
	
	Building.RebuildCancel(self)
end

function Tunnel:Rebuild()
	assert(self.destroyed)
	local group = CreateConstructionGroup("Tunnel", self:GetPos(), 2, false)
	local params1 = {construction_group = group, place_stockpile = false}
	local params2 = {construction_group = group, place_stockpile = false}
	params1.linked_obj = params2
	params2.linked_obj = params1
	table.insert(group, params1)
	table.insert(group, params2)

	Building.Rebuild(self.linked_obj, params2)
	return Building.Rebuild(self, params1)
end

function Tunnel:OnDestroyed()
	self:RemovePFTunnel()
	self:CleanTunnelMask()
	ElectricityGridObject.OnDestroyed(self)
	LifeSupportGridObject.OnDestroyed(self)
end

function Tunnel:MergeGrids(type_of_grid)
	local my_grid = self[type_of_grid].grid
	local his_grid = self.linked_obj[type_of_grid] and self.linked_obj[type_of_grid].grid
	if my_grid and his_grid and my_grid ~= his_grid then
		--both objs are connected in diff grids
		
		local smaller_grid = #my_grid.elements < #his_grid.elements and my_grid or his_grid
		local other_grid = smaller_grid == my_grid and his_grid or my_grid
		assert(smaller_grid ~= other_grid) --todo:rem
		MergeGrids(other_grid, smaller_grid) --merge smaller into bigger, should be faster
	end
end

function Tunnel:CreateElectricityElement()
	self.electricity = SupplyGridElement:new{building = self}
end

function Tunnel:CreateLifeSupportElements()
	self.water = SupplyGridElement:new{building = self}
end

function Tunnel:ShouldShowNotConnectedToPowerGridSign()
	return false
end

function Tunnel:ShouldShowNotConnectedToLifeSupportGridSign()
	return false
end

function Tunnel:ShouldShowNotConnectedToGridSign()
	return false
end

function Tunnel:UpdateAttachedSigns()
end

function Tunnel:AddPFTunnel()
	if not IsValid(self.linked_obj) then
		return
	end
	local entrance, start_point = self:GetEntrance(nil, "tunnel_entrance")
	local exit, exit_point = self.linked_obj:GetEntrance(nil, "tunnel_entrance")

	local tunnel_len = entrance[1]:Dist2D(exit[1])
	local enter_exit_len = entrance[1]:Dist2D(entrance[#entrance]) + exit[1]:Dist2D(exit[#exit])
	local weight = (tunnel_len/10 + enter_exit_len) * pathfind[1].terrain / terrain.RoadTileSize()

	pf.AddTunnel(self, start_point, exit_point, weight, -1, 0)
end

function Tunnel:RemovePFTunnel()
	pf.RemoveTunnel(self)
end

function Tunnel:TraverseTunnel(unit, start_point, end_point, param)
	if not IsValid(self) or not IsValid(self.linked_obj) then
		return false
	end
	unit:PushDestructor(function(unit)
		local linked_obj = self.linked_obj
		if not IsValid(self) or not IsValid(linked_obj) then
			return
		end
		local entrance, start_point = self:GetEntrance(self, "tunnel_entrance")
		local exit, exit_point = linked_obj:GetEntrance(nil, "tunnel_entrance")
		local tunnel_len = entrance[1]:Dist2D(exit[1])
		local travel_time = self.travel_time_per_hex * tunnel_len / const.GridSpacing

		self:LeadIn(unit, entrance)
		local unit_pos = unit:GetPos()
		if not IsValid(unit) then return end
		unit:DetachFromMap()
		local dummy_obj = false
		if IsValid(linked_obj) then
			unit:SetHolder(linked_obj)
			if camera3p.IsActive() and unit == CameraFollowObj then
				dummy_obj = PlaceObject("Movable"); 
				dummy_obj:SetPos(unit_pos)
				camera3p.DetachObject(unit)
				camera3p.AttachObject(dummy_obj)
				dummy_obj:SetPos(exit[1], travel_time)
			end
			unit.current_dome = IsObjInDome(linked_obj)
			Sleep(travel_time)
			if dummy_obj then
				if camera3p.IsActive() then
					camera3p.DetachObject(dummy_obj)
					camera3p.AttachObject(unit)
				end
				DoneObject(dummy_obj)
			end
			if IsValid(unit) and IsValid(linked_obj) then
				unit:ExitBuilding(linked_obj, nil, "tunnel_entrance")
			end
		elseif IsValid(self) then
			unit:ExitBuilding(self, nil, "tunnel_entrance")
		end
	end)
	unit:PopAndCallDestructor()
	return true
end

function OnMsg.LoadGame()
	MapForEach("map","Tunnel", Tunnel.AddPFTunnel )
end

function Tunnel:GetRefundResources()
	if self.linked_obj and self.linked_obj.refund_on_salvage and self.refund_on_salvage then
		self.linked_obj.refund_on_salvage = false
	end
	
	return Building.GetRefundResources(self)
end

DefineClass.TunnelDoorWithFX = {
	__parents = { "DoorWithFX" },
}
