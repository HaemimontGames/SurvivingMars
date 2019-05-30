GlobalVar("g_SpecialProjectNextSpawn", {})
GlobalVar("g_SpecialProjectSpawnNextIdx", {})
GlobalVar("g_SpecialProjectCompleted", false)
GlobalVar("g_StartSpecialProjects", false)
GlobalVar("g_SpecialProjectsDisabled", {})
DefineClass.MarsSpecialProject = {
	__parents = {"MarsScreenPointOfInterest"},
	spot_type = "project",
	rocket = false,
	project_id = false,
	-- special resources to start project
	funding =  false,
	fuel = false,
}

function MarsSpecialProject:Init(city)
	-- init special resources to start project if any
	local resources = self:GetRocketResources()
	for _,res in ipairs(resources) do
		if res.resource=="Fuel" then
			self.fuel = res.amount
		elseif res.resource=="Funding" then
			self.funding = res.amount
		end
	end
end

function MarsSpecialProject:OnCompletion(city)
	local project = Presets.POI.Default[self.project_id]

	g_SpecialProjectCompleted = g_SpecialProjectCompleted or {}
	g_SpecialProjectCompleted[self.project_id] = (g_SpecialProjectCompleted[self.project_id] or 0) +1
	
	-- change terraforming params
	for _, terraforming in ipairs(project.terraforming_changes) do
		ChangeTerraformParam(terraforming.param, terraforming.amount)
	end
	-- call oncompletion
	project:OnCompletion(self, city, g_SpecialProjectCompleted[self.project_id])	
	-- show popup 
	if g_SpecialProjectCompleted[self.project_id]==1 then
		ShowPopupNotification("Completed"..self.project_id)
	else
		AddOnScreenNotification("CompletedSpecialProject",false,
			{	project_id = self.project_id, 
				popup_preset = "CompleteSpecialProject",
				GetPopupPreset =  function()return "Completed"..self.project_id end,
				override_text = T{12169, "Completed: <display_name>", project},
			})
	end
	-- spawn new project or reset this one bu removing the assigned rocket to it
	self.rocket = false
	if project.next_spawn_location == "thesame" then
		g_SpecialProjectNextSpawn[self.project_id] = g_SpecialProjectNextSpawn[self.project_id] or {}
		g_SpecialProjectNextSpawn[self.project_id].latitude = self.latitude
		g_SpecialProjectNextSpawn[self.project_id].longitude = self.longitude
	end	
	-- remove current project and spawn it in different place
	DoneObject(self)
	TrytoSpawnSpecialProject(project)
	Msg("SpecialProjectCompleted", self.project_id)
end

function MarsSpecialProject:GetOutcomeText()
	local project = Presets.POI.Default[self.project_id]
	local outcome = {}
	if project.terraforming_changes and next(project.terraforming_changes) then
		for _, terraforming in ipairs(project.terraforming_changes) do
			outcome[#outcome+1] = T{11999, "<resource(number, res)>",number = terraforming.amount, res = (terraforming.param).."TP"}
		end
	end
	local idx = g_SpecialProjectCompleted and g_SpecialProjectCompleted[self.project_id] and g_SpecialProjectCompleted[self.project_id]  + 1 or 1
	local add_text = project.GetOutcomeText(project, self, UICity, idx)
	if add_text and add_text~="" then
		outcome[#outcome+1] = add_text
	end
	return table.concat(outcome, ", ")
end

function MarsSpecialProject:ShowOutcomeText()
	local project = Presets.POI.Default[self.project_id]
	if project.terraforming_changes and next(project.terraforming_changes) then 
		return true 
	end
	local idx = g_SpecialProjectCompleted and g_SpecialProjectCompleted[self.project_id] and g_SpecialProjectCompleted[self.project_id] + 1 or 1
	local add_text = project.GetOutcomeText(project, self, UICity, idx)
	if add_text and add_text~="" then
		return true
	end	
end
function MarsSpecialProject:PrerequisiteToStart()
	local project = Presets.POI.Default[self.project_id]
	if not project then return false end
	return project.PrerequisiteToStart(project, self, UICity)
end

function MarsSpecialProject:GetRocketResources()
	local project = Presets.POI.Default[self.project_id]
	return project and project.rocket_required_resources or empty_table
end

function MarsSpecialProject:GetRocketExpeditionResources()
	local resources = self:GetRocketResources()
	local res_table = {}
	for _,res in ipairs(resources) do
		local resource = res.resource
		if resource~="Funding" then
			res_table[res.resource]  = res.amount
		end	
	end
	return res_table
end

function MarsSpecialProject:GetLaunchFuel()
	local resources = self:GetRocketResources()
	for _,res in ipairs(resources) do
		if res.resource=="Fuel" then
			return res.amount
		end
	end
end

function GenerateProjectsLatLong(poi_id, city, init)
	local project = Presets.POI.Default[poi_id]
	if not project then
		return 0,0
	end
	
	local lat, long
	local min_lat, max_lat   = const.POIMinLat, const.POIMaxLat
	local max_long_dist      = const.POIMaxLongDist
	local same_side_max_dist = const.POISameSideMaxDist
	
	local spawn_location = init and project.first_spawn_location or project.next_spawn_location

	local our_colony = table.find_value(MarsScreenLandingSpots, "id", "OurColony")
	local count = 0
	local prev = g_SpecialProjectNextSpawn[poi_id]
	if spawn_location == "thesame" then
		if prev then
			return prev.latitude, prev.longitude
		end	
	end
	while true do
		lat, long = GenerateRandomLandingLocation()
		if spawn_location== "random" then
			if lat >= min_lat and lat <= max_lat
				and not IsTooCloseToSpots(lat / 60, long / 60, MarsScreenLandingSpots) then
				break
			end
		elseif spawn_location== "near" then
			if GetLongDist(long / 60, our_colony.longitude) <= same_side_max_dist
				and lat >= min_lat and lat <= max_lat
				and not IsTooCloseToSpots(lat / 60, long / 60, MarsScreenLandingSpots) then
				break
			end
		elseif spawn_location== "poles" then
			lat = (AsyncRand(100)>50 and min_lat or max_lat)/60
			long = AsyncRandRange(-180,180)
			if not IsTooCloseToSpots(lat, long , MarsScreenLandingSpots) or count >= 100 then
				return lat, long
			end
		elseif (spawn_location== "thesame" and not prev)  or spawn_location== "random" then
			if GetLongDist(long / 60, our_colony.longitude) <= max_long_dist
				and lat >= min_lat and lat <= max_lat
				and not IsTooCloseToSpots(lat / 60, long / 60, MarsScreenLandingSpots) then
				break
			end
		end
		
		if count >= 100 then break end -- don't run infinitely
		count = count + 1
	end
	return lat / 60, long / 60
end

function CalcNextSpawnProject(poi_id, city)
	local project = Presets.POI.Default[poi_id]
	local city = city or UICity
	local min = project.spawn_period.from
	local max = project.spawn_period.to	
	if min>0 and max>0 then
		local day = city.day + city:Random(min, max)		
		g_SpecialProjectNextSpawn[poi_id] = g_SpecialProjectNextSpawn[poi_id] or {}
		g_SpecialProjectNextSpawn[poi_id].day = day
	end
	g_SpecialProjectSpawnNextIdx[poi_id] = (g_SpecialProjectSpawnNextIdx[poi_id] or 0) + 1
end

function CountSpawnedProjects(poi_id)
	local count = 0
	for _, spot in ipairs(MarsScreenLandingSpots or empty_table) do
		if spot.spot_type == "project" and spot.project_id==poi_id then
			count = count + 1
		end	
	end	
	return count		
end

GlobalVar("TerraformingSpecialProjectSpawned", false)

local max_projects_of_type = 5
function SpawnSpecialProject(poi_id, city, init)
	local project = Presets.POI.Default[poi_id]
	local max = project.max_projects_of_type or  max_projects_of_type
	if CountSpawnedProjects(poi_id) >= max then
		return
	end 	
	
	-- calc location
	local lat, long = GenerateProjectsLatLong(poi_id, city, init)
	local obj = MarsSpecialProject:new{	
		id           = project.id..(g_SpecialProjectSpawnNextIdx[poi_id] or ""),
		project_id   = project.id,
		longitude    = long,
		latitude     = lat,
		is_orbital   = project.is_orbital,
		display_name = project.display_name,
		description  = project.description,
		consume_rocket = project.consume_rocket,
		expedition_time = project.expedition_time,
	}
	project.OnCreation(obj, city)
	local function CenterOnSpawned()
		MarsScreenMapParams.latitude = lat
		MarsScreenMapParams.longitude = long
		OpenPlanetaryView()
	end
	AddOnScreenNotification("NewSpecialProjects", CenterOnSpawned, {project_name = project.display_name})
	if not TerraformingSpecialProjectSpawned and project.is_terraforming then
		AddOnScreenNotification("TerraformingSpecialProjects")
		TerraformingSpecialProjectSpawned = true
	end
	CalcNextSpawnProject(poi_id, city)
	return obj
end

-- check prerequisits and spawn period
function TrytoSpawnSpecialProject(poi, day)
	local disabled = g_SpecialProjectsDisabled and g_SpecialProjectsDisabled[poi.id]
	if disabled then -- disabled from storybit
		return 
	end 
	local day =  day or UICity.day
	local min = poi.spawn_period.from
	local max = poi.spawn_period.to
	local tech = poi.activation_by_tech_research
	local id =  poi.id 
	local init = not g_SpecialProjectSpawnNextIdx[id]
	if not g_SpecialProjectSpawnNextIdx[id] 
		or (min>0 and max>0 and g_SpecialProjectNextSpawn[id] and day >= g_SpecialProjectNextSpawn[id].day) 
	then
		if poi.PrerequisiteToCreate(poi, UICity) then
			return SpawnSpecialProject(id, UICity, init)			
		end
	end
end

function RemoveAllSpotsForSpecialProject(project_id)
	for idx = #MarsScreenLandingSpots, 1, -1 do
		local spot = MarsScreenLandingSpots[idx]
		if spot and spot.spot_type=="project" and spot.project_id==project_id then
			if spot.rocket then
				ClearExpeditionRocketSpot(spot.rocket,spot)
			end	
			table.remove(MarsScreenLandingSpots, idx)
			MarsScreenLandingSpots[spot.id] = nil
		end
	end
	SortMarsPointsOfInterest()
end

function OnMsg.NewDay(day)
	if g_Tutorial then return end -- no terraforming stuff in tutorials
	local projects = Presets.POI.Default
	
	if not g_StartSpecialProjects or day<g_StartSpecialProjects then
		-- start only manually enabled
		if g_SpecialProjectsDisabled then
			for id,val in pairs(g_SpecialProjectsDisabled) do
				if not val and TrytoSpawnSpecialProject(projects[id],day) then
					g_SpecialProjectsDisabled[id] = nil
				end			
			end	
		end
		return
	end	

	for _, poi in ipairs(projects) do
		TrytoSpawnSpecialProject(poi,day)
	end
end

function OnMsg.CityStart()
	if g_Tutorial then return end -- no terraforming stuff in tutorials
	g_StartSpecialProjects =  10 + Random(0,2)
	local projects = Presets.POI.Default
	for _, poi in ipairs(projects) do
		if poi.start_disabled then
			g_SpecialProjectsDisabled = g_SpecialProjectsDisabled or {}
			g_SpecialProjectsDisabled[poi.id] = true
		end
	end
end

----- Effect_UnlockSpecialProject
DefineClass.Effect_UnlockSpecialProject = {
	__parents = { "Tech_Effect" },
	properties = {
		{ category = "General", id = "SpecialProject", name = "SpecialProject", editor = "choice", default = "", items = function() return PresetsCombo("POI") end },
	},
	EditorName = "Unlock Special Project",
	Description = T(12000, "<u(SpecialProject)>"),
}

function Effect_UnlockSpecialProject:OnApplyEffect(city)
	local poi = Presets.POI.Default[self.SpecialProject]
	if poi.PrerequisiteToCreate(poi, city) then
		SpawnSpecialProject(poi.id, city, "init")
	end
end

function CheatSpawnSpecialProjects(project_id)
	local projects = Presets.POI.Default
	if project_id then
		local project = Presets.POI.Default[project_id]
		local init = not g_SpecialProjectSpawnNextIdx[project_id]
		SpawnSpecialProject(project_id, UICity, init)	
		return
	end
	for _, poi in ipairs(projects) do
		local id =  poi.id 
		local init = not g_SpecialProjectSpawnNextIdx[id]
		SpawnSpecialProject(id, UICity, init)			
	end
end
