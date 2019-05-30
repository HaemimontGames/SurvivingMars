

DefineClass.Deposit = {
	__parents = { "EditorObject", "PinnableObject", "InfopanelObj" },
	flags = { efMarker = true },
	
	encyclopedia_id = false,
	resource = false, --"Metals", "Concrete", "Polymers" --something from Resources global table preferably.
	
	properties = {
		{ category = "Debug", name = "Marker", id = "DepositMarker", editor = "object", default = false, developer = true, read_only = true, dont_save = true},
	},
	display_name = "",
	display_icon = "",
	description = T(634, "<resource(resource)> Deposit"),
	
	pin_summary1 = "",
	pin_on_start = false,
	
	radius_max = 0,
	quality_mul = 100,
	
	city_label = false,
	max_amount = 0,
	
	marker = false,
}

function Deposit:GetDisplayName()
	return T{self.display_name, self}
end

function Deposit:AddToCitiesLabel()
	if self.city_label then
		for i = 1, #Cities do --deps should be in all cities ?
			Cities[i]:AddToLabel(self.city_label, self)
		end
	end
end

function Deposit:RemoveFromCitiesLabel()
	if self.city_label then
		for i = 1, #Cities do --deps should be in all cities ?
			Cities[i]:RemoveFromLabel(self.city_label, self)
		end
	end
end

function Deposit:Done()
	self:RemoveFromCitiesLabel()
	if SelectedObj == self then
		SelectObj(false)
	end
end

function Deposit:Init()
	self.encyclopedia_id = self.resource
end

function Deposit:GameInit()
	self:AdjustVisuals()
	self:AddToCitiesLabel()
end

function Deposit:GetDescription()
	return T{self.description, self}
end

function Deposit:GetResourceName()
	return self.resource and Resources[self.resource] and Resources[self.resource].display_name or ""
end

function Deposit:GetDepositMarker()
	return self.marker or MapGet("map", "DepositMarker", function(marker, deposit) return marker.placed_obj == deposit end, self)[1]
end

function Deposit:IsExplorationBlocked()
end

function Deposit:IsDepleted()
end

function Deposit:CheatRefill()
end

function Deposit:CheatEmpty()
end

function Deposit:GetQualityMultiplier()
	return 100
end

function Deposit:IsExploitableBy(exploiter)
	return IsValid(exploiter) and exploiter.exploitation_resource == self.resource and not self:IsDepleted()
end

function Deposit:GetDepth()
	return 0
end

function Deposit:GetAmount()
	return 0
end

function Deposit:DoesHaveSupplyRequestForResource(resource)
	return self.resource == resource
end

local UnbuildableZ = buildUnbuildableZ()

function CalcDepositZ(...)
	local q, r = WorldToHex(...)
	local z = HexMaxHeight(q, r)
	local bz = GetBuildableZ(q, r)
	if bz ~= UnbuildableZ then
		z = Max(z, bz) 
	end
	return z - 30
end

GlobalVar( "g_CurrentDepositScale", const.SignsOverviewCameraScaleDown )
GlobalVar( "g_CurrentDepositOpacity", const.SignsOverviewCameraOpacityDown )

function Deposit:AdjustVisuals()
	self:SetScale(g_CurrentDepositScale)
	self:SetOpacity(g_CurrentDepositOpacity)
	self:SetZ(CalcDepositZ(self))
end

function SavegameFixups.Deposit_AdjustVisuals()
	MapForEach("map", "Deposit", function(obj)
		obj:AdjustVisuals()
	end)
end

----

DefineClass.DepositMarker = {
	__parents = { "EditorMarker" },
	entity = "Hex1_Placeholder",
	resource = "",
	properties = {
		{ category = "Debug", name = T(8927, "Deposit"),      id = "Deposit",     editor = "object", default = false, developer = true, read_only = true, dont_save = true},
		{ category = "Debug", name = T(635, "Feature"), id = "dbg_feature", editor = "object", default = false, developer = true},
		{ category = "Debug", name = T(636, "Cluster"), id = "dbg_cluster", editor = "number", default = -1, developer = true},
		{ category = "Debug", name = T(637, "Prefab"),  id = "dbg_prefab",  editor = "text", default = "", developer = true},
	},
	is_placed = false,
	placed_obj = false, -- can still be false if is_placed = true, means the placement was obstructed and the deposit is lost
	depth_layer = 0,
	new_pos_if_obstruct = true,
}

function DepositMarker:Init()
	self:SetScale(110)
	if UICity then
		UICity:AddToLabel(self.class, self)
	end
end

function DepositMarker:Done()
	if UICity then
		UICity:RemoveFromLabel(self.class, self)
	end
end

function DepositMarker:GetDeposit()
	return self.placed_obj
end

function DepositMarker:GetObstructionRadius()
	return const.DepositObstructMaxRadius
end

function DepositMarker:EditorGetText()
	return self.class .. " " .. self.resource
end

function DepositMarker:GetDepthClass()
	return "surface"
end

function DepositMarker:PlaceDeposit(dont_move_if_obstruct)
	assert(g_MapArea)
	if not self.is_placed then
		-- check for buildings on the required position, don't place surface deposits if buildings are in the way
		local mx, my = self:GetVisualPosXYZ()
		local radius = self:GetObstructionRadius()
		local IsDepositObstructed = IsDepositObstructed
		local GetMapSectorXY = GetMapSectorXY
		local obstructed = IsDepositObstructed(mx, my, radius)
		if obstructed and self.new_pos_if_obstruct and not dont_move_if_obstruct then
			local IsPassable = terrain.IsPassable 
			local sector = GetMapSectorXY(mx, my)
			local sx, sy
			local x, y = FindBuildableAround(mx, my, {
				max_depth = GetMapSectorTile() / const.GridSpacing,
				wrong_value = "wrong",
				continue_check = function(qi, ri)
					local xi, yi = HexToWorld(qi, ri)
					if IsDepositObstructed(xi, yi, radius) then
						return true -- would continue searching in that directon
					end
					if GetMapSectorXY(xi, yi) ~= sector then
						if not sx then
							sx, sy = xi, yi
						end
						return "wrong" -- would stop searching in that directon
					end
				end,
			})
			if not x then
				if sx then
					x, y = sx, sy
					StoreErrorSource(self, "Failed to find a new place in the same sector!")
				else
					StoreErrorSource(self, "Failed to find a new place on the map!")
				end
			end
			if x then
				obstructed = false
				self:SetPos(x, y, const.InvalidZ)
				print("Obstructed", self.class, "moved to", x, y)
				mx, my = x, y
			end
		end
		self.placed_obj = not obstructed and self:SpawnDeposit()
		self.is_placed = true
		local sector = GetMapSectorXY(mx, my)
		if sector then
			sector:RegisterDeposit(self) -- for deposits which got spawned later by means other than exploration
		end
		if IsValid(self.placed_obj) then
			self.placed_obj.marker = self
			self.placed_obj:SetPos(mx, my, const.InvalidZ)
			if IsKindOf(self.placed_obj, "SubsurfaceDeposit") then
				self.placed_obj:SetAngle(mapdata and (mapdata.OverviewOrientation * 60) or 0)
			else
				self.placed_obj:SetAngle(self:GetAngle())
			end
		end
	end
	return self.placed_obj
end

function DepositMarker:SpawnDeposit() -- override this for the actual code which spawns the deposit
end

function DepositMarker:GetEstimatedAmount()
	return 0
end

----


GlobalVar("g_ResourceIconsTurnedOff", false)
GlobalVar("g_ResourceIconsVisible", true)
GlobalVar("ShowResourceIconReasons",  {})

function SetResourceIconsVisible(visible)
	if visible and not g_SignsVisible then return end
	if not visible and not g_ResourceIconsTurnedOff then return end
	local action = visible and "SetEnumFlags" or "ClearEnumFlags"
	if visible then
		MapSetEnumFlags(const.efVisible, "map","TerrainDeposit","SubsurfaceDeposit" )
	else
		MapClearEnumFlags(const.efVisible, "map","TerrainDeposit","SubsurfaceDeposit" )
	end
	g_ResourceIconsVisible = visible
end

function ShowResourceIcons(reason)
	reason = reason or false
	if next(ShowResourceIconReasons) == nil then
		SetResourceIconsVisible(true)
	end
	ShowResourceIconReasons[reason] = true
end

function HideResourceIcons(reason)
	reason = reason or false
	ShowResourceIconReasons[reason] = nil
	if next(ShowResourceIconReasons) == nil then
		SetResourceIconsVisible(false)
	end
end

function ToggleResourceIcons()
	g_ResourceIconsTurnedOff = not g_ResourceIconsTurnedOff
	SetResourceIconsVisible(not g_ResourceIconsTurnedOff)
end

----

function SavegameFixups.FixMarkerEnumFlag()
	local IsKindOf = IsKindOf
	local GetEnumFlags = CObject.GetEnumFlags
	local SetEnumFlags = CObject.SetEnumFlags
	local efMarker = const.efMarker
	MapForEach(function(obj)
		if GetEnumFlags(obj, efMarker) == 0 and IsKindOfClasses(obj, "Deposit", "TerrainWaterObject") then
			SetEnumFlags(obj, efMarker)
		end
	end)
end