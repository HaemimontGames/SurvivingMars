GlobalVar("g_ExtractorAIResearched", false)
GlobalVar("g_EternalFusionResearched", false)

function OnMsg.TechResearched(tech_id, city)
	if tech_id == "ExtractorAI" then
		g_ExtractorAIResearched = true
	elseif tech_id == "EternalFusion" then
		g_EternalFusionResearched = true
	end
end


DefineClass.BaseMetalsExtractor = {
	__parents = {"Mine", "Workplace", "DustGenerator", "SubsurfaceDepositConstructionRevealer"},
	subsurface_deposit_class = "SubsurfaceDepositMetals",
	exploitation_resource = "Metals",
	building_update_time = const.HourDuration/4,
	
	additional_stockpile_params2 = {
		apply_to_grids = false,
		has_platform = true,
		snap_to_grid = false,
		priority = 2,
		additional_supply_flags = const.rfSpecialDemandPairing
	},
}

function BaseMetalsExtractor:GatherConstructionStatuses(statuses)
	Mine.GatherConstructionStatuses(self, statuses)
	if g_ExtractorAIResearched then
		--skip workplace nearby workers check
		Building.GatherConstructionStatuses(self, statuses)
	else
		Workplace.GatherConstructionStatuses(self, statuses)
	end
end

function BaseMetalsExtractor.OnCalcProduction_Metals(producer, amount_to_produce)
	if amount_to_produce > 0 then
		local deposit_multipler = producer.parent:GetCurrentDepositQualityMultiplier()
		amount_to_produce = MulDivRound(amount_to_produce, deposit_multipler, 100)
		if producer.parent:HasMember("performance") then
			amount_to_produce = MulDivRound(amount_to_produce, producer.parent.performance, 100)
		end
		return amount_to_produce
	end
	
	return 0
end

function BaseMetalsExtractor.OnProduce_Metals(producer, amount_to_produce)
	amount_to_produce = producer.parent:ExtractResource(amount_to_produce)
	return amount_to_produce
end

function BaseMetalsExtractor.GetPredictedProduction_Metals(producer)
	return producer.parent:GetHourPredictedProduction()
end

function BaseMetalsExtractor.GetPredictedDailyProduction_Metals(producer)
	local deposit_multiplier = producer.parent:GetCurrentDepositQualityMultiplier()
	return MulDivRound(SingleResourceProducer.GetPredictedDailyProduction(producer), deposit_multiplier, 100)
end

BaseMetalsExtractor.OnCalcProduction_PreciousMetals = BaseMetalsExtractor.OnCalcProduction_Metals
BaseMetalsExtractor.OnProduce_PreciousMetals = BaseMetalsExtractor.OnProduce_Metals
BaseMetalsExtractor.GetPredictedProduction_PreciousMetals = BaseMetalsExtractor.GetPredictedProduction_Metals
BaseMetalsExtractor.GetPredictedDailyProduction_PreciousMetals = BaseMetalsExtractor.GetPredictedDailyProduction_Metals

DefineClass("MetalsExtractor", 
	{
		__parents = {"BaseMetalsExtractor"},
	}
)

DefineClass.PreciousMetalsExtractor =
{
	__parents = {"BaseMetalsExtractor"},
	track_multiple_hit_moments_in_work_state = {"hit-moment1", "hit-moment2", "hit-moment3"},
	
	subsurface_deposit_class = "SubsurfaceDepositPreciousMetals",
	exploitation_resource = "PreciousMetals",
}