function CreateMarsRenameControl(actionbar_parent, title, initial_text, ok_func, cancel_func, context, params)
	if actionbar_parent then
		actionbar_parent:ShowActionBar(false)
	end
	params = params or {}
	context = SubContext(context, params)
	local max_len = params and params.max_len
	ok_func = ok_func or __empty_function__
	cancel_func = cancel_func or __empty_function__
	local steam_keyboard = Platform.steam and GetUIStyleGamepad()
	local function Keyboard(dialog)
		CreateRealTimeThread(function(dialog)
			local text, err, shown = WaitControllerTextInput(initial_text, title, "", max_len or 255, params and params.password)
			if not shown and steam_keyboard then
				CreateMessageBox(T{1000620, "Warning"}, T{10972, "Steam virtual keyboard requires Steam Big Picture Mode to be enabled. Please restart the game from Big Picture Mode in order to use the Steam virtual keyboard."})
			end
			if err or not shown or text == "" then
				cancel_func(text)
			else
				if params.check_format and params.pattern and params.format and not string.match(text, params.pattern) then
					CreateMarsMessageBox(T{7730, "Invalid input"}, T{7731, "<field> should be in the format <format>", field = title, format = params.format}, T{1000136, "OK"})
				else
					ok_func(text)
				end
			end
			if actionbar_parent then
				actionbar_parent:ShowActionBar(true)
			end
			if dialog then
				dialog:Close()
			end
		end, dialog)
	end
	if (Platform.console or steam_keyboard) and not params.console_show then
		Keyboard()
	else
		local dlg = OpenDialog("MarsRenameControl", nil, context)
		if (Platform.console or steam_keyboard) and params.console_show then
			local rename_action = table.find_value(dlg.actions, "ActionId", "rename")
			if rename_action then
				rename_action.OnAction = function()
					Keyboard(dlg)
				end
			end
		end
		dlg.idRenameTitle:SetText(title)
		if params and params.password then
			dlg.idEdit:SetPassword(true)
		end
		if max_len then
			dlg.idEdit:SetMaxLen(max_len)
		end
		dlg.idEdit:SetText(initial_text)
		if not Platform.console then
			dlg.idEdit:SetFocus()
		end
		local ok_idx = table.find(dlg.actions, "ActionId", "ok")
		local cancel_idx = table.find(dlg.actions, "ActionId", "cancel")
		dlg.actions[ok_idx].OnAction = function(self, host, source)
			local text = host.idEdit:GetText()
			local keep_open = false
			if text and text~="" then
				if params.check_format and params.pattern and params.format and not string.match(text, params.pattern) then
					CreateMarsMessageBox(T{7730, "Invalid input"}, T{7731, "<field> should be in the format <format>", field = title, format = params.format}, T{1000136, "OK"})
					keep_open = true
				else
					ok_func(text)
				end
			else
				cancel_func(text)
			end	
			if not keep_open then
				if actionbar_parent then
					actionbar_parent:ShowActionBar(true)
				end
				host:Close()
			end
		end
		dlg.actions[cancel_idx].OnAction = function(self, host, source)
			local text = host.idEdit:GetText()
			cancel_func(text)
			if actionbar_parent then
				actionbar_parent:ShowActionBar(true)
			end
			host:Close()
		end
		dlg:SetModal()
	end
end