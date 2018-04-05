DefineClass.NetworkNode =
{
	__parents = { "SpireBase", "ElectricityConsumer", "Workplace" },
	
	properties = {
		{ template = true, category = "Spire", name = T{679, "Performance boost"}, id = "performance_boost", editor = "number", default = 20, help = "Performance boost (int percent) to all research buildings in the same dome (for 100% performance of this building)" }
	},
	
	modifier = false,
}

function NetworkNode:GameInit()
	local boost = MulDivRound(self.performance_boost, self.performance, 100)
	self.modifier = LabelModifier:new{
		container = self.parent_dome,
		label = "BaseResearchLab",
		id =  "NetworkNode",
		prop = "performance",
		amount = 0,
		percent = boost,
		display_text = T{7625, "<green>Network node <amount>%</color>", amount = boost},
	}
	self.parent_dome:SetLabelModifier("BaseResearchLab", "NetworkNode", self.modifier)
end

function NetworkNode:OnModifiableValueChanged(prop, old_value, new_valaue)
	if prop == "performance" and self.modifier then
		local boost = MulDivRound(self.performance_boost, new_valaue, 100)
		self.modifier:Change(0,boost)
		self.modifier.display_text = T{7625, "<green>Network node <amount>%</color>", amount = boost}
	end
end
