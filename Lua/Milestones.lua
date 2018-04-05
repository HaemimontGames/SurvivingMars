DefineClass.Milestone = {
	__parents = { "Preset" },
	properties = {
		{ id = "display_name", name = T{1153, "Display Name"}, editor = "text", default = "", translate = true, },
		{ id = "base_score", name = T{1154, "Base Score"}, editor = "number", default = 1000, },
		{ id = "bonus_score", name = T{1155, "Bonus Score"}, editor = "number", default = 1000, },
		{ id = "bonus_score_expiration", name = T{1156, "Bonus score expiration Sols"}, editor = "number", default = 10, },
		{ id = "Complete", name = T{1157, "Complete thread"}, editor = "func" },
		{ id = "GetScore", name = T{1158, "Custom score"}, editor = "func", },
	},
	PropertyTranslation = true,
	HasSortKey = true,
}

function Milestone:Complete()
	print("Milestone without a complete func", self.id)
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
	end
	return self.display_name
end

GlobalVar("MilestoneCompleted", {})
GlobalVar("MilestoneThreads", {})

GlobalVar("ChallengeRating", 100)

function OnMsg.NewDay()
	-- update challenge raiting in case it was affcted by later events
	ChallengeRating = CalcChallengeRating()
end

function MilestoneRestartThreads()
	for _, milestone in ipairs(Presets.Milestone.Default) do
		local id = milestone.id
		if MilestoneCompleted[id] == nil then
			DeleteThread(MilestoneThreads[id])
			MilestoneThreads[id] = CreateGameTimeThread(function(id)
				local milestone = Presets.Milestone.Default[id]
				local res = milestone:Complete(UICity)
				MilestoneThreads[id] = nil
				if milestone then -- some milestones might have disappeared (loadgame after patch)
					MilestoneCompleted[id] = res and GameTime() or false
					if res then
						AddOnScreenNotification("MilestoneComplete", function() OpenXDialog("Milestones") end, {
							display_name = milestone.display_name,
							score = milestone:GetScore()
						})
					end
					ObjModified(MilestoneCompleted)
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
		if ok and DataInstances.BuildingTemplate[bld.template_name] and DataInstances.BuildingTemplate[bld.template_name].wonder then
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