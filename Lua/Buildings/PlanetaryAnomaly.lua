GlobalVar("g_PlanetaryAnomalies", {})

DefineClass.PlanetaryAnomaly = {
	__parents = { "MarsScreenPointOfInterest" },
	spot_type = "anomaly",
	
	reward = false,
	rocket = false,
	breakthrough_tech = false,
	reward_resource = false,
	story_bit = false,
	requirement_type = false,
	requirements = false,
	scanned_by = false, -- competition
	reward_resources = {"Metals", "Polymers", "PreciousMetals"},
	custom_id = false, --from story bits
	init_name = true,
	is_orbital = false,
	outcome_text = false,
	
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
	table.insert(g_PlanetaryAnomalies, self)
	self:InitReward()
	self:InitRequirements()
	
	if self.init_name then --custom display name from story bit
		local count = 0
		repeat
			self.display_name = table.rand(self.anomaly_names) -- should these be exhausted?
			local name_in_use = false
			for _, spot in ipairs(MarsScreenLandingSpots) do
				if spot ~= self and spot.spot_type=="anomaly" and spot.display_name == self.display_name then
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

function PlanetaryAnomaly:Done()
	table.remove_entry(g_PlanetaryAnomalies, self)
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

function GetAvailableExpeditionStoryBitIds()
	local assigned = {}
	for _, anomaly in ipairs(g_PlanetaryAnomalies) do
		if anomaly.story_bit then
			assigned[anomaly.story_bit] = true
		end
	end
	
	local ids = {}
	local encountered = {}
	local filter = function(o)
		local used = (not g_StoryBitStates[o.id]) or (assigned[o.id])
		return o.group == "Expeditions" and o.Trigger == "PlanetaryAnomalyEvent" and not used
	end
	ForEachPreset("StoryBit", function(preset, group, ids)
		if preset.id ~= "" and (not filter or filter(preset)) and not encountered[preset.id] then
			ids[#ids + 1] = preset.id
			encountered[preset.id] = true
		end
	end, ids)
	
	table.sort(ids)
	return ids	
end

function PlanetaryAnomaly:InitReward()
	if (self.reward or "") == "" then
		local chances = {{"research", 25}, {"breakthrough", 10}, {"tech unlock", 20}, {"resources", 35}}
		local story_bits_available = #GetAvailableExpeditionStoryBitIds() > 1
		if story_bits_available then
			table.insert(chances, {"event", 10})
		end
		local total_prob = 0
		for _, prob in ipairs(chances) do
			total_prob = total_prob + prob[2]
		end
		local roll = UICity:Random(total_prob)
		local prob = 0
		for _, reward in ipairs(chances) do
			prob = prob + reward[2]
			if roll < prob then
				self.reward = reward[1]
				break
			end
		end
	end
	if self.reward == "breakthrough" then
		self.breakthrough_tech = #BreakthroughOrder > 0 and table.remove(BreakthroughOrder)
		if not self.breakthrough_tech then
			self.reward = "tech unlock"
		end
	elseif self.reward == "resources" then
		self.reward_resource = table.rand(self.reward_resources)
		assert(self.reward_resource)
	elseif self.reward == "event" then
		if not self.story_bit then
			local story_bits = GetAvailableExpeditionStoryBitIds()
			local idx = UICity:Random(2, #story_bits)
			self.story_bit = story_bits[idx]
		end
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
		local list = GetAvailableResupplyRovers()
		self.requirements.rover_type = table.rand(list)
		self.requirement_type = "rover"
	end
end

function GetAvailableResupplyRovers()
	local list = {}
	ForEachPresetInGroup("Cargo", "Rovers", function(preset)
		local classdef = g_Classes[preset.id]
		if not IsKindOf(classdef, "BaseRover") then
			return
		end
		local available = IsResupplyItemAvailable(preset.id)
		if available then
			list[#list + 1] = preset.id
		end
	end)
	return list
end


GlobalVar("g_ScannedPlanetaryAnomaly", 0)

function PlanetaryAnomaly:Scan(rocket)
	local reward = self.reward
	local city = rocket.city
	if reward == "breakthrough" then
		local def = TechDef[self.breakthrough_tech]
		if not def then
			assert(false, "No such breakthrough tech: " .. self.breakthrough_tech)
		elseif city:SetTechDiscovered(self.breakthrough_tech) then
			AddOnScreenNotification("PlanetaryAnomaly_BreakthroughDiscovered", OpenResearchDialog, {name = def.display_name, context = def, rollover_title = def.display_name, rollover_text = def.description})
			reward = false
		else
			-- already discovered
			reward = "tech unlock"
		end
	end
	
	if reward == "tech unlock" or reward == "tech_unlock" then
		local fields = {}
		for field_id, field in pairs(TechFields) do
			if field.discoverable then
				fields[#fields + 1] = field_id
			end
		end
		table.sort(fields)
		local unlocks = {}
		for i=1,#fields do
			local tech_id = city:DiscoverTechInField(fields[i])
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
			local points = city:TableRand{2000, 2500, 3000, 3500, 4000}
			city:AddResearchPoints(points)
			AddOnScreenNotification("PlanetaryAnomaly_GrantRP", nil, {points = points, resource = "Research"})
		elseif reward == "resources" then
			assert(self.reward_resource)
			local res = self.reward_resource
			local amount = city:Random(20, 41) * const.ResourceScale
			rocket:AddResource(amount, res)
			rocket.cargo = { { class = res, amount = amount / const.ResourceScale } } -- for UI purposes only
			AddOnScreenNotification("PlanetaryAnomaly_GrantRP", nil, {points = amount, resource = res})
		elseif reward == "event" then
			if not self.story_bit or  self.story_bit == "" then
				local story_bits = GetAvailableExpeditionStoryBitIds()
				local idx = UICity:Random(2, #story_bits)
				self.story_bit = story_bits[idx]
			end
			ForceActivateStoryBit(self.story_bit, rocket)
			Msg("PlanetaryAnomalyEvent", rocket)
		elseif reward ~= "custom" then
			assert(false, string.format("unknown reward type: %s", reward))
		end
	end
	g_ScannedPlanetaryAnomaly = g_ScannedPlanetaryAnomaly + 1
	Msg("PlanetaryAnomalyAnalyzed", self)
	DoneObject(self)
end

function PlanetaryAnomaly:GetRocketExpeditionResources()
	local resources =  self.requirements.required_resources
	if not resources then 
		return 
	end
	local res_table = {}
	for _,res in ipairs(resources) do
		local resource = res.resource
		if resource~="Funding" then
			res_table[res.resource]  = res.amount
		end	
	end
	return res_table
end
local outcome_texts = {
    ["breakthrough"] = T(11451, "Breakthrough"),
    ["tech unlock"]  = T(12153, "New technologies"),
    ["research"]     = T(12154, "Research progress <icon_Research>"),
    ["resources"]    = T(692, "Resources"),
    ["event"]        = T(77, "Unknown"),
    ["custom"]       = T(77, "Unknown"),
} 
function PlanetaryAnomaly:GetOutcomeText()	
	local text = self.outcome_text 
	if not text or text =="" then
		text = outcome_texts[self.reward] or ""
	end	
	return text
end

function PlanetaryAnomaly:ShowOutcomeText()
	return self.reward  and self.reward ~=""
end

DefineStoryBitTrigger("PlanetaryAnomalyEvent", "PlanetaryAnomalyEvent")
DefineStoryBitTrigger("PlanetaryAnomalyAnalyzed", "PlanetaryAnomalyAnalyzed")

function PlanetaryAnomaly:AddExpeditionTime(t)
	if self.rocket then
		self.rocket:AddExpeditionTime(t)
	end
end
