if FirstLoad then
	MouseButtonImages = {
		["MouseL"] = "UI/Common/mouse_left_click.tga",
		["MouseR"] = "UI/Common/mouse_right_click.tga",
		["MouseM"] = "UI/Common/mouse_middle_click.tga",
		["MouseX1"] = "UI/Common/mouse_button_4.tga",
		["MouseX2"] = "UI/Common/mouse_button_5.tga",
		["MouseWheelFwd"] = "UI/Common/mouse_scroll_up.tga",
		["MouseWheelBack"] = "UI/Common/mouse_scroll_down.tga",
	}
	
	MouseButtonImagesInText = {
		["MouseL"] = "UI/Infopanel/left_click.tga",
		["MouseR"] = "UI/Infopanel/right_click.tga",
		["MouseM"] = "UI/Infopanel/middle_click.tga",
		["MouseX1"] = "UI/Infopanel/button_4.tga",
		["MouseX2"] = "UI/Infopanel/button_5.tga",
		["MouseWheelFwd"] = "UI/Infopanel/scroll_up.tga",
		["MouseWheelBack"] = "UI/Infopanel/scroll_down.tga",
	}

	MouseButtonNames = {
		MouseL = T{3839, "Left Mouse Button"},
		MouseR = T{3840, "Right Mouse Button"},
		MouseM = T{3841, "Middle Mouse Button"},
		MouseX1 = T{3842, "Mouse Button 4"},
		MouseX2 = T{3843, "Mouse Button 5"},
		MouseWheelFwd = T{3844, "Mouse Wheel Forward"},
		MouseWheelBack = T{3845, "Mouse Wheel Back"},
	}
	
	ForbiddenShortcutKeys = {
		Lwin = true,
		Rwin = true,
		Menu = true,
		MouseL = true,
		MouseR = true,
		MouseM = true,
		Enter = true,
	}
end

TFormat.GamepadShortcutName = function(shortcut)
	if not shortcut or shortcut == "" then
		return T{3847, "<red>Unassigned</red>"}
	end
	local buttons = SplitShortcut(shortcut)
	for i, button in ipairs(buttons) do
		buttons[i] = GetPlatformSpecificImageTag(button) or "?"
	end
	return Untranslated(table.concat(buttons))
end

TFormat.ShortcutName = function(action_id)
	local shortcuts = GetShortcuts(action_id)
	if GetUIStyleGamepad() and not (Platform.console and g_MouseConnected) then
		return TFormat.GamepadShortcutName(shortcuts[3])
	else
		if shortcuts and shortcuts[1] then
			local keys = SplitShortcut(shortcuts[1])
			local last_key = keys[#keys]
			if MouseButtonImagesInText[last_key] then
				local text = string.sub(shortcuts[1], 1, -(last_key:len())-1)
				text = text .. "<image " .. MouseButtonImagesInText[last_key] .. ">"
				return T{text}
			else
				local text = ShortcutKeysToText(keys)
				return T{3846, "<name>", name = text}
			end
		else
			return T{3847, "<red>Unassigned</red>"}
		end
	end
end

function GetShortcuts(action_id)
	if AccountStorage and AccountStorage.Shortcuts[action_id] then
		return AccountStorage.Shortcuts[action_id]
	elseif XShortcutsTarget then
		local idx = table.find(XShortcutsTarget.actions, "ActionId", action_id)
		if idx then
			local action = XShortcutsTarget.actions[idx]
			if action.ActionShortcut ~= "" or action.ActionShortcut2 ~= "" or action.ActionGamepad ~= "" then
				return {action.ActionShortcut, action.ActionShortcut2, action.ActionGamepad}
			end
		end
	end
	return false
end

function ShortcutKeysToText(keys)
	local texts = {}
	for k, v in ipairs(keys) do
		texts[k] = MouseButtonNames[v] or KeyNames[VKStrNamesInverse[v]]
	end
	return table.concat(texts, "-")
end