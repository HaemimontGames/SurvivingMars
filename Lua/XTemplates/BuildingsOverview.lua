-- ========== THIS IS AN AUTOMATICALLY GENERATED FILE! ==========

PlaceObj('XTemplate', {
	group = "CCC",
	id = "BuildingsOverview",
	PlaceObj('XTemplateTemplate', {
		'__context', function (parent, context) return context or {} end,
		'__template', "NewOverlayDlg",
		'MinWidth', 500,
		'InitialMode', "buildings",
		'InternalModes', "buildings, domes",
	}, {
		PlaceObj('XTemplateCode', {
			'run', function (self, parent, context)
local dlg = GetDialog(parent)
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
			'Title', T(904592423533, --[[XTemplate BuildingsOverview Title]] "BUILDINGS"),
		}),
		PlaceObj('XTemplateWindow', {
			'__context', function (parent, context) return context or {} end,
			'__class', "XContentTemplate",
			'Id', "idContent",
			'IdNode', false,
		}, {
			PlaceObj('XTemplateMode', {
				'mode', "buildings",
			}, {
				PlaceObj('XTemplateTemplate', {
					'__template', "ScrollbarNew",
					'Id', "idButtonsScroll",
					'ZOrder', 0,
					'Margins', box(87, 0, 0, 0),
					'Target', "idButtonsScrollArea",
				}),
				PlaceObj('XTemplateWindow', {
					'__class', "XScrollArea",
					'Id', "idButtonsScrollArea",
					'IdNode', false,
					'Dock', "left",
					'VScroll', "idButtonsScroll",
				}, {
					PlaceObj('XTemplateWindow', {
						'__class', "XContextWindow",
						'Id', "idButtons",
						'Margins', box(12, 0, 0, 0),
						'LayoutMethod', "VList",
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
return CCC_ButtonListOnShortcut(self, shortcut, source)
end,
						}),
						PlaceObj('XTemplateTemplate', {
							'__template', "CommandCenterDomeFilter",
						}),
						PlaceObj('XTemplateTemplate', {
							'comment', "inside buildings",
							'__template', "CommandCenterButton",
							'RolloverTitle', T(367336674138, --[[XTemplate BuildingsOverview RolloverTitle]] "Inside Buildings"),
							'Margins', box(-12, 0, 0, -14),
							'OnContextUpdate', function (self, context, ...)
local dlg = GetDialog(self)
local inside = dlg.context.inside_buildings
self:SetIcon(inside == false and "UI/Icons/ColonyControlCenter/inside_buildings_off.tga" or "UI/Icons/ColonyControlCenter/inside_buildings_on.tga")
self:SetRolloverText(GetBuildingsFilterRollover(context, T(642090198735, "Toggle filtering of inside buildings.")))
self:SetRolloverHint(inside ~= false and T(9787, "<left_click> Hide filtered objects") or T(9788, "<left_click> Show filtered objects"))
local hint_gamepad = inside ~= false and T(9789, "<ButtonA> Hide filtered objects") or T(9790, "<ButtonA> Show filtered objects")
hint_gamepad = hint_gamepad .. " " .. T(9802, "<RB> Inspect")
self:SetRolloverHintGamepad(hint_gamepad)
self:SetToggled(inside ~= false)
end,
							'OnPress', function (self, gamepad)
ToggleCommandCenterFilter(self, "inside_buildings", true)
end,
							'Icon', "UI/Icons/ColonyControlCenter/inside_buildings_off.tga",
							'Text', T(367336674138, --[[XTemplate BuildingsOverview Text]] "Inside Buildings"),
						}),
						PlaceObj('XTemplateTemplate', {
							'comment', "outside buildings",
							'__template', "CommandCenterButton",
							'RolloverTitle', T(885971788025, --[[XTemplate BuildingsOverview RolloverTitle]] "Outside Buildings"),
							'Margins', box(-12, 0, 0, 20),
							'OnContextUpdate', function (self, context, ...)
local dlg = GetDialog(self)
local outside = dlg.context.outside_buildings
self:SetIcon(outside == false and "UI/Icons/ColonyControlCenter/outside_buildings_off.tga" or "UI/Icons/ColonyControlCenter/outside_buildings_on.tga")
self:SetRolloverText(GetBuildingsFilterRollover(context, T(658497084041, "Toggle filtering of outside buildings.")))
self:SetRolloverHint(outside ~= false and T(9787, "<left_click> Hide filtered objects") or T(9788, "<left_click> Show filtered objects"))
local hint_gamepad = outside ~= false and T(9789, "<ButtonA> Hide filtered objects") or T(9790, "<ButtonA> Show filtered objects")
hint_gamepad = hint_gamepad .. " " .. T(9802, "<RB> Inspect")
self:SetRolloverHintGamepad(hint_gamepad)
self:SetToggled(outside ~= false)
end,
							'OnPress', function (self, gamepad)
ToggleCommandCenterFilter(self, "outside_buildings", true)
end,
							'Icon', "UI/Icons/ColonyControlCenter/outside_buildings_off.tga",
							'Text', T(885971788025, --[[XTemplate BuildingsOverview Text]] "Outside Buildings"),
						}),
						PlaceObj('XTemplateTemplate', {
							'comment', "decorations",
							'__template', "CommandCenterButton",
							'RolloverTitle', T(435618535856, --[[XTemplate BuildingsOverview RolloverTitle]] "Decorations"),
							'Margins', box(-12, 0, 0, -14),
							'OnContextUpdate', function (self, context, ...)
local dlg = GetDialog(self)
local decorations = dlg.context.decorations
self:SetIcon(not decorations and "UI/Icons/ColonyControlCenter/decorations_off.tga" or "UI/Icons/ColonyControlCenter/decorations_on.tga")
self:SetRolloverText(GetBuildingsFilterRollover(context, T(405185817379, "Toggle filtering of Decorations.")))
self:SetRolloverHint(decorations and T(9787, "<left_click> Hide filtered objects") or T(9788, "<left_click> Show filtered objects"))
local hint_gamepad = decorations and T(9789, "<ButtonA> Hide filtered objects") or T(9790, "<ButtonA> Show filtered objects")
hint_gamepad = hint_gamepad .. " " .. T(9802, "<RB> Inspect")
self:SetRolloverHintGamepad(hint_gamepad)
self:SetToggled(not not decorations)
end,
							'OnPress', function (self, gamepad)
ToggleCommandCenterFilter(self, "decorations")
end,
							'Icon', "UI/Icons/ColonyControlCenter/decorations_off.tga",
							'Text', T(435618535856, --[[XTemplate BuildingsOverview Text]] "Decorations"),
						}),
						PlaceObj('XTemplateTemplate', {
							'comment', "power producers",
							'__template', "CommandCenterButton",
							'RolloverTitle', T(416682488997, --[[XTemplate BuildingsOverview RolloverTitle]] "Power Producers"),
							'Margins', box(-12, 0, 0, -14),
							'OnContextUpdate', function (self, context, ...)
local dlg = GetDialog(self)
local power_producers = dlg.context.power_producers
self:SetIcon(power_producers == false and "UI/Icons/ColonyControlCenter/power_producers_off.tga" or "UI/Icons/ColonyControlCenter/power_producers_on.tga")
self:SetRolloverText(GetBuildingsFilterRollover(context, T(430474379281, "Toggle filtering of Power producers.")))
self:SetRolloverHint(power_producers ~= false and T(9787, "<left_click> Hide filtered objects") or T(9788, "<left_click> Show filtered objects"))
local hint_gamepad = power_producers ~= false and T(9789, "<ButtonA> Hide filtered objects") or T(9790, "<ButtonA> Show filtered objects")
hint_gamepad = hint_gamepad .. " " .. T(9802, "<RB> Inspect")
self:SetRolloverHintGamepad(hint_gamepad)
self:SetToggled(power_producers ~= false)
end,
							'OnPress', function (self, gamepad)
ToggleCommandCenterFilter(self, "power_producers", true)
end,
							'Icon', "UI/Icons/ColonyControlCenter/power_producers_off.tga",
							'Text', T(416682488997, --[[XTemplate BuildingsOverview Text]] "Power Producers"),
						}),
						PlaceObj('XTemplateTemplate', {
							'comment', "production buildings",
							'__template', "CommandCenterButton",
							'RolloverTitle', T(932771917833, --[[XTemplate BuildingsOverview RolloverTitle]] "Production Buildings"),
							'Margins', box(-12, 0, 0, -14),
							'OnContextUpdate', function (self, context, ...)
local dlg = GetDialog(self)
local production_buildings = dlg.context.production_buildings
self:SetIcon(production_buildings == false and "UI/Icons/ColonyControlCenter/production_buildings_off.tga" or "UI/Icons/ColonyControlCenter/production_buildings_on.tga")
self:SetRolloverText(GetBuildingsFilterRollover(context, T(250629220868, "Toggle filtering of Production buildings.")))
self:SetRolloverHint(production_buildings ~= false and T(9787, "<left_click> Hide filtered objects") or T(9788, "<left_click> Show filtered objects"))
local hint_gamepad = production_buildings ~= false and T(9789, "<ButtonA> Hide filtered objects") or T(9790, "<ButtonA> Show filtered objects")
hint_gamepad = hint_gamepad .. " " .. T(9802, "<RB> Inspect")
self:SetRolloverHintGamepad(hint_gamepad)
self:SetToggled(production_buildings ~= false)
end,
							'OnPress', function (self, gamepad)
ToggleCommandCenterFilter(self, "production_buildings", true)
end,
							'Icon', "UI/Icons/ColonyControlCenter/production_buildings_off.tga",
							'Text', T(932771917833, --[[XTemplate BuildingsOverview Text]] "Production Buildings"),
						}),
						PlaceObj('XTemplateTemplate', {
							'comment', "services",
							'__template', "CommandCenterButton",
							'RolloverTitle', T(133797343482, --[[XTemplate BuildingsOverview RolloverTitle]] "Services"),
							'Margins', box(-12, 0, 0, -14),
							'OnContextUpdate', function (self, context, ...)
local dlg = GetDialog(self)
local services = dlg.context.services
self:SetIcon(services == false and "UI/Icons/ColonyControlCenter/services_off.tga" or "UI/Icons/ColonyControlCenter/services_on.tga")
self:SetRolloverText(GetBuildingsFilterRollover(context, T(869705792928, "Toggle filtering of Services.")))
self:SetRolloverHint(services ~= false and T(9787, "<left_click> Hide filtered objects") or T(9788, "<left_click> Show filtered objects"))
local hint_gamepad = services ~= false and T(9789, "<ButtonA> Hide filtered objects") or T(9790, "<ButtonA> Show filtered objects")
hint_gamepad = hint_gamepad .. " " .. T(9802, "<RB> Inspect")
self:SetRolloverHintGamepad(hint_gamepad)
self:SetToggled(services ~= false)
end,
							'OnPress', function (self, gamepad)
ToggleCommandCenterFilter(self, "services", true)
end,
							'Icon', "UI/Icons/ColonyControlCenter/services_off.tga",
							'Text', T(133797343482, --[[XTemplate BuildingsOverview Text]] "Services"),
						}),
						PlaceObj('XTemplateTemplate', {
							'comment', "residential",
							'__template', "CommandCenterButton",
							'RolloverTitle', T(316855249043, --[[XTemplate BuildingsOverview RolloverTitle]] "Residential Buildings"),
							'Margins', box(-12, 0, 0, -14),
							'OnContextUpdate', function (self, context, ...)
local dlg = GetDialog(self)
local residential = dlg.context.residential
self:SetIcon(not residential and "UI/Icons/ColonyControlCenter/residential_off.tga" or "UI/Icons/ColonyControlCenter/residential_on.tga")
self:SetRolloverText(GetBuildingsFilterRollover(context, T(954444172223, "Toggle filtering of residential buildings.")))
self:SetRolloverHint(residential and T(9787, "<left_click> Hide filtered objects") or T(9788, "<left_click> Show filtered objects"))
local hint_gamepad = residential and T(9789, "<ButtonA> Hide filtered objects") or T(9790, "<ButtonA> Show filtered objects")
hint_gamepad = hint_gamepad .. " " .. T(9802, "<RB> Inspect")
self:SetRolloverHintGamepad(hint_gamepad)
self:SetToggled(not not residential)
end,
							'OnPress', function (self, gamepad)
ToggleCommandCenterFilter(self, "residential")
end,
							'Icon', "UI/Icons/ColonyControlCenter/residential_off.tga",
							'Text', T(316855249043, --[[XTemplate BuildingsOverview Text]] "Residential Buildings"),
						}),
						PlaceObj('XTemplateTemplate', {
							'comment', "other",
							'__template', "CommandCenterButton",
							'RolloverTitle', T(814424953825, --[[XTemplate BuildingsOverview RolloverTitle]] "Other Buildings"),
							'Margins', box(-12, 0, 0, -14),
							'OnContextUpdate', function (self, context, ...)
local dlg = GetDialog(self)
local other = dlg.context.other
self:SetIcon(not other and "UI/Icons/ColonyControlCenter/other_off.tga" or "UI/Icons/ColonyControlCenter/other_on.tga")
self:SetRolloverText(GetBuildingsFilterRollover(context, T(707674085585, "Toggle filtering of Other buildings, not fitting the criteria of the rest of the filters in this group.")))
self:SetRolloverHint(other and T(9787, "<left_click> Hide filtered objects") or T(9788, "<left_click> Show filtered objects"))
local hint_gamepad = other and T(9789, "<ButtonA> Hide filtered objects") or T(9790, "<ButtonA> Show filtered objects")
hint_gamepad = hint_gamepad .. " " .. T(9802, "<RB> Inspect")
self:SetRolloverHintGamepad(hint_gamepad)
self:SetToggled(not not other)
end,
							'OnPress', function (self, gamepad)
ToggleCommandCenterFilter(self, "other")
end,
							'Icon', "UI/Icons/ColonyControlCenter/other_off.tga",
							'Text', T(814424953825, --[[XTemplate BuildingsOverview Text]] "Other Buildings"),
						}),
						PlaceObj('XTemplateCode', {
							'run', function (self, parent, context)
if GetUIStyleGamepad() then
	local first = parent[1]
	CreateRealTimeThread(function(first)
		if first.window_state ~= "destroying" then
			first:SetFocus()
		end
	end, first)
end
end,
						}),
						}),
					}),
				}),
			PlaceObj('XTemplateWindow', {
				'__class', "XSizeConstrainedWindow",
			}, {
				PlaceObj('XTemplateTemplate', {
					'__template', "ScrollbarNew",
					'Id', "idScroll",
					'Margins', box(10, 0, 0, 0),
					'Target', "idList",
				}),
				PlaceObj('XTemplateMode', {
					'mode', "buildings",
				}, {
					PlaceObj('XTemplateAction', {
						'ActionId', "back",
						'ActionName', T(4254, --[[XTemplate BuildingsOverview ActionName]] "BACK"),
						'ActionToolbar', "ActionBar",
						'ActionShortcut', "Escape",
						'ActionGamepad', "ButtonB",
						'OnActionEffect', "back",
					}),
					PlaceObj('XTemplateAction', {
						'ActionId', "prev",
						'ActionName', T(5446, --[[XTemplate BuildingsOverview ActionName]] "PREVIOUS DOME"),
						'ActionToolbar', "ActionBar",
						'ActionGamepad', "LeftTrigger",
						'OnAction', function (self, host, source)
SelectCommandCenterNextDome(host, -1)
end,
						'__condition', function (parent, context) return #(GetCommandCenterDomesList()) > 1 end,
					}),
					PlaceObj('XTemplateAction', {
						'ActionId', "next",
						'ActionName', T(5445, --[[XTemplate BuildingsOverview ActionName]] "NEXT DOME"),
						'ActionToolbar', "ActionBar",
						'ActionGamepad', "RightTrigger",
						'OnAction', function (self, host, source)
SelectCommandCenterNextDome(host, 1)
end,
						'__condition', function (parent, context) return #(GetCommandCenterDomesList()) > 1 end,
					}),
					PlaceObj('XTemplateAction', {
						'ActionId', "shifts",
						'ActionName', T(330576790534, --[[XTemplate BuildingsOverview ActionName]] "SHIFTS"),
						'ActionToolbar', "ActionBar",
						'ActionGamepad', "ButtonY",
						'ActionState', function (self, host)
return host.context.shifts and "hidden"
end,
						'OnAction', function (self, host, source)
ToggleBuildingsShiftsEffects(host)
host:UpdateActionViews(host.idActionBar)
end,
					}),
					PlaceObj('XTemplateAction', {
						'ActionId', "effects",
						'ActionName', T(949281280975, --[[XTemplate BuildingsOverview ActionName]] "EFFECTS"),
						'ActionToolbar', "ActionBar",
						'ActionGamepad', "ButtonY",
						'ActionState', function (self, host)
return not host.context.shifts and "hidden"
end,
						'OnAction', function (self, host, source)
ToggleBuildingsShiftsEffects(host)
host:UpdateActionViews(host.idActionBar)
end,
					}),
					PlaceObj('XTemplateAction', {
						'ActionId', "reset",
						'ActionName', T(550362230354, --[[XTemplate BuildingsOverview ActionName]] "RESET FILTERS"),
						'ActionToolbar', "ActionBar",
						'ActionGamepad', "ButtonX",
						'OnAction', function (self, host, source)
host.context.dome = nil
host.context.inside_buildings = nil
host.context.outside_buildings = nil
host.context.decorations = nil
host.context.power_producers = nil
host.context.production_buildings = nil
host.context.services = nil
host.context.residential = nil
host.context.other = nil
host:ResolveId("idContent"):RespawnContent()
end,
					}),
					PlaceObj('XTemplateWindow', {
						'comment', "column titles",
						'Margins', box(92, 0, 0, 15),
						'Dock', "top",
					}, {
						PlaceObj('XTemplateWindow', {
							'__class', "XContextWindow",
							'Id', "idEffectsTitles",
							'LayoutMethod', "HList",
							'FoldWhenHidden', true,
							'ContextUpdateOnOpen', true,
							'OnContextUpdate', function (self, context, ...)
self:SetVisible(not context.shifts)
XContextWindow.OnContextUpdate(self, context, ...)
end,
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Padding', box(0, 0, 0, 0),
								'MinWidth', 290,
								'MaxWidth', 290,
								'HandleMouse', false,
								'TextStyle', "OverviewItemSection",
								'Translate', true,
								'Text', T(3980, --[[XTemplate BuildingsOverview Text]] "Buildings"),
								'TextVAlign', "center",
							}),
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Padding', box(0, 0, 0, 0),
								'MinWidth', 230,
								'MaxWidth', 230,
								'HandleMouse', false,
								'TextStyle', "OverviewItemSection",
								'Translate', true,
								'Text', T(347, --[[XTemplate BuildingsOverview Text]] "Consumption"),
								'TextHAlign', "center",
								'TextVAlign', "center",
							}),
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Padding', box(0, 0, 0, 0),
								'MinWidth', 230,
								'MaxWidth', 230,
								'HandleMouse', false,
								'TextStyle', "OverviewItemSection",
								'Translate', true,
								'Text', T(80, --[[XTemplate BuildingsOverview Text]] "Production"),
								'TextHAlign', "center",
								'TextVAlign', "center",
							}),
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Padding', box(0, 0, 0, 0),
								'MinWidth', 220,
								'MaxWidth', 220,
								'HandleMouse', false,
								'TextStyle', "OverviewItemSection",
								'Translate', true,
								'Text', T(126095410863, --[[XTemplate BuildingsOverview Text]] "Info"),
								'TextHAlign', "center",
								'TextVAlign', "center",
							}),
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Padding', box(0, 0, 0, 0),
								'MinWidth', 136,
								'MaxWidth', 136,
								'HandleMouse', false,
								'TextStyle', "OverviewItemSection",
								'Translate', true,
								'Text', T(9407, --[[XTemplate BuildingsOverview Text]] "Upgrades"),
								'TextHAlign', "center",
								'TextVAlign', "center",
							}),
							}),
						PlaceObj('XTemplateWindow', {
							'__class', "XContextWindow",
							'Id', "idShiftsTitles",
							'LayoutMethod', "HList",
							'FoldWhenHidden', true,
							'ContextUpdateOnOpen', true,
							'OnContextUpdate', function (self, context, ...)
self:SetVisible(context.shifts)
XContextWindow.OnContextUpdate(self, context, ...)
end,
						}, {
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Padding', box(0, 0, 0, 0),
								'MinWidth', 372,
								'MaxWidth', 372,
								'HandleMouse', false,
								'TextStyle', "OverviewItemSection",
								'Translate', true,
								'Text', T(541987944858, --[[XTemplate BuildingsOverview Text]] "First Shift"),
								'TextHAlign', "center",
								'TextVAlign', "center",
							}),
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Padding', box(0, 0, 0, 0),
								'MinWidth', 372,
								'MaxWidth', 372,
								'HandleMouse', false,
								'TextStyle', "OverviewItemSection",
								'Translate', true,
								'Text', T(159665176435, --[[XTemplate BuildingsOverview Text]] "Second Shift"),
								'TextHAlign', "center",
								'TextVAlign', "center",
							}),
							PlaceObj('XTemplateWindow', {
								'__class', "XText",
								'Padding', box(0, 0, 0, 0),
								'MinWidth', 372,
								'MaxWidth', 372,
								'HandleMouse', false,
								'TextStyle', "OverviewItemSection",
								'Translate', true,
								'Text', T(9671, --[[XTemplate BuildingsOverview Text]] "Night Shift"),
								'TextHAlign', "center",
								'TextVAlign', "center",
							}),
							}),
						}),
					PlaceObj('XTemplateWindow', {
						'comment', "items",
						'__class', "XContentTemplateList",
						'Id', "idList",
						'Margins', box(4, 0, 0, 0),
						'BorderWidth', 0,
						'Padding', box(0, 0, 0, 0),
						'MinWidth', 1169,
						'MaxWidth', 1169,
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
					}, {
						PlaceObj('XTemplateMode', {
							'mode', "buildings",
						}, {
							PlaceObj('XTemplateForEach', {
								'comment', "buildings",
								'array', function (parent, context) local buildings = GetCommandCenterBuildings(context); parent:ResolveId("idTitle"):SetTitle(T{9810, "<white><count></white> BUILDINGS", count = #buildings}) return buildings end,
								'__context', function (parent, context, item, i, n) return item end,
								'run_before', function (parent, context, item, i, n)
NewXVirtualContent(parent, context, "BuildingOverviewRow", 1169, 46)
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
						'TextStyle', "InGameTitle",
						'Translate', true,
						'Text', T(9763, --[[XTemplate BuildingsOverview Text]] "No objects matching current filters."),
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
				}),
			}),
		}),
})

