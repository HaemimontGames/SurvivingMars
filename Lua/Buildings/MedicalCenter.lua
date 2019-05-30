DefineClass.MedicalBuilding = {
	__parents = { "ElectricityConsumer", "ServiceWorkplace" },
	rejuvenation_upgrade = "",
}

function MedicalBuilding:IsRejuvenationTreatment()
	return self.city:IsTechResearched("RejuvenationTreatment") and self.upgrade_on_off_state[self.rejuvenation_upgrade]
end

function MedicalBuilding:SetCustomLabels(obj, add)
	ServiceWorkplace.SetCustomLabels(self, obj, add)
	local label = add and obj.AddToLabel or obj.RemoveFromLabel
	
	if self:IsRejuvenationTreatment() then
		label(obj, "interestRelaxation", self)
	end
end

function MedicalBuilding:GetServiceList()
	local t = ServiceWorkplace.GetServiceList(self)
	if t and t ~= "" and self:IsRejuvenationTreatment() then
		t = t .. ", " .. GetInterestDisplayName("interestRelaxation")
	end
	return t
end

function MedicalBuilding:IsOneOfInterests(interest)
	return 
		ServiceWorkplace.IsOneOfInterests(self, interest) 
		or (interest == "interestRelaxation" and self:IsRejuvenationTreatment())
end

function MedicalBuilding:Service(unit, duration, daily_interest)
	ServiceWorkplace.Service(self, unit, duration)
	if daily_interest == "interestRelaxation" and self:IsRejuvenationTreatment() then
		unit:ChangeComfort( TechDef.RejuvenationTreatment.param1 * const.Scale.Stat, self.template_name )
	end
	if unit.traits.Infected and g_StartVaccinating then
		unit:RemoveTrait("Infected")
	end
end

function OnMsg.BuildingUpgraded(building, upgrade_id)
	if building:IsKindOf("MedicalBuilding") and upgrade_id == building.rejuvenation_upgrade then
		building.city:AddToLabel("interestRelaxation", building)
		building.parent_dome:AddToLabel("interestRelaxation", building)
	end
end

function MedicalBuilding:OnUpgradeToggled(upgrade_id, new_state)
	if upgrade_id == self.rejuvenation_upgrade then
		if new_state then
			self.city:AddToLabel("interestRelaxation", self)
			self.parent_dome:AddToLabel("interestRelaxation", self)
		else
			self.city:RemoveFromLabel("interestRelaxation", self)
			self.parent_dome:RemoveFromLabel("interestRelaxation", self)
		end
	end
end

DefineClass.MedicalCenter = {
	__parents = { "MedicalBuilding" },
	rejuvenation_upgrade = "MedicalCenter_RejuvenationTreatment",
}

DefineClass.Infirmary = {
	__parents = { "MedicalBuilding", "InteriorAmbientLife"},
	flags = { efWalkable = true },
	interior = {"InfirmaryInterior"},
	rejuvenation_upgrade = "Infirmary_RejuvenationTreatment",
}
