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
					'Title', T{577305258682, --[[XTemplate PGTutorialNew Title]] "Tutorials"},
					'Subtitle', T{797581848776, --[[XTemplate PGTutorialNew Subtitle]] "Completed (0/5)"},
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
	child.idButton.itemid = item.id
	child.idPGRollover:SetText(item.description)
	if n == 1 and GetUIStyleGamepad() then
		child:CreateThread("FocusThread", function()
			child.idButton:SetFocus()
		end)
	end
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
									'name', "SetRollover(self, rollover)",
									'func', function (self, rollover)
self.parent:SetRollover(rollover)
XTextButton.SetRollover(self, rollover)
local ctrl_rollover = self.parent:ResolveId("idPGRollover")
if ctrl_rollover  then
	ctrl_rollover:SetRollover(rollover )	
end

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
									'Margins', box(20, 0, 0, 5),
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
							PlaceObj('XTemplateTemplate', {
								'__template', "PGRollover",
								'Margins', box(0, 0, 0, 60),
								'Dock', "box",
								'HAlign', "center",
								'VAlign', "bottom",
								'MinWidth', 243,
								'MaxWidth', 243,
								'GridStretchX', false,
							}),
							PlaceObj('XTemplateFunc', {
								'name', "Open",
								'func', function (self, ...)
XWindow.Open(self, ...)
self.idPGRollover:SetVisible(false)
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
					'ActionName', T{4254, --[[XTemplate PGTutorialNew ActionName]] "BACK"},
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

