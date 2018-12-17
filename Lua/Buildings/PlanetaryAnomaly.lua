DefineClass.PlanetaryAnomaly = {
	__parents = { "MarsScreenPointOfInterest" },
	spot_type = "anomaly",
	
	reward = false,
	rocket = false,
	breakthrough_tech = false,
	reward_resource = false,
	requirement_type = false,
	requirements = false,
	scanned_by = false, -- competition
	reward_resources = { "Metals", "Polymers", "PreciousMetals", },
	custom_id = false, --from story bits
	init_name = true,
	
	anomaly_names = {
		T(11105, "Project Alfa"),
		T(11106, "Project Archimedes"),
		T(11107, "Project Armstrong"),
		T(11108, "Project Atoll"),
		T(11109, "Project Babylon"),
		T(11110, "Project Bluesky"),
		T(11111, "Project Castille"),
		T(11112, "Project Cavalcade"),
		T(11113, "Project Champion"),
		T(11114, "Project Chariot"),
		T(11115, "Project Cobalt"),
		T(11116, "Project Commodore"),
		T(11117, "Project Crossroads"),
		T(11118, "Project Dawn"),
		T(11119, "Project Demeter"),
		T(11120, "Project Element"),
		T(11121, "Project Excalibur"),
		T(11122, "Project Fahrenheit"),
		T(11123, "Project Fedora"),
		T(11124, "Project Flamingo"),
		T(11125, "Project Hinterland"),
		T(11126, "Project Iridium"),
		T(11127, "Project Kappa"),
		T(11128, "Project Komodo"),
		T(11129, "Project Lightbulb"),
		T(11130, "Project Limegrass"),
		T(11131, "Project Lyric"),
		T(11132, "Project Mist"),
		T(11133, "Project Monarch"),
		T(11134, "Project Monsoon"),
		T(11135, "Project Niagara"),
		T(11136, "Project Ocean"),
		T(11137, "Project Oracle"),
		T(11138, "Project Pharaoh"),
		T(11139, "Project Picnic"),
		T(11140, "Project Portier"),
		T(11141, "Project Purity"),
		T(11142, "Project Race"),
		T(11143, "Project Redwood"),
		T(11144, "Project Reign"),
		T(11145, "Project Revere"),
		T(11146, "Project Rope"),
		T(11147, "Project Sanctuary"),
		T(11148, "Project Savannah"),
		T(11149, "Project Seal"),
		T(11150, "Project Shape"),
		T(11151, "Project Solar"),
		T(11152, "Project Spring"),
		T(11153, "Project Steed"),
		T(11154, "Project Swanlake"),
		T(11155, "Project Titanium"),
		T(11156, "Project Trophy"),
		T(11157, "Project Tungsten"),
		T(11158, "Project Wayfarer"),
		T(11159, "Project Yukon"),
	},
	anomaly_descriptions = {
		T(11160, "Orbital sensor have detected strange readings on these coordinates."),
		T(11161, "After analyzing complex data, our scientists have suggested an expedition to this area."),
		T(11162, "We have identified strange spectrographic readings on this location."),
		T(11163, "Strange signal anomaly has been detected near these coordinates."),
		T(11164, "Unexplicable visual data from this sector has sparked the interest of our scientists."),
		T(11165, "Unusual physical anomalies have been detected on this location."),
	},
}

function PlanetaryAnomaly:Init()
	self:InitReward()
	self:InitRequirements()
	
	if self.init_name then --custom display name from story bit
		local count = 0
		repeat
			self.display_name = table.rand(self.anomaly_names) -- should these be exhausted?
			local name_in_use = false
			for _, spot in ipairs(MarsScreenLandingSpots) do
				if spot ~= self and IsKindOf(spot, "PlanetaryAnomaly") and spot.display_name == self.display_name then
					name_in_use = true
					break
				end
			end
			count = count + 1
		until not name_in_use or count >= 100
	end
	
	if not self.description then --custom desc from story bit
		-- try to match a specific description
		local descr_list = {}
		ForEachPreset("PlanetaryAnomalyDescription", function(descr, group, anomaly, list)
			if descr:IsApplicable(anomaly) then
				table.insert(list, descr.description)
			end
		end, self, descr_list)
		
		if #descr_list == 0 then
			descr_list = self.anomaly_descriptions -- fall back to a generic one
		end
		
		self.description = table.rand(descr_list)
	end
end

function PlaneteryAnomalyRewardTypeCombo()
	return {
		{ value = "", text = T(3609, "Any") },
		{ value = "custom", text = T(1000240, "Custom") },
		{ value = "research", text = T(311, "Research") },
		{ value = "breakthrough", text = T(11451, "Breakthrough") },
		{ value = "tech unlock", text = T(11452, "Tech Unlock") },
		{ value = "resources", text = T(692, "Resources") },
		{ value = "event", text = T(11453, "Event") },
	}
end

function PlaneteryAnomalyRewardResourceCombo()
	return {
		{ value = "", text = T(3609, "Any") },
		{ value = "Metals", text = T(3514, "Metals") },
		{ value = "Polymers", text = T(3515, "Polymers") },
		{ value = "PreciousMetals", text = T(4139, "Rare Metals") },
	}
end

function PlaneteryAnomalyRequirementTypeCombo()
	return {
		{ value = "", text = T(3609, "Any") },
		{ value = "specialists", text = T(11454, "Specialist Crew") },
		{ value = "colonists", text = T(11455, "Colonist Crew") },
		{ value = "drones", text = T(517, "Drones") },
		{ value = "rover", text = T(10147, "Rover") },
	}
end

function PlanetaryAnomaly:InitReward()
	local roll = UICity:Random(100) -- todo: stable somehow
	if (self.reward or "") ~= "" then
		return
	end
	if roll < 25 then
		self.reward = "research"
	elseif roll < 35 then
		self.reward = "breakthrough"
		local breakthrough_tech = #BreakthroughOrder > 0 and table.remove(BreakthroughOrder)
		if breakthrough_tech then
			self.breakthrough_tech = breakthrough_tech
		else
			self.reward = "tech_unlock"
		end
	elseif roll < 55 then
		self.reward = "tech unlock"
	elseif roll < 90 then 
		self.reward = "resources"
		self.reward_resource = table.rand(self.reward_resources)
		assert(self.reward_resource)
	else
		self.reward = "event"
	end
end

function PlanetaryAnomaly:InitRequirements()
	if self.requirements then return end --preinitialized by story bit
	self.requirements = {} -- see RocketExpedition.lua / ExpeditionBegin for format
	
	local roll = UICity:Random(100)
	if roll < 25 then
		-- specialists
		self.requirements.num_crew = UICity:Random(3, 7)
		self.requirements.crew_specialization = table.rand(ColonistSpecializationList)
		self.requirement_type = "specialists"
	elseif roll < 50 then
		-- non-specialists
		self.requirements.num_crew = UICity:Random(5, 10)
		self.requirement_type = "colonists"
	elseif roll < 75 then
		-- drones
		self.requirements.num_drones = UICity:Random(3, 10)
		self.requirement_type = "drones"
	else
		-- rover
		local list = GetAvailableRovers()
		self.requirements.rover_type = table.rand(list)
		self.requirement_type = "rover"
	end
end

function GetAvailableRovers()
	local list = {}
	ForEachPresetInGroup("Cargo", "Rovers", function(preset)
		local classdef = g_Classes[preset.id]
		if not IsKindOf(classdef, "BaseRover") then
			return
		end
		local available = true
		if preset.locked then
			local template = BuildingTemplates[preset.id .. "Building"]
			available = template and not GetAdditionalBuildingLock(template)
		end
		if available then
			list[#list + 1] = preset.id
		end
	end)
	return list
end

GlobalVar("g_ScannedPlanetaryAnomaly", 0)

function PlanetaryAnomaly:Scan(rocket)
	local reward = self.reward
	
	if reward == "breakthrough" then
		local def = TechDef[self.breakthrough_tech]
		if not def then
			assert(false, "No such breakthrough tech: " .. self.breakthrough_tech)
		elseif rocket.city:SetTechDiscovered(self.breakthrough_tech) then
			AddOnScreenNotification("PlanetaryAnomaly_BreakthroughDiscovered", OpenResearchDialog, {name = def.display_name, context = def, rollover_title = def.display_name, rollover_text = def.description})
			reward = false
		else
			-- already discovered
			reward = "tech unlock"
		end
	end
	
	if reward == "tech unlock" then
		local fields = {}
		for field_id, field in pairs(TechFields) do
			if field.discoverable then
				fields[#fields + 1] = field_id
			end
		end
		table.sort(fields)
		local unlocks = {}
		for i=1,#fields do
			local tech_id = rocket.city:DiscoverTechInField(fields[i])
			if tech_id then
				unlocks[#unlocks + 1] = tech_id
			end
		end

		if #unlocks > 0 then
			local list_of_techs = {}
			for i, unlock in ipairs(unlocks) do
				list_of_techs[i] = TechDef[unlock].display_name
			end
			local list_text = table.concat(list_of_techs, '\n')
			AddOnScreenNotification("PlanetaryAnomaly_TechUnlockAnomalyAnalyzed", function()
				CreateRealTimeThread(function()
					local res = WaitPopupNotification("AnomalyAnalyzed", { params = {list_text = list_text}, start_minimized = false })
					if res == 1 then
						OpenResearchDialog()
					end
					RemoveOnScreenNotification("PlanetaryAnomaly_TechUnlockAnomalyAnalyzed")
				end)
			end)
			reward = false
		else
			reward = "research"
		end
	end
	
	if reward then
		if reward == "research" then
			local points = rocket.city:TableRand{2000, 2500, 3000, 3500, 4000}
			rocket.city:AddResearchPoints(points)
			AddOnScreenNotification("PlanetaryAnomaly_GrantRP", nil, {points = points, resource = "Research"})
		elseif reward == "resources" then
			assert(self.reward_resource)
			local res = self.reward_resource
			local amount = rocket.city:Random(20, 41) * const.ResourceScale
			rocket:AddResource(amount, res)
			rocket.cargo = { { class = res, amount = amount / const.ResourceScale } } -- for UI purposes only
			AddOnScreenNotification("PlanetaryAnomaly_GrantRP", nil, {points = amount, resource = res})
		elseif reward == "event" then
			FireExpedtionStoryBit(rocket)
			Msg("PlanetaryAnomalyEvent", rocket)
		elseif reward ~= "custom" then
			assert(false, "unknown reward type")
		end
	end
	g_ScannedPlanetaryAnomaly = g_ScannedPlanetaryAnomaly + 1
	Msg("PlanetaryAnomalyAnalyzed", self)
	DoneObject(self)
end

DefineStoryBitTrigger("PlanetaryAnomalyEvent", "PlanetaryAnomalyEvent")
DefineStoryBitTrigger("PlanetaryAnomalyAnalyzed", "PlanetaryAnomalyAnalyzed")

function PlanetaryAnomaly:AddExpeditionTime(t)
	if self.rocket then
		self.rocket:AddExpeditionTime(t)
	end
end

function GetExpeditionStoryBitIds()
	return PresetsCombo("StoryBit", nil, nil, function(o) 
		return o.group == "Expeditions" and o.Trigger == "PlanetaryAnomalyEvent"
	end)()
end

function FireExpedtionStoryBit(obj)
	local t = GetExpeditionStoryBitIds()
	local idx = UICity:Random(2, #t)
	ForceActivateStoryBit(t[idx], obj)
end