DefineClass.Factory = {
	__parents = { "ResourceProducer", "ElectricityConsumer", "Workplace",},
}

DefineClass.ElectronicsFactory = {
	__parents = { "Factory" },
	resource_produced1 = "Electronics",
}

function ElectronicsFactory.OnCalcProduction_Electronics(producer, amount_to_produce)
	return MulDivRound(producer.parent.performance, amount_to_produce, 100)
end

DefineClass.MachinePartsFactory = {
	__parents = { "Factory" },
	resource_produced1 = "MachineParts",
}

function MachinePartsFactory.OnCalcProduction_MachineParts(producer, amount_to_produce)
	return MulDivRound(producer.parent.performance, amount_to_produce, 100)
end

DefineClass.PolymerPlant = {
	__parents = { "Factory", "LifeSupportConsumer"},

	properties = {
		{ template = true, category = "Consumption",   name = T{681, "Water"},                   id = "water_consumption",       editor = "number", default = 5000,   scale = const.ResourceScale, read_only = false, modifiable = true, },
		{ template = true, category = "Consumption",   name = T{682, "Oxygen"},                     id = "air_consumption",         editor = "number", default = 0,      scale = const.ResourceScale, read_only = true , modifiable = true},
		{ template = true, category = "Consumption",   name = T{683, "Power Consumption"}, id = "electricity_consumption", editor = "number", default = 1000,   modifiable = true },
	},
	
	resource_produced1 = "Polymers",
	stockpile_spots1 = { "Resourcepile" },
}

function PolymerPlant.OnCalcProduction_Polymers(producer, amount_to_produce)
	return MulDivRound(producer.parent.performance, amount_to_produce, 100)
end
