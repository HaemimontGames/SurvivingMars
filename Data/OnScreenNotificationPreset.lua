-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/no_power_2.tga",
	SortKey = 1000100,
	VignetteImage = "UI/Vignette_Red.tga",
	VignettePulseDuration = 2000,
	fx_action = "UINotificationNoPower",
	group = "Default",
	id = "NoPower",
	image = "UI/Icons/Notifications/no_power_2.tga",
	priority = "Important",
	text = T{5582, --[[OnScreenNotificationPreset NoPower text]] "Buildings without Power: <count>"},
	title = T{5581, --[[OnScreenNotificationPreset NoPower title]] "No Power"},
	voiced_text = T{7033, --[[voice:aide]] "We have a Power shortage"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/renegade.tga",
	SortKey = 1000200,
	close_on_read = true,
	expiration = 150000,
	fx_action = "UINotificationResource",
	group = "Default",
	id = "RenegadesStoleResources",
	image = "UI/Icons/Notifications/renegade.tga",
	text = T{5584, --[[OnScreenNotificationPreset RenegadesStoleResources text]] "<resource> stolen from <dome_name>!"},
	title = T{5583, --[[OnScreenNotificationPreset RenegadesStoleResources title]] "Renegades Stole Resources"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/renegade.tga",
	SortKey = 1000300,
	close_on_read = true,
	expiration = 150000,
	group = "Default",
	id = "PreventCrime",
	image = "UI/Icons/Notifications/renegade.tga",
	text = T{8048, --[[OnScreenNotificationPreset PreventCrime text]] "Your Officers in <dome_name> stopped the Renegades!"},
	title = T{8047, --[[OnScreenNotificationPreset PreventCrime title]] "Crime Act Prevented"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/renegade.tga",
	SortKey = 1000400,
	close_on_read = true,
	expiration = 150000,
	group = "Default",
	id = "RenegadesSabotageBuilding",
	image = "UI/Icons/Notifications/renegade.tga",
	text = T{5586, --[[OnScreenNotificationPreset RenegadesSabotageBuilding text]] "<building> destroyed in <dome_name>!"},
	title = T{5585, --[[OnScreenNotificationPreset RenegadesSabotageBuilding title]] "Renegades Sabotage Building"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/colonist.tga",
	SortKey = 1000500,
	close_on_read = true,
	expiration = 150000,
	group = "Default",
	id = "FounderGainsTrait",
	image = "UI/Icons/Notifications/colonist.tga",
	text = T{5588, --[[OnScreenNotificationPreset FounderGainsTrait text]] "<ColonistName(founder)>: <TraitName(trait)>"},
	title = T{5587, --[[OnScreenNotificationPreset FounderGainsTrait title]] "Founder Has Trait"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/new_deposit.tga",
	SortKey = 1000600,
	expiration = 150000,
	fx_action = "UINotificationResource",
	group = "Default",
	id = "NewDeposits",
	image = "UI/Icons/Notifications/new_deposit.tga",
	text = T{5590, --[[OnScreenNotificationPreset NewDeposits text]] "Deposits found: <count>"},
	title = T{5589, --[[OnScreenNotificationPreset NewDeposits title]] "New Deposits"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/colonist.tga",
	SortKey = 1000700,
	close_on_read = true,
	expiration = 150000,
	group = "Default",
	id = "LeavingMars",
	image = "UI/Icons/Notifications/colonist.tga",
	text = T{5592, --[[OnScreenNotificationPreset LeavingMars text]] "Departing Colonists: <colonists_count>"},
	title = T{5591, --[[OnScreenNotificationPreset LeavingMars title]] "Leaving Mars"},
	voiced_text = T{7034, --[[voice:aide]] "Colonists are departing"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/funding.tga",
	SortKey = 1000800,
	expiration = 150000,
	fx_action = "UINotificationFunding",
	group = "Default",
	id = "PeriodicFunding",
	image = "UI/Icons/Notifications/funding.tga",
	text = T{5594, --[[OnScreenNotificationPreset PeriodicFunding text]] "<sponsor> funding: <funding(number)>"},
	title = T{5593, --[[OnScreenNotificationPreset PeriodicFunding title]] "Sponsor Funding"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/colonist.tga",
	SortKey = 1000900,
	expiration = 150000,
	fx_action = "UINotificationNewColonists",
	group = "Default",
	id = "NewColonists",
	image = "UI/Icons/Notifications/colonist.tga",
	text = T{5596, --[[OnScreenNotificationPreset NewColonists text]] "Arriving Colonists: <count>"},
	title = T{5595, --[[OnScreenNotificationPreset NewColonists title]] "New Colonists"},
	voiced_text = T{7035, --[[voice:aide]] "New Colonists have arrived"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/colonist_2.tga",
	SortKey = 1001000,
	VignetteImage = "UI/Vignette_Red.tga",
	VignettePulseDuration = 2000,
	expiration = 150000,
	fx_action = "UINotificationColonistsDie",
	group = "Default",
	id = "ConfusedColonists",
	image = "UI/Icons/Notifications/colonist_2.tga",
	priority = "Important",
	text = T{5598, --[[OnScreenNotificationPreset ConfusedColonists text]] "No living space for Colonists"},
	title = T{5597, --[[OnScreenNotificationPreset ConfusedColonists title]] "No available Dome"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/colonist_2.tga",
	SortKey = 1001100,
	VignetteImage = "UI/Vignette_Red.tga",
	VignettePulseDuration = 2000,
	expiration = 150000,
	fx_action = "UINotificationColonistsDie",
	group = "Default",
	id = "DeadColonistsInSpace",
	image = "UI/Icons/Notifications/colonist_2.tga",
	priority = "Important",
	text = T{8851, --[[OnScreenNotificationPreset DeadColonistsInSpace text]] "<count> Colonists died in space while trying to reach Mars."},
	title = T{8850, --[[OnScreenNotificationPreset DeadColonistsInSpace title]] "Passengers Dead"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/colonist.tga",
	SortKey = 1001200,
	expiration = 150000,
	fx_action = "UINotificationColonistsDie",
	group = "Default",
	id = "ColonistPsychoticBreak",
	image = "UI/Icons/Notifications/colonist.tga",
	text = T{5600, --[[OnScreenNotificationPreset ColonistPsychoticBreak text]] "Stressed out Colonists: <count>"},
	title = T{7036, --[[OnScreenNotificationPreset ColonistPsychoticBreak title]] "Stressed out Colonists"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/colonist.tga",
	SortKey = 1001300,
	expiration = 150000,
	fx_action = "UINotificationColonistsDie",
	group = "Default",
	id = "ColonistSuicide",
	image = "UI/Icons/Notifications/colonist.tga",
	text = T{5604, --[[OnScreenNotificationPreset ColonistSuicide text]] "<name> couldn’t take it anymore"},
	title = T{5603, --[[OnScreenNotificationPreset ColonistSuicide title]] "Suicide"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/rocket.tga",
	SortKey = 1001400,
	expiration = 150000,
	fx_action = "UINotificationResource",
	group = "Default",
	id = "ResupplyArrived",
	image = "UI/Icons/Notifications/rocket.tga",
	text = T{5606, --[[OnScreenNotificationPreset ResupplyArrived text]] "A resupply Rocket has arrived in orbit"},
	title = T{5605, --[[OnScreenNotificationPreset ResupplyArrived title]] "Resupply Arrived"},
	voiced_text = T{7037, --[[voice:aide]] "We have a Resupply"},
})

PlaceObj('OnScreenNotificationPreset', {
	SortKey = 1001500,
	expiration = 150000,
	fx_action = "UINotificationResource",
	group = "Default",
	id = "SpaceElevatorDelivery",
	text = T{5608, --[[OnScreenNotificationPreset SpaceElevatorDelivery text]] "The Space Elevator delivered goods from orbit"},
	title = T{5607, --[[OnScreenNotificationPreset SpaceElevatorDelivery title]] "Space Elevator Delivery"},
	voiced_text = T{7038, --[[voice:aide]] "We have a delivery on the Space Elevator"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/new_anomaly.tga",
	SortKey = 1001600,
	expiration = 150000,
	fx_action = "UINotificationAnomaly",
	group = "Default",
	id = "NewAnomalies",
	image = "UI/Icons/Notifications/new_anomaly.tga",
	text = T{5610, --[[OnScreenNotificationPreset NewAnomalies text]] "Anomalies found: <count>"},
	title = T{5609, --[[OnScreenNotificationPreset NewAnomalies title]] "New Anomalies"},
	voiced_text = T{7039, --[[voice:aide]] "Anomaly found"},
})

PlaceObj('OnScreenNotificationPreset', {
	SortKey = 1001700,
	expiration = 150000,
	fx_action = "UINotificationResource",
	group = "Default",
	id = "FuelDestroyed",
	text = T{7673, --[[OnScreenNotificationPreset FuelDestroyed text]] "Resources Lost"},
	title = T{7672, --[[OnScreenNotificationPreset FuelDestroyed title]] "Fuel Explosion"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/placeholder.tga",
	SortKey = 1001800,
	fx_action = "UINotificationMystery",
	group = "Default",
	id = "Bombardment",
	image = "UI/Icons/Notifications/placeholder.tga",
	text = T{8472, --[[OnScreenNotificationPreset Bombardment text]] "Imminent impact on our coordinates."},
	title = T{8471, --[[OnScreenNotificationPreset Bombardment title]] "Orbital Bombardment detected!"},
	voiced_text = T{8473, --[[voice:aide]] "Missile Alert"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/research.tga",
	SortKey = 1001900,
	close_on_read = true,
	expiration = 150000,
	fx_action = "UINotificationResearch",
	group = "Default",
	id = "BreakthroughDiscovered",
	image = "UI/Icons/Notifications/research.tga",
	text = T{3846, --[[OnScreenNotificationPreset BreakthroughDiscovered text]] "<name>"},
	title = T{5611, --[[OnScreenNotificationPreset BreakthroughDiscovered title]] "Breakthrough discovered"},
	voiced_text = T{7040, --[[voice:aide]] "Breakthrough discovered"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/research.tga",
	SortKey = 1002000,
	close_on_read = true,
	expiration = 150000,
	fx_action = "UINotificationResearch",
	group = "Default",
	id = "MultipleBreakthroughsDiscovered",
	image = "UI/Icons/Notifications/research.tga",
	text = T{5613, --[[OnScreenNotificationPreset MultipleBreakthroughsDiscovered text]] "New Breakthrough Techs: <count>"},
	title = T{5612, --[[OnScreenNotificationPreset MultipleBreakthroughsDiscovered title]] "Breakthroughs discovered"},
	voiced_text = T{7041, --[[voice:aide]] "Breakthroughs discovered"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/anomaly_analyzed.tga",
	SortKey = 1002100,
	expiration = 150000,
	fx_action = "UINotificationAnomaly",
	group = "Default",
	id = "AnomalyAnalyzed",
	image = "UI/Icons/Notifications/anomaly_analyzed.tga",
	popup_preset = "AnomalyAnalyzed",
	text = T{5615, --[[OnScreenNotificationPreset AnomalyAnalyzed text]] "An Anomaly was successfully analyzed"},
	title = T{5614, --[[OnScreenNotificationPreset AnomalyAnalyzed title]] "Anomaly Analyzed"},
	voiced_text = T{7042, --[[voice:aide]] "Anomaly analyzed"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/anomaly_analyzed.tga",
	SortKey = 1002200,
	expiration = 150000,
	fx_action = "UINotificationAnomaly",
	group = "Default",
	id = "TechAlienAnomaly",
	image = "UI/Icons/Notifications/anomaly_analyzed.tga",
	text = T{5617, --[[OnScreenNotificationPreset TechAlienAnomaly text]] "Tech Boost: Reduced cost of techs by 5% (all fields) "},
	title = T{5616, --[[OnScreenNotificationPreset TechAlienAnomaly title]] "Alien Artifact Analyzed"},
	voiced_text = T{7042, --[[voice:aide]] "Anomaly analyzed"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/cold_wave_2.tga",
	SortKey = 1002300,
	VignetteImage = "UI/Vignette_Red.tga",
	VignettePulseDuration = 2000,
	dismissable = false,
	display_countdown = true,
	encyclopedia_id = "Cold_Wave",
	fx_action = "UINotificationDisasterStart",
	game_time = true,
	group = "Default",
	id = "ColdWave",
	image = "UI/Icons/Notifications/cold_wave_2.tga",
	popup_preset = "ColdWave",
	priority = "Important",
	text = T{5618, --[[OnScreenNotificationPreset ColdWave text]] "Disaster starts in <countdown>"},
	title = T{4149, --[[OnScreenNotificationPreset ColdWave title]] "Cold Wave"},
	voiced_text = T{7043, --[[voice:aide]] "Cold Wave approaching"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/cold_wave_2.tga",
	SortKey = 1002300,
	VignetteImage = "UI/Vignette_Red.tga",
	VignettePulseDuration = 2000,
	dismissable = false,
	display_countdown = true,
	encyclopedia_id = "Cold_Wave",
	fx_action = "UINotificationDisasterStart",
	game_time = true,
	group = "Default",
	id = "ColdWave2",
	image = "UI/Icons/Notifications/cold_wave_2.tga",
	popup_preset = "ColdWave",
	priority = "Important",
	text = T{433938547139, --[[OnScreenNotificationPreset ColdWave2 text]] "<early_warning> warning due to <num_of_sensors>."},
	title = T{10966, --[[OnScreenNotificationPreset ColdWave2 title]] "Cold Wave  in <countdown>"},
	voiced_text = T{7043, --[[voice:aide]] "Cold Wave approaching"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/cold_wave_2.tga",
	SortKey = 1002400,
	VignetteImage = "UI/Vignette_Red.tga",
	VignettePulseDuration = 2000,
	dismissable = false,
	display_countdown = true,
	encyclopedia_id = "Cold_Wave",
	fx_action = "UINotificationDisasterStart",
	game_time = true,
	group = "Default",
	id = "ColdWaveDuration",
	image = "UI/Icons/Notifications/cold_wave_2.tga",
	popup_preset = "ColdWave",
	priority = "Important",
	text = T{5619, --[[OnScreenNotificationPreset ColdWaveDuration text]] "Remaining duration: <countdown>"},
	title = T{4149, --[[OnScreenNotificationPreset ColdWaveDuration title]] "Cold Wave"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/cold_wave_2.tga",
	SortKey = 1002500,
	VignetteImage = "UI/Vignette_Red.tga",
	VignettePulseDuration = 2000,
	dismissable = false,
	encyclopedia_id = "Cold_Wave",
	fx_action = "UINotificationDisasterStart",
	game_time = true,
	group = "Default",
	id = "ColdWaveEndless",
	image = "UI/Icons/Notifications/cold_wave_2.tga",
	popup_preset = "ColdWave",
	priority = "Important",
	text = T{7437, --[[OnScreenNotificationPreset ColdWaveEndless text]] "Time remaining: unknown"},
	title = T{4149, --[[OnScreenNotificationPreset ColdWaveEndless title]] "Cold Wave"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/meteor_storm_2.tga",
	SortKey = 1002600,
	VignetteImage = "UI/Vignette_Red.tga",
	VignettePulseDuration = 2000,
	dismissable = false,
	display_countdown = true,
	encyclopedia_id = "Meteors",
	fx_action = "UINotificationDisasterStart",
	game_time = true,
	group = "Default",
	id = "MeteorStorm",
	image = "UI/Icons/Notifications/meteor_storm_2.tga",
	popup_preset = "MeteorStorm",
	priority = "Important",
	text = T{5618, --[[OnScreenNotificationPreset MeteorStorm text]] "Disaster starts in <countdown>"},
	title = T{5620, --[[OnScreenNotificationPreset MeteorStorm title]] "Meteor Storm"},
	voiced_text = T{7044, --[[voice:aide]] "Meteor Shower incoming"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/meteor_storm_2.tga",
	SortKey = 1002600,
	VignetteImage = "UI/Vignette_Red.tga",
	VignettePulseDuration = 2000,
	dismissable = false,
	display_countdown = true,
	encyclopedia_id = "Meteors",
	fx_action = "UINotificationDisasterStart",
	game_time = true,
	group = "Default",
	id = "MeteorStorm2",
	image = "UI/Icons/Notifications/meteor_storm_2.tga",
	popup_preset = "MeteorStorm",
	priority = "Important",
	text = T{705678861063, --[[OnScreenNotificationPreset MeteorStorm2 text]] "<early_warning> warning due to <num_of_sensors>."},
	title = T{10967, --[[OnScreenNotificationPreset MeteorStorm2 title]] "Meteor Storm in <countdown>"},
	voiced_text = T{7044, --[[voice:aide]] "Meteor Shower incoming"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/meteor_storm_2.tga",
	SortKey = 1002700,
	VignetteImage = "UI/Vignette_Red.tga",
	VignettePulseDuration = 2000,
	dismissable = false,
	display_countdown = true,
	encyclopedia_id = "Meteors",
	fx_action = "UINotificationDisasterStart",
	game_time = true,
	group = "Default",
	id = "MeteorStormDuration",
	image = "UI/Icons/Notifications/meteor_storm_2.tga",
	popup_preset = "MeteorStorm",
	priority = "Important",
	text = T{5619, --[[OnScreenNotificationPreset MeteorStormDuration text]] "Remaining duration: <countdown>"},
	title = T{5620, --[[OnScreenNotificationPreset MeteorStormDuration title]] "Meteor Storm"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/research_2.tga",
	SortKey = 1002800,
	VignetteImage = "UI/Vignette_Red.tga",
	VignettePulseDuration = 2000,
	fx_action = "UINotificationResearch",
	group = "Default",
	id = "ResearchAvailable",
	image = "UI/Icons/Notifications/research_2.tga",
	priority = "Important",
	text = T{5622, --[[OnScreenNotificationPreset ResearchAvailable text]] "Select a Tech to research"},
	title = T{5621, --[[OnScreenNotificationPreset ResearchAvailable title]] "No Active Research"},
	voiced_text = T{7045, --[[voice:aide]] "No active Research"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/meteor_storm_2.tga",
	SortKey = 1002900,
	VignetteImage = "UI/Vignette_Red.tga",
	VignettePulseDuration = 2000,
	group = "Default",
	id = "MeteorImpact",
	image = "UI/Icons/Notifications/meteor_storm_2.tga",
	priority = "Important",
	text = T{5624, --[[OnScreenNotificationPreset MeteorImpact text]] "Cycle through impact positions"},
	title = T{5623, --[[OnScreenNotificationPreset MeteorImpact title]] "Incoming Meteor"},
	voiced_text = T{7046, --[[voice:aide]] "Meteor incoming"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/fractured_dome_2.tga",
	SortKey = 1003000,
	VignetteImage = "UI/Vignette_Red.tga",
	VignettePulseDuration = 2000,
	fx_action = "UINotificationFracturedDome",
	group = "Default",
	id = "FracturedDome",
	image = "UI/Icons/Notifications/fractured_dome_2.tga",
	priority = "Important",
	text = T{5626, --[[OnScreenNotificationPreset FracturedDome text]] "Fractures: <count>"},
	title = T{5625, --[[OnScreenNotificationPreset FracturedDome title]] "Fractures"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/dust_storm_2.tga",
	SortKey = 1003100,
	VignetteImage = "UI/Vignette_Red.tga",
	VignettePulseDuration = 2000,
	dismissable = false,
	display_countdown = true,
	encyclopedia_id = "Duststorm",
	fx_action = "UINotificationDisasterStart",
	game_time = true,
	group = "Default",
	id = "normalDustStorm",
	image = "UI/Icons/Notifications/dust_storm_2.tga",
	popup_preset = "normalDustStorm",
	priority = "Important",
	text = T{5618, --[[OnScreenNotificationPreset normalDustStorm text]] "Disaster starts in <countdown>"},
	title = T{4250, --[[OnScreenNotificationPreset normalDustStorm title]] "Dust Storm"},
	voiced_text = T{7047, --[[voice:aide]] "Dust Storm approaching"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/dust_storm_2.tga",
	SortKey = 1003100,
	VignetteImage = "UI/Vignette_Red.tga",
	VignettePulseDuration = 2000,
	dismissable = false,
	display_countdown = true,
	encyclopedia_id = "Duststorm",
	fx_action = "UINotificationDisasterStart",
	game_time = true,
	group = "Default",
	id = "normalDustStorm2",
	image = "UI/Icons/Notifications/dust_storm_2.tga",
	popup_preset = "normalDustStorm",
	priority = "Important",
	text = T{954067675131, --[[OnScreenNotificationPreset normalDustStorm2 text]] "<early_warning> warning due to <num_of_sensors>."},
	title = T{10968, --[[OnScreenNotificationPreset normalDustStorm2 title]] "Dust Storm  in <countdown>"},
	voiced_text = T{7047, --[[voice:aide]] "Dust Storm approaching"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/dust_storm_2.tga",
	SortKey = 1003200,
	VignetteImage = "UI/Vignette_Red.tga",
	VignettePulseDuration = 2000,
	dismissable = false,
	display_countdown = true,
	encyclopedia_id = "Duststorm",
	fx_action = "UINotificationDisasterStart",
	game_time = true,
	group = "Default",
	id = "greatDustStorm",
	image = "UI/Icons/Notifications/dust_storm_2.tga",
	popup_preset = "greatDustStorm",
	priority = "Important",
	text = T{5618, --[[OnScreenNotificationPreset greatDustStorm text]] "Disaster starts in <countdown>"},
	title = T{5627, --[[OnScreenNotificationPreset greatDustStorm title]] "Great Dust Storm"},
	voiced_text = T{7048, --[[voice:aide]] "Great Dust Storm approaching"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/dust_storm_2.tga",
	SortKey = 1003200,
	VignetteImage = "UI/Vignette_Red.tga",
	VignettePulseDuration = 2000,
	dismissable = false,
	display_countdown = true,
	encyclopedia_id = "Duststorm",
	fx_action = "UINotificationDisasterStart",
	game_time = true,
	group = "Default",
	id = "greatDustStorm2",
	image = "UI/Icons/Notifications/dust_storm_2.tga",
	popup_preset = "greatDustStorm",
	priority = "Important",
	text = T{844269843610, --[[OnScreenNotificationPreset greatDustStorm2 text]] "<early_warning> warning due to <num_of_sensors>."},
	title = T{10969, --[[OnScreenNotificationPreset greatDustStorm2 title]] "Great Dust Storm  in <countdown>"},
	voiced_text = T{7048, --[[voice:aide]] "Great Dust Storm approaching"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/dust_storm_2.tga",
	SortKey = 1003300,
	VignetteImage = "UI/Vignette_Red.tga",
	VignettePulseDuration = 2000,
	dismissable = false,
	display_countdown = true,
	encyclopedia_id = "Duststorm",
	fx_action = "UINotificationDisasterStart",
	game_time = true,
	group = "Default",
	id = "electrostaticDustStorm",
	image = "UI/Icons/Notifications/dust_storm_2.tga",
	popup_preset = "electrostaticDustStorm",
	priority = "Important",
	text = T{5618, --[[OnScreenNotificationPreset electrostaticDustStorm text]] "Disaster starts in <countdown>"},
	title = T{5628, --[[OnScreenNotificationPreset electrostaticDustStorm title]] "Electrostatic Dust Storm"},
	voiced_text = T{7049, --[[voice:aide]] "Electrostatic Dust Storm approaching"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/dust_storm_2.tga",
	SortKey = 1003300,
	VignetteImage = "UI/Vignette_Red.tga",
	VignettePulseDuration = 2000,
	dismissable = false,
	display_countdown = true,
	encyclopedia_id = "Duststorm",
	fx_action = "UINotificationDisasterStart",
	game_time = true,
	group = "Default",
	id = "electrostaticDustStorm2",
	image = "UI/Icons/Notifications/dust_storm_2.tga",
	popup_preset = "electrostaticDustStorm",
	priority = "Important",
	text = T{705592427125, --[[OnScreenNotificationPreset electrostaticDustStorm2 text]] "<early_warning> warning due to <num_of_sensors>."},
	title = T{10970, --[[OnScreenNotificationPreset electrostaticDustStorm2 title]] "Electrostatic Dust Storm in <countdown>"},
	voiced_text = T{7049, --[[voice:aide]] "Electrostatic Dust Storm approaching"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/dust_storm_2.tga",
	SortKey = 1003400,
	VignetteImage = "UI/Vignette_Red.tga",
	VignettePulseDuration = 2000,
	dismissable = false,
	display_countdown = true,
	encyclopedia_id = "Duststorm",
	fx_action = "UINotificationDisasterStart",
	game_time = true,
	group = "Default",
	id = "normalDustStormDuration",
	image = "UI/Icons/Notifications/dust_storm_2.tga",
	popup_preset = "normalDustStorm",
	priority = "Important",
	text = T{5619, --[[OnScreenNotificationPreset normalDustStormDuration text]] "Remaining duration: <countdown>"},
	title = T{4250, --[[OnScreenNotificationPreset normalDustStormDuration title]] "Dust Storm"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/dust_storm_2.tga",
	SortKey = 1003500,
	VignetteImage = "UI/Vignette_Red.tga",
	VignettePulseDuration = 2000,
	dismissable = false,
	display_countdown = true,
	encyclopedia_id = "Duststorm",
	fx_action = "UINotificationDisasterStart",
	game_time = true,
	group = "Default",
	id = "greatDustStormDuration",
	image = "UI/Icons/Notifications/dust_storm_2.tga",
	popup_preset = "greatDustStorm",
	priority = "Important",
	text = T{5619, --[[OnScreenNotificationPreset greatDustStormDuration text]] "Remaining duration: <countdown>"},
	title = T{5627, --[[OnScreenNotificationPreset greatDustStormDuration title]] "Great Dust Storm"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/dust_storm_2.tga",
	SortKey = 1003600,
	VignetteImage = "UI/Vignette_Red.tga",
	VignettePulseDuration = 2000,
	dismissable = false,
	display_countdown = true,
	encyclopedia_id = "Duststorm",
	fx_action = "UINotificationDisasterStart",
	game_time = true,
	group = "Default",
	id = "electrostaticDustStormDuration",
	image = "UI/Icons/Notifications/dust_storm_2.tga",
	popup_preset = "electrostaticDustStorm",
	priority = "Important",
	text = T{5619, --[[OnScreenNotificationPreset electrostaticDustStormDuration text]] "Remaining duration: <countdown>"},
	title = T{5628, --[[OnScreenNotificationPreset electrostaticDustStormDuration title]] "Electrostatic Dust Storm"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/oxygen_2.tga",
	ShowVignette = true,
	SortKey = 1003700,
	VignetteImage = "UI/Vignette_Red.tga",
	VignettePulseDuration = 2000,
	fx_action = "UINotificationNoOxygen",
	group = "Default",
	id = "NoOxygen",
	image = "UI/Icons/Notifications/oxygen_2.tga",
	priority = "Critical",
	text = T{5636, --[[OnScreenNotificationPreset NoOxygen text]] "Domes without Oxygen: <count>"},
	title = T{5635, --[[OnScreenNotificationPreset NoOxygen title]] "No Oxygen"},
	voiced_text = T{7050, --[[voice:aide]] "We have an Oxygen shortage"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/water_2.tga",
	ShowVignette = true,
	SortKey = 1003800,
	VignetteImage = "UI/Vignette_Red.tga",
	VignettePulseDuration = 2000,
	fx_action = "UINotificationNoWater",
	group = "Default",
	id = "NoWater",
	image = "UI/Icons/Notifications/water_2.tga",
	priority = "Critical",
	text = T{5638, --[[OnScreenNotificationPreset NoWater text]] "Domes without Water: <count>"},
	title = T{5637, --[[OnScreenNotificationPreset NoWater title]] "No Water"},
	voiced_text = T{7051, --[[voice:aide]] "We have a Water shortage"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/no_power_2.tga",
	ShowVignette = true,
	SortKey = 1003900,
	VignetteImage = "UI/Vignette_Red.tga",
	VignettePulseDuration = 2000,
	fx_action = "UINotificationMalfunction",
	group = "Default",
	id = "DomesWithNoLifeSupport",
	image = "UI/Icons/Notifications/no_power_2.tga",
	priority = "Critical",
	text = T{10475, --[[OnScreenNotificationPreset DomesWithNoLifeSupport text]] "Domes without Life Support: <count>"},
	title = T{10476, --[[OnScreenNotificationPreset DomesWithNoLifeSupport title]] "No Life Support"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/no_power_2.tga",
	ShowVignette = true,
	SortKey = 1003900,
	VignetteImage = "UI/Vignette_Red.tga",
	VignettePulseDuration = 2000,
	fx_action = "UINotificationMalfunction",
	group = "Default",
	id = "DomesWithNoPower",
	image = "UI/Icons/Notifications/no_power_2.tga",
	priority = "Critical",
	text = T{5639, --[[OnScreenNotificationPreset DomesWithNoPower text]] "Domes without Power: <count>"},
	title = T{5581, --[[OnScreenNotificationPreset DomesWithNoPower title]] "No Power"},
	voiced_text = T{7033, --[[voice:aide]] "We have a Power shortage"},
})

PlaceObj('OnScreenNotificationPreset', {
	SortKey = 1004000,
	VignetteImage = "UI/Vignette_Red.tga",
	VignettePulseDuration = 2000,
	fx_action = "UINotificationResource",
	group = "Default",
	id = "InsufficientMaintenanceResources",
	priority = "Important",
	text = T{5641, --[[OnScreenNotificationPreset InsufficientMaintenanceResources text]] "<low_on_resource_text> <resources>"},
	title = T{5640, --[[OnScreenNotificationPreset InsufficientMaintenanceResources title]] "Low Storage"},
	voiced_text = T{7052, --[[voice:aide]] "Low Storage"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/deposit_depleted.tga",
	SortKey = 1004100,
	expiration = 150000,
	fx_action = "UINotificationResource",
	group = "Default",
	id = "DepletedDeposits",
	image = "UI/Icons/Notifications/deposit_depleted.tga",
	text = T{5643, --[[OnScreenNotificationPreset DepletedDeposits text]] "Depleted deposits: <count>"},
	title = T{5642, --[[OnScreenNotificationPreset DepletedDeposits title]] "Depleted Deposits"},
	voiced_text = T{7053, --[[voice:aide]] "Deposit depleted"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/deposit_depleted.tga",
	SortKey = 1004200,
	expiration = 150000,
	fx_action = "UINotificationResource",
	group = "Default",
	id = "NoDeposits",
	image = "UI/Icons/Notifications/deposit_depleted.tga",
	text = T{5645, --[[OnScreenNotificationPreset NoDeposits text]] "Buildings with depleted deposits: <count>"},
	title = T{5644, --[[OnScreenNotificationPreset NoDeposits title]] "Idle Extractors"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/colonist_2.tga",
	SortKey = 1004300,
	VignetteImage = "UI/Vignette_Red.tga",
	VignettePulseDuration = 2000,
	fx_action = "UINotificationColonistsDie",
	group = "Default",
	id = "DeadCitizens",
	image = "UI/Icons/Notifications/colonist_2.tga",
	priority = "Important",
	text = T{5647, --[[OnScreenNotificationPreset DeadCitizens text]] "Dead Colonists: <count>"},
	title = T{5646, --[[OnScreenNotificationPreset DeadCitizens title]] "Deaths in the Colony"},
	voiced_text = T{7054, --[[voice:aide]] "A Colonist has died"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/colonist_2.tga",
	SortKey = 1004400,
	VignetteImage = "UI/Vignette_Red.tga",
	VignettePulseDuration = 2000,
	fx_action = "UINotificationMystery",
	group = "Default",
	id = "Mystery8DeathInfection",
	image = "UI/Icons/Notifications/colonist_2.tga",
	priority = "Important",
	text = T{8512, --[[OnScreenNotificationPreset Mystery8DeathInfection text]] "Infected Colonists Dead: <count>"},
	title = T{8511, --[[OnScreenNotificationPreset Mystery8DeathInfection title]] "Infected Colonist Deaths"},
	voiced_text = T{7054, --[[voice:aide]] "A Colonist has died"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/colonist_2.tga",
	SortKey = 1004500,
	VignetteImage = "UI/Vignette_Red.tga",
	VignettePulseDuration = 2000,
	fx_action = "UINotificationColonistsDie",
	group = "Default",
	id = "EarthSickColonists",
	image = "UI/Icons/Notifications/colonist_2.tga",
	priority = "Important",
	text = T{7055, --[[OnScreenNotificationPreset EarthSickColonists text]] "<count> Colonists are Earthsick"},
	title = T{3879, --[[OnScreenNotificationPreset EarthSickColonists title]] "Earthsick"},
	voiced_text = T{7056, --[[voice:aide]] "There are Earthsick Colonists"},
})

PlaceObj('OnScreenNotificationPreset', {
	SortKey = 1004600,
	VignetteImage = "UI/Vignette_Red.tga",
	VignettePulseDuration = 2000,
	group = "Default",
	id = "MaintenanceNeeded",
	priority = "Important",
	text = T{5649, --[[OnScreenNotificationPreset MaintenanceNeeded text]] "<resource(count,'Homeless')>"},
	title = T{855084064691, --[[OnScreenNotificationPreset MaintenanceNeeded title]] "Maintenance Needed"},
})

PlaceObj('OnScreenNotificationPreset', {
	SortKey = 1004600,
	VignetteImage = "UI/Vignette_Red.tga",
	VignettePulseDuration = 2000,
	group = "Default",
	id = "NotWorkingBuildings",
	priority = "Important",
	text = T{5649, --[[OnScreenNotificationPreset NotWorkingBuildings text]] "<resource(count,'Homeless')>"},
	title = T{5648, --[[OnScreenNotificationPreset NotWorkingBuildings title]] "Buildings Not Working"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/milestone_complete.tga",
	SortKey = 1004700,
	close_on_read = true,
	expiration = 300000,
	fx_action = "UINotificationGoalCompleted",
	group = "Default",
	id = "MilestoneComplete",
	image = "UI/Icons/Notifications/milestone_complete.tga",
	text = T{756643722601, --[[OnScreenNotificationPreset MilestoneComplete text]] "<display_name>"},
	title = T{5650, --[[OnScreenNotificationPreset MilestoneComplete title]] "Milestone achieved!"},
	voiced_text = T{7057, --[[voice:aide]] "Milestone achieved"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/anomaly_analyzed.tga",
	SortKey = 1004900,
	VignetteImage = "UI/Vignette_Red.tga",
	VignettePulseDuration = 2000,
	expiration = 150000,
	fx_action = "UINotificationAnomaly",
	group = "Default",
	id = "TechUnlockAnomalyAnalyzed",
	image = "UI/Icons/Notifications/anomaly_analyzed.tga",
	text = T{5651, --[[OnScreenNotificationPreset TechUnlockAnomalyAnalyzed text]] "New Techs are available for research"},
	title = T{5614, --[[OnScreenNotificationPreset TechUnlockAnomalyAnalyzed title]] "Anomaly Analyzed"},
	voiced_text = T{7042, --[[voice:aide]] "Anomaly analyzed"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/anomaly_analyzed.tga",
	SortKey = 1005000,
	close_on_read = true,
	expiration = 150000,
	fx_action = "UINotificationAnomaly",
	group = "Default",
	id = "GrantRP",
	image = "UI/Icons/Notifications/anomaly_analyzed.tga",
	text = T{10285, --[[OnScreenNotificationPreset GrantRP text]] "Gained <resource(points,resource)>"},
	title = T{5614, --[[OnScreenNotificationPreset GrantRP title]] "Anomaly Analyzed"},
	voiced_text = T{7042, --[[voice:aide]] "Anomaly analyzed"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/anomaly_analyzed.tga",
	SortKey = 1005100,
	expiration = 150000,
	fx_action = "UINotificationAnomaly",
	group = "Default",
	id = "AlienArtifactsAnomalyAnalyzed",
	image = "UI/Icons/Notifications/anomaly_analyzed.tga",
	text = T{5653, --[[OnScreenNotificationPreset AlienArtifactsAnomalyAnalyzed text]] "Research cost of all Techs reduced"},
	title = T{5614, --[[OnScreenNotificationPreset AlienArtifactsAnomalyAnalyzed title]] "Anomaly Analyzed"},
	voiced_text = T{7042, --[[voice:aide]] "Anomaly analyzed"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/research_2.tga",
	SortKey = 1005200,
	VignetteImage = "UI/Vignette_Red.tga",
	VignettePulseDuration = 2000,
	close_on_read = true,
	expiration = 150000,
	fx_action = "UINotificationResearchComplete",
	group = "Default",
	id = "ResearchComplete",
	image = "UI/Icons/Notifications/research_2.tga",
	priority = "Important",
	text = T{3846, --[[OnScreenNotificationPreset ResearchComplete text]] "<name>"},
	title = T{5654, --[[OnScreenNotificationPreset ResearchComplete title]] "Research Complete"},
	voiced_text = T{7058, --[[voice:aide]] "Research complete"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/timer.tga",
	SortKey = 1005300,
	dismissable = false,
	fx_action = "UINotificationMystery",
	group = "Default",
	id = "Mystery1Counter",
	image = "UI/Icons/Notifications/timer.tga",
	text = T{5656, --[[OnScreenNotificationPreset Mystery1Counter text]] "Cube countdown: <value> hours"},
	title = T{5655, --[[OnScreenNotificationPreset Mystery1Counter title]] "Countdown"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/timer.tga",
	SortKey = 1005400,
	dismissable = false,
	fx_action = "UINotificationMystery",
	group = "Default",
	id = "Mystery3Counter",
	image = "UI/Icons/Notifications/timer.tga",
	text = T{7438, --[[OnScreenNotificationPreset Mystery3Counter text]] "Sphere Unknown Event: <percent(value)>"},
	title = T{5655, --[[OnScreenNotificationPreset Mystery3Counter title]] "Countdown"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/timer.tga",
	SortKey = 1005500,
	dismissable = false,
	display_countdown = true,
	fx_action = "UINotificationMystery",
	game_time = true,
	group = "Default",
	id = "Mystery2Counter",
	image = "UI/Icons/Notifications/timer.tga",
	text = T{5657, --[[OnScreenNotificationPreset Mystery2Counter text]] "Time to impact: <countdown>"},
	title = T{5655, --[[OnScreenNotificationPreset Mystery2Counter title]] "Countdown"},
})

PlaceObj('OnScreenNotificationPreset', {
	SortKey = 1005600,
	close_on_read = true,
	expiration = 150000,
	fx_action = "UINotificationMystery",
	group = "Default",
	id = "Mystery2DiggerDetected",
	text = T{5659, --[[OnScreenNotificationPreset Mystery2DiggerDetected text]] "Dredger landing expected in Sector <u(value)>"},
	title = T{5658, --[[OnScreenNotificationPreset Mystery2DiggerDetected title]] "Dredger Detected"},
	voiced_text = T{7059, --[[voice:aide]] "Dredgers detected"},
})

PlaceObj('OnScreenNotificationPreset', {
	SortKey = 1005700,
	close_on_read = true,
	expiration = 150000,
	fx_action = "UINotificationMystery",
	group = "Default",
	id = "Mystery2DiggerLanded",
	text = T{5660, --[[OnScreenNotificationPreset Mystery2DiggerLanded text]] "Another Dredger has landed on Mars"},
	title = T{282, --[[OnScreenNotificationPreset Mystery2DiggerLanded title]] "Landing"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/placeholder_2.tga",
	SortKey = 1005800,
	VignetteImage = "UI/Vignette_Red.tga",
	VignettePulseDuration = 2000,
	dismissable = false,
	fx_action = "UINotificationMystery",
	game_time = true,
	group = "Default",
	id = "Mystery4Mirage",
	image = "UI/Icons/Notifications/placeholder_2.tga",
	priority = "Important",
	text = T{7440, --[[OnScreenNotificationPreset Mystery4Mirage text]] "Remaining duration: Unknown"},
	title = T{7439, --[[OnScreenNotificationPreset Mystery4Mirage title]] "Mysterious Mirages"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/placeholder_2.tga",
	ShowVignette = true,
	SortKey = 1005900,
	VignetteImage = "UI/Vignette_Red.tga",
	VignettePulseDuration = 2000,
	fx_action = "UINotificationMystery",
	group = "Default",
	id = "Mystery5RogueDrones",
	image = "UI/Icons/Notifications/placeholder_2.tga",
	priority = "Critical",
	text = T{7061, --[[OnScreenNotificationPreset Mystery5RogueDrones text]] "Rogue Drones: <count>"},
	title = T{7060, --[[OnScreenNotificationPreset Mystery5RogueDrones title]] "Rogue Drones are attacking!"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/placeholder.tga",
	SortKey = 1006000,
	VignettePulseDuration = 2000,
	fx_action = "UINotificationMystery",
	group = "Default",
	id = "Mystery5DestoyedBuildings",
	image = "UI/Icons/Notifications/placeholder.tga",
	text = T{7567, --[[OnScreenNotificationPreset Mystery5DestoyedBuildings text]] "Buildings destroyed: <count>"},
	title = T{7566, --[[OnScreenNotificationPreset Mystery5DestoyedBuildings title]] "Hostile attack"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/placeholder.tga",
	SortKey = 1006100,
	VignettePulseDuration = 2000,
	expiration = 150000,
	fx_action = "UINotificationMystery",
	group = "Default",
	id = "Mystery5RoverMalfunction",
	image = "UI/Icons/Notifications/placeholder.tga",
	text = T{7569, --[[OnScreenNotificationPreset Mystery5RoverMalfunction text]] "Number Six has sabotaged the Explorer"},
	title = T{7568, --[[OnScreenNotificationPreset Mystery5RoverMalfunction title]] "AI Fights back"},
})

PlaceObj('OnScreenNotificationPreset', {
	SortKey = 1006200,
	fx_action = "UINotificationMystery",
	group = "Default",
	id = "Mystery6Reward",
	title = T{7062, --[[OnScreenNotificationPreset Mystery6Reward title]] "EsoCorp Reward"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/no_life_support.tga",
	SortKey = 1006300,
	dismissable = false,
	fx_action = "UINotificationMystery",
	group = "Default",
	id = "Mystery8InfectionLevel",
	image = "UI/Icons/Notifications/no_life_support.tga",
	title = T{8120, --[[OnScreenNotificationPreset Mystery8InfectionLevel title]] "Infection Level"},
})

PlaceObj('OnScreenNotificationPreset', {
	SortKey = 1006400,
	expiration = 150000,
	fx_action = "UINotificationMystery",
	group = "Default",
	id = "Mystery8SellCure",
	title = T{8474, --[[OnScreenNotificationPreset Mystery8SellCure title]] "Cure Exported to Earth!"},
})

PlaceObj('OnScreenNotificationPreset', {
	SortKey = 1006500,
	dismissable = false,
	fx_action = "UINotificationMystery",
	group = "Default",
	id = "Mystery7WarTension",
	text = T{8122, --[[OnScreenNotificationPreset Mystery7WarTension text]] "War Tension:"},
	title = T{8121, --[[OnScreenNotificationPreset Mystery7WarTension title]] "War On Earth"},
})

PlaceObj('OnScreenNotificationPreset', {
	SortKey = 1006600,
	expiration = 150000,
	fx_action = "UINotificationMystery",
	group = "Default",
	id = "Mystery9ProjectProgress",
	title = T{8450, --[[OnScreenNotificationPreset Mystery9ProjectProgress title]] "Beyond Earth Initiative"},
})

PlaceObj('OnScreenNotificationPreset', {
	SortKey = 1006700,
	VignetteImage = "UI/Vignette_Red.tga",
	VignettePulseDuration = 2000,
	display_countdown = true,
	expiration = 150000,
	fx_action = "UINotificationMystery",
	game_time = true,
	group = "Default",
	id = "Mystery10CrystalsAssemble",
	priority = "Important",
	text = T{9686, --[[OnScreenNotificationPreset Mystery10CrystalsAssemble text]] "The crystals are merging into a single entity"},
	title = T{9685, --[[OnScreenNotificationPreset Mystery10CrystalsAssemble title]] "Strange behavior"},
})

PlaceObj('OnScreenNotificationPreset', {
	SortKey = 1006800,
	VignetteImage = "UI/Vignette_Red.tga",
	VignettePulseDuration = 2000,
	display_countdown = true,
	expiration = 150000,
	fx_action = "UINotificationMystery",
	game_time = true,
	group = "Default",
	id = "Mystery11NewSinkhole",
	priority = "Important",
	title = T{9815, --[[OnScreenNotificationPreset Mystery11NewSinkhole title]] "Sinkhole Detected"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/anomaly_analyzed.tga",
	SortKey = 1006900,
	close_on_read = true,
	expiration = 150000,
	fx_action = "UINotificationMystery",
	group = "Default",
	id = "Mystery11WispsKilled",
	image = "UI/Icons/Notifications/anomaly_analyzed.tga",
	text = T{10287, --[[OnScreenNotificationPreset Mystery11WispsKilled text]] "Gained <research(points)>"},
	title = T{10286, --[[OnScreenNotificationPreset Mystery11WispsKilled title]] "Wisps Analyzed"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/anomaly_analyzed.tga",
	SortKey = 1007100,
	dismissable = false,
	fx_action = "UINotificationMystery",
	group = "Default",
	id = "Mystery11ExperimentProgress",
	image = "UI/Icons/Notifications/anomaly_analyzed.tga",
	title = T{9817, --[[OnScreenNotificationPreset Mystery11ExperimentProgress title]] "Experiment 03-K64"},
})

PlaceObj('OnScreenNotificationPreset', {
	SortKey = 1007200,
	VignetteImage = "UI/Vignette_Red.tga",
	VignettePulseDuration = 2000,
	dismissable = false,
	display_countdown = true,
	fx_action = "UINotificationMystery",
	game_time = true,
	group = "Default",
	id = "Mystery12IonStorms",
	priority = "Important",
	text = T{5619, --[[OnScreenNotificationPreset Mystery12IonStorms text]] "Remaining duration: <countdown>"},
	title = T{9224, --[[OnScreenNotificationPreset Mystery12IonStorms title]] "Ion Storm Detected"},
})

PlaceObj('OnScreenNotificationPreset', {
	SortKey = 1007300,
	VignetteImage = "UI/Vignette_Red.tga",
	VignettePulseDuration = 2000,
	dismissable = false,
	fx_action = "UINotificationMystery",
	group = "Default",
	id = "Mystery12IonStormsPredicted",
	priority = "Important",
	text = T{9226, --[[OnScreenNotificationPreset Mystery12IonStormsPredicted text]] "Expected Ion Storms: <reg_param1>"},
	title = T{9225, --[[OnScreenNotificationPreset Mystery12IonStormsPredicted title]] "Ion Storms Incoming!"},
})

PlaceObj('OnScreenNotificationPreset', {
	SortKey = 1007400,
	VignetteImage = "UI/Vignette_Red.tga",
	VignettePulseDuration = 2000,
	dismissable = false,
	display_countdown = true,
	fx_action = "UINotificationMystery",
	game_time = true,
	group = "Default",
	id = "Mystery12FinalCountdown",
	text = T{9819, --[[OnScreenNotificationPreset Mystery12FinalCountdown text]] "Remaining Time: <countdown>"},
	title = T{9818, --[[OnScreenNotificationPreset Mystery12FinalCountdown title]] "Metatron's Challenge"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/mystery_log.tga",
	SortKey = 1007500,
	dismissable = false,
	fx_action = "UINotificationMystery",
	group = "Default",
	id = "MysteryLog",
	image = "UI/Icons/Notifications/mystery_log.tga",
	popup_preset = "MysteryLog",
	text = T{5662, --[[OnScreenNotificationPreset MysteryLog text]] "History of Events"},
	title = T{5661, --[[OnScreenNotificationPreset MysteryLog title]] "Mystery Log"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/colonist.tga",
	SortKey = 1007600,
	expiration = 150000,
	group = "Default",
	id = "RefugeeRocket",
	image = "UI/Icons/Notifications/colonist.tga",
	title = T{8123, --[[OnScreenNotificationPreset RefugeeRocket title]] "Refugee Rocket"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/scan_2.tga",
	SortKey = 1007700,
	VignetteImage = "UI/Vignette_Red.tga",
	VignettePulseDuration = 2000,
	group = "Default",
	id = "SectorScanAvailable",
	image = "UI/Icons/Notifications/scan_2.tga",
	priority = "Important",
	text = T{5663, --[[OnScreenNotificationPreset SectorScanAvailable text]] "Select a Sector to scan"},
	title = T{5422, --[[OnScreenNotificationPreset SectorScanAvailable title]] "Exploration"},
	voiced_text = T{7063, --[[voice:aide]] "Select a Sector to scan"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/scan.tga",
	SortKey = 1007800,
	expiration = 150000,
	game_time = true,
	group = "Default",
	id = "SectorScanned",
	image = "UI/Icons/Notifications/scan.tga",
	text = T{5665, --[[OnScreenNotificationPreset SectorScanned text]] "<results>"},
	title = T{5664, --[[OnScreenNotificationPreset SectorScanned title]] "Sector <u(name)> scanned"},
	voiced_text = T{7064, --[[voice:aide]] "Sector scanned"},
})

PlaceObj('OnScreenNotificationPreset', {
	SortKey = 1008100,
	VignetteImage = "UI/Vignette_Red.tga",
	VignettePulseDuration = 2000,
	fx_action = "UINotificationMalfunction",
	group = "Default",
	id = "LeakDetected",
	priority = "Important",
	text = T{137173434527, --[[OnScreenNotificationPreset LeakDetected text]] "<leaks>"},
	title = T{522588249261, --[[OnScreenNotificationPreset LeakDetected title]] "Leak Detected"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/drone.tga",
	SortKey = 1008200,
	fx_action = "UINotificationTransportation",
	group = "Default",
	id = "OrphanedDrones",
	image = "UI/Icons/Notifications/drone.tga",
	text = T{5673, --[[OnScreenNotificationPreset OrphanedDrones text]] "Drones with no controller: <count>"},
	title = T{5672, --[[OnScreenNotificationPreset OrphanedDrones title]] "Orphaned Drones"},
})

PlaceObj('OnScreenNotificationPreset', {
	SortKey = 1008300,
	expiration = 25000,
	fx_action = "UINotificationResource",
	group = "Default",
	id = "RareMetalsExport",
	text = T{5675, --[[OnScreenNotificationPreset RareMetalsExport text]] "Funding received: <funding(funding)>"},
	title = T{5674, --[[OnScreenNotificationPreset RareMetalsExport title]] "Rare Metals Export"},
	voiced_text = T{7068, --[[voice:aide]] "Funding received"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/food.tga",
	SortKey = 1008400,
	fx_action = "UINotificationResource",
	group = "Default",
	id = "CropsFailed",
	image = "UI/Icons/Notifications/food.tga",
	text = T{5677, --[[OnScreenNotificationPreset CropsFailed text]] "No edible Food has been harvested"},
	title = T{5676, --[[OnScreenNotificationPreset CropsFailed title]] "Crop Failure"},
	voiced_text = T{7069, --[[voice:aide]] "Crop failure reported"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/colonist_2.tga",
	ShowVignette = true,
	SortKey = 1008500,
	VignetteImage = "UI/Vignette_Red.tga",
	VignettePulseDuration = 2000,
	fx_action = "UINotificationResource",
	group = "Default",
	id = "StarvingColonists",
	image = "UI/Icons/Notifications/colonist_2.tga",
	priority = "Critical",
	text = T{5679, --[[OnScreenNotificationPreset StarvingColonists text]] "Starving Colonists: <count>"},
	title = T{5678, --[[OnScreenNotificationPreset StarvingColonists title]] "Food Shortage"},
	voiced_text = T{7070, --[[voice:aide]] "We have a Food shortage"},
})

PlaceObj('OnScreenNotificationPreset', {
	SortKey = 1008600,
	dismissable = false,
	display_countdown = true,
	encyclopedia_id = "Founders",
	fx_action = "UINotificationTimer",
	game_time = true,
	group = "Default",
	id = "FounderStageDuration",
	text = T{5619, --[[OnScreenNotificationPreset FounderStageDuration text]] "Remaining duration: <countdown>"},
	title = T{5680, --[[OnScreenNotificationPreset FounderStageDuration title]] "Founder Stage"},
})

PlaceObj('OnScreenNotificationPreset', {
	SortKey = 1008700,
	fx_action = "UINotificationTransportation",
	group = "Default",
	id = "TransportationDroneOverload",
	text = T{8923, --[[OnScreenNotificationPreset TransportationDroneOverload text]] "Drone Heavy Load"},
	title = T{8922, --[[OnScreenNotificationPreset TransportationDroneOverload title]] "Transportation Problem"},
})

PlaceObj('OnScreenNotificationPreset', {
	SortKey = 1008800,
	fx_action = "UINotificationTransportation",
	group = "Default",
	id = "TransportationShuttleOverload",
	text = T{8924, --[[OnScreenNotificationPreset TransportationShuttleOverload text]] "Shuttle Heavy Load"},
	title = T{8922, --[[OnScreenNotificationPreset TransportationShuttleOverload title]] "Transportation Problem"},
})

PlaceObj('OnScreenNotificationPreset', {
	SortKey = 1008900,
	fx_action = "UINotificationTransportation",
	group = "Default",
	id = "TransportationShuttleNoFuel",
	text = T{8925, --[[OnScreenNotificationPreset TransportationShuttleNoFuel text]] "No Fuel for Shuttles"},
	title = T{8922, --[[OnScreenNotificationPreset TransportationShuttleNoFuel title]] "Transportation Problem"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/mystery_log_2.tga",
	SortKey = 1009000,
	VignetteImage = "UI/Vignette_Red.tga",
	VignettePulseDuration = 2000,
	fx_action = "UINotificationAchievement",
	group = "Default",
	id = "AchievementUnlocked",
	image = "UI/Icons/Notifications/mystery_log_2.tga",
	priority = "Important",
	text = T{7383, --[[OnScreenNotificationPreset AchievementUnlocked text]] "<description>"},
	title = T{7441, --[[OnScreenNotificationPreset AchievementUnlocked title]] "Achievement Unlocked: <achievement>"},
})

PlaceObj('OnScreenNotificationPreset', {
	SortKey = 1009100,
	VignetteImage = "UI/Vignette_Red.tga",
	VignettePulseDuration = 2000,
	group = "Default",
	id = "SplitPowerGrid",
	priority = "Important",
	text = T{8853, --[[OnScreenNotificationPreset SplitPowerGrid text]] "Split Power grids: <count>"},
	title = T{8852, --[[OnScreenNotificationPreset SplitPowerGrid title]] "Split Power Grids"},
})

PlaceObj('OnScreenNotificationPreset', {
	SortKey = 1009200,
	VignetteImage = "UI/Vignette_Red.tga",
	VignettePulseDuration = 2000,
	group = "Default",
	id = "SplitLifeSupportGrid",
	priority = "Important",
	text = T{8855, --[[OnScreenNotificationPreset SplitLifeSupportGrid text]] "Split Life Support grids: <count>"},
	title = T{8854, --[[OnScreenNotificationPreset SplitLifeSupportGrid title]] "Split Life Support Grids"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/timer_2.tga",
	SortKey = 1009300,
	VignetteImage = "UI/Vignette_Red.tga",
	VignettePulseDuration = 2000,
	dismissable = false,
	display_countdown = true,
	fx_action = "UINotificationTimer",
	game_time = true,
	group = "Default",
	id = "ChallengeTimer",
	image = "UI/Icons/Notifications/timer_2.tga",
	priority = "Important",
	text = T{10289, --[[OnScreenNotificationPreset ChallengeTimer text]] "Remaining time: <countdown>"},
	title = T{10288, --[[OnScreenNotificationPreset ChallengeTimer title]] "Challenge Deadline"},
})

PlaceObj('OnScreenNotificationPreset', {
	ImagePreview = "UI/Icons/Notifications/drone.tga",
	SortKey = 1009400,
	VignetteImage = "UI/Vignette_Red.tga",
	dismissable = true,
	group = "Default",
	id = "DestroyedDrones",
	image = "UI/Icons/Notifications/drone.tga",
	text = T{10953, "Destroyed Drones: <count><image UI/Icons/res_drone_red.tga 1300>"},
	title = T{10954, "Destroyed Drones"},
})

