DefineClass.MoholeMine = {
	__parents = { "ResourceProducer", "BaseHeater", "Building", "ElectricityConsumer", "OutsideBuildingWithShifts" },
	
	exploitation_resource = "Metals",
	heat = 2*const.MaxHeat,
	
	additional_stockpile_params3 = {
		apply_to_grids = false, 
		has_platform = true,
		snap_to_grid = false,
		priority = 2,
		additional_supply_flags = const.rfSpecialDemandPairing
	},
}

function MoholeMine:GetHeatRange()
	return const.MoholeMineHeatRadius * 10 * guim
end

function MoholeMine:GetHeatBorder()
	return const.SubsurfaceHeaterFrameRange
end

function MoholeMine:GetSelectionRadiusScale()
	return const.MoholeMineHeatRadius
end

function MoholeMine:GetDepositGrade()
	return "Average"
end

function OnMsg.GatherFXActors(list)
	list[#list + 1] = "MoholeMine"
end

function OnMsg.GatherFXTargets(list)
	list[#list + 1] = "MoholeMine"
end
