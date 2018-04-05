DefineClass.StirlingGenerator = {
	__parents = { "ElectricityProducer" },
	properties = {
		{ template = true, id = "production_factor_interacted",     name = Untranslated("Interacted Production Coef %"),     category = "Power Production", editor = "number", default = 100, modifiable = true },
		{ template = true, id = "production_factor_not_interacted", name = Untranslated("Not Interacted Production Coef %"), category = "Power Production", editor = "number", default = 100, modifiable = true },
		{ template = true, id = "daily_dust_accumulation",          name = Untranslated("Daily dust accumulation when opened"), category = "Power Production", editor = "number", default =  10000 },
		{ template = true, id = "RedundantCoolantSysChance",        name = Untranslated("Redundant Coolant Sys Chance"),        category = "Gameplay",         editor = "number", default = 90, modifiable = true },
	},
	time_opened_start = false,
	opened = false,
	open_close_thread = false,
}

function StirlingGenerator:GameInit()
	self.accumulate_dust = self:IsOpened() and not IsObjInDome(self)
	self:SetAccumulateMaintenancePoints(self:IsOpened())
end

function StirlingGenerator:BuildingUpdate(dt, day, hour)
	self:AccumulateDust()
end

function StirlingGenerator:OnChangeState(skip_anim)
	if self:IsOpened() then
		self:SetBase("electricity_production", self:GetClassValue("electricity_production") * self.production_factor_interacted / 100)
	else
		self:SetBase("electricity_production",self:GetClassValue("electricity_production")* self.production_factor_not_interacted / 100)
	end
	self.accumulate_dust = self:IsOpened() and not IsObjInDome(self)
	self:SetAccumulateMaintenancePoints(self:IsOpened())
	self:AccumulateDust()
	if not skip_anim then
		self:UpdateAnim()
	end
	RebuildInfopanel(self)
end

function StirlingGenerator:OnUpgradeToggled(...)
	self:OnChangeState(true)
end

function StirlingGenerator:AccumulateDust()
	if self.time_opened_start then 
		local delta = GameTime() - self.time_opened_start
		self:AddDust(MulDivTrunc(self.daily_dust_accumulation, delta, const.DayDuration))
	end
	self.time_opened_start = self:IsOpened() and GameTime() or false
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

function StirlingGenerator:ToggleOpenedState(broadcast)
	local opened = not self.opened
	
	if broadcast then
		local list = self.city.labels.StirlingGenerator or empty_table
		for i, obj in ipairs(list) do
			if not obj:RepairNeeded() and obj.opened ~= opened then
				obj.opened = opened
				obj:OnChangeState()
			end
		end		
	else
		if self:RepairNeeded() then return end --eat the ev when building is broken
		self.opened = opened
		self:OnChangeState()
	end
	RebuildInfopanel(self)
end

function StirlingGenerator:GetUIOpenStatus()
	return self:IsOpened() and T{7356, "Open"} or T{7357, "Closed"}
end

function StirlingGenerator:OnSetWorking(working)
	ElectricityProducer.OnSetWorking(self, working)	
	self:OnChangeState()
end

function StirlingGenerator:GetAdditionalProduction()
	local optimal_production = self.electricity_production * self.production_factor_interacted / 100
	return optimal_production - self.electricity.production
end