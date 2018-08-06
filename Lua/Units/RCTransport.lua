---transport rover
DefineClass.RCTransport = {
	__parents = {  "BaseRover", "ComponentAttach", "SharedStorageBaseVisualOnly", },
	game_flags = { gofPermanent = true },

	properties = {
		{ template = true, name = T{765, "Pin Rollover"}, id = "pin_rollover", category = "Pin",  editor = "text", translate = true, dont_save = true},
		{ id = "max_shared_storage", default = 30 * const.ResourceScale, scale = const.ResourceScale, name = T{4460, "Max RC Transport resource capacity"}, modifiable = true, editor = "number" , no_edit = true},
	},

	gamepad_auto_deselect = false,

	entity = "RoverTransport",
	work_spot_task = "Workrover",
	work_spot_deposit = "Workrover",
	work_spot_drone_recharge = "Workrover",
	work_spot_drone_repair = "Workrover",
	
	fx_actor_class = "RCTransport",
	
	--storage -> Total resource storage is 30. Any combination of resources up to 30 is permitted to be stored in the Rover. The Rover never transports waste rock.
	storable_resources = {"Concrete", "Metals", "Polymers", "Food", "Electronics", "MachineParts", "PreciousMetals", "Fuel", "MysteryResource"},
	stockpiled_amount = false, --shared storage base knows what's stored in it due to its requests, we don't have any requests, so diff aproach
	max_x = 5,
	max_y = 3,
	max_z = 3,
	cube_placement_angle = 90 * 60,
	
	--route
	transport_route = false, --{from = pnt, to = pnt}
	transport_resource = "Metals", --the resource it wants to transport.
	route_visited_sources = false,
	route_visited_dests = false,
	
	--resolve inheritance
	GetShapePoints = DroneBase.GetShapePoints,
	GetDisplayName = DroneBase.GetDisplayName,
	GetModifiedBSphereRadius = UngridedObstacle.GetModifiedBSphereRadius,
	priority = 3,
	DroneApproach = BaseRover.DroneApproach,
	
	--ui
	display_name = T{1683, "RC Transport"},
	description = T{4461, "Remote-controlled vehicle that transports resources. Use it to establish permanent supply routes or to gather resources from surface deposits."},
	display_icon = "UI/Icons/Buildings/rover_transport.tga",
	
	malfunction_start_state = "malfunction",
	malfunction_idle_state = "malfunctionIdle",
	malfunction_end_state = "malfunctionEnd",
	
	pin_rollover = T{4462, "<Description><newline><newline><left>Concrete<right><concrete(Stored_Concrete)><newline><left>Metals<right><metals(Stored_Metals)><newline><left>Polymers<right><polymers(Stored_Polymers)><newline><left>Food<right><food(Stored_Food)><newline><left>Electronics<right><electronics(Stored_Electronics)><newline><left>Machine Parts<right><machineparts(Stored_MachineParts)><newline><left>Rare Metals<right><preciousmetals(Stored_PreciousMetals)><newline><left>Fuel<right><fuel(Stored_Fuel)>"},
	encyclopedia_id = "RCTransport",

	palettes = { "RCTransport" },
	
	to_load = false,
	resource_requests = false,
	
	ui_data_propagate = false, --when switching overview, using this to propagate route data.
	
	track_anim_moments = false,
	track_anim_moments_thread = false,
	amount_transfered_last_ct = 0,
}

--resolve inheritance
function RCTransport:Gossip()    return Unit.Gossip(self) end
function RCTransport:GossipName()return Unit.GossipName(self)end
--
function RCTransport:CreateResourceRequests()
	BaseRover.CreateResourceRequests(self) --repair
	SharedStorageBaseVisualOnly.CreateResourceRequests(self) --stockpile init
	
	--idle resource supply
	local storable_resources = self.storable_resources
	local resource_requests = {}
	self.resource_requests = resource_requests
	for i = 1, #storable_resources do
		local resource_name = storable_resources[i]
		resource_requests[resource_name] = self:AddSupplyRequest(resource_name, 0, const.rfCannotMatchWithStorage)
	end
end

function RCTransport:SaveCompatNoStorageMatch()
	local resource_requests = self.resource_requests
	for rn, req in pairs(resource_requests or empty_table) do
		req:AddFlags(const.rfCannotMatchWithStorage)
	end
end

function RCTransport:IsStorageFull()
	return self:GetStoredAmount() >= self.max_shared_storage
end

function RCTransport:OnContinuousTaskTick(amount, total_amount)
end

function RCTransport:ContinuousTask(request, amount, anim_start, anim_idle, anim_end, fx, fx_work_moment, work_time, add_res, reciprocal_request, total_amount)
	local building = request:GetBuilding()
	if not IsValid(building) then return end
	if amount == 0 then return end
	self:Face(building, 100)
	if fx then
		self:StartFX(fx, building)
	end
	self:PlayState(anim_start)
	self:SetState(anim_idle)
	if fx and table.find(self.track_anim_moments or empty_table, anim_idle) then
		self.track_anim_moments_thread = TrackAllMoments(self, fx, self, building)
	end
	
	local is_demmand = request:IsAnyFlagSet(const.rfDemand)
	local resource = request:GetResource()
	if reciprocal_request then
		resource = reciprocal_request:GetResource()
	end
	
	self.amount_transfered_last_ct = 0
	local construction_resource = table.find(AllResourcesList, resource) or false
	local is_supplying = construction_resource and ((is_demmand and amount > 0) or (not is_demmand and amount < 0)) or false --whether we are givin or taking resources.
	local empty_storage = construction_resource and not is_supplying and self:GetEmptyStorage(resource) or building:GetEmptyStorage(resource) or 10000000
	local amount_sign = abs(amount) / amount
	local abs_amount = abs(amount)
	local amount_transfered = 0
	local add_r_functor
	if building:HasMember("AddResource") then
		add_r_functor = function(a)
			building:AddResource(abs(a) * (is_supplying and 1 or -1), resource, true)
		end
	else
		add_r_functor = function(a)
			request:AddAmount(-a)
			if reciprocal_request then
				reciprocal_request:AddAmount(a)
			end
		end
	end
	
	while IsValid(building) and amount_transfered < (total_amount or max_int) and (not construction_resource or empty_storage > 0) 
			and ((is_supplying and self.resource_storage[resource] > 0 and (not request:IsAnyFlagSet(const.rfDemand) or request:GetActualAmount() > 0)) --if it aint a demand req we cant determine max amount.
			or (not is_supplying and ((is_demmand and construction_resource) or request:GetActualAmount() > 0)))
			--construction_resource is false when constructing/cleaning/repairing
			--is_supplying - true when giving resource, false when taking resource
			--is_demmand - req type
			do
			
		if fx and fx_work_moment then
			PlayFX(fx, fx_work_moment, self, building)
		end
		Sleep(work_time or 1000)
		if IsValid(building) then
			local max = abs_amount
			max = Min(is_supplying and self.resource_storage[resource] or max, max) --we are giving out resources, we cannot give more then we have
			max = Min(is_supplying and is_demmand and construction_resource and request:GetActualAmount() or max, max) --we are supplying construction resources, supply as much as the req requires.
			max = Min(not is_supplying and not is_demmand and construction_resource and request:GetActualAmount() or max, max) --we are taking stuff, reqs amount is the amount of stuff there is.
			local amount_clamped = amount_sign * Min(abs_amount, max, empty_storage)			
			add_r_functor(amount_clamped)
			
			if add_res then
				local a = amount_clamped * (is_demmand and -1 or 1) --negative amount for demmand reqs, positive amount for supply reqs..
				self:AddResource(a, resource)
				empty_storage = empty_storage - abs(a)
			end
			
			amount_transfered = amount_transfered + abs_amount
			self.amount_transfered_last_ct = amount_transfered
			self:OnContinuousTaskTick(abs_amount, amount_transfered)
		end
	end
	self:StopFX()
	DeleteThread(self.track_anim_moments_thread)
	self:PlayState(anim_end)
	return amount_transfered
end

function RCTransport:GetPriorityForRequest(req)
	if self.resource_requests[req:GetResource()] == req then
		return -1 --resources supplied by not LoadingComplete are lower prio then supply depots, this leaves -1
	end
	
	return self.priority
end

function RCTransport:GameInit()
	self:SetColorModifier(RGB(100, 100, 100)) --remove me, this is so saved green rovers revert to default.
	self.transport_route = {from = false, to = false}
	self.resource_storage = self.stockpiled_amount --same thing, called different things in diff classes, make one point to the other.
end

local function FullAndCanUnload(self, depot)
	local is_storage_depot = IsKindOf(depot, "StorageDepot")
	if self:GetStoredAmount() >= self.max_shared_storage or
		is_storage_depot and depot:GetStoredAmount() <= 0 then
		if is_storage_depot then
			for res, amount in pairs(self.stockpiled_amount) do
				if amount > 0 and depot.demand[res] and depot.demand[res]:GetActualAmount() > 0 then
					return true
				end
			end
		else
			for res, amount in pairs(self.stockpiled_amount) do
				if amount > 0 and depot.resource == res then
					return true
				end
			end
		end
	end
end

local function CanLoad(self, depot)
	if self:GetStoredAmount() < self.max_shared_storage then
		if IsKindOf(depot, "SurfaceDeposit") then
			return depot:GetAmount() > 0
		else
			return depot:GetStoredAmount() > 0
		end
	end
end

function RCTransport:CanInteractWithObject(obj, interaction_mode)
	if self.command=="Dead" then return false end
	if IsObjInDome(obj) then return false end
	if IsKindOf(obj, "SupplyRocket") and (interaction_mode == "unload" or not obj.working) then return false end
	if IsKindOfClasses(obj, "TradeRocket", "RefugeeRocket") then return false end
	
	if interaction_mode == "recharge" then
		--recharge is in base
		return BaseRover.CanInteractWithObject(self, obj, interaction_mode)
	end
	
	if IsKindOf(obj,"SharedStorageBaseVisualOnly") and not IsKindOf(obj,"BaseRover") then
		return false
	end
	--this unit can transfer resources
	if IsKindOfClasses(obj,"SurfaceDeposit") then
		return true, T{9636, "<UnitMoveControl('ButtonA', interaction_mode)> Gather Resources", self}
	end
	
	if IsKindOfClasses(obj,"ResourcePile") and obj.transport_request:GetResource() ~= "WasteRock" and obj.transport_request:GetResource() ~= "BlackCube" then
		return true, T{9636, "<UnitMoveControl('ButtonA', interaction_mode)> Gather Resources", self}
	end
	
	if IsKindOfClasses(obj,"ResourceStockpile", "StorageDepot") 
		and obj.resource ~= "WasteRock"
		and obj.resource ~= "BlackCube" 
		and not IsKindOfClasses(obj,"Unit") then --rctransport, cargoshuttle
		if interaction_mode == "unload" then
			return true, T{9637, "<UnitMoveControl('ButtonA', interaction_mode)>Unload Resource", self}
		elseif interaction_mode == "load" then
			return true, T{9638, "<UnitMoveControl('ButtonA', interaction_mode)>Load Resource", self}
		else
			if FullAndCanUnload(self, obj) then
				return true, T{9721, "<UnitMoveControl('ButtonX', interaction_mode)>Unload Resource", self}
			elseif CanLoad(self, obj) then
				return true, T{9639, "<UnitMoveControl('ButtonX', interaction_mode)>Load Resource", self}
			end
		end
	end
	
	return BaseRover.CanInteractWithObject(self, obj, interaction_mode)
end

function RCTransport:InteractWithObject(obj, interaction_mode)
	if self.command=="Dead" then return false end
	if interaction_mode == "recharge" then
		--recharge is in base
		return BaseRover.InteractWithObject(self, obj, interaction_mode)
	end

	local is_storage = obj and obj:IsKindOfClasses("StorageDepot","ResourceStockpile", "SurfaceDeposit", "ResourcePile") or false
	
	local actual_im = self.interaction_mode
	if (not actual_im or actual_im == "move") and is_storage then
		if FullAndCanUnload(self, obj) then
			actual_im = "unload"
		elseif CanLoad(self, obj) then
			actual_im = "load"
		end
	else
		actual_im = self.interaction_mode
	end
	local kill_im = not not self.interaction_mode
	
	if actual_im == "load" then
		if obj:IsKindOf("SurfaceDeposit") then
			self:SetCommand("PickupResource", obj.transport_request, nil, "goto_loading_complete")
		elseif obj:IsKindOf("ResourcePile") then
			self:SetCommand("PickupResource", obj.transport_request, "pile", "goto_loading_complete")
		elseif obj:IsKindOf("ResourceStockpile") and not obj:GetParent() then
			self:SetCommand("PickupResource", obj.supply_request, nil, "goto_loading_complete")
		elseif is_storage then --StorageDepot
			kill_im = false
			if #obj.resource > 0 and obj:GetStoredAmount()>0 then
				OpenResourceSelector(self,{target = obj, meta_key = const.vkControl, close_on_rmb = true, interaction_mode = "load" })
			else
				CityUnitController[UICity]:GoToPos(GetTerrainCursor())
			end
		end
		
		if kill_im then
			SetUnitControlInteractionMode(self, false)
		end
		return
	end
	
	if actual_im == "unload" then
		if obj:IsKindOf("SurfaceDeposit") then
			self:SetCommand("PickupResource", obj.transport_request)
		elseif obj:IsKindOf("ResourcePile") then
			self:SetCommand("PickupResource", obj.transport_request, "pile")
		elseif is_storage then --ResourceStockpile,StorageDepot
			kill_im = false
			local count_res_types, res_id = self:CountLoadedResourceTypes()
			if count_res_types==0 then 	
				self:SetCommand("Goto", GetTerrainCursor()) 
				return 
			elseif count_res_types==1 then
				self.transport_resource = res_id
				SetUnitControlInteractionMode(self, false)
				self:SetCommand("TransferResources", obj, "unload", res_id)
				return 
			elseif #obj.resource == 1 and (not self.stockpiled_amount[obj.resource[1]] or self.stockpiled_amount[obj.resource[1]]<=0) then
				self:SetCommand("Goto", GetTerrainCursor())
				return
			else	
				OpenResourceSelector(self,{target = obj, meta_key = const.vkControl, close_on_rmb = true, interaction_mode = "unload" })
			end	
		end
		
		if kill_im then
			SetUnitControlInteractionMode(self, false)
		end
		return
	end
	
	if actual_im == "route" then
		if not IsValid(obj) or (type(obj.resource) == "table" and #obj.resource > 1) then
			OpenResourceSelector(self,{target = obj, meta_key = const.vkControl, close_on_rmb = true})
		else
			self.transport_resource = type(obj.resource) == "table" and obj.resource[1] or obj.resource
		end
	else
		return BaseRover.InteractWithObject(self, obj, interaction_mode)
	end
end

function RCTransport:SetLoadMode(mode)
	self:SetInteractionMode(mode)
end

function RCTransport:LoadResource()
	self:SetInteractionMode("load")
end

function RCTransport:LoadResource_Update(button)
	local to_mode = self.interaction_mode ~= "load"
	button:SetIcon(to_mode and "UI/Icons/IPButtons/load.tga" or "UI/Icons/IPButtons/cancel.tga")
	button:SetEnabled(self:CanBeControlled())
	button:SetRolloverTitle(T{7554, "Load resources"})
	button:SetRolloverText(T{4499, "Give command to load or gather resources."})
	button:SetRolloverHint(to_mode and T{7509, "<left_click> Select target mode"} or T{7510, "<left_click> on target to select it  <right_click> Cancel"})
	button:SetRolloverHintGamepad(to_mode and T{7511, "<ButtonA> Select target mode"} or T{7512, "<ButtonA> Cancel"})
end

function RCTransport:UnloadResource()
	self:SetInteractionMode("unload")
end
  
function RCTransport:UnloadResource_Update(button)
	local to_mode = self.interaction_mode ~= "unload"
	button:SetIcon(to_mode and "UI/Icons/IPButtons/unload.tga" or "UI/Icons/IPButtons/cancel.tga")
	button:SetEnabled(self:CanBeControlled())
	button:SetRolloverTitle(T{4501, "Unload resources"})
	button:SetRolloverText(T{4502, "Give command to unload resources on a storage depot or on the ground."})
	button:SetRolloverHint(to_mode and T{7509, "<left_click> Select target mode"} or T{7510, "<left_click> on target to select it  <right_click> Cancel"})
	button:SetRolloverHintGamepad(to_mode and T{7511, "<ButtonA> Select target mode"} or T{7512, "<ButtonA> Cancel"})
end

function RCTransport:CountLoadedResourceTypes()
	local res_types = 0
	local res_id
	for res, amount in pairs(self.stockpiled_amount) do
		if amount>0 then
			res_types = res_types + 1  
			res_id = res
		end
	end
	return res_types,res_id
end

function RCTransport:GoToPos(pos)
	local mode = self.interaction_mode
	if mode=="unload" then
		local count_res_types, res_id = self:CountLoadedResourceTypes()
		if count_res_types==0 then 	
			self:SetCommand("Goto", pos) 
			return 
		elseif count_res_types==1 then
			self.transport_resource = res_id
			SetUnitControlInteractionMode(self, false)
			self:SetCommand("DumpCargo", pos, self.transport_resource)
			return 
		else
			OpenResourceSelector(self,{pos = pos, meta_key = const.vkControl, close_on_rmb = true})
		end	
	elseif mode=="load" then
		local selector = OpenResourceSelector(self,{pos = pos, meta_key = const.vkControl, close_on_rmb = true})
		if selector and #selector.items > 0 then
			selector:SetFocus(true)
		end
	else-- move and false
		self:SetCommand("Goto", pos)
	end	
end

local function CanPickupResourceFrom(o, resource)
	return o:DoesHaveSupplyRequestForResource(resource) or false
end

function RCTransport:CanPickupResourceFrom(o)
	local rover_resources = self.transport_resource
	if type(rover_resources) ~= "table" then
		return CanPickupResourceFrom(o, rover_resources)
	end
	for _, resource in ipairs(rover_resources) do
		if CanPickupResourceFrom(o, resource) then
			return true
		end
	end
end

local potential_sources = false
function RCTransport:GetStoredAmountIn(o, res)
	if not IsValid(o) then
		return 0
	elseif IsKindOf(o, "SurfaceDeposit") then
		return o:GetAmount()
	elseif IsKindOf(o, "ResourcePile") then
		return o.transport_request:GetTargetAmount()
	end
	--resource stockpile/storage dep/sharedstorage
	if IsKindOf(o, "ResourceStockpile") then
		local p = o:GetParent()
		if IsKindOfClasses(p, "Mine", "Factory", "Farm") then --potential future source.
			potential_sources = true
		elseif IsKindOfClasses(p, "MechanizedDepot") and p:GetStoredAmount(p.stockpiled_resource) > 0 then
			potential_sources = true
		end
	end
	res = res or self.transport_resource
	if type(res) ~= "table" then
		return o:GetStoredAmount(res)
	end
	local stored_amount = 0
	for _, resource in ipairs(res) do
		if CanPickupResourceFrom(o, resource) then
			stored_amount = stored_amount + o:GetStoredAmount(resource)
		end
	end
	return stored_amount
end

local RCTransport_AutoRouteRadius = 100 * guim
local ResourceScale = const.ResourceScale
local ResourceSourcesRoute_func = function(o, rover)
		if IsKindOf(o, "SharedStorageBaseVisualOnly") then return false end
		if IsObjInDome(o) then return false end
		if rover.route_visited_dests[o] then return end
		local route = rover.transport_route
		if route.from and route.to and not IsCloser2D(o, route.from, route.to) then return false end
		--check whether o carries such a resource as we need
		if not rover:CanPickupResourceFrom(o) then return end
		return rover:GetStoredAmountIn(o) >= ResourceScale --@least 1 cube
end

function RCTransport:ProcessRouteObj(obj, amount)
	local force_one_pickup = not not amount
	if IsKindOf(obj, "SurfaceDeposit") then
		self:PickupResource(obj.transport_request, nil, nil, force_one_pickup, amount)
	elseif IsKindOf(obj, "ResourcePile") then
		self:PickupResource(obj.transport_request, "pile", nil, force_one_pickup, amount)
	elseif type(self.transport_resource)=="table" then
		self:TransferAllResources(obj, "load", self.transport_resource, amount)
	else
		self:TransferResources(obj, "load", self.transport_resource, amount)
	end
end

local dest_tolerance = 50 * guim

function RCTransport:TransportRouteLoad()
	if self:GetEmptyStorage() <= 0 then return end
	if not self.transport_route then return end --no route set
	local pnt = self.transport_route.from
	if not self:Goto(pnt) and not self:IsCloser2D(pnt, dest_tolerance) then --get there
		self.transport_route.from = false --break route if dest is unreachable
		return
	end
	
	self:TryRechargeFromRoute()
	
	--analyze the area and pick stuff to load, if any
	--we can load from: surface dep, ResourcePile, ResourceStockpile and storage depots.
	while self:GetEmptyStorage() > 0 do
		if not IsValid(self) then 
			self.transport_route.from = false --break route, if we are dead.
			return
		end
		potential_sources = false
		local next_source = MapFindNearest(self, self, RCTransport_AutoRouteRadius, "ResourceStockpile", "ResourcePile", "SurfaceDeposit", "StorageDepot", ResourceSourcesRoute_func, self)
		if not next_source then --no sources left
			if potential_sources then
				if self:GetStoredAmount() <= 0 then
					--if there is a potential source nearby, wait a bit and try again
					self:SetState("idle")
					Sleep(10000)
				else
					return --go deliver
				end
			else
				self.transport_route.from = false --break route
				return
			end
		else
			if self.route_visited_dests[next_source] then --will load from where it last unloaded
				self.transport_route.from = false --break route
				return
			end
			self.route_visited_sources[next_source] = true
			self:ProcessRouteObj(next_source)
		end
		Sleep(100)
	end
	
	if self:GetStoredAmount() <= 0 then
		--something failed, break route
		self.transport_route.from = false
	end
end

local resource_dest_type = false
local ResourceDestinations_func = function(o, rover)
		local route = rover.transport_route
		return (not route.from or not route.to or IsCloser(o, route.to, route.from)) and not rover.route_visited_sources[o] and o:DoesAcceptResource(resource_dest_type) and 
				o:GetEmptyStorage(resource_dest_type) > 0 and (not IsKindOf(o, "ResourceStockpile") or not o:GetParent() or IsKindOf(o:GetParent(), "MechanizedDepot"))
				and not IsKindOf(o, "SupplyRocket") and not IsObjInDome(o)
end

function RCTransport:GetPredominantStoredResource()
	local r, max = next(self.stockpiled_amount)
	
	for r_f, amount in pairs(self.stockpiled_amount) do
		if amount > max then
			r = r_f
			max = amount
		end
	end
	
	return r
end

local function create_stockpile(self, resource_flag, value)
	local result
	local forward = RotateRadius(const.HexSize * 2 / 3, self:GetAngle(), self:GetPos())
	local q, r = WorldToHex(forward)
	result, q, r = TryFindStockpileDumpSpot(q, r, self:GetAngle(), HexSurroundingsCheckShapeLarge)
	if not result then return false end
	local stock = PlaceResourceStockpile_Instant(point(HexToWorld(q, r)), resource_flag, 0, self:GetAngle() - 90 * 60, false)
	self:PushDestructor(function(self)
		if IsValid(stock) then
			if stock:GetStoredAmount() <= 0 then
				DoneObject(stock)
			else
				stock.destroy_when_empty = true
			end
		end
	end)
	Sleep(1) --the stock needs to init
	if not IsValid(self) then return false end
	local result = self:TransferResources(stock, "unload", resource_flag)
	self:PopAndCallDestructor()
	
	if result == "approach failed" then
		stock = false
	end
	
	return stock
end

function SavegameFixups.ResetTransportRoutes()
	local targets = {}
	MapForEach("map", "RCTransport", function(o)
		if o.command == "AutoTransportRoute" then
			targets[o] = table.copy(o.transport_route)
			o:SetCommand("Idle")
		end
	end)
	
	CreateGameTimeThread(function(targets)
		Sleep(1)
		for o, route in pairs(targets) do
			if IsValid(o) then
				o.transport_route = route
				o:SetCommand("AutoTransportRoute")
			end
		end
	end, targets)
end

function RCTransport:TransportRouteUnload()
	if self:GetStoredAmount() <= 0 then return end
	if not self.transport_route then return end --no route set
	local pnt = self.transport_route.to
	if not self:Goto(pnt) and not self:IsCloser2D(pnt, dest_tolerance) or not IsValid(self) then --get there
		self.transport_route.to = false --break route, if dest is unreachable
		return
	end

	self:TryRechargeFromRoute()

	while self:GetStoredAmount() > 0 do
		resource_dest_type = self:GetPredominantStoredResource()
		local next_dest = MapFindNearest(self, self, RCTransport_AutoRouteRadius, "StorageDepot", "ResourceStockpile", ResourceDestinations_func, self)
		if next_dest then
			self.route_visited_dests[next_dest] = true
			local result = self:TransferResources(next_dest, "unload", resource_dest_type)
			if result == "approach failed" then
				self.transport_route.to = false --break route, unreachable target
				return
			end
		else
			--dump it on the ground
			local stock = create_stockpile(self, resource_dest_type, self.stockpiled_amount[resource_dest_type])
			if not stock then
				self.transport_route.to = false --break route, no more space to dump stuff
				return
			end
			self.route_visited_dests[stock] = true
		end
		Sleep(500)
	end
	
	if self:GetStoredAmount() > 0 then
		--something failed, break route
		self.transport_route.to = false
	end
end

GlobalVar("transport_route_visuals", false)
local function DestroyTransportRouteVisuals()
	for i = 1, #(transport_route_visuals or empty_table) do
		DoneObject(transport_route_visuals[i])
	end
	
	transport_route_visuals = false
end
function RCTransport:AutoTransportRoute()
	local route = self.transport_route
	self:PushDestructor(function(self)
		if route.from == self.transport_route.from and
			route.to == self.transport_route.to then
			self.transport_route.from = false
			self.transport_route.to = false
			self.route_visited_sources = false
			self.route_visited_dests = false
			DestroyTransportRouteVisuals()
		end
	end)
	self.route_visited_sources = {}
	self.route_visited_dests = {}
	while IsValid(self) and self.transport_route.from and self.transport_route.to do
		self:TransportRouteLoad()
		self:TransportRouteUnload()
	end
	
	self:PopAndCallDestructor()
end

local cable_auto_search_radius = 6
function RCTransport:TryRechargeFromRoute()
	if self:ShouldAutoRecharge() then
		local c = self:GetCableNearby(cable_auto_search_radius)
		if c and c.electricity.grid.current_reserve >= self.battery_hourly_recharge_rate / const.RoverToGridElectricityScale then
			self:RechargeFromGrid(c, false, false)
			self:StartBatteryThread(-self.battery_hourly_drain_rate) --reset battery drain
		end
	end
end

function RCTransport:SetSupply(resource, amount)
	BaseRover.SetSupply(self, resource, amount)
	if self.command == "AutoTransportRoute" and self.waiting_wakeup_recharge and amount < self.electricity.consumption then --we are not charging
		--electricity got turned off.
		self.force_exit_recharge_loop = true
		Wakeup(self.command_thread)
	end
end

function RCTransport:LoadingComplete()
	self:TryRechargeFromIdle()
	self:SetState("idle")
	Halt()
end

function RCTransport:Idle()
	self:PushDestructor(function(self)
		self:InterruptDrones(nil, function(drone)
			if drone.s_request and drone.s_request == self.resource_requests[drone.s_request:GetResource()] then
				return drone
			end
		end)
		
		self.auto_connect = false
		self:DisconnectFromCommandCenters()
	end)
	self:Gossip("Idle")
	self:SetState("idle")
	
	for res, amount in pairs(self.stockpiled_amount) do
		self.resource_requests[res]:ResetAmount(amount)
	end
	
	self:ConnectToCommandCenters()
	self.auto_connect = true
	
	self:TryRechargeFromIdle()
	Halt()
end


function RCTransport:DroneLoadResource(drone, request, resource, amount)
	--presentation, must go first!
	drone:Face(self:GetPos(), 100)
	drone:StartFX("Pickup", resource) --resource to string
	drone:SetState("interact")
	Sleep(500)
	drone:StopFX()
	--self ,may no longer be valid
	if IsValid(self) then
		self:AddResource(-amount, resource) --update visual stock
		assert(self.stockpiled_amount[resource] >= 0)
	end
end

function RCTransport:Done()
	self:ReturnStockpiledResources()
end

function RCTransport:ReturnStockpiledResources()
	for resource_flag, value in pairs(self.stockpiled_amount or empty_table) do
		PlaceResourceStockpile_Delayed(self:GetVisualPos(), resource_flag, value, self:GetAngle(), true)
	end
end

function RCTransport:DumpCargo(pos, resource)
	self:Goto(pos)
	self:SetState("idle")
	if resource == "all" then
		for resource_flag, value in pairs(self.stockpiled_amount or empty_table) do
			if value > 0 then
				if not create_stockpile(self, resource_flag, value) then --if we don't find a spot once, we wont find any in the future either
					break
				end
			end
		end
	else
		create_stockpile(self, resource, self.stockpiled_amount[resource])
	end
end

function RCTransport:SetTransportRoute(route)
	if route.obj_at_source then
		local o = route.obj_at_source
		route.obj_at_source = nil
		--based on the obj set the resource.
		if IsKindOfClasses(o, "Deposit", "ResourceStockpile") then
			self.transport_resource = o.resource
		elseif IsKindOf(o, "Mine") then
			self.transport_resource = o.exploitation_resource
		end
	end
	route.from = GetPassablePointNearby(route.from, self.pfclass) or route.from
	route.to = GetPassablePointNearby(route.to, self.pfclass) or route.to
	self.transport_route = route
	self:SetCommand("AutoTransportRoute")
end

function RCTransport:ToggleRouteResource()
	local idx = (table.find(self.storable_resources, self.transport_resource) or 0) + 1
	if idx > #self.storable_resources then idx = 1 end
	self.transport_resource = self.storable_resources[idx]
end

local DepositsNearby_func = function(deposit, resource)
		if deposit:IsDepleted() then
			return false
		end
		local request = deposit.transport_request
		return IsValid(request:GetBuilding()) and request:GetResource() == resource 
end

function RCTransport:PickupResource(request, pile, goto_loading_complete, force_one_pickup, total_amount)
	while request do
		local building = request:GetBuilding()
		if not IsValid(building) then return end
		local resource = request:GetResource()
		local rinfo = Resources[resource]
		assert(rinfo, "No such resource")
		local space_available = self:GetEmptyStorage(resource)
		self:Gossip("PickupResource", building:GossipName(), building.handle, resource)
		if space_available == 0 or not building:DroneApproach(self, resource) then
			return
		end
		local amount = pile and space_available or Min(rinfo and rinfo.unit_amount or ResourceScale, space_available)
		amount = Min(request:GetActualAmount(),amount)
		if pile then --pick it instantly
			local a = Min(total_amount or max_int, amount)
			request:AddAmount(-a)
			self:AddResource(a, resource)
		end
		self:Gossip("load", building:GossipName(), building.handle, resource, amount)
		HintDisable("HintTransport")
		building:RoverWork(self, request, resource, amount, nil, "load", total_amount)
		RebuildInfopanel(self)
		if not pile and not force_one_pickup and self:GetEmptyStorage(resource) > 0 then
			local deposit = MapFindNearest(self, self, 50*guim,"SurfaceDeposit", DepositsNearby_func, resource)
			request = deposit and deposit.transport_request
		else
			request = false
		end
	end
	
	if goto_loading_complete then
		self:SetCommand("LoadingComplete")
	end
end

function RCTransport:TransferResources(storage_depot, interaction_type, resource, amount_to_transfer, allow_set_command)
	if not IsValid(storage_depot) then return end
	local rinfo = Resources[resource]
	assert(rinfo, "No such resource")
	
	local uses_storable_tbl = storage_depot:HasMember("storable_resources") and type(storage_depot.storable_resources) == "table"
	if uses_storable_tbl and not table.find(storage_depot.storable_resources, resource) or
		(not uses_storable_tbl and storage_depot.resource ~= resource) then return end
	
	local s_req, d_req
	if storage_depot:HasMember("supply") then --depots and multy storage classes use these shenanigans
		s_req = storage_depot.supply[resource]
		d_req = storage_depot.demand[resource]
	else --stockpiles have these shennanigans
		s_req = storage_depot.supply_request
		d_req = storage_depot.demand_request
	end
	local space_available = self:GetEmptyStorage(resource)
	if (interaction_type == "load" and space_available <= 0) 
		or	(interaction_type == "unload" and self.resource_storage[resource] <= 0) then
		return "nothing to do"
	end
	if not storage_depot:DroneApproach(self, resource) then
		return "approach failed"
	end
	
	local space_left = interaction_type == "load" and s_req:GetActualAmount() or (d_req and d_req:GetActualAmount() or storage_depot:GetEmptyStorage(resource))
	local amount = Min( space_left, rinfo and rinfo.unit_amount or ResourceScale)

	local arg_req1 = interaction_type == "load" and s_req or d_req
	local arg_req2 = interaction_type == "load" and d_req or s_req
	if not arg_req1 then
		arg_req1 = arg_req2
		arg_req2 = nil
		amount = amount * -1
	end
	
	if not arg_req1 then return end --can not do continuoustask with no req, yet..
	
	if interaction_type == "load" then
		HintDisable("HintTransport")
	end

	local p = storage_depot:GetParent()
	if p and IsKindOf(p, "MechanizedDepot") then
		local total_transfered = 0
		while IsValid(self) and IsValid(storage_depot) and total_transfered < (amount_to_transfer or max_int) and
				(interaction_type == "load" and self:GetEmptyStorage(resource) > 0 and p:GetStoredAmount(resource) > 0) or
				(interaction_type == "unload" and self:GetStoredAmount(resource) > 0 and p:GetEmptyStorage(resource) > 0) do
			local a = storage_depot:RoverWork(self, arg_req1, resource, amount, arg_req2, interaction_type, amount_to_transfer)
			total_transfered = total_transfered + (a or 0)
			Sleep(2500)
		end
	else
		storage_depot:RoverWork(self, arg_req1, resource, amount, arg_req2, interaction_type, amount_to_transfer)
	end
	
	RebuildInfopanel(self)
	
	if allow_set_command and interaction_type == "load" then
		self:SetCommand("LoadingComplete")
	end
end

local LoadAllStep = 5 * ResourceScale

function RCTransport:TransferAllResources(storage_depot, interaction_type, resources, amounts, load_all)
	if not IsValid(storage_depot) then return end
	local cache_transport_resource = self.transport_resource
	self:PushDestructor(function(self)
		self.transport_resource = cache_transport_resource --restore
	end)
	local passed = {}
	
	local function functor(self, storage_depot, res, passed, amount, expects_ret)
		if passed[res] then return end
		passed[res] = true
		if storage_depot.resource == res or table.find(storage_depot.storable_resources, res) then
			local stored_amount = 0
			if interaction_type == "load" then
				stored_amount = self:GetStoredAmountIn(storage_depot, res)
			end
			if interaction_type == "unload" or stored_amount > 0 then
				self.transport_resource = res
				self:TransferResources(storage_depot, interaction_type, res, amount)
			end
			if expects_ret and interaction_type == "load" then
				stored_amount = self:GetStoredAmountIn(storage_depot, res)
				return stored_amount
			end
		end
	end
	
	--first pass the amounts, because the rest depend on available resource and may fill us up to max
	for res, amount in pairs(amounts or empty_table) do
		functor(self, storage_depot, res, passed, amount)
	end
	
	if load_all then passed = {} end
	
	local remaining_resources = {}
	for _, res in ipairs(resources) do
		if not passed[res] then
			table.insert(remaining_resources, res)
		end
	end
	
	if #remaining_resources > 0 then
		if interaction_type == "load" then
			local step = #remaining_resources > 1 and LoadAllStep or nil
			local has_anything_to_load = true
			while has_anything_to_load and self:GetEmptyStorage() > 0 do
				has_anything_to_load = false
				for _, res in ipairs(remaining_resources) do
					local remaining = functor(self, storage_depot, res, {}, step, true)
					has_anything_to_load = has_anything_to_load or (remaining or 0) > 0
				end
			end
		else
			for _, res in ipairs(resources) do
				functor(self, storage_depot, res, passed)
			end
		end
	end
	
	self:PopAndCallDestructor()
	
	if self.command ~= "AutoTransportRoute" and interaction_type == "load" then
		self:SetCommand("LoadingComplete")
	end
end

local NoRoute_func = function(o, rover)
		if IsKindOf(o, "SharedStorageBaseVisualOnly") then return false end
		if IsObjInDome(o) then return false end
		--check whether o carries such a resource as we need
		if not rover:CanPickupResourceFrom(o) then return end
		return rover:GetStoredAmountIn(o) >= ResourceScale --@least 1 cube
end

function RCTransport:LoadWithNoTarget(pos, resources, amounts, load_all)
	local amounts_at_start = table.copy(self.stockpiled_amount)
	resources = table.copy(resources)
	
	if not self:Goto(pos) and not self:IsCloser2D(pos, dest_tolerance) or not IsValid(self) then --get there
		return
	end
	
	local function IsDone(self, amounts_at_start, resources, amounts)
		if self:GetEmptyStorage() <= 0 then return true end
		local has_inf = false
		local has_remaining = false
		local next_not_inf = false
		local next_inf = false
		local indexes_to_rem = {}
		for idx, r in ipairs(resources) do
			local a = amounts[r]
			if not a then
				if not has_inf then
					has_inf = true
					next_inf = r
				end
			else
				local d = self.stockpiled_amount[r] - amounts_at_start[r]
				a = a - d
				if a <= 0 then
					amounts[r] = nil
					if not load_all then
						table.insert(indexes_to_rem, idx)
					end
				else
					amounts[r] = a
				end
				if a > 0 and not has_remaining then 
					has_remaining = true
					next_not_inf = r
				end
			end
		end
		for i = 1, #indexes_to_rem do
			table.remove(resources, indexes_to_rem[i])
		end
		return not has_inf and not has_remaining, next_not_inf, next_inf
	end
	
	while true do
		local is_done, next_r, next_inf_r = IsDone(self, amounts_at_start, resources, amounts)
		if not is_done then
			if next_r or next_inf_r then
				self.transport_resource = next_r or next_inf_r and resources
				local amount = next_r and amounts[next_r] or nil
				local next_source = MapFindNearest(self, self, RCTransport_AutoRouteRadius, "ResourceStockpile", "ResourcePile", "SurfaceDeposit", "StorageDepot", NoRoute_func, self)
				if not next_source then
					--no source for this, rem it from tasks
					if type(self.transport_resource) == "table" then
						resources = {}
					else
						amounts[self.transport_resource] = nil
						table.remove_entry(resources, self.transport_resource)
					end
				else
					self:ProcessRouteObj(next_source, amount)
				end
			end
		else
			break
		end
	end
	
	self:SetCommand("LoadingComplete")
end

local ResourceAmountToAddPerClick = 5 * ResourceScale
local construction_resources_lookup = {
	Metals = true,
	Concrete = true,
	Polymers = true,
	Electronics = true,
	MachineParts = true,
}

function RCTransport:GetSelectorItems(dataset)
	local all_resources = {}
	local construction_resources = {}
	local exit_with_all = false
	local exit_with_construction = false
	
	local function ExecuteLoad(self, res_id)
		self.transport_resource = {}
		local amounts = self.to_load
		self.to_load = false
		if res_id and amounts then
			amounts[res_id] = 0 --left-click adds the chosen resource up to the full capacity of the rover and confirms the order
		end
		for res, a in pairs(amounts or empty_table) do
			table.insert(self.transport_resource, res)
		end
		if res_id and amounts then
			amounts[res_id] = nil --nil for all
		end
		
		if not exit_with_all then
			if #self.transport_resource == 1 then
				if dataset.target then --tranportwithnotarget doesnt want flattening
					self.transport_resource = self.transport_resource[1]
					amounts = amounts[self.transport_resource]
				end
			elseif #self.transport_resource <= 0 then
				return --nothing to transfer
			end
		end
		
		self.transport_resource = exit_with_construction and construction_resources or exit_with_all and all_resources or self.transport_resource
		SetUnitControlInteractionMode(self, false)
		if dataset.target == nil then
			self:SetCommand("LoadWithNoTarget", dataset.pos, self.transport_resource, amounts, exit_with_all)
		elseif type(self.transport_resource) == "table" then
			self:SetCommand("TransferAllResources", dataset.target, "load", self.transport_resource, amounts, exit_with_all)
		else
			self:SetCommand("TransferResources", dataset.target, "load", self.transport_resource, amounts, true)
		end
	end
	
	
	dataset.on_close_callback = function()
		SetUnitControlInteraction(false, self)
		if self.to_load then --exiting confirms setup vals
			ExecuteLoad(self)
		end
	end

	local items = {}
	
	local transport_mode = dataset.interaction_mode or self.interaction_mode
	local m_s, m_e = GetBuildingTechsStatus("StorageMysteryResource", "Storages", "")
	transport_mode = (not transport_mode or transport_mode == "move") and "load" or transport_mode
	if transport_mode ~= "route" then
		self.to_load = {}
	end
	
	dataset.transport_mode = transport_mode
	
	local function GetAmountToAdd(self, a)
		a = a or 5000
		local e = self:GetEmptyStorage() --rover might be doing something so we got to recheck every time
		local loaded = self.to_load
		for r, aa in pairs(loaded) do
			e = e - aa
		end
		e = Max(e, 0)
		a = Min(e, a)
		return a, e - a
	end
	
	if transport_mode == "load" or transport_mode == "route" then
		for i=1, #self.storable_resources do
			local res_id = self.storable_resources[i]
			
			if res_id ~= "MysteryResource" or (m_s and m_e) then
				if (not dataset.target or (dataset.target:HasMember("DoesHaveSupplyRequestForResource") and dataset.target:DoesHaveSupplyRequestForResource(res_id)
										and (transport_mode == "route" or 
											dataset.target:GetStoredAmount(res_id) > 0 ))) then
					local res = Resources[res_id]
					if res then
						all_resources[#all_resources +1] = res_id
						if construction_resources_lookup[res_id] then
							construction_resources[#construction_resources + 1] = res_id
						end
						table.insert(items, {
								name = res_id, 
								icon = res.display_icon,
								display_name = res.display_name,
								description  = T{8506, "Order the transport to load <resource_name>.<newline><current_resources>", self, resource_name = res.display_name, 
										current_resources = function(context)
												local rover = context and context.object
												if not rover then return "" end
												local lines = {}
												for res, amount in pairs(rover.to_load or empty_table) do
													table.insert(lines, T{8505, "Current loadout: <resource(amount, resource_name)>", resource_name = res, amount = amount})
												end
												return table.concat(lines, "<newline>")
											end,},
								hint = transport_mode ~= "route" and T{8507, "Ctrl + <left_click> load 5, <left_click> load all and exit, <right_click> confirm and exit."} 
																			or T{8508, "<left_click> to select resource for the transport route, <right_click> exit."},
								gamepad_hint = transport_mode ~= "route" and T{8509, "<ButtonX> load 5, <ButtonA> load all and exit, <ButtonB> confirm and exit."} 
																			or T{8510, "<ButtonA> to select resource for the transport route, <ButtonB> exit."},
								action = function(dataset, is_meta_pressed)
									if transport_mode == "route" then
										self.transport_resource = res_id
									elseif is_meta_pressed then
										local a = ResourceAmountToAddPerClick
										local to_add, remaining = GetAmountToAdd(self, a)
										self.to_load[res_id] = (self.to_load[res_id] or 0) + to_add
										if a == to_add and remaining > 0 then
										else --capacity reached,close menu and load whatever is selected
											ExecuteLoad(self)
											CloseResourceSelector()
										end
									else
										ExecuteLoad(self, res_id)
									end
								end
							})
					end
				end
			end
		end
		if #all_resources>1 then
			table.insert(items, {
				name = "all",
				icon = "UI/Icons/Buildings/res_all.tga",
				display_name = T{4493, "All"},
				description  = T{4494, "Order the transport to load all resources."},
				action = function(dataset, is_meta_pressed)
					if is_meta_pressed then return end
					self.transport_resource = all_resources
					if transport_mode ~= "route" then
						SetUnitControlInteractionMode(self, false)
						exit_with_all = true
						self:SetCommand("TransferAllResources", dataset.target, "load", all_resources)
					end
				end
			})
		end
	elseif transport_mode == "unload" then
		for i=1, #self.storable_resources do
			local res_id = self.storable_resources[i]
			if (not dataset.target or dataset.target:DoesAcceptResource(res_id)) and self.resource_storage[res_id] and self.resource_storage[res_id]>0 then
				local res = Resources[res_id]
				if res then
					all_resources[#all_resources+1] = res_id
					table.insert(items, {
						name = res_id, 
						icon = res.display_icon,
						display_name = res.display_name,
						description  = T{4496, "Order the transport to unload <resource_name>.<warning>", 
							resource_name = res.display_name, 
							warning = dataset.target and dataset.target:GetEmptyStorage(res_id) <= 0 and T{8107, "<newline><red>Not enough space to unload.</red>"} or T{""}
						},
						action = function(dataset, is_meta_pressed)
							if is_meta_pressed then return end
							self.transport_resource = res_id
							SetUnitControlInteractionMode(self, false)
							if dataset.target then
								self:SetCommand("TransferResources", dataset.target, "unload", res_id)
							else
								self:SetCommand("DumpCargo", dataset.pos,self.transport_resource)
							end
						end
					})
				end
			end
		end
		if  #all_resources>1 then
			table.insert(items, {
				name = "all", 
				display_name = T{4493, "All"},
				icon = "UI/Icons/Buildings/res_all.tga",
				description  = T{4497, "Order the transport to unload all resources.<warning>", 
					warning = dataset.target and dataset.target:GetEmptyStorage() <= 0 and T{4495, "<newline><red>Not enough space to unload</red>"} or T{""}
				},
				action = function(dataset, is_meta_pressed)
					if is_meta_pressed then return end
					
					SetUnitControlInteractionMode(self, false)
					if dataset.target then
						self:SetCommand("TransferAllResources", dataset.target, "unload", all_resources)
					else
						self:SetCommand("DumpCargo", dataset.pos,"all")
					end
				end
			})
		end
	end	
	return items
end

function RCTransport:ShouldShowRouteButton()
	return true
end

function RCTransport:ToggleCreateRouteMode()
	local unit_ctrl_dlg = GetInGameInterfaceModeDlg()
	assert(unit_ctrl_dlg:IsKindOf("UnitDirectionModeDialog"))

	if not self:CanBeControlled() then
		return 
	end
	if Platform.desktop and terminal.IsKeyPressed(const.vkC) then --ignore the button while c is down
		return
	end
	if unit_ctrl_dlg.unit ~= self then return end
	
	local v = unit_ctrl_dlg.interaction_mode ~= "route" and "route" or false
	
	if v then
		SetUnitControlInteractionMode(self, "route")
		unit_ctrl_dlg:SetFocus(true)
	else
		SetUnitControlInteractionMode(self, false)
	end
	
	unit_ctrl_dlg:SetCreateRouteMode(v)
	RebuildInfopanel(self)
end

function RCTransport:ToggleCreateRouteMode_Update(button)
	local to_mode = self.interaction_mode ~= "route"
	button:SetIcon(to_mode and "UI/Icons/IPButtons/transport_route.tga" or "UI/Icons/IPButtons/cancel.tga")
	button:SetEnabled(self:CanBeControlled())
	button:SetRolloverTitle(T{4504, "Create Transport Route"})
	button:SetRolloverText(T{4505, "Create an automatic transport route. Selected resource will be collected near the origin point and delivered to the destination. The route will be active until all sources are exhausted or there is no more room at the destination."})
	button:SetRolloverHint(to_mode and T{7555, "<left_click> Create route mode"} 
		or T{7408, "<left_click>Set Source  <em><left_click> (again)</em> Set Destination<newline><right_click> Cancel"})
	button:SetRolloverHintGamepad(to_mode and T{7556, "<ButtonA> Create route mode"} or T{7512, "<ButtonA> Cancel"})
end

function RCTransport:GetDisplayName()
	return Untranslated(self.name)
end

function SetupRouteVisualsForTransport(obj)
	if obj.transport_route.to and obj.transport_route.from then
		if transport_route_visuals then
			DestroyTransportRouteVisuals()
		end
		
		transport_route_visuals = {}
		
		transport_route_visuals[1] = PlaceObject("WireFramedPrettification", {entity = "RoverTransport", construction_stage = 0})
		transport_route_visuals[2] = PlaceObject("WireFramedPrettification", {entity = "RoverTransport", construction_stage = 1})
		transport_route_visuals[1]:SetPos(obj.transport_route.from)
		transport_route_visuals[2]:SetPos(obj.transport_route.to)
		local a = CalcOrientation(obj.transport_route.from, obj.transport_route.to)
		transport_route_visuals[1]:SetAngle(a)
		transport_route_visuals[2]:SetAngle(a)
	end	
end

function OnMsg.SelectedObjChange(obj, prev)
	DestroyTransportRouteVisuals()
	
	if IsKindOf(obj, "RCTransport") then
		SetupRouteVisualsForTransport(obj)
	end
end
	