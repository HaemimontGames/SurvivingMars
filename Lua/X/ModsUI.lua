if Platform.ps4 then return end
if FirstLoad then
	g_InitialMods = false
	g_ParadoxModsContextObj = false
	g_PopsDownloadModsQueue = false
	g_PopsDownloadModsScreenshotsQueue = false
	g_PopsRetrieveModDetailsThread = false
	g_PopsRateFlagThread = false
	g_PopsEnableModThread = false
	g_PopsDisableAllModsThread = false
	DurangoUserContentDisabledWarningShown = false
	g_PopsDownloadingMods = {}
	g_PopsUninstallingMods = {}
	g_PopsModsUISearchPlatform = Platform.durango and "xbox_one" or "windows"
end

local function case_insensitive_pattern(pattern)
  -- find an optional '%' (group 1) followed by any character (group 2)
  local p = pattern:gsub("(%%?)(.)", function(percent, letter)
    if percent ~= "" or not letter:match("%a") then
      -- if the '%' matched, or `letter` is not a letter, return "as is"
      return percent .. letter
    else
      -- else, return a case-insensitive character class of the matched letter
      return string.format("[%s%s]", letter:lower(), letter:upper())
    end
  end)
  return p
end

function TurnModOn(id)
	table.insert_unique(AccountStorage.LoadMods, id)
end

function TurnModOff(id)
	table.remove_entry(AccountStorage.LoadMods, id)
end

function AllModsOff()
	table.clear(AccountStorage.LoadMods)
end

function ModsUIDialogStart()
	AccountStorage.LoadMods = AccountStorage.LoadMods or {}
	local initial_mods = AccountStorage.LoadMods
	--remove from account storage mods that have been removed from the machine
	for i = #initial_mods, 1, -1 do
		if not Mods[initial_mods[i]] then
			table.remove(initial_mods, i)
		end
	end
	g_InitialMods = table.copy(initial_mods)
end

local function ModsUIDialogClose(dialog)
	dialog:SetMode("")
	SaveAccountStorage(5000)
	g_InitialMods = false
end

function ModsUIDialogEnd(dialog)
	local new_mods = AccountStorage.LoadMods or empty_table
	ModsReloadDefs()
	if not table.is_iequal(new_mods, g_InitialMods or empty_table) then
		dialog:DeleteThread("warning")
		dialog:CreateThread("warning", function()
			local exit_choice = true
			if #new_mods > 0 then
				local choice = WaitMarsQuestion(dialog, 
							T(6899, "Warning"), 
							T(4164, "Mods are player created software packages that modify your game experience. USE THEM AT YOUR OWN RISK! We do not examine, monitor, support or guarantee this user created content. You should take all precautions you normally take regarding downloading files from the Internet before using mods."), 
							T(6900, "OK"), 
							T(4165, "Back"),
							nil,
							nil,
							GetErrorTemplate(nil, "pops")
				)
				exit_choice = (choice == "ok")
			end
			if exit_choice then
				LoadingScreenOpen("idLoadingScreen", "reload mods")
				SaveAccountStorage(5000)
				ModsReloadItems()
				ModsUIDialogClose(dialog)
				LoadingScreenClose("idLoadingScreen", "reload mods")
			end
		end)
	else
		ModsUIDialogClose(dialog)
	end
end

local function ClearInstalledModsCorruptedStatus()
	local obj = g_ParadoxModsContextObj
	if obj then
		for _, mod in ipairs(obj.installed_mods) do
			mod.Corrupted = nil
			mod.Warning = nil
			mod.Warning_id = nil
			local browse_mod = table.find_value(obj.mods, "ModID", mod.ModID)
			if browse_mod then
				browse_mod.Corrupted = nil
				browse_mod.Warning = nil
				browse_mod.Warning_id = nil
			end
		end
	end
end

function ModsUIGetModCorruptedStatus(mod)
	--check for missing dependencies
	local dependency_data = ModDependencyGraph[mod.id]
	if dependency_data then
		local incompatible, soft_missing, hard_missing
		for _, dep in ipairs(dependency_data.outgoing_failed or empty_table) do
			local dependency_mod = Mods[dep.id]
			local _, fail_reason = dep:ModFits(dependency_mod)
			if fail_reason == "no mod" or fail_reason == "different mod" then
				if dep.required then
					hard_missing = true
				else
					soft_missing = true
				end
			elseif fail_reason == "incompatible" then
				incompatible = true
			end
		end
		if hard_missing then
			return false, T(12446, "Missing dependency"), "hard_missing"
		elseif incompatible then
			return false, T(12606, "The required dependency is outdated"), "incompatible"
		elseif soft_missing then
			return false, T(12446, "Missing dependency"), "soft_missing"
		end
		--check for disabled dependencies
		for _, dep in ipairs(dependency_data.outgoing or empty_table) do
			if not table.find(AccountStorage.LoadMods, dep.id) then
				return false, T(12447, "Disabled dependencies"), "dependencies_disabled"
			end
		end
	end
	if mod:IsTooOld() then
		return true, T(10931, "Incompatible mod version."), "too_old"
	elseif mod:IsTooNew() then
		return false, T(10932, "Check for a game update!"), "too_new"
	end
	return false
end

function ModsUIIsModCompatible(mod)
	local version = tonumber(mod.RequiredVersion)
	return version >= ModMinLuaRevision and version <= LuaRevision
end

local PopsModsUISortItems = false

function GetPopsModsUISortItems(mode)
	PopsModsUISortItems = PopsModsUISortItems or {}
	if PopsModsUISortItems[mode] then return PopsModsUISortItems[mode] end
	local items = {}
	items[#items + 1] = {id = "displayName_asc",  name = T(12402, "Alphabetically (A-Z)"), name_uppercase = T(12403, "ALPHABETICALLY (A-Z)")}
	items[#items + 1] = {id = "displayName_desc", name = T(12404, "Alphabetically (Z-A)"), name_uppercase = T(12405, "ALPHABETICALLY (Z-A)")}
	if mode == "installed" then
		items[#items + 1] = {id = "enabled_desc",  name = T(10973, "Enabled first"), name_uppercase = T(10991, "ENABLED FIRST")}
		items[#items + 1] = {id = "enabled_asc", name = T(10974, "Disabled first"), name_uppercase = T(10992, "DISABLED FIRST")}
	end
	if not (Platform.durango and not DurangoAllowUserCreatedContent) then
		items[#items + 1] = {id = "created_asc",       name = T(10937, "Oldest first"),         name_uppercase = T(10938, "OLDEST FIRST")}
		items[#items + 1] = {id = "created_desc",      name = T(10939, "Most recent first"),    name_uppercase = T(12300, "MOST RECENT FIRST")}
		items[#items + 1] = {id = "rating_asc",        name = T(10941, "Rating (ASC)"),         name_uppercase = T(10942, "RATING (ASC)")}
		items[#items + 1] = {id = "rating_desc",       name =  T(10943, "Rating (DESC)"),       name_uppercase = T(10944, "RATING (DESC)")}
	end
	PopsModsUISortItems[mode] = items
	return items
end

function ModsUIChooseSort(parent)
	local dlg = GetDialog(parent)
	local obj = dlg.context
	obj.popup_shown = "sort"
	local wnd = XTemplateSpawn("ModsUISortFilter", parent, obj)
	wnd:Open()
	wnd.idTitle:SetText(T(10124, "Sort"))
	return wnd
end

function ModsUIChooseFilter(parent)
	local dlg = GetDialog(parent)
	local obj = dlg.context
	obj.popup_shown = "filter"
	obj.temp_only_compatible = obj.only_compatible
	obj.temp_only_compatible_installed = obj.only_compatible_installed
	local wnd = XTemplateSpawn("ModsUISortFilter", parent, obj)
	wnd:Open()
	table.clear(obj.temp_tags)
	for k,v in pairs(obj.set_tags) do
		obj.temp_tags[k] = v
	end
	wnd.idTitle:SetText(T(10426, "Filter by"))
end

if FirstLoad then
	ModsUIGameCompatibleTagContext = {}
end

function ModsUIClearFilter(mode)
	local obj = g_ParadoxModsContextObj
	if not obj then return end
	local t = mode == "browse" and "temp_tags" or "temp_installed_tags"
	t = obj[t]
	local changed = next(t)
	table.clear(t)
	for _, item in ipairs(PredefinedModTags) do
		ObjModified(item)
	end
	local temp_compatible = mode == "browse" and "temp_only_compatible" or "temp_only_compatible_installed"
	if obj[temp_compatible] then
		obj[temp_compatible] = false
		changed = true
		ObjModified(ModsUIGameCompatibleTagContext)
	end
	return changed
end

function ModsUIToggleSortPC(parent)
	local dlg = GetDialog(parent)
	local label = dlg:ResolveId("idCtrlsSort")
	
	local txt = dlg:ResolveId("idSortLabel")
	local btn = dlg:ResolveId("idSortButton")
	local back = dlg:ResolveId("idSortBack")
	local img = btn.idSortTriangle

	local obj = dlg.context
	if obj.popup_shown == "sort" then
		back:SetVisible(false)
		txt:SetTextStyle("ModsUISortTitle")
		btn:SetTextStyle("ModsUISortText")
		img:SetRow(1)
		ModsUIClosePopup(dlg)
		return
	end
	back:SetVisible(true)
	txt:SetTextStyle("ModsUISortTitlePopupShown")
	btn:SetTextStyle("ModsUISortTextPopupShown")
	img:SetRow(2)

	obj.popup_shown = "sort"
	local wnd = XTemplateSpawn("ModsUIPopupPC", parent, obj)
	wnd:Open()
	wnd:SetAnchor(label.box)	
	return wnd
end

function ModsUIChooseFlagReason(parent)
	local dlg = GetDialog(parent)
	local obj = dlg.context
	local context = dlg.mode_param
	local wnd = XTemplateSpawn("ModsUIFlag", parent, context)
	wnd:Open()
	obj.popup_shown = "flag"
	wnd.idTitle:SetText(T{12406, "Report <ModName>", ModName = Untranslated(context.DisplayName)})
end

function ModsUIFlagMod(win)
	g_PopsRateFlagThread = IsValidThread(g_PopsRateFlagThread) and g_PopsRateFlagThread or CreateRealTimeThread(function(win)
		local dlg = GetDialog(win)
		local obj = dlg.context
		local context = dlg.mode_param
		local description = {
			ModID = context.ModID,
			Reason = context.flag_reason,
			Description = context.flag_description
		}
		local err = AsyncOpWait(PopsAsyncOpTimeout, nil, "AsyncPopsModsReport", description)
		context.flag_reason = nil
		context.flag_description = nil
		ModsUIClosePopup(win)
		local wnd = XTemplateSpawn("ModsUIFlagThankYou", dlg.idContentWrapper)
		wnd:Open()
		obj.popup_shown = "flagged"
		local host = GetActionsHost(dlg)
		host:UpdateActionViews(host)
	end, win)
end

function ModsUIChooseModRating(parent)
	CreateRealTimeThread(function(parent)
	local dlg = GetDialog(parent)
	local obj = dlg.context
	local context = dlg.mode_param
	local err, mod_details = AsyncOpWait(PopsAsyncOpTimeout, nil, "AsyncPopsModsGetDetails", context.ModID, g_PopsModsUISearchPlatform)
	context.rating = mod_details.Rating
	local wnd = XTemplateSpawn("ModsUIRate", parent, context)
	wnd:Open()
	obj.popup_shown = "rate"
	wnd.idTitle:SetText(T{10385, "Rate <ModName>", ModName = Untranslated(context.DisplayName)})
	wnd.idText:SetText(T{10386, "Use the stars below to rate the <game_title> mod <ModName> by <AuthorName>", game_title = T(1079, "Surviving Mars"), ModName = Untranslated(context.DisplayName), AuthorName = Untranslated(context.Author)})
	end, parent)
end

function ModsUIRateMod(win, rating)
	g_PopsRateFlagThread = IsValidThread(g_PopsRateFlagThread) and g_PopsRateFlagThread or CreateRealTimeThread(function(win, rating)
		local dlg = GetDialog(win)
		local obj = dlg.context
		local context = dlg.mode_param
		local err = AsyncOpWait(PopsAsyncOpTimeout, nil, "AsyncPopsModsUpdateUserRating", context.ModID, rating)
		ModsUIClosePopup(win)
		local wnd = XTemplateSpawn("ModsUIRateThankYou", dlg.idContentWrapper)
		wnd:Open()
		wnd.idText:SetText(T{10388, "Your rating for <ModName> was submitted.\nThank you for helping the Paradox family.", ModName = Untranslated(context.DisplayName)})
		obj.popup_shown = "rated"
		local host = GetActionsHost(dlg)
		host:UpdateActionViews(host)
	end, win, rating)
end

function ModsUIOpenLoginPopup(parent)
	local dlg = GetDialog(parent)
	local obj = dlg.context
	obj.popup_shown = "login"
	OpenDialog("ModsUIParadoxAccount", parent)
end

function ModsUIClosePopup(win)
	local dlg = GetDialog(win)
	local obj = dlg.context
	obj.popup_shown = false
	local wnd = dlg:ResolveId("idPopUp")
	if wnd and wnd.window_state ~= "destroying" then
		wnd:Close()
		dlg:UpdateActionViews(dlg)
	end
end

function ModsUIDownloadScreenshots(mod)
	g_PopsDownloadModsScreenshotsQueue:push(mod)
end

function ModsUIInstallMod(mod, quiet)
	mod = mod or g_ParadoxModsContextObj and g_ParadoxModsContextObj:GetSelectedMod()
	if mod and not g_PopsDownloadingMods[mod.ModID] then
		CreateRealTimeThread(function()
			if not quiet and not ModsUIIsModCompatible(mod) then
				local res = WaitMarsQuestion(
					nil,
					T(6779, "Warning"),
					T{12428, "The mod <name> is not compatible with the current game version. Once installed, it might not be loaded or work correctly. Do you want to install it anyway?", name = Untranslated(mod.DisplayName)},
					T(1138, "Yes"),
					T(1139, "No"),
					nil,
					nil,
					GetErrorTemplate(nil, "pops")
				)
				if res ~= "ok" then return end
			end
			g_PopsDownloadingMods[mod.ModID] = true
			g_PopsDownloadModsQueue:push(mod)
			ObjModified(mod)
		end)
	end
end

function ModsUIUninstallMod(mod, obj_table, quiet, storage_path)
	CreateRealTimeThread(function(mod, obj_table)
		mod = mod or g_ParadoxModsContextObj and g_ParadoxModsContextObj:GetSelectedMod(obj_table)
		if not mod or g_PopsUninstallingMods[mod.ModID] then return end
		if not quiet then
			local res = WaitMarsQuestion(nil, T(6779, "Warning"), T{10945, "Do you want to uninstall the mod <ModName>?", ModName = Untranslated(mod.DisplayName)}, T(1138, "Yes"), T(1139, "No"), "UI/Messages/space.tga", nil, GetErrorTemplate(nil, "pops"))
			if res ~= "ok" then return end
			g_PopsUninstallingMods[mod.ModID] = true
		end
		local id = mod.ModID
		local err
		local logged_in = g_ParadoxAccountLoggedIn
		if logged_in and not mod.Local then
			err = AsyncOpWait(PopsAsyncOpTimeout, nil, "AsyncPopsModsUninstallMod", id)
		end
		if err then
			print(string.format("Error uninstalling mod %s: error message %s" , mod.DisplayName, err))
		else
			mod.Installed = nil
			mod.Corrupted = nil
			mod.Warning = nil
			mod.Warning_id = nil
			LocalStorage.MappedPopsModsData = LocalStorage.MappedPopsModsData or {}
			local mod_def = g_ParadoxModsContextObj and g_ParadoxModsContextObj.mod_defs[id]
			if mod_def then
				g_ParadoxModsContextObj.mod_defs[id] = nil
				local path = mod_def.path .. ModsPackFileName
				if logged_in then
					LocalStorage.MappedPopsModsData[path] = nil
				else
					local data = LocalStorage.MappedPopsModsData[path]
					if not data then
						data = {
							uuid = mod.Name,
							title = mod.DisplayName,
							pops_version = tonumber(mod.ModVersion),
							ModID = id,
						}
					end
					data.Uninstalled = true
					LocalStorage.MappedPopsModsData[path] = data
				end
				SaveLocalStorage()
				mod_def:delete()
				TurnModOff(mod_def.id)
			end
			if storage_path then
				LocalStorage.MappedPopsModsData[storage_path] = nil
				SaveLocalStorage()
			end
			--try to remove the local files
			local sanitized, old = GetSanitizedModName(mod.DisplayName)
			local path = PopsModsDownloadPath .. sanitized .. "/"
			if not io.exists(path) then
				path = PopsModsDownloadPath .. old .. "/"
			end
			local file_err
			if io.exists(path) then
				file_err = AsyncDeletePath(string.gsub(path, "\\", "/"))
			end
			if file_err then
				print(string.format("Error deleting mod %s: error message %s" , mod.DisplayName, file_err))
			end
			if g_ParadoxModsContextObj then
				local browsed_mod = table.find_value(g_ParadoxModsContextObj.mods, "ModID", id)
				if browsed_mod then
					browsed_mod.Installed = nil
					ObjModified(browsed_mod)
				end
			end
			ModsReloadDefs()
			if g_ParadoxModsContextObj then
				g_ParadoxModsContextObj.installed[mod.ModID] = false
				g_ParadoxModsContextObj.enabled[mod.ModID] = false
				g_ParadoxModsContextObj:GetInstalledMods(mod)
			end
		end
		g_PopsUninstallingMods[mod.ModID] = nil
	end, mod, obj_table)
end

function ModsUISetAllModsEnabledState(host, state)
	g_PopsDisableAllModsThread = IsValidThread(g_PopsEnableModThread) and g_PopsEnableModThread or CreateRealTimeThread(function(host)
		local obj = g_ParadoxModsContextObj
		if not obj then return end
		for _, mod in ipairs(obj.installed_mods) do
			local id = mod.ModID
			local enabled = obj.enabled[id]
			if enabled ~= state then
				if not g_PopsDownloadingMods[mod.ModID] then
					if IsValidThread(g_PopsEnableModThread) then
						WaitMsg("PopsEnableModThreadEnd")
					end
					if not g_ParadoxModsContextObj then return end
					ModsUIToggleEnabled(mod, host, nil, "silent")
					--force the mod to check for its corrupted state
					mod.Corrupted = nil
					mod.Warning = nil
					mod.Warning_id = nil
					local browse_mod = table.find_value(obj.mods, "ModID", id)
					if browse_mod then
						browse_mod.Corrupted = nil
						browse_mod.Warning = nil
						browse_mod.Warning_id = nil
					end
				end
			end
		end
	end, host)
end

function ModsUIToggleEnabled(mod, win, obj_table, silent)
	g_PopsEnableModThread = IsValidThread(g_PopsEnableModThread) and g_PopsEnableModThread or CreateRealTimeThread(function(mod, win, obj_table)
		mod = mod or g_ParadoxModsContextObj:GetSelectedMod(obj_table)
		local id = mod.ModID
		local enabled = not g_ParadoxModsContextObj.enabled[id]
		local choice, question
		local mod_def = g_ParadoxModsContextObj and g_ParadoxModsContextObj.mod_defs[id]
		local dependency_data
		if mod_def then
			-- check which enabled mods rely on this one
			dependency_data = ModDependencyGraph[mod_def.id]
			if not enabled and not silent then
				local hard, soft
				for _, dep in ipairs(dependency_data.incoming) do
					local own_mod = dep.own_mod
					if table.find(AccountStorage.LoadMods, own_mod.id) then
						if dep.required then
							hard = hard or {}
							hard[#hard + 1] = own_mod.title
						else
							soft = soft or {}
							soft[#soft + 1] = dep.own_mod.title
						end
					end
				end
				if #(hard or "") > 0 then
					hard = table.concat(hard, "\n")
				end
				if #(soft or "") > 0 then
					soft = table.concat(soft, "\n")
				end
				if (hard or "") ~= "" or (soft or "") ~= "" then
					question = T{12448, "<if(hard)>The following mods require <u(name)> and will not be loaded if you disable it:\n\n<hard>\n\n</if><if(soft)>The following mods might not work correctly if you disable <u(name)>:\n\n<soft>\n\n</if>Do you want to disable this mod anyway?", name = mod.DisplayName, hard = Untranslated(hard), soft = Untranslated(soft)}
				end
			end
		end
		if mod.Warning and enabled and not silent then
			if mod.Warning_id == "too_new" then
				question = T{12407, "The mod <u(name)> has been created with a newer version of the game and might not work correctly. Please, check for a game update. If a game update is currently not available, it might be forthcoming.\n\nDo you want to enable this mod anyway?", name = mod.DisplayName}
			elseif mod.Warning_id == "dependencies_disabled" then
				local dependencies = {}
				for _, dep in ipairs(dependency_data.outgoing or empty_table) do
					if not table.find(AccountStorage.LoadMods, dep.id) then
						dependencies[#dependencies + 1] = Mods[dep.id].title
					end
				end
				dependencies = table.concat(dependencies, "\n")
				question = T{12449, "The following dependencies have not been enabled:\n\n<dependencies>\n\nThe mod <u(name)> will not be loaded unless you enable all necessary mods.\n\nDo you want to enable this mod anyway?", name = mod.DisplayName, dependencies = Untranslated(dependencies)}
			elseif mod.Warning_id == "hard_missing" then
				local dependencies = {}
				for _, dep in ipairs(dependency_data.outgoing_failed or empty_table) do
					if dep.required then
						dependencies[#dependencies + 1] = dep.title
					end
				end
				dependencies = table.concat(dependencies, "\n")
				question = T{12450, "The following dependencies are missing:\n\n<dependencies>\n\nThe mod <u(name)> will not be loaded.\n\nDo you want to enable this mod anyway?", name = mod.DisplayName, dependencies = Untranslated(dependencies)}
			elseif mod.Warning_id == "soft_missing" then
				local dependencies = {}
				for _, dep in ipairs(dependency_data.outgoing_failed or empty_table) do
					if not dep.required then
						dependencies[#dependencies + 1] = dep.title
					end
				end
				dependencies = table.concat(dependencies, "\n")
				question = T{12451, "The following optional dependencies are missing:\n\n<dependencies>\n\nThe mod <u(name)> might not work correctly.\n\nDo you want to enable this mod anyway?", name = mod.DisplayName, dependencies = Untranslated(dependencies)}
			end
		end
		if question and not silent then
			choice = WaitMarsQuestion(GetDialog(win), T(6899, "Warning"), question, T(1138, "Yes"), T(1139, "No"), nil, nil, GetErrorTemplate(nil, "pops"))
			if choice ~= "ok" then
				g_PopsEnableModThread = false
				Msg("PopsEnableModThreadEnd")
				return
			end
		end
		local err
		local m = g_ParadoxModsContextObj.pops_installed[mod.Name]
		local published = not m or m.IsPublished
		if not mod.Local and published then
			local func = enabled and "AsyncPopsModsEnableMod" or "AsyncPopsModsDisableMod"
			err = AsyncOpWait(PopsAsyncOpTimeout, nil, func, id)
		elseif mod.Local and mod.Source == "pops" then
			--mark in LocalStorage as enabled/disabled to sync on next login
			if mod_def then
				local path = mod_def.path .. ModsPackFileName
				LocalStorage.MappedPopsModsData = LocalStorage.MappedPopsModsData or {}
				local data = LocalStorage.MappedPopsModsData[path]
				if not data then
					data = {
						uuid = mod.Name,
						title = mod.DisplayName,
						pops_version = tonumber(mod.ModVersion),
						ModID = id,
					}
				end
				data.Enabled = enabled
				LocalStorage.MappedPopsModsData[path] = data
				SaveLocalStorage()
			end
		end
		if err then
			print(string.format("Error enabling/disabling mod %s: error message %s" , mod.DisplayName, err))
		else
			--reset Corrupted, Warning and Warning_id of all installed mods and their browse_mod counterparts
			ClearInstalledModsCorruptedStatus()
			--add/remove from AccountStorage
			local stored_id = false
			if mod.Local then
				stored_id = id
			else
				for k, v in pairs(Mods) do
					if v:CheckParadoxUUID(mod.Name) then
						stored_id = v.id
						break
					end
				end
			end
			if enabled and published then
				TurnModOn(stored_id)
			else
				TurnModOff(stored_id)
				if enabled then
					if not silent then
						WaitMarsMessage(nil, T(6884, "Warning"), T{12102, "Mod <u(name)> has been disabled and is no longer available.", name = mod.DisplayName}, T(1000136, "OK"), nil, nil, GetErrorTemplate(nil, "pops"))
					end
					if not mod.Local then
						AsyncOpWait(PopsAsyncOpTimeout, nil, "AsyncPopsModsDisableMod", mod.ModID)
					end
					enabled = false
				end
			end
			if not g_ParadoxModsContextObj then
				g_PopsEnableModThread = false
				Msg("PopsEnableModThreadEnd")
				return
			end
			g_ParadoxModsContextObj.enabled[id] = enabled
			ObjModified(mod)
			if win and win.window_state ~= "destroying" then
				local dlg = GetDialog(win)
				dlg:UpdateActionViews(dlg)
			end
		end
		g_PopsEnableModThread = false
		Msg("PopsEnableModThreadEnd")
	end, mod, win, obj_table)
end

function ModsUIIsPopupShown(host)
	local obj = GetDialog(host).context
	return obj and obj.popup_shown or false
end

function ModsUIShowItemAction(host, action, value, mod_id)
	if ModsUIIsPopupShown(host) then return false end
	local obj = g_ParadoxModsContextObj
	local id = mod_id or obj.selected_mod_id
	if not id then return false end
	if not action then return true end
	if action == "enabled" then
		if obj[action][id] == value then
			if not obj.local_mods[id] then
				local installed = ModsUIShowItemAction(host, "installed", true, mod_id)
				if not installed then return false end				
			end
			local corrupted = false
			local mod_def = obj.mod_defs[id]
			if mod_def then
				corrupted = ModsUIGetModCorruptedStatus(mod_def)
			end
			return not corrupted
		end
		return false
	elseif action == "installed" and value then
		local mod = table.find_value(obj.installed_mods, "ModID", id)
		if not mod or mod.Source ~= "pops" then
			return false
		end
	end
	return obj[action][id] == value
end

function ModsUIGetEnableAllButtonState()
	local obj = g_ParadoxModsContextObj
	if not obj then return end
	local enabled = false
	for _, mod in ipairs(obj.installed_mods) do
		if obj.enabled[mod.ModID] then
			enabled = true
		end
	end
	return enabled
end

function ModsUISetSelectedMod(id)
	if not g_ParadoxModsContextObj or g_ParadoxModsContextObj.selected_mod_id == id then
		return false
	end
	g_ParadoxModsContextObj.selected_mod_id = id
	return true
end

function ModsUISetTags()
	local obj = g_ParadoxModsContextObj
	table.clear(obj.set_tags)
	for k,v in pairs(obj.temp_tags) do
		obj.set_tags[k] = v
	end
	obj.only_compatible = obj.temp_only_compatible
end

function ModsUISetInstalledTags()
	local obj = g_ParadoxModsContextObj
	table.clear(obj.set_installed_tags)
	for k,v in pairs(obj.temp_installed_tags) do
		obj.set_installed_tags[k] = v
	end
	obj.only_compatible_installed = obj.temp_only_compatible_installed
end

function ModsUISetDialogMode(win, mode, mode_param)
	if mode == "details" and not next(mode_param) then return end
	local dlg = GetDialog(win)
	local current_mode = dlg:GetMode()
	if current_mode ~= mode then
		local list = win:ResolveId("idList")
		if list then
			if current_mode == "browse" then
				g_ParadoxModsContextObj.last_browse_y = list.OffsetY
				g_ParadoxModsContextObj.last_browse_item = list.focused_item
			elseif current_mode == "installed" then
				g_ParadoxModsContextObj.last_installed_y = list.OffsetY
				g_ParadoxModsContextObj.last_installed_item = list.focused_item
			end
			list:ScrollTo(0,0)
		end
		ModsUISetSelectedMod(false)
		dlg:SetMode(mode, mode_param)
	end
end

local MarkdownProperties = {
	TextColor = RGB(26,26,26),
}

local function ParseDescriptionAsHTML(text)
	text = string.gsub(text, "</?br%s*/?>", "<br/>")
	return ParseHTML(text, MarkdownProperties)
end

function ModsUIRetrieveModDetails(mod)
	DeleteThread(g_PopsRetrieveModDetailsThread)
	g_PopsRetrieveModDetailsThread = CreateRealTimeThread(function(mod)
		mod.details_retrieved = true
		if not mod.Local then
			local err, result = AsyncOpWait(PopsAsyncOpTimeout, nil, "AsyncPopsModsGetDetails", mod.ModID, g_PopsModsUISearchPlatform)
			if not err then
				local changelog = result.ChangeLog and table.reverse(result.ChangeLog)
				mod.ChangeLog = changelog
				for i = 1, #(changelog or "") do
					local entry = changelog[i]
					entry.Details = ParseHTML(string.gsub(entry.Details, "\r\n", "\n"), {TextColor = RGB(135, 135, 135)})
					entry.Released = string.match(entry.Released, "^(%d%d%d%d%-%d%d%-%d%d).*")
				end
				mod.LongDescription = ParseDescriptionAsHTML(result.LongDescription)
				mod.ShortDescription = ParseDescriptionAsHTML(result.ShortDescription)
				mod.Rating = result.Rating
				mod.RatingsTotal = result.RatingsTotal
				mod.RequiredVersion = result.RequiredVersion
				local metadata = table.find_value(result.MetaData, "Key", "size_in_memory")
				if metadata then
					local value = string.gsub(metadata.Value, ",", "")
					mod.FileSize = tonumber(value)
				end
				local requirements = result.Requirements or ""
				for i = 1, #(requirements) do
					local product = string.lower(requirements[i].ProductType)
					if product == "dlc" then
						mod.RequiredDlcs = mod.RequiredDlcs or {}
						mod.RequiredDlcs[#mod.RequiredDlcs + 1] = requirements[i].Name
					else
						mod.RequiredMods = mod.RequiredMods or {}
						mod.RequiredMods[#mod.RequiredMods] = {requirements[i].Name}
					end
				end
				
				local screenshots = result.Screenshots
				local unique_images = {}
				for i = 1, #(screenshots or "") do
					local url = screenshots[i].Image
					local dir, name, ext = SplitPath(url)
					if (name or "") ~= "" and (ext or "") ~= "" then
						unique_images[url] = true
					end
				end
				if next(unique_images) then
					mod.ScreenshotUrls = table.keys(unique_images)
					table.sort(mod.ScreenshotUrls)
					ModsUIDownloadScreenshots(mod)
				end
			end
		end
		ObjModified(mod)
	end, mod)
end

function ModsUIGetRequiredMods(mod)
	local mod_def = g_ParadoxModsContextObj and g_ParadoxModsContextObj.mod_defs[mod.ModID]
	if mod_def then
		local required = table.copy(mod.RequiredMods or {})
		local mod_data = table.values(Mods)
		for _, dep in ipairs(required) do
			if not table.find(mod_data, "title", dep[1]) then
				dep[2] = "soft"
			end
		end
		local dependency_data = ModDependencyGraph[mod_def.id]
		for _, dep in ipairs(dependency_data.outgoing or empty_table) do
			local title = Mods[dep.id].title
			local idx = table.find(required, 1, title)
			if not idx then
				required[#required + 1] = {title}
			end
		end
		for _, dep in ipairs(dependency_data.outgoing_failed or empty_table) do
			local title = dep.title
			local idx = table.find(required, 1, title)
			local state = dep.required and "hard" or "soft"
			if idx then
				required[idx][2] = state
			else
				required[#required + 1] = {title, state}
			end
		end
		if #required > 0 then
			return required
		end
	else
		return mod.RequiredMods
	end
end

local ModsUIPageSize = 20
function ModsUILoadModInfo(list_item_id)
	local obj = g_ParadoxModsContextObj
	if obj then
		local page = ((list_item_id-1) / ModsUIPageSize)
		if not obj.retrieved_mod_pages[page] then
			obj.mods_info_queue:push(page)
			obj:GetModsInfo()
		end
	end
end

function ModsUIPCGamepadSearch(parent)
	local dlg = GetDialog(parent)
	local obj = dlg.context
	obj.popup_shown = "search"
	local wnd = XTemplateSpawn("ModsUIPCGamepadSearch", parent, obj)
	wnd:Open()
	wnd.idTitle:SetText(T(10123, "Search"))
	local query = dlg.Mode == "browse" and obj.query or obj.installed_query
	query = query ~= "" and query or _InternalTranslate(T(10485, "Search mods..."))
	wnd.idEdit:SetText(query)
end

function ModsUIConsoleSearch(parent)
	local obj = g_ParadoxModsContextObj
	if obj then
		if Platform.desktop and GetUIStyleGamepad() then
			ModsUIPCGamepadSearch(parent)
			return
		end
		local mode = GetDialogMode(parent)
		CreateRealTimeThread(function(obj, mode)
			local query_name = mode == "browse" and "query" or "installed_query"
			local current = obj[query_name]
			local text, err = WaitControllerTextInput(current, T(10485, "Search mods..."), "", 255, false)
			if not err then
				text = text:trim_spaces()
				local query_func = mode == "browse" and "GetMods" or "GetInstalledMods"
				if current ~= text then
					obj[query_name] = text
					obj[query_func](obj)
				end
			end
		end, obj, mode)
	end
end

DefineClass.PDXModsObject = {
	__parents = { "InitDone" },
	mods = false,
	counted = false,
	offline = false,
	installed_retrieved = false,
	installed_mods = false,
	pops_installed = false,
	local_mods = false,
	
	enabled = false,
	installed = false,
	mod_defs = false,
	
	temp_tags = false,
	set_tags = false,
	temp_installed_tags = false,
	set_installed_tags = false,
	
	only_compatible = false,
	only_compatible_installed = false,
	
	temp_only_compatible = false,
	temp_only_compatible_installed = false,
	
	set_sort = "created_desc",
	set_installed_sort = "created_desc",
	popup_shown = false,
	
	get_mods_thread = false,
	installed_thread = false,
	
	mods_info_thread = false,
	mods_info_queue = false,
	retrieved_mod_pages = false,
	retrieved_mod_infos = false,
	
	query = "",
	mod_query_count = 0,
	mod_author_count = 0,
	last_retrieved_index = 0,
	last_retrieved_by_author_index = 0,
	installed_query = "",
	temp_query = "",
	selected_mod_id = false,
	
	last_browse_y = 0,
	last_browse_item = false,
	last_installed_y = 0,
	last_installed_item = false,
}

function PDXModsObject:Init()
	self.temp_tags= {}
	self.set_tags= {}
	self.temp_installed_tags = {}
	self.set_installed_tags = {}
	self.installed = {}
	self.enabled = {}
	self.mod_defs = {}
	self.mods_info_queue = PopsQueue:new{push_message = "PopsModGetInfoPush"}
	self.retrieved_mod_pages = {}
	self.retrieved_mod_infos = {}
	if Platform.durango and not DurangoAllowUserCreatedContent then
		self.set_sort = "displayName_asc"
		self.set_installed_sort = "displayName_asc"
	end
	if not g_PopsAttemptingLogin then
		self:GetInstalledMods()
		self:GetMods()
	end
end

function PDXModsObject:GetSelectedMod(obj_table)
	obj_table = obj_table or "mods"
	return table.find_value(self[obj_table], "ModID", self.selected_mod_id)
end

function PDXModsObject:GetModsCount()
	return #(self.mods or "")
end

function PDXModsObject:GetFilterCount()
	local count = 0
	local tags = self.temp_tags
	if next(tags or empty_table) then
		count = count + #(table.keys(tags))
	end
	if self.temp_only_compatible then
		count = count + 1
	end
	return count
end

function PDXModsObject:GetMods()
	if (Platform.durango and not DurangoAllowUserCreatedContent) then return end
	DeleteThread(self.get_mods_thread)
	self.get_mods_thread = CreateRealTimeThread(function(self)
		--clear scroll params for browsing
		self.last_browse_y = false
		self.last_browse_item = false
		collectgarbage("collect")
		self.mods = {}
		self.selected_mod_id = false
		self.counted = false
		ObjModified(self) --show spinner while self.counted == false
		DeleteThread(self.mods_info_thread)
		table.iclear(self.mods_info_queue)
		table.clear(self.retrieved_mod_pages)
		table.clear(self.retrieved_mod_infos)
		self.mod_query_count = 0
		self.mod_author_count = 0
		self.last_retrieved_index = 0
		self.last_retrieved_by_author_index = 0
		local mods = self.mods
		local sortby, orderby = string.match(self.set_sort, "^([^_]*)_(.*)$")
		local query_params = {
			Query = self.query,
			Tags = table.keys(self.set_tags),
			SortBy = sortby or "",
			OrderBy = orderby or "",
			OSType = g_PopsModsUISearchPlatform,
		}
		local err, count = AsyncOpWait(PopsAsyncOpTimeout, nil, "AsyncPopsModsCount", query_params)
		if not err then
			self.mod_query_count = count
		end
		if not err and self.query ~= "" then
			--second request to search by Author
			local additional
			query_params.Query = nil
			query_params.Author = self.query
			err, additional = AsyncOpWait(PopsAsyncOpTimeout, nil, "AsyncPopsModsCount", query_params)
			if not err then
				count = count + additional
				self.mod_author_count = additional
			end
		end
		if err then
			self.offline = true
		else
			self.offline = false
			for i = 1, count do
				mods[i] = {ModPosition = i} --this will be the context of each item
			end
		end
		self.counted = true
		self.last_browse_y = 0
		ObjModified(self)
	end, self)
end

function PDXModsObject:GetModsInfo()
	self.mods_info_thread = IsValidThread(self.mods_info_thread) and self.mods_info_thread or CreateRealTimeThread(function()
		while #self.mods_info_queue > 0 do
			local page = self.mods_info_queue:pop()
			if not self.retrieved_mod_pages[page] then
				local sortby, orderby = string.match(self.set_sort, "^([^_]*)_(.*)$")
				local query_params = {
					Query = self.query,
					Tags = table.keys(self.set_tags),
					SortBy = sortby or "",
					OrderBy = orderby or "",
					Page = page,
					PageSize = ModsUIPageSize,
					OSType = g_PopsModsUISearchPlatform,
				}
				local modify_obj = false
				local err, results = false, {}
				local mods = self.mods
				if self.mod_query_count > page * ModsUIPageSize then
					err, results = AsyncOpWait(PopsAsyncOpTimeout, nil, "AsyncPopsModsSearch", query_params)
					if not err then
						self.last_retrieved_index = self.last_retrieved_index + #results
						local seen = self.retrieved_mod_infos
						for _, res in ipairs(results) do
							seen[res.ModID] = true
						end
					end
				end
				local function RetrieveAdditionalModInfos()
					local additional
					query_params.Query = nil
					query_params.Author = self.query
					query_params.Page = self.last_retrieved_by_author_index / ModsUIPageSize
					err, additional = AsyncOpWait(PopsAsyncOpTimeout, nil, "AsyncPopsModsSearch", query_params)
					if not err then
						local seen = self.retrieved_mod_infos
						local count = 0
						for i = (self.last_retrieved_by_author_index % ModsUIPageSize) + 1, #additional do
							local res = additional[i]
							if not seen[res.ModID] then
								results[#results + 1] = res
								seen[res.ModID] = true
							else
								mods[#mods] = nil
								modify_obj = true
							end
							count = count + 1
							if #results >= ModsUIPageSize then
								break
							end
						end
						self.last_retrieved_by_author_index = self.last_retrieved_by_author_index + count
					end
				end
				while not err and self.query ~= "" and #results < ModsUIPageSize and self.mod_author_count > self.last_retrieved_by_author_index do
					--add mods by Author
					RetrieveAdditionalModInfos()
				end
				if err then
					print("Error searching mods: "..err)
				else
					self.retrieved_mod_pages[page] = true
					for i = 1, #results do
						local result = results[i]
						local idx = table.find(mods, "ModPosition", page * ModsUIPageSize + i)
						local compatible = not self.only_compatible or ModsUIIsModCompatible(result)
						if not compatible then
							table.remove(mods, idx)
							modify_obj = true
						else
							local mod = mods[idx]
							mod.Author = result.Author
							mod.DisplayImagePath = result.DisplayImagePath
							mod.DisplayName = result.DisplayName
							mod.Installed = result.Installed
							local metadata = table.find_value(result.MetaData, "Key", "size_in_memory")
							if metadata then
								local value = string.gsub(metadata.Value, ",", "")
								mod.FileSize = tonumber(value)
							end
							mod.ModID = result.ModID
							mod.ModVersion = result.ModVersion
							mod.Name = result.Name
							mod.Rating = result.Rating
							mod.RatingsTotal = result.RatingsTotal
							mod.RequiredVersion = result.RequiredVersion
							mod.ShortDescription = result.ShortDescription
							mod.Tags = result.Tags
							mod.Source = "pops"
							mod.InfoRetrieved = true
							--download image
							ModsUIDownloadScreenshots(mod)
							self.installed[mod.ModID] = self.installed[mod.ModID] or false
							self.enabled[mod.ModID] = self.enabled[mod.ModID] or false
							ObjModified(mod)
						end
					end
				end
				if modify_obj then
					ObjModified(self)
				end
			end
		end
	end)
end

function PDXModsObject:GetInstalledModsCount()
	return #(self.installed_mods or "")
end

function PDXModsObject:GetInstalledFilterCount()
	local count = 0
	local tags = self.temp_installed_tags
	if next(tags or empty_table) then
		count = count + #(table.keys(tags))
	end
	if self.temp_only_compatible_installed then
		count = count + 1
	end
	return count
end

function PDXModsObject:GetInstalledMods(modify_obj, skip_install)
	DeleteThread(self.installed_thread)
	self.installed_thread = CreateRealTimeThread(function(self)
		--clear scrolling params for installed mods
		self.last_installed_y = false
		self.last_installed_item = false
		collectgarbage("collect")
		self.pops_installed = {}
		self.installed_mods = {}
		self.local_mods = {}
		if not modify_obj then
			self.installed_retrieved = false
			ObjModified(self)
		end
		local mods = self.installed_mods
		local tags = table.keys(self.set_installed_tags)
		local sortby, orderby = string.match(self.set_installed_sort, "^([^_]*)_(.*)$")
		local seen = {}
		--show currently installing mods
		for mod_id, installing in pairs(g_PopsDownloadingMods) do
			local err, mod = AsyncOpWait(PopsAsyncOpTimeout, nil, "AsyncPopsModsGetDetails", mod_id, g_PopsModsUISearchPlatform)
			if not err and not seen[mod.ModID] then
				local metadata = table.find_value(mod.MetaData, "Key", "size_in_memory")
				if metadata then
					local value = string.gsub(metadata.Value, ",", "")
					mod.FileSize = tonumber(value)
				end
				mod.Source = "pops"
				ModsUIDownloadScreenshots(mod)
				mods[#mods + 1] = mod
				seen[mod.ModID] = true
			end
		end
		if g_ParadoxAccountLoggedIn and not (Platform.durango and not DurangoAllowUserCreatedContent) then
			local err, pops_installed = AsyncOpWait(PopsAsyncOpTimeout, nil, "AsyncPopsModsGetInstalled", g_PopsModsUISearchPlatform)
			pops_installed = pops_installed or empty_table
			for _, m in ipairs(pops_installed) do
				self.pops_installed[m.Name] = m
			end
			local function RetrieveInstalledModsForPage(page, query_params)
				query_params.Page = page
				local err, installed = AsyncOpWait(PopsAsyncOpTimeout, nil, "AsyncPopsModsSearch", query_params)
				if err then
					print("Error retrieving installed mods: "..err)
				else
					for j = 1, #installed do
						local mod = installed[j]
						if not seen[mod.ModID] then
							local enabled = mod.Enabled --don't use this after that, sync this using the context object
							mod.Enabled = nil
							local metadata = table.find_value(mod.MetaData, "Key", "size_in_memory")
							if metadata then
								local value = string.gsub(metadata.Value, ",", "")
								mod.FileSize = tonumber(value)
							end
							ModsUIDownloadScreenshots(mod)
							local m = self.pops_installed[mod.Name]
							local published = not m or m.IsPublished
							mod.IsPublished = published
							mod.Source = "pops"
							local mod_def
							for k, v in pairs(Mods) do
								if v:CheckParadoxUUID(mod.Name) then
									if enabled and published then
										TurnModOn(v.id)
									else
										TurnModOff(v.id)
										if enabled then
											WaitMarsMessage(nil, T(6884, "Warning"), T{12103, "Mod <u(name)> has been disabled due to content restrictions.", name = mod.DisplayName}, T(1000136, "OK"), nil, nil, GetErrorTemplate(nil, "pops"))
											AsyncOpWait(PopsAsyncOpTimeout, nil, "AsyncPopsModsDisableMod", mod.ModID)
											enabled = false
										end
									end
									mod_def = v
									self.mod_defs[mod.ModID] = v
									break
								end
							end
							if mod_def then
								self.enabled[mod.ModID] = enabled
								self.installed[mod.ModID] = true
								local compatible = not self.only_compatible_installed or ModsUIIsModCompatible(mod)
								if compatible then
									mods[#mods + 1] = mod
								end
								g_PopsDownloadingMods[mod.ModID] = nil
								mod.Corrupted, mod.Warning, mod.Warning_id = ModsUIGetModCorruptedStatus(mod_def)
								seen[mod_def.id] = true
							elseif not skip_install then
								local sanitized = GetSanitizedModName(mod.DisplayName)
								sanitized = (sanitized ~= "") and sanitized or "EmptyName"
								local path = PopsModsDownloadPath .. sanitized .. "/" .. ModsPackFileName
								local data = LocalStorage.MappedPopsModsData and LocalStorage.MappedPopsModsData[path]
								if not data or not data.Uninstalled then
									ModsUIInstallMod(mod, "quiet")
								end
							end
							seen[mod.ModID] = true
						end
					end
				end
				return err
			end
		
			local query_params = {
				Query = self.installed_query,
				Tags = tags,
				SortBy = sortby ~= "enabled" and sortby or "",
				OrderBy = orderby or "",
				OnlyInstalled = 1,
				PageSize = 100,
				OSType = g_PopsModsUISearchPlatform,
			}
			local err, count = AsyncOpWait(PopsAsyncOpTimeout, nil, "AsyncPopsModsCount", query_params)
			if not err then
				for page = 0, (count-1) / 100 do
					err = RetrieveInstalledModsForPage(page, query_params)
					if err then break end
				end
			end
			if not err and self.installed_query ~= "" then
				query_params.Query = nil
				query_params.Author = self.installed_query
				err, count = AsyncOpWait(PopsAsyncOpTimeout, nil, "AsyncPopsModsCount", query_params)
				if not err then
					for page = 0, (count-1) / 100 do
						err = RetrieveInstalledModsForPage(page, query_params)
						if err then break end
					end
				end
			end
		end
		local local_mods = {}
		local pattern = self.installed_query ~= "" and case_insensitive_pattern(self.installed_query)
		for k, v in sorted_pairs(Mods) do
			local mod_tags = v:GetTags()
			if not seen[k] and table.is_isubset(tags, mod_tags) and (not pattern or string.match(v.title, pattern) or string.match(v.author, pattern) or string.match(v.description, pattern)) then
				local author = v.author ~= "" and v.author or "Unknown"
				local corrupted, warning, warning_id = ModsUIGetModCorruptedStatus(v)
				local compatible = not self.only_compatible_installed or (not v:IsTooOld() and not v:IsTooNew())
				if compatible then
					local_mods[#local_mods+1] = {
						ModID = k,
						DisplayName = v.title,
						Author = author,
						Thumbnail = v.image ~= "" and v.image or "UI/Common/Placeholder.tga",
						ModVersion = v:GetVersionString(),
						Local = true,
						Source = v.source,
						LongDescription = ParseDescriptionAsHTML(v.description),
						Corrupted = corrupted,
						Warning = warning,
						Warning_id = warning_id,
						Tags = mod_tags,
					}
				end
				self.mod_defs[k] = v
				self.enabled[k] = not not table.find(AccountStorage.LoadMods, v.id)
				self.installed[k] = true
				self.local_mods[k] = true
			end
		end
		local sort_func
		if sortby ~= "enabled" then
			if orderby == "asc" or sortby ~= "displayName" then
				sort_func = function(a, b)
					if a.Source == "pops" and b.Source ~= "pops" then
						return true
					elseif a.Source ~= "pops" and b.Source == "pops" then
						return false
					end
					return a.DisplayName < b.DisplayName 
				end
			else
				sort_func = function(a, b)
					if a.Source == "pops" and b.Source ~= "pops" then
						return false
					elseif a.Source ~= "pops" and b.Source == "pops" then
						return true
					end
					return a.DisplayName > b.DisplayName
				end
			end
			table.stable_sort(local_mods, sort_func)
		end
		table.iappend(mods, local_mods)
		
		if sortby == "enabled" then
			if orderby == "asc" then
				sort_func = function(a, b)
					if self.enabled[a.ModID] ~= self.enabled[b.ModID] then
						return not self.enabled[a.ModID] and self.enabled[b.ModID]
					end
					return a.DisplayName < b.DisplayName
				end
			else
				sort_func = function(a, b)
					if self.enabled[a.ModID] ~= self.enabled[b.ModID] then
						return self.enabled[a.ModID] and not self.enabled[b.ModID]
					end
					return a.DisplayName < b.DisplayName
				end
			end
			table.stable_sort(mods, sort_func)
		end
		
		self.installed_retrieved = true
		if modify_obj then
			ObjModified(modify_obj)
		end
		self.last_installed_y = 0
		ObjModified(self)
	end, self)
end

function PDXModsObject:SetSortMethod(id)
	if self.set_sort ~= id then
		self.set_sort = id
		self:GetMods()
	end
end

function PDXModsObject:SetInstalledSortMethod(id)
	if self.set_installed_sort ~= id then
		self.set_installed_sort = id
		self:GetInstalledMods()
	end
end

function PDXModsObject:GetSortTextUppercase()
	local item = table.find_value(GetPopsModsUISortItems("browse"), "id", self.set_sort)
	if item then
		return item.name_uppercase
	end
	return ""
end

function PDXModsObject:GetInstalledSortTextUppercase()
	local item = table.find_value(GetPopsModsUISortItems("installed"), "id", self.set_installed_sort)
	if item then
		return item.name_uppercase
	end
	return ""
end

function PDXModsObjectCreateAndLoad()
	g_ParadoxModsContextObj = g_ParadoxModsContextObj or PDXModsObject:new()
	return g_ParadoxModsContextObj
end

function OnMsg.ChangeMap(map)
	if g_ParadoxModsContextObj and map ~= "" and map ~= "PreGame" then
		g_ParadoxModsContextObj = false
		collectgarbage("collect")
	end
end

function OnMsg.PopsAutoLoginFailed()
	StartPopsModsDownloadThread()
	StartPopsModsScreenshotDownloadThread()
	if Platform.durango and not DurangoAllowUserCreatedContent then return end
	local obj = g_ParadoxModsContextObj
	if obj then
		obj:GetMods()
		obj:GetInstalledMods()
	end
end

function OnMsg.PopsLogin()
	StartPopsModsDownloadThread()
	StartPopsModsScreenshotDownloadThread()
	if Platform.durango and not DurangoAllowUserCreatedContent then return end
	--check for missing installed mods and download them
	--if mods are disabled, do not try to update, install or sync any data to mitigate issues
	if not config.NoMods then
		CreateRealTimeThread(function()
			local err, pops_installed = AsyncOpWait(PopsAsyncOpTimeout, nil, "AsyncPopsModsGetInstalled", g_PopsModsUISearchPlatform)
			pops_installed = pops_installed or empty_table
			
			local query_params = {OnlyInstalled = 1, PageSize = 100, OSType = g_PopsModsUISearchPlatform}
			local err, count = AsyncOpWait(PopsAsyncOpTimeout, nil, "AsyncPopsModsCount", query_params)
			if not err then
				for i = 0, (count-1) / 100 do
					query_params.Page = i
					local installed
					err, installed = AsyncOpWait(PopsAsyncOpTimeout, nil, "AsyncPopsModsSearch", query_params)
					if not err then
						for j = 1, #(installed or "") do
							local found = false
							local mod = installed[j]
							for k, v in pairs(Mods) do
								if v:CheckParadoxUUID(mod.Name) then
									found = v
									break
								end
							end
							local m = table.find_value(pops_installed, "Name", mod.Name)
							local published = not m or m.IsPublished
							local uninstalled
							
							local should_update, found_entry
							for k,entry in pairs(LocalStorage.MappedPopsModsData or empty_table) do
								if entry.uuid == mod.Name and entry.Uninstalled then
									ModsUIUninstallMod(mod, nil, "quiet", k)
									uninstalled = true
									break
								elseif found and found:CheckParadoxUUID(entry.uuid) then
									local enabled = entry.Enabled
									if enabled ~= nil and enabled ~= mod.Enabled then
										-- sync enabled/disabled state
										local func = enabled and "AsyncPopsModsEnableMod" or "AsyncPopsModsDisableMod"
										local err = AsyncOpWait(PopsAsyncOpTimeout, nil, func, mod.ModID)
										if not err then
											entry.Enabled = nil
											SaveLocalStorage()
											local obj = g_ParadoxModsContextObj
											if obj then
												obj.enabled[mod.ModID] = enabled
												obj:GetInstalledMods()
											end
										end
									end
									should_update = (tonumber(entry.pops_version) or 0) < (tonumber(mod.ModVersion) or 0)
									found_entry = entry
									break
								end
							end
							should_update = should_update or (found and not found_entry)
							if not uninstalled then
								if published and (not found or should_update) then
									ModsUIInstallMod(mod, "quiet")
								elseif not published then
									WaitMarsMessage(nil, T(6884, "Warning"), T{12103, "Mod <u(name)> has been disabled due to content restrictions.", name = mod.DisplayName}, T(1000136, "OK"))
									if mod.Enabled then
										AsyncOpWait(PopsAsyncOpTimeout, nil, "AsyncPopsModsDisableMod", mod.ModID)
										if g_ParadoxModsContextObj and g_ParadoxModsContextObj.enabled then
											g_ParadoxModsContextObj.enabled[mod.ModID] = false
											ObjModified(g_ParadoxModsContextObj)
										end
									end
									if found then
										TurnModOff(found.id)
										SaveAccountStorage(5000)
									end
								end
							end
						end
					end
				end
			end
		end)
	end
	local main = GetPreGameMainMenu()
	if main and g_ParadoxModsContextObj then
		local dlg = main.idContent:ResolveId("idModsUIDialog")
		if dlg then
			ModsUIClosePopup(dlg)
			g_ParadoxModsContextObj:GetMods()
			g_ParadoxModsContextObj:GetInstalledMods()
			return
		end
	end
	--user might have changed, new context is required, clear the old one
	g_ParadoxModsContextObj = false
end

function OnMsg.PopsLogout()
	--context is no longer relevant
	g_ParadoxModsContextObj = false
end

function OnMsg.PopsModInstalled(mod)
	g_PopsDownloadingMods[mod.ModID] = nil
	CreateRealTimeThread(function(mod)
		ModsReloadDefs() --after this we can get the mod def for this mod
		local mod_def
		for k, v in pairs(Mods) do
			if v:CheckParadoxUUID(mod.Name) then
				mod_def = v
				break
			end
		end
		local corrupted, warning, warning_id
		if mod_def then
			corrupted, warning, warning_id = ModsUIGetModCorruptedStatus(mod_def)
		end
		local err
		if not corrupted then
			--force clear corrupted, warning for all installed
			ClearInstalledModsCorruptedStatus()
			local enabled = mod.Enabled == nil or mod.Enabled
			local func = enabled and "AsyncPopsModsEnableMod" or "AsyncPopsModsDisableMod"
			err = AsyncOpWait(PopsAsyncOpTimeout, nil, func, mod.ModID)
			if err then
				print(string.format("Error enabling mod %s: error message %s" , mod.DisplayName, err))
			elseif mod_def then
				if enabled then
					TurnModOn(mod_def.id)
				else
					TurnModOff(mod_def.id)
				end
			end
		end
		if not err and g_ParadoxModsContextObj then
			g_ParadoxModsContextObj:GetInstalledMods(mod, "skip_install")
		end
	end, mod)
end

function StartPopsModsDownloadThread()
	if g_PopsDownloadModsQueue then return end
	if Platform.durango and not DurangoAllowUserCreatedContent then return end
	CreateRealTimeThread(function()
		g_PopsDownloadModsQueue = PopsQueue:new{push_message = "PopsDownloadModPush"}
		while true do
			WaitMsg("PopsDownloadModPush")
			while #g_PopsDownloadModsQueue > 0 do
				local entry = g_PopsDownloadModsQueue:pop()
				if g_ParadoxModsContextObj then
					g_ParadoxModsContextObj:GetInstalledMods(entry, "skip_install")
				end
				WaitInstallPopsMod(entry)
			end
		end
	end)
end

function StartPopsModsScreenshotDownloadThread()
	if g_PopsDownloadModsScreenshotsQueue then return end
	CreateRealTimeThread(function()
		AsyncCreatePath(PopsModsScreenshotsPath)
		g_PopsDownloadModsScreenshotsQueue = PopsQueue:new{push_message = "PopsDownloadModScreenshotsPush"}
		while true do
			WaitMsg("PopsDownloadModScreenshotsPush")
			while #g_PopsDownloadModsScreenshotsQueue > 0 do
				WaitDownloadModScreenshots(g_PopsDownloadModsScreenshotsQueue:pop())
			end
		end
	end)
end

function OnMsg.PopsModsThumbnailDownloaded(mod)
	ObjModified(mod)
end

function OnMsg.PopsModsScreenshotsDownloaded(mod)
	ObjModified(mod)
end

---------Flags------------
PopsModsUIFlagReasons = {
	--{ name = T{10439, "Nudity"},       id = "nudity" },
	--{ name = T{10440, "Violence"},     id = "violence" },
	--{ name = T{10441, "Harassment"},   id = "harassment" },
	--{ name = T{10442, "Spam"},         id = "spam" },
	{ name = T(10443, "Copyright infringement"), id = "copyright" },
	--{ name = T{10444, "Hate speech"},  id = "hate" },
	{ name = T(10541, "Inappropriate"), id = "inappropriate" },
	{ name = T(12301, "Something else"),id = "other" },
}
