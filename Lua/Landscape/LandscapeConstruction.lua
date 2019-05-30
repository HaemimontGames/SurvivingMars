local time_to_work = 100000
local time_to_work_for_tex_painting = 1000
local function GetTimeToWork(t)
	t = t or time_to_work
	if UICity:IsTechResearched("LandscapingNanites") then
		return t / 2
	end
	return t
end

local function RemoveRock(rock)
	Flight_Unmark(rock)
	if IsKindOf(rock, "WasteRockObstructor") then
		if not rock.auto_connect then
			rock:OnDeleted()
		end
	elseif IsDlcAvailable("armstrong") then
		Vegetation_OnRockRemoved(VegetationGrid, forbid_growth, rock)
	end
	DoneObject(rock)
end

DefineClass.LandscapeBuilding = {
	__parents = { "Building" },
	entity = "InvisibleObject",
	properties = {
		{ template = true, name = T(12482, "Custom Max Boundary (hexes)"), id = "max_boundary", category = "General", editor = "number", default = 0 },
		{ template = true, name = T(12483, "Custom Max Hex Count"),        id = "max_hexes",    category = "General", editor = "number", default = 0 },
	},
	construction_mode = "",
	count_as_building = false,
	can_resize_during_placement = true,
	can_rotate_during_placement = false,
}
	
DefineClass.LandscapeConstructionSiteBase = {
	__parents = { "ConstructionSite" },
	ApplyToGrids = empty_func,
	RemoveFromGrids = empty_func,
	drone_dests_cache = false,
	periphery_shape = false,
	mark = 0,
	rocks_removed = 0,
	affects_wasterock = true,
	state = "init",
	auto_construct_ts_ls = false,
	max_drones = false,
	hexes = 0,
	auto_rovers = 0,
	pin_progress_max = "TotalForPin",
	pin_progress_value = "TotalLandscapeProgress",
}

function LandscapeConstructionSiteBase:GetMaxDrones()
	if not self.max_drones then
		self.max_drones = Min(5 + self.hexes / 100, 200)
	end
	return self.max_drones
end

function LandscapeConstructionSiteBase:GameInit()
	local drone_dests_cache = {}
	local p_shape = {}
	local mq, mr = WorldToHex(self)

	LandscapeForEachHex(self.mark, function(q, r, cache, p_shape, mq, mr)
		local p = point(HexToWorld(q, r))
		KillVegetationInHex(q, r, p)
		local mark, height, border = LandscapeCheck(q, r, true)
		if border then
			table.insert(cache, p)
			table.insert(p_shape, point(q - mq, r - mr))
		end
	end, drone_dests_cache, p_shape, mq, mr)
		
	self.drone_dests_cache = drone_dests_cache
	self.periphery_shape = p_shape
end

function LandscapeConstructionSiteBase:Done()
	LandscapeFinish(self.mark)
end

function LandscapeConstructionSiteBase:Complete(quick_build) --quick_build - cheat build
	if not IsValid(self) then return end -- happens when the user spams quick build and manages to complete the same site twice.
	local mark = self.mark
	local landscape = Landscapes[mark]
	if quick_build then
		if self.affects_wasterock then
			LandscapeForEachObstructor(mark, RemoveRock)
		end
		self:OnQuickBuild()
	end
	if landscape then
		landscape.completed = true
		LandscapeProgress(mark, 100, 100)
		if not landscape.changed and self.rocks_removed > 0 then
			-- Force buildable fix as it wont be called if the landscape isn't changed 
			LandscapeFixBuildable(landscape)
		end
		LandscapeFinish(mark)
		Msg("LandscapeCompleted", landscape)
	end
	
	local now = GameTime()
	self:InterruptDrones(nil, function(o)
		local b1 = o.w_request and o.w_request:GetBuilding()
		local b2 = o.s_request and o.s_request:GetBuilding()
		local b3 = o.d_request and o.d_request:GetBuilding()
		if b1 == self or b2 == self or b3 == self then
			local ts = GetThreadStatus(o.command_thread)
			if type(ts) == "number" and ts - now >= 1000 then
				return o
			end
		end
	end)
	DoneObject(self)
end

function LandscapeConstructionSiteBase:UpdateLSProgress()
end

function LandscapeConstructionSiteBase:UpdateConstructionVisualization()
end

function LandscapeConstructionSiteBase:DoesWasteRockFromRocksNeedWorkers()
	return false
end

function LandscapeConstructionSiteBase:GetDroneWorkAmount(drone, request, resource, amount)
	return MulDivRound(amount, const.ResourceScale, DroneResourceUnits[resource])
end

function LandscapeConstructionSiteBase:DroneWork(drone, request, resource, amount)
	drone:PushDestructor(function(drone)
		local self = drone.target
		if IsValid(self) then
			self:TryGoToNextState()
		end
	end)
	
	self:UpdateLSProgress(drone.request_amount, request) --unit assignment + fullfillment progressed this much
	
	amount = self:GetDroneWorkAmount(drone, request, resource, amount)
	drone:ContinuousTask(request, amount, g_Consts.DroneConstructBatteryUse, "constructStart", "constructIdle", "constructEnd", "Construct",
		function(drone, req, amount)
			local self = drone.target
			if self.state == "work" and req:GetActualAmount() > 0 then
				--drone always sleeps 1k
				local t = MulDivRound(self:GetTimeToWork(), g_Consts.DroneTimeToWorkOnLandscapeMultiplier, 100) - 1000
				if t > 0 then
					Sleep(t)
					if not IsValid(self) then
						return
					end
				end
			end
			local force_reset = self:DoesWasteRockFromRocksNeedWorkers()
			self:UpdateLSProgress(amount, req)
			if force_reset then
				local req = self.obstructors_supply_request
				drone:SetCommand("PickUp", req, nil, "WasteRock", Min(req:GetTargetAmount(), DroneResourceUnits.WasteRock))
			end
		end)
	drone:PopAndCallDestructor()
end

function LandscapeConstructionSiteBase:TryGoToNextState()
end

function LandscapeConstructionSiteBase:StartConstructionPhase()
	local result = self:TryGoToNextState()
	return result or self.state == "work"
end

function LandscapeConstructionSiteBase:GetIPStatus()
	return self:GetResourceProgress()
end

function LandscapeConstructionSiteBase:DroneApproach(drone, resource, is_closest)
	local q, r = WorldToHex(drone)
	if self.mark == LandscapeCheck(q, r, true) then
		--already there
		return true
	end
	if not drone:ExitHolder() then return end
	if not IsValid(self) or not IsValid(drone) then return end
	assert(self.drone_dests_cache)
	return drone:Goto(self.drone_dests_cache)
end

function LandscapeConstructionSiteBase:GetTimeToWork()
	local t = self.class == "LandscapeConstructionSite" and time_to_work or time_to_work_for_tex_painting
	return GetTimeToWork(t)
end

function LandscapeConstructionSiteBase:GetUIStatusOverrideForWorkCommand(request, drone)
	if self.state == "clean" then
		return "CleanLSCS"
	elseif self.state == "work" then
		return "WorkLSCS"
	end
	return "Work"
end

function LandscapeConstructionSiteBase:GetTotalForPin()
	return 100
end
----

DefineClass.LandscapeConstructionSite = {
	__parents = { "LandscapeConstructionSiteBase" },
	
	sign_spot = false,
	sign_offset = point(0, 0, 12*guim),
	
	place_stockpile = false,
	
	supply_request = false,
	demand_request = false,
	waste_rock_juggle_work_request = false,
	clear_obstructors_request = false,
	obstructors_supply_request = false,
	can_complete_during_init = false,
	
	
	obstructors_cache = false,
	obstructor_to_cost = false,
	cur_obstructor_clean = false,
	cur_obstructors_providing_rocks = false,
	
	abs_volume = 0,
	volume = 0,
	
	work_for_obstructor_clearing = 0,
	work_for_waste_rock_juggling = 0,
	waste_rock_from_rocks_underneath = 0,
	waste_rock_to_be_transported = 0,
	--state = "init",
	
	total_ls_progress = 0,
	cur_ls_progress = 0,
	last_ls_progress = 0,
	wr_added_to_clean_wr_supply_req = 0,
	wr_from_rocks_picked_up = 0,
	cur_clean_progress = 0,
	wr_requires = 0,
	wr_produced = 0,
	min_obstructor_cost = max_int,
	auto_connect = true,
	use_control_construction_logic = false,
	
	auto_construct_output_pile = false,
	drone_working_on_amounts = false,
}

function SavegameFixups.RestoreBlockPassToOldLSCS()
	MapForEach("map", "LandscapeConstructionSite", function(o)
		o:InitBlockPass() --in the olden times before this revision, lscs always block
	end)
end

function LandscapeConstructionSite:GameInit()
	if self.state == "complete" then return end
	local ls = Landscapes[self.mark]
	local b = LandscapeProgressInit(ls)
	if not self.stockpiles_underneath then
		self:InitBlockPass(ls)
	end
end

function LandscapeConstructionSite:InitBlockPass(ls)
	ls = ls or Landscapes[self.mark]
	ls.apply_block_pass = true
	terrain.RebuildPassability(ls.pass_bbox)
	self:ScatterUnitsUnderneath()
end

function LandscapeConstructionSite:GetUnitsUnderneath()
	local units = {}
	LandscapeForEachUnit(self.mark, function(o)
		table.insert(units, o)
	end)
	
	return units
end

function LandscapeConstructionSite:Getdescription() 
	return T{12028, "<em>Landscaping project.</em> Drones will produce Waste Rock from excess soil or use Waste Rock to raise terrain.", self}
end

function LandscapeConstructionSite:Done()
	if IsValid(self.auto_construct_output_pile) and self.auto_construct_output_pile:GetStoredAmount() <= 0 then
		DoneObject(self.auto_construct_output_pile)
		self.auto_construct_output_pile = false
	end
end

function LandscapeConstructionSite:IsConstructed()
	if self.state ~= "init"
		and self.supply_request:GetActualAmount() <= 0
		and self.demand_request:GetActualAmount() <= 0
		and self.waste_rock_juggle_work_request:GetActualAmount() <= 0
		and self.clear_obstructors_request:GetActualAmount() <= 0 then
		return true
	end
	return false
end

function LandscapeConstructionSite:IsWaitingResources()
	if self.waste_rock_to_be_transported ~= 0 then
		return true
	end
	return false
end

function LandscapeConstructionSite:GetResourceProgress()
	local totalws = self.total_ls_progress - self.work_for_waste_rock_juggling
	local lines = {}
	
	if self.state == "clear_stocks" then
		lines[#lines+1] = T(627, "The construction site is being cleared.")
	elseif self.state == "clean" then
		lines[#lines+1] = T{12160, "<em>Clearing the site</em><right><percent>%", percent = self:GetCleaningProgress()}
	elseif self.state == "transport" then
		if self.wr_required > 0 then
			lines[#lines+1] = T{12331, "<em>Delivering Waste Rock</em><right><percent>%", percent = self:GetTransportProgress()}
		else
			lines[#lines+1] = T{12332, "<em>Extracting Waste Rock</em><right><percent>%", percent = self:GetTransportProgress()}
		end
	else
		if IsKindOf(self.building_class_proto, "LandscapeTerraceBuilding") then
			lines[#lines+1] = T{12278, "<em>Leveling the ground</em><right><percent>%", percent = self:GetLevelingProgress()}
		elseif IsKindOf(self.building_class_proto, "LandscapeRampBuilding") then
			lines[#lines+1] = T{12279, "<em>Leveling the ramp</em><right><percent>%", percent = self:GetLevelingProgress()}
		end
	end	
	
	if self.waste_rock_to_be_transported < 0 then
		totalws = totalws + self.work_for_obstructor_clearing
		local remaining = self.state == "transport" and self:GetTotalActualSupply()
								or self.state == "work" and 0
								or (self.total_ls_progress - self.work_for_waste_rock_juggling + self.work_for_obstructor_clearing - self.wr_from_rocks_picked_up)
		lines[#lines+1] = T{11897, "<em>Excess Waste Rock</em><right><wasterock(remaining,total)>",  remaining = remaining, total = abs(totalws)}
	elseif self.waste_rock_to_be_transported > 0 then
		local remaining = self.state == "transport" and totalws - self:GetTotalActualDemand()
								or self.state == "work" and totalws
								or 0
		lines[#lines+1] = T{11896, "<em>Required Waste Rock</em><right><wasterock(remaining,total)>", remaining = remaining, total = totalws}
	end
	
	return table.concat(lines, "<newline><left>")
end	

local max_drones = 20
local obstructor_cost_per_cm_r = 3
local obstructor_work_cost_m = 3
function GetWasteRockAmountForObj(obj, m)
	local c = WasteRockAmountsByEntity[obj.entity]
	if c then
		return c * const.ResourceScale
	end
	
	return obj:GetRadius() * obstructor_cost_per_cm_r
end
--[[
--for nanite testing
function City:IsTechResearched(tech_id)
	if tech_id == "LandscapingNanites" then return true end
	local status = self.tech_status[tech_id]
	return status and status.researched
end
]]
function LandscapeConstructionSite:GatherConstructionResources()
	if self.supply_request or self.demand_request then return end
	
	local obstructors_cache = {}
	local obstructor_to_cost = {}
	local passed = {}
	local work_for_obstructor_clearing = 0
	local min = max_int
	LandscapeForEachObstructor(self.mark, function(obj)
		if not passed[obj] then
			if obj:GetEnumFlags(const.efRemoveUnderConstruction + const.efBakedTerrainDecal + const.efBakedTerrainDecalLarge) ~= 0 then
				DoneObject(obj)
			else
				local c = GetWasteRockAmountForObj(obj)
				work_for_obstructor_clearing = work_for_obstructor_clearing + c * obstructor_work_cost_m
				table.insert(obstructors_cache, obj)
				obstructor_to_cost[obj] = c
				min = Min(min, c * obstructor_work_cost_m)
			end
			passed[obj] = true
		end
	end)
	self.obstructors_cache = obstructors_cache
	self.obstructor_to_cost = obstructor_to_cost
	self.min_obstructor_cost = min
	self.work_for_waste_rock_juggling = self.abs_volume - abs(self.volume)
	self.work_for_obstructor_clearing = work_for_obstructor_clearing
	self.waste_rock_to_be_transported = self.volume
	self.total_ls_progress = self.abs_volume
	self.cur_ls_progress = 0
	
	local max_drones = self:GetMaxDrones()
	self.demand_request = self:AddDemandRequest("WasteRock", 0, 0, max_drones)
	self.supply_request = self:AddSupplyRequest("WasteRock", 0, const.rfCanExecuteAlone, max_drones)
	self.waste_rock_juggle_work_request = self:AddWorkRequest("construct", 0, 0, max_drones)
	self.clear_obstructors_request = self:AddWorkRequest("clear", 0, 0, max_drones)
	self.obstructors_supply_request = self:AddSupplyRequest("WasteRock", 0, const.rfCanExecuteAlone, max_drones)
	
	
	--self.total_ls_progress = self.work_for_waste_rock_juggling + self.waste_rock_to_be_transported
	local is_producing = self.waste_rock_to_be_transported < 0
	local wr_produced = is_producing and abs(self.waste_rock_to_be_transported) or 0
	local wr_required = not is_producing and abs(self.waste_rock_to_be_transported) or 0
	local coef = UICity:IsTechResearched("ConservationLandscaping") and 2 or 1
	if coef > 1 then
		if is_producing then
			self.total_ls_progress = self.total_ls_progress + wr_produced
			wr_produced = wr_produced * coef
			self.work_for_waste_rock_juggling = self.total_ls_progress - wr_produced --avoid round error
		else
			wr_required = wr_required / coef
			self.total_ls_progress = self.total_ls_progress - wr_required
			self.work_for_waste_rock_juggling = self.total_ls_progress - wr_required --avoid round error
		end
	end
	
	if UICity:IsTechResearched("LandscapingNanites") then
		wr_produced = wr_produced / 2
		wr_required = wr_required / 2
		local rem = wr_required + wr_produced
		self.total_ls_progress = self.total_ls_progress - rem
		self.work_for_waste_rock_juggling = self.total_ls_progress - rem
	end
	
	self.wr_required = wr_required
	self.wr_produced = wr_produced
	
	self.construction_resources = {}
	self.construct_request = self.waste_rock_juggle_work_request
	
	LandscapeForEachStockpile(self.mark, function(stock, self)
		self.stockpiles_underneath = self.stockpiles_underneath or {}
		stock:InitUnderConstruction(self)
		table.insert(self.stockpiles_underneath, stock)
	end, self)
	
	self.state = "init_done"
	self:UpdateState()
end

function LandscapeConstructionSite:OnBlockerClearenceComplete()
	self:InitBlockPass()
	if self.ui_working then --i.e. we are turned on
		self.auto_connect = true
		self:ConnectToCommandCenters()
	end
	self:Initialize()
	self:TryGoToNextState()
	RebuildInfopanel(self)
end

function LandscapeConstructionSite:TryGoToNextState()
	if self.state == "clear_stocks" and #(self.stockpiles_underneath or "") <= 0 then
		self.state = "clear_stocks_done"
		self:UpdateState()
		return true
	end
	if self.state == "clean" and self.clear_obstructors_request:GetActualAmount() <= 0
		and self.obstructors_supply_request:GetActualAmount() <= 0 
		and #self.obstructors_cache <= 0 then
		self.state = "clean_done"
		
		self.obstructor_to_cost = nil
		self.obstructors_cache = nil
		self:UpdateState()
		return true
	end
	if self.state == "transport" 
		and self.supply_request:GetActualAmount() <= 0
		and self.demand_request:GetActualAmount() <= 0
		and (not self.drone_working_on_amounts
		or ((self.drone_working_on_amounts[self.demand_request] or 0) <= 0
		and (self.drone_working_on_amounts[self.supply_request] or 0) <= 0)) then
		self.waste_rock_to_be_transported = 0
		self.state = "transport_done"
		self:UpdateState()
		return true
	end
	if self.state == "work"
		and self.waste_rock_juggle_work_request:GetActualAmount() <= 0 then
		self.state = "work_done"
		self:UpdateState()
		return true
	end
	
	return false
end

function LandscapeConstructionSite:UpdateState()
	local first = false
	if self.state == "init_done" then
		first = true
		if #(self.stockpiles_underneath or "") > 0 then
			self.state = "clear_stocks"
		else
			self.state = "clear_stocks_done"
		end
	end
	if self.state == "clear_stocks_done" then
		if self.work_for_obstructor_clearing > 0 then
			self.state = "clean"
			self.construction_resources.WasteRock = self.obstructors_supply_request
			self.clear_obstructors_request:AddAmount(self.work_for_obstructor_clearing)
		else
			self.state = "clean_done"
		end
	end
	if self.state == "clean_done" then
		if abs(self.waste_rock_to_be_transported) < (first and const.ResourceScale or 1) then
			self.state = "transport_done"
		else
			self.state = "transport"
			if self.wr_required > 0 then
				self.demand_request:AddAmount(self.wr_required)
				self.construction_resources.WasteRock = self.demand_request
			end
			if self.wr_produced > 0 then
				self.supply_request:AddAmount(self.wr_produced)
				self.construction_resources.WasteRock = self.supply_request
			end
		end
	end
	if self.state == "transport_done" then
		if self.work_for_waste_rock_juggling >= (first and const.ResourceScale or 1) then
			self.state = "work"
			self.waste_rock_juggle_work_request:AddAmount(self.work_for_waste_rock_juggling)
		else
			self.state = "work_done"
		end
	end
	if self.state == "work_done" then
		self.state = "complete"
		CreateGameTimeThread(self.Complete, self)
	end
end

function LandscapeConstructionSite:GetDroneFacePos()
	return self:GetBBox():Center()
end

function LandscapeConstructionSite:GetBBox(grow)
	local ls = Landscapes[self.mark]
	assert(ls)
	return ls and HexStoreToWorld(ls.bbox, grow) or box()
end
--
local reqs = false
local thread = false
local function interrupt_drones(req)
	local b = req:GetBuilding()
	b:InterruptDrones(nil, function(o) return (o.s_request == req or o.d_request == req) and o end)
	b:DisconnectFromCommandCenters()
end

local function exec()
	Sleep(1)
	local blds = {}
	for i = 1, #(reqs or "") do
		local req = reqs[i]
		if req:GetTargetAmount() < 0 and req:GetActualAmount() > 0 then
			req:SetTargetAmount(req:GetActualAmount())
		elseif req:GetTargetAmount() > 0 and req:GetActualAmount() < 0 then
			req:SetActualAmount(req:GetTargetAmount())
		else
			req:SetActualAmount(0)
			req:SetTargetAmount(0)
		end
		local b = req:GetBuilding()
		blds[b] = true
	end
	
	for b, _ in pairs(blds) do
		b:ConnectToCommandCenters()
		b:TryGoToNextState()
	end
	
	thread = false
	reqs = false
end

local function push_for_exec(req)
	reqs = reqs or {}
	reqs[#reqs + 1] = req
	interrupt_drones(req)
	if not thread then
		thread = CreateGameTimeThread(exec)
	end
end

local function fix_req(req)
	if req:GetTargetAmount() < 0 or req:GetActualAmount() < 0 then
		push_for_exec(req)
	end
end

function SavegameFixups.LandscapeConstructionSiteFixRequestsBelowZero()
	MapForEach("map", "LandscapeConstructionSite", function(o)
		fix_req(o.supply_request)
		fix_req(o.demand_request)
	end)
end
--
function LandscapeConstructionSite:DroneUnloadResource(drone, request, resource, amount)
	if request == self.demand_request then
		drone.override_ui_status = "DeliverLSCS"
		drone.delivery_state = "not_done"
		self.drone_working_on_amounts = self.drone_working_on_amounts or {[request] = 0}
		local reserved = self.drone_working_on_amounts
		reserved[request] = reserved[request] + amount
		drone:PushDestructor(function(drone)
			reserved[request] = reserved[request] - amount
			if drone.delivery_state ~= "done" then
				request:AddAmount(amount)
				drone:SetCarriedResource(resource, amount)
			end
			drone.override_ui_status = nil
		end)
		--presentation
		drone:SetCarriedResource(false)
		drone:Face(self:GetDroneFacePos(), 100)
		drone:StartFX("Construct", self)
		drone:PlayState("constructStart")
		drone:SetState("constructIdle")
		Sleep(MulDivRound(self:GetTimeToWork(), g_Consts.DroneTimeToWorkOnLandscapeMultiplier, 100))
		drone.delivery_state = "done"
		drone:PlayState("constructEnd")
		drone:PopAndCallDestructor()
		if not IsValid(self) then
			return
		end
		self:UpdateLSProgress(amount)
	end
end

function LandscapeConstructionSite:DroneLoadResource(drone, request, resource, amount, skip_presentation)
	if request == self.supply_request then
		drone.override_ui_status = "PickUpLSCS"
		self.drone_working_on_amounts = self.drone_working_on_amounts or {[request] = 0}
		local reserved = self.drone_working_on_amounts
		reserved[request] = reserved[request] + amount
		drone:PushDestructor(function(drone)
			reserved[request] = reserved[request] - amount
			drone.override_ui_status = nil
		end)
		--presentation
		drone:Face(self:GetDroneFacePos(), 100)
		drone:StartFX("Construct", self)
		drone:PlayState("constructStart")
		drone:SetState("constructIdle")
		Sleep(MulDivRound(self:GetTimeToWork(), g_Consts.DroneTimeToWorkOnLandscapeMultiplier, 100))
		drone:PlayState("constructEnd")
		drone:PopAndCallDestructor()
		if not IsValid(self) then
			return
		end
	elseif request == self.obstructors_supply_request then
		--pickup obstructor waste rock visuals
		self.wr_from_rocks_picked_up = self.wr_from_rocks_picked_up + amount
	end
	self:UpdateLSProgress(amount, request)
end

function LandscapeConstructionSite:DoesWasteRockFromRocksNeedWorkers()
	local request = self.obstructors_supply_request
	if request then
		local amount = request:GetTargetAmount()
		if amount > 5000 then
			local workers = 100 - MulDivRound(request:GetFreeUnitSlots(), 100, self:GetMaxDrones())
			if workers <= 50 then
				return true
			end
		end
	end
	return false
end

function SavegameFixups.PokeStuckLSCS()
	MapForEach("map", "LandscapeConstructionSite", LandscapeConstructionSite.ProcObstructors)
end

function LandscapeConstructionSite:ProcObstructors()
	local points = self.cur_clean_progress
	local min = self.min_obstructor_cost
	local rocks = self.cur_obstructors_providing_rocks or {}
	self.cur_obstructors_providing_rocks = rocks
	local no_further_work_in_req = self.clear_obstructors_request:GetActualAmount() <= 0
	
	if points >= min or no_further_work_in_req then
		local new_min = max_int
		local added = 0
		for i = #(self.obstructors_cache or ""), 1, -1 do
			local o = self.obstructors_cache[i]
			if not rocks[o] then
				if IsValid(o) then
					local res_cost = self.obstructor_to_cost[o]
					local work_cost = res_cost * obstructor_work_cost_m
					if points >= work_cost or no_further_work_in_req then
						self.obstructors_supply_request:AddAmount(res_cost)
						added = added + res_cost
						table.insert(rocks, o)
						rocks[o] = true
						points = points - work_cost
					else
						new_min = Min(new_min, work_cost)
					end
				else
					table.remove(self.obstructors_cache, i)
				end
			end
		end
		
		assert(points >= 0 or no_further_work_in_req)
		if points < 0 then
			print("<color 0 255 0>Initial work was not enough to finish cleaning landscape cs!", points, "</color>")
		end
		self.wr_added_to_clean_wr_supply_req = self.wr_added_to_clean_wr_supply_req + added
		self.cur_clean_progress = Max(points, 0)
		self.min_obstructor_cost = new_min
	end
	
	points = self.wr_added_to_clean_wr_supply_req - self.obstructors_supply_request:GetActualAmount()
	if points > 0 and #rocks > 0 then
		SuspendPassEdits("ProcObstructors")
		
		for i = #rocks, 1, -1 do
			local o = rocks[i]
			if IsValid(o) then
				local cost = self.obstructor_to_cost[o]
				if cost <= points then
					points = points - cost
					RemoveRock(o)
					table.remove(rocks, i)
					rocks[o] = nil
					table.remove_entry(self.obstructors_cache, o)
					self.rocks_removed = self.rocks_removed + 1
				end
			else
				table.remove(rocks, i)
				rocks[o] = nil
			end
		end
		
		self.wr_added_to_clean_wr_supply_req = self.obstructors_supply_request:GetActualAmount() + points
		ResumePassEdits("ProcObstructors")
		
		if #rocks <= 0 then
			self:TryGoToNextState()
		end
	end
end

function LandscapeConstructionSite:UpdateConstructionVisualization(request)
	if self.state == "clean" then
		self:ProcObstructors()
		return
	end
	LandscapeProgress(self.mark, self.cur_ls_progress - self.last_ls_progress, self.total_ls_progress)
	self.last_ls_progress = self.cur_ls_progress
end

function LandscapeConstructionSite:GetConstructionBuildPointsProgress()
	if self.state == "work" then
		return MulDivRound(self.work_for_waste_rock_juggling - self.waste_rock_juggle_work_request:GetActualAmount(), 100, self.work_for_waste_rock_juggling)
	elseif self.state == "complete" or self.state == "work_complete" then
		return 100
	end
	return 0
end

function LandscapeConstructionSite:GetCleaningProgress()
	local work_for_obstructor_clearing = self.work_for_obstructor_clearing / obstructor_work_cost_m
	local total = (work_for_obstructor_clearing * 2)
	local progress = 0
	if self.state == "clean" then
		local cleaned = work_for_obstructor_clearing - self.clear_obstructors_request:GetActualAmount() / obstructor_work_cost_m
		local remaining_wr = 0
		for i = 1, #self.obstructors_cache do
			local o = self.obstructors_cache[i]
			remaining_wr = remaining_wr + self.obstructor_to_cost[o]
		end
		local collected = (work_for_obstructor_clearing - remaining_wr)
								+ (self.wr_added_to_clean_wr_supply_req - self.obstructors_supply_request:GetActualAmount())
		progress = cleaned + collected
	else
		progress = (work_for_obstructor_clearing * 2)
	end
	
	return MulDivTrunc(progress, 100, total)
end

function LandscapeConstructionSite:GetDroneWorkingAmount(req)
	return self.drone_working_on_amounts and self.drone_working_on_amounts[req] or 0
end

function LandscapeConstructionSite:GetTotalActualSupply()
	return self.supply_request:GetActualAmount() + self:GetDroneWorkingAmount(self.supply_request)
end

function LandscapeConstructionSite:GetTotalActualDemand()
	return self.demand_request:GetActualAmount() + self:GetDroneWorkingAmount(self.demand_request)
end

function LandscapeConstructionSite:GetTransportProgress()
	local total = self.wr_required + self.wr_produced
	local progress = 0
	if self.state == "transport" then
		if self.wr_required > 0 then
			progress = progress + (self.wr_required - self:GetTotalActualDemand())
		end
		if self.wr_produced > 0 then
			progress = progress + (self.wr_produced - self:GetTotalActualSupply())
		end
	elseif self.state == "work" then
		progress = total
	end
	
	return MulDivTrunc(progress, 100, total)
end

function LandscapeConstructionSite:GetLevelingProgress()
	local total = self.work_for_waste_rock_juggling
	local progress = 0
	if self.state == "work" then
		progress = self.work_for_waste_rock_juggling - self.waste_rock_juggle_work_request:GetActualAmount()
	end
	
	return total == 0 and 100 or MulDivTrunc(progress, 100, total)
end

function LandscapeConstructionSite:GetTotalLandscapeProgress()
	local work_for_obstructor_clearing = self.work_for_obstructor_clearing / obstructor_work_cost_m
	local total = work_for_obstructor_clearing * 2 + self.total_ls_progress
	local progress = 0
	if self.state == "clean" then
		local cleaned = work_for_obstructor_clearing - self.clear_obstructors_request:GetActualAmount() / obstructor_work_cost_m
		local remaining_wr = 0
		for i = 1, #self.obstructors_cache do
			local o = self.obstructors_cache[i]
			remaining_wr = remaining_wr + self.obstructor_to_cost[o]
		end
		local collected = (work_for_obstructor_clearing - remaining_wr)
								+ (self.wr_added_to_clean_wr_supply_req - self.obstructors_supply_request:GetActualAmount())
		progress = cleaned + collected
	elseif self.state == "transport" then
		progress = work_for_obstructor_clearing * 2
		
		if self.wr_required > 0 then
			progress = progress + (self.wr_required - self:GetTotalActualDemand())
		end
		if self.wr_produced > 0 then
			progress = progress + (self.wr_produced - self:GetTotalActualSupply())
		end
	elseif self.state == "work" then
		progress = work_for_obstructor_clearing * 2 + self.wr_required + self.wr_produced
						+ (self.work_for_waste_rock_juggling - self.waste_rock_juggle_work_request:GetActualAmount())
	end
	
	return MulDivTrunc(progress, 100, total)
end

function LandscapeConstructionSite:UpdateLSProgress(amount, request)
	if self.state == "transport" or self.state == "work" then
		self.cur_ls_progress = self.cur_ls_progress + abs(amount)
	elseif self.state == "clean" then
		if request == self.clear_obstructors_request then
			self.cur_clean_progress = self.cur_clean_progress + abs(amount)
		end
	end
	assert(request == self.clear_obstructors_request and self.state == "clean"
			or request ~= self.clear_obstructors_request)
	self:UpdateConstructionVisualization(request)
	self:TryGoToNextState()
end

function LandscapeConstructionSite:GetEmptyStorage(resource)
	--rover compat
	return max_int
end

function LandscapeConstructionSite:AddResource(amount, resource)
	if resource == "construct" then
		self.waste_rock_juggle_work_request:AddAmount(amount)
		self:UpdateLSProgress(amount)
		return
	elseif resource == "clear" then
		local req = self.clear_obstructors_request
		local to_add = -(Min(abs(amount), req:GetActualAmount()))
		if to_add ~= 0 then
			req:AddAmount(to_add)
			self:UpdateLSProgress(to_add, req)
		end
		return
	elseif self.state == "clean" and resource == "WasteRock" then
		local req = self.obstructors_supply_request
		req:AddAmount(amount)
		self:UpdateLSProgress(amount, req)
		self.wr_from_rocks_picked_up = self.wr_from_rocks_picked_up + amount
		return
	end
	local req = self.construction_resources[resource]
	req:AddAmount(req:IsAnyFlagSet(const.rfDemand) and -amount or amount)
	self:UpdateLSProgress(amount)
end

function LandscapeConstructionSite:ConnectToCommandCenters()
	local b =  self:GetBBox(const.CommandCenterMaxRadius * const.GridSpacing)
	MapForEach(b, "DroneControl", DroneControl.ConnectLandscapeConstructions)
end

local max_t = 10
function LandscapeConstructionSite:GetOuputPile()
	local p = self.auto_construct_output_pile
	if not IsValid(p) or p:GetEmptyStorage() <= 0 then
		local res, q, r
		local mq, mr = WorldToHex(self)
		local count, passed, now = 0, {}, GameTime()
		while not res and count < max_t do
			local sp = table.rand(self.periphery_shape)
			if not passed[sp] then
				res, q, r = TryFindStockpileDumpSpot(mq + sp:x(), mr + sp:y(), 0, HexSurroundingsCheckShapeLarge, HexGetLandscapeOrAnyObjButToxicPool, "for WasteRock resource")
				passed[sp] = true
			end
			count = count + 1
		end
		
		if res then
			p = PlaceObject("WasteRockStockpileUngrided", 
				{has_demand_request = true, apply_to_grids = true, has_platform = false, snap_to_grid = true, 
				additional_demand_flags = const.rfSpecialDemandPairing})
			p:SetPos(point(HexToWorld(q, r)))
		else
			p = false
		end
	end
	self.auto_construct_output_pile = p
	return p
end

local construction_site_auto_construct_tick = ConstructionSite.building_update_time --wont go faster, but doesn't do much else
local construction_site_auto_construct_amount = 167
local construction_site_auto_clean_amount = 5000
local construction_site_auto_transfer_amount = 2000
function LandscapeConstructionSite:UnloadRequest(req)
	assert(req:IsAnyFlagSet(const.rfSupply))
	local sup_req = req
	if sup_req:GetTargetAmount() > 0 then
		local stock = self:GetOuputPile()
		if stock then
			local dreq = stock.demand_request
			if not dreq then return end --stock not initialized yet, skip pass
			local a = Min(construction_site_auto_transfer_amount, sup_req:GetTargetAmount())
			a = Min(a, dreq:GetTargetAmount())
			sup_req:AddAmount(-a)
			dreq:AddAmount(-a)
			if stock:HasMember("DroneUnloadResource") then
				stock:DroneUnloadResource(nil, dreq, "WasteRock", a, true)
			end
			self:UpdateLSProgress(a, sup_req)
		end
	end
end

function LandscapeConstructionSite:BuildingUpdate(delta, day, hour)
	if self.state == "clean" and #(self.obstructors_cache or "") > 0 then
		local removed = false
		for i = #self.obstructors_cache, 1, -1 do
			if not IsValid(self.obstructors_cache[i]) then
				table.remove(self.obstructors_cache, i)
				removed = true
			end
		end
		if removed then
			self:TryGoToNextState()
		end
	end
	
	if UICity:IsTechResearched("LandscapingNanites") then
		local current_time = GameTime()
		if not self.auto_construct_ts_ls then self.auto_construct_ts_ls = current_time end 
		if current_time - self.auto_construct_ts_ls >= construction_site_auto_construct_tick then
			self.auto_construct_ts_ls = current_time
			
			if self.state == "clean" then
				local work_req = self.clear_obstructors_request
				local a = work_req:GetActualAmount()
				local dec = Min(construction_site_auto_clean_amount, a)
				a = a - dec
				work_req:SetAmount(a)
				self:UpdateLSProgress(dec, work_req)
				
				self:UnloadRequest(self.obstructors_supply_request)
				RebuildInfopanel(self)
			elseif self.state == "transport" then
				local is_producing = self.waste_rock_to_be_transported < 0
				if is_producing then
					self:UnloadRequest(self.supply_request)
				else --requires wr
					local request = false
					local filter_func = function(o)
						local r = "WasteRock"
						if type(o.resource) == "table" then
							local req = o.supply[r]
							if req and req:GetTargetAmount() >= const.ResourceScale then
								request = req
								return "break"
							end
						elseif o.resource == r then
							local req = o.supply_request
							if req and req:GetTargetAmount() >= const.ResourceScale then
								request = req
								return "break"
							end
						end
						return false
					end
					local pos = table.rand(self.drone_dests_cache)
					MapForEach(pos, "hex", 30, "WasteRockStockpileBase", "WasteRockDumpSite", filter_func)
					if request then
						local a = Min(construction_site_auto_transfer_amount, request:GetTargetAmount())
						local my_req = self.demand_request
						a = Min(a, my_req:GetTargetAmount())
						
						my_req:AddAmount(-a)
						request:AddAmount(-a)
						local bld = request:GetBuilding()
						if bld:HasMember("DroneLoadResource") then
							bld:DroneLoadResource(nil, request, "WasteRock", a, true)
						end
						self:UpdateLSProgress(a, my_req)
					end
				end
			elseif self.state == "work" then
				local req = self.waste_rock_juggle_work_request
				local a = req:GetActualAmount()
				local dec = Min(construction_site_auto_construct_amount, a)
				a = a - dec
				req:SetAmount(a)
				self:UpdateLSProgress(dec, req)
				RebuildInfopanel(self)
			end
		end
	end
end

function LandscapeConstructionSite:RoverWork(rover, request, resource, amount, total_amount, interaction_type)
	if resource == "construct" then
		rover:PushDestructor(function(rover)
			if IsValid(self) and not self:IsWaitingResources() and self:IsConstructed() then
				self:Complete()
			end
		end)
		local t = self.clear_obstructors_request ~= request and self:GetTimeToWork() / 2 or false
		local amount = amount * (request == self.waste_rock_juggle_work_request and (const.ResourceScale / DroneResourceUnits.construct) or 1)
		rover:ContinuousTask(request, amount, "constructStart", "constructIdle", "constructEnd", "Construct", nil, t, nil, nil, total_amount)
		rover:PopAndCallDestructor()
	elseif self.construction_resources[resource] == request then
		local t = self.obstructors_supply_request ~= request and self:GetTimeToWork() / 2 or g_Consts.RCRoverTransferResourceWorkTime
		rover:ContinuousTask(request, amount, "gatherStart", "gatherIdle", "gatherEnd", interaction_type ~= "load" and "Unload" or "Load", "step", t, "add resource")
	end
end
----
DefineClass.TerrainPaintConstructionSite = {
	__parents = { "LandscapeConstructionSiteBase" },
	
	affects_wasterock = false,
	work_request = false,
	work_required = false,
	last_progress_marked = 0,
}

local work_per_hex_for_terrain_painting = 1000
function TerrainPaintConstructionSite:GatherConstructionResources()
	if self.work_request then return end
	local landscape = Landscapes[self.mark]
	if not landscape then
		assert(false)
		return 
	end
	
	local passed = {}
	LandscapeForEachObstructor(self.mark, function(obj)
		if not passed[obj] then
			if obj:GetEnumFlags(const.efRemoveUnderConstruction + const.efBakedTerrainDecal + const.efBakedTerrainDecalLarge) ~= 0 then
				DoneObject(obj)
			end
			passed[obj] = true
		end
	end)
	
	self.work_required = landscape.hexes * work_per_hex_for_terrain_painting
	self.work_request = self:AddWorkRequest("construct", 0, 0, self:GetMaxDrones())

	self.construction_resources = {}
	self.construct_request = self.work_request
	
	self.state = "init_done"
	self:UpdateState()
end

function TerrainPaintConstructionSite:TryGoToNextState()
	if self.state == "work" then
		if self.work_request:GetActualAmount() <= 0 then
			self.state = "work_done"
			self:UpdateState()
		end
	end
end

function TerrainPaintConstructionSite:UpdateState()
	if self.state == "init_done" then
		if self.work_required > 0 then
			self.state = "work"
			self.work_request:AddAmount(self.work_required)
		else
			self.state = "work_done"
		end
	end
	if self.state == "work_done" then
		self.state = "complete"
		CreateGameTimeThread(self.Complete, self)
	end
end

function TerrainPaintConstructionSite:GetTotalLandscapeProgress()
	local total = self.work_required
	local progress = 0
	if self.state == "work" then
		progress = self.work_required - self.work_request:GetActualAmount()
	elseif self.state == "work_done" or self.state == "complete" then
		progress = total
	end
	
	return MulDivTrunc(progress, 100, total)
end

function TerrainPaintConstructionSite:GetResourceProgress()
	local lines = {}
	
	if self.state == "work" then
		lines[#lines+1] = T{12395, "<em>Changing terrain</em><right><percent>%", percent = self:GetTotalLandscapeProgress()}
	end
	
	return table.concat(lines, "<newline><left>")
end	

function TerrainPaintConstructionSite:UpdateLSProgress()
	local p = self:GetTotalLandscapeProgress()
	if p > self.last_progress_marked then
		LandscapeChangeTerrain(self.mark, p)
		self.last_progress_marked = p
		self:TryGoToNextState()
	end
end

function TerrainPaintConstructionSite:BuildingUpdate(delta, day, hour)
	if self.state == "work" and UICity:IsTechResearched("LandscapingNanites") then
		local current_time = GameTime()
		if not self.auto_construct_ts_ls then self.auto_construct_ts_ls = current_time end 
		if current_time - self.auto_construct_ts_ls >= construction_site_auto_construct_tick then
			self.auto_construct_ts_ls = current_time
			
			local req = self.work_request
			local a = req:GetActualAmount()
			local dec = Min(construction_site_auto_construct_amount, a)
			a = a - dec
			req:SetAmount(a)
			self:UpdateLSProgress(dec, req)
			RebuildInfopanel(self)
		end
	end
end

function TerrainPaintConstructionSite:GetDroneWorkAmount(drone, request, resource, amount)
	return amount
end

function TerrainPaintConstructionSite:AddResource(amount, resource)
	if resource == "construct" then
		self.work_request:AddAmount(amount * (const.ResourceScale / DroneResourceUnits.construct))
		self:UpdateLSProgress(amount)
		return
	end
end

function TerrainPaintConstructionSite:Getdescription() 
	return T{12470, "<em>Landscaping project.</em> Drones will gradually change the underlying surface towards the desired texture.", self}
end
----

DefineClass.LandscapeConstructionDialog = {
	__parents = { "ConstructionModeDialog" },
	Cursor =  "UI/Cursors/CablePlacement.tga",
	success_sound = "LandscapeConstructionSuccess",
	mode_name = false,
}

function LandscapeConstructionDialog:OnStartup()
	local obj = GetConstructionController(self.mode_name)
	obj:Activate(self.context.template)
end

function LandscapeConstructionDialog:OnMouseButtonDown(pt, button)
	local obj = GetConstructionController(self.mode_name)
	local success, deactivate
	if button == "L" then
		success, deactivate = obj:Place()
		if success then
			PlayFX(self.success_sound, "start")
		else
			PlayFX("ConstructionFail", "start")
		end
	end
	if button == "R" or deactivate then
		obj:Deactivate(pt)
		PlayFX("LandscapeTerraceCancel", "start")
		CloseModeDialog()
		return "break"
	end
	if button == "M" then
		obj:Rotate(terminal.IsKeyPressed(const.vkAlt) and -1 or 1, true)
	end
end

LandscapeConstructionDialog.OnMouseButtonDoubleClick = LandscapeConstructionDialog.OnMouseButtonDown

function LandscapeConstructionDialog:OnKbdKeyDown(virtual_key, repeated)
	if virtual_key == const.vkEsc then
		self:OnMouseButtonDown(nil, "R")
		return "break"
	end
	return "continue"
end

function LandscapeConstructionDialog:OnShortcut(shortcut, source)
	if shortcut == "ButtonA" or shortcut == "LeftTrigger-ButtonA" then
		self:OnMouseButtonDown(GetTerrainGamepadCursor(), "L")
		return "break"
	elseif shortcut == "ButtonB" then
		self:OnMouseButtonDown(nil, "R") --cancel
		return "break"
	end
end

----

DefineClass.LandscapeConstructionController = {
	__parents = { "ConstructionController" },
	
	max_range = 100, --hexes
	
	brush_radius = 90*guim,
	brush_radius_step = 10*guim, --m
	brush_radius_min = 10*guim, --m
	brush_radius_max = 100*guim, --m
	
	placed = false,
	
	max_landscapes = false,
	place_block = false,
	mark_fail = false,
	out_of_bounds = false,
	
	last_pos = false,
	last_undo_pos = false,
	last_brush_radius = 0,
	obstruct_handles = empty_table,
	obstruct_marks = empty_table,
	resize_sign = 1,
	
	current_status = const.clrNoModifier,
	stockpiles_obstruct = true,
	
	waste_rock_from_colored_rocks = 0,
	waste_rock_from_colored_rocks_last_place = 0,
	template_class = false,
	ignore_domes = true,
}

function LandscapeConstructionController:Init()
	self.brush_radius = round((self.brush_radius_min + self.brush_radius_max) / 2, self.brush_radius_step)
end

function LandscapeConstructionController:PickCursorObjColor()
end

LandscapeConstructionController.SetTxtPosObj = GridConstructionController.SetTxtPosObj

function LandscapeConstructionController:Activate(template)
	self.waste_rock_from_colored_rocks = 0
	self.selected_domes = {}
	self.template_name = template
	local t_obj = BuildingTemplates[template]
	self.template_class = t_obj and t_obj.template_class
	self.template_obj = ClassTemplates.Building[template] or g_Classes[template]
	self.template_obj_points = self.template_obj and self.template_obj:GetBuildShape()
	local entity = self.template_obj.entity
	if IsValid(self.cursor_obj) then
		self.cursor_obj.entity = entity
		self.cursor_obj:ChangeEntity(entity)
	else
		self.cursor_obj = CursorBuilding:new{ template = self.template_obj, entity = entity }
		self.cursor_obj:ClearEnumFlags(const.efVisible)
	end
	self:SetTxtPosObj(self.cursor_obj)
	self:UpdateCursor()
end

function LandscapeConstructionController:Mark(test)
end

function LandscapeConstructionController:Place()
	assert(self.last_pos)
	local s = self:GetConstructionState()
	if s == "error" then
		return false
	end
	local pt = self.last_pos
	self.placed = pt
	local success, ready = self:Mark()
	self.last_undo_pos = pt
	self.waste_rock_from_colored_rocks_last_place = self.waste_rock_from_colored_rocks
	return success, ready
end

function LandscapeConstructionController:ValidateMark(test)
	return LandscapeMarkSmooth(test, self.obstruct_handles, self.obstruct_marks)
end

function LandscapeConstructionController:Rotate(step, mirror)
	if not mirror then
		self.brush_radius = Clamp(self.brush_radius + step * self.brush_radius_step, self.brush_radius_min, self.brush_radius_max)
	else
		self.brush_radius = self.brush_radius + self.resize_sign * step * self.brush_radius_step
		if self.brush_radius >= self.brush_radius_max then
			self.brush_radius = self.brush_radius_max
			self.resize_sign = -self.resize_sign
		elseif self.brush_radius <= self.brush_radius_min then
			self.brush_radius = self.brush_radius_min
			self.resize_sign = -self.resize_sign
		end
	end
	self:UpdateCursor(self.last_pos)
end

function LandscapeConstructionController:IsMarkSuitable(pt)
	pt = pt or self.last_pos
	return IsInMapPlayableArea(pt) and LandscapeMarkBuildable(pt)
end

function LandscapeConstructionController:UpdateCursor(pt)
	pt = HexGetNearestCenter(pt or GetUIStyleGamepad() and GetTerrainGamepadCursor() or GetTerrainCursor())
	if self.last_pos and self.last_pos:Equal2D(pt) and self.last_brush_radius == self.brush_radius then
		return
	end
	self.last_pos = pt
	self.last_brush_radius = self.brush_radius
	
	if IsValid(self.cursor_obj) then
		self.cursor_obj:SetPos(FixConstructPos(pt))
	end
	
	self.obstruct_handles = {}
	self.obstruct_marks = {}
	self:ClearColorFromAllConstructionObstructors()
	
	self.mark_fail = nil
	self.max_landscapes = nil
	self.place_block = nil
	self.out_of_bounds = nil
	
	if not self.placed then
		self.max_landscapes = not LandscapeMarkStart(pt)
		self.out_of_bounds = not IsInMapPlayableArea(pt)
		self.place_block = not self:IsMarkSuitable(pt)
	end
	local landscape = Landscapes[LandscapeMark]
	if landscape then
		self.mark_fail = not self:Mark(true)
		local fully_overlapped = (landscape.hexes or 0) == 0 and LandscapeCheck(pt)
		if fully_overlapped then
			self.obstruct_marks[fully_overlapped] = true
		end
	end
	
	ObjModified(self)
	self:UpdateConstructionObstructors()
	self:UpdateConstructionStatuses(pt)
	self:UpdateShortConstructionStatus()

	hr.LandscapeInvalidMark = self:GetConstructionState() == "error" and LandscapeMark or 0
end

function GetCostsFromVolumeAndAbsVolume(volume, absvolume)
	local pt, nt = 0, 0
	nt = (absvolume - volume) / 2
	pt = absvolume - nt

	return pt, nt
end

function LandscapeConstructionController:ColorRocks(...)
	if self.template_class == "LandscapeTextureBuilding" then return end
	return ConstructionController.ColorRocks(self, ...)
end

function LandscapeConstructionController:Deactivate(pt)
	local landscape = Landscapes[LandscapeMark]
	if not landscape then
		return
	end
	
	LandscapeMarkCancel()
	self:ValidateMark()
	LandscapeMarkEnd()
	
	if landscape.primes == 0 then
		LandscapeFinish(landscape.mark)
	else
		local is_tex_only = self.template_class == "LandscapeTextureBuilding"
		local cls = is_tex_only and g_Classes["TerrainPaintConstructionSite"] or g_Classes["LandscapeConstructionSite"]
		local site = cls:new{
			hexes = landscape.hexes,
			mark = landscape.mark,
			abs_volume = landscape.volume,
			volume = landscape.material,
			waste_rock_from_rocks_underneath = not is_tex_only and self.waste_rock_from_colored_rocks_last_place or nil,
		}
		
		site:SetBuildingClass(self.template_name)
		site:SetPos(HexGetNearestCenter(landscape.start))
		landscape.site = site
	end
	
	self.last_undo_pos = false
	self.last_pos = false
	self.placed = false
	if IsValid(self.cursor_obj) then
		self.cursor_obj:delete()
		self.cursor_obj = false
	end
	self:ColorRocks()
	self:ClearColorFromAllConstructionObstructors()
	
	hr.LandscapeInvalidMark = 0
end

ConstructionStatus.LandscapeOverlapping = { type = "error", priority = 91, text = T(12029, "Overlaping landscaping projects."), short = T(12030, "Overlaping projects")}
ConstructionStatus.LandscapeUnavailable = { type = "error", priority = 91, text = T(12031, "Select a flat surface to extend."), short = T(12032, "Not flat")}
ConstructionStatus.LandscapeLowTerrain =  { type = "error", priority = 91, text = T(12033, "Landscaping excavation is too deep."), short = T(12034, "Excavation too deep")}
ConstructionStatus.LandscapeTooMany =     { type = "error", priority = 91, text = T(12163, "No more landscape projects can be placed."), short = T(12164, "Too many projects")}
ConstructionStatus.LandscapeTooLarge =    { type = "error", priority = 91, text = T(12165, "Project area covers too many hexes, or has become too wide."), short = T(12166, "Too large")}
ConstructionStatus.LandscapeOutOfBounds = { type = "error", priority = 92, text = T(12396, "Project area goes outside of the boundaries of the Colony."), short = T(12397, "Out of bounds")}

function LandscapeConstructionController:GetLimits()
	local max_boundary, max_hexes
	if self.template_obj then
		max_boundary = self.template_obj.max_boundary
		max_hexes = self.template_obj.max_hexes
	end
	if (max_boundary or 0) == 0 then
		max_boundary = const.Terraforming.LandscapeMaxBoundary
	end
	if (max_hexes or 0) == 0 then
		max_hexes = const.Terraforming.LandscapeMaxHexes
	end
	return max_boundary, max_hexes
end

function LandscapeConstructionController:AddConstructionStatuses(statuses)
	local landscape = Landscapes[LandscapeMark]
	if not landscape then
		return
	end
	local obstructed = self:IsObstructed()
	local overlapped = next(self.obstruct_marks)
	local max_boundary, max_hexes = self:GetLimits()
	if Max(landscape.bbox:sizexyz()) > max_boundary then
		statuses[#statuses + 1] = ConstructionStatus.LandscapeTooLarge
	end
	if landscape.hexes > max_hexes then
		statuses[#statuses + 1] = ConstructionStatus.LandscapeTooLarge
	end
	if self.max_landscapes then
		statuses[#statuses + 1] = ConstructionStatus.LandscapeTooMany
	elseif self.out_of_bounds or self.mark_fail and not obstructed and not overlapped then
		statuses[#statuses + 1] = ConstructionStatus.LandscapeOutOfBounds
	elseif self.place_block then
		statuses[#statuses + 1] = ConstructionStatus.LandscapeUnavailable
	elseif obstructed then
		statuses[#statuses + 1] = ConstructionStatus.BlockingObjects
	end
	if overlapped then
		statuses[#statuses + 1] = ConstructionStatus.LandscapeOverlapping
	end
	--[[
		if not IsCloser2D(self.placed_obj, self.cursor_obj, self.max_range * const.GridSpacing) then
			table.insert(self.construction_statuses, ConstructionStatus.TooFarFromLandscapeEntrance)
		end
	--]]
end

function LandscapeConstructionController:UpdateConstructionStatuses(pt)
	local old_t = self.construction_statuses
	
	local statuses = {}
	self:AddConstructionStatuses(statuses)
	self.construction_statuses = statuses

	self:FinalizeStatusGathering(old_t)
end

local function HandleCollect(handle, objects)
	local obj = HandleToObject[handle]
	if IsValid(obj) then
		if obj.class == "GridObjectList" then
			for _, handlei in ipairs(obj) do
				HandleCollect(handlei, objects)
			end
		else
			objects[obj] = true
		end
	end
end

function LandscapeConstructionController:UpdateConstructionObstructors()
	local obstructors = {}
	for handle in pairs(self.obstruct_handles or empty_table) do
		HandleCollect(handle, obstructors)
	end
	self.construction_obstructors = table.keys(obstructors)
	local objs = {}
	local wr = 0
	local passed = {}
	local function AddObj(obj)
		if not table.find(objs, obj) then
			objs[#objs + 1] = obj
			if obj:GetEnumFlags(const.efRemoveUnderConstruction + const.efBakedTerrainDecal + const.efBakedTerrainDecalLarge) == 0 then
				wr = wr + GetWasteRockAmountForObj(obj)
			end
		end
	end
	LandscapeForEachObstructor(LandscapeMark, AddObj)
	self.waste_rock_from_colored_rocks = wr
	self:ColorRocks(objs)
	ObjModified(self)
end

function LandscapeConstructionController:HasConstructionCost()
	return false
end

function LandscapeConstructionController:GetConstructionCost()
	local resource_name = Resources.WasteRock.display_name
	local coef = UICity:IsTechResearched("ConservationLandscaping") and 2 or 1
	
	local total_cost, total_negative_cost, hexes, boundary = 0, 0, 0, 0
	local landscape = Landscapes[LandscapeMark]
	if landscape then
		total_cost, total_negative_cost = GetCostsFromVolumeAndAbsVolume(landscape.material, landscape.volume)
		hexes = landscape.hexes
		boundary = Max(landscape.bbox:sizexyz())
	end
	
	local modified_total_cost = total_cost / coef
	local modified_total_negative_cost = total_negative_cost * coef
	local lines = {}
	if modified_total_cost > modified_total_negative_cost and (modified_total_cost - modified_total_negative_cost > 99 or self.waste_rock_from_colored_rocks <= 0) then
		lines[#lines+1] = T{11898, "<em>Required Waste Rock</em><right><wasterock(number)>", number = modified_total_cost - modified_total_negative_cost, resource = "WasteRock" }
	elseif modified_total_cost < modified_total_negative_cost or self.waste_rock_from_colored_rocks > 0 then
		lines[#lines+1] = T{11899, "<em>Excess Waste Rock</em><right><resource(number,resource)>", number = modified_total_negative_cost - modified_total_cost + self.waste_rock_from_colored_rocks, resource = "WasteRock" }
	else
		lines[#lines+1] = T(12281, "<green>No need for additional Waste Rock</green>")
	end
	local max_boundary, max_hexes = self:GetLimits()
	lines[#lines+1] = T{12283, "<newline>Tool size<right><size>/<max_size>", size = self.brush_radius / self.brush_radius_step, max_size = self.brush_radius_max / self.brush_radius_step}
	lines[#lines+1] = T{12082, "Hexes covered<right><hexes>/<max_hexes>", hexes = hexes, max_hexes = max_hexes}
	lines[#lines+1] = T{12484, "Size Boundary<right><boundary>/<max_boundary>", boundary = boundary, max_boundary = max_boundary}
	return table.concat(lines, "<newline><left>")
end

---- Selection

function GetLandscapeConstructionAt(...)
	local mark = LandscapeCheck(...)
	local landscape = mark and Landscapes[mark]
	if not landscape then
		return
	end
	local site = landscape.site
	if not IsValid(site) then
		assert(false, "Missing landscape construction site!")
		return
	end
	return site
end

function OnMsg.GatherSelectedObjectsOnHexGrid(q, r, objs)
	local site = GetLandscapeConstructionAt(q, r, true)
	table.insert_unique(objs, site)
end

function OnMsg.GamepadGatherSelectedObjects(gamepad, objs)
	local site = GetLandscapeConstructionAt(gamepad.pos)
	table.insert_unique(objs, site)
end

GlobalVar("LandscapeConstructionSiteColoredRocks", {})

function ColorRocksLSConstruction(obj)
	ClearColorRocksLSConstruction(obj)
	LandscapeConstructionSiteColoredRocks[1] = obj
	local t = obj.obstructors_cache
	for i = 1, #(t or "") do
		local rock = t[i]
		if IsValid(rock) then
			rock:SetGameFlags(const.gofWhiteColored)
			table.insert(LandscapeConstructionSiteColoredRocks, rock)
		end
	end
end

function ClearColorRocksLSConstruction()
	if #LandscapeConstructionSiteColoredRocks == 0 then return end
	for i = #LandscapeConstructionSiteColoredRocks, 2, -1 do
		local rock = LandscapeConstructionSiteColoredRocks[i]
		if IsValid(rock) then
			rock:ClearGameFlags(const.gofWhiteColored)
		end
	end
	LandscapeConstructionSiteColoredRocks = {}
end

function OnMsg.SelectionChange()
	if not SelectedObj or SelectedObj ~= LandscapeConstructionSiteColoredRocks[1] then
		ClearColorRocksLSConstruction()
	end
	if IsKindOf(SelectedObj, "LandscapeConstructionSite") then
		ColorRocksLSConstruction(SelectedObj)
	end
	local mark = SelectedObj and rawget(SelectedObj, "mark") or 0
	if LandscapeMark == 0 then
		hr.LandscapeCurrentMark = mark
	end
end

local function HasLandscapeConstructionVisuals(site)
	return IsKindOf(site.building_class_proto, "Building") and site.building_class_proto.landscape_construction_visuals and LandscapeGrid
end

function OnMsg.ConstructionSitePlaced(site)
	if not HasLandscapeConstructionVisuals(site) then
		return
	end
	local pos = site:GetVisualPos()
	local landscape = LandscapeMarkStart(pos)
	if not landscape then
		return
	end
	local x, y, z = pos:xyz()
	local mark = landscape.mark
	local bbox = box()
	local shape = site:GetBuildShape()
	HexShapeForEach(shape, site, function(q, r)
		local sx, sy = HexToStorage(q, r)
		assert(LandscapeGrid:get(sx, sy) == 0)
		local l = bor(z, shift(mark, 16))
		LandscapeGrid:set(sx, sy, l)
		bbox = Extend(bbox, point(sx, sy))
	end)
	landscape.hexes = #shape
	landscape.primes = #shape
	landscape.bbox = bbox
	landscape.site = site
	rawset(site, "mark", mark)
	Landscape_SetGrid(LandscapeGrid, bbox)
	LandscapeMarkEnd()
end

function OnMsg.ConstructionSiteRemoved(site)
	if not HasLandscapeConstructionVisuals(site) then
		return
	end
	local mark = rawget(site, "mark") or 0
	local landscape = Landscapes[mark]
	if not landscape then
		return
	end
	Landscape_MarkErase(mark, landscape.bbox, LandscapeGrid)
	Landscapes[mark] = nil
	hr.RenderLandscape = next(Landscapes) and 1 or 0
end