-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "PreGame",
	id = "PGTutorialNew",
	PlaceObj('XTemplateWindow', nil, {
		PlaceObj('XTemplateWindow', {
			'__class', "XAspectWindow",
			'Fit', "smallest",
		}, {
			PlaceObj('XTemplateLayer', {
				'layer', "PGVideoBackground",
			}),
			PlaceObj('XTemplateWindow', {
				'Margins', box(60, 68, 0, 25),
				'LayoutMethod', "VList",
			}, {
				PlaceObj('XTemplateFunc', {
					'name', "Open",
					'func', function (self, ...)
						XWindow.Open(self, ...)
						self:SetMargins(GetSafeMargins(self:GetMargins()))
					end,
				}),
				PlaceObj('XTemplateTemplate', {
					'__template', "DialogTitleNew",
					'Margins', box(55, 0, 0, 0),
					'Title', T(577305258682, --[[XTemplate PGTutorialNew Title]] "Tutorials"),
					'Subtitle', T(797581848776, --[[XTemplate PGTutorialNew Subtitle]] "Completed (0/5)"),
				}, {
					PlaceObj('XTemplateCode', {
						'run', function (self, parent, context)
							parent:ResolveId("node"):SetSubtitle(T{11443, "Completed (<completed>/<max>)", completed = CountCompletedTutorials(),max = CountTotalTutorials})
						end,
					}),
					}),
				PlaceObj('XTemplateWindow', {
					'comment', "buttons list",
					'Id', "idButtonsList",
					'Margins', box(55, 120, 0, 0),
					'LayoutMethod', "HList",
					'LayoutHSpacing', 15,
				}, {
					PlaceObj('XTemplateForEach', {
						'array', function (parent, context) return Presets.TutorialPreset.Default end,
						'__context', function (parent, context, item, i, n) return item end,
						'run_after', function (child, context, item, i, n)
							child.idText:SetText(item.pregame_title)
								child.idButton:SetFocusOrder(point(n, 0))
								child.idButton:SetImage(item.image)
								child.idDownImage:SetFlipX(n%2==0)
								child.idButton.itemid = item.id
								child.idTextRollover:SetText(item.description)
								if n == 1 and GetUIStyleGamepad() then
									child:CreateThread("FocusThread", function()
										child.idButton:SetFocus()
									end)
								end
								child.idTextRollover:SetVisible(false)
						end,
					}, {
						PlaceObj('XTemplateWindow', {
							'IdNode', true,
							'VAlign', "top",
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
								'MinWidth', 243,
								'MinHeight', 243,
								'MouseCursor', "UI/Cursors/Rollover.tga",
								'FXMouseIn', "MainMenuItemHover",
								'FXPress', "MainMenuItemClick",
								'FXPressDisabled', "UIDisabledButtonPressed",
								'DisabledBackground', RGBA(120, 120, 120, 255),
								'OnPress', function (self, gamepad)
									CreateRealTimeThread(StartTutorial, self.itemid)
								end,
							}, {
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
								PlaceObj('XTemplateFunc', {
									'name', "SetRollover(self, rollover)",
									'func', function (self, rollover)
										self.parent:SetRollover(rollover)
										XTextButton.SetRollover(self, rollover)
										
										local duration = 200
										local frame = self.parent:ResolveId("idFrame")
										local image = self.parent:ResolveId("idDownImage")
										local textContainer = self.parent:ResolveId("idTextContainer")
										local rText = self.parent:ResolveId("idTextRollover")
										
										frame:AddInterpolation{
											id = "move",
											type = const.intRect,
											duration = duration,
											targetRect = sizebox(frame.box:minx(), frame.box:miny() - rText.box:sizey(), frame.box:sizex(), frame.box:sizey() + 1+ rText.box:sizey()),
											originalRect =  frame.box,
											flags = (not rollover) and const.intfInverse or nil,
										}
										
										rText:SetVisible(rollover)
										rText:AddInterpolation{
											id = "move",
											type = const.intRect,
											start = GetPreciseTicks() + duration/2,
											duration = duration/2,
											originalRect = rText.box,
											targetRect = sizebox(image.box:minx(),image.box:miny(),rText.box:sizex(),0),
											flags =rollover and const.intfInverse or nil,
										}
										
										textContainer:SetRollover(rollover)
										textContainer:AddInterpolation{
											id = "move",
											type = const.intRect,
											duration = duration,
											targetRect = Offset(textContainer.box,0, -rText.box:sizey()),
											originalRect = textContainer.box,
											flags = (not rollover) and const.intfInverse or nil,
										}
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
									PlaceObj('XTemplateWindow', {
										'Id', "idTextContainer",
										'Margins', box(20, 0, 0, -30),
										'HAlign', "left",
										'VAlign', "bottom",
										'LayoutMethod', "HList",
										'LayoutHSpacing', 10,
									}, {
										PlaceObj('XTemplateWindow', nil, {
											PlaceObj('XTemplateWindow', {
												'__class', "XImage",
												'Id', "idCheckBack",
												'Image', "UI/CommonNew/check_slot_hex.tga",
												'ImageScale', point(600, 600),
											}),
											PlaceObj('XTemplateWindow', {
												'__class', "XImage",
												'Id', "idCheck",
												'Image', "UI/Common/mission_yes.tga",
												'ImageScale', point(800, 800),
											}, {
												PlaceObj('XTemplateCode', {
													'run', function (self, parent, context)
														parent:SetVisible(AccountStorage and AccountStorage.CompletedTutorials and AccountStorage.CompletedTutorials[context.id])
													end,
												}),
												}),
											}),
										PlaceObj('XTemplateTemplate', {
											'__template', "MainMenuButtonText",
											'Id', "idText",
											'Padding', box(2, 4, 2, 4),
											'VAlign', "center",
											'Translate', true,
										}),
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
				PlaceObj('XTemplateAction', {
					'ActionId', "back",
					'ActionName', T(4254, --[[XTemplate PGTutorialNew ActionName]] "BACK"),
					'ActionToolbar', "ActionBar",
					'ActionShortcut', "Escape",
					'ActionGamepad', "ButtonB",
					'OnActionEffect', "back",
				}),
				PlaceObj('XTemplateTemplate', {
					'__template', "ActionBarNew",
					'Margins', box(55, 0, 0, 0),
				}),
				}),
			}),
		}),
})

