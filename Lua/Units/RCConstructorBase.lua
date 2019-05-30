DefineClass.RCConstructorBase = {
	__parents = {  "RCTransport", },

	entity = "RoverIndiaConstructor",
	SelectionClass = "RCConstructor",
	--ui
	display_name = T(10241, "RC Constructor"),
	display_name_pl = T(12073, "RC Constructors"),
	description = T(505071167505, "Remote-controlled vehicle that can transport resources, gather resources from surface deposits and construct buildings."),
	display_icon = "UI/Icons/Buildings/rover_constructor.tga",
	
	pin_rollover = T(4462, "<Description><newline><newline><left>Concrete<right><concrete(Stored_Concrete)><newline><left>Metals<right><metals(Stored_Metals)><newline><left>Polymers<right><polymers(Stored_Polymers)><newline><left>Food<right><food(Stored_Food)><newline><left>Electronics<right><electronics(Stored_Electronics)><newline><left>Machine Parts<right><machineparts(Stored_MachineParts)><newline><left>Rare Metals<right><preciousmetals(Stored_PreciousMetals)><newline><left>Fuel<right><fuel(Stored_Fuel)>"),
	encyclopedia_id = "RCConstructor",

	palette = {"rover_accent","rover_base","rover_dark","rover_base"},
	fx_actor_class = "RCConstructor",
	
	max_x = 7,
	max_y = 3,
	max_z = 2,
	max_shared_storage = 42 * const.ResourceScale,
	
	construct_amount_step = 50,
	
	track_anim_moments = { "constructIdle" },
	supplying_this_demand_request = false,
	construction_clearing = false,
	
	construction_site_class_to_search_for_after_construction = "ConstructionSite",
	can_perform_maintenance = true,
	
	resource_search_radius = Drone_AutoFindResourceRadius,
}

function RCConstructorBase:Done()
	self:Finalize()
end

function RCConstructorBase:Dead()
	self:Finalize()
	return RCTransport.Dead(self)
end

function RCConstructorBase:OnContinuousTaskTick(amount, total_amount)
	local r = self.supplying_this_demand_request
	if r then
		r:SetTargetAmount(Max(r:GetTargetAmount() + amount, 0))
	end
end

function RCConstructorBase:OnWaitingResourcesTick(construction, should_do_another_resource_pass)
	--cb
end

function RCConstructorBase:FindResourceSource(res, qamount)
	return MapFindNearest(self, self, self.resource_search_radius, "ResourceStockpile", "ResourcePile", "SurfaceDeposit", "StorageDepot", ResourceSources_func, res, qamount, self:GetUnreachableObjectsTable())
end

function RCConstructorBase:GatheringResourcesHook()
end

function RCConstructorBase:DoneGatheringResourcesHook()
end

function RCConstructorBase:DoneApproachHook()
end

function RCConstructorBase:Construct(construction)
	self:Gossip("Construct", construction:GossipName(), construction.handle)
	assert(not construction.construction_group or IsValid(construction.construction_group[1]))
	construction = construction.construction_group and construction.construction_group[1] or construction
	--look for resource sources and pickup
	local cr = construction.construction_resources
	local found_nothing = false
	local should_do_another_resource_pass = false
	local assigned_to_demand_reqs = {} --[req] = amount
	self:PushDestructor(function(self)
		for req, amount in pairs(assigned_to_demand_reqs) do
			req:UnassignUnit(amount, false)
		end
		self.construction_clearing = false
	end)
	
	self:GatheringResourcesHook()
	
	while cr and self:GetEmptyStorage() > 0 and not found_nothing do
		found_nothing = true --1 full negative pass in case resource pops up.
		for res, req in pairs(cr) do
			if req:IsAnyFlagSet(const.rfDemand) and req:GetTargetAmount() > 0 then
				if self:GetStoredAmount(res) > 0 then
					should_do_another_resource_pass = true
					local already_assigned_with = assigned_to_demand_reqs[req] or 0
					local stored = self:GetStoredAmount(res)
					if already_assigned_with > stored then
						--wtf, we lost resourcse while trying to get more
						local refund = already_assigned_with - stored
						print("<color 0 255 0>rover mysteriously lost resources!</color>", refund)
						req:SetTargetAmount(req:GetTargetAmount() + refund)
						already_assigned_with = already_assigned_with - refund
						assigned_to_demand_reqs[req] = already_assigned_with
					end
					local assign_with = Min(req:GetTargetAmount(), stored - already_assigned_with)
					assert(assign_with >= 0)
					if assign_with > 0 then
						if assigned_to_demand_reqs[req] then
							if assign_with > 0 then
								req:SetTargetAmount(req:GetTargetAmount() - assign_with)
								assigned_to_demand_reqs[req] = assigned_to_demand_reqs[req] + assign_with
							end
						else
							req:AssignUnit(assign_with)
							assigned_to_demand_reqs[req] = assign_with
						end
						assert(req:GetTargetAmount() >= 0)
					end
				end
				
				local amount_to_look_for = req:GetTargetAmount()
				while amount_to_look_for > 0 do
					local empty_space = self:GetEmptyStorage()
					if empty_space <= 0 then break end
					local qamount = Min(Min(req:GetTargetAmount(), 1000), empty_space)
					local source = self:FindResourceSource(res, qamount)
					if source then
						found_nothing = false
						should_do_another_resource_pass = true
						local s_req = GetSupplyReq(source, res)
						local amount_for_source = Min(Min(s_req:GetActualAmount(), amount_to_look_for), empty_space)
						
						self:PushDestructor(function(self)
							local transfered = self.amount_transfered_last_ct
							if amount_for_source > transfered then
								local refund = amount_for_source - transfered
								req:SetTargetAmount(req:GetTargetAmount() + refund)
								assigned_to_demand_reqs[req] = assigned_to_demand_reqs[req] - refund
							end
						end)
						
						if assigned_to_demand_reqs[req] then
							req:SetTargetAmount(req:GetTargetAmount() - amount_for_source)
							assigned_to_demand_reqs[req] = assigned_to_demand_reqs[req] + amount_for_source
							assert(req:GetTargetAmount() >= 0)
						else
							req:AssignUnit(amount_for_source)
							assigned_to_demand_reqs[req] = amount_for_source
						end
						
						self.amount_transfered_last_ct = 0
						self.can_pickup_from_resources = res
						self:ProcessRouteObj(source, amount_for_source)
						self:PopAndCallDestructor()
						
						amount_to_look_for = Min(Max(req:GetTargetAmount() - self:GetStoredAmount(res), 0), self:GetEmptyStorage())
					else
						break
					end
				end
			end
		end
		
	end
	
	self:DoneGatheringResourcesHook()
	
	-- approach the construction
	if not construction:DroneApproach(self, "construct") then
		self:DoneApproachHook()
		self:PopAndCallDestructor()
		return
	end
	
	self:DoneApproachHook()
	
	--clear obstructors
	local waste_rocks = table.icopy(construction.waste_rocks_underneath)
	local stockpiles_underneath = construction.stockpiles_underneath
	local clearing = false
	if (waste_rocks and #waste_rocks > 0) or (stockpiles_underneath and #stockpiles_underneath > 0) then
		self:PlayState("constructStart")
		self:SetState("constructIdle")
		self:StartFX("Construct", construction)
		clearing = true
		self.construction_clearing = construction
	end
	
	if waste_rocks and #waste_rocks > 0 then
		for i = 1, #waste_rocks do
			Sleep(3000)
			waste_rocks[i]:TransformToStockpile(self)
		end
	end
	
	if stockpiles_underneath and #stockpiles_underneath > 0 then
		construction:MoveStockpilesUnderneathOutside(3000)
	end
	
	if clearing then
		self:StopFX()
		self:PlayState("constructEnd")
		self.construction_clearing = false
	end
	
	 -- unload resources from our storage	 
	for resource, request in pairs(construction.construction_resources) do
		if request:IsAnyFlagSet(const.rfDemand) and self:GetStoredAmount(resource) > 0 and request:GetActualAmount() > 0 then
			if assigned_to_demand_reqs[request] then
				self.supplying_this_demand_request = request
				self:PushDestructor(function(self)
					self.supplying_this_demand_request = nil
					local assigned_for = assigned_to_demand_reqs[request]
					local transfered = self.amount_transfered_last_ct
					local remaining = 0
					if assigned_for ~= transfered then
						remaining = Min(assigned_for - transfered, request:GetActualAmount() - request:GetTargetAmount())
					end
					request:UnassignUnit(remaining, false)
					assigned_to_demand_reqs[request] = nil
				end)
			end
			local amount_step = Resources[resource].unit_amount
			self:Gossip("unload", construction:GossipName(), construction.handle, resource, amount_step)
			local req = request
			construction:RoverWork(self, request, resource, amount_step)
			if assigned_to_demand_reqs[request] then
				self:PopAndCallDestructor()
			end
		elseif request:IsAnyFlagSet(const.rfSupply) and request:GetActualAmount() > 0 and table.find(self.storable_resources, resource) 
				and (self:GetEmptyStorage() > 0 or self:GetStoredAmount(resource) > 0) then
			local amount_step = Resources[resource].unit_amount
			local p = self:GetPos()
			local dump_fails = 0
			while IsValid(construction) do
				self:Gossip("load", construction:GossipName(), construction.handle, resource, amount_step)
				construction:RoverWork(self, request, resource, amount_step, nil, "load")
				if request:GetActualAmount() > 0 then
					if not self:DumpCargo(self:GetPos(), resource, "ignore_z_delta") then
						dump_fails = dump_fails + 1
						if dump_fails > 2 then
							self:PopAndCallDestructor()
							return
						end
					else
						dump_fails = 0
					end
					if self:GetStoredAmount(resource) > 0 then
						break
					end
				else
					break
				end
				if self:GetPos() ~= p then
					if not construction:DroneApproach(self, "construct") then
						--we blocked the construction
						self:PopAndCallDestructor()
						return
					end
					p = self:GetPos()
				end
			end
		end
	end
	
	self:PopAndCallDestructor()
	
	-- wait for construction materials to arrive
	self:SetState("idle")
	self:PushDestructor(function(self)
		self.override_ui_status = false
	end)
	while IsValid(construction) and not construction:StartConstructionPhase() do
		self:OnWaitingResourcesTick(construction, should_do_another_resource_pass)
		Sleep(1000)
		self.override_ui_status = "WaitingResources"
	end
	self:PopAndCallDestructor()
	if construction.construct_request and construction.construct_request:GetActualAmount() > 0 then
		construction:RoverWork(self, construction.construct_request, "construct", self.construct_amount_step)
	end
	self.construction = false
	Sleep(1000) --inf loop guard
	-- find another construction to help with
	if not self:HasMoreCommandsAfterThis() then
		local new_construction = nil

		local exec = function (obj, rover)
			if obj.city ~= rover.city or obj == construction or not IsValid(obj) then return end
			if new_construction then
				if not new_construction:IsWaitingResources() or not new_construction:IsConstructed() then return end
				if new_construction.priority > obj.priority then return end
				if new_construction.counter < obj.counter then return end
			end
			new_construction = obj
		end
		MapForEach(self, 100*guim, self.construction_site_class_to_search_for_after_construction, exec, self)
		if new_construction then
			self:SetCommand("Construct", new_construction, true)
		end
	end
end

function RCConstructorBase:CanInteractWithConstructionSite(obj)
	return IsKindOf(obj, "ConstructionSite") and not IsKindOfClasses(obj, "LandscapeConstructionSiteBase")
end

function RCConstructorBase:CanInteractWithObject(obj, interaction_mode)
	if not self:CanBeControlled() or IsObjInDome(obj) then return false end
	if (interaction_mode or "build") == "build" then
		if self:CanInteractWithConstructionSite(obj) then
			return true
		end
	end
	if self.can_perform_maintenance and (interaction_mode or "maintenance") == "maintenance" then
		if IsKindOf(obj, "RequiresMaintenance") and (obj.maintenance_phase or interaction_mode and obj.accumulated_maintenance_points > 0) then --only provoke maintenance if requested
			return true
		end
	end
	return RCTransport.CanInteractWithObject(self, obj, interaction_mode)
end

function RCConstructorBase:InteractWithObject(obj, interaction_mode)
	if not self:CanBeControlled() or IsObjInDome(obj) then return false end
	if (interaction_mode or "build") == "build" then
		if self:CanInteractWithConstructionSite(obj) then
			SetUnitControlInteractionMode(self, false)
			GetCommandFunc(self)(self, "Construct", obj)
			return
		end
	end
	if self.can_perform_maintenance and (interaction_mode or "maintenance") == "maintenance" then
		if IsKindOf(obj, "RequiresMaintenance") and (obj.maintenance_phase or interaction_mode and obj.accumulated_maintenance_points > 0) then --only provoke maintenance if requested
			SetUnitControlInteractionMode(self, false)
			GetCommandFunc(self)(self, "RepairBuilding", obj)
			return
		end
	end
	return RCTransport.InteractWithObject(self, obj, interaction_mode)
end

function RCConstructorBase:ToggleBuildMode()
	local unit_ctrl_dlg = GetInGameInterfaceModeDlg() or empty_table
	if unit_ctrl_dlg.unit ~= self
	or not self:CanBeControlled()
	or terminal.IsKeyPressed(const.vkC) then --ignore the button while c is down
		return
	end
	local mode = unit_ctrl_dlg.interaction_mode ~= "build" and "build" or false
	SetUnitControlInteractionMode(self, mode)
	if mode then
		unit_ctrl_dlg:SetFocus(true)
	end
	RebuildInfopanel(self)
end

function RCConstructorBase:ToggleBuildMode_Update(button)
	local to_mode = self.interaction_mode ~= "build"
	button:SetIcon(to_mode and "UI/Icons/IPButtons/build.tga" or "UI/Icons/IPButtons/cancel.tga")
	button:SetEnabled(self:CanBeControlled())
	button:SetRolloverTitle(T(9800, "Build"))
	button:SetRolloverText(T(10332, "Give command to build a construction."))
	button:SetRolloverHint(to_mode and T(10333, "<left_click> Select build mode") or T(10334, "<left_click> on construction to build it  <right_click> Cancel"))
	button:SetRolloverHintGamepad(to_mode and T(10335, "<ButtonA> Select build mode") or T(7512, "<ButtonA> Cancel"))
end

function RCConstructorBase:ShouldShowRouteButton()
end

function RCConstructorBase:ToggleCreateRouteMode_Update(button)
end