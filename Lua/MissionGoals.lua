DefineClass.MissionGoal = {
	__parents = { "MsgObj" },

	colony_approval_sol = false,
	
	popup_intro = false,
	popup_early = "Evaluation_Early_Reminder",
	popup_late = "Evaluation_Late_Reminder",
	popup_final_fail = false,
	popup_final_good = false,
	popup_final_great = false,
	objective = "", --T{"<target> @ <timeout>"},
	
	score_at_target = 2000,
	score = false,
}

function MissionGoal:MsgNewDay(day)
	local sponsor = GetMissionSponsor()
	
	local timeout = sponsor.goal_timeout
	local target = sponsor.goal_target
	local count = self:GetProgress()
	
	if self.colony_approval_sol and day == self.colony_approval_sol + 3 and day < timeout then
		-- introduction
		ShowPopupNotification(self.popup_intro, {target = target, timeout = timeout, objective = T{self.objective, {count = count, target = target, timeout = timeout}}})
	elseif self.colony_approval_sol and day == self.colony_approval_sol + 20 and day < timeout then
		-- early warning
		ShowPopupNotification(self.popup_early, {SolsRemainingToTargetSol = timeout - day, objective = T{self.objective, {count = count, target = target, timeout = timeout}}}) -- <objective>
	elseif day == timeout - 10 then 
		-- late warning
		ShowPopupNotification(self.popup_late, {SolsRemainingToTargetSol = timeout - day, objective = T{self.objective, {count = count, target = target, timeout = timeout}}}) -- <objective>
	elseif day == timeout then
		-- final eval		
		local result = "great"
		if count < MulDivRound(target, 50, 100) then
			result = "fail"
		elseif count < MulDivRound(target, 110, 100) then
			result = "good"
		end
		
		local id = self["popup_final_" .. result]
		local score = MulDivRound(self.score_at_target, count, target)
		local cr = CalcChallengeRating()
		local challenge_score = MulDivRound(score, cr, 100)
		ShowPopupNotification(id, {count = count, target = target, Score = challenge_score })
		
		self.score = score
		Msg("MissionEvaluationDone")
	end
end

function MissionGoal:MsgColonyApprovalPassed()
	self.colony_approval_sol = UICity.day
end

function MissionGoal:GetProgress()
	assert(false, "GetProgress not implemented for goal " .. self.class)
	return 0
end

--------------------------------------------------
DefineClass.MG_Colonists = {
	__parents = { "MissionGoal" },

	popup_intro = "Evaluation_Colonists_Beginning",
	popup_final_fail = "Evaluation_Colonist_Bad_Fail",
	popup_final_good = "Evaluation_Colonist_Good",
	popup_final_great = "Evaluation_Colonist_Great",
	objective = T{8058, "Have <target> Colonists at Sol <timeout>. Current Colonists Count: <count>"},
}

function MG_Colonists:GetProgress()
	return #(UICity.labels.Colonist or empty_table)
end

DefineClass.MG_Martianborn = {
	__parents = { "MissionGoal" },
	popup_intro = "Evaluation_Martianborn_Beginning",
	popup_final_fail = "Evaluation_Matianborn_BadFail",
	popup_final_good = "Evaluation_Matianborn_Good",
	popup_final_great = "Evaluation_Matianborn_Great",
	objective = T{8059, "Have <target> Martianborn Colonists at Sol <timeout>. Current Martianborn Count: <count>"},
}

function MG_Martianborn:GetProgress()
	local count = 0
	for _, dome in ipairs(UICity.labels.Dome or empty_table) do
		count = count + #(dome.labels.Martianborn or empty_table)
	end
	return count
end

DefineClass.MG_TechResearch = {
	__parents = { "MissionGoal" },
	popup_intro = "Evaluation_Tech_Beginning",
	popup_final_fail = "Evaluation_Tech_BadFail",
	popup_final_good = "Evaluation_Tech_Good",
	popup_final_great = "Evaluation_Tech_Great",
	objective = T{8060, "Have <target> Technologies researched at Sol <timeout>. Currently Researched Technologies: <count>"},	
	researched = 0,
}

function MG_TechResearch:MsgTechResearched(tech_id, city, first_time)
	if first_time then
		self.researched = self.researched + 1
	end
end

function MG_TechResearch:GetProgress()
	return self.researched
end

DefineClass.MG_Anomalies = {
	__parents = { "MissionGoal" },
	popup_intro = "Evaluation_Anomalies_Beginning",
	popup_final_fail = "Evaluation_Anomalies_BadFail",
	popup_final_good = "Evaluation_Anomalies_Good",
	popup_final_great = "Evaluation_Anomalies_Great",
	objective = T{8061, "Analyse <target> Anomalies at Sol <timeout>. Anomalies Analysed: <count>"},

	analyzed = 0,
}

function MG_Anomalies:MsgAnomalyAnalyzed()
	self.analyzed = self.analyzed + 1
end

function MG_Anomalies:GetProgress()
	return self.analyzed
end

DefineClass.MG_RareExport = {
	__parents = { "MissionGoal" },
	popup_intro = "Evaluation_Export_Beginning",
	popup_final_fail = "Evaluation_Export_BadFail",
	popup_final_good = "Evaluation_Export_Good",
	popup_final_great = "Evaluation_Export_Great",
	objective = T{8062, "Export <target> Rare Metals at Sol <timeout>. Rare Metals Exported: <count>"},

	amount = 0,
}

function MG_RareExport:MsgMarkPreciousMetalsExport(city, amount)
	self.amount = self.amount + amount
end

function MG_RareExport:GetProgress()
	return self.amount / const.ResourceScale
end
