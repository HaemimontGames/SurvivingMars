--[[
- internal structures:
City.tech_status[tech_id] = {
	researched = nil/number of times researched
   discovered = nil/index of discovery
   points = 0,
   cost = 0,
   new = nil/true, -- is this tech still not seen by the player?
   queued = nil/true,
   repeatable = nil,false/true, -- used to override the default 'repeatable' status
 }
City.tech_field[field_id] = {tech_id, ...} -- an array of tech_ids
City.research_queue = {tech_id, ...} -- an array of tech_ids
--]]

GlobalVar("g_OutsourceDisabled", false)
GlobalVar("g_ResearchScroll", 0)
GlobalVar("g_ResearchFocus", point(1, 1))

function StableShuffle(tbl, rand, max)
	rand = rand or AsyncRand
	max = max or #tbl
	assert(#tbl < max)
	max = Max(max, #tbl)
	local tmp = {}
	while #tbl > 1 do
		local idx = 1 + rand(max)
		if idx <= #tbl then
			tmp[#tmp + 1] = tbl[idx]
			table.remove(tbl, idx)
		end
	end
	for i = #tmp,1,-1 do
		tbl[#tbl + 1] = tmp[i]
	end
end

function City:InitResearch()
	self.tech_status = {}
	self.tech_field = {}
	self.research_queue = {}
	
	self.TechBoostPerField = {}
	self.TechBoostPerTech = {}
	self.OutsourceResearchPoints = {}
	self.OutsourceResearchOrders = {}
	
	local initial_unlocked = GetMissionSponsor().initial_techs_unlocked
	local defs = TechDef
	local current_mystery = self.mystery_id
	local fields = Presets.TechFieldPreset.Default
	for i=1,#fields do
		local field = fields[i]
		local field_id = field.id
		local list = self.tech_field[field_id] or {}
		self.tech_field[field_id] = list
		for _, tech in ipairs(Presets.TechPreset[field_id]) do
			if (tech.mystery or current_mystery) == current_mystery and tech.condition() then
				if not table.find(list, tech.id) then
					list[#list + 1] = tech.id
				end
			end
		end
		local discoverable = field.discoverable
		if discoverable then
			if IsGameRuleActive("ChaosTheory") then
				table.shuffle(list)
			else
				StableShuffle(list, self:CreateResearchRand("InitResearch", field.id), 100)
				local retries = 0
				while true do
					local changed
					for j=1,#list do
						local tech_id = list[j]
						local tech = defs[tech_id]
						local min, max = Max(tech.position.from, 1), Min(tech.position.to, #list)
						if j < min or j > max then
							table.insert(list, (min + max) / 2, table.remove(list, j))
							changed = true
						end
					end
					if not changed then
						break
					end
					retries = retries + 1
					if retries >= 10 then
						print("Failed to find correct places for all techs in", field.id)
						break
					end
				end
			end
		end
		local costs = field.costs or empty_table
		for j = 1, #list do
			local cost
			if discoverable then
				cost = costs[j]
				if not cost then
					assert(j > #costs)
					local last_cost = costs[#costs] or 0
					local last_diff = last_cost - (costs[#costs - 1] or 0)
					cost = last_cost + (j - #costs) * last_diff
				end
			end
			local tech_id = list[j]
			local tech = defs[tech_id]
			self.tech_status[tech_id] = {
				cost = cost,
				points = 0,
				field = field_id,
			}
			if IsGameRuleActive("EasyResearch") and discoverable then
				self:SetTechDiscovered(list[j])
			end
		end
		if discoverable then
			for i=1,initial_unlocked do
				self:DiscoverTechInField(field_id)
			end
		end
	end
end

function City:GameInitResearch()
	for id in pairs(self.tech_status) do
		TechDef[id]:EffectsInit(self)
	end
end

----

function City:IsTechDiscovered(tech_id)
	local status = self.tech_status[tech_id]
	return status and status.discovered
end

function City:IsTechDiscoverable(tech_id)
	local status = self.tech_status[tech_id]
	local field = status and TechFields[status.field]
	return field and field.discoverable
end

--[[
- returns the id of a tech set to discovered in the field (if any is available)
--]]
function City:DiscoverTechInField(field_id)
	local list = self.tech_field[field_id] or ""
	for i=1,#list do
		local tech_id = list[i]
		if self:SetTechDiscovered(tech_id) then
			return tech_id
		end
	end
end

--[[
- updates the tech status to discovered (set new)
--]]
function City:SetTechDiscovered(tech_id)
	local status = self.tech_status[tech_id]
	if not status or status.discovered then
		return
	elseif not status.cost then
		local costs = TechFields[status.field].costs
		local idx = Min(#costs, self:TechCount(status.field, "discovered") + 1)
		status.cost = costs[idx]
	end
	self.discover_idx = self.discover_idx + 1
	status.discovered = self.discover_idx
	status.new = GameTime()
	return true
end

----

function City:IsNewResearchAvailable(field_id)
	local fields = self.tech_field or empty_table
	if field_id then
		local status_all = self.tech_status or empty_table
		for _, tech_id in ipairs(fields[field_id] or empty_table) do
			local status = status_all[tech_id] or empty_table
			if status.discovered and not status.researched then
				return true
			end
		end
	else
		for field_id in pairs(fields) do
			if self:IsNewResearchAvailable(field_id) then
				return true
			end
		end
	end
end

----

--[[
- updates the tech status to researched (clear new)
--]]
function City:SetTechResearched(tech_id, notify)
	local current_research = self.research_queue[1]
	tech_id = tech_id or current_research
	local status = self.tech_status[tech_id]
	if not status then
		return
	end
	self:SetTechDiscovered(tech_id)
	local tech = TechDef[tech_id]
	if status.researched then
		if not self:IsTechRepeatable(tech_id) then
			return
		end
		status.researched = status.researched + 1
		status.new = nil
	else
		status.researched = 1
		status.new = GameTime()
		local field_id = status.field
		if TechFields[field_id].discoverable then
			if tech_id == current_research or not self:IsNewResearchAvailable(field_id) then
				self:DiscoverTechInField(field_id)
			end
		end
	end
	status.points = 0
	tech:EffectsApply(self)
	self:DequeueResearch(tech_id)
	--@@@msg TechResearched,tech_id, city, first_time - fired when a tech has been researched.
	Msg("TechResearched", tech_id, self, status.researched == 1)
	Msg("TechResearchedTrigger", TechDef[tech_id]) -- for StoryBits
	if notify then
		AddOnScreenNotification("ResearchComplete", OpenResearchDialog, {name = tech.display_name, context = tech, rollover_title = tech.display_name, rollover_text = tech.description})
	end
	return true
end

function City:IsTechRepeatable(tech_id)
	local status = self.tech_status[tech_id]
	if not status then
		return
	elseif status.repeatable ~= nil then
		return status.repeatable
	end
	local tech = TechDef[tech_id]
	return tech and tech.repeatable
end

function City:IsTechResearched(tech_id)
	local status = self.tech_status[tech_id]
	return status and status.researched
end

function City:IsTechResearchable(tech_id)
	local status = self.tech_status[tech_id]
	return status and status.discovered and (not status.researched or self:IsTechRepeatable(tech_id))
end

----

function City:ChangeResearchCost(tech_id, points)
	local status = self.tech_status[tech_id]
	if not status then
		assert(false, "No such tech")
		return
	end
	status.cost = points
end

function City:ChangeTechRepeatable(tech_id, repeatable)
	local status = self.tech_status[tech_id]
	if not status then
		assert(false, "No such tech")
		return
	end
	status.repeatable = repeatable
end

function City:TechCost(tech_id)
	local status = self.tech_status[tech_id]
	if not status then
		assert(false, "No such tech")
		return 0
	end
	-- reduce the cost for the tutorial
	if g_Tutorial and g_Tutorial[tech_id] then
		return g_Tutorial[tech_id]
	end
	
	local cost_boost = 0
	if not TechFields[status.field].discoverable then
		cost_boost = 100 - g_Consts.BreakThroughTechCostMod -- e.g. author commander: 100 - (100 - 30) = 30
	end
	local field_boost = self.TechBoostPerField[status.field] or 0
	local tech_boost = self.TechBoostPerTech[tech_id] or 0
	local boost = Min(80, field_boost + tech_boost + cost_boost)
	
	local cost = status.cost or 0
	if self:IsTechRepeatable(tech_id) then
		local cost_increase = (TechDef[tech_id] or empty_table).cost_increase or 0
		local research_count = status.researched or 0
		cost = cost + MulDivRound(cost, research_count * cost_increase, 100)
	end
	return MulDivRound(cost, 100 - boost, 100)
end

function City:ResearchQueueCost(tech_id, queue_idx)
	local status = self.tech_status[tech_id] or {}
	local researched = status.researched
	local count = 0
	local queue = self.research_queue or ""
	for i=1,Min(#queue, queue_idx - 1) do
		if queue[i] == tech_id then
			count = count + 1
		end
	end
	status.researched = (researched or 0) + count
	local cost = self:TechCost(tech_id)
	status.researched = researched
	return cost
end

function City:BoostTechField(tech_field, boost_percent)
	local boost = self.TechBoostPerField
	if not tech_field or tech_field == "" then
		for field_id in pairs(TechFields) do
			boost[field_id] = (boost[field_id] or 0) + boost_percent
		end
	else
		boost[tech_field] = (boost[tech_field] or 0) + boost_percent
	end
end

--[[@@@
Boost technology research speed by reducing the needed research points of all technologies in that field with given percent. Calling multiple times, sums percents before applying them.
@function void Gameplay@BoostTechField(string field, int percent)
@param string field - technology field. Passing "" to that parameter sets boost percent for all technology fields.
@param int percent - boost persent change.
--]]
function BoostTechField(field, percent)
	return UICity:BoostTechField(field, percent)
end

--[[@@@
Boost specific technology research speed by reducing the needed research points for it with given percent. Calling multiple times, sums percents before applying them.
@function void Gameplay@BoostTech(string tech_id, int percent)
@param string tech_id - technology id.
@param int percent - boost persent change.
--]]
function BoostTech(tech_id, percent)
	 UICity.TechBoostPerTech[tech_id] = (UICity.TechBoostPerTech[tech_id] or 0) + percent
end

--[[
- returns queue index, nil if not in queue
--]]
function City:TechQueueIndex(tech_id)
	return table.find(self.research_queue, tech_id)
end

--[[
-- adds to the queue
--]]
function City:QueueResearch(tech_id, first)
	if not self:IsTechResearchable(tech_id) 
	or #self.research_queue > const.ResearchQueueSize 
	or not self:IsTechRepeatable(tech_id) and self:TechQueueIndex(tech_id) then
		return
	end
	
	HintDisable("HintResearchAvailable")
	
	if first then
		table.insert(self.research_queue, 1, tech_id)
	else
		table.insert(self.research_queue, tech_id)
	end
	Msg("ResearchQueueChange", self, tech_id)
	return true
end

--[[
- removed from the queue
--]]
function City:DequeueResearch(tech_id, all)
	local queue = self.research_queue
	local success
	for i = #queue, 1, -1 do
		if queue[i] == tech_id then
			table.remove(queue, i)
			success = true
			if not all then
				break
			end
		end
	end
	if success then
		Msg("ResearchQueueChange", self, tech_id)
		return true
	end
end

function OnMsg.ResearchQueueChange(city, tech_id)
	ObjModified(TechDef[tech_id])
	ObjModified(city.research_queue)
	for i, id in ipairs(city.research_queue) do
		ObjModified(TechDef[id])
	end
	city:CheckAvailableTech()
end

--[[
- returns a queue with tech ids
--]]
function City:GetResearchQueue()
	return self.research_queue
end

--[[
- count the number of tech in a field with a specific state (false/"discovered"/"researched")
--]]
function City:TechCount(field_id, state)
	local list = self.tech_field[field_id] or empty_table
	local count = 0
	for i=1,#list do
		if state == "researched" and self:IsTechResearched(list[i])
		or state == "discovered" and self:IsTechDiscovered(list[i])
		or not state and not self:IsTechDiscovered(list[i])
		then
			count = count + 1
		end
	end
	return count, #list
end

GlobalVar("TechLastSeen", 0)

function City:IsTechNew(tech_id)
	local status = self.tech_status[tech_id]
	local new_since = status and status.new
	if new_since == true then
		new_since = GameTime()
		status.new = new_since
	end
	return (new_since or 0) > TechLastSeen
end

function City:SetTechNew(tech_id, is_new)
	local status = self.tech_status[tech_id]
	if not status then
		assert(false, "No such tech")
		return
	end
	status.new = is_new and GameTime() or nil
	return true
end

function City:ModifyResearchPoints(research_points, tech_id)
	tech_id = tech_id or self.research_queue[1]
	if tech_id and not self:IsTechDiscoverable(tech_id) then
		research_points = MulDivRound(research_points, g_Consts.BreakthroughResearchSpeedMod, 100)
	else
		research_points = MulDivRound(research_points, g_Consts.ExperimentalResearchSpeedMod, 100)
	end
	return MulDivRound(research_points, 100 + OmegaTelescopeResearchBoostPercent(self), 100)
end

function City:UnmodifyResearchPoints(research_points, tech_id)
	tech_id = tech_id or self.research_queue[1]
	research_points = MulDivRound(research_points, 100, 100 + OmegaTelescopeResearchBoostPercent(self))
	if tech_id and not self:IsTechDiscoverable(tech_id) then
		research_points = MulDivRound(research_points, 100, g_Consts.BreakthroughResearchSpeedMod)
	else
		research_points = MulDivRound(research_points, 100, g_Consts.ExperimentalResearchSpeedMod)
	end
	return research_points
end

function City:GetCheapestTech()
	local field_ids = table.keys(self.tech_field)
	table.sort(field_ids, function(f1, f2) return TechFields[f1].SortKey < TechFields[f2].SortKey end)
	local cheapest_cost, cheapest_tech = max_int
	for _, field_id in ipairs(field_ids) do
		for _, tech_id in ipairs(self.tech_field[field_id]) do
			local status = self.tech_status[tech_id]
			if status and status.discovered and not status.researched then
				local cost = self:TechCost(tech_id)
				if cheapest_cost > cost then
					cheapest_cost = cost
					cheapest_tech = tech_id
				end
			end
		end
	end
	return cheapest_tech
end

function City:AddResearchPoints(research_points, tech_id)
	if research_points <= 0 then
		return
	end
	local current_research = self.research_queue[1]
	tech_id = tech_id or current_research or self:GetCheapestTech()
	if not tech_id then
		return
	end
	if not self:IsTechResearchable(tech_id) then
		assert(false, "Trying to add RP to a non-researchable tech!")
		return
	end
	local scale = const.ResearchPointsScale
	local available_points = self:ModifyResearchPoints(research_points * scale, tech_id)
	local status = self.tech_status[tech_id]
	if not status then
		assert(false, "No such tech!")
		return
	end
	local research_cost = self:TechCost(tech_id)
	assert(research_cost > 0)
	status.points = status.points + available_points
	local remaining_points = status.points - research_cost * scale
	if remaining_points < 0 then
		-- research isn't completed
		return
	end
	if not self:SetTechResearched(tech_id, "notify") then
		assert(false, "Tech research failed!?")
		return
	end
	research_points = self:UnmodifyResearchPoints(remaining_points, tech_id) / scale
	return self:AddResearchPoints(research_points)
end

function City:CheckAvailableTech()
	if g_Tutorial and not g_Tutorial.EnableResearchWarning then
		return
	end
	if self.research_queue[1] then
		RemoveOnScreenNotification("ResearchAvailable")
		return
	elseif IsOnScreenNotificationShown("ResearchAvailable") then
		return
	end
	for field, techs in pairs(self.tech_field) do
		for i=1,#techs do
			if self:IsTechResearchable(techs[i]) then
				AddOnScreenNotification("ResearchAvailable", OpenResearchDialog)
				return
			end
		end
	end
end

--[[
- returns tech_id, points, max_points
--]]
function City:GetResearchInfo(tech_id)
	tech_id = tech_id or self.research_queue[1]
	local status = tech_id and self.tech_status[tech_id]
	if not status then
		return false
	end
	return tech_id, status.points / const.ResearchPointsScale, self:TechCost(tech_id), status.researched
end

--[[
- returns percentage of current research
--]]
function City:GetResearchProgress()
	local tech_id, points, max_points = self:GetResearchInfo()
	if not tech_id then return 0 end
	return MulDivRound(100, points, max_points)
end

----

function City:GetEstimatedRP_Outsource()
	local time = const.DayDuration
	if UICity.paused_outsource_research_end_time then
		time = Max(time - Max(UICity.paused_outsource_research_end_time - GameTime(), 0), 0)
	end
	return self:CalcOutsourceRP(time)
end

function City:CalcOutsourceRP(time)
	time = time or const.DayDuration
	local hours = time / const.HourDuration
	local list = self.OutsourceResearchPoints
	local pts = 0
	for i=1,Min(hours, #list) do
		pts = pts + list[i]
	end
	return pts
end

function City:OutsourceResearch(points, time, orders)
	points = points or 500
	time = time or 5*const.DayDuration
	local list = self.OutsourceResearchPoints
	local uses = self.OutsourceResearchOrders
	local hours = time / const.HourDuration
	for i = 1, hours do
		list[i] = (list[i] or 0) + points * i / hours - points * (i - 1) / hours
		uses[i] = (uses[i] or 0) + (orders or 1)
	end
	ObjModified(self)
end

function City:GetEstimatedRP()
	local estimate = self:GetEstimatedRP_ResearchBuildings()
		+ self:GetEstimatedRP_Genius()
		+ self:GetEstimatedRP_Sponsor()
		+ self:GetEstimatedRP_Outsource()
		+ self:GetEstimatedRP_Explorer()
		+ self:GetEstimatedRP_SuperconductingComputing()
	return self:ModifyResearchPoints(estimate)
end

function City:GetEstimatedRP_ResearchBuildings()
	local total = 0
	for _, lab in ipairs(self.labels.ResearchBuildings or empty_table) do
		total = total + lab:GetEstimatedDailyProduction()
	end
	return total
end

function City:GetEstimatedRP_Genius()
	local count = 0
	for _, dome in ipairs(UICity.labels.Dome or empty_table) do		
		for __, col in ipairs(dome.labels.Genius or empty_table) do
			if col.stat_sanity >= g_Consts.HighStatLevel then
				count = count + 1
			end
		end
	end
	return count * TraitPresets.Genius.param
end

function City:GetEstimatedRP_Sponsor()
	local research = g_Consts.SponsorResearch
	if IsGameRuleActive("EasyResearch") then
		research = research + 3000
	end
	if UICity.paused_sponsor_research_end_time then
		local time_remaining = Max(UICity.paused_sponsor_research_end_time - GameTime(), 0)
		if time_remaining < const.DayDuration then
			local hours_remaining = time_remaining / const.HourDuration + 1
			research = MulDivRound(const.HoursPerDay-hours_remaining, research, const.HoursPerDay)
		else
			research = 0
		end
	end
	
	return research
end

function City:GetEstimatedRP_SuperconductingComputing()
	if g_Consts.ElectricityForResearchPoint ~= 0 then
		local waste = 0
		for i = 1, #self.electricity do
			waste = waste + self.electricity[i].current_waste 
		end
		local rp, rem = self:ElectricityToResearch(waste, const.HoursPerDay)
		return rp
	end
	return 0
end

function City:CalcExplorerResearchPoints(dt, log)
	local total,rp = 0, 0
	if self:IsTechResearched("ExplorerAI") then
		local one_rover_rp = MulDivRound(g_Consts.ExplorerRoverResearchPoints, dt, const.DayDuration)
		local count = 0
		for _, rover in ipairs(self.labels.ExplorerRover or empty_table) do
			if not ExplorerRover.StopResearchCommands[rover.command] then
				count = count + 1
				if log then
					rover:LogRP(one_rover_rp)
				end
			end
		end
		rp = count * one_rover_rp
		total = rp
		if count > 1 then
			local collaboration = Min(g_Consts.MaxResearchCollaborationLoss, (count - 1) * 10)
			rp = MulDivRound(rp, 100 - collaboration, 100)
		end
	end
	return rp, total - rp
end

function City:AddExplorerResearchPoints()
	local tech_id =  self.research_queue[1]
	if not tech_id or not self:IsTechResearchable(tech_id) then
		return 0
	end

	return self:CalcExplorerResearchPoints(const.HourDuration, "log")
end

function City:GetEstimatedRP_Explorer()
	return self:CalcExplorerResearchPoints(const.DayDuration)
end

function City:CalcSponsorResearchPoints(delta)
	local research_per_sol = g_Consts.SponsorResearch
	if IsGameRuleActive("EasyResearch") then
		research_per_sol = research_per_sol + 3000
	end
	return MulDivRound(delta, research_per_sol, const.DayDuration)
end

function City:GetUIResearchProject()
	local research = self:GetResearchInfo()
	if research then return TechDef[research].display_name end
	return T(7350, "<red>No active research</red>")
end

----

function OpenResearchDialog()
	OpenDialog("ResearchDlg")
end

function CloseResearchDialog()
	CloseDialog("ResearchDlg")
end

----

function OnMsg.NewMapLoaded()
	if UICity then
		UICity:LoadMapStoredTechs()
	end
end
function OnMsg.SaveMap()
	if UICity then
		UICity:SaveMapStoredTechs()
	end
end

function City:LoadMapStoredTechs()	
	--Blank (random) maps should not have prediscovered/preresearched techs (mantis:0130773)
	if mapdata.IsRandomMap then
		return
	end
	
	local tech_state = mapdata.TechState or ""
	for i=1,#tech_state,2 do
		local tech_id = tech_state[i]
		local tech_state = tech_state[i+1]
		if tech_state == "researched" then
			self:SetTechResearched(tech_id)
		elseif tech_state == "discovered" then
			self:SetTechDiscovered(tech_id)
		end
	end
end
function City:SaveMapStoredTechs()	
	local tech_state
	for field_id, list in sorted_pairs(self.tech_field) do
		for i=1,#list do
			local tech_id = list[i]
			local status = self:IsTechResearched(tech_id) and "researched" or self:IsTechDiscovered(tech_id) and "discovered" or nil
			if status then
				tech_state = tech_state or {}
				tech_state[#tech_state + 1] = tech_id
				tech_state[#tech_state + 1] = status
			end
		end
	end
	assert(not (mapdata.IsRandomMap and tech_state), "Blank (random) maps should not have prediscovered/preresearched techs") --(mantis:0130773)
	mapdata.TechState = tech_state
end

----

function City:UITechField(field_id)
	local field_def = TechFields[field_id]
	if field_def.show_in_field ~= "" then
		return empty_table
	end
	local list = table.icopy(self.tech_field[field_id])
	-- link common lists
	for field_i, list_i in sorted_pairs(self.tech_field) do
		if TechFields[field_i].show_in_field == field_id then
			table.append(list, list_i)
		end
	end
	if not field_def.discoverable then
		-- hide not-yet-unlocked techs in the non-discoverable fields
		for i=#list,1,-1 do
			if not self:IsTechDiscovered(list[i]) then
				table.remove(list, i)
			end
		end
		local status = self.tech_status
		table.stable_sort(list, function(a, b) return (status[a].discovered or max_int) < (status[b].discovered or max_int) end)
	end
	return list
end

if FirstLoad then
	g_ResearchDlgPendingScrollOffsetX = 0
end

function ResearchDlgOnShortcut(self, shortcut, source)
	local f = self.desktop.keyboard_focus
	if f and f.FocusOrder and f.FocusOrder:x() == 1000 and (shortcut == "LeftShoulder" or XShortcutToRelation[shortcut] == "left") then
		local log = self.desktop.focus_log
		for i = #log, 1, -1 do
			local win = log[i]
			if log[i]:IsKindOf("XTechControl") and win.FocusOrder and win.FocusOrder:x() < 1000 then
				win:SetFocus()
				return "break"
			end
		end
		local f = self:GetRelativeFocus(point(1, 1), "exact")
		if f then
			f:SetFocus()
		end
		return "break"
	end
	if shortcut == "RightShoulder" then
		local f = self:GetRelativeFocus(point(1000, 1), "exact")
		if f then
			f:SetFocus()
		end
		return "break"
	elseif shortcut == "Back" or shortcut == "TouchPadClick" then
		if DismissCurrentOnScreenHint() then
			return "break"
		end
	elseif VKStrNames[hr.CameraRTSKeyPanLeft] == shortcut or VKStrNames[hr.CameraRTSKeyPanLeftAlt] == shortcut or shortcut == "MouseWheelFwd" then
		g_ResearchDlgPendingScrollOffsetX = -30
	elseif VKStrNames[hr.CameraRTSKeyPanRight] == shortcut or VKStrNames[hr.CameraRTSKeyPanRightAlt] == shortcut or shortcut == "MouseWheelBack" then
		g_ResearchDlgPendingScrollOffsetX = 30
	end
	return XDialog.OnShortcut(self, shortcut, source)
end


----- XTechControl

DefineClass.XTechControl = {
	__parents = {"XContextControl"},
	RolloverDrawOnTop = true,
	RolloverOnFocus = true,
	MinWidth = 200,
	MaxWidth = 200,
	RolloverZoom = 1100,
	RolloverTemplate = "Rollover",
	FXMouseIn = "TechMouseIn",
	HandleMouse = false,
}

function XTechControl:Init(parent, tech)
	local valign = #parent % 2 == 1 and "top" or "bottom"
	self:SetVAlign(valign)
	self:SetRelativeFocusOrder(#parent == 1 and "new-line" or "next-in-line")
	local tech_id = tech.id
	local icon = UICity:IsTechDiscovered(tech_id) and tech.icon
	local researched = UICity:IsTechResearched(tech_id) and not UICity:IsTechRepeatable(tech_id)
	local content = XWindow:new({
		Id = "idContent",
		HAlign = "center",
		VAlign = "center",
		Shape = "InHHex",
		HandleMouse = true,
	}, self)
	XImage:new({
		Id = "idIcon",
		Image = icon or "UI/Icons/Research/rm_unknown.tga",
		Desaturation = researched and 255 or 0,
	}, content)
	if researched then
		XImage:new({
			Image = "UI/Icons/Research/rm_researched.tga",
		}, content)
	end
	XImage:new({
		Id = "idRollover",
		Image = "UI/Icons/Research/rm_shine.tga",
		Desaturation = icon and 0 or 200,
		Transparency = icon and 0 or 125,
	}, content):SetVisible(false)
	if UICity:IsTechNew(tech_id) and UICity:IsTechDiscovered(tech_id) then
		local glow = XImage:new({
			Id = "idUnseenGlow",
			Image = "UI/Icons/Research/rm_shine.tga",
		}, content)
		glow:AddInterpolation{
			type = const.intAlpha,
			startValue = 80,
			endValue = 255,
			duration = 1500,
			easing = const.Easing.SinInOut,
			flags = const.intfPingPong + const.intfLooping,
		}
	end
	XImage:new({
		Id = "idQueueIndex",
		Margins = box(0, 0, 30, -10),
		HAling = "right",
		VAlign = "bottom",
		Image = "UI/Icons/message_1.tga",
	}, content)
end

function XTechControl:OnShortcut(shortcut, source)
	local tech_id = self.context.id
	if shortcut == "MouseL" or shortcut == "ButtonA" then -- add
		if UICity:QueueResearch(tech_id) then
			PlayFX("EnqueueResearch", "start")
		else
			PlayFX("UIDisabledButtonPressed", "start")
		end
		return "break"
	end
	if shortcut == "MouseR" or shortcut == "ButtonX" then -- remove
		if UICity:DequeueResearch(tech_id) then
			PlayFX("DequeueResearch", "start")
		else
			PlayFX("UIDisabledButtonPressed", "start")
		end
		return "break"
	end
	if shortcut == "Ctrl-MouseL" or shortcut == "RightTrigger-ButtonA" then -- add to queue start
		if not UICity:IsTechResearchable(tech_id) then
			PlayFX("UIDisabledButtonPressed", "start")
			return "break"
		end
		if UICity:TechQueueIndex(tech_id) and not UICity:IsTechRepeatable(tech_id) then
			UICity:DequeueResearch(tech_id)
		end
		if #UICity.research_queue > const.ResearchQueueSize then
			UICity:DequeueResearch(UICity.research_queue[#UICity.research_queue])
		end
		if UICity:QueueResearch(tech_id, true) then
			PlayFX("EnqueueResearch", "start")
		else
			PlayFX("UIDisabledButtonPressed", "start")
		end
		return "break"
	end
end

function XTechControl:OnSetRollover(rollover)
	if rollover and GetUIStyleGamepad() then
		-- field or self
		local win = self.FocusOrder:x() == 1 and self.parent.parent.idFieldName or self
		local x1, y1, x2, y2 = win.box:xyxy()
		-- XScrollArea
		self.parent.parent.parent:ScrollIntoView(box(x1, y1, x2 + 100, y2))
	end
	XContextControl.OnSetRollover(self, rollover)
end

function XTechControl:OnContextUpdate(tech)
	local index = UICity:TechQueueIndex(tech.id)
	self.idQueueIndex:SetVisible(index)
	if index then
		self.idQueueIndex:SetImage(string.format("UI/Icons/message_%d.tga", index))
	end
end

function XTechControl:CreateRolloverWindow(gamepad, context, pos)
	if rawget(self, "idUnseenGlow") then
		CreateRealTimeThread(function(self)
			Sleep(400)
			if RolloverControl == self then
				UICity:SetTechNew(self.context.id, false)
				self.idUnseenGlow:SetVisible(false)
			end
		end, self)
	end
	return XContextControl.CreateRolloverWindow(self, gamepad, context, pos)
end

function XTechControl:GetRolloverTitle()
	local tech_id = self.context.id
	if UICity:IsTechDiscovered(tech_id) then
		return T(3917, "<display_name> (<FieldDisplayName>)")
	else
		return T(3918, "Unknown Tech (<FieldDisplayName>)")
	end
end

function XTechControl:GetRolloverText()
	local tech_id = self.context.id
	local discovered = UICity:IsTechDiscovered(tech_id)
	local researched = UICity:IsTechResearched(tech_id)

	if not discovered and not researched then
		return T(3919, "<FieldDescription><newline><newline>To unlock, research more technologies in this field or use the Explorer rover to analyze anomalies.")
	elseif researched and not UICity:IsTechRepeatable(tech_id) then
		return T(3920, "<description><newline><newline><em>Researched</em>")
	end
	local percent = (UICity.TechBoostPerTech[tech_id] or 0) + (UICity.TechBoostPerField[TechDef[tech_id].group] or 0)
	local percent_check = percent > 0
	return T{10980, "<description><newline><newline>Research cost<right><ResearchPoints(cost)><if(percent_check)><newline><left>Cost reduction<right><percent>%</if>", percent = percent, percent_check = percent_check }
end

local queue = T(3923, "<left><left_click> Queue for research<right><em>Ctrl+<left_click></em> Queue on top")
local dequeue = T(7775, "<right_click> Remove from research queue") 
local queue_dequeue = queue .. "<newline><center>" .. dequeue
local first_inqueue = T(8534, "<em>Ctrl+<left_click></em> Queue on top")
function XTechControl:GetRolloverHint()
	local tech_id = self.context.id
	if UICity:IsTechResearchable(tech_id) then
		if not UICity:TechQueueIndex(tech_id) then
			return queue
		end
		if UICity:IsTechRepeatable(tech_id) then
			return queue_dequeue
		end
		return dequeue.."<newline><center>"..first_inqueue
	end
	return ""
end

local gamepad_queue = T(3925, "<left><ButtonA> Queue for research<right><RightTrigger><ButtonA> Queue on top")
local gamepad_dequeue = T(3924, "<ButtonX> Remove from research queue")
local gamepad_queue_dequeue = gamepad_queue .. "<newline><center>" .. gamepad_dequeue
local gamepad_first_inqueue = T(8659, "<RightTrigger><ButtonA> Queue on top")
function XTechControl:GetRolloverHintGamepad()
	local tech_id = self.context.id
	if UICity:IsTechResearchable(tech_id) then
		if not UICity:TechQueueIndex(tech_id) then
			return gamepad_queue
		end
		if UICity:IsTechRepeatable(tech_id) then
			return gamepad_queue_dequeue
		end
		return gamepad_dequeue.."<newline><center>"..gamepad_first_inqueue
	end
	return ""
end