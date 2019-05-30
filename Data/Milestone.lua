-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('Milestone', {
	Complete = function (self)
CreateGameTimeThread(function()
	WaitMsg("AnomalyAnalyzed")
	Msg("MilestoneAnomalyAnalyzed")
end)
CreateGameTimeThread(function()
	WaitMsg("PlanetaryAnomalyAnalyzed")
	Msg("MilestoneAnomalyAnalyzed")
end)
WaitMsg("MilestoneAnomalyAnalyzed")
return true
end,
	SortKey = 1000,
	base_score = 100,
	bonus_score = 300,
	bonus_score_expiration = 30,
	display_name = T(979029137252, --[[Milestone Default ScanAnomaly display_name]] "Scan an Anomaly"),
	group = "Default",
	id = "ScanAnomaly",
})

PlaceObj('Milestone', {
	Complete = function (self)
WaitMsg("RocketLaunched")
return true
end,
	SortKey = 2000,
	base_score = 100,
	bonus_score = 300,
	bonus_score_expiration = 30,
	display_name = T(326786953545, --[[Milestone Default ReturnRocket display_name]] "Launch a Rocket from Mars"),
	group = "Default",
	id = "ReturnRocket",
})

PlaceObj('Milestone', {
	Complete = function (self)
if MapCount("map", "SubsurfaceDeposit", function(o) return o.revealed and o.resource == "Water" end ) > 0 then return true end
WaitMsg("WaterDepositRevealed")
return true
end,
	SortKey = 3000,
	base_score = 100,
	bonus_score = 300,
	bonus_score_expiration = 30,
	display_name = T(761999391455, --[[Milestone Default FindWater display_name]] "Find Water on Mars"),
	group = "Default",
	id = "FindWater",
})

PlaceObj('Milestone', {
	Complete = function (self)
return Milestone_Building("Dome")
end,
	SortKey = 4000,
	base_score = 100,
	bonus_score = 600,
	bonus_score_expiration = 60,
	display_name = T(639900467782, --[[Milestone Default ConstructDome display_name]] "Construct a Dome"),
	group = "Default",
	id = "ConstructDome",
	reward_research = 500,
})

PlaceObj('Milestone', {
	Complete = function (self)
WaitMsg("ColonistArrived")
return true
end,
	SortKey = 5000,
	base_score = 100,
	bonus_score = 800,
	bonus_score_expiration = 80,
	display_name = T(168049511046, --[[Milestone Default FirstHumanOnMars display_name]] "First human on Mars"),
	group = "Default",
	id = "FirstHumanOnMars",
})

PlaceObj('Milestone', {
	Complete = function (self)
WaitMsg("ColonistBorn")
return true
end,
	SortKey = 6000,
	base_score = 300,
	bonus_score_expiration = 100,
	display_name = T(488379408129, --[[Milestone Default Martianborn display_name]] "First Martianborn"),
	id = "Martianborn",
	reward_research = 500,
	trigger_fireworks = true,
})

PlaceObj('Milestone', {
	Complete = function (self)
WaitMsg("FoodProduced")
return true
end,
	SortKey = 7000,
	base_score = 300,
	bonus_score_expiration = 100,
	display_name = T(665036099552, --[[Milestone Default ProduceFood display_name]] "Produce Food"),
	group = "Default",
	id = "ProduceFood",
	trigger_fireworks = true,
})

PlaceObj('Milestone', {
	Complete = function (self)
while true do
	WaitMsg("TechResearched")
	if g_BreakthroughsResearched > 0 then 
		return true 
	end	
end
end,
	SortKey = 8000,
	base_score = 300,
	bonus_score_expiration = 100,
	display_name = T(149119990393, --[[Milestone Default ResearchBreakthrough display_name]] "Research a Breakthrough"),
	group = "Default",
	id = "ResearchBreakthrough",
	reward_research = 500,
})

PlaceObj('Milestone', {
	Complete = function (self)
WaitMsg("MissionEvaluationDone")
return true
end,
	SortKey = 9000,
	base_score = 300,
	bonus_score = 2000,
	bonus_score_expiration = 200,
	display_name = T(106610630022, --[[Milestone Default SponsorGoals display_name]] "All Sponsor Goals"),
	group = "Default",
	id = "SponsorGoals",
	reward_research = 2500,
	trigger_fireworks = true,
})

PlaceObj('Milestone', {
	Complete = function (self)
return Milestone_AllSectorsScanned()
end,
	SortKey = 10000,
	base_score = 300,
	bonus_score = 2000,
	bonus_score_expiration = 200,
	display_name = T(785508231749, --[[Milestone Default ScanAllSectors display_name]] "Scan all Sectors"),
	group = "Default",
	id = "ScanAllSectors",
	reward_research = 2500,
})

PlaceObj('Milestone', {
	Complete = function (self)
return Milestone_Population(100)
end,
	SortKey = 11000,
	base_score = 300,
	bonus_score = 2000,
	bonus_score_expiration = 200,
	display_name = T(180356594159, --[[Milestone Default Population100 display_name]] "100 Colonists"),
	group = "Default",
	id = "Population100",
	reward_research = 1000,
	trigger_fireworks = true,
})

PlaceObj('Milestone', {
	Complete = function (self)
return Milestone_Population(500)
end,
	SortKey = 12000,
	base_score = 500,
	bonus_score = 3000,
	bonus_score_expiration = 300,
	display_name = T(539130058924, --[[Milestone Default Population500 display_name]] "500 Colonists"),
	group = "Default",
	id = "Population500",
	reward_research = 2500,
	trigger_fireworks = true,
})

PlaceObj('Milestone', {
	Complete = function (self)
return Milestone_Population(1000)
end,
	SortKey = 13000,
	bonus_score = 5000,
	bonus_score_expiration = 500,
	display_name = T(174129126515, --[[Milestone Default Population1000 display_name]] "1000 Colonists"),
	group = "Default",
	id = "Population1000",
	reward_research = 5000,
	trigger_fireworks = true,
})

PlaceObj('Milestone', {
	Complete = function (self)
return Milestone_Building("DomeMega")
end,
	SortKey = 14000,
	bonus_score = 5000,
	bonus_score_expiration = 500,
	display_name = T(833327755106, --[[Milestone Default ConstructMegaDome display_name]] "Construct a Mega Dome"),
	group = "Default",
	id = "ConstructMegaDome",
	reward_research = 2500,
	trigger_fireworks = true,
})

PlaceObj('Milestone', {
	Complete = function (self)
return Milestone_Wonder()
end,
	SortKey = 15000,
	bonus_score = 5000,
	bonus_score_expiration = 500,
	display_name = T(781931111320, --[[Milestone Default ConstructWonder display_name]] "Construct a Wonder"),
	group = "Default",
	id = "ConstructWonder",
	reward_research = 5000,
	trigger_fireworks = true,
})

PlaceObj('Milestone', {
	Complete = function (self, city)
	return Milestone_WorkshopWorkersPercent(city, 40)
end,
	SortKey = 16000,
	bonus_score = 3000,
	bonus_score_expiration = 300,
	display_name = T(590068197487, --[[Milestone Default WorkersInWorkshops display_name]] "40% Workers in Workshops"),
	group = "Default",
	id = "WorkersInWorkshops",
	reward_research = 10000,
	trigger_fireworks = true,
})

