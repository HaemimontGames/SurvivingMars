DefineClass.MartianUniversity = {
	__parents = { "ElectricityConsumer", "TrainingBuilding", "InteriorAmbientLife" },
	properties = {	
		{ template = true, id = "specialization", name = T(668, "Gain specialization"),  default = "auto", category = "University", editor = "combo",  items = GetColonistSpecializationCombo(false, "auto")},
	},
	training_type = "specialization",
	trained_specialists = false,
}

function MartianUniversity:Init()	
	self.trained_specialists = {}
end

function MartianUniversity:SetTrainedSpecialization(specialization, broadcast)
	if broadcast then
		BroadcastAction(self, "SetTrainedSpecialization", specialization)
		return
	end
	self.specialization = specialization
end

function MartianUniversity:OnTrainingCompleted(unit)	
	local specialization = self.specialization
	if specialization == "auto" then
		local most = GetMostNeededSpecialistAround(unit.dome)
		specialization = most or table.interaction_rand(ColonistSpecializationList, "specialization")
	end
	unit:AddTrait(specialization)
	Msg("TrainingComplete", self, unit)
	unit.training_points[self.training_type] = nil
	if not self.trained_specialists then
		self.trained_specialists = {}
	end	
	self.trained_specialists[specialization] = (self.trained_specialists[specialization] or 0) + 1
	if not next(unit.training_points) then
		unit.training_points = false
	end
	self:FireWorker(unit)
end

function MartianUniversity:CanTrain(unit)
	if not unit.traits.none or unit.traits.Senior and not g_SeniorsCanWork then
		return
	end
	return TrainingBuilding.CanTrain(self, unit) 
end

function MartianUniversity:GetSpecialization()
	local spec = self.specialization
	return spec == "auto" and T(669, "Auto") or GetSpecialization(spec).display_name_plural
end

function MartianUniversity:GetNeededSpecializations()
	local needed = GetNeededSpecialistAround(self.parent_dome)
	local items = {}
	for i, spec in ipairs(ColonistSpecializationList) do
		items[#items + 1] = T{532, "<specialists><right><count>", 
			specialists = GetSpecialization(spec).display_name_plural, 
			count = needed[spec] or 0}
	end
	return table.concat(items, "<newline><left>")
end

function MartianUniversity:GetTrainedRollover()
	local texts = {}
	texts[#texts+1] = T(241, "Students will be trained to receive the selected specialization or to automatically get specializations desired in your colony.")
	texts[#texts+1] = Untranslated("")
	for i, spec in ipairs(ColonistSpecializationList) do
		local trained = self.trained_specialists[spec]
		if trained then
			local spec_info = GetSpecialization(spec)
			texts[#texts +1] = T{7948, "<specialist><right><count>",specialist = spec_info.display_name_plural, count = trained}
		end
	end	
	return table.concat(texts, "<newline><left>")
end

function GetNeededSpecialistAround(dome)
	local city = dome.city

	local needed_specialist = {}
	for i, building in ipairs(city.labels.Workplace or empty_table) do
		local spec = building.specialist
		if spec ~= "none" and not building.destroyed and not building.demolishing and not building.bulldozed then
			local count = 0
			if building.active_shift>0 then
				count = building.max_workers - (building.closed_workplaces[building.active_shift] or 0)
			else
				local max = building.max_workers
				for i = 1, building.max_shifts do
					count = count + Max(0, max - (building.closed_workplaces[i] or 0))
				end
			end	
			needed_specialist[spec] = (needed_specialist[spec] or 0) + count			
		end
	end
	for _, spec in ipairs(ColonistSpecializationList) do
		local specs_count = 0
		local specs = city.labels[spec] or empty_table
		for _, colonist in ipairs(specs) do
			if colonist:CanWork() then
				specs_count = specs_count + 1
			end
		end
		needed_specialist[spec] =  Max(0,(needed_specialist[spec] or 0) - specs_count)
	end
	
	return needed_specialist
end

function GetMostNeededSpecialistAround(dome)
	local best_v, best_s = 0
	local needed = GetNeededSpecialistAround(dome) or empty_table
	for spec, count in pairs(needed) do
		if count > best_v then
			best_s = spec
			best_v = count
		end
	end
	return best_s
end