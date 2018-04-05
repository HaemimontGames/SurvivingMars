-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

DefineConst{
	group = "Scale",
	id = "Resources",
	value = 1000,
}
DefineConst{
	group = "Scale",
	id = "Stat",
	value = 1000,
}
DefineConst{
	group = "Scale",
	id = "hours",
	scale = "sec",
	value = 30000,
}
DefineConst{
	group = "Scale",
	id = "degrees",
	value = 60,
}
DefineConst{
	group = "Scale",
	id = "sols",
	scale = "hours",
	value = 720000,
}
DefineConst{
	group = "Scale",
	id = "mil",
	value = 1000000,
}
DefineConst{
	group = "Scale",
	id = "meters",
	value = 100,
}
DefineConst{
	group = "Traits",
	help = T{290290906449, --[[ConstDef Traits MaxColonistTraitsToGenerate help]] "Max base traits generated per Colonist"},
	id = "MaxColonistTraitsToGenerate",
	name = T{455324213448, --[[ConstDef Traits MaxColonistTraitsToGenerate name]] "MaxColonistTraitsToGenerate"},
	value = 3,
}
DefineConst{
	group = "Traits",
	help = T{715051458672, --[[ConstDef Traits ExtrovertIncreaseComfortThreshold help]] "Increases Comfort Threshold for Social Buildings when used by extroverts"},
	id = "ExtrovertIncreaseComfortThreshold",
	name = T{982066645807, --[[ConstDef Traits ExtrovertIncreaseComfortThreshold name]] "ExtrovertIncreaseComfortThreshold"},
	scale = "Stat",
	value = 20000,
}
DefineConst{
	group = "Stat",
	help = T{4548, --[[ConstDef Stat LowStatLevel help]] "Stats below this level are considered low"},
	id = "LowStatLevel",
	name = T{4549, --[[ConstDef Stat LowStatLevel name]] "Low Stat Threshold"},
	scale = "Stat",
	value = 30000,
}
DefineConst{
	group = "Stat",
	help = T{4550, --[[ConstDef Stat HighStatLevel help]] "Stats above this level are considered high"},
	id = "HighStatLevel",
	name = T{4551, --[[ConstDef Stat HighStatLevel name]] "High Stat Threshold"},
	scale = "Stat",
	value = 70000,
}
DefineConst{
	group = "Stat",
	help = T{4552, --[[ConstDef Stat LowStatMoraleEffect help]] "Low Health, Sanity and Comfort decreases a Colonist's morale by this amount"},
	id = "LowStatMoraleEffect",
	name = T{4553, --[[ConstDef Stat LowStatMoraleEffect name]] "Low Stat Morale Effect"},
	scale = "Stat",
	value = 10000,
}
DefineConst{
	group = "Stat",
	help = T{4554, --[[ConstDef Stat MoraleInitRange help]] "Morale of new Colonists starts randomly in this range, centered around half of maximum Morale"},
	id = "MoraleInitRange",
	name = T{4555, --[[ConstDef Stat MoraleInitRange name]] "Initial Morale Range"},
	scale = "Stat",
	value = 20000,
}
DefineConst{
	group = "Stat",
	help = T{4556, --[[ConstDef Stat HighStatMoraleEffect help]] "High Health, Sanity and Comfort increase the Colonist's morale by this much"},
	id = "HighStatMoraleEffect",
	name = T{4557, --[[ConstDef Stat HighStatMoraleEffect name]] "High Stat Morale Effect"},
	scale = "Stat",
	value = 5000,
}
DefineConst{
	group = "Stat",
	help = T{4558, --[[ConstDef Stat NoHomeComfort help]] "Colonist Comfort decreases when homeless"},
	id = "NoHomeComfort",
	name = T{4559, --[[ConstDef Stat NoHomeComfort name]] "Homeless Comfort Penalty"},
	scale = "Stat",
	value = 20000,
}
DefineConst{
	group = "Stat",
	help = T{8660, --[[ConstDef Stat MalfunctionedDome help]] "Colonist Sanity decreased when rest in malfunctioned Dome"},
	id = "MalfunctionedDome",
	name = T{8661, --[[ConstDef Stat MalfunctionedDome name]] "Malfunctioned Dome Sanity Penalty"},
	scale = "Stat",
	value = 5000,
}
DefineConst{
	group = "Stat",
	help = T{4560, --[[ConstDef Stat SeeDeadSanity help]] "Colonist Sanity decreases when a Colonist from the same Residence dies from non-natural causes"},
	id = "SeeDeadSanity",
	name = T{4561, --[[ConstDef Stat SeeDeadSanity name]] "Seeing Death"},
	scale = "Stat",
	value = 15000,
}
DefineConst{
	group = "Stat",
	help = T{4564, --[[ConstDef Stat OxygenMaxOutsideTime help]] "This is the time it takes for Colonists outside of Domes to start losing health"},
	id = "OxygenMaxOutsideTime",
	name = T{4565, --[[ConstDef Stat OxygenMaxOutsideTime name]] "Oxygen max outside time"},
	scale = "hours",
	value = 120000,
}
DefineConst{
	group = "Stat",
	help = T{4566, --[[ConstDef Stat WorkDarkHoursSanityDecrease help]] "When working during dark hours Colonists will lose this much Sanity (per work shift)"},
	id = "WorkDarkHoursSanityDecrease",
	name = T{4567, --[[ConstDef Stat WorkDarkHoursSanityDecrease name]] "Dark hours work Sanity decrease"},
	scale = "Stat",
	value = 10000,
}
DefineConst{
	group = "Stat",
	help = T{4568, --[[ConstDef Stat WorkOvertimeSanityDecrease help]] "Decreased Sanity from heavy workloads"},
	id = "WorkOvertimeSanityDecrease",
	name = T{4569, --[[ConstDef Stat WorkOvertimeSanityDecrease name]] "Heavy Workload Sanity Penalty"},
	scale = "Stat",
	value = 10000,
}
DefineConst{
	group = "Stat",
	help = T{4570, --[[ConstDef Stat WorkOvertimeHealth help]] "Decreased Health from heavy workloads"},
	id = "WorkOvertimeHealth",
	name = T{4571, --[[ConstDef Stat WorkOvertimeHealth name]] "Heavy Workload Health Penalty"},
	scale = "Stat",
	value = 10000,
}
DefineConst{
	group = "Stat",
	id = "OutsideWorkplaceSanityDecrease",
	name = T{4572, --[[ConstDef Stat OutsideWorkplaceSanityDecrease name]] "Outside Workplace Sanity Penalty"},
	scale = "Stat",
	value = 10000,
}
DefineConst{
	group = "Stat",
	help = T{7424, --[[ConstDef Stat MinComfortBirth help]] "Minimum Colonist Comfort for Birth"},
	id = "MinComfortBirth",
	name = T{7425, --[[ConstDef Stat MinComfortBirth name]] "Minimum Colonist Comfort for Birth"},
	scale = "Stat",
	value = 70000,
}
DefineConst{
	group = "Stat",
	help = T{7426, --[[ConstDef Stat MedicalBuildingMinComfortBirthDecrease help]] "Decreases minimum Colonist Comfort for giving birth in a Dome Medical Building"},
	id = "MedicalBuildingMinComfortBirthDecrease",
	name = T{4573, --[[ConstDef Stat MedicalBuildingMinComfortBirthDecrease name]] "Penalty to Colonist Comfort for Birth from Medical Buildings"},
	scale = "Stat",
	value = 15000,
}
DefineConst{
	group = "Stat",
	id = "RenegadeCreation",
	name = T{4574, --[[ConstDef Stat RenegadeCreation name]] "Renegade creation point"},
	scale = "Stat",
	value = 70000,
}
DefineConst{
	group = "Stat",
	help = T{4575, --[[ConstDef Stat LowSanitySuicideChance help]] "Chance of suicide when Sanity reaches zero, in %"},
	id = "LowSanitySuicideChance",
	name = T{4576, --[[ConstDef Stat LowSanitySuicideChance name]] "Chance of Suicide"},
	value = 1,
}
DefineConst{
	group = "Stat",
	help = T{4577, --[[ConstDef Stat LowSanityNegativeTraitChance help]] "Chance of getting a negative trait when Sanity reaches zero, in %"},
	id = "LowSanityNegativeTraitChance",
	name = T{4578, --[[ConstDef Stat LowSanityNegativeTraitChance name]] "Chance for getting a flaw when experiencing a Sanity breakdown"},
	value = 30,
}
DefineConst{
	group = "Stat",
	id = "DustStormSanityDamage",
	name = T{438538796803, --[[ConstDef Stat DustStormSanityDamage name]] "Sanity damage from Dust Storms (per hour)"},
	scale = "Stat",
	value = 300,
}
DefineConst{
	group = "Stat",
	id = "MysteryDreamSanityDamage",
	name = T{6975, --[[ConstDef Stat MysteryDreamSanityDamage name]] "Sanity damage for Dreamers from Mirages (per hour)"},
	scale = "Stat",
	value = 500,
}
DefineConst{
	group = "Stat",
	id = "ColdWaveSanityDamage",
	name = T{438538796804, --[[ConstDef Stat ColdWaveSanityDamage name]] "Sanity damage from a Cold Wave (per hour)"},
	scale = "Stat",
	value = 300,
}
DefineConst{
	group = "Stat",
	id = "MeteorSanityDamage",
	name = T{4579, --[[ConstDef Stat MeteorSanityDamage name]] "Sanity damage from meteor (one-time on impact)"},
	scale = "Stat",
	value = 12000,
}
DefineConst{
	group = "Stat",
	id = "MeteorHealthDamage",
	name = T{7563, --[[ConstDef Stat MeteorHealthDamage name]] "Health damage from small meteor (one-time on impact)"},
	scale = "Stat",
	value = 50000,
}
DefineConst{
	group = "Stat",
	id = "OutsideFoodConsumptionComfort",
	name = T{4580, --[[ConstDef Stat OutsideFoodConsumptionComfort name]] "Comfort damage from eating raw food from piles"},
	scale = "Stat",
	value = 3000,
}
DefineConst{
	group = "Stat",
	help = T{"???"},
	id = "NonHomeDomeServiceThresholdDecrement",
	name = T{"???"},
	scale = "Stat",
	value = 10000,
}
DefineConst{
	group = "Stat",
	id = "PerformanceEffectOnServiceComfort",
	name = T{359628595078, --[[ConstDef Stat PerformanceEffectOnServiceComfort name]] "Max effect of worker performance on Service Quality"},
	scale = "Stat",
	value = 20000,
}
DefineConst{
	group = "Gameplay",
	help = T{4581, --[[ConstDef Gameplay SupplyMissionsEnabled help]] "Determines where supply missions are enabled"},
	id = "SupplyMissionsEnabled",
	name = T{4582, --[[ConstDef Gameplay SupplyMissionsEnabled name]] "Supply Missions Enabled"},
	value = 1,
}
DefineConst{
	group = "Gameplay",
	help = T{8464, --[[ConstDef Gameplay OutsourceDisabled help]] "Determines whether the player can buy research points via outsourcing."},
	id = "OutsourceDisabled",
	name = T{8465, --[[ConstDef Gameplay OutsourceDisabled name]] "Outsource Disabled"},
	value = 0,
}
DefineConst{
	group = "Gameplay",
	help = T{8466, --[[ConstDef Gameplay ApplicantSuspendGenerate help]] "Determines whether the applicant pool gains new entries."},
	id = "ApplicantSuspendGenerate",
	name = T{8467, --[[ConstDef Gameplay ApplicantSuspendGenerate name]] "Applicant Generation Suspended"},
	value = 0,
}
DefineConst{
	group = "Gameplay",
	help = T{752761093718, --[[ConstDef Gameplay CrimeEventSabotageBuildingsCount help]] "CrimeEvent -  the number of sabotaged buildings from single crime event"},
	id = "CrimeEventSabotageBuildingsCount",
	name = T{869176701600, --[[ConstDef Gameplay CrimeEventSabotageBuildingsCount name]] "CrimeEventSabotageBuildingsCount"},
	value = 1,
}
DefineConst{
	group = "Gameplay",
	help = T{992693275986, --[[ConstDef Gameplay CrimeEventDestroyedBuildingsCount help]] "CrimeEvent -  the number of destroyed buildings from single crime event"},
	id = "CrimeEventDestroyedBuildingsCount",
	name = T{792834925451, --[[ConstDef Gameplay CrimeEventDestroyedBuildingsCount name]] "CrimeEventDestroyedBuildingsCount"},
	value = 1,
}
DefineConst{
	group = "Gameplay",
	help = T{4585, --[[ConstDef Gameplay FundingGainsModifier help]] "All Funding is multiplied by this percent"},
	id = "FundingGainsModifier",
	name = T{4586, --[[ConstDef Gameplay FundingGainsModifier name]] "Global Funding gains multiplier"},
	value = 100,
}
DefineConst{
	group = "Gameplay",
	help = T{4589, --[[ConstDef Gameplay TravelTimeEarthMars help]] "Time it takes for a Rocket to travel from Earth to Mars"},
	id = "TravelTimeEarthMars",
	name = T{4590, --[[ConstDef Gameplay TravelTimeEarthMars name]] "Rocket Travel Time (Earth to Mars)"},
	scale = "hours",
	value = 750000,
}
DefineConst{
	group = "Gameplay",
	help = T{4591, --[[ConstDef Gameplay TravelTimeMarsEarth help]] "Time it takes for a Rocket to travel from Mars to Earth"},
	id = "TravelTimeMarsEarth",
	name = T{4592, --[[ConstDef Gameplay TravelTimeMarsEarth name]] "Rocket Travel Time (Mars to Earth)"},
	scale = "hours",
	value = 750000,
}
DefineConst{
	group = "Gameplay",
	help = T{4593, --[[ConstDef Gameplay MaxColonistsPerRocket help]] "Maximum number of Colonists that can arrive on Mars in a single Rocket"},
	id = "MaxColonistsPerRocket",
	name = T{4594, --[[ConstDef Gameplay MaxColonistsPerRocket name]] "Colonists per Rocket"},
	value = 12,
}
DefineConst{
	group = "Gameplay",
	help = T{4595, --[[ConstDef Gameplay ApplicantGenerationInterval help]] "How long it takes to generate a new Applicant in the Applicant Pool"},
	id = "ApplicantGenerationInterval",
	name = T{4596, --[[ConstDef Gameplay ApplicantGenerationInterval name]] "Applicant Generation Period"},
	scale = "hours",
	value = 210000,
}
DefineConst{
	group = "Gameplay",
	help = T{4597, --[[ConstDef Gameplay CargoCapacity help]] "Maximum payload (in kg) of a resupply Rocket"},
	id = "CargoCapacity",
	name = T{4598, --[[ConstDef Gameplay CargoCapacity name]] "Payload Capacity"},
	value = 50000,
}
DefineConst{
	group = "Gameplay",
	help = T{4599, --[[ConstDef Gameplay SponsorFundingInterval help]] "Period (in Sols) of additional periodical Funding from mission sponsors"},
	id = "SponsorFundingInterval",
	name = T{4600, --[[ConstDef Gameplay SponsorFundingInterval name]] "Funding Interval (Sols)"},
	scale = "sols",
	value = 3600000,
}
DefineConst{
	group = "Gameplay",
	help = T{4601, --[[ConstDef Gameplay SponsorFundingPerInterval help]] "Amount of additional Funding (in millions) received periodically from mission sponsor"},
	id = "SponsorFundingPerInterval",
	name = T{4602, --[[ConstDef Gameplay SponsorFundingPerInterval name]] "Additional Funding (M)"},
	value = 0,
}
DefineConst{
	group = "Gameplay",
	help = T{4603, --[[ConstDef Gameplay ExportPricePreciousMetals help]] "Amount of Funding (in millions) received by exporting one unit of Rare Metals"},
	id = "ExportPricePreciousMetals",
	name = T{4604, --[[ConstDef Gameplay ExportPricePreciousMetals name]] "Rare Metals Price (M)"},
	value = 25,
}
DefineConst{
	group = "Gameplay",
	help = T{4605, --[[ConstDef Gameplay InstantCables help]] "Cables are built instantly when this is not 0"},
	id = "InstantCables",
	name = T{4606, --[[ConstDef Gameplay InstantCables name]] "Instant Cables"},
	value = 0,
}
DefineConst{
	group = "Gameplay",
	help = T{4607, --[[ConstDef Gameplay InstantPipes help]] "Pipes are built instantly when this is not 0"},
	id = "InstantPipes",
	name = T{4608, --[[ConstDef Gameplay InstantPipes name]] "Instant Pipes"},
	value = 0,
}
DefineConst{
	group = "Gameplay",
	help = T{4609, --[[ConstDef Gameplay IsDeepMetalsExploitable help]] "Deep Metals deposits are exploitable when this is not 0"},
	id = "IsDeepMetalsExploitable",
	name = T{4610, --[[ConstDef Gameplay IsDeepMetalsExploitable name]] "Exploitable Deep Metals"},
	value = 0,
}
DefineConst{
	group = "Gameplay",
	help = T{4611, --[[ConstDef Gameplay IsDeepWaterExploitable help]] "Deep Water deposits are exploitable when this is not 0"},
	id = "IsDeepWaterExploitable",
	name = T{4612, --[[ConstDef Gameplay IsDeepWaterExploitable name]] "Exploitable Deep Water"},
	value = 0,
}
DefineConst{
	group = "Gameplay",
	help = T{4613, --[[ConstDef Gameplay IsDeepPreciousMetalsExploitable help]] "Deep Rare Metals deposits are exploitable when this is not 0"},
	id = "IsDeepPreciousMetalsExploitable",
	name = T{4614, --[[ConstDef Gameplay IsDeepPreciousMetalsExploitable name]] "Can exploit deep Rare Metals"},
	value = 0,
}
DefineConst{
	group = "Gameplay",
	help = T{4615, --[[ConstDef Gameplay FoodPerRocketPassenger help]] "The amount of Food (unscaled) supplied with each Colonist arrival"},
	id = "FoodPerRocketPassenger",
	name = T{4616, --[[ConstDef Gameplay FoodPerRocketPassenger name]] "Food per Rocket Passenger"},
	value = 1000,
}
DefineConst{
	group = "Gameplay",
	help = T{4617, --[[ConstDef Gameplay DeepScanAvailable help]] "Deep scanning is available when this is not 0"},
	id = "DeepScanAvailable",
	name = T{4618, --[[ConstDef Gameplay DeepScanAvailable name]] "Can perform deep scan"},
	value = 0,
}
DefineConst{
	group = "Gameplay",
	id = "OutsourceResearchCost",
	name = T{839458405314, --[[ConstDef Gameplay OutsourceResearchCost name]] "Outsource Research Cost (in millions)"},
	scale = "mil",
	value = 200000000,
}
DefineConst{
	group = "Gameplay",
	id = "OutsourceResearch",
	name = T{593431521691, --[[ConstDef Gameplay OutsourceResearch name]] "Outsource Research Points"},
	value = 1000,
}
DefineConst{
	group = "Gameplay",
	id = "WasteRockToConcreteRatio",
	name = T{7665, --[[ConstDef Gameplay WasteRockToConcreteRatio name]] "WasteRock To Concrete Ratio"},
	value = 5,
}
DefineConst{
	group = "Gameplay",
	id = "OutsourceResearchTime",
	name = T{940974210714, --[[ConstDef Gameplay OutsourceResearchTime name]] "Outsource Research Duration"},
	scale = "sols",
	value = 3600000,
}
DefineConst{
	group = "Gameplay",
	id = "MaxResearchCollaborationLoss",
	name = T{8027, --[[ConstDef Gameplay MaxResearchCollaborationLoss name]] "Max Research Collaboration Loss (%)"},
	value = 50,
}
DefineConst{
	group = "Research",
	help = T{4621, --[[ConstDef Research BreakThroughTechCostMod help]] "Breakthrough tech cost modifier"},
	id = "BreakThroughTechCostMod",
	name = T{4622, --[[ConstDef Research BreakThroughTechCostMod name]] "Breakthrough tech cost modifier"},
	value = 100,
}
DefineConst{
	group = "Research",
	help = T{4623, --[[ConstDef Research ExperimentalResearchSpeedMod help]] "Research point multiplier for Experimental Research (in %)"},
	id = "ExperimentalResearchSpeedMod",
	name = T{4624, --[[ConstDef Research ExperimentalResearchSpeedMod name]] "Experimental Research Speed Mod"},
	value = 100,
}
DefineConst{
	group = "Research",
	help = T{4625, --[[ConstDef Research BreakthroughResearchSpeedMod help]] "Research point multiplier for Breakthrough Research (in %)"},
	id = "BreakthroughResearchSpeedMod",
	name = T{4626, --[[ConstDef Research BreakthroughResearchSpeedMod name]] "Breakthrough Research Speed Mod"},
	value = 100,
}
DefineConst{
	group = "Research",
	help = T{4627, --[[ConstDef Research SponsorResearch help]] "Sponsor Funding gained per Sol"},
	id = "SponsorResearch",
	name = T{4628, --[[ConstDef Research SponsorResearch name]] "Sponsor Research per Sol"},
	value = 100,
}
DefineConst{
	group = "Research",
	help = T{4629, --[[ConstDef Research ElectricityForResearchPoint help]] "Excess electrical Power will be converted to research at the rate defined by this value."},
	id = "ElectricityForResearchPoint",
	name = T{4630, --[[ConstDef Research ElectricityForResearchPoint name]] "Electricity for Research"},
	scale = "Resources",
	value = 0,
}
DefineConst{
	group = "Research",
	id = "ExplorerRoverResearchPoints",
	name = T{4631, --[[ConstDef Research ExplorerRoverResearchPoints name]] "Research points generated per RC Rover"},
	value = 0,
}
DefineConst{
	group = "Rover",
	help = T{4632, --[[ConstDef Rover RCRoverMaxDrones help]] "Maximum Drones an RC Rover can control"},
	id = "RCRoverMaxDrones",
	name = T{4633, --[[ConstDef Rover RCRoverMaxDrones name]] "RC Rover max Drones"},
	value = 8,
}
DefineConst{
	group = "Rover",
	help = T{4634, --[[ConstDef Rover RCRoverDistanceToProvokeAutomaticUnsiege help]] "Go To command will automatically cause unsiege if target is further than this distance"},
	id = "RCRoverDistanceToProvokeAutomaticUnsiege",
	name = T{4635, --[[ConstDef Rover RCRoverDistanceToProvokeAutomaticUnsiege name]] "RC Rover distance to provoke automatic unsiege"},
	value = 15000,
}
DefineConst{
	group = "Rover",
	help = T{4636, --[[ConstDef Rover RCRoverScanAnomalyTime help]] "RC Rover Anomaly scanning time (for each layer of depth)"},
	id = "RCRoverScanAnomalyTime",
	name = T{4637, --[[ConstDef Rover RCRoverScanAnomalyTime name]] "RC Rover Anomaly scan time"},
	scale = "hours",
	value = 180000,
}
DefineConst{
	group = "Rover",
	help = T{4638, --[[ConstDef Rover RCRoverTransferResourceWorkTime help]] "The time it takes for an RC Rover to transfer 1 resource to a Depot."},
	id = "RCRoverTransferResourceWorkTime",
	name = T{4639, --[[ConstDef Rover RCRoverTransferResourceWorkTime name]] "RC Rover resource gather time"},
	value = 1000,
}
DefineConst{
	group = "Rover",
	help = T{4640, --[[ConstDef Rover RCTransportGatherResourceWorkTime help]] "The time it takes the RC Transport to gather 1 resource from a deposit"},
	id = "RCTransportGatherResourceWorkTime",
	name = T{4641, --[[ConstDef Rover RCTransportGatherResourceWorkTime name]] "RC Transport resource gather time"},
	scale = "hours",
	value = 15000,
}
DefineConst{
	group = "Rover",
	help = T{4642, --[[ConstDef Rover RCRoverDroneRechargeCost help]] "The amount of battery drained from RC Rover when recharging a Drone."},
	id = "RCRoverDroneRechargeCost",
	name = T{4643, --[[ConstDef Rover RCRoverDroneRechargeCost name]] "RC Rover Drone battery recharge cost"},
	value = 15000,
}
DefineConst{
	group = "Drone",
	help = T{4644, --[[ConstDef Drone DroneRechargeTime help]] "The time it takes for a Drone to be fully recharged"},
	id = "DroneRechargeTime",
	name = T{4645, --[[ConstDef Drone DroneRechargeTime name]] "Drone recharge time"},
	scale = "hours",
	value = 40000,
}
DefineConst{
	group = "Drone",
	help = T{4646, --[[ConstDef Drone RechargeCleansDrones help]] "Drones will be cleaned of dust when being recharged if this value is bigger than 0"},
	id = "RechargeCleansDrones",
	name = T{4647, --[[ConstDef Drone RechargeCleansDrones name]] "Recharging cleans Drones"},
	value = 1,
}
DefineConst{
	group = "Drone",
	help = T{8468, --[[ConstDef Drone DroneHubOrderDroneRange help]] "How far away from the drone hub it would look for factories when ordering drone construction."},
	id = "DroneHubOrderDroneRange",
	name = T{8469, --[[ConstDef Drone DroneHubOrderDroneRange name]] "Drone Hub order drone range"},
	scale = "meters",
	value = 50000,
}
DefineConst{
	group = "Drone",
	help = T{4648, --[[ConstDef Drone DroneMeteorMalfunctionChance help]] "Drones may malfunction (with this chance) when close to a meteor impact site"},
	id = "DroneMeteorMalfunctionChance",
	name = T{4649, --[[ConstDef Drone DroneMeteorMalfunctionChance name]] "Drone meteor malfunction chance"},
	value = 50,
}
DefineConst{
	group = "Drone",
	help = T{4650, --[[ConstDef Drone DroneRepairAnimReps help]] "Drone repair time is dictated by the number of repetitions of the Repair animation"},
	id = "DroneRepairAnimReps",
	name = T{4651, --[[ConstDef Drone DroneRepairAnimReps name]] "Drone repair anim repetitions"},
	value = 4,
}
DefineConst{
	group = "Drone",
	help = T{4654, --[[ConstDef Drone DroneMaxDustBonus help]] "Additional dust limit increase (in %) beyond which a dirty Drone will Malfunction"},
	id = "DroneMaxDustBonus",
	name = T{4655, --[[ConstDef Drone DroneMaxDustBonus name]] "Drone max dust bonus"},
	value = 0,
}
DefineConst{
	group = "Drone",
	help = T{6976, --[[ConstDef Drone DroneElectronicsCost help]] "Price for constructing a Drone using the Drone Hub"},
	id = "DroneElectronicsCost",
	name = T{6977, --[[ConstDef Drone DroneElectronicsCost name]] "Drone Electronics cost"},
	value = 1000,
}
DefineConst{
	group = "Drone",
	help = T{6978, --[[ConstDef Drone DroneConstructionTime help]] "Drone construction time using the Drone Hub"},
	id = "DroneConstructionTime",
	name = T{6979, --[[ConstDef Drone DroneConstructionTime name]] "Drone construction time"},
	scale = "hours",
	value = 180000,
}
DefineConst{
	group = "Drone",
	help = T{4656, --[[ConstDef Drone AndroidElectronicsCost help]] "Price for constructing a Biorobot in a Drone Factory"},
	id = "AndroidElectronicsCost",
	name = T{4657, --[[ConstDef Drone AndroidElectronicsCost name]] "Biorobot Electronics cost"},
	value = 5000,
}
DefineConst{
	group = "Drone",
	help = T{4658, --[[ConstDef Drone AndroidConstructionTime help]] "Biorobot construction time"},
	id = "AndroidConstructionTime",
	name = T{4659, --[[ConstDef Drone AndroidConstructionTime name]] "Biorobot construction time"},
	scale = "hours",
	value = 180000,
}
DefineConst{
	group = "Drone",
	help = T{4660, --[[ConstDef Drone DroneConstructAmount help]] "Drones generate this many Construct points (per second) when constructing a building"},
	id = "DroneConstructAmount",
	name = T{4661, --[[ConstDef Drone DroneConstructAmount name]] "Drone Construct amount"},
	value = 100,
}
DefineConst{
	group = "Drone",
	help = T{4662, --[[ConstDef Drone DroneConstructBatteryUse help]] "Battery usage when Drone is constructing a building (per second)"},
	id = "DroneConstructBatteryUse",
	name = T{4663, --[[ConstDef Drone DroneConstructBatteryUse name]] "Drone construct battery usage"},
	value = 300,
}
DefineConst{
	group = "Drone",
	help = T{4664, --[[ConstDef Drone DroneBuildingRepairAmount help]] "Drones generate this many Repair points (per second) when repairing a building"},
	id = "DroneBuildingRepairAmount",
	name = T{4665, --[[ConstDef Drone DroneBuildingRepairAmount name]] "Drone building Repair amount"},
	value = 5000,
}
DefineConst{
	group = "Drone",
	help = T{4666, --[[ConstDef Drone DroneBuildingRepairBatteryUse help]] "Battery usage when Drone is repairing a building (per second)"},
	id = "DroneBuildingRepairBatteryUse",
	name = T{4667, --[[ConstDef Drone DroneBuildingRepairBatteryUse name]] "Drone building Repair battery usage"},
	value = 100,
}
DefineConst{
	group = "Drone",
	help = T{4668, --[[ConstDef Drone DroneCleanAmount help]] "When cleaning a building Drones generate this many Clean points (per second)"},
	id = "DroneCleanAmount",
	name = T{4669, --[[ConstDef Drone DroneCleanAmount name]] "Drone Clean amount"},
	value = 2000,
}
DefineConst{
	group = "Drone",
	help = T{4672, --[[ConstDef Drone DroneDeconstructAmount help]] "Drones generate this many Destroy points (per second) when destroying a Black Cube"},
	id = "DroneDeconstructAmount",
	name = T{4673, --[[ConstDef Drone DroneDeconstructAmount name]] "Drone Destroy amount"},
	value = 1000,
}
DefineConst{
	group = "Drone",
	help = T{4674, --[[ConstDef Drone DroneDeconstructBatteryUse help]] "Battery usage when Drone is destroying a Black Cube (per second)"},
	id = "DroneDeconstructBatteryUse",
	name = T{4675, --[[ConstDef Drone DroneDeconstructBatteryUse name]] "Drone Destroy battery usage"},
	value = 100,
}
DefineConst{
	group = "Drone",
	help = T{4676, --[[ConstDef Drone DroneTransformWasteRockObstructorToStockpileAmount help]] "Drones generate 'transform_to_waste_rock' points (per second) when removing Waste Rock obstructions"},
	id = "DroneTransformWasteRockObstructorToStockpileAmount",
	name = T{4677, --[[ConstDef Drone DroneTransformWasteRockObstructorToStockpileAmount name]] "Drone transform Waste Rock obstruction to stockpile amount"},
	value = 100,
}
DefineConst{
	group = "Drone",
	help = T{4678, --[[ConstDef Drone DroneTransformWasteRockObstructorToStockpileBatteryUse help]] "Battery usage when Drone is removing Waste Rock obstructions (per second)"},
	id = "DroneTransformWasteRockObstructorToStockpileBatteryUse",
	name = T{4679, --[[ConstDef Drone DroneTransformWasteRockObstructorToStockpileBatteryUse name]] "Drone transform Waste Rock obstruction to stockpile battery use"},
	value = 100,
}
DefineConst{
	group = "Drone",
	id = "DroneResourceCarryAmount",
	name = T{6980, --[[ConstDef Drone DroneResourceCarryAmount name]] "Drone resource carry amount"},
	value = 1,
}
DefineConst{
	group = "Drone",
	help = T{4680, --[[ConstDef Drone DroneMoveBatteryUse help]] "Battery usage when Drone is moving (without carrying resources) (per second)"},
	id = "DroneMoveBatteryUse",
	name = T{4681, --[[ConstDef Drone DroneMoveBatteryUse name]] "Drone move battery usage"},
	value = 100,
}
DefineConst{
	group = "Drone",
	help = T{4682, --[[ConstDef Drone DroneCarryBatteryUse help]] "Battery usage when Drone is moving and carrying a resource (per second)"},
	id = "DroneCarryBatteryUse",
	name = T{4683, --[[ConstDef Drone DroneCarryBatteryUse name]] "Drone carry battery usage"},
	value = 150,
}
DefineConst{
	group = "Drone",
	help = T{4684, --[[ConstDef Drone DroneEmergencyPower help]] "Drones will go to recharge when looking for work at twice this limit; They will drop what they're doing and go to recharge at this limit"},
	id = "DroneEmergencyPower",
	name = T{4685, --[[ConstDef Drone DroneEmergencyPower name]] "Drone emergency power"},
	value = 6000,
}
DefineConst{
	group = "Drone",
	help = T{4686, --[[ConstDef Drone DroneGatherResourceWorkTime help]] "Drones will load resources for this amount of time"},
	id = "DroneGatherResourceWorkTime",
	name = T{4687, --[[ConstDef Drone DroneGatherResourceWorkTime name]] "Drone gather resource work time"},
	scale = "hours",
	value = 15000,
}
DefineConst{
	group = "Drone",
	help = T{960116597482, --[[ConstDef Drone DroneRepairSupplyLeak help]] "The amount of time in seconds it takes a Drone to fix a supply leak"},
	id = "DroneRepairSupplyLeak",
	name = T{197593111647, --[[ConstDef Drone DroneRepairSupplyLeak name]] "Drone supply leak repair time"},
	value = 180,
}
DefineConst{
	group = "Workplace",
	help = T{4688, --[[ConstDef Workplace AvoidWorkplaceSols help]] "After being fired, Colonists will avoid that Workplace for this many days when searching for a Workplace"},
	id = "AvoidWorkplaceSols",
	name = T{4689, --[[ConstDef Workplace AvoidWorkplaceSols name]] "Avoid Workplace Sols"},
	value = 5,
}
DefineConst{
	group = "Workplace",
	help = T{4690, --[[ConstDef Workplace DefaultOutsideWorkplacesRadius help]] "Colonists search this far (in hexes) outisde their Dome when looking for a Workplace"},
	id = "DefaultOutsideWorkplacesRadius",
	name = T{4691, --[[ConstDef Workplace DefaultOutsideWorkplacesRadius name]] "Default outside Workplaces radius"},
	value = 10,
}
DefineConst{
	group = "Workplace",
	help = T{4692, --[[ConstDef Workplace WorkingHours help]] "Normal shift duration"},
	id = "WorkingHours",
	name = T{4693, --[[ConstDef Workplace WorkingHours name]] "Working hours"},
	value = 8,
}
DefineConst{
	group = "Workplace",
	help = T{384684843215, --[[ConstDef Workplace OvertimedShiftPerformance help]] "Heavy workload Shift Performance change"},
	id = "OvertimedShiftPerformance",
	name = T{570435030757, --[[ConstDef Workplace OvertimedShiftPerformance name]] "Heavy workload Shift Performance"},
	value = 20,
}
DefineConst{
	group = "Buildings",
	help = T{4694, --[[ConstDef Buildings RechargeStationTimeMod help]] "Time multiplier only when recharging from a station"},
	id = "RechargeStationTimeMod",
	name = T{4695, --[[ConstDef Buildings RechargeStationTimeMod name]] "Recharge station time mod"},
	value = 100,
}
DefineConst{
	group = "Buildings",
	help = T{4696, --[[ConstDef Buildings BuildingDailyDustMaxPercents help]] "Maximum dust accumulated per Sol"},
	id = "BuildingDailyDustMaxPercents",
	name = T{4697, --[[ConstDef Buildings BuildingDailyDustMaxPercents name]] "Building dust max percentage per Sol"},
	value = 30,
}
DefineConst{
	group = "Buildings",
	help = T{4698, --[[ConstDef Buildings BuildingDailyDustAccumulation help]] "Dust accumulation per Sol"},
	id = "BuildingDailyDustAccumulation",
	name = T{4699, --[[ConstDef Buildings BuildingDailyDustAccumulation name]] "Building dust accumulation per Sol"},
	value = 5000,
}
DefineConst{
	group = "Buildings",
	help = T{4700, --[[ConstDef Buildings BuildingDailyDustMin help]] "Minimum dust accumulated per Sol"},
	id = "BuildingDailyDustMin",
	name = T{4701, --[[ConstDef Buildings BuildingDailyDustMin name]] "Building dust min per Sol"},
	value = 100,
}
DefineConst{
	group = "Buildings",
	help = T{4702, --[[ConstDef Buildings BuildingDustModifier help]] "Modifier applied to dust accumulated by buildings"},
	id = "BuildingDustModifier",
	name = T{4703, --[[ConstDef Buildings BuildingDustModifier name]] "Building dust modifier"},
	value = 100,
}
DefineConst{
	group = "Buildings",
	help = T{4704, --[[ConstDef Buildings BuildingMaintenancePointsModifier help]] "Modifier applied to maintenance points accumulated by buildings"},
	id = "BuildingMaintenancePointsModifier",
	name = T{4705, --[[ConstDef Buildings BuildingMaintenancePointsModifier name]] "Building maintenance points modifier"},
	value = 100,
}
DefineConst{
	group = "Buildings",
	help = T{4706, --[[ConstDef Buildings CommandCenterMaxDrones help]] "Maximum number of Drones a Drone Hub can control"},
	id = "CommandCenterMaxDrones",
	name = T{4707, --[[ConstDef Buildings CommandCenterMaxDrones name]] "Command center max Drones"},
	value = 20,
}
DefineConst{
	group = "Buildings",
	help = T{4708, --[[ConstDef Buildings LargeBuildingHexes help]] "Buildings with this many or more hexes are considered 'large' (affects Dust Devils' paths and dust accumulation during them)"},
	id = "LargeBuildingHexes",
	name = T{4709, --[[ConstDef Buildings LargeBuildingHexes name]] "Large building hexes"},
	value = 12,
}
DefineConst{
	group = "Buildings",
	help = T{4710, --[[ConstDef Buildings CropFailThreshold help]] "Average performance of Farms required for Crops to succeed"},
	id = "CropFailThreshold",
	name = T{4711, --[[ConstDef Buildings CropFailThreshold name]] "Crop fail threshold"},
	value = 25,
}
DefineConst{
	group = "Buildings",
	help = T{4712, --[[ConstDef Buildings PipesPillarSpacing help]] "When building pipes, every 'PipesPillarSpacing'-th pipe will have a support pillar underneath it"},
	id = "PipesPillarSpacing",
	name = T{4713, --[[ConstDef Buildings PipesPillarSpacing name]] "Pipes pillar spacing"},
	value = 4,
}
DefineConst{
	group = "Buildings",
	help = T{8632, "How often the construction nanite tech picks up resources from nearby storages."},
	id = "ConstructionNanitesTimeDelta",
	name = T{8633, "Construction Nanites Time Delta"},
	value = 3000,
}
DefineConst{
	group = "Cost",
	help = T{4714, --[[ConstDef Cost Metals_cost_modifier help]] "All building construction costs in Metals will be modified by this percent"},
	id = "Metals_cost_modifier",
	name = T{4715, --[[ConstDef Cost Metals_cost_modifier name]] "Cost modifier (Metals)"},
	value = 0,
}
DefineConst{
	group = "Cost",
	help = T{4716, --[[ConstDef Cost Concrete_cost_modifier help]] "All building construction costs in Concrete will be modified by this percent"},
	id = "Concrete_cost_modifier",
	name = T{4717, --[[ConstDef Cost Concrete_cost_modifier name]] "Cost modifier (Concrete)"},
	value = 0,
}
DefineConst{
	group = "Cost",
	help = T{4718, --[[ConstDef Cost Polymers_cost_modifier help]] "All building construction costs in Polymers will be modified by this percent"},
	id = "Polymers_cost_modifier",
	name = T{4719, --[[ConstDef Cost Polymers_cost_modifier name]] "Cost modifier (Polymers)"},
	value = 0,
}
DefineConst{
	group = "Cost",
	help = T{4720, --[[ConstDef Cost Electronics_cost_modifier help]] "All building construction costs in Electronics will be modified by this percent"},
	id = "Electronics_cost_modifier",
	name = T{4721, --[[ConstDef Cost Electronics_cost_modifier name]] "Cost modifier (Electronics)"},
	value = 0,
}
DefineConst{
	group = "Cost",
	help = T{4722, --[[ConstDef Cost MachineParts_cost_modifier help]] "All building construction costs in Machine Parts will be modified by this percent"},
	id = "MachineParts_cost_modifier",
	name = T{4723, --[[ConstDef Cost MachineParts_cost_modifier name]] "Cost modifier (Machine Parts)"},
	value = 0,
}
DefineConst{
	group = "Cost",
	help = T{4724, --[[ConstDef Cost PreciousMetals_cost_modifier help]] "All building construction costs in Rare Metals will be modified by this percent"},
	id = "PreciousMetals_cost_modifier",
	name = T{4725, --[[ConstDef Cost PreciousMetals_cost_modifier name]] "Cost modifier (Rare Metals)"},
	value = 0,
}
DefineConst{
	group = "Cost",
	help = T{4726, --[[ConstDef Cost Metals_dome_cost_modifier help]] "All Dome construction costs in in Metals will be modified by this percent"},
	id = "Metals_dome_cost_modifier",
	name = T{4727, --[[ConstDef Cost Metals_dome_cost_modifier name]] "Dome cost modifier (Metals)"},
	value = 0,
}
DefineConst{
	group = "Cost",
	help = T{4728, --[[ConstDef Cost Concrete_dome_cost_modifier help]] "All Dome construction costs in in Concrete will be modified by this percent"},
	id = "Concrete_dome_cost_modifier",
	name = T{4729, --[[ConstDef Cost Concrete_dome_cost_modifier name]] "Dome cost modifier (Concrete)"},
	value = 0,
}
DefineConst{
	group = "Cost",
	help = T{4730, --[[ConstDef Cost Polymers_dome_cost_modifier help]] "All Dome construction costs in in Polymers will be modified by this percent"},
	id = "Polymers_dome_cost_modifier",
	name = T{4731, --[[ConstDef Cost Polymers_dome_cost_modifier name]] "Dome cost modifier (Polymers)"},
	value = 0,
}
DefineConst{
	group = "Cost",
	help = T{4732, --[[ConstDef Cost Electronics_dome_cost_modifier help]] "All Dome construction costs in in Electronics will be modified by this percent"},
	id = "Electronics_dome_cost_modifier",
	name = T{4733, --[[ConstDef Cost Electronics_dome_cost_modifier name]] "Dome cost modifier (Electronics)"},
	value = 0,
}
DefineConst{
	group = "Cost",
	help = T{4734, --[[ConstDef Cost MachineParts_dome_cost_modifier help]] "All Dome construction costs in in Machine Parts will be modified by this percent"},
	id = "MachineParts_dome_cost_modifier",
	name = T{4735, --[[ConstDef Cost MachineParts_dome_cost_modifier name]] "Dome cost modifier (Machine Parts)"},
	value = 0,
}
DefineConst{
	group = "Cost",
	help = T{4736, --[[ConstDef Cost PreciousMetals_dome_cost_modifier help]] "All Dome construction costs in in Rare Metals will be modified by this percent"},
	id = "PreciousMetals_dome_cost_modifier",
	name = T{4737, --[[ConstDef Cost PreciousMetals_dome_cost_modifier name]] "Dome cost modifier (Rare Metals)"},
	value = 0,
}
DefineConst{
	group = "Cost",
	help = T{4738, --[[ConstDef Cost rebuild_cost_modifier help]] "All building rebuild construction costs will be modified by this percent"},
	id = "rebuild_cost_modifier",
	name = T{4739, --[[ConstDef Cost rebuild_cost_modifier name]] "Rebuild cost modifier"},
	value = 100,
}
DefineConst{
	group = "Colonist",
	help = T{4740, --[[ConstDef Colonist NonSpecialistPerformancePenalty help]] "Performance penalty for non-Specialists assigned to a specialized work position"},
	id = "NonSpecialistPerformancePenalty",
	name = T{4741, --[[ConstDef Colonist NonSpecialistPerformancePenalty name]] "Non-specialist performance penalty"},
	value = 50,
}
DefineConst{
	group = "Colonist",
	help = T{"???"},
	id = "NonHomeDomePerformancePenalty",
	name = T{"???"},
	value = 10,
}
DefineConst{
	group = "Colonist",
	help = T{691313621108, --[[ConstDef Colonist ForcedByUserLockTimeout help]] "Lock time to Workplace, Residence, Dome selected by user"},
	id = "ForcedByUserLockTimeout",
	name = T{492281705322, --[[ConstDef Colonist ForcedByUserLockTimeout name]] "ForcedByUserLockTimeout"},
	scale = "sols",
	value = 3600000,
}
DefineConst{
	group = "Colonist",
	help = T{603743631388, --[[ConstDef Colonist ProjectMorphiousPositiveTraitChance help]] "Chance to get positive trait when Resting and ProjectMorpheus is active"},
	id = "ProjectMorphiousPositiveTraitChance",
	name = T{580388115170, --[[ConstDef Colonist ProjectMorphiousPositiveTraitChance name]] "ProjectMorpheusPositiveTraitChance"},
	value = 2,
}
DefineConst{
	group = "Colonist",
	id = "scientist_arrival_chance",
	name = T{4744, --[[ConstDef Colonist scientist_arrival_chance name]] "Arrival chance (Scientist)"},
	value = 16,
}
DefineConst{
	group = "Colonist",
	id = "engineer_arrival_chance",
	name = T{4745, --[[ConstDef Colonist engineer_arrival_chance name]] "Arrival chance (Engineer)"},
	value = 12,
}
DefineConst{
	group = "Colonist",
	id = "security_arrival_chance",
	name = T{4746, --[[ConstDef Colonist security_arrival_chance name]] "Arrival chance (Officer)"},
	value = 6,
}
DefineConst{
	group = "Colonist",
	id = "geologist_arrival_chance",
	name = T{4747, --[[ConstDef Colonist geologist_arrival_chance name]] "Arrival chance (Geologist)"},
	value = 12,
}
DefineConst{
	group = "Colonist",
	id = "botanist_arrival_chance",
	name = T{4748, --[[ConstDef Colonist botanist_arrival_chance name]] "Arrival chance (Botanist)"},
	value = 12,
}
DefineConst{
	group = "Colonist",
	id = "medic_arrival_chance",
	name = T{4749, --[[ConstDef Colonist medic_arrival_chance name]] "Arrival chance (Medic)"},
	value = 6,
}
DefineConst{
	group = "Colonist",
	help = T{4750, --[[ConstDef Colonist specialist_chance_mul help]] "Multiplier for arrival chances of all Specialist types"},
	id = "specialist_chance_mul",
	name = T{4751, --[[ConstDef Colonist specialist_chance_mul name]] "Specialist chance multiplier"},
	value = 100,
}
DefineConst{
	group = "Colonist",
	help = T{4752, --[[ConstDef Colonist eat_food_per_visit help]] "Food eaten per visit to building, Farm or stockpile"},
	id = "eat_food_per_visit",
	name = T{4753, --[[ConstDef Colonist eat_food_per_visit name]] "Food used per visit"},
	scale = "Resources",
	value = 200,
}
DefineConst{
	group = "Colonist",
	help = T{4754, --[[ConstDef Colonist positive_playground_chance help]] "Colonist's chance to get a Perk when grown if they’ve visited a playground as a child"},
	id = "positive_playground_chance",
	name = T{4755, --[[ConstDef Colonist positive_playground_chance name]] "Chance to get a Perk"},
	value = 100,
}
DefineConst{
	group = "Colonist",
	help = T{4756, --[[ConstDef Colonist cloning_points help]] "Cloning points at full performance per hour"},
	id = "cloning_points",
	name = T{4757, --[[ConstDef Colonist cloning_points name]] "Cloning points"},
	value = 20,
}
DefineConst{
	group = "Colonist",
	help = T{4758, --[[ConstDef Colonist ApplicantsPoolStartingSize help]] "Applicants pool starting size"},
	id = "ApplicantsPoolStartingSize",
	name = T{4759, --[[ConstDef Colonist ApplicantsPoolStartingSize name]] "Applicants pool starting size"},
	value = 100,
}
DefineConst{
	group = "Colonist",
	id = "TimeBeforeStarving",
	name = T{4760, --[[ConstDef Colonist TimeBeforeStarving name]] "Time before starting to starve"},
	scale = "hours",
	value = 1080000,
}
DefineConst{
	group = "Colonist",
	help = T{4761, --[[ConstDef Colonist Other_gender_chance help]] "The chance to generate a Colonist with 'Other' sex"},
	id = "Other_gender_chance",
	name = T{4762, --[[ConstDef Colonist Other_gender_chance name]] "'Other' sex chance"},
	value = 1,
}
DefineConst{
	group = "Colonist",
	id = "VisitFailPenalty",
	name = T{4763, --[[ConstDef Colonist VisitFailPenalty name]] "Comfort penalty when failing to satisfy a need via a visit"},
	scale = "Stat",
	value = 10000,
}
DefineConst{
	group = "Colonist",
	id = "BirthThreshold",
	name = T{337606533515, --[[ConstDef Colonist BirthThreshold name]] "Threshold of accumulated stat points to trigger birth of a new Colonist"},
	scale = "Needs",
	value = 1000000,
}
DefineConst{
	id = "ShockGraceMin",
	scale = "hours",
	value = 360000,
}
DefineConst{
	id = "ShockGraceMax",
	scale = "hours",
	value = 1080000,
}
DefineConst{
	group = "Camera",
	id = "DefaultFovX_16_9",
	scale = "degrees",
	value = 4200,
}
DefineConst{
	group = "Camera",
	id = "OverviewFovX_16_9",
	scale = "degrees",
	value = 1560,
}
DefineConst{
	group = "Camera",
	help = "",
	id = "OverviewFovX_4_3",
	name = "",
	scale = "degrees",
	value = 1440,
}
