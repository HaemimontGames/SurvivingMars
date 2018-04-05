----------------------------------------------------------------------------------------------------------------------------------------------------
DefineClass.School = {
	__parents = {"TrainingBuilding"},
	properties = {	
	},
	training_type = "graduation",
	max_traits = 3,
}

for i=1, School.max_traits do
	table.insert(School.properties, { template = true, id = "trait"..i, name = T{725, "Learn trait <idx>", idx = i},  default = false, category = "School", editor = "combo", items = SchoolTraitsCombo})
end

function School:CanTrain(unit)
	if not TrainingBuilding.CanTrain(self, unit) then
		return false
	end	
	local traits = {}
	for i=1, self.max_traits do
		traits[#traits+1] = self["trait"..i]
	end	
	local campatible = FilterCompatibleTraitsWith(traits, unit.traits)
	return #campatible>0
end

function School:FireWorker(worker, shift, idx)
	self:OnTrainingCompleted(worker)
	self.life_time_trained = self.life_time_trained + 1
	TrainingBuilding.FireWorker(self, worker, shift, idx)
end

function School:OnTrainingCompleted(unit)	
	local chance = unit.training_points and unit.training_points[self.training_type] or 0
	local rand = self:Random(150)
	if rand<=chance then
		local traits = {}
		for i=1, self.max_traits do
			traits[#traits+1] = self["trait"..i]
		end	
		local compatible = FilterCompatibleTraitsWith(traits, unit.traits)
		if #compatible>0 then
			unit:AddTrait(table.rand(compatible))
		end
	end
	if unit.training_points then
		unit.training_points[self.training_type] = nil	
		if not next(unit.training_points) then
			unit.training_points = false
		end
	end
end

function School:SetTrait(idx, traitname, broadcast)
	if broadcast then
		BroadcastAction(self, "SetTrait", idx, traitname)
		return
	end
	self["trait"..idx] = traitname
	--self:UpdateVisitors()
	self:UpdateUI()
	ObjModified(self)
end

