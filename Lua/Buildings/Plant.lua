DefineClass.BasePlant = {
	__parents = { "OutsideBuildingWithShifts", "ResourceProducer", "ElectricityConsumer" },
	additional_stockpile_params2 = {
		apply_to_grids = false,
		has_platform = true,
		snap_to_grid = false,
		priority = 2,
		additional_supply_flags = const.rfSpecialDemandPairing
	},
}

DefineClass.WasteRockProcessor = {
	__parents = { "BasePlant" },
	exploitation_resource = "Concrete",
	crusher = false,
}

function WasteRockProcessor:GameInit()
	self.crusher = self:GetAttach("WasteRockProcessorCrusher")
	self.force_fx_work_target = self.crusher
end