-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "PreGame",
	id = "PGMenu",
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
				'comment', "Paradox news container",
				'__condition', function (parent, context) return not Platform.console end,
				'Id', "idParadoxNews",
				'Margins', box(0, 30, -80, 0),
				'HAlign', "right",
				'VAlign', "top",
				'LayoutMethod', "VList",
				'Visible', false,
				'FadeInTime', 300,
			}, {
				PlaceObj('XTemplateWindow', {
					'comment', "upper line",
					'__class', "XImage",
					'Margins', box(0, 0, 0, -60),
					'Dock', "top",
					'HAlign', "center",
					'VAlign', "top",
					'Image', "UI/Common/bm_pad.tga",
					'ImageScale', point(600, 600),
				}),
				PlaceObj('XTemplateWindow', {
					'comment', "lower line",
					'__class', "XImage",
					'Margins', box(0, -60, 0, 0),
					'Dock', "bottom",
					'HAlign', "center",
					'VAlign', "bottom",
					'Image', "UI/Common/bm_pad.tga",
					'ImageScale', point(600, 600),
					'Angle', 10800,
				}),
				PlaceObj('XTemplateWindow', {
					'comment', "news image",
					'__class', "XImage",
					'Id', "idImage",
					'Margins', box(0, 20, 0, 0),
					'Padding', box(20, 0, 20, 0),
					'HAlign', "center",
					'VAlign', "center",
					'MaxHeight', 180,
					'Image', "UI/Store Pictures/placeholder.tga",
					'ImageFit', "height",
				}),
				PlaceObj('XTemplateWindow', {
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
						'TextFont', "InfopanelText",
						'TextColor', RGBA(244, 228, 117, 255),
						'RolloverTextColor', RGBA(244, 228, 117, 255),
						'Translate', true,
						'TextHAlign', "center",
						'TextVAlign', "center",
					}),
					}),
				PlaceObj('XTemplateAction', {
					'ActionId', "idSelectFeedEntry",
					'ActionGamepad', "+RightShoulder",
				}),
				PlaceObj('XTemplateCode', {
					'run', function (self, parent, context)
UIShowParadoxFeeds(parent, true)
local dlg = GetActionsHost(parent)
local action = table.find_value(dlg.actions, "ActionId", "idSelectFeedEntry")
if action then
	action.OnAction = function()
		dlg.idImage:OnMouseButtonDown()
	end
end
end,
				}),
				}),
			PlaceObj('XTemplateWindow', {
				'comment', "MM buttons container",
				'Margins', box(0, 0, 0, 30),
				'HAlign', "center",
				'VAlign', "bottom",
			}, {
				PlaceObj('XTemplateWindow', {
					'comment', "background",
					'Margins', box(-350, 0, -350, 30),
					'VAlign', "center",
					'LayoutMethod', "VList",
					'LayoutVSpacing', 48,
				}, {
					PlaceObj('XTemplateWindow', {
						'VAlign', "top",
					}, {
						PlaceObj('XTemplateWindow', {
							'comment', "upper line",
							'__class', "XImage",
							'VAlign', "bottom",
							'Image', "UI/Common/bm_pad.tga",
							'ImageFit', "stretch-x",
							'ImageScale', point(600, 600),
							'Angle', 10800,
						}),
						PlaceObj('XTemplateWindow', {
							'comment', "upper watermark",
							'__class', "XImage",
							'HAlign', "center",
							'VAlign', "bottom",
							'Image', "UI/Common/bm_pad_watermark.tga",
							'Angle', 10800,
						}),
						}),
					PlaceObj('XTemplateWindow', nil, {
						PlaceObj('XTemplateWindow', {
							'comment', "lower line",
							'__class', "XImage",
							'VAlign', "top",
							'Image', "UI/Common/bm_pad.tga",
							'ImageFit', "stretch-x",
							'ImageScale', point(600, 600),
						}),
						PlaceObj('XTemplateWindow', {
							'comment', "lower watermark",
							'__class', "XImage",
							'HAlign', "center",
							'VAlign', "top",
							'Image', "UI/Common/bm_pad_watermark.tga",
						}),
						}),
					}),
				PlaceObj('XTemplateAction', {
					'ActionId', "idQuickStart",
					'ActionName', T{1126, --[[XTemplate PGMenu ActionName]] "EASY START"},
					'ActionIcon', "UI/Icons/main_menu_quick_start.tga",
					'ActionToolbar', "mainmenu",
					'OnAction', function (self, host, source, toggled)
CreateRealTimeThread(function()
	LoadingScreenOpen("idLoadingScreen", "QuickStart")
	GenerateRandomMissionParams()
	GenerateRandomMapParams()
	GenerateCurrentRandomMap()
	TelemetryBeginSession("new_quick_start")
	CloseMenuDialogs()
	LoadingScreenClose("idLoadingScreen", "QuickStart")
end)
end,
				}),
				PlaceObj('XTemplateAction', {
					'ActionId', "idNewGame",
					'ActionName', T{1127, --[[XTemplate PGMenu ActionName]] "NEW GAME"},
					'ActionIcon', "UI/Icons/main_menu_new_game.tga",
					'ActionToolbar', "mainmenu",
					'OnAction', function (self, host, source, toggled)
CreateRealTimeThread(function()
		InitNewGameMissionParams()
		LoadingScreenOpen("idLoadingScreen", "pre_game")
		ChangeMap("PreGame")
		if host.window_state ~= "destroying" then
			host:SetMode("Mission")
		end
		LoadingScreenClose("idLoadingScreen", "pre_game")
end)
end,
				}),
				PlaceObj('XTemplateAction', {
					'ActionId', "idLoad",
					'ActionName', T{1128, --[[XTemplate PGMenu ActionName]] "LOAD GAME"},
					'ActionIcon', "UI/Icons/main_menu_load_game.tga",
					'ActionToolbar', "mainmenu",
					'ActionState', function (self, host)
return IsLoadButtonDisabled(host.context) and "disabled"
end,
					'OnActionEffect', "mode",
					'OnActionParam', "Load",
				}),
				PlaceObj('XTemplateAction', {
					'ActionId', "idModManager",
					'ActionName', T{1129, --[[XTemplate PGMenu ActionName]] "MOD MANAGER"},
					'ActionIcon', "UI/Icons/main_menu_mod_manager.tga",
					'ActionToolbar', "mainmenu",
					'OnAction', function (self, host, source, toggled)
CreateRealTimeThread(function()
	ShowParadoxModManagerWarning()
	host:SetMode("ModManager")
end)
end,
					'__condition', function (parent, context) return Platform.steam or Platform.pc end,
				}),
				PlaceObj('XTemplateAction', {
					'ActionId', "idModEditor",
					'ActionName', T{1130, --[[XTemplate PGMenu ActionName]] "MOD EDITOR"},
					'ActionIcon', "UI/Icons/main_menu_mod_editor.tga",
					'ActionToolbar', "mainmenu",
					'OnAction', function (self, host, source, toggled)
CreateRealTimeThread(function()
	ModEditorOpen()
	host:delete()
end)
end,
					'__condition', function (parent, context) return Platform.pc end,
				}),
				PlaceObj('XTemplateAction', {
					'ActionId', "idOptions",
					'ActionName', T{1131, --[[XTemplate PGMenu ActionName]] "OPTIONS"},
					'ActionIcon', "UI/Icons/main_menu_options.tga",
					'ActionToolbar', "mainmenu",
					'OnActionEffect', "mode",
					'OnActionParam', "Options",
				}),
				PlaceObj('XTemplateAction', {
					'ActionId', "idAchievements",
					'ActionName', T{498260347235, --[[XTemplate PGMenu ActionName]] "ACHIEVEMENTS"},
					'ActionIcon', "UI/Icons/main_menu_achievements.tga",
					'ActionToolbar', "mainmenu",
					'OnAction', function (self, host, source, toggled)
OpenXDialog("Achievements")
end,
					'__condition', function (parent, context) return not Platform.steam and not Platform.console end,
				}),
				PlaceObj('XTemplateAction', {
					'ActionId', "idParadoxAccount",
					'ActionName', T{4525, --[[XTemplate PGMenu ActionName]] "PARADOX ACCOUNT"},
					'ActionIcon', "UI/Icons/main_menu_paradox.tga",
					'ActionToolbar', "mainmenu",
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
					'ActionName', T{1132, --[[XTemplate PGMenu ActionName]] "QUIT"},
					'ActionIcon', "UI/Icons/main_menu_exit.tga",
					'ActionToolbar', "mainmenu",
					'ActionShortcut', "Escape",
					'OnAction', function (self, host, source, toggled)
QuitGame(terminal.desktop)
end,
					'__condition', function (parent, context) return not Platform.console end,
				}),
				PlaceObj('XTemplateWindow', {
					'comment', "buttons list",
					'HAlign', "center",
					'VAlign', "center",
					'MinHeight', 250,
					'LayoutMethod', "HList",
					'LayoutHSpacing', -164,
					'UniformColumnWidth', true,
				}, {
					PlaceObj('XTemplateForEachAction', {
						'toolbar', "mainmenu",
						'run_after', function (child, context, action, n)
local valign = n % 2 == 1 and "top" or "bottom"
local top = valign=="top"
	child:SetVAlign(valign)
	child.idText:SetMargins(box(0,  top and 0 or 15, 0, not top and 0 or 15))
	child.idText:SetDock(valign)
	child.idText:SetText(action.ActionName)
	child.idButton:SetFocusOrder(point(n, 0))
	child.idButton:SetImage(action.ActionIcon)
	child.idButton:SetOnPressParam(action.ActionId)
	child.idSelection:SetAngle(top  and 180*60 or 0)
	child.idSelection:SetMargins(box(0, top and -50 or 0, 0, top and 0 or -50))
	child.idSelection:SetVAlign(valign)
	if n == 1 and GetUIStyleGamepad() then
		child:CreateThread("FocusThread", function()
			child.idButton:SetFocus()
		end)
	end
end,
					}, {
						PlaceObj('XTemplateWindow', {
							'IdNode', true,
							'MinWidth', 260,
							'MaxWidth', 260,
							'RolloverZoom', 1100,
							'RolloverDrawOnTop', true,
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XImage",
								'Id', "idSelection",
								'HAlign', "center",
								'Visible', false,
								'FadeInTime', 500,
								'FadeOutTime', 250,
								'Image', "UI/Common/watermark_shine_half.tga",
							}),
							PlaceObj('XTemplateWindow', {
								'comment', "button",
								'__class', "XTextButton",
								'Id', "idButton",
								'IdNode', false,
								'Shape', "InHHex",
								'HAlign', "center",
								'VAlign', "top",
								'LayoutMethod', "VList",
								'MouseCursor', "UI/Cursors/Rollover.tga",
								'FXMouseIn', "MainMenuItemHover",
								'FXPress', "MainMenuItemClick",
								'FXPressDisabled', "UIDisabledButtonPressed",
								'DisabledBackground', RGBA(120, 120, 120, 255),
								'OnPressEffect', "action",
								'SqueezeX', true,
								'SqueezeY', true,
								'ColumnsUse', "abbbb",
							}, {
								PlaceObj('XTemplateFunc', {
									'name', "SetRollover",
									'func', function (self, ...)
local args = {...}
local rollover = args[1]
self.parent:SetRollover(rollover)
self.parent.idSelection:SetVisible(self:GetEnabled() and rollover)
XTextButton.SetRollover(self, rollover)
end,
								}),
								PlaceObj('XTemplateFunc', {
									'name', "SetEnabled",
									'func', function (self, ...)
XTextButton.SetEnabled(self, ...)
self.parent.idText:SetEnabled(...)
local bEnabled = ...
if not bEnabled then
	self.parent:AddInterpolation{id = "desat", type = const.intDesaturation, startValue = 255}
	self.parent.GetEnabled = function() return false end
end
end,
								}),
								PlaceObj('XTemplateWindow', {
									'__class', "XImage",
									'Id', "idRollover",
									'Margins', box(-10, -10, -10, -10),
									'Dock', "box",
									'Visible', false,
									'FadeInTime', 100,
									'FadeOutTime', 100,
									'Image', "UI/Common/Hex_2_shine.tga",
								}),
								}),
							PlaceObj('XTemplateTemplate', {
								'__template', "MainMenuButtonText",
								'Id', "idText",
								'Padding', box(2, 4, 2, 4),
								'HAlign', "center",
								'DisabledTextColor', RGBA(128, 128, 128, 255),
								'Translate', true,
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
			}),
		}),
})

