DefineClass.SecurityStation =
{
	__parents = { "ElectricityConsumer", "Workplace" },
	properties = {
		{ id = "negated_renegades", default = 5, name = T(726, "Neutralized Renegades"), modifiable = true, editor = "number"},
	},
}

function SecurityStation:GetNegatedRenegades()
	if not self.working then
		return 0
	end	
	return MulDivRound(self.performance, self.negated_renegades, 100)
end

function SecurityStation:GetAdjustedRenegades()
	return self.parent_dome and self.parent_dome:GetAdjustedRenegades() or self:GetNegatedRenegades()
end

function SecurityStation:GetRenegadesCount()
	return #(self.parent_dome.labels.Renegade or empty_table)
end

function SecurityStation:GetNotAdjustedRenegades()
	return T{727, "Renegades in the Dome <right><number>",number = #(self.parent_dome.labels.Renegade or empty_table)}
end