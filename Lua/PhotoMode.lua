if FirstLoad then
	g_PhotoMode = false
	g_PhotoModeShotNum = false
	g_PhotoModeShotThread = false
	PhotoModeObj = false
	g_PrePhotoModeStoredVisuals = false
	g_PhotoFilter = false
	g_PhotoFilterData = false
end

function OpenPhotoMode()
	g_PrePhotoModeStoredVisuals = {}
	PhotoModeBegin()
	local dlg = GetInGameInterface()
	if dlg and dlg.mode == "overview" then
		dlg:SetMode("selection")
	end
	CreateRealTimeThread(function()
		if CameraTransitionThread then
			WaitMsg("CameraTransitionEnd")
		end
		CloseIngameMainMenu() --could have been opened by the user during camera transition
		OpenDialog("PhotoMode")
	end)
end

function ClosePhotoMode()
	if g_PhotoMode then
		CreateMapRealTimeThread(function()
			PhotoModeObj:Save()
		end)
	end
end

function AbortPhotoMode()
	ClosePhotoMode()
	CloseDialog("PhotoMode")
end

local function ActivateFreeCamera()
	local dlg = GetXDialog("PhotoMode")
	if dlg then
		dlg.idFreeCameraWarning:SetVisible(true)
	end
	cameraFly.Activate(1)
	if g_MouseConnected then
		SetMouseDeltaMode(true)
	end
end

local function DeactivateFreeCamera()
	if cameraFly.IsActive() then
		if g_MouseConnected then
			SetMouseDeltaMode(false)
		end
		SetDefaultCameraRTS()
	end
	local dlg = GetXDialog("PhotoMode")
	if dlg then
		dlg.idFreeCameraWarning:SetVisible(false)
	end
end

function PhotoModeBegin()
	g_PhotoMode = true
	table.change(hr, "photo_mode", {
		InterfaceInScreenshot = 0,
		LODDistanceModifier = Max(hr.LODDistanceModifier, 200),
		DistanceModifier = Max(hr.DistanceModifier, 100),
		ObjectLODCapMin = Min(hr.ObjectLODCapMin, 0),
		EnablePostProcDOF = 1,
		Anisotropy = 4,
	})
	--store all initial values
	g_PrePhotoModeStoredVisuals.SignsVisible = g_SignsVisible
	g_PrePhotoModeStoredVisuals.ResourceIconsTurnedOff = g_ResourceIconsTurnedOff
	g_PrePhotoModeStoredVisuals.lm_name = CurrentLightmodel[1].name
	g_PrePhotoModeStoredVisuals.dof_params = { GetDOFParams() }
end

function PhotoModeEnd()
	if g_PhotoFilter and g_PhotoFilter.deactivate then
		g_PhotoFilter.deactivate(g_PhotoFilter.filter, g_PhotoFilterData)
	end
	g_PhotoMode = false
	g_PhotoFilter = false
	g_PhotoFilterData = false
	PhotoModeObj:Resume("final")
	--restore from initial values
	table.restore(hr, "photo_mode")
	g_SignsVisible = not g_PrePhotoModeStoredVisuals.SignsVisible
	ToggleSigns()
	g_ResourceIconsTurnedOff = not g_PrePhotoModeStoredVisuals.ResourceIconsTurnedOff
	ToggleResourceIcons()
	--rebuild the postprocess
	PP_Rebuild()
	--restore time of day and lightmodel
	SetTimeOfDay(LocalToEarthTime((UICity.hour*const.MinutesPerHour + UICity.minute)*1000), const.HourDuration)
	SetLightmodel(1, g_PrePhotoModeStoredVisuals.lm_name, 0)
	--restore FOV
	camera.SetAutoFovX(1, 0, const.Camera.DefaultFovX_16_9, 16, 9)
	table.insert(g_PrePhotoModeStoredVisuals.dof_params, 0)
	SetDOFParams(unpack_params(g_PrePhotoModeStoredVisuals.dof_params))
	DeactivateFreeCamera()
end

function PhotoModeApply(pm_object, prop_id)
	if prop_id == "toggleSigns" then
		g_SignsVisible = not pm_object.toggleSigns
		ToggleSigns()
	elseif prop_id == "timeOfDay" then
		SetTimeOfDay(LocalToEarthTime(pm_object.timeOfDay*1000), const.HourDuration)
		if GetTimeFactor() == 0 then
			local lm = FindPrevLightmodel(GetCurrentLightmodelList(), pm_object.timeOfDay)
			if lm.name ~= CurrentLightmodel[1].name then
				SetLightmodel(1, lm.name, 0)
			end
		end
		PhotoModeApply(pm_object, "fogDensity")
		PhotoModeApply(pm_object, "bloomStrength")
		PhotoModeApply(pm_object, "exposure")
		PhotoModeApply(pm_object, "vignette")
	elseif prop_id == "fov" then
		camera.SetAutoFovX(1, 0, pm_object.fov, 16, 9)
	elseif prop_id == "filter" then
		if g_PhotoFilter and g_PhotoFilter.deactivate then
			g_PhotoFilter.deactivate(g_PhotoFilter.filter, g_PhotoFilterData)
		end
		local filter = PhotoFilterPresetMap[pm_object.filter]
		if filter and filter.filename ~= "" then
			g_PhotoFilterData = {}
			if filter.activate then
				filter.activate(filter, g_PhotoFilterData)
			end
			g_PhotoFilter = filter:GetShaderDescriptor()
		else
			g_PhotoFilter = false
			g_PhotoFilterData = false
		end
		if not filter then
			pm_object:SetProperty("filter", PhotoModeObject.filter) --revert to default filter
		end
		PP_Rebuild()
	elseif prop_id == "fogDensity" then
		SetSceneParam(1, "FogGlobalDensity", pm_object.fogDensity, 0, 0)
	elseif prop_id == "bloomStrength" then
		SetSceneVectorParam(1, "Bloom", 0, pm_object.bloomStrength, 0, 0)
	elseif prop_id == "exposure" then
		SetSceneParam(1, "GlobalExposure",  pm_object.exposure, 0, 0)
	elseif prop_id == "vignette" then
		SetSceneParam(1, "Vignette", pm_object.vignette, 0, 0)
	elseif prop_id == "depthOfField" or prop_id == "focusDepth" or prop_id == "defocusStrength" then
		local detail = 3
		local focus_depth = Lerp(hr.NearZ, hr.FarZ, pm_object.focusDepth ^ detail, 100 ^ detail)
		local dof = Lerp(0, hr.FarZ - hr.NearZ, pm_object.depthOfField ^ detail, 100 ^ detail)
		local strength = sqrt(pm_object.defocusStrength * 100)
		SetDOFParams(
			strength, 
			Max(focus_depth - dof / 3, hr.NearZ), 
			Max(focus_depth - dof / 6, hr.NearZ),
			strength,
			Min(focus_depth + dof / 3, hr.FarZ), 
			Min(focus_depth + dof * 2 / 3, hr.FarZ),
			0)
	elseif prop_id == "freeCamera" then
		if pm_object.freeCamera then
			ActivateFreeCamera()
		else
			DeactivateFreeCamera()
		end
	end
	
end

function PhotoModeTake()
	g_PhotoModeShotThread = IsValidThread(g_PhotoModeShotThread) and g_PhotoModeShotThread or CreateMapRealTimeThread(function()
		g_PhotoModeShotNum = g_PhotoModeShotNum or 0
		local folder = "AppPictures/"
		local proposed_name = string.format("Screenshot%04d.png", g_PhotoModeShotNum)
		if io.exists(folder .. proposed_name) then
			local files = io.listfiles(folder, "Screenshot*.png")
			for i = 1, #files do
				g_PhotoModeShotNum = Max(g_PhotoModeShotNum, tonumber(string.match(files[i], "Screenshot(%d+)%.png") or 0))
			end
			g_PhotoModeShotNum = g_PhotoModeShotNum + 1
			proposed_name = string.format("Screenshot%04d.png", g_PhotoModeShotNum)
		end
		local width, height = GetResolution()
		WaitNextFrame(3)
		LockCamera("Screenshot")
		MovieWriteScreenshot(folder .. proposed_name, 0, 32, false, width, height)
		UnlockCamera("Screenshot")
		g_PhotoModeShotNum = g_PhotoModeShotNum + 1
		local dlg = GetXDialog("PhotoMode")
		if dlg then
			dlg:BlinkFilePath(ConvertToOSPath(folder .. proposed_name))
		end
	end)
end

function PhotoObjectCreateAndLoad()
	local obj = PhotoModeObject:new()
	local props = obj:GetProperties()
	if AccountStorage.PhotoMode then
		for _, prop in ipairs(props) do
			local value = AccountStorage.PhotoMode[prop.id]
			if value ~= nil then --false could be a valid value
				obj:SetProperty(prop.id, value)
			end
		end
	end
	PropertyObject.SetProperty(obj, "timeOfDay", UICity.hour * const.MinutesPerHour + UICity.minute)
	PropertyObject.SetProperty(obj, "fogDensity", CurrentLightmodel[1].fog_density)
	PropertyObject.SetProperty(obj, "bloomStrength", CurrentLightmodel[1].pp_bloom_strength)
	PropertyObject.SetProperty(obj, "exposure", CurrentLightmodel[1].exposure)
	PropertyObject.SetProperty(obj, "vignette", CurrentLightmodel[1].vignette)
	PhotoModeObj = obj
	PhotoModeObj.initial_time_factor = GetTimeFactor()
	return obj
end

function OnMsg.AfterLightmodelChange()
	if g_PhotoMode and GetTimeFactor() ~= 0 then
		--in photo mode in resumed state
		g_PrePhotoModeStoredVisuals.lm_name = CurrentLightmodel[1].name
		PhotoModeObj:SetProperty("timeOfDay", UICity.hour * const.MinutesPerHour + UICity.minute)
	end
end

function OnMsg.NewHour(hour)
	if g_PhotoMode and PhotoModeObj.timeOfDay ~= UICity.hour * const.MinutesPerHour then
		PhotoModeObj:SetProperty("timeOfDay", hour * const.MinutesPerHour)
	end
end

function GetPhotoModeFilters()
	local filters = {}
	ForEachPreset("PhotoFilterPreset", function(preset, group, filters)
		filters[#filters + 1] = { value = preset.id, text = preset.displayName }
	end, filters)
	
	return filters
end

DefineClass.PhotoModeObject = {
	__parents = {"PropertyObject"},
	properties =
	{
		{ name = T{3451, "FOV"}, id = "fov", editor = "number", default = const.Camera.DefaultFovX_16_9, slider = true, min = 20*60, max = 120*60, scale = 60, dont_save = true, step = function() return GetUIStyleGamepad() and 300 or 1 end, dpad_only = true, },
		{ name = T{3452, "Time of day"}, id = "timeOfDay", editor = "number", default = 0, slider = true, min = 0, max = const.HoursPerDay * const.MinutesPerHour, dont_save = true, filter = function() return GetTimeFactor() == 0 end, step = function() return GetUIStyleGamepad() and 20 or 1 end, dpad_only = true, },
		{ name = T{3453, "Gameplay Indicators"}, id = "toggleSigns", editor = "bool", default = true },
		{ name = T{8712, "Free Camera"}, id = "freeCamera", editor = "bool", default = false, dont_save = true, },
		{ name = T{3454, "Photo Filter"}, id = "filter", editor = "dropdown", default = "None", items = GetPhotoModeFilters },
		{ name = T{3455, "Vignette"}, id = "vignette", editor = "number", slider = true, default = 0, min = 0, max = 255, dont_save = true, step = function() return GetUIStyleGamepad() and 10 or 1 end, dpad_only = true, },
		{ name = T{3456, "Exposure"}, id = "exposure", editor = "number", slider = true, default = 0, min = -255, max = 255, dont_save = true, step = function() return GetUIStyleGamepad() and 20 or 1 end, dpad_only = true, },
		{ name = T{3457, "Fog Density"}, id = "fogDensity", editor = "number", slider = true, default = 0, min = 0, max = 1000, dont_save = true, step = function() return GetUIStyleGamepad() and 50 or 1 end, dpad_only = true, },
		{ name = T{8656, "Depth of Field"}, id = "depthOfField", editor = "number", slider = true, default = 50, min = 0, max = 100, dont_save = true, step = 1, dpad_only = true },
		{ name = T{8657, "Focus Depth"}, id = "focusDepth", editor = "number", slider = true, default = 50, min = 0, max = 100, dont_save = true, step = 1, dpad_only = true },
		{ name = T{8658, "Defocus Strength"}, id = "defocusStrength", editor = "number", slider = true, default = 0, min = 0, max = 100, dont_save = true, step = 1, dpad_only = true },
		{ name = T{3458, "Bloom Strength"}, id = "bloomStrength", editor = "number", slider = true, default = 0, min = 0, max = 100, dont_save = true, step = function() return GetUIStyleGamepad() and 5 or 1 end, dpad_only = true, },
	},
	initial_time_factor = 0,
}

function PhotoModeObject:SetProperty(id, value)
	local ret = PropertyObject.SetProperty(self, id, value)
	PhotoModeApply(self, id)
	return ret
end

function PhotoModeObject:Save()
	AccountStorage.PhotoMode = {}
	local storage_table = AccountStorage.PhotoMode
	for _, prop in ipairs(self:GetProperties()) do
		if not prop.dont_save then
			local value = self:GetProperty(prop.id)
			storage_table[prop.id] = value
		end
	end
	SaveAccountStorage()
end

function PhotoModeObject:Pause()
	Pause(self)
	SetTimeFactor(0, "sync")
end

function PhotoModeObject:Resume(force)
	Resume(self)
	SetTimeFactor((force or self.initial_time_factor ~= 0) and self.initial_time_factor or const.DefaultTimeFactor, "sync")
	if CurrentLightmodel[1].name ~= g_PrePhotoModeStoredVisuals.lm_name then
		SetLightmodel(1, g_PrePhotoModeStoredVisuals.lm_name, 0)
	end
end