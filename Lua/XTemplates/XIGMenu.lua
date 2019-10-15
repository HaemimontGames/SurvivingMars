-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "InGame",
	id = "XIGMenu",
	PlaceObj('XTemplateTemplate', {
		'__template', "NewOverlayDlg",
		'HostInParent', true,
	}, {
		PlaceObj('XTemplateAction', {
			'ActionId', "close",
			'ActionName', T(4523, --[[XTemplate XIGMenu ActionName]] "CLOSE"),
			'ActionToolbar', "ActionBar",
			'ActionShortcut', "Escape",
			'ActionGamepad', "ButtonB",
			'OnActionEffect', "close",
			'IgnoreRepeated', true,
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "DialogTitleNew",
			'Margins', box(115, 0, 0, 0),
			'Title', T(552944862587, --[[XTemplate XIGMenu Title]] "GAME OPTIONS"),
			'SmallImage', true,
		}),
		PlaceObj('XTemplateWindow', {
			'Margins', box(60, 40, 0, 0),
		}, {
			PlaceObj('XTemplateWindow', {
				'__class', "XContentTemplateList",
				'Id', "idList",
				'Margins', box(39, 0, 0, 0),
				'BorderWidth', 0,
				'Padding', box(0, 0, 0, 0),
				'LayoutVSpacing', 10,
				'UniformRowHeight', true,
				'Clip', false,
				'Background', RGBA(0, 0, 0, 0),
				'HandleMouse', false,
				'FocusedBackground', RGBA(0, 0, 0, 0),
				'VScroll', "idScroll",
				'ShowPartialItems', false,
				'MouseScroll', true,
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
					'ActionName', T(11476, --[[XTemplate XIGMenu ActionName]] "Save Game"),
					'ActionToolbar', "mainmenu",
					'ActionState', function (self, host)
						return (PlayWithoutStorage() or not not g_Tutorial) and "disabled"
					end,
					'OnActionEffect', "mode",
					'OnActionParam', "Save",
				}),
				PlaceObj('XTemplateAction', {
					'ActionId', "idLoadGame",
					'ActionName', T(1009, --[[XTemplate XIGMenu ActionName]] "Load Game"),
					'ActionToolbar', "mainmenu",
					'ActionState', function (self, host)
						return IsLoadButtonDisabled(host.context) and "disabled"
					end,
					'OnActionEffect', "mode",
					'OnActionParam', "Load",
				}),
				PlaceObj('XTemplateAction', {
					'ActionId', "idOptions",
					'ActionName', T(11477, --[[XTemplate XIGMenu ActionName]] "Options"),
					'ActionToolbar', "mainmenu",
					'OnActionEffect', "mode",
					'OnActionParam', "Options",
				}),
				PlaceObj('XTemplateAction', {
					'ActionId', "idPhotoMode",
					'ActionName', T(11478, --[[XTemplate XIGMenu ActionName]] "Photo Mode"),
					'ActionToolbar', "mainmenu",
					'OnAction', function (self, host, source)
						CloseIngameMainMenu()
						StartPhotoMode()
					end,
				}),
				PlaceObj('XTemplateTemplate', {
					'__template', "CrashTest",
					'IgnoreMissing', true,
				}),
				PlaceObj('XTemplateAction', {
					'ActionId', "idEncyclopedia",
					'ActionName', T(7384, --[[XTemplate XIGMenu ActionName]] "Encyclopedia"),
					'ActionToolbar', "mainmenu",
					'OnActionEffect', "mode",
					'OnActionParam', "Encyclopedia",
				}),
				PlaceObj('XTemplateAction', {
					'ActionId', "idAchievements",
					'ActionName', T(697482021580, --[[XTemplate XIGMenu ActionName]] "Achievements"),
					'ActionToolbar', "mainmenu",
					'OnActionEffect', "mode",
					'OnActionParam', "Achievements",
					'__condition', function (parent, context) return not Platform.steam and not Platform.console and not Platform.windows_store end,
				}),
				PlaceObj('XTemplateAction', {
					'ActionId', "idRestartMap",
					'ActionName', T(1136, --[[XTemplate XIGMenu ActionName]] "Restart Map"),
					'ActionToolbar', "mainmenu",
					'OnAction', function (self, host, source)
						CreateRealTimeThread(function()
							if WaitMarsQuestion(nil, T(1136, "Restart Map"), T(1137, "Are you sure you want to restart the map?"), T(1138, "Yes"), T(1139, "No"), "UI/Messages/space.tga") == "ok" then
								LoadingScreenOpen("idLoadingScreen", "restart map")
								host:Close()
								TelemetryRestartSession()
								g_SessionSeed = g_InitialSessionSeed
								if g_Tutorial then
									CreateRealTimeThread(StartTutorial, g_Tutorial.Map)
								elseif g_InitialRocketCargo and g_InitialCargoCost ~= 0 and g_InitialCargoWeight ~= 0 then
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
					'ActionName', T(1010, --[[XTemplate XIGMenu ActionName]] "Main Menu"),
					'ActionToolbar', "mainmenu",
					'OnAction', function (self, host, source)
						CreateRealTimeThread(function()
							if WaitMarsQuestion(nil, T(6779, "Warning"), T(1141, "Exit to the main menu?"), T(1138, "Yes"), T(1139, "No"), "UI/Messages/space.tga") == "ok" then
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
					'ActionName', T(11479, --[[XTemplate XIGMenu ActionName]] "Quit"),
					'ActionToolbar', "mainmenu",
					'OnAction', function (self, host, source)
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
						'__template', "MenuEntrySmall",
						'TextStyle', "ListItem3",
					}),
					}),
				}),
			PlaceObj('XTemplateTemplate', {
				'__template', "ScrollbarNew",
				'Id', "idScroll",
				'Target', "idList",
			}),
			}),
		}),
})

