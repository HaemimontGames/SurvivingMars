if FirstLoad then
	g_TempScreenshotFilePath = false
	g_SaveGameDescrThread = false
	g_CurrentSaveGameItemId = false
	g_SaveLoadThread = false
	g_SaveScreenShotThread = false
	g_SavegameListUpdateThread = false
	g_SaveGameObj = false
end

function WaitCaptureCurrentScreenshot()
	if IsValidThread(g_SaveScreenShotThread) then
		WaitMsg("SaveScreenShotEnd")
	end
	g_SaveScreenShotThread = CreateRealTimeThread(function()
		if g_TempScreenshotFilePath then
			UIL.UnloadImage(g_TempScreenshotFilePath)
		end
		local _, file_path = WaitCaptureSavegameScreenshot(Platform.ps4 and "memoryscreenshot/" or "AppData/")
		g_TempScreenshotFilePath = file_path
		WaitNextFrame(2)
		Msg("SaveScreenShotEnd")
	end)
end

function WaitFreeCurrentScreenshot()
	if IsValidThread(g_SaveScreenShotThread) then
		WaitMsg("SaveScreenShotEnd")
	end
	g_SaveScreenShotThread = CreateRealTimeThread(function()
		if g_TempScreenshotFilePath then
			WaitNextFrame(2)
			UIL.UnloadImage(g_TempScreenshotFilePath)
			WaitNextFrame(2)
			os.remove(g_TempScreenshotFilePath)
			g_TempScreenshotFilePath = false
		end
		Msg("SaveScreenShotEnd")
	end)
end

function WaitCountSaveGames()
	if PlayWithoutStorage() then
		return 0
	end
	local err, count = Savegame.CountForTag("savegame")
	return not err and count or 0
end

DefineClass.SaveLoadObject = {
	__parents = { "PropertyObject" },
	items = false,
	initialized = false,
}

function SaveLoadObject:WaitGetSaveItems()
	local items = {}
	local err, list = Savegame.ListForTag("savegame")
	if not err then
		g_CurrentSaveGameItemId = false
		for _, v in ipairs(list) do
			-- do not show partially downloaded files in the list
			-- they appear as corrupted savegames and might confuse the player
			if v.savename ~= g_PopsDownloadingSave then
				local id = #items + 1
				items[id] = {
					text = Untranslated(v.displayname),
					id = id,
					savename = v.savename,
					metadata = v,
				}
			end
		end
	end
	self.items = items
	if not self.initialized then
		self.initialized = true
		PopsSyncSaveGames(items)
	end
end

function SaveLoadObject:RemoveItem(id)
	g_CurrentSaveGameItemId = false
	local items = self.items or empty_table
	for i = #items, 1, -1 do
		local item_id = items[i].id
		if item_id == id then
			table.remove(items, i)
		elseif item_id > id then
			items[i].id = item_id - 1
		end
	end
end

function SaveLoadObject:CalcDefaultSaveName()
	local default_text = _InternalTranslate(GetMissionSponsor().display_name or "") .. " Sol " .. UICity.day
	local items = self.items
	local max_num = 0
	for k, v in ipairs(items) do
		local text = _InternalTranslate(v.text)
		if string.match(text, "^" .. default_text) then
			local number = (text == default_text) and 1 or tonumber(string.match(text, "^" .. default_text .. "%s%((%d+)%)$") or 0)
			max_num = Max(max_num, number)
		end
	end
	if max_num > 0 then
		return default_text .. " (" .. max_num + 1 .. ")"
	end
	return default_text:trim_spaces()
end

function SaveLoadObject:ShowNewSavegameNamePopup(host, item)
	if not host:IsThreadRunning("rename") then
		host:CreateThread("rename", function(host, item)
			local initial_text = item and _InternalTranslate(item.text) or self:CalcDefaultSaveName()
			CreateMarsRenameControl(host, T(4181, "New Savegame"), initial_text, 
			--OK callback
			function(savename)
				SaveSavegame(item, savename, host)
			end, 
			--Cancel callback
			function()
				return false
			end, {max_len = 40, console_show = true})
		end, host, item)
	end
end

function SaveLoadObject:GetSyncInfo()
	local count = g_PopsSyncQueue and (#g_PopsSyncQueue + (g_PopsSynchronizing and 1 or 0)) or 0
	if PopsCloudSavesAllowed() and count > 0 then
		return T{8530, "<count> savegames are currently being synchronized with cloud storage", count = count}
	end
	return ""
end

function SaveLoadObjectCreateAndLoad()
	g_SaveGameObj = SaveLoadObject:new()
	return g_SaveGameObj
end

function OnMsg.PopsSyncPop(reload_savegames)
	DeleteThread(g_SavegameListUpdateThread)
	g_SavegameListUpdateThread = CreateRealTimeThread(function()
		if reload_savegames then
			SavegamesList:Reset()
			if g_SaveGameObj then
				g_SaveGameObj:WaitGetSaveItems()
			end
		end
		ObjModified(g_SaveGameObj)
	end)
end

function OnMsg.PopsLogin()
	ObjModified(g_SaveGameObj)
end

local function SavenameToName(savename)
	local savename = savename:match("(.*)%.savegame%.sav$")
	savename = savename:gsub("%+", " ")
	savename = savename:gsub("%%(%d%d)", function(hex_code)
		return string.char(tonumber("0x" .. hex_code))
	end)
	return savename
end

function ShowSavegameDescription(item, dialog)
	if g_CurrentSaveGameItemId ~= item.id then
		g_CurrentSaveGameItemId = false
		DeleteThread(g_SaveGameDescrThread)
		g_SaveGameDescrThread = CreateRealTimeThread(function(item, dialog)
			Savegame.CancelLoad()
			
			local metadata = item.metadata
			
			if dialog.window_state == "destroying" then return end
			dialog.idDescription:SetVisible(false)
			if IsValidThread(g_SaveScreenShotThread) then
				WaitMsg("SaveScreenShotEnd")
			end
			Sleep(210)
			if dialog.window_state == "destroying" then return end
			g_CurrentSaveGameItemId = item.id
			
			-- we need to reload the meta from the disk in order to have the screenshot!
			local data = {}
			local err
			if not metadata then
				-- new save
				data.mission_sponsor_id = g_CurrentMissionParams.idMissionSponsor
				data.commander_profile_id = g_CurrentMissionParams.idCommanderProfile
				data.latitude = g_CurrentMapParams.latitude
				data.longitude = g_CurrentMapParams.longitude
				data.active_mods = GetLoadedModsSavegameData()
				data.active_game_rules = g_CurrentMissionParams.idGameRules
				data.elapsed_sols = UICity and UICity.day or 0
				data.displayname = T(4182, "<<< New Savegame >>>")
				data.timestamp = os.time()
				data.playtime = GetCurrentPlaytime()
			else
				err = GetFullMetadata(metadata, "reload")
				if metadata.corrupt then
					data.displayname = T(6907, "Damaged savegame")
				elseif metadata.incompatible then
					data.displayname = T(8648, "Incompatible savegame")
				else
					data = table.copy(metadata)
					data.displayname = Untranslated(data.displayname)
					if Platform.developer then
						local savename = SavenameToName(metadata.savename)
						if savename ~= metadata.displayname then
							data.displayname = Untranslated(metadata.displayname .. " - " .. savename)
						end
						data.displayname = Untranslated(data.displayname .. Untranslated(" - Lua:") .. data.lua_revision)
					end
				end
			end
			
			local sponsor_data = data.mission_sponsor_id and GetMissionSponsor(data.mission_sponsor_id)
			local commander_data = data.commander_profile_id and GetCommanderProfile(data.commander_profile_id)
			if data.latitude and data.longitude then
				data.latitude, data.longitude, data.lat_dir, data.long_dir = FormatCoordinates(data.latitude, data.longitude)
			end
			local mods_list, mods_string, mods_missing
			local max_mods, more = 30
			if data.active_mods and #data.active_mods > 0 then
				mods_list = {}
				for _, mod in ipairs(data.active_mods) do
					--mod is a table, containing id, title, version and lua_revision or is just the id in older saves
					local local_mod = table.find_value(ModsLoaded, "id", mod.id or mod) or (Mods and Mods[mod.id or mod])
					if #mods_list >= max_mods then
						more = true
						break
					end
					table.insert(mods_list, mod.title or (local_mod and local_mod.title))
					if not local_mod or not table.find(AccountStorage.LoadMods, mod.id or mod) then
						mods_missing = true
					end
				end
				mods_string = table.concat(mods_list, ", ")
				if more then
					mods_string = mods_string .. "<nbsp>..."
				end
			end
			
			local game_rules_list, game_rules_string
			if data.active_game_rules and next(data.active_game_rules) then
				game_rules_list = {}
				for rule_id,_ in sorted_pairs(data.active_game_rules) do
					local rule = GameRulesMap[rule_id]
					local name = rule and rule.display_name or Untranslated(rule_id)
					game_rules_list[#game_rules_list + 1] = name
				end
				game_rules_string = TList(game_rules_list)
			end
			
			local dlcs_list = {}
			for _, dlc in ipairs(data.dlcs or empty_table) do
				if not IsDlcAvailable(dlc.id) then
					dlcs_list[#dlcs_list + 1] = dlc.name
				end
			end
			local missing_dlcs = TList(dlcs_list)
			
			local playtime = T(77, "Unknown")
			if data.playtime then
				local h, m, s = FormatElapsedTime(data.playtime, "hms")
				local hours = Untranslated(string.format("%02d", h))
				local minutes = Untranslated(string.format("%02d", m))
				playtime = T{7549, "<hours>:<minutes>", hours = hours, minutes = minutes}
			end
			if not dialog or dialog.window_state == "destroying" then return end
			dialog.idSavegameTitle:SetText(Untranslated(data.displayname))
			dialog.idLastUpdate:SetText(data.timestamp and T{4273, "Saved on <save_date>", save_date = Untranslated(os.date("%H:%M - %d / %m / %Y", data.timestamp))} or "")
			dialog.idPlaytime:SetText(T{4274, "Playtime <playtime>", playtime = playtime})
			
			local problem_text = ""
			if metadata and metadata.corrupt then
				problem_text = T{4194, "<red><value></red>", value = T(4193, "Save file is corrupted!")}
			elseif metadata and metadata.incompatible then
				problem_text = T{4194, "<red><value></red>", value = T(8649, "Please update the game to the latest version to load this savegame.")}
			elseif missing_dlcs and missing_dlcs ~= "" then
				problem_text = T{8502, "<red>Missing downloadable content: <dlcs></red>", dlcs = Untranslated(missing_dlcs)}
			elseif mods_missing then
				problem_text = T(4195, "<red>There are missing mods!</red>")
			end
			dialog.idProblem:SetText(problem_text)
			
			if data.latitude and data.longitude then
				dialog.idCoordinates:SetText(T(11457, "Coordinates"))
				dialog.idCoordinatesVal:SetText(T{4199, "<lat>°<lat_dir> <long>°<long_dir>", lat = data.latitude, lat_dir = data.lat_dir, long = data.longitude, long_dir = data.long_dir})
			else
				dialog.idCoordinates:SetText("")
				dialog.idCoordinatesVal:SetText("")
			end
			if data.elapsed_sols and data.elapsed_sols > 0 then
				dialog.idSols:SetText(T(4196, "Sols on Mars"))
				dialog.idSolsVal:SetText(T{4341, "<value>", value = data.elapsed_sols})
			else
				dialog.idSols:SetText("")
				dialog.idSolsVal:SetText("")
			end
			if sponsor_data then
				dialog.idSponsor:SetText(T(3474, "Mission Sponsor"))
				dialog.idSponsorVal:SetText(sponsor_data.display_name or T(130, "N/A"))
			else
				dialog.idSponsor:SetText("")
				dialog.idSponsorVal:SetText("")
			end
			if commander_data then
				dialog.idCommanderProfile:SetText(T(3478, "Commander Profile"))
				dialog.idCommanderProfileVal:SetText(T{4341, "<value>", value = commander_data.display_name or T(130, "N/A")})
			else
				dialog.idCommanderProfile:SetText("")
				dialog.idCommanderProfileVal:SetText("")
			end
			if mods_string and mods_string ~= "" then
				dialog.idActiveMods:SetText(T(4200, "Active mods"))
				dialog.idActiveModsVal:SetText(T{4341, "<value>", value = Untranslated(mods_string)})
			else
				dialog.idActiveMods:SetText("")
				dialog.idActiveModsVal:SetText("")
			end
			if game_rules_string and game_rules_string ~= "" then
				dialog.idActiveGameRules:SetText(T(8800, "Game Rules"))
				dialog.idActiveGameRulesVal:SetText(game_rules_string)
			else
				dialog.idActiveGameRules:SetText("")
				dialog.idActiveGameRulesVal:SetText("")
			end
			
			if GetUIStyleGamepad() then
				dialog.idDelInfo:SetVisible(false)
			else
				local del_hint = metadata and T(4191, "DEL to delete. ") or T{""}
				dialog.idDelInfo:SetText(del_hint)
			end
			
			local image = ""
			local forced_path = not metadata and g_TempScreenshotFilePath or false
			if not forced_path and Savegame._MountPoint then
				local images = io.listfiles(Savegame._MountPoint, "screenshot*.jpg", "non recursive")
				if #(images or "") > 0 then
					image = images[1]
				end
			elseif forced_path and io.exists(forced_path) then
				image = forced_path
			end
			
			if image ~= "" and not err then
				UIL.ReloadImage(image)
				dialog.idImage:SetImage(image)
			else
				dialog.idImage:SetImage("UI/Common/Placeholder.tga")
			end
			
			dialog.idDescription:SetVisible(true)
		end, item, dialog)
	end
end

function DeleteSaveGame(dialog)
	local list = dialog.idList
	local ctrl = list[list.focused_item]
	local item = ctrl and ctrl.context
	if item and not item.dummy then
		local savename = item.savename
		CreateRealTimeThread(function(dialog, savename)
			if WaitMarsQuestion(dialog.parent, T(6905, "Warning"), T{4189, "Are you sure you want to delete the savegame <savename>?", savename = '"' .. item.text .. '"'}, T(1138, "Yes"), T(1139, "No"), "UI/Messages/space.tga") == "ok" then
				LoadingScreenOpen("idDeleteScreen", "delete savegame")
				local err = DeleteGame(savename)
				if not err then
					if g_CurrentSaveGameItemId == item.id then
						g_CurrentSaveGameItemId = false
						DeleteThread(g_SaveGameDescrThread)
						dialog.idDescription:SetVisible(false)
					end
					local obj = dialog.context
					obj:RemoveItem(item.id)
					list:Clear()
					ObjModified(obj)
					list:SetSelection(Min(item.id, #list))
					LoadingScreenClose("idDeleteScreen", "delete savegame")
				else
					LoadingScreenClose("idDeleteScreen", "delete savegame")
					CreateErrorMessageBox("", "deletegame", nil, dialog.parent, {name = '"' .. item.text .. '"'})
				end
			end
		end, dialog, savename)
	end
end

function LoadSaveGame(dialog)
	local list = dialog.idList
	local ctrl = list[list.focused_item]
	local item = ctrl and ctrl.context
	if item then
		local savename = item.savename
		g_SaveLoadThread = IsValidThread(g_SaveLoadThread) and g_SaveLoadThread or CreateRealTimeThread(function(dialog, savename)
			local metadata = item.metadata
			local err
			if metadata and not metadata.corrupt and not metadata.incompatible then
				local in_game = GameState.gameplay -- this might change during loading
				local parent = dialog.parent --get this here, it might not be accessible afterwards
				local res = in_game and WaitMarsQuestion(parent, T(6901, "Warning"), T(7729, "Are you sure you want to load this savegame? You will lose your current game progress."), T(1138, "Yes"), T(1139, "No"), "UI/Messages/space.tga") or "ok"
				if res == "ok" then
					local parent_dlg = GetDialog(parent)
					LoadingScreenOpen("idLoadingScreen", "LoadSaveGame")
					if not in_game and parent_dlg and parent_dlg.window_state ~= "destroying" then
						parent_dlg:SetMode("Empty")
					end
					err = LoadGame(savename)
					if not err then
						DeleteThread(g_SaveGameDescrThread)
						if parent_dlg and parent_dlg.window_state ~= "destroying" then
							parent_dlg:Close()
						end
					else
						if not in_game and parent_dlg and parent_dlg.window_state ~= "destroying" then
							parent_dlg:SetMode("Load")
						end
						if err == "user cancelled" or err == "missing dlc" then
							err = nil --message is already shown
						elseif err ~= "paradox sponsor" and in_game then
							if dialog.window_state ~= "destroying" then
								dialog:delete(nil)
							end
							OpenPreGameMainMenu()
						end
					end
					LoadingScreenClose("idLoadingScreen", "LoadSaveGame")
				end
			else
				err = metadata and metadata.incompatible and "incompatible" or "corrupt"
			end
			if err then
				CreateErrorMessageBox(err, "loadgame", nil, dialog.parent, {name = '"' .. item.text .. '"'})
			end
		end, dialog, savename)
	end
end

function SaveSavegame(item, name, dialog)
	name = name:trim_spaces()
	if name and name ~= "" then
		g_SaveLoadThread = IsValidThread(g_SaveLoadThread) and g_SaveLoadThread or CreateRealTimeThread(function(dialog, name, item)
			local err, savename
			if item then
				if WaitMarsQuestion(dialog.parent, T(6901, "Warning"), T{4183, "Are you sure you want to overwrite <savename>?", savename = '"' .. item.text .. '"'}, T(1138, "Yes"), T(1139, "No"), "UI/Messages/space.tga") == "ok" then
					err = DeleteGame(item.savename)
				else
					return
				end
			end
			if not err then
				err, savename = SaveGame(name)
			end
			if not err then
				DeleteThread(g_SaveGameDescrThread)
				local parent_dlg = GetDialog(dialog.parent)
				if parent_dlg and parent_dlg.window_state ~= "destroying" then
					parent_dlg:Close()
				end
			else
				CreateErrorMessageBox(err, "savegame", nil, dialog.parent, {savename = T{4186, '"<name>"', name = Untranslated(name)}, error_code = Untranslated(err)})
			end
		end, dialog, name, item)
	end
end

function IsLoadButtonDisabled(context)
	return (context and context.savegame_count or 0) == 0 and (not g_PopsSyncQueue or #g_PopsSyncQueue == 0) and not g_PopsSynchronizing
end