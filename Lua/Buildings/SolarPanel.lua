DefineClass.SolarPanelBase = {
	__parents = { "Object" },
	artificial_sun = false,
	panel_obj = false,
}

function SolarPanelBase:GameInit()
	local sun = self.city.labels.ArtificialSun and self.city.labels.ArtificialSun[1] or nil
	if sun and TestSunPanelRange(sun, self) then
		self.artificial_sun = sun
	end
	self:UpdateProduction()
end

function SolarPanelBase:UpdateProduction()
	local new_base_production = self:CanBeOpened() and self:GetClassValue("electricity_production") or 0
	if self.base_electricity_production ~= new_base_production then
		self:SetBase("electricity_production", new_base_production)
		RebuildInfopanel(self)
	end
end

function SolarPanelBase:IsAffectedByArtificialSun()
	return self.artificial_sun and self.artificial_sun.work_state == "produce"
end

function SolarPanelBase:CanBeOpened()
	return SunAboveHorizon or self:IsAffectedByArtificialSun()
end

function SolarPanelBase:SetArtificialSun(sun)
	self.artificial_sun = sun
	self:UpdateProduction()
end

function SolarPanelBase:IsOpened()
	return true
end

----

DefineClass.SolarPanelBuilding = {
	__parents = { "SolarPanelBase", "ElectricityProducer" },
}

function SolarPanelBuilding:OnSetWorking(working)
	self:UpdateProduction()
	ElectricityProducer.OnSetWorking(self, working)
end

function SolarPanelBuilding:BuildingUpdate(dt, day, hour)
	self:UpdateProduction(hour)
end

function SolarPanelBuilding:SetDustVisualsPerc(perc)
	if not self.show_dust_visuals then return end
	BuildingVisualDustComponent.SetDustVisualsPerc(self, perc)
	if IsValid(self.panel_obj) then
		BuildingVisualDustComponent.SetDustVisualsPerc(self.panel_obj, perc)
	end
end

function SolarPanelBuilding:SetDustVisuals(dust)
	if not self.show_dust_visuals then return end
	if self:GetGameFlags(const.gofUnderConstruction) ~= 0 then return end
	BuildingVisualDustComponent.SetDustVisuals(self, dust)
	if IsValid(self.panel_obj) then
		BuildingVisualDustComponent.SetDustVisuals(self.panel_obj, dust)
	end
end

function SolarPanelBuilding:OnChangeState()
	self.accumulate_dust = self:IsOpened() and not IsObjInDome(self)
	if g_DustRepulsion then
		local percent = self:IsOpened() and 0 or -(100 + g_DustRepulsion)
		self:SetModifier("maintenance_build_up_per_hr", "DustRepulsion", 0, percent)
	end
	self.accumulate_maintenance_points = self:IsOpened() or not not g_DustRepulsion
end

----

DefineClass.SolarPanel = {
	__parents = { "SolarPanelBuilding" },
	building_update_time = const.HourDuration,
	open_close_thread = false,
	interaction_state = false,
}

function SolarPanel:GameInit()
	self.panel_obj = self:GetAttach(self:GetEntity() .. "Top")
	self.panel_obj:Detach()
	self.panel_obj:SetAngle(self:GetAngle())
	self.panel_obj.base = self
end

function SolarPanel:UpdateProduction()
	self:SetInteractionState(self:CanBeOpened() and self.working)
	SolarPanelBase.UpdateProduction(self)
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
	UICity:ForEachLabelObject("SolarPanelBase", "UpdateProduction")
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

GlobalVar("g_DustRepulsion", false)

function OnMsg.TechResearched(tech_id, city)
	if tech_id == "DustRepulsion" then
		g_DustRepulsion = TechDef.DustRepulsion.param1
	end
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