-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

ClearTechTree()

TechTree = {
	PlaceObj('TechField', {
		'id', "Biotech",
		'display_name', T{6318, "BIOTECH"},
		'icon', "UI/Icons/Research/biotech.tga",
		'description', T{6319, "The <em>Biotech</em> field deals with <em>Food</em> production, <em>life support</em> and <em>medicine</em>."},
		'costs', {
			1000,
			1000,
			1500,
			1500,
			2000,
			2000,
			3000,
			3000,
			4500,
			4500,
			7000,
			7000,
			10000,
			10000,
			15000,
			15000,
			20000,
			20000,
			20000,
			30000,
			30000,
			40000,
		},
		'hex_direction', 1,
	}, {
		PlaceObj('Tech', {
			'id', "HygroscopicVaporators",
			'display_name', T{6320, "Hygroscopic Vaporators"},
			'icon', "UI/Icons/Research/hygroscopic_vaporators.tga",
			'description', T{6321, "Moisture Vaporator Upgrade (<em>Hygroscopic Coating</em>) - Water production increased by <param1>%.\n\n<grey>With its mechanical simplicity and applicability to any point on Mars's surface, the Water-Vapor Adsorption Reactor technology can extract water directly from the Martian atmosphere.</grey>"},
			'position', range(1, 5),
			'param1comment', "Production Bonus %",
			'param1', 50,
			'field', "Biotech",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockUpgrade', {
				'Upgrade', "MoistureVaporator_HygroscopicCoating",
			}),
			}),
		PlaceObj('Tech', {
			'id', "SoilAdaptation",
			'display_name', T{6322, "Soil Adaptation"},
			'icon', "UI/Icons/Research/soil_adaptation.tga",
			'description', T{6323, "New Building: <em>Farm</em> (<buildinginfo('Farm')>) - Produces Food. Large in-Dome building which is more work-efficient and requires no Power.\n\n<grey>\"They say once you grow crops somewhere you’ve officially colonized it.\"\n<right>Andy Weir – The Martian</grey><left>"},
			'position', range(1, 5),
			'field', "Biotech",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockBuilding', {
				'Building', "Farm",
			}),
			}),
		PlaceObj('Tech', {
			'id', "LowGFungi",
			'display_name', T{6343, "Low-G Fungi"},
			'icon', "UI/Icons/Research/low-g_fungi.tga",
			'description', T{6344, "New Building: <em>Fungal Farm</em> (<buildinginfo('FungalFarm')>) -  An out-Dome building that produces Food.\n\n<grey>\"All fungi are edible. Some fungi are only edible once.\" \n<right>Terry Pratchett</grey><left>"},
			'position', range(1, 5),
			'field', "Biotech",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockBuilding', {
				'Building', "FungalFarm",
			}),
			}),
		PlaceObj('Tech', {
			'id', "MagneticFiltering",
			'display_name', T{5125, "Magnetic Filtering"},
			'icon', "UI/Icons/Research/magnetic_filtering.tga",
			'description', T{6326, "MOXIE Upgrade (<em>Magnetic Filtering</em>) - Oxygen production increased by <param1>%.\n\n<grey>Magnetic filters block ferromagnetic metal contaminants as well as weakly magnetic particles from the Martian atmosphere when inhaled by our MOXIEs, greatly increasing their efficiencies.</grey>"},
			'position', range(1, 5),
			'param1comment', "Production Bonus %",
			'param1', 50,
			'field', "Biotech",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockUpgrade', {
				'Upgrade', "MOXIE_MagneticFiltering",
			}),
			}),
		PlaceObj('Tech', {
			'id', "WaterReclamation",
			'display_name', T{6327, "Water Reclamation"},
			'icon', "UI/Icons/Research/water_reclamation.tga",
			'description', T{6328, "New Spire Building: <em>Water Reclamation System</em> (<buildinginfo('WaterReclamationSystem')>) - drastically reduces the Water consumption of the Dome.\n\n<grey>Water on Mars is abundant, yet it is mostly underground and in a frozen state – making it, while within reach, still difficult and expensive to mine. This makes recycling necessary to ensure a steady water supply.</grey>"},
			'position', range(1, 5),
			'field', "Biotech",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockBuilding', {
				'Building', "WaterReclamationSystem",
			}),
			}),
		PlaceObj('Tech', {
			'id', "UtilityCrops",
			'display_name', T{6329, "Utility Crops"},
			'icon', "UI/Icons/Research/utility_crops.tga",
			'description', T{6330, "Unlock <em>new crops</em> in Farms and Hydroponic Farms that provide Oxygen and improve soil quality.\n\n<grey>From the salad you eat to the air you breathe, plants have a fundamental role to play for humanity well beyond Earth.</grey>"},
			'position', range(6, 6),
			'OnGameInit', function (self, city)
LockCrop("Algae", self.id)
LockCrop("Cover Crops", self.id)
end,
			'OnResearchComplete', function (self, city)
UnlockCrop("Algae", self.id)
UnlockCrop("Cover Crops", self.id)
end,
			'field', "Biotech",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			}),
		PlaceObj('Tech', {
			'id', "MartianbornAdaptability",
			'display_name', T{6331, "Martianborn Adaptability"},
			'icon', "UI/Icons/Research/martianborn_adaptability.tga",
			'description', T{6332, "<em>Martianborn</em> Colonists graduate faster in Universities and Sanatoriums and have higher chance to gain Perks from Schools.\n\n<grey>Certain restrictions that still persist on Earth derived from religion and general conservatism are absent here on Mars. As a result, we have the freedom to genetically enhance our newborns and hone their already-sharp minds to a sharp point.</grey>"},
			'position', range(7, 10),
			'param1', 100,
			'field', "Biotech",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			}),
		PlaceObj('Tech', {
			'id', "BiomeEngineering",
			'display_name', T{6324, "Biome Engineering"},
			'icon', "UI/Icons/Research/biome_engineering.tga",
			'description', T{6325, "<em>Farms</em> increase the Comfort of all residences in the Dome.\n\n<grey>Seeing something green against the endless reddish barrens of Mars can be quite therapeutic.</grey>"},
			'position', range(7, 10),
			'field', "Biotech",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "Farm",
				'Prop', "dome_comfort",
				'Amount', 5,
			}),
			}),
		PlaceObj('Tech', {
			'id', "DomeBioscaping",
			'display_name', T{6335, "Dome Bioscaping"},
			'icon', "UI/Icons/Research/dome_bioscaping.tga",
			'description', T{6336, "Residences in <em>Basic Domes</em> have improved Comfort.\n\n<grey>“One touch of nature makes the whole world kin.”\n<right>William Shakespeare</grey><left>"},
			'position', range(7, 10),
			'field', "Biotech",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "DomeBasic",
				'Prop', "dome_comfort",
				'Amount', 15,
			}),
			}),
		PlaceObj('Tech', {
			'id', "MicrogravityMedicine",
			'display_name', T{6337, "Microgravity Medicine"},
			'icon', "UI/Icons/Research/microgravity_medicine.tga",
			'description', T{6338, "New Spire Building: <em>Medical Center</em> (<buildinginfo('MedicalCenter')>) - has larger capacity and is more effective than the Infirmary.\n\n<grey>“The good physician treats the disease; the great physician treats the patient who has the disease.” \n<right>William Osler</grey><left>"},
			'position', range(7, 10),
			'field', "Biotech",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockBuilding', {
				'Building', "MedicalCenter",
			}),
			}),
		PlaceObj('Tech', {
			'id', "GeneAdaptation",
			'display_name', T{6339, "Gene Adaptation"},
			'icon', "UI/Icons/Research/gene_adaptation.tga",
			'description', T{6340, "Unlock <em>new crops</em> in Farms and Hydroponic Farms that provide better Food yields.\n\n<grey>The overall reputation of GMO grown foods has increased dramatically when the only other alternative for food is red dirt.</grey>"},
			'position', range(11, 11),
			'OnGameInit', function (self, city)
LockCrop("Rice", self.id)
LockCrop("Vegetables", self.id)
LockCrop("Kelp", self.id)
LockCrop("Corn", self.id)
LockCrop("Fruit Trees", self.id)
LockCrop("Quinoa", self.id)
LockCrop("Giant Corn", self.id)
LockCrop("Giant Rice", self.id)
end,
			'OnResearchComplete', function (self, city)
UnlockCrop("Rice", self.id)
UnlockCrop("Vegetables", self.id)
UnlockCrop("Kelp", self.id)
UnlockCrop("Corn", self.id)
UnlockCrop("Fruit Trees", self.id)
UnlockCrop("Quinoa", self.id)
UnlockCrop("Giant Corn", self.id)
UnlockCrop("Giant Rice", self.id)
end,
			'field', "Biotech",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			}),
		PlaceObj('Tech', {
			'id', "WaterCoservationSystem",
			'display_name', T{7293, "Water Conservation System"},
			'icon', "UI/Icons/Research/water_conservation_system.tga",
			'description', T{7294, "Water consumption of <em>Domes</em> reduced by <param1>%.\n\n<grey>\"No water, no life. No blue, no green.\"\n<right>Sylvia Earle</grey><left>"},
			'position', range(12, 18),
			'param1comment', "Water Reduction %",
			'param1', 50,
			'field', "Biotech",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "Dome",
				'Prop', "water_consumption",
				'Percent', -50,
			}),
			}),
		PlaceObj('Tech', {
			'id', "FarmAutomation ",
			'display_name', T{6333, "Farm Automation"},
			'icon', "UI/Icons/Research/farm_automation.tga",
			'description', T{6334, "<em>Farm, Hydroponic Farm & Fungal Farm</em> Upgrade: <em>Automation</em> - Decreases number of workers.\n\n<grey>Now that we have adapted crops to the Martian environment we can mechanize some procedures.</grey>"},
			'position', range(12, 18),
			'field', "Biotech",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockUpgrade', {
				'Upgrade', "Farm_Automation",
			}),
			PlaceObj('TechEffect_UnlockUpgrade', {
				'Upgrade', "FungalFarm_Automation",
			}),
			PlaceObj('TechEffect_UnlockUpgrade', {
				'Upgrade', "HydroponicFarm_Automation",
			}),
			}),
		PlaceObj('Tech', {
			'id', "HangingGardens",
			'display_name', T{3535, "Hanging Gardens"},
			'icon', "UI/Icons/Research/hanging_gardens.tga",
			'description', T{6345, "New Spire Building: <em>Hanging Gardens</em> (<buildinginfo('HangingGardens')>) - a beautiful park complex that greatly improves the Comfort of all Residences in the Dome.\n\n<grey>One of humanity’s most enduring and fanciful legends from the ancient past is made a reality on Mars.</grey>"},
			'position', range(12, 18),
			'field', "Biotech",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockBuilding', {
				'Building', "HangingGardens",
			}),
			}),
		PlaceObj('Tech', {
			'id', "HolographicScanning",
			'display_name', T{6346, "Holographic Scanning"},
			'icon', "UI/Icons/Research/holographic_scanning.tga",
			'description', T{6347, "<em>Medical Center</em> Upgrade (Holographic Scanner) - Increases birth rate in the Dome.\n\n<grey>Holographic technologies can significantly improve medical diagnostics and monitoring procedures.</grey>"},
			'position', range(12, 18),
			'field', "Biotech",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockUpgrade', {
				'Upgrade', "MedicalCenter_HolographicScanner",
			}),
			}),
		PlaceObj('Tech', {
			'id', "MoistureFarming",
			'display_name', T{6348, "Moisture Farming"},
			'icon', "UI/Icons/Research/moisture_farming.tga",
			'description', T{6349, "New Building: <em>Moisture Vaporator</em> (<buildinginfo('MoistureVaporator')>) - Produces Water from the atmosphere. Doesn't produce during Dust Storms.\n\n<grey>\"What I really need is a drone that understands the binary language of moisture vaporators.\"\n<right>Unknown Martian Colonist</grey><left>"},
			'position', range(12, 18),
			'field', "Biotech",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockBuilding', {
				'Building', "MoistureVaporator",
			}),
			}),
		PlaceObj('Tech', {
			'id', "RejuvenationTreatment",
			'display_name', T{5103, "Rejuvenation Treatment"},
			'icon', "UI/Icons/Research/rejuvenation_treatment.tga",
			'description', T{6350, "Infirmary & Medical Center Upgrade (<em>Rejuvenation Treatment</em>) - Improves Service Comfort and provides Relaxation, allowing Colonists to visit and gain Comfort.\n\n<grey>You haven’t truly colonized a planet until you build the first Spa center on it.</grey>"},
			'position', range(12, 18),
			'param1', 10,
			'field', "Biotech",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockUpgrade', {
				'Upgrade', "Infirmary_RejuvenationTreatment",
			}),
			PlaceObj('TechEffect_UnlockUpgrade', {
				'Upgrade', "MedicalCenter_RejuvenationTreatment",
			}),
			}),
		PlaceObj('Tech', {
			'id', "StemReconstruction",
			'display_name', T{6353, "Stem Reconstruction"},
			'icon', "UI/Icons/Research/stem_reconstruction.tga",
			'description', T{6354, "<em>Retirement age</em> and <em>death</em> from old age happen later in the Colonists' lifespan.\n\n<grey>\"Live long and prosper\"\n<right>Vulcan Salute</grey><left>"},
			'position', range(12, 18),
			'field', "Biotech",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "Colonist",
				'Prop', "MinAge_Senior",
				'Amount', 20,
			}),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "Colonist",
				'Prop', "death_age",
				'Amount', 20,
			}),
			}),
		PlaceObj('Tech', {
			'id', "LocalizedTerraforming",
			'display_name', T{6355, "Localized Terraforming"},
			'icon', "UI/Icons/Research/localized_terraforming.tga",
			'description', T{6356, "New Wonder: <em>Geoscape Dome</em> (<buildinginfo('GeoscapeDome')>)  - A slice of Earth on Mars, this Dome has high Comfort and increases the Sanity of its inhabitants on every Sol.\n\n<grey>\"It's a fixer-upper of a planet but we could make it work.\" \n<right>Elon Musk</grey><left>"},
			'position', range(19, 19),
			'field', "Biotech",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockBuilding', {
				'Building', "GeoscapeDome",
				'HideBuilding', true,
			}),
			}),
		}),
	PlaceObj('TechField', {
		'id', "Engineering",
		'display_name', T{6357, "ENGINEERING"},
		'icon', "UI/Icons/Research/engineering.tga",
		'description', T{6358, "The <em>Engineering</em> field deals with <em>Buildings</em>, <em>Domes</em> and improves <em>Rocket</em> technology."},
		'costs', {
			1000,
			1000,
			1500,
			1500,
			2000,
			2000,
			3000,
			3000,
			4500,
			4500,
			7000,
			7000,
			10000,
			10000,
			15000,
			15000,
			20000,
			20000,
			20000,
			30000,
			30000,
			40000,
		},
		'hex_direction', 6,
	}, {
		PlaceObj('Tech', {
			'id', "FuelCompression",
			'display_name', T{6359, "Fuel Compression"},
			'icon', "UI/Icons/Research/fuel_compression.tga",
			'description', T{6360, "<em>Rocket</em> Cargo Space increased by <param1> kg.\n\n<grey>The fuel section is by far the largest and, when full, the heaviest part of any rocket. This makes developing more compressed fuels especially important when striving to bring more to Mars with fewer rockets.</grey>"},
			'position', range(1, 5),
			'param1comment', "Cargo Bonus",
			'param1', 10000,
			'field', "Engineering",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "Consts",
				'Prop', "CargoCapacity",
				'Amount', 10000,
			}),
			}),
		PlaceObj('Tech', {
			'id', "DecommissionProtocol",
			'display_name', T{6361, "Decommission Protocol"},
			'icon', "UI/Icons/Research/decommission_protocol.tga",
			'description', T{6362, "Allows the clearing of <em>salvaged</em> and <em>destroyed buildings.</em>\n\n<grey>We have reached the point where we must do away with old buildings on Mars to make way for new ones.</grey>"},
			'position', range(1, 5),
			'field', "Engineering",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			}),
		PlaceObj('Tech', {
			'id', "LowGHydrosynthsis",
			'display_name', T{6363, "Low-G Hydrosynthesis"},
			'icon', "UI/Icons/Research/low-g_hydrosynthesis.tga",
			'description', T{6364, "New Building: <em>Polymer Factory</em> (<buildinginfo('PolymerPlant')> - Produces Polymers from Water and Fuel.\nNew Building: <em>Fuel Refinery</em> (<buildinginfo('FuelFactory')>)  - Produces Fuel from Water.\n\n<grey>Resolving the obvious problems with water pressure in Low-G environments will allow for more complex hydro-synthetic procedures to be done on-site on Mars.</grey>"},
			'position', range(1, 5),
			'field', "Engineering",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockBuilding', {
				'Building', "PolymerPlant",
			}),
			PlaceObj('TechEffect_UnlockBuilding', {
				'Building', "FuelFactory",
			}),
			}),
		PlaceObj('Tech', {
			'id', "AdvancedMartianEngines",
			'display_name', T{6365, "Advanced Martian Engines"},
			'icon', "UI/Icons/Research/advanced_martian_engines.tga",
			'description', T{6366, "<em>Rockets</em> and <em>Shuttles</em> require less Fuel.\n\n<grey>The scarcity of Martian-made rocket fuel options has made for our first true contribution towards rocket engine efficiency.</grey>"},
			'position', range(1, 5),
			'field', "Engineering",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "AllRockets",
				'Prop', "launch_fuel",
				'Amount', -20,
			}),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "ShuttleHub",
				'Prop', "consumption_amount",
				'Percent', -25,
			}),
			}),
		PlaceObj('Tech', {
			'id', "LowGHighrise",
			'display_name', T{6367, "Low-G High-rise"},
			'icon', "UI/Icons/Research/advanced_prefabs.tga",
			'description', T{6368, "New Building: <em>Apartments</em> (<buildinginfo('Apartments')>) - A Residential Building that houses many Colonists.\n\n<grey>\"I suggest that going to Mars means permanence on the planet - a mission by which we are building up a confidence level to become a two-planet species.\"\n<right>Buzz Aldrin</grey><left>"},
			'position', range(1, 5),
			'field', "Engineering",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockBuilding', {
				'Building', "Apartments",
			}),
			}),
		PlaceObj('Tech', {
			'id', "CompactPassengerModule",
			'display_name', T{6371, "Compact Passenger Module"},
			'icon', "UI/Icons/Research/compact_passenger_module.tga",
			'description', T{6372, "<em>Passenger Rockets</em> carry <param1> more Colonists.\n\n<grey>Better design patterns and lighter, tougher materials have all contributed to a more advanced and compact rocket passenger module.</grey>"},
			'position', range(6, 11),
			'param1comment', "Extra Colonists",
			'param1', 10,
			'field', "Engineering",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "Consts",
				'Prop', "MaxColonistsPerRocket",
				'Amount', 10,
			}),
			}),
		PlaceObj('Tech', {
			'id', "StorageCompression",
			'display_name', T{7999, "Storage Compression"},
			'icon', "UI/Icons/Research/storage_compression.tga",
			'description', T{8000, "Water, Oxygen and Power <em>storage</em> capacity expanded by <param1>%.\n\n<grey>Life support reserves are essential for the survival of the Colony. Fortunately, a new method of compressing fluids in low-gravity environments can help us increase our reserve capacity greatly.</grey>"},
			'position', range(6, 11),
			'param1comment', "Expanded Capacity %",
			'param1', 50,
			'field', "Engineering",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "WaterTank",
				'Prop', "water_capacity",
				'Percent', 50,
			}),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "OxygenTank",
				'Prop', "air_capacity",
				'Percent', 50,
			}),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "Battery_WaterFuelCell",
				'Prop', "capacity",
				'Percent', 50,
			}),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "AtomicBattery",
				'Prop', "capacity",
				'Percent', 50,
			}),
			}),
		PlaceObj('Tech', {
			'id', "LowGEngineering",
			'display_name', T{6373, "Low-G Engineering"},
			'icon', "UI/Icons/Research/low-g_engineering.tga",
			'description', T{6374, "New Dome: <em>Medium</em> (<buildinginfo('DomeMedium')>) - A medium-sized Dome.\n\n<grey>Gaining experience in actually building constructions on Mars rather than just hypothesizing has vastly advanced our off-Earth architectural capabilities.</grey>"},
			'position', range(6, 11),
			'field', "Engineering",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockBuilding', {
				'Building', "DomeMedium",
			}),
			}),
		PlaceObj('Tech', {
			'id', "SustainableArchitecture",
			'display_name', T{6375, "Sustainable Architecture"},
			'icon', "UI/Icons/Research/sustainable_architecture.tga",
			'description', T{6376, "<em>In-Dome buildings</em> require maintenance less often.\n\n<grey>Shifting focus away from \"fixing it\" to \"avoiding it\" is the natural step forward for any Martian habitat.</grey>"},
			'position', range(6, 11),
			'field', "Engineering",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "InsideBuildings",
				'Prop', "maintenance_threshold_base",
				'Percent', 20,
			}),
			}),
		PlaceObj('Tech', {
			'id', "SmartHome",
			'display_name', T{3533, "Smart Home"},
			'icon', "UI/Icons/Research/smart_home.tga",
			'description', T{6377, "New Buildings: <em>Smart Homes</em> (<buildinginfo('SmartHome_Small')>)  & <em>Smart Complex</em> (<buildinginfo('SmartHome')>) - Provides a very comfortable living space for Colonists. Residents will recover Sanity when resting.\n\n<grey>Perfecting the Martian household - for a better life beyond Earth.</grey>"},
			'position', range(6, 11),
			'field', "Engineering",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockBuilding', {
				'Building', "SmartHome",
			}),
			PlaceObj('TechEffect_UnlockBuilding', {
				'Building', "SmartHome_Small",
			}),
			}),
		PlaceObj('Tech', {
			'id', "MicroManufacturing",
			'display_name', T{8637, "Micro Manufacturing"},
			'icon', "UI/Icons/Research/micro_manufacturing.tga",
			'description', T{8638, "New Building: <em>Electronics Factory</em> (<buildinginfo('ElectronicsFactory')>) - Produces Electronics from Rare Metals.\n\n<grey>\"In the end, I hope there's a little note somewhere that says I designed a good computer.\"\n<right>Steve Wozniak</grey><left>"},
			'position', range(6, 11),
			'field', "Engineering",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockBuilding', {
				'Building', "ElectronicsFactory",
			}),
			}),
		PlaceObj('Tech', {
			'id', "Arcology",
			'display_name', T{3534, "Arcology"},
			'icon', "UI/Icons/Research/arcology.tga",
			'description', T{6378, "New Spire Building: <em>Arcology</em> (<buildinginfo('Arcology')>) - provides comfortable living space for many colonists.\n\n<grey>Martian settlements are becoming less just mere shelters and more of fully fledged cities –cities with unique vibes and even architecture.</grey>"},
			'position', range(12, 12),
			'field', "Engineering",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockBuilding', {
				'Building', "Arcology",
			}),
			}),
		PlaceObj('Tech', {
			'id', "MarsNoveau",
			'display_name', T{6379, "Mars Nouveau"},
			'icon', "UI/Icons/Research/mars_nouveau.tga",
			'description', T{6380, "Building construction costs in <em>Metals & Concrete</em> reduced by <param1>% (excluding Domes).\n\n<grey>A mix of off-world pride, a unique and ambitious style, and inspired creativity has resulted in more efficient structural design.</grey>"},
			'position', range(13, 18),
			'param1comment', "Cost Reduction %",
			'param1', 20,
			'field', "Engineering",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "InsideBuildings_Construction",
				'Prop', "construction_cost_Concrete",
				'Percent', -20,
			}),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "InsideBuildings_Construction",
				'Prop', "construction_cost_Metals",
				'Percent', -20,
			}),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "Decorations_Construction",
				'Prop', "construction_cost_Concrete",
				'Percent', -20,
			}),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "Decorations_Construction",
				'Prop', "construction_cost_Metals",
				'Percent', -20,
			}),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "OutsideBuildings_Construction",
				'Prop', "construction_cost_Concrete",
				'Percent', -20,
			}),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "OutsideBuildings_Construction",
				'Prop', "construction_cost_Metals",
				'Percent', -20,
			}),
			}),
		PlaceObj('Tech', {
			'id', "ResilientArchitecture",
			'display_name', T{6381, "Resilient Architecture"},
			'icon', "UI/Icons/Research/resilient_architecture.tga",
			'description', T{6382, "<em>Out-Dome buildings</em> require maintenance less often.\n\n<grey>There is a difference between knowing that conditions on Mars will take a heavy toll on man-made buildings and actually experiencing and fixing the damage done. The latter paints a better picture for improvement.</grey>"},
			'position', range(13, 18),
			'field', "Engineering",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "OutsideBuildings",
				'Prop', "maintenance_threshold_base",
				'Percent', 20,
			}),
			}),
		PlaceObj('Tech', {
			'id', "AdvancedPassengerModule",
			'display_name', T{6383, "Advanced Passenger Module"},
			'icon', "UI/Icons/Research/advanced_passenger_module.tga",
			'description', T{6384, "<em>Passenger Rockets</em> carry <param1> more Colonists.\n\n<grey>Cutting edge methods in space optimization and Comfort-centric designs make for a more practical Passenger Module.</grey>"},
			'position', range(13, 18),
			'param1comment', "Extra Colonists",
			'param1', 10,
			'field', "Engineering",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "Consts",
				'Prop', "MaxColonistsPerRocket",
				'Amount', 10,
			}),
			}),
		PlaceObj('Tech', {
			'id', "GravityEngineering",
			'display_name', T{6385, "Gravity Engineering"},
			'icon', "UI/Icons/Research/gravity_engineering.tga",
			'description', T{6386, "New Dome: <em>Mega</em> (<buildinginfo('DomeMega')>) - The most advanced and spacious Dome design.\n\n<grey>We have reached a proficiency in engineering that surpasses the most ambitious architectural achievements on Earth.</grey>"},
			'position', range(13, 18),
			'field', "Engineering",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockBuilding', {
				'Building', "DomeMega",
			}),
			}),
		PlaceObj('Tech', {
			'id', "PlasmaCutters",
			'display_name', T{6389, "Plasma Cutters"},
			'icon', "UI/Icons/Research/plasma_cutters.tga",
			'description', T{6390, "<em>Rare Metals Extractor</em> production increased by <param1>%.\n\n<grey>Introducing state of the art plasma torches to our Rare Metals Extractors show a great promise for boosts in production.</grey>"},
			'position', range(13, 18),
			'param1comment', "Bonus Production %",
			'param1', 50,
			'field', "Engineering",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "PreciousMetalsExtractor",
				'Prop', "production_per_day1",
				'Percent', 50,
			}),
			}),
		PlaceObj('Tech', {
			'id', "WasteRockLiquefaction",
			'display_name', T{6393, "Waste Rock Liquefaction"},
			'icon', "UI/Icons/Research/waste_rock_liquefaction.tga",
			'description', T{7671, "Drones can extract concrete from <em>Waste Rock</em> stored in Dumping Sites.\n\n<grey>The utilization of lots of waste rock by reprocessing it into becoming concrete-grade regolith as part of our \"Nothing Is Wasted\" efficiency policy.</grey>"},
			'position', range(13, 18),
			'field', "Engineering",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			}),
		PlaceObj('Tech', {
			'id', "OrbitalEngineering",
			'display_name', T{6395, "Orbital Engineering"},
			'icon', "UI/Icons/Research/orbital_engineering.tga",
			'description', T{6396, "Wonder: <em>Space Elevator</em> (<buildinginfo('SpaceElevator')>) - Exports Rare Metals to Earth and offers resupply materials and prefabs at preferential prices.\n\n<grey>\"The space elevator will be built about 50 years after everyone stops laughing.\"\n<right>Arthur C. Clarke</grey><left>"},
			'position', range(19, 19),
			'field', "Engineering",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockBuilding', {
				'Building', "SpaceElevator",
				'HideBuilding', true,
			}),
			}),
		}),
	PlaceObj('TechField', {
		'id', "Robotics",
		'display_name', T{6397, "ROBOTICS"},
		'icon', "UI/Icons/Research/robotics.tga",
		'description', T{6398, "The <em>Robotics</em> field deals with <em>Drones, Rovers and Shuttles</em>, as well as building <em>automation</em>."},
		'costs', {
			1000,
			1000,
			1500,
			1500,
			2000,
			2000,
			3000,
			3000,
			4500,
			4500,
			7000,
			7000,
			10000,
			10000,
			15000,
			15000,
			20000,
			20000,
			20000,
			30000,
			30000,
			40000,
		},
		'hex_direction', 5,
	}, {
		PlaceObj('Tech', {
			'id', "TransportOptimization",
			'display_name', T{6399, "Transport Optimization"},
			'icon', "UI/Icons/Research/transport_optimization.tga",
			'description', T{6400, "The <em>RC Transport</em> harvests resources faster and its maximum storage is increased by <param1>.\n\n<grey>The remote location of some resource deposits calls for Transport Rover optimizations.</grey>"},
			'position', range(1, 4),
			'param1comment', "Resource Capacity Bonus",
			'param1', 15,
			'field', "Robotics",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "Consts",
				'Prop', "RCTransportGatherResourceWorkTime",
				'Percent', -50,
			}),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "RCTransport",
				'Prop', "max_shared_storage",
				'Amount', 15,
			}),
			}),
		PlaceObj('Tech', {
			'id', "LowGDrive",
			'display_name', T{6401, "Low-G Drive"},
			'icon', "UI/Icons/Research/low-g_drive.tga",
			'description', T{6402, "<em>Drones</em> and <em>Rovers</em> move <param1>% faster.\n\n<grey>An engine design optimized for low-gravity environments.</grey>"},
			'position', range(1, 4),
			'param1comment', "Speed Bonus",
			'param1', 25,
			'field', "Robotics",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "Drone",
				'Prop', "move_speed",
				'Percent', 25,
			}),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "RCRover",
				'Prop', "move_speed",
				'Percent', 25,
			}),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "RCTransport",
				'Prop', "move_speed",
				'Percent', 25,
			}),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "ExplorerRover",
				'Prop', "move_speed",
				'Percent', 25,
			}),
			}),
		PlaceObj('Tech', {
			'id', "DroneSwarm",
			'display_name', T{6403, "Drone Swarm"},
			'icon', "UI/Icons/Research/drone_swarm.tga",
			'description', T{6404, "<em>Drone Hubs</em> are constructed with additional <param1> Drones and the maximum number of Drones is increased by <param2>.\n\n<grey>Drones being the backbone for most of the heavy and dangerous labor on Mars, it is essential our Hubs have greater operating capacity in order to employ more Drones at any given time.</grey>"},
			'position', range(1, 4),
			'param1comment', "Bonus Starting Drones",
			'param1', 2,
			'param2comment', "Max Number of Drones",
			'param2', 80,
			'field', "Robotics",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "DroneHub",
				'Prop', "starting_drones",
				'Amount', 2,
			}),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "Consts",
				'Prop', "CommandCenterMaxDrones",
				'Amount', 80,
			}),
			}),
		PlaceObj('Tech', {
			'id', "ExplorerAI",
			'display_name', T{6425, "Explorer AI"},
			'icon', "UI/Icons/Research/explorer_ai.tga",
			'description', T{6426, "Generate <research(param1)> per Sol for each <em>RC Explorer</em> vehicle. Multiple vehicles result in collaboration losses.\n\n<grey>AI specifically tailored for our Explorers will think for itself, gathering only the data they have deemed could be of interest. The above will greatly contribute to our research initiatives.</grey>"},
			'position', range(1, 4),
			'param1comment', "Research Points",
			'param1', 100,
			'field', "Robotics",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "Consts",
				'Prop', "ExplorerRoverResearchPoints",
				'Amount', 100,
			}),
			}),
		PlaceObj('Tech', {
			'id', "DroneHub",
			'display_name', T{3518, "Drone Hub"},
			'icon', "UI/Icons/Research/drone_hub.tga",
			'description', T{6407, "New Building: <em>Drone Hub</em> (<buildinginfo('DroneHub')>) - Controls Drones and allocates them to different jobs.\n\n<grey>We can now rely upon ourselves to build the complex Hubs that control our de facto heavy labor force.</grey>"},
			'position', range(5, 5),
			'field', "Robotics",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockBuilding', {
				'Building', "DroneHub",
			}),
			}),
		PlaceObj('Tech', {
			'id', "BatteryOptimization",
			'display_name', T{6405, "Battery Optimization"},
			'icon', "UI/Icons/Research/battery_optimization.tga",
			'description', T{6406, "<em>Drone</em> battery capacity increased by <param1>%.\n\n<grey>Advances in power accumulator technology allow Drones to function longer before needing to recharge.</grey>"},
			'position', range(6, 9),
			'param1comment', "Battery Bonus",
			'param1', 50,
			'field', "Robotics",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "Drone",
				'Prop', "battery_max",
				'Percent', 50,
			}),
			}),
		PlaceObj('Tech', {
			'id', "RoverCommandAI",
			'display_name', T{8001, "Rover Command AI"},
			'icon', "UI/Icons/Research/rover_command_ai.tga",
			'description', T{8002, "<em>Rovers</em> no longer need recharging. The <em>RC Rover</em> starts with <param1> additional Drones and command limit increased by <param2>. \n\n<grey>Developing a specialized AI with greater autonomy and advanced multitasking capabilities will allow our rovers to control more drones simultaneously.</grey>"},
			'position', range(6, 9),
			'param1comment', "Starting Drones",
			'param1', 4,
			'param2comment', "Max Drones",
			'param2', 12,
			'field', "Robotics",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "RCRover",
				'Prop', "starting_drones",
				'Amount', 4,
			}),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "Consts",
				'Prop', "RCRoverMaxDrones",
				'Amount', 12,
			}),
			}),
		PlaceObj('Tech', {
			'id', "DronePrinting",
			'display_name', T{6410, "Drone Printing"},
			'icon', "UI/Icons/Research/drone_printing.tga",
			'description', T{6411, "New Building: <em>Drone Assembler</em> (<buildinginfo('DroneFactory')>) - Constructs Drone Prefabs from Electronics which can then be used in Drone Hubs to construct new drones.\n\n<grey>We may now print and assemble entire Drones on Mars with Martian-mined materials.</grey>"},
			'position', range(6, 9),
			'field', "Robotics",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockBuilding', {
				'Building', "DroneFactory",
			}),
			}),
		PlaceObj('Tech', {
			'id', "3DMachining",
			'display_name', T{8639, "3D Machining"},
			'icon', "UI/Icons/Research/3d_machining.tga",
			'description', T{8640, "New Building: <em>Machine Parts Factory</em> (<buildinginfo('MachinePartsFactory')>) - Produces Machine Parts from Metals.\n\n<grey>Mastering the peculiarities of Martian ores has allowed us to make 3D Metal Printers, which will serve as the foundation for all future Martian industry.</grey>"},
			'position', range(6, 9),
			'field', "Robotics",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockBuilding', {
				'Building', "MachinePartsFactory",
			}),
			}),
		PlaceObj('Tech', {
			'id', "CO2JetPropulsion",
			'display_name', T{6414, "CO2 Jet Propulsion"},
			'icon', "UI/Icons/Research/co2_jet_propulsion.tga",
			'description', T{6415, "New Building: <em>Shuttle Hub</em> (<buildinginfo('ShuttleHub')>) - Houses and refuels Shuttles that facilitate <em>long-range transportation</em> of resources between Depots and resettling of Colonists between Domes.\n\n<grey>Adapting an air-breathing jet engine to work in the 95% carbon dioxide atmosphere of Mars is a challenge.</grey>"},
			'position', range(10, 10),
			'field', "Robotics",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockBuilding', {
				'Building', "ShuttleHub",
			}),
			}),
		PlaceObj('Tech', {
			'id', "FueledExtractors",
			'display_name', T{6408, "Fueled Extractors"},
			'icon', "UI/Icons/Research/fueled_extractors.tga",
			'description', T{6409, "Extractor Upgrade (<em>Fueled Extractor</em>) - Production increased by <param1>% as long as the building is supplied with Fuel.\n\n<grey>\"We should not just consume hydrocarbon fuel but use it to develop nuclear energy, hydro power and renewable energy sources.\"\n<right>Vladimir Putin<left></grey>"},
			'position', range(11, 13),
			'param1comment', "Production boost",
			'param1', 30,
			'field', "Robotics",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockUpgrade', {
				'Upgrade', "MetalsExtractor_FueledExtractor",
			}),
			PlaceObj('TechEffect_UnlockUpgrade', {
				'Upgrade', "PreciousMetalsExtractor_FueledExtractor",
			}),
			PlaceObj('TechEffect_UnlockUpgrade', {
				'Upgrade', "RegolithExtractor_FueledExtractor",
			}),
			PlaceObj('TechEffect_UnlockUpgrade', {
				'Upgrade', "WaterExtractor_FueledExtractor",
			}),
			}),
		PlaceObj('Tech', {
			'id', "FactoryAI",
			'display_name', T{5054, "Factory AI"},
			'icon', "UI/Icons/Research/factory_ai.tga",
			'description', T{6418, "Factory Upgrade (<em>Factory AI</em>) - performance increased by <param1>%.\n\n<grey>After extensive trials and the allocation of many resources to the program, a work-safe AI has been developed to optimize various Factory operations.</grey>"},
			'position', range(11, 13),
			'param1comment', "Production Bonus",
			'param1', 20,
			'field', "Robotics",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockUpgrade', {
				'Upgrade', "ElectronicsFactory_FactoryAI",
			}),
			PlaceObj('TechEffect_UnlockUpgrade', {
				'Upgrade', "MachinePartsFactory_FactoryAI",
			}),
			PlaceObj('TechEffect_UnlockUpgrade', {
				'Upgrade', "PolymerPlant_FactoryAI",
			}),
			PlaceObj('TechEffect_UnlockUpgrade', {
				'Upgrade', "FuelFactory_FactoryAI",
			}),
			}),
		PlaceObj('Tech', {
			'id', "MartianAerodynamics",
			'display_name', T{6421, "Martian Aerodynamics"},
			'icon', "UI/Icons/Research/martian_aerodynamics.tga",
			'description', T{6422, "<em>Shuttle</em> speed increased by <param1>%.\n\n<grey>Designing shuttles for flight in a low density/low pressure atmosphere is more efficient when designing them in a low density/low pressure atmosphere.</grey>"},
			'position', range(11, 13),
			'param1comment', "Speed Buff",
			'param1', 33,
			'field', "Robotics",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "CargoShuttle",
				'Prop', "max_speed",
				'Percent', 33,
			}),
			}),
		PlaceObj('Tech', {
			'id', "RoverPrinting",
			'display_name', T{6423, "Rover Printing"},
			'icon', "UI/Icons/Research/rover_printing.tga",
			'description', T{6424, "Can construct <em>RC Rover</em> (<buildinginfo('RCRoverBuilding')>), <em>RC Transport</em> (<buildinginfo('RCTransportBuilding')>) and <em>RC Explorer</em> (<buildinginfo('RCExplorerBuilding')>).\n\n<grey>Machine-part printing devices have reached a fidelity high enough to print the intricate parts necessary to assemble state of the art Rovers. </grey>"},
			'position', range(14, 14),
			'field', "Robotics",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockBuilding', {
				'Building', "RCRoverBuilding",
				'HideBuilding', true,
			}),
			PlaceObj('TechEffect_UnlockBuilding', {
				'Building', "RCTransportBuilding",
				'HideBuilding', true,
			}),
			PlaceObj('TechEffect_UnlockBuilding', {
				'Building', "RCExplorerBuilding",
				'HideBuilding', true,
			}),
			}),
		PlaceObj('Tech', {
			'id', "CompactHangars",
			'display_name', T{6427, "Compact Hangars"},
			'icon', "UI/Icons/Research/compact_hangars.tga",
			'description', T{6428, "The maximum number of Shuttles that the <em>Shuttle Hub</em> can house is increased by <param1>.\n\n<grey>Reaching heights unheard of in parking space sciences.</grey>"},
			'position', range(15, 17),
			'param1comment', "Max Shuttles",
			'param1', 4,
			'field', "Robotics",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "ShuttleHub",
				'Prop', "max_shuttles",
				'Amount', 4,
			}),
			}),
		PlaceObj('Tech', {
			'id', "HighPoweredJets",
			'display_name', T{6429, "High-powered Jets"},
			'icon', "UI/Icons/Research/high-powered_jets.tga",
			'description', T{6430, "<em>Shuttle</em> cargo capacity increased by <param1>.\n\n<grey>Advanced shuttle drives deliver more thrust and allow for greater cargo capacity.</grey>"},
			'position', range(15, 17),
			'param1comment', "Cargo Capacity Bonus",
			'param1', 3,
			'field', "Robotics",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "CargoShuttle",
				'Prop', "max_shared_storage",
				'Amount', 3,
			}),
			}),
		PlaceObj('Tech', {
			'id', "TheMartianNetwork",
			'display_name', T{6432, "The Martian Network"},
			'icon', "UI/Icons/Research/the_martian_network.tga",
			'description', T{6433, "New Spire Building: <em>Network Node</em> (<buildinginfo('NetworkNode')>) - increases the research output of all Research Labs and Hawking Institutes in the Dome.\n\n<grey>Rapid transfer of information and an easier access to it could speed up research several times-fold.</grey>"},
			'position', range(15, 17),
			'field', "Robotics",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockBuilding', {
				'Building', "NetworkNode",
			}),
			}),
		PlaceObj('Tech', {
			'id', "ProjectMohole",
			'display_name', T{6434, "Project Mohole"},
			'icon', "UI/Icons/Research/project_mohole.tga",
			'description', T{1076, "Wonder: <em>Mohole Mine</em> (<buildinginfo('MoholeMine')>) - Extracts Metals, Rare Metals and Waste Rock without the need of a deposit, while heating the surrounding area.\n\n<grey>Moholes are shafts that dig exceptionally deep in the Martian crust, releasing heat as part of a potential terraforming effort and, as a bonus, mining ore.</grey>"},
			'position', range(18, 18),
			'field', "Robotics",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockBuilding', {
				'Building', "MoholeMine",
				'HideBuilding', true,
			}),
			}),
		PlaceObj('Tech', {
			'id', "LargeScaleExcavation",
			'display_name', T{6436, "Large-scale Excavation"},
			'icon', "UI/Icons/Research/large-scale_excavation.tga",
			'description', T{6437, "Wonder: <em>The Excavator</em> (<buildinginfo('TheExcavator')>) - Produces Concrete directly from the Martian soil without requiring a deposit.\n\n<grey>Martian concrete, made from equal parts regolith and sulfur, has some vast improvements over its Earth counterpart. Red concrete is stronger, more durable and can be recycled and reused simply by reheating it.</grey>"},
			'position', range(19, 19),
			'field', "Robotics",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockBuilding', {
				'Building', "TheExcavator",
				'HideBuilding', true,
			}),
			}),
		}),
	PlaceObj('TechField', {
		'id', "Physics",
		'display_name', T{6438, "PHYSICS"},
		'icon', "UI/Icons/Research/physics.tga",
		'description', T{6439, "The <em>Physics</em> field deals with <em>Power</em> production, <em>exploration</em> and <em>disaster</em> safety."},
		'costs', {
			1000,
			1000,
			1500,
			1500,
			2000,
			2000,
			3000,
			3000,
			4500,
			4500,
			7000,
			7000,
			10000,
			10000,
			15000,
			15000,
			20000,
			20000,
			20000,
			30000,
			30000,
			40000,
		},
		'hex_direction', 4,
	}, {
		PlaceObj('Tech', {
			'id', "ExtractorAmplification",
			'display_name', T{6440, "Extractor Amplification"},
			'icon', "UI/Icons/Research/extractor_amplification.tga",
			'description', T{6441, "Extractor Upgrade (<em>Amplify</em>) - Increases production by <param1>% but also increases Power consumption by <power(param2)>.\n\n<grey>\"From the first day to this, sheer greed was the driving spirit of civilization.\"\n<right>Friedrich Engels</grey><left>"},
			'position', range(1, 5),
			'param1comment', "Production Bonus",
			'param1', 25,
			'param2comment', "Electricity",
			'param2', 10000,
			'field', "Physics",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockUpgrade', {
				'Upgrade', "MetalsExtractor_Amplify",
			}),
			PlaceObj('TechEffect_UnlockUpgrade', {
				'Upgrade', "PreciousMetalsExtractor_Amplify",
			}),
			PlaceObj('TechEffect_UnlockUpgrade', {
				'Upgrade', "RegolithExtractor_Amplify",
			}),
			PlaceObj('TechEffect_UnlockUpgrade', {
				'Upgrade', "WaterExtractor_Amplify",
			}),
			}),
		PlaceObj('Tech', {
			'id', "AutonomousSensors",
			'display_name', T{6442, "Autonomous Sensors"},
			'icon', "UI/Icons/Research/autonomous_sensors.tga",
			'description', T{6443, "<em>Sensor Towers</em> no longer require Power or maintenance.\n\n<grey>Reliable sensor data is instrumental for the exploration of Mars.</grey>"},
			'position', range(1, 5),
			'field', "Physics",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "SensorTower",
				'Prop', "disable_electricity_consumption",
				'Amount', 1,
			}),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "SensorTower",
				'Prop', "disable_maintenance",
				'Amount', 1,
			}),
			}),
		PlaceObj('Tech', {
			'id', "SubsurfaceHeating",
			'display_name', T{6452, "Subsurface Heating"},
			'icon', "UI/Icons/Research/subsurface_heating.tga",
			'description', T{6453, "New Building: <em>Subsurface Heater</em> (<buildinginfo('SubsurfaceHeater')>) - Increases the local temperature in cold areas and protects nearby buildings from Cold Waves. Consumes Water.\n\n<grey>Mars has an average surface temperature of −55 degrees Celsius, with inclinations to fall well beneath −130.</grey>"},
			'position', range(1, 5),
			'field', "Physics",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockBuilding', {
				'Building', "SubsurfaceHeater",
			}),
			}),
		PlaceObj('Tech', {
			'id', "LowGTurbines",
			'display_name', T{6446, "Low-G Turbines"},
			'icon', "UI/Icons/Research/low-g_turbines.tga",
			'description', T{6447, "Wind Turbine Upgrade (<em>Polymer Blades</em>): Power production increased by <param1>%.\n\n<grey>Hands-on observations and problem solving in the low gravity environment of Mars have helped our engineers come up with solutions for increased Wind Turbine efficiency.</grey>"},
			'position', range(1, 5),
			'param1comment', "Power Production Bonus",
			'param1', 33,
			'field', "Physics",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockUpgrade', {
				'Upgrade', "WindTurbine_PolymerBlades",
			}),
			}),
		PlaceObj('Tech', {
			'id', "AdaptedProbes",
			'display_name', T{6448, "Adapted Probes"},
			'icon', "UI/Icons/Research/adapted_probes.tga",
			'description', T{6449, "<em>Probes</em> are cheaper and can deep scan.\n\n<grey>\"The Universe is under no obligation to make sense to you.\" \n<right>Neil deGrasse Tyson</grey><left>"},
			'position', range(1, 5),
			'field', "Physics",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_ModifyResupplyParam', {
				'Item', "OrbitalProbe",
				'Percent', -50,
			}),
			}),
		PlaceObj('Tech', {
			'id', "StirlingGenerator",
			'display_name', T{3521, "Stirling Generator"},
			'icon', "UI/Icons/Research/stirling_generator.tga",
			'description', T{6450, "New Building: <em>Stirling Generator</em> (<buildinginfo('StirlingGenerator')>) - Generates Power. While closed the Generator is protected from dust, but produces less Power.\n\n<grey>The Stirling Radioisotope Generator is a generator based on a Stirling engine powered by a large radioisotope heater unit.</grey>"},
			'position', range(6, 6),
			'field', "Physics",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockBuilding', {
				'Building', "StirlingGenerator",
			}),
			}),
		PlaceObj('Tech', {
			'id', "AtomicAccumulator",
			'display_name', T{5013, "Atomic Accumulator"},
			'icon', "UI/Icons/Research/atomic_accumulator.tga",
			'description', T{6451, "New Building: <em>Atomic Accumulator</em> (<buildinginfo('AtomicBattery')>) - Stores electrical Power. Has huge capacity but charges slowly.\n\n<grey>\"History will remember the twentieth century for two technological developments: atomic energy and space flight.\"\n<right>Neil Armstrong</grey><left>"},
			'position', range(7, 9),
			'field', "Physics",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockBuilding', {
				'Building', "AtomicBattery",
			}),
			}),
		PlaceObj('Tech', {
			'id', "DustRepulsion",
			'display_name', T{6444, "Dust Repulsion"},
			'icon', "UI/Icons/Research/dust_repulsion.tga",
			'description', T{6445, "<em>Solar Panels</em> are gradually cleaned from dust when closed, resulting in less frequent maintenance.\n\n<grey>Solar Panels are inherently vulnerable to dust, more so than any other equipment used on Mars. Thus automatic dust repulsion systems are put in place to spread out maintenance periods.</grey>"},
			'position', range(7, 9),
			'param1comment', "Regen rate, as percentage of the normal maintenance accumulation.",
			'param1', 50,
			'field', "Physics",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			}),
		PlaceObj('Tech', {
			'id', "FactoryAmplification",
			'display_name', T{6454, "Factory Amplification"},
			'icon', "UI/Icons/Research/factory_amplification.tga",
			'description', T{6455, "Factory Upgrade (<em>Amplify</em>) - Increases production by <param1>% but also increases Power consumption by <power(param2)>.\n\n<grey>Scaling power production to meet the needs of manufacturing is a challenge on Mars.</grey>"},
			'position', range(7, 9),
			'param1comment', "Production Bonus",
			'param1', 25,
			'param2comment', "Power Increase",
			'param2', 20000,
			'field', "Physics",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockUpgrade', {
				'Upgrade', "ElectronicsFactory_Amplify",
			}),
			PlaceObj('TechEffect_UnlockUpgrade', {
				'Upgrade', "FuelFactory_Amplify",
			}),
			PlaceObj('TechEffect_UnlockUpgrade', {
				'Upgrade', "MachinePartsFactory_Amplify",
			}),
			PlaceObj('TechEffect_UnlockUpgrade', {
				'Upgrade', "PolymerPlant_Amplify",
			}),
			}),
		PlaceObj('Tech', {
			'id', "DeepScanning",
			'display_name', T{6456, "Deep Scanning"},
			'icon', "UI/Icons/Research/deep_scanning.tga",
			'description', T{6457, "Sectors can now be scanned again for <em>deep deposits</em>. Exploiting these deposits requires additional technologies.\n\n<grey>We've barely scratched the surface of what we can learn about the Martian environment.</grey>"},
			'position', range(10, 10),
			'field', "Physics",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "Consts",
				'Prop', "DeepScanAvailable",
				'Amount', 1,
			}),
			PlaceObj('TechEffect_UnlockDeeperDeposits', nil),
			}),
		PlaceObj('Tech', {
			'id', "DeepWaterExtraction",
			'display_name', T{6458, "Deep Water Extraction"},
			'icon', "UI/Icons/Research/deep_water_extraction.tga",
			'description', T{6459, "Can exploit <em>deep Water deposits</em>.\n\n<grey>Water reserves the size of Lake Superior are predicted to be present deep beneath the surface of Mars.</grey>"},
			'position', range(11, 17),
			'field', "Physics",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "Consts",
				'Prop', "IsDeepWaterExploitable",
				'Amount', 1,
			}),
			}),
		PlaceObj('Tech', {
			'id', "DeepMetalExtraction",
			'display_name', T{6460, "Deep Metal Extraction"},
			'icon', "UI/Icons/Research/deep_metal_extraction.tga",
			'description', T{6461, "Can exploit deep <em>Metal</em> and <em>Rare Metal</em> deposits.\n\n<grey>Digging deep can be dangerous but it is necessary for sustained metal production.</grey>"},
			'position', range(11, 17),
			'field', "Physics",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "Consts",
				'Prop', "IsDeepMetalsExploitable",
				'Amount', 1,
			}),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "Consts",
				'Prop', "IsDeepPreciousMetalsExploitable",
				'Amount', 1,
			}),
			}),
		PlaceObj('Tech', {
			'id', "NuclearFusion",
			'display_name', T{6466, "Nuclear Fusion"},
			'icon', "UI/Icons/Research/nuclear_fusion.tga",
			'description', T{6467, "New Building: <em>Fusion Reactor</em> (<buildinginfo('FusionReactor')>) - Generates Power. Out-Dome building which requires Workers to operate.\n\n<grey>\"I would like nuclear fusion to become a practical power source. It would provide an inexhaustible supply of energy, without pollution or global warming.\"\n<right>Stephen Hawking</grey><left>"},
			'position', range(11, 13),
			'field', "Physics",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockBuilding', {
				'Building', "FusionReactor",
			}),
			}),
		PlaceObj('Tech', {
			'id', "MeteorDefenseSystem",
			'display_name', T{6462, "Meteor Defense System"},
			'icon', "UI/Icons/Research/meteor_defense_system.tga",
			'description', T{6463, "New Building: <em>MDS Laser</em> (<buildinginfo('MDSLaser')>) - Destroys falling meteors in its range.\n\n<grey>The low density of the Martian atmosphere makes meteors especially dangerous; this is why installing a reliable defense system against meteors is critical for our Colony’s long term survival.</grey>"},
			'position', range(11, 17),
			'field', "Physics",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockBuilding', {
				'Building', "MDSLaser",
			}),
			}),
		PlaceObj('Tech', {
			'id', "TriboelectricScrubbing",
			'display_name', T{6468, "Triboelectric Scrubbing"},
			'icon', "UI/Icons/Research/triboelectric_scrubbing.tga",
			'description', T{6469, "New Building: <em>Triboelectric Scrubber</em> (<buildinginfo('TriboelectricScrubber')>) - Emits pulses which reduce the Dust accumulated on buildings in its range.\n\n<grey>While the triboelectric effect is not very predictable or precise, it can be entrusted with removing dust from our structures.</grey>"},
			'position', range(11, 17),
			'field', "Physics",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockBuilding', {
				'Building', "TriboelectricScrubber",
			}),
			}),
		PlaceObj('Tech', {
			'id', "ResearchAmplification",
			'display_name', T{6470, "Research Amplification"},
			'icon', "UI/Icons/Research/research_amplification.tga",
			'description', T{6471, "Research Labs, Hawking Institutes and the Network Node Upgrade (<em>Amplify</em>) - Increases production by <param1>% but also increases Power consumption.\n\n<grey>The speed of the calculations and research efficiency grows with the amount of power invested.</grey>"},
			'position', range(11, 17),
			'param1comment', "Power Bonus",
			'param1', 25,
			'field', "Physics",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockUpgrade', {
				'Upgrade', "ResearchLab_Amplify",
			}),
			PlaceObj('TechEffect_UnlockUpgrade', {
				'Upgrade', "ScienceInstitute_Amplify",
			}),
			PlaceObj('TechEffect_UnlockUpgrade', {
				'Upgrade', "NetworkNode_Amplify",
			}),
			}),
		PlaceObj('Tech', {
			'id', "FusionAutoregulation",
			'display_name', T{6472, "Fusion Autoregulation"},
			'icon', "UI/Icons/Research/fusion_autoregulation.tga",
			'description', T{6473, "Fusion Reactor Upgrade (<em>Auto-regulator</em>) - reduces the amount of workers.\n\n<grey>\"Our present nuclear fusion reactors are classified by the methods used to support the nuclear fusion reaction, which takes place at a temperature much hotter than the surface of the Sun.\"\n<right>Wilson Greatbatch</grey><left>"},
			'position', range(15, 17),
			'field', "Physics",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockUpgrade', {
				'Upgrade', "FusionReactor_Autoregulator",
			}),
			}),
		PlaceObj('Tech', {
			'id', "MicroFusion",
			'display_name', T{6476, "Micro Fusion"},
			'icon', "UI/Icons/Research/micro_fusion.tga",
			'description', T{6477, "Wonder: <em>Artificial Sun</em> (<buildinginfo('ArtificialSun')>) - Produces colossal amounts of Power. It provides light for nearby Solar Panels during the dark hours and heats the surrounding area. Consumes vast amounts of Water on startup.\n\n<grey>Unlocking the secrets of the stars is now within the grasp of humanity.</grey>"},
			'position', range(18, 18),
			'field', "Physics",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockBuilding', {
				'Building', "ArtificialSun",
				'HideBuilding', true,
			}),
			}),
		PlaceObj('Tech', {
			'id', "InterplanetaryAstronomy",
			'display_name', T{6478, "Interplanetary Astronomy"},
			'icon', "UI/Icons/Research/interplanetary_astronomy.tga",
			'description', T{6479, "Wonder: <em>Omega Telescope</em> (<buildinginfo('OmegaTelescope')>) - Gives access to new Breakthrough Technologies and boosts overall research.\n\n<grey>A milestone in human history has been achieved – feeling comfortable enough living on an alien world, so much so that some people are already turning their curiosity towards the endless expanse of space once more.</grey>"},
			'position', range(19, 19),
			'field', "Physics",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockBuilding', {
				'Building', "OmegaTelescope",
				'HideBuilding', true,
			}),
			}),
		}),
	PlaceObj('TechField', {
		'id', "Social",
		'display_name', T{6480, "SOCIAL"},
		'icon', "UI/Icons/Research/social.tga",
		'description', T{6481, "The <em>Social</em> field deals with <em>Colonists</em>, <em>traits</em>, Martian <em>society</em> and <em>Funding</em>."},
		'costs', {
			1000,
			1000,
			1500,
			1500,
			2000,
			2000,
			3000,
			3000,
			4500,
			4500,
			7000,
			7000,
			10000,
			10000,
			15000,
			15000,
			20000,
			20000,
			20000,
			30000,
			30000,
			40000,
		},
		'hex_direction', 3,
	}, {
		PlaceObj('Tech', {
			'id', "LiveFromMars",
			'display_name', T{6482, "\"Live From Mars\""},
			'icon', "UI/Icons/Research/live_from_mars.tga",
			'description', T{6483, "More <em>applicants</em> will start to appear on Earth.\n\n<grey>PR research aimed at exposing the benefits and positive aspects of life as a Colonist on Mars.</grey>"},
			'position', range(1, 5),
			'field', "Social",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "Consts",
				'Prop', "ApplicantGenerationInterval",
				'Percent', -25,
			}),
			}),
		PlaceObj('Tech', {
			'id', "ProductivityTraining",
			'display_name', T{6486, "Productivity Training"},
			'icon', "UI/Icons/Research/productivity_training.tga",
			'description', T{6487, "<em>Engineers and Geologists</em> have +<param1> performance when working in their specialty.\n\n<grey>\"Geologists have a saying - rocks remember.\"\n<right>Neil Armstrong</grey><left>"},
			'position', range(1, 5),
			'param1comment', "Perforamnce Bonus",
			'param1', 10,
			'field', "Social",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "engineer",
				'Prop', "preferred_workplace_performance_bonus",
				'Amount', 10,
			}),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "geologist",
				'Prop', "preferred_workplace_performance_bonus",
				'Amount', 10,
			}),
			}),
		PlaceObj('Tech', {
			'id', "EarthMarsInitiative",
			'display_name', T{6484, "Earth-Mars Initiative"},
			'icon', "UI/Icons/Research/earth-mars_initiative.tga",
			'description', T{6485, "Increases research provided by <em>sponsor</em> by <research(param1)>.\n\n<grey>\"Two planets, one human race – sharing knowledge and coexisting within the Solar System.\"\n<right>Martian Scientist</grey><left>"},
			'position', range(1, 5),
			'param1comment', "Reserach Points",
			'param1', 100,
			'field', "Social",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "Consts",
				'Prop', "SponsorResearch",
				'Amount', 100,
			}),
			}),
		PlaceObj('Tech', {
			'id', "SystematicTraining",
			'display_name', T{6488, "Systematic Training"},
			'icon', "UI/Icons/Research/systematic_training.tga",
			'description', T{6489, "<em>Scientists and Botanists</em> have +<param1> performance when working in their specialty.\n\n<grey>\"Hell yeah I'm a botanist! Fear my botany powers!\"\n<right>Andy Weir - The Martian</grey><left>"},
			'position', range(1, 5),
			'param1comment', "Performance Bonus",
			'param1', 10,
			'field', "Social",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "scientist",
				'Prop', "preferred_workplace_performance_bonus",
				'Amount', 10,
			}),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "botanist",
				'Prop', "preferred_workplace_performance_bonus",
				'Amount', 10,
			}),
			}),
		PlaceObj('Tech', {
			'id', "MarsHype",
			'display_name', T{6490, "Mars Crowdfunding"},
			'icon', "UI/Icons/Research/mars_crowdfunding.tga",
			'description', T{6491, "Receive a one-time grant of <em><funding(param1)></em> funding.\n\n<grey>With the rising media hype about our mission, it is only a matter of social maneuvering to make the first interplanetary crowdfunding campaign a reality.</grey>"},
			'position', range(1, 5),
			'param1comment', "Money",
			'param1', 1000000000,
			'field', "Social",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_GiveFunding', {
				'Funding', 1000,
			}),
			}),
		PlaceObj('Tech', {
			'id', "MartianEducation",
			'display_name', T{6492, "Martian Education"},
			'icon', "UI/Icons/Research/martian_education.tga",
			'description', T{6493, "New Building: <em>Martian University</em> (<buildinginfo('MartianUniversity')>) - Trains Scientists, Geologists, Botanists, Medic, Engineers or Security officers.\n\n<grey>College education is always free on Mars.</grey>"},
			'position', range(6, 6),
			'field', "Social",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockBuilding', {
				'Building', "MartianUniversity",
			}),
			}),
		PlaceObj('Tech', {
			'id', "MartianPatents",
			'display_name', T{6496, "Martian Patents"},
			'icon', "UI/Icons/Research/martian_patents.tga",
			'description', T{6497, "License Martian technology for use back on Earth. Earn <em><funding(param1)></em> funding.\n\nThis tech is <em>repeatable</em> and can be researched multiple times.\n\n<grey>\"Economic exchange between Mars and Earth would be mostly in the form of intellectual property\"\n<right>Elon Musk</grey><left>"},
			'position', range(7, 10),
			'repeatable', true,
			'param1comment', "Money",
			'param1', 500000000,
			'field', "Social",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_GiveFunding', {
				'Funding', 500,
			}),
			}),
		PlaceObj('Tech', {
			'id', "SupportiveCommunity",
			'display_name', T{6498, "Supportive Community"},
			'icon', "UI/Icons/Research/supportive_community.tga",
			'description', T{6499, "Lowers the risk of colonists developing flaws after <em>Sanity breakdown</em>.\n\n<grey>\"Beauty is not who you are on the outside, it is the wisdom and time you gave away to save another struggling soul like you.\"\n<right>Shannon L. Alder</grey><left>"},
			'position', range(7, 10),
			'field', "Social",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "Consts",
				'Prop', "LowSanityNegativeTraitChance",
				'Percent', -70,
			}),
			}),
		PlaceObj('Tech', {
			'id', "EmergencyTraining",
			'display_name', T{6500, "Emergency Training"},
			'icon', "UI/Icons/Research/emergency_training.tga",
			'description', T{6501, "<em>Security Officers and Medics</em> have +<param1> performance when working in their specialty.\n\n<grey>One can never be too prepared for the vast array of emergencies that could arise at any given moment on Mars.</grey>"},
			'position', range(7, 10),
			'param1comment', "Performance Bonus",
			'param1', 10,
			'field', "Social",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "security",
				'Prop', "preferred_workplace_performance_bonus",
				'Amount', 10,
			}),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "medic",
				'Prop', "preferred_workplace_performance_bonus",
				'Amount', 10,
			}),
			}),
		PlaceObj('Tech', {
			'id', "GeneralTraining",
			'display_name', T{7297, "General Training"},
			'icon', "UI/Icons/Research/general_training.tga",
			'description', T{7298, "Colonists without the proper <em>specialization</em> suffer a lower work penalty.\n\n<grey>“A jack of all trades is a master of none, but oftentimes better than a master of one.”</grey>"},
			'position', range(7, 10),
			'field', "Social",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "Consts",
				'Prop', "NonSpecialistPerformancePenalty",
				'Amount', -10,
			}),
			}),
		PlaceObj('Tech', {
			'id', "MartianInstituteOfScience",
			'display_name', T{6502, "Martian Institute of Science"},
			'icon', "UI/Icons/Research/martian_institute_of_science.tga",
			'description', T{6503, "New Building: <em>Hawking Institute</em> (<buildinginfo('ScienceInstitute')>) - Generates Research faster than a Research Lab.\n\n<grey>\"Look up at the stars and not down at your feet. Try to make sense of what you see, and wonder about what makes the universe exist. Be curious.\" \n<right>Stephen Hawking</grey><left>"},
			'position', range(11, 11),
			'field', "Social",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockBuilding', {
				'Building', "ScienceInstitute",
			}),
			}),
		PlaceObj('Tech', {
			'id', "BehavioralShaping",
			'display_name', T{6511, "Behavioral Shaping"},
			'icon', "UI/Icons/Research/behavioral_shaping.tga",
			'description', T{6512, "New Spire Building: <em>Sanatorium</em> (<buildinginfo('Sanatorium')>) - treats colonists to remove flaws.\n\n<grey>\"There are no constraints on the human mind, no walls around the human spirit, no barriers to our progress except those we ourselves erect.\"\n<right>Ronald Reagan</grey><left>"},
			'position', range(12, 14),
			'field', "Social",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockBuilding', {
				'Building', "Sanatorium",
			}),
			}),
		PlaceObj('Tech', {
			'id', "MartianFestivals",
			'display_name', T{6504, "Martian Festivals"},
			'icon', "UI/Icons/Research/martian_festivals.tga",
			'description', T{6505, "<em>Decorations</em> have increased Service Comfort.\n\n<grey>Reinforcing the notion of a separate and unique Martian culture makes our Colonists more positive and helps them find comfort in the uncertain world which is life on Mars.</grey>"},
			'position', range(12, 18),
			'field', "Social",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "Decorations",
				'Prop', "service_comfort",
				'Amount', 10,
			}),
			}),
		PlaceObj('Tech', {
			'id', "MartianbornStrength",
			'display_name', T{6506, "Martianborn Strength"},
			'icon', "UI/Icons/Research/martianborn_strenght.tga",
			'description', T{6507, "<em>Martianborn</em> don't take Sanity damage from disasters.\n\n<grey>Martianborn grow up in the reality of the everyday dangers of the Red Planet. It bestows upon them an inner strength that is truly a unique Martian quality.</grey>"},
			'position', range(12, 18),
			'field', "Social",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			}),
		PlaceObj('Tech', {
			'id', "MartianbornResilience",
			'display_name', T{6508, "Martianborn Resilience"},
			'icon', "UI/Icons/Research/martianborn_resilience.tga",
			'description', T{6509, "<em>Martianborn</em> don't take Sanity damage when working in out-Dome buildings.\n\n<grey>We are born on the Red Planet. We do not fear stepping outside the safety of the Dome. We embrace it.</grey>"},
			'position', range(12, 18),
			'field', "Social",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			}),
		PlaceObj('Tech', {
			'id', "HomeCollective",
			'display_name', T{5005, "Home Collective"},
			'icon', "UI/Icons/Research/home_collective.tga",
			'description', T{6510, "Residential Building Upgrade (<em>Home Collective</em>) - Increases the Service Comfort of the building by <param1>.\n\n<grey>A friendly and supportive community is the key to making life easier in the harsh reality of the Red Planet.</grey>"},
			'position', range(12, 18),
			'param1comment', "Service Comfort Bonus",
			'param1', 10,
			'field', "Social",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockUpgrade', {
				'Upgrade', "Appartments_HomeCollective",
			}),
			PlaceObj('TechEffect_UnlockUpgrade', {
				'Upgrade', "LivingQuarters_HomeCollective",
			}),
			PlaceObj('TechEffect_UnlockUpgrade', {
				'Upgrade', "SmartHome_HomeCollective",
			}),
			PlaceObj('TechEffect_UnlockUpgrade', {
				'Upgrade', "Arcology_HomeCollective",
			}),
			}),
		PlaceObj('Tech', {
			'id', "MartianCopyrithgts",
			'display_name', T{6515, "Martian Copyrights"},
			'icon', "UI/Icons/Research/martian_copyrights.tga",
			'description', T{6516, "License Martian copyrights for use back on Earth. Earn <em><funding(param1)></em> funding.\n\nThis tech is <em>repeatable</em> and can be researched multiple times.\n\n<grey>\"The conditions of extreme labor shortage combined with a technological culture will tend to drive Martian ingenuity to produce wave after wave of invention.\"\n<right>Robert Zubrin</grey><left>"},
			'position', range(12, 18),
			'repeatable', true,
			'param1', 2000000000,
			'field', "Social",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_GiveFunding', {
				'Funding', 2000,
			}),
			}),
		PlaceObj('Tech', {
			'id', "BehavioralMelding",
			'display_name', T{5243, "Behavioral Melding"},
			'icon', "UI/Icons/Research/behavioral_melding.tga",
			'description', T{6517, "Sanatorium Upgrade (<em>Behavioral Melding</em>) - replaces removed flaws with random Perks.\n\n<grey>A more benevolent and productive iteration of 18th century methods.</grey>"},
			'position', range(15, 18),
			'field', "Social",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockUpgrade', {
				'Upgrade', "Sanatorium_BehavioralMelding",
			}),
			}),
		PlaceObj('Tech', {
			'id', "DreamReality",
			'display_name', T{6518, "Dream Reality"},
			'icon', "UI/Icons/Research/dream_reality.tga",
			'description', T{6519, "Wonder: <em>Project Morpheus</em> (<buildinginfo('ProjectMorpheus')>) - Stimulates the development of new Perks in adult Colonists throughout the entire Colony.\n\n<grey>\"You take the red pill - you stay in Wonderland and I show you how deep the rabbit-hole goes.\"</grey>"},
			'position', range(19, 19),
			'field', "Social",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockBuilding', {
				'Building', "ProjectMorpheus",
				'HideBuilding', true,
			}),
			}),
		}),
	PlaceObj('TechField', {
		'id', "Breakthroughs",
		'display_name', T{6520, "BREAKTHROUGH"},
		'costs', {
			2000,
			2000,
			3000,
			3000,
			4000,
			4000,
			6000,
			6000,
			9000,
			9000,
			14000,
			14000,
			20000,
			20000,
			30000,
			30000,
			40000,
			40000,
			40000,
			60000,
			60000,
			80000,
			80000,
		},
		'discoverable', false,
		'hex_direction', 2,
	}, {
		PlaceObj('Tech', {
			'id', "ConstructionNanites",
			'display_name', T{6521, "Construction Nanites "},
			'icon', "UI/Icons/Research/construction_nanites.tga",
			'description', T{6522, "<em>Buildings</em> construct themselves slowly without Drones. Nanites will seek out resources from nearby resource depots.\n\n<grey>With a payload of several molecules and an electronic instrument used for both navigating and knowing its purpose, Construction Nanites form slightly saturated winds which to the casual observer would seem to erect buildings as if by magic.</grey>"},
			'field', "Breakthroughs",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			}),
		PlaceObj('Tech', {
			'id', "HullPolarization",
			'display_name', T{6523, "Hull Polarization"},
			'icon', "UI/Icons/Research/hull_polarization.tga",
			'description', T{6524, "Buildings require <em>maintenance</em> less often.\n\n<grey>\"Don't confound static electricity with ecstatic eccentricity. One will leave your hair up, the other will live up in the air!\"\n<right>Ana Claudia Antunes</grey><left>"},
			'field', "Breakthroughs",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "Consts",
				'Prop', "BuildingMaintenancePointsModifier",
				'Percent', -25,
			}),
			}),
		PlaceObj('Tech', {
			'id', "ProjectPhoenix",
			'display_name', T{6525, "Project Phoenix"},
			'icon', "UI/Icons/Research/project_phoenix.tga",
			'description', T{6526, "When a colonist dies there's a <param1>% chance he or she is <em>reconstructed</em> as youth with the same traits.\n\n<grey>Like the legend of the Phoenix, all ends with beginnings. Consciousness being an electrical charge within a specific neuron pattern, replicating it eventually comes down to data fidelity.</grey>"},
			'param1comment', "Resurection Chance",
			'param1', 50,
			'field', "Breakthroughs",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			}),
		PlaceObj('Tech', {
			'id', "SoylentGreen",
			'display_name', T{6527, "Soylent Green"},
			'icon', "UI/Icons/Research/soylent_green.tga",
			'description', T{6528, "Bodies of <em>dead Colonists</em> are converted to Food.\n\n<grey>\"Soylent Green is made out of people. They are making food out of people and we know that. We are actually OK with that.\"</grey>"},
			'field', "Breakthroughs",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			}),
		PlaceObj('Tech', {
			'id', "NeuralEmpathy",
			'display_name', T{6529, "Neural Empathy"},
			'icon', "UI/Icons/Research/neural_empathy.tga",
			'description', T{6530, "Unlocks <em>Rare Trait - Empath</em>. Empaths raise the Morale of all Colonists in the Dome. The effect stacks with other Empaths.\n\n<grey>\"`The human brain has 100 billion neurons, each neuron connected to 10 thousand other neurons. Sitting on your shoulders is the most complicated object in the known universe.\"\n<right>Michio Kaku</grey><left>"},
			'param1comment', "Number of traits below which people are made Psions upon researching",
			'param1', 4,
			'param2comment', "Minimum number of new Empaths",
			'param2', 3,
			'param3comment', "Maximum number of new Empaths",
			'param3', 5,
			'field', "Breakthroughs",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockTrait', {
				'Trait', "Empath",
			}),
			}),
		PlaceObj('Tech', {
			'id', "RapidSleep",
			'display_name', T{6531, "Rapid Sleep"},
			'icon', "UI/Icons/Research/rapid_sleep.tga",
			'description', T{6532, "Colonists need to <em>sleep</em> for only 1 hour and regain extra Sanity when sleeping.\n\n<grey>\"Sleep, those little slices of death — how I loathe them.\" \n<right>Edgar Allan Poe</grey><left>"},
			'field', "Breakthroughs",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			}),
		PlaceObj('Tech', {
			'id', "ThePositronicBrain",
			'display_name', T{6533, "The Positronic Brain"},
			'icon', "UI/Icons/Research/the_positronic_brain.tga",
			'description', T{6534, "Allows the construction of <em>Biorobots</em> in the Drone Assembler. Biorobots eat and can gain traits but can't reproduce and never die from old age.\n\n<grey>The human body is basically a complex bio machine that could be easily replicated with the exception of one major component – the brain. Now that we have finally unlocked that secret we can manufacture human-like Biorobots the same way we manufacture cars.</grey><left>"},
			'field', "Breakthroughs",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			}),
		PlaceObj('Tech', {
			'id', "SafeMode",
			'display_name', T{4338, "Safe Mode"},
			'icon', "UI/Icons/Research/safe_mode.tga",
			'description', T{6535, "When a colonist suffers a Sanity breakdown, they fall asleep and wake up after <param1> hours with <param2> Sanity. Colonists can't commit suicide or gain flaws due to sanity breakdown.\n\n<grey>Failsafe systems have been in place and used to prevent catastrophes in various fields for centuries. Until now we had no viable way of remotely detecting when the brain was headed towards a meltdown. A means to remotely render people unconscious, however, was already available.</grey>"},
			'param1comment', "Hours of sleep when deactivation switch gets triggered",
			'param1', 6,
			'param2comment', "Percentage of maximum Sanity after sleep",
			'param2', 70,
			'field', "Breakthroughs",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			}),
		PlaceObj('Tech', {
			'id', "HiveMind",
			'display_name', T{6536, "Hive Mind "},
			'icon', "UI/Icons/Research/hive_mind.tga",
			'description', T{6537, "Residents in the <em>Arcology</em> get a bonus to work performance based on the number of unique perks and specializations of colonists living in the Arcology.\n\n<grey>\"The tools that a society uses to create and maintain itself are as central to human life as a hive is to bee life. Though the hive is not part of any individual bee, it is part of the colony, both shaped by and shaping the lives of its inhabitants.\"\n<right>Clay Shirky</grey><left>"},
			'field', "Breakthroughs",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			}),
		PlaceObj('Tech', {
			'id', "SpaceRehabilitation",
			'display_name', T{6538, "Space Rehabilitation"},
			'icon', "UI/Icons/Research/space_rehabilitation.tga",
			'description', T{6539, "Colonists have a <param1>% chance to lose a <em>flaw</em> on their journey to Mars.\n\n<grey>It is never too late to improve on oneself, and the months spent traversing the void between Mars and Earth gives ample opportunity to do so.</grey>"},
			'param1comment', "Chance",
			'param1', 50,
			'field', "Breakthroughs",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			}),
		PlaceObj('Tech', {
			'id', "WirelessPower",
			'display_name', T{6540, "Wireless Power"},
			'icon', "UI/Icons/Research/wireless_power.tga",
			'description', T{6541, "<em>Recharge Stations</em> service Drones in a <param1> hex-range instantly.\n\n<grey>Tesla once predicted that wireless power would be obtainable anywhere on Earth, illuminating and powering vehicles in the most remote of places. Ultimately his prediction came true – he only got the planet wrong.</grey>"},
			'param1comment', "Range",
			'param1', 3,
			'field', "Breakthroughs",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			}),
		PlaceObj('Tech', {
			'id', "PrintedElectronics",
			'display_name', T{6544, "Printed Electronics"},
			'icon', "UI/Icons/Research/printed_electronics.tga",
			'description', T{6545, "Allows <em>Drones Prefabs</em> to be constructed in the Drone Assembler using Metals instead of Electronics.\n\n<grey>Made entirely out of 2-dimensional nanomaterials, printed electronics combine effective electronic properties with low-cost production.</grey>"},
			'field', "Breakthroughs",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			}),
		PlaceObj('Tech', {
			'id', "CoreMetals",
			'display_name', T{6546, "Core Metals"},
			'icon', "UI/Icons/Research/core_metals.tga",
			'description', T{6547, "Uncovers extremely rich underground <em>Metal</em> deposits.\n\n<grey>Increased detail in reading traces of tectonic activities from eons ago has enabled us to accurately predict where to find high-grade metals deep in the crust, only relatively recently pushed up from the Martian mantle.</grey>"},
			'param1comment', "min deposits",
			'param1', 2,
			'param2comment', "max deposits",
			'param2', 4,
			'param3comment', "quantity",
			'param3', 50000,
			'field', "Breakthroughs",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			}),
		PlaceObj('Tech', {
			'id', "CoreWater",
			'display_name', T{6548, "Core Water"},
			'icon', "UI/Icons/Research/core_water.tga",
			'description', T{6549, "Uncovers extremely rich underground <em>Water</em> deposits.\n\n<grey>Primordial underground lakes in the nethermost regions of Mars’s crust have been accurately hypothesized and successfully pinpointed due to advances in our understanding of the Martian geological past.</grey>"},
			'param1comment', "min deposits",
			'param1', 2,
			'param2comment', "max deposits",
			'param2', 4,
			'param3comment', "quantity",
			'param3', 500000,
			'field', "Breakthroughs",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			}),
		PlaceObj('Tech', {
			'id', "CoreRareMetals",
			'display_name', T{6550, "Core Rare Metals"},
			'icon', "UI/Icons/Research/core_rare_metals.tga",
			'description', T{6551, "Uncovers extremely rich underground <em>Rare Metal</em> deposits.\n\n<grey>Applying new principles to chemical analysis of ancient crystallized magma has made it possible to locate several exceptionally potent Rare Metal veins deep underground.</grey>"},
			'param1comment', "min deposists",
			'param1', 2,
			'param2comment', "max deposits",
			'param2', 4,
			'param3comment', "quantity",
			'param3', 25000,
			'field', "Breakthroughs",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			}),
		PlaceObj('Tech', {
			'id', "SuperiorCables",
			'display_name', T{6552, "Superior Cables"},
			'icon', "UI/Icons/Research/superior_cables.tga",
			'description', T{6553, "Instant and free <em>power cable</em> construction. Power cables do not suffer from power faults.\n\n<grey>A hydrogel of high conductivity and electrical self-healing properties, without any external stimuli and of great strength and flexibility, has been developed based on Nanostructured Conductive Polymers.</grey>"},
			'field', "Breakthroughs",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "Consts",
				'Prop', "InstantCables",
				'Amount', 1,
			}),
			}),
		PlaceObj('Tech', {
			'id', "SuperiorPipes",
			'display_name', T{6554, "Superior Pipes"},
			'icon', "UI/Icons/Research/superior_pipes.tga",
			'description', T{6555, "Instant and free <em>pipe</em> construction. Pipes don't suffer from leaks.\n\n<grey>A pressure-induced, self-healing coating with remarkable insulation properties has been developed and field-tested to be used en masse on our pipe system.</grey>"},
			'field', "Breakthroughs",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "Consts",
				'Prop', "InstantPipes",
				'Amount', 1,
			}),
			}),
		PlaceObj('Tech', {
			'id', "AlienImprints",
			'display_name', T{6556, "Alien Imprints"},
			'icon', "UI/Icons/Research/alien_imprints.tga",
			'description', T{6557, "Uncovers new Anomalies – <em>Alien Artifacts</em> – which provide a boost to all research when scanned.\n\n<grey>Hard as it is to believe, our observations suggest that intelligent life has visited Mars long ago and that remnants of these visits could still be here. These artifacts could help us improve and expand our understanding of the universe.</grey>"},
			'param1comment', "min anomalies",
			'param1', 3,
			'param2comment', "max anomalies",
			'param2', 10,
			'field', "Breakthroughs",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			}),
		PlaceObj('Tech', {
			'id', "NocturnalAdaptation",
			'display_name', T{6562, "Nocturnal Adaptation"},
			'icon', "UI/Icons/Research/nocturnal_adaptation.tga",
			'description', T{6563, "All colonists gain +<param2>  performance during <em>night shifts</em>\n\n<grey>The greater distance from the Sun makes it so that all colonists have to cope with the psychological strain of receiving reduced sunlight. This fact, combined with newly discovered techniques allow us to considerably boost the productivity of those who work outright nightshifts.</grey>"},
			'param1comment', "target workshift",
			'param1', 3,
			'param2comment', "performance mod amount",
			'param2', 20,
			'param3comment', "performance mod percent",
			'field', "Breakthroughs",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			}),
		PlaceObj('Tech', {
			'id', "GeneSelection",
			'display_name', T{6564, "Gene Selection"},
			'icon', "UI/Icons/Research/gene_selection.tga",
			'description', T{6565, "Doubles the chance that a Colonist will have or gain a <em>rare trait</em>.\n\n<grey>Advanced and impeccably precise gene splicing instruments will now give us better control on the traits Colonists are born with on Mars.</grey>"},
			'param1comment', "bonus chance for rare traits",
			'param1', 100,
			'field', "Breakthroughs",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			}),
		PlaceObj('Tech', {
			'id', "MartianDiet",
			'display_name', T{6566, "Martian Diet"},
			'icon', "UI/Icons/Research/martian_diet.tga",
			'description', T{6567, "All Colonists consume <param1>% less <em>Food</em>.\n\n<grey>Radically changing eating habits that have been in place for centuries is made quite easier after changing the planet they were evolved on in the first place.</grey>"},
			'param1comment', "Consumption Reduction",
			'param1', 25,
			'field', "Breakthroughs",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "Consts",
				'Prop', "eat_food_per_visit",
				'Percent', -25,
			}),
			}),
		PlaceObj('Tech', {
			'id', "EternalFusion",
			'display_name', T{5088, "Eternal Fusion"},
			'icon', "UI/Icons/Research/eternal_fusion.tga",
			'description', T{6568, "Fusion Reactors Upgrade (<em>Eternal Fusion</em>) - Fusion Reactors no longer require <em>workers</em> and operate at <param1> performance.\n\n<grey>Our understanding of the once holy grail of energetics - Fusion Energy has reached the level where once a fusion reaction has been triggered, it can be left to regulate and sustain itself on its own… within a confined and safe medium of course.</grey>"},
			'param1comment', "Set Performance",
			'param1', 150,
			'field', "Breakthroughs",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockUpgrade', {
				'Upgrade', "FusionReactor_EternalFusion",
			}),
			}),
		PlaceObj('Tech', {
			'id', "SuperconductingComputing",
			'display_name', T{6569, "Superconducting Computing"},
			'icon', "UI/Icons/Research/superconducting_computing.tga",
			'description', T{6570, "Converts <em>unused Power</em> into Research Points.\n\n<grey>The ultra-cold environment that is Mars, combined with several recent breakthroughs in super conductors, has made the concept of superconductor computing, while still quite costly in terms of power, now manageable, thus opening the doors to the extremely fast superconductor computers.</grey>"},
			'field', "Breakthroughs",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "Consts",
				'Prop', "ElectricityForResearchPoint",
				'Amount', 16,
			}),
			}),
		PlaceObj('Tech', {
			'id', "NanoRefinement",
			'display_name', T{6571, "Nano Refinement"},
			'icon', "UI/Icons/Research/nano_refinement.tga",
			'description', T{6572, "All Extractors continue to extract small amounts when their <em>deposit is depleted</em>.\n\n<grey>Leaving scattered molecules of the precious resource a mining facility was tasked with extracting has always bothered scientists as being just too cynically wasteful. Luckily, with new Nano Refinement precision tools, this wasteful tendency has been remedied.</grey>"},
			'field', "Breakthroughs",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			}),
		PlaceObj('Tech', {
			'id', "ArtificialMuscles",
			'display_name', T{6573, "Artificial Muscles"},
			'icon', "UI/Icons/Research/artificial_muscles.tga",
			'description', T{6574, "Drones carry <em>two resources</em> at once.\n\n<grey>Nature has long provided inspiration for technological advances. Muscles made from carbon fiber are the latest example of cutting-edge biotech and, mixed with Mars’s low gravity, our Drones have basically doubled their carrying capacity.</grey>"},
			'field', "Breakthroughs",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "Consts",
				'Prop', "DroneResourceCarryAmount",
				'Amount', 1,
			}),
			}),
		PlaceObj('Tech', {
			'id', "InspiringArchitecture",
			'display_name', T{6575, "Inspiring Architecture"},
			'icon', "UI/Icons/Research/inspiring_architecture.tga",
			'description', T{6576, "Colonists in Domes with a <em>Spire</em> have increased Morale.\n\n<grey>Even on the seemingly most ordinary of days, Colonists on Mars must never forget how extraordinary their lives actually are. Every time they pause from their newfound routines on this alien world and gaze upon the man-made spires that rise proudly towards the Martian sky, they will be reminded of the incredible feat their lives are part of.</grey>"},
			'param1', 20,
			'field', "Breakthroughs",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			}),
		PlaceObj('Tech', {
			'id', "GiantCrops",
			'display_name', T{6577, "Giant Crops"},
			'icon', "UI/Icons/Research/giant_crops.tga",
			'description', T{6578, "Unlocks giant crops which have an <em>increased Food output</em>.\n\n<grey>Gene editing the plant strains brought from Earth to Mars so they can better cope with some of the Martian environment’s peculiarities has allowed us to grow super-sized versions of their Earthling cousins.</grey>"},
			'OnGameInit', function (self, city)
LockCrop("Giant Leaf Crops", self.id)
LockCrop("Giant Wheat Grass", self.id)
LockCrop("Giant Potatoes", self.id)
LockCrop("Giant Wheat", self.id)
LockCrop("Giant Corn", self.id)
LockCrop("Giant Rice", self.id)
end,
			'OnResearchComplete', function (self, city)
UnlockCrop("Giant Leaf Crops", self.id)
UnlockCrop("Giant Wheat Grass", self.id)
UnlockCrop("Giant Potatoes", self.id)
UnlockCrop("Giant Wheat", self.id)
UnlockCrop("Giant Corn", self.id)
UnlockCrop("Giant Rice", self.id)
end,
			'field', "Breakthroughs",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			}),
		PlaceObj('Tech', {
			'id', "NeoConcrete",
			'display_name', T{6579, "Neo-Concrete"},
			'icon', "UI/Icons/Research/neo-concrete.tga",
			'description', T{6580, "Dome <em>Concrete costs</em> reduced by <param1>%.\n\n<grey>Mixing recently discovered materials made from Martian polymers with the Martian regolith have unlocked the wonder material that is Neo-Concrete. It is vastly stronger, yet lighter than its predecessor.</grey>"},
			'param1comment', "Cost Reduction",
			'param1', 80,
			'field', "Breakthroughs",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "Domes_Construction",
				'Prop', "construction_cost_Concrete",
				'Percent', -80,
			}),
			}),
		PlaceObj('Tech', {
			'id', "AdvancedDroneDrive",
			'display_name', T{6581, "Advanced Drone Drive"},
			'icon', "UI/Icons/Research/advanced_drone_drive.tga",
			'description', T{6582, "<em>Drones</em> move <param1>% faster.\n\n<grey>Our engineers have unveiled the first motor design to replace the old engines of our drones that were created in Earth laboratories so long ago. This time we’ve combined all that is now known from having hands-on experience in dissecting a drone that has been doing field work on Mars for quite some time.</grey>"},
			'param1comment', "Speed Buff",
			'param1', 50,
			'field', "Breakthroughs",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "Drone",
				'Prop', "move_speed",
				'Percent', 50,
			}),
			}),
		PlaceObj('Tech', {
			'id', "DryFarming",
			'display_name', T{6583, "Dry Farming"},
			'icon', "UI/Icons/Research/dry_farming.tga",
			'description', T{6584, "<em>Water</em> requirements of crops is reduced by <param1>%.\n\n<grey>By mixing lab-made chemicals with the Martian regolith we have created what passes for Martian soil, providing improved subsurface water retention and reducing the need for watering.</grey>"},
			'param1comment', "Water requirement reduction",
			'param1', 50,
			'field', "Breakthroughs",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "Farm",
				'Prop', "water_consumption",
				'Percent', -50,
			}),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "HydroponicFarm",
				'Prop', "water_consumption",
				'Percent', -50,
			}),
			}),
		PlaceObj('Tech', {
			'id', "MartianSteel",
			'display_name', T{6585, "Martian Steel"},
			'icon', "UI/Icons/Research/martian_steel.tga",
			'description', T{6586, "Lowers <em>Metals</em> costs for building construction by <param1>%.\n\n<grey>The unique composition of Martian ore has finally been thoroughly understood and new smelting techniques have been developed accordingly.</grey>"},
			'param1comment', "Cost Reduction",
			'param1', 25,
			'field', "Breakthroughs",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "Consts",
				'Prop', "Metals_cost_modifier",
				'Percent', -25,
			}),
			}),
		PlaceObj('Tech', {
			'id', "VectorPump",
			'display_name', T{5171, "Vector Pump"},
			'icon', "UI/Icons/Research/vector_pump.tga",
			'description', T{6587, "Moisture Vaporator Upgrade (<em>Vector Pump</em>) - Water production increased by 100%.\n\n<grey>A new atmosphere pump design that doubles the volume of air processed by our Vaporators in a single Sol.</grey>"},
			'field', "Breakthroughs",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockUpgrade', {
				'Upgrade', "VectorPump",
			}),
			}),
		PlaceObj('Tech', {
			'id', "Superfungus",
			'display_name', T{5081, "Superfungus"},
			'icon', "UI/Icons/Research/superfungus.tga",
			'description', T{6588, "Fungal Farm Upgrade (<em>Superfungus</em>) - Increases production while increasing Oxygen consumption.\n\n<grey>Historically, lab mistakes involving fungi have rarely been a cause for celebration. A recent mishap in the lab seems to be an exception, as we have created a new breed of fungi which hold much promise.</grey>"},
			'field', "Breakthroughs",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockUpgrade', {
				'Upgrade', "SuperfungusUpgrade",
			}),
			}),
		PlaceObj('Tech', {
			'id', "HypersensitivePhotovoltaics",
			'display_name', T{6589, "Hypersensitive Photovoltaics"},
			'icon', "UI/Icons/Research/hypersensitive_photovoltaics.tga",
			'description', T{6590, "Solar Panels and Large Solar Panels <em>Power production</em> increased by <param1>%.\n\n<grey>An abundance of field experience has culminated in our engineers creating the perfect solar cells made specifically for the Martian atmosphere dust consistency.</grey>"},
			'param1comment', "Production Bonus",
			'param1', 100,
			'field', "Breakthroughs",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "SolarPanel",
				'Prop', "electricity_production",
				'Percent', 100,
			}),
			}),
		PlaceObj('Tech', {
			'id', "FrictionlessComposites",
			'display_name', T{6591, "Frictionless Composites"},
			'icon', "UI/Icons/Research/frictionless_composites.tga",
			'description', T{6592, "Wind Turbines <em>Power production</em> increased by <param1>%.\n\n<grey>Through clever application of graphene and carbon based frictionless materials, we have managed to maximize the push of the Martian wind while minimizing the friction which slows down the rotor’s rotation cycle, thus delivering far more bang for every buck of wind.</grey>"},
			'param1comment', "Production Bonus",
			'param1', 100,
			'field', "Breakthroughs",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "WindTurbine",
				'Prop', "electricity_production",
				'Percent', 100,
			}),
			}),
		PlaceObj('Tech', {
			'id', "ZeroSpaceComputing",
			'display_name', T{5232, "Zero-Space Computing"},
			'icon', "UI/Icons/Research/zero-space_computing.tga",
			'description', T{6593, "Research Lab & Hawking Institute Upgrade (<em>Zero-Space Computing</em>) - Research points production increased.\n\n<grey>Thinking outside the box, Martian mathematicians have begun developing a new mathematical apparatus which will open the doors to new scientific models and theories.</grey>"},
			'field', "Breakthroughs",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockUpgrade', {
				'Upgrade', "ResearchLab_ZeroSpace",
			}),
			PlaceObj('TechEffect_UnlockUpgrade', {
				'Upgrade', "ScienceInsitiute_ZeroSpace",
			}),
			}),
		PlaceObj('Tech', {
			'id', "MultispiralArchitecture",
			'display_name', T{6594, "Multispiral Architecture"},
			'icon', "UI/Icons/Research/multispiral_architecture.tga",
			'description', T{6595, "New Dome: <em>Oval Dome</em> (<buildinginfo('DomeOval')>) - An elongated Dome which has space for two Spires.\n\n<grey>A new, domestic approach to construction provides the same structural safety of our Domes while providing additional space for Spires.</grey>"},
			'field', "Breakthroughs",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockBuilding', {
				'Building', "DomeOval",
			}),
			}),
		PlaceObj('Tech', {
			'id', "MagneticExtraction",
			'display_name', T{5030, "Magnetic Extraction"},
			'icon', "UI/Icons/Research/magnetic_extraction.tga",
			'description', T{6596, "Extractor Upgrade (<em>Magnetic Extraction</em>) - Production increased by <param1>%.\n\n<grey>We have progressed upon fringe mining technologies, developing safe ways to bring Magnetic Extraction to our mines on Mars.</grey>"},
			'param1comment', "Production Bonus",
			'param1', 50,
			'field', "Breakthroughs",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockUpgrade', {
				'Upgrade', "MetalsExtractor_MagneticExtraction",
			}),
			PlaceObj('TechEffect_UnlockUpgrade', {
				'Upgrade', "PreciousMetalsExtractor_MagneticExtraction",
			}),
			PlaceObj('TechEffect_UnlockUpgrade', {
				'Upgrade', "RegolithExtractor_MagneticExtraction",
			}),
			PlaceObj('TechEffect_UnlockUpgrade', {
				'Upgrade', "WaterExtractor_MagneticExtraction",
			}),
			}),
		PlaceObj('Tech', {
			'id', "SustainedWorkload",
			'display_name', T{6597, "Sustained Workload"},
			'icon', "UI/Icons/Research/sustainable_overtime.tga",
			'description', T{6598, "Doubles the performance bonus when Colonists are working on a <em>heavy workload</em>.\n\n<grey>When every citizen knows that their efficiency more or less impacts the survival chances of the entire Colony, it becomes a matter of pride to work hard.</grey>"},
			'field', "Breakthroughs",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "Consts",
				'Prop', "OvertimedShiftPerformance",
				'Percent', 100,
			}),
			}),
		PlaceObj('Tech', {
			'id', "ForeverYoung",
			'display_name', T{6599, "Forever Young"},
			'icon', "UI/Icons/Research/forever_young.tga",
			'description', T{6600, "<em>Seniors</em> can work and have children.\n\n<grey>The golden years have officially been postponed indefinitely as a recent breakthrough has finally unlocked the fountain of youth. Every man and woman on Mars has now the ability to remain within their most productive and fertile age forever.</grey>"},
			'field', "Breakthroughs",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			}),
		PlaceObj('Tech', {
			'id', "MartianbornIngenuity",
			'display_name', T{6601, "Martianborn Ingenuity"},
			'icon', "UI/Icons/Research/martianborn_ingenuity.tga",
			'description', T{6602, "<em>Martianborn</em> gain <param1> performance.\n\n<grey>Growing up in a unique environment, combined with some creative gene therapy, makes people better problem solvers. Martianborn are brought up in a society which thrives on the idea that every extra effort counts and the smarter the effort, the better.</grey>"},
			'param1comment', "Performance Bonus",
			'param1', 10,
			'field', "Breakthroughs",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			}),
		PlaceObj('Tech', {
			'id', "CryoSleep",
			'display_name', T{6603, "Cryo-sleep"},
			'icon', "UI/Icons/Research/cryo-sleep.tga",
			'description', T{6604, "<em>Passenger Rockets</em> carry <param1> more Colonists.\n\n<grey>Putting our Colonists in a state of suspended animation for the duration of the flight to Mars greatly reduces the space needed for a single Colonist on the rocket. Cryo-tubes will allow us to transport more Colonists on a single rocket.</grey>"},
			'param1comment', "Passengers",
			'param1', 20,
			'field', "Breakthroughs",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "Consts",
				'Prop', "MaxColonistsPerRocket",
				'Amount', 20,
			}),
			}),
		PlaceObj('Tech', {
			'id', "Cloning",
			'display_name', T{7915, "Cloning"},
			'icon', "UI/Icons/Research/cloning.tga",
			'description', T{7916, "New Spire Building: <em>Cloning Vats</em> (<buildinginfo('CloningVats')>) - creates Clones over time. Cloned colonists grow and age twice as fast.\n\n<grey>\"Clones can think creatively. You will find that they are immensely superior to drones.\"\n<right>Unnamed Martian Scientist</grey><left>"},
			'field', "Breakthroughs",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockBuilding', {
				'Building', "CloningVats",
			}),
			}),
		PlaceObj('Tech', {
			'id', "GoodVibrations",
			'display_name', T{7917, "Good Vibrations"},
			'icon', "UI/Icons/Research/good_vibrations.tga",
			'description', T{7918, "<em>Domes</em> restore Sanity to their inhabitants every Sol.\n\n<grey>Who knew that emitting a low level vibration could affect the human psyche in such a way?</grey>"},
			'field', "Breakthroughs",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "Dome",
				'Prop', "DailySanityRecoverDome",
				'Amount', 5,
			}),
			}),
		PlaceObj('Tech', {
			'id', "DomeStreamlining",
			'display_name', T{7919, "Dome Streamlining"},
			'icon', "UI/Icons/Research/dome_streamlining.tga",
			'description', T{7920, "<em>Domes</em> cost <param1>% less basic resources.\n\n<grey>Mastering of certain techniques, singled out to be crucial to the entire construction process, will result in the drop of Dome construction costs.</grey>"},
			'param1comment', "Cost Reduction",
			'param1', 50,
			'field', "Breakthroughs",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_ModifyConstructionCost', {
				'Building', "GeoscapeDome",
				'Resource', "Concrete",
				'Percent', -50,
			}),
			PlaceObj('TechEffect_ModifyConstructionCost', {
				'Building', "GeoscapeDome",
				'Resource', "Metals",
				'Percent', -50,
			}),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "Domes_Construction",
				'Prop', "construction_cost_Concrete",
				'Percent', -50,
			}),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "Domes_Construction",
				'Prop', "construction_cost_Metals",
				'Percent', -50,
			}),
			}),
		PlaceObj('Tech', {
			'id', "PrefabCompression",
			'display_name', T{7921, "Prefab Compression"},
			'icon', "UI/Icons/Research/prefab_compression.tga",
			'description', T{7922, "All <em>Spires</em> can be ordered as prefabs from Earth.\n\n<grey>The ever-increasing miniaturization of technology along with different modules has made it possible to transport the structural behemoths known as Spires all the way from Earth.</grey>"},
			'field', "Breakthroughs",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockResupplyItem', {
				'Item', "Arcology",
			}),
			PlaceObj('TechEffect_UnlockResupplyItem', {
				'Item', "WaterReclamationSystem",
			}),
			PlaceObj('TechEffect_UnlockResupplyItem', {
				'Item', "Sanatorium",
			}),
			PlaceObj('TechEffect_UnlockResupplyItem', {
				'Item', "NetworkNode",
			}),
			PlaceObj('TechEffect_UnlockResupplyItem', {
				'Item', "MedicalCenter",
			}),
			PlaceObj('TechEffect_UnlockResupplyItem', {
				'Item', "HangingGardens",
			}),
			}),
		PlaceObj('Tech', {
			'id', "ExtractorAI",
			'display_name', T{7923, "Extractor AI"},
			'icon', "UI/Icons/Research/extractor_ai.tga",
			'description', T{7924, "<em>Metals Extractors</em> and <em>Rare Metals Extractors</em> can work without crews at <param1> performance.\n\n<grey>Extracting algorithms have been successfully implemented by new our Extractor AI, allowing for a certain degree of autonomy in mining operations.</grey>"},
			'param1comment', "Set Performance",
			'param1', 50,
			'field', "Breakthroughs",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "MetalsExtractor",
				'Prop', "automation",
				'Amount', 1,
			}),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "MetalsExtractor",
				'Prop', "auto_performance",
				'Amount', 50,
			}),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "PreciousMetalsExtractor",
				'Prop', "automation",
				'Amount', 1,
			}),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "PreciousMetalsExtractor",
				'Prop', "auto_performance",
				'Amount', 50,
			}),
			}),
		PlaceObj('Tech', {
			'id', "ServiceBots",
			'display_name', T{5020, "Service Bots"},
			'icon', "UI/Icons/Research/service_bots.tga",
			'description', T{7925, "<em>Non-medical Service Buildings</em> Upgrade (Service Bots) - service buildings no longer require workers and operate at <param1> performance.\n\n<grey>Freeing our colonists of dealing with the most mundane of chores.</grey>"},
			'param1comment', "Set Performance",
			'param1', 100,
			'field', "Breakthroughs",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockUpgrade', {
				'Upgrade', "Casino_ServiceBots",
			}),
			PlaceObj('TechEffect_UnlockUpgrade', {
				'Upgrade', "Diner_ServiceBots",
			}),
			PlaceObj('TechEffect_UnlockUpgrade', {
				'Upgrade', "Spacebar_ServiceBots",
			}),
			PlaceObj('TechEffect_UnlockUpgrade', {
				'Upgrade', "ShopElectronics_ServiceBots",
			}),
			PlaceObj('TechEffect_UnlockUpgrade', {
				'Upgrade', "ShopFood_ServiceBots",
			}),
			PlaceObj('TechEffect_UnlockUpgrade', {
				'Upgrade', "ShopJewelry_ServiceBots",
			}),
			}),
		PlaceObj('Tech', {
			'id', "OverchargeAmplification",
			'display_name', T{7926, "Overcharge Amplifications"},
			'icon', "UI/Icons/Research/overcharge_amplifications.tga",
			'description', T{7927, "<em>Amplify</em> upgrades grant a bigger boost to production.\n\n<grey>\"Power! Unlimited Power!\"\n<right>Sheev</grey><left>"},
			'field', "Breakthroughs",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_ModifyUprade', {
				'upgrade_id', "FuelFactory_Amplify",
				'prop', "production_per_day1",
				'percent', 20,
			}),
			PlaceObj('TechEffect_ModifyUprade', {
				'upgrade_id', "MachinePartsFactory_Amplify",
				'prop', "production_per_day1",
				'percent', 20,
			}),
			PlaceObj('TechEffect_ModifyUprade', {
				'upgrade_id', "MetalsExtractor_Amplify",
				'prop', "production_per_day1",
				'percent', 20,
			}),
			PlaceObj('TechEffect_ModifyUprade', {
				'upgrade_id', "PolymerPlant_Amplify",
				'prop', "production_per_day1",
				'percent', 20,
			}),
			PlaceObj('TechEffect_ModifyUprade', {
				'upgrade_id', "PreciousMetalsExtractor_Amplify",
				'prop', "production_per_day1",
				'percent', 20,
			}),
			PlaceObj('TechEffect_ModifyUprade', {
				'upgrade_id', "RegolithExtractor_Amplify",
				'prop', "production_per_day1",
				'percent', 20,
			}),
			PlaceObj('TechEffect_ModifyUprade', {
				'upgrade_id', "ElectronicsFactory_Amplify",
				'prop', "production_per_day1",
				'percent', 20,
			}),
			PlaceObj('TechEffect_ModifyUprade', {
				'upgrade_id', "ResearchLab_Amplify",
				'prop', "ResearchPointsPerDay",
				'percent', 20,
			}),
			PlaceObj('TechEffect_ModifyUprade', {
				'upgrade_id', "ScienceInstitute_Amplify",
				'prop', "ResearchPointsPerDay",
				'percent', 20,
			}),
			PlaceObj('TechEffect_ModifyUprade', {
				'upgrade_id', "WaterExtractor_Amplify",
				'prop', "water_production",
				'percent', 20,
			}),
			PlaceObj('TechEffect_ModifyUprade', {
				'upgrade_id', "NetworkNode_Amplify",
				'prop', "performance",
				'percent', 20,
			}),
			}),
		PlaceObj('Tech', {
			'id', "PlutoniumSynthesis",
			'display_name', T{7928, "Plutonium Synthesis"},
			'icon', "UI/Icons/Research/plutonium_synthesis.tga",
			'description', T{7929, "Stirling Generator Upgrade (<em>Plutonium Core</em>) - Increased Power production while opened.\n\n<grey>\"Nor are we the culmination of evolution, except in the sense that there has never been another species so bizarrely ingenious that it could create both iambic pentameter and plutonium.\"\n<right>David Quammen</grey><left>"},
			'field', "Breakthroughs",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockUpgrade', {
				'Upgrade', "StirlingGenerator_PlutoniumCore",
			}),
			}),
		PlaceObj('Tech', {
			'id', "InterplanetaryLearning",
			'display_name', T{7930, "Interplanetary Learning"},
			'icon', "UI/Icons/Research/interplanetary_learning.tga",
			'description', T{7931, "<em>Schools</em> can train the Workaholic and Hippie traits.\n\n<grey>Taking student exchange programs to a whole other level.</grey>"},
			'field', "Breakthroughs",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			}),
		PlaceObj('Tech', {
			'id', "Vocation-Oriented Society",
			'display_name', T{7932, "Vocation-Oriented Society"},
			'icon', "UI/Icons/Research/vocation-oriented_society.tga",
			'description', T{7933, "<em>Colonists</em> gain <param1> bonus work performance when all their stats are in the green.\n\n<grey>\"Frankly, though, I think most people can learn a lot more than they think they can.\"\n<right>Elon Musk</grey><left>"},
			'param1comment', "Performance Bonus",
			'param1', 10,
			'field', "Breakthroughs",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			}),
		PlaceObj('Tech', {
			'id', "PlasmaRocket",
			'display_name', T{8003, "Plasma Rocket"},
			'icon', "UI/Icons/Research/plasma_rocket.tga",
			'description', T{8004, "Rocket <em>travel time</em> to and from Earth reduced by <param1>%.\n\n<grey>Plasma engines have numerous advantages over chemical rockets. All that is left to do is make sure they don't explode on launch.</grey>"},
			'param1comment', "Travel time reduction",
			'param1', 50,
			'field', "Breakthroughs",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "Consts",
				'Prop', "TravelTimeEarthMars",
				'Percent', -50,
			}),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "Consts",
				'Prop', "TravelTimeMarsEarth",
				'Percent', -50,
			}),
			}),
		PlaceObj('Tech', {
			'id', "AutonomousHubs",
			'display_name', T{8005, "Autonomous Hubs"},
			'icon', "UI/Icons/Research/autonomous_hubs.tga",
			'description', T{8006, "<em>Drone Hubs</em> no longer require Power or maintenance.\n\n<grey>Self-sustainable Drone Hubs are of paramount importance in expanding our presence on Mars.</grey>"},
			'field', "Breakthroughs",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "DroneHub",
				'Prop', "disable_electricity_consumption",
				'Amount', 1,
			}),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "DroneHub",
				'Prop', "disable_maintenance",
				'Amount', 1,
			}),
			}),
		PlaceObj('Tech', {
			'id', "FactoryAutomation",
			'display_name', T{8641, "Factory Automation"},
			'icon', "UI/Icons/Research/factory_automation.tga",
			'description', T{8642, "Factory Upgrade (<em>Automation</em>) - Lowers the amount of Workers needed in factories.\n\n<grey>Robots are poised to take our jobs here on Mars as well.</grey>"},
			'field', "Breakthroughs",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockUpgrade', {
				'Upgrade', "ElectronicsFactory_Automation",
			}),
			PlaceObj('TechEffect_UnlockUpgrade', {
				'Upgrade', "PolymerPlant_Automation",
			}),
			PlaceObj('TechEffect_UnlockUpgrade', {
				'Upgrade', "MachinePartsFactory_Automation",
			}),
			}),
		}),
	PlaceObj('TechField', {
		'id', "Mysteries",
		'display_name', T{6607, "Mysteries"},
		'discoverable', false,
		'show_in_field', "Breakthroughs",
	}, {
		PlaceObj('Tech', {
			'id', "BlackCubesDisposal",
			'display_name', T{6608, "Dark Spectrometry"},
			'icon', "UI/Icons/Research/dark_spectrometry.tga",
			'description', T{6609, "A \"surface scratcher\" step towards understanding the elusive chemical properties of the mystery Cubes, what dangers the Cubes might pose and how to manage them."},
			'position', range(0, 2),
			'field', "Mysteries",
			'mystery', "BlackCubeMystery",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockBuilding', {
				'Building', "BlackCubeDump",
				'HideBuilding', true,
			}),
			PlaceObj('TechEffect_UnlockBuilding', {
				'Building', "BlackCubeSmallMonument",
				'HideBuilding', true,
			}),
			PlaceObj('TechEffect_UnlockBuilding', {
				'Building', "BlackCubeLargeMonument",
				'HideBuilding', true,
			}),
			}),
		PlaceObj('Tech', {
			'id', "BlackCubesNegation",
			'display_name', T{6610, "S.H.E.P.I.D."},
			'icon', "UI/Icons/Research/s.h.e.p.i.g..tga",
			'description', T{6611, "The Spontaneous High-Energy Particle Interception and Deflection technology allows our Sensor Towers to detect and guide the materialization of a Black Cube to a safe location."},
			'position', range(0, 2),
			'OnResearchComplete', function (self, city)
g_BCHexRangeEnable.SensorTower = true
end,
			'field', "Mysteries",
			'mystery', "BlackCubeMystery",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			}),
		PlaceObj('Tech', {
			'id', "AlienDiggersDestruction",
			'display_name', T{6612, "Dredger Morphology"},
			'icon', "UI/Icons/Research/digger_morphology.tga",
			'description', T{6613, "Aims to find a way to capture and dismantle an alien Dredger by studying its structure and physical properties."},
			'position', range(0, 2),
			'field', "Mysteries",
			'mystery', "DiggersMystery",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			}),
		PlaceObj('Tech', {
			'id', "AlienDiggersDetection",
			'display_name', T{6614, "Dredger Wavelength Decoding"},
			'icon', "UI/Icons/Research/digger_wavelength_decoding.tga",
			'description', T{6615, "An attempt to decode the transmissions sent out by Dredgers in order to predict their behavior and landing sites."},
			'position', range(0, 2),
			'field', "Mysteries",
			'mystery', "DiggersMystery",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			}),
		PlaceObj('Tech', {
			'id', "XenoExtraction",
			'display_name', T{6616, "Xeno-Extraction"},
			'icon', "UI/Icons/Research/xeno_extraction.tga",
			'description', T{6617, "Water Extractor, Concrete Extractor, Metals Extractor and Rare Metals Extractor gain +<param1>% bonus production.\n\n<grey>Studying the behavior and structure of the Dredgers, our scientists are able to develop revolutionary advancements in mining equipment and archaeological survey</grey>\n\n"},
			'position', range(0, 2),
			'param1comment', "Bonus Production",
			'param1', 50,
			'field', "Mysteries",
			'mystery', "DiggersMystery",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "WaterExtractor",
				'Prop', "water_production",
				'Percent', 50,
			}),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "MetalsExtractor",
				'Prop', "production_per_day1",
				'Percent', 50,
			}),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "PreciousMetalsExtractor",
				'Prop', "production_per_day1",
				'Percent', 50,
			}),
			PlaceObj('TechEffect_ModifyLabel', {
				'Label', "RegolithExtractor",
				'Prop', "production_per_day1",
				'Percent', 50,
			}),
			}),
		PlaceObj('Tech', {
			'id', "Purpose of the Spheres",
			'display_name', T{6618, "Purpose of the Spheres"},
			'icon', "UI/Icons/Research/purpose_of_the_spheres.tga",
			'description', T{6619, "Decoy Building that keeps single Spheres into captivity.\n\n<grey>A theory on the purpose of the Spheres, how they navigate and how to contain the threat that they represent.</grey> \n\n"},
			'field', "Mysteries",
			'mystery', "MirrorSphereMystery",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockBuilding', {
				'Building', "PowerDecoy",
				'HideBuilding', true,
			}),
			}),
		PlaceObj('Tech', {
			'id', "Anti-Sphere Shield",
			'display_name', T{6620, "Sphere Protection"},
			'icon', "UI/Icons/Research/anti_sphere_shield.tga",
			'description', T{6621, "A way to immunize our colonists from the negative health effects of the Mirror Spheres.\n"},
			'field', "Mysteries",
			'mystery', "MirrorSphereMystery",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			}),
		PlaceObj('Tech', {
			'id', "Xeno-Terraforming",
			'display_name', T{6622, "Xeno-Terraforming"},
			'icon', "UI/Icons/Research/xeno_terraforming.tga",
			'description', T{6623, "Mirror Spheres in captivity may be broken down to their building parts.\n\n<grey>An attempt at understanding the climate changing devices that are the Mirror Spheres.</grey>\n\n"},
			'field', "Mysteries",
			'mystery', "MirrorSphereMystery",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			}),
		PlaceObj('Tech', {
			'id', "DreamSimulation",
			'display_name', T{6624, "Dream Simulation"},
			'icon', "UI/Icons/Research/dream_simulation.tga",
			'description', T{7299, "Push to decipher the Dreamers’ brain patterns while in trance."},
			'field', "Mysteries",
			'mystery', "DreamMystery",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			}),
		PlaceObj('Tech', {
			'id', "NumberSixTracing",
			'display_name', T{6625, "Number Six Tracing"},
			'icon', "UI/Icons/Research/number_six_tracing.tga",
			'description', T{7300, "Track down Number Six's physical location."},
			'field', "Mysteries",
			'mystery', "AIUprisingMystery",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			}),
		PlaceObj('Tech', {
			'id', "DefenseTower",
			'display_name', T{7301, "Defence Turret"},
			'icon', "UI/Icons/Research/defense_turret.tga",
			'description', T{7302, "A stationary turret that protects the nearby area from hostile vehicles and incoming meteors."},
			'field', "Mysteries",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			PlaceObj('TechEffect_UnlockBuilding', {
				'Building', "DefenceTower",
				'HideBuilding', true,
			}),
			}),
		PlaceObj('Tech', {
			'id', "SolExploration",
			'display_name', T{8450, "Beyond Earth Initiative"},
			'icon', "UI/Icons/Research/solar_exploration.tga",
			'description', T{8451, "Focus your research to help the development of the Beyond Earth Initiative projects. Each time the research is completed you can refocus your research towards a new project.\n\nThis tech is <em>repeatable</em> and can be researched multiple times.\n\n<grey>\"The human race is a remarkable creature, one with great potential which I hope the Beyond Earth initiative will display for all to believe in.\"\n<right>Rede Goddenberry<left></grey>"},
			'repeatable', true,
			'field', "Mysteries",
			'mystery', "UnitedEarthMystery",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			}),
		PlaceObj('Tech', {
			'id', "WildfireCure",
			'display_name', T{8452, "Wildfire Cure"},
			'icon', "UI/Icons/Research/wildfire_cure.tga",
			'description', T{8487, "Series of dangerous experiments which could lead to the discovery of a cure for the Wildfire infection."},
			'OnGameInit', function (self, city)
LockCrop("Cure", self.id)
end,
			'OnResearchComplete', function (self, city)
UnlockCrop("Cure", self.id)
end,
			'field', "Mysteries",
			'mystery', "TheMarsBug",
		}, {
			PlaceObj('TechEffect_EditProps', nil),
			}),
		}),
	}
TechFields = {}
for i=1,#TechTree do
	local field = TechTree[i]
	TechFields[field.id] = field
end