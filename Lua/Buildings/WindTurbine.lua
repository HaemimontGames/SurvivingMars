DefineClass.WindTurbine = {
	__parents = { "ElectricityProducer", },
	properties = {
		{ template = true, id = "bonus_per_kilometer_elevation", name = T{829, "Bonus Production % per km elevation"}, category = "Power Production", editor = "number", default = 200 },
		{ template = true, id = "min_production_to_work", name = T{830, "Min Production to Work"}, category = "Power Production", editor = "number", default = 1000, help = "If production would fall bellow this number, the building will turn itself off." },
		{ template = true, id = "dust_storm_bonus_percent", name = T{831, "Dust Storm bonus percent"}, category = "Power Production", editor = "number", default = 50, modifiable = true },
		{ template = true, id = "great_dust_storm_bonus_percent", name = T{832, "Great Dust Storm bonus percent"}, category = "Power Production", editor = "number", default = 100, modifiable = true },
	},
	
	wait_working_anims_to_finish = true,
	building_update_time = const.HourDuration, --wind changes every hour
	last_fx_moment_sent = false,
}

function WindTurbine:GetEletricityUnderproduction()
	local elevation_bonus = self:GetElevationBonus()
	return Max(0, (self:GetClassValue("electricity_production") + elevation_bonus) - self.electricity_production)
end

function WindTurbine:CalcProduction()
	local elevation_bonus = self:GetElevationBonus()
	local production_bonus = 100 + (elevation_bonus - 50)
	if g_DustStorm then
		production_bonus = g_DustStorm.type == "great" and production_bonus + self.great_dust_storm_bonus_percent or production_bonus + self.dust_storm_bonus_percent
	end
	self:SetAnimSpeedModifier( Min(300 + 3 * production_bonus, 1100) )
	self:SetBase("electricity_production", MulDivRound(50 + production_bonus, self:GetClassValue("electricity_production"), 100))
	
	self:UpdateWorking()
end

function WindTurbine:GetElevationBonus()
	return self:GetElevation() * self.bonus_per_kilometer_elevation / 1000
end

function WindTurbine:GetDustStormBonusProduction()
	local dustStormBonus = 0
	if g_DustStorm then
		dustStormBonus = g_DustStorm.type == "great" and self.great_dust_storm_bonus_percent or self.dust_storm_bonus_percent
	end
	return MulDivRound(dustStormBonus, self:GetClassValue("electricity_production"), 100)
end

function WindTurbine:GetWorkNotPossibleReason()
	if not self:IsProducingEnoughToWork() then
		return "LowWind"
	end
	return ElectricityProducer.GetWorkNotPossibleReason(self)
end

function WindTurbine:IsProducingEnoughToWork()
	return self.electricity_production > self.min_production_to_work
end

function WindTurbine:GetElevation()
	return GetElevation(self:GetVisualPos())
end

function WindTurbine:BuildingUpdate(dt, day, hour)
	self:CalcProduction()
end