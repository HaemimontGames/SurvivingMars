----------------------------------------------------------------------------------------------------------------------------------------------------
DefineClass.Sanatorium = {
	__parents = {"ElectricityConsumer", "TrainingBuilding"},
	properties = {	
	},
	training_type = "curing",
	max_traits = 3,
	total_cured = 0,
}

for i=1, Sanatorium.max_traits do
	table.insert(Sanatorium.properties, { template = true, id = "trait"..i, name = T{724, "Cure trait <idx>", idx = i},  default = false, category = "Sanatorium", editor = "combo", items = SanatoriumTraitsCombo})
end

function Sanatorium:OnTrainingCompleted(unit)	
	-- cure trait
	local traits = {}
	for i=1, self.max_traits do
		local id = self["trait"..i]
		if unit.traits[id] then
			traits[#traits + 1] = id
		end
	end
	local rand = 1 + self:Random(#traits)
	local remove_trait = traits[rand]
	unit:RemoveTrait(remove_trait)
	local add_trait
	if self:HasUpgrade("Sanatorium_BehavioralMelding") then
		add_trait = GetRandomTrait(unit.traits, {}, {}, "Positive")	
		unit:AddTrait(add_trait)
	end
	
	-- fire worker
	unit.training_points[self.training_type] = nil
	if not next(unit.training_points) then
		unit.training_points = false
	end
	self:FireWorker(unit)
	self.total_cured = self.total_cured + 1
	Msg("ColonistCured", unit, self, remove_trait, add_trait)
end

function Sanatorium:CanTrain(unit)
	if not TrainingBuilding.CanTrain(self, unit) then
		return false
	end
	local traits = unit.traits
	for k = 1, self.max_traits do
		if traits[ self["trait"..k] ] then
			return true
		end
	end
	return false
end

function Sanatorium:UpdateVisitors()
	for _, visitors in ipairs(self.visitors) do
		for j = #visitors, 1, -1 do
			local visitor = visitors[j]
			if not self:CanTrain(visitor) then
				self:FireWorker(visitor)
			end
		end
	end
end

function Sanatorium:SetTrait(idx, traitname, broadcast)
	if broadcast then
		BroadcastAction(self, "SetTrait", idx, traitname)
		return
	end
	if traitname~= self.trait1 and traitname~= self.trait2 and traitname~= self.trait3 then
		self["trait"..idx] = traitname
	end
	self:UpdateVisitors()
	ObjModified(self)
end
