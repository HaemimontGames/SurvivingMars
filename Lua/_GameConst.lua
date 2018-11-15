
--config.TraceEnabled = true
const.DayDuration = const.Scale.sols
const.HoursPerDay = const.Scale.sols / const.Scale.hours
const.HourDuration = const.Scale.hours
const.MinutesPerHour = 60
const.MinuteDuration = const.HourDuration / const.MinutesPerHour
assert(const.HourDuration % const.MinutesPerHour == 0)
const.MinDaysMaintenanceSupplyBeforeNotification = 3
const.MinDaysFoodSupplyBeforeNotification = 3
const.MinHoursAirResourceSupplyBeforeNotification =   3*const.HoursPerDay
const.MinHoursWaterResourceSupplyBeforeNotification = 3*const.HoursPerDay
const.MinHoursPowerResourceSupplyBeforeNotification = 3*const.HoursPerDay
const.FullTransitionToMarsNames = 20--in sols
const.DefaultAutosaveCount = 2
const.DefaultAutosaveInterval = 5--in sols

const.ResearchQueueSize = 4

const.mediumGameSpeed = 3
const.fastGameSpeed = 5

const.GridSpacing = GetHexgridSpacingDefine() --10*guim, 1000
const.GridVerticalSpacing = HexGetVerticalSpacing()
const.HexHeight = HexGetHeight() --dist between 2 opposite verts.
const.HexSize = HexGetSize() --from center 2 any vertex

const.ResourceScale = const.Scale.Resources --resource scale.
const.SoilQualityScale = 100

const.ResearchPointsScale = 1000

const.StoragePropagationThreshold = 2 -- storages will request up to this much resources so they can be propagated to other storages

const.MaxMaintenance = 100000
const.DefaultMaintenanceBuildUpPerHour = 600

const.BreakThroughTechsPerGame = 13
--these should be kept in some specific order (see ResearchDlg.lua)

const.TaskPriorityBoost = 4 -- boost 4 means multiply requests by x1, x4, x16
const.MaxBuildingPriority = 3 -- 1 normal, 2 - high, 3 - urgent

const.TransportMinResAmountTreshold = 5000 --will not take from storages with less or this much?
const.TransportDistThreshold = 250*guim --objects closer than this will provoke path test
const.TransportDistMin = const.GridSpacing -- objects closer than this wont be LR transportated

const.CommandCenterDefaultRadius = 35
const.CommandCenterMaxRadius = 35
const.CommandCenterMinRadius = 5
const.MoistureVaporatorRange = 5
const.MoistureVaporatorPenaltyPercent = 40
const.OmegaTelescopeBreakthroughsCount = 3
const.OmegaTelescopeBoostPercent = 20
const.MoholeMineHeatRadius = 8 --in hexes
const.AdvancedStirlingGeneratorHeatRadius = 6

const.RCRoverDefaultRadius = 20
const.RCRoverMaxRadius = 20
const.RCRoverMinRadius = 5

const.DroneBatteryMax = 800*100
const.DroneTimeAfterUserGotoToRest = 30 * 1000
const.DroneTimeAfterUserPickUpToRest = 30 * 1000
const.DroneFractionRepairTime = 25 * 1000

const.DroneLoadLowThreshold = const.HourDuration / 3
const.DroneLoadMediumThreshold = const.HourDuration * 3

const.RangeToCheckForExploitersOnDepositReveal = 10 --when a subsurface deposit is revealed, it will notify all exploiters in this range. It is also the max range settable for buildings that exploit subsurface deposits.
const.DepositDeepestLayer = 2

const.DefaultMouseCursor = "UI/Cursors/cursor.tga"
const.InterfaceAnimDuration = 100
const.OverlaysVisibleDuration = 5*60*1000

const.PreGameMenuFadeInDuration = 450
const.PreGameMenuFadeOutDuration = 450

const.DemolishCountdownMax = 5 * 1000

const.MaxDomeDist = 300*guim

const.MinTradeAmount = 5 --amounts for resources that can be traded with rival colonies
const.MaxTradeAmount = 50
const.DistressCallCooldown = 5 --in Sols

const.ScanTick = 1000
const.SectorCount = 10 -- per dimension
const.SectorScanBase = 50 -- scan points per hour
const.SectorScanPoints = 2500
const.SectorDeepScanPoints = 3000
const.SensorTowerCumulativeScanBoost = 10          -- every working tower provides this much cumulative boost to all sectors
const.SensorTowerCumulativeScanBoostMax = 100      -- max cumulative scan boost
const.SensorTowerScanBoostMax = 390                -- max boost provided by the nearest tower to the sector
const.SensorTowerScanBoostMinRange = 200 * guim    -- range of max boost (boost = max)
const.SensorTowerScanBoostMaxRange = 1200 * guim   -- range of no boost (boost = 0%)
const.SensorTowerPredictionAddTime = 12 * const.HourDuration	-- each tower increases prediction time with that much
const.SensorTowerPredictionMaxTime = 75 * const.HourDuration
const.ExplorationQueueMaxSize = 10
const.DepositObstructMaxRadius = 3*guim	-- range around the deposit marker pos to check for nearby buildings

const.ColonistMaxWaitShuttlePickupTimeMs = const.DayDuration --the amount of time a colonist would wait a shuttle pickup before giving up.
const.ColonistMaxWaitInDomeTurnedOff = 2 * const.HourDuration --the amount of time a colonist would wait in a turned off dome before trying to emigrate.
const.ColonistMaxDepartureRocketDist = 1200 * guim --when leaving, a rocket cant be used if placed beyond that distance from the dome
const.ColonistMaxDomeWalkDist = 400 * guim -- distance between two domes to consider them in walk range

-- OverviewCamera
const.OverviewCamLookAt = point(48, 48, 0) -- percent of map size
const.OverviewCamPos = point(-48, -48, 135) -- percent of map size
const.OverviewCamRotateArea = 1 -- percent of screen size

ResourceDescription = {
	{ name = "Concrete",        display_name = T{3513, "Concrete"},         display_icon = "UI/Icons/Buildings/res_concrete.tga", unit_amount = const.ResourceScale, color = RGB(169, 159, 90), entity = "ResourceRegolith", description = T{7909, "Basic construction material often used to construct and maintain Domes and Dome buildings."}, },
	{ name = "Metals",          display_name = T{3514, "Metals"},           display_icon = "UI/Icons/Buildings/res_metals.tga", unit_amount = const.ResourceScale, color = RGB(240, 51, 33), entity = "ResourceMetal", deep_enabled = true, description = T{7910, "Basic construction materials often used to construct and maintain outside buildings. Required for the creation of Machine Parts."}, },
	{ name = "Polymers",        display_name = T{3515, "Polymers"},         display_icon = "UI/Icons/Buildings/res_polymers.tga", unit_amount = const.ResourceScale, color = RGB(163, 7, 245), entity = "ResourcePolymer", description = T{7911, "Advanced materials often used to construct and maintain Power accumulators, advanced Power generators, Domes and Spires."}, },
	{ name = "Electronics",     display_name = T{3517, "Electronics"},      display_icon = "UI/Icons/Buildings/res_electronics.tga", unit_amount = const.ResourceScale, color = RGB(63, 245, 7), entity = "ResourceElectronics", description = T{7912, "Advanced materials often used to construct and maintain scientific and infrastructure buildings."}, },
	{ name = "MachineParts",    display_name = T{3516, "Machine Parts"},    display_icon = "UI/Icons/Buildings/res_machine_parts.tga", unit_amount = const.ResourceScale, color = RGB(63, 7, 245), entity = "ResourceMachineParts", description = T{7913, "Advanced materials often used to construct and maintain Extractors and Factories."}, },
	{ name = "PreciousMetals",  display_name = T{4139, "Rare Metals"},      display_icon = "UI/Icons/Buildings/res_precious_metals.tga", unit_amount = const.ResourceScale, color = RGB(245, 163, 7), entity = "ResourcePreciousMetals" , description = T{7985, "Can be exported to Earth for Funding or processed into Electronics."}},
	{ name = "WasteRock",       display_name = T{4518, "Waste Rock"},       display_icon = "UI/Icons/Buildings/res_waste_rock.tga", unit_amount = const.ResourceScale, color = RGB(0, 255, 0), entity = {"ResourceWasteRock_01", "ResourceWasteRock_02", "ResourceWasteRock_03"} },
	{ name = "BlackCube",       display_name = T{4764, "Black Cubes"},      display_icon = "UI/Icons/Buildings/res_black_box.tga", unit_amount = const.ResourceScale, color = RGB(0, 0, 0), entity = "Resource", },
	{ name = "Water",           display_name = T{681, "Water"},            display_icon = "UI/Icons/Buildings/res_water.tga", unit_amount = const.ResourceScale, color = RGB(0, 237, 255), deep_enabled = true },
	{ name = "Food",            display_name = T{1022, "Food"},             display_icon = "UI/Icons/Buildings/res_food.tga", unit_amount = const.ResourceScale, color = RGB(128, 255, 0), entity = "ResourceFood", description = T{7914, "Colonists arrive with nominal Food supply, but will soon need additional provisions to survive."}, },
	{ name = "Fuel",            display_name = T{4765, "Fuel"},             display_icon = "UI/Icons/Buildings/res_fuel.tga", unit_amount = const.ResourceScale, color = RGB(255, 128, 0), entity = "ResourceFuel", description = T{7986, "Advanced resource produced in Fuel Refineries from Water. Required for the refuelling of Rockets. Highly explosive."} },	
	{ name = "Funding",         display_name = T{3613, "Funding"},    },
	{ name = "Colonist",        display_name = T{4290, "Colonist"},         display_icon = "UI/Icons/Buildings/res_fuel.tga", unit_amount = const.ResourceScale, color = RGB(255, 128, 0), entity = "ResourceFuel" },	
	{ name = "MysteryResource", display_name = T{8064, "Mystery Resource"}, display_icon = "UI/Icons/Buildings/res_mystery_resource.tga", unit_amount = const.ResourceScale, color = RGB(128, 255, 0), entity = "ResourceMystery", description = T{8065, "Mystery Resource Description"} },
	{ name = "ResearchPoints",  display_name = T{9755, "Research Points"},        display_icon = "UI/Icons/res_experimental_research.tga", unit_amount = const.ResourceScale, color = RGB(128, 255, 0), entity = "ResourceFuel", description = T{9755, "Research Points"} },
}

Resources = {}
ResourcesDropDownListItems = {}
for i, desc in ipairs(ResourceDescription) do
	Resources[desc.name] = desc
end

--when adding a new category, add its name to AllResourceListNames below
ConstructionResourceList = {"Concrete", "Metals", "Polymers", "BlackCube", "Electronics", "MachineParts", "PreciousMetals" }
DepositResources = {"Concrete", "Metals", "Polymers", "Water", "PreciousMetals" }
LifeSupportResourceList = { "Food" }
OtherResourceList = { "WasteRock", "Fuel", "MysteryResource" }
StockpileResourceList = { "Metals", "Concrete", "Food", "PreciousMetals", "Polymers", "Electronics", "MachineParts", "Fuel" }


for i, desc in ipairs(ResourceDescription) do
	ResourcesDropDownListItems[i] = { value = desc.name, text = desc.display_name }
end

AllResourceListNames = { "Construction", "LifeSupport", "Other" }
AllResourcesList = {}
for _,categoryName in ipairs(AllResourceListNames) do
	local list = _G[categoryName.."ResourceList"]
	for _,resource in ipairs(list) do
		table.insert_unique(AllResourcesList, resource)
	end
end

const.ResourceUnitsInPile = 10

--surface deposits default amount range
--unscaled
DepositsDefaultAmountRange = 
{
	["Concrete"] = range(3, 10),
	["Metals"]   = range(5, 15),
	["Polymers"] = range(1, 3),
	["Water"]    = range(3000, 6000),
}

for i=1,#DepositResources do
	DepositResources[DepositResources[i]] = true
end

const.ConstructBorder = 50 * guim -- construction forbiden zone near map end
const.HeatGridBorder = 100 * guim
const.HeatGridTileSize = 512
const.SubsurfaceHeaterFrameRange = const.HeatGridTileSize * 4
const.DefaultPanaltyHeat = 210 -- Heat at which the cold penalty is applied
const.DefaultPanaltyPct = 100   -- Cold penalty percents
const.DefaultFreezeHeat = 100  -- Heat at which the building begins to freeze
const.DefaultFreezeTime = 24 * const.HourDuration   -- Freeze time if under the freeze heat
const.DefaultDefrostTime = 4 * const.HourDuration  -- Defrost time if above the freeze heat
const.DustStormSuspendBuildings = {"MOXIE", "MoistureVaporator", "ShuttleHub"}
const.DustStormSuspendReason = "SuspendedDustStorm"

-- color tags
const.TagLookupTable["red"]     = "<color  255 65 79><shadowcolor 1 60 40>"
const.TagLookupTable["/red"]    = "</shadowcolor></color>"
const.TagLookupTable["green"]   = "<color  24 185 115>"
const.TagLookupTable["/green"]  = "</color>"
const.TagLookupTable["yellow"]     = "<color  244 228 117>"
const.TagLookupTable["/yellow"]    = "</color>"
const.TagLookupTable["white"]     = "<color  248 242 230>"
const.TagLookupTable["/white"]    = "</color>"
const.TagLookupTable["grey"]     = "<color flavor>"
const.TagLookupTable["/grey"]    = "</color>"
const.TagLookupTable["em"]     = "<color em>"
const.TagLookupTable["/em"]    = "</color>"
const.TagLookupTable["graph_left"] = "<color 24 185 115>"
const.TagLookupTable["/graph_left"] = "</color>"
const.TagLookupTable["graph_right"] = "<color 113 186 223>"
const.TagLookupTable["/graph_right"] = "</color>"

const.TagLookupTable["condition_text"]   = ""
const.TagLookupTable["/condition_text"]  = ""
const.TagLookupTable["outcome_text"]   = "<color 233 242 255>"
const.TagLookupTable["/outcome_text"]  = "</color>"
const.TagLookupTable["disabled_text"]   = "<color 196 196 196>"
const.TagLookupTable["/disabled_text"]  = "</color>"
const.TagLookupTable["white_shadow"]   = "<shadowcolor 233 242 255>"
const.TagLookupTable["/white_shadow"]  = "</shadowcolor>"

const.TagLookupTable["icon_Concrete"]     = "<image UI/Icons/res_concrete.tga 1300>"
const.TagLookupTable["icon_Metals"]       = "<image UI/Icons/res_metal.tga 1300>"
const.TagLookupTable["icon_Polymers"]     = "<image UI/Icons/res_polymers.tga 1300>"
const.TagLookupTable["icon_WasteRock"]    = "<image UI/Icons/res_waste_rock.tga 1300>"
const.TagLookupTable["icon_BlackCube"]    = "<image UI/Icons/res_black_box.tga 1300>"
const.TagLookupTable["icon_Electronics"]    = "<image UI/Icons/res_electronics.tga 1300>"
const.TagLookupTable["icon_MachineParts"]    = "<image UI/Icons/res_machine_parts.tga 1300>"
const.TagLookupTable["icon_PreciousMetals"]    = "<image UI/Icons/res_precious_metals.tga 1300>"
const.TagLookupTable["icon_Fuel"]    		= "<image UI/Icons/res_fuel.tga 1300>"
const.TagLookupTable["icon_Food"]         = "<image UI/Icons/res_food.tga 1300>"
const.TagLookupTable["icon_Power"]        = "<image UI/Icons/res_electricity.tga 1300>"
const.TagLookupTable["icon_Air"]          = "<image UI/Icons/res_oxygen.tga 1300>"
const.TagLookupTable["icon_Water"]        = "<image UI/Icons/res_water.tga 1300>"
const.TagLookupTable["icon_Drone"]        = "<image UI/Icons/res_drone.tga 1300>"
const.TagLookupTable["icon_Shuttle"]      = "<image UI/Icons/res_shuttle.tga 1300>"
const.TagLookupTable["icon_Colonist"]     = "<image UI/Icons/res_colonist.tga 1300>"
const.TagLookupTable["icon_Home"]         = "<image UI/Icons/res_home.tga 1300>"
const.TagLookupTable["icon_Homeless"]     = "<image UI/Icons/res_homeless.tga 1300>"
const.TagLookupTable["icon_Work"]         = "<image UI/Icons/res_work.tga 1300>"
const.TagLookupTable["icon_Unemployed"]   = "<image UI/Icons/res_unemployed.tga 1300>"
const.TagLookupTable["icon_Research"]     = "<image UI/Icons/res_experimental_research.tga 1300>"
const.TagLookupTable["icon_MetalsDeep"]   = "<image UI/Icons/res_metal_undergrounds.tga 1300>"
const.TagLookupTable["icon_MysteryResource"]= "<image UI/Icons/res_mystery_resource.tga 1300>"

const.TagLookupTable["icon_Concrete_orig"]        = "<image UI/Icons/res_concrete.tga>"
const.TagLookupTable["icon_Metals_orig"]          = "<image UI/Icons/res_metal.tga>"
const.TagLookupTable["icon_Polymers_orig"]        = "<image UI/Icons/res_polymers.tga>"
const.TagLookupTable["icon_WasteRock_orig"]       = "<image UI/Icons/res_waste_rock.tga>"
const.TagLookupTable["icon_BlackCube_orig"]       = "<image UI/Icons/res_black_box.tga>"
const.TagLookupTable["icon_Electronics_orig"]     = "<image UI/Icons/res_electronics.tga>"
const.TagLookupTable["icon_MachineParts_orig"]    = "<image UI/Icons/res_machine_parts.tga>"
const.TagLookupTable["icon_PreciousMetals_orig"]  = "<image UI/Icons/res_precious_metals.tga>"
const.TagLookupTable["icon_Fuel_orig"]            = "<image UI/Icons/res_fuel.tga>"
const.TagLookupTable["icon_Food_orig"]            = "<image UI/Icons/res_food.tga>"
const.TagLookupTable["icon_Power_orig"]           = "<image UI/Icons/res_electricity.tga>"
const.TagLookupTable["icon_Air_orig"]             = "<image UI/Icons/res_oxygen.tga>"
const.TagLookupTable["icon_Water_orig"]           = "<image UI/Icons/res_water.tga>"
const.TagLookupTable["icon_Drone_orig"]           = "<image UI/Icons/res_drone.tga>"
const.TagLookupTable["icon_Shuttle_orig"]         = "<image UI/Icons/res_shuttle.tga>"
const.TagLookupTable["icon_Colonist_orig"]        = "<image UI/Icons/res_colonist.tga>"
const.TagLookupTable["icon_Home_orig"]            = "<image UI/Icons/res_home.tga>"
const.TagLookupTable["icon_Homeless_orig"]        = "<image UI/Icons/res_homeless.tga>"
const.TagLookupTable["icon_Work_orig"]            = "<image UI/Icons/res_work.tga>"
const.TagLookupTable["icon_Unemployed_orig"]      = "<image UI/Icons/res_unemployed.tga>"
const.TagLookupTable["icon_Research_orig"]        = "<image UI/Icons/res_experimental_research.tga>"
const.TagLookupTable["icon_MetalsDeep_orig"]      = "<image UI/Icons/res_metal_undergrounds.tga>"
const.TagLookupTable["icon_MysteryResource_orig"] = "<image UI/Icons/res_mystery_resource.tga>"

const.TagLookupTable["icon_Food_small"]       = "<image UI/Icons/res_food.tga 800>"
const.TagLookupTable["icon_Power_small"]      = "<image UI/Icons/res_electricity.tga 800>"
const.TagLookupTable["icon_Concrete_small"]   = "<image UI/Icons/res_concrete.tga 800>"
const.TagLookupTable["icon_Metals_small"]     = "<image UI/Icons/res_metal.tga 800>"
const.TagLookupTable["icon_Polymers_small"]   = "<image UI/Icons/res_polymers.tga 800>"
const.TagLookupTable["icon_WasteRock_small"]  = "<image UI/Icons/res_waste_rock.tga 800>"
const.TagLookupTable["icon_BlackCube_small"]  = "<image UI/Icons/res_black_box.tga 800>"
const.TagLookupTable["icon_Electronics_small"]     = "<image UI/Icons/res_electronics.tga 800>"
const.TagLookupTable["icon_MachineParts_small"]    = "<image UI/Icons/res_machine_parts.tga 800>"
const.TagLookupTable["icon_PreciousMetals_small"]  = "<image UI/Icons/res_precious_metals.tga 800>"
const.TagLookupTable["icon_Fuel_small"]    = "<image UI/Icons/res_fuel.tga 800>"
const.TagLookupTable["icon_Drone_small"]      = "<image UI/Icons/res_drone.tga 800>"
const.TagLookupTable["icon_Colonist_small"]   = "<image UI/Icons/res_colonist.tga 800>"
const.TagLookupTable["icon_Home_small"]             = "<image UI/Icons/res_home.tga 800>"
const.TagLookupTable["icon_Homeless_small"]         = "<image UI/Icons/res_homeless.tga 800>"
const.TagLookupTable["icon_Work_small"]             = "<image UI/Icons/res_work.tga 800>"
const.TagLookupTable["icon_Unemployed_small"]       = "<image UI/Icons/res_unemployed.tga 800>"
const.TagLookupTable["icon_MysteryResource_small"]= "<image UI/Icons/res_mystery_resource.tga 800>"

const.TagLookupTable["lock_icon"] = "<image UI/Common/padlock.tga 540>"
const.TagLookupTable["left_click"] = "<image UI/Infopanel/left_click.tga 1400>"
const.TagLookupTable["right_click"] = "<image UI/Infopanel/right_click.tga 1400>"
const.TagLookupTable["middle_click"] = "<image UI/Infopanel/middle_click.tga 1400>"
const.TagLookupTable["mouse_button_4"] = "<image UI/Infopanel/button_4.tga 1400>"
const.TagLookupTable["mouse_button_5"] = "<image UI/Infopanel/button_5.tga 1400>"
const.TagLookupTable["mouse_wheel_up"] = "<image UI/Infopanel/scroll_up.tga 1400>"
const.TagLookupTable["mouse_wheel_down"] = "<image UI/Infopanel/scroll_down.tga 1400>"
const.TagLookupTable["icon_no_maintenance"] = ""

const.TagLookupTable["effect"] = T{7697, "<em>Effect:</em> "}
const.TagLookupTable["hint"] = T{4774, "<em>Hint:</em> "}
const.TagLookupTable["goal"] = T{4773, "<em>Goal:</em> "}

const.HyperlinkColors["InfopanelSelect"] = RGB(186, 131, 249)
const.HyperlinkColors["Rename"] = RGB(255, 255, 255)

--force exit impassible with str8 line before pathing. enabled here so its mars only.
Movable.pfflags = Movable.pfflags + const.pfmImpassableSource

-------------Colonists--------------------

const.DefaultWorkshifts =   {{6,14}, {14, 22}, {22,6}}
const.DefaultWorkshiftDurations = { 
	const.DefaultWorkshifts[1][2]-const.DefaultWorkshifts[1][1], 
	const.DefaultWorkshifts[2][2]-const.DefaultWorkshifts[2][1], 
	const.HoursPerDay + const.DefaultWorkshifts[3][2]-const.DefaultWorkshifts[3][1] }

const.ColonistAgeGroups = {
	["Child"] 		= {min =  0, next_agegroup = "Youth", display_name = T{4775, "Child"},      description = T{4776, "Too young to work but can study at a School"}},
	["Youth"] 		= {min =  6, next_agegroup = "Adult", display_name = T{4777, "Youth"},      description = T{4778, "Too young to work but can be trained to become a specialist at an University."}}, 
	["Adult"] 		= {min = 11, next_agegroup = "Middle Aged", display_name = T{4779, "Adult"}, description = T{4780, "An adult Colonist"}}, 
	["Middle Aged"] = {min = 31, next_agegroup = "Senior", display_name = T{4781, "Middle Aged"},description = T{4782, "A middle aged Colonist approaching retirement"}}, 
	["Senior"] 		= {min = 61, next_agegroup = false, display_name = T{4783, "Senior"},        description = T{4784, "A senior Colonist retired from active duty"}},
}

const.ColonistAges = {
	"Child", "Youth", "Adult", "Middle Aged", "Senior",
}

const.ApplicantsWeights = {
	{"Child",  0},
	{"Youth", 15},
	{"Adult", 60},
	{"Middle Aged", 20},
	{"Senior",5},
}
----------------------Mission profile consts-------------
const.StartFunding = 4000
const.StartCargoCapacity = 35000
const.MissionSponsorPriceModifiers = 5
const.MissionSponsorLockModifiers = 3
const.MissionSponsorNations = 8

FarmPerformanceEffects = 
{
	["-workforce"]	= T{4785, "<red>Low Building performance</red>"},
	["-soil"]			= T{4786, "<red>Low Soil quality</red>"},
	["+soil"]			= T{4787, "<green>High Soil quality</green>"},
	["-power"]		= T{4788, "<red>Power shortage</red>"},
	["-water"]		= T{4789, "<red>Water shortage</red>"},
	["-workers"]    = T{4790, "<red>No workers</red>"},
}

DeathReasons = 
{
	["meteor"]              = T{4791, "Meteor Impact"},
	["lighting strike"]     = T{7879, "Struck by lighting"},
	["fuel explosion"]      = T{7880, "Fuel explosion"},
	["low health"]          = T{4792, "Low Health"},
	["Old age"]             = T{4793, "Old Age"},
	["could not reach dome"]= T{4794, "Spacesuit out of Oxygen"},
	["could not find dome"] = T{4794, "Spacesuit out of Oxygen"},
	["suicide"]             = T{4795, "Suicide (Low Sanity)"},
	["rogue drone"]         = T{4796, "Killed by a rogue machine"},
	
	["StatusEffect_Suffocating"]         = T{4797, "Suffocating"},
	["StatusEffect_Suffocating_Outside"] = T{4797, "Suffocating"},
	
	["StatusEffect_Dehydrated"] = T{4798, "Dehydrated"},
	["StatusEffect_Freezing"]   = T{3875, "Freezing"},
	["StatusEffect_Starving"]   = T{3877, "Starving"},
	
	["StoryBit"]     = T{10995, "Extenuating circumstances"},
	["DustSickness"] = T{924901666901, "Dust Sickness"},
}

NaturalDeathReasons = 
{
	["Old age"] = true,
}
ColonistPerformanceReasons = 
{
	["Morale"] = T{7590, "Morale <amount>"},
	["Enthusiast"] = T{7591, "Brimming with enthusiasm <amount> (Enthusiast)"},
	["Melancholic"] = T{7592, "Severely depressed <amount> (Melancholic)"},
	["Lazy"] = T{7593, "Procrastinating at work <amount> (Lazy)"},
	["Workaholic"] = T{7594, "Working hard <amount> (Workaholic)"},
	["Alcoholic"] = T{7595, "Hangover <amount> (Alcoholic)"},
	["Renegade"] = T{7596, "Disillusioned <amount> (Renegade)"},
	["VocationOrientedSociety"] = T{7597, "Vocation oriented society <amount>"},
	["Refugee"] = T{8544, "Refugee performance penalty <amount> (Refugee)"}
}
--------------------------------------------------------------------------------------------------------------------
-- RANDOM MAP
--------------------------------------------------------------------------------------------------------------------
const.PrefabWorkRatio = 8 -- defines the precision reduction for processing acceleration
const.PrefabMaxPlayAngle = 3*60 -- defines the maximum terrain denivelation which is considered "playable"
const.PrefabMinPlayRadius = 40*guim -- defines the minimum radius inside a zone to be considered "playable"
const.PrefabInvalidTerrain = "Prefab_Yellow" -- default prefab invalid terrain texture
const.PrefabMinObjRadius = 6 * guim -- controls the maximum allowed object density in the prefabs
const.PrefabRasterParallelDiv = 8 -- controls the number of map quadrants for parallel prefab rasterization
-- number of characteristics spawned in a feature zone according to its radius
const.PrefabFeatureDensity = {
	{ radius = 0,        count = 1 },
	{ radius = 50*guim,  count = 2 },
	{ radius = 150*guim, count = 3 },
}
-- maximum memory allowed for caching grids during the raster phase
if Platform.desktop then
	const.PrefabRasterCacheMemory = 128 * 1024 * 1024
else
	const.PrefabRasterCacheMemory = 64 * 1024 * 1024 
end
const.PrefabVersionOverride = false
--------------------------------------------------------------------------------------------------------------------

const.ConstructiongGridElementsGroupSize = 5
const.SignsOverviewCameraScaleUp = 550
const.SignsOverviewCameraScaleDown = 100
const.ElevatorRopesOverviewCameraScaleUp = 350
const.ElevatorRopesOverviewCameraScaleDown = 100

hr.CameraRTSPanSpeedZoomModifier = 0

const.MirrorSphere_MinBuildingDist = 30 * guim
const.MirrorSphere_MaxSpheres = 16
const.MirrorSphere_EffectRange = 100*guim
const.MirrorSphere_EffectFallout = 30*guim
const.MirrorSphere_MinMoveDelay = 10 * const.HourDuration
const.MirrorSphere_MaxMoveDelay = 20 * const.HourDuration
const.MirrorSphere_RechargeRateH = 5000 -- power drained from an accumulator per hour
const.MirrorSphere_PowerCapacity = 100000 -- total power drained needed to fully charge the sphere
const.MirrorSphere_PowerDrainInterval = 10 * const.MinuteDuration
const.MirrorSphere_SplitTime = 10000
const.MirrorSphere_SplitDist = 40*guim
const.MirrorSphere_PowerHumStates = {
	{ name = "hum_none", ratio = 0 },
	{ name = "hum_low", ratio = 40 },
	{ name = "hum_medium", ratio = 60 },
	{ name = "hum_high", ratio = 80 },
	{ name = "hum_extreme", ratio = 100 },
}
const.MirrorSphere_IrradiateDamageH = 5 -- percents per hour
const.MirrorSphere_ActionMinTime = 10 * const.HourDuration
const.MirrorSphere_ActionMaxTime = 20 * const.HourDuration
const.MirrorSphere_ActionMinProgress = 34
const.MirrorSphere_ActionMaxProgress = 40
const.MirrorSphere_ResonancePtsPerDay = 1 -- resonance pts per day obtained from a single sphere
const.MirrorSphere_ResonancePtsMax = 100 -- max total resonance pts needed to reach resonance
const.MirrorSphere_ResonanceAccumSpheresStart = 3 -- min number of spheres before starting to accumulate resonance points
const.MirrorSphere_ResonanceAccumSpheresSustain = 2 -- min number of spheres to accumulate resonance points once started
const.MirrorSphere_HatchPctDay = 5 -- auto progress (%) per day to hatch
const.MirrorSphere_SplitPctDay = 1 -- auto progress (%) per day charge up
const.MirrorSphere_TurnToDepositTime = 20 * const.HourDuration
const.MirrorSphere_IceStrength = 60
const.MirrorSphere_TargetBuildingChance = 50
const.MirrorSphere_PrefabName = "Any.Gameplay.Mistery.MirrorSphere"
const.MirrorSphere_ExcavationRadius = 30*guim
const.MirrorSphere_ExcavationDepth = 20*guim

const.SchoolTraits =  { --see 'g_SchoolTraits'
	"Nerd",
	"Composed",
	"Enthusiast",
	"Religious",
	"Survivor",
}

const.SchoolExtraTraits =  {
	"Workaholic",
	"Hippie",
}

const.SanatoriumTraits =  { --see 'g_SanatoriumTraits'
	"Alcoholic",
	"Gambler",
	"Glutton",
	"Lazy",
	"ChronicCondition",
	"Melancholic",
	"Coward",
}

const.SanityBreakdownTraits = {
	"Gambler",
	"Alcoholic",
	"Glutton",
	"Coward",
	"Melancholic",
}

AddConstGroupAsModifiableProperties(Consts, "Gameplay")
AddConstGroupAsModifiableProperties(Consts, "Research")
AddConstGroupAsModifiableProperties(Consts, "Rover")
AddConstGroupAsModifiableProperties(Consts, "Drone")
AddConstGroupAsModifiableProperties(Consts, "Workplace")
AddConstGroupAsModifiableProperties(Consts, "Buildings")
AddConstGroupAsModifiableProperties(Consts, "Cost")
AddConstGroupAsModifiableProperties(Consts, "Colonist")
AddConstGroupAsModifiableProperties(Consts, "Traits")
AddConstGroupAsModifiableProperties(Consts, "Stat")

function OnMsg.GatherLabels(labels)
	labels.Consts = true
end
