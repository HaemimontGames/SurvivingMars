--GamePadMenu
DefineClass.GamepadIGMenu = {
 __parents = {"ItemMenu"},
 hide_single_category = true,
}

function IsHUDResupplyEnabled()
	return (not g_Tutorial or g_Tutorial.EnableResupply) and g_Consts.SupplyMissionsEnabled == 1 and true or false
end

function IsHUDResearchEnabled()
	return (not g_Tutorial or g_Tutorial.EnableResearch) and true or false
end

local fnaction = function(content_data,item)
	local hud = GetHUD()
	if hud then
		local ctrl = hud[item.name]
		if ctrl then
			ctrl:Press()
		end
	else
		HUD.button_definitions[item.name].callback(this.idButton)
	end
end

local game_items = {
	{ --build menu
		name = "idBuild",
		display_name = T{4237, "Build Menu"},
		icon = "UI/Icons/console_build.tga",
		action = fnaction,
		description = "",
		close_parent = false,
	},
	{ --overview
		name = "idOverview",
		display_name = T{3996, "Map Overview"},
		icon = "UI/Icons/console_overview.tga",
		action = fnaction,
		description = "",
		close_parent = false,
	},
	{ --resupply
		name = "idResupply",
		display_name = T{3997, "Resupply"},
		icon = "UI/Icons/console_resupply.tga",
		enabled_fn = IsHUDResupplyEnabled,
		action = fnaction,
		description = "",
	},
	{ --researh
		name = "idResearch",
		display_name = T{311, "Research"},
		icon = "UI/Icons/console_research.tga",
		enabled_fn = IsHUDResearchEnabled,
		action = fnaction,
		description = "",
	},
	{ --command center
		name = "idColonyControlCenter",
		display_name = T{137542936955, "Command Center"},
		icon = "UI/Icons/console_command_center.tga",
		action = fnaction,
		description = "",
		close_parent = false,
	},
	{ --resource overview
		name = "idColonyOverview",
		display_name = T{7849, --[[Post-Cert]] "Colony Overview"},
		icon = "UI/Icons/console_statistics.tga",
		action = fnaction,
		description = "",
		close_parent = false,
	},
	{ --markers
		name = "idMarkers",
		display_name = T{973748367669, "Milestones"},
		icon = "UI/Icons/console_markers.tga",
		action = fnaction,
		description = "",
	},
	{ --radio
		name = "idRadio",
		display_name = T{796804896133, "Radio"},
		icon = "UI/Icons/console_radio.tga",
		action = fnaction,
		description = "",
	},
	{ --encyclopedia
		name = "encyclopedia",
		display_name = T{7384, "Encyclopedia"},
		icon = "UI/Icons/console_encyclopedia.tga",
		action = function(this)
			PlayFX("EncyclopediaButtonClick", "start")
			OpenEncyclopedia()
		end,
		description = "",
	},
}

function GamepadIGMenu:Init()
	SelectObj(false)
	CloseInfopanelItems()
end

function GamepadIGMenu:Open(...)
	self:RecalculateMargins()
	ItemMenu.Open(self, ...)
end

function GamepadIGMenu:GetCategories()
	return empty_table
end

function GamepadIGMenu:GetItems(category_id)
	local buttons = {}
	for i=1, #game_items do
		local item = game_items[i]
		item.ButtonAlign = i%2==1 and "top" or "bottom"
		local enabled_fn = rawget(item, "enabled_fn")
		if enabled_fn then
			item.enabled = enabled_fn()
		end
		local btn = HexButtonItem:new(item, self.idButtonsList)
		if enabled_fn then
			btn:SetEnabled(item.enabled)
		end
		buttons[#buttons + 1] = btn
	end
	return buttons
end

function GamepadIGMenu:OnXButtonUp(button, controller_id)
	if button == "LeftTrigger" or button == "Start" then
		CloseXGamepadMainMenu()
		return "break"
	end
	
	return ItemMenu.OnXButtonUp(self, button, controller_id)
end

function GamepadIGMenu:RecalculateMargins()
	self:SetMargins(OnScreenHintDlg.Margins + GetSafeMargins())
end

function OnMsg.SafeAreaMarginsChanged()
	local dlg = GetXDialog("GamepadIGMenu")
	if dlg then
		dlg:RecalculateMargins()
	end
end

function GamepadIGMenu:Close(...)
	ItemMenu.Close(self,...)
end

function OpenXGamepadMainMenu()
	--don't open this over the pregame menu
	if not GameState.gameplay then return end
	
	--Don't open this one while the build menu is opened
	if GetXDialog("XBuildMenu") then
		return 
	end
	
	return GetXDialog("GamepadIGMenu") or 
			 OpenXDialog("GamepadIGMenu", GetInGameInterface(), empty_table)
end

function CloseXGamepadMainMenu()
	CloseXDialog("GamepadIGMenu")
end

function OnMsg.SelectionChange()
	if SelectedObj then
		CloseXGamepadMainMenu()
	end
end

