-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('OnScreenNotificationPreset', {
	'name', "NoPower",
	'title', T{5581, --[[OnScreenNotificationPreset NoPower title]] "No Power"},
	'text', T{5582, --[[OnScreenNotificationPreset NoPower text]] "Buildings without Power: <count>"},
	'voiced_text', T{7033, --[[voice:aide]] "We have a Power shortage"},
	'image', "UI/Icons/Notifications/no_power_2.tga",
	'priority', "Important",
	'VignetteImage', "UI/Vignette_Red.tga",
	'VignettePulseDuration', 2000,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "RenegadesStoleResources",
	'title', T{5583, --[[OnScreenNotificationPreset RenegadesStoleResources title]] "Renegades Stole Resources"},
	'text', T{5584, --[[OnScreenNotificationPreset RenegadesStoleResources text]] "<resource> stolen from <dome_name>!"},
	'image', "UI/Icons/Notifications/renegade.tga",
	'close_on_read', true,
	'expiration', 150000,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "PreventCrime",
	'title', T{8047, --[[OnScreenNotificationPreset PreventCrime title]] "Crime Act Prevented"},
	'text', T{8048, --[[OnScreenNotificationPreset PreventCrime text]] "Your Officers in <dome_name> stopped the Renegades!"},
	'image', "UI/Icons/Notifications/renegade.tga",
	'close_on_read', true,
	'expiration', 150000,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "RenegadesSabotageBuilding",
	'title', T{5585, --[[OnScreenNotificationPreset RenegadesSabotageBuilding title]] "Renegades Sabotage Building"},
	'text', T{5586, --[[OnScreenNotificationPreset RenegadesSabotageBuilding text]] "<building> destroyed in <dome_name>!"},
	'image', "UI/Icons/Notifications/renegade.tga",
	'close_on_read', true,
	'expiration', 150000,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "FounderGainsTrait",
	'title', T{5587, --[[OnScreenNotificationPreset FounderGainsTrait title]] "Founder Has Trait"},
	'text', T{5588, --[[OnScreenNotificationPreset FounderGainsTrait text]] "<ColonistName(founder)>: <TraitName(trait)>"},
	'image', "UI/Icons/Notifications/colonist.tga",
	'close_on_read', true,
	'expiration', 150000,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "NewDeposits",
	'title', T{5589, --[[OnScreenNotificationPreset NewDeposits title]] "New Deposits"},
	'text', T{5590, --[[OnScreenNotificationPreset NewDeposits text]] "Deposits found: <count>"},
	'image', "UI/Icons/Notifications/new_deposit.tga",
	'expiration', 150000,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "LeavingMars",
	'title', T{5591, --[[OnScreenNotificationPreset LeavingMars title]] "Leaving Mars"},
	'text', T{5592, --[[OnScreenNotificationPreset LeavingMars text]] "Departing Colonists: <colonists_count>"},
	'voiced_text', T{7034, --[[voice:aide]] "Colonists are departing"},
	'image', "UI/Icons/Notifications/colonist.tga",
	'close_on_read', true,
	'expiration', 150000,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "PeriodicFunding",
	'title', T{5593, --[[OnScreenNotificationPreset PeriodicFunding title]] "Sponsor Funding"},
	'text', T{5594, --[[OnScreenNotificationPreset PeriodicFunding text]] "<sponsor> funding: <funding(number)>"},
	'image', "UI/Icons/Notifications/funding.tga",
	'expiration', 150000,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "NewColonists",
	'title', T{5595, --[[OnScreenNotificationPreset NewColonists title]] "New Colonists"},
	'text', T{5596, --[[OnScreenNotificationPreset NewColonists text]] "Arriving Colonists: <count>"},
	'voiced_text', T{7035, --[[voice:aide]] "New Colonists have arrived"},
	'image', "UI/Icons/Notifications/colonist.tga",
	'expiration', 150000,
	'fx_action', "UINotificationNewColonists",
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "ConfusedColonists",
	'title', T{5597, --[[OnScreenNotificationPreset ConfusedColonists title]] "No available Dome"},
	'text', T{5598, --[[OnScreenNotificationPreset ConfusedColonists text]] "No living space for Colonists"},
	'image', "UI/Icons/Notifications/colonist_2.tga",
	'expiration', 150000,
	'fx_action', "UINotificationNewColonists",
	'priority', "Important",
	'VignetteImage', "UI/Vignette_Red.tga",
	'VignettePulseDuration', 2000,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "ColonistPsychoticBreak",
	'title', T{7036, --[[OnScreenNotificationPreset ColonistPsychoticBreak title]] "Stressed out Colonists"},
	'text', T{5600, --[[OnScreenNotificationPreset ColonistPsychoticBreak text]] "Stressed out Colonists: <count>"},
	'image', "UI/Icons/Notifications/colonist.tga",
	'expiration', 150000,
	'fx_action', "UINotificationNewColonists",
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "ColonistSuicide",
	'title', T{5603, --[[OnScreenNotificationPreset ColonistSuicide title]] "Suicide"},
	'text', T{5604, --[[OnScreenNotificationPreset ColonistSuicide text]] "<name> couldn’t take it anymore"},
	'image', "UI/Icons/Notifications/colonist.tga",
	'expiration', 150000,
	'fx_action', "UINotificationColonistsDie",
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "ResupplyArrived",
	'title', T{5605, --[[OnScreenNotificationPreset ResupplyArrived title]] "Resupply Arrived"},
	'text', T{5606, --[[OnScreenNotificationPreset ResupplyArrived text]] "A resupply Rocket has arrived in orbit"},
	'voiced_text', T{7037, --[[voice:aide]] "We have a Resupply"},
	'image', "UI/Icons/Notifications/rocket.tga",
	'expiration', 150000,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "SpaceElevatorDelivery",
	'title', T{5607, --[[OnScreenNotificationPreset SpaceElevatorDelivery title]] "Space Elevator Delivery"},
	'text', T{5608, --[[OnScreenNotificationPreset SpaceElevatorDelivery text]] "The Space Elevator delivered goods from orbit"},
	'voiced_text', T{7038, --[[voice:aide]] "We have a delivery on the Space Elevator"},
	'expiration', 150000,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "NewAnomalies",
	'title', T{5609, --[[OnScreenNotificationPreset NewAnomalies title]] "New Anomalies"},
	'text', T{5610, --[[OnScreenNotificationPreset NewAnomalies text]] "Anomalies found: <count>"},
	'voiced_text', T{7039, --[[voice:aide]] "Anomaly found"},
	'image', "UI/Icons/Notifications/new_anomaly.tga",
	'expiration', 150000,
	'fx_action', "UINotificationAnomaly",
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "FuelDestroyed",
	'title', T{7672, --[[OnScreenNotificationPreset FuelDestroyed title]] "Fuel Explosion"},
	'text', T{7673, --[[OnScreenNotificationPreset FuelDestroyed text]] "Resources Lost"},
	'expiration', 150000,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "Bombardment",
	'title', T{8471, --[[OnScreenNotificationPreset Bombardment title]] "Orbital Bombardment detected!"},
	'text', T{8472, --[[OnScreenNotificationPreset Bombardment text]] "Imminent impact on our coordinates."},
	'voiced_text', T{8473, --[[voice:aide]] "Missile Alert"},
	'image', "UI/Icons/Notifications/placeholder.tga",
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "BreakthroughDiscovered",
	'title', T{5611, --[[OnScreenNotificationPreset BreakthroughDiscovered title]] "Breakthrough discovered"},
	'text', T{3846, --[[OnScreenNotificationPreset BreakthroughDiscovered text]] "<name>"},
	'voiced_text', T{7040, --[[voice:aide]] "Breakthrough discovered"},
	'image', "UI/Icons/Notifications/research.tga",
	'close_on_read', true,
	'expiration', 150000,
	'fx_action', "UINotificationBreaktrough",
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "MultipleBreakthroughsDiscovered",
	'title', T{5612, --[[OnScreenNotificationPreset MultipleBreakthroughsDiscovered title]] "Breakthroughs discovered"},
	'text', T{5613, --[[OnScreenNotificationPreset MultipleBreakthroughsDiscovered text]] "New Breakthrough Techs: <count>"},
	'voiced_text', T{7041, --[[voice:aide]] "Breakthroughs discovered"},
	'image', "UI/Icons/Notifications/research.tga",
	'close_on_read', true,
	'expiration', 150000,
	'fx_action', "UINotificationBreaktrough",
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "AnomalyAnalyzed",
	'title', T{5614, --[[OnScreenNotificationPreset AnomalyAnalyzed title]] "Anomaly Analyzed"},
	'text', T{5615, --[[OnScreenNotificationPreset AnomalyAnalyzed text]] "An Anomaly was successfully analyzed"},
	'voiced_text', T{7042, --[[voice:aide]] "Anomaly analyzed"},
	'image', "UI/Icons/Notifications/anomaly_analyzed.tga",
	'popup_preset', "AnomalyAnalyzed",
	'expiration', 150000,
	'fx_action', "UINotificationAnomaly",
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "TechAlienAnomaly",
	'title', T{5616, --[[OnScreenNotificationPreset TechAlienAnomaly title]] "Alien Artifact Analyzed"},
	'text', T{5617, --[[OnScreenNotificationPreset TechAlienAnomaly text]] "Tech Boost: -5% Research cost (all fields)"},
	'voiced_text', T{7042, --[[voice:aide]] "Anomaly analyzed"},
	'image', "UI/Icons/Notifications/anomaly_analyzed.tga",
	'expiration', 150000,
	'fx_action', "UINotificationAnomaly",
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "ColdWave",
	'title', T{4149, --[[OnScreenNotificationPreset ColdWave title]] "Cold Wave"},
	'text', T{5618, --[[OnScreenNotificationPreset ColdWave text]] "Disaster starts in <countdown>"},
	'voiced_text', T{7043, --[[voice:aide]] "Cold Wave approaching"},
	'image', "UI/Icons/Notifications/cold_wave_2.tga",
	'popup_preset', "ColdWave",
	'game_time', true,
	'display_countdown', true,
	'dismissable', false,
	'fx_action', "UINotificationColdWave",
	'encyclopedia_id', "Cold_Wave",
	'priority', "Important",
	'VignetteImage', "UI/Vignette_Red.tga",
	'VignettePulseDuration', 2000,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "ColdWaveDuration",
	'title', T{4149, --[[OnScreenNotificationPreset ColdWaveDuration title]] "Cold Wave"},
	'text', T{5619, --[[OnScreenNotificationPreset ColdWaveDuration text]] "Remaining duration: <countdown>"},
	'image', "UI/Icons/Notifications/cold_wave_2.tga",
	'popup_preset', "ColdWave",
	'game_time', true,
	'display_countdown', true,
	'dismissable', false,
	'fx_action', "UINotificationColdWave",
	'encyclopedia_id', "Cold_Wave",
	'priority', "Important",
	'VignetteImage', "UI/Vignette_Red.tga",
	'VignettePulseDuration', 2000,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "ColdWaveEndless",
	'title', T{4149, --[[OnScreenNotificationPreset ColdWaveEndless title]] "Cold Wave"},
	'text', T{7437, --[[OnScreenNotificationPreset ColdWaveEndless text]] "Time remaining: unknown"},
	'image', "UI/Icons/Notifications/cold_wave_2.tga",
	'popup_preset', "ColdWave",
	'game_time', true,
	'dismissable', false,
	'fx_action', "UINotificationColdWave",
	'encyclopedia_id', "Cold_Wave",
	'priority', "Important",
	'VignetteImage', "UI/Vignette_Red.tga",
	'VignettePulseDuration', 2000,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "MeteorStorm",
	'title', T{5620, --[[OnScreenNotificationPreset MeteorStorm title]] "Meteor Storm"},
	'text', T{5618, --[[OnScreenNotificationPreset MeteorStorm text]] "Disaster starts in <countdown>"},
	'voiced_text', T{7044, --[[voice:aide]] "Meteor Shower incoming"},
	'image', "UI/Icons/Notifications/meteor_storm_2.tga",
	'popup_preset', "MeteorStorm",
	'game_time', true,
	'display_countdown', true,
	'dismissable', false,
	'fx_action', "UINotificationMeteorStorm",
	'encyclopedia_id', "Meteors",
	'priority', "Important",
	'VignetteImage', "UI/Vignette_Red.tga",
	'VignettePulseDuration', 2000,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "MeteorStormDuration",
	'title', T{5620, --[[OnScreenNotificationPreset MeteorStormDuration title]] "Meteor Storm"},
	'text', T{5619, --[[OnScreenNotificationPreset MeteorStormDuration text]] "Remaining duration: <countdown>"},
	'image', "UI/Icons/Notifications/meteor_storm_2.tga",
	'popup_preset', "MeteorStorm",
	'game_time', true,
	'display_countdown', true,
	'dismissable', false,
	'fx_action', "UINotificationMeteorStorm",
	'encyclopedia_id', "Meteors",
	'priority', "Important",
	'VignetteImage', "UI/Vignette_Red.tga",
	'VignettePulseDuration', 2000,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "ResearchAvailable",
	'title', T{5621, --[[OnScreenNotificationPreset ResearchAvailable title]] "No Active Research"},
	'text', T{5622, --[[OnScreenNotificationPreset ResearchAvailable text]] "Select a Tech to research"},
	'voiced_text', T{7045, --[[voice:aide]] "No active Research"},
	'image', "UI/Icons/Notifications/research_2.tga",
	'priority', "Important",
	'VignetteImage', "UI/Vignette_Red.tga",
	'VignettePulseDuration', 2000,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "MeteorImpact",
	'title', T{5623, --[[OnScreenNotificationPreset MeteorImpact title]] "Incoming Meteor"},
	'text', T{5624, --[[OnScreenNotificationPreset MeteorImpact text]] "Cycle through impact positions"},
	'voiced_text', T{7046, --[[voice:aide]] "Meteor incoming"},
	'image', "UI/Icons/Notifications/meteor_storm_2.tga",
	'priority', "Important",
	'VignetteImage', "UI/Vignette_Red.tga",
	'VignettePulseDuration', 2000,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "FracturedDome",
	'title', T{5625, --[[OnScreenNotificationPreset FracturedDome title]] "Fractures"},
	'text', T{5626, --[[OnScreenNotificationPreset FracturedDome text]] "Fractured Domes: <count>"},
	'image', "UI/Icons/Notifications/fractured_dome_2.tga",
	'priority', "Important",
	'VignetteImage', "UI/Vignette_Red.tga",
	'VignettePulseDuration', 2000,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "normalDustStorm",
	'title', T{4250, --[[OnScreenNotificationPreset normalDustStorm title]] "Dust Storm"},
	'text', T{5618, --[[OnScreenNotificationPreset normalDustStorm text]] "Disaster starts in <countdown>"},
	'voiced_text', T{7047, --[[voice:aide]] "Dust Storm approaching"},
	'image', "UI/Icons/Notifications/dust_storm_2.tga",
	'popup_preset', "normalDustStorm",
	'game_time', true,
	'display_countdown', true,
	'dismissable', false,
	'fx_action', "UINotificationDustStorm",
	'encyclopedia_id', "Duststorm",
	'priority', "Important",
	'VignetteImage', "UI/Vignette_Red.tga",
	'VignettePulseDuration', 2000,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "greatDustStorm",
	'title', T{5627, --[[OnScreenNotificationPreset greatDustStorm title]] "Great Dust Storm"},
	'text', T{5618, --[[OnScreenNotificationPreset greatDustStorm text]] "Disaster starts in <countdown>"},
	'voiced_text', T{7048, --[[voice:aide]] "Great Dust Storm approaching"},
	'image', "UI/Icons/Notifications/dust_storm_2.tga",
	'popup_preset', "greatDustStorm",
	'game_time', true,
	'display_countdown', true,
	'dismissable', false,
	'fx_action', "UINotificationDustStormGreat",
	'encyclopedia_id', "Duststorm",
	'priority', "Important",
	'VignetteImage', "UI/Vignette_Red.tga",
	'VignettePulseDuration', 2000,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "electrostaticDustStorm",
	'title', T{5628, --[[OnScreenNotificationPreset electrostaticDustStorm title]] "Electrostatic Dust Storm"},
	'text', T{5618, --[[OnScreenNotificationPreset electrostaticDustStorm text]] "Disaster starts in <countdown>"},
	'voiced_text', T{7049, --[[voice:aide]] "Electrostatic Dust Storm approaching"},
	'image', "UI/Icons/Notifications/dust_storm_2.tga",
	'popup_preset', "electrostaticDustStorm",
	'game_time', true,
	'display_countdown', true,
	'dismissable', false,
	'fx_action', "UINotificationDustStormElectrostatic",
	'encyclopedia_id', "Duststorm",
	'priority', "Important",
	'VignetteImage', "UI/Vignette_Red.tga",
	'VignettePulseDuration', 2000,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "normalDustStormDuration",
	'title', T{4250, --[[OnScreenNotificationPreset normalDustStormDuration title]] "Dust Storm"},
	'text', T{5619, --[[OnScreenNotificationPreset normalDustStormDuration text]] "Remaining duration: <countdown>"},
	'image', "UI/Icons/Notifications/dust_storm_2.tga",
	'popup_preset', "normalDustStorm",
	'game_time', true,
	'display_countdown', true,
	'dismissable', false,
	'fx_action', "UINotificationDustStorm",
	'encyclopedia_id', "Duststorm",
	'priority', "Important",
	'VignetteImage', "UI/Vignette_Red.tga",
	'VignettePulseDuration', 2000,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "greatDustStormDuration",
	'title', T{5627, --[[OnScreenNotificationPreset greatDustStormDuration title]] "Great Dust Storm"},
	'text', T{5619, --[[OnScreenNotificationPreset greatDustStormDuration text]] "Remaining duration: <countdown>"},
	'image', "UI/Icons/Notifications/dust_storm_2.tga",
	'popup_preset', "greatDustStorm",
	'game_time', true,
	'display_countdown', true,
	'dismissable', false,
	'fx_action', "UINotificationDustStormGreat",
	'encyclopedia_id', "Duststorm",
	'priority', "Important",
	'VignetteImage', "UI/Vignette_Red.tga",
	'VignettePulseDuration', 2000,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "electrostaticDustStormDuration",
	'title', T{5628, --[[OnScreenNotificationPreset electrostaticDustStormDuration title]] "Electrostatic Dust Storm"},
	'text', T{5619, --[[OnScreenNotificationPreset electrostaticDustStormDuration text]] "Remaining duration: <countdown>"},
	'image', "UI/Icons/Notifications/dust_storm_2.tga",
	'popup_preset', "electrostaticDustStorm",
	'game_time', true,
	'display_countdown', true,
	'dismissable', false,
	'fx_action', "UINotificationDustStormElectrostatic",
	'encyclopedia_id', "Duststorm",
	'priority', "Important",
	'VignetteImage', "UI/Vignette_Red.tga",
	'VignettePulseDuration', 2000,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "NoOxygen",
	'title', T{5635, --[[OnScreenNotificationPreset NoOxygen title]] "No Oxygen"},
	'text', T{5636, --[[OnScreenNotificationPreset NoOxygen text]] "Domes without Oxygen: <count>"},
	'voiced_text', T{7050, --[[voice:aide]] "We have an Oxygen shortage"},
	'image', "UI/Icons/Notifications/oxygen_2.tga",
	'priority', "Critical",
	'ShowVignette', true,
	'VignetteImage', "UI/Vignette_Red.tga",
	'VignettePulseDuration', 2000,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "NoWater",
	'title', T{5637, --[[OnScreenNotificationPreset NoWater title]] "No Water"},
	'text', T{5638, --[[OnScreenNotificationPreset NoWater text]] "Domes without Water: <count>"},
	'voiced_text', T{7051, --[[voice:aide]] "We have a Water shortage"},
	'image', "UI/Icons/Notifications/water_2.tga",
	'priority', "Critical",
	'ShowVignette', true,
	'VignetteImage', "UI/Vignette_Red.tga",
	'VignettePulseDuration', 2000,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "DomesWithNoPower",
	'title', T{5581, --[[OnScreenNotificationPreset DomesWithNoPower title]] "No Power"},
	'text', T{5639, --[[OnScreenNotificationPreset DomesWithNoPower text]] "Domes without Power: <count>"},
	'voiced_text', T{7033, --[[voice:aide]] "We have a Power shortage"},
	'image', "UI/Icons/Notifications/no_power_2.tga",
	'priority', "Critical",
	'ShowVignette', true,
	'VignetteImage', "UI/Vignette_Red.tga",
	'VignettePulseDuration', 2000,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "InsufficientMaintenanceResources",
	'title', T{5640, --[[OnScreenNotificationPreset InsufficientMaintenanceResources title]] "Resources are low"},
	'text', T{5641, --[[OnScreenNotificationPreset InsufficientMaintenanceResources text]] "<low_on_resource_text> <resources>"},
	'voiced_text', T{7052, --[[voice:aide]] "Resources are low"},
	'priority', "Important",
	'VignetteImage', "UI/Vignette_Red.tga",
	'VignettePulseDuration', 2000,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "DepletedDeposits",
	'title', T{5642, --[[OnScreenNotificationPreset DepletedDeposits title]] "Depleted Deposits"},
	'text', T{5643, --[[OnScreenNotificationPreset DepletedDeposits text]] "Depleted deposits: <count>"},
	'voiced_text', T{7053, --[[voice:aide]] "Deposit depleted"},
	'image', "UI/Icons/Notifications/deposit_depleted.tga",
	'expiration', 150000,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "NoDeposits",
	'title', T{5644, --[[OnScreenNotificationPreset NoDeposits title]] "Idle Extractors"},
	'text', T{5645, --[[OnScreenNotificationPreset NoDeposits text]] "Buildings with depleted deposits: <count>"},
	'image', "UI/Icons/Notifications/deposit_depleted.tga",
	'expiration', 150000,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "DeadCitizens",
	'title', T{5646, --[[OnScreenNotificationPreset DeadCitizens title]] "Deaths in the Colony"},
	'text', T{5647, --[[OnScreenNotificationPreset DeadCitizens text]] "Dead Colonists: <count>"},
	'voiced_text', T{7054, --[[voice:aide]] "A Colonist has died"},
	'image', "UI/Icons/Notifications/colonist_2.tga",
	'fx_action', "UINotificationColonistsDie",
	'priority', "Important",
	'VignetteImage', "UI/Vignette_Red.tga",
	'VignettePulseDuration', 2000,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "Mystery8DeathInfection",
	'title', T{8511, --[[OnScreenNotificationPreset Mystery8DeathInfection title]] "Infected Colonist Deaths"},
	'text', T{8512, --[[OnScreenNotificationPreset Mystery8DeathInfection text]] "Infected Colonists Dead: <count>"},
	'voiced_text', T{7054, --[[voice:aide]] "A Colonist has died"},
	'image', "UI/Icons/Notifications/colonist_2.tga",
	'fx_action', "UINotificationColonistsDie",
	'priority', "Important",
	'VignetteImage', "UI/Vignette_Red.tga",
	'VignettePulseDuration', 2000,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "EarthSickColonists",
	'title', T{3879, --[[OnScreenNotificationPreset EarthSickColonists title]] "Earthsick"},
	'text', T{7055, --[[OnScreenNotificationPreset EarthSickColonists text]] "<count> Colonists are Earthsick"},
	'voiced_text', T{7056, --[[voice:aide]] "There are Earthsick Colonists"},
	'image', "UI/Icons/Notifications/colonist_2.tga",
	'fx_action', "UINotificationColonistsDie",
	'priority', "Important",
	'VignetteImage', "UI/Vignette_Red.tga",
	'VignettePulseDuration', 2000,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "NotWorkingBuildings",
	'title', T{5648, --[[OnScreenNotificationPreset NotWorkingBuildings title]] "Buildings Not Working"},
	'text', T{5649, --[[OnScreenNotificationPreset NotWorkingBuildings text]] "Buildings not working: <count>"},
	'fx_action', "UINotificationBuildingInactive",
	'priority', "Important",
	'VignetteImage', "UI/Vignette_Red.tga",
	'VignettePulseDuration', 2000,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "MilestoneComplete",
	'title', T{5650, --[[OnScreenNotificationPreset MilestoneComplete title]] "Milestone achieved!"},
	'text', T{756643722601, --[[OnScreenNotificationPreset MilestoneComplete text]] "<display_name>"},
	'voiced_text', T{7057, --[[voice:aide]] "Milestone achieved"},
	'image', "UI/Icons/Notifications/milestone_complete.tga",
	'close_on_read', true,
	'expiration', 300000,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "TechUnlockAnomalyAnalyzed",
	'title', T{5614, --[[OnScreenNotificationPreset TechUnlockAnomalyAnalyzed title]] "Anomaly Analyzed"},
	'text', T{5651, --[[OnScreenNotificationPreset TechUnlockAnomalyAnalyzed text]] "New Techs are available for research"},
	'voiced_text', T{7042, --[[voice:aide]] "Anomaly analyzed"},
	'image', "UI/Icons/Notifications/anomaly_analyzed.tga",
	'expiration', 150000,
	'VignetteImage', "UI/Vignette_Red.tga",
	'VignettePulseDuration', 2000,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "GrantRP",
	'title', T{5614, --[[OnScreenNotificationPreset GrantRP title]] "Anomaly Analyzed"},
	'text', T{5652, --[[OnScreenNotificationPreset GrantRP text]] "Gained <research(points)>"},
	'voiced_text', T{7042, --[[voice:aide]] "Anomaly analyzed"},
	'image', "UI/Icons/Notifications/anomaly_analyzed.tga",
	'close_on_read', true,
	'expiration', 150000,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "AlienArtifactsAnomalyAnalyzed",
	'title', T{5614, --[[OnScreenNotificationPreset AlienArtifactsAnomalyAnalyzed title]] "Anomaly Analyzed"},
	'text', T{5653, --[[OnScreenNotificationPreset AlienArtifactsAnomalyAnalyzed text]] "Research cost of all Techs reduced"},
	'voiced_text', T{7042, --[[voice:aide]] "Anomaly analyzed"},
	'image', "UI/Icons/Notifications/anomaly_analyzed.tga",
	'expiration', 150000,
	'fx_action', "UINotificationAnomaly",
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "ResearchComplete",
	'title', T{5654, --[[OnScreenNotificationPreset ResearchComplete title]] "Research Complete"},
	'text', T{3846, --[[OnScreenNotificationPreset ResearchComplete text]] "<name>"},
	'voiced_text', T{7058, --[[voice:aide]] "Research complete"},
	'image', "UI/Icons/Notifications/research_2.tga",
	'close_on_read', true,
	'expiration', 150000,
	'fx_action', "UINotificationResearchComplete",
	'priority', "Important",
	'VignetteImage', "UI/Vignette_Red.tga",
	'VignettePulseDuration', 2000,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "Mystery1Counter",
	'title', T{5655, --[[OnScreenNotificationPreset Mystery1Counter title]] "Countdown"},
	'text', T{5656, --[[OnScreenNotificationPreset Mystery1Counter text]] "Cube countdown: <value> hours"},
	'image', "UI/Icons/Notifications/timer.tga",
	'dismissable', false,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "Mystery3Counter",
	'title', T{5655, --[[OnScreenNotificationPreset Mystery3Counter title]] "Countdown"},
	'text', T{7438, --[[OnScreenNotificationPreset Mystery3Counter text]] "Sphere Unknown Event: <percent(value)>"},
	'image', "UI/Icons/Notifications/timer.tga",
	'dismissable', false,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "Mystery2Counter",
	'title', T{5655, --[[OnScreenNotificationPreset Mystery2Counter title]] "Countdown"},
	'text', T{5657, --[[OnScreenNotificationPreset Mystery2Counter text]] "Time to impact: <countdown>"},
	'image', "UI/Icons/Notifications/timer.tga",
	'game_time', true,
	'display_countdown', true,
	'dismissable', false,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "Mystery2DiggerDetected",
	'title', T{5658, --[[OnScreenNotificationPreset Mystery2DiggerDetected title]] "Dredger Detected"},
	'text', T{5659, --[[OnScreenNotificationPreset Mystery2DiggerDetected text]] "Dredger landing expected in Sector <u(value)>"},
	'voiced_text', T{7059, --[[voice:aide]] "Dredgers detected"},
	'close_on_read', true,
	'expiration', 150000,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "Mystery2DiggerLanded",
	'title', T{282, --[[OnScreenNotificationPreset Mystery2DiggerLanded title]] "Landing"},
	'text', T{5660, --[[OnScreenNotificationPreset Mystery2DiggerLanded text]] "Another Dredger has landed on Mars"},
	'close_on_read', true,
	'expiration', 150000,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "Mystery4Mirage",
	'title', T{7439, --[[OnScreenNotificationPreset Mystery4Mirage title]] "Mysterious Mirages"},
	'text', T{7440, --[[OnScreenNotificationPreset Mystery4Mirage text]] "Remaining duration: Unknown"},
	'image', "UI/Icons/Notifications/placeholder_2.tga",
	'game_time', true,
	'dismissable', false,
	'priority', "Important",
	'VignetteImage', "UI/Vignette_Red.tga",
	'VignettePulseDuration', 2000,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "Mystery5RogueDrones",
	'title', T{7060, --[[OnScreenNotificationPreset Mystery5RogueDrones title]] "Rogue Drones are attacking!"},
	'text', T{7061, --[[OnScreenNotificationPreset Mystery5RogueDrones text]] "Rogue Drones: <count>"},
	'image', "UI/Icons/Notifications/placeholder_2.tga",
	'priority', "Critical",
	'ShowVignette', true,
	'VignetteImage', "UI/Vignette_Red.tga",
	'VignettePulseDuration', 2000,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "Mystery5DestoyedBuildings",
	'title', T{7566, --[[OnScreenNotificationPreset Mystery5DestoyedBuildings title]] "Hostile attack"},
	'text', T{7567, --[[OnScreenNotificationPreset Mystery5DestoyedBuildings text]] "Buildings destroyed: <count>"},
	'image', "UI/Icons/Notifications/placeholder.tga",
	'VignettePulseDuration', 2000,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "Mystery5RoverMalfunction",
	'title', T{7568, --[[OnScreenNotificationPreset Mystery5RoverMalfunction title]] "AI Fights back"},
	'text', T{7569, --[[OnScreenNotificationPreset Mystery5RoverMalfunction text]] "Number Six has sabotaged the Explorer"},
	'image', "UI/Icons/Notifications/placeholder.tga",
	'expiration', 150000,
	'VignettePulseDuration', 2000,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "Mystery6Reward",
	'title', T{7062, --[[OnScreenNotificationPreset Mystery6Reward title]] "EsoCorp Reward"},
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "Mystery8InfectionLevel",
	'title', T{8120, --[[OnScreenNotificationPreset Mystery8InfectionLevel title]] "Infection Level"},
	'image', "UI/Icons/Notifications/no_life_support.tga",
	'dismissable', false,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "Mystery8SellCure",
	'title', T{8474, --[[OnScreenNotificationPreset Mystery8SellCure title]] "Cure Exported to Earth!"},
	'expiration', 150000,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "Mystery7WarTension",
	'title', T{8121, --[[OnScreenNotificationPreset Mystery7WarTension title]] "War On Earth"},
	'text', T{8122, --[[OnScreenNotificationPreset Mystery7WarTension text]] "War Tension:"},
	'dismissable', false,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "Mystery9ProjectProgress",
	'title', T{8450, --[[OnScreenNotificationPreset Mystery9ProjectProgress title]] "Beyond Earth Initiative"},
	'expiration', 150000,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "MysteryLog",
	'title', T{5661, --[[OnScreenNotificationPreset MysteryLog title]] "Mystery Log"},
	'text', T{5662, --[[OnScreenNotificationPreset MysteryLog text]] "History of Events"},
	'image', "UI/Icons/Notifications/mystery_log.tga",
	'popup_preset', "MysteryLog",
	'dismissable', false,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "RefugeeRocket",
	'title', T{8123, --[[OnScreenNotificationPreset RefugeeRocket title]] "Refugee Rocket"},
	'image', "UI/Icons/Notifications/colonist.tga",
	'expiration', 150000,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "SectorScanAvailable",
	'title', T{5422, --[[OnScreenNotificationPreset SectorScanAvailable title]] "Exploration"},
	'text', T{5663, --[[OnScreenNotificationPreset SectorScanAvailable text]] "Select a Sector to scan"},
	'voiced_text', T{7063, --[[voice:aide]] "Select a Sector to scan"},
	'image', "UI/Icons/Notifications/scan_2.tga",
	'priority', "Important",
	'VignetteImage', "UI/Vignette_Red.tga",
	'VignettePulseDuration', 2000,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "SectorScanned",
	'title', T{5664, --[[OnScreenNotificationPreset SectorScanned title]] "Sector <u(name)> scanned"},
	'text', T{5665, --[[OnScreenNotificationPreset SectorScanned text]] "<results>"},
	'voiced_text', T{7064, --[[voice:aide]] "Sector scanned"},
	'image', "UI/Icons/Notifications/scan.tga",
	'expiration', 150000,
	'game_time', true,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "VehiclesLowBattery",
	'title', T{5666, --[[OnScreenNotificationPreset VehiclesLowBattery title]] "Low Battery"},
	'text', T{5667, --[[OnScreenNotificationPreset VehiclesLowBattery text]] "Vehicles with low Power: <count>"},
	'voiced_text', T{7065, --[[voice:aide]] "Vehicle Battery low"},
	'image', "UI/Icons/Notifications/low_battery.tga",
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "BrokenCables",
	'title', T{5668, --[[OnScreenNotificationPreset BrokenCables title]] "Cable Faults"},
	'text', T{5669, --[[OnScreenNotificationPreset BrokenCables text]] "Malfunctioning Cables: <count>"},
	'voiced_text', T{7066, --[[voice:aide]] "Cable fault reported"},
	'priority', "Important",
	'VignetteImage', "UI/Vignette_Red.tga",
	'VignettePulseDuration', 2000,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "BrokenPipes",
	'title', T{5670, --[[OnScreenNotificationPreset BrokenPipes title]] "Pipe Leaks"},
	'text', T{5671, --[[OnScreenNotificationPreset BrokenPipes text]] "Malfunctioning Pipes: <count>"},
	'voiced_text', T{7067, --[[voice:aide]] "Pipe leak reported"},
	'priority', "Important",
	'VignetteImage', "UI/Vignette_Red.tga",
	'VignettePulseDuration', 2000,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "OrphanedDrones",
	'title', T{5672, --[[OnScreenNotificationPreset OrphanedDrones title]] "Orphaned Drones"},
	'text', T{5673, --[[OnScreenNotificationPreset OrphanedDrones text]] "Drones with no controller: <count>"},
	'image', "UI/Icons/Notifications/drone.tga",
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "RareMetalsExport",
	'title', T{5674, --[[OnScreenNotificationPreset RareMetalsExport title]] "Rare Metals Export"},
	'text', T{5675, --[[OnScreenNotificationPreset RareMetalsExport text]] "Funding received: <funding(funding)>"},
	'voiced_text', T{7068, --[[voice:aide]] "Funding received"},
	'expiration', 25000,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "CropsFailed",
	'title', T{5676, --[[OnScreenNotificationPreset CropsFailed title]] "Crop Failure"},
	'text', T{5677, --[[OnScreenNotificationPreset CropsFailed text]] "No edible Food has been harvested"},
	'voiced_text', T{7069, --[[voice:aide]] "Crop failure reported"},
	'image', "UI/Icons/Notifications/food.tga",
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "StarvingColonists",
	'title', T{5678, --[[OnScreenNotificationPreset StarvingColonists title]] "Food Shortage"},
	'text', T{5679, --[[OnScreenNotificationPreset StarvingColonists text]] "Starving Colonists: <count>"},
	'voiced_text', T{7070, --[[voice:aide]] "We have a Food shortage"},
	'image', "UI/Icons/Notifications/colonist_2.tga",
	'priority', "Critical",
	'ShowVignette', true,
	'VignetteImage', "UI/Vignette_Red.tga",
	'VignettePulseDuration', 2000,
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "FounderStageDuration",
	'title', T{5680, --[[OnScreenNotificationPreset FounderStageDuration title]] "Founder Stage"},
	'text', T{5619, --[[OnScreenNotificationPreset FounderStageDuration text]] "Remaining duration: <countdown>"},
	'game_time', true,
	'display_countdown', true,
	'dismissable', false,
	'encyclopedia_id', "Founders",
})

PlaceObj('OnScreenNotificationPreset', {
	'name', "AchievementUnlocked",
	'title', T{7441, --[[OnScreenNotificationPreset AchievementUnlocked title]] "Achievement Unlocked: <achievement>"},
	'text', T{7383, --[[OnScreenNotificationPreset AchievementUnlocked text]] "<description>"},
	'image', "UI/Icons/Notifications/mystery_log_2.tga",
	'priority', "Important",
	'VignetteImage', "UI/Vignette_Red.tga",
	'VignettePulseDuration', 2000,
})

