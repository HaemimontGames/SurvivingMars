DefineClass.StirlingGenerator = {
	__parents = { "ElectricityProducer" },
	properties = {
		{ template = true, id = "production_factor_interacted",     name = Untranslated("Interacted Production Coef %"),     category = "Power Production", editor = "number", default = 100, modifiable = true },
		{ template = true, id = "production_factor_not_interacted", name = Untranslated("Not Interacted Production Coef %"), category = "Power Production", editor = "number", default = 100, modifiable = true },
		{ template = true, id = "RedundantCoolantSysChance",        name = Untranslated("Redundant Coolant Sys Chance"),        category = "Gameplay",         editor = "number", default = 90, modifiable = true },
	},
	time_opened_start = false,
	opened = false,
	open_close_thread = false,
}

function StirlingGenerator:GameInit()
	self:OnChangeState(true)
end

function StirlingGenerator:BuildingUpdate(dt, day, hour)
	if self.opened and not self:CanBeOpened() then
		self:SetOpenState(false)
	end
end

function StirlingGenerator:OnChangeState(skip_anim)
	if self:IsOpened() then
		self:SetBase("electricity_production", self:GetClassValue("electricity_production") * self.production_factor_interacted / 100)
	else
		self:SetBase("electricity_production",self:GetClassValue("electricity_production") * self.production_factor_not_interacted / 100)
	end
	self.accumulate_dust = self:IsOpened() and not IsObjInDome(self)
	self.accumulate_maintenance_points = self:IsOpened()
	if not skip_anim then
		self:UpdateAnim()
	end
	RebuildInfopanel(self)
end

function StirlingGenerator:OnUpgradeToggled(...)
	self:OnChangeState(true)
end

function StirlingGenerator:IsOpened()
	return self.opened and self.working
end

function StirlingGenerator:UpdateAnim()
	DeleteThread(self.open_close_thread)
	self.open_close_thread = CreateGameTimeThread(function()
		local anim = self:GetStateText()
		if anim ~= "idle" and anim ~= "idleOpened" then
			Sleep(self:TimeToAnimEnd())
		end
		local opened = self:IsOpened()
		local current_state = GetStateName(self:GetState())
		if opened and current_state == "idleOpened"
			or not opened and current_state == "idle" then return end --don't transition if already in desired state
		
		PlayFX("StirlingGenerator", opened and "open_start" or "close_start", self)
		local new_anim = opened and "opening" or "closing" 
		if new_anim ~= anim then
			self:SetAnim(1, new_anim)
		end
		if opened then
			self:SetIsNightLightPossible(true)
		end
		local t = self:TimeToMoment(1, "Hit")
		if t == 0 then
			t = self:TimeToMoment(1, "Hit", 2)
		end
		if t then
			Sleep(t)
		end
		PlayFX("StirlingGenerator", "hit-moment", self)
		Sleep(self:TimeToAnimEnd())
		if opened then
			self:SetAnim(1, "idleOpened")
		else
			self:SetAnim(1, "idle")
		end
		PlayFX("StirlingGenerator", opened and "open" or "close", self)
		if not opened then
			self:SetIsNightLightPossible(false)
		end
	end)
end

function StirlingGenerator:CanBeOpened()
	return true--not g_DustStorm or IsObjInDome(self)
end

function StirlingGenerator:SetOpenState(opened)
	if self:RepairNeeded() then
		return
	end
	if opened and not self:CanBeOpened() then
		return
	end
	if self.opened == (opened or false) then
		return
	end
	self.opened = opened
	self:OnChangeState()
end

function StirlingGenerator:ToggleOpenedState(broadcast)
	local opened = not self.opened
	if broadcast then
		local list = self.city.labels[self.class] or empty_table
		for i, obj in ipairs(list) do
			if obj:GetUIInteractionState() then
				obj:SetOpenState(opened)
			end	
		end		
	else
		self:SetOpenState(opened)
	end
	RebuildInfopanel(self)
end

function StirlingGenerator:GetUIOpenStatus()
	return self:IsOpened() and T(7356, "Open") or T(7357, "Closed")
end

function StirlingGenerator:OnSetWorking(working)
	ElectricityProducer.OnSetWorking(self, working)	
	self:OnChangeState()
end

function StirlingGenerator:GetAdditionalProduction()
	local optimal_production = self.electricity_production * self.production_factor_interacted / 100
	return optimal_production - self.electricity.production
end

function StirlingGenerator:OnSkinChanged(skin, palette)
	Building.OnSkinChanged(self, skin, palette)
	if self:IsOpened() then
		PlayFX("StirlingGenerator", "close", self)
		PlayFX("StirlingGenerator", "open_start", self)
	end
end