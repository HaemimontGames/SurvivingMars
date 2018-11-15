function SupplyRocket:WaitingRefurbish()
	WaitWakeup()
end

DefineClass.RocketExpedition = {
	__parents = { "SupplyRocket" },
	properties = {
		{id = "TradeAmount", name = T{504954621520, "Export Amount"}, editor = "number", default = const.MaxTradeAmount*const.ResourceScale, min=const.MinTradeAmount*const.ResourceScale, max=const.MaxTradeAmount*const.ResourceScale, scale=const.ResourceScale, step=5*const.ResourceScale},
		{id = "ExpeditionTime", name = T{11221, "Expedition Time (hrs)"}, editor = "number", default = 6 * const.HourDuration, min = 0, scale = const.HourDuration },
		{id = "ReturnTime", name = T{11222, "Return Time (hrs)"}, editor = "number", default = 6 * const.HourDuration, min = 0, scale = const.HourDuration },
	},
	
	expedition = false,
	launch_valid_cmd = {
		ExpeditionRefuelAndLoad = true,
		ExpeditionPrepare = true,
	},	
	category = "expedition",
	auto_connect = false,
	expedition_start_time = false,
	expedition_return_time = false,
	storable_resources = {"Concrete", "Metals", "Polymers", "Food", "Electronics", "MachineParts", "PreciousMetals"},
	bonus_sleep_time = false, --from story bits
	is_paused = false,
	total_pause_time = false,
	
	rover_summon_fail = false,
	drone_summon_fail = false,
	colonist_summon_fail = false,
}

function RocketExpedition:Init()
	self:CreateGetters()
	
	self.ui_status_func = table.copy(self.ui_status_func)
	self.ui_status_func["trade export"] = "UIStatusTradeExport"
	self.ui_status_func["trade import"] = "UIStatusTradeImport"
	self.ui_status_func["mission"] = "UIStatusMission"
	self.ui_status_func["mission return"] = "UIStatusMissionReturn"
	self.ui_status_func["task"] = "UIStatusTask"
	self.ui_status_func["task return"] = "UIStatusTaskReturn"
end

function RocketExpedition:GameInit()
	self.fx_actor_class = "SupplyRocket"
end

function RocketExpedition:Done()
	if self.expedition then
		if IsValid(self.expedition.rover) then
			DoneObject(self.expedition.rover)
		end
		for _, unit in ipairs(self.expedition.drones or empty_table) do
			if IsValid(unit) then
				DoneObject(unit)
			end
		end
		for _, unit in ipairs(self.expedition.crew or empty_table) do
			if IsValid(unit) then
				DoneObject(unit)
			end
		end
	end
end

function RocketExpedition:GetIPDescription()
	if self.expedition and self.expedition.help_rocket then
		return T{11571, "A Rocket tasked to deliver resources to the Colony of <rival>",rival = self.expedition.rivalai_player:GetDisplayName()}
	end
	return self.expedition and self.expedition.task and self.expedition.task.description or self.description
end

function RocketExpedition:CreateGetters()
	for _, res in ipairs(self.storable_resources) do
		self["GetExportTarget_"..res] =  function(self)
			if not self.expedition then return 0 end
			if self.expedition.route_id then
				return self.TradeAmount
			end
			return self.expedition.export and self.expedition.export[res] or 0
		end
		self["GetExportAmount_"..res] = function(self)
			if not self.expedition then return 0 end
			
			local capacity = self.expedition.route_id and self.TradeAmount or (self.expedition.export and self.expedition.export[res] or 0)
			if capacity <= 0 then
				return 0
			end
			for _, req in ipairs(self.export_requests or empty_table) do
				if req:GetResource() == res then
					return capacity - req:GetActualAmount()
				end
			end
			return 0
		end
	end
	self.GetStored_Fuel = function(self)
		return self.unload_fuel_request and self.unload_fuel_request:GetActualAmount() or 0
	end
end

function RocketExpedition:CreateExportRequests()
end

function RocketExpedition:BeginExpedition(rocket, anomaly)
	self:__InternalExpeditionBegin(rocket, {
		num_drones = anomaly.requirements.num_drones,
		rover_type = anomaly.requirements.rover_type,
		num_crew = anomaly.requirements.num_crew,
		crew_specialization = anomaly.requirements.crew_specialization,
		anomaly = anomaly,
	})
end

function RocketExpedition:BeginTradeRoute(rocket, route_id)
	local route = MarsTradeRoutes[route_id]
	assert(route)
	if not route then return end
		
	self:__InternalExpeditionBegin(rocket, {
		route_id = route_id,
		route = route,
		export = { [route.import] = 1 },
		import_resource = route.export,
		import_quantity = route.export_quantity,
	})
end

function RocketExpedition:BeginMannedExpeditionTask(rocket, task_id)
	local op = MannedExpeditionTasks[task_id]
	assert(op)
	if not op then return end
	
	self:__InternalExpeditionBegin(rocket, {
		num_crew = op.num_crew,
		crew_specialization = op.crew_specialization,
		task = op,
	})
end

function RocketExpedition:BeginHelpRoute(rocket, params)
	self:__InternalExpeditionBegin(rocket, params)
end

function RocketExpedition:__InternalExpeditionBegin(rocket, expedition_params) -- type, export, num_drones, rover_type, num_crew, crew_specialization
	assert(rocket.command == "Refuel" or rocket.command == "WaitLaunchOrder")

	self:RefurbishRocket(rocket, self)
	self.expedition = expedition_params
	self.expedition.crew = self.expedition.crew or {}
	self.expedition.template = rocket.template_name
	
	self:SetCommand("ExpeditionRefuelAndLoad")
end

function RocketExpedition:RefurbishRocket(orig_rocket, target_rocket, connect_cc)
	assert(CurrentThread())
	-- shutdown the rocket
	orig_rocket:InterruptDrones(nil, function(drone)
										if (drone.target == orig_rocket) or 
											(drone.d_request and drone.d_request:GetBuilding() == orig_rocket) or
											(drone.s_request and drone.s_request:GetBuilding() == orig_rocket) then
											return drone
										end
									end)	
	orig_rocket:DisconnectFromCommandCenters()
	orig_rocket:SetWorking(false) -- prevent drones from using the rocket to recharge while refurbishing
	
	if orig_rocket ~= self then
		orig_rocket:SetCommand("WaitingRefurbish")
	end
	
	while orig_rocket:IsCargoRampInUse() do
		orig_rocket:DropBrokenDrones(orig_rocket.drones_exiting)
		orig_rocket:DropBrokenDrones(orig_rocket.drones_entering)
		--wait for drones to exit
		Sleep(1000)
	end
	orig_rocket:StopDroneControl() --this removes waypoint splines so it should be after drones exit.	
	
	-- visuals
	target_rocket:ChangeEntity(orig_rocket:GetEntity())
	target_rocket:DestroyAttaches()
	AutoAttachObjectsToShapeshifter(target_rocket)
	target_rocket.rocket_palette = orig_rocket.rocket_palette
	target_rocket:SetPos(orig_rocket:GetVisualPos())
	target_rocket:SetAngle(orig_rocket:GetVisualAngle())
	target_rocket:SetAnim(1, orig_rocket:GetAnim(1))
	target_rocket:SetAnimPhase(1, orig_rocket:GetAnimPhase(1))
	target_rocket:SetUIWorkRadius(orig_rocket.UIWorkRadius)
	target_rocket.name = orig_rocket.name
	target_rocket.rocket_palette = orig_rocket.rocket_palette
	target_rocket:SetPalette(DecodePalette(target_rocket.rocket_palette))
	target_rocket.display_icon = orig_rocket.display_icon
	target_rocket.landing_site = orig_rocket.landing_site
	orig_rocket.landing_site = nil
	target_rocket.is_pinned = orig_rocket.is_pinned
	if target_rocket:IsPinned() ~= target_rocket.is_pinned then
		target_rocket:TogglePin("force", true)
	end
	target_rocket.priority = orig_rocket.priority
	target_rocket.allow_export = orig_rocket.allow_export -- only relevant for restoring
			
	if not IsKindOf(target_rocket, "RocketExpedition") then
		target_rocket:ResetDemandRequests() -- make sure export/unload requests match allow_export setting
	end
			
	-- fuel
	local unload_fuel = orig_rocket.unload_fuel_request and orig_rocket.unload_fuel_request:GetActualAmount() or 0
	local fuel = orig_rocket.refuel_request and (orig_rocket.launch_fuel - orig_rocket.refuel_request:GetActualAmount()) or 0
	local diff = target_rocket.launch_fuel - (Max(0, fuel) + unload_fuel)
	
	target_rocket.refuel_request:SetAmount(Max(diff, 0))
	
	if diff < 0 then
		local unit_count = 1 + (-diff / (const.ResourceScale * 10)) --1 per 10
		target_rocket.unload_fuel_request = target_rocket:AddSupplyRequest("Fuel", -diff, 0, unit_count)			
	end
		
	-- cargo
	local cargo = {}
	
	-- stored resources
	for _, res in ipairs(orig_rocket.storable_resources) do
		cargo[res] = orig_rocket:GetStoredAmount(res)
	end
	-- export requests
	for _, req in ipairs(orig_rocket.export_requests or empty_table) do
		local amount
		local res = req:GetResource()
		if IsKindOf(orig_rocket, "RocketExpedition") then
			amount = orig_rocket["GetExportAmount_"..res](orig_rocket)
		else
			amount = orig_rocket.max_export_storage - req:GetActualAmount()
		end
		cargo[res] = (cargo[res] or 0) + amount
	end
	-- unload request (if any)
	if orig_rocket.unload_request then
		local res = orig_rocket.unload_request:GetResource()
		local amount = orig_rocket.unload_request:GetActualAmount()
		cargo[res] = (cargo[res] or 0) + amount
	end
	
	-- transfer cargo to target rocket
	for res, amount in pairs(cargo) do
		if table.find(target_rocket.storable_resources, res) then
			target_rocket:AddResource(amount, res)
		elseif res == "PreciousMetals" then
			if target_rocket.allow_export then
				-- carry in export request
				local export_requests = target_rocket.export_requests
				local new_amount = Max(0, target_rocket.max_export_storage - amount)
				if export_requests then
					-- don't create a new request
					export_requests[1]:SetAmount(new_amount)
				else
					local unit_count = target_rocket:GetRequestUnitCount(target_rocket.max_export_storage)
					target_rocket.export_requests = { target_rocket:AddDemandRequest(res, new_amount, 0, unit_count) }
				end
				-- calculate remaining amount
				amount = Max(0, amount - target_rocket.max_export_storage)
			end
			if amount > 0 then
				-- carry in unload request
				local unit_count = target_rocket:GetRequestUnitCount(amount)
				target_rocket.unload_request = target_rocket:AddSupplyRequest(res, amount, 0, unit_count)
			end
		else
			assert(false, "unexpected resource: " .. res)
		end
	end
		
	orig_rocket:ClearAllResources() -- so it doesn't leave them in stockpiles when deleted	
	
	-- controlled drones
	for i = #(orig_rocket.drones or empty_table), 1, -1 do
		local drone = orig_rocket.drones[i]
		drone:DropCarriedResource()
		drone:SetCommandCenter(target_rocket)
	end
	if connect_cc then
		assert(not table.find(g_LandedRocketsInNeedOfFuel, target_rocket))
		table.insert(g_LandedRocketsInNeedOfFuel, target_rocket)
		target_rocket:StartDroneControl()
	end
	if orig_rocket == SelectedObj then
		SelectObj(target_rocket)
	end
	DoneObject(orig_rocket)
end

function RocketExpedition:SetTradeAmount(val)
	local prev_amount = self.TradeAmount
	if val == prev_amount then
		return
	end
	self.TradeAmount = val
	assert(self:CanChangeTradeAmount())
	
	-- update requests/own amounts	
	for _, req in ipairs(self.export_requests or empty_table) do
		local res = req:GetResource()
		if self.expedition.export[res] then
			local export = prev_amount - req:GetActualAmount()
			local stored = self:GetStoredAmount(res)
			local loaded = export + stored
			
			local needed = Max(0, val - loaded)
			local excess = Max(0, loaded - val)
			
			req:SetAmount(needed)
			self:AddResource(excess - stored, res)
		end
	end
end

function RocketExpedition:CanChangeTradeAmount()
	return self.expedition and self.expedition.route_id and self.command == "ExpeditionRefuelAndLoad"
end

function RocketExpedition:ExpeditionRefuelAndLoad() -- handle fuel and resources
	assert(self.expedition)
	
	if self.expedition.route_id then
		self.description = T{11223, "This Rocket is servicing a trade route with a Rival Colony. As long as the trade route exists, it'll keep exchanging resources."}
	else
		self.description = T{11224, "This Rocket is going to analyze a Planetary Anomaly."}
	end
	
	self:AttachSign(true, "SignExpeditionRocket")
	
	-- go over the list of required exports, check current cargo, create export requests
	local export = self.expedition.export or empty_table
	for res, param in pairs(export) do		
		local stored, unload = self:GetStoredAmount(res)
		local amount = self.expedition.route_id and self.TradeAmount or param
		if stored > 0 then
			local transfer = Min(stored, amount)
			amount = amount - transfer
			self:AddResource(-transfer, res)
		end
		
		if amount > 0 then
			if not self.export_requests then
				local unit_count = 1 + (amount / (const.ResourceScale * 10)) --1 per 10
				self.export_requests = {self:AddDemandRequest(res, amount, 0, unit_count)}
			else
				assert(res == self.export_requests[1]:GetResource())
				self.export_requests[1]:SetAmount(amount)
			end			
		end
	end
	
	assert(not table.find(g_LandedRocketsInNeedOfFuel, self))
	table.insert(g_LandedRocketsInNeedOfFuel, self)
	self:StartDroneControl()
	
	-- wait refuel to finish
	while not self:HasEnoughFuelToLaunch() do
		WaitMsg("RocketRefueled")
	end

	-- wait for the required resoures to be loaded and for the extra fuel and stored resources to be unloaded
	while self:HasExtraFuel() or self:HasCargoSpaceLeft() or self:GetStoredAmount() > 0 do
		self:WaitForResources()
	end
		
	-- wait the excess resources to be unloaded
	while true do
		local issue = self:GetLaunchIssue("skip flight ban")
		if not issue then break end
		self:WaitForResources()
	end
	
	self:SetCommand(self.expedition.route_id and "Takeoff" or "ExpeditionPrepare")
end

function RocketExpedition:ExpeditionLoadRover(label)
	local rover
	while not self.expedition.rover do
		local list = self.city.labels[label] or empty_table
		local dist
		for _, unit in ipairs(list) do
			if unit:CanBeControlled() and unit.command == "Idle" then
				local d = self:GetDist2D(unit)
				if not dist or d < dist then
					rover, dist = unit, d
				end
			end
		end
		
		if rover then
			self.rover_summon_fail = nil
			ObjModified(self)
			
			if rover == SelectedObj then
				SelectObj()
			end			
			self.expedition.rover = rover
			rover:SetHolder(self)
			rover:SetCommand("Disappear", "keep in holder")
		else
			self.rover_summon_fail = true
			ObjModified(self)
			Sleep(1000)
		end			
	end
	ObjModified(self)
end

function RocketExpedition:ExpeditionPickDroneFrom(controller, picked)
	local drone
	for _, d in ipairs(controller.drones or empty_table) do
		if d:CanBeControlled() and not table.find(picked, d) then
			if not drone or drone.command ~= "Idle" and d.command == "Idle" then -- prefer idling drones
				drone = d
			end
		end
	end
	return drone
end

function RocketExpedition:ExpeditionLoadDrones(num_drones)
	while true do
		-- wait to have enough drones
		local drones = {}
		
		-- prefer own drones first
		while #drones < num_drones and #(self.drones or empty_table) > 0 do
			local drone = self:ExpeditionPickDroneFrom(self, drones)
			if not drone then
				break
			end
			table.insert(drones, drone)
		end
		
		-- pick from other drone controllers
		local list = table.copy(UICity.labels.DroneControl or empty_table)
		local idx = 1
		while #drones < num_drones and #list > 0 do
			local drone = self:ExpeditionPickDroneFrom(list[idx], drones)
			if drone then
				table.insert(drones, drone)
				idx = idx + 1
			else
				table.remove(list, idx)
			end			
			if idx > #list then
				idx = 1
			end
		end
		
		self.drone_summon_fail = #drones < num_drones
		ObjModified(self)
		if #drones >= num_drones then
			for _, drone in ipairs(drones) do
				if drone == SelectedObj then
					SelectObj()
				end
				drone:SetHolder(self)
				drone:SetCommand("Disappear", "keep in holder")						
			end
			self.expedition.drones = drones
			break
		else
			Sleep(1000)
		end
	end
end

function RocketExpedition:ExpeditionGatherCrew(num_crew, label)
	label = label or "Colonist"
	while true do	
		local adult_filter = function(i, col) return not col.traits.Child end
		local list = self.city.labels[label] and table.ifilter(self.city.labels[label], adult_filter) or empty_table
		
		
		self.colonist_summon_fail = #list < num_crew
		ObjModified(self)
		
		if #list >= num_crew then
			self.expedition.crew = {}
			while #self.expedition.crew < num_crew do
				local unit = table.rand(list, InteractionRand("PickCrew"))
				table.remove_value(list, unit)
				table.insert(self.expedition.crew, unit)
				if unit == SelectedObj then
					SelectObj()
				end
				unit:SetHolder(self)
				unit:SetCommand("Disappear", "keep in holder")			
			end			
			break
		else
			Sleep(1000)
		end		
	end
end

function RocketExpedition:ExpeditionPrepare()	-- gather mechs and crew
	assert(self.expedition)
	self:PushDestructor(function(self)
		while #self.boarding > 0 do
			Sleep(1000)
		end
		
		self.departures = nil
		self.boarding = nil
	end, self)
	
	self.boarding = {}
	self.departures = {}
	-- load vehicles
	
	-- pick the nearest rover of the specified type (if any)
	if self.expedition.rover_type then
		self:ExpeditionLoadRover(self.expedition.rover_type)
	end
	
	-- pick the required number of drones uniformly from hubs in range
	if (self.expedition.num_drones or 0) > 0 then
		self:ExpeditionLoadDrones(self.expedition.num_drones)
	end	
	
	-- wait to have enough potential crew, set command, wait them to board
	if self.expedition.num_crew then
		self:ExpeditionGatherCrew(self.expedition.num_crew, self.expedition.crew_specialization)
	end
	
	-- recheck launch issues
	while true do
		local issue = self:GetLaunchIssue("skip flight ban")
		if not issue then break end
		Sleep(1000)
	end
			
	-- proceed to launch
	self:SetCommand("Takeoff")
end

function RocketExpedition:CheatLaunch()
	self:SetCommand("Takeoff")
end

DefineStoryBitTrigger("ExpeditionSent", "ExpeditionSent")

function RocketExpedition:Takeoff()
	self:AttachSign(false, "SignExpeditionRocket")
	if self.expedition.anomaly then
		self.expedition.anomaly.scanned_by = self.city
		
		ClearContestNotifications("anomaly", self.expedition.anomaly)
	end
	
	-- slightly different takeoff sequence
	self:UpdateStatus("countdown")
	self:InterruptIncomingDronesAndDisconnect()
	self:CloseDoor()
	
	self:UpdateStatus("takeoff")
	if SelectedObj == self then
		SelectObj(false)
	end
	if not self.auto_export then
		self:ClearEnumFlags(const.efSelectable)
	end
	
	self.bonus_sleep_time = false
	self.total_pause_time = false
	
	self:AbandonAllDrones("do_not_orphan")
	self:ResetDemandRequests(self.expedition.route_id and "skip_exports")
	
	--@@@msg RocketLaunched,rocket - fired when a rocket takes off from Mars
	Msg("RocketLaunched", self)
	
	--self.cargo = nil
	local pt = self:GetPos()
	local dest = pt + point(0, 0, self.orbital_altitude)
	
	PlayFX("RocketEngine", "start", self)
	Sleep(self.warm_up)
	
	local has_pad = IsValid(self.landing_site) and IsValid(self.landing_site.landing_pad)
	if not has_pad then
		self:PlaceEngineDecal(pt, 0)
	end
	
	PlayFX("RocketEngine", "end", self)
	PlayFX("RocketLaunch", "start", self)
	local a, t = self:GetAccelerationAndTime(dest, self.orbital_velocity, 0)
	
	if not has_pad then
		self:StartDustThread(self.total_launch_dust_amount)
	end
	self:SetAcceleration(a)
	self:SetPos(dest, t)

	Sleep(t)
	if IsValid(self.landing_site) and not self.auto_export then
		DoneObject(self.landing_site)
		self.landing_site = nil
	else
		self.reserved_site = true
		if not IsValid(self.site_particle) then
			self.site_particle = PlaceParticles("Rocket_Pos")
			self.site_particle:SetPos(pt)
			self.site_particle:SetScale(200)
		end
	end
	if not IsValid(self) then return end
	PlayFX("RocketLaunch", "end", self)
	
	self:ClearEnumFlags(const.efVisible)
	
	if not self.expedition.canceled then
		Msg("ExpeditionSent", self.expedition.anomaly)
	end
	self:SetCommand(self.expedition.canceled and "WaitInOrbit" or "ExpeditionExecute")
end

function RocketExpedition:AddExpeditionTime(t)
	self.bonus_sleep_time = (self.bonus_sleep_time or 0) + t
	if self.expedition_return_time then
		self.expedition_return_time = self.expedition_return_time + t
	end
end

function RocketExpedition:PauseExpedition()
	if not self.is_paused then
		self.is_paused = GameTime()
	end
end

function RocketExpedition:ResumeExpedition()
	if self.is_paused then
		self.total_pause_time = (self.total_pause_time or 0) + GameTime() - self.is_paused
		if self.expedition_return_time then
			self.expedition_return_time = self.expedition_return_time + self.total_pause_time
		end
		if self.expedition_start_time then
			self.expedition_start_time = self.expedition_start_time + self.total_pause_time
		end
		self.is_paused = false
		if self.command == "ExpeditionExecute" then
			Wakeup(self.command_thread)
		end
	end
end

function RocketExpedition:GetTotalBonusSleepTime()
	local bonus_time = (self.bonus_sleep_time or 0) + (self.total_pause_time or 0)
	self.bonus_sleep_time = false
	self.total_pause_time = false
	return bonus_time
end
local pause_tick_time = 5000
function RocketExpedition:ExpeditionSleep(s_t, can_cancel)
	local is_pause_tick = false
	while s_t > 0 do
		-- expedition time + bonus time + pause (in loop)
		local remainder = s_t
		local start_ts = GameTime()
		if WaitWakeup(s_t) and not is_pause_tick then
			remainder = remainder - (GameTime() - start_ts)
		else
			remainder = 0
		end
		is_pause_tick = false
		s_t = remainder + self:GetTotalBonusSleepTime()
		if not self.is_paused and can_cancel and self.expedition.canceled then
			break
		end
		if self.is_paused and s_t == 0 then
			s_t = pause_tick_time
			is_pause_tick = true
		end
	end
end

function RocketExpedition:ExpeditionExecute()
	-- sleep while "working"
	self:PushDestructor(function(self)
		self.expedition_start_time = nil
		self.expedition_return_time = nil
	end, self)
	if self:IsValidPos() then
		self:DetachFromMap()
	end
	
	if self.expedition.route_id then
		self:UpdateStatus("trade export")
	elseif self.expedition.anomaly then
		self:UpdateStatus("mission")
	elseif self.expedition.task or self.expedition.help_rocket then
		self:UpdateStatus("task")
	end
	
	local bonus_time = self:GetTotalBonusSleepTime()
	self.expedition_start_time = GameTime()
	self.expedition_return_time = GameTime() + self.ExpeditionTime + bonus_time --+btime during launch
	self:ExpeditionSleep(self.ExpeditionTime + bonus_time)
	
	if self.expedition.canceled then
		if self.expedition.anomaly then
			self:UpdateStatus("mission return")
		end
		-- sleep for a while to create impression of travel
		bonus_time = self:GetTotalBonusSleepTime()
		self.expedition_start_time = GameTime()
		self.expedition_return_time = GameTime() + self.ReturnTime + bonus_time --sleep got woken up, reset this
		self:ExpeditionSleep(self.ReturnTime + bonus_time, true) -- + pause (in loop)
		self:SetCommand("WaitInOrbit")
	end
	
	-- get rewards, dump resources, etc.
	if self.expedition.route_id then
		local route = self.expedition.route
		local ai = RivalAIs[route.sponsor]
		local res = self.expedition.import_resource
		local qty = self.expedition.import_quantity
		for r, _ in pairs(self.expedition.export) do
			local amount = MulDivRound(self.TradeAmount, qty, const.ResourceScale)
			if res == "Research" then
				self.city:AddResearchPoints(amount)
			elseif res == "funding" then
				self.city:ChangeFunding(amount, "trade")
				ai.resources.funding = ai.resources.funding - DivRound(amount, const.Scale.mil)
			elseif table.find(self.storable_resources, res) then
				self:AddResource(amount, res)
				self.cargo = self.cargo or {}
				table.insert(self.cargo, { class = res, amount = amount/const.ResourceScale }) -- for ui purposes
				local ai_export = res:lower()
				ai.resources[ai_export] = ai.resources[ai_export] - DivRound(amount, const.ResourceScale)
			end
			local ai_import = r:lower()
			ai.resources[ai_import] = ai.resources[ai_import] + DivRound(self.TradeAmount, const.ResourceScale)
		end
		
		for _, req in ipairs(self.export_requests or empty_table) do
			req:SetAmount(self.TradeAmount)
		end
		if ai then
			ai.resources.standing = ai.resources.standing + route.standing_bonus
		end
	elseif self.expedition.anomaly then
		assert(self.expedition.anomaly.scanned_by == self.city)
		self.expedition.anomaly:Scan(self)
	elseif self.expedition.task then
		self.expedition.task:Execute(self)
	elseif self.expedition.help_rocket then
		local params = self.expedition
		local ai = params.rivalai_player
		for res, amount in pairs(params.export) do
			local ai_res = string.lower(res)
			ai.resources[ai_res] =  ai.resources[ai_res] + amount/const.ResourceScale
		end
		ai.resources.standing = ai.resources.standing + params.standing_change
	end
	
	-- fake the expedition crew as cargo
	self.cargo = self.cargo or {}
	if self.expedition.rover then
		table.insert(self.cargo, { class = self.expedition.rover.class, amount = 1 })
	end
	if #(self.expedition.drones or empty_table) > 0 then
		table.insert(self.cargo, { class = self.expedition.drones[1].class, amount = #self.expedition.drones })
	end
	if #(self.expedition.crew or empty_table) > 0 then
		table.insert(self.cargo, { class = "Passengers", amount = #self.expedition.crew })
	end
	
	if self.expedition.route_id then
		self:UpdateStatus("trade import")
	elseif self.expedition.anomaly then
		self:UpdateStatus("mission return")
	elseif self.expedition.task or self.expedition.help_rocket then
		self:UpdateStatus("task return")
	end
	
	bonus_time = self:GetTotalBonusSleepTime()
	self.expedition_start_time = GameTime()
	self.expedition_return_time = GameTime() + self.ReturnTime + bonus_time
	self:ExpeditionSleep(self.ReturnTime + bonus_time) -- + pause (in loop)
	Msg("ExpeditionReturned", self)
	self:SetCommand("WaitInOrbit")
end

DefineStoryBitTrigger("ExpeditionReturned", "ExpeditionReturned")

function RocketExpedition:ExpeditionCancel()
	assert(self.expedition)
	if self.expedition.canceled then return end
	
	self.expedition.canceled = true
	ObjModified(self)
	if self.launch_valid_cmd[self.command] then
		self:SetCommand("Unload", "cancel")
	elseif self.command == "ExpeditionExecute" then
		Wakeup(self.command_thread)
	end
end

function RocketExpedition:CanCancel()
	return self.launch_valid_cmd[self.command] and self.expedition and not self.expedition.canceled
end

function RocketExpedition:LandOnMars(...)
	self.cargo = nil -- no longer needed
	SupplyRocket.LandOnMars(self, ...)
end

function RocketExpedition:Unload(cancel_expedition)
	if not cancel_expedition then
		self:OpenDoor()
	end
	
	while self:IsCargoRampInUse() do
		Sleep(100)
	end
	
	if self.expedition.rover then
		-- play disembark anim for rover & leave it alone
		local rover = self.expedition.rover

		local out = self:GetSpotPos(self:GetSpotBeginIndex("Roverout"))
		local angle = self:GetAngle()
		local def_out_1 = out + SetLen((out - self:GetPos()):SetZ(0), 25*guim)

		self.placement = self.placement or {}
		local out_1 = GetPassablePointNearby(def_out_1, rover.pfclass)
		out_1 = self:PlaceAdjacent(rover, out_1 or def_out_1)
		out = GetPassablePointNearby(out, rover.pfclass) or out
		rover:Appear()
		Sleep(1)
		if not IsValid(self) then return end
		rover:SetCommand(false)
		self:PlaceAdjacent(rover, out)
		rover:SetGameFlags(const.gofSpecialOrientMode)
		rover:SetAngle(angle)
		rover:SetPos(out)
		rover:SetAnim(1, "disembarkUnload2", const.eDontCrossfade)
		Sleep(rover:TimeToAnimEnd())
		
		rover.override_ui_status = nil
		rover:SetHolder(false)
		rover:SetCommand("Idle")
	end
	
	if #(self.expedition.drones or "") > 0 and not self.waypoint_chains then
		WaypointsObj.BuildWaypointChains(self)
	end
	local spawn_pos = self:GetSpotLoc(self:GetSpotBeginIndex(self.drone_spawn_spot))
	for i, drone in ipairs(self.expedition.drones or empty_table) do
		-- adopt the drones and lead them out
		drone:Appear()
		table.insert_unique(self.drones_exiting, drone) -- insert immediately so the check below doesn't skip them
		drone:SetCommandCenter(self)
		drone:SetPos(spawn_pos)
		CreateGameTimeThread(function(self, drone, delay)
			Sleep(delay)
			if IsValid(drone) then
				drone:SetCommand("Embark")
				self:LeadOut(drone)
				table.remove_value(self.expedition.drones, drone)
				ObjModified(self)
				if not IsValid(drone) then return end
				local pt
				if IsValid(self) then
					pt = self:PickArrivalPos(false, false, 30*guim, 10*guim, 90*60, -90*60)
				else
					pt = self:PickArrivalPos(drone:GetPos(), point(guim, 0, 0), 30*guim, 10*guim, 180*60, -180*60)
				end
				Movable.Goto(drone, pt) -- Unit.Goto is a command, use this instead for direct control
				drone:SetCommand(IsValid(self) and "GoHome" or "Idle")
			end
		end, self, drone, i*600)
	end
	
	-- wait for drones to finish disembarking
	while #(self.drones_exiting or empty_table) > 0 do
		Sleep(100)
	end
	
	local domes, safety_dome = GetDomesInWalkableDistance(self.city, self:GetPos())
	local crew = self.expedition.crew
	for i = #crew, 1, -1 do
		-- disembark colonists & leave them to their affairs
		local unit = crew[i]
		unit:Appear(self)
		unit:SetCommand("ReturnFromExpedition", self, ChooseDome(unit.traits, domes, safety_dome))
		-- sleep to avoid all colonists disembarking at once
		Sleep(1000 + Random(0, 500))
	end
	
	-- wait for colonists to finish disembarking
	while #(self.expedition.crew or empty_table) > 0 do
		Sleep(1000)
	end

	-- make sure refuel request matches launch_fuel in case it was modified in the mean time
	self.refuel_request:ResetAmount(self.launch_fuel)

	if not cancel_expedition and self.expedition.route_id and self.auto_export then
		if MarsTradeRoutes[self.expedition.route_id] then
			self:SetCommand("ExpeditionRefuelAndLoad")
			return
		end
	end
	
	self.expedition = nil
	local rocket = PlaceBuilding(GetRocketClass(), {city = self.city})
	Sleep(1) -- allow GameInit because RefurbishRocket is called in our command thread (immediately)
	self:RefurbishRocket(self, rocket, true)
	rocket:SetCommand("Refuel", "initialized")
end

function RocketExpedition:KillExpedition()
	local e = self.expedition
	if IsValid(e.rover) then
		DoneObject(e.rover)
	end
	local c = e.crew
	if c and #c > 0 then
		for i = #c, 1, -1 do
			DoneObject(c[i])
		end
	end
	c = e.drones
	if c and #c > 0 then
		for i = #c, 1, -1 do
			DoneObject(c[i])
		end
	end
	if self.expedition.anomaly then
		self.expedition.anomaly.rocket = nil
		if self.expedition.anomaly.scanned_by == self.city then
			self.expedition.anomaly.scanned_by = nil
		end
	end
	DoneObject(self)
end

function RocketExpedition:OnPinClicked(gamepad)
	if self.command == "ExpeditionExecute" then
		return true
	end
	return SupplyRocket.OnPinClicked(self, gamepad)
end

function RocketExpedition:AppendCargo(resource, amount)
	local max = self:GetEmptyStorage(resource)
	amount = Clamp(amount, 0, max)
	if amount <= 0 then return end
	self:AddResource(amount, resource)
	local idx = table.find(self.cargo, "class", resource)
	if idx then
		self.cargo[idx].amount = self.cargo[idx].amount + amount / const.ResourceScale
	else
		self.cargo = table.insert(self.cargo or {}, 
					{ class = resource, amount = amount / const.ResourceScale }) -- for UI purposes only
	end
end

function RocketExpedition:IsWaitingForCrew()
	return (self:GetCrewTarget_Rover() == 1 and self:GetCrew_Rover() == 0) or
		(self:GetCrewTarget_Drones() ~= self:GetCrew_Drones()) or
		(self:GetCrew_TargetNum() ~= self:GetCrew_Num())
end

function RocketExpedition:IsBoardingAllowed()
	return self.launch_valid_cmd[self.command] and not (self.expedition and self.expedition.canceled)
end

function RocketExpedition:IsRefueling()
	return self.command == "ExpeditionRefuelAndLoad"
end

function RocketExpedition:GetCrew_Drones()
	return self.expedition and #(self.expedition.drones or empty_table)
end
function RocketExpedition:GetCrewTarget_Drones()
	return self.expedition and self.expedition.num_drones or 0
end
function RocketExpedition:GetCrew_Rover()
	return (self.expedition and self.expedition.rover) and 1 or 0
end
function RocketExpedition:GetCrewTarget_Rover()
	return (self.expedition and self.expedition.rover_type) and 1 or 0
end
function RocketExpedition:GetCrewRoverType()
	local classdef = g_Classes[self.expedition and self.expedition.rover_type]
	return classdef and classdef.display_name or ""
end
function RocketExpedition:GetCrew_Num()
	return self.expedition and #(self.expedition.crew or empty_table)
end
function RocketExpedition:GetCrew_TargetNum()
	return self.expedition and self.expedition.num_crew or 0
end
function RocketExpedition:GetCrew_Specialization()
	local spec = self.expedition and self.expedition.crew_specialization and const.ColonistSpecialization[self.expedition.crew_specialization]
	return spec and spec.display_name or T{4290, "Colonist"}
end
function RocketExpedition:GetUIRocketStatus(first_only)
	if self.command == "LandOnMars" then
		return T{7897, "<green>Landing</green>"}
	end
	if self.command == "Unload" then
		return T{7898, "<green>Unloading cargo</green>"}
	end
	if self.command == "Takeoff" or (self.command == "ExpeditionPrepare" and not self:IsWaitingForCrew()) then
		return T{289, "Take-off in progress"}
	end
	if self.status == "mission" then
		return T{11228, "Flying to a Planetary Anomaly"}
	end
	if self.status == "mission return" then
		return T{11229, "Returning from a Planetary Anomaly"}
	end
	if self.command == "ExpeditionExecute" then
		return T{4321, "On an expedition"}
	end
	local extra = self.unload_fuel_request and self.unload_fuel_request:GetActualAmount() or 0	
	local items = {}
	
	if not self:HasEnoughFuelToLaunch() and self.launch_fuel ~=0 then
		items[#items + 1] = T{285, "Refueling<right><current>/<fuel(launch_fuel)>", current = (self.launch_fuel - self.refuel_request:GetActualAmount() + extra) / const.ResourceScale, self}
	end
	if self:HasCargoSpaceLeft() or self:IsWaitingForCrew() then
		if self.expedition and self.expedition.route_id then
			items[#items + 1] = T{11661, "<em>Waiting export resource to be loaded</em>"}
		else
			items[#items + 1] = T{11410, "<em>Waiting for required payload to arrive</em>"}
		end
	end
	if self:GetStoredAmount() > 0 or self:HasExtraFuel() then
		items[#items + 1] = T{283, "<em>Waiting to unload unnecessary cargo</em>"}
	end
	if first_only then
		return items[1] or ""
	end
	return table.concat(items, "<newline><left>")
end
function RocketExpedition:GetArrivalTimePercent()
	if not self.expedition_start_time or not self.expedition_return_time then
		return 0
	end
	if self.is_paused then
		return 0
	end
	
	local duration = self.expedition_return_time - self.expedition_start_time
	local t = GameTime() - self.expedition_start_time

	return Clamp(MulDivRound(t, 100, duration), 0, 100)
end
function RocketExpedition:GetUIWarning()
	if not self.expedition then
		return
	end
	
	if self.rover_summon_fail then
		return T{11471, "No free rover"}
	elseif self.drone_summon_fail then
		return T{11472, "Not enough Drones"}
	elseif self.colonist_summon_fail then
		return T{11473, "Not enough Colonists"}
	end	
end
---------------- UI status funcs ----------------
function RocketExpedition:UIStatusTradeExport(template)
	self.pin_blink = false
	self.pin_rollover = T{11225, "Exporting <resource(amount,res)> to Rival Colony", amount = self.TradeAmount, res = self.export_requests[1]:GetResource()}
	if self.is_paused then
		self.pin_summary1 = T{11226, "Awaiting further instructions"}
	else
		self.pin_summary1 = T{708, "<ArrivalTimePercent>%"}
	end
	self.pin_rollover_hint = ""
	self.pin_rollover_hint_xbox = ""
	self.pin_status_img = "UI/Icons/pin_rocket_outgoing.tga"
	self:TogglePin("force", true)
	self.is_demolishable_state = false
	self.can_change_skin = false
end
function RocketExpedition:UIStatusTradeImport(template)
	self.pin_blink = false
	local route_id = self.expedition and self.expedition.route_id
	local route = route_id and MarsTradeRoutes[route_id]
	if route and route.export ~= "funding" and route.export ~= "Research" then
		local amount = self["GetStored_"..route.export](self)
		self.pin_rollover = T{11456, "Returning from Rival Colony with <resource(num, res)>", num = amount, res = route.export}
	else
		self.pin_rollover = T{11227, "Returning from Rival Colony"}
	end
	if self.is_paused then
		self.pin_summary1 = T{11226, "Awaiting further instructions"}
	else
		self.pin_summary1 = T{708, "<ArrivalTimePercent>%"}
	end
	self.pin_rollover_hint = ""
	self.pin_rollover_hint_xbox = ""
	self.pin_status_img = "UI/Icons/pin_rocket_incoming.tga"
	self:TogglePin("force", true)
	self.is_demolishable_state = false
	self.can_change_skin = false
end
function RocketExpedition:UIStatusMission(template)
	self.pin_blink = false
	self.pin_rollover = T{11228, "Flying to a Planetary Anomaly"}
	if self.is_paused then
		self.pin_summary1 = T{11226, "Awaiting further instructions"}
	else
		self.pin_summary1 = T{708, "<ArrivalTimePercent>%"}
	end
	self.pin_rollover_hint = ""
	self.pin_rollover_hint_xbox = ""
	self.pin_status_img = "UI/Icons/pin_rocket_outgoing.tga"
	self:TogglePin("force", true)
	self.is_demolishable_state = false
	self.can_change_skin = false
end
function RocketExpedition:UIStatusMissionReturn(template)
	self.pin_blink = false
	self.pin_rollover = T{11229, "Returning from a Planetary Anomaly"}
	if self.is_paused then
		self.pin_summary1 = T{11226, "Awaiting further instructions"}
	else
		self.pin_summary1 = T{708, "<ArrivalTimePercent>%"}
	end
	self.pin_rollover_hint = ""
	self.pin_rollover_hint_xbox = ""
	self.pin_status_img = "UI/Icons/pin_rocket_incoming.tga"
	self:TogglePin("force", true)
	self.is_demolishable_state = false
	self.can_change_skin = false
end
function RocketExpedition:UIStatusTask(template)
	self.pin_blink = false
	local name  = self.expedition.help_rocket and self.expedition.rivalai_player:GetDisplayName() or self.expedition.task.target_player.display_name
	self.pin_rollover = T{11572, "Flying to the Colony of <rival>", rival = name}
	if self.is_paused then
		self.pin_summary1 = T{11226, "Awaiting further instructions"}
	else
		self.pin_summary1 = T{708, "<ArrivalTimePercent>%"}
	end
	self.pin_rollover_hint = ""
	self.pin_rollover_hint_xbox = ""
	self.pin_status_img = "UI/Icons/pin_rocket_outgoing.tga"
	self:TogglePin("force", true)
	self.is_demolishable_state = false
	self.can_change_skin = false
end
function RocketExpedition:UIStatusTaskReturn(template)
	self.pin_blink = false
	local name  = self.expedition.help_rocket and self.expedition.rivalai_player:GetDisplayName() or self.expedition.task.target_player.display_name
	self.pin_rollover = T{11573, "Returning from the Colony of <rival>", rival = name}
	if self.is_paused then
		self.pin_summary1 = T{11226, "Awaiting further instructions"}
	else
		self.pin_summary1 = T{708, "<ArrivalTimePercent>%"}
	end
	self.pin_rollover_hint = ""
	self.pin_rollover_hint_xbox = ""
	self.pin_status_img = "UI/Icons/pin_rocket_incoming.tga"
	self:TogglePin("force", true)
	self.is_demolishable_state = false
	self.can_change_skin = false
end
---------------- End UI status funcs ----------------

GlobalVar("MannedExpeditionTasks", {})
GlobalVar("MannedExpeditionTaskNextId", 1)

DefineClass.MannedExpeditionTask = {
	__parents = {"InitDone"},
	id = false,
	description = false, -- shown in rocket infopanel
	num_crew = 0,
	crew_specialization = false,
	target_player = false,
}

function MannedExpeditionTask:Init()
	self.id = MannedExpeditionTaskNextId
	MannedExpeditionTaskNextId = MannedExpeditionTaskNextId + 1
	assert(not MannedExpeditionTasks[self.id])
	MannedExpeditionTasks[self.id] = self
end

function MannedExpeditionTask:Done()
	MannedExpeditionTasks[self.id] = nil
end

function MannedExpeditionTask:Execute(rocket)
end

-----------------------------------------------------------------
