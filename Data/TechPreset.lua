-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('TechPreset', {
	description = T(207831279529, --[[TechPreset AnomalousGenomeResequencing description]] "Discover the reason behind the unexpected overnight gene re-writing of your colonists."),
	display_name = T(11400, --[[TechPreset AnomalousGenomeResequencing display_name]] "Anomalous Genome Resequencing"),
	group = "Storybits",
	icon = "UI/Icons/Research/story_bit.tga",
	id = "AnomalousGenomeResequencing",
})

PlaceObj('TechPreset', {
	description = T(243039926162, --[[TechPreset Cure4Cancer description]] "Dedicate your research towards the initiative for discovering a Cure for cancer."),
	display_name = T(11062, --[[TechPreset Cure4Cancer display_name]] "Cancer Research Initiative"),
	group = "Storybits",
	icon = "UI/Icons/Research/story_bit.tga",
	id = "Cure4Cancer",
})

PlaceObj('TechPreset', {
	description = T(113438988242, --[[TechPreset DustSicknessCure description]] "The Dust Sickness is affecting more and more colonists we need to find a cure as soon as possible. Once the cure is found afflicted colonists will lose the Dust Sickness trait."),
	display_name = T(11401, --[[TechPreset DustSicknessCure display_name]] "Dust Sickness Cure"),
	group = "Storybits",
	icon = "UI/Icons/Research/story_bit.tga",
	id = "DustSicknessCure",
})

PlaceObj('TechPreset', {
	description = T(914208702775, --[[TechPreset GeneForging description]] "Increases the chance that a Colonist will have or gain a <em>rare trait</em>."),
	display_name = T(11402, --[[TechPreset GeneForging display_name]] "Gene Forging"),
	group = "Storybits",
	icon = "UI/Icons/Research/story_bit.tga",
	id = "GeneForging",
	param1 = 50,
	param1comment = "bonus chance for rare traits",
})

PlaceObj('TechPreset', {
	description = T(786770300927, --[[TechPreset MOXIE_2 description]] "Redesign the MOXIE unit from the ground up to remove all design flaws and patchworks and increase air production by <param1>."),
	display_name = T(11212, --[[TechPreset MOXIE_2 display_name]] "MOXIE 2.0"),
	group = "Storybits",
	icon = "UI/Icons/Research/story_bit.tga",
	id = "MOXIE_2",
	param1 = 2,
	param1comment = "air production",
	PlaceObj('Effect_ModifyLabel', {
		Amount = 2,
		Label = "MOXIE",
		Prop = "air_production",
	}),
})

PlaceObj('TechPreset', {
	display_name = T(11213, --[[TechPreset Nero_Antidote display_name]] "Nero Antidote"),
	group = "Storybits",
	icon = "UI/Icons/Research/story_bit.tga",
	id = "Nero_Antidote",
})

PlaceObj('TechPreset', {
	description = T(435746095458, --[[TechPreset RogueNaniteDeactivation description]] "Deactivate the Rogue Nanites to stop their destructive effect on your Colony."),
	display_name = T(11403, --[[TechPreset RogueNaniteDeactivation display_name]] "Rogue Nanite Deactivation"),
	group = "Storybits",
	icon = "UI/Icons/Research/story_bit.tga",
	id = "RogueNaniteDeactivation",
})

PlaceObj('TechPreset', {
	description = T(217591992579, --[[TechPreset RogueNanitesAnalysis description]] "Analyze the abnormal behavior of the Rogue Nanites and the reasons for the glitch."),
	display_name = T(11404, --[[TechPreset RogueNanitesAnalysis display_name]] "Rogue Nanites Analysis"),
	group = "Storybits",
	icon = "UI/Icons/Research/story_bit.tga",
	id = "RogueNanitesAnalysis",
})

PlaceObj('TechPreset', {
	description = T(200121853016, --[[TechPreset SurveyOffer description]] "Complete this research to immediately discover several new metal and rare metal deposits."),
	display_name = T(11063, --[[TechPreset SurveyOffer display_name]] "Geo-Crust Scanner"),
	group = "Storybits",
	icon = "UI/Icons/Research/story_bit.tga",
	id = "SurveyOffer",
})

PlaceObj('TechPreset', {
	description = T(857507799905, --[[TechPreset TheCypher description]] "Decipher the secret contents of a strange message discovered in a strange probe on the surface of Mars."),
	display_name = T(11405, --[[TechPreset TheCypher display_name]] "The Cypher"),
	group = "Storybits",
	icon = "UI/Icons/Research/story_bit.tga",
	id = "TheCypher",
})

PlaceObj('TechPreset', {
	description = T(857527054258, --[[TechPreset TheIncident description]] "Investigate the reason behind the critical malfunction of one of our Fusion Reactors. You won't be able to construct new Fusion Reactors until this tech has been researched."),
	display_name = T(11064, --[[TechPreset TheIncident display_name]] "The Incident"),
	group = "Storybits",
	icon = "UI/Icons/Research/story_bit.tga",
	id = "TheIncident",
})

PlaceObj('TechPreset', {
	description = T(485387209053, --[[TechPreset ViolentUrges description]] "Investigates the inexplicable crimes committed by Arcology residents."),
	display_name = T(11406, --[[TechPreset ViolentUrges display_name]] "Violent Urges"),
	group = "Storybits",
	icon = "UI/Icons/Research/story_bit.tga",
	id = "ViolentUrges",
})

PlaceObj('TechPreset', {
	description = T(917722138254, --[[TechPreset WindTurbineRedesign description]] "Our initial design for Wind Turbines is underperforming. We need a better one taking into account the real Martian conditions."),
	display_name = T(11099, --[[TechPreset WindTurbineRedesign display_name]] "Wind Turbine Redesign"),
	group = "Storybits",
	icon = "UI/Icons/Research/story_bit.tga",
	id = "WindTurbineRedesign",
})

PlaceObj('TechPreset', {
	SortKey = 1,
	description = T(6321, --[[TechPreset HygroscopicVaporators description]] "Moisture Vaporator Upgrade (<em>Hygroscopic Coating</em>) - Water production increased by <param1>%.\n\n<grey>With its mechanical simplicity and applicability to any point on Mars's surface, the Water-Vapor Adsorption Reactor technology can extract water directly from the Martian atmosphere.</grey>"),
	display_name = T(6320, --[[TechPreset HygroscopicVaporators display_name]] "Hygroscopic Vaporators"),
	group = "Biotech",
	icon = "UI/Icons/Research/hygroscopic_vaporators.tga",
	id = "HygroscopicVaporators",
	param1 = 50,
	param1comment = "Production Bonus %",
	position = range(1, 5),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "MoistureVaporator_HygroscopicCoating",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 2,
	description = T(6323, --[[TechPreset SoilAdaptation description]] "New Building: <em>Farm</em> (<buildinginfo('Farm')>) - Produces Food. Large in-Dome building which is more work-efficient and requires no Power.\n\n<grey>\"They say once you grow crops somewhere you’ve officially colonized it.\"\n<right>Andy Weir – The Martian</grey><left>"),
	display_name = T(6322, --[[TechPreset SoilAdaptation display_name]] "Soil Adaptation"),
	group = "Biotech",
	icon = "UI/Icons/Research/soil_adaptation.tga",
	id = "SoilAdaptation",
	position = range(1, 5),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "Farm",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 3,
	description = T(6344, --[[TechPreset LowGFungi description]] "New Building: <em>Fungal Farm</em> (<buildinginfo('FungalFarm')>) -  An out-Dome building that produces Food.\n\n<grey>\"All fungi are edible. Some fungi are only edible once.\" \n<right>Terry Pratchett</grey><left>"),
	display_name = T(6343, --[[TechPreset LowGFungi display_name]] "Low-G Fungi"),
	group = "Biotech",
	icon = "UI/Icons/Research/low-g_fungi.tga",
	id = "LowGFungi",
	position = range(1, 5),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "FungalFarm",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 4,
	description = T(6326, --[[TechPreset MagneticFiltering description]] "MOXIE Upgrade (<em>Magnetic Filtering</em>) - Oxygen production increased by <param1>%.\n\n<grey>Magnetic filters block ferromagnetic metal contaminants as well as weakly magnetic particles from the Martian atmosphere when inhaled by our MOXIEs, greatly increasing their efficiencies.</grey>"),
	display_name = T(5125, --[[TechPreset MagneticFiltering display_name]] "Magnetic Filtering"),
	group = "Biotech",
	icon = "UI/Icons/Research/magnetic_filtering.tga",
	id = "MagneticFiltering",
	param1 = 50,
	param1comment = "Production Bonus %",
	position = range(1, 5),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "MOXIE_MagneticFiltering",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 5,
	description = T(6328, --[[TechPreset WaterReclamation description]] "New Spire Building: <em>Water Reclamation System</em> (<buildinginfo('WaterReclamationSystem')>) - drastically reduces the Water consumption of the Dome.\n\n<grey>Water on Mars is abundant, yet it is mostly underground and in a frozen state – making it, while within reach, still difficult and expensive to mine. This makes recycling necessary to ensure a steady water supply.</grey>"),
	display_name = T(6327, --[[TechPreset WaterReclamation display_name]] "Water Reclamation"),
	group = "Biotech",
	icon = "UI/Icons/Research/water_reclamation.tga",
	id = "WaterReclamation",
	position = range(1, 5),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "WaterReclamationSystem",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 6,
	description = T(6330, --[[TechPreset UtilityCrops description]] "Unlock <em>new crops</em> in Farms and Hydroponic Farms that provide Oxygen and improve soil quality.\n\n<grey>From the salad you eat to the air you breathe, plants have a fundamental role to play for humanity well beyond Earth.</grey>"),
	display_name = T(6329, --[[TechPreset UtilityCrops display_name]] "Utility Crops"),
	group = "Biotech",
	icon = "UI/Icons/Research/utility_crops.tga",
	id = "UtilityCrops",
	position = range(6, 6),
	PlaceObj('Effect_Code', {
		OnApplyEffect = function (self, city, parent)
UnlockCrop("Algae", parent.id)
UnlockCrop("Cover Crops", parent.id)
end,
		OnInitEffect = function (self, city, parent)
LockCrop("Algae", parent.id)
LockCrop("Cover Crops", parent.id)
end,
	}),
})

PlaceObj('TechPreset', {
	SortKey = 7,
	description = T(6332, --[[TechPreset MartianbornAdaptability description]] "<em>Martianborn</em> Colonists graduate faster in Universities and Sanatoriums and have higher chance to gain Perks from Schools.\n\n<grey>Certain restrictions that still persist on Earth derived from religion and general conservatism are absent here on Mars. As a result, we have the freedom to genetically enhance our newborns and hone their already-sharp minds to a sharp point.</grey>"),
	display_name = T(6331, --[[TechPreset MartianbornAdaptability display_name]] "Martianborn Adaptability"),
	group = "Biotech",
	icon = "UI/Icons/Research/martianborn_adaptability.tga",
	id = "MartianbornAdaptability",
	param1 = 100,
	position = range(7, 10),
})

PlaceObj('TechPreset', {
	SortKey = 8,
	description = T(6325, --[[TechPreset BiomeEngineering description]] "<em>Farms</em> increase the Comfort of all residences in the Dome.\n\n<grey>Seeing something green against the endless reddish barrens of Mars can be quite therapeutic.</grey>"),
	display_name = T(6324, --[[TechPreset BiomeEngineering display_name]] "Biome Engineering"),
	group = "Biotech",
	icon = "UI/Icons/Research/biome_engineering.tga",
	id = "BiomeEngineering",
	position = range(7, 10),
	PlaceObj('Effect_ModifyLabel', {
		Amount = 5,
		Label = "Farm",
		Prop = "dome_comfort",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 9,
	description = T(6336, --[[TechPreset DomeBioscaping description]] "Residences in <em>Basic Domes, Micro Domes and Barrel Domes</em> have improved Comfort.\n\n<grey>“One touch of nature makes the whole world kin.”\n<right>William Shakespeare</grey><left>"),
	display_name = T(6335, --[[TechPreset DomeBioscaping display_name]] "Dome Bioscaping"),
	group = "Biotech",
	icon = "UI/Icons/Research/dome_bioscaping.tga",
	id = "DomeBioscaping",
	position = range(7, 10),
	PlaceObj('Effect_ModifyLabel', {
		Amount = 15,
		Label = "DomeBasic",
		Prop = "dome_comfort",
	}),
	PlaceObj('Effect_ModifyLabel', {
		Amount = 15,
		Label = "DomeMicro",
		Prop = "dome_comfort",
	}),
	PlaceObj('Effect_ModifyLabel', {
		Amount = 15,
		Label = "DomeHexa",
		Prop = "dome_comfort",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 10,
	description = T(6338, --[[TechPreset MicrogravityMedicine description]] "New Spire Building: <em>Medical Center</em> (<buildinginfo('MedicalCenter')>) - has larger capacity and is more effective than the Infirmary.\n\n<grey>“The good physician treats the disease; the great physician treats the patient who has the disease.” \n<right>William Osler</grey><left>"),
	display_name = T(6337, --[[TechPreset MicrogravityMedicine display_name]] "Microgravity Medicine"),
	group = "Biotech",
	icon = "UI/Icons/Research/microgravity_medicine.tga",
	id = "MicrogravityMedicine",
	position = range(7, 10),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "MedicalCenter",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 11,
	description = T(6340, --[[TechPreset GeneAdaptation description]] "Unlock <em>new crops</em> in Farms and Hydroponic Farms that provide better Food yields.\n\n<grey>The overall reputation of GMO grown foods has increased dramatically when the only other alternative for food is red dirt.</grey>"),
	display_name = T(6339, --[[TechPreset GeneAdaptation display_name]] "Gene Adaptation"),
	group = "Biotech",
	icon = "UI/Icons/Research/gene_adaptation.tga",
	id = "GeneAdaptation",
	position = range(11, 11),
	PlaceObj('Effect_Code', {
		OnApplyEffect = function (self, city, parent)
UnlockCrop("Rice", parent.id)
UnlockCrop("Vegetables", parent.id)
UnlockCrop("Kelp", parent.id)
UnlockCrop("Corn", parent.id)
UnlockCrop("Fruit Trees", parent.id)
UnlockCrop("Quinoa", parent.id)
UnlockCrop("Giant Corn", parent.id)
UnlockCrop("Giant Rice", parent.id)
end,
		OnInitEffect = function (self, city, parent)
LockCrop("Rice", parent.id)
LockCrop("Vegetables", parent.id)
LockCrop("Kelp", parent.id)
LockCrop("Corn", parent.id)
LockCrop("Fruit Trees", parent.id)
LockCrop("Quinoa", parent.id)
LockCrop("Giant Corn", parent.id)
LockCrop("Giant Rice", parent.id)
end,
	}),
})

PlaceObj('TechPreset', {
	SortKey = 12,
	description = T(8859, --[[TechPreset CreativeBiorobotics description]] "New Building: <em>Biorobotics Workshop</em> (<buildinginfo('BioroboticsWorkshop')>) - a vocation building that allows colonists to experiment with biorobots (counts towards the workshop milestone). Consumes Machine Parts.\n\n<grey>\"We are fascinated with robots because they are reflections of ourselves.\"\n<right>Ken Goldberg</grey><left>"),
	display_name = T(8858, --[[TechPreset CreativeBiorobotics display_name]] "Creative Biorobotics"),
	group = "Biotech",
	icon = "UI/Icons/Research/creative_biorobotics.tga",
	id = "CreativeBiorobotics",
	position = range(12, 19),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "BioroboticsWorkshop",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 13,
	description = T(7294, --[[TechPreset WaterCoservationSystem description]] 'Water consumption of <em>Domes</em> reduced by <param1>%.\n\n<grey>"No water, no life. No blue, no green."\n<right>Sylvia Earle</grey><left>'),
	display_name = T(7293, --[[TechPreset WaterCoservationSystem display_name]] "Water Conservation System"),
	group = "Biotech",
	icon = "UI/Icons/Research/water_conservation_system.tga",
	id = "WaterCoservationSystem",
	param1 = 50,
	param1comment = "Water Reduction %",
	position = range(12, 19),
	PlaceObj('Effect_ModifyLabel', {
		Label = "Dome",
		Percent = -50,
		Prop = "water_consumption",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 14,
	description = T(6334, --[[TechPreset FarmAutomation  description]] "<em>Farm, Hydroponic Farm & Fungal Farm</em> Upgrade: <em>Automation</em> - Decreases number of workers.\n\n<grey>Now that we have adapted crops to the Martian environment we can mechanize some procedures.</grey>"),
	display_name = T(6333, --[[TechPreset FarmAutomation  display_name]] "Farm Automation"),
	group = "Biotech",
	icon = "UI/Icons/Research/farm_automation.tga",
	id = "FarmAutomation ",
	position = range(12, 19),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "Farm_Automation",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "FungalFarm_Automation",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "HydroponicFarm_Automation",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 15,
	description = T(6345, --[[TechPreset HangingGardens description]] "New Spire Building: <em>Hanging Gardens</em> (<buildinginfo('HangingGardens')>) - a beautiful park complex that greatly improves the Comfort of all Residences in the Dome.\n\n<grey>One of humanity’s most enduring and fanciful legends from the ancient past is made a reality on Mars.</grey>"),
	display_name = T(3535, --[[TechPreset HangingGardens display_name]] "Hanging Gardens"),
	group = "Biotech",
	icon = "UI/Icons/Research/hanging_gardens.tga",
	id = "HangingGardens",
	position = range(12, 19),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "HangingGardens",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 16,
	description = T(6347, --[[TechPreset HolographicScanning description]] "<em>Medical Center</em> Upgrade (Holographic Scanner) - Increases birth rate in the Dome.\n\n<grey>Holographic technologies can significantly improve medical diagnostics and monitoring procedures.</grey>"),
	display_name = T(6346, --[[TechPreset HolographicScanning display_name]] "Holographic Scanning"),
	group = "Biotech",
	icon = "UI/Icons/Research/holographic_scanning.tga",
	id = "HolographicScanning",
	position = range(12, 19),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "MedicalCenter_HolographicScanner",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 17,
	description = T(6349, --[[TechPreset MoistureFarming description]] "New Building: <em>Moisture Vaporator</em> (<buildinginfo('MoistureVaporator')>) - Produces Water from the atmosphere. Doesn't produce during Dust Storms.\n\n<grey>\"What I really need is a drone that understands the binary language of moisture vaporators.\"\n<right>Unknown Martian Colonist</grey><left>"),
	display_name = T(6348, --[[TechPreset MoistureFarming display_name]] "Moisture Farming"),
	group = "Biotech",
	icon = "UI/Icons/Research/moisture_farming.tga",
	id = "MoistureFarming",
	position = range(12, 19),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "MoistureVaporator",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 18,
	description = T(6350, --[[TechPreset RejuvenationTreatment description]] "Infirmary & Medical Center Upgrade (<em>Rejuvenation Treatment</em>) - Improves Service Comfort and provides Relaxation, allowing Colonists to visit and gain Comfort.\n\n<grey>You haven’t truly colonized a planet until you build the first Spa center on it.</grey>"),
	display_name = T(5103, --[[TechPreset RejuvenationTreatment display_name]] "Rejuvenation Treatment"),
	group = "Biotech",
	icon = "UI/Icons/Research/rejuvenation_treatment.tga",
	id = "RejuvenationTreatment",
	param1 = 10,
	position = range(12, 19),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "Infirmary_RejuvenationTreatment",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "MedicalCenter_RejuvenationTreatment",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 19,
	description = T(6354, --[[TechPreset StemReconstruction description]] "<em>Retirement age</em> and <em>death</em> from old age happen later in the Colonists' lifespan.\n\n<grey>\"Live long and prosper\"\n<right>Vulcan Salute</grey><left>"),
	display_name = T(6353, --[[TechPreset StemReconstruction display_name]] "Stem Reconstruction"),
	group = "Biotech",
	icon = "UI/Icons/Research/stem_reconstruction.tga",
	id = "StemReconstruction",
	position = range(12, 19),
	PlaceObj('Effect_ModifyLabel', {
		Amount = 20,
		Label = "Colonist",
		Prop = "MinAge_Senior",
	}),
	PlaceObj('Effect_ModifyLabel', {
		Amount = 20,
		Label = "Colonist",
		Prop = "death_age",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 20,
	description = T(6356, --[[TechPreset LocalizedTerraforming description]] "New Wonder: <em>Geoscape Dome</em> (<buildinginfo('GeoscapeDome')>)  - A slice of Earth on Mars, this Dome has high Comfort and increases the Sanity of its inhabitants on every Sol.\n\n<grey>\"It's a fixer-upper of a planet but we could make it work.\" \n<right>Elon Musk</grey><left>"),
	display_name = T(6355, --[[TechPreset LocalizedTerraforming display_name]] "Localized Terraforming"),
	group = "Biotech",
	icon = "UI/Icons/Research/localized_terraforming.tga",
	id = "LocalizedTerraforming",
	position = range(20, 20),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "GeoscapeDome",
		HideBuilding = true,
	}),
})

PlaceObj('TechPreset', {
	SortKey = 1,
	description = T(6522, --[[TechPreset ConstructionNanites description]] "<em>Buildings</em> construct themselves slowly without Drones. Nanites will seek out resources from nearby resource depots.\n\n<grey>With a payload of several molecules and an electronic instrument used for both navigating and knowing its purpose, Construction Nanites form slightly saturated winds which to the casual observer would seem to erect buildings as if by magic.</grey>"),
	display_name = T(6521, --[[TechPreset ConstructionNanites display_name]] "Construction Nanites"),
	group = "Breakthroughs",
	icon = "UI/Icons/Research/construction_nanites.tga",
	id = "ConstructionNanites",
})

PlaceObj('TechPreset', {
	SortKey = 2,
	description = T(6524, --[[TechPreset HullPolarization description]] 'Buildings require <em>maintenance</em> less often.\n\n<grey>"Don\'t confound static electricity with ecstatic eccentricity. One will leave your hair up, the other will live up in the air!"\n<right>Ana Claudia Antunes</grey><left>'),
	display_name = T(6523, --[[TechPreset HullPolarization display_name]] "Hull Polarization"),
	group = "Breakthroughs",
	icon = "UI/Icons/Research/hull_polarization.tga",
	id = "HullPolarization",
	PlaceObj('Effect_ModifyLabel', {
		Label = "Consts",
		Percent = -25,
		Prop = "BuildingMaintenancePointsModifier",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 3,
	description = T(6526, --[[TechPreset ProjectPhoenix description]] "When a colonist dies there's a <param1>% chance he or she is <em>reconstructed</em> as youth with the same traits.\n\n<grey>Like the legend of the Phoenix, all ends with beginnings. Consciousness being an electrical charge within a specific neuron pattern, replicating it eventually comes down to data fidelity.</grey>"),
	display_name = T(6525, --[[TechPreset ProjectPhoenix display_name]] "Project Phoenix"),
	group = "Breakthroughs",
	icon = "UI/Icons/Research/project_phoenix.tga",
	id = "ProjectPhoenix",
	param1 = 50,
	param1comment = "Resurection Chance",
})

PlaceObj('TechPreset', {
	SortKey = 4,
	description = T(6528, --[[TechPreset SoylentGreen description]] 'Bodies of <em>dead Colonists</em> are converted to Food.\n\n<grey>"Soylent Green is made out of people. They are making food out of people and we know that. We are actually OK with that."</grey>'),
	display_name = T(6527, --[[TechPreset SoylentGreen display_name]] "Soylent Green"),
	group = "Breakthroughs",
	icon = "UI/Icons/Research/soylent_green.tga",
	id = "SoylentGreen",
})

PlaceObj('TechPreset', {
	SortKey = 5,
	description = T(6530, --[[TechPreset NeuralEmpathy description]] 'Unlocks <em>Rare Trait - Empath</em>. Empaths raise the Morale of all Colonists in the Dome. The effect stacks with other Empaths.\n\n<grey>"`The human brain has 100 billion neurons, each neuron connected to 10 thousand other neurons. Sitting on your shoulders is the most complicated object in the known universe."\n<right>Michio Kaku</grey><left>'),
	display_name = T(6529, --[[TechPreset NeuralEmpathy display_name]] "Neural Empathy"),
	group = "Breakthroughs",
	icon = "UI/Icons/Research/neural_empathy.tga",
	id = "NeuralEmpathy",
	param1 = 4,
	param1comment = "Number of traits below which people are made Psions upon researching",
	param2 = 3,
	param2comment = "Minimum number of new Empaths",
	param3 = 5,
	param3comment = "Maximum number of new Empaths",
	PlaceObj('Effect_UnlockTrait', {
		Trait = "Empath",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 6,
	description = T(6532, --[[TechPreset RapidSleep description]] 'Colonists need to <em>sleep</em> for only 1 hour and regain extra Sanity when sleeping.\n\n<grey>"Sleep, those little slices of death — how I loathe them." \n<right>Edgar Allan Poe</grey><left>'),
	display_name = T(6531, --[[TechPreset RapidSleep display_name]] "Rapid Sleep"),
	group = "Breakthroughs",
	icon = "UI/Icons/Research/rapid_sleep.tga",
	id = "RapidSleep",
})

PlaceObj('TechPreset', {
	SortKey = 7,
	description = T(6534, --[[TechPreset ThePositronicBrain description]] "Allows the construction of <em>Biorobots</em> in the Drone Assembler. Biorobots eat and can gain traits but can't reproduce and never die from old age.\n\n<grey>The human body is basically a complex bio machine that could be easily replicated with the exception of one major component – the brain. Now that we have finally unlocked that secret we can manufacture human-like Biorobots the same way we manufacture cars.</grey><left>"),
	display_name = T(6533, --[[TechPreset ThePositronicBrain display_name]] "The Positronic Brain"),
	group = "Breakthroughs",
	icon = "UI/Icons/Research/the_positronic_brain.tga",
	id = "ThePositronicBrain",
})

PlaceObj('TechPreset', {
	SortKey = 8,
	description = T(6535, --[[TechPreset SafeMode description]] "When a colonist suffers a Sanity breakdown, they fall asleep and wake up after <param1> hours with <param2> Sanity. Colonists can't commit suicide or gain flaws due to sanity breakdown.\n\n<grey>Failsafe systems have been in place and used to prevent catastrophes in various fields for centuries. Until now we had no viable way of remotely detecting when the brain was headed towards a meltdown. A means to remotely render people unconscious, however, was already available.</grey>"),
	display_name = T(4338, --[[TechPreset SafeMode display_name]] "Safe Mode"),
	group = "Breakthroughs",
	icon = "UI/Icons/Research/safe_mode.tga",
	id = "SafeMode",
	param1 = 6,
	param1comment = "Hours of sleep when deactivation switch gets triggered",
	param2 = 70,
	param2comment = "Percentage of maximum Sanity after sleep",
})

PlaceObj('TechPreset', {
	SortKey = 9,
	description = T(6537, --[[TechPreset HiveMind description]] 'Residents in the <em>Arcology</em> get a bonus to work performance based on the number of unique perks and specializations of colonists living in the Arcology.\n\n<grey>"The tools that a society uses to create and maintain itself are as central to human life as a hive is to bee life. Though the hive is not part of any individual bee, it is part of the colony, both shaped by and shaping the lives of its inhabitants."\n<right>Clay Shirky</grey><left>'),
	display_name = T(6536, --[[TechPreset HiveMind display_name]] "Hive Mind"),
	group = "Breakthroughs",
	icon = "UI/Icons/Research/hive_mind.tga",
	id = "HiveMind",
})

PlaceObj('TechPreset', {
	SortKey = 10,
	description = T(6539, --[[TechPreset SpaceRehabilitation description]] "Colonists have a <param1>% chance to lose a <em>flaw</em> on their journey to Mars.\n\n<grey>It is never too late to improve on oneself, and the months spent traversing the void between Mars and Earth gives ample opportunity to do so.</grey>"),
	display_name = T(6538, --[[TechPreset SpaceRehabilitation display_name]] "Space Rehabilitation"),
	group = "Breakthroughs",
	icon = "UI/Icons/Research/space_rehabilitation.tga",
	id = "SpaceRehabilitation",
	param1 = 50,
	param1comment = "Chance",
})

PlaceObj('TechPreset', {
	SortKey = 11,
	description = T(6541, --[[TechPreset WirelessPower description]] "<em>Recharge Stations</em> service Drones in a <param1> hex-range instantly.\n\n<grey>Tesla once predicted that wireless power would be obtainable anywhere on Earth, illuminating and powering vehicles in the most remote of places. Ultimately his prediction came true – he only got the planet wrong.</grey>"),
	display_name = T(6540, --[[TechPreset WirelessPower display_name]] "Wireless Power"),
	group = "Breakthroughs",
	icon = "UI/Icons/Research/wireless_power.tga",
	id = "WirelessPower",
	param1 = 3,
	param1comment = "Range",
})

PlaceObj('TechPreset', {
	SortKey = 12,
	description = T(6545, --[[TechPreset PrintedElectronics description]] "Allows <em>Drones Prefabs</em> to be constructed in the Drone Assembler using Metals instead of Electronics.\n\n<grey>Made entirely out of 2-dimensional nanomaterials, printed electronics combine effective electronic properties with low-cost production.</grey>"),
	display_name = T(6544, --[[TechPreset PrintedElectronics display_name]] "Printed Electronics"),
	group = "Breakthroughs",
	icon = "UI/Icons/Research/printed_electronics.tga",
	id = "PrintedElectronics",
})

PlaceObj('TechPreset', {
	SortKey = 13,
	description = T(6547, --[[TechPreset CoreMetals description]] "Uncovers extremely rich underground <em>Metal</em> deposits.\n\n<grey>Increased detail in reading traces of tectonic activities from eons ago has enabled us to accurately predict where to find high-grade metals deep in the crust, only relatively recently pushed up from the Martian mantle.</grey>"),
	display_name = T(6546, --[[TechPreset CoreMetals display_name]] "Core Metals"),
	group = "Breakthroughs",
	icon = "UI/Icons/Research/core_metals.tga",
	id = "CoreMetals",
	param1 = 2,
	param1comment = "min deposits",
	param2 = 4,
	param2comment = "max deposits",
	param3 = 50000,
	param3comment = "quantity",
})

PlaceObj('TechPreset', {
	SortKey = 14,
	description = T(6549, --[[TechPreset CoreWater description]] "Uncovers extremely rich underground <em>Water</em> deposits.\n\n<grey>Primordial underground lakes in the nethermost regions of Mars’s crust have been accurately hypothesized and successfully pinpointed due to advances in our understanding of the Martian geological past.</grey>"),
	display_name = T(6548, --[[TechPreset CoreWater display_name]] "Core Water"),
	group = "Breakthroughs",
	icon = "UI/Icons/Research/core_water.tga",
	id = "CoreWater",
	param1 = 2,
	param1comment = "min deposits",
	param2 = 4,
	param2comment = "max deposits",
	param3 = 500000,
	param3comment = "quantity",
})

PlaceObj('TechPreset', {
	SortKey = 15,
	description = T(6551, --[[TechPreset CoreRareMetals description]] "Uncovers extremely rich underground <em>Rare Metal</em> deposits.\n\n<grey>Applying new principles to chemical analysis of ancient crystallized magma has made it possible to locate several exceptionally potent Rare Metal veins deep underground.</grey>"),
	display_name = T(6550, --[[TechPreset CoreRareMetals display_name]] "Core Rare Metals"),
	group = "Breakthroughs",
	icon = "UI/Icons/Research/core_rare_metals.tga",
	id = "CoreRareMetals",
	param1 = 2,
	param1comment = "min deposists",
	param2 = 4,
	param2comment = "max deposits",
	param3 = 25000,
	param3comment = "quantity",
})

PlaceObj('TechPreset', {
	SortKey = 16,
	description = T(6553, --[[TechPreset SuperiorCables description]] "Instant and free <em>power cable</em> construction. Power cables do not suffer from power faults.\n\n<grey>A hydrogel of high conductivity and electrical self-healing properties, without any external stimuli and of great strength and flexibility, has been developed based on Nanostructured Conductive Polymers.</grey>"),
	display_name = T(6552, --[[TechPreset SuperiorCables display_name]] "Superior Cables"),
	group = "Breakthroughs",
	icon = "UI/Icons/Research/superior_cables.tga",
	id = "SuperiorCables",
	PlaceObj('Effect_ModifyLabel', {
		Amount = 1,
		Label = "Consts",
		Prop = "InstantCables",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 17,
	description = T(6555, --[[TechPreset SuperiorPipes description]] "Instant and free <em>pipe</em> construction. Pipes don't suffer from leaks.\n\n<grey>A pressure-induced, self-healing coating with remarkable insulation properties has been developed and field-tested to be used en masse on our pipe system.</grey>"),
	display_name = T(6554, --[[TechPreset SuperiorPipes display_name]] "Superior Pipes"),
	group = "Breakthroughs",
	icon = "UI/Icons/Research/superior_pipes.tga",
	id = "SuperiorPipes",
	PlaceObj('Effect_ModifyLabel', {
		Amount = 1,
		Label = "Consts",
		Prop = "InstantPipes",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 18,
	description = T(6557, --[[TechPreset AlienImprints description]] "Uncovers new Anomalies – <em>Alien Artifacts</em> – which provide a tech cost reduction to all fields when scanned.\n\n<grey>Hard as it is to believe, our observations suggest that intelligent life has visited Mars long ago and that remnants of these visits could still be here. These artifacts could help us improve and expand our understanding of the universe.</grey>"),
	display_name = T(6556, --[[TechPreset AlienImprints display_name]] "Alien Imprints"),
	group = "Breakthroughs",
	icon = "UI/Icons/Research/alien_imprints.tga",
	id = "AlienImprints",
	param1 = 3,
	param1comment = "min anomalies",
	param2 = 10,
	param2comment = "max anomalies",
})

PlaceObj('TechPreset', {
	SortKey = 19,
	description = T(6563, --[[TechPreset NocturnalAdaptation description]] "All colonists gain +<param2>  performance during <em>night shifts</em>\n\n<grey>The greater distance from the Sun makes it so that all colonists have to cope with the psychological strain of receiving reduced sunlight. This fact, combined with newly discovered techniques allow us to considerably boost the productivity of those who work outright nightshifts.</grey>"),
	display_name = T(6562, --[[TechPreset NocturnalAdaptation display_name]] "Nocturnal Adaptation"),
	group = "Breakthroughs",
	icon = "UI/Icons/Research/nocturnal_adaptation.tga",
	id = "NocturnalAdaptation",
	param1 = 3,
	param1comment = "target workshift",
	param2 = 20,
	param2comment = "performance mod amount",
	param3comment = "performance mod percent",
})

PlaceObj('TechPreset', {
	SortKey = 20,
	description = T(6565, --[[TechPreset GeneSelection description]] "Doubles the chance that a Colonist will have or gain a <em>rare trait</em>.\n\n<grey>Advanced and impeccably precise gene splicing instruments will now give us better control on the traits Colonists are born with on Mars.</grey>"),
	display_name = T(6564, --[[TechPreset GeneSelection display_name]] "Gene Selection"),
	group = "Breakthroughs",
	icon = "UI/Icons/Research/gene_selection.tga",
	id = "GeneSelection",
	param1 = 100,
	param1comment = "bonus chance for rare traits",
})

PlaceObj('TechPreset', {
	SortKey = 21,
	description = T(6567, --[[TechPreset MartianDiet description]] "All Colonists consume <param1>% less <em>Food</em>.\n\n<grey>Radically changing eating habits that have been in place for centuries is made quite easier after changing the planet they were evolved on in the first place.</grey>"),
	display_name = T(6566, --[[TechPreset MartianDiet display_name]] "Martian Diet"),
	group = "Breakthroughs",
	icon = "UI/Icons/Research/martian_diet.tga",
	id = "MartianDiet",
	param1 = 25,
	param1comment = "Consumption Reduction",
	PlaceObj('Effect_ModifyLabel', {
		Label = "Consts",
		Percent = -25,
		Prop = "eat_food_per_visit",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 22,
	description = T(6568, --[[TechPreset EternalFusion description]] "Fusion Reactors Upgrade (<em>Eternal Fusion</em>) - Fusion Reactors no longer require <em>workers</em> and operate at <param1> performance.\n\n<grey>Our understanding of the once holy grail of energetics - Fusion Energy has reached the level where once a fusion reaction has been triggered, it can be left to regulate and sustain itself on its own… within a confined and safe medium of course.</grey>"),
	display_name = T(5088, --[[TechPreset EternalFusion display_name]] "Eternal Fusion"),
	group = "Breakthroughs",
	icon = "UI/Icons/Research/eternal_fusion.tga",
	id = "EternalFusion",
	param1 = 150,
	param1comment = "Set Performance",
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "FusionReactor_EternalFusion",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 23,
	description = T(6570, --[[TechPreset SuperconductingComputing description]] "Converts <em>unused Power</em> into Research Points.\n\n<grey>The ultra-cold environment that is Mars, combined with several recent breakthroughs in super conductors, has made the concept of superconductor computing, while still quite costly in terms of power, now manageable, thus opening the doors to the extremely fast superconductor computers.</grey>"),
	display_name = T(6569, --[[TechPreset SuperconductingComputing display_name]] "Superconducting Computing"),
	group = "Breakthroughs",
	icon = "UI/Icons/Research/superconducting_computing.tga",
	id = "SuperconductingComputing",
	PlaceObj('Effect_ModifyLabel', {
		Amount = 16,
		Label = "Consts",
		Prop = "ElectricityForResearchPoint",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 24,
	description = T(6572, --[[TechPreset NanoRefinement description]] "All Extractors continue to extract small amounts when their <em>deposit is depleted</em>.\n\n<grey>Leaving scattered molecules of the precious resource a mining facility was tasked with extracting has always bothered scientists as being just too cynically wasteful. Luckily, with new Nano Refinement precision tools, this wasteful tendency has been remedied.</grey>"),
	display_name = T(6571, --[[TechPreset NanoRefinement display_name]] "Nano Refinement"),
	group = "Breakthroughs",
	icon = "UI/Icons/Research/nano_refinement.tga",
	id = "NanoRefinement",
})

PlaceObj('TechPreset', {
	SortKey = 25,
	description = T(6574, --[[TechPreset ArtificialMuscles description]] "Drones carry <em>two resources</em> at once.\n\n<grey>Nature has long provided inspiration for technological advances. Muscles made from carbon fiber are the latest example of cutting-edge biotech and, mixed with Mars’s low gravity, our Drones have basically doubled their carrying capacity.</grey>"),
	display_name = T(6573, --[[TechPreset ArtificialMuscles display_name]] "Artificial Muscles"),
	group = "Breakthroughs",
	icon = "UI/Icons/Research/artificial_muscles.tga",
	id = "ArtificialMuscles",
	PlaceObj('Effect_ModifyLabel', {
		Amount = 1,
		Label = "Consts",
		Prop = "DroneResourceCarryAmount",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 26,
	description = T(6576, --[[TechPreset InspiringArchitecture description]] "Colonists in Domes with a <em>Spire</em> have increased Morale.\n\n<grey>Even on the seemingly most ordinary of days, Colonists on Mars must never forget how extraordinary their lives actually are. Every time they pause from their newfound routines on this alien world and gaze upon the man-made spires that rise proudly towards the Martian sky, they will be reminded of the incredible feat their lives are part of.</grey>"),
	display_name = T(6575, --[[TechPreset InspiringArchitecture display_name]] "Inspiring Architecture"),
	group = "Breakthroughs",
	icon = "UI/Icons/Research/inspiring_architecture.tga",
	id = "InspiringArchitecture",
	param1 = 20,
})

PlaceObj('TechPreset', {
	SortKey = 27,
	description = T(6578, --[[TechPreset GiantCrops description]] "Unlocks giant crops which have an <em>increased Food output</em>.\n\n<grey>Gene editing the plant strains brought from Earth to Mars so they can better cope with some of the Martian environment’s peculiarities has allowed us to grow super-sized versions of their Earthling cousins.</grey>"),
	display_name = T(6577, --[[TechPreset GiantCrops display_name]] "Giant Crops"),
	group = "Breakthroughs",
	icon = "UI/Icons/Research/giant_crops.tga",
	id = "GiantCrops",
	PlaceObj('Effect_Code', {
		OnApplyEffect = function (self, city, parent)
UnlockCrop("Giant Leaf Crops", parent.id)
UnlockCrop("Giant Wheat Grass", parent.id)
UnlockCrop("Giant Potatoes", parent.id)
UnlockCrop("Giant Wheat", parent.id)
UnlockCrop("Giant Corn", parent.id)
UnlockCrop("Giant Rice", parent.id)
end,
		OnInitEffect = function (self, city, parent)
LockCrop("Giant Leaf Crops", parent.id)
LockCrop("Giant Wheat Grass", parent.id)
LockCrop("Giant Potatoes", parent.id)
LockCrop("Giant Wheat", parent.id)
LockCrop("Giant Corn", parent.id)
LockCrop("Giant Rice", parent.id)
end,
	}),
})

PlaceObj('TechPreset', {
	SortKey = 28,
	description = T(6580, --[[TechPreset NeoConcrete description]] "Dome <em>Concrete costs</em> reduced by <param1>%.\n\n<grey>Mixing recently discovered materials made from Martian polymers with the Martian regolith have unlocked the wonder material that is Neo-Concrete. It is vastly stronger, yet lighter than its predecessor.</grey>"),
	display_name = T(6579, --[[TechPreset NeoConcrete display_name]] "Neo-Concrete"),
	group = "Breakthroughs",
	icon = "UI/Icons/Research/neo-concrete.tga",
	id = "NeoConcrete",
	param1 = 80,
	param1comment = "Cost Reduction",
	PlaceObj('Effect_ModifyLabel', {
		Label = "Domes_Construction",
		Percent = -80,
		Prop = "construction_cost_Concrete",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 29,
	description = T(6582, --[[TechPreset AdvancedDroneDrive description]] "<em>Drones</em> move <param1>% faster.\n\n<grey>Our engineers have unveiled the first motor design to replace the old engines of our drones that were created in Earth laboratories so long ago. This time we’ve combined all that is now known from having hands-on experience in dissecting a drone that has been doing field work on Mars for quite some time.</grey>"),
	display_name = T(6581, --[[TechPreset AdvancedDroneDrive display_name]] "Advanced Drone Drive"),
	group = "Breakthroughs",
	icon = "UI/Icons/Research/advanced_drone_drive.tga",
	id = "AdvancedDroneDrive",
	param1 = 40,
	param1comment = "Speed Buff",
	PlaceObj('Effect_ModifyLabel', {
		Label = "Drone",
		Percent = 40,
		Prop = "move_speed",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 30,
	description = T(6584, --[[TechPreset DryFarming description]] "<em>Water</em> requirements of crops is reduced by <param1>%.\n\n<grey>By mixing lab-made chemicals with the Martian regolith we have created what passes for Martian soil, providing improved subsurface water retention and reducing the need for watering.</grey>"),
	display_name = T(6583, --[[TechPreset DryFarming display_name]] "Dry Farming"),
	group = "Breakthroughs",
	icon = "UI/Icons/Research/dry_farming.tga",
	id = "DryFarming",
	param1 = 50,
	param1comment = "Water requirement reduction",
	PlaceObj('Effect_ModifyLabel', {
		Label = "Farm",
		Percent = -50,
		Prop = "water_consumption",
	}),
	PlaceObj('Effect_ModifyLabel', {
		Label = "HydroponicFarm",
		Percent = -50,
		Prop = "water_consumption",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 31,
	description = T(6586, --[[TechPreset MartianSteel description]] "Lowers <em>Metals</em> costs for building construction by <param1>%.\n\n<grey>The unique composition of Martian ore has finally been thoroughly understood and new smelting techniques have been developed accordingly.</grey>"),
	display_name = T(6585, --[[TechPreset MartianSteel display_name]] "Martian Steel"),
	group = "Breakthroughs",
	icon = "UI/Icons/Research/martian_steel.tga",
	id = "MartianSteel",
	param1 = 25,
	param1comment = "Cost Reduction",
	PlaceObj('Effect_ModifyLabel', {
		Label = "Consts",
		Percent = -25,
		Prop = "Metals_cost_modifier",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 32,
	description = T(6587, --[[TechPreset VectorPump description]] "Moisture Vaporator Upgrade (<em>Vector Pump</em>) - Water production increased by 100%.\n\n<grey>A new atmosphere pump design that doubles the volume of air processed by our Vaporators in a single Sol.</grey>"),
	display_name = T(5171, --[[TechPreset VectorPump display_name]] "Vector Pump"),
	group = "Breakthroughs",
	icon = "UI/Icons/Research/vector_pump.tga",
	id = "VectorPump",
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "VectorPump",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 33,
	description = T(6588, --[[TechPreset Superfungus description]] "Fungal Farm Upgrade (<em>Superfungus</em>) - Increases production while increasing Oxygen consumption.\n\n<grey>Historically, lab mistakes involving fungi have rarely been a cause for celebration. A recent mishap in the lab seems to be an exception, as we have created a new breed of fungi which hold much promise.</grey>"),
	display_name = T(5081, --[[TechPreset Superfungus display_name]] "Superfungus"),
	group = "Breakthroughs",
	icon = "UI/Icons/Research/superfungus.tga",
	id = "Superfungus",
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "SuperfungusUpgrade",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 34,
	description = T(6590, --[[TechPreset HypersensitivePhotovoltaics description]] "<if_all(has_dlc('gagarin'),is_sponsor('SpaceY'))>Solar Arrays, </if>Solar Panels and Large Solar Panels <em>Power production</em> increased by <param1>%.\n\n<grey>An abundance of field experience has culminated in our engineers creating the perfect solar cells made specifically for the Martian atmosphere dust consistency.</grey>"),
	display_name = T(6589, --[[TechPreset HypersensitivePhotovoltaics display_name]] "Hypersensitive Photovoltaics"),
	group = "Breakthroughs",
	icon = "UI/Icons/Research/hypersensitive_photovoltaics.tga",
	id = "HypersensitivePhotovoltaics",
	param1 = 100,
	param1comment = "Production Bonus",
	PlaceObj('Effect_ModifyLabel', {
		Label = "SolarPanel",
		Percent = 100,
		Prop = "electricity_production",
	}),
	PlaceObj('Effect_ModifyLabel', {
		Label = "SolarArray",
		Percent = 100,
		Prop = "electricity_production",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 35,
	description = T(6592, --[[TechPreset FrictionlessComposites description]] "Wind Turbines <em>Power production</em> increased by <param1>%.\n\n<grey>Through clever application of graphene and carbon based frictionless materials, we have managed to maximize the push of the Martian wind while minimizing the friction which slows down the rotor’s rotation cycle, thus delivering far more bang for every buck of wind.</grey>"),
	display_name = T(6591, --[[TechPreset FrictionlessComposites display_name]] "Frictionless Composites"),
	group = "Breakthroughs",
	icon = "UI/Icons/Research/frictionless_composites.tga",
	id = "FrictionlessComposites",
	param1 = 100,
	param1comment = "Production Bonus",
	PlaceObj('Effect_ModifyLabel', {
		Label = "WindTurbine",
		Percent = 100,
		Prop = "electricity_production",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 36,
	description = T(10511, --[[TechPreset ZeroSpaceComputing description]] "<if_all(has_dlc('gagarin'),is_sponsor('ESA'))>Low-G Lab, </if>Research Lab & Hawking Institute Upgrade (<em>Zero-Space Computing</em>) - Research points production increased.\n\n<grey>Thinking outside the box, Martian mathematicians have begun developing a new mathematical apparatus which will open the doors to new scientific models and theories.</grey>"),
	display_name = T(5232, --[[TechPreset ZeroSpaceComputing display_name]] "Zero-Space Computing"),
	dlc = "gagarin",
	group = "Breakthroughs",
	icon = "UI/Icons/Research/zero-space_computing.tga",
	id = "ZeroSpaceComputing",
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "ResearchLab_ZeroSpace",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "ScienceInsitiute_ZeroSpace",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "LowGLab_ZeroSpace",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 37,
	description = T(6595, --[[TechPreset MultispiralArchitecture description]] "New Dome: <em>Oval Dome</em> (<buildinginfo('DomeOval')>) - An elongated Dome which has space for two Spires.\n\n<grey>A new, domestic approach to construction provides the same structural safety of our Domes while providing additional space for Spires.</grey>"),
	display_name = T(6594, --[[TechPreset MultispiralArchitecture display_name]] "Multispiral Architecture"),
	group = "Breakthroughs",
	icon = "UI/Icons/Research/multispiral_architecture.tga",
	id = "MultispiralArchitecture",
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "DomeOval",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 38,
	description = T(6596, --[[TechPreset MagneticExtraction description]] "Extractor Upgrade (<em>Magnetic Extraction</em>) - Production increased by <param1>%.\n\n<grey>We have progressed upon fringe mining technologies, developing safe ways to bring Magnetic Extraction to our mines on Mars.</grey>"),
	display_name = T(5030, --[[TechPreset MagneticExtraction display_name]] "Magnetic Extraction"),
	group = "Breakthroughs",
	icon = "UI/Icons/Research/magnetic_extraction.tga",
	id = "MagneticExtraction",
	param1 = 50,
	param1comment = "Production Bonus",
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "MetalsExtractor_MagneticExtraction",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "PreciousMetalsExtractor_MagneticExtraction",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "RegolithExtractor_MagneticExtraction",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "WaterExtractor_MagneticExtraction",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "AutomaticMetalsExtractor_MagneticExtraction",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "ConcretePlant_MagneticExtraction",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 39,
	description = T(6598, --[[TechPreset SustainedWorkload description]] "Doubles the performance bonus when Colonists are working on a <em>heavy workload</em>.\n\n<grey>When every citizen knows that their efficiency more or less impacts the survival chances of the entire Colony, it becomes a matter of pride to work hard.</grey>"),
	display_name = T(6597, --[[TechPreset SustainedWorkload display_name]] "Sustained Workload"),
	group = "Breakthroughs",
	icon = "UI/Icons/Research/sustainable_overtime.tga",
	id = "SustainedWorkload",
	PlaceObj('Effect_ModifyLabel', {
		Label = "Consts",
		Percent = 100,
		Prop = "OvertimedShiftPerformance",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 40,
	description = T(6600, --[[TechPreset ForeverYoung description]] "<em>Seniors</em> can work and have children.\n\n<grey>The golden years have officially been postponed indefinitely as a recent breakthrough has finally unlocked the fountain of youth. Every man and woman on Mars has now the ability to remain within their most productive and fertile age forever.</grey>"),
	display_name = T(6599, --[[TechPreset ForeverYoung display_name]] "Forever Young"),
	group = "Breakthroughs",
	icon = "UI/Icons/Research/forever_young.tga",
	id = "ForeverYoung",
})

PlaceObj('TechPreset', {
	SortKey = 41,
	description = T(6602, --[[TechPreset MartianbornIngenuity description]] "<em>Martianborn</em> gain <param1> performance.\n\n<grey>Growing up in a unique environment, combined with some creative gene therapy, makes people better problem solvers. Martianborn are brought up in a society which thrives on the idea that every extra effort counts and the smarter the effort, the better.</grey>"),
	display_name = T(6601, --[[TechPreset MartianbornIngenuity display_name]] "Martianborn Ingenuity"),
	group = "Breakthroughs",
	icon = "UI/Icons/Research/martianborn_ingenuity.tga",
	id = "MartianbornIngenuity",
	param1 = 10,
	param1comment = "Performance Bonus",
})

PlaceObj('TechPreset', {
	SortKey = 42,
	description = T(6604, --[[TechPreset CryoSleep description]] "<em>Passenger Rockets</em> carry <param1> more Colonists.\n\n<grey>Putting our Colonists in a state of suspended animation for the duration of the flight to Mars greatly reduces the space needed for a single Colonist on the rocket. Cryo-tubes will allow us to transport more Colonists on a single rocket.</grey>"),
	display_name = T(6603, --[[TechPreset CryoSleep display_name]] "Cryo-sleep"),
	group = "Breakthroughs",
	icon = "UI/Icons/Research/cryo-sleep.tga",
	id = "CryoSleep",
	param1 = 20,
	param1comment = "Passengers",
	PlaceObj('Effect_ModifyLabel', {
		Amount = 20,
		Label = "Consts",
		Prop = "MaxColonistsPerRocket",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 43,
	description = T(7916, --[[TechPreset Cloning description]] "New Spire Building: <em>Cloning Vats</em> (<buildinginfo('CloningVats')>) - creates Clones over time. Cloned colonists grow and age twice as fast.\n\n<grey>\"Clones can think creatively. You will find that they are immensely superior to drones.\"\n<right>Unnamed Martian Scientist</grey><left>"),
	display_name = T(7915, --[[TechPreset Cloning display_name]] "Cloning"),
	group = "Breakthroughs",
	icon = "UI/Icons/Research/cloning.tga",
	id = "Cloning",
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "CloningVats",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 44,
	description = T(7918, --[[TechPreset GoodVibrations description]] "<em>Domes</em> restore Sanity to their inhabitants every Sol.\n\n<grey>Who knew that emitting a low level vibration could affect the human psyche in such a way?</grey>"),
	display_name = T(7917, --[[TechPreset GoodVibrations display_name]] "Good Vibrations"),
	group = "Breakthroughs",
	icon = "UI/Icons/Research/good_vibrations.tga",
	id = "GoodVibrations",
	PlaceObj('Effect_ModifyLabel', {
		Amount = 5,
		Label = "Dome",
		Prop = "DailySanityRecoverDome",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 45,
	description = T(7920, --[[TechPreset DomeStreamlining description]] "<em>Domes</em> cost <param1>% less basic resources.\n\n<grey>Mastering of certain techniques, singled out to be crucial to the entire construction process, will result in the drop of Dome construction costs.</grey>"),
	display_name = T(7919, --[[TechPreset DomeStreamlining display_name]] "Dome Streamlining"),
	group = "Breakthroughs",
	icon = "UI/Icons/Research/dome_streamlining.tga",
	id = "DomeStreamlining",
	param1 = 50,
	param1comment = "Cost Reduction",
	PlaceObj('Effect_ModifyConstructionCost', {
		Building = "GeoscapeDome",
		Percent = -50,
		Resource = "Concrete",
	}),
	PlaceObj('Effect_ModifyConstructionCost', {
		Building = "GeoscapeDome",
		Percent = -50,
		Resource = "Metals",
	}),
	PlaceObj('Effect_ModifyLabel', {
		Label = "Domes_Construction",
		Percent = -50,
		Prop = "construction_cost_Concrete",
	}),
	PlaceObj('Effect_ModifyLabel', {
		Label = "Domes_Construction",
		Percent = -50,
		Prop = "construction_cost_Metals",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 46,
	description = T(7922, --[[TechPreset PrefabCompression description]] "All <em>Spires</em> can be ordered as prefabs from Earth.\n\n<grey>The ever-increasing miniaturization of technology along with different modules has made it possible to transport the structural behemoths known as Spires all the way from Earth.</grey>"),
	display_name = T(7921, --[[TechPreset PrefabCompression display_name]] "Prefab Compression"),
	group = "Breakthroughs",
	icon = "UI/Icons/Research/prefab_compression.tga",
	id = "PrefabCompression",
	PlaceObj('Effect_UnlockResupplyItem', {
		Item = "Arcology",
	}),
	PlaceObj('Effect_UnlockResupplyItem', {
		Item = "WaterReclamationSystem",
	}),
	PlaceObj('Effect_UnlockResupplyItem', {
		Item = "Sanatorium",
	}),
	PlaceObj('Effect_UnlockResupplyItem', {
		Item = "NetworkNode",
	}),
	PlaceObj('Effect_UnlockResupplyItem', {
		Item = "MedicalCenter",
	}),
	PlaceObj('Effect_UnlockResupplyItem', {
		Item = "HangingGardens",
	}),
	PlaceObj('Effect_UnlockResupplyItem', {
		Item = "Temple",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 47,
	description = T(7924, --[[TechPreset ExtractorAI description]] "<em>Metals Extractors</em> and <em>Rare Metals Extractors</em> can work without crews at <param1> performance.\n\n<grey>Extracting algorithms have been successfully implemented by our new Extractor AI, allowing for a certain degree of autonomy in mining operations.</grey>"),
	display_name = T(7923, --[[TechPreset ExtractorAI display_name]] "Extractor AI"),
	group = "Breakthroughs",
	icon = "UI/Icons/Research/extractor_ai.tga",
	id = "ExtractorAI",
	param1 = 50,
	param1comment = "Set Performance",
	PlaceObj('Effect_ModifyLabel', {
		Amount = 1,
		Label = "MetalsExtractor",
		Prop = "automation",
	}),
	PlaceObj('Effect_ModifyLabel', {
		Amount = 50,
		Label = "MetalsExtractor",
		Prop = "auto_performance",
	}),
	PlaceObj('Effect_ModifyLabel', {
		Amount = 1,
		Label = "PreciousMetalsExtractor",
		Prop = "automation",
	}),
	PlaceObj('Effect_ModifyLabel', {
		Amount = 50,
		Label = "PreciousMetalsExtractor",
		Prop = "auto_performance",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 48,
	description = T(7925, --[[TechPreset ServiceBots description]] "<em>Non-medical Service Buildings</em> Upgrade (Service Bots) - service buildings no longer require workers and operate at <param1> performance.\n\n<grey>Freeing our colonists of dealing with the most mundane of chores.</grey>"),
	display_name = T(5020, --[[TechPreset ServiceBots display_name]] "Service Bots"),
	group = "Breakthroughs",
	icon = "UI/Icons/Research/service_bots.tga",
	id = "ServiceBots",
	param1 = 100,
	param1comment = "Set Performance",
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "Casino_ServiceBots",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "Diner_ServiceBots",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "Spacebar_ServiceBots",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "SpacebarSmall_ServiceBots",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "ShopElectronics_ServiceBots",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "ShopFood_ServiceBots",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "ShopFoodSmall_ServiceBots",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "ShopJewelry_ServiceBots",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "ShopJewelrySmall_ServiceBots",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "MegaMall_ServiceBots",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 49,
	description = T(7927, --[[TechPreset OverchargeAmplification description]] '<em>Amplify</em> upgrades grant a bigger boost to production.\n\n<grey>"Power! Unlimited Power!"\n<right>Sheev</grey><left>'),
	display_name = T(7926, --[[TechPreset OverchargeAmplification display_name]] "Overcharge Amplifications"),
	dlc = "gagarin",
	group = "Breakthroughs",
	icon = "UI/Icons/Research/overcharge_amplifications.tga",
	id = "OverchargeAmplification",
	PlaceObj('Effect_ModifyUpgrade', {
		Percent = 20,
		Prop = "production_per_day1",
		Upgrade = "FuelFactory_Amplify",
	}),
	PlaceObj('Effect_ModifyUpgrade', {
		Percent = 20,
		Prop = "production_per_day1",
		Upgrade = "MachinePartsFactory_Amplify",
	}),
	PlaceObj('Effect_ModifyUpgrade', {
		Percent = 20,
		Prop = "production_per_day1",
		Upgrade = "MachinePartsFactorySmall_Amplify",
	}),
	PlaceObj('Effect_ModifyUpgrade', {
		Percent = 20,
		Prop = "production_per_day1",
		Upgrade = "MetalsExtractor_Amplify",
	}),
	PlaceObj('Effect_ModifyUpgrade', {
		Percent = 20,
		Prop = "production_per_day1",
		Upgrade = "PolymerPlant_Amplify",
	}),
	PlaceObj('Effect_ModifyUpgrade', {
		Percent = 20,
		Prop = "production_per_day1",
		Upgrade = "PreciousMetalsExtractor_Amplify",
	}),
	PlaceObj('Effect_ModifyUpgrade', {
		Percent = 20,
		Prop = "production_per_day1",
		Upgrade = "RegolithExtractor_Amplify",
	}),
	PlaceObj('Effect_ModifyUpgrade', {
		Percent = 20,
		Prop = "production_per_day1",
		Upgrade = "ElectronicsFactory_Amplify",
	}),
	PlaceObj('Effect_ModifyUpgrade', {
		Percent = 20,
		Prop = "production_per_day1",
		Upgrade = "ElectronicsFactorySmall_Amplify",
	}),
	PlaceObj('Effect_ModifyUpgrade', {
		Percent = 20,
		Prop = "ResearchPointsPerDay",
		Upgrade = "ResearchLab_Amplify",
	}),
	PlaceObj('Effect_ModifyUpgrade', {
		Percent = 20,
		Prop = "ResearchPointsPerDay",
		Upgrade = "ScienceInstitute_Amplify",
	}),
	PlaceObj('Effect_ModifyUpgrade', {
		Percent = 20,
		Prop = "water_production",
		Upgrade = "WaterExtractor_Amplify",
	}),
	PlaceObj('Effect_ModifyUpgrade', {
		Percent = 20,
		Prop = "performance",
		Upgrade = "NetworkNode_Amplify",
	}),
	PlaceObj('Effect_ModifyUpgrade', {
		Percent = 20,
		Prop = "production_per_day1",
		Upgrade = "AutomaticMetalsExtractor_Amplify",
	}),
	PlaceObj('Effect_ModifyUpgrade', {
		Percent = 20,
		Prop = "production_per_day1",
		Upgrade = "ConcretePlant_Amplify",
	}),
	PlaceObj('Effect_ModifyUpgrade', {
		Percent = 20,
		Prop = "ResearchPointsPerDay",
		Upgrade = "LowGLab_Amplify",
	}),
	PlaceObj('Effect_ModifyUpgrade', {
		Percent = 20,
		Prop = "production_per_day1",
		Upgrade = "MetalsRefinery_Amplify",
	}),
	PlaceObj('Effect_ModifyUpgrade', {
		Percent = 20,
		Prop = "production_per_day",
		Upgrade = "RareMetalsRefinery_Amplify",
	}),
	PlaceObj('Effect_ModifyUpgrade', {
		Percent = 20,
		Prop = "production_per_day",
		Upgrade = "WasteRockProcessor_Amplify",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 50,
	description = T(7929, --[[TechPreset PlutoniumSynthesis description]] 'Stirling Generator Upgrade (<em>Plutonium Core</em>) - Increased Power production while opened.\n\n<grey>"Nor are we the culmination of evolution, except in the sense that there has never been another species so bizarrely ingenious that it could create both iambic pentameter and plutonium."\n<right>David Quammen</grey><left>'),
	display_name = T(7928, --[[TechPreset PlutoniumSynthesis display_name]] "Plutonium Synthesis"),
	group = "Breakthroughs",
	icon = "UI/Icons/Research/plutonium_synthesis.tga",
	id = "PlutoniumSynthesis",
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "StirlingGenerator_PlutoniumCore",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "AdvancedStirlingGenerator_PlutoniumCore",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 51,
	description = T(7931, --[[TechPreset InterplanetaryLearning description]] "<em>Schools</em> can train the Workaholic and Hippie traits.\n\n<grey>Taking student exchange programs to a whole other level.</grey>"),
	display_name = T(7930, --[[TechPreset InterplanetaryLearning display_name]] "Interplanetary Learning"),
	group = "Breakthroughs",
	icon = "UI/Icons/Research/interplanetary_learning.tga",
	id = "InterplanetaryLearning",
})

PlaceObj('TechPreset', {
	SortKey = 52,
	description = T(7933, --[[TechPreset Vocation-Oriented Society description]] '<em>Colonists</em> gain <param1> bonus work performance when all their stats are in the green.\n\n<grey>"Frankly, though, I think most people can learn a lot more than they think they can."\n<right>Elon Musk</grey><left>'),
	display_name = T(7932, --[[TechPreset Vocation-Oriented Society display_name]] "Vocation-Oriented Society"),
	group = "Breakthroughs",
	icon = "UI/Icons/Research/vocation-oriented_society.tga",
	id = "Vocation-Oriented Society",
	param1 = 10,
	param1comment = "Performance Bonus",
})

PlaceObj('TechPreset', {
	SortKey = 53,
	description = T(8004, --[[TechPreset PlasmaRocket description]] "Rocket <em>travel time</em> to and from Earth reduced by <param1>%.\n\n<grey>Plasma engines have numerous advantages over chemical rockets. All that is left to do is make sure they don't explode on launch.</grey>"),
	display_name = T(8003, --[[TechPreset PlasmaRocket display_name]] "Plasma Rocket"),
	group = "Breakthroughs",
	icon = "UI/Icons/Research/plasma_rocket.tga",
	id = "PlasmaRocket",
	param1 = 50,
	param1comment = "Travel time reduction",
	PlaceObj('Effect_ModifyLabel', {
		Label = "Consts",
		Percent = -50,
		Prop = "TravelTimeEarthMars",
	}),
	PlaceObj('Effect_ModifyLabel', {
		Label = "Consts",
		Percent = -50,
		Prop = "TravelTimeMarsEarth",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 54,
	description = T(8006, --[[TechPreset AutonomousHubs description]] "<em>Drone Hubs</em> no longer require Power or maintenance.\n\n<grey>Self-sustainable Drone Hubs are of paramount importance in expanding our presence on Mars.</grey>"),
	display_name = T(8005, --[[TechPreset AutonomousHubs display_name]] "Autonomous Hubs"),
	group = "Breakthroughs",
	icon = "UI/Icons/Research/autonomous_hubs.tga",
	id = "AutonomousHubs",
	PlaceObj('Effect_ModifyLabel', {
		Amount = 1,
		Label = "DroneHub",
		Prop = "disable_electricity_consumption",
	}),
	PlaceObj('Effect_ModifyLabel', {
		Amount = 1,
		Label = "DroneHub",
		Prop = "disable_maintenance",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 55,
	description = T(8642, --[[TechPreset FactoryAutomation description]] "Factory Upgrade (<em>Automation</em>) - Lowers the amount of Workers needed in factories.\n\n<grey>Robots are poised to take our jobs here on Mars as well.</grey>"),
	display_name = T(8641, --[[TechPreset FactoryAutomation display_name]] "Factory Automation"),
	group = "Breakthroughs",
	icon = "UI/Icons/Research/factory_automation.tga",
	id = "FactoryAutomation",
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "ElectronicsFactory_Automation",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "ElectronicsFactorySmall_Automation",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "PolymerPlant_Automation",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "MachinePartsFactory_Automation",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "MachinePartsFactorySmall_Automation",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 56,
	description = T(203426379406, --[[TechPreset GemArchitecture description]] "New Dome: <em>Diamond Dome</em> (<buildinginfo('DomeDiamond')>) - A diamond shaped Dome which has space for two Spires.\n\n<grey>\"Diamonds are nothing more than chunks of coal that stuck to their jobs.\"\n<right>Malcolm Forbes</grey><left>\n"),
	display_name = T(9602, --[[TechPreset GemArchitecture display_name]] "Gem Architecture"),
	group = "Breakthroughs",
	icon = "UI/Icons/Research/gem_architecture.tga",
	id = "GemArchitecture",
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "DomeDiamond",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 1,
	description = T(6360, --[[TechPreset FuelCompression description]] "<em>Rocket</em> Cargo Space increased by <param1> kg.\n\n<grey>The fuel section is by far the largest and, when full, the heaviest part of any rocket. This makes developing more compressed fuels especially important when striving to bring more to Mars with fewer rockets.</grey>"),
	display_name = T(6359, --[[TechPreset FuelCompression display_name]] "Fuel Compression"),
	group = "Engineering",
	icon = "UI/Icons/Research/fuel_compression.tga",
	id = "FuelCompression",
	param1 = 10000,
	param1comment = "Cargo Bonus",
	position = range(1, 5),
	PlaceObj('Effect_ModifyLabel', {
		Amount = 10000,
		Label = "Consts",
		Prop = "CargoCapacity",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 2,
	description = T(6362, --[[TechPreset DecommissionProtocol description]] "Allows the clearing of <em>salvaged</em> and <em>destroyed buildings.</em>\n\n<grey>We have reached the point where we must do away with old buildings on Mars to make way for new ones.</grey>"),
	display_name = T(6361, --[[TechPreset DecommissionProtocol display_name]] "Decommission Protocol"),
	group = "Engineering",
	icon = "UI/Icons/Research/decommission_protocol.tga",
	id = "DecommissionProtocol",
	position = range(1, 5),
})

PlaceObj('TechPreset', {
	SortKey = 3,
	description = T(6364, --[[TechPreset LowGHydrosynthsis description]] "New Building: <em>Polymer Factory</em> (<buildinginfo('PolymerPlant')>) - Produces Polymers from Water and Fuel.\nNew Building: <em>Fuel Refinery</em> (<buildinginfo('FuelFactory')>)  - Produces Fuel from Water.\n\n<grey>Resolving the obvious problems with water pressure in Low-G environments will allow for more complex hydro-synthetic procedures to be done on-site on Mars.</grey>"),
	display_name = T(6363, --[[TechPreset LowGHydrosynthsis display_name]] "Low-G Hydrosynthesis"),
	group = "Engineering",
	icon = "UI/Icons/Research/low-g_hydrosynthesis.tga",
	id = "LowGHydrosynthsis",
	position = range(1, 5),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "PolymerPlant",
	}),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "FuelFactory",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 4,
	description = T(6366, --[[TechPreset AdvancedMartianEngines description]] "<em>Rockets</em> and <em>Shuttles</em> require less Fuel.\n\n<grey>The scarcity of Martian-made rocket fuel options has made for our first true contribution towards rocket engine efficiency.</grey>"),
	display_name = T(6365, --[[TechPreset AdvancedMartianEngines display_name]] "Advanced Martian Engines"),
	group = "Engineering",
	icon = "UI/Icons/Research/advanced_martian_engines.tga",
	id = "AdvancedMartianEngines",
	position = range(1, 5),
	PlaceObj('Effect_ModifyLabel', {
		Amount = -20,
		Label = "AllRockets",
		Prop = "launch_fuel",
	}),
	PlaceObj('Effect_ModifyLabel', {
		Label = "ShuttleHub",
		Percent = -25,
		Prop = "consumption_amount",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 5,
	description = T(6368, --[[TechPreset LowGHighrise description]] "New Building: <em>Apartments</em> (<buildinginfo('Apartments')>) - A Residential Building that houses many Colonists.\n\n<grey>\"I suggest that going to Mars means permanence on the planet - a mission by which we are building up a confidence level to become a two-planet species.\"\n<right>Buzz Aldrin</grey><left>"),
	display_name = T(6367, --[[TechPreset LowGHighrise display_name]] "Low-G High-rise"),
	group = "Engineering",
	icon = "UI/Icons/Research/advanced_prefabs.tga",
	id = "LowGHighrise",
	position = range(1, 5),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "Apartments",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 6,
	description = T(6372, --[[TechPreset CompactPassengerModule description]] "<em>Passenger Rockets</em> carry <param1> more Colonists.\n\n<grey>Better design patterns and lighter, tougher materials have all contributed to a more advanced and compact rocket passenger module.</grey>"),
	display_name = T(6371, --[[TechPreset CompactPassengerModule display_name]] "Compact Passenger Module"),
	group = "Engineering",
	icon = "UI/Icons/Research/compact_passenger_module.tga",
	id = "CompactPassengerModule",
	param1 = 10,
	param1comment = "Extra Colonists",
	position = range(6, 12),
	PlaceObj('Effect_ModifyLabel', {
		Amount = 10,
		Label = "Consts",
		Prop = "MaxColonistsPerRocket",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 7,
	description = T(8000, --[[TechPreset StorageCompression description]] "Water, Oxygen and Power <em>storage</em> capacity expanded by <param1>%.\n\n<grey>Life support reserves are essential for the survival of the Colony. Fortunately, a new method of compressing fluids in low-gravity environments can help us increase our reserve capacity greatly.</grey>"),
	display_name = T(7999, --[[TechPreset StorageCompression display_name]] "Storage Compression"),
	group = "Engineering",
	icon = "UI/Icons/Research/storage_compression.tga",
	id = "StorageCompression",
	param1 = 50,
	param1comment = "Expanded Capacity %",
	position = range(6, 12),
	PlaceObj('Effect_ModifyLabel', {
		Label = "WaterTank",
		Percent = 50,
		Prop = "water_capacity",
	}),
	PlaceObj('Effect_ModifyLabel', {
		Label = "OxygenTank",
		Percent = 50,
		Prop = "air_capacity",
	}),
	PlaceObj('Effect_ModifyLabel', {
		Label = "OxygenTank_Large",
		Percent = 50,
		Prop = "air_capacity",
	}),
	PlaceObj('Effect_ModifyLabel', {
		Label = "Battery_WaterFuelCell",
		Percent = 50,
		Prop = "capacity",
	}),
	PlaceObj('Effect_ModifyLabel', {
		Label = "AtomicBattery",
		Percent = 50,
		Prop = "capacity",
	}),
	PlaceObj('Effect_ModifyLabel', {
		Label = "LargeWaterTank",
		Percent = 50,
		Prop = "water_capacity",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 8,
	description = T(6374, --[[TechPreset LowGEngineering description]] "New Dome: <em>Medium</em> (<buildinginfo('DomeMedium')>) - A medium-sized Dome.\nNew Dome: <em>Trigon</em> (<buildinginfo('DomeTrigon')>) - A triangle base Dome.\n\n<grey>Gaining experience in actually building constructions on Mars rather than just hypothesizing has vastly advanced our off-Earth architectural capabilities.</grey>"),
	display_name = T(6373, --[[TechPreset LowGEngineering display_name]] "Low-G Engineering"),
	group = "Engineering",
	icon = "UI/Icons/Research/low-g_engineering.tga",
	id = "LowGEngineering",
	position = range(6, 12),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "DomeTrigon",
	}),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "DomeMedium",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 9,
	description = T(6376, --[[TechPreset SustainableArchitecture description]] '<em>In-Dome buildings</em> require maintenance less often.\n\n<grey>Shifting focus away from "fixing it" to "avoiding it" is the natural step forward for any Martian habitat.</grey>'),
	display_name = T(6375, --[[TechPreset SustainableArchitecture display_name]] "Sustainable Architecture"),
	group = "Engineering",
	icon = "UI/Icons/Research/sustainable_architecture.tga",
	id = "SustainableArchitecture",
	position = range(6, 12),
	PlaceObj('Effect_ModifyLabel', {
		Label = "InsideBuildings",
		Percent = 20,
		Prop = "maintenance_threshold_base",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 10,
	description = T(6377, --[[TechPreset SmartHome description]] "New Buildings: <em>Smart Homes</em> (<buildinginfo('SmartHome_Small')>)  & <em>Smart Complex</em> (<buildinginfo('SmartHome')>) - Provides a very comfortable living space for Colonists. Residents will recover Sanity when resting.\n\n<grey>Perfecting the Martian household - for a better life beyond Earth.</grey>"),
	display_name = T(3533, --[[TechPreset SmartHome display_name]] "Smart Home"),
	group = "Engineering",
	icon = "UI/Icons/Research/smart_home.tga",
	id = "SmartHome",
	position = range(6, 12),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "SmartHome",
	}),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "SmartHome_Small",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 11,
	description = T(8638, --[[TechPreset MicroManufacturing description]] "New Building: <em>Electronics Factory</em> (<buildinginfo('ElectronicsFactory')>) - Produces Electronics from Rare Metals.\n\n<grey>\"In the end, I hope there's a little note somewhere that says I designed a good computer.\"\n<right>Steve Wozniak</grey><left>"),
	display_name = T(8637, --[[TechPreset MicroManufacturing display_name]] "Micro Manufacturing"),
	group = "Engineering",
	icon = "UI/Icons/Research/micro_manufacturing.tga",
	id = "MicroManufacturing",
	position = range(6, 12),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "ElectronicsFactory",
	}),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "ElectronicsFactory_Small",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 12,
	description = T(8861, --[[TechPreset MegaStorage description]] "New Building: <em>Large Water Tank</em> (<buildinginfo('LargeWaterTank')>) - stores very large amounts of water.\n<if(has_dlc('contentpack3'))>New Building: <em>Large Oxygen Tank</em> (<buildinginfo('OxygenTank_Large')>) - stores very large amounts of oxygen.</if>\n\n<grey>\"If there's magic on this planet, it is contained in water.\"\n<right>Loren Eiseley</grey><left>"),
	display_name = T(8860, --[[TechPreset MegaStorage display_name]] "Mega Storage"),
	group = "Engineering",
	icon = "UI/Icons/Research/mega_storage.tga",
	id = "MegaStorage",
	position = range(6, 12),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "LargeWaterTank",
	}),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "OxygenTank_Large",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 13,
	description = T(6378, --[[TechPreset Arcology description]] "New Spire Building: <em>Arcology</em> (<buildinginfo('Arcology')>) - provides comfortable living space for many colonists.\n\n<grey>Martian settlements are becoming less just mere shelters and more of fully fledged cities –cities with unique vibes and even architecture.</grey>"),
	display_name = T(3534, --[[TechPreset Arcology display_name]] "Arcology"),
	group = "Engineering",
	icon = "UI/Icons/Research/arcology.tga",
	id = "Arcology",
	position = range(13, 13),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "Arcology",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 14,
	description = T(6380, --[[TechPreset MarsNoveau description]] "Building construction costs in <em>Metals & Concrete</em> reduced by <param1>% (excluding Domes).\n\n<grey>A mix of off-world pride, a unique and ambitious style, and inspired creativity has resulted in more efficient structural design.</grey>"),
	display_name = T(6379, --[[TechPreset MarsNoveau display_name]] "Mars Nouveau"),
	group = "Engineering",
	icon = "UI/Icons/Research/mars_nouveau.tga",
	id = "MarsNoveau",
	param1 = 20,
	param1comment = "Cost Reduction %",
	position = range(14, 19),
	PlaceObj('Effect_ModifyLabel', {
		Label = "InsideBuildings_Construction",
		Percent = -20,
		Prop = "construction_cost_Concrete",
	}),
	PlaceObj('Effect_ModifyLabel', {
		Label = "InsideBuildings_Construction",
		Percent = -20,
		Prop = "construction_cost_Metals",
	}),
	PlaceObj('Effect_ModifyLabel', {
		Label = "Decorations_Construction",
		Percent = -20,
		Prop = "construction_cost_Concrete",
	}),
	PlaceObj('Effect_ModifyLabel', {
		Label = "Decorations_Construction",
		Percent = -20,
		Prop = "construction_cost_Metals",
	}),
	PlaceObj('Effect_ModifyLabel', {
		Label = "OutsideBuildings_Construction",
		Percent = -20,
		Prop = "construction_cost_Concrete",
	}),
	PlaceObj('Effect_ModifyLabel', {
		Label = "OutsideBuildings_Construction",
		Percent = -20,
		Prop = "construction_cost_Metals",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 15,
	description = T(6382, --[[TechPreset ResilientArchitecture description]] "<em>Out-Dome buildings</em> require maintenance less often.\n\n<grey>There is a difference between knowing that conditions on Mars will take a heavy toll on man-made buildings and actually experiencing and fixing the damage done. The latter paints a better picture for improvement.</grey>"),
	display_name = T(6381, --[[TechPreset ResilientArchitecture display_name]] "Resilient Architecture"),
	group = "Engineering",
	icon = "UI/Icons/Research/resilient_architecture.tga",
	id = "ResilientArchitecture",
	position = range(14, 19),
	PlaceObj('Effect_ModifyLabel', {
		Label = "OutsideBuildings",
		Percent = 20,
		Prop = "maintenance_threshold_base",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 16,
	description = T(6384, --[[TechPreset AdvancedPassengerModule description]] "<em>Passenger Rockets</em> carry <param1> more Colonists.\n\n<grey>Cutting edge methods in space optimization and Comfort-centric designs make for a more practical Passenger Module.</grey>"),
	display_name = T(6383, --[[TechPreset AdvancedPassengerModule display_name]] "Advanced Passenger Module"),
	group = "Engineering",
	icon = "UI/Icons/Research/advanced_passenger_module.tga",
	id = "AdvancedPassengerModule",
	param1 = 10,
	param1comment = "Extra Colonists",
	position = range(14, 19),
	PlaceObj('Effect_ModifyLabel', {
		Amount = 10,
		Label = "Consts",
		Prop = "MaxColonistsPerRocket",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 17,
	description = T(6386, --[[TechPreset GravityEngineering description]] "New Dome: <em>Mega</em> (<buildinginfo('DomeMega')>) - The most advanced and spacious Dome design.\nNew Dome: <em>Mega Trigon</em> (<buildinginfo('DomeMegaTrigon')>) - A bigger triangle Dome.\n\n<grey>We have reached a proficiency in engineering that surpasses the most ambitious architectural achievements on Earth.</grey>"),
	display_name = T(6385, --[[TechPreset GravityEngineering display_name]] "Gravity Engineering"),
	group = "Engineering",
	icon = "UI/Icons/Research/gravity_engineering.tga",
	id = "GravityEngineering",
	position = range(14, 19),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "DomeMegaTrigon",
	}),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "DomeMega",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 18,
	description = T(6390, --[[TechPreset PlasmaCutters description]] "<em>Rare Metals Extractor</em> production increased by <param1>%.\n\n<grey>Introducing state of the art plasma torches to our Rare Metals Extractors show a great promise for boosts in production.</grey>"),
	display_name = T(6389, --[[TechPreset PlasmaCutters display_name]] "Plasma Cutters"),
	group = "Engineering",
	icon = "UI/Icons/Research/plasma_cutters.tga",
	id = "PlasmaCutters",
	param1 = 50,
	param1comment = "Bonus Production %",
	position = range(14, 19),
	PlaceObj('Effect_ModifyLabel', {
		Label = "PreciousMetalsExtractor",
		Percent = 50,
		Prop = "production_per_day1",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 19,
	description = T(7671, --[[TechPreset WasteRockLiquefaction description]] "New Building: <em>Waste Rock Processor</em> (<buildinginfo('WasteRockProcessor')>) - slowly converts Waste Rock into Concrete.\n\n<grey>The utilization of lots of waste rock by reprocessing it into becoming concrete-grade regolith as part of our \"Nothing Is Wasted\" efficiency policy.</grey>"),
	display_name = T(6393, --[[TechPreset WasteRockLiquefaction display_name]] "Waste Rock Liquefaction"),
	group = "Engineering",
	icon = "UI/Icons/Research/waste_rock_liquefaction.tga",
	id = "WasteRockLiquefaction",
	position = range(14, 19),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "WasteRockProcessor",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 20,
	description = T(6396, --[[TechPreset OrbitalEngineering description]] "Wonder: <em>Space Elevator</em> (<buildinginfo('SpaceElevator')>) - Exports Rare Metals to Earth and offers resupply materials and prefabs at preferential prices.\n\n<grey>\"The space elevator will be built about 50 years after everyone stops laughing.\"\n<right>Arthur C. Clarke</grey><left>"),
	display_name = T(6395, --[[TechPreset OrbitalEngineering display_name]] "Orbital Engineering"),
	group = "Engineering",
	icon = "UI/Icons/Research/orbital_engineering.tga",
	id = "OrbitalEngineering",
	position = range(20, 20),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "SpaceElevator",
		HideBuilding = true,
	}),
})

PlaceObj('TechPreset', {
	SortKey = 1,
	description = T(6609, --[[TechPreset BlackCubesDisposal description]] 'A "surface scratcher" step towards understanding the elusive chemical properties of the mystery Cubes, what dangers the Cubes might pose and how to manage them.'),
	display_name = T(6608, --[[TechPreset BlackCubesDisposal display_name]] "Dark Spectrometry"),
	group = "Mysteries",
	icon = "UI/Icons/Research/dark_spectrometry.tga",
	id = "BlackCubesDisposal",
	mystery = "BlackCubeMystery",
	position = range(0, 2),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "BlackCubeDump",
		HideBuilding = true,
	}),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "BlackCubeSmallMonument",
		HideBuilding = true,
	}),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "BlackCubeLargeMonument",
		HideBuilding = true,
	}),
})

PlaceObj('TechPreset', {
	SortKey = 2,
	description = T(6611, --[[TechPreset BlackCubesNegation description]] "The Spontaneous High-Energy Particle Interception and Deflection technology allows our Sensor Towers to detect and guide the materialization of a Black Cube to a safe location."),
	display_name = T(6610, --[[TechPreset BlackCubesNegation display_name]] "S.H.E.P.I.D."),
	group = "Mysteries",
	icon = "UI/Icons/Research/s.h.e.p.i.g..tga",
	id = "BlackCubesNegation",
	mystery = "BlackCubeMystery",
	position = range(0, 2),
	PlaceObj('Effect_Code', {
		OnApplyEffect = function (self, city, parent)
g_BCHexRangeEnable.SensorTower = true
end,
	}),
})

PlaceObj('TechPreset', {
	SortKey = 3,
	description = T(6613, --[[TechPreset AlienDiggersDestruction description]] "Aims to find a way to capture and dismantle an alien Dredger by studying its structure and physical properties."),
	display_name = T(6612, --[[TechPreset AlienDiggersDestruction display_name]] "Dredger Morphology"),
	group = "Mysteries",
	icon = "UI/Icons/Research/digger_morphology.tga",
	id = "AlienDiggersDestruction",
	mystery = "DiggersMystery",
	position = range(0, 2),
})

PlaceObj('TechPreset', {
	SortKey = 4,
	description = T(6615, --[[TechPreset AlienDiggersDetection description]] "An attempt to decode the transmissions sent out by Dredgers in order to predict their behavior and landing sites."),
	display_name = T(6614, --[[TechPreset AlienDiggersDetection display_name]] "Dredger Wavelength Decoding"),
	group = "Mysteries",
	icon = "UI/Icons/Research/digger_wavelength_decoding.tga",
	id = "AlienDiggersDetection",
	mystery = "DiggersMystery",
	position = range(0, 2),
})

PlaceObj('TechPreset', {
	SortKey = 5,
	description = T(6617, --[[TechPreset XenoExtraction description]] "Water Extractor, Concrete Extractor, Metals Extractor and Rare Metals Extractor gain +<param1>% bonus production.\n\n<grey>Studying the behavior and structure of the Dredgers, our scientists are able to develop revolutionary advancements in mining equipment and archaeological survey</grey>\n\n"),
	display_name = T(6616, --[[TechPreset XenoExtraction display_name]] "Xeno-Extraction"),
	group = "Mysteries",
	icon = "UI/Icons/Research/xeno_extraction.tga",
	id = "XenoExtraction",
	mystery = "DiggersMystery",
	param1 = 50,
	param1comment = "Bonus Production",
	position = range(0, 2),
	PlaceObj('Effect_ModifyLabel', {
		Label = "WaterExtractor",
		Percent = 50,
		Prop = "water_production",
	}),
	PlaceObj('Effect_ModifyLabel', {
		Label = "MetalsExtractor",
		Percent = 50,
		Prop = "production_per_day1",
	}),
	PlaceObj('Effect_ModifyLabel', {
		Label = "PreciousMetalsExtractor",
		Percent = 50,
		Prop = "production_per_day1",
	}),
	PlaceObj('Effect_ModifyLabel', {
		Label = "RegolithExtractor",
		Percent = 50,
		Prop = "production_per_day1",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 6,
	description = T(6619, --[[TechPreset Purpose of the Spheres description]] "Decoy Building that keeps single Spheres into captivity.\n\n<grey>A theory on the purpose of the Spheres, how they navigate and how to contain the threat that they represent.</grey> \n\n"),
	display_name = T(6618, --[[TechPreset Purpose of the Spheres display_name]] "Purpose of the Spheres"),
	group = "Mysteries",
	icon = "UI/Icons/Research/purpose_of_the_spheres.tga",
	id = "Purpose of the Spheres",
	mystery = "MirrorSphereMystery",
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "PowerDecoy",
		HideBuilding = true,
	}),
})

PlaceObj('TechPreset', {
	SortKey = 7,
	description = T(6621, --[[TechPreset Anti-Sphere Shield description]] "A way to immunize our colonists from the negative health effects of the Mirror Spheres.\n"),
	display_name = T(6620, --[[TechPreset Anti-Sphere Shield display_name]] "Sphere Protection"),
	group = "Mysteries",
	icon = "UI/Icons/Research/anti_sphere_shield.tga",
	id = "Anti-Sphere Shield",
	mystery = "MirrorSphereMystery",
})

PlaceObj('TechPreset', {
	SortKey = 8,
	description = T(6623, --[[TechPreset Xeno-Terraforming description]] "Mirror Spheres in captivity may be broken down to their building parts.\n\n<grey>An attempt at understanding the climate changing devices that are the Mirror Spheres.</grey>\n\n"),
	display_name = T(6622, --[[TechPreset Xeno-Terraforming display_name]] "Xeno-Terraforming"),
	group = "Mysteries",
	icon = "UI/Icons/Research/xeno_terraforming.tga",
	id = "Xeno-Terraforming",
	mystery = "MirrorSphereMystery",
})

PlaceObj('TechPreset', {
	SortKey = 9,
	description = T(7299, --[[TechPreset DreamSimulation description]] "Push to decipher the Dreamers’ brain patterns while in trance."),
	display_name = T(6624, --[[TechPreset DreamSimulation display_name]] "Dream Simulation"),
	group = "Mysteries",
	icon = "UI/Icons/Research/dream_simulation.tga",
	id = "DreamSimulation",
	mystery = "DreamMystery",
})

PlaceObj('TechPreset', {
	SortKey = 10,
	description = T(7300, --[[TechPreset NumberSixTracing description]] "Track down Number Six's physical location."),
	display_name = T(6625, --[[TechPreset NumberSixTracing display_name]] "Number Six Tracing"),
	group = "Mysteries",
	icon = "UI/Icons/Research/number_six_tracing.tga",
	id = "NumberSixTracing",
	mystery = "AIUprisingMystery",
})

PlaceObj('TechPreset', {
	SortKey = 11,
	description = T(7302, --[[TechPreset DefenseTower description]] "A stationary turret that protects the nearby area from hostile vehicles and incoming meteors."),
	display_name = T(7301, --[[TechPreset DefenseTower display_name]] "Defence Turret"),
	group = "Mysteries",
	icon = "UI/Icons/Research/defense_turret.tga",
	id = "DefenseTower",
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "DefenceTower",
		HideBuilding = true,
	}),
})

PlaceObj('TechPreset', {
	SortKey = 12,
	description = T(8451, --[[TechPreset SolExploration description]] 'Focus your research to help the development of the Beyond Earth Initiative projects. Each time the research is completed you can refocus your research towards a new project.\n\nThis tech is <em>repeatable</em> and can be researched multiple times.\n\n<grey>"The human race is a remarkable creature, one with great potential which I hope the Beyond Earth initiative will display for all to believe in."\n<right>Rede Goddenberry<left></grey>'),
	display_name = T(8450, --[[TechPreset SolExploration display_name]] "Beyond Earth Initiative"),
	group = "Mysteries",
	icon = "UI/Icons/Research/solar_exploration.tga",
	id = "SolExploration",
	mystery = "UnitedEarthMystery",
	repeatable = true,
})

PlaceObj('TechPreset', {
	SortKey = 13,
	description = T(8487, --[[TechPreset WildfireCure description]] "Series of dangerous experiments which could lead to the discovery of a cure for the Wildfire infection."),
	display_name = T(8452, --[[TechPreset WildfireCure display_name]] "Wildfire Cure"),
	group = "Mysteries",
	icon = "UI/Icons/Research/wildfire_cure.tga",
	id = "WildfireCure",
	mystery = "TheMarsBug",
	PlaceObj('Effect_Code', {
		OnApplyEffect = function (self, city, parent)
UnlockCrop("Cure", parent.id)
end,
		OnInitEffect = function (self, city, parent)
LockCrop("Cure", parent.id)
end,
	}),
})

PlaceObj('TechPreset', {
	SortKey = 1,
	description = T(10512, --[[TechPreset ExtractorAmplification description]] "<if_all(has_dlc('gagarin'),is_sponsor('Roscosmos'))>Concrete Plant & </if>Extractors Upgrade (<em>Amplify</em>) - Increases production by <param1>% but also increases Power consumption by <power(param2)>.\n\n<grey>\"From the first day to this, sheer greed was the driving spirit of civilization.\"\n<right>Friedrich Engels</grey><left>"),
	display_name = T(6440, --[[TechPreset ExtractorAmplification display_name]] "Extractor Amplification"),
	group = "Physics",
	icon = "UI/Icons/Research/extractor_amplification.tga",
	id = "ExtractorAmplification",
	param1 = 25,
	param1comment = "Production Bonus",
	param2 = 10000,
	param2comment = "Electricity",
	position = range(1, 5),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "MetalsExtractor_Amplify",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "PreciousMetalsExtractor_Amplify",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "RegolithExtractor_Amplify",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "WaterExtractor_Amplify",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "AutomaticMetalsExtractor_Amplify",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "ConcretePlant_Amplify",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 2,
	description = T(6443, --[[TechPreset AutonomousSensors description]] "<em>Sensor Towers</em> no longer require Power or maintenance.\n\n<grey>Reliable sensor data is instrumental for the exploration of Mars.</grey>"),
	display_name = T(6442, --[[TechPreset AutonomousSensors display_name]] "Autonomous Sensors"),
	group = "Physics",
	icon = "UI/Icons/Research/autonomous_sensors.tga",
	id = "AutonomousSensors",
	position = range(1, 5),
	PlaceObj('Effect_ModifyLabel', {
		Amount = 1,
		Label = "SensorTower",
		Prop = "disable_electricity_consumption",
	}),
	PlaceObj('Effect_ModifyLabel', {
		Amount = 1,
		Label = "SensorTower",
		Prop = "disable_maintenance",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 3,
	description = T(6453, --[[TechPreset SubsurfaceHeating description]] "New Building: <em>Subsurface Heater</em> (<buildinginfo('SubsurfaceHeater')>) - Increases the local temperature in cold areas and protects nearby buildings from Cold Waves. Consumes Water.\n\n<grey>Mars has an average surface temperature of −55 degrees Celsius, with inclinations to fall well beneath −130.</grey>"),
	display_name = T(6452, --[[TechPreset SubsurfaceHeating display_name]] "Subsurface Heating"),
	group = "Physics",
	icon = "UI/Icons/Research/subsurface_heating.tga",
	id = "SubsurfaceHeating",
	position = range(1, 5),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "SubsurfaceHeater",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 4,
	description = T(6447, --[[TechPreset LowGTurbines description]] "Wind Turbine Upgrade (<em>Polymer Blades</em>): Power production increased by <param1>%.\n\n<grey>Hands-on observations and problem solving in the low gravity environment of Mars have helped our engineers come up with solutions for increased Wind Turbine efficiency.</grey>"),
	display_name = T(6446, --[[TechPreset LowGTurbines display_name]] "Low-G Turbines"),
	group = "Physics",
	icon = "UI/Icons/Research/low-g_turbines.tga",
	id = "LowGTurbines",
	param1 = 33,
	param1comment = "Power Production Bonus",
	position = range(1, 5),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "WindTurbine_PolymerBlades",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "WindTurbineLarge_PolymerBlades",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 5,
	description = T(6449, --[[TechPreset AdaptedProbes description]] '<em>Probes</em> are cheaper and can deep scan.\n\n<grey>"The Universe is under no obligation to make sense to you." \n<right>Neil deGrasse Tyson</grey><left>'),
	display_name = T(6448, --[[TechPreset AdaptedProbes display_name]] "Adapted Probes"),
	group = "Physics",
	icon = "UI/Icons/Research/adapted_probes.tga",
	id = "AdaptedProbes",
	position = range(1, 5),
	PlaceObj('Effect_ModifyResupplyParam', {
		Item = "OrbitalProbe",
		Percent = -50,
	}),
	PlaceObj('Effect_ModifyResupplyParam', {
		Item = "AdvancedOrbitalProbe",
		Percent = -50,
	}),
})

PlaceObj('TechPreset', {
	SortKey = 6,
	description = T(6450, --[[TechPreset StirlingGenerator description]] "New Building: <em>Stirling Generator</em> (<buildinginfo('StirlingGenerator')>) - Generates Power. While closed the Generator is protected from dust, but produces less Power.\n\n<grey>The Stirling Radioisotope Generator is a generator based on a Stirling engine powered by a large radioisotope heater unit.</grey>"),
	display_name = T(3521, --[[TechPreset StirlingGenerator display_name]] "Stirling Generator"),
	group = "Physics",
	icon = "UI/Icons/Research/stirling_generator.tga",
	id = "StirlingGenerator",
	position = range(6, 6),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "StirlingGenerator",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 7,
	description = T(6451, --[[TechPreset AtomicAccumulator description]] "New Building: <em>Atomic Accumulator</em> (<buildinginfo('AtomicBattery')>) - Stores electrical Power. Has huge capacity but charges slowly.\n\n<grey>\"History will remember the twentieth century for two technological developments: atomic energy and space flight.\"\n<right>Neil Armstrong</grey><left>"),
	display_name = T(5013, --[[TechPreset AtomicAccumulator display_name]] "Atomic Accumulator"),
	group = "Physics",
	icon = "UI/Icons/Research/atomic_accumulator.tga",
	id = "AtomicAccumulator",
	position = range(7, 9),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "AtomicBattery",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 8,
	description = T(6445, --[[TechPreset DustRepulsion description]] "<em>Solar Panels</em> are gradually cleaned from dust when closed, resulting in less frequent maintenance.\n\n<grey>Solar Panels are inherently vulnerable to dust, more so than any other equipment used on Mars. Thus automatic dust repulsion systems are put in place to spread out maintenance periods.</grey>"),
	display_name = T(6444, --[[TechPreset DustRepulsion display_name]] "Dust Repulsion"),
	group = "Physics",
	icon = "UI/Icons/Research/dust_repulsion.tga",
	id = "DustRepulsion",
	param1 = 50,
	param1comment = "Regen rate, as percentage of the normal maintenance accumulation.",
	position = range(7, 9),
})

PlaceObj('TechPreset', {
	SortKey = 9,
	description = T(10513, --[[TechPreset FactoryAmplification description]] "Refineries & Factories Upgrade (<em>Amplify</em>) - Increases production by <param1>% but also increases Power consumption by <power(param2)>.\n\n<grey>Scaling power production to meet the needs of manufacturing is a challenge on Mars.</grey>"),
	display_name = T(6454, --[[TechPreset FactoryAmplification display_name]] "Factory Amplification"),
	group = "Physics",
	icon = "UI/Icons/Research/factory_amplification.tga",
	id = "FactoryAmplification",
	param1 = 25,
	param1comment = "Production Bonus",
	param2 = 20000,
	param2comment = "Power Increase",
	position = range(7, 9),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "ElectronicsFactory_Amplify",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "ElectronicsFactorySmall_Amplify",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "FuelFactory_Amplify",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "MachinePartsFactory_Amplify",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "MachinePartsFactorySmall_Amplify",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "PolymerPlant_Amplify",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "MetalsRefinery_Amplify",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "RareMetalsRefinery_Amplify",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "WasteRockProcessor_Amplify",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 10,
	description = T(6457, --[[TechPreset DeepScanning description]] "Sectors can now be scanned again for <em>deep deposits</em>. Exploiting these deposits requires additional technologies.\n\n<grey>We've barely scratched the surface of what we can learn about the Martian environment.</grey>"),
	display_name = T(6456, --[[TechPreset DeepScanning display_name]] "Deep Scanning"),
	group = "Physics",
	icon = "UI/Icons/Research/deep_scanning.tga",
	id = "DeepScanning",
	position = range(10, 10),
	PlaceObj('Effect_ModifyLabel', {
		Amount = 1,
		Label = "Consts",
		Prop = "DeepScanAvailable",
	}),
	PlaceObj('Effect_UnlockDeeperDeposits', {}),
})

PlaceObj('TechPreset', {
	SortKey = 11,
	description = T(8865, --[[TechPreset CreativeRealities description]] "New Building: <em>VR Workshop</em> (<buildinginfo('VRWorkshop')>) - a vocation building that allows colonists to experiment with virtual reality (counts towards the workshop milestone). Consumes Electronics.\n\n<grey>\"How do you know it's Sci-Fi? VR is commercially viable.\"\n<right>Shams Jorjani</grey><left>"),
	display_name = T(8864, --[[TechPreset CreativeRealities display_name]] "Creative Realities"),
	group = "Physics",
	icon = "UI/Icons/Research/creative_realities.tga",
	id = "CreativeRealities",
	position = range(11, 14),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "VRWorkshop",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 12,
	description = T(6459, --[[TechPreset DeepWaterExtraction description]] "Can exploit <em>deep Water deposits</em>.\n\n<grey>Water reserves the size of Lake Superior are predicted to be present deep beneath the surface of Mars.</grey>"),
	display_name = T(6458, --[[TechPreset DeepWaterExtraction display_name]] "Deep Water Extraction"),
	group = "Physics",
	icon = "UI/Icons/Research/deep_water_extraction.tga",
	id = "DeepWaterExtraction",
	position = range(11, 18),
	PlaceObj('Effect_ModifyLabel', {
		Amount = 1,
		Label = "Consts",
		Prop = "IsDeepWaterExploitable",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 13,
	description = T(6461, --[[TechPreset DeepMetalExtraction description]] "Can exploit deep <em>Metal</em> and <em>Rare Metal</em> deposits.\n\n<grey>Digging deep can be dangerous but it is necessary for sustained metal production.</grey>"),
	display_name = T(6460, --[[TechPreset DeepMetalExtraction display_name]] "Deep Metal Extraction"),
	group = "Physics",
	icon = "UI/Icons/Research/deep_metal_extraction.tga",
	id = "DeepMetalExtraction",
	position = range(11, 18),
	PlaceObj('Effect_ModifyLabel', {
		Amount = 1,
		Label = "Consts",
		Prop = "IsDeepMetalsExploitable",
	}),
	PlaceObj('Effect_ModifyLabel', {
		Amount = 1,
		Label = "Consts",
		Prop = "IsDeepPreciousMetalsExploitable",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 14,
	description = T(6467, --[[TechPreset NuclearFusion description]] "New Building: <em>Fusion Reactor</em> (<buildinginfo('FusionReactor')>) - Generates Power. Out-Dome building which requires Workers to operate.\n\n<grey>\"I would like nuclear fusion to become a practical power source. It would provide an inexhaustible supply of energy, without pollution or global warming.\"\n<right>Stephen Hawking</grey><left>"),
	display_name = T(6466, --[[TechPreset NuclearFusion display_name]] "Nuclear Fusion"),
	group = "Physics",
	icon = "UI/Icons/Research/nuclear_fusion.tga",
	id = "NuclearFusion",
	position = range(11, 14),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "FusionReactor",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 15,
	description = T(6463, --[[TechPreset MeteorDefenseSystem description]] "New Building: <em>MDS Laser</em> (<buildinginfo('MDSLaser')>) - Destroys falling meteors in its range.\n\n<grey>The low density of the Martian atmosphere makes meteors especially dangerous; this is why installing a reliable defense system against meteors is critical for our Colony’s long term survival.</grey>"),
	display_name = T(6462, --[[TechPreset MeteorDefenseSystem display_name]] "Meteor Defense System"),
	group = "Physics",
	icon = "UI/Icons/Research/meteor_defense_system.tga",
	id = "MeteorDefenseSystem",
	position = range(11, 18),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "MDSLaser",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 16,
	description = T(6469, --[[TechPreset TriboelectricScrubbing description]] "New Building: <em>Triboelectric Scrubber</em> (<buildinginfo('TriboelectricScrubber')>) - Emits pulses which reduce the Dust accumulated on buildings in its range.\n\n<grey>While the triboelectric effect is not very predictable or precise, it can be entrusted with removing dust from our structures.</grey>"),
	display_name = T(6468, --[[TechPreset TriboelectricScrubbing display_name]] "Triboelectric Scrubbing"),
	group = "Physics",
	icon = "UI/Icons/Research/triboelectric_scrubbing.tga",
	id = "TriboelectricScrubbing",
	position = range(11, 18),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "TriboelectricScrubber",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 17,
	description = T(10514, --[[TechPreset ResearchAmplification description]] "<if_all(has_dlc('gagarin'),is_sponsor('ESA'))>Low-G Lab, </if> Research Lab, Hawking Institute & Network Node Upgrade (<em>Amplify</em>) - Increases production by <param1>% but also increases Power consumption.\n\n<grey>The speed of the calculations and research efficiency grows with the amount of power invested.</grey>"),
	display_name = T(6470, --[[TechPreset ResearchAmplification display_name]] "Research Amplification"),
	group = "Physics",
	icon = "UI/Icons/Research/research_amplification.tga",
	id = "ResearchAmplification",
	param1 = 25,
	param1comment = "Power Bonus",
	position = range(11, 18),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "ResearchLab_Amplify",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "ScienceInstitute_Amplify",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "NetworkNode_Amplify",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "LowGLab_Amplify",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 18,
	description = T(6473, --[[TechPreset FusionAutoregulation description]] 'Fusion Reactor Upgrade (<em>Auto-regulator</em>) - reduces the amount of workers.\n\n<grey>"Our present nuclear fusion reactors are classified by the methods used to support the nuclear fusion reaction, which takes place at a temperature much hotter than the surface of the Sun."\n<right>Wilson Greatbatch</grey><left>'),
	display_name = T(6472, --[[TechPreset FusionAutoregulation display_name]] "Fusion Autoregulation"),
	group = "Physics",
	icon = "UI/Icons/Research/fusion_autoregulation.tga",
	id = "FusionAutoregulation",
	position = range(15, 18),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "FusionReactor_Autoregulator",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 19,
	description = T(6477, --[[TechPreset MicroFusion description]] "Wonder: <em>Artificial Sun</em> (<buildinginfo('ArtificialSun')>) - Produces colossal amounts of Power. It provides light for nearby Solar Panels during the dark hours and heats the surrounding area. Consumes vast amounts of Water on startup.\n\n<grey>Unlocking the secrets of the stars is now within the grasp of humanity.</grey>"),
	display_name = T(6476, --[[TechPreset MicroFusion display_name]] "Micro Fusion"),
	group = "Physics",
	icon = "UI/Icons/Research/micro_fusion.tga",
	id = "MicroFusion",
	position = range(19, 19),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "ArtificialSun",
		HideBuilding = true,
	}),
})

PlaceObj('TechPreset', {
	SortKey = 20,
	description = T(6479, --[[TechPreset InterplanetaryAstronomy description]] "Wonder: <em>Omega Telescope</em> (<buildinginfo('OmegaTelescope')>) - Gives access to new Breakthrough Technologies and reduces overall research costs.\n\n<grey>A milestone in human history has been achieved – feeling comfortable enough living on an alien world, so much so that some people are already turning their curiosity towards the endless expanse of space once more.</grey>"),
	display_name = T(6478, --[[TechPreset InterplanetaryAstronomy display_name]] "Interplanetary Astronomy"),
	group = "Physics",
	icon = "UI/Icons/Research/interplanetary_astronomy.tga",
	id = "InterplanetaryAstronomy",
	position = range(20, 20),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "OmegaTelescope",
		HideBuilding = true,
	}),
})

PlaceObj('TechPreset', {
	SortKey = 1,
	description = T(6400, --[[TechPreset TransportOptimization description]] "The <em>RC Transport</em> harvests resources faster and its maximum storage is increased by <param1>.\n\n<grey>The remote location of some resource deposits calls for Transport Rover optimizations.</grey>"),
	display_name = T(6399, --[[TechPreset TransportOptimization display_name]] "Transport Optimization"),
	group = "Robotics",
	icon = "UI/Icons/Research/transport_optimization.tga",
	id = "TransportOptimization",
	param1 = 15,
	param1comment = "Resource Capacity Bonus",
	position = range(1, 4),
	PlaceObj('Effect_ModifyLabel', {
		Label = "Consts",
		Percent = -50,
		Prop = "RCTransportGatherResourceWorkTime",
	}),
	PlaceObj('Effect_ModifyLabel', {
		Amount = 15,
		Label = "RCTransport",
		Prop = "max_shared_storage",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 2,
	description = T(6402, --[[TechPreset LowGDrive description]] "<em>Drones</em> and <em>Rovers</em> move <param1>% faster.\n\n<grey>An engine design optimized for low-gravity environments.</grey>"),
	display_name = T(6401, --[[TechPreset LowGDrive display_name]] "Low-G Drive"),
	group = "Robotics",
	icon = "UI/Icons/Research/low-g_drive.tga",
	id = "LowGDrive",
	param1 = 20,
	param1comment = "Speed Bonus",
	position = range(1, 4),
	PlaceObj('Effect_ModifyLabel', {
		Label = "Drone",
		Percent = 20,
		Prop = "move_speed",
	}),
	PlaceObj('Effect_ModifyLabel', {
		Label = "RCRover",
		Percent = 20,
		Prop = "move_speed",
	}),
	PlaceObj('Effect_ModifyLabel', {
		Label = "RCTransport",
		Percent = 20,
		Prop = "move_speed",
	}),
	PlaceObj('Effect_ModifyLabel', {
		Label = "ExplorerRover",
		Percent = 20,
		Prop = "move_speed",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 3,
	description = T(6404, --[[TechPreset DroneSwarm description]] "<em>Drone Hubs</em> are constructed with additional <param1> Drones and the maximum number of Drones is increased by <param2>.\n\n<grey>Drones being the backbone for most of the heavy and dangerous labor on Mars, it is essential our Hubs have greater operating capacity in order to employ more Drones at any given time.</grey>"),
	display_name = T(6403, --[[TechPreset DroneSwarm display_name]] "Drone Swarm"),
	group = "Robotics",
	icon = "UI/Icons/Research/drone_swarm.tga",
	id = "DroneSwarm",
	param1 = 2,
	param1comment = "Bonus Starting Drones",
	param2 = 80,
	param2comment = "Max Number of Drones",
	position = range(1, 4),
	PlaceObj('Effect_ModifyLabel', {
		Amount = 2,
		Label = "DroneHub",
		Prop = "starting_drones",
	}),
	PlaceObj('Effect_ModifyLabel', {
		Amount = 80,
		Label = "Consts",
		Prop = "CommandCenterMaxDrones",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 4,
	description = T(6426, --[[TechPreset ExplorerAI description]] "Generate <research(param1)> per Sol for each <em>RC Explorer</em> vehicle. Multiple vehicles result in collaboration losses.\n\n<grey>AI specifically tailored for our Explorers will think for itself, gathering only the data they have deemed could be of interest. The above will greatly contribute to our research initiatives.</grey>"),
	display_name = T(6425, --[[TechPreset ExplorerAI display_name]] "Explorer AI"),
	group = "Robotics",
	icon = "UI/Icons/Research/explorer_ai.tga",
	id = "ExplorerAI",
	param1 = 100,
	param1comment = "Research Points",
	position = range(1, 4),
	PlaceObj('Effect_ModifyLabel', {
		Amount = 100,
		Label = "Consts",
		Prop = "ExplorerRoverResearchPoints",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 5,
	description = T(6407, --[[TechPreset DroneHub description]] "New Building: <em>Drone Hub</em> (<buildinginfo('DroneHub')>) - Controls Drones and allocates them to different jobs.\n\n<grey>We can now rely upon ourselves to build the complex Hubs that control our de facto heavy labor force.</grey>"),
	display_name = T(3518, --[[TechPreset DroneHub display_name]] "Drone Hub"),
	group = "Robotics",
	icon = "UI/Icons/Research/drone_hub.tga",
	id = "DroneHub",
	position = range(5, 5),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "DroneHub",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 6,
	description = T(8863, --[[TechPreset AutomatedStorage description]] "New Buildings: <em>Storages</em> (<buildinginfo('MechanizedDepotMetals')>) - a set of storages that can store large amount of resources but have to be constructed and require power.\n\n<grey>\"The more storage you have, the more stuff you accumulate.\"\n<right>Alexis Stewart</grey><left>"),
	display_name = T(8862, --[[TechPreset AutomatedStorage display_name]] "Automated Storage"),
	group = "Robotics",
	icon = "UI/Icons/Research/automated_storage.tga",
	id = "AutomatedStorage",
	position = range(6, 10),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "MechanizedDepotMetals",
	}),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "MechanizedDepotConcrete",
	}),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "MechanizedDepotFood",
	}),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "MechanizedDepotFuel",
	}),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "MechanizedDepotPolymers",
	}),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "MechanizedDepotElectronics",
	}),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "MechanizedDepotMachineParts",
	}),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "MechanizedDepotRareMetals",
	}),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "MechanizedDepotMysteryResource",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 7,
	description = T(6406, --[[TechPreset BatteryOptimization description]] "<em>Drone</em> battery capacity increased by <param1>%.\n\n<grey>Advances in power accumulator technology allow Drones to function longer before needing to recharge.</grey>"),
	display_name = T(6405, --[[TechPreset BatteryOptimization display_name]] "Battery Optimization"),
	group = "Robotics",
	icon = "UI/Icons/Research/battery_optimization.tga",
	id = "BatteryOptimization",
	param1 = 50,
	param1comment = "Battery Bonus",
	position = range(6, 10),
	PlaceObj('Effect_ModifyLabel', {
		Label = "Drone",
		Percent = 50,
		Prop = "battery_max",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 8,
	description = T(8002, --[[TechPreset RoverCommandAI description]] "The <em>RC Commander</em> starts with <param1> additional Drones and command limit increased by <param2>. Unlocks new Automated Mode for RC Explorer and RC Transport.\n\n<grey>Developing a specialized AI with greater autonomy and advanced multitasking capabilities will allow our rovers to control more drones simultaneously.</grey>"),
	display_name = T(8001, --[[TechPreset RoverCommandAI display_name]] "Rover Command AI"),
	group = "Robotics",
	icon = "UI/Icons/Research/rover_command_ai.tga",
	id = "RoverCommandAI",
	param1 = 4,
	param1comment = "Starting Drones",
	param2 = 12,
	param2comment = "Max Drones",
	position = range(6, 10),
	PlaceObj('Effect_ModifyLabel', {
		Amount = 4,
		Label = "RCRover",
		Prop = "starting_drones",
	}),
	PlaceObj('Effect_ModifyLabel', {
		Amount = 12,
		Label = "Consts",
		Prop = "RCRoverMaxDrones",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 9,
	description = T(6411, --[[TechPreset DronePrinting description]] "New Building: <em>Drone Assembler</em> (<buildinginfo('DroneFactory')>) - Constructs Drone Prefabs from Electronics which can then be used in Drone Hubs to construct new drones.\n\n<grey>We may now print and assemble entire Drones on Mars with Martian-mined materials.</grey>"),
	display_name = T(6410, --[[TechPreset DronePrinting display_name]] "Drone Printing"),
	group = "Robotics",
	icon = "UI/Icons/Research/drone_printing.tga",
	id = "DronePrinting",
	position = range(6, 10),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "DroneFactory",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 10,
	description = T(8640, --[[TechPreset 3DMachining description]] "New Building: <em>Machine Parts Factory</em> (<buildinginfo('MachinePartsFactory')>) - Produces Machine Parts from Metals.\n\n<grey>Mastering the peculiarities of Martian ores has allowed us to make 3D Metal Printers, which will serve as the foundation for all future Martian industry.</grey>"),
	display_name = T(8639, --[[TechPreset 3DMachining display_name]] "3D Machining"),
	group = "Robotics",
	icon = "UI/Icons/Research/3d_machining.tga",
	id = "3DMachining",
	position = range(6, 10),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "MachinePartsFactory",
	}),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "MachinePartsFactory_Small",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 11,
	description = T(6415, --[[TechPreset CO2JetPropulsion description]] "New Building: <em>Shuttle Hub</em> (<buildinginfo('ShuttleHub')>) - Houses and refuels Shuttles that facilitate <em>long-range transportation</em> of resources between Depots and resettling of Colonists between Domes.\n\n<grey>Adapting an air-breathing jet engine to work in the 95% carbon dioxide atmosphere of Mars is a challenge.</grey>"),
	display_name = T(6414, --[[TechPreset CO2JetPropulsion display_name]] "CO2 Jet Propulsion"),
	group = "Robotics",
	icon = "UI/Icons/Research/co2_jet_propulsion.tga",
	id = "CO2JetPropulsion",
	position = range(11, 11),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "ShuttleHub",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 12,
	description = T(10515, --[[TechPreset FueledExtractors description]] "Extractors Upgrade (<em>Fueled Extractor</em>) - Production increased by <param1>% as long as the building is supplied with Fuel.\n\n<grey>'We should not just consume hydrocarbon fuel but use it to develop nuclear energy, hydro power and renewable energy sources.'\n<right>Vladimir Putin<left></grey>"),
	display_name = T(6408, --[[TechPreset FueledExtractors display_name]] "Fueled Extractors"),
	group = "Robotics",
	icon = "UI/Icons/Research/fueled_extractors.tga",
	id = "FueledExtractors",
	param1 = 30,
	param1comment = "Production boost",
	position = range(12, 14),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "MetalsExtractor_FueledExtractor",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "PreciousMetalsExtractor_FueledExtractor",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "RegolithExtractor_FueledExtractor",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "WaterExtractor_FueledExtractor",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "AutomaticMetalsExtractor_FueledExtractor",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 13,
	description = T(10516, --[[TechPreset FactoryAI description]] "Refineries & Factories Upgrade (<em>Factory AI</em>) - performance increased by <param1>%.\n\n<grey>After extensive trials and the allocation of many resources to the program, a work-safe AI has been developed to optimize various Factory operations.</grey>"),
	display_name = T(5054, --[[TechPreset FactoryAI display_name]] "Factory AI"),
	group = "Robotics",
	icon = "UI/Icons/Research/factory_ai.tga",
	id = "FactoryAI",
	param1 = 20,
	param1comment = "Production Bonus",
	position = range(12, 14),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "ElectronicsFactory_FactoryAI",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "ElectronicsFactorySmall_FactoryAI",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "MachinePartsFactory_FactoryAI",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "MachinePartsFactorySmall_FactoryAI",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "PolymerPlant_FactoryAI",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "FuelFactory_FactoryAI",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "MetalsRefinery_FactoryAI",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "RareMetalsRefinery_FactoryAI",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "WasteRockProcessor_FactoryAI",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 14,
	description = T(6422, --[[TechPreset MartianAerodynamics description]] "<em>Shuttle</em> speed increased by <param1>%.\n\n<grey>Designing shuttles for flight in a low density/low pressure atmosphere is more efficient when designing them in a low density/low pressure atmosphere.</grey>"),
	display_name = T(6421, --[[TechPreset MartianAerodynamics display_name]] "Martian Aerodynamics"),
	group = "Robotics",
	icon = "UI/Icons/Research/martian_aerodynamics.tga",
	id = "MartianAerodynamics",
	param1 = 33,
	param1comment = "Speed Buff",
	position = range(12, 14),
	PlaceObj('Effect_ModifyLabel', {
		Label = "CargoShuttle",
		Percent = 33,
		Prop = "move_speed",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 15,
	description = T(6424, --[[TechPreset RoverPrinting description]] "Can construct <em>RC Commander</em> (<buildinginfo('RCRoverBuilding')>), <em>RC Transport</em> (<buildinginfo('RCTransportBuilding')>) and <em>RC Explorer</em> (<buildinginfo('RCExplorerBuilding')>).\n\n<grey>Machine-part printing devices have reached a fidelity high enough to print the intricate parts necessary to assemble state of the art Rovers. </grey>"),
	display_name = T(6423, --[[TechPreset RoverPrinting display_name]] "Rover Printing"),
	group = "Robotics",
	icon = "UI/Icons/Research/rover_printing.tga",
	id = "RoverPrinting",
	position = range(15, 15),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "RCRoverBuilding",
		HideBuilding = true,
	}),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "RCTransportBuilding",
		HideBuilding = true,
	}),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "RCExplorerBuilding",
		HideBuilding = true,
	}),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "RCSensorBuilding",
		HideBuilding = true,
	}),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "RCSolarBuilding",
		HideBuilding = true,
	}),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "RCDrillerBuilding",
		HideBuilding = true,
	}),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "RCHarvesterBuilding",
		HideBuilding = true,
	}),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "RCConstructorBuilding",
		HideBuilding = true,
	}),
})

PlaceObj('TechPreset', {
	SortKey = 16,
	description = T(6428, --[[TechPreset CompactHangars description]] "The maximum number of Shuttles that the <em>Shuttle Hub</em> can house is increased by <param1>.\n\n<grey>Reaching heights unheard of in parking space sciences.</grey>"),
	display_name = T(6427, --[[TechPreset CompactHangars display_name]] "Compact Hangars"),
	group = "Robotics",
	icon = "UI/Icons/Research/compact_hangars.tga",
	id = "CompactHangars",
	param1 = 6,
	param1comment = "Max Shuttles",
	position = range(16, 18),
	PlaceObj('Effect_ModifyLabel', {
		Amount = 6,
		Label = "ShuttleHub",
		Prop = "max_shuttles",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 17,
	description = T(6430, --[[TechPreset HighPoweredJets description]] "<em>Shuttle</em> cargo capacity increased by <param1>.\n\n<grey>Advanced shuttle drives deliver more thrust and allow for greater cargo capacity.</grey>"),
	display_name = T(6429, --[[TechPreset HighPoweredJets display_name]] "High-powered Jets"),
	group = "Robotics",
	icon = "UI/Icons/Research/high-powered_jets.tga",
	id = "HighPoweredJets",
	param1 = 3,
	param1comment = "Cargo Capacity Bonus",
	position = range(16, 18),
	PlaceObj('Effect_ModifyLabel', {
		Amount = 3,
		Label = "CargoShuttle",
		Prop = "max_shared_storage",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 18,
	description = T(6433, --[[TechPreset TheMartianNetwork description]] "New Spire Building: <em>Network Node</em> (<buildinginfo('NetworkNode')>) - increases the research output of all Research Labs and Hawking Institutes in the Dome.\n\n<grey>Rapid transfer of information and an easier access to it could speed up research several times-fold.</grey>"),
	display_name = T(6432, --[[TechPreset TheMartianNetwork display_name]] "The Martian Network"),
	group = "Robotics",
	icon = "UI/Icons/Research/the_martian_network.tga",
	id = "TheMartianNetwork",
	position = range(16, 18),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "NetworkNode",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 19,
	description = T(1076, --[[TechPreset ProjectMohole description]] "Wonder: <em>Mohole Mine</em> (<buildinginfo('MoholeMine')>) - Extracts Metals, Rare Metals and Waste Rock without the need of a deposit, while heating the surrounding area.\n\n<grey>Moholes are shafts that dig exceptionally deep in the Martian crust, releasing heat as part of a potential terraforming effort and, as a bonus, mining ore.</grey>"),
	display_name = T(6434, --[[TechPreset ProjectMohole display_name]] "Project Mohole"),
	group = "Robotics",
	icon = "UI/Icons/Research/project_mohole.tga",
	id = "ProjectMohole",
	position = range(19, 19),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "MoholeMine",
		HideBuilding = true,
	}),
})

PlaceObj('TechPreset', {
	SortKey = 20,
	description = T(6437, --[[TechPreset LargeScaleExcavation description]] "Wonder: <em>The Excavator</em> (<buildinginfo('TheExcavator')>) - Produces Concrete directly from the Martian soil without requiring a deposit.\n\n<grey>Martian concrete, made from equal parts regolith and sulfur, has some vast improvements over its Earth counterpart. Red concrete is stronger, more durable and can be recycled and reused simply by reheating it.</grey>"),
	display_name = T(6436, --[[TechPreset LargeScaleExcavation display_name]] "Large-scale Excavation"),
	group = "Robotics",
	icon = "UI/Icons/Research/large-scale_excavation.tga",
	id = "LargeScaleExcavation",
	position = range(20, 20),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "TheExcavator",
		HideBuilding = true,
	}),
})

PlaceObj('TechPreset', {
	SortKey = 1,
	description = T(6483, --[[TechPreset LiveFromMars description]] "More <em>applicants</em> will start to appear on Earth.\n\n<grey>PR research aimed at exposing the benefits and positive aspects of life as a Colonist on Mars.</grey>"),
	display_name = T(6482, --[[TechPreset LiveFromMars display_name]] '"Live From Mars"'),
	group = "Social",
	icon = "UI/Icons/Research/live_from_mars.tga",
	id = "LiveFromMars",
	position = range(1, 5),
	PlaceObj('Effect_ModifyLabel', {
		Label = "Consts",
		Percent = -25,
		Prop = "ApplicantGenerationInterval",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 2,
	description = T(6487, --[[TechPreset ProductivityTraining description]] '<em>Engineers and Geologists</em> have +<param1> performance when working in their specialty.\n\n<grey>"Geologists have a saying - rocks remember."\n<right>Neil Armstrong</grey><left>'),
	display_name = T(6486, --[[TechPreset ProductivityTraining display_name]] "Productivity Training"),
	group = "Social",
	icon = "UI/Icons/Research/productivity_training.tga",
	id = "ProductivityTraining",
	param1 = 10,
	param1comment = "Perforamnce Bonus",
	position = range(1, 5),
	PlaceObj('Effect_ModifyLabel', {
		Amount = 10,
		Label = "engineer",
		Prop = "preferred_workplace_performance_bonus",
	}),
	PlaceObj('Effect_ModifyLabel', {
		Amount = 10,
		Label = "geologist",
		Prop = "preferred_workplace_performance_bonus",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 3,
	description = T(6485, --[[TechPreset EarthMarsInitiative description]] 'Increases research provided by <em>sponsor</em> by <research(param1)>.\n\n<grey>"Two planets, one human race – sharing knowledge and coexisting within the Solar System."\n<right>Martian Scientist</grey><left>'),
	display_name = T(6484, --[[TechPreset EarthMarsInitiative display_name]] "Earth-Mars Initiative"),
	group = "Social",
	icon = "UI/Icons/Research/earth-mars_initiative.tga",
	id = "EarthMarsInitiative",
	param1 = 100,
	param1comment = "Reserach Points",
	position = range(1, 5),
	PlaceObj('Effect_ModifyLabel', {
		Amount = 100,
		Label = "Consts",
		Prop = "SponsorResearch",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 4,
	description = T(6489, --[[TechPreset SystematicTraining description]] '<em>Scientists and Botanists</em> have +<param1> performance when working in their specialty.\n\n<grey>"Hell yeah I\'m a botanist! Fear my botany powers!"\n<right>Andy Weir - The Martian</grey><left>'),
	display_name = T(6488, --[[TechPreset SystematicTraining display_name]] "Systematic Training"),
	group = "Social",
	icon = "UI/Icons/Research/systematic_training.tga",
	id = "SystematicTraining",
	param1 = 10,
	param1comment = "Performance Bonus",
	position = range(1, 5),
	PlaceObj('Effect_ModifyLabel', {
		Amount = 10,
		Label = "scientist",
		Prop = "preferred_workplace_performance_bonus",
	}),
	PlaceObj('Effect_ModifyLabel', {
		Amount = 10,
		Label = "botanist",
		Prop = "preferred_workplace_performance_bonus",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 5,
	description = T(6491, --[[TechPreset MarsHype description]] "Receive a one-time grant of <em><funding(param1)></em> funding.\n\n<grey>With the rising media hype about our mission, it is only a matter of social maneuvering to make the first interplanetary crowdfunding campaign a reality.</grey>"),
	display_name = T(6490, --[[TechPreset MarsHype display_name]] "Mars Crowdfunding"),
	group = "Social",
	icon = "UI/Icons/Research/mars_crowdfunding.tga",
	id = "MarsHype",
	param1 = 1000000000,
	param1comment = "Money",
	position = range(1, 5),
	PlaceObj('Effect_Funding', {
		Funding = 1000,
		Reason = "Research",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 6,
	description = T(6493, --[[TechPreset MartianEducation description]] "New Building: <em>Martian University</em> (<buildinginfo('MartianUniversity')>) - Trains Scientists, Geologists, Botanists, Medic, Engineers or Security officers.\n\n<grey>College education is always free on Mars.</grey>"),
	display_name = T(6492, --[[TechPreset MartianEducation display_name]] "Martian Education"),
	group = "Social",
	icon = "UI/Icons/Research/martian_education.tga",
	id = "MartianEducation",
	position = range(6, 6),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "MartianUniversity",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 7,
	description = T(6497, --[[TechPreset MartianPatents description]] 'License Martian technology for use back on Earth. Earn <em><funding(param1)></em> funding.\n\nThis tech is <em>repeatable</em> and can be researched multiple times.\n\n<grey>"Economic exchange between Mars and Earth would be mostly in the form of intellectual property"\n<right>Elon Musk</grey><left>'),
	display_name = T(6496, --[[TechPreset MartianPatents display_name]] "Martian Patents"),
	group = "Social",
	icon = "UI/Icons/Research/martian_patents.tga",
	id = "MartianPatents",
	param1 = 500000000,
	param1comment = "Money",
	position = range(7, 10),
	repeatable = true,
	PlaceObj('Effect_Funding', {
		Funding = 500,
		Reason = "Research",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 8,
	description = T(6499, --[[TechPreset SupportiveCommunity description]] 'Lowers the risk of colonists developing flaws after <em>Sanity breakdown</em>.\n\n<grey>"Beauty is not who you are on the outside, it is the wisdom and time you gave away to save another struggling soul like you."\n<right>Shannon L. Alder</grey><left>'),
	display_name = T(6498, --[[TechPreset SupportiveCommunity display_name]] "Supportive Community"),
	group = "Social",
	icon = "UI/Icons/Research/supportive_community.tga",
	id = "SupportiveCommunity",
	position = range(7, 10),
	PlaceObj('Effect_ModifyLabel', {
		Label = "Consts",
		Percent = -70,
		Prop = "LowSanityNegativeTraitChance",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 9,
	description = T(6501, --[[TechPreset EmergencyTraining description]] "<em>Security Officers and Medics</em> have +<param1> performance when working in their specialty.\n\n<grey>One can never be too prepared for the vast array of emergencies that could arise at any given moment on Mars.</grey>"),
	display_name = T(6500, --[[TechPreset EmergencyTraining display_name]] "Emergency Training"),
	group = "Social",
	icon = "UI/Icons/Research/emergency_training.tga",
	id = "EmergencyTraining",
	param1 = 10,
	param1comment = "Performance Bonus",
	position = range(7, 10),
	PlaceObj('Effect_ModifyLabel', {
		Amount = 10,
		Label = "security",
		Prop = "preferred_workplace_performance_bonus",
	}),
	PlaceObj('Effect_ModifyLabel', {
		Amount = 10,
		Label = "medic",
		Prop = "preferred_workplace_performance_bonus",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 10,
	description = T(7298, --[[TechPreset GeneralTraining description]] "Colonists without the proper <em>specialization</em> suffer a lower work penalty.\n\n<grey>“A jack of all trades is a master of none, but oftentimes better than a master of one.”</grey>"),
	display_name = T(7297, --[[TechPreset GeneralTraining display_name]] "General Training"),
	group = "Social",
	icon = "UI/Icons/Research/general_training.tga",
	id = "GeneralTraining",
	position = range(7, 10),
	PlaceObj('Effect_ModifyLabel', {
		Amount = -10,
		Label = "Consts",
		Prop = "NonSpecialistPerformancePenalty",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 11,
	description = T(6503, --[[TechPreset MartianInstituteOfScience description]] "New Building: <em>Hawking Institute</em> (<buildinginfo('ScienceInstitute')>) - Generates Research faster than a Research Lab.\n\n<grey>\"Look up at the stars and not down at your feet. Try to make sense of what you see, and wonder about what makes the universe exist. Be curious.\" \n<right>Stephen Hawking</grey><left>"),
	display_name = T(6502, --[[TechPreset MartianInstituteOfScience display_name]] "Martian Institute of Science"),
	group = "Social",
	icon = "UI/Icons/Research/martian_institute_of_science.tga",
	id = "MartianInstituteOfScience",
	position = range(11, 11),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "ScienceInstitute",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 12,
	description = T(6512, --[[TechPreset BehavioralShaping description]] "New Spire Building: <em>Sanatorium</em> (<buildinginfo('Sanatorium')>) - treats colonists to remove flaws.\n\n<grey>\"There are no constraints on the human mind, no walls around the human spirit, no barriers to our progress except those we ourselves erect.\"\n<right>Ronald Reagan</grey><left>"),
	display_name = T(6511, --[[TechPreset BehavioralShaping display_name]] "Behavioral Shaping"),
	group = "Social",
	icon = "UI/Icons/Research/behavioral_shaping.tga",
	id = "BehavioralShaping",
	position = range(12, 14),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "Sanatorium",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 13,
	description = T(8867, --[[TechPreset CreativeDisposition description]] "New Building: <em>Art Workshop</em> (<buildinginfo('ArtWorkshop')>) - a vocation building that allows colonists to experiment with different forms of art (counts towards the workshop milestone). Consumes Polymers.\n\n<grey>\"We don't make mistakes, just happy little accidents.\"\n<right>Bob Ross</grey><left>"),
	display_name = T(8866, --[[TechPreset CreativeDisposition display_name]] "Creative Disposition"),
	group = "Social",
	icon = "UI/Icons/Research/creative_disposition.tga",
	id = "CreativeDisposition",
	position = range(12, 19),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "ArtWorkshop",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 14,
	description = T(6505, --[[TechPreset MartianFestivals description]] "<em>Decorations</em> have increased Service Comfort.\n\n<grey>Reinforcing the notion of a separate and unique Martian culture makes our Colonists more positive and helps them find comfort in the uncertain world which is life on Mars.</grey>"),
	display_name = T(6504, --[[TechPreset MartianFestivals display_name]] "Martian Festivals"),
	group = "Social",
	icon = "UI/Icons/Research/martian_festivals.tga",
	id = "MartianFestivals",
	position = range(12, 19),
	PlaceObj('Effect_ModifyLabel', {
		Amount = 10,
		Label = "Decorations",
		Prop = "service_comfort",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 15,
	description = T(6507, --[[TechPreset MartianbornStrength description]] "<em>Martianborn</em> don't take Sanity damage from disasters.\n\n<grey>Martianborn grow up in the reality of the everyday dangers of the Red Planet. It bestows upon them an inner strength that is truly a unique Martian quality.</grey>"),
	display_name = T(6506, --[[TechPreset MartianbornStrength display_name]] "Martianborn Strength"),
	group = "Social",
	icon = "UI/Icons/Research/martianborn_strenght.tga",
	id = "MartianbornStrength",
	position = range(12, 19),
})

PlaceObj('TechPreset', {
	SortKey = 16,
	description = T(6509, --[[TechPreset MartianbornResilience description]] "<em>Martianborn</em> don't take Sanity damage when working in out-Dome buildings.\n\n<grey>We are born on the Red Planet. We do not fear stepping outside the safety of the Dome. We embrace it.</grey>"),
	display_name = T(6508, --[[TechPreset MartianbornResilience display_name]] "Martianborn Resilience"),
	group = "Social",
	icon = "UI/Icons/Research/martianborn_resilience.tga",
	id = "MartianbornResilience",
	position = range(12, 19),
})

PlaceObj('TechPreset', {
	SortKey = 17,
	description = T(6510, --[[TechPreset HomeCollective description]] "Residential Building Upgrade (<em>Home Collective</em>) - Increases the Service Comfort of the building by <param1>.\n\n<grey>A friendly and supportive community is the key to making life easier in the harsh reality of the Red Planet.</grey>"),
	display_name = T(5005, --[[TechPreset HomeCollective display_name]] "Home Collective"),
	group = "Social",
	icon = "UI/Icons/Research/home_collective.tga",
	id = "HomeCollective",
	param1 = 10,
	param1comment = "Service Comfort Bonus",
	position = range(12, 19),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "Appartments_HomeCollective",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "LivingQuarters_HomeCollective",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "LivingQuartersSmall_HomeCollective",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "SmartHome_HomeCollective",
	}),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "Arcology_HomeCollective",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 18,
	description = T(6516, --[[TechPreset MartianCopyrithgts description]] 'License Martian copyrights for use back on Earth. Earn <em><funding(param1)></em> funding.\n\nThis tech is <em>repeatable</em> and can be researched multiple times.\n\n<grey>"The conditions of extreme labor shortage combined with a technological culture will tend to drive Martian ingenuity to produce wave after wave of invention."\n<right>Robert Zubrin</grey><left>'),
	display_name = T(6515, --[[TechPreset MartianCopyrithgts display_name]] "Martian Copyrights"),
	group = "Social",
	icon = "UI/Icons/Research/martian_copyrights.tga",
	id = "MartianCopyrithgts",
	param1 = 2000000000,
	position = range(12, 19),
	repeatable = true,
	PlaceObj('Effect_Funding', {
		Funding = 2000,
		Reason = "Research",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 19,
	description = T(6517, --[[TechPreset BehavioralMelding description]] "Sanatorium Upgrade (<em>Behavioral Melding</em>) - replaces removed flaws with random Perks.\n\n<grey>A more benevolent and productive iteration of 18th century methods.</grey>"),
	display_name = T(5243, --[[TechPreset BehavioralMelding display_name]] "Behavioral Melding"),
	group = "Social",
	icon = "UI/Icons/Research/behavioral_melding.tga",
	id = "BehavioralMelding",
	position = range(15, 19),
	PlaceObj('Effect_UnlockUpgrade', {
		Upgrade = "Sanatorium_BehavioralMelding",
	}),
})

PlaceObj('TechPreset', {
	SortKey = 20,
	description = T(6519, --[[TechPreset DreamReality description]] "Wonder: <em>Project Morpheus</em> (<buildinginfo('ProjectMorpheus')>) - Stimulates the development of new Perks in adult Colonists throughout the entire Colony.\n\n<grey>\"You take the red pill - you stay in Wonderland and I show you how deep the rabbit-hole goes.\"</grey>"),
	display_name = T(6518, --[[TechPreset DreamReality display_name]] "Dream Reality"),
	group = "Social",
	icon = "UI/Icons/Research/dream_reality.tga",
	id = "DreamReality",
	position = range(20, 20),
	PlaceObj('Effect_TechUnlockBuilding', {
		Building = "ProjectMorpheus",
		HideBuilding = true,
	}),
})

