GlobalVar("g_BlackCubeStockpileAnimThread", false)
GlobalVar("g_BCHexRangeEnable", {})

DefineClass.BlackCubeMystery = {
	__parents = {"MysteryBase"},
	
	scenario_name = "Mystery 1",
	
	--counters
	spawned_cubes = 0,
	destroyed_cubes = 0,
	stored_cubes = 0, --cubes in dumps
	used_cubes = 0, --cubes used in constr.
	--phases
	can_destroy_cubes = false,
	
	display_name = T{1164, "The Power of Three (Easy)"},
	rollover_text = T{1165, '"Science is no more than an investigation of a miracle we can never explain, and art is an interpretation of that miracle."<newline><right>- Ray Bradbury'},
	challenge_mod = 20,
	order_pos = 1,
	
	tower_protect_range = 20,
}

function BlackCubeMystery:Init()
	self.city:InitEmptyLabel("BlackCubeStockpiles")
	StartBlackCubeAnimationThread()
	table.remove_entry(StorableResourcesForSession, "BlackCube")
end

function StartBlackCubeAnimationThread()
	StopBlackCubeAnimationThread()
	g_BlackCubeStockpileAnimThread = CreateGameTimeThread(function()
		while true do
			local piles = UICity.labels.BlackCubeStockpiles
			if #piles > 0 then
				table.shuffle(piles)
				for _,pile in ipairs(piles) do
					local state, idle_prefix = "rotate", "idle"
					if g_BlackCubesActive then
						state = "rotateActive"
						idle_prefix = "active"
					end
					if IsValid(pile) and pile.count == 27 and IsValid(pile.rocks_obj) and pile:GetParent() == nil then ---- important! could have been killed since enumeration
						PlayFX("BlackCubesRotate", "start", pile)
						pile.rocks_obj:PlayState(state)
						if IsValid(pile) and IsValid(pile.rocks_obj) then --check if after the animation the object still exists
							pile.rocks_obj:SetState(idle_prefix .. pile.count)
						end
					end
					Sleep(2000)
				end
			else
				Sleep(5000)
			end
		end
	end)
end

function StopBlackCubeAnimationThread()
	DeleteThread(g_BlackCubeStockpileAnimThread)
end
----------------------------------------------------------------------------------
--                   BlackCubeStockpile
-----------------------------------------------------------------------------------
DefineClass.BlackCubeStockpileBase = {
	game_flags = { gofPermanent = false },
	__parents = {"WasteRockStockpileBase", "InfopanelObj"},
	--black cube specific stuff	
	city = false,
	destroy_work_request = false,
	--max 15 cubes per hex, it uses a special entity so it doesnt matter how x*y*z == 15
	max_x = 27,
	max_y = 1,
	max_z = 1,
	
	
	snap_to_grid = true, --will center in hex
	apply_to_grids = true, --will block constr

	destroy_when_empty = true, --will doneobject(self) when no cubes remain
	has_demand_request = false,
	
	resource = "BlackCube",
	
	
	is_tall = false,
	priority = 2,
	parent_construction = false,
	
	--vis specific
	cube_class = false,
	has_platform = false, --always false for black cubes i think
	pile_entity_no_plat = "BlackCubePile", --this hsould be the entity with a bunch of states
	rocks_obj = false,
	set_terrain_type = false,
	
	description = T{1166, "Black. Cube-shaped. Just standing there, challenging our preconceptions."},
	display_name = T{1167, "Black Cube Matrix"},
	
	suppress_spawned_cube_counter = false,
	
	max_assigned_units = 4,
	
	fx_actor_class = "BlackCubeStockpile",
	
	is_being_destroyed = false,
	ip_template = "ipResourcePile",
	
	dome_label = false,
}

function BlackCubeStockpileBase:GameInit()
	self.city = self.city or UICity
	self:SetCountFromRequest()
	
	if not self.suppress_spawned_cube_counter and self.city.mystery then
		self.city.mystery.spawned_cubes = self.city.mystery.spawned_cubes + self.stockpiled_amount / const.ResourceScale
	end
	
	self.city:AddToLabel("BlackCubeStockpiles", self)
	
	self:SetOpacity(0)
	self:SetOpacity(100, 1000)
end

function BlackCubeStockpileBase:CreateResourceRequests()
	if self.has_supply_request then
		self.supply_request = self:AddSupplyRequest(self.resource, self.stockpiled_amount, self.additional_supply_flags, self.max_assigned_units)
	end
	
	self.has_demand_request = false
end

function BlackCubeStockpileBase:Destroy()
	if not self.is_being_destroyed then	
		--start destroying
		
		--first interrupt all drones that are currently working on our supply.
		if self.supply_request:GetFreeUnitSlots() < self.max_assigned_units then --there are working drones on our supp req
			local initial_working_drones = self.max_assigned_units - self.supply_request:GetFreeUnitSlots()
			local found_drones = 0
			
			self:InterruptDrones(
				nil, function(drone) --drone filter
					if drone.command == "PickUp" and drone.s_request == self.supply_request then
						return drone
					end
				end,
				function(drone) --on drone reset cb
					found_drones = found_drones + 1
				end
			)
			
			assert(found_drones == initial_working_drones)
		end
		
		
		self:DisconnectFromCommandCenters() --disconnect so we can rearrange our requests
		table.remove_entry(self.task_requests, self.supply_request) --the task_requests table is what the command center sees, so remove supply.
		self.destroy_when_empty = true
		
		if not self.destroy_work_request then
			--if we havn't created the work request, create it now
			self.destroy_work_request = self:AddWorkRequest("deconstruct", self.stockpiled_amount + const.ResourceScale, 0, 1) --max 1 drone, this will add it to task_reqests table
		else
			--alternatively just add it to the proper table
			self.destroy_work_request:ResetAmount(self.stockpiled_amount + const.ResourceScale) --make sure it has the correct work amount
			table.insert(self.task_requests, self.destroy_work_request)
		end
		self:ConnectToCommandCenters()
	else
		--stop destroying
		--interrupt all drones working on the deconstruct request
		self:InterruptDrones(
			nil, function(drone)
				if drone.command == "Work" and drone.target == self then
					return drone
				end
			end, nil
		)
		
		self:DisconnectFromCommandCenters()
		table.remove_entry(self.task_requests, self.destroy_work_request)
		
		table.insert(self.task_requests, self.supply_request)
		self:ConnectToCommandCenters()
	end
	
	self.is_being_destroyed = not self.is_being_destroyed
end

function BlackCubeStockpileBase:DroneWork(drone, request, resource, amount)
	drone:PushDestructor(function(drone)
		local self = drone.target
		if self.destroy_when_empty and self:GetStoredAmount() <= 0 then
			if SelectedObj == self then
				SelectObj(false)
			end
			if IsValid(self) then --we might be dead if destroy_when_empty == true
				DoneObject(self)
			end
		end
	end)
	drone:ContinuousTask(request, amount, g_Consts.DroneDeconstructBatteryUse, "constructStart", "constructIdle", "constructEnd", "Construct",
		function(drone, work_req, subtract)
			assert(subtract % const.ResourceScale == 0, "no frac counting for destroyed black cubes")
			local self = drone.target
			local mystery = self.city.mystery
			mystery.destroyed_cubes = mystery.destroyed_cubes + abs(subtract) / const.ResourceScale
			self:AddResourceAmount(-subtract) --this will update our supply request
		end)
	drone:PopAndCallDestructor()
end

function BlackCubeStockpileBase:SetCount(n)
	n = n / const.ResourceScale --+ (n % const.ResourceScale == 0 and 0 or 1)
	n = Clamp(n, 0, 27)

	local rocks_obj = self.rocks_obj
	if rocks_obj and IsValid(rocks_obj) then
		if n == 0 then
			rocks_obj:ClearEnumFlags(const.efVisible)
		else
			rocks_obj:SetEnumFlags(const.efVisible)
			
			local prefix = g_BlackCubesActive and "active" or "idle"
			local parent = self:GetParent()
			local has_compact_in_state_name = string.find(GetStateName(rocks_obj:GetState()), "Compact")
			
			if not parent and not has_compact_in_state_name and self.count == 27 and n == 26 then
				local anim_name = g_BlackCubesActive and "closingActive" or "closing"
				rocks_obj:SetState(anim_name) --fancy anim
			elseif not parent and not has_compact_in_state_name and self.count == 26 and n == 27 then
				local anim_name = g_BlackCubesActive and "closingActive" or "closing"
				CreateGameTimeThread(function()
					rocks_obj:SetState(anim_name, const.eReverse)
					Sleep(rocks_obj:GetAnimDuration() - 1)
					if not IsValid(self) then return end
					if self.count == 27 then --if we are in the same state after anim.
						rocks_obj:SetState(prefix.."27")
					end
				end, self, anim_name, prefix)
			else
				local suffix = n < 2 and "" or tostring(n)
				if parent and n == 27 then
					suffix = suffix .. "Compact"
				end
				rocks_obj:SetState(prefix..suffix)
			end
		end
	end
	self.count = n
end

function BlackCubeStockpileBase:DisconnectFromParent()
	ResourceStockpileBase.DisconnectFromParent(self)
	if not self.has_supply_request then
		assert(self.resource == "BlackCube" and not self.has_demand_request) --make sure it's the fringe case we think it is.
		--become a supply only, constr blocking
		self:DisconnectFromCommandCenters()
		self.has_supply_request = true
		self.supply_request = self:AddSupplyRequest(self.resource, self.stockpiled_amount) --waste rock can be carried out without demand req.
		
		self:ConnectToCommandCenters()
	end
end

function BlackCubeStockpileBase:Done()
	self.city:RemoveFromLabel("BlackCubeStockpiles", self)
	PlayFX("Working", "end", self)
end

function BlackCubeStockpileBase:GetSelectionRadiusScale()
	return 100 + (MulDivRound(self.count - 1, 100, 14) * 200) / 100
end

GlobalVar("g_BlackCubesActive", false)

function BlackCubesSetActive(value)
	if value == g_BlackCubesActive then return end
	g_BlackCubesActive = value
	local moment = g_BlackCubesActive and "start" or "end"
	MapForEach("map", "BlackCubeStockpileBase", function(pile, moment)
															pile:SetCountFromRequest()
															PlayFX("ActivateBlackCubes", moment, pile)
														end, moment )
end

DefineClass.BlackCubeStockpile = {
	__parents = {"BlackCubeStockpileBase", "GridObject"},
	is_tall = false,
	snap_to_grid = true,
	ApplyToGrids = function(self, ...) return WasteRockStockpileBase.ApplyToGrids(self, ...) end,
	RemoveFromGrids = function(self, ...) return WasteRockStockpileBase.RemoveFromGrids(self, ...) end,
	GetShapePoints = function(self, ...) return WasteRockStockpileBase.GetShapePoints(self, ...) end,
}

DefineClass.BlackCubeStockpileUngrided = {
	__parents = {"BlackCubeStockpileBase", "UngridedObstacle"},
	
	GetModifiedBSphereRadius = function(self, ...) return ResourceStockpileBase.GetModifiedBSphereRadius(self, ...) end,
	apply_to_grids = false,
}

DefineClass.BlackCubeStockpileWithSuppressedCounter = {
	__parents = { "BlackCubeStockpileUngrided" },
	suppress_spawned_cube_counter = true,
}

function dbg_PlaceCubeAtCursor()
	local ooo = PlaceObject("BlackCubeStockpileUngrided", {init_with_amount = 27 * 1000})
	ooo:SetPos(GetTerrainCursor())
end

-----------------------------------------------------------------------------------
--                   BlackCubeDump
-----------------------------------------------------------------------------------
DefineClass.BlackCubeDumpSite = {
	entity = "BlackCubeDepot",
	__parents = {"DumpSiteWithAttachedVisualPilesBase"},
	
	resource = "BlackCube",
	stockpile_spots = {"Wasterockpile"}, --changeme
	stockpile_class = "BlackCubeStockpileUngrided",
	has_demand_request = false,
	has_supply_request = false,
	exclude_from_lr_transportation = false,

	properties = {
		{ template = true, name = T{1168, "Max Amount Black Cubes"},  category = "Storage Space", id = "max_amount_BlackCube",  editor = "number", default = 45000, scale = const.ResourceScale },
	},
}

function BlackCubeDumpSite:Init()
	self.exploitation_resource = self.resource
	self.parent = self
	self.additional_stockpile_params = { priority = self.priority, apply_to_grids = false, suppress_spawned_cube_counter = true}
end

function BlackCubeDumpSite:DroneLoadResource(drone, request, resource, amount)
	DumpSiteWithAttachedVisualPilesBase.DroneLoadResource(self, drone, request, resource, amount)
	self.city.mystery.stored_cubes = self.city.mystery.stored_cubes - amount / const.ResourceScale
end

function BlackCubeDumpSite:DroneUnloadResource(drone, request, resource, amount)
	DumpSiteWithAttachedVisualPilesBase.DroneUnloadResource(self, drone, request, resource, amount)
	self.city.mystery.stored_cubes = self.city.mystery.stored_cubes + amount / const.ResourceScale
end

function BlackCubeDumpSite:Done()
	if self.city.mystery then
		local count = self:GetStored_BlackCube() / const.ResourceScale
		self.city.mystery.stored_cubes = self.city.mystery.stored_cubes - count
	end
end

function BlackCubeDumpSite:Getui_BlackCube() return T{1169, "Black Cube<right><Stored_BlackCube>/<MaxAmount_BlackCube>", self} end

function TestBlackCube(pos)
	pos = pos or GetTerrainCursor()
	local obj = PlaceObject("BlackCubeStockpile", {init_with_amount = 27000})
	obj:SetPos(pos)
	UICity.mystery.can_destroy_cubes = true
end

function PlaceBlackCubeOnDestroyedRegolithExtractorPos(pos, init_with_amount)
	local obj = PlaceObject("BlackCubeStockpile", {init_with_amount = init_with_amount})
	if MapGet(pos, 0, "TerrainDeposit") then
		local q, r = WorldToHex(pos)
		local x, y = HexToWorld(q + 1, r)
		pos = point(x, y)
	end
	obj:SetPos(pos)
	return pos
end

----------------------------------------------------------------------------------
--                   BlackCubeMonolith
-----------------------------------------------------------------------------------
DefineClass.BlackCubeMonolith = {
	__parents = { "NotRenamableBuilding" },
	anim_thread = false,
}

function BlackCubeMonolith:OnSetWorking(working)
	NotRenamableBuilding.OnSetWorking(self, working)
	
	if working then
		if not IsValidThread(self.anim_thread) then
			self.anim_thread = CreateGameTimeThread(function(self)
				while IsValid(self) do
					PlayFX("Pulse", "start", self)
					Sleep(4000)
				end
			end, self)
		end
	else
		if IsValidThread(self.anim_thread) then
			DeleteThread(self.anim_thread)
		end
	end
end

function OnMsg.GatherFXActions(list)
	list[#list + 1] = "Activate"
	list[#list + 1] = "Pulse"
end

function OnMsg.GatherFXActors(list)
	list[#list + 1] = "BlackCubeMonolith"
end
