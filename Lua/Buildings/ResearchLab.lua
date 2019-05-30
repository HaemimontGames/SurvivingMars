DefineClass.ResearchBuilding =
{	
	__parents = { "ElectricityConsumer", "Workplace" },

	properties = {
		{ template = true, modifiable = true, id = "ResearchPointsPerDay", name = T(686, "RP/Day"), editor = "number", category = "Research", default = 1000, help = "Research Points Generated Per Day", scale = 1000 },
	},
	
	research_points_day = 0,
	research_points_lifetime = 0,
}

function ResearchBuilding:GameInit()
	if HintsEnabled then
		HintTrigger("HintResearchAvailable")
	end
end

function ResearchBuilding:BuildingUpdate(dt, ...)
	if self.working then
		self:AddResearchPoints(dt)
	end
end

function ResearchBuilding:BuildingDailyUpdate(...)
	self.research_points_day = 0
end

function ResearchBuilding:TechId()
	local tech_id = self.city:GetResearchInfo()
	return tech_id
end

function ResearchBuilding:GetWorkNotPossibleReason()
	if not self:TechId() then
		return "NoResearch"
	end
	return ElectricityConsumer.GetWorkNotPossibleReason(self)
end

function ResearchBuilding:GetResearchProgress()
	return self.city:GetResearchProgress()
end

function ResearchBuilding:GetEstimatedDailyProduction()
	local total = 0
	local durations = const.DefaultWorkshiftDurations
	for i=1,#durations do
		total = total + self:ModifyValue(self:GetWorkshiftPerformance(i), "performance") * durations[i] * self.ResearchPointsPerDay
	end
	local pts = total / (100 * const.HoursPerDay)
	local res = 0
	local collaboration_loss = 0
	-- res is not 0 only if the building is working or the only reason for it to not work is that there is no technology selected for research
	if self.working or (not self:TechId() and not ElectricityConsumer.GetWorkNotPossibleReason(self)) then 
		res = MulDivRound(pts, 100 - self:GetCollaborationLoss(), 100)
		collaboration_loss = pts - res
	end
	return res, collaboration_loss, pts
end

function ResearchBuilding:GetEstimatedDailyLoss()
	local pts, loss, total = self:GetEstimatedDailyProduction()
	return loss
end

function ResearchBuilding:GetEstimatedDailyTotal()
	local pts, loss, total = self:GetEstimatedDailyProduction()
	return total
end


function ResearchBuilding:GetCollaborationLoss()
	local blds = self.city.labels[self.template_name]
	local count = 1
	for i=1,#blds do
		local bld = blds[i]
		if bld ~= self and (bld.working or (not bld:TechId() and not ElectricityConsumer.GetWorkNotPossibleReason(bld))) then
			count = count + 1
		end
	end
	return Min(g_Consts.MaxResearchCollaborationLoss, (count - 1) * 10)
end

function ResearchBuilding:AddResearchPoints(dt)
	if not self.working then return 0 end
	
	local points_to_add = MulDivRound(self.performance * self.ResearchPointsPerDay, dt, const.DayDuration * 100)
	
	points_to_add = MulDivRound(points_to_add, 100 - self:GetCollaborationLoss(), 100)
	
	self.research_points_day = self.research_points_day + points_to_add
	self.research_points_lifetime = self.research_points_lifetime + points_to_add
	local tech_id_1, points_1, max_points_1, repetitions_1 = self.city:GetResearchInfo()
	self.city:AddResearchPoints(points_to_add)
	local tech_id_2, points_2, max_points_2, repetitions_2 = self.city:GetResearchInfo()
	--fx
	if tech_id_1 ~= tech_id_2
	or repetitions_1 ~= repetitions_2
	or max_points_1 and MulDivRound(100, points_1, max_points_1) < 50 and MulDivRound(100, points_2, max_points_2) >= 50 then
		PlayFX("Research", "50+", self)
	end
end

function ResearchBuilding:OnSetWorking(working)
	ElectricityConsumer.OnSetWorking(self, working)
	Workplace.OnSetWorking(self, working)
	
	if self:TechId() then
		if working then
			if self:GetResearchProgress() > 50 then
				PlayFX("Research", "50+", self)
			else
				PlayFX("Research", "start", self)
			end
		else
			PlayFX("Research", "end", self)
		end
	end
end

function ResearchBuilding:UIResearchTech()
	OpenResearchDialog()
end
--fx------------------------------------------------------------
function ResearchBuilding:SetSupply(resource, amount)	
	ElectricityConsumer.SetSupply(self, resource, amount)
	if not self:TechId() and self.ui_working then --else Research start/end should fire
		if amount <= 0 then --no electricity
			PlayFX("Research", "off", self)
		else --power just came and we are turned on
			PlayFX("Research", "done", self)
		end
	end
end

function ResearchBuilding:SetUIWorking(work)
	ElectricityConsumer.SetUIWorking(self, work)
	if not self:TechId() and self:HasPower() then --else Research start/end should fire
		if work then
			PlayFX("Research", "done", self)
		else
			PlayFX("Research", "off", self)
		end
	end
end

function ResearchBuilding:GetUIResearchProject()
	return self.city:GetUIResearchProject()
end

function ResearchLabUpdateAll()
	MapForEach("map", "ResearchBuilding",
		function(lab)
			lab:UpdateWorking()
		end)
end

function OnMsg.ResearchQueueChange()
	DelayedCall(0, ResearchLabUpdateAll)
end

DefineClass.BaseResearchLab =
{	__parents = { "ResearchBuilding", "InteriorAmbientLife" },

	interior = {"ResearchLabInterior"},
	spots = {"Terminal"},
	anims = {{anim = "terminal",all = true}},
}

function BaseResearchLab:SetDome(dome)
	if self.parent_dome then
		self.parent_dome:RemoveFromLabel("BaseResearchLab", self)
	end
	
	Building.SetDome(self, dome)
	
	if dome then
		self.parent_dome:AddToLabel("BaseResearchLab", self)
	end	
end