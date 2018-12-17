DefineClass.SensorTowerBase = {
	__parents = { "Object" },
	turn_off_time = false,
}

function SensorTowerBase:OnSetWorking(working)
	if not working then
		self.turn_off_time = GameTime()
	elseif HintsEnabled then
		HintTrigger("HintScanningSectors")
	end
end

function SensorTowerBase:GetSensorTowerWorking()
	return self.working and T(11230, "Working") or T(7326, "Not Working")
end

function SensorTowerBase:GetWorkingSensorTowersCount()
	local towers = UICity.labels["SensorTower"]
	local count = 0
	for i = 1, #towers do
		if towers[i].working then
			count = count + 1
		end
	end
	return T{11231, "Working Sensor Towers:<right><count>", count = count}
end

function SensorTowerBase:GetCurrentPredictionTime()
	local warn_time = GetDisasterWarningTime()
	return T{11232, "Disaster Early Warning:<right><time>", time = GetEarlyWarningText(warn_time)}
end

DefineClass.SensorTower = {
	__parents = { "ElectricityConsumer", "OutsideBuildingWithShifts", "SensorTowerBase" },
}

function SensorTower:GameInit()
	if self.disable_maintenance > 0 then
		self.accumulate_dust = false
		self.accumulate_maintenance_points = false
	end
end



function SensorTower:OnModifiableValueChanged(prop)
	if prop == "disable_maintenance" then
		self:ResetDust()
		self.accumulate_dust = false
		self.accumulate_maintenance_points = false
		self:UpdateNoCCSign()
	end
end

function SensorTower:GetSelectionRadiusScale()
	if IsKindOf(UICity.mystery, "BlackCubeMystery") and g_BCHexRangeEnable[self.class] then
		return UICity.mystery.tower_protect_range
	end
	return 0
end

function SensorTower:ShowUISectionConsumption()
	if self.city:IsTechResearched("AutonomousSensors") then
		return false
	end	
	return Building.ShowUISectionConsumption(self)
end

function OnMsg.GatherFXActors(list)
	list[#list + 1] = "SensorTower"
end
