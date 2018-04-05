DefineClass.ArtificialSun = {
	__parents = { "Building", "LifeSupportConsumer", "ElectricityProducer", "BaseHeater" },
	
	properties = {
		{ template = true, id = "max_water_charge", name = T{29, "Max water consumption while charging"}, category = "Artificial Sun", editor = "number", default = 100*const.ResourceScale, scale = const.ResourceScale, modifiable = true },
		{ template = true, id = "water_capacity", name = T{30, "Water Capacity"}, editor = "number", category = "Artificial Sun", default = 1000*const.ResourceScale, scale = const.ResourceScale, modifiable = true },
		{ template = true, id = "effect_range", name = T{31, "Effect Range"}, editor = "number", category = "Artificial Sun", default = 8, min = 1, max = 20 },
		{ id = "power_production", name = T{32, "Power Production"}, editor = "number", default = 0, no_edit = true },
		{ id = "stored_water", name = T{33, "Stored Water"}, editor = "number", default = 0, no_edit = true },
		{ id = "work_state", name = T{34, "Work State"}, editor = "text", default = "", no_edit = true },
	},
	is_tall = true,
	heat = 2*const.MaxHeat,
}

function ArtificialSun:GameInit()
	self.power_production = self.electricity_production

	local panels = GetObjects{class = "SolarPanel", area = self, hexradius = self.effect_range}
	for i = 1, #panels do
		panels[i]:SetArtificialSun(self)
	end		
end

function ArtificialSun:CreateLifeSupportElements()
	self.water = NewSupplyGridConsumer(self, true)
	self:SetBase("water_consumption", 0)
end

function ArtificialSun:HasWater()
	local water = self.water
	return self.water_consumption == 0 or (water and water.current_consumption > 0)
end

function ArtificialSun:ConsumeSupply(resource, amount)
	if resource == "water" then
		self.stored_water = self.stored_water + amount
		if self.stored_water >= self.water_capacity then
			self:SetWorkState("produce")
		end
	end
end

function ArtificialSun:GetHeatRange()
	return 10 * self.effect_range * guim
end

function ArtificialSun:GetHeatBorder()
	return const.SubsurfaceHeaterFrameRange
end

function ArtificialSun:SetWorkState(state)
	if self.work_state == state then
		return
	end
	
	if state == "produce" then
		if self.work_state == "charge" then
			PlayFX("ArtificialSunCharge", "end", self)
		end
		PlayFX("ArtificialSunProduce", "start", self)
		self:SetBase("electricity_production", self.power_production)
		self:SetBase("water_consumption", 0)
		self.stored_water = 0
	else
		if self.work_state == "produce" then
			PlayFX("ArtificialSunProduce", "end", self)
		end
		if self.work_state == "charge" and state ~= "charge" then
			PlayFX("ArtificialSunCharge", "end", self)
		end
		if state == "charge" then
			PlayFX("ArtificialSunCharge", "start", self)
		end
		self:SetBase("electricity_production", 0)
		self:SetBase("water_consumption", self.max_water_charge)
		
	end

	self.work_state = state
		
	self:ApplyHeat(self.work_state == "produce")

	RebuildInfopanel(self)
end

function ArtificialSun:OnSetWorking(working)
	Building.OnSetWorking(self, working)
	local water = self.water
	
	if working then
		if self.stored_water >= self.water_capacity then
			self:SetWorkState("produce")
		else
			self:SetWorkState("charge")
		end
	else		
		self:SetWorkState("disabled")
	end
end

function ArtificialSun:ShouldShowNotConnectedToPowerGridSign()
	return self.work_state == "produce" and ElectricityProducer.ShouldShowNotConnectedToPowerGridSign(self)
end

function ArtificialSun:ShouldShowNotConnectedToLifeSupportGridSign()
	return self.work_state ~= "produce" and LifeSupportConsumer.ShouldShowNotConnectedToLifeSupportGridSign(self)
end

function ArtificialSun:MoveInside()
end

function ArtificialSun:GetSelectionRadiusScale()
	return self.effect_range
end