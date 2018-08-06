if FirstLoad then
	g_ParadoxModsContextObj = false
	g_PopsDownloadModsQueue = false
	g_PopsDownloadingMods = false
	g_PopsDownloadModsScreenshotsQueue = false
	g_PopsRetrieveModDetailsThread = false
	g_PopsRateFlagThread = false
	g_PopsUninstallModThread = false
	g_PopsEnableModThread = false
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
							T{6899, "Warning"}, 
							T{4164, "Mods are player created software packages that modify your game experience. USE THEM AT YOUR OWN RISK! We do not examine, monitor, support or guarantee this user created content. You should take all precautions you normally take regarding downloading files from the Internet before using mods."}, 
							T{6900, "OK"}, 
							T{4165, "Back"}
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

function ModsUIGetModCorruptedStatus(mod)
	if mod.lua_revision < ModMinLuaRevision then
		return true, T{"(design)Incompatible mod version."}
	elseif mod.lua_revision > LuaRevision then
		return true, T{"(design)Game update required!"}
	end
	return false
end

PopsModsUISortItems = {
	{id = "displayName_asc",  name = T{"(design)Alphabetically (ASC)"}, name_uppercase = T{"(design)ALPHABETICALLY (ASC)"} },
	{id = "displayName_desc", name = T{"(design)Alphabetically (DESC)"},name_uppercase = T{"(design)ALPHABETICALLY (DESC)"}},
	{id = "created_asc",       name = T{"(design)Oldest first"},         name_uppercase = T{"(design)OLDEST FIRST"}},
	{id = "created_desc",      name = T{"(design)Most recent first"},    name_uppercase = T{"(design)MOST RESENT FIRST"}},
	{id = "rating_asc",        name = T{"(design)Rating (ASC)"},         name_uppercase = T{"(design)RATING (ASC)"}},
	{id = "rating_desc",       name =  T{"(design)Rating (DESC)"},       name_uppercase = T{"(design)RATING (DESC)"}},
}

function ModsUIChooseSort(parent)
	local dlg = GetDialog(parent)
	local obj = dlg.context
	obj.popup_shown = "sort"
	local wnd = XTemplateSpawn("ModsUISortFilter", parent, obj)
	wnd:Open()
	wnd.idTitle:SetText(T{10124, "Sort"})
	return wnd
end

function ModsUIChooseFilter(parent)
	local dlg = GetDialog(parent)
	local obj = dlg.context
	obj.popup_shown = "filter"
	local wnd = XTemplateSpawn("ModsUISortFilter", parent, obj)
	wnd:Open()
	table.clear(obj.temp_tags)
	for k,v in pairs(obj.set_tags) do
		obj.temp_tags[k] = v
	end
	wnd.idTitle:SetText(T{10426, "Filter by"})
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
		txt:SetTextColor(RGBA(173, 173, 173, 255))
		btn:SetTextColor(RGBA(246, 246, 246, 255))
		btn:SetRolloverTextColor(RGBA(246, 246, 246, 255))
		img:SetRow(1)
		ModsUIClosePopup(dlg)
		return
	end
	back:SetVisible(true)
	txt:SetTextColor(RGBA(0,0,0,255))
	btn:SetTextColor(RGBA(0,0,0,255))
	btn:SetRolloverTextColor(RGBA(0,0,0, 255))
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
	wnd.idTitle:SetText(T{10397, "Flag <ModName>", ModName = Untranslated(context.DisplayName)})
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
	local dlg = GetDialog(parent)
	local obj = dlg.context
	local context = dlg.mode_param
	local wnd = XTemplateSpawn("ModsUIRate", parent, context)
	wnd:Open()
	obj.popup_shown = "rate"
	wnd.idTitle:SetText(T{10385, "Rate <ModName>", ModName = Untranslated(context.DisplayName)})
	wnd.idText:SetText(T{10386, "Use the stars below to rate the <game_title> mod <ModName> by <AuthorName>", game_title = T{1079, "Surviving Mars"}, ModName = Untranslated(context.DisplayName), AuthorName = Untranslated(context.Author)})
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

function ModsUIInstallMod(mod)
	mod = mod or g_ParadoxModsContextObj and g_ParadoxModsContextObj:GetSelectedMod()
	if mod and not g_PopsDownloadingMods[mod.ModID] then
		g_PopsDownloadModsQueue:push(mod)
		g_PopsDownloadingMods[mod.ModID] = true
		ObjModified(mod)
	end
end

function ModsUIUninstallMod(mod, obj_table)
	g_PopsUninstallModThread = IsValidThread(g_PopsUninstallModThread) and g_PopsUninstallModThread or CreateRealTimeThread(function(mod, obj_table)
		mod = mod or g_ParadoxModsContextObj:GetSelectedMod(obj_table)
		local id = mod.ModID
		local err
		err = AsyncOpWait(PopsAsyncOpTimeout, nil, "AsyncPopsModsUninstallMod", id)
		if err then
			print("Error uninstalling mod: "..err)
		else
			mod.Installed = nil
			mod.Corrupted = nil
			mod.Warning = nil
			local mod_def = g_ParadoxModsContextObj and g_ParadoxModsContextObj.mod_defs[mod.ModID]
			if mod_def then
				g_ParadoxModsContextObj.mod_defs[mod.ModID] = nil
				mod_def:delete()
				table.remove_entry(AccountStorage.LoadMods, mod_def.id)
			end
			--try to remove the local files
			local file_err = AsyncDeletePath(g_PopsModsDownloadPath .. mod.DisplayName)
			if file_err then
				print("Error deleting mod " .. file_err)
			end
			if g_ParadoxModsContextObj then
				g_ParadoxModsContextObj.installed[mod.ModID] = false
				g_ParadoxModsContextObj.enabled[mod.ModID] = false
				g_ParadoxModsContextObj:GetInstalledMods(mod)
			end
		end
	end, mod, obj_table)
end

function ModsUIToggleEnabled(mod, win, obj_table)
	g_PopsEnableModThread = IsValidThread(g_PopsEnableModThread) and g_PopsEnableModThread or CreateRealTimeThread(function(mod, win, obj_table)
		mod = mod or g_ParadoxModsContextObj:GetSelectedMod(obj_table)
		local id = mod.ModID
		local enabled = not g_ParadoxModsContextObj.enabled[id]
		local err
		if not mod.Local then
			local func = enabled and "AsyncPopsModsEnableMod" or "AsyncPopsModsDisableMod"
			err = AsyncOpWait(PopsAsyncOpTimeout, nil, func, id)
		end
		if err then
			print("Error enabling/disabling mod: " .. err)
		else
			--add/remove from AccountStorage
			if mod.Local then
				ToggleLoadMod(id)
			else
				for k, v in pairs(Mods) do
					if v.paradox_uuid == mod.Name then
						ToggleLoadMod(v.id)
						break
					end
				end
			end
			g_ParadoxModsContextObj.enabled[id] = enabled
			ObjModified(mod)
			if win and win.window_state ~= "destroying" then
				local dlg = GetDialog(win)
				dlg:UpdateActionViews(dlg)
			end
		end
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
			if obj.local_mods[id] then
				return true
			else
				local installed = ModsUIShowItemAction(host, "installed", true, mod_id)
				if not installed then return false end
				local corrupted = false
				local mod_def = obj.mod_defs[id]
				if mod_def then
					corrupted = ModsUIGetModCorruptedStatus(mod_def)
				end
				return not corrupted
			end
		end
		return false
	elseif action == "installed" and obj.local_mods[id] then
		return false
	end
	return obj[action][id] == value
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
end

function ModsUISetDialogMode(win, mode, mode_param)
	if mode == "details" and not next(mode_param) then return end
	local dlg = GetDialog(win)
	if dlg:GetMode() ~= mode then
		local list = win:ResolveId("idList")
		if list then
			list:ScrollTo(0,0)
		end
		ModsUISetSelectedMod(false)
		dlg:SetMode(mode, mode_param)
	end
end

local MarkdownProperties = {
	TextColor = RGB(26,26,26),
}

function ModsUIRetrieveModDetails(mod)
	DeleteThread(g_PopsRetrieveModDetailsThread)
	g_PopsRetrieveModDetailsThread = CreateRealTimeThread(function(mod)
		mod.details_retrieved = true
		if not mod.Local then
			local err, result = AsyncOpWait(PopsAsyncOpTimeout, nil, "AsyncPopsModsGetDetails", mod.ModID, false)
			if not err then
				local changelog = result.ChangeLog and table.reverse(result.ChangeLog)
				mod.ChangeLog = changelog
				for i = 1, #(changelog or "") do
					local entry = changelog[i]
					entry.Details = ParseMarkdown(string.gsub(entry.Details, "\r\n", "\n"), {TextColor = RGB(135, 135, 135)})
					entry.Released = string.match(entry.Released, "^(%d%d%d%d%-%d%d%-%d%d).*")
				end
				mod.LongDescription = ParseMarkdown(string.gsub(result.LongDescription, "\r\n", "\n"), MarkdownProperties)
				mod.ShortDescription = ParseMarkdown(string.gsub(result.ShortDescription, "\r\n", "\n"), MarkdownProperties)
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
						mod.RequiredMods[#mod.RequiredMods + 1] = requirements[i].Name
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

function ModsUIConsoleSearch()
	local obj = g_ParadoxModsContextObj
	if obj then
		CreateRealTimeThread(function(obj)
			local text, err = WaitControllerTextInput("", T{10485, "Search mods..."}, "", 255, false)
			if not err then
				text = text:trim_spaces()
				if obj.query ~= text then
					obj.query = text
					obj:GetMods()
				end
			end
		end, obj)
	end
end

DefineClass.PDXModsObject = {
	__parents = { "InitDone" },
	mods = false,
	counted = false,
	installed_retrieved = false,
	installed_mods = false,
	local_mods = false,
	
	enabled = false,
	installed = false,
	mod_defs = false,
	
	temp_tags = false,
	set_tags = false,
	set_sort = "displayName_asc",
	popup_shown = false,
	
	get_mods_thread = false,
	installed_thread = false,
	
	mods_info_thread = false,
	mods_info_queue = false,
	retrieved_mod_pages = false,
	
	query = "",
	selected_mod_id = false,
}

function PDXModsObject:Init()
	self.temp_tags= {}
	self.set_tags= {}
	self.installed = {}
	self.enabled = {}
	self.mod_defs = {}
	self.mods_info_queue = PopsQueue:new{push_message = "PopsModGetInfoPush"}
	self.retrieved_mod_pages = {}
	if not g_PopsAttemptingLogin then
		self:GetInstalledMods()
		if not g_ParadoxAccountLinked then
			self.counted = true
			return
		end
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

function PDXModsObject:GetMods()
	if not g_ParadoxAccountLinked then return end
	DeleteThread(self.get_mods_thread)
	self.get_mods_thread = CreateRealTimeThread(function(self)
		collectgarbage("collect")
		self.mods = {}
		self.selected_mod_id = false
		self.counted = false
		ObjModified(self) --show spinner while self.counted == false
		DeleteThread(self.mods_info_thread)
		table.iclear(self.mods_info_queue)
		table.clear(self.retrieved_mod_pages)
		local mods = self.mods
		local sortby, orderby = string.match(self.set_sort, "^([^_]*)_(.*)$")
		local query_params = {
			Query = self.query,
			Tags = table.keys(self.set_tags),
			SortBy = sortby or "",
			OrderBy = orderby or "",
			OSType = false,
		}
		local err, count = AsyncOpWait(PopsAsyncOpTimeout, nil, "AsyncPopsModsCount", query_params)
		if err then
			--TODO - some sensible error handling
			print("Error getting mod count: "..err)
		else 
			for i = 1, count do
				mods[i] = {} --this will be the context of each item
			end
		end
		self.counted = true
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
					OSType = false,
				}
				local err, results = AsyncOpWait(PopsAsyncOpTimeout, nil, "AsyncPopsModsSearch", query_params)
				if err then
					print("Error searching mods: "..err)
				else
					self.retrieved_mod_pages[page] = true
					local mods = self.mods
					for i = 1, #results do
						local result = results[i]
						local mod = mods[page * ModsUIPageSize + i]
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
						--download image
						ModsUIDownloadScreenshots(mod)
						self.installed[mod.ModID] = self.installed[mod.ModID] or false
						self.enabled[mod.ModID] = self.enabled[mod.ModID] or false
						ObjModified(mod)
					end
				end
			end
		end
	end)
end

function PDXModsObject:GetInstalledModsCount()
	return #(self.installed_mods or "")
end

function PDXModsObject:GetInstalledMods(modify_obj)
	DeleteThread(self.installed_thread)
	self.installed_thread = CreateRealTimeThread(function(self)
		collectgarbage("collect")
		self.installed_mods = {}
		self.local_mods = {}
		if not modify_obj then
			self.installed_retrieved = false
			ObjModified(self)
		end
		local mods = self.installed_mods
		if g_ParadoxAccountLinked then
			local query_params = {OnlyInstalled = 1, PageSize = 100, OSType = false}
			local err, count = AsyncOpWait(PopsAsyncOpTimeout, nil, "AsyncPopsModsCount", query_params)
			if not err then
				for i = 0, (count-1) / 100 do
					query_params.Page = i
					local installed
					err, installed = AsyncOpWait(PopsAsyncOpTimeout, nil, "AsyncPopsModsSearch", query_params)
					if err then
						print("Error retrieving installed mods: "..err)
					else
						for j = 1, #installed do
							local mod = installed[j]
							local enabled = mod.Enabled --don't use this after that, sync this using the context object
							mod.Enabled = nil
							mods[#mods + 1] = mod
							local metadata = table.find_value(mod.MetaData, "Key", "size_in_memory")
							if metadata then
								local value = string.gsub(metadata.Value, ",", "")
								mod.FileSize = tonumber(value)
							end
							ModsUIDownloadScreenshots(mod)
							local mod_def
							for k, v in pairs(Mods) do
								if v.paradox_uuid == mod.Name then
									if enabled then
										TurnModOn(v.id)
									else
										table.remove_entry(AccountStorage.LoadMods, v.id)
									end
									mod_def = v
									self.mod_defs[mod.ModID] = v
									break
								end
							end
							self.enabled[mod.ModID] = enabled
							self.installed[mod.ModID] = true
							if mod_def then
								g_PopsDownloadingMods[mod.ModID] = nil
								mod.Corrupted, mod.Warning = ModsUIGetModCorruptedStatus(mod_def)
							end
						end
					end
				end
			end
		end
		for k, v in sorted_pairs(Mods) do
			if v.source ~= "pops" then
				local author = v.author ~= "" and v.author or "Unknown"
				mods[#mods+1] = {
					ModID = k,
					DisplayName = v.title,
					Author = author,
					Thumbnail = v.image ~= "" and v.image or "UI/Common/Placeholder.tga",
					ModVersion = v.version,
					Local = true,
					Source = v.source,
					LongDescription = v.description,
				}
				self.enabled[k] = not not table.find(AccountStorage.LoadMods, v.id)
				self.installed[k] = true
				self.local_mods[k] = true
			end
		end
		self.installed_retrieved = true
		if modify_obj then
			ObjModified(modify_obj)
		end
		ObjModified(self)
	end, self)
end

function PDXModsObject:SetSortMethod(id)
	if self.set_sort ~= id then
		self.set_sort = id
		self:GetMods()
	end
end

function PDXModsObject:GetSortTextUppercase()
	local item = table.find_value(PopsModsUISortItems, "id", self.set_sort)
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
	local obj = g_ParadoxModsContextObj
	if obj then
		obj.counted = true
		ObjModified(obj)
	end
end

function OnMsg.PopsAccountDetailsRetrieved()
	--check for missing installed mods and download them
	CreateRealTimeThread(function()
		local query_params = {OnlyInstalled = 1, PageSize = 100, OSType = false}
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
							if v.paradox_uuid == mod.Name then
								found = true
								break
							end
						end
						if not found then
							ModsUIInstallMod(mod)
						end
					end
				end
			end
		end
	end)
	local main = GetDialog("PGMainMenu")
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
		local mod_def = g_ParadoxModsContextObj and g_ParadoxModsContextObj.mod_defs[mod.ModID]
		if not mod_def then
			for k, v in pairs(Mods) do
				if v.paradox_uuid == mod.Name then
					mod_def = v
					break
				end
			end
		end
		local corrupted = mod_def and ModsUIGetModCorruptedStatus(mod_def)
		local err
		if not corrupted then
			err = AsyncOpWait(PopsAsyncOpTimeout, nil, "AsyncPopsModsEnableMod", mod.ModID)
			if err then
				print("Error enabling mod: "..err)
			elseif mod_def then
				TurnModOn(mod_def.id)
			end
		end
		if not err and g_ParadoxModsContextObj then
			g_ParadoxModsContextObj:GetInstalledMods(mod)
		end
	end, mod)
end

function StartPopsModsDownloadThread()
	CreateRealTimeThread(function()
		g_PopsDownloadModsQueue = PopsQueue:new{push_message = "PopsDownloadModPush"}
		g_PopsDownloadingMods = {}
		while true do
			WaitMsg("PopsDownloadModPush")
			while #g_PopsDownloadModsQueue > 0 do
				local entry = g_PopsDownloadModsQueue:pop()
				WaitInstallPopsMod(entry)
			end
		end
	end)
end

function StartPopsModsScreenshotDownloadThread()
	CreateRealTimeThread(function()
		AsyncCreatePath(g_PopsModsScreenshotsPath)
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

if FirstLoad then
	StartPopsModsDownloadThread()
	StartPopsModsScreenshotDownloadThread()
end

---- SignUp ----
local months = {T{10427, "January"},T{10428, "February"},T{10429, "March"},T{10430, "April"},T{10431, "May"},T{10432, "June"},T{10433, "July"},T{1962, "August"},T{10434, "September"},T{10435, "October"},T{10436, "November"},T{10437, "December"}}
function ModsUIFillBirthDataCombos(self)
	--day:1-31, month:January_December (translated), Year:1900-Current
	local items = {}
	items[1] = {name = _InternalTranslate(T{7715, "Day"}), id = ""}
	for i=1, 31 do
		items[#items + 1] = {name = tostring(i), id = i}
	end
	self:ResolveId("idDay").idCombo:SetItems(items)
	items = {}
	items[1] = {name = T{7714, "Month"}, id = ""}
	for i=1, #months do
		items[#items+1] = {name = months[i], id = i}
	end
	self:ResolveId("idMonth").idCombo:SetItems(items)
	items = {}
	local start = tonumber(os.date("%Y"))
	items[1] = {name = _InternalTranslate(T{10438, "Year"}), id = ""}
	for i = start, 1900, -1 do
		items[#items + 1] = {name = tostring(i), id = i}
	end
	self:ResolveId("idYear").idCombo:SetItems(items)
end

---------Flags------------
PopsModsUIFlagReasons = {
	--{ name = T{10439, "Nudity"},       id = "nudity" },
	--{ name = T{10440, "Violence"},     id = "violence" },
	--{ name = T{10441, "Harassment"},   id = "harassment" },
	--{ name = T{10442, "Spam"},         id = "spam" },
	{ name = T{10443, "Copyright infringement"}, id = "copyright" },
	--{ name = T{10444, "Hate speech"},  id = "hate" },
	{ name = T{10541, "Inappropriate"}, id = "inappropriate" },
	{ name = T{10445, "Somehing else"},id = "other" },
}
