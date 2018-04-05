DefineClass.FusionReactor = {
	__parents = { "ElectricityProducer", "Workplace"},
}

function FusionReactor:GatherConstructionStatuses(statuses)
	if g_EternalFusionResearched then
		--skip workplace nearby workers check
		Building.GatherConstructionStatuses(self, statuses)
	else
		Workplace.GatherConstructionStatuses(self, statuses)
	end
end