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

GamepadIGMenu_game_items = {
	{ --build menu
		name = "idBuild",
		display_name = T(4237, "Build Menu"),
		icon = "UI/Icons/console_build.tga",
		action = function() HUD.idBuildOnPress() end,
		description = "",
		close_parent = false,
	},
	{ --overview
		name = "idOverview",
		display_name = T(3996, "Map Overview"),
		icon = "UI/Icons/console_overview.tga",
		action = function() HUD.idOverviewOnPress() end,
		description = "",
		close_parent = false,
	},
	{ --resupply
		name = "idResupply",
		display_name = T(3997, "Resupply"),
		icon = "UI/Icons/console_resupply.tga",
		enabled_fn = IsHUDResupplyEnabled,
		action = function() HUD.idResupplyOnPress() end,
		description = "",
	},
	{ --researh
		name = "idResearch",
		display_name = T(311, "Research"),
		icon = "UI/Icons/console_research.tga",
		enabled_fn = IsHUDResearchEnabled,
		action = function() HUD.idResearchOnPress() end,
		description = "",
	},
	{ --mars screen
		name = "idMarsScreen",
		display_name = T(11030, "Planetary View"),
		icon = "UI/Icons/console_mars_screen.tga",
		enabled_fn = function () return not g_Tutorial end,
		action = function() HUD.idPlanetaryViewOnPress() end,
		description = "",
	},
	{ --goals
		name = "idGoals",
		display_name = T(10092, "Mission Profile"),
		icon = "UI/Icons/console_goals.tga",
		enabled_fn = function () return not g_Tutorial end,
		action = function() HUD.idGoalsOnPress() end,
		description = "",
	},
	
	{ --command center
		name = "idColonyControlCenter",
		display_name = T(137542936955, "Command Center"),
		icon = "UI/Icons/console_command_center.tga",
		action = function() HUD.idColonyControlCenterOnPress() end,
		description = "",
		close_parent = false,
	},
	{ --markers
		name = "idMilestones",
		display_name = T(973748367669, "Milestones"),
		icon = "UI/Icons/console_milestones.tga",
		action = function() HUD.idMilestonesOnPress() end,
		description = "",
	},
	{ --radio
		name = "idRadio",
		display_name = T(796804896133, "Radio"),
		icon = "UI/Icons/console_radio.tga",
		action = function() HUD.idRadioOnPress() end,
		description = "",
	},
	{ --encyclopedia
		name = "encyclopedia",
		display_name = T(7384, "Encyclopedia"),
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
	self.idContainer:SetScaleModifier(point(750,750))
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
	for i=1, #GamepadIGMenu_game_items do
		local item = GamepadIGMenu_game_items[i]
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
	local hud, hud_margins = GetHUD()
	if hud then
		local gamepad = GetUIStyleGamepad() and not UseHybridControls()
		local ui_scale = GetUIScale()
		local hud_height = Max(hud.idBottom.measure_height, hud.idBottom.MinHeight)
		hud_height = MulDivRound(hud_height, 100, ui_scale)
		local bottom_margin = gamepad and 0 or hud_height
		hud_margins = box(0, 0, 0, bottom_margin)
	end
	self:SetMargins(GamepadIGMenu.Margins + hud_margins + GetSafeMargins())
end

function OnMsg.SafeAreaMarginsChanged()
	local dlg = GetDialog("GamepadIGMenu")
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
	if GetDialog("XBuildMenu") then
		return 
	end
	
	--The hud needs to be visible
	local hud = GetDialog("HUD")
	if not hud or not hud:GetVisible() then
		return
	end
	
	return GetDialog("GamepadIGMenu") or 
			 OpenDialog("GamepadIGMenu", GetInGameInterface(), empty_table)
end

function CloseXGamepadMainMenu()
	CloseDialog("GamepadIGMenu")
end

function OnMsg.SelectionChange()
	if SelectedObj then
		CloseXGamepadMainMenu()
	end
end

