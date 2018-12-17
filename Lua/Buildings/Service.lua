local stat_scale = const.Scale.Stat
DefineClass.StatsChange = {
	__parents = { "Building"},
	properties = {
		{ category = "Service", template = true, modifiable = true, id = "health_change", name = T(728, "Health change on visit"), default = 0, scale = "Stat", editor = "number" },
		{ category = "Service", template = true, modifiable = true, id = "sanity_change", name = T(729, "Sanity change on visit"), default = 0, scale = "Stat", editor = "number" },
		{ category = "Service", template = true, modifiable = true, id = "service_comfort", name = T(730, "Service Comfort"), default = 40*stat_scale, editor = "number", scale = "Stat" },
		{ category = "Service", template = true, modifiable = true, id = "comfort_increase", name = T(731, "Comfort increase on visit"), default = 10*stat_scale, editor = "number", scale = "Stat"},
	},
}

g_DiffDomeStrId = "_diff_dome"

function StatsChange:Service(unit, duration, reason,comfort_threshold, interest)
	-- comfort on visit
	local comfort_threshold = comfort_threshold or self:GetEffectiveServiceComfort()
	local is_diff_dome = self.parent_dome and unit.dome ~= self.parent_dome
	comfort_threshold = comfort_threshold - (not is_diff_dome and 0 or g_Consts.NonHomeDomeServiceThresholdDecrement)
	reason = reason or self.template_name
	interest = interest or false
	if is_diff_dome then
		reason = string.format("%s%s", reason, g_DiffDomeStrId)
	end
	
	if unit.stat_comfort < comfort_threshold then
		local comfort_increase = self.comfort_increase
		if unit.traits.Hippie and (self:GetBuildMenuCategory() == "Decorations" or self.template_name == "HangingGardens") then
			comfort_increase = 2 * comfort_increase
		end
		
		unit:ChangeComfort(comfort_increase, reason)
	end
	
	local performance = self:GetEffectivePerformance()
	unit:ChangeHealth(self.health_change * performance / 100, reason)
	unit:ChangeSanity(self.sanity_change * performance / 100, reason)
	self:ConsumeOnVisit(unit, interest)
	if duration then
 		unit:PlayPrg(GetVisitPrg(self), duration, self)
	end
end

function StatsChange:GetEffectiveServiceComfort()
	return self.service_comfort
end

function StatsChange:GetEffectivePerformance()
	return 100
end

local typeVisit = g_ConsumptionType.Visit
function StatsChange:ConsumeOnVisit(unit)
	if self:DoesHaveConsumption() and self.consumption_type == typeVisit then
		self:Consume_Visit(unit)
	end
end

DefineClass.Service = {
	__parents = { "StatsChange", "Holder" },
	
	properties = {
		{  category = "Service", template = true, id = "interest1",   name = T(732, "Service interest"), default = "",  editor = "combo", items = function() return ServiceInterestsList end},
		{  category = "Service", template = true, id = "interest2",   name = T(732, "Service interest"), default = "",  editor = "combo", items = function() return ServiceInterestsList end},
		{  category = "Service", template = true, id = "interest3",   name = T(732, "Service interest"), default = "",  editor = "combo", items = function() return ServiceInterestsList end},
		{  category = "Service", template = true, id = "interest4",   name = T(732, "Service interest"), default = "",  editor = "combo", items = function() return ServiceInterestsList end},
		{  category = "Service", template = true, id = "interest5",   name = T(732, "Service interest"), default = "",  editor = "combo", items = function() return ServiceInterestsList end},
		{  category = "Service", template = true, id = "interest6",   name = T(732, "Service interest"), default = "",  editor = "combo", items = function() return ServiceInterestsList end},
		{  category = "Service", template = true, id = "interest7",   name = T(732, "Service interest"), default = "",  editor = "combo", items = function() return ServiceInterestsList end},
		{  category = "Service", template = true, id = "interest8",   name = T(732, "Service interest"), default = "",  editor = "combo", items = function() return ServiceInterestsList end},
		{  category = "Service", template = true, id = "interest9",   name = T(732, "Service interest"), default = "",  editor = "combo", items = function() return ServiceInterestsList end},
		{  category = "Service", template = true, id = "interest10",   name = T(732, "Service interest"), default = "",  editor = "combo", items = function() return ServiceInterestsList end},
		{  category = "Service", template = true, id = "interest11",   name = T(732, "Service interest"), default = "",  editor = "combo", items = function() return ServiceInterestsList end},
		{  category = "Service", template = true, id = "max_visitors",    name = T(733, "Visitor slots per shift"), default = 5,  editor = "number", min = 1, modifiable = true}, 	
		{  category = "Service", template = true, id = "visit_duration",  name = T(734, "Visit duration"),        	 default = 5,  editor = "number", min = 1, max = 10,  slider = true, modifiable = true}, 	
		{  category = "Service", template = true, id = "usable_by_children",name = T(735, "Usable by children"),      default = false, editor = "bool"},
		{  category = "Service", template = true, id = "children_only",   name = T(736, "Children Only"),           default = false, editor = "bool"},

	},
	visitors = false,  -- colonists arrays in this service building
	visitors_per_day = false, 
	visitors_lifetime = false,
}

function Service:Init()
	self.visitors = {}	
	self.visitors_per_day = 0
	self.visitors_lifetime = 0
end

function Service:Done()
	self:OnDestroyed()
end

function Service:OnDestroyed()
	local visitors = self.visitors
	if #visitors == 0 then
		return
	end
	for i = #visitors, 1, -1 do
		local visitor = visitors[i]
		if IsValid(visitor) then
			self:Unassign(visitor)
		end
	end
	self.visitors = {}
end

function Service:GetIPDescription()
	return 
		T{737, "<description>\nServices: <em><list></em>", 
			description = self.description, 
			list = self:IsKindOf("Service") and self:GetServiceList() or Service.GetServiceList(self)}
end

function Service:GetServiceList()
	local interests = {}
	interests[#interests + 1] = GetInterestDisplayName(self.interest1)
	interests[#interests + 1] = GetInterestDisplayName(self.interest2)
	interests[#interests + 1] = GetInterestDisplayName(self.interest3)
	interests[#interests + 1] = GetInterestDisplayName(self.interest4)
	interests[#interests + 1] = GetInterestDisplayName(self.interest5)
	interests[#interests + 1] = GetInterestDisplayName(self.interest6)
	interests[#interests + 1] = GetInterestDisplayName(self.interest7)
	interests[#interests + 1] = GetInterestDisplayName(self.interest8)
	interests[#interests + 1] = GetInterestDisplayName(self.interest9)
	interests[#interests + 1] = GetInterestDisplayName(self.interest10)
	interests[#interests + 1] = GetInterestDisplayName(self.interest11)
	return TList(interests)
end

function Service:SetCustomLabels(obj, add)
	Building.SetCustomLabels(self, obj, add)
	local label = add and obj.AddToLabel or obj.RemoveFromLabel
	label(obj, "Service", self)
	local interest1 = self.interest1
	local interest2 = self.interest2
	local interest3 = self.interest3
	local interest4 = self.interest4
	local interest5 = self.interest5
	local interest6 = self.interest6
	local interest7 = self.interest7
	local interest8 = self.interest8
	local interest9 = self.interest9
	local interest10 = self.interest10
	local interest11 = self.interest11
	local service_interests = {}
	if interest1 ~= "" then
		service_interests[#service_interests + 1] = interest1
		label(obj, interest1, self)
	end
	if interest2 ~= "" and not table.find(service_interests, interest2) then
		service_interests[#service_interests + 1] = interest2
		label(obj, interest2, self)
	end
	if interest3 ~= "" and not table.find(service_interests, interest3) then
		service_interests[#service_interests + 1] = interest3
		label(obj, interest3, self)
	end
	if interest4 ~= "" and not table.find(service_interests, interest4) then
		service_interests[#service_interests + 1] = interest4
		label(obj, interest4, self)
	end
	if interest5 ~= "" and not table.find(service_interests, interest5) then
		service_interests[#service_interests + 1] = interest5
		label(obj, interest5, self)
	end
	if interest6 ~= "" and not table.find(service_interests, interest6) then
		service_interests[#service_interests + 1] = interest6
		label(obj, interest6, self)
	end
	if interest7 ~= "" and not table.find(service_interests, interest7) then
		service_interests[#service_interests + 1] = interest7
		label(obj, interest7, self)
	end
	if interest8 ~= "" and not table.find(service_interests, interest8) then
		service_interests[#service_interests + 1] = interest8
		label(obj, interest8, self)
	end
	if interest9 ~= "" and not table.find(service_interests, interest9) then
		service_interests[#service_interests + 1] = interest9
		label(obj, interest9, self)
	end
	if interest10 ~= "" and not table.find(service_interests, interest10) then
		service_interests[#service_interests + 1] = interest10
		label(obj, interest10, self)
	end
	if interest11 ~= "" and not table.find(service_interests, interest11) then
		label(obj, interest11, self)
	end
end

function Service:IsOneOfInterests(interest)
	return 
		self.interest1 == interest 
		or self.interest2 == interest
		or self.interest3 == interest
		or self.interest4 == interest
		or self.interest5 == interest
		or self.interest6 == interest
		or self.interest7 == interest
		or self.interest8 == interest
		or self.interest9 == interest
		or self.interest10 == interest
		or self.interest11 == interest
end

function Service:BuildingDailyUpdate(...)
	self.visitors_per_day = 0
end

function Service:HasFreeVisitSlots()
	return #self.visitors < self.max_visitors
end

function Service:CanService(unit)
	local is_child = unit.traits["Child"]
	if is_child and not self.usable_by_children or not is_child and self.children_only then
		return false
	end
	if self:DoesHaveConsumption() and self.consumption_type == g_ConsumptionType.Visit and self.consumption_stored_resources <= 0 then
		return false
	end
	return true
end

function Service:Assign(unit)
	assert(self:HasFreeVisitSlots())
	table.insert(self.visitors, unit)
	self:UpdateServiceOccupation()
end

function Service:Unassign(unit)
	table.remove_entry(self.visitors, unit)
	self:UpdateServiceOccupation()
end

function Service:UpdateServiceOccupation()
	self:UpdateOccupation(#self.visitors, self.max_visitors)
end

function Service:Service(unit, duration, daily_interest)
	self.visitors_per_day = self.visitors_per_day + 1
	self.visitors_lifetime = self.visitors_lifetime + 1
	duration = duration or self.visit_duration * const.HourDuration
	local comfort_threshold = self:GetEffectiveServiceComfort()
	local reason
	if unit.traits.Extrovert and self:IsOneOfInterests("interestSocial") and unit.dome and #unit.dome.labels.Colonist>30 then -- party animal		
		comfort_threshold = comfort_threshold + g_Consts.ExtrovertIncreaseComfortThreshold
		reason = "party animal"
	end
	StatsChange.Service(self, unit, duration, reason, comfort_threshold, daily_interest)
end

DefineClass.ServiceWorkplace = {
	__parents = { "Service", "Workplace"},
}

function ServiceWorkplace:OnChangeWorkshift(old, new)
	Workplace.OnChangeWorkshift(self, old, new)
	local visitors = table.icopy(self.visitors)
	for _, visitor in ipairs(visitors) do
		visitor:AssignToService(false) -- unassign from building when interupted
		visitor:InterruptCommand()
	end
	self.visitors = {}
	self.free_visitor_slots = self.max_visitors	
end

function ServiceWorkplace:GetEffectiveServiceComfort()
	-- performace effect on service quality
	local effect = g_Consts.PerformanceEffectOnServiceComfort
	return self.service_comfort + effect * (self:GetEffectivePerformance() - 100) / 100
end

function ServiceWorkplace:GetEffectivePerformance()
	-- if a workshift is stopped or the building is stopped ,services show a parameter for Service Quality at 100 performance
	if not self.ui_working or (self.active_shift == 0 and self:IsClosedShift(self.current_shift) and self:HasAnyWorkers() and self.automation <= 0) then
		return 100
	end
	-- performance for working building
	return self.performance
end

function ServiceWorkplace:UpdateServiceOccupation()
	self:UpdateOccupation(#self.visitors + #self.workers[CurrentWorkshift], self.max_visitors + self.max_workers)
end

function ServiceWorkplace:AddWorker(worker, shift)
	Workplace.AddWorker(self, worker, shift)
	self:UpdateServiceOccupation()
end

function ServiceWorkplace:RemoveWorker(worker)
	Workplace.RemoveWorker(self, worker, shift)
	self:UpdateServiceOccupation()
end

DefineClass.LifeSupportConsumerService = {
	__parents = { "LifeSupportConsumer", "Service" },
}
