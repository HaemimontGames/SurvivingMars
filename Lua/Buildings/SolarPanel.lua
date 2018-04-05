DefineClass.SolarPanel = {
	__parents = { "ElectricityProducer" },
	building_update_time = const.HourDuration,
	panel_entity = false,
	panel_obj = false,
	open_close_thread = false,
	interaction_state = false,
	
	artificial_sun = false,
}

function SolarPanel:GameInit()
	self.panel_obj = self:GetAttaches(self:GetEntity() .. "Top")[1]
	self.panel_obj:Detach()
	self.panel_obj.base = self
	
	local sun = self.city.labels.ArtificialSun and self.city.labels.ArtificialSun[1] or nil
	if sun and HexAxialDistance(self, sun) <= sun.effect_range then
		self.artificial_sun = sun
	end
	self:UpdateProduction()
end

function SolarPanel:Done()
	if IsValid(self.panel_obj) then
		DoneObject(self.panel_obj)
	end
end

function SolarPanel:Destroy()
	Building.Destroy(self)
	self.panel_obj:SetColorModifier(self.demolish_color)
	if self.panel_obj:GetStateText() ~= "idle" then
		CreateGameTimeThread(function()
			if not IsValid(self) or not IsValid(self.panel_obj) then return end
			Sleep(self.panel_obj:TimeToAnimEnd())
			self.panel_obj:SetAnim(1, "idle")
		end)
	end
end

function SolarPanel:RebuildStart()
	self:ClearEnumFlags(const.efVisible)
	self.panel_obj:ClearEnumFlags(const.efVisible)
end

function SolarPanel:RebuildCancel()
	self:SetEnumFlags(const.efVisible)
	self.panel_obj:SetEnumFlags(const.efVisible)
end

function SolarPanel:GetProductionPenalty()
	return g_DustStorm and g_DustStorm.descr.solar_penalty or 0
end

function SolarPanel:IsOpened()
	return self.interaction_state
end

function SolarPanel:SetInteractionState(state)
	if state == self.interaction_state then return end
	self.interaction_state = state
	self:OnChangeState()
	DeleteThread(self.open_close_thread)
	self.open_close_thread = CreateGameTimeThread(function()
		local anim_state = state and "opening" or "closing"
		local panel_obj = self.panel_obj
		if panel_obj:GetStateText() ~= "idle" then
			Sleep(panel_obj:TimeToAnimEnd())
		end
		if panel_obj:GetStateText() == anim_state then
			return
		end
		panel_obj:SetAnim(1, anim_state)
		if not state then
			panel_obj:SetAngle(self:GetAngle(), 5*const.MinuteDuration)
		end
	end)
end

function SolarPanel:OrientToSun(sun_azi, time)
	return self.panel_obj:SetAngle(sun_azi, time or const.MinuteDuration)
end

function OnMsg.SunChange()
	UICity:ForEachLabelObject("SolarPanel", "UpdateProduction")
end

function SunToSolarPanelAngle(sun_azi)
	return sun_azi - 30*60 < 0 and 390*60 - sun_azi or sun_azi - 30*60
end

function SolarPanelsOrientToSun(anim_time)
	local idle_state = EntityStates["idleOpened"]
	local opening_state = EntityStates["opening"]
	local azi = SunToSolarPanelAngle(GetSunPos())
	for _, panel in ipairs(UICity.labels.SolarPanel or empty_table) do
		local panel_obj = panel.panel_obj
		if panel:IsOpened() then
			local panel_state = panel_obj:GetState()
			if panel_state == idle_state then
				if panel:IsAffectedByArtificialSun() then
					local angle = CalcOrientation(panel:GetPos(), panel.artificial_sun:GetPos())
					panel:OrientToSun(angle+140*60, anim_time)
				else
					panel:OrientToSun(azi, anim_time)
				end
			elseif panel_state == opening_state and panel_obj:TimeToAnimEnd() < 2 then
				panel_obj:SetAnim(1, "idleOpened")
			end
		end
	end
end

GlobalGameTimeThread("SolarPanelOrientation", function()
	local update_interval = 3*const.MinuteDuration
	while true do
		Sleep(update_interval)
		SolarPanelsOrientToSun(update_interval)
	end
end)

function SolarPanel:UpdateProduction()
	local affected = self:IsAffectedByArtificialSun()
	self:SetInteractionState((SunAboveHorizon or affected) and self.working)
	local base_production = (SunAboveHorizon or affected) and self:GetClassValue("electricity_production") or 0
	local production_penalty = self:GetProductionPenalty()
	self:SetBase("electricity_production", (100 - production_penalty) * base_production / 100)
	RebuildInfopanel(self)
end

function SolarPanel:BuildingUpdate(dt, day, hour)
	self:UpdateProduction(hour)
end

function SolarPanel:OnSetWorking(working)
	self:UpdateProduction()
	ElectricityProducer.OnSetWorking(self, working)
end

GlobalVar("g_DustRepulsion", false)

function OnMsg.TechResearched(tech_id, city)
	if tech_id == "DustRepulsion" then
		g_DustRepulsion = TechDef.DustRepulsion.param1
	end
end

function SolarPanel:OnChangeState()
	self.accumulate_dust = self:IsOpened() and not IsObjInDome(self)
	if g_DustRepulsion then
		local percent = self:IsOpened() and 0 or -(100 + g_DustRepulsion) -- param1 is the target regen rate
		self:SetModifier("maintenance_build_up_per_hr", "DustRepulsion", 0, percent)
	end
	self:SetAccumulateMaintenancePoints(self:IsOpened() or not not g_DustRepulsion)
end

function SolarPanel:AddVisualDust(dust)
	if not self.show_dust_visuals then return end
	BuildingVisualDustComponent.AddVisualDust(self, dust)
	if IsValid(self.panel_obj) then
		BuildingVisualDustComponent.AddVisualDust(self.panel_obj, dust)
	end
end
function SolarPanel:ResetDust()
	BuildingVisualDustComponent.ResetDust(self)
	if IsValid(self.panel_obj) then
		BuildingVisualDustComponent.ResetDust(self.panel_obj)
	end
end

function SolarPanel:SetDustVisualsPerc(perc)
	if not self.show_dust_visuals then return end
	BuildingVisualDustComponent.SetDustVisualsPerc(self, perc)
	if IsValid(self.panel_obj) then
		BuildingVisualDustComponent.SetDustVisualsPerc(self.panel_obj, perc)
	end
end

function SolarPanel:SetDustVisuals(dust)
	if not self.show_dust_visuals then return end
	BuildingVisualDustComponent.SetDustVisuals(self, dust)
	if IsValid(self.panel_obj) then
		BuildingVisualDustComponent.SetDustVisuals(self.panel_obj, dust)
	end
end

function SolarPanel:SetArtificialSun(sun)
	self.artificial_sun = sun
	self:UpdateProduction()
end

function SolarPanel:IsAffectedByArtificialSun()
	return self.artificial_sun and self.artificial_sun.work_state == "produce"
end

function SolarPanel:BroadcastVerify(other)
	-- make sure broadcasts affect buildings of the same template only
	return other.template_name == self.template_name
end

DefineClass.SolarPanelTop = {
	__parents = { "BuildingVisualDustComponent" },
	base = false,
}

function SolarPanelTop:SelectionPropagate()
	return self.base
end

DefineClass("SolarPanelBigTop", "SolarPanelTop")