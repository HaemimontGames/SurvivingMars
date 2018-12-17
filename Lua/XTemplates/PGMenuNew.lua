-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "PreGame",
	id = "PGMenuNew",
	PlaceObj('XTemplateWindow', nil, {
		PlaceObj('XTemplateFunc', {
			'name', "Open",
			'func', function (self, ...)
XWindow.Open(self, ...)
self:SetMargins(GetSafeMargins(self:GetMargins()))
end,
		}),
		PlaceObj('XTemplateWindow', {
			'__class', "XAspectWindow",
			'Fit', "smallest",
		}, {
			PlaceObj('XTemplateLayer', {
				'layer', "PGVideoBackground",
			}),
			PlaceObj('XTemplateWindow', {
				'comment', "logo",
				'__class', "XImage",
				'Margins', box(115, 20, 0, 0),
				'Dock', "top",
				'HAlign', "left",
				'VAlign', "top",
				'Image', "UI/CommonNew/mm_surviving_mars_logo.tga",
			}),
			PlaceObj('XTemplateWindow', {
				'comment', "menu bar",
				'__class', "XFitContent",
				'Id', "idMenuBar",
				'IdNode', false,
				'Margins', box(110, 0, 20, 0),
				'LayoutMethod', "HList",
				'LayoutHSpacing', 30,
				'Fit', "width",
			}, {
				PlaceObj('XTemplateWindow', {
					'comment', "Paradox news container",
					'__condition', function (parent, context) return not Platform.console end,
					'Id', "idParadoxNews",
					'Margins', box(0, 110, 0, 0),
					'VAlign', "top",
					'Visible', false,
					'FadeInTime', 300,
					'RolloverZoom', 1050,
					'RolloverDrawOnTop', true,
				}, {
					PlaceObj('XTemplateFunc', {
						'name', "Open",
						'func', function (self, ...)
XWindow.Open(self, ...)
UIShowParadoxFeeds(self, true)
end,
					}),
					PlaceObj('XTemplateWindow', {
						'comment', "news image",
						'__class', "XImage",
						'Id', "idImage",
						'IdNode', false,
						'MinWidth', 330,
						'MinHeight', 235,
						'MaxWidth', 330,
						'MaxHeight', 235,
						'Image', "UI/CommonNew/mm_space_race.tga",
						'ImageFit', "smallest",
					}, {
						PlaceObj('XTemplateWindow', {
							'__class', "XTextButton",
							'Id', "idLinkButton",
							'IdNode', false,
							'LayoutMethod', "VList",
							'LayoutHSpacing', 0,
							'Background', RGBA(0, 0, 0, 0),
							'HandleMouse', false,
							'MouseCursor', "UI/Cursors/Rollover.tga",
							'FocusedBackground', RGBA(0, 0, 0, 0),
							'RolloverBackground', RGBA(0, 0, 0, 0),
							'PressedBackground', RGBA(0, 0, 0, 0),
						}, {
							PlaceObj('XTemplateWindow', {
								'Dock', "bottom",
								'HAlign', "center",
								'VAlign', "center",
							}, {
								PlaceObj('XTemplateWindow', {
									'__class', "XImage",
									'Id', "idGamepadFeedHint",
									'Dock', "left",
									'FoldWhenHidden', true,
									'ImageScale', point(550, 550),
								}),
								PlaceObj('XTemplateWindow', {
									'comment', "news",
									'__class', "XText",
									'Id', "idNews",
									'MaxWidth', 300,
									'MaxHeight', 60,
									'TextStyle', "PGNews",
									'TextHAlign', "center",
									'TextVAlign', "center",
								}, {
									PlaceObj('XTemplateFunc', {
										'name', "CalcTextColor",
										'func', function (self, ...)
return self.parent.parent.rollover and self.RolloverTextColor or self.TextColor
end,
									}),
									}),
								}),
							}),
						}),
					PlaceObj('XTemplateAction', {
						'ActionId', "idSelectFeedEntry",
						'ActionGamepad', "+RightShoulder",
						'OnAction', function (self, host, source)
host.idContent.idLinkButton:Press()
end,
					}),
					}),
				PlaceObj('XTemplateMode', {
					'mode', "Main",
				}, {
					PlaceObj('XTemplateAction', {
						'ActionId', "idTutorial",
						'ActionName', T(756622437336, --[[XTemplate PGMenuNew ActionName]] "TUTORIAL"),
						'ActionIcon', "UI/CommonNew/mm_tutorials.tga",
						'ActionToolbar', "mainmenu",
						'OnAction', function (self, host, source)
CreateRealTimeThread(function()
	if AccountStorage and AccountStorage.LoadMods and next(AccountStorage.LoadMods) ~= nil then
		local choice = WaitPopupNotification("Tutorial_ActiveMods", nil, nil, host)
		if choice == 1 then
			AllModsOff()
			SaveAccountStorage(5000)
			if ModsLoaded then
				ModsReloadItems()
			end
		end
	end
	host:SetMode("Tutorial")
end)
end,
					}),
					PlaceObj('XTemplateAction', {
						'RolloverText', T(427174640796, --[[XTemplate PGMenuNew RolloverText]] "Start a survival game, which allows you to choose Mission Sponsor, Commander Profile, Rocket payload and landing location."),
						'RolloverTitle', T(10455, --[[XTemplate PGMenuNew RolloverTitle]] "NEW GAME"),
						'ActionId', "idStandardGame",
						'ActionName', T(10455, --[[XTemplate PGMenuNew ActionName]] "NEW GAME"),
						'ActionIcon', "UI/CommonNew/mm_new_game.tga",
						'ActionToolbar', "mainmenu",
						'OnAction', function (self, host, source)
StartNewGame(host, "Mission")
end,
					}),
					PlaceObj('XTemplateAction', {
						'ActionId', "idLoad",
						'ActionName', T(1128, --[[XTemplate PGMenuNew ActionName]] "LOAD GAME"),
						'ActionIcon', "UI/CommonNew/mm_load_game.tga",
						'ActionToolbar', "mainmenu",
						'ActionState', function (self, host)
return IsLoadButtonDisabled(host.context) and "disabled"
end,
						'OnActionEffect', "mode",
						'OnActionParam', "Load",
					}),
					PlaceObj('XTemplateAction', {
						'RolloverText', T(554914047909, --[[XTemplate PGMenuNew RolloverText]] "Challenge yourself to accomplish a specific objective within a time limit.\n\nMission parameters and colony site are predetermined."),
						'ActionId', "idChallenge",
						'ActionName', T(10519, --[[XTemplate PGMenuNew ActionName]] "CHALLENGE MODE"),
						'ActionIcon', "UI/CommonNew/mm_challenges.tga",
						'ActionToolbar', "mainmenu",
						'OnAction', function (self, host, source)
StartNewGame(host, "Challenge")
end,
					}),
					PlaceObj('XTemplateAction', {
						'RolloverText', T(650579644429, --[[XTemplate PGMenuNew RolloverText]] "Create the colony that you imagine and test how it works without worrying about survival threats.<newline><newline><NoAchievements()>"),
						'RolloverTitle', T(144559490492, --[[XTemplate PGMenuNew RolloverTitle]] "CREATIVE MODE"),
						'ActionId', "idCreativeMode",
						'ActionName', T(144559490492, --[[XTemplate PGMenuNew ActionName]] "CREATIVE MODE"),
						'ActionIcon', "UI/CommonNew/mm_creative_mode.tga",
						'ActionToolbar', "mainmenu",
						'OnAction', function (self, host, source)
StartNewGame(host, "Mission", {
	EasyResearch = true,
	FastRockets = true,
	FastScan = true,
	FreeConstruction = true,
	EasyMaintenance = true,
	IronColonists = true,
	MoreApplicants = true,
	RichCoffers = true,
})
end,
					}),
					PlaceObj('XTemplateAction', {
						'ActionId', "idModManager",
						'ActionName', T(1129, --[[XTemplate PGMenuNew ActionName]] "MOD MANAGER"),
						'ActionIcon', "UI/Icons/main_menu_mod_manager.tga",
						'ActionToolbar', "bottommenu",
						'OnAction', function (self, host, source)
CreateRealTimeThread(function()
	ShowParadoxModManagerWarning()
	host:SetMode("ModManager")
end)
end,
						'__condition', function (parent, context) return Platform.steam or Platform.pc end,
					}),
					PlaceObj('XTemplateAction', {
						'ActionId', "idModEditor",
						'ActionName', T(1130, --[[XTemplate PGMenuNew ActionName]] "MOD EDITOR"),
						'ActionIcon', "UI/Icons/main_menu_mod_editor.tga",
						'ActionToolbar', "bottommenu",
						'OnAction', function (self, host, source)
CreateRealTimeThread(function()
	ModEditorOpen()
	host:delete()
end)
end,
						'__condition', function (parent, context) return Platform.pc end,
					}),
					PlaceObj('XTemplateAction', {
						'ActionId', "idOptions",
						'ActionName', T(1131, --[[XTemplate PGMenuNew ActionName]] "OPTIONS"),
						'ActionIcon', "UI/Icons/main_menu_options.tga",
						'ActionToolbar', "bottommenu",
						'OnActionEffect', "mode",
						'OnActionParam', "Options",
					}),
					PlaceObj('XTemplateAction', {
						'ActionId', "idAchievements",
						'ActionName', T(856797454991, --[[XTemplate PGMenuNew ActionName]] "ACHIEVEMENTS"),
						'ActionIcon', "UI/Icons/main_menu_achievements.tga",
						'ActionToolbar', "bottommenu",
						'OnActionEffect', "mode",
						'OnActionParam', "Achievements",
						'__condition', function (parent, context) return not Platform.steam and not Platform.console end,
					}),
					PlaceObj('XTemplateAction', {
						'ActionId', "idParadoxAccount",
						'ActionName', T(4525, --[[XTemplate PGMenuNew ActionName]] "PARADOX ACCOUNT"),
						'ActionIcon', "UI/Icons/main_menu_paradox.tga",
						'ActionToolbar', "bottommenu",
						'ActionState', function (self, host)
if Platform.durango and (Durango.IsPlayerGuest(XPlayerActive) or not Durango.IsPlayerSigned(XPlayerActive)) 
	or (Platform.ps4 and not OrbisNetworkFeatures()) then
	return "disabled"
end
end,
						'OnActionEffect', "mode",
						'OnActionParam', "Paradox",
						'__condition', function (parent, context) return Platform.pops end,
					}),
					PlaceObj('XTemplateAction', {
						'ActionId', "idQuit",
						'ActionName', T(1132, --[[XTemplate PGMenuNew ActionName]] "QUIT"),
						'ActionIcon', "UI/Icons/main_menu_exit.tga",
						'ActionToolbar', "bottommenu",
						'ActionShortcut', "Escape",
						'OnAction', function (self, host, source)
QuitGame(terminal.desktop)
end,
						'__condition', function (parent, context) return not Platform.console end,
					}),
					}),
				PlaceObj('XTemplateWindow', {
					'comment', "buttons list",
					'Id', "idButtonsList",
					'Margins', box(0, 110, 0, 0),
					'LayoutMethod', "HList",
					'LayoutHSpacing', 15,
					'UniformRowHeight', true,
				}, {
					PlaceObj('XTemplateForEachAction', {
						'toolbar', "mainmenu",
						'run_after', function (child, context, action, n)
local top = "bottom"
	child:SetVAlign("top")
	child.idText:SetDock("bottom")
	child.idText:SetText(action.ActionName)
	child.idButton:SetFocusOrder(point(n, 0))
	child.idButton:SetImage(action.ActionIcon)
	child.idButton:SetOnPressParam(action.ActionId)
	child.idTextRollover:SetText(action.RolloverText)
	child.idDownImage:SetFlipX(n%2==0)
	if n == 1 and GetUIStyleGamepad() then
		child:CreateThread("FocusThread", function()
			child.idButton:SetFocus()
		end)
	end
end,
					}, {
						PlaceObj('XTemplateWindow', {
							'IdNode', true,
							'RolloverZoom', 1050,
							'RolloverDrawOnTop', true,
						}, {
							PlaceObj('XTemplateWindow', {
								'comment', "button",
								'__class', "XTextButton",
								'Id', "idButton",
								'IdNode', false,
								'HAlign', "center",
								'VAlign', "center",
								'MaxWidth', 243,
								'LayoutMethod', "Box",
								'MouseCursor', "UI/Cursors/Rollover.tga",
								'FXMouseIn', "MainMenuItemHover",
								'FXPress', "MainMenuItemClick",
								'FXPressDisabled', "UIDisabledButtonPressed",
								'DisabledBackground', RGBA(120, 120, 120, 255),
								'OnPressEffect', "action",
							}, {
								PlaceObj('XTemplateFunc', {
									'name', "SetRollover(self, rollover)",
									'func', function (self, rollover)
self.parent:SetRollover(rollover)
XTextButton.SetRollover(self, rollover)

local duration = 200
local frame = self.parent:ResolveId("idFrame")
local image = self.parent:ResolveId("idDownImage")
local textContainer = self.parent:ResolveId("idText")
local rText = self.parent:ResolveId("idTextRollover")
local bdescription = rText:GetText()~=""
textContainer:SetRollover(rollover)

if bdescription then
	frame:AddInterpolation{
		id = "move",
		type = const.intRect,
		duration = duration,
		endRect = sizebox(frame.box:minx(), frame.box:miny() - rText.box:sizey(), frame.box:sizex(), frame.box:sizey() + 1+ rText.box:sizey()),
		startRect =  frame.box,
		flags = (not rollover) and const.intfInverse or nil,
	}

	rText:SetVisible(rollover)
	rText:AddInterpolation{
		id = "move",
		type = const.intRect,
		start = GetPreciseTicks() + duration/2,
		duration = duration/2,
		startRect = rText.box,
		endRect = sizebox(image.box:minx(),image.box:miny(),rText.box:sizex(),0),
		flags =rollover and const.intfInverse or nil,
	}

	textContainer:AddInterpolation{
		id = "move",
		type = const.intRect,
		duration = duration,
		endRect = Offset(textContainer.box,0, -rText.box:sizey()),
		startRect = textContainer.box,
		flags = (not rollover) and const.intfInverse or nil,
	}
end
end,
								}),
								PlaceObj('XTemplateFunc', {
									'name', "SetEnabled(self, enabled)",
									'func', function (self, enabled)
XTextButton.SetEnabled(self, enabled)
self.parent.idText:SetEnabled(enabled)
if not enabled then
	self.parent:AddInterpolation{id = "desat", type = const.intDesaturation, startValue = 255}
	self.parent.GetEnabled = function() return false end
end
end,
								}),
								PlaceObj('XTemplateWindow', {
									'__class', "XImage",
									'Id', "idDownImage",
									'Dock', "bottom",
									'VAlign', "bottom",
									'MinWidth', 243,
									'MaxWidth', 243,
									'Visible', false,
									'Image', "UI/CommonNew/mm_rollover1.tga",
								}),
								PlaceObj('XTemplateWindow', {
									'Id', "idRolloverWnd",
									'Dock', "box",
									'HAlign', "center",
									'VAlign', "bottom",
									'MinWidth', 243,
									'MaxWidth', 243,
									'LayoutMethod', "VList",
								}, {
									PlaceObj('XTemplateWindow', {
										'__class', "XFrame",
										'Id', "idFrame",
										'IdNode', false,
										'Dock', "box",
										'Image', "UI/CommonNew/mm_rollover2.tga",
									}),
									PlaceObj('XTemplateTemplate', {
										'__template', "MainMenuButtonText",
										'Id', "idText",
										'Margins', box(0, 0, 0, -30),
										'Padding', box(4, 0, 4, 0),
										'Dock', "box",
										'HAlign', "center",
										'VAlign', "bottom",
										'MinHeight', 60,
										'MaxHeight', 65,
										'Translate', true,
										'TextHAlign', "center",
										'TextVAlign', "center",
									}),
									}),
								PlaceObj('XTemplateWindow', {
									'Dock', "box",
									'MinWidth', 243,
									'MaxWidth', 243,
								}, {
									PlaceObj('XTemplateWindow', {
										'__class', "XText",
										'Id', "idTextRollover",
										'IdNode', false,
										'Margins', box(0, 30, 0, -18),
										'Padding', box(10, 10, 10, 0),
										'HAlign', "center",
										'VAlign', "bottom",
										'MinWidth', 243,
										'MaxWidth', 243,
										'FadeInTime', 300,
										'FadeOutTime', 100,
										'TextStyle', "RolloverTextStyle",
										'Translate', true,
										'HideOnEmpty', true,
									}),
									}),
								}),
							PlaceObj('XTemplateFunc', {
								'name', "Open",
								'func', function (self, ...)
XWindow.Open(self, ...)
self.idTextRollover:SetVisible(false)
end,
							}),
							}),
						}),
					PlaceObj('XTemplateFunc', {
						'name', "OnShortcut(self, shortcut, source)",
						'func', function (self, shortcut, source)
if shortcut == "DPadLeft" or shortcut == "LeftThumbLeft" then
	local focus = self.desktop:GetKeyboardFocus()
	if focus:IsWithin(self) and focus:GetFocusOrder():x() == 1 then
		self:GetRelativeFocus(point(#self,0), "exact"):SetFocus(true)
		return "break"
	end
elseif shortcut == "DPadRight" or shortcut == "LeftThumbRight" then
	local focus = self.desktop:GetKeyboardFocus()
	if focus:IsWithin(self) and focus:GetFocusOrder():x() == #self then
		self:GetRelativeFocus(point(1,0), "exact"):SetFocus(true)
		return "break"
	end
end
return XWindow.OnShortcut(self, shortcut, source)
end,
					}),
					}),
				}),
			PlaceObj('XTemplateWindow', {
				'comment', "bottom buttons",
				'Id', "idBottomButtons",
				'Margins', box(0, 0, 0, 25),
				'Dock', "bottom",
				'HAlign', "left",
				'VAlign', "bottom",
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XFrame",
					'IdNode', false,
					'Margins', box(-200, 0, -200, 0),
					'MinWidth', 377,
					'Image', "UI/CommonNew/mm_action_bar.tga",
					'FrameBox', box(50, 0, 327, 0),
					'TileFrame', true,
				}),
				PlaceObj('XTemplateWindow', {
					'Margins', box(115, 0, 0, 0),
					'Padding', box(0, 12, 0, 12),
					'LayoutMethod', "HList",
					'LayoutHSpacing', 20,
				}, {
					PlaceObj('XTemplateForEachAction', {
						'toolbar', "bottommenu",
						'run_after', function (child, context, action, n)
local top = "bottom"
	child:SetVAlign("top")
	child.idButton:SetText(action.ActionName)
	child.idButton:SetOnPressParam(action.ActionId)
	child.idButton:SetFocusOrder(point(n, 1))
end,
					}, {
						PlaceObj('XTemplateWindow', {
							'IdNode', true,
							'LayoutMethod', "HList",
							'LayoutHSpacing', 20,
							'RolloverDrawOnTop', true,
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XImage",
								'HAlign', "left",
								'VAlign', "center",
								'Image', "UI/CommonNew/mm_menus_line.tga",
							}),
							PlaceObj('XTemplateWindow', {
								'comment', "button",
								'__class', "XTextButton",
								'RolloverTemplate', "Rollover",
								'RolloverAnchor', "center-top",
								'Id', "idButton",
								'IdNode', false,
								'HAlign', "center",
								'VAlign', "center",
								'Background', RGBA(255, 255, 255, 0),
								'MouseCursor', "UI/Cursors/Rollover.tga",
								'FXMouseIn', "MainMenuItemHover",
								'FXPress', "MainMenuItemClick",
								'FXPressDisabled', "UIDisabledButtonPressed",
								'FocusedBackground', RGBA(255, 255, 255, 0),
								'DisabledBackground', RGBA(120, 120, 120, 0),
								'OnPressEffect', "action",
								'RolloverBackground', RGBA(255, 255, 255, 0),
								'PressedBackground', RGBA(255, 255, 255, 0),
								'IconColor', RGBA(255, 255, 255, 0),
								'TextStyle', "Action",
								'Translate', true,
							}, {
								PlaceObj('XTemplateFunc', {
									'name', "SetEnabled(self, enabled)",
									'func', function (self, enabled)
XTextButton.SetEnabled(self, enabled)

if not enabled then
	self.parent:AddInterpolation{id = "desat", type = const.intDesaturation, startValue = 255}
	self.parent.GetEnabled = function() return false end
end
end,
								}),
								}),
							}),
						}),
					}),
				}),
			}),
		}),
})

