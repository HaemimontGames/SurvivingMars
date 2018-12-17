-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('Challenge', {
	SortKey = 1,
	TargetValue = 4,
	TickProgress = function (self, regs)
Sleep(1000)
local list = UICity.labels.LivingQuarters or empty_table
local n = 0
for _, bld in ipairs(list) do
	if bld:GetUIResidentsCount() == bld.capacity then
		n = n + 1
	end
end
return n
end,
	TrackProgress = true,
	commander = "author",
	description = T(886987306987, --[[Challenge Default ChinaLivingQuarters description]] "Have 4 fully occupied Living Complexes"),
	gamerule1 = "StoryBitsDisabled",
	group = "Default",
	id = "ChinaLivingQuarters",
	landing_spot = "ChinaLivingQuarters",
	latitude = -28,
	longitude = -141,
	sponsor = "CNSA",
	time_completed = 21600000,
	time_perfected = 9360000,
	title = T(461830129252, --[[Challenge Default ChinaLivingQuarters title]] "Housing Bubble"),
})

PlaceObj('Challenge', {
	Run = function (self)
WaitMsg("ColonyApprovalPassed")
end,
	SortKey = 3,
	commander = "rocketscientist",
	description = T(153735343793, --[[Challenge Default USAFounderStage description]] "Complete the Founder Stage"),
	gamerule1 = "NoDisasters",
	gamerule2 = "StoryBitsDisabled",
	group = "Default",
	id = "USAFounderStage",
	landing_spot = "USAFounderStage",
	latitude = 11,
	longitude = 78,
	sponsor = "NASA",
	time_completed = 8640000,
	time_perfected = 4320000,
	title = T(463998263208, --[[Challenge Default USAFounderStage title]] "Founding Fathers"),
})

PlaceObj('Challenge', {
	SortKey = 4,
	TargetValue = 30,
	TickProgress = function (self, regs)
local ok, city, amount, total = WaitMsg("MarkPreciousMetalsExport")
return total / const.ResourceScale
end,
	TrackProgress = true,
	commander = "astrogeologist",
	description = T(528782053501, --[[Challenge Default BlueSunExportedRareMetals description]] "Export 30 Rare Metals"),
	gamerule1 = "NoDisasters",
	gamerule2 = "StoryBitsDisabled",
	group = "Default",
	id = "BlueSunExportedRareMetals",
	landing_spot = "BlueSunExportedRareMetals",
	latitude = -24,
	longitude = 179,
	sponsor = "BlueSun",
	time_completed = 21600000,
	time_perfected = 7200000,
	title = T(455697218349, --[[Challenge Default BlueSunExportedRareMetals title]] "The Gold Must Flow"),
})

PlaceObj('Challenge', {
	SortKey = 5,
	TargetValue = 5,
	TickProgress = function (self, regs)
WaitMsg("ColonistBorn")
local count = 0
for _, dome in ipairs(UICity.labels.Dome or empty_table) do
	count = count + #(dome.labels.Martianborn or empty_table)
end
return count
end,
	TrackProgress = true,
	commander = "rocketscientist",
	description = T(238728162719, --[[Challenge Default NewArkChurchMartianborns description]] "Have 5 Martianborn colonists"),
	gamerule1 = "StoryBitsDisabled",
	group = "Default",
	id = "NewArkChurchMartianborns",
	landing_spot = "NewArkChurchMartianborns",
	latitude = 6,
	longitude = -119,
	sponsor = "NewArk",
	time_completed = 18720000,
	time_perfected = 9360000,
	title = T(327559036075, --[[Challenge Default NewArkChurchMartianborns title]] "Baby Steps"),
})

PlaceObj('Challenge', {
	Init = function (self,regs)
CreateGameTimeThread(function()
	while true do
		WaitMsg("ColonistStatusEffect")
		Msg("ChallengeUpdate")
	end
end)

CreateGameTimeThread(function()
	while true do
		WaitMsg("ColonistJoinsDome")
		Msg("ChallengeUpdate")
	end
end)
end,
	Run = function (self)
while true do
	WaitMsg("ChallengeUpdate")
	for _, dome in ipairs(UICity.labels.Dome or empty_table) do
		if #dome.labels.Colonist >= 100 and #dome.labels.Homeless == 0 then
			return
		end
	end
end
end,
	SortKey = 6,
	TargetValue = 100,
	commander = "psychologist",
	description = T(492192262201, --[[Challenge Default IndiaDomePopulation description]] "Have a Dome with population 100 and no homeless citizens"),
	gamerule1 = "StoryBitsDisabled",
	group = "Default",
	id = "IndiaDomePopulation",
	landing_spot = "IndiaDomePopulation",
	latitude = -23,
	longitude = -1,
	sponsor = "ISRO",
	time_completed = 50400000,
	time_perfected = 25200000,
	title = T(384677172418, --[[Challenge Default IndiaDomePopulation title]] "City Building"),
})

PlaceObj('Challenge', {
	SortKey = 7,
	TickProgress = function (self, regs)
Sleep(1000)
return  (g_ResourceProducedTotal.Concrete or 0) / const.ResourceScale
end,
	TrackProgress = true,
	commander = "oligarch",
	description = T(990026297222, --[[Challenge Default RussiaProducedConcrete description]] "Produce 1000 Concrete"),
	gamerule1 = "LongRide",
	gamerule2 = "StoryBitsDisabled",
	group = "Default",
	id = "RussiaProducedConcrete",
	landing_spot = "RussiaProducedConcrete",
	latitude = -21,
	longitude = 122,
	sponsor = "Roscosmos",
	time_completed = 24480000,
	time_perfected = 12240000,
	title = T(418870631516, --[[Challenge Default RussiaProducedConcrete title]] "Russian Concrete"),
})

PlaceObj('Challenge', {
	Run = function (self)
while true do
	Sleep(1000)
	if (g_ResourceProducedTotal.Polymers or 0) >= 5 * const.ResourceScale and
	 	(g_ResourceProducedTotal.MachineParts or 0) >= 5 * const.ResourceScale and
		(g_ResourceProducedTotal.Electronics or 0) >= 5 * const.ResourceScale
	then
		return
	end
end
end,
	SortKey = 8,
	TickProgress = function (self, regs)
while true do
	Sleep(1000)
	if (g_ResourceProducedTotal.Polymers or 0) >= 5 * const.ResourceScale and
	 	(g_ResourceProducedTotal.MachineParts or 0) >= 5 * const.ResourceScale and
		(g_ResourceProducedTotal.Electronics or 0) >= 5 * const.ResourceScale
	then
		return
	end
end
end,
	commander = "psychologist",
	description = T(835293560099, --[[Challenge Default SpaceYAdvancedResources description]] "Produce 5 Polymers, 5 Machine Parts and 5 Electronics on Mars"),
	gamerule1 = "StoryBitsDisabled",
	group = "Default",
	id = "SpaceYAdvancedResources",
	landing_spot = "SpaceYAdvancedResources",
	latitude = -21,
	longitude = 58,
	sponsor = "SpaceY",
	time_completed = 21600000,
	time_perfected = 10800000,
	title = T(109451622778, --[[Challenge Default SpaceYAdvancedResources title]] "The Means of Production"),
})

PlaceObj('Challenge', {
	SortKey = 10,
	TargetValue = 25,
	TickProgress = function (self, regs)
WaitMsg("TechResearched")
local n = 0
for tech, status in pairs(UICity.tech_status) do
	if status.researched then
		n = n + 1
	end
end
return n
end,
	TrackProgress = true,
	commander = "author",
	description = T(670352505144, --[[Challenge Default EuropeResearchedTechs description]] "Research 25 technologies (repeatable technologies are counted once)"),
	gamerule1 = "StoryBitsDisabled",
	group = "Default",
	id = "EuropeResearchedTechs",
	landing_spot = "EuropeResearchedTechs",
	latitude = 1,
	longitude = -51,
	sponsor = "ESA",
	time_completed = 28800000,
	time_perfected = 14400000,
	title = T(611257797429, --[[Challenge Default EuropeResearchedTechs title]] "Tech Boost"),
})

PlaceObj('Challenge', {
	ProgressText = T(10882, --[[Challenge Default NewArkChurchManyMartianborns ProgressText]] "Average Comfort: <current>/<target>"),
	Run = function (self)
while true do
	Sleep(1000)
	local n = #(UICity.labels.Colonist or empty_table)
	if n >= 50 and g_TotalColonistComfort / n >= 80 then
		return
	end
end
end,
	SortKey = 11,
	TargetValue = 80,
	TickProgress = function (self, regs)
Sleep(1000)
local n = #(UICity.labels.Colonist or empty_table)
return n > 0 and (g_TotalColonistComfort / n) or 0
end,
	TrackProgress = true,
	WinCondition = function (self)
return #(UICity.labels.Colonist or empty_table) >= 50
end,
	commander = "doctor",
	description = T(213053799455, --[[Challenge Default NewArkChurchManyMartianborns description]] "Have a colony with at least 50 Colonists with average Comfort 80"),
	gamerule1 = "StoryBitsDisabled",
	group = "Default",
	id = "NewArkChurchManyMartianborns",
	landing_spot = "NewArkChurchManyMartianborns",
	latitude = -18,
	longitude = -171,
	sponsor = "NewArk",
	time_completed = 57600000,
	time_perfected = 28800000,
	title = T(645223119450, --[[Challenge Default NewArkChurchManyMartianborns title]] "New Eden"),
})

PlaceObj('Challenge', {
	ProgressText = T(10876, --[[Challenge Default SpaceYMoneyFromTourists ProgressText]] "Progress: <funding(current)>/<funding(target)>"),
	Run = function (self)
while true do
	Sleep(1000)
	local total = UICity.funding_gain_total or empty_table
	if (total.Tourist or 0) >= 2*1000*1000*1000 then
		return
	end
end
end,
	SortKey = 12,
	TargetValue = 2000000000,
	TickProgress = function (self, regs)
Sleep(1000)
local total = UICity.funding_gain_total or empty_table
return total.Tourist or 0
end,
	TrackProgress = true,
	commander = "rocketscientist",
	description = T(140613558769, --[[Challenge Default SpaceYMoneyFromTourists description]] "Earn $2,000 M  from Tourists"),
	gamerule1 = "StoryBitsDisabled",
	group = "Default",
	id = "SpaceYMoneyFromTourists",
	landing_spot = "SpaceYMoneyFromTourists",
	latitude = 7,
	longitude = 50,
	sponsor = "SpaceY",
	time_completed = 57600000,
	time_perfected = 28800000,
	title = T(668546976180, --[[Challenge Default SpaceYMoneyFromTourists title]] "Tourist Trap"),
})

PlaceObj('Challenge', {
	Run = function (self)
while true do
	Sleep(1000)
	if #(UICity.labels.Colonist or empty_table) >= 200 then
		return
	end
end
end,
	SortKey = 13,
	TargetValue = 200,
	TickProgress = function (self, regs)
Sleep(1000)
return #(UICity.labels.Colonist or empty_table)
end,
	TrackProgress = true,
	commander = "oligarch",
	description = T(136641671099, --[[Challenge Default ChinaReachedPopulation description]] "Have a population of 200 colonists"),
	gamerule1 = "LongRide",
	gamerule2 = "StoryBitsDisabled",
	group = "Default",
	id = "ChinaReachedPopulation",
	landing_spot = "ChinaReachedPopulation",
	latitude = 32,
	longitude = -27,
	sponsor = "CNSA",
	time_completed = 57600000,
	time_perfected = 28800000,
	title = T(351190390137, --[[Challenge Default ChinaReachedPopulation title]] "Serve the People"),
})

PlaceObj('Challenge', {
	Init = function (self,regs)
CreateGameTimeThread(function()
	while true do
		WaitMsg("AnomalyAnalyzed")
		Msg("ChallengeUpdate")
	end
end)

CreateGameTimeThread(function()
	while true do
		WaitMsg("SectorScanned")
		Msg("ChallengeUpdate")
	end
end)
end,
	Run = function (self)
local function anomalies_explored()
	for i, list in ipairs(g_MapSectors) do
		for j, sector in ipairs(list) do
			if sector.status == "unexplored" and sector:HasMarkersOfType("SubsurfaceAnomalyMarker") then
				return false
			end
			if sector.status == "scanned" and sector:HasMarkersOfType("SubsurfaceAnomalyMarker", sector.markers.deep) then
				return false
			end
		end
	end
	return true
end

while true do
	WaitMsg("ChallengeUpdate")
	if anomalies_explored() and MapCount("map", "SubsurfaceAnomaly") == 0 then
		return
	end
end
end,
	SortKey = 14,
	commander = "astrogeologist",
	description = T(902770126715, --[[Challenge Default EuropeAnalyzedAllAnomalies description]] "Analyze all anomalies"),
	gamerule1 = "WinterIsComing",
	gamerule2 = "StoryBitsDisabled",
	group = "Default",
	id = "EuropeAnalyzedAllAnomalies",
	landing_spot = "EuropeAnalyzedAllAnomalies",
	latitude = 22,
	longitude = 36,
	sponsor = "ESA",
	time_completed = 57600000,
	time_perfected = 28800000,
	title = T(291361258859, --[[Challenge Default EuropeAnalyzedAllAnomalies title]] "Under the Microscope"),
})

PlaceObj('Challenge', {
	Run = function (self)
while true do
	Sleep(1000)
	local list = UICity.labels.FusionReactor or empty_table
	local n = 0
	for _, bld in ipairs(list) do
		if bld.max_workers > 0 and bld:GetClosedSlots() == 0 and bld:GetFreeWorkSlots() == 0 then
			n = n +1
			if n >= 5 then
				return
			end
		end
	end
end
end,
	SortKey = 15,
	TargetValue = 4,
	TickProgress = function (self, regs)
Sleep(1000)
local list = UICity.labels.FusionReactor or empty_table
local n = 0
for _, bld in ipairs(list) do
	if bld.max_workers > 0 and bld:GetClosedSlots() == 0 and bld:GetFreeWorkSlots() == 0 then
		n = n +1
	end
end
return n
end,
	TrackProgress = true,
	commander = "ecologist",
	description = T(259694468737, --[[Challenge Default IndiaFusionGenerators description]] "Have 4 Fusion Reactors fully staffed and on 3 shifts"),
	gamerule1 = "WinterIsComing",
	gamerule2 = "StoryBitsDisabled",
	group = "Default",
	id = "IndiaFusionGenerators",
	landing_spot = "IndiaFusionGenerators",
	latitude = 6,
	longitude = -85,
	sponsor = "ISRO",
	time_completed = 100800000,
	time_perfected = 50400000,
	title = T(170425616626, --[[Challenge Default IndiaFusionGenerators title]] "Cold Fusion"),
})

PlaceObj('Challenge', {
	ProgressText = T(10877, --[[Challenge Default BlueSunAccumulatedMoney ProgressText]] "Progress: <funding(current)>/<funding(target)>"),
	Run = function (self)
while true do
	WaitMsg("FundingChanged")
	if UICity.funding > 50*1000*1000*1000 then
		return
	end
end
end,
	SortKey = 16,
	TargetValue = 35000000000,
	TickProgress = function (self, regs)
WaitMsg("FundingChanged")
return UICity.funding
end,
	TrackProgress = true,
	commander = "politician",
	description = T(802150886111, --[[Challenge Default BlueSunAccumulatedMoney description]] "Accumulate $35,000 M"),
	gamerule1 = "Inflation",
	gamerule2 = "StoryBitsDisabled",
	group = "Default",
	id = "BlueSunAccumulatedMoney",
	landing_spot = "BlueSunAccumulatedMoney",
	latitude = 50,
	longitude = -83,
	sponsor = "BlueSun",
	time_completed = 100800000,
	time_perfected = 57600000,
	title = T(191449868184, --[[Challenge Default BlueSunAccumulatedMoney title]] "Fiscal Profits"),
})

PlaceObj('Challenge', {
	Run = function (self)
while true do
	WaitMsg("ConstructionComplete")
	if UICity:CountBuildings("VRWorkshop") > 0 and
		UICity:CountBuildings("ArtWorkshop") > 0 and
		UICity:CountBuildings("BioroboticsWorkshop") > 0 
	then
		return
	end
end
end,
	SortKey = 18,
	commander = "doctor",
	description = T(831840869483, --[[Challenge Default RussiaWorkshopVariety description]] "Have a VR Workshop, Art Workshop and Biorobotics Workshop"),
	gamerule1 = "StoryBitsDisabled",
	group = "Default",
	id = "RussiaWorkshopVariety",
	landing_spot = "RussiaWorkshopVariety",
	latitude = -40,
	longitude = 95,
	sponsor = "Roscosmos",
	time_completed = 108000000,
	time_perfected = 54000000,
	title = T(501393143773, --[[Challenge Default RussiaWorkshopVariety title]] "Vocation Destination"),
})

PlaceObj('Challenge', {
	Run = function (self)
while true do
	local ok, bld = WaitMsg("ConstructionComplete")
	if bld.wonder then
		return
	end
end
end,
	SortKey = 19,
	commander = "politician",
	description = T(496004694621, --[[Challenge Default USAConstructedWonder description]] "Construct a Wonder"),
	gamerule1 = "StoryBitsDisabled",
	group = "Default",
	id = "USAConstructedWonder",
	landing_spot = "USAConstructedWonder",
	latitude = -27,
	longitude = -56,
	sponsor = "NASA",
	time_completed = 86400000,
	time_perfected = 43200000,
	title = T(551704435140, --[[Challenge Default USAConstructedWonder title]] "Wonderful Life"),
})

PlaceObj('Challenge', {
	Run = function (self)
while true do
	WaitMsg("ColonistJoinsDome")
	local n = 0
	for _, dome in ipairs(UICity.labels.Dome or empty_table) do
		if #(dome.labels.Colonist or empty_table) >= 200 then
			n = n + 1
		end
	end
	if n >= 5 then
		return
	end
end
end,
	SortKey = 21,
	TargetValue = 5,
	TickProgress = function (self, regs)
WaitMsg("ColonistJoinsDome")
local n = 0
for _, dome in ipairs(UICity.labels.Dome or empty_table) do
	if #(dome.labels.Colonist or empty_table) >= 200 then
		n = n + 1
	end
end
return n
end,
	TrackProgress = true,
	commander = "rocketscientist",
	description = T(864506930463, --[[Challenge Default USAManyDomesAndColonists description]] "Have 5 Domes, each with population of 200 Colonists or more"),
	gamerule1 = "EndlessSupply",
	gamerule2 = "StoryBitsDisabled",
	group = "Default",
	id = "USAManyDomesAndColonists",
	landing_spot = "USAManyDomesAndColonists",
	latitude = -46,
	longitude = 19,
	sponsor = "NASA",
	time_completed = 144000000,
	time_perfected = 72000000,
	title = T(610101463949, --[[Challenge Default USAManyDomesAndColonists title]] "A New Nation"),
})

PlaceObj('Challenge', {
	Run = function (self)
while true do
	Sleep(1000)
	if #(UICity.labels.scientist or empty_table) >= 200 then
		return
	end
end
end,
	SortKey = 22,
	TargetValue = 200,
	TickProgress = function (self, regs)
Sleep(1000)
return #(UICity.labels.scientist or empty_table)
end,
	TrackProgress = true,
	commander = "ecologist",
	description = T(547935715802, --[[Challenge Default EuropeScientists description]] "Have 200 Scientists"),
	gamerule1 = "StoryBitsDisabled",
	group = "Default",
	id = "EuropeScientists",
	landing_spot = "EuropeScientists",
	latitude = 1,
	longitude = -137,
	sponsor = "ESA",
	time_completed = 172800000,
	time_perfected = 86400000,
	title = T(799852804431, --[[Challenge Default EuropeScientists title]] "Campus Life"),
})

PlaceObj('Challenge', {
	Run = function (self)
while true do
	Sleep(1000)
	if #(UICity.labels.Colonist or empty_table) >= 200 then
		return
	end
end
end,
	SortKey = 23,
	TargetValue = 200,
	TickProgress = function (self, regs)
Sleep(1000)
return #(UICity.labels.Colonist or empty_table)
end,
	TrackProgress = true,
	commander = "doctor",
	description = T(810118153279, --[[Challenge Default NewArkChurchNoImigration description]] "Have 200 Colonists"),
	gamerule1 = "TheLastArk",
	gamerule2 = "StoryBitsDisabled",
	group = "Default",
	id = "NewArkChurchNoImigration",
	landing_spot = "NewArkChurchNoImigration",
	latitude = -30,
	longitude = 147,
	sponsor = "NewArk",
	time_completed = 172800000,
	time_perfected = 86400000,
	title = T(445732820214, --[[Challenge Default NewArkChurchNoImigration title]] "Ark 2.0"),
})

PlaceObj('Challenge', {
	SortKey = 24,
	TargetValue = 250,
	TickProgress = function (self, regs)
Sleep(1000)
return  (g_ResourceProducedTotal.Electronics or 0) / const.ResourceScale
end,
	TrackProgress = true,
	commander = "author",
	description = T(457238895348, --[[Challenge Default RussiaExportedRareMetals description]] "Produce 250 Electronics"),
	gamerule1 = "StoryBitsDisabled",
	group = "Default",
	id = "RussiaExportedRareMetals",
	landing_spot = "RussiaExportedRareMetals",
	latitude = 3,
	longitude = 102,
	sponsor = "Roscosmos",
	time_completed = 144000000,
	time_perfected = 72000000,
	title = T(331673519012, --[[Challenge Default RussiaExportedRareMetals title]] "Elbrus++"),
})

PlaceObj('Challenge', {
	Run = function (self)
while true do
	Sleep(1000)
	for _, mine in ipairs(UICity.labels.MoholeMine or empty_table) do
		local upgraded = true
		for i = 1, 3 do
			upgraded = upgraded and mine:HasUpgrade(i)
		end
		if upgraded then
			return
		end
	end
end
end,
	SortKey = 26,
	commander = "inventor",
	description = T(229016730636, --[[Challenge Default BlueSunUpgradedMoholeMine description]] "Have a fully upgraded Mohole Mine"),
	gamerule1 = "StoryBitsDisabled",
	group = "Default",
	id = "BlueSunUpgradedMoholeMine",
	landing_spot = "BlueSunUpgradedMoholeMine",
	latitude = 45,
	longitude = 141,
	sponsor = "BlueSun",
	time_completed = 180000000,
	time_perfected = 108000000,
	title = T(910413199776, --[[Challenge Default BlueSunUpgradedMoholeMine title]] "Drill Baby, Drill"),
})

PlaceObj('Challenge', {
	SortKey = 27,
	TargetValue = 7,
	TickProgress = function (self, regs)
WaitMsg("ConstructionComplete")
Sleep(100) -- wait new buildings to enter their labels
return UICity:CountBuildings("Wonders")
end,
	TrackProgress = true,
	commander = "astrogeologist",
	description = T(756340045094, --[[Challenge Default ChinaSevenWonders description]] "Have 7 Wonders"),
	gamerule1 = "StoryBitsDisabled",
	group = "Default",
	id = "ChinaSevenWonders",
	landing_spot = "ChinaSevenWonders",
	latitude = -10,
	longitude = 76,
	sponsor = "CNSA",
	time_completed = 180000000,
	time_perfected = 108000000,
	title = T(345588760269, --[[Challenge Default ChinaSevenWonders title]] "Seven"),
})

PlaceObj('Challenge', {
	Run = function (self)
while true do
	WaitMsg("TechResearched")
	local n = 0
	ForEachPreset("TechPreset", function(p)
		if UICity:IsTechResearched(p.id) then
		 	n = n + 1
		end
	end)
	if n >= 100 then
		return
	end
end
end,
	SortKey = 28,
	TargetValue = 100,
	TickProgress = function (self, regs)
WaitMsg("TechResearched")
local n = 0
ForEachPreset("TechPreset", function(p)
	if UICity:IsTechResearched(p.id) then
	 	n = n + 1
	end
end)
return n
end,
	TrackProgress = true,
	commander = "politician",
	description = T(660322242409, --[[Challenge Default SpaceYResearchedTechs description]] "Research 100 Technologies (repeatable technologies are counted once)"),
	gamerule1 = "ChaosTheory",
	gamerule2 = "StoryBitsDisabled",
	group = "Default",
	id = "SpaceYResearchedTechs",
	landing_spot = "SpaceYResearchedTechs",
	latitude = 10,
	longitude = 36,
	sponsor = "SpaceY",
	time_completed = 180000000,
	time_perfected = 108000000,
	title = T(150528747155, --[[Challenge Default SpaceYResearchedTechs title]] "The Boundaries of Knowledge"),
})

PlaceObj('Challenge', {
	Run = function (self)
while true do
	Sleep(1000)
	if #(UICity.labels.Colonist or empty_table) >= 3000 then
		return
	end
end
end,
	SortKey = 29,
	TargetValue = 2000,
	TickProgress = function (self, regs)
Sleep(1000)
return #(UICity.labels.Colonist or empty_table)
end,
	TrackProgress = true,
	commander = "oligarch",
	description = T(342668768307, --[[Challenge Default IndiaHighPopulation description]] "Reach population of 2000"),
	gamerule1 = "RebelYell",
	gamerule2 = "StoryBitsDisabled",
	group = "Default",
	id = "IndiaHighPopulation",
	landing_spot = "IndiaHighPopulation",
	latitude = 5,
	longitude = 72,
	sponsor = "ISRO",
	time_completed = 216000000,
	time_perfected = 144000000,
	title = T(726344005353, --[[Challenge Default IndiaHighPopulation title]] "Civil Disorder"),
})

