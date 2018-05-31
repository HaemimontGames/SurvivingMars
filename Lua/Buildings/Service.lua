local stat_scale = const.Scale.Stat
DefineClass.StatsChange = {
	__parents = { "Building"},
	properties = {
		{ category = "Service", template = true, modifiable = true, id = "health_change", name = T{728, "Health change on visit"}, default = 0, scale = "Stat", editor = "number" },
		{ category = "Service", template = true, modifiable = true, id = "sanity_change", name = T{729, "Sanity change on visit"}, default = 0, scale = "Stat", editor = "number" },
		{ category = "Service", template = true, modifiable = true, id = "service_comfort", name = T{730, "Service Comfort"}, default = 40*stat_scale, editor = "number", scale = "Stat" },
		{ category = "Service", template = true, modifiable = true, id = "comfort_increase", name = T{731, "Comfort increase on visit"}, default = 10*stat_scale, editor = "number", scale = "Stat"},
	},
}

g_DiffDomeStrId = "_diff_dome"

function StatsChange:Service(unit, duration, reason,comfort_threshold)
	-- comfort on visit
	local comfort_threshold = comfort_threshold or self:GetEffectiveServiceComfort()
	local is_diff_dome = self.parent_dome and unit.dome ~= self.parent_dome
	comfort_threshold = comfort_threshold - (not is_diff_dome and 0 or g_Consts.NonHomeDomeServiceThresholdDecrement)
	reason = reason or self.template_name
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
	self:ConsumeOnVisit(unit)
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
		{  category = "Service", template = true, id = "interest1",   name = T{732, "Service interest"}, default = "",  editor = "combo", items = function() return ServiceInterestsList end},
		{  category = "Service", template = true, id = "interest2",   name = T{732, "Service interest"}, default = "",  editor = "combo", items = function() return ServiceInterestsList end},
		{  category = "Service", template = true, id = "interest3",   name = T{732, "Service interest"}, default = "",  editor = "combo", items = function() return ServiceInterestsList end},
		{  category = "Service", template = true, id = "interest4",   name = T{732, "Service interest"}, default = "",  editor = "combo", items = function() return ServiceInterestsList end},
		{  category = "Service", template = true, id = "max_visitors",    name = T{733, "Visitor slots per shift"}, default = 5,  editor = "number", min = 1, modifiable = true}, 	
		{  category = "Service", template = true, id = "visit_duration",  name = T{734, "Visit duration"},        	 default = 5,  editor = "number", min = 1, max = 10,  slider = true, modifiable = true}, 	
		{  category = "Service", template = true, id = "usable_by_children",name = T{735, "Usable by children"},      default = false, editor = "bool"},
		{  category = "Service", template = true, id = "children_only",   name = T{736, "Children Only"},           default = false, editor = "bool"},

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
	if interest1 ~= "" then
		label(obj, interest1, self)
	end
	if interest2 ~= "" and interest2 ~= interest1 then
		label(obj, interest2, self)
	end
	if interest3 ~= "" and interest3 ~= interest1 and interest3 ~= interest2 then
		label(obj, interest3, self)
	end
	if interest4 ~= "" and interest4 ~= interest1 and interest4 ~= interest2 and interest4 ~= interest3 then
		label(obj, interest4, self)
	end
end

function Service:IsOneOfInterests(interest)
	return 
		self.interest1 == interest 
		or self.interest2 == interest 
		or self.interest3 == interest 
		or self.interest4 == interest 
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
end

function Service:Unassign(unit)
	table.remove_entry(self.visitors, unit)
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
	StatsChange.Service(self, unit, duration,reason,comfort_threshold)
end

DefineClass.ServiceWorkplace = {
	__parents = { "Service", "Workplace"},
}

function ServiceWorkplace:OnChangeWorkshift(old, new)
	Workplace.OnChangeWorkshift(self, old, new)
	for _, visitor in ipairs(self.visitors)do
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

DefineClass.LifeSupportConsumerService = {
	__parents = { "LifeSupportConsumer", "Service" },
}
