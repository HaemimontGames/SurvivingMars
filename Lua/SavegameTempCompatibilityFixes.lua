--TEMP, save support

function ExplorationTick(city)
	return city:ExplorationTick()
end

function OnMsg.ClassesPreprocess()
	Drone.GetResourceUnit = function(self, resource)
		return DroneResourceUnits[resource]
	end
	Building.OnUnitLeadOut = empty_func
	Building.OnUnitLeadOutEnd = empty_func
	Unit.OnLeadOutEnd = empty_func
	Unit.lead_in_out_interrupt_command = false
	SupplyRocket.DroneEnter = function(self, ...) return self:LeadIn(...) end
	SupplyRocket.DroneExit = function(self, ...) return self:LeadOut(...) end
	ValidateWorkplace = ValidateBuilding
	Colonist.ForceDie = function(self, reason)
		self:SetCommand("Die", reason)
	end
	Dome.OnEnterDome = function(self, unit)
		unit:OnEnterDome(self)
	end
	Dome.OnExitDome = function(self, unit)
		unit:OnExitDome(self)
	end
	GetXDialog = GetDialog
end

g_TotalWorkingShuttleCount = 0

-- required to load savegames before rev 226900
function OnMsg.ClassesGenerate()
function Unit:ApproachBuilding(building, entrance_type, spot_name)
	return true
end
end

function FixResearch(city,lua_revision)
	local status = city.tech_status
	if not status then
		city:InitResearch()
		return
	end
	--rename '_new' ids
	local change_id = lua_revision < 225632 and lua_revision >= 224610
	
	for tech_id in pairs(status) do
		if not TechDef[tech_id] then
			if change_id then
				local id, count = string.gsub(tech_id, "_new$", "")
				if count>0 then
					status[id] = table.copy(status[tech_id])
				end	
			end
			status[tech_id] = nil
		end
	end
	
	local queue = city.research_queue or ""
	for i=#queue,1,-1 do
		if not TechDef[queue[i]] then
			if change_id then
				local id, count = string.gsub(tech_id, "_new$", "")
				if count>0 then
					queue[i] = id
				else	
					table.remove(queue, i)	
				end	
			else
				table.remove(queue, i)
			end
		end
	end
	local fileds = city.tech_field
	for filed_id, list in sorted_pairs(fileds) do
		for i=#list,1,-1 do
			local tech_id = list[i]
			local def = TechDef[tech_id]
			local new_field = def and def.group
			if new_field ~= filed_id then
				table.remove(list, i)
				if new_field then
					table.insert(fileds[new_field], tech_id)
				end
			end
		end
	end
	
	if lua_revision < 227342 then
		for tech_id, info in pairs(status) do
			if city:IsTechRepeatable(tech_id) then
				local cost = city:TechCost(tech_id)
				if info.points < 0 or cost <= 0 then
					info.points = 0
				else
					info.points = info.points % cost
				end
			end
		end
	end
	
	if lua_revision < 227626 then -- applied in day1 patch
		local scale = const.ResearchPointsScale
		for tech_id, info in pairs(status) do
			info.points = info.points * scale
		end
	end
end

function FixTechLocks(city)
	-- crops
	CropTechLocks = {}
	
	for crop, tech_t in sorted_pairs(CropTechRequirements) do
		for i = 1, #tech_t do
			if not city:IsTechResearched(tech_t[i]) then
				CropTechLocks[crop] = CropTechLocks[crop] or {}
				CropTechLocks[crop][ tech_t[i] ] = true
			end
		end
	end
	-- traits
	TraitLocks = {}
	
	for trait, tech_t in sorted_pairs(TraitTechRequirements) do
		for i = 1, #tech_t do
			if not city:IsTechResearched(tech_t[i]) then
				TraitLocks[crop] = TraitLocks[crop] or {}
				TraitLocks[crop][ tech_t[i] ] = true
			end
		end
	end
end

function FixRequestQueues(control)
	if not control then
		return
	end
	local removed = 0
	local function fix(queue)
		if type(queue) ~= "table" then
			return
		elseif Request_IsTask(queue[1]) then
			for i = #queue, 1, -1 do			
				local bld = queue[i]:GetBuilding()
				if not IsValid(bld) or bld.destroyed then
					removed = removed + 1
					table.remove(queue, i)
				end
			end
		else
			for _, q in pairs(queue) do
				fix(q)
			end
		end
	end
	fix{control.supply_queues, control.demand_queues, control:HasMember("priority_queue") and control.priority_queue}
	if removed > 0 then
		print("Removed", removed, "requesters from", control.class, "request queues")
	end
end

local function FixRocketUnload(label)
	local list = UICity.labels[label] or empty_table
	
	for _, rocket in ipairs(list) do
		local status = rocket.status
		if status == "refueling" or 
			status == "ready for launch" or 
			status == "ready for launch" or
			status == "launch suspended" or
			status == "countdown" then
			
			rocket.unloaded = true
		end
	end
end

local function FixRockets(lua_revision)
	MapForEach(true, 
		"SupplyRocket",
		function(rocket)
			rocket.city:AddToLabel("AllRockets", rocket)
		end)

	if lua_revision < 226416 then
		g_LandedRocketsInNeedOfFuel = g_LandedRocketsInNeedOfFuel or {}
		local controls = UICity.labels.DroneControl
		for i = 1, #controls do
			controls[i]:InitRocketRestrictors()
		end
		
		local exec = function (r)
			if r.refuel_request then
				r.refuel_request:AddFlags(const.rfRestrictorRocket)
			end
			if r.landed then
				table.insert(g_LandedRocketsInNeedOfFuel, r)
				if r.working and #r.command_centers > 0 then
					r:DisconnectFromCommandCenters()
					r:ConnectToCommandCenters()
				end
			end
		end
		MapForEach(true, "SupplyRocket", exec)
	end

	local list = UICity.labels.AllRockets or empty_table
		
	for _, rocket in ipairs(list) do
		if IsValid(rocket) and not rocket.command then
			local status = rocket.status or "on earth"
			if status == "on earth" then
				rocket:SetCommand("OnEarth")
			elseif status == "arriving" then
			 	local flight_time = rocket.custom_travel_time_mars or g_Consts.TravelTimeEarthMars
				rocket:SetCommand("FlyToMars", rocket.cargo, false, flight_time, false, rocket.arrival_time - flight_time)
			elseif status == "in orbit" or status == "suspended in orbit" then
				rocket:SetCommand("WaitInOrbit", rocket.orbit_arrive_time)
			elseif status == "refueling" then
				rocket:SetCommand("Refuel")
			elseif status == "ready for launch" or status == "launch suspended" then
				rocket:SetCommand("WaitLaunchOrder")
			elseif status == "countdown" then
				rocket:SetCommand("Countdown")
			elseif status == "departing" then
				local flight_time = rocket.custom_travel_time_earth or g_Consts.TravelTimeMarsEarth
				rocket:SetCommand("FlyToEarth", flight_time, rocket.arrival_time_earth - flight_time)
			elseif not rocket.compatibility_thread then
				-- remaining statuses are handled differently as they involve running unnamed threads
				-- see "backward compatibility" comment and functions below it in Rocket.lua for details
				rocket.compatibility_thread = CreateGameTimeThread(function(rocket, status)
					Sleep(60*1000)
					if rocket.command or rocket.status ~= status then
						return
					end
					
					if status == "landing" then
						if IsValid(rocket.landing_site) then
							rocket:SetCommand("LandOnMars", rocket.landing_site)
						else
							rocket:SetCommand("WaitInOrbit")
						end
					elseif status == "landed" then
						rocket:SetCommand("Refuel")
					elseif status == "takeoff" then
						rocket:SetCommand("FlyToEarth")
					end
					rocket.compatibility_thread = nil
				end, rocket, status)
			end
			if status == "takeoff" and not rocket.auto_export then
				rocket:ClearEnumFlags(const.efSelectable)
			end
		end
	end
end
	
function SavegameFixups.pre_fixup(metadata, lua_revision)
	local city = UICity

	FixResearch(city,lua_revision)

	if not CropTechLocks or not TraitLocks then
		FixTechLocks(city)
	end
	
	if not g_MeteorDecals then
		g_MeteorDecals = {}
	end
	
	if not g_ImportLocks then
		g_ImportLocks = {}
	end
	
	if not g_RefugeeOutcome then
		g_RefugeeOutcome = {}
	end
	
	SandTraceThreads = SandTraceThreads or {}
	SandTraceCounter = SandTraceCounter or 0
	g_BCHexRangeEnable = g_BCHexRangeEnable or {}
	
	CreateGameTimeThread(function() -- delay until loading is done and the UI is open
		UpdateRogueNotification()
	end)
	
	FixRockets(lua_revision)
		
	MapForEach("map",
		"FarmConventional",
		function(o)
			if not o.anim_thread then
				o:StartAnimThread()
			end
		end)
	
	if lua_revision < 226255 then
		MapForEach("map", 
			"Building",
			function(b)
				b:InitResourceSpots()
			end)
	end
	
	if lua_revision < 226147 then
		for i=#(g_MeteorsPredicted or ""),1,-1 do
			local obj = g_MeteorsPredicted[i]
			if not IsKindOf(obj, "BaseMeteor") then
				table.remove(g_MeteorsPredicted, i)
				DoneObject(obj)
			end
		end
	end
	
	if lua_revision < 226100 then
		local c = UICity.labels.RCTransport
		for i, rover in ipairs(c) do
			if rover.resource_requests == false then
				local reconnect = false
				if #rover.command_centers > 0 then
					reconnect = true
					rover:DisconnectFromCommandCenters()
				end
				local storable_resources = rover.storable_resources
				local resource_requests = {}
				rover.resource_requests = resource_requests
				for i = 1, #storable_resources do
					local resource_name = storable_resources[i]
					resource_requests[resource_name] = rover:AddSupplyRequest(resource_name, 0, 0)
				end
				if reconnect then
					rover:ConnectToCommandCenters()
				end
			end
		end
	end
		
	if lua_revision < 226624 then
		local container = UICity.labels.PolymerPlant or empty_table
		for _, pp in ipairs(container) do
			pp:DisconnectFromCommandCenters()
			pp:InitConsumptionRequest()
			pp:ConnectToCommandCenters()
		end
	end
	
	if lua_revision < 226688 then
		if UICity:IsTechResearched("ConstructionNanites") then
			OnNanitesResearched()
		end
	end
	
	if lua_revision < 226859 then
		MapForEach("map", "BaseDustDevil", BaseDustDevil.StartWatchdog)
	end
	
	if lua_revision < 226940 then
		g_DomeVersion = MapCount("map", "Dome")
	end
	
	if lua_revision < 226966 and g_ConstructionNanitesResearched then
		dbg_ResetAllNaniteThreads()
	end
	
	MapForEach("map", "TheExcavator", function(excavator)
		if not excavator.belt then
			excavator.belt = excavator:GetAttach("ExcavatorBelt")
			excavator.belt:SetFrameAnimationSpeed(excavator.working and 1000 or 0)
		end
		if not excavator.rope then
			excavator.rope = PlaceObj("ExcavatorRope")
			excavator.tower:Attach(excavator.rope, excavator.tower:GetSpotBeginIndex("Rope2"))
			excavator.rope:SetAxis(axis_y)
			excavator:UpdateRopeVisuals()
		end
	end)
	
	if lua_revision < 227158 then
		MapForEach("map", "ResourcePile", function(o) o.parent_dome = GetDomeAtPoint(o:GetPos()) end)
	end

	if lua_revision < 227241 then
		MapForEach(true, "Colonist", function(c) 				
			if IsValid(c) and not c:IsDying() and not (c.holder or c:IsValidPos()) then				
				local dome = c.current_dome or c.emigration_dome or c.dome
				if dome then
					c:SetDome(dome)
					c:SetPos(dome:PickColonistSpawnPt())
				else
					DoneObject(c)
				end	
			end			
		end)
	end
	
	if lua_revision < 227219 then
		--silent (non asserting) save compat with momchil's save specifically
		--objs are in limbo, done finished only half way - Object's done has passed while CObject's done has not
		MapForEach("map", "ConstructionGroupLeader", function(o) 
			if IsValid(o) and not HandleToObject[o] then
				CObject.delete(o)
			end
		end)
	end
	
	if lua_revision < 227328 then
		FixRequestQueues(LRManagerInstance)
		MapForEach("map", "DroneControl", FixRequestQueues)
	end
	
	if lua_revision < 227234 then
		MapForEach("map", "ResourceStockpileBase", function(o) o:RemoveFromDomeLabels(); o:AddToDomeLabels() end)
	end
	
	if lua_revision < 227258 then
		MapForEach("map", "GeoscapeDome", UpdateDistToDomes)
	end
	
	if lua_revision < 227288 then
		if not StorableResourcesForSession then
			StorableResourcesForSession = table.copy(StorableResources)
		end
	end
	
	if lua_revision < 227296 then
		MapForEach("map", "RCTransport", RCTransport.SaveCompatNoStorageMatch)
	end
	
	if lua_revision < 227360 then
		MapForEach("map", "ConstructionSite", function(o)
			if o.construction_group and o ~= o.construction_group[1] and
				not IsValid(o.construction_group[1]) then
				DoneObject(o)
			end
		end)
	end
	
	if lua_revision < 227386 then
		MapForEach("map", "Drone", Drone.SaveCompatDifferentiateDisablingFromBroken)
	end
	
	if lua_revision >= 227488 and lua_revision < 227509 then
		MapForEach("map", "Dome", Dome.InitLandingSpots)
	end
	
	if lua_revision < 228185 then
		MapForEach("map", "Dome", function(dome)
			local piles = dome.labels.ResourceStockpile or empty_table
			for i=#piles,1,-1 do
				local pile = piles[i]
				if not IsValid(pile) or not pile.dome_label then
					table.remove(piles, i)
				end
			end
		end)
	end
	
	if lua_revision < 228185 then
		MapForEach("map", "Dome", function(dome)
			if not dome.destroyed then
				local terrain_class = dome.class .. "TerrainGrass"
				if rawget(g_Classes, terrain_class) and dome:CountAttaches(terrain_class) == 0 then
					dome:Attach(PlaceObject(terrain_class))
				end
			end
		end)
	end
	
	if lua_revision < 228185 then
		table.iclear(Flight_ObjsToMark)
		table.iclear(Flight_ObjToUnmark)
	end
	
	if lua_revision < 228111 then -- applied in day1 patch
		MapForEach("map", "ResourceStockpile",
		function(o)
			if o.parent ~= false and not IsValid(o.parent) then
				o.parent = nil
			end
		end)
	end
	
	if lua_revision < 228185 then
		if g_RoverCommandResearched then
			Msg("TechResearched", "RoverCommandAI", UICity)
		end
	end
	
	if lua_revision < 228448 then
		MapForEach("map", "Dome", function(o)
			o:OnSkinChanged()
		end)
	end
	
	if lua_revision < 228321 then
		cameraRTS.SetZoomLimits(const.DefaultCameraRTS.MinZoom, const.DefaultCameraRTS.MaxZoom)
	end
end

function SavegameFixups.DomePassageTables(metadata, lua_revision)
	MapForEach("map",
		"Dome",
		Dome.InitPassageTables)
end

function SavegameFixups.DomePassageTables_ColonistWrongDome()
	MapForEach(true, "Colonist", function(c) 
		if c.current_dome and c.current_dome ~= c.dome then
			c:SetDome(c.current_dome)
		end
	end)
end

function SavegameFixups.DomeWorkplaces()
	MapForEach("map", "Dome", function(dome)
		dome:AddOutskirtBuildings()
	end)
end

function SavegameFixups.DomeLabels(metadata, lua_revision)
	MapForEach("map", "Dome", function(dome)
		local colonists = dome.labels.Colonist or empty_table
		dome.labels.Homeless = {}
		dome.labels.Unemployed = {}
		for i = #colonists, 1, -1  do
			local colonist = colonists[i]
			local colo_dome = colonist.dome
			if colo_dome~=dome then
				dome:RemoveFromLabel("Colonist", colonist)
				colo_dome:AddToLabel("Colonist", colonist)
			end
			colonist:UpdateHomelessLabels()
			colonist:UpdateEmploymentLabels()
		end
	end)
end

function SavegameFixups.trade_rocket_fixup(metadata, lua_revision)
	local list = UICity.labels.AllRockets or empty_table
	for _, rocket in ipairs(list) do
		if IsValid(rocket) and rocket:IsKindOfClasses("TradeRocket", "RefugeeRocket") and rocket.status == "on earth" then
			rocket.status = false
		end
	end	
end

function SavegameFixups.trade_rocket_deswarm(metadata, lua_revision)
	if #(UICity.labels.TradeRocket or empty_table) > 50 then
		MapForEach(true, "TradeRocket",
			function(o)
				if o.command == "OnEarth" or o.command == "FlyToMars" then
					o.is_pinned = false
					DoneObject(o)
				end
			end)
	end
end

function SavegameFixups.SponsorCommanderPresetsFixup(metadata, lua_revision)
	local sponsor   = GetMissionSponsor()
	rawset(sponsor, "name", sponsor.id)
	local commander = GetCommanderProfile()
	rawset(commander, "name", commander.id)
end

function SavegameFixups.ColonistSuitableWorkplace()
	MapForEach(true, "Colonist", function(c) 				
		if c.workplace and not c.workplace:IsSuitable(c) then				
			c:SetWorkplace(false)
		end			
	end)
end

function SavegameFixups.PFClasses()
	MapForEach(true, "Movable", function(obj)
		obj:SetPfClass(obj.pfclass)
	end)
end

function SavegameFixups.MoholeExcavatorUpgrades()
	UnlockUpgrade("Mohole_ExpandMohole_1")
	UnlockUpgrade("Mohole_ExpandMohole_2")
	UnlockUpgrade("Mohole_ExpandMohole_3")
	UnlockUpgrade("Excavator_ImprovedRefining_1")
	UnlockUpgrade("Excavator_ImprovedRefining_2")
	UnlockUpgrade("Excavator_ImprovedRefining_3")
end

function SavegameFixups.MarsgateRoverBattery()
	MapForEach("map", "AttackRover",
		function(o)
			if o.command == "Roam" then
				o:SetCommand("Roam") -- force restart of the command to fix saved wrong battery thread state
			end
		end)
end

function SavegameFixups.RemovedUserRequestMaintenanceButton()
	local f = TaskRequester.GetPriorityForRequest
	MapForEach(true, "RequiresMaintenance",
		function(o)
			rawset(o, "GetPriorityForRequest", f)
		end)
end

function SavegameFixups.RemoveBlackCubeRFWaitToFill()
	local f = const.rfWaitToFill
	MapForEach(true, "BlackCubeStockpileBase",
		function(o)
			if o.has_supply_request and o.supply_request then
				o.supply_request:ClearFlags(f)
			end
		end)
end

function SavegameFixups.CleanDestroyedShiftsBuildingsFromCityLabels()
	local c = UICity and UICity.labels and UICity.labels.ShiftsBuilding
	for i = #(c or ""), 1, -1 do
		local bld = c[i]
		if bld.destroyed then
			bld:RemoveFromShiftsBuildingLabel()
		end
	end
end

function SavegameFixups.ShuttleHubReturResource()
	MapForEach("map", "ShuttleHub", function(shub)
		shub:CreateResourceRequestsSupply()
	end)
	MapForEach("map", "DroneFactory",function(bld)
		bld:CreateResourceRequestsSupply()
	end)
end

function SavegameFixups.FixDomeLandingSpots()
	UICity:ForEachLabelObject("Dome", "InitLandingSpots")
end

function SavegameFixups.FixBioroboticWorkshopArms()
	local c = UICity and UICity.labels and UICity.labels.BioroboticsWorkshop
	for i = 1, #(c or "") do
		c[i].arms = c[i]:GetAttaches("BioroboticsWorkshopArm")
	end
end

function FixWorkplaceWorkers()
	local count = 0
	for _, col in ipairs(UICity.labels.Colonist or empty_table) do
		local workplace = col.workplace
		local list = workplace and workplace:GetUnitsInShifts()[col.workplace_shift]
		if list and not table.find(list, col) then
			list[#list + 1] = col
			count = count + 1
		end
	end
	return count
end

SavegameFixups.FixWorkplaceWorkers = FixWorkplaceWorkers

function SavegameFixups.FixMultipleSpecializations()
	for _, colonist in ipairs(UICity.labels.Colonist or empty_table) do
		local traits = table.keys(colonist.traits)
		for i = #traits, 1, -1 do
			local trait = traits[i]
			if const.ColonistSpecialization[trait] and colonist.specialist ~= trait then --specialization in traits different than the assigned one
				colonist:RemoveTrait(trait)
			end
		end
	end
end

function SavegameFixups.RegisterBorderlineDomeOutskirtBuildings()
	local domes = UICity.labels.Dome or empty_table
	for _, dome in ipairs(domes) do
		dome:AddOutskirtBuildings()
	end
end

function SavegameFixups.RenameFlyingMaxSpeed()
	MapForEach("map", "FlyingObject", function(obj)
		local max_speed = rawget(obj, "max_speed")
		if max_speed then
			obj.move_speed = max_speed
		end
	end)
end

function SavegameFixups.FixDomeWalkablePoints()
	for _,dome in ipairs(UICity.labels.Dome or empty_table) do
		dome:GenerateWalkablePoints()
	end
end

function SavegameFixups.FixDomeClones()
	g_TotalChildrenBornWithMating = 0
	for _,dome in ipairs(UICity.labels.Dome or empty_table) do
		if not dome.clones_created then
			local clones = 0
			for j,colonist in ipairs(dome.labels.Colonist) do
				if colonist.traits.Clone then
					clones = clones + 1
				end
			end
			dome.clones_created = clones
		end
		g_TotalChildrenBornWithMating = g_TotalChildrenBornWithMating + dome.born_children
	end
end

function SavegameFixups.FixOutsourcingOrdersCap()
	UICity.OutsourceResearchOrders = {}
end

function SavegameFixups.ClearConstructionMarkers()
	MapDelete("map", "GridTile")
end

function SavegameFixups.FixExportFundingHistory()
	local total = UICity.funding_gain_total or {}
	UICity.funding_gain_total = total
	local last = UICity.funding_gain_last or {}
	UICity.funding_gain_last = last
	total.Export = UICity:CalcModifiedFunding(UICity:CalcBaseExportFunding(UICity.total_export))
	last.Export = UICity:CalcModifiedFunding(UICity:CalcBaseExportFunding(UICity.last_export and UICity.last_export.amount))
end

function SavegameFixups.FixDemolsihCooldown()
	MapForEach(true, "Demolishable", function(obj) 			
		if not obj.demolishing then
			return
		end
		obj.demolishing_countdown = Min(obj.demolishing_countdown or 0, const.DemolishCountdownMax)
		obj:DestroyAttaches("RotatyThing")
		PlayFX("Demolish", "end", obj)
		DeleteThread(obj.demolishing_thread)
		obj.demolishing_thread = CreateGameTimeThread(obj.DoDemolish, obj)	
	end)
end

function SavegameFixups.DomeOnScreenNotifications()
	DeleteThread("DomesWithNoOxygenNotif")
	DeleteThread("DomesWithNoWaterNotif")
	DeleteThread("DomesWithNoPowerNotif")
	
	for i=1,#g_DomesWithNoOxygen do	
		table.insert_unique(g_DomesWithNoLifeSupport, g_DomesWithNoOxygen[i])
	end	
	for i=1,#g_DomesWithNoWater do	
		table.insert_unique(g_DomesWithNoLifeSupport, g_DomesWithNoWater[i])
	end	
	for i=1,#g_DomesWithNoPower do	
		table.insert_unique(g_DomesWithNoLifeSupport, g_DomesWithNoPower[i])
	end	
	g_DomesWithNoOxygen = {}
	g_DomesWithNoWater = {}
	g_DomesWithNoPower = {}	
	RestartGlobalGameTimeThread("InsufficientMaintenanceResourcesNotif")
end

function SavegameFixups.NotWorkingBuildingsNotifications()
	RestartGlobalGameTimeThread("NotWorkingBuildingsNotif")
end

-- Need to restart the thread to prevent FindNearest(...) function call.
function SavegameFixups.AutoRemoveObjRestart()
	RestartGlobalGameTimeThread("AutoRemoveObjs")
end

function SavegameFixups.DuplicatedSpecialization()
	MapForEach("map", "Colonist", function(col) ValidateSpecialization(col) end)
end

function SavegameFixups.CameraScrollBorder()
	cameraRTS.SetProperties(1, {ScrollBorder = const.DefaultCameraRTS.ScrollBorder})
end

function SavegameFixups.FixIrradiation()
	MapForEach("map", "Colonist", function(col) col:Affect("StatusEffect_Irradiated", false) end)
end

function SavegameFixups.FixGameEventsThread()
	if rawget(_G, "GameEventsTickThread") then
		DeleteThread(GameEventsTickThread)
		GameEventsTickThread = nil
	end
end
