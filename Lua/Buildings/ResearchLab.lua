DefineClass.BaseResearchLab =
{	__parents = { "ElectricityConsumer", "Workplace", "InteriorAmbientLife" },

	properties = {
		{ template = true, modifiable = true, id = "ResearchPointsPerDay", name = T{686, "RP/Day"}, editor = "number", category = "Research", default = 1000, help = "Research Points Generated Per Day", scale = 1000 },
	},

	interior = {"ResearchLabInterior"},
	spots = {"Terminal"},
	anims = {{anim = "terminal",all = true}},
	
	research_points_day = 0,
	research_points_lifetime = 0,
}

function BaseResearchLab:GameInit()
	if HintsEnabled then
		HintTrigger("HintResearchAvailable")
	end
end

function BaseResearchLab:SetDome(dome)
	if self.parent_dome then
		self.parent_dome:RemoveFromLabel("BaseResearchLab", self)
	end
	
	Building.SetDome(self, dome)
	
	if dome then
		self.parent_dome:AddToLabel("BaseResearchLab", self)
	end	
end

function BaseResearchLab:BuildingUpdate(dt, ...)
	if self.working then
		self:AddResearchPoints(dt)
	end
end

function BaseResearchLab:BuildingDailyUpdate(...)
	self.research_points_day = 0
end

function BaseResearchLab:TechId()
	local tech_id = self.city:GetResearchInfo()
	return tech_id
end

function BaseResearchLab:GetWorkNotPossibleReason()
	if not self:TechId() then
		return "NoResearch"
	end
	return Building.GetWorkNotPossibleReason(self)
end

function BaseResearchLab:GetResearchProgress()
	return self.city:GetResearchProgress()
end

function BaseResearchLab:GetEstimatedDailyProduction()
	local total = 0
	local durations = const.DefaultWorkshiftDurations
	for i=1,#durations do
		total = total + self:ModifyValue(self:GetWorkshiftPerformance(i), "performance") * durations[i] * self.ResearchPointsPerDay
	end
	local pts = total / (100 * const.HoursPerDay)
	local res = MulDivRound(pts, 100 - self:GetCollaborationLoss(), 100)
	return res, pts - res
end

function BaseResearchLab:GetEstimatedDailyLoss()
	local pts, loss = self:GetEstimatedDailyProduction()
	return loss
end

function BaseResearchLab:GetCollaborationLoss()
	local blds = self.city.labels[self.template_name]
	local count = 1
	for i=1,#blds do
		local bld = blds[i]
		if bld ~= self and bld.working then
			count = count + 1
		end
	end
	return Min(g_Consts.MaxResearchCollaborationLoss, (count - 1) * 10)
end

function BaseResearchLab:AddResearchPoints(dt)
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

function BaseResearchLab:OnSetWorking(working)
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

function BaseResearchLab:UIResearchTech()
	OpenResearchDialog()
end
--fx------------------------------------------------------------
function BaseResearchLab:SetSupply(resource, amount)	
	ElectricityConsumer.SetSupply(self, resource, amount)
	if not self:TechId() and self.ui_working then --else Research start/end should fire
		if amount <= 0 then --no electricity
			PlayFX("Research", "off", self)
		else --power just came and we are turned on
			PlayFX("Research", "done", self)
		end
	end
end

function BaseResearchLab:SetUIWorking(work)
	ElectricityConsumer.SetUIWorking(self, work)
	if not self:TechId() and self:HasPower() then --else Research start/end should fire
		if work then
			PlayFX("Research", "done", self)
		else
			PlayFX("Research", "off", self)
		end
	end
end

function BaseResearchLab:GetUIResearchProject()
	return self.city:GetUIResearchProject()
end

function ResearchLabUpdateAll()
	ForEach{
		class = "BaseResearchLab",
		exec = function(lab)
			lab:UpdateWorking()
		end
	}
end

function OnMsg.ResearchQueueChange()
	DelayedCall(0, ResearchLabUpdateAll)
end