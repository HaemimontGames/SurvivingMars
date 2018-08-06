if FirstLoad then
	g_SelectedSpotChallengeMods = false
end

local PlanetCameras = 
{
	["PlanetMars"] = { point(130, 3598, 30035), point(225, 3107, 30031) },
	["PlanetEarth"] = { point(315, 2434, 30374), point(463, 1960, 30313) },
	["PlanetEarthCloseup"] = { point(571, 1545, 30400),point(683, 1060, 30353) },
}
local planet_mars_longitude_offset = -90 * 60
local planet_mars_rotation_speed = 50
local planet_earth_rotation_speed = 300
local planet_earth_close_rotation_speed = 700
local spot_snap_range = 4

GlobalVar("PlanetScene", false)
GlobalVar("PlanetCamera", false)
GlobalVar("PlanetThread", false)
GlobalVar("PlanetStack", false)
GlobalVar("GalleryList", {})

function SetPlanetCamera(planet, state)
	state = state or "open"
	planet = planet or false
	if planet then
		PlanetStack = PlanetStack or {}
		table.remove_value(PlanetStack, planet)
		if state == "open" then
			table.insert(PlanetStack, planet)
		end
		planet = PlanetStack[#PlanetStack] or false
	end
	if not planet then
		PlanetStack = false
	end
	local old_planet = PlanetScene or false
	if planet == old_planet then
		return
	end
	PlanetScene = planet
	PlacePlanet(planet)
	return CreateRealTimeThread(function()
		if IsValidThread(CameraTransitionThread) then
			WaitMsg("CameraTransitionEnd")
		end
		while IsValidThread(PlanetThread) do
			WaitMsg(PlanetThread)
		end
		PlanetThread = CurrentThread()
		CancelRenderingSkipFrames(40)
		if old_planet then
			WaitNextFrame(1)
			table.restore(hr, "PlanetCamera")
			WaitNextFrame(2)
			RecreateRenderObjects()
			if PlanetCamera then
				SetCamera(unpack_params(PlanetCamera))
			end
			SetLightmodelOverride(1, false)
			SetPostProcPredicate("space_mist", false)
			WaitNextFrame(1)
		end
		if planet then
			PlanetCamera = { GetCamera() }
			WaitNextFrame(1)
			SetPostProcPredicate("space_mist", true)
			SetLightmodelOverride(1, planet)
			WaitNextFrame(2)
			table.change(hr, "PlanetCamera", { 
				RenderTerrain = 0,
				RenderBuildGrid = 0,
				RenderMirage = 0,
				RenderIce = 0,
				RenderPlanetView = 1,
				FarZ = 700000,
				NearZ = 100,
			})
			cameraMax.Activate(1)
			cameraMax.SetCamera(unpack_params(PlanetCameras[planet]))
			camera.SetAutoFovX(1, 0, 70*60, 16, 9, 140*60, 7, 1)
			WaitNextFrame(1)
			DestroyAllRenderObjs()
		end
		WaitNextFrame(2)
		ResumeRendering()
		if next(s_CameraLockReasons) == nil then
			engineUnlockCamera(1)
		end
		Msg(CurrentThread())
	end)
end

function WaitPlanetCamera(planet, state)
	local thread = SetPlanetCamera(planet, state)
	if thread then
		WaitMsg(thread)
	end
end

function ClosePlanetCamera(planet)
	SetPlanetCamera(planet, "close")
end

GlobalVar("PlanetObj", false)
GlobalVar("PlanetRotationObj", false)
GlobalVar("PlanetRocket", false)

function PlacePlanet(scene)
	if IsValid(PlanetObj) then
		DoneObject(PlanetObj)
	end
	if IsValid(PlanetRotationObj) then
		DoneObject(PlanetRotationObj)
	end
	PlayFX("Thrusters", "end", PlanetRocket)
	if IsValid(PlanetRocket) then
		DoneObject(PlanetRocket)
	end
	if not scene then
		return
	end
	local planets = {
		["PlanetMars"] = "PlanetMars",
		["PlanetEarth"] = "PlanetEarth",
		["PlanetEarthCloseup"] = "PlanetEarth",
	}
	local class = planets[scene]
	MapDelete("map","PlanetDummy", "Rocket")
	local rotation_obj = PlaceObject("PlanetDummy")
	local planet_obj = PlaceObject(class)
	local rocket_obj = false
	rotation_obj:SetPos(0, 0, 300*guim)
	if class == "PlanetMars" then
		rotation_obj:SetState("idle")
		rotation_obj:SetAnimSpeed(1, planet_mars_rotation_speed)
		rotation_obj:SetGameFlags(const.gofBoneTransform)
	elseif class == "PlanetEarth" then
		rotation_obj:SetState("idleSlow")
		rotation_obj:SetAxis(point(-1361, 1113, 3700))
		rotation_obj:SetAngle(5018)
		if scene == "PlanetEarthCloseup" then
			local rocket_class = GetRocketClass()
			local template = BuildingTemplates[rocket_class]
			local rocket_entity = GetMissionSponsor():GetDefaultRocketSkin() or template.entity or "Rocket"
			local clsdef = g_Classes[template.template_class]
			local palette = clsdef and EntityPalettes[clsdef.rocket_palette]
			assert(IsValidEntity(rocket_entity))
			rocket_obj = PlaceObject("Rocket")
			rocket_obj:ChangeEntity(rocket_entity)
			if palette then
				SetObjectPalette(rocket_obj, palette)
			end
			rocket_obj:SetState("inSpace")
			rocket_obj:SetScale(1)
			rocket_obj:SetGameFlags(const.gofAlwaysRenderable + const.gofRealTimeAnim)
			rocket_obj:SetAxis(point(-973, 1217, 3787))
			rocket_obj:SetAngle(2863)
			rocket_obj:SetPos(point(563, 1399, 30368))
			local light = PlaceObject("PointLight")
			light:SetAttenuationRadius(10938)
			light:SetIntensity(5)
			light:SetColor(RGB(200,203, 225))
			rocket_obj:Attach(light)
			light:SetAttachOffset(point(0,40000, 0))
			PlayFX("Thrusters", "start", rocket_obj)
			rotation_obj:SetAnimSpeed(1, planet_earth_close_rotation_speed)
		else
			rotation_obj:SetAnimSpeed(1, planet_earth_rotation_speed)
		end
	else
		assert(false, "Unknown planet class")
	end
	rotation_obj:SetGameFlags(const.gofAlwaysRenderable + const.gofRealTimeAnim)
	rotation_obj:Attach(planet_obj, rotation_obj:GetSpotBeginIndex("Planet"))
	planet_obj:SetHeat(255)
	PlanetObj = planet_obj
	PlanetRotationObj = rotation_obj
	PlanetRocket = rocket_obj
end

function PlanetGetClickCoords(click_pos)
	if not click_pos then 
		return false
	end
	local duration = GetAnimDuration(PlanetRotationObj:GetEntity(), EntityStates["idle"])
	local planet_angle = 360*60 - MulDivRound(PlanetRotationObj:GetAnimPhase(1), 360 * 60, duration)
	local planet_pos, planet_radius = PlanetObj:GetBSphere()
	local ok, lat_org, long_org = ScreenToPlanet(click_pos, planet_pos, planet_radius)
	if not ok then
		return false
	end
	-- planet_rot is 0..360, planet_offset is -90, 
	-- lat -> -70 .. +70 (dep on click and fov) as we rotate the planet
	local lat = lat_org
	local long = long_org
	long = planet_angle + planet_mars_longitude_offset + long
	if long < 0 then
		long = 360 *60 + long
	end	
	if long > 180*60 then
		long = long - 360 * 60
	end
	lat = lat - 90*60
	
	--restrict coordinates to full degrees
	lat = RoundCoordToFullDegrees(lat)
	long = RoundCoordToFullDegrees(long)
	
	lat = Clamp(lat, -70*60, 70*60)
	
	-- longitude is -180*60..180*60 W/E
	-- latitude  is -90*60..90*60 N/S
	return lat, long, lat_org, long_org
end

function RoundCoordToFullDegrees(coord)
	local remainder = coord % 60
	remainder = remainder >= 30 and remainder - 60 or remainder
	return coord - remainder
end

function PlanetFormatStringCoords(lat, long, spot_name, spot_color, hint, challenge)
	local lat_dir = lat > 0 and T{6886, "S"} or T{6887, "N"}
	local long_dir = long > 0 and T{6888, "E"} or T{6889, "W"}
	local latd = 1 + 70 + lat / 60
	local longd = 1 + 180 + long / 60
	lat = abs(lat)
	long = abs(long)
	spot_name = spot_name or T{1103, "Colony Site"}
	local color = spot_color or Untranslated("<color 203 120 30>")
	local name = T{4128, "<clr><font PGLandingPosName><name></font></color><newline>", clr = color,  name = spot_name}
	
	if Platform.developer and DbgPlanetStats then
		local stat = tostring(DbgPlanetStats[latd][longd])
		local color = DbgPlanetColors[latd][longd]
		if stat and color then
			local r, g, b = GetRGB(color)
			name = name .. Untranslated(string.format("Statistic <color %d %d %d>%s</color><newline>", r, g, b, stat))
		end
	end
	
	if challenge then
		local record = type(challenge) == "table" and AccountStorage.CompletedChallenges and AccountStorage.CompletedChallenges[challenge.id]
		if type(record) == "table" then
			if record.time <= challenge.time_perfected then
				return T{10412, "<pos_name>Perfected on Sol <sol>\nScore <score>", pos_name = name, sol = 1 + record.time / const.DayDuration, score = record.score}
			else
				return T{10413, "<pos_name>Completed on Sol <sol>\nScore <score>", pos_name = name, sol = 1 + record.time / const.DayDuration, score = record.score}
			end
		end
		return name
	end
	if hint and GetUIStyleGamepad() then
		return T{4129, "<pos_name><lat>°<lat_dir> <long>°<long_dir><newline><font PreGamePlanetCoordinatesHint><control_img> Move spot</font>", pos_name = name, lat = lat / 60, lat_dir = lat_dir, long = long / 60, long_dir = long_dir, control_img = TLookupTag("<LS>")}
	elseif hint then
		return T{4130, "<pos_name><lat>°<lat_dir> <long>°<long_dir><newline><font PreGamePlanetCoordinatesHint><left_click> Move spot<newline><right_click> Rotate</font>", pos_name = name, lat = lat / 60, lat_dir = lat_dir, long = long / 60, long_dir = long_dir}
	else
		return T{4131, "<pos_name><lat>°<lat_dir> <long>°<long_dir>", pos_name = name, lat = lat / 60, lat_dir = lat_dir, long = long / 60, long_dir = long_dir}
	end
end

function PlanetFormatCoordsToPrompt(lat, long)
	local lat_dir = lat > 0 and "S" or "N"
	local long_dir = long > 0 and "E" or "W"
	lat = abs(lat)
	long = abs(long)
	return string.format("%s%s%s%s", lat / 60, lat_dir, long / 60, long_dir)
end

--------------------------------------------------------------------------------------------------------------------------------------------
DefineClass.LandingSpot = {
	__parents = { "Preset" },
	properties = {
		{ id = "latitude", name = T{6890, "Latitude"}, editor = "number", default = 0, help = T{6891, "-70 to 70"}, },
		{ id = "longitude", name = T{6892, "Longitude"}, editor = "number", default = 0, help = T{6893, "-180 to 180"}, },
		{ id = "display_name", name = T{1153, "Display Name"}, editor = "text", default = "", translate = true, },
		{ id = "quickstart", name = T{6894, "Quickstart"}, editor = "bool", default = false, },
	},
	PropertyTranslation = true,
	EditorMenubarName = "Landing Spots",
	EditorMenubar = "Editors.Game",
}

local function MapChallengeRatingToDifficulty(rating)
	if rating <= 59 then
		return T{4154, "Relatively Flat"}
	elseif rating <= 99 then
		return T{4155, "Rough"}
	elseif rating <= 139 then
		return T{4156, "Steep"}
	else
		return T{4157, "Mountainous"}
	end
end

DefineClass.LandingSiteObject = {
	__parents = { "PropertyObject" },
	properties = {
		{id = "TerrainType",    name = T{4134, "Terrain"},    grid_filename = "UI/Data/Overlays/MarsTerrainType.jpg", editor = "landing_param", default = 0},
		{id = "Altitude",       name = T{4135, "Altitude"},        grid_filename = "UI/Data/Overlays/MarsTopography.jpg", editor = "landing_param", default = 0},
		{id = "Metals",         name = T{3514, "Metals"},          grid_filename = "UI/Data/Overlays/MarsIron.jpg",        category = "Resources", resource = true, editor = "landing_param", default = 0, challenge_mod = {15, 10, 5, 0}, rollover = {title = T{3514, "Metals"},          descr = T{4136, "Metals and Rare metals. Metals are important for field buildings while Rare Metals are exported to Earth and used in the production of Electronics."}} },
		{id = "Concrete",       name = T{3513, "Concrete"},        grid_filename = "UI/Data/Overlays/MarsRegolith.jpg",    category = "Resources", resource = true, editor = "landing_param", default = 0, challenge_mod = {15, 10, 5, 0}, rollover = {title = T{3513, "Concrete"},        descr = T{4137, "Concrete is used in the construction of many Colony buildings, especially in the interior of the Domes"}} },
		{id = "Water",          name = T{681, "Water"},           grid_filename = "UI/Data/Overlays/MarsWater.jpg",       category = "Resources", resource = true, editor = "landing_param", default = 0, challenge_mod = {15, 10, 5, 0}, rollover = {title = T{681, "Water"},           descr = T{4138, "Most vital resource for sustaining humans on Mars. Water can be extracted from deposits using prefab Moisture Vaporators transported from Earth"}} },
		{id = "PreciousMetals", name = T{4139, "Rare Metals"},     grid_filename = "UI/Data/Overlays/MarsIron.jpg",									resource = true, editor = "landing_param", default = 0, challenge_mod = {15, 10, 5, 0}, rollover = {title = T{4139, "Rare Metals"}, descr = T{4140, "Rare Metals can be exported by refueled Rockets that return to Earth, increasing the Funding for the Colony. They are also used for creating Electronics"}} },
		{id = "Temperature",    name = T{4141, "Temperature"},     grid_filename = "UI/Data/Overlays/MarsTemperature.jpg", editor = "landing_param", default = 0},
		{id = "DustDevils",     name = T{4142, "Dust Devils"},     grid_filename = "UI/Data/Overlays/MarsTopography.jpg",  category = "Threats", threat = true, editor = "landing_param", default = 0,   challenge_mod = {[-1] = 0, 0, 5, 10, 15, 0}, rollover = {title = T{4142, "Dust Devils"},     descr = T{4143, "Dust Devils contaminate buildings in their area with Martian Sand. Contaminated buildings require maintenance and may malfunction. Dust devils contaminate nearby buildings quickly, but disappear relatively fast."}} },
		{id = "DustStorm",      name = T{4144, "Dust Storms"},     grid_filename = "UI/Data/Overlays/MarsDust.jpg",        category = "Threats", threat = true, editor = "landing_param", default = 0,   challenge_mod = {[-1] = 0, 0, 10, 20, 30, 0}, rollover = {title = T{4144, "Dust Storms"},     descr = T{4145, "Dust Storms contaminate all field buildings with dust and can last several Sols. Colonies in areas with intense Dust Storms will require shorter maintenance cycles. MOXIEs and Moisture Vaporators are not operational during Dust Storms."}} },
		{id = "Meteor",         name = T{4146, "Meteors"},         grid_filename = "UI/Data/Overlays/MarsMeteors.jpg",     category = "Threats", threat = true, editor = "landing_param", default = 0,   challenge_mod = {[-1] = 0, 0, 10, 20, 30, 0}, rollover = {title = T{4146, "Meteors"},         descr = T{4147, "Meteors can destroy or damage structures, colonists and vehicles in their impact area. Some meteors are composed of useful resources like Metal or Polymers."}} },
		{id = "ColdWave",       name = T{4148, "Cold Waves"},      grid_filename = "UI/Data/Overlays/MarsTemperature.jpg", category = "Threats", threat = true, editor = "landing_param", default = 0,   challenge_mod = {[-1] = 0, 0, 10, 20, 30, 0}, rollover = {title = T{4149, "Cold Wave"},       descr = T{4150, "Cold Waves last several Sols, increasing the power consumption of vehicles, Drones and many field buildings. Water Towers are frozen during Cold Waves."}} },
		{id = "Locales",        name = T{4151, "Mars Locales"},    grid_filename = "UI/Data/Overlays/MarsLocales.jpg", editor = "landing_param", default = 0},
	},
	dialog = false,
	anim_duration = false,
	rotation_dir = false,
	overlay_grids = false,
	long = false,	-- longitude is -180*60..180*60 W/E
	lat = false, -- latitude  is -90*60..90*60 N/S
	
	long_real = false, -- those are the real values, not the displayed ones
	lat_real = false, -- the ones displayed could be snapped to a landing spot
	snapped_id = false,
	spot_id_to_challenge_id = false,
	spot_id_to_marker_id = false,
	marker_id_to_challenge_id = false,
	challenge_mode = false,
	challenge_summary = false,
	challenge = false,
	landing_preset_group = "Default",
	displayed_pt = false,
	mouse_ctrl_state = false,
	prev_pt = false,
	pt_attach = false,
	input_prompt = "0N0W",
	
	coord_text = false,
	selector_image = "UI/Common/pm_selector.tga",
	spot_image = "UI/Common/pm_landing_zone.tga",
	spot_image_selected = "UI/Common/pm_landing_zone_2.tga",
	spot_challenge_selection = "UI/Common/pm_challenges_selection.tga",
	spot_challenge_unfinished = "UI/Common/pm_challenges_1.tga",
	spot_challenge_completed = "UI/Common/pm_challenges_2.tga",
	spot_challenge_perfected = "UI/Common/pm_challenges_3.tga",
	selector_image_size = false,
	spot_image_size = false,
}

function LandingSiteObject:InitData(dialog)
	self.dialog = dialog
	self.anim_duration = GetAnimDuration(PlanetRotationObj:GetEntity(), EntityStates["idle"])
	self.overlay_grids = {}
	self:LoadOverlayGrids()
	self:HandleGamepad()
	self.pt_attach = PlaceObject("Shapeshifter")
	PlanetRotationObj:Attach(self.pt_attach, PlanetRotationObj:GetSpotBeginIndex("Planet"))
	self:AddPosModifiers()
	self.dialog.idHint:AddDynamicPosModifier({id = "planet_pos", target = PlanetRotationObj})
	self:AttachPredefinedSpots()
	if g_CurrentMapParams and g_CurrentMapParams.latitude and g_CurrentMapParams.longitude then
		self:SetLatLong(g_CurrentMapParams.latitude * 60, g_CurrentMapParams.longitude * 60)
		self:MoveToSelection(self.lat, self.long)
	end
	self:StartVisibilityThread()
	self.selector_image_size = point(UIL.MeasureImage(self.selector_image))
	self.spot_image_size = point(UIL.MeasureImage(self.spot_image))
end

function LandingSiteObject:GetCoord()
	return self.coord_text or T{4153, "<color 203 120 30><font PGLandingPosName><name></font></color>",  name = T{4152, "Select a Colony Site"}}
end

function LandingSiteObject:GetAltitude()
	return g_CurrentMapParams.Altitude or 0
end

function LandingSiteObject:GetTemperature()
	return g_CurrentMapParams.Temperature or 0
end

function LandingSiteObject:GetChallengeDescr()
	local challenge = self.challenge
	return challenge and challenge.description or ""
end

function LandingSiteObject:GetMissionSponsor()
	local challenge = self.challenge
	local sponsor = challenge and Presets.MissionSponsorPreset.Default[challenge.sponsor]
	return sponsor and sponsor.display_name or ""
end

function LandingSiteObject:GetCommanderProfile()
	local challenge = self.challenge
	local commander = challenge and Presets.CommanderProfilePreset.Default[challenge.commander]
	return commander and commander.display_name or ""
end

function LandingSiteObject:GetGameRulesList()
	local challenge = self.challenge
	if challenge then
		local ids = { challenge.gamerule1, challenge.gamerule2, challenge.gamerule3 }
		local names = {}
		for _, id in ipairs(ids) do
			local rule = id and GameRulesMap[id]
			if rule then
				names[#names + 1] = rule.display_name
			end
		end
		if #names > 0 then
			return table.concat(names, ",")
		end
	end
	
	return T{6761, "None"}
end

function LandingSiteObject:GetDeadlinePerfected()
	local challenge = self.challenge	
	return challenge and challenge.time_perfected / const.DayDuration
end

function LandingSiteObject:GetDeadlineCompleted()
	local challenge = self.challenge	
	return challenge and challenge.time_completed / const.DayDuration
end


function LandingSiteObject:GetMapDifficulty()
	local map_challenge_rating = GetMapChallengeRating()
	if g_DiffBonusObj then
		g_DiffBonusObj.map_challenge_rating = map_challenge_rating
	end
	return MapChallengeRatingToDifficulty(map_challenge_rating)
end

function LandingSiteObject:GetMissionSponsorEffect()
	local item = table.find_value(MissionParams.idMissionSponsor.items, "id", g_CurrentMissionParams.idMissionSponsor)
	if not item then
		return ""
	end
	local context = GetModifiedConsts(item)
	for _, prop in ipairs(item:GetProperties()) do
		context[prop.id] = item:GetProperty(prop.id)
	end

	local start = T{10414, "Funding: $<funding> M<newline>", context}
	local rockets = T{10062, "Starting Rockets: <initial_rockets><newline>", context}
	--local applicants = T{"Starting Applicants: <applicants><newline><newline>", applicants = context.ApplicantsPoolStartingSize, context}

	return start..rockets..T{item.effect, context}
end

function LandingSiteObject:GetCommanderEffect()
	local item = table.find_value(MissionParams.idCommanderProfile.items, "id", g_CurrentMissionParams.idCommanderProfile)
	if not item then
		return ""
	end
	return T{item.effect, item}
end

function LandingSiteObject:GetGameRuleEffects()
	local challenge = self.challenge
	if challenge then
		local ids = { challenge.gamerule1, challenge.gamerule2, challenge.gamerule3 }
		local names = {}
		for _, id in ipairs(ids) do
			local rule = id and GameRulesMap[id]
			if rule then
				names[#names + 1] = T{10415, "- "} .. rule.description
			end
		end
		if #names > 0 then
			return table.concat(names, "<newline>")
		end
	end
	return ""
end

function LandingSiteObject:Random()
	local lat, long = GenerateRandomLandingLocation()
	self:MoveToSelection(lat, long, nil, true)
	self:CalcMarkersVisibility()
end

function LandingSiteObject:Custom()
	CreateMarsRenameControl(self.dialog, T{4092, "Custom coordinates"}, self.input_prompt,
		function(new_val)
			if self.dialog.window_state ~= "destroying" then
				local result, lat, long = self:ConvertStrLocationToCoords(new_val)
				if not result then
					CreateMarsMessageBox(T{6885, "Error"}, T{4093, "Invalid coordinates."}, T{1000136, "OK"})
					return
				end
				self:MoveToSelection(lat, long, nil, true)
				self:CalcMarkersVisibility()
			end
		end, nil, self, {max_len = 7})
end

function LandingSiteObject:GetParamValue(prop_meta)
	local value = CalcValueInQuarters(g_CurrentMapParams[prop_meta.id] or 0)
	if MaxThreat(prop_meta.id) then
		value = 5
	elseif NoThreats(prop_meta.id) then
		value = -1
	end
	if g_CurrentMapParams.latitude and g_CurrentMapParams.longitude then
		g_SelectedSpotChallengeMods[prop_meta.id] = prop_meta.challenge_mod[value]
	end
	return "UI/Common/pm_progress_bar_" .. value .. ".tga"
end

function LandingSiteObject:GetSpotImage(win)
	return win.Id == self.snapped_id and self.spot_image_selected or self.spot_image
end

function LandingSiteObject:GetChallengeSpotImage(win)
	if not self.challenge_mode then
		return
	end
	local challenge_id = self.marker_id_to_challenge_id[win.Id]
	local challenge = Presets.Challenge.Default[challenge_id]
	local completed = AccountStorage and AccountStorage.CompletedChallenges and AccountStorage.CompletedChallenges[challenge_id]
	if type(completed) ~= "table" then
		return self.spot_challenge_unfinished
	end
	local time = completed.time
	return (time < challenge.time_perfected) and self.spot_challenge_perfected or self.spot_challenge_completed
end

function LandingSiteObject:DrawSelector(win)
	local x = self.selector_image_size:x()
	local y = self.selector_image_size:y()
	local width, height = ScaleXY(win.scale, x, y)
	local left = width/2
	local right = width - left
	local up = height / 2
	local down = height - up
	UIL.DrawImage(self.selector_image, box(-left, -up, right, down), box(0, 0, x, y), -1, 0, 0)
end

function LandingSiteObject:DrawSpot(win)
	local x = self.spot_image_size:x()
	local y = self.spot_image_size:y()
	local width, height = ScaleXY(win.scale, 50, 50)
	local left = width/2
	local right = width - left
	local up = height / 2
	local down = height - up
	if self.challenge_mode then
		local spot_img = self:GetChallengeSpotImage(win)
		if spot_img then
			UIL.DrawImage(spot_img, box(-left, -up, right, down), box(0, 0, x, y), -1, 0, 0)
			if win.Id == self.snapped_id then
				UIL.DrawImage(self.spot_challenge_selection, box(-left, -up, right, down), box(0, 0, x, y), -1, 0, 0)
			end
		end
	else
		UIL.DrawImage(self:GetSpotImage(win), box(-left, -up, right, down), box(0, 0, x, y), -1, 0, 0)
	end
end

function LandingSiteObject:MouseButtonDown(pos, button)
	if not IsValid(PlanetObj) then return end
	if button == "R" then
		self.dialog.desktop:SetMouseCapture(self.dialog)
		self.mouse_ctrl_state = "spinning"
		self:StopAnimation()
		self.prev_pt = pos
		return "break"
	elseif button == "L" then
		self.dialog.desktop:SetMouseCapture(self.dialog)
		local new_lat, new_long = PlanetGetClickCoords(pos)
		if new_lat then
			self.mouse_ctrl_state = "dragging"
			self:StopAnimation()
			self:SetLatLong(new_lat, new_long)
			if self.lat then
				PlayFX("SelectColonySite", "start")
				PlayFX("SelectColonySiteDrag", "start")
				local lat, long = self:CalcPlanetCoordsFromScreenCoords(self.lat, self.long)
				local click_pos = self:CalcClickPosFromCoords(lat, long)
				self:DisplayCoord(click_pos, self.lat, self.long, lat, long)
			end
		end
	end
end

function LandingSiteObject:MouseButtonUp(pos, button)
	if button == "R" then
		self:EaseStopRotation((pos - self.prev_pt):Len())
		if self.lat then
			local lat, long = self:CalcPlanetCoordsFromScreenCoords(self.lat, self.long)
			local click_pos = self:CalcClickPosFromCoords(lat, long)
			self.displayed_pt = click_pos
		end
		self.dialog.desktop:SetMouseCapture(false)
		self.mouse_ctrl_state = false
		return "break"
	elseif button == "L" then
		self.dialog.desktop:SetMouseCapture(false)
		if self.lat and self.mouse_ctrl_state == "dragging" then
			PlayFX("SelectColonySite", "end")
			PlayFX("SelectColonySiteDrag", "end")
			self.mouse_ctrl_state = false
			return "break"
		end
	end
end

function LandingSiteObject:MousePos(pos)
	if not IsValid(PlanetObj) then return end
	if self.mouse_ctrl_state == "spinning" then
		local diff = pos:x() - self.prev_pt:x()
		self.prev_pt = pos
		self.rotation_dir = diff < 0 and -1 or 1
		local current_phase = PlanetRotationObj:GetAnimPhase(1)
		local new_phase = (current_phase + diff*2) % self.anim_duration
		PlanetRotationObj:SetAnimPhase(1, new_phase)
		self.dialog:DeleteThread("spin")
		self.dialog:CreateThread("spin", function()
			self:CalcMarkersVisibility()
		end)
	elseif self.mouse_ctrl_state == "dragging" then
		self.dialog:DeleteThread("drag")
		self.dialog:CreateThread("drag", function()
			local new_lat, new_long = PlanetGetClickCoords(pos)
			if new_lat then
				self:SetLatLong(new_lat, new_long)
				if self.lat then
					local lat, long = self:CalcPlanetCoordsFromScreenCoords(self.lat, self.long)
					local click_pos = self:CalcClickPosFromCoords(lat, long)
					self:DisplayCoord(click_pos, self.lat, self.long, lat, long)
				end
			end
		end)
		return "break"
	end
end

function LandingSiteObject:KbdKeyDown(virtual_key, repeated)
	if (virtual_key == const.vkA or virtual_key == const.vkD
		or virtual_key == const.vkW or virtual_key == const.vkS)
		and not self.lat then
			self:DisplayCoord(self:GetCenterPoint())
	end
	if virtual_key == const.vkA or virtual_key == const.vkD then
		local old_lat, old_long = self.lat, self.long
		local visible = self:LeftRightMove(virtual_key == const.vkA and "left" or "right")
		if old_long ~= self.long or old_lat ~= self.lat then
			self:MoveToSelection(self.lat, self.long, visible)
		end
		return "break"
	elseif virtual_key == const.vkW or virtual_key == const.vkS then
		local old_lat, old_long = self.lat, self.long
		local visible = self:UpDownMove(virtual_key == const.vkW and "up" or "down")
		if old_long ~= self.long or old_lat ~= self.lat then
			self:MoveToSelection(self.lat, self.long, visible)
		end
		return "break"
	end
end

function LandingSiteObject:KbdKeyUp(virtual_key, repeated)
	--[[if virtual_key == const.vkA or virtual_key == const.vkD then
		self:AddPosModifiers()
		return "break"
	end]]
end

function LandingSiteObject:HandleGamepad()
	if GetUIStyleGamepad() then
		self.dialog:CreateThread("gamepad",
		function(self)
			local cursor_velocity = point20
			local cursor_speed = 0
			local prevx, prevy = 0, 0
			
			local function HandleGamepadState(state_idx)
				local state = XInput.CurrentState[state_idx]
				if type(state) == "table" and state.LeftThumb then
					local x, y = state.LeftThumb:xy()
					--change in direction
					if prevx ~= x or prevy ~= y then
						prevx, prevy = x, y
						cursor_velocity = point(x/20000, -y/20000)
						cursor_speed = cursor_velocity:Len()
					end
					--change cursor position
					if cursor_speed > 0 then
						if not self.lat then
							self:DisplayCoord(self:GetCenterPoint())
						end
						if self.lat then
							local visible = true
							local old_lat, old_long = self.lat, self.long
							if cursor_velocity:x() ~= 0 then
								visible = self:LeftRightMove(cursor_velocity:x() < 0 and "left" or "right")
							end
							if cursor_velocity:y() ~= 0 then
								visible = self:UpDownMove(cursor_velocity:y() < 0 and "up" or "down") and visible
							end
							if old_lat ~= self.lat or old_long ~= self.long then
								self:MoveToSelection(self.lat , self.long, visible)
							end
						end
					end
				end
			end
			
			if Platform.desktop then
				while true do
					Sleep(50)
					for i = 0, XInput.MaxControllers() - 1 do
						HandleGamepadState(i)
					end
				end
			else
				while true do
					Sleep(50)
					HandleGamepadState(XPlayerActive)
				end
			end
		end, self)
	end
end

function LandingSiteObject:AddPosModifiers()
	self.dialog.idSelector:AddDynamicPosModifier({id = "planet_pos", target = self.pt_attach})
	self.dialog.idtxtCoord:AddDynamicPosModifier({id = "planet_pos", target = self.pt_attach})
end

function LandingSiteObject:AttachPredefinedSpots()
	if Presets.LandingSpot[self.landing_preset_group] then
		local template = self.dialog.idSpotTemplate
		template:SetId("")
		template:SetVisible(true)
		local idx = 1
		if self.challenge_mode then
			self.spot_id_to_challenge_id = {}
			self.marker_id_to_challenge_id = {}
			self.spot_id_to_marker_id = {}
		end
		for k, v in ipairs(Presets.LandingSpot[self.landing_preset_group]) do
			local attach = PlaceObject("Shapeshifter")
			local marker = template:Clone()
			marker:SetParent(self.dialog)
			local marker_id = "idMarker" .. idx
			marker:SetId(marker_id)
			marker.DrawContent = template.DrawContent
			idx = idx + 1
			PlanetRotationObj:Attach(attach, PlanetRotationObj:GetSpotBeginIndex("Planet"))
			marker:AddDynamicPosModifier({id = "planet_pos", target = attach})
			
			if self.challenge_mode then
				self.spot_id_to_marker_id[v.id] = marker_id
			end
			
			local lat, long = self:CalcPlanetCoordsFromScreenCoords(v.latitude * 60, v.longitude * 60)
			local _, world_pt = self:CalcClickPosFromCoords(lat, long)
			local offset = world_pt - PlanetRotationObj:GetPos()
			--compensate for the planet's rotation
			local planet_angle = 360*60 - MulDivRound(PlanetRotationObj:GetAnimPhase(1), 360 * 60, self.anim_duration)
			offset = RotateAxis(offset, PlanetRotationObj:GetAxis(), -planet_angle)
			attach:SetAttachOffset(offset)
		end
		template:SetId("idSpotTemplate")
		template:SetVisible(false)
		
		if self.challenge_mode then
			ForEachPreset("Challenge", function(preset)
				self.spot_id_to_challenge_id[preset.landing_spot] = preset.id
				local marker_id = self.spot_id_to_marker_id[preset.landing_spot]
				assert(marker_id)
				self.marker_id_to_challenge_id[marker_id] = preset.id
			end)	
		end
	end
end

function LandingSiteObject:SetLatLong(new_lat, new_long, force_coords)
	if not new_lat or not new_long then
		return
	end
	if self.lat_real ~= new_lat or self.long_real ~= new_long or force_coords then
		self.lat_real = new_lat
		self.long_real = new_long
		if Presets.LandingSpot[self.landing_preset_group] then
			for k,v in ipairs(Presets.LandingSpot[self.landing_preset_group]) do
				local spot_lat = v.latitude * 60
				local spot_long = v.longitude * 60
				local snap_range = Max(abs(v.latitude) / 15, 1) * spot_snap_range
				if (force_coords and self.lat_real == spot_lat and self.long_real == spot_long) or
					(not force_coords and self.lat_real >= spot_lat - snap_range * 60 and self.lat_real <= spot_lat + snap_range * 60 
					and self.long_real >= spot_long - snap_range * 60 and self.long_real <= spot_long + snap_range * 60)  then
					self.lat = spot_lat
					self.long = spot_long
					self.snapped_id = "idMarker" .. k
					g_CurrentMapParams.landing_spot = v.id
					if self.challenge_mode then
						self:UpdateChallenge(v.id)
					end
					return
				end
			end
			if self.challenge_mode then
				return
			end
		end		
		self.lat = new_lat
		self.long = new_long
		self.snapped_id = false
		g_CurrentMapParams.landing_spot = nil
	end
end

function LandingSiteObject:GetCenterPoint()
	local planet_pos = PlanetRotationObj:GetPos()
	local inside, pt = GameToScreen(planet_pos)
	return inside and pt or false
end

function LandingSiteObject:LeftRightMove(dir)
	local old_long = self.long
	local visible = self:IsSelectionVisible()
	local new_long = (dir == "left") and self.long_real - 60 or self.long_real + 60
	new_long = ((new_long + (180*60)) % (360*60)) - (180*60)
	self:SetLatLong(self.lat_real, new_long)
	if visible then
		local _, long = self:CalcPlanetCoordsFromScreenCoords(self.lat, self.long)
		self.rotation_dir = false
		if long < -2500 and dir == "left" then
			self.rotation_dir = -1
		elseif long > 2500 and dir == "right" then
			self.rotation_dir = 1
		end
	end
	if self.rotation_dir then
		local old_phase = self:CalcAnimPhaseUsingLongitude(old_long)
		local new_phase = self:CalcAnimPhaseUsingLongitude(self.long)
		local dist = Min((new_phase-old_phase)%self.anim_duration, (old_phase-new_phase)%self.anim_duration)
		dist = dist * self.rotation_dir
		local offset = (self.rotation_dir == 1 and 1 or 0) --compensate for wrong anim phase count
		local phase = PlanetRotationObj:GetAnimPhase(1) - dist - offset
		self:SetupAnimation(phase)
	end
	return visible
end

function LandingSiteObject:UpDownMove(dir)
	local visible = self:IsSelectionVisible()
	local new_lat = (dir == "up") and self.lat_real - 60 or self.lat_real + 60
	new_lat = Clamp(new_lat, -70*60, 70*60)
	self:SetLatLong(new_lat, self.long_real)
	return visible
end

function LandingSiteObject:MoveToSelection(lat_org, long_org, dont_rotate_planet, force_coords)
	if not dont_rotate_planet then
		--rotate the planet so that the landing site faces the camera
		local phase = self:CalcAnimPhaseUsingLongitude(long_org)
		local current_phase = PlanetRotationObj:GetAnimPhase(1)
		local phase_diff = phase - current_phase
		if phase_diff > 0 then
			self.rotation_dir = phase_diff < self.anim_duration / 2 and -1 or 1
		else
			self.rotation_dir = phase_diff < -self.anim_duration / 2 and -1 or 1
		end
		self:SetupAnimation(phase)
	end
	self:SetLatLong(lat_org, long_org, force_coords)
	local lat, long = self:CalcPlanetCoordsFromScreenCoords(self.lat, self.long)
	local click_pos = self:CalcClickPosFromCoords(lat, long)
	self:StopAnimation()
	if not dont_rotate_planet and click_pos ~= self.displayed_pt then
		CreateRealTimeThread(function()
			self.dialog.idSelector:SetVisible(false)
			self.dialog.idtxtCoord:SetVisible(false)
			Sleep(50)
			self:DisplayCoord(click_pos, self.lat, self.long, lat, long)
		end, self, click_pos, self.lat, self.long, lat, long)
	else
		self:DisplayCoord(click_pos, self.lat, self.long, lat, long)
	end
end

function LandingSiteObject:SetupAnimation(phase)
	PlanetRotationObj:SetAnim(1,"idle",const.eKeepPhase + (self.rotation_dir > 0 and const.eReverse or 0))
	if phase then
		PlanetRotationObj:SetAnimPhase(1, phase)
	end
end

function LandingSiteObject:StopAnimation()
	self:CalcMarkersVisibility()
	self.rotation_dir = false
	self.dialog:DeleteThread("visibility")
	self.dialog:DeleteThread("easing")
	PlanetRotationObj:SetAnimSpeed(1, 0)
end

function LandingSiteObject:EaseStopRotation(speed)
	if speed and self.rotation_dir then
		speed = Clamp(speed * 500, 0, 2^15 -1) --speed is 16 bit
		self.dialog:DeleteThread("easing")
		self.dialog:CreateThread("easing", function(speed)
			if self.rotation_dir then
				PlanetRotationObj:SetAnim(1,"idle",const.eKeepPhase + (self.rotation_dir < 0 and const.eReverse or 0))
				while speed > 0 do
					PlanetRotationObj:SetAnimSpeed(1, speed)
					speed = speed / 2
					Sleep(50)
					self:CalcMarkersVisibility()
				end
				PlanetRotationObj:SetAnimSpeed(1, 0)
			end
		end, speed)
	end
end

function LandingSiteObject:CalcAnimPhaseUsingLongitude(long)
	--rotate the planet so that the landing site faces the camera
	local long_temp = long - planet_mars_longitude_offset
	long_temp = long_temp >= 0 and long_temp or long_temp + 360 * 60
	return MulDivRound(self.anim_duration, 360*60 - long_temp, 360 * 60)
end

function LandingSiteObject:CalcPlanetCoordsFromScreenCoords(screen_lat, screen_long)
	local planet_angle = 360*60 - MulDivRound(PlanetRotationObj:GetAnimPhase(1), 360 * 60, self.anim_duration)
	local lat = screen_lat + 90 * 60
	local long = screen_long
	long = long - planet_angle - planet_mars_longitude_offset
	if long < 0 then
		long = long + 360 * 60
	end
	if long > 180*60 then
		long = long - 360 * 60
	end
	return lat, long
end

function LandingSiteObject:CalcClickPosFromCoords(lat, long)
	local planet_pos, planet_radius = PlanetObj:GetBSphere()
	local _, click_pos, world_pt = PlanetToScreen(lat, long, planet_pos, planet_radius)
	return click_pos, world_pt
end

function LandingSiteObject:StartVisibilityThread()
	self.dialog:CreateThread("visibility", function()
		while true do
			self:CalcMarkersVisibility()
			Sleep(50)
		end
	end)
end

function LandingSiteObject:CalcMarkersVisibility()
	if PlanetRotationObj and Presets.LandingSpot[self.landing_preset_group] then
		local cur_phase = PlanetRotationObj:GetAnimPhase()
		for k, v in ipairs(Presets.LandingSpot[self.landing_preset_group]) do
			local phase = self:CalcAnimPhaseUsingLongitude(v.longitude * 60)
			local dist = Min((cur_phase-phase)%self.anim_duration, (phase-cur_phase)%self.anim_duration)
			self.dialog["idMarker" .. k]:SetVisible(dist <= 2400)
		end
	end

	if self.long then
		local visible = self:IsSelectionVisible()
		self.dialog.idSelector:SetVisible(visible and not self.snapped_id)
		self.dialog.idtxtCoord:SetVisible(visible)
	end
end

function LandingSiteObject:IsSelectionVisible()
	local cur_phase = PlanetRotationObj:GetAnimPhase()
	local phase = self:CalcAnimPhaseUsingLongitude(self.long)
	local dist = Min((cur_phase-phase)%self.anim_duration, (phase-cur_phase)%self.anim_duration)
	return dist <= 2400
end

function LandingSiteObject:ConvertStrLocationToCoords(coords_str)
	local lat, lat_dir, long, long_dir = string.match(coords_str, "^(%d+)(%a)(%d+)(%a)")
	if not lat or not lat_dir or not long or not long_dir then
		return false
	end
	lat = tonumber(lat) * 60
	long = tonumber(long) * 60
	lat_dir = lat_dir:upper()
	long_dir = long_dir:upper()
	if (lat_dir ~= "N" and lat_dir ~= "S") 
		or (long_dir ~= "W" and long_dir ~= "E") 
		or lat < 0 or lat > 70 * 60
		or long < 0 or long > 180 * 60 then
		return false
	end
	lat = lat_dir == "N" and -lat or lat
	long = long_dir == "W" and -long or long
	return true, lat, long
end

function LandingSiteObject:DisplayCoord(pt, lat, long, lat_org, long_org)
	if not lat then
		lat, long = PlanetGetClickCoords(pt)
		if lat and long then
			self:SetLatLong(lat, long)
			lat_org, long_org = self:CalcPlanetCoordsFromScreenCoords(self.lat, self.long)
			pt = self:CalcClickPosFromCoords(lat_org, long_org)
		end
	end
	if self.lat and self.long then
		self.dialog.idHint:SetVisible(false)
		self.displayed_pt = pt
		local update_actions = false
		if not g_CurrentMapParams.latitude or not g_CurrentMapParams.longitude then
			update_actions = true
		end
		GetOverlayValues(self.lat, self.long, self.overlay_grids)
		self:ShowContent(update_actions)
		if update_actions then
			self.dialog:UpdateActionViews(self.dialog.idActionBar)
		end
		self.dialog.idSelector:SetVisible(not self.snapped_id)
		self.dialog.idtxtCoord:SetVisible(true)
		
		local _, world_pt = self:CalcClickPosFromCoords(lat_org, long_org)
		local offset = world_pt - PlanetRotationObj:GetPos()
		--compensate for the planet's rotation
		local planet_angle = 360*60 - MulDivRound(PlanetRotationObj:GetAnimPhase(1), 360 * 60, self.anim_duration)
		offset = RotateAxis(offset, PlanetRotationObj:GetAxis(), -planet_angle)
		self.pt_attach:SetAttachOffset(offset)
		
		local spot_name = self:ResolveSpotName()
		self.coord_text = PlanetFormatStringCoords(self.lat, self.long, spot_name, nil, nil, self.challenge_mode)
		self.dialog.idtxtCoord:SetText(PlanetFormatStringCoords(self.lat, self.long, spot_name, "<color 237 135 26>", "hint", self.challenge))
		self.input_prompt = PlanetFormatCoordsToPrompt(self.lat, self.long)
		ObjModified(self)
		ObjModified(g_DiffBonusObj)
	end
end

function LandingSiteObject:ShowContent(bAddInterp)
	self.dialog.idContent:SetVisible(true)
	if bAddInterp then
		local width = self.dialog.box:maxx() - self.dialog.idContent.box:minx()
		local int = {
			id = "move",
			type = const.intRect,
			duration = const.InterfaceAnimDuration,
			startRect = self.dialog.idContent.box,
			endRect = box(point(self.dialog.idContent.box:minx() + width, self.dialog.idContent.box:miny()), point(self.dialog.idContent.box:maxx() + width, self.dialog.idContent.box:maxy())),
			flags = const.intfInverse,
			autoremove = true,
		}
		self.dialog.idContent:AddInterpolation(int)
	end
end

function LandingSiteObject:ResolveSpotName()
	if Presets.LandingSpot[self.landing_preset_group] then
		for k, v in ipairs(Presets.LandingSpot[self.landing_preset_group]) do
			if self.lat == v.latitude * 60 and self.long == v.longitude * 60 then
				local ch_id = self.spot_id_to_challenge_id and self.spot_id_to_challenge_id[v.id]
				if ch_id then
					return Presets.Challenge.Default[ch_id].title
				end
				return v.display_name
			end
		end
	end
	return MarsLocales[g_CurrentMapParams.Locales] or false
end

function LandingSiteObject:LoadOverlayGrids()
	LoadOverlayGrids(self.overlay_grids)
end

function LandingSiteObject:UpdateChallenge(id)
	g_CurrentMissionParams.challenge_id = nil
	g_CurrentMissionParams.challenge_id = self.spot_id_to_challenge_id[id]
	if g_CurrentMissionParams.challenge_id then
		self.challenge = Presets.Challenge.Default[g_CurrentMissionParams.challenge_id]
		g_CurrentMissionParams.idMissionSponsor = self.challenge.sponsor
		local logo = GetDefaultMissionSponsorLogo(g_CurrentMissionParams.idMissionSponsor)
		g_CurrentMissionParams.idMissionLogo = logo or g_CurrentMissionParams.idMissionLogo
		g_CurrentMissionParams.idCommanderProfile = self.challenge.commander
		g_CurrentMissionParams.idGameRules = {}
		if self.challenge.gamerule1 then
			g_CurrentMissionParams.idGameRules[self.challenge.gamerule1] = true
		end
		if self.challenge.gamerule2 then
			g_CurrentMissionParams.idGameRules[self.challenge.gamerule2] = true
		end
		if self.challenge.gamerule3 then
			g_CurrentMissionParams.idGameRules[self.challenge.gamerule3] = true
		end
	end		
end

function LandingSiteObject:GetNumChallengeScreenshots()
	return #GalleryList
end

function LandingSiteObjectCreateAndLoad(...)
	local obj = LandingSiteObject:new(...)
	if obj.challenge_mode then
		CreateRealTimeThread(function(obj)
			local err, list = Savegame.ListForTag("gallery")
			if not err then
				GalleryList = list
				
				ObjModified(obj)
				local dlg = GetDialog("PGMainMenu")
				dlg = dlg and dlg.idContent.PGChallenge.idContent.idLandingSpot
				if dlg then
					dlg:UpdateActionViews(dlg.idActionBar)
				end
				
			end
		end, obj)
	end
	return obj
end

function LoadOverlayGrids(grids_table)
	local props = LandingSiteObject:GetProperties()
	for k, prop in ipairs(props) do
		local file =  prop.grid_filename
		local r, g, b, a, pf, w, h = GridsFromImage(file)
		grids_table[prop.id] = r
	end
end

function MapAltitudeValue(val)
	return MulDivRound(val, 29429, 255) - 8200
end

function OverlayAltitudeValue(map_val)
	return MulDivRound(map_val + 8200, 255, 29429)
end

local function GetOverlaysValue(lat, long, grids, values_table)
	for id, grid in pairs(grids) do
		local val
		if NoThreats(id) then
			val = -1
		elseif MaxThreat(id) then
			val = 256
		else
			local y, x = (lat + 90*60)*255/(180*60), (long + 180*60)*511/(360*60)
			val = grid:get(x, y, 1) -- [0, 255 * 100]
			assert(val % 100 == 0)
			val = val / 100 -- [0, 255]
			if id == "Altitude" then
				val = MapAltitudeValue(val)
			elseif id == "Temperature" then
				val = -(100 - MulDivRound(val, 99, 255))--[0, 255]=>[-100, -1]
			elseif id == "ColdWave" then
				val = 255 - val
			end
		end
		values_table[id] = val
	end
	return xxhash(lat, long)
end

function GetOverlayValues(lat, long, overlay_grids, params)
	params = params or g_CurrentMapParams
	overlay_grids = overlay_grids or {}
	if not next(overlay_grids) then
		LoadOverlayGrids(overlay_grids)
	end
	params.seed = GetOverlaysValue(lat, long, overlay_grids, params)
	params.latitude = lat / 60
	params.longitude = long / 60
end

function GenerateRandomLandingLocation()
	local seed = AsyncRand()
	local lat, long = SeedToSpherePoint(seed)
	lat = lat - 90 * 60
	long = long - 180 * 60
	lat = RoundCoordToFullDegrees(lat)
	long = RoundCoordToFullDegrees(long)
	lat = Clamp(lat, -70*60, 70*60)
	return lat, long
end

if FirstLoad then
	g_GalleryReadThread = false
	g_GalleryLastLoadedImg = false
end

DefineClass.ChallengeGalleryObject = {
	__parents = { "PropertyObject" },
	
	current_shot = 1,
}

function ChallengeGalleryObjectCreateAndLoad()
	local obj = ChallengeGalleryObject:new()
	return obj
end

function ChallengeGalleryObject:Show(dlg, delta)
	Savegame.CancelLoad()
	delta = delta or 0
	self.current_shot = self.current_shot + delta
	if self.current_shot < 1 then
		self.current_shot = #GalleryList
	end
	if self.current_shot > #GalleryList then
		self.current_shot = 1
	end
	local descr = GalleryList[self.current_shot]
	
	Savegame.Load(descr.savename, function(mountpoint)
		g_GalleryReadThread = CreateRealTimeThread(function()
			local win = dlg.idImage
			local path = mountpoint .. "/shot.png"
			if not io.exists(path) then return end
			if delta ~= 0 then -- on open it's already faded in
				dlg.desktop.idFade:SetVisible(true)
				Sleep(450)
			end
			win:SetImage("")
			if g_GalleryLastLoadedImg then
				UIL.UnloadImage(g_GalleryLastLoadedImg)
			end
			WaitNextFrame(2)
			win:SetImage(path)
			
			local challenge = Presets.Challenge.Default[descr.displayname]
			dlg.idChallengeName:SetText(challenge.title)			
			local record = AccountStorage.CompletedChallenges and AccountStorage.CompletedChallenges[challenge.id]
			if record then
				dlg.idChallengeScore:SetText(T{10416, "Completed on Sol <sol>, Score: <score>", sol = 1 + record.time / const.DayDuration, score = record.score})
				dlg.idChallengeScore:SetVisible(true)
			else
				dlg.idChallengeScore:SetVisible(false)
			end
			
			repeat
				WaitMsg("OnRender")
			until UIL.IsImageReady(path)
			g_GalleryLastLoadedImg = path
			dlg.desktop.idFade:SetVisible(false)
			Savegame.Unmount()
			g_GalleryReadThread = false
			dlg:UpdateActionViews(dlg.idActionBar)
		end)
		dlg:UpdateActionViews(dlg.idActionBar)
	end)
end

if Platform.developer then
	if FirstLoad then
		DbgPlanetStats = false
		DbgPlanetColors = false
	end
	local stat_colors = {{green}, {blue, red}, {blue, green, red}, {blue, green, yellow, red}, {blue, cyan, green, yellow, red}}
	local function DbgGenColor(value, min, max)
		local sc = stat_colors[1 + max - min]
		if sc then
			return sc[1 + value - min]
		elseif 2 * value >= max + min then
			return InterpolateRGB(green, red, 2 * value - (max + min), max - min)
		else
			return InterpolateRGB(blue, green, 2 * (value - min), max - min)
		end
	end
	function DbgPlanetColorsCallbackName(params)
		return FillRandomMapProps(false, params)
	end
	function DbgPlanetColorsCallbackTopography(params)
		local map = FillRandomMapProps(false, params)
		local rating = MapData[map].challenge_rating
		return _InternalTranslate(MapChallengeRatingToDifficulty(rating))
	end
	function DbgPlanetColorsCallbackDifficulty(params)
		local map = FillRandomMapProps(false, params)
		local rating = MapData[map].challenge_rating
		return CalcChallengeRating(false, false, rating)
	end
	function DbgPlanetColorsCallbackAltitude(params)
		return OverlayAltitudeValue(params.Altitude)
	end
	function DbgPlanetColorsCallbackStyle(params)
		local gen = {}
		local map = FillRandomMapProps(gen, params)
		local type_info = MapData[map].type_info
		local max_pct = 0
		local max_style
		for _, entry in ipairs(gen.texture_setup) do
			local pct = entry.Style ~= "" and not entry.Border and type_info[entry.Texture] or 0
			if pct > max_pct then
				max_style = entry.Style
				max_pct = pct
			end
		end
		return max_style
	end
	local function cprintf(color, fmt, ...)
		local r, g, b = GetRGB(color)
		printf("<color %d %d %d>" .. fmt .. "</color>", r, g, b, ...)
	end
	function DbgShowPlanetColors(stat_callback)
		DbgPlanetStats = false
		DbgPlanetColors = false
		DbgClearVectors()
		MapDelete("map", "Polyline")
		MapDelete("map", "attached", true, "Polyline")
		local planet = stat_callback and PlanetRotationObj and (PlanetRotationObj:GetAttaches("PlanetMars") or {})[1]
		if not planet then
			return
		end
		PauseInfiniteLoopDetection("DbgShowPlanetColors")
		planet:SetVisible(true)
		local function add_line(points, colors)
			local line = PlacePolyline(points, colors)
			line:SetDepthTest(true)
			line:SetLocalSpace(true)
			line:SetPos(points[1])
			planet:Attach(line, planet:GetSpotBeginIndex("Origin"))
			return line
		end
		local pos = planet:GetPos()
		local radius = planet:GetRadius() + 1
		local pmesh = {}
		local smesh = {}
		local min_stat, max_stat
		local all_stats = {}
		local N = 1
		local params = table.copy(g_CurrentMapParams)
		local overlay_grids = {}
		local y = 0
		for lat = -70, 70 do
			local pline = {}
			local sline = {}
			local lat_angle = lat*60
			local slat, clat = sincos(-lat_angle)
			local dz = MulDivRound(radius, slat, clat)
			local x = 0
			for lon = -180, 180 do
				local lon_angle = lon*60
				local slon, clon = sincos(-lon_angle)
				local dx, dy = MulDivRound(radius, clon, 4096), MulDivRound(radius, slon, 4096)
				local vector = SetLen(point(dx, dy, dz), radius)
				GetOverlayValues(lat_angle, lon_angle, overlay_grids, params)
				local stat = stat_callback(params) or false
				if not stat then
					--
				elseif type(stat) ~= "number" then
					all_stats[stat] = (all_stats[stat] or 0) + 1
				elseif not min_stat then
					min_stat, max_stat = stat, stat
				elseif min_stat > stat then
					min_stat = stat
				elseif max_stat < stat then
					max_stat = stat
				end
				x = x + 1
				pline[x] = vector
				sline[x] = stat
			end
			y = y + 1
			pmesh[y] = pline
			smesh[y] = sline
		end
		local cmesh = {}
		local width, height = #pmesh[1], #pmesh
		if min_stat then
			for y = 1,height do
				local cline = {}
				for x = 1,width do
					local stat = smesh[y][x]
					local color = stat and DbgGenColor(stat, min_stat, max_stat)
					cline[x] = color
				end
				cmesh[y] = cline
			end
			local minc = DbgGenColor(min_stat, min_stat, max_stat)
			local midc = DbgGenColor((min_stat + max_stat) / 2, min_stat, max_stat)
			local maxc = DbgGenColor(max_stat, min_stat, max_stat)
			cprintf(minc, "min = %d", min_stat)
			cprintf(midc, "mid = %d", (min_stat + max_stat) / 2)
			cprintf(maxc, "max = %d", max_stat)
		else
			local stats = {}
			local total_count = 0
			for stat, count in pairs(all_stats) do
				stats[#stats + 1] = stat
				total_count = total_count + count
			end
			table.sort(stats, function(a, b) return all_stats[a] > all_stats[b] end)
			local stat_to_color = {}
			for i=1,#stats do
				local stat = stats[i]
				local color = DbgGenColor(i, 1, #stats)
				stat_to_color[stat] = color
				local r, g, b = GetRGB(color)
				local count = all_stats[stat]
				cprintf(color, "%s #%d %d%%", stat, count, 100 * count / total_count)
			end
			for y = 1,height do
				local cline = {}
				for x = 1,width do
					local stat = smesh[y][x]
					cline[x] = stat_to_color[stat]
				end
				cmesh[y] = cline
			end
		end
		local points, colors = {}, {}
		local function add_point(x, y, pt0, clr0)
			local pt = pmesh[y][x]
			local clr = cmesh[y][x]
			local N = #points
			points[N + 1] = pt0 or points[N] or pt
			colors[N + 1] = clr0 or 0
			points[N + 2] = pt
			colors[N + 2] = pt0 and clr or 0
			return pt, clr
		end
		for y = 1,height do
			local pt0, clr0
			for x = 1,width do
				pt0, clr0 = add_point(x, y, pt0, clr0)
			end
		end
		for x = 1,width do
			local pt0, clr0
			for y = 1,height do
				pt0, clr0 = add_point(x, y, pt0, clr0)
			end
		end
		add_line(points, colors)
		DbgPlanetStats = smesh
		DbgPlanetColors = cmesh
		ResumeInfiniteLoopDetection("DbgShowPlanetColors")
	end
end