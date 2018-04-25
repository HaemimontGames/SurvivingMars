-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "InGame",
	id = "XIGMenu",
	PlaceObj('XTemplateTemplate', {
		'__template', "OverlayDlg",
		'MinWidth', 420,
		'HostInParent', true,
	}, {
		PlaceObj('XTemplateCode', {
			'run', function (self, parent, context)
parent:SetPadding(box(80,80,120,80))
local toolbar = GetDialog(parent).idToolbar
toolbar:SetPadding(box(80, 0, 0, 0))
toolbar:SetHAlign("center")
end,
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XFrame",
			'Margins', box(-80, 6, -155, -100),
			'VAlign', "top",
			'Image', "UI/Common/bm_pad_small.tga",
			'FrameBox', box(170, 0, 165, 0),
			'SqueezeY', false,
		}),
		PlaceObj('XTemplateAction', {
			'ActionId', "close",
			'ActionName', T{4523, --[[XTemplate XIGMenu ActionName]] "CLOSE"},
			'ActionToolbar', "ActionBar",
			'ActionShortcut', "Escape",
			'ActionGamepad', "ButtonB",
			'OnActionEffect', "close",
			'IgnoreRepeated', true,
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XContentTemplateList",
			'Id', "idList",
			'Margins', box(80, 20, 0, 0),
			'BorderWidth', 0,
			'LayoutVSpacing', 12,
			'Background', RGBA(0, 0, 0, 0),
			'FocusedBackground', RGBA(0, 0, 0, 0),
			'VScroll', "idScroll",
			'ShowPartialItems', false,
		}, {
			PlaceObj('XTemplateFunc', {
				'name', "OnShortcut(self, shortcut, source)",
				'func', function (self, shortcut, source)
local prev_item = self.focused_item
local ret = XList.OnShortcut(self, shortcut, source)
if shortcut == "Down" and prev_item == #self then
	self:SetSelection(1)
	return "break"
elseif shortcut == "Up" and prev_item == 1 then
	self:SetSelection(#self)
	return "break"
end
return ret
end,
			}),
			PlaceObj('XTemplateAction', {
				'ActionId', "idSaveGame",
				'ActionName', T{1133, --[[XTemplate XIGMenu ActionName]] "SAVE GAME"},
				'ActionToolbar', "mainmenu",
				'ActionState', function (self, host)
return (PlayWithoutStorage() or not not g_Tutorial) and "disabled"
end,
				'OnActionEffect', "mode",
				'OnActionParam', "Save",
			}),
			PlaceObj('XTemplateAction', {
				'ActionId', "idLoadGame",
				'ActionName', T{1128, --[[XTemplate XIGMenu ActionName]] "LOAD GAME"},
				'ActionToolbar', "mainmenu",
				'ActionState', function (self, host)
return IsLoadButtonDisabled(host.context) and "disabled"
end,
				'OnActionEffect', "mode",
				'OnActionParam', "Load",
			}),
			PlaceObj('XTemplateAction', {
				'ActionId', "idOptions",
				'ActionName', T{1131, --[[XTemplate XIGMenu ActionName]] "OPTIONS"},
				'ActionToolbar', "mainmenu",
				'OnActionEffect', "mode",
				'OnActionParam', "Options",
			}),
			PlaceObj('XTemplateAction', {
				'ActionId', "idPhotoMode",
				'ActionName', T{1134, --[[XTemplate XIGMenu ActionName]] "PHOTO MODE"},
				'ActionToolbar', "mainmenu",
				'OnAction', function (self, host, source, toggled)
CloseIngameMainMenu()
OpenPhotoMode()
end,
			}),
			PlaceObj('XTemplateAction', {
				'ActionId', "idEncyclopedia",
				'ActionName', T{5473, --[[XTemplate XIGMenu ActionName]] "ENCYCLOPEDIA"},
				'ActionToolbar', "mainmenu",
				'OnActionEffect', "mode",
				'OnActionParam', "Encyclopedia",
			}),
			PlaceObj('XTemplateAction', {
				'ActionId', "idAchievements",
				'ActionName', T{496720013568, --[[XTemplate XIGMenu ActionName]] "ACHIEVEMENTS"},
				'ActionToolbar', "mainmenu",
				'OnActionEffect', "mode",
				'OnActionParam', "Achievements",
				'__condition', function (parent, context) return not Platform.steam and not Platform.console end,
			}),
			PlaceObj('XTemplateAction', {
				'ActionId', "idRestartMap",
				'ActionName', T{1135, --[[XTemplate XIGMenu ActionName]] "RESTART MAP"},
				'ActionToolbar', "mainmenu",
				'OnAction', function (self, host, source, toggled)
CreateRealTimeThread(function()
	if WaitMarsQuestion(nil, T{1136, "Restart Map"}, T{1137, "Are you sure you want to restart the map?"}, T{1138, "Yes"}, T{1139, "No"}, "UI/Messages/space.tga") == "ok" then
		LoadingScreenOpen("idLoadingScreen", "restart map")
		host:Close()
		TelemetryRestartSession()
		g_SessionSeed = g_InitialSessionSeed
		if g_InitialRocketCargo and g_InitialCargoCost ~= 0 and g_InitialCargoWeight ~= 0 then
			g_RocketCargo = g_InitialRocketCargo
			g_CargoCost = g_InitialCargoCost
			g_CargoWeight = g_InitialCargoWeight
			GenerateCurrentRandomMap()
		else
			--premade maps
			ReloadMap()
		end
		LoadingScreenClose("idLoadingScreen", "restart map")
	end
end)
end,
			}),
			PlaceObj('XTemplateAction', {
				'ActionId', "idMainMenu",
				'ActionName', T{1140, --[[XTemplate XIGMenu ActionName]] "MAIN MENU"},
				'ActionToolbar', "mainmenu",
				'OnAction', function (self, host, source, toggled)
CreateRealTimeThread(function()
	if WaitMarsQuestion(nil, T{6779, "Warning"}, T{1141, "Exit to the main menu?"}, T{1138, "Yes"}, T{1139, "No"}, "UI/Messages/space.tga") == "ok" then
		LoadingScreenOpen("idLoadingScreen", "main menu")
		host:Close()
		OpenPreGameMainMenu()
		LoadingScreenClose("idLoadingScreen", "main menu")
	end
end)
end,
			}),
			PlaceObj('XTemplateAction', {
				'ActionId', "idQuit",
				'ActionName', T{1132, --[[XTemplate XIGMenu ActionName]] "QUIT"},
				'ActionToolbar', "mainmenu",
				'OnAction', function (self, host, source, toggled)
QuitGame()
end,
				'__condition', function (parent, context) return not Platform.console end,
			}),
			PlaceObj('XTemplateForEachAction', {
				'toolbar', "mainmenu",
				'run_after', function (child, context, action, n)
child:SetText(action.ActionName)
child.action = action
end,
			}, {
				PlaceObj('XTemplateTemplate', {
					'__template', "MenuEntry",
				}),
				}),
			}),
		PlaceObj('XTemplateWindow', {
			'__class', "XPageScroll",
			'Id', "idScroll",
			'Margins', box(80, 0, 0, 0),
			'Dock', "bottom",
			'Visible', false,
			'Target', "idList",
		}),
		}),
})

