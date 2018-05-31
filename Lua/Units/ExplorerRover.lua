DefineClass.ExplorerRover = {
	__parents = {  "BaseRover", "ComponentAttach" },
	entity = "RoverExplorer",
	
	display_name = T{1684, "RC Explorer"},
	description = T{4455, "A remote-controlled exploration vehicle that can analyze Anomalies."},
	display_icon = "UI/Icons/Buildings/rover_human.tga",
	
	collision_radius = 540,
	direction_arrow_scale = 260,
	
	entrance_type = "rover_entrance",
	work_spot_task = "Workrover",
	
	scanning_start = false,
	scan_time = false,
	scanning = false,
	
	fx_actor_class = "ExplorerRover", --temp
	encyclopedia_id = "ExplorerRover",
	
	StopResearchCommands = {
		NoBattery = true,
		Malfunction = true,
	},
	research_points_lifetime = false,
	palettes = { "ExplorerRover" },
	
	malfunction_idle_state = "malfunctionIdle",
}

function ExplorerRover:GameInit()
end

function ExplorerRover:Idle()
	self:TryRechargeFromIdle()
	self:SetState("idle")
	Halt()
end

const.ExplorerRoverAnalyzeDrainRate = const.BaseRoverBatteryHourlyDrainRate * 2

function ExplorerRover:Analyze(anomaly)
	-- approach marker
	if not self:Goto(anomaly, 20*guim, 15*guim) or not IsValid(self) then
		return
	end	
	self:StopBatteryThread()
	self:StartBatteryThread(-const.ExplorerRoverAnalyzeDrainRate) --reset bat thread with analyze cost
	self:SetState("idle")
	self:SetPos(self:GetVisualPos()) --stahp
	self:Face(anomaly:GetPos(), 200)
	local layers  = anomaly.depth_layer or 1
	self.scan_time = layers * g_Consts.RCRoverScanAnomalyTime	
	
	-- scan left time
	local progress_time = MulDivRound(anomaly.scanning_progress, self.scan_time, 100 )
	self.scanning_start = GameTime()- progress_time
	--local start_stop = self:GetAnimDuration("scanStart") + self:GetAnimDuration("scanEnd")
	RebuildInfopanel(self)
	self:PushDestructor(function(self)
		if IsValid(anomaly) then
			anomaly.scanning_progress = self:GetScanAnomalyProgress()
			if anomaly.scanning_progress >= 100 then
				self:Gossip("ScanAnomaly", anomaly.class, anomaly.handle)
				anomaly:ScanCompleted(self)
				anomaly:delete()
			end
		end
		
		self:StopFX()
		self.scanning = false
		self.scanning_start = false
		self:StopBatteryThread() --so normal drain resumes
		--self:PlayState("scanEnd")
	end)
	
	local time = self.scan_time - progress_time
	
	self:StartFX("Scan", anomaly)
	--self:PlayState("scanStart")
	self.scanning = true
	--self:PlayState("scanIdle", - (time - start_stop))
	
	while time > 0 and IsValid(self) and IsValid(anomaly) do
		Sleep(1000)
		time = time - 1000
		anomaly.scanning_progress = self:GetScanAnomalyProgress()
	end
		
	self:PopAndCallDestructor()
end

function ExplorerRover:GetScanAnomalyProgress()
	return self.scanning_start and MulDivRound(GameTime() - self.scanning_start, 100, self.scan_time) or 0
end

function ExplorerRover:CanInteractWithObject(obj, interaction_mode)
	if self.command=="Dead" then return false end
	if interaction_mode ~= "recharge" and IsKindOf(obj, "SubsurfaceAnomaly") then
		return true, T{9634, "<UnitMoveControl('ButtonA', interaction_mode)>:  Scan Anomaly", self} 
	end
	
	return BaseRover.CanInteractWithObject(self, obj, interaction_mode)
end

function ExplorerRover:InteractWithObject(obj, interaction_mode)
	if self.command=="Dead" then return false end
	if interaction_mode ~= "recharge" and IsKindOf(obj, "SubsurfaceAnomaly") then
		self:SetCommand("Analyze", obj)
		SetUnitControlInteractionMode(self, false)
		return
	end
	
	return BaseRover.InteractWithObject(self, obj, interaction_mode)
end

function ExplorerRover:GetResearchProgress()
	return self.city:GetResearchProgress()
end

function ExplorerRover:GetEstimatedDailyLoss()
	local rp, loss = self.city:CalcExplorerResearchPoints(const.DayDuration)
	return loss
end

function ExplorerRover:GetEstimatedDailyProduction()
	return g_Consts.ExplorerRoverResearchPoints
end

function ExplorerRover:GetUIResearchProject()
	return self.city:GetUIResearchProject()
end

function ExplorerRover:LogRP(rp)
	self.research_points_lifetime = (self.research_points_lifetime or 0) + rp
end