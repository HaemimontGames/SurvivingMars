function OnMsg.Autorun()
	-- just make sure it's after InitRenderEngine
	-- !!! can config.GraphicsApi change later?
	if config.GraphicsApi == "d3d11" then
		OptionsData.Options.FullscreenMode = {
			{ value = 0, text = T{3547, --[[Options dialog fullscreen mode]] "Windowed"}, },
			{ value = 1, text = T{3548, --[[Options dialog fullscreen mode]] "Borderless"}, },
			{ value = 2, text = T{3549, --[[Options dialog fullscreen mode]] "Exclusive"}, },
		}
	else
		OptionsData.Options.FullscreenMode = {
			{ value = 0, text = T{3547, --[[Options dialog fullscreen mode]] "Windowed"}, },
			{ value = 1, text = T{3550, --[[Options dialog fullscreen mode]] "Fullscreen"}, },
		}
	end
end

OptionsData.Options.VideoPreset = {
	{ value = "Low", text = T{644, "Low"} },
	{ value = "Medium", text = T{645, "Medium"} },
	{ value = "High", text = T{7375, "High"} },
	{ value = "Ultra", text = T{3551, "Ultra"} },
	{ value = "Durango", text = T{""}, not_selectable = true },
	{ value = "Ps4", text = T{""}, not_selectable = true },
	{ value = "Custom", text = T{6843, "Custom"}, not_selectable = true },
}

OptionsData.VideoPresetsData = {
	Low = {
		Textures = "Low",
		Shadows = "Low",
		Terrain = "Low",
		FXDetailThresholds = "Low",
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
	},
	Medium = {
		Textures = "Medium",
		Shadows = "Medium",
		Terrain = "Medium",
		FXDetailThresholds = "Medium",
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
	},
	High = {
		Textures = "High",
		Shadows = "High",
		Terrain = "High",
		FXDetailThresholds = "High",
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
	},
	Ultra = {
		Textures = "Ultra",
		Shadows = "High",
		Terrain = "Ultra",
		FXDetailThresholds = "High",
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
	},
	Durango = {
		Textures = "High",
		Shadows = "High (Consoles)",
		Terrain = "High",
		FXDetailThresholds = "High",
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
	},
	Scorpio = {
		Textures = "Ultra",
		Shadows = "High (Consoles)",
		Terrain = "Ultra",
		FXDetailThresholds = "High",
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
	},
	Ps4 = {
		Textures = "High",
		Shadows = "High (Consoles)",
		Terrain = "High",
		FXDetailThresholds = "High",
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
	},
	Neo = {
		Textures = "High",
		Shadows = "High (Consoles)",
		Terrain = "Ultra",
		FXDetailThresholds = "High",
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

OptionsData.Options.Textures = {
	{ value = "Low", text = T{644, "Low"}, hr = { DTM_VideoMemory = 256 } },
	{ value = "Medium", text = T{645, "Medium"}, hr = { DTM_VideoMemory = 512 } },
	{ value = "High", text = T{7376, "High"}, hr = { DTM_VideoMemory = 1024 } },
	{ value = "Ultra", text =  T{3551, "Ultra"}, hr = { DTM_VideoMemory = 2048 } },
}

OptionsData.Options.Terrain = {
	{ value = "Low", text = T{644, "Low"}, hr = { TR_ChunkSize = 256, TR_MaxChunks = 100, TR_MaxChunksPerFrame = 5, TR_MaterialQualityReductionLevel = 2, TR_PriorityModifier = 80, TR_BakedDecalThreshold = 0 } },
	{ value = "Medium", text = T{645, "Medium"}, hr = { TR_ChunkSize = 256, TR_MaxChunks = 150, TR_MaxChunksPerFrame = 10, TR_MaterialQualityReductionLevel = 1, TR_PriorityModifier = 20, TR_BakedDecalThreshold = 0 } },
	{ value = "High", text = T{7377, "High"}, hr = { TR_ChunkSize = 512, TR_MaxChunks = 100, TR_MaxChunksPerFrame = 10, TR_MaterialQualityReductionLevel = 0, TR_PriorityModifier = 10, TR_BakedDecalThreshold = 0 } },
	{ value = "Ultra", text = T{3551, "Ultra"}, hr = { TR_ChunkSize = 512, TR_MaxChunks = 200, TR_MaxChunksPerFrame = 20, TR_MaterialQualityReductionLevel = 0, TR_PriorityModifier = 10, TR_BakedDecalThreshold = 0 } },
}

OptionsData.Options.ResolutionPercent = {
	{ value = "70", text = T{3552, "70"}, hr = { ResolutionPercent = 70 } },
	{ value = "85", text = T{3553, "85"}, hr = { ResolutionPercent = 85 } },
	{ value = "100", text = T{3554, "100"}, hr = { ResolutionPercent = 100 } },
}

OptionsData.Options.FXDetailThresholds = {
	{ value = "Low", text = T{644, "Low"}, fx_threshold = 50},
	{ value = "Medium", text = T{645, "Medium"}, fx_threshold = 25},
	{ value = "High", text = T{7378, "High"}, fx_threshold = 0},
}

OptionsData.Options.ViewDistance = {
	{ value = "Low", text = T{644, "Low"}, hr = { LODDistanceModifier = 50, DistanceModifier = 54 } },
	{ value = "Medium", text = T{645, "Medium"}, hr = { LODDistanceModifier = 75, DistanceModifier = 72 } },
	{ value = "High", text = T{7379, "High"}, hr = { LODDistanceModifier = 100, DistanceModifier = 100 } },
	{ value = "Ultra", text = T{3551, "Ultra"}, hr = { LODDistanceModifier = 120, DistanceModifier = 150 } },
}

OptionsData.Options.Shadows = {
	{ value = "Off", text = T{6844, "Off"}, hr = { Shadowmap = 0, } },
	{ value = "Low", text = T{644, "Low"}, hr = { Shadowmap = 1, ShadowmapSize = 1536, ShadowPCFSize = 3, ShadowCSMUpdateFrequency = "0,0,40,40" } },
	{ value = "Medium", text = T{645, "Medium"}, hr = { Shadowmap = 1, ShadowmapSize = 2048, ShadowPCFSize = 5, ShadowCSMUpdateFrequency = "0,0,0,40" } },
	{ value = "High", text = T{7380, "High"}, hr = { Shadowmap = 1, ShadowmapSize = 4096, ShadowPCFSize = 7, ShadowCSMUpdateFrequency = "0" } },
	{ value = "High (Consoles)", text = T{""}, hr = { Shadowmap = 1, ShadowmapSize = 4096, ShadowPCFSize = 7, ShadowCSMUpdateFrequency = "0,0,0,40" }, not_selectable = true },
}

OptionsData.Options.Antialiasing = {
	{ value = "Off", text = T{6844, "Off"}, hr = { EnablePostProcAA = 0} },
	{ value = "FXAA", text = T{3555, "FXAA"}, hr = { EnablePostProcAA = 1 } },
	{ value = "SMAA", text = Untranslated("SMAA"), hr = { EnablePostProcAA = 2 } },
}

OptionsData.Options.Anisotropy = {
	{ value = "Off", text = T{6845, "Off"}, hr = { Anisotropy = 0 } },
	{ value = "2x", text = T{3556, "2x"}, hr = { Anisotropy = 1 } },
	{ value = "4x", text = T{7969, "4x"}, hr = { Anisotropy = 2 } },
	{ value = "8x", text = T{7970, "8x"}, hr = { Anisotropy = 3 } },
	{ value = "16x", text = T{8079, "16x"}, hr = { Anisotropy = 4 } },
}

OptionsData.Options.Lights = {
	{ value = "Low", text = T{644, "Low"}, hr = { LightsRadiusModifier = 90 } },
	{ value = "Medium", text = T{645, "Medium"}, hr = { LightsRadiusModifier = 95} },
	{ value = "High", text = T{7381, "High"}, hr = { LightsRadiusModifier = 100 } },
}

OptionsData.Options.ObjectDetail = {
--	{ value = "Very Low", text = T{"Very Low"}, hr = { ObjectLODCapMin = 2 } },
	{ value = "Low", text = T{644, "Low"}, hr = { ObjectLODCapMin = 1 } },
	{ value = "High", text = T{7381, "High"}, hr = { ObjectLODCapMin = 0 } },
}

OptionsData.Options.Postprocess = {
	{ value = "Low", text = T{644, "Low"}, hr = {} },
	{ value = "Medium", text = T{645, "Medium"}, hr = {} },
	{ value = "High", text = T{7382, "High"}, hr = {} },
}

OptionsData.Options.Bloom = {
	{ value = "Off", text = T{6846, "Off"}, hr = { EnablePostProcBloom = 0 } },
	{ value = "On", text = T{6847, "On"}, hr = { EnablePostProcBloom = 1 } },
}

OptionsData.Options.EyeAdaptation = {
	{ value = "Off", text = T{6846, "Off"}, hr = { EnablePostProcAutoExposure = 0 } },
	{ value = "On", text = T{6847, "On"}, hr = { EnablePostProcAutoExposure = 1 } },
}

OptionsData.Options.Vignette = {
	--hr = { EnablePostProcVignette = function (v) return v and 1 or 0 end },
	{ value = "Off", text = T{6848, "Off"}, hr = { EnablePostProcVignette = 0 } },
	{ value = "On", text = T{6849, "On"}, hr = { EnablePostProcVignette = 1} },
}

OptionsData.Options.FPSCounter = {
	{ value = "Off", text = T{6850, "Off"}, hr = { FpsCounter = 0 } },
	{ value = "Fps", text = T{3558, "FPS"}, hr = { FpsCounter = 1 } },
	{ value = "Ms", text = T{3559, "ms"}, hr = { FpsCounter = 2 } },
}

OptionsData.Options.RightClickAction = {
	{ value = "Build", text = T{383281603855, "Build Menu"}},
	{ value = "Move", text = T{3560, "Move Units"}},
	{ value = "Both", text = T{3561, "Both"}},
}

OptionsData.Options.MaxFps = {
	{ value = "30", text = Untranslated("30 ") .. T{3558, --[[options: frame limit]] "FPS"}, hr = { MaxFps = 30 } },
	{ value = "60", text = Untranslated("60 ") .. T{3558, --[[options: frame limit]] "FPS"}, hr = { MaxFps = 60 } },
	{ value = "120", text = Untranslated("120 ") .. T{3558, --[[options: frame limit]] "FPS"}, hr = { MaxFps = 120 } },
	{ value = "144", text = Untranslated("144 ") .. T{3558, --[[options: frame limit]] "FPS"}, hr = { MaxFps = 144 } },
	{ value = "240", text = Untranslated("240 ") .. T{3558, --[[options: frame limit]] "FPS"}, hr = { MaxFps = 240 } },
	{ value = "Unlimited", text = T{9718, --[[options: frame limit]] "Unlimited"}, hr = { MaxFps = 0 } },
}

OptionsData.Options.SSAO = {
	{ value = "Off", text = T{6844, "Off"}, hr = { EnableScreenSpaceAmbientObscurance = 0 } },
	{ value = "On", text = T{6847, "On"}, hr = { EnableScreenSpaceAmbientObscurance = 1 } },
}

OptionsData.Options.AutosaveInterval = {
	{ value = 1,  text = T{4111, "1 Sol"} },
	{ value = 2,  text = T{10072, "<number> Sols", number = 2} },
	{ value = 3,  text = T{10072, "<number> Sols", number = 3} },
	{ value = 5,  text = T{10072, "<number> Sols", number = 5} },
	{ value = 10, text = T{10072, "<number> Sols", number = 10} },
}

OptionsData.Options.AutosaveCount = {
	{ value = 1,  text = T{10073, "1 Autosave"} },
	{ value = 2,  text = T{10074, "<number> Autosaves", number = 2} },
	{ value = 3,  text = T{10074, "<number> Autosaves", number = 3} },
	{ value = 5,  text = T{10074, "<number> Autosaves", number = 5} },
	{ value = 10, text = T{10074, "<number> Autosaves", number = 10} },
}

-- storage is "local", "account", "session"
-- items is Options.OptionsData[id], if not specified

local function FilterNonConsole()
	return not Platform.console
end

local function FilterConsole()
	return Platform.console
end

local function FilterHide()
	return false
end

function OnMsg.ClassesGenerate(classdefs) 
	classdefs.OptionsObject.properties = {
		-- Video
		{ name = T{3567, "Preset"}, id = "VideoPreset", category = "Video", storage = "local", editor = "dropdown", default = "High", refresh_all = true },
		{ name = T{3568, "Shadows"}, id = "Shadows", category = "Video", storage = "local", editor = "dropdown", default = "High" },
		{ name = T{3569, "Textures"}, id = "Textures", category = "Video", storage = "local", editor = "dropdown", default = "High" },
		{ name = T{3570, "Anisotropy"}, id = "Anisotropy", category = "Video", storage = "local", editor = "dropdown", default = "4x" },
		{ name = T{904, "Terrain"}, id = "Terrain", category = "Video", storage = "local", editor = "dropdown", default = "High" },
		{ name = T{3571, "Effects"}, id = "FXDetailThresholds", category = "Video", storage = "local", editor = "dropdown", default = "High" },
		{ name = T{3572, "Lights"}, id = "Lights", category = "Video", storage = "local", editor = "dropdown", default = "High" },
		{ name = T{3573, "Postprocessing"}, id = "Postprocess", category = "Video", storage = "local", editor = "dropdown", default = "High", filter = FilterHide },
		{ name = T{3574, "Bloom"}, id = "Bloom", category = "Video", storage = "local", editor = "dropdown", display_as_bool = true, default = "On" },
		{ name = T{8034, "Eye Adaptation"}, id = "EyeAdaptation", category = "Video", storage = "local", editor = "dropdown", display_as_bool = true, default = "On" },
		{ name = T{3455, "Vignette"}, id = "Vignette", category = "Video", storage = "local", editor = "dropdown", display_as_bool = true, default = "On" },
		{ name = T{10075, "SSAO"}, id = "SSAO", category = "Video", storage = "local", editor = "dropdown", display_as_bool = true, default = "On" },
		{ name = T{3575, "Antialiasing"}, id = "Antialiasing", category = "Video", storage = "local", editor = "dropdown", default = "FXAA" },
		{ name = T{3576, "View Distance"}, id = "ViewDistance", category = "Video", storage = "local", editor = "dropdown", default = "High" },
		{ name = T{7772, "Object Detail"}, id = "ObjectDetail", category = "Video", storage = "local", editor = "dropdown", default = "High" },
		{ name = T{3577, "Resolution Percent"}, id = "ResolutionPercent", category = "Video", storage = "local", editor = "dropdown", default = "100" },
		{ name = T{3578, "Framerate Counter"}, id = "FPSCounter", category = "Video", storage = "local", editor = "dropdown", default = "Off" },
		
		-- Audio
		{ name = T{3579, "Master Volume"}, id = "MasterVolume", category = "Audio", storage = "local", editor = "number", min = 0, max = 1000, slider = true, default = 500, step = 50 },
		{ name = T{3580, "Music"}, id = "Music", category = "Audio", storage = "local", editor = "number", min = 0, max = 1000, slider = true, default = 1000, step = 50 },
		{ name = T{3581, "Sounds"}, id = "Sound", category = "Audio", storage = "local", editor = "number", min = 0, max = 1000, slider = true, default = 1000, step = 50 },
		{ name = T{7811, "Voice"}, id = "Voice", category = "Audio", storage = "local", editor = "number", min = 0, max = 1000, slider = true, default = 1000, step = 50 },
		{ name = T{3582, "Mute when Minimized"}, id = "MuteWhenMinimized", category = "Audio", storage = "local", editor = "bool", default = true, filter = FilterNonConsole, },
		{ name = T{3583, "Radio Station"}, id = "RadioStation", category = "Audio", editor = "bool", no_edit = true, default = "SurvivingMars" },
		
		-- Account
		{ name = T{3584, "Invert Mouse Wheel"}, id = "InvertMouseWheel", category = "Controls", storage = "account", editor = "bool", default = false, filter = FilterNonConsole,},
		{ name = T{3585, "Invert Look"}, id = "InvertLook", category = "Controls", storage = "account", editor = "bool", default = false},
		{ name = T{3586, "Invert Rotation"}, id = "InvertRotation", category = "Controls", storage = "account", editor = "bool", default = false},
		{ name = T{3587, "Scroll Outside Window"}, id = "MouseScrollOutsideWindow", category = "Controls", storage = "account", editor = "bool", default = true, filter = FilterNonConsole,},
		{ name = T{3588, "Right-click Action"}, id = "RightClickAction", category = "Controls", storage = "account", editor = "dropdown", default = "Both", filter = FilterNonConsole,},
		{ name = T{3589, "Controller"}, id = "Gamepad", category = "Controls", storage = "account", editor = "bool", default = Platform.console and true or false, filter = FilterNonConsole,},
		{ name = T{3590, "Camera Movement Speed"}, id = "CameraMoveSpeed", category = "Controls", storage = "account", editor = "number", min = 5, max = 20, slider = true, default = const.DefaultCameraRTS.MoveSpeedNormal},
		
		--Gameplay
		--{ name = T{"Subtitles"}, id = "Subtitles", category = "Gameplay", storage = "account", editor = "bool", default = true},
		{ name = T{3591, "Autosave"}, id = "Autosave", category = "Gameplay", storage = "account", editor = "bool", default = true},
		{ name = T{10077, "Autosave Count"}, id = "AutosaveCount", category = "Gameplay", storage = "account", editor = "dropdown", default = const.DefaultAutosaveCount, filter = FilterNonConsole,},
		{ name = T{10078, "Autosave Interval"}, id = "AutosaveInterval", category = "Gameplay", storage = "account", editor = "dropdown", default = const.DefaultAutosaveInterval},
		{ name = T{3592, "Hint Notifications"}, id = "HintsEnabled", category = "Gameplay", storage = "account", editor = "bool", default = true},
		{ name = T{9764, "Infobar"}, id = "InfobarEnabled", category = "Gameplay", storage = "account", editor = "bool", default = true},
		{ name = T{7544, "Display Area Margin"}, id = "DisplayAreaMargin", category = "Gameplay", storage = "local", editor = "number", min = 0, max = 10, slider = true, default = 0, filter = function() return Platform.developer or Platform.durango end },
		--{ name = T{"Colorblind Mode"}, id = "Colorblind", category = "Gameplay", storage = "account", editor = "bool", default = false},
		{ name = T{8529, "Save to Cloud"}, id = "AutosaveToCloud", category = "Gameplay", storage = "account", editor = "bool", default = false, filter = function() return IsParadoxPlatform() end },
		
		{ name = T{1000102, "Language"}, id = "Language", category = "Gameplay", storage = "account", editor = "dropdown", default = "English", filter = FilterNonConsole, },
		
		-- Display
		{ name = T{3562, "Fullscreen Mode"}, id = "FullscreenMode", category = "Display", storage = "local", editor = "dropdown", default = 0, refresh_all = true },
		{ name = T{1601, "Resolution"}, id = "Resolution", category = "Display", storage = "local", editor = "dropdown", default = point(1920, 1080) },
		{ name = T{3563, "Refresh Rate"}, id = "RefreshRate", category = "Display", storage = "local", editor = "dropdown", default = 0 },
		{ name = T{3564, "Vsync"}, id = "Vsync", category = "Display", storage = "local", editor = "bool", default = true },
		{ name = T{9714, "Frame Rate Limit"}, id = "MaxFps", category = "Display", storage = "local", editor = "dropdown", default = "240", },
		{ name = T{3565, "UI Scale"}, id = "UIScale", category = Platform.console and "Gameplay" or "Display", storage = "local", editor = "number", min = 65, max = const.MaxUserUIScaleHighRes, slider = true, default = 100, step = 5, snap_offset = 5 },
		{ name = T{3566, "Brightness"}, id = "Brightness", category = "Display", storage = "local", editor = "number", min = -50, max = 1050, slider = true, default = 500, step = 50, snap_offset = 50 },
	}
end

function OptionsObject:GetShortcuts()
	self.shortcuts = {}
	self.props_cache = false
	if Platform.console then
		return 
	end
	local actions = XShortcutsTarget and XShortcutsTarget.actions
	if actions then
		for _, action in ipairs(actions) do
			if action.ActionBindable then
				local id = action.ActionId
				local defaultActions = false
				if action.ActionShortcut and action.ActionShortcut ~= "" then
					defaultActions = defaultActions or {}
					defaultActions[1] = action.ActionShortcut
				end
				if action.ActionShortcut2 and action.ActionShortcut2 ~= "" then
					defaultActions = defaultActions or {}
					defaultActions[2] = action.ActionShortcut2
				end
				if action.ActionGamepad and action.ActionGamepad ~= "" then
					defaultActions = defaultActions or {}
					defaultActions[3] = action.ActionGamepad
				end
				self[id] = defaultActions
				self["shortcuts"][#self["shortcuts"]+1] =
					{ name = action.ActionName,
						id = id,
						category = "Keybindings",
						storage = "shortcuts",
						editor = "hotkey",
						keybinding = true,
						default = defaultActions,
						mouse_bindable = action.ActionMouseBindable,
						single_key = action.ActionBindSingleKey,
					}
			end
		end
	end
end

function OptionsObject:GetProperties()
	if self.props_cache then
		return self.props_cache
	end
	local props = {}
	local static_props = PropertyObject.GetProperties(self)
	-- add building hotkeys
	if not self["shortcuts"] or not next(self["shortcuts"]) then	
		self:GetShortcuts()
   end
	props = table.copy(static_props,"deep")
	props = table.append(props,self["shortcuts"])
	self.props_cache = props
	return props
end
	
GlobalVar("g_SessionOptions", {}) -- session options in savegame-type games are just a table in the savegame

-- override this in project-specific code to tweak engine options per map
function ApplyMapEngineSettings(map)
end


function OptionsObject:SetMasterVolume(x)
	self.MasterVolume = x
	self:SetSound(self.Sound)
	self:SetMusic(self.Music)
	self:SetVoice(self.Voice)
end

function OptionsObject:SetSound(x)
	self.Sound = x
	SetOptionVolume("Sound", x * self.MasterVolume / 1000)
end

function OptionsObject:SetMusic(x)
	self.Music = x
	SetOptionVolume("Music", x * self.MasterVolume / 1000)
end

function OptionsObject:SetVoice(x)
	self.Voice = x
	SetOptionVolume("Voice", x * self.MasterVolume / 1000)
end

function OptionsObject:SetRadioStation(station)
	local old = self.RadioStation
	if old ~= station then
		self.RadioStation = station
		StartRadioStation(station)
	end
end

function OptionsObject:SetMuteWhenMinimized(x)
	self.MuteWhenMinimized = x
	config.DontMuteWhenInactive = not x
end

function OptionsObject:SetBrightness(x)
	self.Brightness = x
	ApplyBrightness(x)
end

local function UpdateUIStyleGamepad(gamepad)
	gamepad = gamepad and IsXInputControllerConnected() or Platform.console or false
	ChangeGamepadUIStyle({ gamepad })
end

local function UpdateHintsOption(hints_enabled)
	hints_enabled = not g_Tutorial and hints_enabled or false
	if HintsEnabled ~= hints_enabled then
		if mapdata.GameLogic and hints_enabled then
			CreateGameTimeThread(PeriodicHintChecks)
		end
		HintsEnabled = hints_enabled
	end
end

function ApplyProjectAccountOptions()
	if AccountStorage then
		local options = AccountStorage.Options
		hr.CameraRTSScrollOutsideWindow = options.MouseScrollOutsideWindow == false and 0 or 1
		hr.InvertMouseWheel = options.InvertMouseWheel and 1 or -1
		const.CameraControlInvertLook = options.InvertLook
		const.CameraControlInvertRotation = options.InvertRotation
		UpdateUIStyleGamepad(options.Gamepad)
		UpdateHintsOption(options.HintsEnabled)
		UpdateInfobarVisibility()
		
		cameraRTS.SetProperties(1, {MoveSpeedNormal = options.CameraMoveSpeed or const.DefaultCameraRTS.MoveSpeedNormal, MoveSpeedFast = options.CameraMoveSpeed and options.CameraMoveSpeed * 2 or const.DefaultCameraRTS.MoveSpeedFast})
	end
end

local function RecursiveUpdateTTexts(root)
	if IsKindOf(root, "XTranslateText") and root.Translate and IsT(root:GetText()) then
		root:SetText(root:GetText())
		root:SetTextFont(root:GetTextFont())
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
			Unmount("CurrentLanguage") --remount 'CurrentPath'
			MountLanguage()
			LoadTranslationTables() --reload loc table
			RecursiveUpdateTTexts(terminal.desktop) --update all translated texts
		end
	end
end

function ApplyBrightness(val)
	val = val or EngineOptions.Brightness
	if val then
		hr.DisplayGamma = 1500 - val
	end
end

--reload account options when reloading Lua
function OnMsg.Autorun()
	ApplyPreset(EngineOptions.VideoPreset)
	ApplyProjectAccountOptions()
end

--reload account options when we get new account storage, something that happens on the durango
function OnMsg.AccountStorageChanged()
	if Platform.console and AccountStorage then
		ApplyPreset(EngineOptions.VideoPreset)
	end
	if AccountStorage and next(AccountStorage.Shortcuts) then
		ReloadShortcuts()
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

if FirstLoad then
	ApplyBrightness()
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

function OnMsg.LoadingScreenPreClose()
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
	end
end