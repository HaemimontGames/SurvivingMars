DefineClass.ExplorerRover = {
	__parents = {  "BaseRover", "ComponentAttach" },
	entity = "RoverExplorer",
	SelectionClass = "ExplorerRover",
	display_name = T(1684, "RC Explorer"),
	display_name_pl = T(12090, "RC Explorers"),
	description = T(4455, "A remote-controlled exploration vehicle that can analyze Anomalies."),
	display_icon = "UI/Icons/Buildings/rover_human.tga",
	
	collision_radius = 540,
	
	entrance_type = "rover_entrance",
	work_spot_task = "Workrover",
	
	scanning_start = false,
	scan_time = false,
	scanning = false,
	
	fx_actor_class = "ExplorerRover", --temp
	encyclopedia_id = "ExplorerRover",
	
	StopResearchCommands = {
		Malfunction = true,
		Dead = true,
	},
	research_points_lifetime = false,
	palette = {"rover_accent","rover_dark","outside_metal","rover_base"},
	
	malfunction_idle_state = "malfunctionIdle",
	
	has_auto_mode = true,
}

function ExplorerRover:GameInit()
end

function ExplorerRover:Idle()
	self:SetState("idle")
	if g_RoverAIResearched and self.auto_mode_on then
		local unreachable_objects = self:GetUnreachableObjectsTable()
		
		local anomaly = MapFindNearest(self, "map", "SubsurfaceAnomaly", 
								function(a)
									if a.auto_rover then
										local r = a.auto_rover
										if r == self or not IsValid(r) or r.command == "Dead" or r.command == "Malfunction" then
											a.auto_rover = false
										end
									end
									return not unreachable_objects[a] and not a.auto_rover
								end)
		
		if anomaly then
			if self:HasPath(anomaly, self.work_spot_task) then
				anomaly.auto_rover = self
				self:SetCommand("Analyze", anomaly)
			else
				unreachable_objects[anomaly] = true
			end
		end
		Sleep(2500)
	else
		Halt()
	end
end

function ExplorerRover:Analyze(anomaly)
	self:PushDestructor(function(self)
		if anomaly.auto_rover == self then
			anomaly.auto_rover = false
		end
	end)
	-- approach marker
	if not self:Goto(anomaly, 20*guim, 15*guim) or not IsValid(self) then
		self:PopAndCallDestructor()
		return
	end	
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
		GetCommandFunc(self)(self, "Analyze", obj)
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
	if not self.working then return 0 end
	return g_Consts.ExplorerRoverResearchPoints
end

function ExplorerRover:GetUIResearchProject()
	return self.city:GetUIResearchProject()
end

function ExplorerRover:LogRP(rp)
	self.research_points_lifetime = (self.research_points_lifetime or 0) + rp
end

function ExplorerRover:ToggleAutoMode_Update(button)
	if not self.auto_mode_on then
		button:SetIcon("UI/Icons/IPButtons/automated_mode_off.tga")
	else
		button:SetIcon("UI/Icons/IPButtons/automated_mode_on.tga")
	end
end