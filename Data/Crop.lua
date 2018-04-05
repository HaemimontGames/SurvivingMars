-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('Crop', {
	'name', "Leaf Crops",
	'DisplayName', T{6987, --[[Crop Leaf Crops DisplayName]] "Leaf Crops"},
	'Desc', T{6988, --[[Crop Leaf Crops Desc]] "Good yield but slow growth"},
	'icon', "UI/Icons/Buildings/crops_leaf.tga",
	'FoodOutput', 12000,
	'WaterDemand', 600,
	'OxygenProduction', 100,
	'FarmClass', "FarmHydroponic",
	'CropEntity', "CropLettuce",
	'Priority', 5,
})

PlaceObj('Crop', {
	'name', "Giant Leaf Crops",
	'DisplayName', T{6989, --[[Crop Giant Leaf Crops DisplayName]] "Giant Leaf Crops"},
	'Desc', T{6988, --[[Crop Giant Leaf Crops Desc]] "Good yield but slow growth"},
	'icon', "UI/Icons/Buildings/crops_leaf_giant.tga",
	'FoodOutput', 16000,
	'WaterDemand', 600,
	'OxygenProduction', 100,
	'FarmClass', "FarmHydroponic",
	'CropEntity', "CropSpinachGiant",
	'Priority', 6,
})

PlaceObj('Crop', {
	'name', "Microgreens",
	'DisplayName', T{6990, --[[Crop Microgreens DisplayName]] "Microgreens"},
	'Desc', T{6991, --[[Crop Microgreens Desc]] "Low yield and slow growth, but require less Water"},
	'icon', "UI/Icons/Buildings/crops_herbs.tga",
	'FoodOutput', 10000,
	'WaterDemand', 300,
	'OxygenProduction', 100,
	'FarmClass', "FarmHydroponic",
	'CropEntity', "CropHerb",
	'Priority', 3,
})

PlaceObj('Crop', {
	'name', "Wheat Grass",
	'DisplayName', T{6992, --[[Crop Wheat Grass DisplayName]] "Wheat Grass"},
	'Desc', T{6993, --[[Crop Wheat Grass Desc]] "Low yield but grows very fast"},
	'icon', "UI/Icons/Buildings/crops_wheat_grass.tga",
	'FoodOutput', 2500,
	'InitialGrowthTime', 720000,
	'GrowthTime', 720000,
	'WaterDemand', 600,
	'OxygenProduction', 100,
	'FarmClass', "FarmHydroponic",
	'CropEntity', "CropWheatGrass",
})

PlaceObj('Crop', {
	'name', "Giant Wheat Grass",
	'DisplayName', T{6994, --[[Crop Giant Wheat Grass DisplayName]] "Giant Wheat Grass"},
	'Desc', T{6993, --[[Crop Giant Wheat Grass Desc]] "Low yield but grows very fast"},
	'icon', "UI/Icons/Buildings/crops_wheat_grass_giant.tga",
	'FoodOutput', 3500,
	'InitialGrowthTime', 720000,
	'GrowthTime', 720000,
	'WaterDemand', 600,
	'OxygenProduction', 100,
	'FarmClass', "FarmHydroponic",
	'CropEntity', "CropWheatGrassGiant",
	'Priority', 1,
})

PlaceObj('Crop', {
	'name', "Potatoes",
	'DisplayName', T{6995, --[[Crop Potatoes DisplayName]] "Potatoes"},
	'Desc', T{6996, --[[Crop Potatoes Desc]] "Good yield but grows slowly and depletes the soil, causing reduced yield of the next crop"},
	'icon', "UI/Icons/Buildings/crops_potato.tga",
	'FoodOutput', 55000,
	'InitialGrowthTime', 3600000,
	'GrowthTime', 3600000,
	'WaterDemand', 2400,
	'OxygenProduction', 300,
	'SoilEffect', -10,
	'FarmClass', "FarmConventional",
	'CropEntity', "CropPotatoes",
	'Priority', 2,
})

PlaceObj('Crop', {
	'name', "Cure",
	'DisplayName', T{8069, --[[Crop Cure DisplayName]] "Curetatos"},
	'Desc', T{8470, --[[Crop Cure Desc]] "Extract the cure for the Wildfire Infection from these potatoes."},
	'icon', "UI/Icons/Buildings/crops_cure_crop.tga",
	'FoodOutput', 10000,
	'ResourceType', "MysteryResource",
	'Locked', true,
	'InitialGrowthTime', 3600000,
	'GrowthTime', 3600000,
	'WaterDemand', 2400,
	'OxygenProduction', 300,
	'SoilEffect', -30,
	'FarmClass', "FarmConventional",
	'CropEntity', "CropPotatoes",
	'Priority', 2,
})

PlaceObj('Crop', {
	'name', "Giant Potatoes",
	'DisplayName', T{6997, --[[Crop Giant Potatoes DisplayName]] "Giant Potatoes"},
	'Desc', T{6996, --[[Crop Giant Potatoes Desc]] "Good yield but grows slowly and depletes the soil, causing reduced yield of the next crop"},
	'icon', "UI/Icons/Buildings/crops_potato_giant.tga",
	'FoodOutput', 80000,
	'InitialGrowthTime', 3600000,
	'GrowthTime', 3600000,
	'WaterDemand', 2400,
	'OxygenProduction', 300,
	'SoilEffect', -10,
	'FarmClass', "FarmConventional",
	'CropEntity', "CropPotatoesGiant",
	'Priority', 3,
})

PlaceObj('Crop', {
	'name', "Soybeans",
	'DisplayName', T{6998, --[[Crop Soybeans DisplayName]] "Soybeans"},
	'Desc', T{6999, --[[Crop Soybeans Desc]] "Low yield and grows slowly but improves the soil, increasing the yield of the next crop"},
	'icon', "UI/Icons/Buildings/crops_soybeans.tga",
	'FoodOutput', 40000,
	'InitialGrowthTime', 3600000,
	'GrowthTime', 3600000,
	'WaterDemand', 2000,
	'OxygenProduction', 300,
	'SoilEffect', 10,
	'FarmClass', "FarmConventional",
	'CropEntity', "CropSoybeans",
})

PlaceObj('Crop', {
	'name', "Wheat",
	'DisplayName', T{7000, --[[Crop Wheat DisplayName]] "Wheat"},
	'Desc', T{7001, --[[Crop Wheat Desc]] "Low yield but grows fast and requires less Water"},
	'icon', "UI/Icons/Buildings/crops_wheat.tga",
	'FoodOutput', 17000,
	'InitialGrowthTime', 1440000,
	'GrowthTime', 1440000,
	'WaterDemand', 1600,
	'OxygenProduction', 300,
	'FarmClass', "FarmConventional",
	'CropEntity', "CropWheat",
	'Priority', 5,
})

PlaceObj('Crop', {
	'name', "Giant Wheat",
	'DisplayName', T{7002, --[[Crop Giant Wheat DisplayName]] "Giant Wheat"},
	'Desc', T{7001, --[[Crop Giant Wheat Desc]] "Low yield but grows fast and requires less Water"},
	'icon', "UI/Icons/Buildings/crops_wheat_giant.tga",
	'FoodOutput', 23000,
	'InitialGrowthTime', 1440000,
	'GrowthTime', 1440000,
	'WaterDemand', 1600,
	'OxygenProduction', 300,
	'FarmClass', "FarmConventional",
	'CropEntity', "CropWheatGiant",
	'Priority', 6,
})

PlaceObj('Crop', {
	'name', "Algae",
	'DisplayName', T{7003, --[[Crop Algae DisplayName]] "Algae"},
	'Desc', T{7004, --[[Crop Algae Desc]] "Very low yield but produces Oxygen"},
	'icon', "UI/Icons/Buildings/crops_algae.tga",
	'FoodOutput', 2000,
	'InitialGrowthTime', 720000,
	'GrowthTime', 720000,
	'WaterDemand', 600,
	'FarmClass', "FarmHydroponic",
	'CropEntity', "CropAlgae",
})

PlaceObj('Crop', {
	'name', "Cover Crops",
	'DisplayName', T{7005, --[[Crop Cover Crops DisplayName]] "Cover Crops"},
	'Desc', T{7006, --[[Crop Cover Crops Desc]] "Very low yield but increases soil quality significantly, improving the yield of the next crop"},
	'icon', "UI/Icons/Buildings/crops_silk_trees.tga",
	'FoodOutput', 12000,
	'InitialGrowthTime', 3600000,
	'GrowthTime', 3600000,
	'WaterDemand', 2400,
	'OxygenProduction', 300,
	'SoilEffect', 40,
	'FarmClass', "FarmConventional",
	'CropEntity', "CropRapeseed",
})

PlaceObj('Crop', {
	'name', "Rice",
	'DisplayName', T{7007, --[[Crop Rice DisplayName]] "Rice"},
	'Desc', T{7008, --[[Crop Rice Desc]] "Great yield but grows slowly and requires more Water"},
	'icon', "UI/Icons/Buildings/crops_rice.tga",
	'FoodOutput', 15000,
	'WaterDemand', 900,
	'OxygenProduction', 100,
	'FarmClass', "FarmHydroponic",
	'CropEntity', "CropRice",
	'Priority', 7,
})

PlaceObj('Crop', {
	'name', "Giant Rice",
	'DisplayName', T{7009, --[[Crop Giant Rice DisplayName]] "Giant Rice"},
	'Desc', T{7008, --[[Crop Giant Rice Desc]] "Great yield but grows slowly and requires more Water"},
	'icon', "UI/Icons/Buildings/crops_rice_giant.tga",
	'FoodOutput', 20000,
	'WaterDemand', 900,
	'OxygenProduction', 100,
	'FarmClass', "FarmHydroponic",
	'CropEntity', "CropRice",
	'Priority', 8,
})

PlaceObj('Crop', {
	'name', "Vegetables",
	'DisplayName', T{7010, --[[Crop Vegetables DisplayName]] "Vegetables"},
	'Desc', T{7011, --[[Crop Vegetables Desc]] "Good yield and grows slowly but requires less Water"},
	'icon', "UI/Icons/Buildings/crops_cucumber.tga",
	'FoodOutput', 12500,
	'InitialGrowthSequence', "idle,idle2,idle3,idle4",
	'GrowthSequence', "idle3,idle4",
	'WaterDemand', 500,
	'OxygenProduction', 100,
	'FarmClass', "FarmHydroponic",
	'CropEntity', "CropCucumber",
	'Priority', 3,
})

PlaceObj('Crop', {
	'name', "Kelp",
	'DisplayName', T{7012, --[[Crop Kelp DisplayName]] "Kelp"},
	'Desc', T{7013, --[[Crop Kelp Desc]] "Average yield but grows very fast and produces Oxygen"},
	'icon', "UI/Icons/Buildings/crops_kelp.tga",
	'FoodOutput', 3200,
	'InitialGrowthTime', 720000,
	'InitialGrowthSequence', "idle,idle2,idle3",
	'GrowthTime', 720000,
	'GrowthSequence', "idle2,idle3",
	'WaterDemand', 600,
	'OxygenProduction', 500,
	'FarmClass', "FarmHydroponic",
	'CropEntity', "CropKelp",
})

PlaceObj('Crop', {
	'name', "Corn",
	'DisplayName', T{7014, --[[Crop Corn DisplayName]] "Corn"},
	'Desc', T{7015, --[[Crop Corn Desc]] "Great yield but grows slowly and depletes the soil, reducing the yield of the next crop"},
	'icon', "UI/Icons/Buildings/crops_corn.tga",
	'FoodOutput', 70000,
	'InitialGrowthTime', 3600000,
	'GrowthTime', 3600000,
	'WaterDemand', 3000,
	'OxygenProduction', 300,
	'SoilEffect', -10,
	'FarmClass', "FarmConventional",
	'CropEntity', "CropCorn",
	'Priority', 4,
})

PlaceObj('Crop', {
	'name', "Giant Corn",
	'DisplayName', T{7016, --[[Crop Giant Corn DisplayName]] "Giant Corn"},
	'Desc', T{7015, --[[Crop Giant Corn Desc]] "Great yield but grows slowly and depletes the soil, reducing the yield of the next crop"},
	'icon', "UI/Icons/Buildings/crops_corn_giant.tga",
	'FoodOutput', 110000,
	'InitialGrowthTime', 3600000,
	'GrowthTime', 3600000,
	'WaterDemand', 3000,
	'OxygenProduction', 300,
	'SoilEffect', -10,
	'FarmClass', "FarmConventional",
	'CropEntity', "CropCornGiant",
	'Priority', 5,
})

PlaceObj('Crop', {
	'name', "Fruit Trees",
	'DisplayName', T{7017, --[[Crop Fruit Trees DisplayName]] "Fruit Trees"},
	'Desc', T{7018, --[[Crop Fruit Trees Desc]] "Good yield and grows very slowly but improves the soil, increasing the yield of the next crop"},
	'icon', "UI/Icons/Buildings/crops_apples.tga",
	'FoodOutput', 88000,
	'InitialGrowthTime', 5760000,
	'InitialGrowthSequence', "idle,idle2,idle3,idle4",
	'GrowthTime', 5760000,
	'GrowthSequence', "idle3,idle4",
	'WaterDemand', 2400,
	'SoilEffect', 10,
	'FarmClass', "FarmConventional",
	'CropEntity', "CropApples",
	'Priority', 2,
})

PlaceObj('Crop', {
	'name', "Quinoa",
	'DisplayName', T{7019, --[[Crop Quinoa DisplayName]] "Quinoa"},
	'Desc', T{7020, --[[Crop Quinoa Desc]] "Average yield but grows fast and requires less Water"},
	'icon', "UI/Icons/Buildings/crops_quinoa.tga",
	'FoodOutput', 22000,
	'InitialGrowthTime', 1440000,
	'GrowthTime', 1440000,
	'WaterDemand', 1600,
	'OxygenProduction', 300,
	'FarmClass', "FarmConventional",
	'CropEntity', "CropQuinoa",
	'Priority', 7,
})

PlaceObj('Crop', {
	'name', "Mystery9_GanymedeRice",
	'DisplayName', T{8114, --[[Crop Mystery9_GanymedeRice DisplayName]] "Ganymede Rice"},
	'Desc', T{8115, --[[Crop Mystery9_GanymedeRice Desc]] "Rice engineered on Ganymede. Grows very fast and has high yield."},
	'icon', "UI/Icons/Buildings/crops_rice_giant.tga",
	'FoodOutput', 6000,
	'Locked', true,
	'InitialGrowthTime', 720000,
	'GrowthTime', 720000,
	'OxygenProduction', 500,
	'FarmClass', "FarmHydroponic",
	'CropEntity', "CropRiceGiant",
	'Priority', 9,
})

