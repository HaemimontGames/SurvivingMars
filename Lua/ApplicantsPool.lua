GlobalVar("g_ApplicantPool",{})
GlobalVar("g_ApplicantPoolFilter",{})

local generation_time = 7*const.HourDuration
local drop_out_time = 500*const.HourDuration

const.BuyApplicantsCount = 50

GlobalVar("g_LastGeneratedApplicantTime", false)

function GenerateApplicant(time, city)
	local colonist = GenerateColonistData(city)
	local rand = Random(1, 100)
	if rand<=5 then
		colonist.traits["Tourist"] = true
	end
	if IsGameRuleActive("Amateurs") then
		for _, trait_id in ipairs(table.keys(const.ColonistSpecialization)) do
			colonist.traits[trait_id] = nil
		end
		colonist.specialist = "none"
		colonist.traits["none"] = true
	end
	table.insert(g_ApplicantPool, 1, {colonist, time or GameTime()})
	return colonist
end

function InitApplicantPool()
	g_LastGeneratedApplicantTime = 0
	for i=1,g_Consts.ApplicantsPoolStartingSize do
		GenerateApplicant(g_LastGeneratedApplicantTime)
	end
	
	-- add initial trait filter
	local traits = DataInstances.Trait
	for i = 1, #traits do
		local trait = traits[i]
		if trait.initial_filter then
			g_ApplicantPoolFilter[trait.name] = false
		end
	end
end

function ClearApplicantPool()
	g_ApplicantPool = {}
end

function OnMsg.NewHour(hour)
	if not g_LastGeneratedApplicantTime then return end
	local now = GameTime()
	-- drop old ones
	for i=#g_ApplicantPool, 1, -1 do
		local application_time = g_ApplicantPool[i][2]
		if application_time and now - application_time >= drop_out_time then
			table.remove(g_ApplicantPool,i)
		end
	end
	if (g_Consts.ApplicantSuspendGenerate or 0) > 0 then
		return
	end
	-- generate new one
	if now - g_LastGeneratedApplicantTime >= g_Consts.ApplicantGenerationInterval then
		GenerateApplicant(now)
		g_LastGeneratedApplicantTime = now
	end
end


