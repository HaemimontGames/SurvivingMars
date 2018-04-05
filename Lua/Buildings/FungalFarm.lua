DefineClass.FungalFarm = {
	__parents = { "ResourceProducer", "ElectricityConsumer", "LifeSupportConsumer" ,"Workplace"},
	
	resource_produced1 = "Food",
	stockpile_spots1 = {"Resourcepile"},
}

function FungalFarm.OnCalcProduction_Food(producer, amount_to_produce)
	return MulDivRound(producer.parent.performance, amount_to_produce, 100)
end

function FungalFarm.Produce_Food(producer, amount_produced)
	amount_produced = SingleResourceProducer.Produce(producer, amount_produced)
	if producer.resource_produced == "Food" then
		local farm = producer.parent
		Msg("FoodProduced", farm, amount_produced)
	end
	return amount_produced
end
