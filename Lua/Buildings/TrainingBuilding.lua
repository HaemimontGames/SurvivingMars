DefineClass.TrainingBuilding = {
	__parents = {"ShiftsBuilding", "Holder", "DomeOutskirtBld"},
	
	properties = {		
		{template = true, id = "max_visitors",     name = T{823, "Max visitors per shift"},        default = 5,     category = "TrainingBuilding", editor = "number", min = 1, modifiable = true}, 	
		
		{template = true, id = "usable_by_children",name = T{735, "Usable by children"},  default = false, category = "TrainingBuilding", editor = "bool"},
		{template = true, id = "children_only",    name = T{736, "Children Only"},        default = false, category = "TrainingBuilding", editor = "bool"},
		{template = true, id = "gain_point",       name = T{824, "Min points per Sol"},       default = 20,   category = "TrainingBuilding", editor = "number"},
		{template = true, id = "evaluation_points",name = T{825, "Points to evaluate"},   default = -1, category = "TrainingBuilding", editor = "number", modifiable = true},

	},
	visitors = false,  -- visitors arrays in shifts
	closed_visitor_slots = false,-- per shift
	current_accident_chance = false,
	
	-- declarations only to use the same logic as workplace (Set/UpdateWorkplace)
	overtime = false,
	specialist = "none",

	force_lock_workplace = true,-- does not change workplace/ training center on its own, change it on certаin event
	
	training_type = "graduation",
	life_time_trained = false,
	
	dome_label = "TrainingBuilding",
}

function TrainingBuilding:Init()
	self.visitors = {}
	for i = 1, self.max_shifts do
		self.visitors[i] = {}
	end
	self.closed_visitor_slots = {}
	self.current_accident_chance = 0

	self.life_time_trained = 0
	self.city:AddToLabel("TrainingBuilding", self)
end

function TrainingBuilding:GameInit()
	self:CheckForVisitors()
end

function TrainingBuilding:Done()
	self.city:RemoveFromLabel("TrainingBuilding", self)
	self:KickAllVisitors()
end

function TrainingBuilding:GetUnitsInShifts()
	return self.visitors or empty_table
end

function TrainingBuilding:OnDestroyed()
	self:KickAllVisitors()
	RebuildInfopanel()
end

function TrainingBuilding:SetDome(dome)
	if self.parent_dome then
		self.parent_dome:RemoveFromLabel("TrainingBuilding")
	end
	ShiftsBuilding.SetDome(self, dome)
	if self.parent_dome then
		self.parent_dome:AddToLabel("TrainingBuilding", self)
	end
end

function TrainingBuilding:AddWorker(unit, shift)
	self.visitors[shift] = self.visitors[shift] or {}
	table.insert(self.visitors[shift],unit)	

	self:UpdateConsumption()
end

function TrainingBuilding:RemoveWorker(unit)
	for i=1,#self.visitors do
		table.remove_entry(self.visitors[i], unit)
	end	
	self:StopWorkCycle(unit)
	
	self:UpdateConsumption()
	
	if unit:IsInWorkCommand() then
		unit:InterruptCommand()
	end
end

function TrainingBuilding:OnSetUIWorking(work)
	Building.OnSetUIWorking(self, work) --might wna call super
	if not work then
		self:KickAllVisitors()
		self:InterruptUnitsInHolder()
	else
		self:CheckForVisitors()
	end
end

function TrainingBuilding:OnModifiableValueChanged(prop, old_value, new_valaue)
	if prop == "max_visitors" then
		if self.closed_visitor_slots then
			for i=1, self.max_shifts do
				if self.closed_visitor_slots[i]==old_value then
					self:CloseShift(i)
				end
			end
		end
		self:CheckForVisitors()
		RebuildInfopanel(self)
	end
end

function TrainingBuilding:IsSuitable(colonist)
	return colonist:CanTrain() and self:CanTrain(colonist)
end

function TrainingBuilding:ColonistCanInteract(col)
	if not self:CanTrain(col) then 
		return false, T{8739, "<red>Cannot be trained here</red>"}
	end
	if col.workplace == self then
		return false, T{8740, "Currently training here"}
	end
	if not col:CanReachBuilding(self) then
		return false, T{4308, "<red>Out of reach</red>"}
	end
	if not self:HasOpenTrainSlots() then
		return false, T{4312, "<red>Current work shift is closed</red>"}
	end
	return true, T{8741, "<em><left_click></em>: Set Training"}
end

function TrainingBuilding:ColonistInteract(col)
	if col.workplace == self then return end
	if not self.parent_dome then return end
	local current_shift = CurrentWorkshift --should be the shift @ click moment
	for i = 1, 3 do
		if self:HasFreeTrainSlots(current_shift) then
			break
		end
		current_shift = current_shift + 1
		current_shift = current_shift > 3 and current_shift  % 3 or current_shift
	end
	col.user_forced_workplace = {self, current_shift, GameTime()}
	if self.parent_dome == col.dome then
		col:UpdateWorkplace()
	else
		col:SetForcedDome(self.parent_dome)
	end
	return true
end

function TrainingBuilding:GetWorstVisitor(unit, shift)
	local shift_found
	local worst = unit
	local training_type = self.training_type
	local check_forced = true
	for k = 1,2 do
		for s = shift or 1, shift or #self.visitors do
			for _, visitor in ipairs(self.visitors[s]) do
				local found = true
				if check_forced and visitor:CheckForcedWorkplace() == self then
					found = false
				elseif worst then
					local worker_training = (visitor.training_points or empty_table)[training_type] or 0
					local worst_training = (worst.training_points or empty_table)[training_type] or 0
					if worker_training < worst_training then
						found = true
					end
				end
				if found then
					worst = visitor
					shift_found = s
				end
			end
		end
		if shift_found then
			return worst, shift_found
		end
		check_forced = false
	end
end

function TrainingBuilding:CheckServicedDome()
	return self.parent_dome
end

function TrainingBuilding:FindFreeSlotForced(shift)
	for i = 1, 3 do
		if self:HasFreeTrainSlots(shift) then
			return shift
		end
		shift = shift + 1
		shift = shift > 3 and shift % 3 or shift
	end
	local to_kick
	to_kick, shift = self:GetWorstVisitor()
	if to_kick then
		to_kick.user_forced_workplace = nil
		return shift, to_kick
	end
end

function TrainingBuilding:CloseShift(shift)
	ShiftsBuilding.CloseShift(self, shift)
	self.closed_visitor_slots[shift] = self.max_visitors
	local visitors = self.visitors[shift] or empty_table
	for i=#visitors,1, -1 do
		local worker = visitors[i]
		worker:SetWorkplace(false)
		worker:UpdateWorkplace()
	end
	self.visitors[shift] = {}
end

function TrainingBuilding:OpenShift(shift)
	ShiftsBuilding.OpenShift(self, shift)
	self.closed_visitor_slots[shift] = 0	
	self:CheckForVisitors()	
end

function TrainingBuilding:ClosePositions(shift, idx)
	self.closed_visitor_slots[shift] = Clamp(self.max_visitors - idx + 1, 0,self.max_visitors - self:GetVisitorsCount(shift))
end

function TrainingBuilding:OpenPositions(shift, idx)
	self.closed_visitor_slots[shift] = Clamp(self.max_visitors - idx, 0, self.max_visitors - self:GetVisitorsCount(shift))
end

function TrainingBuilding:GetVisitorsCount(shift)
	return self.visitors and #self.visitors[shift] or 0
end

function TrainingBuilding:FireWorker(worker, shift, idx)
	worker:GetFired()
	RebuildInfopanel(self)
end

function TrainingBuilding:CheckForVisitors()
end

function TrainingBuilding:KickAllVisitors()
	for i = 1, #self.visitors do
		local shift = self.visitors[i] or empty_table
		for j = #shift,1,-1 do
			local worker = shift[j]
			if not worker:IsDying() then
				worker:SetWorkplace(false)
				worker:UpdateWorkplace()
			end
		end
	end
end

function TrainingBuilding:GetFreeTrainSlots(shift)
	shift = shift or self.active_shift or 0
	local max = self.max_visitors
	local occupied = self.visitors or empty_table
	local closed = self.closed_visitor_slots or empty_table
	local sum = 0
	local from, to = shift > 0 and shift or 1, shift > 0 and shift or self.max_shifts
	for i = from, to do
		sum = sum + Max(0, max - #occupied[i] - (closed[i] or 0))
	end
	return sum
end

function TrainingBuilding:HasFreeTrainSlots(shift)
	shift = shift or self.active_shift or 0
	local max = self.max_visitors
	local occupied = self.visitors or empty_table
	local closed = self.closed_visitor_slots or empty_table
	local from, to = shift > 0 and shift or 1, shift > 0 and shift or self.max_shifts
	for i = from, to do
		if max - #occupied[i] - (closed[i] or 0) > 0 then
			return true
		end
	end
end

function TrainingBuilding:HasOpenTrainSlots(shift)
	shift = shift or self.active_shift or 0
	local max = self.max_visitors
	local closed = self.closed_visitor_slots or empty_table
	local from, to = shift > 0 and shift or 1, shift > 0 and shift or self.max_shifts
	for i = from, to do
		if max - (closed[i] or 0) > 0 then
			return true
		end
	end
end

function TrainingBuilding:OnChangeWorkshift(old, new)
	if old then
		for _, visitor in ipairs(self.visitors[old]) do
			visitor:InterruptVisit()	
		end
	end
	RebuildInfopanel(self)
end

function TrainingBuilding:StartWorkCycle(unit)
end

function TrainingBuilding:StopWorkCycle(unit)
end

function TrainingBuilding:BuildingUpdate(time, day, hour)
	local visitors = self.visitors[self.current_shift] or empty_table
	local martianborn_adaptability = self.city:IsTechResearched("MartianbornAdaptability") and TechDef.MartianbornAdaptability.param1
	
	for j= #visitors, 1, -1 do -- 'someone can 'graduate' and leave the list'
		local unit = visitors[j]
		self:GainPoints(unit, time, martianborn_adaptability)
		if self.evaluation_points>0 and (unit.training_points and unit.training_points[self.training_type] or 0)>= self.evaluation_points then	
			self:OnTrainingCompleted(unit)
			self.life_time_trained = self.life_time_trained + 1
			self:UpdateUI()
		end
	end
end

function TrainingBuilding:CheatCompleteTraining()
	for shift, list in ipairs(self.visitors) do
		for _, unit in ipairs(list) do
			unit.training_points = unit.training_points or {}
			unit.training_points[self.training_type] = self.evaluation_points
			self:OnTrainingCompleted(unit)
			self.life_time_trained = self.life_time_trained + 1
			self:UpdateUI()
		end
	end
end

function TrainingBuilding:CanTrain(unit)
	local is_child = unit.traits["Child"]
	if is_child and not self.usable_by_children then
		return false
	end	
	if not is_child and self.children_only then
		return false
	end	
	return true
end

function TrainingBuilding:GainPoints(unit, time, martianborn_adaptability)
	if self.working then
		local gain_point = self.gain_point
		if martianborn_adaptability and unit.traits.Martianborn then
			gain_point = gain_point + MulDivRound(martianborn_adaptability, gain_point, 100)
		end
		gain_point = gain_point + MulDivRound(unit.performance, gain_point, 100)
		unit.training_points = unit.training_points or {}
		unit.training_points[self.training_type] = (unit.training_points[self.training_type] or 0) + MulDivRound(gain_point, time, g_Consts.WorkingHours * const.HourDuration)
	end
end

function TrainingBuilding:OnTrainingCompleted(unit)
end
