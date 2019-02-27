GlobalVar("MarsScreenLandingSpots", false)
GlobalVar("SortedMarsScreenLandingSpots", false)
GlobalVar("MarsScreenMapParams", false)

local function _SortMarsPointsOfInterest()
	local rivals = {}
	local anomalies = {}
	for _, poi in ipairs(MarsScreenLandingSpots) do
		if poi.spot_type == "rival" then
			rivals[#rivals + 1] = poi
		elseif poi.spot_type == "anomaly" then
			anomalies[#anomalies + 1] = poi
		end
	end
	TSort(rivals, "display_name")
	TSort(anomalies, "display_name")
	SortedMarsScreenLandingSpots = {}
	if MarsScreenLandingSpots.OurColony then
		SortedMarsScreenLandingSpots[1] = MarsScreenLandingSpots.OurColony
	end
	table.append(SortedMarsScreenLandingSpots, rivals)
	table.append(SortedMarsScreenLandingSpots, anomalies)
end

local function SortMarsPointsOfInterest()
	DelayedCall(0, _SortMarsPointsOfInterest)
end

function OpenPlanetaryView(context)
	return OpenDialog("PlanetaryView", GetInGameInterface(), context)
end

function GetSortedMarsPointsOfInterest()
	if not SortedMarsScreenLandingSpots then
		SortMarsPointsOfInterest()
	end
	return SortedMarsScreenLandingSpots
end

local function InsertMarsLandingSpot(spot)
	MarsScreenLandingSpots[#MarsScreenLandingSpots + 1] = spot
	if spot.id then
		MarsScreenLandingSpots[spot.id] = spot
	end
	SortMarsPointsOfInterest()
end

local function RemoveMarsLandingSpot(spot)
	local idx = table.find(MarsScreenLandingSpots, spot)
	if idx then
		table.remove(MarsScreenLandingSpots, idx)
	end
	MarsScreenLandingSpots[spot.id] = nil
	SortMarsPointsOfInterest()
end

DefineClass.MarsScreenPointOfInterest = {
	__parents = {"InitDone"},
	id = false,
	spot_type = false,
	longitude = false,
	latitude = false,
	display_name = false,
	description = false,
}

function MarsScreenPointOfInterest:Init()
	InsertMarsLandingSpot(self)
end

function MarsScreenPointOfInterest:Done()
	RemoveMarsLandingSpot(self)
end

DefineClass.MarsScreenOurColony = {
	__parents = {"MarsScreenPointOfInterest"},
	spot_type = "our_colony",
}

local function GetLongDist(long1, long2)
	return abs(((abs(long1 - long2) + 180) % 360) - 180)
end

local function IsTooCloseToLandingSpot(lat, long, spot)
	local long_dist = GetLongDist(long, spot.longitude)
	local lat_dist = abs(lat - spot.latitude)
	local snap_range = Max(Max(abs(lat), abs(spot.latitude)) / 15, 1) * 8
	return long_dist <= snap_range and lat_dist <= snap_range
end

local function IsTooCloseToSpots(lat, long, spots)
	for _, spot in ipairs(spots or empty_table) do
		if IsTooCloseToLandingSpot(lat, long, spot) then
			return true
		end
	end
end

function GenerateMarsScreenPoI(point_type)
	local lat, long
	local min_lat, max_lat = -45 * 60, 45 * 60
	local max_long_dist = 180
	local same_side_max_dist = 65
	
	local our_colony = table.find_value(MarsScreenLandingSpots, "id", "OurColony")
	if point_type == "anomaly" then
		--2/3 of the anomalies should be on the same side as our colony
		local front_count = 0
		local back_count = 0
		for i, spot in ipairs(MarsScreenLandingSpots) do
			if spot.spot_type == "anomaly" then
				local front = GetLongDist(spot.longitude, our_colony.longitude) <= same_side_max_dist
				front_count = front_count + (front and 1 or 0)
				back_count = back_count + (not front and 1 or 0)
			end
		end
		local total = front_count + back_count
		if total <= 0 or (3 * front_count) < (2 * total) then
			max_long_dist = same_side_max_dist
		end
	else
		--constrain them to be on the same side of the planet as our colony
		max_long_dist = same_side_max_dist
	end
	local count = 0
	while true do
		lat, long = GenerateRandomLandingLocation()
		if GetLongDist(long / 60, our_colony.longitude) <= max_long_dist
			and lat >= min_lat and lat <= max_lat
			and not IsTooCloseToSpots(lat / 60, long / 60, MarsScreenLandingSpots) then
			break
		end
		if count >= 100 then break end -- don't run infinitely
		count = count + 1
	end
	return lat / 60, long / 60
end

function InitMarsScreenData()
	if not MarsScreenLandingSpots then
		MarsScreenMapParams = table.copy(g_CurrentMapParams)
		MarsScreenMapParams.latitude = MarsScreenMapParams.latitude or 0
		MarsScreenMapParams.longitude = MarsScreenMapParams.longitude or 0
		MarsScreenLandingSpots = {}
		--generate points of interest on Mars
		MarsScreenOurColony:new{
			id = "OurColony",
			latitude = MarsScreenMapParams.latitude,
			longitude = MarsScreenMapParams.longitude,
			display_name = T(11037, "Our Colony"),
		}
		Msg("OurColonyPlaced")
	end
end

function OnMsg.CityStart()
	InitMarsScreenData()
end

function PlanetaryExpeditionPossible(use_inorbit)
	for _, rocket in ipairs(UICity.labels.AllRockets) do
		if rocket.command == "Refuel" or rocket.command == "WaitLaunchOrder" or (use_inorbit and rocket.command == "WaitInOrbit") then
			return true
		end
	end
	return false
end

function PromptNoAvailableRockets()
	CreateRealTimeThread(function()
		if WaitMarsQuestion(nil, T(6882, "Warning"), T(11238, "There aren't any available Rockets to send on a Trade or Scientific Expedition. You will need a Rocket landed on Mars to perform this action."), T(11239, "Go to Resupply View to request a Rocket from Earth (you will still have to setup the Expedition later)"), T(3687, "Cancel")) == "ok" then
			CloseDialog("PlanetaryView")
			OpenDialog("Resupply")
		end
	end)
end

function GetRocketExpeditionStatus(rocket)
	if rocket.status == "mission" then
		return T(11228, "Flying to a Planetary Anomaly")
	elseif rocket.status == "mission return" then
		return T(11229, "Returning from a Planetary Anomaly")
	elseif rocket.status == "task" then
		return T(11589, "Flying to a Rival Colony")
	elseif rocket.status == "task return" then
		return T(11590, "Returning from a Rival Colony")
	elseif rocket.command == "WaitLaunchOrder" then
		return T(11240, "Ready")
	elseif rocket.command == "Refuel" then
		return T(11241, "Refueling")
	elseif rocket.command == "OnEarth" then
		return T(11242, "On Earth")
	elseif rocket.command == "ExpeditionRefuelAndLoad" or rocket.command == "ExpeditionPrepare" then
		return T(11677, "Preparing for expedition")
	elseif rocket.command == "WaitInOrbit" then
		return T(11243, "In orbit")
	elseif rocket.command == "LandOnMars" then
		return T(282, "Landing")
	elseif rocket.command == "Unload" then
		return T(761527590297, "Unloading")
	elseif rocket.command == "Countdown" or rocket.command == "Takeoff" then
		return T(11244, "Taking off")
	elseif rocket:IsLaunchAutomated() and rocket:HasCargoSpaceLeft() then
		return T(11039, "Loading cargo")
	end
	return T(709, "In transit")
end

function SendRocketToMarsPoint(obj, spot, dialog)
	if spot.spot_type == "anomaly" then
		local rocket = PlaceBuilding("RocketExpedition", {city = UICity})
		rocket:SetCommand("BeginExpedition", obj, spot)
		spot.rocket = rocket
		dialog:Close()
		CreateRealTimeThread(function()
			WaitMsg("PlanetCameraSet")
			ViewAndSelectObject(IsValid(obj) and obj or rocket)
		end)
	end
end

function ClearExpeditionRocketSpot(rocket, spot)
	rocket:ExpeditionCancel()
	ObjModified(rocket)
	if rocket.expedition and rocket.expedition.anomaly then
		rocket.expedition.anomaly.rocket = nil
	end
	if rocket.expedition and rocket.expedition.project then
		local spot = rocket.expedition.project
		spot.rocket = nil
		-- restore funding
		local funding = spot.funding
		if funding and funding>0 then
			rocket.city:ChangeFunding(funding, "special project")
		end
	end
	if spot and spot.rocket then
		spot.rocket = nil
	end
end	

function CancelExpedition(rocket, dialog, spot)
	CreateRealTimeThread(function()
		local params = {
			title = T(311734996852, "Cancel Expedition"),
			text = T(11245, "Are you sure you want to cancel this expedition?"), 
			choice1 = T(1138, "Yes"),
			choice2 = T(1139, "No"),
			start_minimized = false,
		}
		local res = WaitPopupNotification(false, params, false, dialog)
		if res == 1 then
			ClearExpeditionRocketSpot(rocket,spot)
			if dialog then
				local context = ResolvePropObj(dialog.context)
				if context then ObjModified(context) end
				dialog:UpdateActionViews(dialog.idActionBar)
			end
		end
	end)
end

function ClearContestNotifications()
end