DefineClass.Milestone = {
	__parents = { "Preset" },
	properties = {
		{ id = "display_name", name = T(1153, "Display Name"), editor = "text", default = "", translate = true, },
		{ id = "description", name = T(1000017, "Description"), editor = "text", default = "", translate = true, lines = 3, },
		{ id = "base_score", name = T(1154, "Base Score"), editor = "number", default = 1000, },
		{ id = "bonus_score", name = T(1155, "Bonus Score"), editor = "number", default = 1000, },
		{ id = "bonus_score_expiration", name = T(1156, "Bonus score expiration Sols"), editor = "number", default = 10, },
		{ id = "reward_research", name = T(11714, "Reward (RP)"), editor = "number", default = 250, },
		{ id = "trigger_fireworks", name = T(11412, "Trigger fireworks"), editor = "bool", default = false, },
		{ id = "Complete", name = T(1157, "Complete thread"), editor = "func" },
		{ id = "GetScore", name = T(1158, "Custom score"), editor = "func", },
	},
	PropertyTranslation = true,
	HasSortKey = true,
	EditorMenubarName = "Milestones",
	EditorMenubar = "Editors.Game",
}

function Milestone:Complete()
	print("Milestone without a complete func", self.id)
	return true
end

-- nil means not-yet, false means failed, X means completed with score X
function Milestone:GetScore()
	local time = MilestoneCompleted[self.id]
	local expiration_days = self.bonus_score_expiration
	-- give full score on day 1
	return time and (self.base_score + Max(0, MulDivTrunc(self.bonus_score, expiration_days - (TimeToDayHour(time) - 1), expiration_days)))
end

function Milestone:GetChallengeScore()
	local score = self:GetScore()
	return score and MulDivRound(score, ChallengeRating, 100)
end

-- nil means not-yet, false means failed, X means completed on sol X
function Milestone:CompleteSol(milestone)
	local time = MilestoneCompleted[self.id]
	return time and ((time + City.hour * const.HourDuration) / const.DayDuration + 1)
end

function Milestone:GetCompleteText()
	local sol = self:CompleteSol()
	if sol then
		return  T{1159, "<display_name> - Sol <sol>", self, sol = sol}
	elseif sol == false then
		local enactor = MilestoneEnactors[self.id]
		if enactor and enactor ~= UICity then
			return T{11675, "<display_name> - <enactor>", self, enactor = enactor.display_name}
		end
	end
	return self.display_name
end

GlobalVar("MilestoneCompleted", {})
GlobalVar("MilestoneThreads", {})
GlobalVar("MilestoneEnactors", {})
GlobalVar("ChallengeRating", 100)

function OnMsg.NewDay()
	-- update challenge raiting in case it was affcted by later events
	ChallengeRating = 100 + CalcChallengeRating()
end

function MilestoneRestartThreads()
	if g_Tutorial or not mapdata.GameLogic then return end
	local available_milestones = GetAvailablePresets(Presets.Milestone.Default)
	for _, milestone in ipairs(available_milestones) do
		local id = milestone.id
		if MilestoneCompleted[id] == nil then
			DeleteThread(MilestoneThreads[id])
			MilestoneThreads[id] = CreateGameTimeThread(function(id)
				assert(UICity)
				if not UICity then
					return
				end
				local res = milestone:Complete(UICity)
				if milestone.class == "UnpersistedMissingPreset" then
					return
				end
				MilestoneThreads[id] = nil
				if MilestoneCompleted[id] ~= nil then 
					-- some milestones could have already been failed
					return
				end
				MilestoneCompleted[id] = res and GameTime() or false
				ObjModified(MilestoneCompleted)
				if not res then
					return
				end
				MilestoneEnactors[id] = UICity
				Msg("MilestoneCompleted", id)
				AddOnScreenNotification("MilestoneComplete", function() OpenDialog("Milestones") end, {
					display_name = milestone.display_name,
					reward_research = milestone.reward_research,
					score = milestone:GetScore()
				})
				if milestone.trigger_fireworks then
					TriggerFireworks()
				end
				local sponsor = GetMissionSponsor()
				local commander = GetCommanderProfile()
				if id == "Evaluation" and sponsor.goal == "" then
					WaitPopupNotification(sponsor.goal_completed_message, { params = { sponsor_name = sponsor.display_name, commander_profile = commander.display_name, score = milestone:GetScore() } })
				end
				
				local all_completed = true
				local score_sum = 0
				for _, milestone in ipairs(available_milestones) do
					local id = milestone.id
					if not MilestoneCompleted[id] then
						all_completed = false
						break
					end
					score_sum = score_sum + milestone:GetScore()
				end
				if all_completed then
					WaitPopupNotification("AllMilestonesCompleted", { params = { sponsor = sponsor.display_name, commander = commander.display_name, sol = UICity.day, score = score_sum } })
				end
			end, id)
		end
	end
end

function OnMsg.GameTimeStart()
	MilestoneRestartThreads()
end

-- start threads for milestones that may have appeared after the game was saved
-- restart all others to test if they work if started later
function OnMsg.LoadGame()
	MilestoneRestartThreads()
end

GlobalVar("g_PopulationHighWatermark", 0)

function UpdatePopulationHighWatermark()
	CreateGameTimeThread(function()
		local population = #(UICity.labels.Colonist or empty_table)
		if population > g_PopulationHighWatermark then
			g_PopulationHighWatermark = population
			Msg("PopulationHighWatermark")
		end
	end)
end

OnMsg.ColonistArrived = UpdatePopulationHighWatermark
OnMsg.ColonistBorn = UpdatePopulationHighWatermark

function Milestone_Population(pop)
	while true do
		if g_PopulationHighWatermark >= pop then return true end
		WaitMsg("PopulationHighWatermark")
	end
end

function Milestone_Building(class)
	while true do
		local ok, bld = WaitMsg("ConstructionComplete")
		if ok and (bld:IsKindOf(class) or bld.template_name == class) then
			return true
		end
	end
end

function Milestone_Wonder()
	while true do
		local ok, bld = WaitMsg("ConstructionComplete")
		if ok and BuildingTemplates[bld.template_name] and BuildingTemplates[bld.template_name].wonder then
			return true
		end
	end
end

function Milestone_AllSectorsScanned()
	local n = const.SectorCount
	
	while true do
		WaitMsg("SectorScanned")
		local scanned = true
		for x = 1, n do
			if not scanned then break end
			for y = 1, n do
				if g_MapSectors[x][y].status == "unexplored" then
					scanned = false
					break
				end
			end
		end
		if scanned then
			return true
		end
	end
end

function Milestone_WorkshopWorkersPercent(city, target_percent)
	local min_interval = const.HourDuration
	local max_interval = const.DayDuration
	while true do
		local current_percent = city and city:GetWorkshopWorkersPercent() or 0
		if current_percent >= target_percent then
			return true
		end
		local interval = min_interval + MulDivRound(max_interval - min_interval, target_percent - current_percent, target_percent)
		Sleep(interval)
	end
end

function OnMsg.MilestoneCompleted(milestone_id)
	local enactor = MilestoneEnactors[milestone_id]
	local research = Presets.Milestone.Default[milestone_id].reward_research
	if enactor == UICity then
		GrantResearchPoints(research)
	else
		enactor.resources.research = enactor.resources.research + research
	end
end