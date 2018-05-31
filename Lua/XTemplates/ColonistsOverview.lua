-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "CCC",
	id = "ColonistsOverview",
	PlaceObj('XTemplateTemplate', {
		'__context', function (parent, context) return context or {} end,
		'__template', "OverlayDlg",
		'MinWidth', 500,
		'InitialMode', "colonists",
		'InternalModes', "colonists, domes, traits",
	}, {
		PlaceObj('XTemplateCode', {
			'run', function (self, parent, context)
local dlg = GetXDialog(parent)
if dlg then
	dlg.OnShortcut = function(dlg, shortcut, source)
		if shortcut == "RightShoulder" and rawget(dlg, "idList") then
			if not dlg.idList:IsFocused(true) then
				dlg.idList:SetFocus()
				dlg.idList:SetSelection(rawget(dlg, "last_list_focus") or 1)
				return "break"
			end
		elseif shortcut == "LeftShoulder" and rawget(dlg, "idButtons") then
			if not dlg.idButtons:IsFocused(true) then
				rawset(dlg, "last_list_focus", dlg.idList.focused_item)
				dlg.idButtons[1]:SetFocus()
				return "break"
			end
		end
		return XDialog.OnShortcut(dlg, shortcut, source)
	end
end
end,
		}),
		PlaceObj('XTemplateTemplate', {
			'__template', "CommandCenterTitle",
			'Id', "idTitle",
			'Title', T{106988210968, --[[XTemplate ColonistsOverview Title]] "COLONISTS"},
		}),
		PlaceObj('XTemplateWindow', {
			'__context', function (parent, context) return context or {} end,
			'__class', "XContentTemplate",
			'IdNode', false,
			'LayoutMethod', "VList",
		}, {
			PlaceObj('XTemplateMode', {
				'mode', "colonists",
			}, {
				PlaceObj('XTemplateWindow', {
					'Dock', "top",
					'LayoutMethod', "VList",
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XContextWindow",
						'Id', "idButtons",
						'Padding', box(50, 0, 0, 0),
						'HAlign', "left",
						'VAlign', "top",
						'LayoutMethod', "HList",
						'OnContextUpdate', function (self, context, ...)
for _, child in ipairs(self) do
	child:OnContextUpdate(context, ...)
end
XContextWindow.OnContextUpdate(self, context, ...)
end,
					}, {
						PlaceObj('XTemplateFunc', {
							'name', "OnShortcut(self, shortcut, source)",
							'func', function (self, shortcut, source)
local rel = XShortcutToRelation[shortcut]
if rel == "up" or rel == "down" then
	return "break"
elseif rel == "left" or rel == "right" then
	local focus = self.desktop:GetKeyboardFocus()
	local idx = table.find(self, focus)
	if idx then
		if rel == "left" and idx == 1 then
			self[#self]:SetFocus()
			return "break"
		elseif rel == "right" and idx == #self then
			self[1]:SetFocus()
			return "break"
		end
	end
end
return XContextWindow.OnShortcut(self, shortcut, source)
end,
						}),
						PlaceObj('XTemplateTemplate', {
							'__template', "CommandCenterDomeFilter",
							'RolloverAnchorId', "idButtons",
						}),
						PlaceObj('XTemplateWindow', {
							'__class', "XTextButton",
							'RolloverTemplate', "Rollover",
							'RolloverAnchor', "left",
							'RolloverAnchorId', "idButtons",
							'RolloverTitle', T{3720, --[[XTemplate ColonistsOverview RolloverTitle]] "Trait"},
							'RolloverHint', T{294970758448, --[[XTemplate ColonistsOverview RolloverHint]] "<left_click> Set filter"},
							'Margins', box(0, 0, 20, 0),
							'VAlign', "center",
							'ScaleModifier', point(700, 700),
							'LayoutMethod', "Box",
							'Background', RGBA(0, 0, 0, 0),
							'RolloverZoom', 1100,
							'RolloverDrawOnTop', true,
							'MouseCursor', "UI/Cursors/Rollover.tga",
							'RelativeFocusOrder', "next-in-line",
							'OnContextUpdate', function (self, context, ...)
XTextButton.OnContextUpdate(self, context, ...)
self:SetRolloverText(GetColonistsFilterRollover(context, T{9672, "Filter by Trait."}))
local hint_gamepad = T{507431830973, "<ButtonA> Set filter"} .. " " .. T{9802, "<RB> Inspect"}
self:SetRolloverHintGamepad(hint_gamepad)
end,
							'FXMouseIn', "MenuItemHover",
							'FXPress', "MenuItemClick",
							'FXPressDisabled', "UIDisabledButtonPressed",
							'FocusedBackground', RGBA(0, 0, 0, 0),
							'OnPress', function (self, gamepad)
local dlg = GetXDialog(self)
dlg:SetMode("traits")
end,
							'RolloverBackground', RGBA(0, 0, 0, 0),
							'PressedBackground', RGBA(0, 0, 0, 0),
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XImage",
								'Id', "idButtonIcon",
								'IdNode', false,
								'ZOrder', 2,
								'Shape', "InHHex",
								'Dock', "left",
								'MinWidth', 72,
								'MinHeight', 84,
								'MaxWidth', 72,
								'MaxHeight', 84,
								'HandleMouse', true,
								'Image', "UI/Icons/ColonyControlCenter/filter_by_trait.tga",
								'ImageFit', "smallest",
							}, {
								PlaceObj('XTemplateWindow', {
									'__class', "XImage",
									'Id', "idRollover",
									'Margins', box(-6, -6, -6, -6),
									'Dock', "box",
									'Visible', false,
									'Image', "UI/Common/Hex_small_shine.tga",
									'ImageFit', "smallest",
								}),
								}),
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Margins', box(6, 0, 0, 0),
								'Padding', box(0, 0, 0, 0),
								'VAlign', "center",
								'MinWidth', 150,
								'MaxWidth', 150,
								'MaxHeight', 40,
								'ScaleModifier', point(1450, 1450),
								'TextFont', "PGLogo",
								'TextColor', RGBA(255, 255, 255, 255),
								'ContextUpdateOnOpen', true,
								'OnContextUpdate', function (self, context, ...)
self:SetText(context.trait and context.trait.display_name or T{652319561018, "All Traits"})
XLabel.OnContextUpdate(self, context, ...)
end,
								'Translate', true,
								'Shorten', true,
							}),
							}),
						PlaceObj('XTemplateWindow', {
							'comment', "able to work",
							'__class', "XTextButton",
							'RolloverTemplate', "Rollover",
							'RolloverAnchor', "left",
							'RolloverAnchorId', "idButtons",
							'RolloverTitle', T{9673, --[[XTemplate ColonistsOverview RolloverTitle]] "Able to Work"},
							'VAlign', "center",
							'ScaleModifier', point(700, 700),
							'LayoutMethod', "Box",
							'Background', RGBA(0, 0, 0, 0),
							'RolloverZoom', 1100,
							'RolloverDrawOnTop', true,
							'MouseCursor', "UI/Cursors/Rollover.tga",
							'RelativeFocusOrder', "next-in-line",
							'OnContextUpdate', function (self, context, ...)
local dlg = GetXDialog(self)
local able_to_work = dlg.context.able_to_work
self:SetIcon(able_to_work == false and "UI/Icons/ColonyControlCenter/working_age_off.tga" or "UI/Icons/ColonyControlCenter/working_age_on.tga")
self:SetRolloverText(GetColonistsFilterRollover(context, T{515632937650, "Toggle filtering of Colonists that are able to work."}))
self:SetRolloverHint(able_to_work ~= false and T{9787, "<left_click> Hide filtered objects"} or T{9788, "<left_click> Show filtered objects"})
local hint_gamepad = able_to_work ~= false and T{9789, "<ButtonA> Hide filtered objects"} or T{9790, "<ButtonA> Show filtered objects"}
hint_gamepad = hint_gamepad .. " " .. T{9802, "<RB> Inspect"}
self:SetRolloverHintGamepad(hint_gamepad)
end,
							'FXMouseIn', "MenuItemHover",
							'FXPress', "MenuItemClick",
							'FXPressDisabled', "UIDisabledButtonPressed",
							'FocusedBackground', RGBA(0, 0, 0, 0),
							'OnPress', function (self, gamepad)
ToggleCommandCenterFilter(self, "able_to_work", true)
end,
							'RolloverBackground', RGBA(0, 0, 0, 0),
							'PressedBackground', RGBA(0, 0, 0, 0),
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XImage",
								'Id', "idRollover",
								'Margins', box(-6, -6, -6, -6),
								'Visible', false,
								'FadeInTime', 100,
								'FadeOutTime', 100,
								'FXMouseIn', "MenuItemHovers",
								'FXPress', "MenuItemClick",
								'FXPressDisabled', "UIDisabledButtonPressed",
								'Image', "UI/Common/Hex_small_shine.tga",
								'ImageFit', "stretch",
							}),
							}),
						PlaceObj('XTemplateWindow', {
							'comment', "unable to work",
							'__class', "XTextButton",
							'RolloverTemplate', "Rollover",
							'RolloverAnchor', "left",
							'RolloverAnchorId', "idButtons",
							'RolloverTitle', T{731124482973, --[[XTemplate ColonistsOverview RolloverTitle]] "Unable to Work"},
							'Margins', box(0, 0, 40, 0),
							'VAlign', "center",
							'ScaleModifier', point(700, 700),
							'LayoutMethod', "Box",
							'Background', RGBA(0, 0, 0, 0),
							'RolloverZoom', 1100,
							'RolloverDrawOnTop', true,
							'MouseCursor', "UI/Cursors/Rollover.tga",
							'RelativeFocusOrder', "next-in-line",
							'OnContextUpdate', function (self, context, ...)
local dlg = GetXDialog(self)
local unable_to_work = dlg.context.unable_to_work
self:SetIcon(not unable_to_work and "UI/Icons/ColonyControlCenter/unable_to_work_off.tga" or "UI/Icons/ColonyControlCenter/unable_to_work_on.tga")
self:SetRolloverText(GetColonistsFilterRollover(context, T{9674, "Toggle filtering of Colonists that are unable to work."}))
self:SetRolloverHint(unable_to_work and T{9787, "<left_click> Hide filtered objects"} or T{9788, "<left_click> Show filtered objects"})
local hint_gamepad = unable_to_work and T{9789, "<ButtonA> Hide filtered objects"} or T{9790, "<ButtonA> Show filtered objects"}
hint_gamepad = hint_gamepad .. " " .. T{9802, "<RB> Inspect"}
self:SetRolloverHintGamepad(hint_gamepad)
end,
							'FXMouseIn', "MenuItemHover",
							'FXPress', "MenuItemClick",
							'FXPressDisabled', "UIDisabledButtonPressed",
							'FocusedBackground', RGBA(0, 0, 0, 0),
							'OnPress', function (self, gamepad)
ToggleCommandCenterFilter(self, "unable_to_work")
end,
							'RolloverBackground', RGBA(0, 0, 0, 0),
							'PressedBackground', RGBA(0, 0, 0, 0),
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XImage",
								'Id', "idRollover",
								'Margins', box(-6, -6, -6, -6),
								'Visible', false,
								'FadeInTime', 100,
								'FadeOutTime', 100,
								'FXMouseIn', "MenuItemHovers",
								'FXPress', "MenuItemClick",
								'FXPressDisabled', "UIDisabledButtonPressed",
								'Image', "UI/Common/Hex_small_shine.tga",
								'ImageFit', "stretch",
							}),
							}),
						PlaceObj('XTemplateWindow', {
							'comment', "homeless",
							'__class', "XTextButton",
							'RolloverTemplate', "Rollover",
							'RolloverAnchor', "left",
							'RolloverAnchorId', "idButtons",
							'RolloverTitle', T{9665, --[[XTemplate ColonistsOverview RolloverTitle]] "Homeless colonists"},
							'Margins', box(0, 0, 40, 0),
							'VAlign', "center",
							'ScaleModifier', point(700, 700),
							'LayoutMethod', "Box",
							'Background', RGBA(0, 0, 0, 0),
							'RolloverZoom', 1100,
							'RolloverDrawOnTop', true,
							'MouseCursor', "UI/Cursors/Rollover.tga",
							'RelativeFocusOrder', "next-in-line",
							'OnContextUpdate', function (self, context, ...)
local dlg = GetXDialog(self)
local homeless = dlg.context.homeless
self:SetIcon(not homeless and "UI/Icons/ColonyControlCenter/homeless_off.tga" or "UI/Icons/ColonyControlCenter/homeless_on.tga")
self:SetRolloverText(GetColonistsFilterRollover(context, T{9676, "Toggle filtering of Homeless Colonists."}))
self:SetRolloverHint(homeless and T{9787, "<left_click> Hide filtered objects"} or T{9788, "<left_click> Show filtered objects"})
local hint_gamepad = homeless and T{9789, "<ButtonA> Hide filtered objects"} or T{9790, "<ButtonA> Show filtered objects"}
hint_gamepad = hint_gamepad .. " " .. T{9802, "<RB> Inspect"}
self:SetRolloverHintGamepad(hint_gamepad)
end,
							'FXMouseIn', "MenuItemHover",
							'FXPress', "MenuItemClick",
							'FXPressDisabled', "UIDisabledButtonPressed",
							'FocusedBackground', RGBA(0, 0, 0, 0),
							'OnPress', function (self, gamepad)
ToggleCommandCenterFilter(self, "homeless")
end,
							'RolloverBackground', RGBA(0, 0, 0, 0),
							'PressedBackground', RGBA(0, 0, 0, 0),
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XImage",
								'Id', "idRollover",
								'Margins', box(-6, -6, -6, -6),
								'Visible', false,
								'FadeInTime', 100,
								'FadeOutTime', 100,
								'FXMouseIn', "MenuItemHovers",
								'FXPress', "MenuItemClick",
								'FXPressDisabled', "UIDisabledButtonPressed",
								'Image', "UI/Common/Hex_small_shine.tga",
								'ImageFit', "stretch",
							}),
							}),
						PlaceObj('XTemplateWindow', {
							'comment', "unemployed",
							'__class', "XTextButton",
							'RolloverTemplate', "Rollover",
							'RolloverAnchor', "left",
							'RolloverAnchorId', "idButtons",
							'RolloverTitle', T{9666, --[[XTemplate ColonistsOverview RolloverTitle]] "Unemployed colonists"},
							'Margins', box(0, 0, 40, 0),
							'VAlign', "center",
							'ScaleModifier', point(700, 700),
							'LayoutMethod', "Box",
							'Background', RGBA(0, 0, 0, 0),
							'RolloverZoom', 1100,
							'RolloverDrawOnTop', true,
							'MouseCursor', "UI/Cursors/Rollover.tga",
							'RelativeFocusOrder', "next-in-line",
							'OnContextUpdate', function (self, context, ...)
local dlg = GetXDialog(self)
local unemployed = dlg.context.unemployed
self:SetIcon(not unemployed and "UI/Icons/ColonyControlCenter/unemployed_off.tga" or "UI/Icons/ColonyControlCenter/unemployed_on.tga")
self:SetRolloverText(GetColonistsFilterRollover(context, T{9677, "Toggle filtering of Unemployed Colonists."}))
self:SetRolloverHint(unemployed and T{9787, "<left_click> Hide filtered objects"} or T{9788, "<left_click> Show filtered objects"})
local hint_gamepad = unemployed and T{9789, "<ButtonA> Hide filtered objects"} or T{9790, "<ButtonA> Show filtered objects"}
hint_gamepad = hint_gamepad .. " " .. T{9802, "<RB> Inspect"}
self:SetRolloverHintGamepad(hint_gamepad)
end,
							'FXMouseIn', "MenuItemHover",
							'FXPress', "MenuItemClick",
							'FXPressDisabled', "UIDisabledButtonPressed",
							'FocusedBackground', RGBA(0, 0, 0, 0),
							'OnPress', function (self, gamepad)
ToggleCommandCenterFilter(self, "unemployed")
end,
							'RolloverBackground', RGBA(0, 0, 0, 0),
							'PressedBackground', RGBA(0, 0, 0, 0),
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XImage",
								'Id', "idRollover",
								'Margins', box(-6, -6, -6, -6),
								'Visible', false,
								'FadeInTime', 100,
								'FadeOutTime', 100,
								'FXMouseIn', "MenuItemHovers",
								'FXPress', "MenuItemClick",
								'FXPressDisabled', "UIDisabledButtonPressed",
								'Image', "UI/Common/Hex_small_shine.tga",
								'ImageFit', "stretch",
							}),
							}),
						PlaceObj('XTemplateWindow', {
							'comment', "problematic_colonists",
							'__class', "XTextButton",
							'RolloverTemplate', "Rollover",
							'RolloverAnchor', "left",
							'RolloverAnchorId', "idButtons",
							'RolloverTitle', T{7934, --[[XTemplate ColonistsOverview RolloverTitle]] "Problematic colonists"},
							'VAlign', "center",
							'ScaleModifier', point(700, 700),
							'LayoutMethod', "Box",
							'Background', RGBA(0, 0, 0, 0),
							'RolloverZoom', 1100,
							'RolloverDrawOnTop', true,
							'MouseCursor', "UI/Cursors/Rollover.tga",
							'RelativeFocusOrder', "next-in-line",
							'OnContextUpdate', function (self, context, ...)
local dlg = GetXDialog(self)
local problematic = dlg.context.problematic_colonists
self:SetIcon(not problematic and "UI/Icons/ColonyControlCenter/problematic_colonists_off.tga" or "UI/Icons/ColonyControlCenter/problematic_colonists_on.tga")
self:SetRolloverText(GetColonistsFilterRollover(context, T{9678, "Toggle filtering of Colonists suffering from status effects."}))
self:SetRolloverHint(problematic and T{9787, "<left_click> Hide filtered objects"} or T{9788, "<left_click> Show filtered objects"})
local hint_gamepad = problematic and T{9789, "<ButtonA> Hide filtered objects"} or T{9790, "<ButtonA> Show filtered objects"}
hint_gamepad = hint_gamepad .. " " .. T{9802, "<RB> Inspect"}
self:SetRolloverHintGamepad(hint_gamepad)
end,
							'FXMouseIn', "MenuItemHover",
							'FXPress', "MenuItemClick",
							'FXPressDisabled', "UIDisabledButtonPressed",
							'FocusedBackground', RGBA(0, 0, 0, 0),
							'OnPress', function (self, gamepad)
ToggleCommandCenterFilter(self, "problematic_colonists")
end,
							'RolloverBackground', RGBA(0, 0, 0, 0),
							'PressedBackground', RGBA(0, 0, 0, 0),
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XImage",
								'Id', "idRollover",
								'Margins', box(-6, -6, -6, -6),
								'Visible', false,
								'FadeInTime', 100,
								'FadeOutTime', 100,
								'FXMouseIn', "MenuItemHovers",
								'FXPress', "MenuItemClick",
								'FXPressDisabled', "UIDisabledButtonPressed",
								'Image', "UI/Common/Hex_small_shine.tga",
								'ImageFit', "stretch",
							}),
							}),
						PlaceObj('XTemplateCode', {
							'run', function (self, parent, context)
if GetUIStyleGamepad() then
	parent[1]:SetFocus()
end
end,
						}),
						}),
					PlaceObj('XTemplateWindow', {
						'__class', "XFrame",
						'Margins', box(0, 0, 0, -85),
						'VAlign', "top",
						'Image', "UI/Common/pm_pad_small.tga",
						'FrameBox', box(205, 0, 30, 0),
						'SqueezeY', false,
						'FlipX', true,
					}),
					PlaceObj('XTemplateWindow', {
						'Padding', box(63, 0, 0, 0),
						'LayoutMethod', "HList",
					}, {
						PlaceObj('XTemplateWindow', {
							'__class', "XText",
							'Padding', box(0, 0, 0, 0),
							'MinWidth', 200,
							'MaxWidth', 200,
							'HandleMouse', false,
							'TextFont', "InfopanelTitle",
							'TextColor', RGBA(119, 198, 255, 255),
							'Translate', true,
							'Text', T{547, --[[XTemplate ColonistsOverview Text]] "Colonists"},
							'TextVAlign', "center",
						}),
						PlaceObj('XTemplateWindow', {
							'__class', "XText",
							'Padding', box(0, 0, 0, 0),
							'HAlign', "left",
							'VAlign', "top",
							'MinWidth', 240,
							'MaxWidth', 240,
							'HandleMouse', false,
							'TextFont', "InfopanelTitle",
							'TextColor', RGBA(119, 198, 255, 255),
							'Translate', true,
							'Text', T{517499996306, --[[XTemplate ColonistsOverview Text]] "Stats"},
							'TextHAlign', "center",
							'TextVAlign', "center",
						}),
						PlaceObj('XTemplateWindow', {
							'__class', "XText",
							'Id', "idTraitsTitle",
							'Margins', box(30, 0, 0, 0),
							'Padding', box(0, 0, 0, 0),
							'HAlign', "left",
							'VAlign', "top",
							'MinWidth', 370,
							'MaxWidth', 370,
							'FoldWhenHidden', true,
							'HandleMouse', false,
							'TextFont', "InfopanelTitle",
							'TextColor', RGBA(119, 198, 255, 255),
							'ContextUpdateOnOpen', true,
							'OnContextUpdate', function (self, context, ...)
self:SetVisible(not context.interests)
XText.OnContextUpdate(self, context, ...)
end,
							'Translate', true,
							'Text', T{235, --[[XTemplate ColonistsOverview Text]] "Traits"},
							'TextHAlign', "center",
							'TextVAlign', "center",
						}),
						PlaceObj('XTemplateWindow', {
							'__class', "XText",
							'Id', "idInterestsTitle",
							'Margins', box(30, 0, 0, 0),
							'Padding', box(0, 0, 0, 0),
							'HAlign', "left",
							'VAlign', "top",
							'MinWidth', 370,
							'MaxWidth', 370,
							'FoldWhenHidden', true,
							'HandleMouse', false,
							'TextFont', "InfopanelTitle",
							'TextColor', RGBA(119, 198, 255, 255),
							'ContextUpdateOnOpen', true,
							'OnContextUpdate', function (self, context, ...)
self:SetVisible(context.interests)
XText.OnContextUpdate(self, context, ...)
end,
							'Translate', true,
							'Text', T{186933092758, --[[XTemplate ColonistsOverview Text]] "Interests"},
							'TextHAlign', "center",
							'TextVAlign', "center",
						}),
						}),
					}),
				}),
			PlaceObj('XTemplateTemplate', {
				'__template', "Scrollbar",
				'Target', "idList",
			}),
			PlaceObj('XTemplateMode', {
				'mode', "colonists",
			}, {
				PlaceObj('XTemplateAction', {
					'ActionId', "prev",
					'ActionName', T{129795472601, --[[XTemplate ColonistsOverview ActionName]] "PREVIOUS DOME"},
					'ActionToolbar', "ActionBar",
					'ActionGamepad', "LeftTrigger",
					'OnAction', function (self, host, source, toggled)
SelectCommandCenterNextDome(host, -1)
end,
					'__condition', function (parent, context) return #(GetCommandCenterDomesList()) > 1 end,
				}),
				PlaceObj('XTemplateAction', {
					'ActionId', "next",
					'ActionName', T{9679, --[[XTemplate ColonistsOverview ActionName]] "NEXT DOME"},
					'ActionToolbar', "ActionBar",
					'ActionGamepad', "RightTrigger",
					'OnAction', function (self, host, source, toggled)
SelectCommandCenterNextDome(host, 1)
end,
					'__condition', function (parent, context) return #(GetCommandCenterDomesList()) > 1 end,
				}),
				PlaceObj('XTemplateAction', {
					'ActionId', "interests",
					'ActionName', T{663581795644, --[[XTemplate ColonistsOverview ActionName]] "INTERESTS"},
					'ActionToolbar', "ActionBar",
					'ActionGamepad', "ButtonY",
					'ActionState', function (self, host)
return host.context.interests and "hidden"
end,
					'OnAction', function (self, host, source, toggled)
ToggleColonistsTraitsInterests(host)
host:UpdateActionViews(host.idActionBar)
end,
				}),
				PlaceObj('XTemplateAction', {
					'ActionId', "traits",
					'ActionName', T{265445412858, --[[XTemplate ColonistsOverview ActionName]] "TRAITS"},
					'ActionToolbar', "ActionBar",
					'ActionGamepad', "ButtonY",
					'ActionState', function (self, host)
return not host.context.interests and "hidden"
end,
					'OnAction', function (self, host, source, toggled)
ToggleColonistsTraitsInterests(host)
host:UpdateActionViews(host.idActionBar)
end,
				}),
				PlaceObj('XTemplateAction', {
					'ActionId', "back",
					'ActionName', T{4254, --[[XTemplate ColonistsOverview ActionName]] "BACK"},
					'ActionToolbar', "ActionBar",
					'ActionShortcut', "Escape",
					'ActionGamepad', "ButtonB",
					'OnActionEffect', "back",
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XContentTemplateList",
					'Id', "idList",
					'BorderWidth', 0,
					'Padding', box(0, 0, 0, 0),
					'MinWidth', 903,
					'MaxWidth', 903,
					'LayoutVSpacing', 1,
					'UniformRowHeight', true,
					'Clip', false,
					'Background', RGBA(0, 0, 0, 0),
					'FocusedBackground', RGBA(0, 0, 0, 0),
					'VScroll', "idScroll",
					'ShowPartialItems', false,
					'MouseScroll', true,
					'GamepadInitialSelection', false,
					'OnContextUpdate', function (self, context, ...)
XContentTemplateList.OnContextUpdate(self, context, ...)
self:ResolveId("idNoResults"):SetVisible(#self == 0)
end,
					'RespawnOnDialogMode', false,
				}, {
					PlaceObj('XTemplateMode', {
						'mode', "colonists",
					}, {
						PlaceObj('XTemplateForEach', {
							'comment', "colonists",
							'array', function (parent, context) local colonists = GetCommandCenterColonists(context); parent:ResolveId("idTitle"):SetTitle(T{9811, "<count> COLONISTS", count = #colonists}) return colonists end,
							'__context', function (parent, context, item, i, n) return item end,
							'run_before', function (parent, context, item, i, n)
NewXVirtualContent(parent, context, "ColonistOverviewRow", 903, 46)
end,
						}),
						}),
					}),
				PlaceObj('XTemplateWindow', {
					'__class', "XText",
					'Id', "idNoResults",
					'Dock', "box",
					'HAlign', "center",
					'VAlign', "center",
					'Visible', false,
					'HandleMouse', false,
					'TextFont', "PGLogo",
					'TextColor', RGBA(255, 255, 255, 255),
					'Translate', true,
					'Text', T{9763, --[[XTemplate ColonistsOverview Text]] "No objects matching current filters."},
				}),
				PlaceObj('XTemplateCode', {
					'run', function (self, parent, context)
local list = parent:ResolveId("idList")
parent:ResolveId("idNoResults"):SetVisible(#list == 0)
end,
				}),
				}),
			PlaceObj('XTemplateMode', {
				'mode', "domes",
			}, {
				PlaceObj('XTemplateTemplate', {
					'__template', "CommandCenterDomeList",
				}),
				}),
			PlaceObj('XTemplateMode', {
				'mode', "traits",
			}, {
				PlaceObj('XTemplateWindow', {
					'__class', "XContentTemplateList",
					'Id', "idList",
					'BorderWidth', 0,
					'Padding', box(0, 0, 0, 0),
					'LayoutVSpacing', 16,
					'UniformRowHeight', true,
					'Clip', false,
					'Background', RGBA(0, 0, 0, 0),
					'FocusedBackground', RGBA(0, 0, 0, 0),
					'VScroll', "idScroll",
					'ShowPartialItems', false,
					'MouseScroll', true,
				}, {
					PlaceObj('XTemplateTemplate', {
						'__template', "MenuEntrySmall",
						'Padding', box(0, 0, 0, 0),
						'HAlign', "right",
						'OnPress', function (self, gamepad)
local dlg = GetXDialog(self)
dlg.context.trait = nil
SetBackDialogMode(self)
end,
						'Text', T{652319561018, --[[XTemplate ColonistsOverview Text]] "All Traits"},
					}),
					PlaceObj('XTemplateForEach', {
						'comment', "traits",
						'array', function (parent, context) return GetTSortedTraits() end,
						'__context', function (parent, context, item, i, n) return item end,
						'run_after', function (child, context, item, i, n)
child:SetRolloverTitle(item.display_name)
child:SetRolloverText(item.description)
end,
					}, {
						PlaceObj('XTemplateTemplate', {
							'__template', "MenuEntrySmall",
							'RolloverTemplate', "Rollover",
							'RolloverAnchor', "left",
							'Padding', box(0, 0, 0, 0),
							'HAlign', "right",
							'OnPress', function (self, gamepad)
local dlg = GetXDialog(self)
dlg.context.trait = self.context
SetBackDialogMode(self)
end,
							'Text', T{583679719179, --[[XTemplate ColonistsOverview Text]] "<display_name>"},
						}),
						}),
					PlaceObj('XTemplateAction', {
						'ActionId', "back",
						'ActionName', T{4254, --[[XTemplate ColonistsOverview ActionName]] "BACK"},
						'ActionToolbar', "ActionBar",
						'ActionShortcut', "Escape",
						'ActionGamepad', "ButtonB",
						'OnActionEffect', "back",
					}),
					}),
				}),
			}),
		}),
})

