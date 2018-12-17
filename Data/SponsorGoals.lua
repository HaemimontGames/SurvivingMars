-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('SponsorGoals', {
	Completed = function (self, state,  param1, param2, param3)
state.target = tonumber(param1)
state.progress = g_ScannedAnomaly
while state.progress < state.target do
	WaitMsg("AnomalyAnalyzed")
	state.progress = g_ScannedAnomaly
end
return true
end,
	description = T(556832090808, --[[SponsorGoals AnalyzeAnomalies description]] "Analyze <param1> map Anomalies"),
	group = "Default",
	id = "AnalyzeAnomalies",
})

PlaceObj('SponsorGoals', {
	Completed = function (self, state,  param1, param2, param3)
state.target = tonumber(param1)
state.progress = g_ScannedPlanetaryAnomaly
while state.progress < state.target do
	WaitMsg("PlanetaryAnomalyAnalyzed")
	state.progress = g_ScannedPlanetaryAnomaly
end
return true
end,
	description = T(304927814784, --[[SponsorGoals AnalyzePlanetaryAnomalies description]] "Analyze <param1> Planetary Anomalies"),
	group = "Default",
	id = "AnalyzePlanetaryAnomalies",
})

PlaceObj('SponsorGoals', {
	Completed = function (self, state,  param1, param2, param3)
state.target = tonumber(param1) 
state.progress = 0
while state.progress < state.target do
	WaitMsg("ConstructionComplete")
	state.progress = UICity:CountBuildings()
end
return true
end,
	description = T(10328, --[[SponsorGoals BuildingsVolume description]] "Have a total of <param1> buildings"),
	group = "Default",
	id = "BuildingsVolume",
})

PlaceObj('SponsorGoals', {
	Completed = function (self, state,  param1, param2, param3)
for _, dome in ipairs(UICity.labels.Dome or empty_table) do
	if dome.labels.Martianborn then
		return true
	end
end
while true do
	local ok, colonist, born = WaitMsg("ColonistBorn")
	if born == "born" then 
		return true 
	end
end
end,
	description = T(794512515050, --[[SponsorGoals ChildBorn description]] "Have a Martianborn Colonist"),
	group = "Default",
	id = "ChildBorn",
})

PlaceObj('SponsorGoals', {
	Completed = function (self, state,  param1, param2, param3)
state.target = tonumber(param1)
state.progress = 0
while state.progress < state.target do
	Sleep(500)
	local colonists = UICity.labels.Colonist or empty_table
	state.progress = #colonists
end
return true
end,
	description = T(172647140078, --[[SponsorGoals Colonists description]] "Have <param1> Colonists on Mars"),
	id = "Colonists",
})

PlaceObj('SponsorGoals', {
	Completed = function (self, state,  param1, param2, param3)
state.target = tonumber(param1) 
state.progress = 0
while true do
	local count = 0
	local domes = UICity.labels.Dome or empty_table
	for _, dome in ipairs(domes) do
		for _, colonist in ipairs(dome.labels.Colonist or empty_table) do
			if colonist.specialist ~= "none" then
				count = count + 1
			end
		end
		Sleep(100)
	end
	state.progress = count
	if state.progress >= state.target then
		return true
	end
	Sleep(7000)
end
end,
	description = T(375497544349, --[[SponsorGoals ColonistsEducate description]] "Have <param1> specialists"),
	group = "Default",
	id = "ColonistsEducate",
})

PlaceObj('SponsorGoals', {
	Completed = function (self, state,  param1, param2, param3)
local lower_bound = tonumber(param2)*const.Scale.Stat
state.target = tonumber(param1)
state.progress = 0
while true do
	local count = 0
	local domes = UICity.labels.Dome or empty_table
	for _, dome in ipairs(domes) do
		for _, colonist in ipairs(dome.labels.Colonist or empty_table) do
			if colonist.stat_health >= lower_bound 
				and colonist.stat_sanity >= lower_bound 
				and colonist.stat_morale >= lower_bound 
				and colonist.stat_comfort >= lower_bound 
			then
				count = count + 1
			end
		end
		Sleep(100)
	end
	state.progress = count
	if count >= state.target then
		return true
	end
	Sleep(7000)
end
end,
	description = T(953122483010, --[[SponsorGoals ColonistsNeeds description]] "Have <param1> Colonists with all needs above <param2>"),
	group = "Default",
	id = "ColonistsNeeds",
})

PlaceObj('SponsorGoals', {
	Completed = function (self, state,  param1, param2, param3)
state.target = tonumber(param1) 
state.progress = 0
while true do
	local count = 0
	local domes = UICity.labels.Dome or empty_table
	for _, dome in ipairs(domes) do
		for _, colonist in ipairs(dome.labels.Colonist or empty_table) do
			if colonist.specialist == param2 then
				count = count + 1
			end
		end
		Sleep(100)
	end
	state.progress = count
	if state.progress >= state.target then
		return true
	end
	Sleep(7000)
end
end,
	description = T(980509416293, --[[SponsorGoals ColonistsSpecialists description]] "Have <param1> <param2>"),
	group = "Default",
	id = "ColonistsSpecialists",
})

PlaceObj('SponsorGoals', {
	Completed = function (self, state,  param1, param2, param3)
state.target = tonumber(param1) 
state.progress = 0
while state.progress < state.target do
	Sleep(500)
	local count = 0
	local colonists = UICity.labels.Colonist or empty_table
	for _, colonist in ipairs(colonists) do
		if colonist.traits[param2] then
			count = count + 1
		end
	end
	state.progress = count
end
return true
end,
	description = T(802936482385, --[[SponsorGoals ColonistsWithTrait description]] "Have <param1> Colonists with the <param2> Trait"),
	group = "Default",
	id = "ColonistsWithTrait",
})

PlaceObj('SponsorGoals', {
	Completed = function (self, state,  param1, param2, param3)
state.target = tonumber(param1) 
state.progress = 0
while true do
	local defs = TechDef
	local progress = 0
	for tech, status in pairs(UICity.tech_status) do
		local def = defs[tech]
		if def and def.group == "Breakthroughs" and status.researched then
			progress = progress + 1
		end
	end
	state.progress = progress
	if progress >= state.target and GameTime() > 1 then
		return true
	end
	WaitMsg("TechResearched", 10000)
end
end,
	description = T(960724987608, --[[SponsorGoals CompleteBreakthroughs description]] "Research <param1> Breakthrough technologies"),
	group = "Default",
	id = "CompleteBreakthroughs",
})

PlaceObj('SponsorGoals', {
	Completed = function (self, state,  param1, param2, param3)
state.target = tonumber(param1) 
state.progress = 0
for idx, tech in ipairs(UICity.tech_field[param2]) do
	if UICity.tech_status[tech].researched then
		state.progress = state.progress + 1
	end
end
while state.progress < state.target do
	local ok, tech_id, city = WaitMsg("TechResearched")
	local tech = TechDef[tech_id]
	if ok and tech and tech.group == param2 and GameTime() > 1 then
		 state.progress = state.progress + 1
	end
end
return true
end,
	description = T(655611441668, --[[SponsorGoals CompleteFieldTechs description]] "Research <param1> <param2> technologies"),
	group = "Default",
	id = "CompleteFieldTechs",
})

PlaceObj('SponsorGoals', {
	Completed = function (self, state,  param1, param2, param3)
state.target = tonumber(param1) 
state.progress = 0
while true do
	local defs = TechDef
	local progress = 0
	for tech, status in pairs(UICity.tech_status) do
		if status.researched and defs[tech] then
			progress = progress + 1
		end
	end
	state.progress = progress
	if progress >= state.target and GameTime() > 1 then
		return true
	end
	WaitMsg("TechResearched", 10000)
end
end,
	description = T(555751287934, --[[SponsorGoals CompleteTechs description]] "Research <param1> technologies"),
	group = "Default",
	id = "CompleteTechs",
})

PlaceObj('SponsorGoals', {
	Completed = function (self, state,  param1, param2, param3)
local timeout = tonumber(param1)
while true do
	if UICity.day > timeout then
		return false
	end
	if #UICity.labels.Dome > 0 then
		return true
	end
	local wait_time = const.DayDuration - (UICity.hour*const.HourDuration + UICity.minute*const.MinuteDuration)
	WaitMsg("ConstructionComplete", wait_time)
end
end,
	description = T(187481407346, --[[SponsorGoals ConstructDomeTimmed description]] "Construct a Dome by the end of Sol <param1>"),
	group = "Default",
	id = "ConstructDomeTimmed",
})

PlaceObj('SponsorGoals', {
	Completed = function (self, state,  param1, param2, param3)
local param1_num = tonumber(param1)
state.target = param1_num 
param1_num = param1_num * const.ResourceScale
state.progress = 0
local progress = 0
while progress <  param1_num do
	local ok, amount = WaitMsg("WasteRockConversion")
	if ok and amount > 0 then 
		progress = progress + amount
		state.progress = FormatResourceValueMaxResource(empty_table, progress)
	end
end
return true
end,
	description = T(164286480196, --[[SponsorGoals ConvertWasteRock description]] "Convert <param1> Waste Rock to useful materials"),
	group = "Default",
	id = "ConvertWasteRock",
})

PlaceObj('SponsorGoals', {
	Completed = function (self, state,  param1, param2, param3)
state.target = tonumber(param1)
while true do
	state.progress = DeepSectorsScanned
	if state.progress >= state.target then
		return true
	end
	WaitMsg("SectorScanned")
	Sleep(1000)
end
end,
	description = T(141555589306, --[[SponsorGoals DeepScanSectors description]] "Deep scan <param1> Sectors"),
	group = "Default",
	id = "DeepScanSectors",
})

PlaceObj('SponsorGoals', {
	Completed = function (self, state,  param1, param2, param3)
local timeout = tonumber(param2)
state.target = tonumber(param1)
while true do	
	if UICity.day > timeout then
		return false
	end
	state.progress = DepletedDeposits
	if state.progress >= state.target then
		return true
	end	
	local wait_time = const.DayDuration - (UICity.hour*const.HourDuration + UICity.minute*const.MinuteDuration)
	WaitMsg("DepositDepleted", wait_time)
end
end,
	description = T(842272011718, --[[SponsorGoals DepleteUndergroundDepositsTimed description]] "Deplete <param1> underground Deposits by Sol <param2>"),
	group = "Default",
	id = "DepleteUndergroundDepositsTimed",
})

PlaceObj('SponsorGoals', {
	Completed = function (self, state,  param1, param2, param3)
local count = MapCount("map", "SubsurfaceDeposit", function(o) return o.revealed and o.resource ~= "Anomaly" end)
state.target = tonumber(param1)
state.progress = count
while state.progress < state.target do
	local ok, deposit = WaitMsg("SubsurfaceDepositRevealed")
	if ok and deposit.resource ~= "Anomaly" then
		state.progress = state.progress + 1
	end
end
return true
end,
	description = T(541471610030, --[[SponsorGoals Deposits description]] "Discover <param1> underground Deposits"),
	group = "Default",
	id = "Deposits",
})

PlaceObj('SponsorGoals', {
	Completed = function (self, state,  param1, param2, param3)
state.target = tonumber(param1) 
state.progress = 0
while true do
	state.progress = 0
	for _, dome in ipairs(UICity.labels.Dome or empty_table) do
		local number_residents = #(dome.labels.Colonist or empty_table)
		state.progress = Max(number_residents,state.progress)
		if number_residents >= state.target then
			return true
		end
		Sleep(100)
	end
	Sleep(5000)
end
end,
	description = T(733600960133, --[[SponsorGoals DomeResidents description]] "Have a Dome with more than <param1> Colonists"),
	group = "Default",
	id = "DomeResidents",
})

PlaceObj('SponsorGoals', {
	Completed = function (self, state,  param1, param2, param3)
state.target = tonumber(param1)
state.progress = 0
for _, dome in ipairs(UICity.labels.Dome or empty_table) do
	if not dome.destroyed and dome.labels.Spire then
		state.progress = state.progress + 1
		if state.progress >= state.target then
			return true
		end
	end
end
while true do
	local ok, bld = WaitMsg("ConstructionComplete")
	local template = BuildingTemplates[bld.template_name] 
	if ok and template and template.dome_spot == "Spire" then
		local count = 0
		for _, dome in ipairs(UICity.labels.Dome or empty_table) do
			if not dome.destroyed and dome.labels.Spire then
				count = count +1
				state.progress = count
				if count >= state.target then
					return true
				end
			end
		end
	end
end
end,
	description = T(691160612158, --[[SponsorGoals DomeSpires description]] "Have <param1> Domes with Spires"),
	group = "Default",
	id = "DomeSpires",
})

PlaceObj('SponsorGoals', {
	Completed = function (self, state,  param1, param2, param3)
state.target = tonumber(param1)/1000000 
state.progress = 0
while true do
	local export_funding = (UICity.funding_gain_total or empty_table)["Export"] or 0
	state.progress = export_funding / 1000000
	if state.progress >=  state.target then return true end 
	WaitMsg("FundingChanged")
end
end,
	description = T(625462310436, --[[SponsorGoals ExportProfit description]] "Export <funding(param1)> worth of Rare Metals"),
	group = "Default",
	id = "ExportProfit",
})

PlaceObj('SponsorGoals', {
	Completed = function (self, state,  param1, param2, param3)
local timeout = tonumber(param2)
state.target = tonumber(param1)
while true do
	if UICity.day > timeout then 
		return false
	end
	state.progress = (UICity.total_export or 0)/const.ResourceScale
	if state.progress >= state.target then return true end
	local wait_time = const.DayDuration - (UICity.hour*const.HourDuration + UICity.minute*const.MinuteDuration)
	WaitMsg("MarkPreciousMetalsExport", wait_time)
end
end,
	description = T(818037974162, --[[SponsorGoals ExportRareMetalsTimed description]] "Export <param1> Rare Metals by the end of Sol <param2>"),
	group = "Default",
	id = "ExportRareMetalsTimed",
})

PlaceObj('SponsorGoals', {
	Completed = function (self, state,  param1, param2, param3)
local performance = tonumber(param2)
local amount = 0
state.target = tonumber(param1) 
state.progress = 0
local labels = {"MetalsExtractor", "PreciousMetalsExtractor"}
while true do
	amount = 0
	for _, label in ipairs(labels) do
		for _, extractor in ipairs(UICity.labels[label] or empty_table) do
			if extractor.performance and extractor.performance >= performance then
				amount = amount + 1
				 state.progress = amount
				if amount >= state.target then
					return true
				end
			end
		end
	end
	Sleep(500)
end
end,
	description = T(618829033661, --[[SponsorGoals ExtractorPerformance description]] "Have <param1> Extractors working at <param2> Performance"),
	group = "Default",
	id = "ExtractorPerformance",
})

PlaceObj('SponsorGoals', {
	Completed = function (self, state,  param1, param2, param3)
local param2_num = tonumber(param2)
param2_num = param2_num*const.Scale.Stat
state.target = tonumber(param1) 
state.progress = 0
while true do
	local count = 0
	local domes = UICity.labels.Dome or empty_table
	for _, dome in ipairs(domes) do
		for _, colonist in ipairs(dome.labels.Colonist or empty_table) do
			if colonist.traits.Founder then
				if colonist.stat_comfort >= param2_num then
					count = count + 1
					state.progress = count
					if count >= state.target then
						return true
					end
				end
			end
		end
		Sleep(100)
	end
	if g_LastFounderDies then
		return false
	end
	Sleep(4000)
end
end,
	description = T(782556327763, --[[SponsorGoals FoundersComfort description]] "Have <param1> Founders at <param2> Comfort"),
	group = "Default",
	id = "FoundersComfort",
})

PlaceObj('SponsorGoals', {
	Completed = function (self, state,  param1, param2, param3)
local param1_num = tonumber(param1)
state.target = param1_num 
state.progress = 0
while state.progress < param1_num do
	Sleep(500)	
	state.progress = UICity:GetEstimatedRP()
end
return true
end,
	description = T(616145140930, --[[SponsorGoals GenerateDailyRP description]] "Generate <research(param1)> per Sol"),
	group = "Default",
	id = "GenerateDailyRP",
})

PlaceObj('SponsorGoals', {
	Completed = function (self, state,  param1, param2, param3)
local param1_num = tonumber(param1)
state.target = param1_num /1000000 
local initial_funding = UICity:GetTotalFundingGain()
state.progress = initial_funding/1000000
while state.progress < state.target do
	WaitMsg("FundingChanged")
	local amount = UICity:GetTotalFundingGain() - initial_funding
	if GameTime() > 1 then
		if amount > 0 then
			state.progress = amount/1000000
		end
	else	
		initial_funding = UICity:GetTotalFundingGain()
	end
end
return true
end,
	description = T(852428145709, --[[SponsorGoals GenerateFunding description]] "Generate <funding(param1)>"),
	group = "Default",
	id = "GenerateFunding",
})

PlaceObj('SponsorGoals', {
	Completed = function (self, state,  param1, param2, param3)
local param2_num = tonumber(param2)
state.target = tonumber(param1)/1000000
state.progress = 0
local idx = 1
local past_days_funding = {}
for i = 0, param2_num - 1 do
	past_days_funding[i] = 0
end
local funding_until_today = 0
while true do
	local funding_gain_before_change = UICity:GetTotalFundingGain()
	local wait_time = const.DayDuration - (UICity.hour*const.HourDuration + UICity.minute*const.MinuteDuration)
	local ok = WaitMsg("FundingChanged", wait_time)
	if not ok then
		funding_until_today = funding_until_today + past_days_funding[idx]
		idx = (idx + 1) % param2_num
		funding_until_today = funding_until_today - past_days_funding[idx]
		past_days_funding[idx] = 0
		state.progress = funding_until_today/1000000
	elseif GameTime() > 1 then
		local amount_gained = UICity:GetTotalFundingGain() - funding_gain_before_change 
		-- calculating the amount gained this way, because if more than 1 "FundingChanged" message are being fired at the same time, some may not be registered properly
		if amount_gained > 0 then
			past_days_funding[idx] = past_days_funding[idx] + amount_gained
			state.progress = (funding_until_today + past_days_funding[idx])/1000000
			if state.progress >= state.target then
				return true
			end
		end
	end
end
end,
	description = T(486938222863, --[[SponsorGoals GenerateFundingTimed description]] "Generate <funding(param1)> within <param2> Sols"),
	group = "Default",
	id = "GenerateFundingTimed",
})

PlaceObj('SponsorGoals', {
	Completed = function (self, state,  param1, param2, param3)
state.target = tonumber(param1)
state.GetTargetText = function(self) return FormatResourceValueMaxResource(empty_table, self.target) end
state.GetProgressText = function(self) return FormatResourceValueMaxResource(empty_table, self.progress) end
while true do
	Sleep(500)
	state.progress = 0
	local grids = UICity.electricity or empty_table
	for i = 1, #grids do
		state.progress = state.progress + grids[i].production
	end
	if state.progress >= state.target then
		return true
	end
end
end,
	description = T(651961761276, --[[SponsorGoals GeneratePower description]] "Generate <power(param1)>"),
	group = "Default",
	id = "GeneratePower",
})

PlaceObj('SponsorGoals', {
	Completed = function (self, state,  param1, param2, param3)
state.target = tonumber(param1) 
state.progress = 0
local  max_connections = 0
for _, dome in ipairs(UICity.labels.Dome) do
	local connections = GetNumDomesConnectedToDome(dome)
	if connections >= state.target and connections > state.progress then 
		state.progress = connections
	end
end
while state.progress < state.target do
	local ok, d1, d2 = WaitMsg("DomesConnected")
	local d1_connected = GetNumDomesConnectedToDome(d1)
	local d2_connected = GetNumDomesConnectedToDome(d2)
	local max_connected = Max(d1_connected, d2_connected)
	state.progress = Max(state.progress, max_connected)
end
return true
end,
	description = T(627638836229, --[[SponsorGoals HaveConnectedDomes description]] "Have a Dome connected to <param1> other Domes"),
	group = "Default",
	id = "HaveConnectedDomes",
})

PlaceObj('SponsorGoals', {
	Completed = function (self, state,  param1, param2, param3)
local param1_num = tonumber(param1)
local wait_time = const.DayDuration - (UICity.hour*const.HourDuration + UICity.minute*const.MinuteDuration)
local ok = WaitMsg("ColonistsLanded", wait_time+ (param1_num - 2)*const.DayDuration)
return ok
end,
	description = T(347382462924, --[[SponsorGoals LandColonistsBySol description]] "Land a Colonist on Mars by Sol <param1>"),
	group = "Default",
	id = "LandColonistsBySol",
})

PlaceObj('SponsorGoals', {
	Completed = function (self, state,  param1, param2, param3)
state.target = tonumber(param1) 
state.progress = 0
while true do
	state.progress = 0
	for _, dome in ipairs(UICity.labels.Dome or empty_table) do
		state.progress = state.progress + #(dome.labels.Martianborn or empty_table)
	end
	if state.progress >= state.target then
		return true
	end
	WaitMsg("ColonistBorn")
end
end,
	description = T(222780100659, --[[SponsorGoals Martianborn description]] "Have <param1> Martianborn Colonists"),
	group = "Default",
	id = "Martianborn",
})

PlaceObj('SponsorGoals', {
	Completed = function (self, state,  param1, param2, param3)
state.target = tonumber(param1) 
state.progress = 0
while true do
	state.progress = 0
	for _, dome in ipairs(UICity.labels.Dome or empty_table) do
		for _, martianborn in ipairs(dome.labels.Martianborn or empty_table) do
			if martianborn.specialist ~= "none" then
				state.progress = state.progress + 1
			end
		end
		Sleep(100)
	end
	if state.progress >= state.target then 
		return true 
	end
	Sleep(7000)
end
end,
	description = T(155985857436, --[[SponsorGoals MartianbornEducate description]] "Have <param1> Martianborn specialists"),
	group = "Default",
	id = "MartianbornEducate",
})

PlaceObj('SponsorGoals', {
	Completed = function (self, state,  param1, param2, param3)
state.target = tonumber(param1)
state.progress = 0
while true do
	state.progress = 0
	for _, dome in ipairs(UICity.labels.Dome or empty_table) do
		for _, martianborn in ipairs(dome.labels.Martianborn or empty_table) do
			if martianborn.specialist == param2 then
				state.progress = state.progress + 1
			end
		end
		Sleep(100)
	end
	if state.progress >= state.target then 
		return true 
	end
	Sleep(7000)
end
end,
	description = T(166463872760, --[[SponsorGoals MartianbornSpecialists description]] "Have <param1> Martianborn <param2>"),
	group = "Default",
	id = "MartianbornSpecialists",
})

PlaceObj('SponsorGoals', {
	Completed = function (self, state,  param1, param2, param3)
local timeout = tonumber(param2)
state.target = tonumber(param1)
state.progress = 0
while true do
	if UICity.day > timeout then
		return false
	end
	state.progress = 0
	for _, dome in ipairs(UICity.labels.Dome or empty_table) do
		state.progress = state.progress + #(dome.labels.Martianborn or empty_table)
	end
	if state.progress >= state.target then return true end
	local wait_time = const.DayDuration - (UICity.hour*const.HourDuration + UICity.minute*const.MinuteDuration)
	WaitMsg("ColonistBorn",wait_time)
end
end,
	description = T(796650385521, --[[SponsorGoals MartianbornTimed description]] "Have <param1> Martianborn Colonists by the end of Sol <param2>"),
	group = "Default",
	id = "MartianbornTimed",
})

PlaceObj('SponsorGoals', {
	Completed = function (self, state,  param1, param2, param3)
state.target = tonumber(param1) 
state.progress = 0
while true do
	--state.progress =  #(UICity.labels[param2] or empty_table) 
	--not using building labels directly because they count destroyed buildings as well
	state.progress = 0
	for _, building in ipairs(UICity.labels[param2] or empty_table) do
		if not building.destroyed then
			state.progress = state.progress + 1
		end
	end
	if state.progress >= state.target then return true end
	WaitMsg("ConstructionComplete")
end
end,
	description = T(133445615586, --[[SponsorGoals MultipleBuildings description]] "Have <param1> <param2>"),
	group = "Default",
	id = "MultipleBuildings",
})

PlaceObj('SponsorGoals', {
	Completed = function (self, state,  param1, param2, param3)
local factories = {"MachinePartsFactory", "ElectronicsFactory", "PolymerPlant"}
local built_factories = { false, false, false}
local completed = 0
while true do
	--not using building labels directly because they count destroyed buildings as well
	completed = 0
	for i = 1, #factories do
		for _, single_factory in ipairs(UICity.labels[factories[i]] or empty_table) do
			if not single_factory.destroyed and built_factories[i] ~= true then
				built_factories[i] = true
				completed = completed + 1
			end
		end
	end
	for i = 1, #built_factories do
		built_factories[i] = false
	end
	if completed == 3 then
		return true
	end
	WaitMsg("ConstructionComplete")
end
end,
	description = T(412460165603, --[[SponsorGoals OneOfEachFactory description]] "Build a Machine Parts Factory, a Polymer Factory and an Electronics Factory"),
	group = "Default",
	id = "OneOfEachFactory",
})

PlaceObj('SponsorGoals', {
	Completed = function (self, state,  param1, param2, param3)
state.target = tonumber(param1) * const.ResourceScale
state.GetTargetText = function(self) return FormatResourceValueMaxResource(empty_table, self.target) end
state.GetProgressText = function(self) return FormatResourceValueMaxResource(empty_table, self.progress) end
state.progress = 0
while state.progress < state.target do
	state.progress = (g_ResourceProducedTotal.Polymers or 0) + (g_ResourceProducedTotal.MachineParts or 0) + (g_ResourceProducedTotal.Electronics or 0)
	Sleep(1000)
end	
return true
end,
	description = T(150467907921, --[[SponsorGoals ProduceAdvancedResources description]] "Produce <param1> advanced resources"),
	group = "Default",
	id = "ProduceAdvancedResources",
})

PlaceObj('SponsorGoals', {
	Completed = function (self, state,  param1, param2, param3)
state.target = tonumber(param1) * const.ResourceScale
state.GetTargetText = function(self) return FormatResourceValueMaxResource(empty_table, self.target) end
state.GetProgressText = function(self) return FormatResourceValueMaxResource(empty_table, self.progress) end
state.progress = 0
while true do
	state.progress = (g_ResourceProducedTotal[param2] or 0) + (UICity.gathered_resources_total[param2] or 0)
	if state.progress >= state.target then
		return true
	end
	Sleep(1000)
end
end,
	description = T(695856253366, --[[SponsorGoals ProduceResource description]] "Produce <param1> <param2>"),
	group = "Default",
	id = "ProduceResource",
})

PlaceObj('SponsorGoals', {
	Completed = function (self, state,  param1, param2, param3)
state.target = tonumber(param1)  * const.ResourceScale
state.GetTargetText = function(self) return FormatResourceValueMaxResource(empty_table, self.target) end
state.GetProgressText = function(self) return FormatResourceValueMaxResource(empty_table, self.progress) end
state.progress = 0
local current_sol = UICity.day
local offset = 0
while state.progress < state.target do
	Sleep(500)
	if current_sol < UICity.day then
		current_sol = UICity.day
		state.progress = 0
		offset = g_ResourceProducedTotal[param2] or 0
	end	 
	state.progress = (g_ResourceProducedTotal[param2] or 0) - offset + (UICity.gathered_resources_today[param2] or 0)
end
return true
end,
	description = T(687648534870, --[[SponsorGoals ProduceResourceInASol description]] "Produce <param1> <param2> in a single Sol"),
	group = "Default",
	id = "ProduceResourceInASol",
})

PlaceObj('SponsorGoals', {
	Completed = function (self, state,  param1, param2, param3)
state.target = tonumber(param1) * const.ResourceScale
state.GetTargetText = function(self) return FormatResourceValueMaxResource(empty_table, self.target) end
state.GetProgressText = function(self) return FormatResourceValueMaxResource(empty_table, self.progress) end
state.progress = 0
while state.progress < state.target do
	local ok, amount, resource = WaitMsg("DeepDepositExtraction")
	if ok and amount > 0 and resource == param2 then
		state.progress = state.progress + amount
	end
end
return true
end,
	description = T(205028046460, --[[SponsorGoals ProduceUndergroundResource description]] "Extract <param1> <param2> from an underground deposit"),
	group = "Default",
	id = "ProduceUndergroundResource",
})

PlaceObj('SponsorGoals', {
	Completed = function (self, state,  param1, param2, param3)
WaitMsg("RocketRefueledInADay")
return true
end,
	description = T(867818526841, --[[SponsorGoals RefuelRocketInASol description]] "Refuel a rocket the same Sol it lands"),
	group = "Default",
	id = "RefuelRocketInASol",
})

PlaceObj('SponsorGoals', {
	Completed = function (self, state,  param1, param2, param3)
while true do
	if UICity.labels[param1] then
		return true
	end
	WaitMsg("ConstructionComplete")
end
end,
	description = T(196634243926, --[[SponsorGoals SingleBuilding description]] "Construct a <param1>"),
	group = "Default",
	id = "SingleBuilding",
})

PlaceObj('SponsorGoals', {
	Completed = function (self, state,  param1, param2, param3)
while true do
	local count = 0
	local colonists = UICity.labels.Colonist or empty_table
	for _, colonist in ipairs(colonists) do
		if colonist.traits[param1] and colonist.traits[param2] and colonist.specialist == param3 then
			return true
		end
	end
	Sleep(500)
end
end,
	description = T(572604186609, --[[SponsorGoals SpecialistWith2Traits description]] "Have a <param1>, <param2> <param3>"),
	group = "Default",
	id = "SpecialistWith2Traits",
})

PlaceObj('SponsorGoals', {
	Completed = function (self, state,  param1, param2, param3)
state.target = tonumber(param1)/1000000
state.progress = (UICity:GetTotalFundingGain() - UICity.funding)/1000000
while state.progress < state.target do
	local ok, city, amount = WaitMsg("FundingChanged")
	if amount < 0 then
		state.progress = state.progress - amount/1000000
	end
end
return true
end,
	description = T(925006846011, --[[SponsorGoals SpendFunding description]] "Spend <funding(param1)> Funding"),
	group = "Default",
	id = "SpendFunding",
})

PlaceObj('SponsorGoals', {
	Completed = function (self, state,  param1, param2, param3)
state.target = tonumber(param1)
state.progress = 0
while true do
	local amount = 0
	for _, dome in ipairs(UICity.labels.Dome or empty_table) do
		if dome.working then
			amount = amount + 1
		end
	end
	state.progress = amount
	if state.progress >= state.target then
		return true
	end	
	Sleep(500)
end
end,
	description = T(869557804837, --[[SponsorGoals WorkingDomes description]] "Have <param1> operational Domes"),
	group = "Default",
	id = "WorkingDomes",
})

