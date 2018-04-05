DefineClass.Arcology =
{
	__parents = { "SpireBase", "ElectricityConsumer", "Residence" },
}

function Arcology:BuildingUpdate()
	self:ApplyHiveMindBonus()
end

function Arcology:GetHiveMindBonus()
	local traits = {}
	local trait_defs = DataInstances.Trait
	for _, unit in ipairs(self.colonists) do
		for trait_id in pairs(unit.traits) do
			if trait_id ~= "none" then
				local trait_def = trait_defs[trait_id]
				local cat = trait_def and trait_def.category
				if cat == "Positive" or cat == "Specialization" then
					traits[trait_id] = true
				end
			end
		end
	end
	return table.count(traits)
end

function Arcology:ApplyHiveMindBonus()
	if not self.city:IsTechResearched("HiveMind") then
		return
	end
	local bonus = self:GetHiveMindBonus()
	local display_name = TechDef["HiveMind"].display_name
	for _, unit in ipairs(self.colonists) do
		unit:SetModifier("performance", "hive mind", bonus, 0, T{8570, "<green>Hive Mind <FormatSignInt(amount)></color>"})
	end
end

function Arcology:AddResident(unit)
	Residence.AddResident(self, unit)
	self:Notify("ApplyHiveMindBonus")
end

function Arcology:RemoveResident(unit)
	Residence.RemoveResident(self, unit)
	unit:SetModifier("performance", "hive mind", 0, 0)
	self:Notify("ApplyHiveMindBonus")
end