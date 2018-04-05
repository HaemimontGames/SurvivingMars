local WaterReclamationSpireModifierId = "WaterReclamationSpireWaterConsumptionReduction"

DefineClass.WaterReclamationSpire = 
{
	__parents = {"SpireBase", "Workplace"},
	
	building_update_time = const.HourDuration,
	parent_dome_modifier = false,
}

function WaterReclamationSpire:OnModifiableValueChanged(prop)
	if prop == "performance" then
		self:RecalcModifiers()
	end
end

function WaterReclamationSpire:GetWaterConsumptionReductionFromPerf(perf)
	return perf / 2
end

function WaterReclamationSpire:RecalcModifiers()
	assert(self.parent_dome) --dome spires cannot be built outside of domes.
	--use the best performance
	local all_spires = self.parent_dome.labels.WaterReclamationSpires
	local perf = self.performance
	for i = 1, #all_spires do
		if self ~= all_spires[i] then
			local his_perf = all_spires[i].performance
			if his_perf > perf then
				perf = his_perf
			end
			
			if not self.parent_dome_modifier and all_spires[i].parent_dome_modifier then
				self.parent_dome_modifier = all_spires[i].parent_dome_modifier
			elseif self.parent_dome_modifier and not all_spires[i].parent_dome_modifier then
				all_spires[i].parent_dome_modifier = self.parent_dome_modifier
			end
		end
	end
	
	local actual_reduction_perc = -self:GetWaterConsumptionReductionFromPerf(perf)
	local t_t = self.parent_dome.label_modifiers.SupplyGridBuildings or empty_table
	local current_mod = t_t[WaterReclamationSpireModifierId]
	
	
	if (current_mod and current_mod.percent or 0) ~= actual_reduction_perc then
		local mod = actual_reduction_perc ~= 0 and Modifier:new{prop = "water_consumption", amount = 0, percent = actual_reduction_perc} or false
		self.parent_dome:SetLabelModifier("SupplyGridBuildings", WaterReclamationSpireModifierId, mod, true)
		
		if not self.parent_dome_modifier then
			self.parent_dome_modifier = ObjectModifier:new{target = self.parent_dome, prop = "water_consumption", amount = 0, percent = actual_reduction_perc}
		else
			self.parent_dome_modifier:Change(0, actual_reduction_perc)
		end
	end
end

function WaterReclamationSpire:Done()
	if #self.parent_dome.labels.WaterReclamationSpires > 1 then
		--there is another spire other then us.
		self.parent_dome:RemoveFromLabel("WaterReclamationSpires", self)
		self.parent_dome.labels.WaterReclamationSpires[1]:RecalcModifiers()
	else
		self.parent_dome:SetLabelModifier("SupplyGridBuildings", WaterReclamationSpireModifierId, false, true)
		if self.parent_dome_modifier then
			self.parent_dome_modifier:Change(0, 0)
			DoneObject(self.parent_dome_modifier)
		end
	end
end

function WaterReclamationSpire:SetDome(dome)
	if self.parent_dome then
		self.parent_dome:RemoveFromLabel("WaterReclamationSpires", self)
	end
	SpireBase.SetDome(self, dome)
	if dome then
		dome:AddToLabel("WaterReclamationSpires", self)
	end
end

function WaterReclamationSpire:OnSetWorking(working)
	self:RecalcModifiers()
	Workplace.OnSetWorking(self, working)
end
