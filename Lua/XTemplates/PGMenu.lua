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
				PlaceObj('XTemplateFunc', {
					'name', "Open",
					'func', function (self, ...)
XWindow.Open(self, ...)
UIShowParadoxFeeds(self, true)
end,
				}),
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
				PlaceObj('XTemplateAction', {
					'ActionId', "idSelectFeedEntry",
					'ActionGamepad', "+RightShoulder",
					'OnAction', function (self, host, source)
host.idContent.idLinkButton:Press()
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
					'LayoutVSpacing', 49,
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
				PlaceObj('XTemplateMode', {
					'mode', "Main",
				}, {
					PlaceObj('XTemplateAction', {
						'ActionId', "idTutorial",
						'ActionName', T(756622437336, --[[XTemplate PGMenu ActionName]] "TUTORIAL"),
						'ActionIcon', "UI/Icons/main_menu_tutorial.tga",
						'ActionToolbar', "mainmenu",
						'OnAction', function (self, host, source)
CreateRealTimeThread(function()
	WaitWarnTutorialWithMods(host)
	host:SetMode("Tutorial")
end)
end,
					}),
					PlaceObj('XTemplateAction', {
						'RolloverText', T(427174640796, --[[XTemplate PGMenu RolloverText]] "Start a survival game, which allows you to choose Mission Sponsor, Commander Profile, Rocket payload and landing location."),
						'RolloverTitle', T(10455, --[[XTemplate PGMenu RolloverTitle]] "NEW GAME"),
						'ActionId', "idStandardGame",
						'ActionName', T(10455, --[[XTemplate PGMenu ActionName]] "NEW GAME"),
						'ActionIcon', "UI/Icons/main_menu_new_game.tga",
						'ActionToolbar', "mainmenu",
						'OnAction', function (self, host, source)
StartNewGame(host, "Mission")
end,
					}),
					PlaceObj('XTemplateAction', {
						'RolloverText', T(650579644429, --[[XTemplate PGMenu RolloverText]] "Create the colony that you imagine and test how it works without worrying about survival threats.<newline><newline><NoAchievements()>"),
						'RolloverTitle', T(144559490492, --[[XTemplate PGMenu RolloverTitle]] "CREATIVE MODE"),
						'ActionId', "idCreativeMode",
						'ActionName', T(144559490492, --[[XTemplate PGMenu ActionName]] "CREATIVE MODE"),
						'ActionIcon', "UI/Icons/main_menu_creative_mode.tga",
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
						'RolloverText', T(554914047909, --[[XTemplate PGMenu RolloverText]] "Challenge yourself to accomplish a specific objective within a time limit.\n\nMission parameters and colony site are predetermined."),
						'ActionId', "idChallenge",
						'ActionName', T(10519, --[[XTemplate PGMenu ActionName]] "CHALLENGE MODE"),
						'ActionIcon', "UI/Icons/main_menu_challenges.tga",
						'ActionToolbar', "mainmenu",
						'OnAction', function (self, host, source)
StartNewGame(host, "Challenge")
end,
					}),
					PlaceObj('XTemplateAction', {
						'ActionId', "idLoad",
						'ActionName', T(1128, --[[XTemplate PGMenu ActionName]] "LOAD GAME"),
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
						'ActionName', T(1129, --[[XTemplate PGMenu ActionName]] "MOD MANAGER"),
						'ActionIcon', "UI/Icons/main_menu_mod_manager.tga",
						'ActionToolbar', "mainmenu",
						'OnActionEffect', "mode",
						'OnActionParam', "ModManager",
						'__condition', function (parent, context) return not Platform.ps4 end,
					}),
					PlaceObj('XTemplateAction', {
						'ActionId', "idModEditor",
						'ActionName', T(1130, --[[XTemplate PGMenu ActionName]] "MOD EDITOR"),
						'ActionIcon', "UI/Icons/main_menu_mod_editor.tga",
						'ActionToolbar', "mainmenu",
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
						'ActionName', T(1131, --[[XTemplate PGMenu ActionName]] "OPTIONS"),
						'ActionIcon', "UI/Icons/main_menu_options.tga",
						'ActionToolbar', "mainmenu",
						'OnActionEffect', "mode",
						'OnActionParam', "Options",
					}),
					PlaceObj('XTemplateAction', {
						'ActionId', "idAchievements",
						'ActionName', T(856797454991, --[[XTemplate PGMenu ActionName]] "ACHIEVEMENTS"),
						'ActionIcon', "UI/Icons/main_menu_achievements.tga",
						'ActionToolbar', "mainmenu",
						'OnAction', function (self, host, source)
OpenDialog("Achievements")
end,
						'__condition', function (parent, context) return not Platform.steam and not Platform.console end,
					}),
					PlaceObj('XTemplateAction', {
						'ActionId', "idParadoxAccount",
						'ActionName', T(4525, --[[XTemplate PGMenu ActionName]] "PARADOX ACCOUNT"),
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
						'ActionName', T(1132, --[[XTemplate PGMenu ActionName]] "QUIT"),
						'ActionIcon', "UI/Icons/main_menu_exit.tga",
						'ActionToolbar', "mainmenu",
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
								'RolloverTemplate', "Rollover",
								'RolloverAnchor', "center-top",
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
									'name', "SetRollover(self, rollover)",
									'func', function (self, rollover)
self.parent:SetRollover(rollover)
self.parent.idSelection:SetVisible(self:GetEnabled() and rollover)
XTextButton.SetRollover(self, rollover)
local text = self.parent:ResolveId("idText")
if text then
	text:SetRollover(rollover)	
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

