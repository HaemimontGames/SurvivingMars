DefineClass.SensorTowerBase = {
	__parents = { "Object" },
	turn_off_time = 0,
}

function SensorTowerBase:GameInit()
	self.turn_off_time = GameTime()
end

function SensorTowerBase:OnSetWorking(working)
	if not working then
		self.turn_off_time = GameTime()
	elseif HintsEnabled then
		HintTrigger("HintScanningSectors")
	end
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
