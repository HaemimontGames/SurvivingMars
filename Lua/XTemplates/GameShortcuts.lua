-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "Default",
	id = "GameShortcuts",
	PlaceObj('XTemplateAction', {
		'ActionMode', "Game",
	}, {
		PlaceObj('XTemplateAction', {
			'ActionId', "actionPOCMapAlt0",
			'ActionName', T{727272233433, --[[XTemplate GameShortcuts ActionName]] "Open Empty Map"},
			'ActionShortcut', "Alt-0",
			'OnAction', function (self, host, source, toggled)
CheatChangeMap("POCMap_Alt_00")
end,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "actionPOCMapAlt1",
			'ActionName', T{4521, --[[XTemplate GameShortcuts ActionName]] "Open POC Map 1"},
			'ActionShortcut', "Alt-1",
			'OnAction', function (self, host, source, toggled)
CheatChangeMap("POCMap_Alt_01")
end,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "actionPOCMapAlt2",
			'ActionName', T{722962309661, --[[XTemplate GameShortcuts ActionName]] "Open POC Map 2"},
			'ActionShortcut', "Alt-2",
			'OnAction', function (self, host, source, toggled)
CheatChangeMap("POCMap_Alt_02")
end,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "actionPOCMapAlt3",
			'ActionName', T{753123816124, --[[XTemplate GameShortcuts ActionName]] "Open POC Map 3"},
			'ActionShortcut', "Alt-3",
			'OnAction', function (self, host, source, toggled)
CheatChangeMap("POCMap_Alt_03")
end,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "actionPOCMapAlt4",
			'ActionName', T{4522, --[[XTemplate GameShortcuts ActionName]] "Open POC Map 4"},
			'ActionShortcut', "Alt-4",
			'OnAction', function (self, host, source, toggled)
CheatChangeMap("POCMap_Alt_04")
end,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "actionPOCMapAlt5",
			'ActionName', T{6974, --[[XTemplate GameShortcuts ActionName]] "Open POC Map LateGame"},
			'ActionShortcut', "Alt-5",
			'OnAction', function (self, host, source, toggled)
CheatChangeMap("POCMap_LateGame")
end,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "actionInGameMainMenu",
			'ActionName', T{152768500780, --[[XTemplate GameShortcuts ActionName]] "Toggle In Game Main Menu"},
			'ActionShortcut', "Escape",
			'ActionGamepad', "Start",
			'OnAction', function (self, host, source, toggled)
local igi = GetInGameInterface()
local dlg = GetDialog("HUD")
local modal = terminal.desktop:GetModalWindow()
if igi and dlg and dlg.ctrl_state ~= "destroying" and igi:GetVisible() and (not modal or modal == terminal.desktop) then
	dlg.idMenu:Press()
else
	CloseIngameMainMenu()
end
end,
			'IgnoreRepeated', true,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "actionPanUp",
			'ActionMode', "ForwardToC",
			'ActionName', T{964722863858, --[[XTemplate GameShortcuts ActionName]] "Pan Up"},
			'ActionShortcut', "W",
			'ActionShortcut2', "Up",
			'ActionBindable', true,
			'ActionMouseBindable', false,
			'ActionBindSingleKey', true,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "actionPanDown",
			'ActionMode', "ForwardToC",
			'ActionName', T{981867141540, --[[XTemplate GameShortcuts ActionName]] "Pan Down"},
			'ActionShortcut', "S",
			'ActionShortcut2', "Down",
			'ActionBindable', true,
			'ActionMouseBindable', false,
			'ActionBindSingleKey', true,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "actionPanLeft",
			'ActionMode', "ForwardToC",
			'ActionName', T{199913045993, --[[XTemplate GameShortcuts ActionName]] "Pan Left"},
			'ActionShortcut', "A",
			'ActionShortcut2', "Left",
			'ActionBindable', true,
			'ActionMouseBindable', false,
			'ActionBindSingleKey', true,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "actionPanRight",
			'ActionMode', "ForwardToC",
			'ActionName', T{644017017186, --[[XTemplate GameShortcuts ActionName]] "Pan Right"},
			'ActionShortcut', "D",
			'ActionShortcut2', "Right",
			'ActionBindable', true,
			'ActionMouseBindable', false,
			'ActionBindSingleKey', true,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "actionRotLeft",
			'ActionMode', "ForwardToC",
			'ActionName', T{741646947499, --[[XTemplate GameShortcuts ActionName]] "Rotate Camera Left"},
			'ActionShortcut', "Q",
			'ActionBindable', true,
			'ActionMouseBindable', false,
			'ActionBindSingleKey', true,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "actionRotRight",
			'ActionMode', "ForwardToC",
			'ActionName', T{892715092566, --[[XTemplate GameShortcuts ActionName]] "Rotate Camera Right"},
			'ActionShortcut', "E",
			'ActionBindable', true,
			'ActionMouseBindable', false,
			'ActionBindSingleKey', true,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "actionZoomIn",
			'ActionMode', "ForwardToC",
			'ActionName', T{279635353384, --[[XTemplate GameShortcuts ActionName]] "Zoom In"},
			'ActionShortcut', ".",
			'ActionBindable', true,
			'ActionBindSingleKey', true,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "actionZoomOut",
			'ActionMode', "ForwardToC",
			'ActionName', T{305580647526, --[[XTemplate GameShortcuts ActionName]] "Zoom Out"},
			'ActionShortcut', ",",
			'ActionBindable', true,
			'ActionBindSingleKey', true,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "actionOrbitCamera",
			'ActionMode', "ForwardToC",
			'ActionName', T{969312516259, --[[XTemplate GameShortcuts ActionName]] "Orbit Camera"},
			'ActionShortcut', "Alt",
			'ActionBindable', true,
			'ActionMouseBindable', false,
			'ActionBindSingleKey', true,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "actionPauseGame",
			'ActionName', T{200927746859, --[[XTemplate GameShortcuts ActionName]] "Pause Game"},
			'ActionShortcut', "Space",
			'ActionShortcut2', "Pause",
			'ActionGamepad', "DPadDown",
			'ActionBindable', true,
			'OnAction', function (self, host, source, toggled)
local igi = GetInGameInterface()
if igi and igi:GetVisible() then
	if PauseReasons.Debug then Resume("Debug") else TogglePause() end
end
end,
			'IgnoreRepeated', true,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "actionSpeedUp",
			'ActionName', T{933108950407, --[[XTemplate GameShortcuts ActionName]] "Speed Up"},
			'ActionShortcut', "+",
			'ActionShortcut2', "Numpad +",
			'ActionGamepad', "DPadRight",
			'ActionBindable', true,
			'OnAction', function (self, host, source, toggled)
local igi = GetInGameInterface()
if not igi or not igi:GetVisible() then return end
if Platform.developer then
	local factor = GetTimeFactor() * 12 / 10
	SetTimeFactor(Clamp(factor, 0, 100000), "sync")
	local current_factor = GetTimeFactor()
	if factor > 0 and factor == current_factor then
		PlayFX("GameSpeedUp", "start")
	end
elseif GetDialog("HUD") then
	ChangeGameSpeedState(1)
end
end,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "actionSpeedDown",
			'ActionName', T{450845916933, --[[XTemplate GameShortcuts ActionName]] "Speed Down"},
			'ActionShortcut', "-",
			'ActionShortcut2', "Numpad -",
			'ActionGamepad', "DPadLeft",
			'ActionBindable', true,
			'OnAction', function (self, host, source, toggled)
local igi = GetInGameInterface()
if not igi or not igi:GetVisible() then return end
if Platform.developer then
	local current_factor = GetTimeFactor()
	local new_factor = current_factor * 10 / 12
	if new_factor < current_factor then
		if new_factor == 0 then
			PlayFX("GamePause", "start")
			Msg("MarsPause")
		else
			PlayFX("GameSpeedDown", "start")
		end
	end
	SetTimeFactor(Clamp(new_factor, 0, 100000), "sync")
elseif GetDialog("HUD") then
	ChangeGameSpeedState(-1)
end
end,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "actionToggleHighSpeed",
			'ActionName', T{852738262115, --[[XTemplate GameShortcuts ActionName]] "Toggle High Speed"},
			'ActionShortcut', "Numpad *",
			'ActionBindable', true,
			'OnAction', function (self, host, source, toggled)
local igi = GetInGameInterface()
if not igi or not igi:GetVisible() then return end
if UICity then
	if GetTimeFactor() ~= const.DefaultTimeFactor then
		UICity:SetGameSpeed(1)
	else
		UICity:SetGameSpeed(CheatsEnabled() and 10 or 5)
	end
end
end,
			'IgnoreRepeated', true,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "actionRotBuildingLeft",
			'ActionName', T{312752058553, --[[XTemplate GameShortcuts ActionName]] "Rotate Building Left"},
			'ActionShortcut', "R",
			'ActionShortcut2', "Shift-R",
			'ActionGamepad', "LeftShoulder",
			'ActionBindable', true,
			'ActionMouseBindable', false,
			'OnAction', function (self, host, source, toggled)
local m = GetInGameInterfaceMode()
local obj = m == "tunnel_construction" and CityTunnelConstruction[UICity] or m == "construction" and CityConstruction[UICity]
				or m == "passage_ramp" and CityGridSwitchConstruction[UICity]
if obj then
	obj:Rotate(-1)
end
end,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "actionRotBuildingRight",
			'ActionName', T{694856081085, --[[XTemplate GameShortcuts ActionName]] "Rotate Building Right"},
			'ActionShortcut', "T",
			'ActionShortcut2', "Shift-T",
			'ActionGamepad', "RightShoulder",
			'ActionBindable', true,
			'ActionMouseBindable', false,
			'OnAction', function (self, host, source, toggled)
local m = GetInGameInterfaceMode()
local obj = m == "tunnel_construction" and CityTunnelConstruction[UICity] or m == "construction" and CityConstruction[UICity]
					or m == "passage_ramp" and CityGridSwitchConstruction[UICity]
if obj then
	obj:Rotate(1)
end
end,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "actionOpenBuildMenu",
			'ActionName', T{383281603855, --[[XTemplate GameShortcuts ActionName]] "Build Menu"},
			'ActionShortcut', "B",
			'ActionBindable', true,
			'OnAction', function (self, host, source, toggled)
local igi = GetInGameInterface()
local dlg = GetDialog("HUD")
if igi and dlg and dlg.ctrl_state ~= "destroying" and igi:GetVisible() and igi.mode == "selection" then
	dlg.idBuild:Press()
end
end,
			'IgnoreRepeated', true,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "actionMapOverview",
			'ActionName', T{786525376837, --[[XTemplate GameShortcuts ActionName]] "Map Overview"},
			'ActionShortcut', "M",
			'ActionBindable', true,
			'OnAction', function (self, host, source, toggled)
if not g_PhotoMode then
	local igi = GetInGameInterface()
	local dlg = GetDialog("HUD")
	if igi and igi:GetVisible() and dlg and dlg.ctrl_state ~= "destroying" then
		dlg.idOverview:Press()
	end
	if Platform.developer and not igi then
		ToggleOffGameOverview()
	end
end
end,
			'IgnoreRepeated', true,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "actionToggleResourceIcons",
			'ActionName', T{600243851394, --[[XTemplate GameShortcuts ActionName]] "Toggle Resource Icons"},
			'ActionShortcut', "I",
			'ActionBindable', true,
			'OnAction', function (self, host, source, toggled)
ToggleResourceIcons()
end,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "actionDeployProbe",
			'ActionName', T{559972871255, --[[XTemplate GameShortcuts ActionName]] "Deploy Orbital Probe"},
			'ActionShortcut', "X",
			'ActionGamepad', "ButtonX",
			'ActionBindable', true,
			'OnAction', function (self, host, source, toggled)
DeployOrbitalProbe()
end,
			'IgnoreRepeated', true,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "actionResetCamera",
			'ActionName', T{864744602325, --[[XTemplate GameShortcuts ActionName]] "Reset Camera"},
			'ActionShortcut', "Home",
			'ActionBindable', true,
			'OnAction', function (self, host, source, toggled)
ResetRTSCamera()
end,
			'IgnoreRepeated', true,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "actionRadio",
			'ActionName', T{796804896133, --[[XTemplate GameShortcuts ActionName]] "Radio"},
			'ActionShortcut', "Y",
			'ActionBindable', true,
			'OnAction', function (self, host, source, toggled)
local igi = GetInGameInterface()
local dlg = GetDialog("HUD")
if igi and dlg and dlg.ctrl_state ~= "destroying" and igi:GetVisible() and igi.mode_dialog:IsKindOf("UnitDirectionModeDialog") then
	dlg.idRadio:Press()
else
	CloseDialog("RadioStationDlg")
end
end,
			'IgnoreRepeated', true,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "actionResupplyScreen",
			'ActionName', T{970807214544, --[[XTemplate GameShortcuts ActionName]] "Resupply Screen"},
			'ActionShortcut', "P",
			'ActionBindable', true,
			'OnAction', function (self, host, source, toggled)
local igi = GetInGameInterface()
local dlg = GetDialog("HUD")
if igi and dlg and dlg.ctrl_state ~= "destroying" and igi:GetVisible() and igi.mode_dialog:IsKindOf("UnitDirectionModeDialog") then
	dlg.idResupply:Press()
else
	CloseDialog("Resupply")
end
end,
			'IgnoreRepeated', true,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "actionResearchScreen",
			'ActionName', T{771055429123, --[[XTemplate GameShortcuts ActionName]] "Research Screen"},
			'ActionShortcut', "H",
			'ActionBindable', true,
			'OnAction', function (self, host, source, toggled)
local igi = GetInGameInterface()
local dlg = GetDialog("HUD")
if igi and dlg and dlg.ctrl_state ~= "destroying" and igi:GetVisible() and igi.mode_dialog:IsKindOf("UnitDirectionModeDialog") then
	dlg.idResearch:Press()
else
	CloseResearchDialog()
end
end,
			'IgnoreRepeated', true,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "actionColonyOverview",
			'ActionName', T{7849, --[[XTemplate GameShortcuts ActionName]] "Colony Overview"},
			'ActionShortcut', "O",
			'ActionBindable', true,
			'OnAction', function (self, host, source, toggled)
local igi = GetInGameInterface()
local dlg = GetDialog("HUD")
if igi and dlg and dlg.ctrl_state ~= "destroying" and igi:GetVisible() then
	dlg.idColonyOverview:Press()
end
end,
			'IgnoreRepeated', true,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "actionMilestonesScreen",
			'ActionName', T{973748367669, --[[XTemplate GameShortcuts ActionName]] "Milestones"},
			'ActionShortcut', "L",
			'ActionBindable', true,
			'OnAction', function (self, host, source, toggled)
local igi = GetInGameInterface()
local dlg = GetDialog("HUD")
if igi and dlg and dlg.ctrl_state ~= "destroying" and igi:GetVisible() and igi.mode_dialog:IsKindOf("UnitDirectionModeDialog") then
	dlg.idMarkers:Press()
else
	 CloseXDialog("Milestones")
end
end,
			'IgnoreRepeated', true,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "actionAchievementsScreen",
			'ActionName', T{697482021580, --[[XTemplate GameShortcuts ActionName]] "Achievements"},
			'ActionShortcut', ";",
			'ActionBindable', true,
			'OnAction', function (self, host, source, toggled)
local igi = GetInGameInterface()
local dlg = GetXDialog("Achievements")
if (GameState.gameplay and igi and igi:GetVisible() and igi.mode_dialog:IsKindOf("UnitDirectionModeDialog")) or
	(not GameState.gameplay and not dlg) then
	OpenXDialog("Achievements")
else
	CloseXDialog("Achievements")
end
end,
			'IgnoreRepeated', true,
			'__condition', function (parent, context) return not Platform.steam and not Platform.console end,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "actionNextDome",
			'ActionName', T{7695, --[[XTemplate GameShortcuts ActionName]] "Next Dome"},
			'ActionShortcut', "Pageup",
			'ActionBindable', true,
			'OnAction', function (self, host, source, toggled)
NextDome()
end,
			'IgnoreRepeated', true,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "actionPreviousDome",
			'ActionName', T{411744294712, --[[XTemplate GameShortcuts ActionName]] "Previous Dome"},
			'ActionShortcut', "Pagedown",
			'ActionBindable', true,
			'OnAction', function (self, host, source, toggled)
PreviousDome()
end,
			'IgnoreRepeated', true,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "actionNextRover",
			'ActionName', T{7696, --[[XTemplate GameShortcuts ActionName]] "Next Rover"},
			'ActionBindable', true,
			'OnAction', function (self, host, source, toggled)
NextRover()
end,
			'IgnoreRepeated', true,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "actionPreviousRover",
			'ActionName', T{749913145697, --[[XTemplate GameShortcuts ActionName]] "Previous Rover"},
			'ActionBindable', true,
			'OnAction', function (self, host, source, toggled)
PreviousRover()
end,
			'IgnoreRepeated', true,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "actionToggleDemolish",
			'ActionName', T{936607973592, --[[XTemplate GameShortcuts ActionName]] "Salvage Selected"},
			'ActionToolbar', "SelectedObj",
			'ActionShortcut', "Delete",
			'ActionBindable', true,
			'ActionState', function (self, host)
return SelectedObj and IsKindOf(SelectedObj, "Demolishable") or "disabled"
end,
			'OnAction', function (self, host, source, toggled)
FocusInfopanel = false
if SelectedObj and IsKindOf(SelectedObj, "Demolishable") then
	SelectedObj:ToggleDemolish()
	if SelectedObj then
		RebuildInfopanel(SelectedObj)
	end
end
end,
			'IgnoreRepeated', true,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "actionTogglePin",
			'ActionName', T{646525548286, --[[XTemplate GameShortcuts ActionName]] "Pin/Unpin Selected"},
			'ActionToolbar', "SelectedObj",
			'ActionBindable', true,
			'ActionState', function (self, host)
return SelectedObj and IsKindOf(SelectedObj, "PinnableObject") or "disabled"
end,
			'OnAction', function (self, host, source, toggled)
FocusInfopanel = false
if SelectedObj and IsKindOf(SelectedObj, "PinnableObject") then
	SelectedObj:TogglePin()
	RebuildInfopanel(SelectedObj)
end
end,
			'IgnoreRepeated', true,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "actionRenameSelected",
			'ActionName', T{337463951534, --[[XTemplate GameShortcuts ActionName]] "Rename Selected"},
			'ActionToolbar', "SelectedObj",
			'ActionBindable', true,
			'ActionState', function (self, host)
return SelectedObj and IsKindOf(SelectedObj, "Renamable") or "disabled"
end,
			'OnAction', function (self, host, source, toggled)
FocusInfopanel = false
if SelectedObj and IsKindOf(SelectedObj, "Renamable") then
	SelectedObj:ShowRenameUI()
end
end,
			'IgnoreRepeated', true,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "actionMoveInteract",
			'ActionName', T{765178809736, --[[XTemplate GameShortcuts ActionName]] "Move / Interact with target"},
			'ActionToolbar', "SelectedObj",
			'ActionGamepad', "RightTrigger-ButtonA",
			'ActionBindable', true,
			'ActionState', function (self, host)
return SelectedObj and IsKindOf(SelectedObj, "DroneBase") or "disabled"
end,
			'OnAction', function (self, host, source, toggled)
FocusInfopanel = false
if not SelectedObj or not IsKindOf(SelectedObj, "DroneBase") then return end
local igi = GetInGameInterface()
if igi and igi:GetVisible() then
	SelectedObj:ToggleControlMode()
	if source == "gamepad" then
		ActivateControlModeDlgAction()
	end
	RebuildInfopanel(SelectedObj)
end
end,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "actionForceLaunch",
			'ActionName', T{439134274593, --[[XTemplate GameShortcuts ActionName]] "Launch"},
			'ActionToolbar', "SelectedObj",
			'ActionGamepad', "RightTrigger-ButtonX",
			'ActionState', function (self, host)
return SelectedObj and IsKindOf(SelectedObj, "SupplyRocket") or "disabled"
end,
			'OnAction', function (self, host, source, toggled)
if SelectedObj and IsKindOf(SelectedObj, "SupplyRocket") then
	SelectedObj:UILaunch()
end
end,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "actionLoadResources",
			'ActionName', T{903069926510, --[[XTemplate GameShortcuts ActionName]] "Load resources"},
			'ActionToolbar', "SelectedObj",
			'ActionGamepad', "RightTrigger-ButtonX",
			'ActionBindable', true,
			'ActionState', function (self, host)
return SelectedObj and IsKindOf(SelectedObj, "RCTransport") or "disabled"
end,
			'OnAction', function (self, host, source, toggled)
FocusInfopanel = false
if not SelectedObj or not IsKindOf(SelectedObj, "RCTransport") then return end
local igi = GetInGameInterface()
if igi and igi:GetVisible() then
	SelectedObj:LoadResource()
	if source == "gamepad" then
		ActivateControlModeDlgAction()
	end
	RebuildInfopanel(SelectedObj)
end
end,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "actionUnloadResources",
			'ActionName', T{231672184710, --[[XTemplate GameShortcuts ActionName]] "Unload resources"},
			'ActionToolbar', "SelectedObj",
			'ActionGamepad', "RightTrigger-ButtonY",
			'ActionBindable', true,
			'ActionState', function (self, host)
return SelectedObj and IsKindOf(SelectedObj, "RCTransport") or "disabled"
end,
			'OnAction', function (self, host, source, toggled)
FocusInfopanel = false
if not SelectedObj or not IsKindOf(SelectedObj, "RCTransport") then return end
local igi = GetInGameInterface()
if igi and igi:GetVisible() then
	SelectedObj:UnloadResource()
	if source == "gamepad" then
		ActivateControlModeDlgAction()
	end
	RebuildInfopanel(SelectedObj)
end
end,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "actionReassignDrone",
			'ActionName', T{715125537239, --[[XTemplate GameShortcuts ActionName]] "Reassign"},
			'ActionToolbar', "SelectedObj",
			'ActionGamepad', "RightTrigger-ButtonY",
			'ActionBindable', true,
			'ActionState', function (self, host)
return SelectedObj and IsKindOf(SelectedObj, "Drone") or "disabled"
end,
			'OnAction', function (self, host, source, toggled)
FocusInfopanel = false
if not SelectedObj or not IsKindOf(SelectedObj, "Drone") then return end
local igi = GetInGameInterface()
if igi and igi:GetVisible() then
	SelectedObj:ToggleReassignInteractionMode()
	if source == "gamepad" then
		ActivateControlModeDlgAction()
	end
	RebuildInfopanel(SelectedObj)
end
end,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "actionPerformMaintenance",
			'ActionName', T{926715334434, --[[XTemplate GameShortcuts ActionName]] "Perform maintenance"},
			'ActionToolbar', "SelectedObj",
			'ActionGamepad', "RightTrigger-ButtonB",
			'ActionBindable', true,
			'ActionState', function (self, host)
return SelectedObj and IsKindOf(SelectedObj, "Drone") or "disabled"
end,
			'OnAction', function (self, host, source, toggled)
FocusInfopanel = false
if not SelectedObj or not IsKindOf(SelectedObj, "Drone") then return end
local igi = GetInGameInterface()
if igi and igi:GetVisible() then
	SelectedObj:ToggleMaintenanceInteractionMode()
	if source == "gamepad" then
		ActivateControlModeDlgAction()
	end
	RebuildInfopanel(SelectedObj)
end
end,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "actionAssignToBuilding",
			'ActionName', T{8761, --[[XTemplate GameShortcuts ActionName]] "Assign To Building"},
			'ActionToolbar', "SelectedObj",
			'ActionGamepad', "RightTrigger-ButtonA",
			'ActionBindable', true,
			'ActionState', function (self, host)
return IsKindOf(SelectedObj, "Colonist") or "disabled"
end,
			'OnAction', function (self, host, source, toggled)
FocusInfopanel = false
if not IsKindOf(SelectedObj, "Colonist") then return end
local igi = GetInGameInterface()
if igi and igi:GetVisible() then
	SelectedObj:ToggleInteraction()
	if source == "gamepad" then
		ActivateControlModeDlgAction()
	end
	RebuildInfopanel(SelectedObj)
end
end,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "actionRecharge",
			'ActionName', T{542727559467, --[[XTemplate GameShortcuts ActionName]] "Recharge battery"},
			'ActionToolbar', "SelectedObj",
			'ActionGamepad', "RightTrigger-ButtonB",
			'ActionState', function (self, host)
return SelectedObj and IsKindOf(SelectedObj, "BaseRover") or "disabled"
end,
			'OnAction', function (self, host, source, toggled)
FocusInfopanel = false
if not SelectedObj or not IsKindOf(SelectedObj, "BaseRover") then return end
local igi = GetInGameInterface()
if igi and igi:GetVisible() then
	SelectedObj:ToggleRechargeMode()
	if source == "gamepad" then
		ActivateControlModeDlgAction()
	end
	RebuildInfopanel(SelectedObj)
end
end,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "actionPriority",
			'ActionName', T{949156525062, --[[XTemplate GameShortcuts ActionName]] "Change priority"},
			'ActionToolbar', "SelectedObj",
			'ActionGamepad', "RightTrigger-ButtonA",
			'ActionBindable', true,
			'ActionState', function (self, host)
return IsKindOf(SelectedObj, "Building") and SelectedObj.prio_button or "disabled"
end,
			'OnAction', function (self, host, source, toggled)
FocusInfopanel = false
if not IsKindOf(SelectedObj, "Building") or not SelectedObj.prio_button then return end
SelectedObj:TogglePriority(1)
RebuildInfopanel(SelectedObj)
end,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "actionOnOff",
			'ActionName', T{643321767698, --[[XTemplate GameShortcuts ActionName]] "Turn on/off"},
			'ActionToolbar', "SelectedObj",
			'ActionGamepad', "RightTrigger-ButtonY",
			'ActionBindable', true,
			'ActionState', function (self, host)
	if IsKindOf(SelectedObj, "Building") and SelectedObj.on_off_button then
		if not (IsKindOf(SelectedObj, "ConstructionSite") and SelectedObj.building_class == "BlackCubeMonolith") then
			return SelectedObj.on_off_button
		end			
	end
	return "disabled"
end,
			'OnAction', function (self, host, source, toggled)
FocusInfopanel = false
if not IsKindOf(SelectedObj, "Building") or not SelectedObj.on_off_button or (IsKindOf(SelectedObj, "ConstructionSite") and SelectedObj.building_class== "BlackCubeMonolith") then return end
SelectedObj:ToggleWorking()
RebuildInfopanel(SelectedObj)
end,
			'IgnoreRepeated', true,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "actionDomeFilter",
			'ActionName', T{204031300524, --[[XTemplate GameShortcuts ActionName]] "Filter colonists by traits"},
			'ActionToolbar', "SelectedObj",
			'ActionGamepad', "RightTrigger-ButtonX",
			'ActionBindable', true,
			'ActionState', function (self, host)
return IsKindOf(SelectedObj, "Dome") or "disabled"
end,
			'OnAction', function (self, host, source, toggled)
FocusInfopanel = false
if not IsKindOf(SelectedObj, "Dome") then return end
SelectedObj:OpenFilterTraits()
end,
			'IgnoreRepeated', true,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "actionMaintenance",
			'ActionName', T{292941424864, --[[XTemplate GameShortcuts ActionName]] "Request maintenance"},
			'ActionToolbar', "SelectedObj",
			'ActionGamepad', "RightTrigger-ButtonB",
			'ActionBindable', true,
			'ActionState', function (self, host)
return IsKindOf(SelectedObj, "RequiresMaintenance") and SelectedObj:DoesRequireMaintenance() or "disabled"
end,
			'OnAction', function (self, host, source, toggled)
FocusInfopanel = false
if not IsKindOf(SelectedObj, "RequiresMaintenance") or not SelectedObj:DoesRequireMaintenance() then return end
if SelectedObj.accumulated_maintenance_points > 0 and SelectedObj.maintenance_phase == false then
	SelectedObj:UIRequestMaintenance()
	RebuildInfopanel(SelectedObj)
end
end,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "actionLastNotification",
			'ActionName', T{748588275043, --[[XTemplate GameShortcuts ActionName]] "Last Notification"},
			'ActionShortcut', "Backspace",
			'ActionBindable', true,
			'OnAction', function (self, host, source, toggled)
local dlg = GetXDialog("OnScreenNotificationsDlg")
local notifications = dlg and dlg.idNotifications
if dlg and #notifications > 0 then
	notifications[#notifications].idButton:Press()
end
end,
			'IgnoreRepeated', true,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "actionLastConstructed",
			'ActionName', T{614477738289, --[[XTemplate GameShortcuts ActionName]] "Last Constructed Building"},
			'ActionShortcut', "End",
			'ActionBindable', true,
			'OnAction', function (self, host, source, toggled)
local bld = UICity and UICity.LastConstructedBuilding
if bld then
	if IsValid(bld) then
		ViewAndSelectObject(bld)
	end
end
end,
			'IgnoreRepeated', true,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "actionPlaceCable",
			'ActionName', T{881, --[[XTemplate GameShortcuts ActionName]] "Power Cables"},
			'ActionShortcut', "C",
			'ActionBindable', true,
			'OnAction', function (self, host, source, toggled)
local igi = GetInGameInterface()
if not igi or not igi:GetVisible() then return end
local require_construction = not(g_Consts and g_Consts.InstantCables ~= 0)
igi:SetMode("electricity_grid", {grid_elements_require_construction = require_construction})
end,
			'IgnoreRepeated', true,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "actionPlacePipes",
			'ActionName', T{882, --[[XTemplate GameShortcuts ActionName]] "Pipes"},
			'ActionShortcut', "V",
			'ActionBindable', true,
			'OnAction', function (self, host, source, toggled)
local igi = GetInGameInterface()
if not igi or not igi:GetVisible() then return end
local require_construction = not(g_Consts and g_Consts.InstantPipes ~= 0)
igi:SetMode("life_support_grid", {grid_elements_require_construction = require_construction})
end,
			'IgnoreRepeated', true,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "actionToggleFullscreen",
			'ActionShortcut', "Alt-Enter",
			'OnAction', function (self, host, source, toggled)
ToggleFullscreen()
end,
		}),
		PlaceObj('XTemplateForEach', {
			'comment', "buildings",
			'array', function (parent, context) local t = table.icopy(DataInstances.BuildingTemplate or empty_table) TSort(t, "display_name") return t end,
			'condition', function (parent, context, item, i) return item.build_category ~= "Hidden" end,
			'run_after', function (child, context, item, i, n)
child.OnActionParam = item.name
child.ActionName = item.display_name
child.ActionId = "actionBuild" .. item.name
child.ActionShortcut = item.build_shortcut1
child.ActionShortcut2 = item.build_shortcut2
child.ActionGamepad = item.build_shortcut_gamepad
child:BindShortcuts()
end,
		}, {
			PlaceObj('XTemplateAction', {
				'ActionBindable', true,
				'OnAction', function (self, host, source, toggled)
local igi = GetInGameInterface()
if not igi or not igi:GetVisible() then return end
local bld_template = DataInstances.BuildingTemplate[self.OnActionParam]
local show, prefabs, can_build, action = UIGetBuildingPrerequisites(bld_template.build_category, bld_template, true)
local dlg = GetXDialog("XBuildMenu")
if show then
	if action then
		action(dlg, {enabled = can_build, name = bld_template.name, construction_mode = bld_template.construction_mode})
	elseif can_build then
		igi:SetMode("construction", { template = bld_template.name, selected_dome = dlg and dlg.context.selected_dome })
	end
	CloseXBuildMenu()
end
end,
				'IgnoreRepeated', true,
			}),
			}),
		}),
})

