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
