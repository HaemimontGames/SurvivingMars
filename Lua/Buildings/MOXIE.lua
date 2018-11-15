DefineClass.MOXIE =
{
	__parents = { "ElectricityConsumer", "OutsideBuildingWithShifts", "AirProducer" },
	
	track_multiple_hit_moments_in_work_state = true,
}

function MOXIE:GetEntityNameForPipeConnections(grid_skin_name)
	return grid_skin_name ~= "Default" and "Moxie" .. grid_skin_name or "Moxie"
end