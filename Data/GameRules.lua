-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('GameRules', {
	SortKey = 100100,
	challenge_mod = -40,
	description = T{775719471908, --[[GameRules ColonyPrefab description]] "Begin with free prefabs for all buildings necessary for a small colony."},
	display_name = T{301472439613, --[[GameRules ColonyPrefab display_name]] "Prefab colony"},
	flavor = T{701672144364, --[[GameRules ColonyPrefab flavor]] '<grey>"Geez, all that money we waste on space exploration; just think how many bombs that would buy!"<newline><right>Craig Bruce</grey><left>'},
	id = "ColonyPrefab",
	PlaceObj('Effect_Code', {
		OnApplyEffect = function (self, city, parent)
city:AddPrefabs("StirlingGenerator", 6)
city:AddPrefabs("DomeBasic", 1)
city:AddPrefabs("MoistureVaporator", 2)
city:AddPrefabs("FuelFactory", 1)
city:AddPrefabs("MOXIE", 1)
city:AddPrefabs("SensorTower", 1)
city:AddPrefabs("RechargeStation", 4)
city:AddPrefabs("RegolithExtractor", 1)
city:AddPrefabs("WaterTank", 1)
city:AddPrefabs("DroneHub", 1)
city:AddPrefabs("OxygenTank", 1)
city:AddPrefabs("LivingQuarters", 2)
end,
	}),
})

PlaceObj('GameRules', {
	SortKey = 100200,
	challenge_mod = -20,
	description = T{245514419248, --[[GameRules NoDisasters description]] "Disables all disasters (excluding those coming from mysteries)."},
	display_name = T{528641942799, --[[GameRules NoDisasters display_name]] "No Disasters"},
	exclusionlist = "WinterIsComing, Armageddon, DustInTheWind, Twister",
	flavor = T{434908076554, --[[GameRules NoDisasters flavor]] '<grey>"I\'d far rather be happy than right any day."<newline><right>Douglas Adams</grey><left>'},
	group = "Default",
	id = "NoDisasters",
})

PlaceObj('GameRules', {
	SortKey = 100250,
	challenge_mod = -25,
	description = T{888956787429, --[[GameRules EndlessSupply description]] "The first Universal Depot you place will automatically fill with resources each Sol."},
	display_name = T{999555336280, --[[GameRules EndlessSupply display_name]] "Endless Supply"},
	flavor = T{572957738460, --[[GameRules EndlessSupply flavor]] '<grey>"Make the workmanship surpass the materials."\n<right>Ovid</grey><left>'},
	group = "Default",
	id = "EndlessSupply",
})

PlaceObj('GameRules', {
	SortKey = 100300,
	challenge_mod = 30,
	description = T{822533431359, --[[GameRules Hunger description]] "Can't import food from Earth."},
	display_name = T{706031426910, --[[GameRules Hunger display_name]] "Hunger"},
	flavor = T{823700604514, --[[GameRules Hunger flavor]] '<grey>"If we can conquer space, we can conquer childhood hunger."\n<right>Buzz Aldrin</grey><left>'},
	group = "Default",
	id = "Hunger",
})

PlaceObj('GameRules', {
	SortKey = 100400,
	challenge_mod = 50,
	description = T{579334279447, --[[GameRules Inflation description]] "Import prices increase over time."},
	display_name = T{409282573761, --[[GameRules Inflation display_name]] "Inflation"},
	flavor = T{852944381173, --[[GameRules Inflation flavor]] '<grey>"Production is the only answer to inflation."<newline><right>Chester Bowles</grey><left>'},
	group = "Default",
	id = "Inflation",
	PlaceObj('Effect_Code', {
		OnApplyEffect = function (self, city, parent)
CreateGameTimeThread(function()
	while true do
		local ok, day = WaitMsg("NewDay")
		if ok and day and day % 20 == 0 then
			ModifyResupplyParams("price", 10)
		end
	end
end)
end,
	}),
})

PlaceObj('GameRules', {
	SortKey = 100500,
	challenge_mod = 50,
	description = T{8737, --[[GameRules LongRide description]] "Rocket travel time to and from Mars is three times longer."},
	display_name = T{374740858719, --[[GameRules LongRide display_name]] "Long Ride"},
	flavor = T{296544374970, --[[GameRules LongRide flavor]] '<grey>"Space travel is like hanging upside down for a long time!"<newline><right>Brinda K. Rana</grey><left>'},
	group = "Default",
	id = "LongRide",
	PlaceObj('Effect_ModifyLabel', {
		Label = "Consts",
		Percent = 100,
		Prop = "TravelTimeEarthMars",
	}),
	PlaceObj('Effect_ModifyLabel', {
		Label = "Consts",
		Percent = 100,
		Prop = "TravelTimeEarthMars",
	}),
	PlaceObj('Effect_ModifyLabel', {
		Label = "Consts",
		Percent = 100,
		Prop = "TravelTimeMarsEarth",
	}),
	PlaceObj('Effect_ModifyLabel', {
		Label = "Consts",
		Percent = 100,
		Prop = "TravelTimeMarsEarth",
	}),
})

PlaceObj('GameRules', {
	SortKey = 100550,
	challenge_mod = 100,
	description = T{860781390679, --[[GameRules TheLastArk description]] "Can call a Passenger Rocket only once."},
	display_name = T{972855831022, --[[GameRules TheLastArk display_name]] "The Last Ark"},
	flavor = T{694293425691, --[[GameRules TheLastArk flavor]] '<grey>"Be fruitful, and multiply."<newline><right>Genesis</grey><left>'},
	group = "Default",
	id = "TheLastArk",
})

PlaceObj('GameRules', {
	SortKey = 100600,
	challenge_mod = 40,
	description = T{207099897295, --[[GameRules Amateurs description]] "No specialist applicants."},
	display_name = T{518176138949, --[[GameRules Amateurs display_name]] "Amateurs"},
	flavor = T{226422040944, --[[GameRules Amateurs flavor]] '<grey>"The learning and knowledge that we have, is, at the most, but little compared with that of which we are ignorant."<newline><right>Plato</grey><left>'},
	group = "Default",
	id = "Amateurs",
})

PlaceObj('GameRules', {
	SortKey = 100700,
	challenge_mod = 50,
	description = T{441736163827, --[[GameRules RebelYell description]] "Colonists periodically become renegades. Crime is more severe."},
	display_name = T{465393964057, --[[GameRules RebelYell display_name]] "Rebel Yell"},
	flavor = T{198850457134, --[[GameRules RebelYell flavor]] '<grey>"People have a right to violence, to rebel, to fight back."<newline><right>Yuri Kochiyama</grey><left>'},
	group = "Default",
	id = "RebelYell",
})

PlaceObj('GameRules', {
	SortKey = 100800,
	challenge_mod = 20,
	description = T{257728034290, --[[GameRules ChaosTheory description]] "Tech fields are fully randomized."},
	display_name = T{621834127153, --[[GameRules ChaosTheory display_name]] "Chaos Theory"},
	flavor = T{422261474057, --[[GameRules ChaosTheory flavor]] '<grey>"In fact, the mere act of opening the box will determine the state of the cat, although in this case there were three determinate states the cat could be in: these being Alive, Dead, and Bloody Furious."<newline><right>Terry Pratchett</grey><left>'},
	group = "Default",
	id = "ChaosTheory",
})

PlaceObj('GameRules', {
	SortKey = 100900,
	challenge_mod = 50,
	description = T{327956641780, --[[GameRules WinterIsComing description]] "Cold Wave rating set to a new Max level for all locations on Mars. Cold waves increase power consumption even more."},
	display_name = T{150174985196, --[[GameRules WinterIsComing display_name]] "Winter is Coming"},
	flavor = T{291223909451, --[[GameRules WinterIsComing flavor]] '<grey>"Nothing burns like the cold."<newline><right>George R.R. Martin</grey><left>'},
	group = "Default",
	id = "WinterIsComing",
})

PlaceObj('GameRules', {
	SortKey = 101000,
	challenge_mod = 50,
	description = T{390758552211, --[[GameRules Armageddon description]] "Meteor rating set to a new Max level for all locations on Mars."},
	display_name = T{947776987873, --[[GameRules Armageddon display_name]] "Armageddon"},
	flavor = T{507890514827, --[[GameRules Armageddon flavor]] '<grey>"The dinosaurs became extinct because they didn\'t have a space program."<newline><right>Larry Niven</grey><left>'},
	group = "Default",
	id = "Armageddon",
})

PlaceObj('GameRules', {
	SortKey = 101100,
	challenge_mod = 50,
	description = T{722606516343, --[[GameRules DustInTheWind description]] "Dust Storm rating set to a new Max level for all locations on Mars."},
	display_name = T{631382449574, --[[GameRules DustInTheWind display_name]] "Dust in the Wind"},
	flavor = T{551182109106, --[[GameRules DustInTheWind flavor]] '<grey>"All we are is dust in the wind."\n<right>Kansas</grey><left>'},
	group = "Default",
	id = "DustInTheWind",
})

PlaceObj('GameRules', {
	SortKey = 101200,
	challenge_mod = 30,
	description = T{445682062409, --[[GameRules Twister description]] "Dust Devil rating set to a new Max level for all locations on Mars."},
	display_name = T{214478084093, --[[GameRules Twister display_name]] "Twister"},
	flavor = T{946004412845, --[[GameRules Twister flavor]] '<grey>"Climate is what we expect, weather is what we get."<newline><right>Mark Twain</grey><left>'},
	group = "Default",
	id = "Twister",
})

