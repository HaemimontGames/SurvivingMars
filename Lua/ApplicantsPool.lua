GlobalVar("g_ApplicantPool",{})
GlobalVar("g_ApplicantPoolFilter",{})
GlobalVar("g_LastGeneratedApplicantTime", false)

local drop_out_time = 1000*const.HourDuration
const.BuyApplicantsCount = 50


function GenerateApplicant(time, city)
	local colonist = GenerateColonistData(city, nil, nil, {no_specialization = IsGameRuleActive("Amateurs") or nil})
	local rand = Random(1, 100)
	if rand<=5 then
		colonist.traits["Tourist"] = true
	end	
	table.insert(g_ApplicantPool, 1, {colonist, time or GameTime()})
	return colonist
end

function InitApplicantPool()
	g_LastGeneratedApplicantTime = 0
	local pool_size = g_Consts.ApplicantsPoolStartingSize
	if IsGameRuleActive("MoreApplicants") then
		pool_size = pool_size + 500
	end
	for i=1,pool_size do
		GenerateApplicant(-Random(0, drop_out_time/2))
	end
	
	-- add initial trait filter
	ForEachPreset(TraitPreset, function(trait, group_list)
		if trait.initial_filter then
			g_ApplicantPoolFilter[trait.id] = false
		end
		if trait.initial_filter_up then
			g_ApplicantPoolFilter[trait.id] = true
		end	
	end)
end

function ClearApplicantPool()
	g_ApplicantPool = {}
end

function OnMsg.NewHour(hour)
	if not g_LastGeneratedApplicantTime then return end
	local now = GameTime()
	if hour == 3 then
		-- drop old applicants
		local drop_threshold = now - drop_out_time
		for i = #g_ApplicantPool, 1, -1 do
			local applicant, application_time = unpack_params(g_ApplicantPool[i])
			if application_time and application_time - drop_threshold < 0 then
				table.remove(g_ApplicantPool, i)
				if not applicant.traits.Tourist then
					GenerateApplicant(now)
				end
			end
		end
	end
	if (g_Consts.ApplicantSuspendGenerate or 0) > 0 then
		return
	end
	-- generate new one
	if now - g_LastGeneratedApplicantTime >= g_Consts.ApplicantGenerationInterval then
		local non_tourists = 0
		for _, data in ipairs(g_ApplicantPool) do
			local applicant = data[1]
			if not applicant.traits.Tourist then
				non_tourists = non_tourists + 1
			end
		end
		local pool_size = g_Consts.ApplicantsPoolStartingSize
		if IsGameRuleActive("MoreApplicants") then
			pool_size = pool_size + 500
		end
		if non_tourists < pool_size then
			GenerateApplicant(now)
			g_LastGeneratedApplicantTime = now
		end
	end
end


