OptionsData.Options.VideoPreset = {
	{ value = "Low", text = T(644, "Low") },
	{ value = "Medium", text = T(645, "Medium") },
	{ value = "High", text = T(7375, "High") },
	{ value = "Ultra", text = T(3551, "Ultra") },
	{ value = "Durango", text = T{""}, not_selectable = true },
	{ value = "Ps4", text = T{""}, not_selectable = true },
	{ value = "Custom", text = T(6843, "Custom"), not_selectable = true },
}

OptionsData.VideoPresetsData = {
	Low = {
		Textures = "Low",
		Shadows = "Low",
		Terrain = "Low",
		Effects = "Low",
		ViewDistance = "Low",
		Antialiasing = "FXAA",
		Anisotropy = "Off",
		ResolutionPercent = "70",
		Lights = "Low",
		Postprocess = "Low",
		Bloom = "On",
		EyeAdaptation = "On",
		Vignette = "On",
		ObjectDetail = "Low",
		MaxFps = "240",
		SSAO = "Off",
		SSR = "Off",
		ShowFireworks = "On",
	},
	Medium = {
		Textures = "Medium",
		Shadows = "Medium",
		Terrain = "Medium",
		Effects = "Medium",
		ViewDistance = "Medium",
		Antialiasing = "FXAA",
		Anisotropy = "2x",
		ResolutionPercent = "100",
		Lights = "Medium",
		Postprocess = "Medium",
		Bloom = "On",
		EyeAdaptation = "On",
		Vignette = "On",
		ObjectDetail = "High",
		MaxFps = "240",
		SSAO = "Off",
		SSR = "Off",
		ShowFireworks = "On",
	},
	High = {
		Textures = "High",
		Shadows = "High",
		Terrain = "High",
		Effects = "High",
		ViewDistance = "High",
		Antialiasing = "SMAA",
		Anisotropy = "4x",
		ResolutionPercent = "100",
		Lights = "High",
		Postprocess = "High",
		Bloom = "On",
		EyeAdaptation = "On",
		Vignette = "On",
		ObjectDetail = "High",
		MaxFps = "240",
		SSAO = "On",
		SSR = "On",
		ShowFireworks = "On",
	},
	Ultra = {
		Textures = "Ultra",
		Shadows = "High",
		Terrain = "Ultra",
		Effects = "Ultra",
		ViewDistance = "Ultra",
		Antialiasing = "SMAA",
		Anisotropy = "16x",
		ResolutionPercent = "100",
		Lights = "High",
		Postprocess = "High",
		Bloom = "On",
		EyeAdaptation = "On",
		Vignette = "On",
		ObjectDetail = "High",
		MaxFps = "240",
		SSAO = "On",
		SSR = "On",
		ShowFireworks = "On",
	},
	Durango = {
		Textures = "High",
		Shadows = "High (Consoles)",
		Terrain = "High",
		Effects = "High",
		ViewDistance = "High",
		Antialiasing = "FXAA",
		Anisotropy = "4x",
		ResolutionPercent = "100",
		Lights = "High",
		Postprocess = "High",
		Bloom = "On",
		EyeAdaptation = "On",
		Vignette = "On",
		Vsync = true,
		FPSCounter = "Off",
		MaxFps = "Unlimited",
		SSAO = "Off",
		SSR = "Off",
		ShowFireworks = "On",
	},
	Scorpio = {
		Textures = "Ultra",
		Shadows = "High (Consoles)",
		Terrain = "Ultra",
		Effects = "High",
		ViewDistance = "High",
		Antialiasing = "FXAA",
		Anisotropy = "8x",
		ResolutionPercent = "100",
		Lights = "High",
		Postprocess = "High",
		Bloom = "On",
		EyeAdaptation = "On",
		Vignette = "On",
		Vsync = true,
		FPSCounter = "Off",
		MaxFps = "Unlimited",
		SSAO = "Off",
		SSR = "Off",
		ShowFireworks = "On",
	},
	Ps4 = {
		Textures = "High",
		Shadows = "High (Consoles)",
		Terrain = "High",
		Effects = "High",
		ViewDistance = "High",
		Antialiasing = "FXAA",
		Anisotropy = "4x",
		ResolutionPercent = "100",
		Lights = "High",
		Postprocess = "High",
		Bloom = "On",
		EyeAdaptation = "On",
		Vignette = "On",
		Vsync = true,
		FPSCounter = "Off",
		MaxFps = "Unlimited",
		SSAO = "Off",
		SSR = "Off",
		ShowFireworks = "On",
	},
	Neo = {
		Textures = "High",
		Shadows = "High (Consoles)",
		Terrain = "Ultra",
		Effects = "High",
		ViewDistance = "High",
		Antialiasing = "FXAA",
		Anisotropy = "8x",
		ResolutionPercent = "100",
		Lights = "High",
		Postprocess = "High",
		Bloom = "On",
		EyeAdaptation = "On",
		Vignette = "On",
		Vsync = true,
		FPSCounter = "Off",
		MaxFps = "Unlimited",
		SSAO = "Off",
		SSR = "Off",
		ShowFireworks = "On",
	},
}

local ExcludeFromPresetCheck =
{
	Vsync = true,
	FPSCounter = true,
}

if FirstLoad then
	PresetVideoOptions = {}
	for preset, vals in pairs(OptionsData.VideoPresetsData) do
		for k, _ in pairs(vals) do
			if not ExcludeFromPresetCheck[k] then
				PresetVideoOptions[k] = true
			end
		end
	end
end

OptionsData.Options.ShowFireworks = {
	{ value = "Off", text = T(6844, "Off"), hr = { ShowFireworks = 0 } },
	{ value = "On", text = T(6847, "On"), hr = { ShowFireworks = 1 } },
}

OptionsData.Options.RightClickAction = {
	{ value = "Build", text = T(383281603855, "Build Menu")},
	{ value = "Move", text = T(3560, "Move Units")},
	{ value = "Both", text = T(3561, "Both")},
}

OptionsData.Options.ControlScheme = {
	{ value = "Controller", text = T(3589, --[[Control Scheme Option - Controller]] "Controller") },
	{ value = "Hybrid", text = T(11860, --[[Control Scheme Option - Hybrid]] "Hybrid") },
}

OptionsData.Options.AutosaveInterval = {
	{ value = 1,  text = T(4111, "1 Sol") },
	{ value = 2,  text = T{10072, "<number> Sols", number = 2} },
	{ value = 3,  text = T{10072, "<number> Sols", number = 3} },
	{ value = 5,  text = T{10072, "<number> Sols", number = 5} },
	{ value = 10, text = T{10072, "<number> Sols", number = 10} },
}

OptionsData.Options.AutosaveCount = {
	{ value = 1,  text = T(10073, "1 Autosave") },
	{ value = 2,  text = T{10074, "<number> Autosaves", number = 2} },
	{ value = 3,  text = T{10074, "<number> Autosaves", number = 3} },
	{ value = 5,  text = T{10074, "<number> Autosaves", number = 5} },
	{ value = 10, text = T{10074, "<number> Autosaves", number = 10} },
}

OptionsData.Options.AutoPinMaxNum = {
	{ value = 20, text = Untranslated("20") },
	{ value = 50, text = Untranslated("50") },
	{ value = 100, text = Untranslated("100") },
	{ value = 150, text = Untranslated("150") },
	{ value = 200, text = Untranslated("200") },
}

-- storage is "local", "account", "session"
-- items is Options.OptionsData[id], if not specified
function OnMsg.ClassesGenerate(classdefs)
	local game_properties = {
		-- Audio
		{ name = T(3583, "Radio Station"), id = "RadioStation", category = "Audio", editor = "bool", no_edit = true, default = "SurvivingMars" },
		
		-- Account
		{ name = T(11861, "Control Scheme"), id = "ControlScheme", category = "Controls", storage = "account", editor = "dropdown", default = Platform.console and "Controller" or "Hybrid", filter = FilterConsoleOption,},
		{ name = T(3584, "Invert Mouse Wheel"), id = "InvertMouseWheel", category = "Controls", storage = "account", editor = "bool", default = false, filter = FilterNonConsoleOption,},
		{ name = T(3585, "Invert Look"), id = "InvertLook", category = "Controls", storage = "account", editor = "bool", default = false},
		{ name = T(3586, "Invert Rotation"), id = "InvertRotation", category = "Controls", storage = "account", editor = "bool", default = false},
		{ name = T(3587, "Scroll Outside Window"), id = "MouseScrollOutsideWindow", category = "Controls", storage = "account", editor = "bool", default = true, filter = FilterNonConsoleOption,},
		{ name = T(3588, "Right-click Action"), id = "RightClickAction", category = "Controls", storage = "account", editor = "dropdown", default = "Both", filter = function() return not Platform.console or g_MouseConnected end, },
		{ name = T(3590, "Camera Movement Speed"), id = "CameraMoveSpeed", category = "Controls", storage = "account", editor = "number", min = 5, max = 20, slider = true, default = const.DefaultCameraRTS.MoveSpeedNormal},
		
		--Gameplay
		{ name = T(3591, "Autosave"), id = "Autosave", category = "Gameplay", storage = "account", editor = "bool", default = true},
		{ name = T(10077, "Autosave Count"), id = "AutosaveCount", category = "Gameplay", storage = "account", editor = "dropdown", default = const.DefaultAutosaveCount, filter = FilterNonConsoleOption,},
		{ name = T(10078, "Autosave Interval"), id = "AutosaveInterval", category = "Gameplay", storage = "account", editor = "dropdown", default = const.DefaultAutosaveInterval},
		{ name = T(9764, "Infobar"), id = "InfobarEnabled", category = "Gameplay", storage = "account", editor = "bool", default = true},
		{ name = T(8529, "Save to Cloud"), id = "AutosaveToCloud", category = "Gameplay", storage = "account", editor = "bool", default = false, filter = function() return IsParadoxPlatform() end },
		{ name = T(10908, "Auto Pin Domes"), id = "AutoPinDomes", category = "Gameplay", storage = "account", editor = "bool", default = true },
		{ name = T(10909, "Auto Pin Drone Hubs"), id = "AutoPinDroneHubs", category = "Gameplay", storage = "account", editor = "bool", default = false },
		{ name = T(10910, "Auto Pin Rovers"), id = "AutoPinRovers", category = "Gameplay", storage = "account", editor = "bool", default = true },
		{ name = T(10911, "Auto Pin Rare Colonists"), id = "AutoPinRareColonists", category = "Gameplay", storage = "account", editor = "bool", default = true },
		{ name = T(10912, "Auto Pin Founders"), id = "AutoPinFounders", category = "Gameplay", storage = "account", editor = "bool", default = false },
		{ name = T(10913, "Max Number of Auto Pins"), id = "AutoPinMaxNum", category = "Gameplay", storage = "account", editor = "dropdown", default = 50 },
		{ name = T(11518, "Show Fireworks"), id = "ShowFireworks", category = "Gameplay", storage = "account", editor = "bool", on_value = "On", off_value = "Off", default = "On" },
	}
	table.iappend(classdefs.OptionsObject.properties, game_properties)
end

function OptionsObject:SetRadioStation(station)
	local old = self.RadioStation
	if old ~= station then
		self.RadioStation = station
		StartRadioStation(station)
	end
end

local function UpdateHintsOption(hints_enabled)
	hints_enabled = not g_Tutorial and hints_enabled or false
	if HintsEnabled ~= hints_enabled then
		if mapdata.GameLogic and hints_enabled then
			CreateGameTimeThread(PeriodicHintChecks)
		end
		HintsEnabled = hints_enabled
		GetOnScreenHintDlg()
	end
end

function ApplyProjectAccountOptions()
	if AccountStorage then
		local options = AccountStorage.Options
		hr.CameraRTSScrollOutsideWindow = options.MouseScrollOutsideWindow == false and 0 or 1
		hr.InvertMouseWheel = options.InvertMouseWheel and 1 or -1
		const.CameraControlInvertLook = options.InvertLook
		const.CameraControlInvertRotation = options.InvertRotation
		ApplyHybridControls()
		UpdateHintsOption(options.HintsEnabled)
		UpdateInfobarVisibility()
		
		cameraRTS.SetProperties(1, {MoveSpeedNormal = options.CameraMoveSpeed or const.DefaultCameraRTS.MoveSpeedNormal, MoveSpeedFast = options.CameraMoveSpeed and options.CameraMoveSpeed * 2 or const.DefaultCameraRTS.MoveSpeedFast})
	end
end

function ApplyHybridControls()
	Msg("ControlSchemeChanged")
	if Platform.console then
		if UseHybridControls() then
			UnforceHideMouseCursor("hybrid")
			hr.CameraRTSDisableMouseScroll = 0
		else
			ForceHideMouseCursor("hybrid")
			hr.CameraRTSDisableMouseScroll = 1
		end
	end
end

local function RecursiveUpdateTTexts(root)
	if IsKindOf(root, "XTranslateText") and root.Translate and IsT(root:GetText()) then
		root:SetText(root:GetText())
		root:SetTextStyle(root:GetTextStyle())
	end
	for i=1,#root do
		RecursiveUpdateTTexts(root[i])
	end
end

function ApplyLanguageOption()
	--cannot change language on consoles
	if Platform.console then
		return
	end

	if AccountStorage then
		local options = AccountStorage.Options
		local new_lang = options.Language
		local old_lang = GetLanguage()
		if new_lang and new_lang ~= old_lang then
			RegistryWrite("Language", new_lang) --save permanently
			SetLanguage(new_lang) --set global variable
			MountLanguage()
			LoadTranslationTables() --reload loc table
			RecursiveUpdateTTexts(terminal.desktop) --update all translated texts
		end
	end
end

--reload account options when reloading Lua
function OnMsg.Autorun()
	local preset = Platform.console and GetDefaultEngineOptions().VideoPreset or EngineOptions.VideoPreset
	ApplyPreset(preset)
	ApplyProjectAccountOptions()
end

--reload account options when we get new account storage, something that happens on the durango
function OnMsg.AccountStorageChanged()
	if Platform.console and AccountStorage then
		ApplyPreset(GetDefaultEngineOptions().VideoPreset) --override saved video preset in engine options
	end
	if AccountStorage and next(AccountStorage.Shortcuts) then
		DelayedCall(0, ReloadShortcuts)
	end
end

function OnMsg.LocalStorageChanged()
	Options.ApplyEngineOptions(EngineOptions)
	if terminal.desktop then
		terminal.desktop:OnSystemSize(UIL.GetScreenSize())
	end
end

function OnMsg.EngineOptionsSaved()
	if terminal.desktop then
		--this will resize dialogs to fit the DisplayAreaMargin option
		terminal.desktop:InvalidateLayout()
		Msg("SafeAreaMarginsChanged") -- TODO - temporary until all of the InGameInterface children have been redone with X
	end
end

function OnMsg.ShortcutsReloaded()
	-- pan keys
	local pan_up = GetShortcuts("actionPanUp")
	hr.CameraRTSKeyPanUp = GetCameraVKCodeFromShortcut(pan_up and pan_up[1])
	hr.CameraRTSKeyPanUpAlt	 = GetCameraVKCodeFromShortcut(pan_up and pan_up[2])
	hr.CameraFlyKeyMoveForward = hr.CameraRTSKeyPanUp
	hr.CameraFlyKeyMoveForwardAlt = hr.CameraRTSKeyPanUpAlt
	local pan_down = GetShortcuts("actionPanDown")
	hr.CameraRTSKeyPanDown = GetCameraVKCodeFromShortcut(pan_down and pan_down[1])
	hr.CameraRTSKeyPanDownAlt = GetCameraVKCodeFromShortcut(pan_down and pan_down[2])
	hr.CameraFlyKeyMoveBackward = hr.CameraRTSKeyPanDown
	hr.CameraFlyKeyMoveBackwardAlt = hr.CameraRTSKeyPanDownAlt
	local pan_left = GetShortcuts("actionPanLeft")
	hr.CameraRTSKeyPanLeft = GetCameraVKCodeFromShortcut(pan_left and pan_left[1])
	hr.CameraRTSKeyPanLeftAlt = GetCameraVKCodeFromShortcut(pan_left and pan_left[2])
	hr.CameraFlyKeyMoveLeft = hr.CameraRTSKeyPanLeft
	hr.CameraFlyKeyMoveLeftAlt = hr.CameraRTSKeyPanLeftAlt
	local pan_right = GetShortcuts("actionPanRight")
	hr.CameraRTSKeyPanRight = GetCameraVKCodeFromShortcut(pan_right and pan_right[1])
	hr.CameraRTSKeyPanRightAlt = GetCameraVKCodeFromShortcut(pan_right and pan_right[2])
	hr.CameraFlyKeyMoveRight = hr.CameraRTSKeyPanRight
	hr.CameraFlyKeyMoveRightAlt = hr.CameraRTSKeyPanRightAlt
	-- rot keys
	local rot_left = GetShortcuts("actionRotLeft")
	hr.CameraRTSKeyRotateLeft = GetCameraVKCodeFromShortcut(rot_left and rot_left[1])
	hr.CameraRTSKeyRotateLeftAlt = GetCameraVKCodeFromShortcut(rot_left and rot_left[2])
	hr.CameraFlyKeyMoveUp = hr.CameraRTSKeyRotateLeft
	hr.CameraFlyKeyMoveUpAlt = hr.CameraRTSKeyRotateLeftAlt
	local rot_right = GetShortcuts("actionRotRight")
	hr.CameraRTSKeyRotateRight = GetCameraVKCodeFromShortcut(rot_right and rot_right[1])
	hr.CameraRTSKeyRotateRightAlt = GetCameraVKCodeFromShortcut(rot_right and rot_right[2])
	hr.CameraFlyKeyMoveDown = hr.CameraRTSKeyRotateRight
	hr.CameraFlyKeyMoveDownAlt = hr.CameraRTSKeyRotateRightAlt
	local rot_up = GetShortcuts("actionRotUp")
	hr.CameraRTSKeyRotateUp = GetCameraVKCodeFromShortcut(rot_up and rot_up[1])
	hr.CameraRTSKeyRotateUpAlt = GetCameraVKCodeFromShortcut(rot_up and rot_up[2])
	local rot_down = GetShortcuts("actionRotDown")
	hr.CameraRTSKeyRotateDown = GetCameraVKCodeFromShortcut(rot_down and rot_down[1])
	hr.CameraRTSKeyRotateDownAlt = GetCameraVKCodeFromShortcut(rot_down and rot_down[2])
	-- zoom keys
	local zoom_in = GetShortcuts("actionZoomIn")
	hr.CameraRTSKeyZoomIn = GetCameraVKCodeFromShortcut(zoom_in and zoom_in[1])
	hr.CameraRTSKeyZoomInAlt = GetCameraVKCodeFromShortcut(zoom_in and zoom_in[2])
	local zoom_out = GetShortcuts("actionZoomOut")
	hr.CameraRTSKeyZoomOut = GetCameraVKCodeFromShortcut(zoom_out and zoom_out[1])
	hr.CameraRTSKeyZoomOutAlt = GetCameraVKCodeFromShortcut(zoom_out and zoom_out[2])
	-- orbit camera
	local orbit = GetShortcuts("actionOrbitCamera")
	hr.CameraRTSKeyOrbitCamera = GetCameraVKCodeFromShortcut(orbit and orbit[1])
	hr.CameraRTSKeyOrbitCameraAlt = GetCameraVKCodeFromShortcut(orbit and orbit[2])
	
	if OptionsObj then
		OptionsObj.shortcuts = {}
	end
end

function OnMsg.ChangeMapDone()
	if AccountStorage and AccountStorage.Options.CameraMoveSpeed then
		cameraRTS.SetProperties(1, {MoveSpeedNormal = AccountStorage.Options.CameraMoveSpeed, MoveSpeedFast = AccountStorage.Options.CameraMoveSpeed * 2})
	end
end

function OnMsg.OnXInputControllerConnected(nCtrlId)
	local use_gamepad = (Platform.console or not AccountStorage or AccountStorage.Options.Gamepad == nil) and true or AccountStorage.Options.Gamepad
	UpdateUIStyleGamepad(use_gamepad)
	ShowGamepadCursor("controller_disconnected")
end

function OnMsg.OnXInputControllerDisconnected(nCtrlId)
	if not Platform.console then
		UpdateUIStyleGamepad(AccountStorage.Options.Gamepad)
		if not IsXInputControllerConnected() then
			HideGamepadCursor("controller_disconnected")
		end
	end
end

if FirstLoad then
	if DefaultAccountStorage and DefaultAccountStorage.Options then
		DefaultAccountStorage.Options.Autosave = true
		DefaultAccountStorage.Options.HintsEnabled = true
		DefaultAccountStorage.Options.InfobarEnabled = true
		DefaultAccountStorage.Options.AutosaveCount = const.DefaultAutosaveCount
		DefaultAccountStorage.Options.AutosaveInterval = const.DefaultAutosaveInterval
		
		DefaultAccountStorage.Options.AutoPinMaxNum = 50
		DefaultAccountStorage.Options.AutoPinDomes = true
		DefaultAccountStorage.Options.AutoPinDroneHubs = false
		DefaultAccountStorage.Options.AutoPinRovers = true
		DefaultAccountStorage.Options.AutoPinRareColonists = true
		DefaultAccountStorage.Options.AutoPinFounders = false
	end
end