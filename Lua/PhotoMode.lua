if FirstLoad then
	g_PhotoModeChallengeId = false
end

function PhotoModeDialogOpen()
	CreateRealTimeThread(function()
		if CameraTransitionThread then
			WaitMsg("CameraTransitionEnd")
		end
		CloseIngameMainMenu() --could have been opened by the user during camera transition
		OpenDialog("PhotoMode")
	end)
end

function OnMsg.MessageBoxPreOpen()
	CloseDialog("PhotoMode")
end

function OnMsg.PhotoModeFreeCameraActivated()
	local dlg = GetDialog("PhotoMode")
	if dlg then
		dlg.idFreeCameraWarning:SetVisible(true)
	end
end

function OnMsg.PhotoModeFreeCameraDeactivated()
	local dlg = GetDialog("PhotoMode")
	if dlg then
		dlg.idFreeCameraWarning:SetVisible(false)
	end
end

function OnMsg.PhotoModeBegin()
	g_PrePhotoModeStoredVisuals.SignsVisible = g_SignsVisible
	g_PrePhotoModeStoredVisuals.ResourceIconsTurnedOff = g_ResourceIconsTurnedOff
end

function OnMsg.PhotoModeEnd()
	if g_PhotoModeChallengeId then
		CreateRealTimeThread(GalleryWriteLastScreenshot, g_PhotoModeChallengeId)
		g_PhotoModeChallengeId = false
	end
	PhotoModeObj:Resume("final")
	SetSignsVisible(g_PrePhotoModeStoredVisuals.SignsVisible)
	SetSelectionVisible(g_PrePhotoModeStoredVisuals.SignsVisible)
	g_ResourceIconsTurnedOff = g_PrePhotoModeStoredVisuals.ResourceIconsTurnedOff
	if g_PrePhotoModeStoredVisuals.ResourceIconsTurnedOff then
		SetResourceIconsVisible(false)
	end
	--restore time of day
	SetTimeOfDay(LocalToEarthTime((UICity.hour*const.MinutesPerHour + UICity.minute)*1000), const.HourDuration)
	--restore FOV
	camera.SetAutoFovX(1, 0, const.Camera.DefaultFovX_16_9, 16, 9)
end

local old_PhotoModeApply = PhotoModeApply
function PhotoModeApply(pm_object, prop_id)
	if prop_id == "toggleSigns" then
		SetSignsVisible(pm_object.toggleSigns)
		SetSelectionVisible(pm_object.toggleSigns)
	elseif prop_id == "timeOfDay" then
		SetTimeOfDay(LocalToEarthTime(pm_object.timeOfDay*1000), const.HourDuration)
		if GetTimeFactor() == 0 then
			local lm = FindPrevLightmodel(GetCurrentLightmodelList(), pm_object.timeOfDay)
			if lm.id ~= CurrentLightmodel[1].id then
				SetLightmodel(1, lm.id, 0)
			end
		end
		PhotoModeApply(pm_object, "fogDensity")
		PhotoModeApply(pm_object, "bloomStrength")
		PhotoModeApply(pm_object, "exposure")
		PhotoModeApply(pm_object, "vignette")
	elseif prop_id == "fov" then
		camera.SetAutoFovX(1, 0, pm_object.fov, 16, 9)
	end
	old_PhotoModeApply(pm_object, prop_id)
end

local old_PhotoModeDoTakeScreenshot = PhotoModeDoTakeScreenshot
function PhotoModeDoTakeScreenshot(frame_duration, max_frame_duration)
	if g_PhotoModeChallengeId then
		GalleryTakeScreenshot()
		local dlg = GetDialog("PhotoMode")
		if dlg and dlg.window_state ~= "destroying" then
			dlg:BlinkFilePath(_InternalTranslate(T(1000015, "Success")))
		end
	else
		old_PhotoModeDoTakeScreenshot(frame_duration, max_frame_duration)
	end
end

function OnMsg.PhotoModeScreenshotTaken(file_path)
	local dlg = GetDialog("PhotoMode")
	if dlg and dlg.window_state ~= "destroying" then
		dlg:BlinkFilePath(file_path)
	end
end

local old_PhotoObjectCreateAndLoad = PhotoObjectCreateAndLoad
function PhotoObjectCreateAndLoad()
	local obj = old_PhotoObjectCreateAndLoad()
	PropertyObject.SetProperty(obj, "timeOfDay", UICity.hour * const.MinutesPerHour + UICity.minute)
	return obj
end

function OnMsg.AfterLightmodelChange()
	if g_PhotoMode and GetTimeFactor() ~= 0 then
		--in photo mode in resumed state
		PhotoModeObj:SetProperty("timeOfDay", UICity.hour * const.MinutesPerHour + UICity.minute)
	end
end

function OnMsg.NewHour(hour)
	if g_PhotoMode and PhotoModeObj.timeOfDay ~= UICity.hour * const.MinutesPerHour then
		PhotoModeObj:SetProperty("timeOfDay", hour * const.MinutesPerHour)
	end
end

function PhotoModeGetPropStep(gamepad_val, mouse_val)
	return UseGamepadUI() and gamepad_val or mouse_val
end

function OnMsg.ClassesGenerate(classdefs)
	local game_properties = {
		{ name = T(3451, "FOV"), id = "fov", editor = "number", default = const.Camera.DefaultFovX_16_9, slider = true, min = 20*60, max = 120*60, scale = 60, step = function() return PhotoModeGetPropStep(300, 1) end, dpad_only = true, },
		{ name = T(3452, "Time of day"), id = "timeOfDay", editor = "number", default = 0, slider = true, min = 0, max = const.HoursPerDay * const.MinutesPerHour, dont_save = true, filter = function() return GetTimeFactor() == 0 end, step = function() return PhotoModeGetPropStep(20, 1) end, dpad_only = true, },
		{ name = T(3453, "Gameplay Indicators"), id = "toggleSigns", editor = "bool", default = true },
	}
	table.iappend(classdefs.PhotoModeObject.properties, game_properties)
end

-- gallery-related

function GalleryWriteLastScreenshot(id)
	local list = io.listfiles("memoryscreenshot")
	for _, name in ipairs(list) do
		local path, file, ext = SplitPath(name)
		if ext == ".jpg" then
			if Platform.console then
				local err, saves = Savegame.ListForTag("gallery")
				if not err then
					local item, idx
					while true do
						item, idx = table.find_value(saves, "displayname", id)
						if not item then break end
						Savegame.Delete(item.savename)
						table.remove(saves, idx)
					end
				end
			end
			Savegame.WithTag("gallery", id, function(folder)
				local shots = io.listfiles(folder, "*.jpg")
				for _, file in ipairs(shots) do
					AsyncFileDelete(file)
				end
				AsyncCopyFile(name, folder .. file .. ext)
			end, nil, "force overwrite")
			SavegamesList:Reset()
			AsyncFileDelete(name)
			break
		end
	end
	Msg("ChallengeScreenshotSaved", id)
end

function GalleryTakeScreenshot()
	-- alternative path in gallery mode: write to the mounted memory fs with standard name
	local width, height = GetResolution()
	WaitNextFrame(3)
	LockCamera("Screenshot")
	local name = string.format("memoryscreenshot/shot%dx%d.jpg", width, height)
	WaitCaptureScreenshot(name, {interface = false, width = width, height = height})
	UnlockCamera("Screenshot")
end

function GallerySaveDefaultScreenshot(id)
	local err, list = Savegame.ListForTag("gallery")
	if not err and not table.find(list, "displayname", id) then
		local tf = GetTimeFactor()
		Pause("GalleryDefaultScreenshot")
		SetTimeFactor(0, "sync")
		
		GalleryTakeScreenshot()
		GalleryWriteLastScreenshot(id)
		
		Resume("GalleryDefaultScreenshot")
		SetTimeFactor(tf, "sync")
	end
	Msg("ChallengeDefaultScreenshotSaved")
end