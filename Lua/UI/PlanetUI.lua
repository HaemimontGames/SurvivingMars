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
local spot_snap_range = 1

GlobalVar("PlanetScene", false)
GlobalVar("PlanetCamera", false)
GlobalVar("PlanetThread", false)
GlobalVar("PlanetStack", false)

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
			table.change(hr, "PlanetCamera", { 
				RenderTerrain = 0,
				RenderPlanetView = 1,
				FarZ = 700000,
				NearZ = 100,
			})
			SetPostProcPredicate("space_mist", true)
			SetLightmodelOverride(1, planet)
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
	GetObjects{classes= {"PlanetDummy", "Rocket"}}:Destroy()
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
			local rocket_entity = "Rocket"
			rocket_entity = GetMissionSponsor():GetDefaultRocketSkin() or rocket_entity
			assert(IsValidEntity(rocket_entity))
			rocket_obj = PlaceObject(rocket_entity)
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
	-- long -> -70 .. +70 (dep on click and fov) as we rotate the planet
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

function PlanetFormatStringCoords(lat, long, spot_name, spot_color, hint)
	local lat_dir = lat > 0 and T{6886, "S"} or T{6887, "N"}
	local long_dir = long > 0 and T{6888, "E"} or T{6889, "W"}
	lat = abs(lat)
	long = abs(long)
	spot_name = spot_name or T{1103, "Colony Site"}
	local color = spot_color or Untranslated("<color 203 120 30>")
	local name = T{4128, "<clr><font PGLandingPosName><name></font></color><newline>", clr = color,  name = spot_name}
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
}

local function MapChallengeRatingToDifficulty(rating)
	if rating <= 59 then
		return T{4154, "Relatively Flat"}
	elseif rating <= 99 then
		return T{4155, "Rough"}
	elseif rating <= 139 then
		return T{4156, "Steep"}
	else
		return T{4157, "Mountainious"}
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
		{id = "DustDevils",     name = T{4142, "Dust Devils"},     grid_filename = "UI/Data/Overlays/MarsTopography.jpg",  category = "Threats", threat = true, editor = "landing_param", default = 0,   challenge_mod = {0, 5, 10, 15}, rollover = {title = T{4142, "Dust Devils"},     descr = T{4143, "Dust Devils contaminate buildings in their area with Martian Sand. Contaminated buildings require maintenance and may malfunction. Dust devils contaminate nearby buildings quickly, but disappear relatively fast."}} },
		{id = "DustStorm",      name = T{4144, "Dust Storms"},     grid_filename = "UI/Data/Overlays/MarsDust.jpg",        category = "Threats", threat = true, editor = "landing_param", default = 0,   challenge_mod = {0, 10, 20, 30}, rollover = {title = T{4144, "Dust Storms"},     descr = T{4145, "Dust Storms contaminate all field buildings with dust and can last several Sols. Colonies in areas with intense Dust Storms will require shorter maintenance cycles. MOXIEs and Moisture Vaporators are not operational during Dust Storms."}} },
		{id = "Meteor",         name = T{4146, "Meteors"},         grid_filename = "UI/Data/Overlays/MarsMeteors.jpg",     category = "Threats", threat = true, editor = "landing_param", default = 0,   challenge_mod = {0, 10, 20, 30}, rollover = {title = T{4146, "Meteors"},         descr = T{4147, "Meteors can destroy or damage structures, colonists and vehicles in their impact area. Some meteors are composed of useful resources like Metal or Polymers."}} },
		{id = "ColdWave",       name = T{4148, "Cold Waves"},      grid_filename = "UI/Data/Overlays/MarsTemperature.jpg", category = "Threats", threat = true, editor = "landing_param", default = 0,   challenge_mod = {0, 10, 20, 30}, rollover = {title = T{4149, "Cold Wave"},       descr = T{4150, "Cold Waves last several Sols, increasing the power consumption of vehicles, Drones and many field buildings. Water Towers are frozen during Cold Waves."}} },
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
	displayed_pt = false,
	mouse_ctrl_state = false,
	prev_pt = false,
	pt_attach = false,
	input_prompt = "0N0W",
	
	coord_text = false,
	selector_image = "UI/Common/pm_selector.tga",
	spot_image = "UI/Common/pm_landing_zone.tga",
	spot_image_selected = "UI/Common/pm_landing_zone_2.tga",
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

function LandingSiteObject:GetMapDifficulty()
	local map_challenge_rating = GetMapChallengeRating()
	if g_DiffBonusObj then
		g_DiffBonusObj.map_challenge_rating = map_challenge_rating
	end
	return MapChallengeRatingToDifficulty(map_challenge_rating)
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
	if g_CurrentMapParams.latitude and g_CurrentMapParams.longitude then
		g_SelectedSpotChallengeMods[prop_meta.id] = prop_meta.challenge_mod[value]
	end
	return "UI/Common/pm_progress_bar_" .. value .. ".tga"
end

function LandingSiteObject:GetSpotImage(win)
	return win.Id == self.snapped_id and self.spot_image_selected or self.spot_image
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
	UIL.DrawImage(self:GetSpotImage(win), box(-left, -up, right, down), box(0, 0, x, y), -1, 0, 0)
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
			PlayFX("SelectColonySite", "start")
			PlayFX("SelectColonySiteDrag", "start")
			self.mouse_ctrl_state = "dragging"
			self:StopAnimation()
			self:SetLatLong(new_lat, new_long)
			local lat, long = self:CalcPlanetCoordsFromScreenCoords(self.lat, self.long)
			local click_pos = self:CalcClickPosFromCoords(lat, long)
			self:DisplayCoord(click_pos, self.lat, self.long, lat, long)
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
				local lat, long = self:CalcPlanetCoordsFromScreenCoords(self.lat, self.long)
				local click_pos = self:CalcClickPosFromCoords(lat, long)
				self:DisplayCoord(click_pos, self.lat, self.long, lat, long)
			end
		end)
		return "break"
	end
end

function LandingSiteObject:KbdKeyDown(char, virtual_key, repeated)
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

function LandingSiteObject:KbdKeyUp(char, virtual_key, repeated)
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

function LandingSiteObject:RepositionCursor(pt)
	pt = pt or point20
	--[[local size = self.dialog.idSelector:GetSize()
	local pos = pt - self.dialog.idSelector:GetSize() / 2
	self.dialog.idSelector:SetBox(pos:x(), pos:y(), pos:x() + size:x(), pos:y() + size:y())]]
	--self.idtxtCoord:SetPos(pt - self.idtxtCoord:GetSize() / 2)
	--self.idtxtCoord:SetY(self.idSelector:GetY()+self.idSelector:GetHeight())
end

function LandingSiteObject:AddPosModifiers()
	--self:RepositionCursor()
	self.dialog.idSelector:AddDynamicPosModifier({id = "planet_pos", target = self.pt_attach})
	self.dialog.idtxtCoord:AddDynamicPosModifier({id = "planet_pos", target = self.pt_attach})
end

function LandingSiteObject:AttachPredefinedSpots()
	if Presets.LandingSpot.Default then
		local template = self.dialog.idSpotTemplate
		template:SetId("")
		template:SetVisible(true)
		local idx = 1
		for k, v in ipairs(Presets.LandingSpot.Default) do
			local attach = PlaceObject("Shapeshifter")
			local marker = template:Clone()
			marker:SetParent(self.dialog)
			marker:SetId("idMarker" .. idx)
			marker.DrawContent = template.DrawContent
			idx = idx + 1
			--marker:SetSize(template:GetSize())
			--marker:SetPos(template:GetPos())
			PlanetRotationObj:Attach(attach, PlanetRotationObj:GetSpotBeginIndex("Planet"))
			marker:AddDynamicPosModifier({id = "planet_pos", target = attach})
			
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
	end
end

function LandingSiteObject:SetLatLong(new_lat, new_long, force_coords)
	if not new_lat or not new_long then
		return
	end
	if self.lat_real ~= new_lat or self.long_real ~= new_long or force_coords then
		self.lat_real = new_lat
		self.long_real = new_long
		if Presets.LandingSpot.Default then
			for k,v in ipairs(Presets.LandingSpot.Default) do
				local spot_lat = v.latitude * 60
				local spot_long = v.longitude * 60
				local snap_range = Max(v.latitude / 15, 1) * spot_snap_range
				if (force_coords and self.lat_real == spot_lat and self.long_real == spot_long) or
					(not force_coords and self.lat_real >= spot_lat - snap_range * 60 and self.lat_real <= spot_lat + snap_range * 60 
					and self.long_real >= spot_long - snap_range * 60 and self.long_real <= spot_long + snap_range * 60)  then
					self.lat = spot_lat
					self.long = spot_long
					self.snapped_id = "idMarker" .. k
					g_CurrentMapParams.landing_spot = v.id
					return
				end
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
		--remove modifiers to prevent jumping of cursor and text when rotating planet
		--self.dialog.idSelector:RemoveModifier("planet_pos")
		--self.dialog.idtxtCoord:RemoveModifier("planet_pos")
		--self:RepositionCursor(self.displayed_pt)
		self:SetupAnimation(phase)
	else
		--self:AddPosModifiers()
	end
	return visible
end

function LandingSiteObject:UpDownMove(dir)
	local visible = self:IsSelectionVisible()
	local new_lat = (dir == "up") and self.lat_real - 60 or self.lat_real + 60
	new_lat = Clamp(new_lat, -70*60, 70*60)
	self:SetLatLong(new_lat, self.long_real)
	--self:AddPosModifiers()
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
	if PlanetRotationObj and Presets.LandingSpot.Default then
		local cur_phase = PlanetRotationObj:GetAnimPhase()
		for k, v in ipairs(Presets.LandingSpot.Default) do
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
		self.coord_text = PlanetFormatStringCoords(self.lat, self.long, spot_name)
		self.dialog.idtxtCoord:SetText(PlanetFormatStringCoords(self.lat, self.long, spot_name, "<color 237 135 26>", "hint"))
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
	if Presets.LandingSpot.Default then
		for k, v in ipairs(Presets.LandingSpot.Default) do
			if self.lat == v.latitude * 60 and self.long == v.longitude * 60 then
				return v.display_name
			end
		end
	end
	return MarsLocales[g_CurrentMapParams.Locales] or false
end

function LandingSiteObject:LoadOverlayGrids()
	LoadOverlayGrids(self.overlay_grids)
end

function LandingSiteObjectCreateAndLoad()
	local obj = LandingSiteObject:new()
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
	return MulDivRound(val,29429,25500) - 8200
end

local function GetOverlaysValue(lat, long, grids, values_table)
	for id, grid in pairs(grids) do
		local y, x = (lat + 90*60)*255/(180*60), (long + 180*60)*511/(360*60)
		local val = grid:get(x,y, 1)
		if id == "Altitude" then
			val = MapAltitudeValue(val)
		elseif id == "Temperature" then
			val = -(100 - MulDivRound(val,9900,25500)/100)--[0, 255]=>[-100, -1]
		elseif id == "ColdWave" then
			val = (25500 - val)/100
		else
			val = val/100
		end
		values_table[id] = val
	end
	return xxhash(lat, long)
end

function GetOverlayValues(lat, long, overlay_grids)
	if not overlay_grids then
		overlay_grids = {}
		LoadOverlayGrids(overlay_grids)
	end
	g_CurrentMapParams.seed = GetOverlaysValue(lat, long, overlay_grids, g_CurrentMapParams)
	g_CurrentMapParams.latitude = lat / 60
	g_CurrentMapParams.longitude = long / 60
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