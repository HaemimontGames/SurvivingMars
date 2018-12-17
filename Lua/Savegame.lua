const.AutosavePeriod = const.DayDuration * 5 --save compat with rev 225026 saves

function GetSavegameScreenshotParams()
	local screen_sz = UIL.GetScreenSize()
	local screen_w, screen_h = screen_sz:x(), screen_sz:y()
	local src = box(point20, screen_sz)
	if GetInGameInterfaceMode() == "overview" then
		local pos, lookat = CalcOverviewCameraPos()
		local c_width, c_height = CalcOverviewCurtainsSize(pos, lookat, screen_w, screen_h)
		src = box(c_width, c_height, screen_w - c_width, screen_h - c_height)
	end
	return MulDivRound(Savegame.ScreenshotHeight, src:sizex(), src:sizey()), Savegame.ScreenshotHeight, src
end

function WaitCaptureSavegameScreenshot(path)
	local width, height, src = GetSavegameScreenshotParams()
	local _, filename, ext = SplitPath(Savegame.ScreenshotName)
	local file_path = string.format("%s%s%dx%d%s", path, filename, width, height, ext)
	table.change(hr, "Savegame_BackgroundBlur", {
		EnablePostProcScreenBlur = 0
	})
	WaitNextFrame(2)
	local err = WaitCaptureScreenshot(file_path, {interface = false, width = width, height = height, src = src})
	table.restore(hr, "Savegame_BackgroundBlur")
	return err, file_path
end

local function SaveCallback(folder)
	assert(CurrentMap ~= "")
	local err = PersistGame(folder)
	local render_mode = GetRenderMode()
	if render_mode ~= "scene" then
		WaitRenderMode("scene")
	end
	if not err then
		WaitCaptureSavegameScreenshot(folder)
	end
	WaitRenderMode(render_mode)
	return err
end

function GetLoadedModsSavegameData()
	local active_mods = l_LoadGameMeta and l_LoadGameMeta.active_mods or {}
	for _, mod in ipairs(ModsLoaded or empty_table) do
		local idx = table.find(active_mods, "id", mod.id) or (#active_mods + 1)
		active_mods[idx] = {
			id = mod.id,
			title = mod.title,
			version = mod.version,
			lua_revision = mod.lua_revision,
		}
	end
	return active_mods
end

function GetMissingMods(active_mods, max_mods)
	--check if any mods are missing or outdated
	local mods_list, more = {}
	for _, mod in ipairs(active_mods or empty_table) do
		--mod is a table, containing id, title, version and lua_revision or is just the id in older saves
		local local_mod = table.find_value(ModsLoaded, "id", mod.id or mod) or (Mods and Mods[mod.id or mod])
		if (mod.lua_revision or 0) > LuaRevision
			or not local_mod or not table.find(AccountStorage.LoadMods, mod.id or mod)
			or (local_mod and local_mod.version < (mod.version or 0)) then
			if #mods_list >= max_mods then
				more = true
				break
			end
			mods_list[#mods_list + 1] = mod.title or (local_mod and local_mod.title)
		end
	end
	return mods_list, more
end

local function GatherGameMetadata()
	assert(LuaRevision and LuaRevision ~= 0, "LuaRevision should never be 0 at this point")
	local metadata = {
		map = GetMapName(),
		latitude = g_CurrentMapParams.latitude,
		longitude = g_CurrentMapParams.longitude,
		elapsed_sols = UICity.day,
		mission_sponsor_id = g_CurrentMissionParams.idMissionSponsor,
		commander_profile_id = g_CurrentMissionParams.idCommanderProfile,
		active_mods = GetLoadedModsSavegameData(),
		paradox_user_hash = g_ParadoxHashedUserId or nil,
		active_game_rules = g_CurrentMissionParams.idGameRules,
	}
	return metadata
end

function DeleteGame(name)
	local err = Savegame.Delete(name)
	if not err then
		EnqueuePopsCloudAction({
			action = "delete",
			savename = name,
		})
		ObjModified(g_SaveGameObj)
	end
	return err
end

function SaveGame(display_name)
	local metadata = GatherGameMetadata()
	LoadingScreenOpen("idLoadingScreen", "save savegame")
	WaitRenderMode("ui")
	local err, name = Savegame.WithTag("savegame", display_name, SaveCallback, metadata)
	WaitRenderMode("scene")
	LoadingScreenClose("idLoadingScreen", "save savegame")
	if not err then
		EnqueuePopsCloudAction({
			action = "upload",
			savename = name,
		})
	end
	return err, name
end

function SaveAutosaveGame(display_name)
	local metadata =  GatherGameMetadata()
	metadata.autosave = true
	local err, name = Savegame.WithTag("savegame", display_name, SaveCallback, metadata)
	if not err then
		EnqueuePopsCloudAction({
			action = "upload",
			savename = name,
		})
	end
	return err, name
end

if FirstLoad then
	l_LoadGameMeta = false
end

function OnMsg.DoneMap()
	l_LoadGameMeta = false
end
GlobalVar("SavegameBroken", false)

local function LoadCallback(folder)
	local broken = false
	local err, metadata = LoadMetadata(folder)
	if not err then
		if metadata.dlcs then
			for _, dlc in ipairs(metadata.dlcs) do
				if not IsDlcAvailable(dlc.id) then
					if Platform.developer then
						if WaitMarsQuestion(GetLoadingScreenDialog() or terminal.desktop, 
							T(6851, "Warning"), T(8081, "The game can not be loaded because some required downloadable content is not installed."),
							T(3686, "Load anyway"),
							T(3687, "Cancel")) == "cancel" then
							return "user cancelled"
						end
						broken = true
					else
						WaitMarsMessage(GetLoadingScreenDialog() or terminal.desktop, T(6851, "Warning"), T(8081, "The game can not be loaded because some required downloadable content is not installed."), T(1000136, "OK"))
						return "missing dlc"
					end
				end
			end
		end
		if (metadata.lua_revision or 0) < config.SupportedSavegameLuaRevision then
			if WaitMarsQuestion(GetLoadingScreenDialog() or terminal.desktop, 
				T(6851, "Warning"), T(3685, "This savegame is from an old version and may not function properly."),
				T(3686, "Load anyway"),
				T(3687, "Cancel")) == "cancel" then
				return "user cancelled"
			end
			broken = true
		end
		local mods_list, more = GetMissingMods(metadata.active_mods, 3)
		if #mods_list > 0 then
			local mods_string = table.concat(mods_list, "\n")
			if more then
				mods_string = mods_string .. "\n..."
			end
			if WaitMarsQuestion(GetLoadingScreenDialog() or terminal.desktop, 
				T(6851, "Warning"), T{8082, "The following mods are missing or outdated:\n\n<mods>\n\nSome features may not work.", mods = Untranslated(mods_string)},
				T(3686, "Load anyway"),
				T(3687, "Cancel")) == "cancel" then
				return "user cancelled"
			end
			broken = true
		end
		local sponsor = metadata.mission_sponsor_id and Presets.MissionSponsorPreset.Default[metadata.mission_sponsor_id]
		if sponsor then
			local allowed, reason = sponsor:filter()
			if not allowed then
				return reason or "not available"
			end
		end
	end
	TelemetryEndSession("load")
	ChangeMap("")
	err = err or UnpersistGame(folder, metadata)
	if err then
		return err
	end
	if CurrentMap == "" then
		CurrentMap = "loaded game"
	end
	l_LoadGameMeta = metadata
	if not broken and SavegameBroken then
		WaitMarsMessage(GetLoadingScreenDialog() or terminal.desktop, T(6851, "Warning"), T(10888, "This savegame was loaded in the past without required mods or with an incompatible game version. It may not function properly."), T(1000136, "OK"))
	end
	SavegameBroken = SavegameBroken or broken
end

function OnMsg.BugReportStart(print_func)
	if l_LoadGameMeta and l_LoadGameMeta.lua_revision then
		local supported = l_LoadGameMeta.lua_revision >= config.SupportedSavegameLuaRevision
		print_func("Game Loaded Lua Rev:", l_LoadGameMeta.lua_revision, supported and "" or "(unsupported!)")
	end
end

function LoadGame(savename)
	LoadingScreenOpen("idLoadingScreen", "load savegame")
	WaitRenderMode("ui")
	local err = Savegame.Load(savename, LoadCallback)
	local loaded_map = GetMap()
	if loaded_map ~= "" then
		WaitRenderMode("scene")
	end
	if not err then
		RestoreInGameInterfaceOnLoadGame()
	end
	LoadingScreenClose("idLoadingScreen", "load savegame")
	return err
end

local function SaveCallbackBugReport(folder)
	local err = PersistGame(folder)
	if not err then
		WaitCaptureSavegameScreenshot(folder)
	end
	return err
end

function SaveGameBugReport(display_name, screenshot)
	local metadata =  GatherGameMetadata()
	local err, name = Savegame.WithTag("savegame", display_name, SaveCallbackBugReport, metadata)
	return err, name
end

local old_can_save = CanSaveGame
function CanSaveGame()
	if old_can_save() then
		local igi = GetInGameInterface()
		if igi and igi.mode_dialog:IsKindOf("UnitDirectionModeDialog") then
			return "persist"
		end
	end
	return false
end

local function SetNextAutosaveSol()
	g_NextAutosaveSol = UICity.day + AccountStorage.Options.AutosaveInterval
end

function OnMsg.GameOptionsChanged(category)
	if GameState.gameplay and category == "Gameplay" and g_NextAutosaveSol > UICity.day + AccountStorage.Options.AutosaveInterval then
		SetNextAutosaveSol()
	end
end

function Autosave()
	if Platform.demo or GameState.multiplayer or not AccountStorage.Options.Autosave or g_Tutorial or Platform.pgo_train then
		SetNextAutosaveSol()
		return
	end
	
	while not CanSaveGame() do
		Sleep(1000)
	end
	
	Msg("AutosaveStart")
	
	LoadingScreenOpen("idAutosaveScreen", "save savegame")
	SetNextAutosaveSol()
	--make sure the ingame interface is in a UnitDirection Mode before saving
	--switch to selection mode if needed
	local igi = GetInGameInterface()
	if igi and not igi.mode_dialog:IsKindOf("UnitDirectionModeDialog") then
		igi:SetMode("selection")
	end
	
	local err, list = Savegame.ListForTag("savegame")

	-- 1. Get a list of autosaves
	local autosaves = {}
	if not err then
		for _, v in ipairs(list) do
			err = GetFullMetadata(v)
			if not err and v.autosave then
				autosaves[#autosaves + 1] = v.savename
			end
		end
	end
	local display_name = _InternalTranslate(T{3688, "Autosave Sol <current_sol>", current_sol = UICity.day})

	-- 2. Save
	err = SaveAutosaveGame(display_name)
	-- ATTN: delay closing the saving screen until we delete the old autosaves
	
	Msg("AutosaveEnd")
	
	if err then
		LoadingScreenClose("idAutosaveScreen", "save savegame")
		local preset
		if err == "Disk Full" or err == "orbis1gb" then
			preset = Platform.ps4 and "AutosaveFailedNoSpacePS4" or "AutosaveFailedNoSpace"
		else
			preset = "AutosaveFailedGeneric"
		end
		WaitPopupNotification(preset, {error_code = T{err}})
		return 
	end
	
	-- 3. Leave only the last two savegames (i.e. only the last one in the list)
	--		no error handler, since this is not a user-initiated action, and we've done our main job already
	for i=AccountStorage.Options.AutosaveCount, #autosaves do
		DeleteGame(autosaves[i])
	end
	
	LoadingScreenClose("idAutosaveScreen", "save savegame")
end

GlobalVar("g_NextAutosaveSol", 0)

local function WaitTryAutosave()
	WaitMsg("NewDay")
	if UICity.day == g_NextAutosaveSol then
		CreateRealTimeThread(Autosave)
	end
end

function OnMsg.PersistLoad(data)
	if g_NextAutosaveSol == UICity.day + 1 then
		g_NextAutosaveSol = g_NextAutosaveSol + 1
	elseif not g_NextAutosaveSol or g_NextAutosaveSol <= UICity.day then
		SetNextAutosaveSol()
	end
end

GlobalGameTimeThread("AutosaveThread", function()
	if GameState.multiplayer then return end
	SetNextAutosaveSol()
	while true do
		WaitTryAutosave()
	end
end)