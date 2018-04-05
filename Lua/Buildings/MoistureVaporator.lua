DefineClass.MoistureVaporator =
{
	__parents = { "WaterProducer", "ElectricityConsumer", "OutsideBuildingWithShifts" },

	--Number of other MoistureVaporators within the penalty radius
	nearby_vaporators = 0,
	overlap_penalty_modifier = false,
}

local vaporator_search = {
	class = "MoistureVaporator",
	hexradius = const.MoistureVaporatorRange,
	filter = function(vaporator, this)
		return vaporator ~= this and vaporator.working
	end,
}

function MoistureVaporator:GameInit()
	self.overlap_penalty_modifier = Modifier:new{
		id = "VaporatorOverlapPenalty",
		prop = "water_production",
		percent = -const.MoistureVaporatorPenaltyPercent,
	}
end

function MoistureVaporator:OnSetWorking(working)
	WaterProducer.OnSetWorking(self, working)
	local delta = working and 1 or -1
	vaporator_search.area = self
	local vaporators = GetObjects(vaporator_search, self)
	vaporator_search.area = false
	for i=1,#vaporators do
		local overlapped_vaporator = vaporators[i]
		overlapped_vaporator:UpdateNearbyVaporatorsCount(delta)
	end
	self:UpdateNearbyVaporatorsCount(#vaporators - self.nearby_vaporators)
end

function MoistureVaporator:UpdateNearbyVaporatorsCount(delta)
	local old_count = self.nearby_vaporators
	local new_count = self.nearby_vaporators + (delta or 0)
	if new_count > 0 and old_count == 0 then
		self:UpdateModifier("add", self.overlap_penalty_modifier, 0, -const.MoistureVaporatorPenaltyPercent)
	elseif new_count == 0 and old_count > 0 then
		self:UpdateModifier("remove", self.overlap_penalty_modifier, 0, const.MoistureVaporatorPenaltyPercent)
	end
	self.nearby_vaporators = new_count
end

function MoistureVaporator:GetSelectionRadiusScale()
	return const.MoistureVaporatorRange
end

function OnMsg.GatherFXActors(list)
	list[#list + 1] = "MoistureVaporator"
end

function OnMsg.GatherFXTargets(list)
	list[#list + 1] = "MoistureVaporator"
end
