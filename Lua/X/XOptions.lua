function RebindKeys(idx, prop_ctrl)
	CreateRealTimeThread(function(idx, prop_ctrl)
		local obj = ResolvePropObj(prop_ctrl.context)
		local prop_meta = prop_ctrl.prop_meta
		local prop_id = prop_meta.id
		local prop_name = prop_meta.name
		local dlg = CreateMarsMessageBox(T{""}, T{4079, "Press a key to assign to <action>...", action = prop_name}, nil, terminal.desktop)
		dlg:PreventClose()
		local shortcut, keys, last_key
		repeat
			shortcut = WaitShortcut()
			if shortcut then
				keys = SplitShortcut(shortcut)
				last_key = keys[#keys]
			end
		until shortcut and not ForbiddenShortcutKeys[last_key] and not (prop_meta.single_key and (last_key == "Ctrl" or last_key == "Shift"))
		if prop_meta.single_key then
			shortcut = last_key
			keys = {last_key}
		end
		shortcut = last_key ~= "Escape" and shortcut
		if MouseButtonNames[last_key] and not prop_meta.mouse_bindable then
			local parent = dlg.parent
			dlg:Close()
			CreateMarsMessageBox(T{4080, "Conflicting controls"},
				T{4081, "<key> cannot be used for <action>.",
				key = MouseButtonNames[last_key] or T{last_key}, action = prop_name},
				T{1000136, "OK"}, parent)
			return
		end
		if shortcut then
			for _, ctrl in ipairs(prop_ctrl.parent) do
				local ctrl_meta = ctrl.prop_meta
				local bindings = obj[ctrl_meta.id]
				if bindings then
					for i = 1, #bindings do
						if ctrl_meta.id ~= prop_id and bindings[i] == shortcut then
							local old_action = ctrl_meta.name
							local new_action = prop_name
							local parent = dlg.parent
							dlg:Close()
							local res = WaitMarsQuestion(parent,
								T{4080, "Conflicting controls"},
								T{4082, "Do you want to rebind <key> from <old_action> to <new_action>?",
									key = ShortcutKeysToText(keys),
									old_action = old_action,
									new_action = new_action
								},
								T{1138, "Yes"},
								T{1139, "No"}
							)
							if res == "ok" then
								-- clear binding
								bindings[1] = i ~= 1 and bindings[1]or bindings[2]
								bindings[2] = nil
								obj:SetProperty(ctrl_meta.id, bindings)
								ctrl:OnPropUpdate(ctrl.context, ctrl_meta, bindings)
								break
							else
								return
							end
						end
					end
				end
			end
			local bindings = obj[prop_meta.id] or {}
			idx = bindings[1] and idx or 1
			bindings[idx] = shortcut
			if #bindings > 1 and bindings[1] == bindings[2] then
				bindings[2] = nil
			end
			obj:SetProperty(prop_meta.id, bindings)
			prop_ctrl:OnPropUpdate(prop_ctrl.context, prop_meta, bindings)
		end
		if dlg and dlg.window_state ~= "destroying" then
			dlg:Close()
		end
	end, idx, prop_ctrl)
end

function ApplyOptions(host)
	CreateRealTimeThread(function(host)
		local obj = ResolvePropObj(host.context)
		local original_obj = ResolvePropObj(host.idOriginalOptions.context)
		local category = GetDialogModeParam(host).id
		if not obj:WaitApplyOptions(original_obj) then
			WaitMarsMessage(nil, T{6884, "Warning"}, T{4091, "Changes could not be applied and will be reverted."}, T{1000136, "OK"})
		else
			local old_save_to_cloud = original_obj.AutosaveToCloud
			obj:CopyCategoryTo(original_obj, category)
			SaveEngineOptions()
			SaveAccountStorage()
			if category == "Keybindings" then
				ReloadShortcuts()
			end
			if category == "Gameplay" then
				ApplyLanguageOption()
				if old_save_to_cloud ~= original_obj.AutosaveToCloud then
					PopsSyncSaveGames()
				end
				if Platform.console then
					terminal.desktop:OnSystemSize(UIL.GetScreenSize()) --force refresh, UIScale might be changed
				end
			end
		end
		SetBackDialogMode(host)
	end, host)
end

function CancelOptions(host)
	CreateRealTimeThread(function(host)
		local obj = ResolvePropObj(host.context)
		local original_obj = ResolvePropObj(host.idOriginalOptions.context)
		local category = GetDialogModeParam(host).id
		original_obj:WaitApplyOptions()
		original_obj:CopyCategoryTo(obj, category)
		SetBackDialogMode(host)
	end, host)
end

function ApplyDisplayOptions(host)
	CreateRealTimeThread( function(host)
		local obj = ResolvePropObj(host.context)
		local original_obj = ResolvePropObj(host.idOriginalOptions.context)
		local ok = obj:ApplyVideoMode()
		if ok == "confirmation" then
			ok = WaitMarsQuestion(nil, T{4089, "Video mode change"}, T{4090, "The video mode has been changed. Keep changes?"}, T{1138, "Yes"}, T{1139, "No"}) == "ok"
		end
		if ok then
			obj:CopyCategoryTo(original_obj, "Display")
			original_obj:SaveToTables() 
			SaveEngineOptions() -- save the original + the new display options to disk, in case user cancels options menu
		else
			-- user doesn't like it, restore
			original_obj:ApplyVideoMode()
		end
		SetBackDialogMode(host)
	end, host)
end

function CancelDisplayOptions(host)
	local obj = ResolvePropObj(host.context)
	local original_obj = ResolvePropObj(host.idOriginalOptions.context)
	local category = GetDialogModeParam(host).id
	original_obj:CopyCategoryTo(obj, category)
	SetBackDialogMode(host)
end

function KeybindingName(shortcut)
	if not shortcut then return end
	local keys = SplitShortcut(shortcut)
	local last_key = keys[#keys]
	if MouseButtonImagesInText[last_key] then
		local text = string.sub(shortcut, 1, -(last_key:len())-1)
		text = text .. "<image " .. MouseButtonImagesInText[last_key] .. " 1800>"
		return T{text}
	else
		local text = ShortcutKeysToText(keys)
		return T{3846, "<name>", name = text}
	end
end

function ToggleFullscreen()
	CreateRealTimeThread(function(host)
		local original_obj = OptionsObjOriginal or OptionsCreateAndLoad()
		local mode = FullscreenMode()
		local new_mode
		if config.GraphicsApi == "d3d11" then
			new_mode = (mode == 0 or mode == 1) and 2 or 0
		else
			new_mode = mode == 0 and 1 or 0
		end
		SetProperty(original_obj, "FullscreenMode", new_mode)
		local ok = original_obj:ApplyVideoMode()
		if ok == "confirmation" then
			ok = WaitMarsQuestion(nil, T{4089, "Video mode change"}, T{4090, "The video mode has been changed. Keep changes?"}, T{1138, "Yes"}, T{1139, "No"}) == "ok"
		end
		if ok then
			--update options menu if it is open
			if OptionsObj then
				SetProperty(OptionsObj, "FullscreenMode", new_mode)
				ObjModified(OptionsObj)
			end
			original_obj:SetProperty("Resolution", UIL.GetScreenSize())
			original_obj:SaveToTables()
			SaveEngineOptions() -- save the original + the new display options to disk, in case user cancels options menu
		else
			-- user doesn't like it, restore
			SetProperty(original_obj, "FullscreenMode", mode)
			original_obj:ApplyVideoMode()
		end
	end)
end