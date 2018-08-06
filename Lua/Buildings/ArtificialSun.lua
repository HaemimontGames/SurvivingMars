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

function TestSunPanelRange(sun, panel)
	local effect_range = sun.effect_range
	local o_p = sun:GetPos()
	local o_q, o_r = WorldToHex(o_p)
	local p_p = panel:GetPos()
	local p_q, p_r = WorldToHex(p_p)
	local shape = panel:GetShapePoints()
	local dir = HexAngleToDirection(panel:GetAngle())
	
	for i = 1, #shape do
		local sp = shape[i]
		local x, y = HexRotate(sp:x(), sp:y(), dir)
		if HexAxialDistance(o_q, o_r, p_q + x, p_r + y) <= effect_range then
			return true
		end
	end
	
	return false
end

function ArtificialSun:GameInit()
	self.power_production = self.electricity_production
	
	local sun_radius = (self.effect_range + 10) * const.GridSpacing --large radius extension so it can catch large panels
	local panel_query_testing_against = self
	local panels = MapGet(self,sun_radius,"SolarPanelBase",function(o) return TestSunPanelRange(panel_query_testing_against, o) end )
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